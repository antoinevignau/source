*
* Le cimetière des ocelots
*
* (c) 2026, Turk182
* (c) 2026, Brutal Deluxe Software
*

	mx	%00

	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Font.Macs
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
modeOr	=	1
modeForeCopy	=	4

mode320	=	$00
mode640	=	$80

screen160	=	160
screen320	=	320
screen640	=	640

ptr012000	=	$012000
ptrE12000	=	$e12000

*---

chrNULL	=	$00
chrLA	=	$08
chrRET	=	$0d
chrRETURN	=	$0d
chrRET2	=	$8d
chrRA	=	$15
chrESC	=	$1b
chrSPACE	=	$20
chrSPACE2	=	$a0
chrSPC          =               $20
chrSPC2	=               $a0
chrCOMMA	=	$2c
chrCOMMA2	=	$ac
chrDEL	=	$7f
chrDEL2	=	$ff

chrYES	=	'O'	; FR
chrNO	=	'N'

TRUE	=	1
FALSE	=	0

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

dpDATA	=	Third+4
dpREAD	=	dpDATA+4
dpINSTR1	=	dpREAD+4
dpINSTR2	=	dpINSTR1+4

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
	
*--- Get the border

	PushWord	#0
	PushWord	#$1c
	_ReadBParam
	pla
	sta	bramBORDER

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

*--- Font Tool Set

	PushWord	myID
	lda	myDP
	clc
	adc	#256*5
	pha
	_FMStartUp
	
*--- Sound Tool Set

	lda	myDP
	clc
	adc	#256*6
	pha
	_SoundStartUp
	bcc	okSOUND

	inc	fgSOUND	; no sound

okSOUND

*--- Randomize me`

	PushLong	#117117
	_SetRandSeed

*--- Ask for 64K

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

okMEM	sty	ptrIMAGE
	sty	levelToSourceLocInfo+2	; for the level data
	stx	ptrIMAGE+2		; from 2-bit to 4-bit
	stx	levelToSourceLocInfo+4

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
	jsr	INTRO
	jmp	GAME
	
*--- THE EXIT

QUIT	lda	fgSOUND
	bne	QUIT1
	_SoundShutDown

QUIT1	jsr	stopMIDI

	_FMShutDown
	_QDAuxShutDown
	_IMShutDown
	_EMShutDown
	_DeskShutDown
	_QDShutDown
	
	sep	#$20
	ldal	CLOCKCTL
	and	#$F0
	ora	bramBORDER
	stal	CLOCKCTL
	rep	#$20

	PushWord	bramBORDER
	PushWord	#$1c
	_WriteBParam

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

*------------------------------
* LOAD LEVEL
*------------------------------

loadLEVEL	pha
	PushLong	#pLVL
	PushWord	#2
	PushWord	#FALSE
	_Int2Dec

	lda	pLVL
	ora	#'00'
	sta	pLEVEL+10

	jsl	GSOS
	dw	$2010
	adrl	proOPENLEVEL
	bcs	loadlevelKO99

	lda	proOPENLEVEL+2
	sta	proREADLEVEL+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADLEVEL

	php
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	plp
loadlevelKO99	bcs	loadlevelINIT
	rts
loadlevelINIT	ldx	#0
]lp	stz	ptrLEVEL,x
	inx
	inx
	cpx	#3840
	bcc	]lp
	clc
	rts

*---

proOPENLEVEL	dw	2
	ds	2
	adrl	pLEVEL

proREADLEVEL	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	ptrLEVEL	; 4 - data_buffer
	adrl	3840	; 8 - request_count
	ds	4	; C - transfer_count

pLVL	asc	'00'
pLEVEL	strl	'@/data/L00.BIN'	; +10

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
loadKO99	rts

*------------------------------
* SAVE PARTIE
*------------------------------

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
	adrl	$802d	; aux_type
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
	adrl	SAVE_IN	; 4 - data_buffer
	adrl	SAVE_OUT-SAVE_IN	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	SAVE_IN	; 4 - data_buffer (we are in same bank)
	adrl	SAVE_OUT-SAVE_IN	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'@/partie0'

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

	put	cimetiere.s
	put	engine.s
	put	midi.s
	put	fr.s
	put	tables.s

ptrLEVEL	ds	3840
