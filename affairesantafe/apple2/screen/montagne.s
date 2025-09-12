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

MONTAGNE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexBLUE

	@charge_image	#iMONTAGNE;#pMONTAGNE

	@image	#iMONTAGNE;#34902
	@commentaire	#MONTAGNE10140
	@inkey
	@image	#iMONTAGNE;#32325
	@commentaire	#MONTAGNE10150

MONTAGNE10030	@ordre_tempo	#3;#MONTAGNE10160;#$0401	; 4 secondes, choix 1

	lda	t
	cmp	#2
	beq	MONTAGNE10060
	cmp	#3
	beq	MONTAGNE10070

MONTAGNE10050	@image	#iMONTAGNE;#29973
	@commentaire	#MONTAGNE10170
	@inkey
	@commentaire	#MONTAGNE10171
	@inkey
	jmp	DEBUT

MONTAGNE10060	@image	#iMONTAGNE;#27642
	@bruitage
	@commentaire	#MONTAGNE10180
	@inkey
	@commentaire	#MONTAGNE10190
	@inkey
	jmp	MONTAGNE10080

MONTAGNE10070	@commentaire	#MONTAGNE10200
	@inkey

MONTAGNE10080	@image	#iMONTAGNE;#25889
	@commentaire	#MONTAGNE10210
	@ordre	#2;#MONTAGNE10220

	lda	t
	cmp	#2
	beq	MONTAGNE10130

MONTAGNE10110	@commentaire	#MONTAGNE10230
	@inkey
	@image	#iMONTAGNE;#24375
	@commentaire	#MONTAGNE10240
	@inkey
	jmp	DEBUT

MONTAGNE10130	@commentaire	#MONTAGNE10250
	@inkey
	jmp	TRAPPEUR

*-------------------------------
* reno
*-------------------------------

pMONTAGNE	strl	'@/data/montagne.bin'

MONTAGNE10140	asc	'le deuxieme jour je commencais    a progresser dans une             neige epaisse'00
MONTAGNE10150	asc	'soudain je me  retrouvais face      a un puma menacant'00
MONTAGNE10160	asc	'j'27'attendais sa reaction,je tentais de l'27'abattre,je reculais prudemment'00
MONTAGNE10170	asc	'le puma me sautait dessus avecune rapidite stupefiante et me     dechiquetait la gorge'00
MONTAGNE10171	asc	'   c'27'est dans ces montagnes       inhospitalieres que ce        terminait mon aventure'00
MONTAGNE10180	asc	' j'27'epaulais ma  winchester et  l'27'abattais d'27'une seule balle'00
MONTAGNE10190	asc	'    apres l'27'avoir depouille     je continuais mon ascension'00
MONTAGNE10200	asc	'le puma ne me quittait pas des  yeux mais me laissait m'27'en       aller tranquillement '00
MONTAGNE10210	asc	'  en cette periode le col me     semblait infranchissable'00
MONTAGNE10220	asc	'je tentais le passage,je cherchais un refuge'00
MONTAGNE10230	asc	' je continuais avec une neige  de plus en plus epaisse dans  laquelle j'27'usais  mes forces'00
MONTAGNE10240	asc	'apres mon cheval je succombais    au froid et a la faim      terminant ainsi mon aventure'00
MONTAGNE10250	asc	' je me mettais a la recherche  d'27'un refuge pour y attendre           le printemps'00
