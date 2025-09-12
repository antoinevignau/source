*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* INTRODUCTION
*-------------------------------

CHASSEUR	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE

	@charge_image	#iCHASSEUR;#pCHASSEUR

	@image	#iCHASSEUR;#36030
	
	lda	maggy
	cmp	#1
	bne	CHASSEUR10025
	@commentaire	#CHASSEUR10090
	jmp	CHASSEUR10030
CHASSEUR10025	@commentaire	#CHASSEUR10100

CHASSEUR10030	@inkey
	@image	#iCHASSEUR;#33448
	@commentaire	#CHASSEUR10110
	@inkey
	@commentaire	#CHASSEUR10120
	@inkey
	@commentaire	#CHASSEUR10130
	@ordre	#2;#CHASSEUR10140
	
	lda	t
	cmp	#1
	beq	CHASSEUR10040
	jmp	CHASSEUR10080

CHASSEUR10040	@image	#iCHASSEUR;#29604
	@commentaire	#CHASSEUR10150
	
	lda	maggy
	cmp	#1
	beq	CHASSEUR10060
	
	@inkey

CHASSEUR10050	@commentaire	#CHASSEUR10160
	@inkey
	@commentaire	#CHASSEUR10170
	@inkey
	jmp	JUGEMENT

CHASSEUR10060	@chance

	lda	chance
	cmp	#0
	bne	CHASSEUR10050

	@commentaire	#CHASSEUR10200
	@inkey
	@commentaire	#CHASSEUR10201
	@inkey
	@image	#iCHASSEUR;#31407
	@bruitage
	@commentaire	#CHASSEUR10210
	@inkey
	@commentaire	#CHASSEUR10220
	@inkey

CHASSEUR10070	lda             #1
                sta             fgFRAME
                
                @window	#1;#theWINDOW4
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#CHASSEUR10230
	@inkey
	
	@image	#iCHASSEUR;#22728
	@window	#1;#theWINDOW6
	@paper	#1;#indexPERIBLUE
	@pen	#1;#indexWHITE
	@commentaire	#CHASSEUR10240
	@inkey
	jmp	DEBUT

CHASSEUR10080	@image	#iCHASSEUR;#33201
	@temporisation	#300
	@image	#iCHASSEUR;#33074
	@bruitage
	@temporisation	#100
	@image	#iCHASSEUR;#33201
	@temporisation	#2000
	@image	#iCHASSEUR;#33448
	@commentaire	#CHASSEUR10180
	@inkey
	@commentaire	#CHASSEUR10190
	@inkey
	jmp	DEBUT
	
*-------------------------------
* reno
*-------------------------------

pCHASSEUR	strl	'@/data/chasseur.bin'

CHASSEUR10090	asc	' apres deux  longues journees    de trajet nous arrivions            a pecos-city'00
CHASSEUR10100	asc	' apres deux  longues journees   de trajet j'27'arrivais enfin           a pecos-city'00
CHASSEUR10110	asc	'alors que je  venais de mettre pied a terre  devant l'27'hotel  un homme s'27'approchait de moi'00
CHASSEUR10120	asc	'  il m'27'ordonnait  de ne plus   faire un geste si je voulais         rester en vie'00
CHASSEUR10130	asc	'c'27'etait un  chasseur de primeset il m'27'apprenait  que j'27'etais    recherche  mort ou vif'00
CHASSEUR10140	asc	'je me laissais ligoter,je tentais de l'27'abattre'00
CHASSEUR10150	asc	'apres m'27'avoir  attache sur moncheval il prenait la direction     du bureau du  sherif'00
CHASSEUR10160	asc	' il touchait sa prime de cinq   cents dollars  pendant que     j'27'etais jete en prison'00
CHASSEUR10170	asc	'   au cours du mois suivant   j'27'etais conduit a  reno ou mon      proces m'27'attendait'00
CHASSEUR10180	asc	' c'27'etait la premiere fois que   je voyais un type degainer       et tirer  aussi vite'00
CHASSEUR10190	asc	' en m'27'ecroulant  au sol je me  disais que  c'27'etait aussi la derniere fois que je voyais ca'00
CHASSEUR10200	asc	' lorsqu'27'il me  ligotait il ne pretait plus attention a maggy'00
CHASSEUR10201	asc	' elle s'27'emparait  de ma winch  et descendait  proprement le       chasseur de primes'00
CHASSEUR10210	asc	'    la fuite a nouveau mais    cette fois  nous etions deux'00
CHASSEUR10220	asc	'trois ans plus tard  nous nous  retrouvions en oregon sous      de faux noms et maries'00
CHASSEUR10230	asc	'   j'27'avais rase ma barbe et     j'27'exploitais maintenant un    petit ranch avec maggy qui   m'27'avait deja donne un garcon     peut-etre le bonheur...'00
CHASSEUR10240	asc	'fin de l'27'episode'00
