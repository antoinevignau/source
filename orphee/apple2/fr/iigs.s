*
* Orphee
*
* (c) 1985, Laurent Benes & Loriciels
* (c) 2024, Brutal Deluxe Software (Apple II)
*

* Les accents (encore et toujours)
*
* à	88
* â	89
* ç	8d
* é	8e
* è	8f
* ê	90
* ë	91
* î	94
* ï	95
* ô	99
* ù	9d
* û	9e
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
chrDELETE	=	$7f
chrEOT	=	$fe

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

	tdc
	sta	myDP

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID

	lda	#showPIC
	stal	$300
	lda	#^showPIC
	stal	$302
	
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

	PushWord	#0
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
	sta	srcLocInfoPtr+4
	sta	ptrSCREEN+2
	
okSHADOW

*-----------------------------------
* IL FAUT JOUER MAINTENANT
*-----------------------------------

	jsr	initMIDI
	jsr	doSOUNDON
	jmp	PLAY

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	rep	#$30
	jsr	stopMIDI

meQUIT	PushWord	#refIsHandle
	PushLong	ssREC
	_ShutDownTools

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

	mx	%00
	
doLOAD	sta	pGAME+10
	rep	#$30

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
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadKO99	sep	#$30
	rts

*----------------------------------- Save

	mx	%00

doSAVE	sta	pGAME+10
	rep	#$30

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
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

saveKO99	sep	#$30
	rts

	mx	%00
	
*--- For the game party

proCREATEGAME
	dw	7	; pcount
	adrl	pGAME	; pathname
	dw	$c3	; access_code
	dw	$5d	; file_type
	adrl	$8020	; aux_type
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
	adrl	A1	; 4 - data_buffer
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	A1	; 4 - data_buffer (we are in same bank)
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'1/Partie0'

*-----------------------------------
* DES DONNES 16-BITS
*-----------------------------------

*----------------------------------- Memory Manager

appID	ds	2
myID	ds	2
myDP	ds	2

ptrSCREEN	adrl	ptr012000	; l'écran actif

ptrTEXT	adrl	$00000000	; 32k bank 1
ptrBACKGND	adrl	$00008000	; 32k
ptrUNPACK	adrl	$00000000	; 32k bank 2
ptrIMAGE	adrl	$00008000	; 32k

*----------------------------------- Quickdraw II

* INK	GATE ARRAY	Couleurs
* Decimal	Hexa	Decimal	Hexa
* 0	&00	 20	&14	Noir	 	#000000
* 1	&01	 4	&04	Bleu	 	#000055
* 2	&02	 21	&15	Bleu vif	 	#0000FF 
* 3	&03	 28	&1C	Rouge	 	#6D0000 
* 4	&04	 24	&18	Magenta	 	#6D0055 
* 5	&05	 29	&1D	Mauve	 	#6D00FF 
* 6	&06	 12	&0C	Rouge vif	 	#FF0000 
* 7	&07	 5	&05	Pourpre	 	#FF0055 
* 8	&08	 13	&0D	Magenta vif	 	#FF00FF 
* 9	&09	 22	&16	Vert	 	#006D00 
* 10	&0A	 6	&06	Turquoise	 	#006D55 
* 11	&0B	 23	&17	Bleu ciel	 	#006DFF 
* 12	&0C	 30	&1E	Jaune	 	#6D6D00 
* 13	&0D	 0	&00	Blanc	 	#6D6D55 
* 14	&0E	 31	&1F	Bleu pastel	 	#6D6DFF 
* 15	&0F	 14	&0E	Orange	 	#FF6D00 
* 16	&10	 7	&07	Rose	 	#FF6D55 
* 17	&11	 15	&0F	Magenta pastel	#FF6DFF 
* 18	&12	 18	&12	Vert vif	 	#00FF00 
* 19	&13	 2	&02	Vert marin	 	#00FF55 
* 20	&14	 19	&13	Turquoise vif	#00FFFF 
* 21	&15	 26	&1A	Vert citron	 	#6DFF00 
* 22	&16	 25	&19	Vert pastel	 	#6DFF55 
* 23	&17	 27	&1B	Turquoise pastel	#6DFFFF 
* 24	&18	 10	&0A	Jaune vif	 	#FFFF00 
* 25	&19	 3	&03	Jaune pastel	#FFFF55 
* 26	&1A	 11	&0B	Blanc brilliant	#FFFFFF 
* 27	&1B	1	&01	 	 	#6D6D55 
* 28	&1C	8	&08	 	 	#FF0055 
* 29	&1D	9	&09	 	 	#FFFF55 
* 30	&1E	16	&10	 	 	#000055 
* 31	&1F	17	&11	 	 	#00FF55 

*----------------------------------- Error messages

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''

*----------------------------------- Tool Locator

ssREC	ds	4
fgSOUND	ds	2

*----------------------------------- GS/OS

proERR	ds	2	; GS/OS error code

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
taskMODIFIERS ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	orphee.s
	put	engine.s
	put	fr.s
	put	midi.s
	
*--- It's the end
