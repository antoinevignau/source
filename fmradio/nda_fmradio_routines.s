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
MAX_FREQ	=	410

DFT_VOL	=	50	; 0..100
DFT_FREQ	=	205	; 0..410
DFT_OFF	=	0
DFT_ON	=	1

SC_VOL	=	1	; Control IDs
SC_FREQ	=	2
BTN_FREQ_MINUS	=	3
BTN_FREQ_PLUS	=	4
BTN_VOL_MINUS	=	5
BTN_VOL_PLUS	=	6
STAT_LOW	=	7	; 87.5
STAT_HIGH	=	8	; 108
POPUP_FREQ	=	9	; liste des fréquences enregistrées
BTN_REMOVE	=	10	; remove a station from the list
BTN_ADD	=	11	; add a station to the list
STAT_CHANNEL	=	12	; enter name:
LE_NAME	=	13	; line edit
BTN_CANCEL	=	14	; cancel
BTN_SAVE	=	15	; save

MENU_CHANNEL	=	1	; the channel menu ID
RES_CHANNEL	=	$bd	; the resource type+ID that holds saved channels
FIRST_ITEM	=	$bd00	; the first menu ID in the pop-up

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

doRUN	rts

*	PushWord	#10
*	PushWord	#10
*	_MoveTo
*
*	PushWord #$0800
*	PushWord #65534		; Shaston.8
*	PushWord #0
*	_InstallFont
*
*	lda	theTICK
*	bne	doRUN2
*
*	PushLong	#strNULL
*
*doRUN1	_DrawString
*	
*	lda	theTICK
*	eor	#DFT_ON
*	sta	theTICK
*	rts
*
*doRUN2	PushLong	#strNONZERO
*	bra	doRUN1
*
*---
*
*theTICK	ds	2
*strNULL	str	'------'
*strNONZERO	str	'Brutal'

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
	da	ctlVOL	;  1 - Volume scroll bar (0-100)
	da	ctlFREQ	;  2 - Frequency scroll bar (0-641)
	da	doFREQ_MINUS	;  3 - Frequency--
	da	doFREQ_PLUS	;  4 - Frequency++
	da	doVOL_MINUS	;  5 - Volume--
	da	doVOL_PLUS	;  6 - Volume++
	da	ctlNULL	;  7 - 87.5
	da	ctlNULL	;  8 - 108
	da	doPOPUP	;  9 - Pop-up menu
	da	doSTAT_MINUS	; 10 - Remove station
	da	doSTAT_PLUS	; 11 - Add station
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
	jmp	lacie_setVOLUME

*----------------------------
* CONTROL 2: FREQUENCY SCROLL BAR
*----------------------------

ctlFREQ	pha
	PushLong	myWINDOW
	PushLong	#SC_FREQ
	_GetCtlValueByID
	pla
	sta	theFREQ
	jsr	lacie_setFREQUENCY
	jmp	lacie_printFREQUENCY

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
	jsr	refreshTHUMB
	jmp	lacie_setVOLUME
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
	jsr	refreshTHUMB
	jmp	lacie_setVOLUME
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
	jsr	refreshTHUMB
	jsr	lacie_setFREQUENCY
	jmp	lacie_printFREQUENCY
endFREQ_MINUS	rts

*----------------------------
* INCREASE FREQUENCY
*----------------------------

doFREQ_PLUS	ldx	#SC_FREQ
	jsr	getCTLVALUE
	cmp	#MAX_FREQ
	bcs	endFREQ_PLUS
	inc
change_FREQ	sta	theFREQ
	ldx	#SC_FREQ
	jsr	setCTLVALUE
	ldx	#SC_FREQ
	lda	theFREQ
	jsr	refreshTHUMB
	jsr	lacie_setFREQUENCY
	jmp	lacie_printFREQUENCY
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
	jmp	lacie_setVOLUME

*----------------------------
* STATION POP-UP
*----------------------------

doPOPUP	pha		; get the menu ID
	PushLong	myWINDOW2
	PushLong	#POPUP_FREQ
	_GetCtlValueByID
	pla
	sta	theINDEX
	
	ldx	#0	; compare menu IDs
]lp	lda	menuITEM1+2,x
	beq	popupEXIT
	cmp	theINDEX
	beq	popupFOUND	; we're good
	bcs	popupEXIT	; we're above
	txa
	clc
	adc	#16
	tax
	cpx	#256
	bcc	]lp
popupEXIT	rts		; not found

popupFOUND	lda	channelFREQ1,x	; get the frequency
	beq	popupEXIT	; if it exists...
	jmp	POPUP_FREQ	; and jumps to it

*----------------------------
* REMOVE STATION
*----------------------------

doSTAT_MINUS
	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts

*----------------------------
* ADD STATION
*----------------------------

doSTAT_PLUS	jsr	makeChannelWindow

]lp	pha
	pha
	PushLong	#taskWHAT	; eventPtr
	PushLong	#0	; updateProc
	PushLong	#0	; eventHook
	PushLong	#0	; beepProc
	PushWord	#0	; flags
	_DoModalWindow
	pla
	plx
	cpx	#0
	bne	doSP_END

	cmp	#BTN_CANCEL
	beq	doSP_END
	cmp	#BTN_SAVE
	bne	]lp

	jsr	addCHANNEL
	
doSP_END	jmp	closeChannelWindow

*----------------------------
* LOAD SAVED CHANNELS
*----------------------------

loadCHANNELS	pha
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile

	pha		; we assume the resource is always present
	pha
	PushWord	#RES_CHANNEL
	PushLong	#1
	_LoadResource
	pla
	sta	haRESOURCE
	pla
	sta	haRESOURCE+2

	PushLong	haRESOURCE	; copy it
	PushLong	#channelFREQ1
	PushLong	#256
	_HandToPtr

*--- Create the menu items

	ldx	#0
]lp	lda	channelFREQ1,x
	bne	loadFOUND

*---

exitPOPUP	PushWord	#0
	PushWord	#0
	PushWord	#MENU_CHANNEL
	_CalcMenuSize
	
	_SetCurResourceFile
	rts

*---

loadFOUND	stx	theINDEX

	txa
	lsr
	lsr
	lsr
	lsr
	clc
	adc	#FIRST_ITEM	; add the first menu item ID
	sta	menuITEM1+2,x

	PushWord	#refIsPointer	; refDesc
	pea	^menuITEM1	; menuItemTRef
	lda	theINDEX
	clc
	adc	#menuITEM1
	pha
	PushWord	#$ffff	; insertAfter
	PushWord	#MENU_CHANNEL
	_InsertMItem2		; add the menu item

	ldx	theINDEX
	txa
	clc
	adc	#16
	tax
	cpx	#256
	bcc	]lp
	bcs	exitPOPUP

*---

haRESOURCE	ds	4

*----------------------------
* INSERT NEW STATION
*----------------------------

addCHANNEL	ldx	#0
]lp	lda	channelFREQ1,x	; is there room?
	beq	addFOUND	; yes
	txa
	clc
	adc	#16
	tax
	cpx	#256
	bcc	]lp

	_SysBeep		; no room
	rts		; exit
	
*--- We found a room, add the entry

addFOUND	stx	theINDEX
	txa
	lsr
	lsr
	lsr
	lsr
	clc
	adc	#FIRST_ITEM	; add the first menu item ID
	sta	theMENU	; save for later

*---

	ldx	#16-2	; pre-clear the buffer
]lp	stz	theNAME,x	; if the LineEdit is empty
	dex
	dex
	bpl	]lp

	PushLong	myWINDOW2
	PushLong	#LE_NAME
	PushLong	#theNAME
	_GetLETextByID

*--- Create the menu item

	ldx	theINDEX	; save the menu item ID
	lda	theMENU
	sta	menuITEM1+2,x

	PushWord	#refIsPointer	; refDesc
	pea	^menuITEM1	; menuItemTRef
	lda	theINDEX
	clc
	adc	#menuITEM1
	pha
	PushWord	#$ffff	; insertAfter
	PushWord	#POPUP_FREQ
	_InsertMItem2		; add the menu item
	
*--- Update the resource

	PushLong	#channelFREQ1
	PushLong	haRESOURCE
	PushLong	#256
	_PtrToHand

	pha
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile

	PushWord	#$ffff	; tell the resource has changed
	PushWord	#RES_CHANNEL
	PushLong	#1
	_MarkResourceChange

	_SetCurResourceFile
	rts

*---

theMENU	ds	2	; the menu index
theNAME	ds	16	; channel name

*----------------------------
* DATA
*----------------------------

theVOL	dw	DFT_VOL
theFREQ	dw	DFT_FREQ
fgMUTE	dw	DFT_OFF	; 0: off, 1: on
fgRDS	dw	DFT_ON	; 0: off, 1: on

*----------------------------
* CHANNEL DATA
*----------------------------
* +0 word frequency
* +2 pstr channel name
*

channelFREQ1	ds	2	; frequency
channelNAME1	ds	14	; channel name
channelFREQ2	ds	2
channelNAME2	ds	14
channelFREQ3	ds	2
channelNAME3	ds	14
channelFREQ4	ds	2
channelNAME4	ds	14
channelFREQ5	ds	2
channelNAME5	ds	14
channelFREQ6	ds	2
channelNAME6	ds	14
channelFREQ7	ds	2
channelNAME7	ds	14
channelFREQ8	ds	2
channelNAME8	ds	14
channelFREQ9	ds	2
channelNAME9	ds	14
channelFREQ10	ds	2
channelNAME10	ds	14
channelFREQ11	ds	2
channelNAME11	ds	14
channelFREQ12	ds	2
channelNAME12	ds	14
channelFREQ13	ds	2
channelNAME13	ds	14
channelFREQ14	ds	2
channelNAME14	ds	14
channelFREQ15	ds	2
channelNAME15	ds	14
channelFREQ16	ds	2
channelNAME16	ds	14

*---
*  +0 word version
*  +2 word itemID	<- à toucher
*  +4 byte itemChar
*  +5 byte itemAltChar
*  +6 word itemCheck
*  +8 word itemFlag
* +10 long itemTitleRef
* j'ajoute un word pour faire 16
*

menuITEM1	ds	10
	adrl	channelNAME1
	ds	2
menuITEM2	ds	10
	adrl	channelNAME2
	ds	2
menuITEM3	ds	10
	adrl	channelNAME3
	ds	2
menuITEM4	ds	10
	adrl	channelNAME4
	ds	2
menuITEM5	ds	10
	adrl	channelNAME5
	ds	2
menuITEM6	ds	10
	adrl	channelNAME6
	ds	2
menuITEM7	ds	10
	adrl	channelNAME7
	ds	2
menuITEM8	ds	10
	adrl	channelNAME8
	ds	2
menuITEM9	ds	10
	adrl	channelNAME9
	ds	2
menuITEM10	ds	10
	adrl	channelNAME10
	ds	2
menuITEM11	ds	10
	adrl	channelNAME11
	ds	2
menuITEM12	ds	10
	adrl	channelNAME12
	ds	2
menuITEM13	ds	10
	adrl	channelNAME13
	ds	2
menuITEM14	ds	10
	adrl	channelNAME14
	ds	2
menuITEM15	ds	10
	adrl	channelNAME15
	ds	2
menuITEM16	ds	10
	adrl	channelNAME16
	ds	2

*--- Ce n'est pas beau mais bon...

