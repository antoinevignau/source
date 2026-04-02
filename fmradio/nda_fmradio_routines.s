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
* EQUATES
*----------------------------

MIN_VOL	=	0
MAX_VOL	=	100

MIN_FREQ	=	0
MAX_FREQ	=	640

DFT_VOL	=	50	; 0..100
DFT_FREQ	=	320	; 0..641
DFT_OFF	=	0
DFT_ON	=	1

SC_VOL	=	1	; Control IDs
SC_FREQ	=	2
BTN_FREQ_MINUS	=	3
BTN_FREQ_PLUS	=	4
BTN_VOL_MINUS	=	5
BTL_VOL_PLUS	=	6

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
	eor	#DFT_ON
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

	lda	#$ffff
	sta	taskMASK
	lda	#$001f
	sta	taskMASK+2
	
	pha	; space
	pha	; eventMask - not used
	PushLong	#taskWHAT
	_TaskMasterDA
	pla

	cmp	#wInControl	; taskDATA2: control handle
	beq	doCONTROL	; taskDATA4: control ID

	cmp	#keyDownEvt
	bne	endEVENT

	jmp	ctlKEYS

doCONTROL	lda	taskDATA4
	asl
	tax
	cmp	#tblCONTROL2-tblCONTROL
	bcs	endEVENT
	jsr	(tblCONTROL,x)
endEVENT	rts

*--- Control table

tblCONTROL	da	ctlNULL	; 0
	da	ctlVOL	; 1 - Volume scroll bar (0-100)
	da	ctlFREQ	; 2 - Frequency scroll bar (0-641)
	da	doFREQ_MINUS	; 3 - Frequency--
	da	doFREQ_PLUS	; 4 - Frequency++
	da	doVOL_MINUS	; 5 - Volume--
	da	doVOL_PLUS	; 6 - Volume++
tblCONTROL2


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

*----------------------------
* CONTROL MANAGEMENT
*----------------------------

ctlNULL	rts

*----------------------------
* GET CONTROL VALUE
*----------------------------
* X: control ID
* A: current value

getCTLVALUE	pha		; space
	PushLong	myWINDOW	; windPtr
	pea	$0000	; ctlID
	phx
	_GetCtlValueByID
	pla
	rts

*----------------------------
* SET CONTROL VALUE
*----------------------------
* A: new value
* X: control ID

setCTLVALUE	pha		; newValue
	PushLong	myWINDOW	; windPtr
	pea	$0000	; ctlID
	phx
	_SetCtlValueByID
	rts

*----------------------------
* CHECK KEYS
*----------------------------
* Volume:    + increase
*            - decrease
* Frequency: < forward
*            > backward
* RDS:       R toggle on/off
* Mute:      M toggle on/off

KEY_VOL_MINUS	=	'-'
KEY_VOL_PLUS	=	'+'
KEY_FREQ_MINUS	=	'<'
KEY_FREQ_PLUS	=	'>'
KEY_RDS1	=	'R'
KEY_RDS2	=	'r'
KEY_MUTE1	=	'M'
KEY_MUTE2	=	'm'

*---

ctlKEYS	lda	taskMESSAGE
	and	#$ff
	cmp	#KEY_VOL_MINUS
	bne	ctlKEYS1

	jmp	doVOL_MINUS
	
ctlKEYS1	cmp	#KEY_VOL_PLUS
	bne	ctlKEYS2

	jmp	doVOL_PLUS
	
ctlKEYS2	cmp	#KEY_FREQ_MINUS
	bne	ctlKEYS3

	jmp	doFREQ_MINUS
	
ctlKEYS3	cmp	#KEY_FREQ_PLUS
	bne	ctlKEYS4

	jmp	doFREQ_PLUS
	
ctlKEYS4	cmp	#KEY_RDS1
	beq	ctlKEYS5
	cmp	#KEY_RDS2
	bne	ctlKEYS6
ctlKEYS5	jmp	doRDS	

ctlKEYS6	cmp	#KEY_MUTE1
	beq	ctlKEYS7
	cmp	#KEY_MUTE2
	bne	ctlKEYS8
ctlKEYS7	jmp	doMUTE

ctlKEYS8	rts

*----------------------------
* MOVE THE THUMB
*----------------------------
* X: control ID
* A: new value

refreshTHUMB	stx	theCTL
	sta	thePARAM	; new value
	
	pha		; space for result
	pha
	pha		; space for result
	pha
	PushLong	myWINDOW	; ctlWindowPtr
	PushLong	theCTL	; ctlID
	_GetCtlHandleFromID
	PushWord	#9	; move_thumb
	PushLong	thePARAM	; ctlParam = new value
	_CallCtlDefProc
	pla
	pla
	rts

*---

theCTL	ds	4
thePARAM	ds	4

*----------------------------
* CONTROL 1: VOLUME SCROLL BAR
*----------------------------

ctlVOL	pha
	PushLong	myWINDOW
	PushLong	#SC_VOL
	_GetCtlValueByID
	pla
	sta	theVOL
	rts

*----------------------------
* CONTROL 2: FREQUENCY SCROLL BAR
*----------------------------

ctlFREQ	pha
	PushLong	myWINDOW
	PushLong	#SC_FREQ
	_GetCtlValueByID
	pla
	sta	theFREQ
	rts

*----------------------------
* SPECIFIC CHIP ROUTINES
*----------------------------

*----------------------------
* DECREASE VOLUME
*----------------------------

doVOL_MINUS	ldx	#SC_VOL
	jsr	getCTLVALUE
	cmp	#MIN_VOL
	bcc	endVOL_MINUS
	beq	endVOL_MINUS
	dec
	sta	theVOL
	ldx	#SC_VOL
	jsr	setCTLVALUE
	ldx	#SC_VOL
	lda	theVOL
	jmp	refreshTHUMB
endVOL_MINUS	rts

*----------------------------
* INCREASE VOLUME
*----------------------------

doVOL_PLUS	ldx	#SC_VOL
	jsr	getCTLVALUE
	cmp	#MAX_VOL
	bcs	endVOL_PLUS
	inc
	sta	theVOL
	ldx	#SC_VOL
	jsr	setCTLVALUE
	ldx	#SC_VOL
	lda	theVOL
	jmp	refreshTHUMB
endVOL_PLUS	rts

*----------------------------
* DECREASE FREQUENCY
*----------------------------

doFREQ_MINUS	ldx	#SC_FREQ
	jsr	getCTLVALUE
	cmp	#MIN_FREQ
	bcc	endFREQ_MINUS
	beq	endFREQ_MINUS
	dec
	sta	theFREQ
	ldx	#SC_FREQ
	jsr	setCTLVALUE
	ldx	#SC_FREQ
	lda	theFREQ
	jmp	refreshTHUMB
endFREQ_MINUS	rts

*----------------------------
* INCREASE FREQUENCY
*----------------------------

doFREQ_PLUS	ldx	#SC_FREQ
	jsr	getCTLVALUE
	cmp	#MAX_FREQ
	bcs	endFREQ_PLUS
	inc
	sta	theFREQ
	ldx	#SC_FREQ
	jsr	setCTLVALUE
	ldx	#SC_FREQ
	lda	theFREQ
	jmp	refreshTHUMB
endFREQ_PLUS	rts

*----------------------------
* TOGGLE RD ON/OFF
*----------------------------

doRDS	lda	fgRDS
	eor	#DFT_ON
	sta	fgRDS
	rts

*----------------------------
* TOGGLE MUTE ON/OFF
*----------------------------

doMUTE	lda	fgMUTE
	eor	#DFT_ON
	sta	fgMUTE
	rts

*----------------------------
* DATA
*----------------------------

theVOL	ds	DFT_VOL
theFREQ	ds	DFT_FREQ
fgMUTE	dw	DFT_OFF	; 0: off, 1: on
fgRDS	dw	DFT_ON	; 0: off, 1: on
