*
* Plamen FM Radio NDA
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
MAX_FREQ	=	210
STEP_FREQ	=	1

SC_VOL	=	1	; Control IDs
SC_FREQ	=	2
BTN_FREQ_MINUS	=	3
BTN_FREQ_PLUS	=	4
BTN_VOL_MINUS	=	5
BTN_VOL_PLUS	=	6
STAT_LOW	=	7	; 87.5
STAT_HIGH	=	8	; 108
iPOPUP_FREQ	=	9
POPUP_FREQ	=	$1740	; liste des fréquences enregistrées
BTN_REMOVE	=	10	; remove a station from the list
BTN_ADD	=	11	; add a station to the list
STAT_CHANNEL	=	12	; enter name:
LE_NAME	=	13	; line edit
BTN_CANCEL	=	14	; cancel
BTN_SAVE	=	15	; save
BTN_MUTE_SOFT	=	16	; soft mute
BTN_MUTE	=	17	; hard mute
BTN_SCAN_MINUS	=	18	; scan to <<
BTN_SCAN_PLUS	=	19	; scan to >>
BTN_BASS_BOOST	=	20	; bass BOOST
BTN_MONO_STEREO	=	21	; mono/stereo switch
BTN_RDS	=	22	; RDS switch
iPOPUP_BAND	=	23	; fake
iPOPUP_SPACING	=	24	; fake
POPUP_BAND	=	$1840	; liste des bandes possibles
POPUP_SPACING	=	$1940	; liste des pas de fréquences

MENU_CHANNEL	=	$1740	; the channel menu ID
ITEM_CHANNEL	=	$1741	; the channel menu item ID

MENU_BAND	=	$1840	; the band menu ID
BAND_EU	=	$1841	; the band menu item ID
BAND_JP	=	$1842	; the band menu item ID
BAND_WW	=	$1843	; the band menu item ID
BAND_EE	=	$1844	; the band menu item ID

MENU_SPACING	=	$1940	; the spacing menu ID
SPACING_100	=	$1941	; the spacing menu item ID
SPACING_200	=	$1942	; the spacing menu item ID
SPACING_50	=	$1943	; the spacing menu item ID
SPACING_25	=	$1944	; the spacing menu item ID

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

doRUN	sep	#$30		; refresh radio status
	jsr	RADIO_UPDATE_STATUS
	
	lda	STATE_ISTUNING		; are we tuning?
	cmp	#TRUE		; yes,
	beq	doRUN_1		; skip refresh
	
	jsr	plamen_printFREQUENCY	; return in 16-bit

doRUN_1	jmp	plamen_printRDS		; return in 16-bit

	mx	%00
	
*----------------------------
* doEVENT
*----------------------------

iWHAT	=	0
iMESSAGE	=	2
iWHEN	=	641
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
	
	pha		; space
	pha		; eventMask - not used
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
	lda	#iPOPUP_FREQ
	bra	doCONTROL3
doCONTROL1	cmp	#POPUP_BAND	; handle $1840...
	bne	doCONTROL2
	lda	#iPOPUP_BAND
	bra	doCONTROL3
doCONTROL2	cmp	#POPUP_SPACING	; handle $1940...
	bne	doCONTROL3
	lda	#iPOPUP_SPACING
doCONTROL3	asl
	tax
	cmp	#tblCONTROL2-tblCONTROL
	bcs	endEVENT
	jsr	(tblCONTROL,x)
endEVENT	rts

*--- Control table

tblCONTROL	da	ctlNULL	;  0
	da	ctlNULL	;  1 - Volume scroll bar (0-100)
	da	ctlNULL	;  2 - Frequency scroll bar (0-641)
	da	doFREQ_MINUS	;  3 - Frequency--
	da	doFREQ_PLUS	;  4 - Frequency++
	da	doVOL_MINUS	;  5 - Volume--
	da	doVOL_PLUS	;  6 - Volume++
	da	ctlNULL	;  7 - 87.5
	da	ctlNULL	;  8 - 108
	da	doPOPUP	;  9 - Pop-up menu (is $1740)
	da	ctlNULL	; 10 - Remove station (doSTAT_MINUS)
	da	doSTAT_PLUS	; 11 - Add station (doSTAT_PLUS)
	da	ctlNULL	; 12
	da	ctlNULL	; 13
	da	ctlNULL	; 14
	da	ctlNULL	; 15
	da	doMUTE_SOFT	; 16 - Soft mute
	da	doMUTE	; 17 - Hard mute
	da	doSCAN_MINUS	; 18 - Scan--
	da	doSCAN_PLUS	; 19 - Scan++
	da	doBASS_BOOST	; 20 - Bass boost
	da	doMONO_STEREO	; 21 - Mono/Stereo
	da	doRDS	; 22 - RDS
	da	doPOPUP_BAND	; 23 - Pop-up menu BAND (is $1840)
	da	doPOPUP_SPACING	; 24 - Pop-up menu SPACING (is $1940)
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
* SET CONTROL VALUE AND DRAW
*----------------------------
* A: new value
* X: control ID

setCTLVALUEANDDRAW
	stx	theCTLID	; the control ID

	pha		; newValue
	PushLong	myWINDOW	; windPtr
	pea	$0000	; ctlID
	phx
	_SetCtlValueByID

	pha		; space for result
	pha
	PushLong	myWINDOW	; ctlWindowPtr
	PushLong	theCTLID
	_GetCtlHandleFromID
	_DrawOneCtl
	rts

*--- Data

theCTLID	ds	4

*----------------------------
* UPDATE BUTTONS
*----------------------------

updateBUTTONS	jsr	drawMUTE_SOFT
	jsr	drawMUTE
	jsr	drawBASS_BOOST
	jsr	drawMONO_STEREO
	jsr	drawRDS

	lda	STATE_CURRENTPRESET	; 1..8
	clc
	adc	#MENU_CHANNEL	; +1740
	ldx	#POPUP_FREQ
	jsr	setCTLVALUE
	
	lda	theBAND	; 0..3
	clc
	adc	#BAND_EU	; +1841
	ldx	#POPUP_BAND
	jsr	setCTLVALUE

	lda	theSPACING	; 0..3
	clc
	adc	#SPACING_100	; +1941
	ldx	#POPUP_SPACING
	jsr	setCTLVALUE

	rts		; yeah, no JMP above!

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
KEY_SOFTMUTE1	=	'S'
KEY_SOFTMUTE2	=	's'

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

ctlKEYS8	cmp	#KEY_SOFTMUTE1
	beq	ctlKEYS9
	cmp	#KEY_SOFTMUTE2
	bne	ctlKEYS99
ctlKEYS9	jmp	doMUTE_SOFT
	
ctlKEYS99	rts

*----------------------------
* SPECIFIC CHIP ROUTINES
*----------------------------

*----------------------------
* DECREASE VOLUME
*----------------------------

doVOL_MINUS	sep	#$30
	lda	STATE_VOLUME
	cmp	#MIN_VOL
	bcc	endVOL_MINUS
	beq	endVOL_MINUS
	dec
	sta	STATE_VOLUME
	jsr	RADIO_SET_VOLUME
endVOL_MINUS	rep	#$30
	rts

*----------------------------
* INCREASE VOLUME
*----------------------------

doVOL_PLUS	sep	#$30
	lda	STATE_VOLUME
	cmp	#MAX_VOL
	bcs	endVOL_PLUS
	inc
	sta	STATE_VOLUME
	jsr	RADIO_SET_VOLUME
endVOL_PLUS	rep	#$30
	rts

*----------------------------
* DECREASE FREQUENCY
*----------------------------

doFREQ_MINUS	sep	#$30
	jsr	HandleKeyTuneDown
	rep	#$30
	rts

*----------------------------
* INCREASE FREQUENCY
*----------------------------

doFREQ_PLUS	sep	#$30
	jsr	HandleKeyTuneUp
	rep	#$30
	rts
	
*----------------------------
* CHANGE FREQUENCY
*----------------------------

change_FREQ	sta	STATE_FREQ_L
	sta	PARAM_L
	sep	#$30
	jsr	RADIO_TUNE_TO
	rep	#$30
	rts

*----------------------------
* SCAN <<
*----------------------------

doSCAN_MINUS	sep	#$30
	jsr	RADIO_SEEK_DOWN
	rep	#$30
	rts

*----------------------------
* SCAN >>
*----------------------------

doSCAN_PLUS	sep	#$30
	jsr	RADIO_SEEK_UP
	rep	#$30
	rts

*----------------------------
* TOGGLE RDS ON/OFF
*----------------------------

doRDS	sep	#$30
	lda	STATE_ISRDSENABLED
	eor	#TRUE
	jsr	RADIO_SET_RDS
	rep	#$30
	
drawRDS	lda	STATE_ISRDSENABLED
	and	#$ff
	beq	doRDS_1
	lda	#1
doRDS_1	ldx	#BTN_RDS
	jmp	setCTLVALUEANDDRAW

*----------------------------
* TOGGLE MUTE ON/OFF
*----------------------------

doMUTE	sep	#$30
	lda	STATE_ISMUTED
	eor	#TRUE
	jsr	RADIO_SET_MUTE
	rep	#$30
	
drawMUTE	lda	STATE_ISMUTED
	and	#$ff
	beq	doMUTE_1
	lda	#1
doMUTE_1	ldx	#BTN_MUTE
	jmp	setCTLVALUEANDDRAW

*----------------------------
* TOGGLE SOFT MUTE ON/OFF
*----------------------------

doMUTE_SOFT	sep	#$30
	lda	STATE_ISSOFTMUTE
	eor	#TRUE
	jsr	RADIO_SET_SOFTMUTE
	rep	#$30

drawMUTE_SOFT	lda	STATE_ISSOFTMUTE
	and	#$ff
	beq	doMUSO_1
	lda	#1
doMUSO_1	ldx	#BTN_MUTE_SOFT
	jmp	setCTLVALUEANDDRAW

*----------------------------
* TOGGLE MONO/STEREO
*----------------------------

doMONO_STEREO	sep	#$30
	lda	STATE_ISMONOFORCED
	eor	#TRUE
	jsr	RADIO_SET_FORCEMONO
	rep	#$30

drawMONO_STEREO	lda	STATE_ISMONOFORCED
	and	#$ff
	beq	doMS_1
	lda	#1
doMS_1	ldx	#BTN_MONO_STEREO
	jmp	setCTLVALUEANDDRAW

*----------------------------
* TOGGLE BASS ON/OFF
*----------------------------

doBASS_BOOST	sep	#$30
	lda	STATE_ISBASSBOOST
	eor	#TRUE
	jsr	RADIO_SET_BASSBOOST
	rep	#$30
	
drawBASS_BOOST	lda	STATE_ISBASSBOOST
	and	#$ff
	beq	doBB_1
	lda	#1
doBB_1	ldx	#BTN_BASS_BOOST
	jmp	setCTLVALUEANDDRAW

*----------------------------
* STATION POP-UP
*----------------------------

doPOPUP	ldx	#POPUP_FREQ
	jsr	getCTLVALUE
	sec
	sbc	#MENU_CHANNEL	; 1741 - 1740 = 1
	sep	#$20
	sta	STATE_CURRENTPRESET
	dec
	sta	thePRESET
	rep	#$20
	asl
	tax
	lda	channelFREQ1,x	; get the frequency index
	jmp	change_FREQ	; and jumps to it

*----------------------------
* BAND POP-UP
*----------------------------

doPOPUP_BAND	ldx	#POPUP_BAND	; $1841..$1844 -> 0..3
	jsr	getCTLVALUE
	sec
	sbc	#BAND_EU
	sta	theBAND
	
	sep	#$30
	lda	#3
	jsr	GET_REGISTER
	lda	theBAND
	jsr	RADIO_SET_BAND
	rep	#$30
	rts

*----------------------------
* SPACING POP-UP
*----------------------------

doPOPUP_SPACING	ldx	#POPUP_SPACING	; $1941..$1944 -> 0..3
	jsr	getCTLVALUE
	sec
	sbc	#SPACING_100
	sta	theSPACING
	
	sep	#$30
	lda	#3
	jsr	GET_REGISTER
	lda	theSPACING
	jsr	RADIO_SET_CHANSPACING
	rep	#$30
	rts

*----------------------------
* SAVE STATION
*----------------------------

doSTAT_PLUS	sep	#$30	; save into the card
	lda	STATE_CURRENTPRESET
	jsr	SavePreset                      
	rep	#$30

	lda	STATE_CURRENTPRESET	; save into my code
	and	#$ff
	dec
	asl
	tax
	lda	STATE_FREQ_L
	sta	channelFREQ1,x
	lda	STATE_FREQ_H
	sta	channelFREQ1+2,x
	rts

*----------------------------
* BUILD THE MENUS
*----------------------------

buildMENU	sep	#$30
	lda	#1
	sta	theINDEX

]lp	lda	theINDEX
	jsr	LoadPreset
	
	lda	theINDEX
	dec
	asl
	tax
	lda	STATE_FREQ_L
	sta	channelFREQ1,x
	lda	STATE_FREQ_H
	sta	channelFREQ1+1,x
	
	inc	theINDEX
	lda	theINDEX
	cmp	#8
	bcc	]lp
	beq	]lp
	rep	#$30
	rts
	
*----------------------------
* DATA
*----------------------------

thePRESET	ds	2
theBAND	ds	2
theSPACING	ds	2

*----------------------------
* CHANNEL DATA
*----------------------------

channelFREQ1	ds	2	; frequency
channelFREQ2	ds	2
channelFREQ3	ds	2
channelFREQ4	ds	2
channelFREQ5	ds	2
channelFREQ6	ds	2
channelFREQ7	ds	2
channelFREQ8	ds	2

*--- Ce n'est pas beau mais bon...
