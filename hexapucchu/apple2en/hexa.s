*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	mx	%00

	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/MidiSyn.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Sound.Macs
	use	4/Util.Macs

*-------------------------------
* EQUATES
*-------------------------------

FGDEBUG	=	$FFFF

appleKey	=	$0100
mouseDownEvt	=	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

mDownMask	=	$0002
mUpMask	=	$0004
keyDownMask	=	$0008

modeCopy	=	0
modeForeCopy	=	4

mode320	=	$00
mode640	=	$80

screen160	=	160
screen320	=	320
screen640	=	640

ptr012000	=	$012000
ptrE12000	=	$e12000

*-------------------------------

MAXCOLORS	=	27	; 0..26
MAXINK	=	16	; 0..15
MAXMODE	=	3	; 0..2

FIRSTROW	=	1
FIRSTCOLUMN	=	1

eEOD	=	0
eINK	=	1
ePAPER	=	2
ePEN	=	3
eLOCATE	=	4
eBORDER	=	5
eCLS	=	6
eMODE	=	7
eWAIT	=	8
eSOUND	=	9

*---

chrLA	=	$08
chrRET	=	$0d
chrRA	=	$15
chrESC	=	$1b
chrSPACE	=	$20
chrCOMMA	=	$2c
chrDEL	=	$7f
maxLEN	=	15

*-------------------------------
* EXTERNALS
*-------------------------------

	ext	squareWAVE
	ext	sinWAVE

*-------------------------------
* FIRMWARE
*-------------------------------

KBD	=	$c000
KBDSTROBE	=	$c010
RDVBLBAR	=	$c019
CLOCKCTL	=	$c034
BUTN0	=	$c061

GSOS	=	$e100a8

*-------------------------------
* MACROS
*-------------------------------

@DEBUG	mac
	DO	FGDEBUG
	cmp	#'0'
	bne	*+5
	jmp	DEBUG
	ELSE
	FIN
	<<<
	
@BORDER	mac
	lda	#]1
	jsr	BORDER
	<<<

@COUT	mac
	lda	#]1
	jsr	COUT
	<<<
	
@COUT160	mac
	lda	#]1
	jsr	COUT160
	<<<
	
@CLS	mac
	jsr	CLS
	<<<

@INK	mac
	ldx	#]1
	ldy	#]2
	jsr	INK
	<<<

@INKEY	mac
	jsr	INKEY
	<<<

@INPUT	mac
	jsr	INPUT
	<<<

@LOAD	mac
	lda	#]1
	jsr	LOAD
	<<<

@SHOWPIC	mac
	jsr	SHOWPIC
	<<<

@LOCATE	mac
	ldx	#]1
	ldy	#]2
	jsr	LOCATE
	<<<
	
@MODE	mac
	lda	#]1
	jsr	MODE
	<<<

@PAPER	mac
	lda	#]1
	jsr	PAPER
	<<<

@PEN	mac
	lda	#]1
	jsr	PEN
	<<<

@PRINT	mac
	lda	#]1
	jsr	PRINT
	<<<

@SOUND	mac
	ldx	#]1
	ldy	#]2
	lda	#]3	; optional
	jsr	SOUND
	<<<
	
*-------------------------------
* CODE
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

	lda	myDP
	clc
	adc	#256*1
	pha
	PushWord	#mode320
	PushWord	#0
	PushWord	myID
	_QDStartUp
	
*--- Change the border

	PushWord	#0
	PushWord	#$1c
	_ReadBParam
	pla
	sta	bramBORDER

	sep	#$30
	ldal	CLOCKCTL
	tax
	and	#$0F
	sta	firmBORDER
	txa
	and	#$F0
	stal	CLOCKCTL
	rep	#$30
	
	PushWord	#0
	PushWord	#$1c
	_WriteBParam

*---

	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2
	sta	iconToDestLocInfo+4
	
okSHADOW	_DeskStartUp
	
	lda	myDP
	clc
	adc	#256*4
	pha
	PushWord	#0
	PushWord	#0
	PushWord	#screen320
	PushWord	#0
	PushWord	#200
	PushWord	myID
	_EMStartUp

	_GrafOn
	_IMStartUp
	_QDAuxStartUp

*--- Sound Tool Set

	lda	myDP
	clc
	adc	#256*5
	pha
	_SoundStartUp
	bcc	okSOUND

	inc	fgSOUND	; no sound

okSOUND

*--- Ask for 2*64K

	jsr	make64KB
	bcc	okMEM

koMEM	pha
	PushLong	#memSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	bra	QUIT

okMEM	sty	ptrUNPACK
	stx	ptrUNPACK+2

	jsr	make64KB
	bcs	koMEM
	
	sty	ptrIMAGE
	stx	ptrIMAGE+2
	
*--- Flush everything

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

	pha
	pha
	_GetPort
	PullLong	mainPORT

	PushLong	mainPORT
	_SetPort

*--- THE GAME

	jsr	initMIDI
	jsr	doMUSIK

	ldal	BUTN0-1
	bpl	playGAME
	jmp	DEBUG
playGAME	jmp	DISC
	
*--- THE EXIT

QUIT	lda	fgSOUND
	bne	QUIT1
	_SoundShutDown

QUIT1	jsr	stopMIDI

	_QDAuxShutDown
	_IMShutDown
	_EMShutDown
	_DeskShutDown
	_QDShutDown
	
	PushWord	bramBORDER
	PushWord	#$1c
	_WriteBParam

	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	firmBORDER
	stal	CLOCKCTL
	rep	#$20

	_MTShutDown
	
	PushWord	myID
	_DisposeAll
	PushWord	appID
	_DisposeAll
	PushWord	appID
	_MMShutDown

	_TLShutDown
	
	jsl	GSOS
	dw	$2029
	adrl	proQUIT
	
	brk	$bd

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

*-------------------------------
* DATA
*-------------------------------

myDP	ds	2
appID	ds	2
myID	ds	2

mainPORT	ds	4

bramBORDER	ds	2
firmBORDER	ds	2
fgSOUND	ds	2

ptrUNPACK	ds	4
ptrIMAGE	ds	4
ptrSCREEN	adrl	ptr012000

*-------------------------------

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''

*-------------------------------

taskREC	ds	2	; wmWhat           +0
taskMESSAGE	ds	4	; wmMessage        +2
taskWHEN	ds	4	; wmWhen           +6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS	ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16

*-------------------------------

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

*-------------------------------
* OTHER FILES
*-------------------------------

	put	midi.s
	put	engine.s
	put	screen/debug.s		; debug menu
	put	screen/disc.s		; 1
	put	screen/plage.s		; 2
	put	screen/mort.s		; 3
	put	screen/rouage.s		; 4
	put	screen/environs.s	; 5
	put	screen/cascade.s	; 6
	put	screen/jungle.s		; 7
	put	screen/grotte1.s	; 8
	put	screen/grotte2.s	; 9
	put	screen/grotte3.s	; 10
	put	screen/grotte4.s	; 11
	put	screen/grotte5.s	; 12
	put	screen/grotte6.s	; 13
	put	screen/nature1.s	; 14
	put	screen/nature2.s	; 15
	put	screen/saut.s		; 16
	put	screen/inca1.s		; 17
	put	screen/piano.s		; 18
	put	screen/orifices.s	; 19
	put	screen/fresque.s	; 20
	put	screen/poulie.s		; 21
	put	screen/cpc.s		; 22
	put	screen/corniche.s	; 23
	put	screen/trou.s		; 24
	put	screen/disco.s		; 25
	put	screen/epilogue.s	; 26
	