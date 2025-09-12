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

DESERT	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE

	@charge_image	#iDESERT;#pDESERT

*	stz	eau
	
	@image	#iDESERT;#34319
	@commentaire	#DESERT10130
	
	lda	eau
	cmp	#1
	bne	DESERT10025
	
DESERT10020	@ordre	#1;#DESERT10140
	jmp	DESERT10030

DESERT10025	@ordre	#2;#DESERT10140

DESERT10030	lda	t
	cmp	#2
	beq	DESERT10050

	@image	#iDESERT;#29503
	@commentaire	#DESERT10150
	@inkey
	
	lda	eau
	cmp	#0
	beq	DESERT10070
	bne	DESERT10080

DESERT10050	@saisie
	@mot	#1
	bne	DESERT10020
	@mot	#33
	bne	DESERT10020

	lda	#1
	sta	eau
	
	@image	#iDESERT;#31795
	@commentaire	#DESERT10160
	@inkey
	jmp	DESERT10020

DESERT10060	@commentaire	#DESERT10180
	@inkey

DESERT10070	@commentaire	#DESERT10190
	@inkey
	@image	#iDESERT;#22220
	@commentaire	#DESERT10200
	@inkey
	jmp	DEBUT

DESERT10080	@image	#iDESERT;#27232
	@commentaire	#DESERT10210
	@ordre	#3;#DESERT10220
	
	lda	t
	cmp	#1
	beq	DESERT10060
	cmp	#2
	beq	DESERT10100
	cmp	#3
	beq	DESERT10110

DESERT10100	@commentaire	#DESERT10240
	@inkey
	@commentaire	#DESERT10250
	@inkey
	jmp	PUEBLO

DESERT10110	@image	#iDESERT;#24936
	@temporisation	#500
	@bruitage

DESERT10120	@inkey_true	#A$

	lda	A$
	cmp	#0
	beq	DESERT10125

	@commentaire	#DESERT10230
	@inkey
	jmp	INDIEN

DESERT10125	@image	#iDESERT;#24603
	@temporisation	#100
	@image	#iDESERT;#24269
	@temporisation	#100
	@image	#iDESERT;#23937
	@temporisation	#100
	@image	#iDESERT;#24269
	@temporisation	#100
	jmp	DESERT10120

*-------------------------------
* reno
*-------------------------------

pDESERT	strl	'@/data/desert.bin'

DESERT10130	asc	'  to take refuge in mexico i  had to cross apache territory'00
DESERT10140	asc	'i was fording,i had other things to do'00
DESERT10150	asc	' i crossed the river and went  deeper into apache territory'00
DESERT10160	asc	' while my horse was drinking        i filled my bottle               in the river'00
DESERT10170	asc	'okay it worked'00
DESERT10180	asc	'     despite my care  the       unfortunate man was dying       i continued on my way'00
DESERT10190	asc	'  i had forgotten that here     water was a rare commodity     and worth more than gold'00
DESERT10200	asc	' i ended my adventure in this   scorching desert forbidden          to the unwary'00
DESERT10210	asc	' the second day i discovered     a man dying. the apaches          had tortured him'00
DESERT10220	asc	'i gave him a drink,i continued on my way,i shortened his suffering'00
DESERT10230	asc	' i continued on my way after   burying the unfortunate man'00
DESERT10240	asc	'  it was better to leave the      area before taking the       unfortunate'27's man place'00
DESERT10250	asc	'    i arrived in mexico on     the third day without having  encountered a single apache'00
