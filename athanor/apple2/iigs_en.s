*
* Athanor
*
* (c) 2014, Safar Games
* (c) 2025, Brutal Deluxe Software
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
*
*-----------------------------------

auxGAME	=	$802B

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
	use	4/Util.Macs
	use	4/Window.Macs
	
*-----------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
VERTCNT	=	$e0c02e
CLOCKCTL	=	$e0c034
BUTN0	=	$e0c061
GSOS	=	$e100a8

*-----------------------

Debut	=	$00
Arrivee	=	Debut+4

dpFROM	=	$80
dpTO	=	dpFROM+4
dpTHREE	=	dpTO+4
dpFOUR	=	dpTHREE+4

*-----------------------

refIsPointer	=	$0
refIsHandle	=	$1
refIsResource	=	$2

appleKey	=	$0100
mouseDownEvt	=	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

mDownMask	=	$0002
mUpMask	=	$0004
keyDownMask	=	$0008

*-----------------------

modeCopy	=	$0000
modeOr	=	$0001
modeForeCopy	=	$0004	; QDII Table 16-10

mode320	=	$00
mode640	=	$80

screen160	=	160
screen320	=	320
screen640	=	640

ptr012000	=	$012000
ptrE12000	=	$e12000

*-----------------------

TRUE	=	1
FALSE	=	0

*-----------------------------------
* DU 16-BITS
*-----------------------------------

ICI	phk
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

*	lda	#F%
*	stal	$300
*	lda	#^F%
*	stal	$302
	
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

okMEM1	sty	ptrTEXT
	stx	ptrTEXT+2
	stx	ptrBACKGND+2

*-----------------------

	jsr	make64KB
	bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
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

	PushLong	#0
	PushWord	#5	; SetDeskPat
	PushWord	#$4000
	PushWord	#$0000
	_Desktop
	pla
	pla

*--- Change the border

	PushWord	#0
	PushWord	#$1c
	_ReadBParam
	pla
	sta	bramBORDER

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

	PushWord	#modeCopy
	_SetTextMode

	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	fillLocInfoPtr+4
	sta	ptrSCREEN+2
	
okSHADOW

*-----------------------------------
* C'EST L'HEURE DE JOUER
*-----------------------------------

	lda	#-1
	jsr	fadeOUT	; fadeout + clear screen

	lda	#pTITRE	; load title
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	loadFILE
	bcs	noTITRE

	sep	#$30
	ldal	CLOCKCTL
	tax
	and	#$0F
	sta	firmBORDER
	txa
	and	#$F0
	ora	#$05	; dark grey
	stal	CLOCKCTL
	rep	#$30
	
	lda	#-1
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	fadeIN

noTITRE	jsr	initMIDI	; init music
	bcs	noZIKMU
	jsr	loadINTRO	; load muzik if ok

noZIKMU	jsr	doINTRO
	
	php
	sei
	PushLong	#intTIME
	_SetHeartBeat
	plp
	jmp	PLAY

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	rep	#$30
	jsr	stopMIDI

	php
	sei
	PushLong	#intTIME
	_DelHeartBeat
	plp
	
meQUIT	PushWord	#refIsHandle
	PushLong	ssREC
	_ShutDownTools

meQUIT1	PushWord	bramBORDER
	PushWord	#$1c
	_WriteBParam

	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	firmBORDER
	stal	CLOCKCTL
	rep	#$20

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
* LOAD/SAVE
*-----------------------------------

*----------------------------------- Open

doLOAD	sep	#$20
	sta	pGAME+10
	rep	#$20

	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	loadKO99

	lda	proOPENGAME+2
	sta	proREADGAME+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME

loadKO99	php

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	plp
	rts

*----------------------------------- Save

doSAVE	sep	#$20
	sta	pGAME+10
	rep	#$20

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
	bcs	saveKO98

	lda	proOPENGAME+2
	sta	proWRITEGAME+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME

saveKO98	php

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
	adrl	auxGAME	; aux_type
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
	adrl	DATA_IN	; 4 - data_buffer
	adrl	DATA_OUT-DATA_IN	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	DATA_IN	; 4 - data_buffer (we are in same bank)
	adrl	DATA_OUT-DATA_IN	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'@/Partie0'

*------------------------------
* UNPACK LZ4 FILE
*------------------------------

* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrIMAGE: temp unpack zone
*
* Entry:
*  A: packed data size
* XY: points to destination address
*     if 0, keep ptrIMAGE
*
* Exit:
*  lenDATA: unpacked data size
*

unpackLZ4	sta	LZ4_Limit+1
	sty	LZ4_pointer
	stx	LZ4_pointer+2
	sep	#$20

	lda	ptrUNPACK+2		; Source
	sta	LZ4_Literal_3+2
	sta	LZ4_ReadToken+3
	sta	LZ4_Match_1+3
	sta	LZ4_GetLength_1+3

	lda	ptrIMAGE+2		; Destination
	sta	LZ4_Literal_3+1
	sta	LZ4_Match_5+1
	sta	LZ4_Match_5+2

	rep	#$20

*--

	ldy	#0	; Init Target unpacked Data offset
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

*--- Patch for color 2...

	lda	ptrIMAGE
	sta	Debut
	lda	ptrIMAGE+2
	sta	Debut+2
	
	ldy	#$7e04	; color 2 of palette 0
	lda	#$0800	; new brown
	sta	[Debut],y

*--- pas bien le patch en dur...

	lda	LZ4_pointer
	ora	LZ4_pointer+2
	bne	LZ4_copy
	rts

LZ4_copy	PushLong	ptrIMAGE	; the best place
	PushLong	LZ4_pointer	; to save picture
	PushLong	LZ4_length
	_BlockMove
	rts

*--- Data

LZ4_pointer	ds	4
LZ4_length	ds	4

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
	
	lda	proEOF
	clc
	rts
	
loadERR	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadERR99	sec
	rts

*-----------------------------------
* ROUTINE TEMPS (MERCI THE TINIES)
*-----------------------------------

	mx	%11
	
intTIME	ds	4
	dw	60
	dw	$a55a

	rep	#$30
	
	lda	#60
	stal	intTIME+4

	ldal	SECONDES
	inc
	stal	SECONDES

	sep	#$30
	clc
	rtl

*--- Data

SECONDES	ds	2

	mx	%00

*-----------------------------------
* DES DONNES 16-BITS
*-----------------------------------

*----------------------------------- Files

pTITRE	strl	'8/data/titre'
temp	ds	2

*----------------------------------- Memory Manager

appID	ds	2
myID	ds	2
myDP	ds	2

bramBORDER	ds	2
firmBORDER	ds	2
fgSOUND	ds	2

ptrSCREEN	adrl	ptr012000	; l'Žcran actif

ptrTEXT	adrl	$00000000	; 32k bank 1
ptrBACKGND	adrl	$00008000	; 32k
ptrUNPACK	adrl	$00000000	; 32k bank 2
ptrIMAGE	adrl	$00008000	; 32k

*----------------------------------- Quickdraw II

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

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	engine.s
	put	midi.s
	put	athanor_en.s

	putbin	bin/CHEM0007.BIN
	putbin	bin/CHEM0102.BIN
CHEM0102	putbin	bin/CHEM0306.BIN
	putbin	bin/CHEM0405.BIN

*--- It's the end

