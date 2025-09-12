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
* MACROS
*-------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
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
	use	4/Util.Macs
	use	4/Window.Macs

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

dpDATA	=	Third+4
dpREAD	=	dpDATA+4
dpINSTR1	=	dpREAD+4
dpINSTR2	=	dpINSTR1+4

temp	=	dpINSTR2+4
fileIN	=	temp+4
fileOUT	=	fileIN+4
fileLOOP	=	fileOUT+4

textX	=	fileLOOP+4	; les X/Y pour afficher les 
textY	=	textX+2	; caracteres QuickDraw II
marginX	=	textY+2
marginY	=	marginX+2
maxX	=	marginY+2
maxY	=	maxX+2
charWIDTH	=	maxY+2
charHEIGHT	=	charWIDTH+2
shrX	=	charHEIGHT+2
shrY	=	shrX+2

*-------------------------------
* EQUATES
*-------------------------------

refIsPointer	=	$0
refIsHandle	=	$1
refIsResource	=	$2

appleKey	=	$0100
mouseDownEvt	=	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

*-----------------------

modeCopy	=	$0000
modeOr	=	$0001
modeForeCopy	=	$0004	; QDII Table 16-10

mode320	=	$00
mode640	=	$80

screen320	=	320
screen640	=	640
screenheight	=	200

maxTCOLUMN	=	40
maxTROW	=	19

ptr012000	=	$012000
ptrE12000	=	$e12000

*-----------------------

chrLA	=	$08
chrDA	=	$0a
chrUA	=	$0b
chrRET	=	$0d
chrRA	=	$15
chrESC	=	$1b
chrSPC	=	$20
chrCOMMA	=	$2c
chrDEL	=	$7f

MAX_LEN	=	40

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

*-----------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
VERTCNT	=	$e0c02e
CLOCKCTL	=	$e0c034
BUTN0	=	$e0c061
GSOS	=	$e100a8

TRUE	=	1
FALSE	=	0

*-------------------------------
* GAME MACROS
*-------------------------------

*-------------------------------
* MAIN
*-------------------------------

	phk
	plb
	
	clc
	xce
	rep	#$30
	
	tdc
	sta	myDP

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID

	_MTStartUp

*-----------------------------------
* MEMORY...
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

okMEM1	sty	ptrUNPACK
	stx	ptrUNPACK+2

*-----------------------

	jsr	make64KB
	bcs	koMEM

	sty	ptrIMAGE
	stx	ptrIMAGE+2

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

*-----------------------------------
* INITIALISATIONS DESKTOP
*-----------------------------------

*--- Save the border

	PushWord	#0
	PushWord	#$1c
	_ReadBParam
	pla
	sta	bramBORDER

	sep	#$20
	ldal	CLOCKCTL
	and	#$0F
	sta	firmBORDER
	rep	#$20

*---

	PushLong	#0
	_GetPort
	PullLong	mainPORT
	
	PushLong	mainPORT
	_SetPort

	PushLong	#117117
	_SetRandSeed

	PushWord	#0	; keep this one
	_SetBackColor
	PushWord	#15
	_SetForeColor

	PushLong	#whitePATTERN	; white pattern
	_SetPenPat

	PushWord	#0
	_ClearScreen

	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2

*-----------------------------------
* BONJOUR LE JEU
*-----------------------------------

okSHADOW	jsr	introduction	; page de titre
	jsr	WESTERN	; jeu

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	PushWord	bramBORDER
	PushWord	#$1c
	_WriteBParam

	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	firmBORDER
	stal	CLOCKCTL
	rep	#$20

meQUIT	jsr	stopMIDI

	PushWord	#refIsHandle
	PushLong	ssREC
	_ShutDownTools
	
meQUIT1	_MTShutDown

	PushWord myID
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

	ldy	#ptr012000
	sty	Arrivee
	ldx	#^ptr012000
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

*----------------------------------------
* A: 0: do not erase SHR screen

fadeOUT	pha

	lda	#ptr012000
	clc
	adc	#$7e00
	sta	Debut
	lda	#^ptr012000
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

nowTEMPO	lsr
	lsr
	beq	nowWAIT2

nowWAIT1 	tax
]lp	jsr	nextVBL

	ldal	BUTN0-1
	bmi	nowWAIT2

	dex
	bne	]lp
nowWAIT2	rts

*-----------------------------------
* RESERVE xyK
*-----------------------------------

makeXYKB	pha
	pha
	phx
	phy
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	bcs	pasbon
	pla
	plx
	rts
pasbon	ply
	plx
	brk	$bd
	
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

*------------------------------
* LOAD A BIG FILE (>64K)
*------------------------------

loadBIGFILE	sta	proOPEN+4	; A contains the filename pointer

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	lbf_err

	lda	proOPEN+2	; get file ID
	sta	proREAD+2
	sta	proCLOSE+2

	lda	proEOF	; get length
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10

	stz	proHANDLE
	stz	proHANDLE+2

	PushLong	#0
	PushLong	proEOF
	PushWord	myID
	PushWord	#%11000000_00001100	; no special memory, page aligned
	PushLong	#0
	_NewHandle
	phd		; dereference handle
	tsc		; to get RAM pointer
	tcd
	lda	[3]
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	proREAD+6
	pld
	pla
	sta	proHANDLE
	pla
	sta	proHANDLE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD

	sta	proERR
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
	rts

lbf_err	sta	proERR
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	sec
	rts

*------------------------------
* LOAD FILE
*------------------------------

loadFILE	sta	proOPEN+4	; filename
	sty	proREAD+4	; where to put at the end
	stx	proREAD+6

loadFILE1	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	loadERR99
	
	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	lda	proEOF
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD
	bcs	loadERR

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
	rts
	
loadERR	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadERR99	sec
	rts

*------------------------------
* LOAD PARTIE
*------------------------------

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
	bcc	loadGAME1
	
loadKO99	sec
	rts

loadGAME1	ldx	#0	; Is it a good save file?
]lp	lda	myFILE,x
	cmp	strFILE,x
	bne	loadKO99
	inx
	inx
	cpx	#8
	bcc	]lp

	ldx	#0	; Yes, copy data
]lp	lda	myDATA,x
	sta	DATA_IN,x
	inx
	inx
	cpx	#12
	bcc	]lp

	lda	scene	; and jump to the
	asl		; right scene
	tax
	lda	tblSCENE,x
	sta	PATCHME+1
	clc		; good load
	rts

*------------------------------
* SAVE PARTIE
*------------------------------

saveGAME	ldx	#0
]lp	lda	DATA_IN,x
	sta	myDATA,x
	inx
	inx
	cpx	#16
	bcc	]lp

	jsl	GSOS
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
	adrl	$8029	; aux_type
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
	adrl	myFILE	; 4 - data_buffer
	adrl	SAVE_OUT-SAVE_IN	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	myFILE	; 4 - data_buffer (we are in same bank)
	adrl	SAVE_OUT-SAVE_IN	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'@/data/partie'

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
* DES DONNES 16-BITS
*-----------------------------------

*----------------------------------- Memory Manager

appID	ds	2
myID	ds	2
myDP	ds	2

ptrSCREEN	adrl	ptr012000	; l'Žcran actif

ptrUNPACK	adrl	$00000000	; 32k bank 2 - ptrUNPACK = ptrBACKGND
ptrBACKGND
ptrIMAGE	adrl	$00008000	; 32k

*----------------------------------- Quickdraw II

bramBORDER	ds	2
firmBORDER	ds	2

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

palette640	dw	$0000,$000F,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	dw	$0000,$0F00,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF

blackPATTERN	ds	32,$00
	ds	32,$11
	ds	32,$22
	ds	32,$33
	ds	32,$44
	ds	32,$55
	ds	32,$66
redPATTERN	ds	32,$77
	ds	32,$88
yellowPATTERN	ds	32,$99
	ds	32,$aa
cyanPATTERN	ds	32,$bb
	ds	32,$cc
	ds	32,$dd
	ds	32,$ee
whitePATTERN	ds	32,$ff

checkeredPATTERN
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0

curPATTERN	ds	32

curPENSIZE	ds	4

patternPtr	adrl	blackPATTERN ; pointer to pattern

leakTblPtr	dw	1
	dw	$0000	; color 0 is concerned

*--- Amtrad GFX chars

iconParamPtr
	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconToSourceLocInfo
	dw	$0000	; mode 320
	adrl	CHR254	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	4
	dw	0,0,8,8
	
iconToDestLocInfo
	dw	$0000	; mode 320
	adrl	ptr012000
	dw	160
	dw	0,0,199,319
	
iconToSourceRect
	dw	0,0,8,8
iconToDestPoint
	dw	0,0

*--- Fond

fondLocInfoPtr	dw	mode640
	ds	4
	dw	160
	dw	0,0,200,640

*----------------------------------- Error messages

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''

*----------------------------------- Tool Locator

ssREC	ds	4

*----------------------------------- GS/OS

proERR	ds	2	; GS/OS error code
proHANDLE	ds	4	; file handle

proOPEN	dw	12
	ds	2
	adrl	proOPEN
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

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	ds	4	; 4 - pointer
	ds	4	; 8 - length
	ds	4	; C - length read

proCLOSE	dw	1	; pcount
	ds	2	; ID

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*----------------------------------- Window Manager

mainPORT	ds	4

taskREC	ds	2	; wmWhat           +0
taskMESSAGE	ds	4	; wmMessage        +2
taskWHEN	ds	4	; wmWhen           +6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS	ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16
taskMASK	ds	4	; wmTaskMask       +20
taskLASTCLICK	ds	4	; wmTaskLastClick  +24
taskCLICKCOUNT	ds	2	; wmTaskClickCount +28
taskDATA2	ds	4	; wmTaskData2      +30
taskDATA3	ds	4	; wmTaskData3      +34
taskDATA4	ds	4	; wmTaskData4      +38
	
*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	midi.s
	put	engine.s
	put	introduction.s
	put	western.s
	put	en.s
	put	screen/cabane.s
	put	screen/chasseur.s
	put	screen/desert.s
	put	screen/gold.s
	put	screen/indien.s
	put	screen/jugement.s
	put	screen/montagne.s
	put	screen/pueblo.s
	put	screen/reno.s
	put	screen/sherif.s
	put	screen/trappeur.s
	put	screen/village.s
