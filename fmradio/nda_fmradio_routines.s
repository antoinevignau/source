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
POPUP_FREQ	=	$1740	; liste des fréquences enregistrées
BTN_REMOVE	=	10	; remove a station from the list
BTN_ADD	=	11	; add a station to the list
STAT_CHANNEL	=	12	; enter name:
LE_NAME	=	13	; line edit
BTN_CANCEL	=	14	; cancel
BTN_SAVE	=	15	; save

MENU_CHANNEL	=	$1740	; the channel menu ID
ITEM_CHANNEL	=	$1741	; the channel menu item ID
RES_CHANNEL	=	$bd	; the resource type+ID that holds saved channels
FIRST_ITEM	=	$1780	; the first menu ID in the pop-up

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
	cmp	#POPUP_FREQ	; handle $1740...
	bne	doCONTROL1
	lda	#9
doCONTROL1	asl
	tax
	cmp	#tblCONTROL2-tblCONTROL
	bcs	endEVENT
	jsr	(tblCONTROL,x)
endEVENT	rts

*--- Control table

tblCONTROL	da	ctlNULL	;  0
	da	ctlVOL	;  1 - Volume scroll bar (0-100)
	da	ctlFREQ	;  2 - Frequency scroll bar (0-641)
	da	doFREQ_MINUS	;  3 - Frequency--
	da	doFREQ_PLUS	;  4 - Frequency++
	da	doVOL_MINUS	;  5 - Volume--
	da	doVOL_PLUS	;  6 - Volume++
	da	ctlNULL	;  7 - 87.5
	da	ctlNULL	;  8 - 108
	da	doPOPUP	;  9 - Pop-up menu (is $7140)
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

ctlVOL	ldx	#SC_VOL
	jsr	getCTLVALUE
	sta	theVOL
	jmp	lacie_setVOLUME

*----------------------------
* CONTROL 2: FREQUENCY SCROLL BAR
*----------------------------

ctlFREQ	ldx	#SC_FREQ
	jsr	getCTLVALUE
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

doPOPUP	ldx	#POPUP_FREQ
	jsr	getCTLVALUE
	sta	theMENU

	ldx	#0	; compare menu IDs
]lp	lda	menuITEM1+2,x
	beq	popupEXIT
	cmp	theMENU
	beq	popupFOUND	; we're good
	bcs	popupEXIT	; we're above
	txa
	clc
	adc	#16
	tax
	cpx	#256
	bne	]lp
popupEXIT	rts		; not found

popupFOUND	lda	channelFREQ1,x	; get the frequency index
	beq	popupEXIT	; if it exists...
	jmp	change_FREQ	; and jumps to it

*----------------------------
* REMOVE STATION
*----------------------------

doSTAT_MINUS	ldx	#POPUP_FREQ
	jsr	getCTLVALUE
	cmp	#ITEM_CHANNEL	; is this the first entry?
	bne	doSM_2	; no, a real entry
doSM_1	rts		; yes, exit

doSM_2	sta	theMENU	; the menu item ID

	ldx	#0	; find it into the list
]lp	lda	menuITEM1+2,x
	beq	doSM_1
	cmp	theMENU
	beq	doSM_3	; we're good
	bcs	doSM_1	; we're above
	txa
	clc
	adc	#16
	tax
	cpx	#256
	bcc	]lp
	bcs	doSM_1

doSM_3	stx	theINDEX	; we save the index of the entry (0..16..32)
	
* menu templates do not change: delete the last entry from the end to the beginning

	ldx	#256-16
]lp	lda	menuITEM1+2,x
	bne	doSM_4	; found an entry
	txa
	sec
	sbc	#16
	tax
	bpl	]lp
	bmi	doSM_5

doSM_4	stz	menuITEM1+2,x

* must move all channel entries up by one entry

doSM_5	ldx	theINDEX	; special case: the last entry
	cpx	#256-16
	beq	doSM_6	; we just erase the last entry

	lda	theINDEX	; from
	clc
	adc	#16
	tay
	ldx	theINDEX	; to
	
]lp	lda	channelFREQ1,y	; menuITEM1,x = menuITEM1,y
	sta	channelFREQ1,x	; until the end of the array
	iny
	iny
	inx
	inx
	cpy	#256	; y > x de 16
	bne	]lp	; si Y=256 alors X=240

doSM_6	stz	channelFREQ1,x	; clear the last array
	inx
	inx
	cpx	#256
	bne	doSM_6

* set the resource file

	pha
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile

* rebuild the menu

	jsr	setMENUBAR	; set my bar

	lda	#16
	sta	theINDEX
	lda	#FIRST_ITEM	; menu item ID
	sta	theMENU
	
]lp	PushWord	theMENU
	_DeleteMItem
	bcs	doSM_7
	inc	theMENU
	dec	theINDEX
	bne	]lp
	
doSM_7	jsr	buildMENU	; build the menu

	lda	#ITEM_CHANNEL	; refresh menu entry
	sta	theMENUID

	jmp	markRESOURCE	; update & exit

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

	ldx	#16-2	; pre-clear the buffer
]lp	stz	theNAME,x	; if the LineEdit is empty
	dex
	dex
	bpl	]lp

	PushLong	myWINDOW2	; get the name
	PushLong	#LE_NAME
	PushLong	#theNAME
	_GetLETextByID

	jsr	closeChannelWindow
	jmp	addCHANNEL

doSP_END	jmp	closeChannelWindow

*----------------------------
* LOAD SAVED CHANNELS
*----------------------------

loadCHANNELS
	pha
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
	bcc	loadOK

	jsr	createRESOURCE	; create the resource if missing
	
loadOK	PushLong	haRESOURCE	; copy it
	PushLong	#channelFREQ1
	PushLong	#256
	_HandToPtr

	jsr	setMENUBAR	; set my menu bar
	jsr	buildMENU	; create the menu

	lda	#ITEM_CHANNEL
	sta	theMENUID

*--- The common end (used by different routines)

exitPOPUP	PushWord	#0
	PushWord	#0
	PushWord	#MENU_CHANNEL
	_CalcMenuSize

	lda	theMENUID
	ldx	#POPUP_FREQ
	jsr	setCTLVALUE

	_SetCurResourceFile
	rts

*---

theMENUID	ds	2
haRESOURCE	ds	4

*----------------------------
* MENU BAR
*----------------------------

*--- Set my menu bar

setMENUBAR      pha
                pha
                _GetMenuBar
                PullLong	theMENUBAR

	pha
	pha
                PushLong	myWINDOW
                PushLong	#POPUP_FREQ
                _GetCtlHandleFromID
                _SetMenuBar
	rts

*--- Restore the previous menu bar

restoreMENUBAR	PushLong	theMENUBAR
	_SetMenuBar
	rts

*---

theMENUBAR	ds	4

*----------------------------
* BUILD THE MENUS
*----------------------------

buildMENU	ldx	#0
]lp	lda	channelFREQ1,x
	beq	exitBUILDMENU

	stx	theINDEX
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

	lda	theINDEX
	clc
	adc	#16
	tax
	cpx	#256
	bne	]lp
exitBUILDMENU	rts

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

	pha
	_GetCurResourceFile
	PushWord	myRESID
	_SetCurResourceFile


*--- Copy channel frequency and name

	ldx	theINDEX	; copy the frequency
	lda	theFREQ
	sta	channelFREQ1,x
	
	PushLong	#theNAME	; copy the channel name
	pea	^channelNAME1
	lda	theINDEX
	clc
	adc	#channelNAME1
	pha
	PushLong	#16
	_BlockMove

*--- Create the menu item

	jsr	setMENUBAR
	
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
	PushWord	#MENU_CHANNEL
	_InsertMItem2		; add the menu item

	lda	theMENU
	sta	theMENUID
	
*--- Update the resource

markRESOURCE	PushLong	#channelFREQ1
	PushLong	haRESOURCE
	PushLong	#256
	_PtrToHand

	PushWord	#$ffff	; tell the resource has changed
	PushWord	#RES_CHANNEL
	PushLong	#1
	_MarkResourceChange

	jmp	exitPOPUP	; refresh the menu and restore data

*---

theMENU	ds	2	; the menu index
theNAME	ds	16	; channel name

*----------------------------
* CREATE RESOURCE
*----------------------------

createRESOURCE	pha		; ask for 256 bytes
	pha
	PushLong	#256
	PushWord	myID
	PushWord	#%1000_0000_0001_1100
	PushLong	#0
	_NewHandle
	PullLong	haRESOURCE

	PushLong	#channelFREQ1	; copy the data into the handle
	PushLong	haRESOURCE
	PushLong	#256
	_PtrToHand

	PushLong	haRESOURCE	; add the resource
	PushWord	#%1000_0000_0001_1100
	PushWord	#RES_CHANNEL
	PushLong	#1
	_AddResource

	PushWord	#$ffff	; tell the resource has changed
	PushWord	#RES_CHANNEL
	PushLong	#1
	_MarkResourceChange

	rts

*----------------------------
* DATA
*----------------------------

theVOL	dw	DFT_VOL
theFREQ	dw	DFT_FREQ	; the index of the frequency, not the frequency :-(
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
