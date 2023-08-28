*
* La belle Zohra
*
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
*

	mx	%00
	rel
	dsk	convert.l
	typ	$B3

*----------------------------------- Macros

	use   4/Locator.Macs
	use   4/Mem.Macs
	use   4/Misc.Macs
	use   4/Util.Macs

*----------------------------------- Constantes

GSOS	=	$e100a8
dpFROM	=	$80

*----------------------------------- Entry point

	phk
	plb

	clc
	xce
	rep	#$30
	
	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	myID
	
*--- 2x64K pour les textes

	jsr	make64KB	; 64K pour le fichier source
	sty	ptrFROM
	sty	proREAD+4
	stx	ptrFROM+2
	stx	proREAD+6

*----------------------------------- Boucle principale

	lda	#1
]lp	sta	index
	sep	#$20
	ora	#'0'
	sta	pFILER+9
	sta	pFILEW+9
	rep	#$20

	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	
	jsr	loadFILE
	jsr	convertIT
	jsr	saveFILE
	
	lda	index
	inc
	cmp	#10
	bne	]lp
	beq	theEND

*---

index	ds	2

*----------------------------------- Quit

theEND	PushWord myID
	_DisposeAll

	PushWord myID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

*----------------------------------------
* CONVERSION
*----------------------------------------

convertIT	lda	ptrFROM
	sta	dpFROM
	lda	ptrFROM+2
	sta	dpFROM+2
	ldy	#6	; offset pour la lecture
	ldx	#0	; offet pour l'écriture

* 1. où démarre le texte ?

	lda	[dpFROM],y
	xba
	tay
	sep	#$20

* 2. on traite les caractères

]lp	lda	[dpFROM],y
	beq	skip1
	cmp	#$1b
	beq	skip2
	cmp	#$0a
	beq	skip1
	cmp	#$0c
	beq	skip1
	sta	myBUFFER,x
	inx
	bra	skip1
skip2	iny
skip1	iny
	cpy	proREAD+8
	bne	]lp
	
* 2. on a fini

	rep	#$20
	stx	proWRITE+8
	rts
	
*----------------------------------------
* MEMOIRE
*----------------------------------------

make64KB	pha
	pha
	PushLong #$010000
	PushWord myID
	PushWord #%11000000_00011100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda   [3]
	tax		; low in X
	ldy   #2
	lda   [3],y
	txy		; low in Y
	tax		; high in X
	pld
	pla		; we do not keep track of the handle
	pla
	rts

*----------------------------------------
* DATA
*----------------------------------------

*----------------------- Memory manager

myID	ds	2	; user ID

ptrFROM	ds	4
ptrTO	ds	4

*----------------------------------------
* GS/OS
*----------------------------------------

loadFILE	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcc	lf1
	brk	$e1
	
lf1	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	lda	proEOF
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD
	bcc	lf2
	brk	$e2
	
lf2	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*----------------------------------

saveFILE	jsl	GSOS
	dw	$2002
	adrl	proDESTROY
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATE

	jsl	GSOS
	dw	$2010
	adrl	proOPEN2
	bcc	sf1
	brk	$f1
	
sf1	lda	proOPEN2+2
	sta	proWRITE+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITE
	bcc	sf2
	brk	$f2
	
sf2	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*--- For the game party

proCREATE	dw	7	; pcount
	adrl	pFILEW	; pathname
	dw	$c3	; access_code
	dw	$04	; file_type
	ds	4	; aux_type
	ds	2	; storage_type
	ds	4	; eof
	ds	4	; resource_eof

proDESTROY	dw	1	; pcount
	adrl	pFILEW	; pathname

proOPEN	dw	12
	ds	2
	adrl	pFILER
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	8
	ds	8
	ds	4
proEOF	ds	4

proOPEN2	dw	2
	ds	2
	adrl	pFILEW

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	ds	4	; 4 - pointer
	ds	4	; 8 - length
	ds	4	; C - length read

proWRITE	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	myBUFFER	; 4 - data_buffer (we are in same bank)
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

proCLOSE	dw	1
	ds	2

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*--- offset to text is at +9

pFILER	strl	'1/I/TXT1.TXT'
pFILEW	strl	'1/O/TXT1.TXT'

*---

myBUFFER	ds	32768
