*
* Brutal Timer
* 8-bits code
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%11

*----------------------------
* SET BRUTAL TIMER SLOT
*----------------------------

setBTSLOT	@WriteCString	#strSETSLOT
	jsr	translateKEY
	cmp	#"0"
	bcc	exitBTSLOT
	cmp	#"7"+1
	bcs	exitBTSLOT

*	sta	btSLOT

	sec
	sbc	#"0"
	sta	theSLOT
	asl
	asl
	asl
	asl
	sta	theSLOT16

exitBTSLOT	jsr	updateTimerMode
	rts

*----------------------------
* SET BRUTAL TIMER FREQUENCY
*----------------------------

*setBTFREQ	@WriteString	#strSETFREQ
*	jsr	translateKEY
*	cmp	#"1"
*	bcc	exitBTFREQ
*	cmp	#"4"+1
*	bcs	exitBTFREQ
*
*	sta	btFREQ
*
*	sec
*	sbc	#"1"	; 1..4 -> 0..3
*	sta	theFREQ
*	jsr	setT2FREQUENCY
*exitBTFREQ	rts

*----------------------------
* CODE
*----------------------------

resetTICK	lda	theSLOT	; Brutal Timer slot not set
	bne	resetTICKOK
	sec
	rts

resetTICKOK	lda	#FREQ_20MHZ	; set to 20MHz
	jsr	setT2FREQUENCY2

	lda	#T2	; select T2
	jsr	resetTIMER2
	
	lda	#T2_DISP_ON
	jsr	setT2DISPLAY2
	
	clc
	rts

*-------------- BRUTAL TIMER ROUTINES

*------- Reset TIMER

resetTIMER2	sta	theTIMER
resetTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c080,x
	rts

*------- Start TIMER

startTIMER2	sta	theTIMER
startTIMER	ldx	theSLOT16	; 4 ** no **
	lda	theTIMER	; 4 ** no **
	sta	$c081,x	; 5
	rts		; 6

*------- Pause TIMER

pauseTIMER2	sta	theTIMER
pauseTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c082,x
	rts

*------- Stop TIMER

stopTIMER2	sta	theTIMER
stopTIMER	ldx	theSLOT16	; 4 ** yes **
	lda	theTIMER	; 4 ** yes **
	sta	$c082,x	; 5 ** yes **
	rts

*------- Set T2 frequency

setT2FREQUENCY2	sta	theFREQ
setT2FREQUENCY	ldx	theSLOT16
	lda	theFREQ
	sta	$c084,x
	rts

*------- Turn off/on display

setT2DISPLAY2	sta	theDISPLAY
setT2DISPLAY	ldx	theSLOT16
	lda	theDISPLAY
	sta	$c085,x
	rts

*------- Read T1 value

readTIMER2	sta	theTIMER
readTIMER	lda	theTIMER
	cmp	#T1
	beq	readT1
	cmp	#T2
	beq	readT2
	rts

readT1	ldx	theSLOT16
	lda	$c088,x	; T1
	sta	valTIMER
	lda	$c089,x
	sta	valTIMER+1
	lda	$c08a,x
	sta	valTIMER+2
	lda	$c08b,x
	sta	valTIMER+3
	rts

*------- Read T2 value

readT2	ldx	theSLOT16
	lda	$c08c,x	; T2
	sta	valTIMER
	lda	$c08d,x
	sta	valTIMER+1
	lda	$c08e,x
	sta	valTIMER+2
	lda	$c08f,x
	sta	valTIMER+3
	rts

*----------------------------
* DATA
*----------------------------

strSETSLOT	asc	8d
	asc	"Set slot (0-7) > "00

*strSETFREQ	asc	8d
*	asc	"1- A2-F0 clock"8d
*	asc	"2- A2-7 MHz"8d
*	asc	"3- 20 MHz clock"8d
*	asc	"4- Custom quartz"8d
*	asc	"Set frequency (1-4) > "00

*------- Data

valTIMER	ds	4
theTIMER	ds	2	; 1..2
theFREQ	ds	2	; 0..3
theDISPLAY	ds	2	; 0..1
theSLOT	ds	2	; 0..7
theSLOT16	ds	2	; 10=slot 1, ..., 70=slot 7
