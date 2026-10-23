*
* Utopia
* by William Demas
*
* (c) 1985, Unicorn Software
* (c) 2026, Brutal Deluxe Software
*

* Les accents (encore et toujours)
*
* ˆ	88
* ‰	89
* 	8d
* Ž	8e
* 	8f
* 	90
* ‘	91
* ”	94
* •	95
* ™	99
* 	9d
* ž	9e
* (c) 	a9 (only c)
* oe	cf

	mx	%00
	rel
	lst	off

*-----------------------------------
* MACROS
*-----------------------------------

	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MidiSyn.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-----------------------------------
* EQUATES
*-----------------------------------

appleKey	=	$0100
mouseDownEvt	=	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

mDownMask	=	$0002
mUpMask	=	$0004
keyDownMask	=	$0008

modeCopy	=	0
modeOr	=	1
modeForeCopy	=	4

mode320	=	$00
mode640	=	$80

screen160	=	160
screen320	=	320
screen640	=	640

GFX_MAX_X	=	320
GFX_MAX_Y	=	200

ptr012000	=	$012000
ptrE12000	=	$e12000

refIsPointer	=	$0
refIsHandle	=	$1
refIsResource	=	$2

*---

chrNULL	=	$00
chrLA	=	$08
chrRETURN	=	$0d
chrRA	=	$15
chrESCAPE	=	$1b
chrSPACE	=	$20
chrGUILLEMET	=	$27
chrCOMMA	=	$2c
chrDOT	=	$2e
chrBACKSLASH	=	$5c
chrPIPE	=	$7c
chrDELETE	=	$7f
chrEOT	=	$fe
chrEOL	=	$ff

chrYES	=	'Y'	; FR
chrNO	=	'N'

*----------------------- Color index

indexBLACK	=	0
indexDARKGRAY	=	1
indexBROWN	=	2
indexPURPLE	=	3
indexBLUE	=	4
indexDARKGREEN	=	5
indexORANGE	=	6
indexRED	=	7
indexBEIGE	=	8
indexYELLOW	=	9
indexGREEN	=	10
indexLIGHTBLUE	=	11
indexLILAC	=	12
indexPERIBLUE	=	13
indexLIGHTGRAY	=	14
indexWHITE	=	15

*-------------------------------
* DIRECT PAGE
*-------------------------------

dpFROM	=	$00
dpTO	=	dpFROM+4
dpTHREE	=	dpTO+4
dpFOUR	=	dpTHREE+4

Debut	=	dpFOUR+4
Arrivee	=	Debut+4
Third	=	Arrivee+4

dpACTIONS	=	Third+4
dpCONDITIONS	=	dpACTIONS+4

dpDATA	=	dpCONDITIONS+4
dpREAD	=	dpDATA+4
dpINSTR1	=	dpREAD+4
dpINSTR2	=	dpINSTR1+4

*-------------------------------
* FIRMWARE
*-------------------------------

KBD	=	$c000
KBDSTROBE	=	$c010
RDVBLBAR	=	$c019
HORIZCNT	=	$c02e
VERTCNT	=	$c02f
CLOCKCTL	=	$c034
BUTN0	=	$c061

GSOS	=	$e100a8

*-----------------------------------
* DU 16-BITS
*-----------------------------------

ICI	phk
	plb
	
	clc
	xce
	rep	#$30

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID

	_MTStartUp

*-----------------------------------
* CHANGE BORDER
*-----------------------------------

	PushWord	#0
	PushWord	#$1c
	_ReadBParam
	pla
	sta	bramBORDER

	PushWord	#indexBLACK
	PushWord	#$1c
	_WriteBParam
	bcs	noBORDER

	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	#indexBLACK
	stal	CLOCKCTL
	rep	#$20

noBORDER

*-----------------------------------
* MEMORY
*-----------------------------------

	jsr	make64KB
	bcc	okMEM1

koMEM	pha
	PushLong	#memSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

okMEM1	sty	ptrTEXT
	stx	ptrTEXT+2
	stx	ptrBACKGND+2

*-----------------------

	jsr	make64KB
	bcs	koMEM

	sty	ptrUNPACK
	sty	proREADPIC+4
	stx	ptrUNPACK+2	; $0000
	stx	proREADPIC+6	; $0000
	stx	ptrIMAGE+2	; $8000
	stx	imageToSourceLocInfo+4	; $8000
	
*-----------------------------------
* DESKTOP MODE
*-----------------------------------
	
	pha
	pha
	PushWord	myID
	PushWord	#refIsResource
	PushLong	#1
	_StartUpTools
	PullLong	ssREC
	bcc	okTOOL

	pha
	PushLong	#tolSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT

okTOOL	_HideMenuBar
	_InitCursor
	_HideCursor

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

	PushLong	#0
	PushWord	#5	; SetDeskPat
	PushWord	#$4000
	PushWord	#$0000
	_Desktop
	pla
	pla

*-----------------------------------
* INITIALISATIONS DESKTOP
*-----------------------------------

	PushLong	#0
	_GetPort
	PullLong	mainPORT
	
	PushLong	mainPORT
	_SetPort

	PushLong	#117117
	_SetRandSeed

	PushWord	#indexWHITE
	_SetBackColor
	PushWord	#indexBLACK
	_SetForeColor

	PushLong	#whitePATTERN	; white pattern
	_SetPenPat

	PushWord	#$FFFF
	_ClearScreen

	PushWord	#0
	_GetMasterSCB
	pla
	bpl	okSHADOW	; shadowing is off if bit 15 is not set

	lda	#^ptr012000	; shadowing is on, use fast RAM
	sta	srcLocInfoPtr+4
	sta	imageToDestLocInfo+4
	sta	ptrSCREEN+2
	
okSHADOW

*-----------------------------------
* IL FAUT JOUER MAINTENANT
*-----------------------------------

	jsr	initMIDI
	jsr	doSOUNDON
	
	lda	#pTITLE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	noTITLE
	jsr	unpackLZ4
	
	lda	#TRUE
	jsr	fadeOUT
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	lda	#TRUE
	jsr	fadeIN
	@INKEY

noTITLE	lda	#TRUE
	jsr	fadeOUT

	jmp	PLAY

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	rep	#$30
	jsr	stopMIDI

meQUIT	lda	ssREC
	ora	ssREC+2
	beq	meQUIT0BIS

	PushWord	#refIsHandle
	PushLong	ssREC
	_ShutDownTools

meQUIT0BIS	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	bramBORDER
	stal	CLOCKCTL
	rep	#$20

	PushWord	bramBORDER
	PushWord	#$1c
	_WriteBParam

meQUIT1	PushWord myID
	_DisposeAll

	PushWord appID
	_DisposeAll

	PushWord appID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*-----------------------------------
* UNE BELLE BIBLIOTHEQUE
*-----------------------------------

*------------------------------
* UNPACK LZ4 FILE
*------------------------------

* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed image
*   - ptrIMAGE: temp unpack zone
*
* Entry:
*  A: packed data size
*  Y: offset of the data to unpack

* Exit:
*  A: unpacked data size
*

unpackLZ4	sta	LZ4_Limit+1
	
*	lda	ptrUNPACK	; that should make it usable at every source offset
*	sty	LZ4_ReadToken+1
*	sty	LZ4_Match_1+1
*	sty	LZ4_GetLength_1+1

	sep	#$20

	lda	ptrUNPACK+2	; Source
	sta	LZ4_Literal_3+2
	sta	LZ4_ReadToken+3
	sta	LZ4_Match_1+3
	sta	LZ4_GetLength_1+3

	lda	ptrIMAGE+2	; Destination
	sta	LZ4_Literal_3+1
	sta	LZ4_Match_5+1
	sta	LZ4_Match_5+2

	rep	#$20

*--

	ldy	ptrIMAGE	; Init Target unpacked Data offset
	ldx	#16	; Offset after header

LZ4_ReadToken	LDAL	$AA0000,X	; Read Token Byte
	INX
	STA	LZ4_Match_2+1
	
*----------------

LZ4_Literal	AND	#$00F0	; >>> Process Literal Bytes <<<
	BEQ	LZ4_Limit	; No Literal
	CMP	#$00F0
	BNE	LZ4_Literal_1
	JSR	LZ4_GetLengthLit	; Compute Literal Length with next bytes
	BRA	LZ4_Literal_2
LZ4_Literal_1	LSR		; Literal Length use the 4 bit
	LSR
	LSR
	LSR

LZ4_Literal_2	DEC		; Copy A+1 Bytes
LZ4_Literal_3	MVN	$AA,$BB	; Copy Literal Bytes from packed data buffer
	PHK		; X and Y are auto incremented
	PLB

*----------------

LZ4_Limit	CPX	#$AAAA	; End Of Packed Data buffer ?
	BEQ	LZ4_End

*----------------

LZ4_Match	TYA		; >>> Process Match Bytes <<<
	SEC
LZ4_Match_1	SBCL	$AA0000,X	; Match Offset
	INX
	INX
	STA	LZ4_Match_4+1

LZ4_Match_2	LDA	#$0000	; Current Token Value
	AND	#$000F
	CMP	#$000F
	BNE	LZ4_Match_3
	JSR	LZ4_GetLengthMat	; Compute Match Length with next bytes
LZ4_Match_3	CLC
	ADC	#$0003	; Minimum Match Length is 4 (-1 for the MVN)
	PHX
LZ4_Match_4	LDX	#$AAAA	; Match Byte Offset
LZ4_Match_5	MVN	$BB,$BB	; Copy Match Bytes from unpacked data buffer
	PHK		; X and Y are auto incremented
	PLB
	PLX
	BRA	LZ4_ReadToken

*----------------

LZ4_GetLengthLit
	LDA	#$000F	; Compute Variable Length (Literal or Match)
LZ4_GetLengthMat
	STA	LZ4_GetLength_2+1
LZ4_GetLength_1
	LDAL	$AA0000,X	; Read Length Byte
	INX
	AND	#$00FF
	CMP	#$00FF
	BNE	LZ4_GetLength_3
	CLC
LZ4_GetLength_2
	ADC	#$000F
	STA	LZ4_GetLength_2+1
	BRA	LZ4_GetLength_1
LZ4_GetLength_3
	ADC	LZ4_GetLength_2+1
	RTS

*----------------

LZ4_End	sty	LZ4_length	; Y = length of unpacked data
	ldx	LZ4_length+2
	rts

*--- Data

LZ4_length	ds	4

*----------------------------------------
* FADE IN & OUT
*----------------------------------------
* X/Y: source picture address
*   A: 0: do not copy image data

fadeIN	sty	Debut
	stx	Debut+2

	ldy	ptrSCREEN
	sty	Arrivee
	ldx	ptrSCREEN+2
	stx	Arrivee+2

	cmp	#0
	beq	fadeIN1

	ldy	#$7e00-2
]lp	lda	[Debut],y
	sta	[Arrivee],y
	dey
	dey
	bpl	]lp
	
fadeIN1	lda	Debut
	clc
	adc	#$7e00
	sta	Debut
	lda	Debut+2
	adc	#0
	sta	Debut+2
	lda	Arrivee
	clc
	adc	#$7e00
	sta	Arrivee
	lda	Arrivee+2
	adc	#0
	sta	Arrivee+2

	ldx	#$000f
fadeIN2	ldy	#$01fe
fadeIN3	lda	[Arrivee],y
	cmp	[Debut],y	; **new
	beq	fadeIN6	; **new**
	and	#$000f
	sta	temp
	lda	[Debut],y
	and	#$000f
	cmp	temp
	beq	fadeIN4
	lda	[Arrivee],y
	clc
	adc	#$0001
	sta	[Arrivee],y
fadeIN4	lda	[Arrivee],y
	and	#$00f0
	sta	temp
	lda	[Debut],y
	and	#$00f0
	cmp	temp
	beq	fadeIN5
	lda	[Arrivee],y
	clc
	adc	#$0010
	sta	[Arrivee],y
fadeIN5	lda	[Arrivee],y
	and	#$0f00
	sta	temp
	lda	[Debut],y
	and	#$0f00
	cmp	temp
	beq	fadeIN6
	lda	[Arrivee],y
	clc
	adc	#$0100
	sta	[Arrivee],y
fadeIN6	dey
	dey
	bpl	fadeIN3

	jsr	nextVBL
	dex
	bpl	fadeIN2
	rts

*---

temp	ds	2

*----------------------------------------
* A: 0: do not erase SHR screen

fadeOUT	pha

	lda	ptrSCREEN
	clc
	adc	#$7e00
	sta	Debut
	lda	ptrSCREEN+2
	adc	#0
	sta	Debut+2

	ldx	#15
]lp	ldy	#512-2
fadeOUT2	lda	[Debut],y
	and	#$000f
	beq	fadeOUT3
	lda	[Debut],y
	sec
	sbc	#$0001
	sta	[Debut],y
fadeOUT3	lda	[Debut],y
	and	#$00f0
	beq	fadeOUT4
	lda	[Debut],y
	sec
	sbc	#$0010
	sta	[Debut],y
fadeOUT4	lda	[Debut],y
	and	#$0f00
	beq	fadeOUT5
	lda	[Debut],y
	sec
	sbc	#$0100
	sta	[Debut],y

fadeOUT5	dey
	dey
	bpl	fadeOUT2
	jsr	nextVBL
	dex
	bpl	]lp

*--- On efface vraiment tout

	pla
	bne	fadeOUT6
	rts

fadeOUT6	PushWord	#0
	_ClearScreen
	rts
	
*------------------------------
* ATTEND QUELQUES VBLs
*------------------------------

nextVBL	ldal	RDVBLBAR-1
	bmi	nextVBL
]lp	ldal	RDVBLBAR-1
	bpl	]lp
	rts

*------------------------------
* ATTEND N SECONDES
*------------------------------

nowWAIT	dec
	tax
	lda	#0
]lp	clc
	adc	#60
	cpx	#0
	beq	nowWAIT1
	dex
         	bra	]lp

nowWAIT_ALT
nowWAIT1 	tax
]lp	jsr	nextVBL
	dex
	bne	]lp
	rts

*-----------------------------------
* RESERVE 64K
*-----------------------------------

make64KB	pha
	pha
	PushLong	#$010000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	ldy	#2
	lda	[3],y
	tax
	lda	[3]
	tay		; low in X
	pld
	pla		; we do not keep track of the handle
	pla
	rts

*-----------------------------------
* SAVE THE SHR SCREEN
*-----------------------------------

saveBACK	_HideCursor
	PushLong	ptrSCREEN
	PushLong	ptrBACKGND
	PushLong	#32768
	_BlockMove
	_ShowCursor
	rts

*-----------------------------------
* RESTORE THE SHR SCREEN
*-----------------------------------

loadBACK	_HideCursor
	PushLong	ptrBACKGND
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove
	rts

*-----------------------------------
* RANDOM
*-----------------------------------

RANDOM	pha
	_Random
	pla
	rts

*-----------------------------------
* LOAD/SAVE
*-----------------------------------

loadFILE	sta	proOPEN+4
	sty	proREAD+4
	stx	proREAD+6

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	loadFILE_KO
	
	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2

	lda	proEOF
	sta	proREAD+8

	jsl	GSOS
	dw	$2012
	adrl	proREAD
	php
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	plp
	
loadFILE_KO	lda	proEOF
	rts

*----------------------------------- Open

loadGAME	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	loadKO99

	lda	proOPENGAME+2
	sta	proREADGAME+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME
	php
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	plp
	
loadKO99	rts

*----------------------------------- Save

saveGAME	jsl	GSOS
	dw	$2002
	adrl	proDESTROYGAME
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATEGAME
	bcs	saveKO99

	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	saveKO99

	lda	proOPENGAME+2
	sta	proWRITEGAME+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME
	php
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	plp

saveKO99	rts

*--- For the game party

proCREATEGAME
	dw	7	; pcount
	adrl	pGAME	; pathname
	dw	$c3	; access_code
	dw	$5d	; file_type
	adrl	$802f	; aux_type
	ds	2	; storage_type
	ds	4	; eof
	ds	4	; resource_eof

proDESTROYGAME
	dw	1	; pcount
	adrl	pGAME	; pathname

proOPENGAME
	dw	2
	ds	2
	adrl	pGAME

proREADGAME
	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	DEBUT_DATA	; 4 - data_buffer
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	DEBUT_DATA	; 4 - data_buffer (we are in same bank)
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'8/Data/Partie0'

*-----------------------------------
* DES DONNES 16-BITS
*-----------------------------------

*----------------------------------- Memory Manager

appID	ds	2
myID	ds	2
myDP	ds	2

bramBORDER	ds	2

ptrSCREEN	adrl	ptrE12000	; l'Žcran actif

ptrTEXT	adrl	$00000000	; 32k bank 1
ptrBACKGND	adrl	$00008000	; 32k
ptrUNPACK	adrl	$00000000	; 32k bank 2
ptrIMAGE	adrl	$00008000	; 32k

*----------------------------------- Error messages

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''

*----------------------------------- Tool Locator

ssREC	ds	4
fgSOUND	ds	2

*----------------------------------- QuickDraw II

srcLocInfoPtr	dw	mode640	; mode 320
	adrl	ptrE12000
	dw	160
	dw	68,0,200,204

*----------------------------------- GS/OS

proERR	ds	2	; GS/OS error code

proOPEN	dw	12
	ds	2
	adrl	pTITLE
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

proREAD	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	ds	4	; 4 - data_buffer @ptrUNPACK
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count

proCLOSE	dw	1	; 0 - pcount
	ds	2	; 2 - ref_num

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

pTITLE	strl	'8/Data/Title.lz4'

*----------------------------------- Window Manager

mainPORT	ds	4

taskREC	ds	2	; wmWhat           +0
taskMESSAGE	ds	4	; wmMessage        +2
taskWHEN	ds	4	; wmWhen           +6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS	ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	utopia.s
	put	engine.s
	put	midi.s
	put	tables.s
	put	en.s
	
*--- It's the end
