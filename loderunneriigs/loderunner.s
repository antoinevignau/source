*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014-2024, Brutal Deluxe Software
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
	
*-----------------------------------
* EQUATES
*-----------------------------------

GSOS	=	$e100a8

refIsPointer	=	0
refIsHandle	=	1
refIsResource	=	2

*-------------- GUI

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

	tdc
	sta	myDP

*--- Start tools...

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	myID
	_MTStartUp

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

okTOOL	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2
	sta	iconToDestLocInfo+4

*--- Et la musique...

okSHADOW	pha
	_SoundToolStatus
	pla
	beq	noSOUND
	inc	fgSND

noSOUND	_HideMenuBar
	_HideCursor
	
	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

*--- SHR on...

	jsr	setBORDER

	lda	#-1
	jsr	fadeOUT

*-----------------------------------

	PushLong	#0
	PushLong	#$8fffff
	PushWord	myID
	PushWord	#%11000000_00000000
	PushLong	#0
	_NewHandle
	_DisposeHandle
	_CompactMem

*--- 64K pour le buffer habituel

	jsr	make64KB
	bcs	koMEM
	
	sty	ptrUNPACK
	stx	ptrUNPACK+2

*--- 64K pour les images

	jsr	make64KB
	bcs	koMEM
	
	sty	ptrIMAGE
	stx	ptrIMAGE+2
	stx	ptrKEYS+2
	
*--- 64K pour le fond

	jsr	make64KB
	bcc	okMEM1

koMEM	pha
	PushLong #memSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT1

okMEM1	sty	bankHGR2
	stx	bankHGR2+2

*--- 64K pour le menu

	jsr	make64KB
	bcs	koMEM
	sty	ptrMENU
	stx	ptrMENU+2
	stx	ptrOPTIONS+2
	stx	iconToSourceLocInfo+4
	
*--- 64K pour les niveaux

	jsr	make64KB
	bcs	koMEM
	sty	bankLEVELS
	stx	bankLEVELS+2

*--- 64K pour les sons

	jsr	make64KB
	bcs	koMEM
	sty	ptrSOUNDS
	stx	ptrSOUNDS+2	

*----------------------------------- Affiche le logo Tozai

	lda	#pTOZAI
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	koLOADTOZAI

	lda	proEOF
	ldx	#0
	ldy	#0
	jsr	unpackLZ4

	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	lda	#-1
	jsr	fadeIN
koLOADTOZAI

*----------------------------------- The patch area 11/0000

	lda	bankLEVELS
	sta	lvlPATCH1+1
	sta	lvlPATCH2+1
	lda	bankLEVELS+1
	sta	lvlPATCH1+2
	sta	lvlPATCH2+2

	sta	scorePATCH1+2
	sta	scorePATCH2+2
	lda	bankLEVELS
	clc
	adc	#38400
	sta	scorePATCH1+1
	sta	scorePATCH2+1

*---

	lda	bankHGR2
	sta	Debut
	lda	bankHGR2+2
	sta	Debut+2

	ldy	#0	; on efface HGR2
	tya
]lp	sta	[Debut],y
	iny
	iny
	bne	]lp

*----------------------------------- Load file now

	lda	#pSOUNDS
	ldx	ptrSOUNDS+2
	ldy	ptrSOUNDS
	jsr	loadFILE
	bcc	okLOAD2
	inc	fgSND

okLOAD2	lda	#pMENU
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	okLOAD3
	inc	fgMENU
	bra	okLOADEND
	
okLOAD3	lda	proEOF
	ldx	ptrMENU+2
	ldy	ptrMENU
	jsr	unpackLZ4

	lda	#pOPTIONS
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	okLOAD4
	inc	fgMENU
	bra	okLOADEND

okLOAD4	lda	proEOF
	ldx	ptrOPTIONS+2
	ldy	ptrOPTIONS
	jsr	unpackLZ4

	lda	#pKEYS
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	okLOAD5
	inc	fgMENU
	bra	okLOADEND

okLOAD5	lda	proEOF
	ldx	ptrKEYS+2
	ldy	ptrKEYS
	jsr	unpackLZ4

okLOADEND

*----------------------------------- Exit point

	ldx	#256-2	; efface la page directe
]lp	stz	$00,x
	dex
	dex
	bpl	]lp

	jsr	checkJOYSTICK
	jsr	find4PLAY	; do we have a 4play?
	jsr	initMIDI	; MIDISynth vaincra
	jsr	doMUSIK	; play muzak
	jsr	set28SPEED	; slow down the IIgs
*	jsr	ComputeGSSpeed
	
	lda	#-1
	jsr	fadeOUT

	jsr	setNATIVE	; exit 8-bit
	jsr	initINTRO	; 1er appel pour initialiser les valeurs par défaut

*--- MAIN LOOP

loopPLEASE	rep	#$30

	lda	theLVL	; want a custom file
	cmp	#indexCUSTOM
	beq	lp_skip
	
	asl
	tax
	lda	tblLVL,x
	jsr	initLEVELS
	jsr	loadLEVELS	; exit in 8-bit
	rep	#$30

lp_skip	lda	fgMENU
	bne	playNOMENU
	
	jsr	doINTRO	; retourne le theme en A
	bcc	playPLEASE
	brl	meQUIT
	
	mx	%11

playNOMENU	sep	#$30	; we have no menu or no options
	lda	#0	; let's play directly
	
playPLEASE	cmp	#0
	beq	introNATIVE
	jsr	setVINTAGE
	bra	introNEXT
introNATIVE	jsr	setNATIVE

introNEXT	lda	theLVL	; do we want to play
	cmp	#indexCUSTOM	; custom levels?
	bne	introCONTINUE	; no
	
	jsr	doLOAD	; yes, player can select his levels
	bcs	loopPLEASE	; if error/cancel, loop

*--- Set the input device

introCONTINUE	ldx	#chrP	; joypad = 0
	lda	theDEV
	beq	foundDEV
	ldx	#chrJ	; joystick = 1
	cmp	#1
	beq	foundDEV
	ldx	#chrK	; keyboard = 2

foundDEV	stx	fgINPUT

*--- Enter the game world

	mx	%11

	lda	#refSPEED	; try to slow it down a bit
	sta	theSPEED

	lda	ptrSCREEN+2
	sta	ptrHGR1+2
	jmp	theGAME

*-----------------------------------
* AUTRES ROUTINES
*-----------------------------------

	mx	%00	; The 16-bit world

*----------------------------------- Init GS/OS data for LEVELS
* A: pointer to filename

initLEVELS	sta	proDESTROY+2
	sta	proCREATE+2
	sta	proOPEN+4
	
	ldy	bankLEVELS
	sty	proREAD+4	; where to put at the end
	sty	proWRITE+4
	ldx	bankLEVELS+2
	stx	proREAD+6
	stx	proWRITE+6

	lda	#38400+256	; length
	sta	proREAD+8
	stz	proREAD+10
	sta	proWRITE+8
	stz	proWRITE+10
	rts

*----------------------------------- Open LEVELS

doLOAD	rep	#$30
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

	lda	#pLEVELS	; all files are linked to levels now
	jsr	initLEVELS

*---

loadLEVELS	rep	#$30

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
glong	clc
	rts
	
	mx	%00

loadLEVELS9	rep	#$30

	ldx	#0	; clear all levels
	txa
lvlPATCH1	stal	$bdbd,x	; **patched**
	inx
	inx
	cpx	#38400	; 150 x 256
	bcc	lvlPATCH1
	
	ldx	#256-2
]lp	lda	scoreEMPTY,x
	sta	scorebuf,x
lvlPATCH2	stal	$bdbd,x	; **patched**
	dex
	dex
	bpl	]lp

	sep	#$30
	sec
	rts
	
	mx	%00

*----------------------------------- Save

doSAVE	rep	#$30
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

saveLEVELS	rep	#$30
	
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

	jsr	restoreSPEED
	jsr	restoreBORDER
	jsr	stopMIDI

	PushWord	#refIsHandle
	PushLong	SStopREC
	_ShutDownTools

meQUIT1	PushWord	myID
	_DisposeAll

	PushWord	myID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd	; we never know!
	
*----------------------------------------
* SET VINTAGE/NATIVE MODE
*----------------------------------------

	mx	%00

setVINTAGE	rep	#$30
	jsr	setSTDPALETTE ; set the LR palette
	ldx	#tblSPRITES
	ldy	#$4444
	bra	setMODE
	
setNATIVE	rep	#$30
	jsr	setLRPALETTE ; set the LR palette
	ldx	#tblSPRITES2
	ldy	#$bbbb
	
setMODE	stx	patchSPR1+1	; the sprites table
	stx	patchSPR2+1
	stx	patchSPR3+1
	sty	fondFRAME	; the border color
	sep	#$30
	lda	#-1	; we want sound fx
	sta	fgSOUND
	rts

*---

fondFRAME	dw	$4444	; HGR: $4444, SHR: $BBBB

*----------------------------------------
* SET LODE RUNNER / STANDARD 320 PALETTE
*----------------------------------------

	mx	%00

setSTDPALETTE	PushWord	#0
	PushLong	#palette320
	bra	setPALETTE

setLRPALETTE	PushWord	#0
	PushLong	#paletteLR

setPALETTE	_SetColorTable
	PushWord	#0
	_SetAllSCBs
	rts

*----------------------------------------
* CHECK KEY PRESSED
*----------------------------------------

	mx	%00

checkKEY	phx
	phy
	rep	#$30

	jsr	checkREPLAY	; restart muzak?
	
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
	
	lda	taskMESSAGE	; un nombre?
	ora	#%1000_0000
	cmp	#"A"
	bcc	checkedKEY
	and	#maskUPPER	; lowercase support
checkedKEY	rts

	mx	%00
	
checkNOKEY	sep	#$30
	ply
	plx
	lda	#0
	rts

	mx	%00

*----------------------------------------
* CHECK KEY & MOUSE UP
*----------------------------------------

	mx	%00

checkKEYMOUSE	rep	#$30

]lp	jsr	checkREPLAY	; restart muzak?
	
	pha
	PushWord #%00000000_00001110
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	]lp

	lda	taskREC	; une touche ?
	cmp	#keyDownEvt
	beq	ckm_key
	cmp	#mouseDownEvt
	bne	]lp

	pha
	PushWord	#0
	_WaitMouseUp
	pla
	beq	]lp
	
	sep	#$30	; un clic
	lda	#0
	rts

ckm_key	sep	#$30
	lda	taskMESSAGE	; un nombre ?
	ora	#%1000_0000
	cmp	#"A"
	bcc	ckm_nonumber
	and	#maskUPPER	; lowercase support
ckm_nonumber	rts

	mx	%00

*----------------------------------------
* SPEED
*----------------------------------------

*---

ComputeGSSpeed	lda	#16	; SHR line 16
	jsr	WaitForSpot
	ldy	#0	; speed counter

	lda	#32	; SHR line 32
	jsr	WaitForSpot
	
]lp	iny
	lda	#64	; SHR line 64
	jsr	WaitForSpot
	bne	]lp

	sty	CGSS_Counter

	ldx	#0	; 0 = 1 MHz Apple IIgs
	cpy	#$40
	bcc	CGSS_Code
	inx		; 1 = 2,8MHz Apple IIgs
	cpy	#$70
	bcc	CGSS_Code
	inx		; 2 = Accelerated IIgs (7-16 MHz)
	cpy	#$400
	bcc	CGSS_Code
	inx		; 3 = Full speed emulator
CGSS_Code	stx	CGSS_SpeedCode
	rts

*--------------

WaitForSpot	sep	#$20
	lsr
	ora	#$80
	cmpl	VERTCNT
	bne	wfs_notok

	rep	#$20
	lda	#0
	rts
wfs_notok	rep	#$20
	lda	#1
	rts

*--------------

	mx	%11
	
slowdownBUDDY	lda	CGSS_SpeedCode
	cmp	#2
	bcc	noSPEED

speedOUTER	ldal	RDVBLBAR
	bpl	speedOUTER
speedINNER	ldal	RDVBLBAR
	bmi	speedINNER
noSPEED	rts

	mx	%00
	
*--------------

CGSS_Counter	ds	2	; 1079-0820 = Full Speed Emulator, 0108-0129 = 8Mhz 39F = 16MHz, 005B = 2,8 Mhz, 0026 = 1 Mhz
CGSS_SpeedCode	ds	2	; Speed Code : 0=1Mhz, 1=2.8Mhz, 2=Accelerator Card, 3=Emulator Unlimited

*---

FL_IDLE	=	$e2000a
FL_VERSION	=	$e2000c
SET_SPEED	=	$e50000

GetCurISpeed	=	$bcff28
SetCurISpeed	=	$bcff2c

*---

set28SPEED	sep	#$20	; Check Applesqueezer
	ldal	FL_IDLE
	and	#$ff
	cmp	#1
	bne	no_AS

	ldal	SET_SPEED
	sta	accSPEED
	lda	#233
	stal	SET_SPEED
	rep	#$20
	lda	#1
	sta	theACC
	rts

	mx	%10

no_AS	rep	#$20	; Check Transwarp IIgs

	ldal	$bcff00
	cmp	#'TW'
	bne	no_TW
	ldal	$bcff02
	cmp	#'GS'
	bne	no_TW

	jsl	GetCurISpeed
	stx	accSPEED
	ldx	#1
	jsl	SetCurISpeed
	lda	#2
	sta	theACC
	rts

no_TW	sep	#$20	; Check ZipGSX

	lda	#$5a	; unlock
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	
	ldal	CLRAN0
	eor	#$f8
	sta	temp
	stal	CLRAN0
	ldal	CLRAN0
	cmp	temp
	bne	no_ACC
	eor	#$f8
	stal	CLRAN0
	
*	lda	#%1010_0000	; #$10-#$6th option (2.56MHz)
*	stal	CLRAN2	; set speed
*	stal	CLRAN1	; enable card

	lda	#0	; disable... set to 2.8MHz
	stal	SETAN1

	lda	#$a5	; lock
	stal	SETAN1

	lda	#3
	sta	theACC

no_ACC	rep	#$20
	rts
	
*---

restoreSPEED	lda	theACC	; Applesqueezer?
	cmp	#1
	bne	check_TW

	sep	#$20
	lda	accSPEED
	stal	SET_SPEED
	rep	#$20
	rts

check_TW	cmp	#2	; Transwarp GS?
	bne	check_ZIP

	ldx	accSPEED
	jsl	SetCurISpeed
	rts
	
check_ZIP	cmp	#3	; ZipGSX?
	bne	check_NADA

	sep	#$20
	lda	#$5a	; unlock
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	stal	SETAN1
	lda	#%0000_0000	; any write to set fastest speed
	stal	CLRAN2
	stal	CLRAN1	
	lda	#$a5	; lock
	stal	SETAN1
	rep	#$20	

check_NADA	rts

*---

theACC	ds	2	; 1:AS / 2:TW / 3:ZIP
accSPEED	ds	2

*----------------------------------------
* BORDER
*----------------------------------------

*--- We want a black border

setBORDER	sep	#$20
	ldal	CLOCKCTL
	pha
	and	#%00001111
	sta	theSSBORDER
	pla
	and	#%11110000
	stal	CLOCKCTL
	rep	#$20
	rts

*--- We restore the border

restoreBORDER	sep	#$20
	ldal	CLOCKCTL
	and	#%11110000
	ora	theSSBORDER
	stal	CLOCKCTL
	rep	#$20
	rts
	
*--- Data

theSSBORDER	ds	2

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
	sta	slot4PLAY	; we have a 4Play
	
	lda	#chrP
	sta	fgINPUT
	
	rep	#$30
	rts

*----------------------------------------

	mx	%11
	
read4PLAY	ldal	$e0C080	; direct "fast" read
	and	#%1101_1111	; mask bit 5
	sta	the4PLAY
	rts

*--- Data

slot4PLAY	ds	2
the4PLAY	ds	2

	mx	%00

*-----------------------------------
* CHECK JOYSTICK
*-----------------------------------

checkJOYSTICK	sep	#$30

	php
	sei
	ldal	CYAREG
	pha
	and	#%0111_1111
	stal	CYAREG

	LDAL	PTRIG
	nop
	nop
	LDX	#$10
L87A7	LDAL	PADDL0
	ORAl	PADDL1
	BPL	L87B9
	DEY
	BNE	L87A7
	DEX
	BNE	L87A7

	lda	fgINPUT	; on a déjà un device connecté
	bne	L87B8
	LDA	#chrK	; no joystick means keyboard
	STA	fgINPUT
L87B8	stz	fgJOYSTICK	; no joystick found

L87B9	pla
	stal	CYAREG
	plp
	rep	#$30
	RTS

fgJOYSTICK	dw	1	; we have a joystick, by default

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrIMAGE: temp unpack zone
*
* Entry:
*  A: packed data size
*
* Exit:
*  lenDATA: unpacked data size
*
*----------------------------

	mx	%00
	
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

LZ4_ReadToken
	LDAL	$AA0000,X	; Read Token Byte
	INX
	STA	LZ4_Match_2+1
	
*----------------

LZ4_Literal
	AND	#$00F0	; >>> Process Literal Bytes <<<
	BEQ	LZ4_Limit	; No Literal
	CMP	#$00F0
	BNE	LZ4_Literal_1
	JSR	LZ4_GetLengthLit	; Compute Literal Length with next bytes
	BRA	LZ4_Literal_2
LZ4_Literal_1
	LSR		; Literal Length use the 4 bit
	LSR
	LSR
	LSR

LZ4_Literal_2
	DEC		; Copy A+1 Bytes
LZ4_Literal_3
	MVN	$AA,$BB	; Copy Literal Bytes from packed data buffer
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

*----------------------------------------
* FADE IN & OUT
*----------------------------------------
* X/Y: source picture address
*   A: 0: do not copy image data

	mx	%00
	
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

fadeOUT6	lda	ptrSCREEN
	sta	Debut
	lda	ptrSCREEN+2
	sta	Debut+2

	ldy	#32768-2
	lda	#0
]lp	sta	[Debut],y
	dey
	dey
	bpl	]lp
	rts

*--------------------------------------

nextVBL	ldal	VERTCNT
	and	#$7f
	cmp	#75
	blt	nextVBL
	cmp	#100
	bge	nextVBL
waitVBL	ldal	RDVBLBAR-1
	bpl	waitVBL
	rts

*----------------------------------------
* MEMOIRE
*----------------------------------------

make64KB	pha
	pha
	PushLong #$010000
	PushWord myID
	PushWord #%11000000_00011100
	PushLong #0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	tax		; low in X
	ldy	#2
	lda	[3],y
	txy		; low in Y
	tax		; high in X
	pld
	pla		; we do not keep track of the handle
	pla
	rts

*----------------------------------------
* SOUND EFFECTS
*----------------------------------------

	mx	%11

playSOUND	sta	saveA
	stx	saveX
	sty	saveY

	lda	theTHEME	; 16-bit mode?
	bne	playSOUND0	; no, exit
	lda	fgSOUND	; is sound on or off?
	beq	playSOUND0	; it is on
	lda	fgSND	; can play 16-bit sound?
	beq	playSOUND1	; 0 means yes

playSOUND0	sep	#$30
	ldy	saveY
	ldx	saveX
	lda	saveA
	rts

playSOUND1	rep	#$30
	
	lda	saveA	; reprend l'instrument
	and	#$ff	; clear high byte
	sta	saveA
	cmp	#isndBARRE	; 0 et 1 n'existent pas
	bcc	playSOUND0
	cmp	#isndTOMBE
	bne	playSOUND2
	cmp	oldA
	beq	playSOUND0

playSOUND2	sta	oldA
	asl
	tay		; on a maintenant l'index dans Y
	
	lda	fgMIDIPLAY	; is no MIDI, no constraint
	beq	playSOUND3	; play all sound fx
	lda	sndEXIT,y	; if MIDI playing, limit to
	bne	playSOUND9	; some sound fx only
	
playSOUND3	lda	sndADDRESS,y
	clc
	adc	ptrSOUNDS
	sta	waveSTART
	lda	#0
	adc	ptrSOUNDS+2
	sta	waveSTART+2
	lda	sndPAGE,y
	sta	wavePAGE
	
	lda	fgMIDIPLAY	; midi playing
	beq	playSOUND4	; nope
	_MSSuspend
	
playSOUND4	PushWord	#%0000_0000_1000_0000
	_FFStopSound

	PushWord	#$0701	; Gen 7 is THE generator to use
	PushLong	#waveSTART
	_FFStartSound

	lda	fgMIDIPLAY	; midi playing
	beq	playSOUND9	; nope
	_MSResume
	
playSOUND9	sep	#$30
	ldy	saveY
	ldx	saveX
	lda	saveA
	rts

	mx	%00

*--- Data
*                               0     1     2     3     4     5     6     7     8     9     10
sndEXIT	dw	$0001,$0001,$0001,$0001,$0001,$0001,$0000,$0001,$0000,$0000,$0000
sndADDRESS	dw	$0000,$0000,$0000,$0500,$1700,$1A00,$2100,$4900,$5000,$6000,$6900
sndPAGE	dw	$0000,$0000,$0005,$0012,$0003,$0007,$0028,$0007,$0010,$0009,$0043

waveSTART	ds	4	; waveStart
wavePAGE	ds	2	; waveSize
	dw	209	; freqOffset ($D1)
	dw	$FE00	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
	dw	255	; volSetting

oldA	ds	2
saveA	ds	2
saveX	ds	2
saveY	ds	2

*	0	%00000000	0	0	0	0000
* INTRO	1	%00111111	32768	0	0	0000
* BARRE	2	%00011011	16384	1280	5	0000
* CREUSE	3	%00100100	4096	4608	18	0500
* ESCALIER	4	%00010010	1024	768	3	1700
* MARCHE	5	%00011011	2048	1792	7	1A00
* NOMORECHEST	6	%00110110	16384	10240	40	2100
* TOMBE	7	%00011011	2048	1792	7	4900
* TRESOR	8	%00100100	4096	4096	16	5000
* TROU	9	%00100100	4096	2304	9	6000
* YOUWIN	10	%00111111	32768	17152	67	6900
*						AC00

*----------------------------------------
* GS/OS
*----------------------------------------

loadFILE	sta	proOPEN+4	; filename
	sty	proREAD+4	; where to put at the end
	stx	proREAD+6

loadFILE1	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	loadERR
	
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

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
	rts
	
loadERR	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	sec
	rts

	mx	%00
	
*----------------------------------------
* DATA
*----------------------------------------

fgSND	ds	2
fgMENU	ds	2
temp	ds	2

*----------------------- Tool locator

tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''
errSTR3	str	'Continue'

*----------------------- Memory manager

myDP	ds	2
myID	ds	2	; app ID
SStopREC	ds	4

ptrSCREEN	adrl	ptr012000

bankHGR2	ds	4
bankLEVELS	ds	4
ptrSOUNDS	ds	4

ptrUNPACK	ds	4	; the usual scratch area
ptrIMAGE	ds	4	; where a pic is unpacked
ptrKEYS	adrl	$8000	; change keys
ptrMENU	ds	4	; menu du jeu
ptrOPTIONS	adrl	$8000	; les options possibles

*----------------------- QuickDraw II

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

* black was grey: $0000 vs $0445

paletteLR	dw	$0000,$0000,$0FFF,$0952,$00BB,$01DD,$0FF0,$0A1A
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

proOPEN	dw	12
	ds	2
	adrl	pLEVELS
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

proWRITE	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	ds	4	; 4 - data_buffer
	ds	4	; 8 - request_count
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

pTOZAI	strl	'1/data/images/tozai.lz4'
pMENU	strl	'1/data/images/menu.lz4'
pOPTIONS	strl	'1/data/images/options.lz4'
pKEYS	strl	'1/data/images/keys.lz4'
pSOUNDS	strl	'1/data/musiques/sounds'
pCLASSIC	strl	'1/levels/classic'
pCHAMPIONSHIP	strl	'1/levels/championship'
pMSX	strl	'1/levels/msx'

pLEVELS	strl	'0/                '

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

	put	LR.MIDI.s
	put	LR.Intro.s

	put	sprite1.s
	put	sprite2.s
	put	sprite3.s
	put	sprite4.s
	put	sprite5.s
	put	sprite6.s
	put	sprite7.s
	put	sprite8.s

	put	LR.Code.s
	put	LR.Data.s
	put	LR.Tables.s
	put	LR.Sprites.s	; 8-bits sprites
	put	LR.Sprites2.s	; 16-col sprites

*---

	asc	8d8d
	asc	"Lode Runner IIgs"8d
	asc	8d
	asc	"Antoine Vignau & Olivier Zardini"8d
	asc	"(c) 2024, Brutal Deluxe Software"8d
	asc	"(c) 2024 Tozai Games"8d8d
	