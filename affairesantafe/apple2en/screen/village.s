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

VILLAGE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iVILLAGE;#pVILLAGE

	@image	#iVILLAGE;#34095
	@commentaire	#VILLAGE10080
	@inkey
	@image	#iVILLAGE;#32272
	@commentaire	#VILLAGE10090
	@inkey
	@commentaire	#VILLAGE10100
	@inkey
	@commentaire	#VILLAGE10110
	@inkey
	@commentaire	#VILLAGE10120
	@ordre	#2;#VILLAGE10130
	
	lda	t
	cmp	#1
	beq	VILLAGE10030

VILLAGE10020	@image	#iVILLAGE;#27955
	@commentaire	#VILLAGE10140
	@inkey
	@commentaire	#VILLAGE10150
	@inkey
	jmp	DEBUT

VILLAGE10030	@commentaire	#VILLAGE10160
	@inkey
	@commentaire	#VILLAGE10170
	@chance
	
	lda	chance
	cmp	#0
	beq	VILLAGE10050
	
	@commentaire	#VILLAGE10180
	@inkey
	jmp	VILLAGE10020

VILLAGE10050	@image	#iVILLAGE;#29643
	@commentaire	#VILLAGE10190
	@inkey
	@commentaire	#VILLAGE10200
	@ordre	#2;#VILLAGE10210
	
	lda	t
	cmp	#2
	beq	VILLAGE10070

VILLAGE10060	@commentaire	#VILLAGE10220
	@inkey
	jmp	CABANE

VILLAGE10070	lda             #1
                sta             fgFRAME
                
            	@window	#1;#theWINDOW4	; change size of window (from 1 to 3)
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#VILLAGE10230	; comment does cls
	@inkey
	@commentaire	#VILLAGE10240
	@inkey
	@image	#iVILLAGE;#20052
	@window	#1;#theWINDOW5
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#VILLAGE10250	; comment does cls
	@inkey
	jmp	DEBUT

*-------------------------------
* reno
*-------------------------------

pVILLAGE	strl	'@/data/village.bin'

VILLAGE10080	asc	' i was greeted in the village       with fierce stares'00
VILLAGE10090	asc	'   i was taken into a tent          where i discovered            a feverish old man'00
VILLAGE10100	asc	'    it was the great chief        whom the medicine man             could not cure'00
VILLAGE10110	asc	'    i then understood why         i had not been killed'00
VILLAGE10120	asc	'   the apaches hoped to see         me do better than               their sorcerer'00
VILLAGE10130	asc	'i tried to cure him,i refused'00
VILLAGE10140	asc	'  warriors seized me and did    not give me the chance to        see him the next day'00
VILLAGE10150	asc	'     one of them had just     acquired a new very decorative      item for his tunic'00
VILLAGE10160	asc	'i made him drink a herbal tea   whose secret my mother had          revealed to me'00
VILLAGE10170	asc	'  the care and the wait had     lasted for about ten days                when'00
VILLAGE10180	asc	'     the great chief died'00
VILLAGE10190	asc	' the great chief felt better  and thanked me for having kept him from the great chieftain'00
VILLAGE10200	asc	'  he then offered me to stay     in the tribe if i wished'00
VILLAGE10210	asc	'i left,i stayed with the apaches'00
VILLAGE10220	asc	'   after saying my goodbyes           i headed west'00
VILLAGE10230	asc	' i had just found what i had    unconsciously been looking    for - a calm and peaceful      life among a people full    of wisdom and joie de vivre'00
VILLAGE10240	asc	'from then on i was called big bear because of my beard and    i took spring flower as my      wife who soon bore me           beautiful children'00
VILLAGE10250	asc	'the end'00
