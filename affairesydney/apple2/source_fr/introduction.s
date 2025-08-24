*
* L'affaire Sydney
*
* (c) 1986, Gilles Blancon
* (c) 1986, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* EQUATES
*-------------------------------

idxSNDBIP	=	0
idxSNDLIGNE	=	1
idxSNDRETOUR	=	2
idxSNDSIRENE	=	3
idxSNDTIR	=	4
idxSNDMODEM	=	5

*-------------------------------
* EXTERNALS
*-------------------------------

	ext	sndBIP
	ext	sndLIGNE
	ext	sndRETOUR
	ext	sndSIRENE
	ext	sndTIR
	ext	sndMODEM
	
*-------------------------------
* INTRODUCTION
*-------------------------------
* sons
* frequence
*  $D6
*
* nombre de pages
*     bip :  2 ˆ chaque clic ou touche
*   ligne : 39 ˆ chaque impression de ligne
*  retour :  7 ˆ chaque retour chariot
*  sirene : 47 x 12 fois crescendo (intro) & decrescendo (victoire)
*     tir : 54 x  1 fois
*

introduction	ldal	BUTN0-1
	bpl	introduction1
	rts
	
introduction1	lda	#pANIMATION	; charge l'animation
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	lda	#idxSNDTIR	; play the TIR sound
	jsr	playSOUND

	lda	#indexBLACK
	jsr	setBORDER
	
	jsr	animIT

	jsr	playCRESCENDO	; play the sirene sound

*--- We were here!

	PushWord	#0
	_ClearScreen

	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO
	jsr	SETWHITECHARS
	
	lda	#strBRUTAL
	ldx	#0
	ldy	#64
	jsr	PRINTCSTRING
	
	lda	#5
	jmp	nowWAIT

*---

strBRUTAL	asc	'           Version Apple IIgs'0d
	asc	'                   de'0d
	asc	'         Brutal Deluxe Software'0d
	asc	0d
	asc	'    Antoine Vignau & Olivier Zardini'0d
	asc	0d
	asc	0d
	asc	'              23 ao'9e't 2025'00

*------------------------------
* ANIMIT (PicViewer)
*------------------------------

animIT	lda	proREAD+4	; we are at $0000
	sta	Arrivee
	clc
	adc	#$800c
	sta	fileIN	; 1st frame data in RAM
	lda	proREAD+6
	sta	Arrivee+2
	adc	#0
	sta	fileIN+2

	lda	proREAD+4	; Last frame data in RAM
	clc		; logically,
	adc	proEOF	; fileIN + file size = fileOUT
	sta	fileOUT
	lda	proREAD+6
	adc	proEOF+2
	sta	fileOUT+2

	ldy	#$8004	; frame ticks
	lda	[Arrivee],y
	sta	theTICK

	phb		; set bank 1
	pea	$0101
	plb
	plb

*--- Go to first frame

stdANIM1	ldy	#$7ffe	; force recopy of first frame
]lp	lda	[Arrivee],y
	sta	$2000,y
	dey
	dey
	bpl	]lp

	lda	fileIN	; we point at $8008
	sta	Debut	; variable
	lda	fileIN+2
	sta	Debut+2

stdANIM2	lda	[Debut]
	beq	doFRAMESYNC	; 0 for frame sync
	tax
	ldy	#2
	lda	[Debut],y	; get value

	sta	$2000,x	; output data in bank 1

*--- Next data within frame

stdANIM5	lda	#4	; +4
stdANIM6	clc		; or +A
	adc	Debut
	sta	Debut
	lda	#0
	adc	Debut+2
	sta	Debut+2

*--- Check end of file

	cmp	fileOUT+2
	bcc	stdANIM2
	lda	Debut
	cmp	fileOUT
	bcc	stdANIM2
	bcs	stdANIM9

* Frame sync

doFRAMESYNC	ldx	theTICK	; ticks number?
dofs_1	lda	RDVBLBAR-1
	bmi	dofs_1
dofs_2	lda	RDVBLBAR-1
	bpl	dofs_2
	dex
	bne	dofs_1
	
	lda	#8
	bne	stdANIM6	; branch always

stdANIM9	plb
	rts

*-------------------------------
* DATA
*-------------------------------

*--- introduction

pANIMATION	strl	'@/data/introduction'

