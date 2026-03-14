*
* FM Radio NDA
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 2026
*

	xc
	xc
	mx	%00

*-------------- 

	use	4/Ctl.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
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

*-------------- GUI

wMAIN	=	1
refIsPointer	=	0
refIsHandle	=	1
refIsResource	=	2

*-------------- NDA

Period	=	60	; every second
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
	
	jsr	checkQDVersion
	bcs	ndaOPEN1
	plb
	rtl

*--- Open our window

ndaOPEN1	PushLong	#0
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

	PushWord	#0
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
	
	jsr	checkQDVersion	; check version
	bcs	ndaINIT1
	plb		; too low
	rtl

ndaINIT1	lda	theCODE	; check action code
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

doNULL
doEVENT
doRUN
doCURSOR
doUNDO
doCUT
doCOPY
doPASTE
doCLEAR
doSYSCLICK
doOPTIONALCLOSE
doREOPEN
	rts

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
	PushWord	#readOnly	; openAccess (no need to write)
	PushWord	appID	; userID
	_OpenResourceFileByID
	pla
	bcs	startRM1
	
	PushWord	#0
	_GetCurResourceFile
	PullWord	myRESID
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
stopRM1	rts

*----------------------------
* DRAW THE WINDOW
*----------------------------

PAINTMAIN	pha
	_GetCurResourceFile
	
	ldal	myRESID	; bank register not set
	pha
	_SetCurResourceFile
	
	pha
	pha
	_GetPort
	_DrawControls

	_SetCurResourceFile
	rtl

*----------------------------
* GET SYS PREFS
*----------------------------

getSYSPREFS	jsl	GSOS	; the old prefs
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
* SET SYS PREFS
*----------------------------

restoreSYSPREFS	php
	pha
	jsl	GSOS	; restore  the old prefs
	dw	$200c
	adrl	proGETSYSPREFS
	pla
	plp
	rts
	
*---

proGETSYSPREFS	dw	1
	ds	2

proSETSYSPREFS	dw	1
	ds	2

*----------------------------
* DATA
*----------------------------

curPORT	ds	4
myWINDOW	ds	4

theCODE	ds	2	; A register from Desk Manager
curRESID	ds	2	; the curent resource file ID

appID	ds	2
myID	ds	2
myRESID	ds	2
fgOPEN	ds	2	; 0: not open

