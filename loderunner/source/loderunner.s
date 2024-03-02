*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%00

*----------------------------------- Macros

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Scrap.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/TextEdit.Macs
	use	4/Util.Macs
	use	4/Window.Macs

	use	LR.EQUATES
	
*----------------------------------- Constantes

	ext	ptrLEVELS
	ext	ptrSCORES
	ext	HGR2

	ext	sndBANK1
	ext	sndINTRO

*-------------- Softswitches

GSOS	=	$e100a8

*-------------- GUI

refIsPointer =	0
refIsHandle	=	1
refIsResource =	2

keyDownEvt	=	$0003

ptr012000	=	$012000
ptrE12000	=	$e12000

*---

TRUE	=	255
FALSE	=	0

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

*--- Chargement des outils

	pha
	pha
	PushWord	myID
	PushWord	#refIsResource
	PushLong	#1
	_StartUpTools
	PullLong	SStopREC
	bcc	okTOOL
	
	pha
	PushLong	#tolSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*--- Test default shadowing...

okTOOL	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2
	
*--- Et la musique...

okSHADOW	pha
	_SoundToolStatus
	pla
	beq	noSOUND

	lda	#1
	sta	fgSND

noSOUND	_HideMenuBar
	_InitCursor
	_HideCursor

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

*	PushLong	#0
*	PushWord	#5	; SetDeskPat
*	PushWord	#$4000
*	PushWord	#$0000
*	_Desktop
*	pla
*	pla

*----------------------------------- Exit point

	ldx	#256-2	; efface la page directe
]lp	stz	$00,x
	dex
	dex
	bpl	]lp

	jsr	find4PLAY	; do we have a 4play?
	jsr	initSOUND	; init sound tool set & friends
	jsr	setNATIVE	; exit 8-bit
	rep	#$30

*---

	jsr	loadLEVELS	; exit 8-bit

	mx	%11

	lda	#refSPEED	; try to slow it down a bit
	sta	theSPEED

	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	brl	theGAME

	mx	%00	; The 16-bit world

*-----------------------------------
* AUTRES ROUTINES
*-----------------------------------

*----------------------------------- Open LEVELS

doLOAD	clc
	xce
	rep	#$30
	_ShowCursor
	
	PushWord	#30
	PushWord	#43
	PushLong	#strLOADFILE
	PushLong	#0
	PushLong	#typeLIST
	PushLong	#replyPTR
	_SFGetFile

	_HideCursor

	lda	replyPTR
	bne	doLOAD1
	sep	#$30
	sec
	rts

	mx	%00

doLOAD1	jsr	copyPATH

loadLEVELS	clc
	xce
	rep	#$30
	
	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	loadLEVELS9

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD
	php

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	plp
	bcs	loadLEVELS9
	sep	#$30
	clc
	rts
	
	mx	%00

loadLEVELS9	rep	#$30

	ldx	#0	; clear all levels
	txa
]lp	stal	ptrLEVELS,x
	inx
	inx
	cpx	#38400	; 150 x 256
	bcc	]lp
	
	ldx	#256-2
]lp	lda	scoreEMPTY,x
	sta	scorebuf,x
	stal	ptrSCORES,x
	dex
	dex
	bpl	]lp

	sep	#$30
	sec
	rts

	mx	%00

*----------------------------------- Save

doSAVE	clc
	xce
	rep	#$30
	_ShowCursor
	
	PushWord	#25
	PushWord	#36
	PushLong	#strSAVEFILE
	PushLong	#namePATH
	PushWord	#15
	PushLong	#replyPTR
	_SFPutFile

	_HideCursor
	
	lda	replyPTR
	bne	doSAVE1
	sep	#$30
	sec
	rts

	mx	%00
	
doSAVE1	jsr	copyPATH

saveLEVELS	clc
	xce
	rep	#$30
	
	jsl	GSOS
	dw	$2002
	adrl	proDESTROY
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATE
	bcs	doSAVE99

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	doSAVE99

	lda	proOPEN+2
	sta	proWRITE+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITE
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	sep	#$30
	clc
	rts
doSAVE99	sep	#$30
	sec
	rts

	mx	%00

*--- Recopie le filename du fichier de sauvegarde

copyPATH	sep	#$20
	ldx	#16-1
]lp	lda	namePATH1,x
	sta	pLEVELS+4,x
	dex
	bpl	]lp
	
	lda	namePATH
	inc		; add 2 chars
	inc		; for '0/'
	sta	pLEVELS
	rep	#$20
	rts

	mx	%00

*----------------------------------- Quit

meQUIT	rep	#$30

	jsr	stopSOUND

	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1	PushWord myID
	_DisposeAll

	PushWord mainID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

*----------------------------------------
* SET VINTAGE/NATIVE MODE
*----------------------------------------

	mx	%00

setVINTAGE	rep	#$30
	jsr	setSTDPALETTE ; set the LR palette
	lda	#1	; no speaker sound
	ldx	#tblSPRITES
	ldy	#$4444
	bra	setMODE
	
setNATIVE	rep	#$30
	jsr	setLRPALETTE ; set the LR palette
	lda	#0	; no speaker sound
	ldx	#tblSPRITES2
	ldy	#$bbbb
	
setMODE	stx	patchSPR1+1	; the sprites table
	stx	patchSPR2+1
	stx	patchSPR3+1
	sty	fondFRAME	; the border color
	sep	#$30
	sta	fgSOUND	; the sound mode
	rts

*---

fondFRAME	dw	$4444	; HGR: $4444, SHR: $BBBB

*----------------------------------------
* SET STANDARD 320 PALETTE
*----------------------------------------

	mx	%00

setSTDPALETTE
	PushWord	#0
	PushLong	#palette320
	_SetColorTable
	rts

*----------------------------------------
* SET LODE RUNNER 320 PALETTE
*----------------------------------------

	mx	%00

setLRPALETTE
	PushWord	#0
	PushLong	#paletteLR
	_SetColorTable
	rts

*----------------------------------------
* CHECK KEY PRESSED
*----------------------------------------

	mx	%00

checkKEY	phx
	phy
	rep	#$30

	pha
	PushWord #%00000000_00001000
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	checkNOKEY

	lda	taskREC	; une touche ?
	cmp	#keyDownEvt
	bne	checkNOKEY

	sep	#$30
	ply
	plx
	lda	taskMESSAGE
	ora	#%1000_0000	; set bit 7
	rts

	mx	%00
	
checkNOKEY	sep	#$30
	ply
	plx
	lda	#0
	rts

	mx	%00

*----------------------------------------
* 4PLAY
*----------------------------------------

find4PLAY	sep	#$30
	stz	slot4PLAY

	ldx	#$10
]lp	ldal	$e0c080,x
	cmp	#fpDFTVALUE
	bne	next4PLAY
	ldal	$e0c081,x
	cmp	#fpDFTVALUE
	bne	next4PLAY
	ldal	$e0c082,x
	cmp	#fpDFTVALUE
	bne	next4PLAY
	ldal	$e0c083,x
	cmp	#fpDFTVALUE
	beq	found4PLAY

next4PLAY	txa
	clc
	adc	#$10
	tax
	cpx	#$80	; until slot 8
	bcc	]lp
	rep	#$30
	rts

	mx	%11
	
found4PLAY	txa		; set 4PLAY slot
	ora	#$80	; 10=>90, 20=>A0, 30=>B0...
	sta	read4PLAY+1
	rep	#$30
	rts

*----------------------------------------

	mx	%11
	
read4PLAY	ldal	$e0C080	; direct "fast" read
	sta	the4PLAY
	rts

	mx	%00

*----------------------------------------
* UNPACK LOGO
*----------------------------------------

	mx	%11
	
unpackLOGO	rep	#$30

	lda	ptrSCREEN
	sta	startHandle
	lda	ptrSCREEN+2
	sta	startHandle+2
	
	lda	#32000
	sta	sizePtr

	PushWord	#0
	PushLong	#logo
	lda	#logo_fin-logo
	pha
	PushLong	#startHandle
	PushLong	#sizePtr
	_UnPackBytes
	pla
	sep	#$30
	rts

*---

startHandle	adrl	ptr012000
sizePtr	dw	32000

*----------------------------------------
* SOUND EFFECTS
*----------------------------------------

	mx	%00
	
initSOUND	sei
	PushLong	#0
	PushWord	#11
	_GetVector
	PullLong	sndVECTOR

	PushWord	#11
	PushLong	#sndINTERRUPT
	_SetVector
	cli
	rts

*--------- Remove the vector

stopSOUND	sei
	PushWord	#11
	PushLong	sndVECTOR
	_SetVector
	cli
	rts

*---------

sndVECTOR	ds	4

*---------- Sound interrupt

	mx	%11
	
sndINTERRUPT
	ldal	fgSND
	oral	noINTERRUPT
	beq	sndINTERRUPT1
	clc
	rtl

sndINTERRUPT1
]lp	ldal	SOUNDCTL
	bmi	]lp
	and	#%1001_1111
	stal	SOUNDCTL

	lda	#1	; oscillo 2 w/interrupt
	stal	noINTERRUPT
	clc
	rtl
	
*--- Data

noINTERRUPT	dw	1

*---------- Load & Prepare the sound intro effect

	mx	%11

playINTRO	lda	fgSND
	beq	playINTRO1
	rts

playINTRO1	rep	#$10
	sei
	
	ldal	IRQ_VOLUME
	ora	#%0110_0000
	stal	SOUNDCTL

	lda	#0
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldx	#0
]lp	ldal	sndINTRO,x
	stal	SOUNDDATA
	inx
	bpl	]lp

*--- Config oscillos now

	ldal	IRQ_VOLUME
	and	#%0000_1111
	stal	SOUNDCTL

	ldy	#0	; frequency low
	stal	SOUNDADRL
	lda	#$d6
	stal	SOUNDDATA
	tya
	ora	#$01
	stal	SOUNDADRL
	lda	#$d6
	stal	SOUNDDATA

	tya		; frequency high
	ora	#$20
	stal	SOUNDADRL
	lda	#$00
	stal	SOUNDDATA
	tya
	ora	#$21
	stal	SOUNDADRL
	lda	#00
	stal	SOUNDDATA
	
	tya		; volume
	ora	#$40
	stal	SOUNDADRL
	lda	#255
	stal	SOUNDDATA
	tya
	ora	#$41
	stal	SOUNDADRL
	lda	#255
	stal	SOUNDDATA

	tya		; address
	ora	#$80
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA
	tya
	ora	#$81
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA

	tya		; size
	ora	#$c0
	stal	SOUNDADRL
	lda	#%00111111
	stal	SOUNDDATA
	tya
	ora	#$c1
	stal	SOUNDADRL
	lda	#%00111111
	stal	SOUNDDATA

	tya		; start the first two oscillos
	ora	#$a0
	stal	SOUNDADRL
	lda	#%0000_1010	; interrupt here
	stal	SOUNDDATA
	tya
	ora	#$a1
	stal	SOUNDADRL
	lda	#%0001_1010
	stal	SOUNDDATA

	stz	noINTERRUPT	; play please
	cli
	
]lp	lda	noINTERRUPT	; wait for the end of the sound
	beq	]lp
	sep	#$30
	rts

*---------- Load & Prepare the sound effects

	mx	%11
	
moveSOUND	lda	fgSND
	beq	moveSOUND1
	rts

moveSOUND1	rep	#$10
	sei
	
	ldal	IRQ_VOLUME
	ora	#%0110_0000
	stal	SOUNDCTL

	lda	#0
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldx	#0
]lp	ldal	sndBANK1,x
	stal	SOUNDDATA
	inx
	bne	]lp

*--- Config oscillos now

	ldal	IRQ_VOLUME
	and	#%0000_1111
	stal	SOUNDCTL

	ldx	#1
]lp	txa
	asl
	tay		; frequency low
	stal	SOUNDADRL
	lda	#$d6
	stal	SOUNDDATA
	tya
	ora	#$01
	stal	SOUNDADRL
	lda	#$d6
	stal	SOUNDDATA

	tya		; frequency high
	ora	#$20
	stal	SOUNDADRL
	lda	#$00
	stal	SOUNDDATA
	tya
	ora	#$21
	stal	SOUNDADRL
	lda	#00
	stal	SOUNDDATA
	
	tya		; volume
	ora	#$40
	stal	SOUNDADRL
	lda	sndVOLUME,x
	stal	SOUNDDATA
	tya
	ora	#$41
	stal	SOUNDADRL
	lda	sndVOLUME,x
	stal	SOUNDDATA

	tya		; address
	ora	#$80
	stal	SOUNDADRL
	lda	sndADDRESS,x
	stal	SOUNDDATA
	tya
	ora	#$81
	stal	SOUNDADRL
	lda	sndADDRESS,x
	stal	SOUNDDATA

	tya		; size
	ora	#$c0
	stal	SOUNDADRL
	lda	sndSIZE,x
	stal	SOUNDDATA
	tya
	ora	#$c1
	stal	SOUNDADRL
	lda	sndSIZE,x
	stal	SOUNDDATA

	inx
	cpx	#10+1
	bcs	moveSOUND2
	brl	]lp

moveSOUND2	cli
	sep	#$10
	rts

*---------- 

	mx	%11

playSOUND	sta	saveA
	stx	saveX
	sty	saveY

	lda	fgSOUND	; 8-bit sound?
	ora	fgSND
	bne	playSOUND9

	ldal	IRQ_VOLUME
	and	#%0000_1111
	stal	SOUNDCTL

	lda	saveA	; reprend l'instrument
	cmp	#2
	bcc	playSOUND9
	cmp	#7	; tombe ?
	bne	playSOUND1
	cmp	oldA	; déjà tombe ?
	beq	playSOUND9	; oui, saute
	
playSOUND1	sta	oldA

	asl
	tay		; frequency low
	ora	#$a0
	stal	SOUNDADRL
	lda	#%0000_0010
	stal	SOUNDDATA
	tya
	ora	#$a1
	stal	SOUNDADRL
	lda	#%0001_0010
	stal	SOUNDDATA

playSOUND9	ldy	saveY
	ldx	saveX
	lda	saveA
	rts

	mx	%00

*--- Data

* isndINTRO	=	1	; ok
* isndBARRE	=	2	; ok
* isndCREUSE	=	3	; ok
* isndESCALIER =	4	; ok
* isndMARCHE	=	5	; ok
* isndNOMORECHEST =	6	; ok
* isndTOMBE	=	7	; ok - à refaire
* isndTRESOR	=	8	; ok
* isndTROU	=	9	; ok
* isndYOUWIN	=	10	; ok

*                        0  1  2  3  4  5  6  7  8  9 10
sndADDRESS	hex	00,00,68,50,44,48,80,c0,b0,70,00

sndSIZE	dfb	%00000000
	dfb	%00111111	; 1
	dfb	%00011011	; 2
	dfb	%00100100	; 3 
	dfb	%00010010	; 4
	dfb	%00011011	; 5
	dfb	%00110110	; 6
	dfb	%00011011	; 7 was 110110 now 2K
	dfb	%00100100	; 8
	dfb	%00100100	; 9
	dfb	%00111111	; 10

sndVOLUME	dfb	0
	dfb	255
	dfb	64
	dfb	64
	dfb	64
	dfb	64
	dfb	255
	dfb	64
	dfb	64
	dfb	64
	dfb	255

*---

oldA	dw	2
saveA	ds	2
saveX	ds	2
saveY	ds	2
	
*----------------------------------------
* DATA
*----------------------------------------

fgSND	ds	2

*----------------------- Tool locator

tolSTR1	str	'Error while loading tools'
errSTR1	str	'Quit'
errSTR2	str	''
errSTR3	str	'Continue'

*----------------------- Memory manager

myID	ds	2	; app ID
SStopREC	ds	4

ptrSCREEN	adrl	ptr012000

*----------------------- QuickDraw II

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

paletteLR	dw	$0445,$0000,$0FFF,$0952,$00BB,$01DD,$0FF0,$0A1A
	dw	$0C0C,$0FCB,$0A10,$0C30,$0E50,$0666,$0AAA,$0FFF

*----------------------- Event Manager

taskREC	ds	2	; wmWhat           + 0
taskMESSAGE	ds	4	; wmMessage        + 2
taskWHEN	ds	4	; wmWhen           + 6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS ds	2	; wmModifiers      +14

*----------------------- GS/OS

*--- LEVELS

proCREATE	dw	7	; pcount
	adrl	pLEVELS	; pathname
	dw	$c3	; access_code
	dw	$5d	; file_type
	adrl	$8022	; aux_type
	ds	2	; storage_type
	adrl	38400+256	; eof
	ds	4	; resource_eof

proDESTROY	dw	1	; pcount
	adrl	pLEVELS	; pathname

proOPEN	dw	2
	ds	2
	adrl	pLEVELS

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	adrl	ptrLEVELS	; 4 - pointer
	adrl	38400+256	; 8 - length
	ds	4	; C - length read

proWRITE	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	ptrLEVELS	; 4 - data_buffer
	adrl	38400+256	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

*--- Global

proCLOSE	dw	1
	ds	2

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

proVERS	dw	1	; pcount
	ds	2	; version

*---------- Files

pLEVELS	strl	'0/levels/loderunner'

*----------------------- Standard File Toolset

strLOADFILE	str	'Load which file?'
strSAVEFILE	str	'Save as...'

typeLIST	hex	01
	hex	5d	; Game/Edu files
replyPTR	ds	2	; 0 good
	ds	2	; 2 fileType
	ds	2	; 4 auxFileType
namePATH
	hex	07	; 6 fileName
namePATH1
	asc	'Niveaux'	; 7 fileName (16 normally)
	ds	8
loadPATH
	ds	1	; 22 fullPathname (string length)
loadPATH1
	ds	129	; 23 fullPathname (128 normally)

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	LR.Code.s
	put	LR.Data.s
	put	LR.Tables.s
logo
	putbin	pic/title
logo_fin
	put	LR.Sprites.s	; 8-bits sprites
	put	LR.Sprites2.s	; 16-col sprites

*---
