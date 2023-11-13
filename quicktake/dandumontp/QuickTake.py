#!/usr/bin/env python
# coding: utf-8

# deux trucs à installer (pip install serial)
import serial
import time
from hexbyte import *

def readbytes(number):
    buf = ''
    for i in range(number):
        byte = ser.read()
        buf += byte

    return buf

# Ouvrir le port série à 960 bauds, 8 bits, 1 stop bit, parity even
# Remplacez /dev/tty.USA28X23P1.1 par le nom de votre adaptateur série   

ser = serial.Serial('/dev/tty.USA28X23P1.1', 9600, bytesize=serial.EIGHTBITS, parity=serial.PARITY_EVEN, timeout=4)

# Envoyer un 05. Si l'appareil fonctionne il répond 06 (sinon le programme quitte)

ser.write(HexToByte('05'))
response1 = ByteToHex(readbytes(1))
assert response1 == '06'
print ("Réponse de l'appareil photo")

# -- Passage à 57600      --------------------------------------------------------------

# La commande force la liaison vers un débit plus élevé. 

# 10 02 01 07 01 00 07 10 03 03 (57600)
# 10 02 01 07 01 00 06 10 03 02 (38400)
# 10 02 01 07 01 00 04 10 03 00 (19200)

init2 = '10 02 01 07 01 00 07 10 03 03'
ser.write(HexToByte(init2))

# Le 04 indique à l'appareil qu'on a terminé. On attend 0,3 secondes, on passe la liaison à 57600 bauds.
# Une fois que c'est fait, on envoie 05, on attend le 06 de l'appareil photo

ser.write(HexToByte('04'))
time.sleep (0.3)
ser.baudrate = 57600

ser.write(HexToByte('05'))
response1 = ByteToHex(readbytes(1))
assert response1 == '06'
print ("Passage à 57600 : OK")

# -- Modèle de l'appareil --------------------------------------------------------------

print ("\nModèle de l'appareil photo : ")

# La commande demande une info à l'appareil photo.
# Il répond avec une chaîne qui termine par 10 03 (suivi du checksum ignoré ici)
# La réponse (dans data) est une chaîne avec des infos sur le modèle.

init2 = '10 02 00 09 00 00 10 03 0A'
ser.write(HexToByte(init2))

data=''
while data[-4:] != '1003':
	testvalue = ByteToHex(readbytes(1))
	data = data + testvalue

data=data[2:]
print (data.decode("hex"))

# -- Récupération du nombre de photos---------------------------------------------------- 

# La commande demande le nombre de photos

print ("\nNombre de photos :")

init2 = '10 02 00 0B 00 00 10 03 08'
ser.write(HexToByte(init2))

# La réponse commence par 10 02, se termine par 10 03 (et le checksum) et contient le nombre de photos en hexadécimal. 
# On l'affiche simplement en décimal après conversion

data=''
while data[-4:] != '1003':
	testvalue = ByteToHex(readbytes(1))
	data = data + testvalue
			
# Récupérer juste le nombre de photos
data = data[16:18]			
print (int(data, 16))


# --- Récupération des miniatures ------------------------------------------------------

# La boucle commence à 1 et va jusqu'au nombre de photos

CompteurImage=1
CompteurImageMax=int(data,16)

print ("\nRécupération des miniatures en cours")

while CompteurImage <= CompteurImageMax:

	# la commande pour récupérer le nom du fichier est  10 02 00 0A 02 00 xx 00 10 03 yy
	# xx est le numéro de la photo en hexa. Si c'est la photo 10 (en hexa) faut doubler le 10
	# yy est le checksum. C'est un xor de toutes les valeurs de la commande sauf le 10 02 du début et le 10 de la fin.
	# Pour 10 02 00 0A 02 00 01 00 10 03, il faut donc xor 0A + xor 02 + xor 01 + xor 03 (0A)
			
	init2 = '10 02 00 0A 02 00 '
	init3=''
	CompteurImageHex=hex(CompteurImage)
	if CompteurImage < 16:
		init3='0'
	init3 = init3 + str(CompteurImageHex[2:])
	if str(CompteurImageHex[2:]) == '10':
		init2 = init2 + '10 '
	init2 = init2 + init3
	init2 = init2 + ' 00 10 03 '
	
	Xor01='8'
	Xor04='3'
	CalculXor = int(Xor01) ^ int(CompteurImage) 
	CalculXor = int(CalculXor) ^ int(Xor04)
	if CalculXor < 16:
		CalculXor0 = '0'
	else:
		CalculXor0 = ''
	CalculXor = hex(CalculXor)
	CalculXor = CalculXor[2:]
	CalculXor = CalculXor0 + CalculXor

	init2 = init2 + CalculXor
		
	# L'appareil renvoie une commande avec le nom du fichier complet. 
	
	ser.write(HexToByte(init2))

	data=''
	while data[-4:] != '1003' :
		testvalue = ByteToHex(readbytes(1))
		data = data + testvalue
		
	# Récupérer juste la partie avec le nom de fichiers en 8.3. remplacement du JPG par TIF
	# J'ouvre le fichier à écrire.
	data=data[16:34]
	ImageName=HexToByte(data)
	ImageName=ImageName + 'TIF'
	Image=open(ImageName, "w")
	Image.close

	# Récupération de la miniature. 10 02 00 00 02 00 xx 00 10 03 yy
	
	init2 = '10 02 00 00 02 00 '
	init3=''
	CompteurImageHex=hex(CompteurImage)
	if CompteurImage < 16:
		init3='0'
	init3 = init3 + str(CompteurImageHex[2:])
	if str(CompteurImageHex[2:]) == '10':
		init2 = init2 + '10 '
	init2 = init2 + init3
	init2 = init2 + ' 00 10 03 '
	
	Xor01='2'
	Xor04='3'
	CalculXor = int(Xor01) ^ int(CompteurImage) 
	CalculXor = int(CalculXor) ^ int(Xor04)
	if CalculXor < 16:
		CalculXor0 = '0'
	else:
		CalculXor0 = ''
	CalculXor = hex(CalculXor)
	CalculXor = CalculXor[2:]
	CalculXor = CalculXor0 + CalculXor

	init2 = init2 + CalculXor

	print ("Début du téléchargement de " + ImageName)

	ser.write(HexToByte(init2))

	data=''
	fichierjpg=''
	CompteurDoublonFin=0
	
	# L'appareil va envoyer les données en plusieurs fois. Chaque fin de bloc contient 10 17 et doit être suivie d'un 06 (qui indique que tout va bien) par le client
	# Le code ne vérifie pas le checksum et assume que tout va bien
	# La fin de la transmission se termine par 10 03
	
	# Attention, les données peuvent contenir 10 17 ou 10 03. L'appareil double donc les 10 pour l'indiquer. Une donnée 10 03 va donc être encodée 10 10 03. Il faut enlever les doublons avant d'enregistrer.
	
	while True:
		testvalue = ByteToHex(readbytes(1))
		data = data + testvalue
		
		# Truc tordu pour détecter la présence de doublon
		# Compte le nombre de 10 *avant* le 1017	
		
		DetectDoublon=6
		DetectDoublon2=4
		CompteurDoublon=0
		if data[-4:] == '1017':
			while data[-DetectDoublon:-DetectDoublon2] == '10':
				CompteurDoublon += 1
				DetectDoublon2 += 2
				DetectDoublon += 2
		
		# Truc tordu pour détecter la présence de doublon
		# Compte le nombre de 10 *avant* le 1003	
				
		DetectDoublonFin=6
		DetectDoublonFin2=4
		CompteurDoublonFin=0
		if data[-4:] == '1003':
			while data[-DetectDoublonFin:-DetectDoublonFin2] == '10':
				CompteurDoublonFin += 1
				DetectDoublonFin2 += 2
				DetectDoublonFin += 2
			
		# Si un doublon : pas 1017. Si deux doublons : 1017	
		
		if data[-4:] == '1017' and CompteurDoublon%2 == 0:
			#if CompteurImage == 3:
			data=data[14:]
			data=data[:-4]
			fichierjpg = fichierjpg + data
			data=''			
			ser.write(HexToByte('06'))		
		
		# Si un doublon : pas 1003. Si deux doublons : 1003, on quitte	
			
		if data[-4:] == '1003' and CompteurDoublonFin%2 == 0:
			#if CompteurImage == 3:
			break		
	
	data=data[14:]
	fichierjpg = fichierjpg + data
	fichierjpg = fichierjpg[2:]
	
	# Enlever 24 octets : un TIFF commence par 49h 49h 2Ah 00h
	# La structure du QuickTake 200 est basique : 24 octets de données, puis un TIFF.
	
	fichierjpg = fichierjpg[24:]
	ser.write(HexToByte('06'))
	
	# Une boucle qui va supprimer les doublons 10 10 pour les transformer en 10	
	
	LongueurString=len(fichierjpg)
	CompteurString=0
	while CompteurString <= LongueurString:
		#print (CompteurString)
		#print (LongueurString)
		CompteurString1=CompteurString+4
		CompteurString2=CompteurString+2
		CompteurString3=CompteurString+8
		if fichierjpg[CompteurString:CompteurString1] == ('1010'):
			#print (fichierjpg[CompteurString:CompteurString3])
			fichierjpg2 = fichierjpg[:CompteurString2]
			fichierjpg2 = fichierjpg2 + fichierjpg[CompteurString1:LongueurString]
			fichierjpg = fichierjpg2
			#print (fichierjpg[CompteurString:CompteurString1])
		CompteurString = CompteurString + 2

	# Le fichier est rempli, on passe à la photo suivante

	Image=open(ImageName, "w")
	fichierjpg=HexToByte(fichierjpg)
	Image.write(fichierjpg)
	Image.close	

	CompteurImage += 1

ChoixUser='0'
while ChoixUser != 'o' and ChoixUser != 'n':
	print ("Miniatures récupérées. Voulez-vous récupérer les JPG de l'appareil ?")
	ChoixUser = raw_input("(o/n)")

if ChoixUser == 'n':
	print ("Au revoir !")

# --- Récupération des miniatures ------------------------------------------------------

if ChoixUser == 'o':	

	
	CompteurImage=1

	print ("\nRécupération des fichiers en cours")

	while CompteurImage <= CompteurImageMax:
	
		# idem plus haut, récupération du nom de fichier
		
		init2 = '10 02 00 0A 02 00 '
		init3=''
		CompteurImageHex=hex(CompteurImage)
		if CompteurImage < 16:
			init3='0'
		init3 = init3 + str(CompteurImageHex[2:])
		if str(CompteurImageHex[2:]) == '10':
			init2 = init2 + '10 '
		init2 = init2 + init3
		init2 = init2 + ' 00 10 03 '
	
		Xor01='8'
		Xor04='3'
		CalculXor = int(Xor01) ^ int(CompteurImage) 
		CalculXor = int(CalculXor) ^ int(Xor04)
		if CalculXor < 16:
			CalculXor0 = '0'
		else:
			CalculXor0 = ''
		CalculXor = hex(CalculXor)
		CalculXor = CalculXor[2:]
		CalculXor = CalculXor0 + CalculXor

		init2 = init2 + CalculXor
		
		ser.write(HexToByte(init2))

		data=''
		while data[-4:] != '1003' :
			testvalue = ByteToHex(readbytes(1))
			data = data + testvalue
		
		# Récupérer juste la partie avec le nom de fichiers en 8.3
		
		data=data[16:40]
		ImageName=HexToByte(data)
		Image=open(ImageName, "w")
		Image.close

		# Mesure du temps. A 57 600, Comptez 20 secondes par photo
		# La commande pour lire une image précise est 10 02 00 02 02 00 xx 00 10 03
		
		start = time.time()
	
		init2 = '10 02 00 02 02 00 '
		init3=''
		CompteurImageHex=hex(CompteurImage)
		if CompteurImage < 16:
			init3='0'
		init3 = init3 + str(CompteurImageHex[2:])
		if str(CompteurImageHex[2:]) == '10':
			init2 = init2 + '10 '
		init2 = init2 + init3
		init2 = init2 + ' 00 10 03 '
	
		Xor01='0'
		Xor04='3'
		CalculXor = int(Xor01) ^ int(CompteurImage) 
		CalculXor = int(CalculXor) ^ int(Xor04)
		if CalculXor < 16:
			CalculXor0 = '0'
		else:
			CalculXor0 = ''
		CalculXor = hex(CalculXor)
		CalculXor = CalculXor[2:]
		CalculXor = CalculXor0 + CalculXor

		init2 = init2 + CalculXor
		
		print ("Début du téléchargement de " + ImageName)

		ser.write(HexToByte(init2))

		data=''
		fichierjpg=''
		
		# Pour éviter de gérer les doublons, on lit tant qu'on n'a pas la fin d'un fichier JPEG (FFD9)
		# Le code va enlever directement la signalisation sur le bus série 

		while data[-4:] != 'FFD9' :
			testvalue = ByteToHex(readbytes(1))
			data = data + testvalue
		
			# Truc tordu pour détecter la présence de doublon
			# Compte le nombre de 10 *avant* le 1017	
		
			DetectDoublon=6
			DetectDoublon2=4
			CompteurDoublon=0
			if data[-4:] == '1017':
				while data[-DetectDoublon:-DetectDoublon2] == '10':
					CompteurDoublon += 1
					DetectDoublon2 += 2
					DetectDoublon += 2
		
			# Si un doublon : pas 1017. Si deux doublons : 1017	
		
			if data[-4:] == '1017' and CompteurDoublon%2 == 0:
				#if CompteurImage == 3:
				#	print (data)
				data=data[14:]
				data=data[:-4]
				fichierjpg = fichierjpg + data
				data=''			
				ser.write(HexToByte('06'))
	
		data=data[14:]
		fichierjpg = fichierjpg + data
		fichierjpg = fichierjpg[2:]
		ser.write(HexToByte('06'))
	
		# Juste pour éviter de faire une boucle reloue
		data=''
		while data[-4:] != '1003' :
			testvalue = ByteToHex(readbytes(1))
			data = data + testvalue
							
		# Suppression des 10 10 						
							
		LongueurString=len(fichierjpg)
		CompteurString=0
		while CompteurString <= LongueurString:
			#print (CompteurString)
			#print (LongueurString)
			CompteurString1=CompteurString+4
			CompteurString2=CompteurString+2
			CompteurString3=CompteurString+8
			if fichierjpg[CompteurString:CompteurString1] == ('1010'):
				#print (fichierjpg[CompteurString:CompteurString3])
				fichierjpg2 = fichierjpg[:CompteurString2]
				fichierjpg2 = fichierjpg2 + fichierjpg[CompteurString1:LongueurString]
				fichierjpg = fichierjpg2
				#print (fichierjpg[CompteurString:CompteurString1])
			CompteurString = CompteurString + 2
			
		# Le fichier est enregistré	

		Image=open(ImageName, "w")
		fichierjpg=HexToByte(fichierjpg)
		Image.write(fichierjpg)
		Image.close	

		# Affichage du temps

		print ("Temps de chargement de l'image")
		end = time.time()
		start=int(start)
		end=int(end)
		print(end - start)

		CompteurImage += 1
	
# --- Effacement des images -------------------------------------------------------------

ChoixUser='0'
while ChoixUser != 'o' and ChoixUser != 'n':
	print ("Images récupérées. Voulez-vous effacer les images de l'appareil ?")
	ChoixUser = raw_input("(o/n)")

if ChoixUser == 'n':
	print ("Au revoir !")
	
if ChoixUser == 'o':	
	
	CompteurImage=1
	ImageDelete=CompteurImageMax
	
	# Commencer par effacer la dernière et ensuite descendre vers zero

	print ("\nEffacement des fichiers en cours")	

	while CompteurImage <= CompteurImageMax:
	
		# On affiche le nom de la photo effacée (par utile, mais visuellement plus sympa)
				
		init2 = '10 02 00 0A 02 00 '
		init3=''
		ImageDeleteHex=hex(ImageDelete)
		if ImageDelete < 16:
			init3='0'
		init3 = init3 + str(ImageDeleteHex[2:])
		if str(ImageDeleteHex[2:]) == '10':
			init2 = init2 + '10 '
		init2 = init2 + init3
		init2 = init2 + ' 00 10 03 '
		
		Xor01='8'
		Xor04='3'
		CalculXor = int(Xor01) ^ int(ImageDelete) 
		CalculXor = int(CalculXor) ^ int(Xor04)
		if CalculXor < 16:
			CalculXor0 = '0'
		else:
			CalculXor0 = ''
		CalculXor = hex(CalculXor)
		CalculXor = CalculXor[2:]
		CalculXor = CalculXor0 + CalculXor

		init2 = init2 + CalculXor
		
		ser.write(HexToByte(init2))

		data=''
		while data[-4:] != '1003' :
			testvalue = ByteToHex(readbytes(1))
			data = data + testvalue
			
		data=data[16:40]
		ImageName=HexToByte(data)

		print ("Effacement de " + ImageName)
		
		# Effacement 10 02 00 19 00 xx 00 10 03 yy
		
		init2 = '10 02 00 19 02 00 '
		init3=''
		ImageDeleteHex=hex(ImageDelete)
		if ImageDelete < 16:
			init3='0'
		init3 = init3 + str(ImageDeleteHex[2:])
		if str(ImageDeleteHex[2:]) == '10':
			init2 = init2 + '10 '
		init2 = init2 + init3
		init2 = init2 + ' 00 10 03 '
	
		Xor01='1B'
		Xor04='3'
		CalculXor = int(Xor01,16) ^ int(ImageDelete) 
		CalculXor = int(CalculXor) ^ int(Xor04)
		if CalculXor < 16:
			CalculXor0 = '0'
		else:
			CalculXor0 = ''
		CalculXor = hex(CalculXor)
		CalculXor = CalculXor[2:]
		CalculXor = CalculXor0 + CalculXor

		init2 = init2 + CalculXor
								
		ser.write(HexToByte(init2))
		
		ser.write(HexToByte('06'))
	
		# Juste pour éviter de faire une boucle reloue
		data=''
		while data[-4:] != '1003' :
			testvalue = ByteToHex(readbytes(1))
			data = data + testvalue	
			
		ImageDelete -= 1	
		CompteurImage += 1
