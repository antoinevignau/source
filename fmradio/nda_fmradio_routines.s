*
* FM Radio NDA
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 2026
*

	mx	%00

*
* Font: LED.24 font, ID#32671, from BRCC Font #4 disk
*

*----------------------------
* NDA ROUTINES
*----------------------------

doNULL
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
* doRUN
*----------------------------

doRUN	PushWord	#10
	PushWord	#10
	_MoveTo

	lda	theTICK
	bne	doRUN2

	PushLong	#strNULL

doRUN1	_DrawString
	
	lda	theTICK
	eor	#1
	sta	theTICK
	rts

doRUN2	PushLong	#strNONZERO
	bra	doRUN1

*---

theTICK	ds	2
strNULL	str	'------'
strNONZERO	str	'Brutal'

*----------------------------
* doEVENT
*----------------------------

iWHAT	=	0
iMESSAGE	=	2
iWHEN	=	6
iWHERE	=	10
iMODIFIERS	=	14

MAXEVENT	=	10

*---

doEVENT	pei	eventPtr+2
	pei	eventPtr
	PushLong	#taskWHAT
	PushLong	#16
	_BlockMove

	lda	[eventPtr]
	cmp	#MAXEVENT
	bcs	endEVENT
	asl
	tax
	
	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	
	jsr	(eventTBL,x)
endEVENT	rts

*----------------------------
* EVENT DATA
*----------------------------

*--- Event Record

taskWHAT	ds	2	; wmWhat           +0
taskMESSAGE	ds	4	; wmMessage        +2
taskWHEN	ds	4	; wmWhen           +6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS	ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16
taskMASK	adrl	$001fffff	; wmTaskMask       +20
	ds	4	; wmLastClickTick  +24
taskCLICKCOUNT	ds	2	; wmClickCount     +28
taskDATA2	ds	4	; wmTaskData2      +30
taskDATA3	ds	4	; wmTaskData3      +34
taskDATA4	ds	4	; wmTaskData4      +38
	ds	4	; wmLastClickPt    +42

*--- Event Table

eventTBL	da	doIGNORE	; 0 Null
	da	doMOUSE	; 1 Mouse-down
	da	doIGNORE	; 2 Mouse-up
	da	doKEY	; 3 Key-down
	da	doIGNORE	; 4 -
	da	doIGNORE	; 5 Auto-key
	da	doUPDATE	; 6 Update
	da	doIGNORE	; 7 -
	da	doACTIVATE	; 8 Activate
	da	doIGNORE	; 9 Switch

*----------------------------
* doIGNORE
*----------------------------

doIGNORE	rts

*----------------------------
* doKEY
*----------------------------

doKEY	_FlashMenuBar
	rts

*----------------------------
* doUPDATE
*----------------------------

doUPDATE	PushLong	myWINDOW
	_BeginUpdate

* Do something...
	
	PushLong	myWINDOW
	_EndUpdate
	rts

*----------------------------
* doACTIVATE
*----------------------------

doACTIVATE	rts

*----------------------------
* doMOUSE
*----------------------------

doMOUSE	PushLong	#taskWHERE
	_GlobalToLocal
	
	pha	; space
	pha	; eventMask - not used
	PushLong	#taskWHAT
	_TaskMasterDA
	pla
	
	cmp	#activateEvt
	bne	notActivate
	jmp	doACTIVATE

notActivate	cmp	#wInControl	; taskDATA2: control handle
	bne	notInControl	; taskDATA4: control ID

	lda	taskDATA4
	asl
	tax
	cmp	#tblCONTROL2-tblCONTROL
	bcs	notInControl
	jsr	(tblCONTROL,x)
notInControl	rts

*--- Control table

tblCONTROL	da	ctlNULL	; 0
	da	ctlVOLUME	; 1 - Volume scroll bar (0-100)
	da	ctlFREQUENCY	; 2 - Frequency scroll bar (0-641)
	da	ctlFREQ_MINUS	; 3 - Frequency--
	da	ctlFREQ_PLUS	; 4 - Frequency++
	da	ctlVOLUME_MINUS	; 5 - Volume--
	da	ctlVOLUME_PLUS	; 6 - Volume++
tblCONTROL2

*----------------------------
* CONTROL MANAGEMENT
*----------------------------

ctlNULL
	rts

*----------------------------
* CONTROL 1: VOLUME SCROLL BAR
*----------------------------

ctlVOLUME
	rts

*----------------------------
* CONTROL 2: FREQUENCY SCROLL BAR
*----------------------------

ctlFREQUENCY
	rts

*----------------------------
* CONTROL 3: FREQUENCY-- ICON BUTTON
*----------------------------

ctlFREQ_MINUS
	rts
	
*----------------------------
* CONTROL 4: FREQUENCY++ ICON BUTTON
*----------------------------

ctlFREQ_PLUS
	rts
*----------------------------
* CONTROL 5: VOLUME-- ICON BUTTON
*----------------------------

ctlVOLUME_MINUS
	rts
	
*----------------------------
* CONTROL 6: VOLUME++ ICON BUTTON
*----------------------------

ctlVOLUME_PLUS
	rts
