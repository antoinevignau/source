*
* NDA Skeleton
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 202603
*

	xc
	xc
	mx	%00

*-------------- 

	use	4/ADB.Macs
	use	4/Ctl.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Resource.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs

*----------------------------
* EQUATES
*----------------------------

Debut	=	$00
GSOS	=	$e100a8

FALSE	=	0
TRUE	=	-1

*-------------- FIRMWARE

KEYMODREG	=	$c025

*-------------- GUI

wMAIN	=	1
refIsPointer	=	0
refIsHandle	=	1
refIsResource	=	2

*-------------- EVENT/WINDOW MANAGER

nullEvt	=	$00	; Event Code -  
mouseDownEvt	=	$01	; Event Code -  
mouseUpEvt	=	$02	; Event Code -  
keyDownEvt	=	$03	; Event Code -  
autoKeyEvt	=	$05	; Event Code -  
updateEvt	=	$06	; Event Code -  
activateEvt	=	$08	; Event Code -  
switchEvt	=	$09	; Event Code -  
deskAccEvt	=	$0a	; Event Code -  
driverEvt	=	$0b	; Event Code -  
app1Evt	=	$0c	; Event Code -  
app2Evt	=	$0d	; Event Code -  
app3Evt	=	$0e	; Event Code -  
app4Evt	=	$0f	; Event Code -  

wNoHit	=	$00
inNull	=	$00
inKey	=	$03
inButtDwn	=	$01
inUpdate	=	$06

wInDesk	=	$10
wInMenuBar	=	$11
wClickCalled	=	$12
wInContent	=	$13
wInDrag	=	$14
wInGrow	=	$15
wInGoAway	=	$16
wInZoom	=	$17
wInInfo	=	$18
wInSpecial	=	$19
wInDeskItem	=	$1a
wInFrame	=	$1b
wInactMenu	=	$1c
wCloseNDA	=	$1d
wCalledSysEdit	=	$1e
wTrackZoom	=	$1f
wHitFrame	=	$20
wInControl	=	$21
wInControlMenu	=	$22
wInSysWindow	=	$8000

*-------------- NDA

Period	=	$ffff	; never
EventMask	=	$ffff	; get all events

eventAction	=	1	; action routine, in A register
runAction	=	2
cursorAction	=	3
menuAction	=	4	; does nothing
undoAction	=	5
cutAction	=	6
copyAction	=	7
pasteAction	=	8
clearAction	=	9
sysClickAction	=	10
optionalCloseAction =	11
reOpenAction	=	12

ndaShutdown	=	0	; init routine, in A register, non-zero for Startup

readWrite	=	0	; open access flags for OpenResourceFileByID
readOnly	=	1
fstAppleShare	=	13	; Appleshare FST ID ($0D)

*-------------- QuickDraw II

MINQDVERSION	=	$0307	; for 6.0

*----------------------------
* CODE
*----------------------------

	adrl	ndaOPEN
	adrl	ndaCLOSE
	adrl	ndaACTION
	adrl	ndaINIT
	dw	Period
	dw	EventMask
	asc	'  FM Radio \H**'00

*----------------------------
* OPEN ROUTINE
*----------------------------

result	=	5	; window pointer result

ndaOPEN	phb
	phk
	plb

	lda	#0
	sta	result,s
	sta	result+2,s

*--- Do we have the FM Radio installed?

	jsr	lacie_getINFO
	bne	ndaOPEN1	; no

	jsr	checkQDVersion	; yes
	bcs	ndaOPEN2
ndaOPEN1	plb
	rtl

*--- Open our window

ndaOPEN2	PushLong	#0
	_GetPort
	PullLong	curPORT
	_WaitCursor

	PushWord	#0
	_GetCurResourceApp
	PullWord	curRESID
	bcs	ndaOPEN9

	jsr	startResourceManager
	bcs	ndaOPEN9
	jsr	makeMainWindow
	
	lda	myWINDOW+2
	sta	result+2,s
	lda	myWINDOW
	sta	result,s

	lda	#1
	sta	fgOPEN
	
	jsr	lacie_setDFTVAL	; set default values
	jsr	lacie_setVOLUME	; set the volume
	jsr	lacie_setFREQUENCY	; and the frequency
	jsr	lacie_printFREQUENCY

ndaOPEN9	PushWord	curRESID
	_SetCurResourceApp
	PushLong	curPORT
	_SetPort
	_InitCursor
	plb
	rtl

*----------------------------
* CLOSE ROUTINE
*----------------------------

ndaCLOSE	phb
	phk
	plb
	
	lda	fgOPEN
	beq	ndaCLOSE9

	sep	#$20
	ldal	KEYMODREG
	rep	#$20
	and	#$40	; is option key down?
	beq	ndaCLOSE1	; no, do not turn the radio off

	jsr	lacie_switchOFF	; yes, turn the FM Radio off

ndaCLOSE1	PushWord	#0
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile

	PushLong	myWINDOW
	_HideWindow
	PushLong	myWINDOW
	_CloseWindow
	
	stz	myWINDOW
	stz	myWINDOW+2
	stz	fgOPEN

	_SetCurResourceFile
	jsr	stopResourceManager

ndaCLOSE9	plb
	rtl

*----------------------------
* ACTION ROUTINE
*----------------------------

eventPtr	=	1
actionCode	=	5

*---

ndaACTION	phd
	phb
	phk
	plb
	pha	; action   = <5
	phy	; ptr high = <3
	phx	; ptr  low = <1
	tsc
	tcd
	
	PushWord	#0
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile
	
	PushLong	#0
	_GetPort
	PushLong	myWINDOW
	_SetPort
	
	lda	actionCode
	asl
	tax
	cmp	#tblACTION2-tblACTION
	bcs	ndaACTION1
	
	jsr	(tblACTION,x)

ndaACTION1	_SetPort
	_SetCurResourceFile
	
	plx	; restore parms
	ply
	pla
	plb
	pld
	lda	#0
	rtl

*--------------

tblACTION	da	doNULL	; 0
	da	doEVENT	; 1
	da	doRUN	; 2
	da	doCURSOR	; 3
	da	doNULL	; 4
	da	doUNDO	; 5
	da	doCUT	; 6
	da	doCOPY	; 7
	da	doPASTE	; 8
	da	doCLEAR	; 9
	da	doSYSCLICK	; 10
	da	doOPTIONALCLOSE	; 11
	da	doREOPEN	; 12
tblACTION2

*----------------------------
* INIT ROUTINE
*----------------------------

ndaINIT	phb
	phk
	plb
	sta	theCODE

*--- Do we have the FM Radio installed?

	jsr	checkQDVersion	; check version
	bcs	ndaINIT2
ndaINIT1	plb		; too low
	rtl

ndaINIT2	lda	theCODE	; check action code
	cmp	#ndaShutdown
	beq	ndaINITShutDown

	pha		; start up
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID
	plb
	rtl

ndaINITShutDown	PushWord	myID	; shut down
	_DisposeAll
	PushWord	appID
	_DisposeAll
	PushWord	appID
	_MMShutDown

	plb
	rtl

*----------------------------
* NDA ROUTINES
*----------------------------

	put	nda_fmradio_routines.s

*----------------------------
* FM CHIP ROUTINES
*----------------------------

	put	nda_lacie_routines.s

*----------------------------
* DIGITS - We do not use!
*----------------------------
*
*dhPL	=	18	;width of large picture
*dvPL	=	17	;height of large picture
*penMode	=	0
*
**---
*
*	mx	%00
*	
*lacie_printNEW	pha
*	_GetMasterSCB		;check for 320 mode
*	pla
*	and	#$0080
*	sta	LocInfoL
*
**---
*
*	lda	#10
*	sta	destX
*
*	ldx	#0
*]lp	phx
*	lda	strFREQUENCY,x
*	and	#$ff
*	cmp	#' '
*	bne	lacie_pn1
*	lda	#'9'+1
*lacie_pn1	sec
*	sbc	#'0'
*	asl
*	tay
*	lda	PictMapL,y
*	sta	LocInfoL+2
*
*	PushLong	#LocInfoL
*	PushLong	#PictRectL
*	PushWord	destX
*	PushWord	destY
*	PushWord	#penMode
*	_PPToPort		;draw digit 2
*
*	lda	destX
*	clc
*	adc	#24
*	sta	destX
*
*	plx
*	inx
*	cpx	#5
*	bcc	]lp
*	rts
*
**---
*
*LocInfoL	dw	$80	;port SCB
*	adrl	Pict0L	;Picture ptr
*	dw	5	;Picture width (bytes)
*PictRectL	dw	0,0,dvPL,dhPL	;bounds rect
*
*destX	dw	10
*destY	dw	10
*
**---
*
*PictMapL	da	Pict0L
*	da	Pict1L
*	da	Pict2L
*	da	Pict3L
*	da	Pict4L
*	da	Pict5L
*	da	Pict6L
*	da	Pict7L
*	da	Pict8L
*	da	Pict9L
*	da	Pict10L	; the space character
*	
*Pict0L	hex	f0000000ff	;large 0
*	hex	0f00000f0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0fffffff0f
*	hex	ffffffffff
*	hex	0fffffff0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0f00000f0f
*	hex	f0000000ff
*
*Pict1L	hex	ffffffffff	;large 1
*	hex	ffffffff0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	ffffffffff
*	hex	ffffffff0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	ffffffffff
*
*Pict2L	hex	f0000000ff	;large 2
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	f0000000ff
*	hex	0f00000fff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	0f00000fff
*	hex	f0000000ff
*
*Pict3L	hex	f0000000ff	;large 3
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	f0000000ff
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ff00000f0f
*	hex	f0000000ff
*
*Pict4L	hex	ffffffffff	;large 4
*	hex	0fffffff0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0fffffff0f
*	hex	f0000000ff
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	ffffffffff
*
*Pict5L	hex	f0000000ff	;large 5
*	hex	0f00000fff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	0fffffffff
*	hex	f0000000ff
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ff00000f0f
*	hex	f0000000ff
*
*Pict6L	hex	f0000000ff	;large 6
*	hex	0f00000fff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	00ffffffff
*	hex	0fffffffff
*	hex	f0000000ff
*	hex	0f00000f0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0f00000f0f
*	hex	f0000000ff
*
*Pict7L	hex	f0000000ff	;large 7
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	ffffffffff
*	hex	ffffffff0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ffffffff0f
*	hex	ffffffffff
*
*Pict8L	hex	f0000000ff	;large 8
*	hex	0f00000f0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0fffffff0f
*	hex	f0000000ff
*	hex	0f00000f0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0f00000f0f
*	hex	f0000000ff
*
*Pict9L	hex	f0000000ff	;large 9
*	hex	0f00000f0f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	00fffff00f
*	hex	0fffffff0f
*	hex	f0000000ff
*	hex	ff00000f0f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	fffffff00f
*	hex	ff00000f0f
*	hex	f0000000ff
*
*Pict10L	hex	ffffffffff	;space character
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff
*	hex	ffffffffff

*----------------------------
* CHECK QD VERSION
*----------------------------

checkQDVersion	PushWord	#0
	_QDVersion
	pla
	and	#$0fff
	cmp	#MINQDVERSION
	rts

*----------------------------
* MAKE MAIN WINDOW
*----------------------------

makeMainWindow	PushWord	#0
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile
	
	pha
	pha
	PushLong	#0
	PushLong	#wMAIN
	PushLong	#PAINTMAIN
	PushLong	#0
	PushWord	#refIsResource
	PushLong	#wMAIN
	PushWord	#$800e
	_NewWindow2
	PullLong	myWINDOW

	PushLong	myWINDOW
	_SetSysWindow
	PushLong	myWINDOW
	_SetPort

	PushLong	myWINDOW
	_ShowWindow
	PushLong	myWINDOW
	_BeginUpdate
	jsl	PAINTMAIN
	PushLong	myWINDOW
	_EndUpdate
	
	_SetCurResourceFile

	rts
	
*----------------------------
* START RESOURCE MANAGER
*----------------------------

startResourceManager
	clc
	lda	myRESID
	bne	startRM1	; already started

	PushWord	#0	; space for result
	jsr	accessREQUEST	; openAccess (read or read/write)
	pha
	PushWord	appID	; userID
	jsr	getsetSYSPREFS
	_OpenResourceFileByID
	jsr	restoreSYSPREFS
	pla
	bcs	startRM1
	
	PushWord	#0
	_GetCurResourceFile
	PullWord	myRESID
	
	_ADBStartUp

startRM1	rts

*----------------------------
* STOP RESOURCE MANAGER
*----------------------------

stopResourceManager
	lda	myRESID
	beq	stopRM1	; not started
	ora	#$8000	; force it closed
	pha
	_CloseResourceFile
	stz	myRESID
	_ResourceShutDown
	
	_ADBShutDown
	
stopRM1	rts

*----------------------------
* DRAW THE WINDOW
*----------------------------

PAINTMAIN	phb
	phk
	plb
	
	pha
	_GetCurResourceFile
	
	lda	myRESID
	pha
	_SetCurResourceFile
	
	pha
	pha
	_GetPort
	_DrawControls

	jsr	lacie_printFREQUENCY
	
	_SetCurResourceFile
	
	plb
	rtl

*----------------------------
* GET AND SET SYS PREFS
*----------------------------

getsetSYSPREFS	jsl	GSOS	; the old prefs
	dw	$200f
	adrl	proGETSYSPREFS
	
	lda	proGETSYSPREFS+2
	and	#$1fff
	ora	#$c000
	sta	proSETSYSPREFS+2

	jsl	GSOS	; the new prefs
	dw	$200c
	adrl	proSETSYSPREFS
	rts

*----------------------------
* RESTORE SYS PREFS
*----------------------------

restoreSYSPREFS	php
	pha
	jsl	GSOS	; restore  the old prefs
	dw	$200c
	adrl	proGETSYSPREFS
	pla
	plp
	rts

*----------------------------
* RESTORE SYS PREFS
*----------------------------

accessREQUEST	jsl	GSOS
	dw	$202c
	adrl	proDINFO
	bcs	arASALLOWED
	
	jsl	GSOS
	dw	$2008
	adrl	proVOLUME
	bcs	arASALLOWED

	lda	proVOLUME+$12
	cmp	#fstAppleShare
	bne	arASALLOWED
	
	lda	#readOnly
	rts
arASALLOWED	lda	#readWrite
	rts
	
*----------------------------
* DATA
*----------------------------

*--- GS/OS

proVOLUME	dw	5
	adrl	devName2
	adrl	volName
	ds	4
	ds	4
	ds	2
s
proGETSYSPREFS	dw	1
	ds	2

proSETSYSPREFS	dw	1
	ds	2

proDINFO	dw	2
	dw	1	; device number
	adrl	devName

devName	dw	36
devName2	dw	0
	ds	32

volName	dw	36
volName2	dw	0
	ds	32

*---

curPORT	ds	4
myWINDOW	ds	4

theCODE	ds	2	; A register from Desk Manager
curRESID	ds	2	; the curent resource file ID

appID	ds	2
myID	ds	2
myRESID	ds	2
fgOPEN	ds	2	; 0: not open

