*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	lst	off
	rel
	dsk	iigs.l
	
	mx	%00
	xc
	xc

*-----------------------------------
* MACROS
*-----------------------------------

	use	4/Event.Macs
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

	lda	#fgMIDI
	stal	$300
	lda	#^fgMIDI
	stal	$302
	
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
	PushWord	#refIsPointer
	PushLong	#toolTBL
	_StartUpTools
	PullLong ssREC
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
	jsr	initMIDI
	jsr	doSOUNDON

*-----------------------------------
* IL FAUT JOUER MAINTENANT
*-----------------------------------

	jmp	PLAY

*-----------------------------------
* AU REVOIR LE IIGS
*-----------------------------------

QUIT	rep	#$30
	jsr	stopMIDI
	
meQUIT	PushWord #refIsPointer
	PushLong ssREC
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
	PushLong	#ptrE12000
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
	PushLong	#ptrE12000
	PushLong	#32768
	_BlockMove
	_ShowCursor
	rts

*-----------------------------------
* LOAD/SAVE
*-----------------------------------

*----------------------------------- Open

doLOAD	rep	#$30
	jsr	doSOUNDOFF
	rep	#$30
	jsr	saveBACK
	
	PushWord #30
	PushWord #43
	PushLong #strLOADFILE
	PushLong #0
	PushLong #typeLIST
	PushLong #replyPTR
	_SFGetFile

	jsr	loadBACK
	jsr	doSOUNDON
	rep	#$30
	
	lda	replyPTR
	bne	doLOAD1
	rts

doLOAD1	jsr	copyPATH
	jsr	loadALL
	sep	#$30
	rts

	mx	%
	
*----------------------------------- Save

doSAVE	rep	#$30
	jsr	doSOUNDOFF
	rep	#$30
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
	jsr	doSOUNDON
	rep	#$30
	
	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1	jsr	copyPATH
	jsr	saveALL
	sep	#$30
	rts

*--- Recopie le filename du fichier de sauvegarde

	mx	%00
	
copyPATH	sep	#$20
	ldx	#16-1
]lp	lda	namePATH1,x
	sta	pGAME+4,x
	dex
	bpl	]lp
	
	lda	namePATH
	inc
	inc
	sta	pGAME
	rep	#$20
	rts

*--- Charge le fichier de sauvegarde en mémoire

loadALL	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	loadKO99

	lda	proOPENGAME+2
	sta	proREADGAME+2
	sta	proCLOSE+2
	
	jsr	loadPART
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadKO99	rts

*---

loadPART	ldx	#FIN_DATA-DEBUT_DATA
	ldy	#A1
	
loadIT	stx	proREADGAME+8
	sty	proREADGAME+4
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME
	rts

*--- Enregistre le fichier de sauvegarde

saveALL	jsl	GSOS
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
	
	jsr	savePART
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

saveKO99	rts

*---

savePART	ldx	#FIN_DATA-DEBUT_DATA
	ldy	#A1
	
saveIT	stx	proWRITEGAME+8
	sty	proWRITEGAME+4
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME
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
	adrl	pGAME	; 4 - data_buffer
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	pGAME	; 4 - data_buffer (we are in same bank)
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

pGAME	strl	'0/               '

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
	ds	32,$77
	ds	32,$88
	ds	32,$99
	ds	32,$aa
	ds	32,$bb
	ds	32,$cc
	ds	32,$dd
	ds	32,$ee
whitePATTERN ds	32,$ff

curPATTERN	ds	32

*----------------------------------- Error messages

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''

*----------------------------------- Tool Locator

ssREC	ds	4

toolTBL	dw	$0000	; flags
	dw	$C000	; videoMode (shadowing + fast port)
	dw	$0000	; resFileID
	ADRL	$00000000	; dPageHandle
	dw	$0011
	dw	$0003	; Miscellaneous Tool
	dw	$0300
	dw	$0004	; QuickDraw II
	dw	$0301
	dw	$0005	; Desk Manager
	dw	$0302
	dw	$0006	; Event Manager
	dw	$0300
	dw	$0008	; Sound Tool Set
	dw	$0100
	dw	$000B	; Integer Math Tool Set
	dw	$0200
	dw	$000E	; Window Manager
	dw	$0301
	dw	$000F	; Menu Manager
	dw	$0301
	dw	$0010	; Control Manager
	dw	$0301
	dw	$0012	; QuickDraw II Auxiliary
	dw	$0301
	dw	$0014	; LineEdit Tool Set
	dw	$0301
	dw	$0015	; Dialog Manager
	dw	$0301
	dw	$0016	; Scrap Manager
	dw	$0300
	dw	$0017	; Standard File Tool Set
	dw	$0301
	dw	$001B	; Font Manager
	dw	$0301
	dw	$001C	; List Manager
	dw	$0301
	dw	$001E	; Resource Manager
	dw	$0100

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

*----------------------------------- Standard File Tool Set

strLOADFILE	str	'Charger quelle partie ?'
strSAVEFILE	str	'Enregistrer sous...'

typeLIST	hex	01
	hex	5d	; Game/Edu files

replyPTR	ds	2	; 0 good
	ds	2	; 2 fileType
	ds	2	; 4 auxFileType
namePATH	hex	06	; 6 fileName
namePATH1	asc	'Partie'	; 7 fileName (16 normally)
	ds	9

loadPATH	ds	1	; 22 fullPathname (string length)
loadPATH1	ds	129	; 23 fullPathname (128 normally)

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

	put	leretour.s
	put	engine.s
	put	fr.s
	put	../common/midi.s
	put	../common/images.s
	
*--- It's the end

