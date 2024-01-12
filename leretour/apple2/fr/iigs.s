*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
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
	
*-----------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
VERTCNT	=	$e0c02e
GSOS	=	$e100a8

*-----------------------

dpFROM	=	$80
dpTO	=	dpFROM+4
dpTHREE	=	dpTO+4
dpFOUR	=	dpTHREE+4

dpCOL1	=	$90
dpCOL2	=	dpCOL1+1
dpPX	=	dpCOL2+1
dpBK	=	dpPX+1

*-----------------------

refIsPointer =	$0
refIsHandle	=	$1
refIsResource =	$2

appleKey	=	$0100
mouseDownEvt =	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

*-----------------------

modeCopy	=	$0000
modeForeCopy =	$0004	; QDII Table 16-10

mode320	=	$00
mode640	=	$80

maxX	=	320
maxY	=	200

maxTCOLUMN	=	40
maxTROW	=	19

charHEIGHT	=	10
charWIDTH	=	8

row0	=	charHEIGHT-2	; 9 - 1 partout...
row1	=	row0+charHEIGHT	; 19
row2	=	row1+charHEIGHT	; 29
row3	=	row2+charHEIGHT	; 39
row4	=	row3+charHEIGHT	; 49
row5	=	row4+charHEIGHT	; 59
row6	=	row5+charHEIGHT	; 69
row7	=	row6+charHEIGHT	; 79
row8	=	row7+charHEIGHT	; 89
row9	=	row8+charHEIGHT	; 99
row10	=	row9+charHEIGHT	; 109
row11	=	row10+charHEIGHT	; 119
row12	=	row11+charHEIGHT	; 129
row13	=	row12+charHEIGHT	; 139
row14	=	row13+charHEIGHT	; 149
row15	=	row14+charHEIGHT	; 159
row16	=	row15+charHEIGHT	; 169
row17	=	row16+charHEIGHT	; 179
row18	=	row17+charHEIGHT	; 189
row19	=	row18+charHEIGHT	; 199

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
* C'EST L'HEURE DE L'INTRODUCTION
*-----------------------------------

	jsr	intro

*-----------------------------------
* IL FAUT JOUER MAINTENANT
*-----------------------------------

	lda	fgINTRO
	bne	okZIKMU
	
	jsr	initMIDI
	jsr	doSOUNDON
	
okZIKMU	sei
	PushLong	#intTIME
	_SetHeartBeat
	cli
	jmp	PLAY

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	rep	#$30
	jsr	stopMIDI

	sei
	PushLong	#intTIME
	_DelHeartBeat
	cli
	
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

pGAME	strl	'1/Partie0'	; +10 pour la partie

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

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

palette640	dw	$0000,$000F,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	dw	$0000,$0F00,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	
blackPATTERN ds	32,$00
	ds	32,$11
	ds	32,$22
	ds	32,$33
	ds	32,$44
	ds	32,$55
	ds	32,$66
redPATTERN	ds	32,$77
	ds	32,$88
yellowPATTERN ds	32,$99
	ds	32,$aa
cyanPATTERN	ds	32,$bb
	ds	32,$cc
	ds	32,$dd
	ds	32,$ee
whitePATTERN ds	32,$ff

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

	put	leretour.s
	put	engine.s
	put	introcode.s
	put	fr.s
	put	midi.s
	put	images.s
	
*--- It's the end

