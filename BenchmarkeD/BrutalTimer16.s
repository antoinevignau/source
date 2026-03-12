*
* Brutal Timer
* 16-bits code
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%00

*----------------------------
* SET BRUTAL TIMER SLOT
*----------------------------

setBTSLOT	PushLong	#strSETSLOT
	_WriteCString

	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff	; mask bits 15-8
	cmp	#"1"
	bcc	exitBTSLOT
	cmp	#"7"+1
	bcs	exitBTSLOT

	sep	#$30
	sta	btSLOT
	rep	#$30

	sec
	sbc	#"0"
	sta	theSLOT
	asl
	asl
	asl
	asl
	sta	theSLOT16

exitBTSLOT	rts

*----------------------------
* SET BRUTAL TIMER FREQUENCY
*----------------------------

setBTFREQ	PushLong	#strSETFREQ
	_WriteCString

	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff	; mask bits 15-8
	cmp	#"1"
	bcc	exitBTFREQ
	cmp	#"4"+1
	bcs	exitBTFREQ

	sep	#$30
	sta	btFREQ
	rep	#$30

	sec
	sbc	#"1"	; 1..4 -> 0..3
	sta	theFREQ
	jsr	setT2FREQUENCY
exitBTFREQ	rts

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

resetTIMER2	sep	#$30
	sta	theTIMER
resetTIMER	sep	#$30
	ldx	theSLOT16
	lda	theTIMER
	stal	$c080,x
	rep	#$30
	rts

*------- Start TIMER

startTIMER2	sep	#$30
	sta	theTIMER
startTIMER	sep	#$30
	ldx	theSLOT16	; 4 ** no **
	lda	theTIMER	; 4 ** no **
	stal	$c081,x	; 5
	rep	#$30
	rts		; 6

*------- Pause TIMER

pauseTIMER2	sep	#$30
	sta	theTIMER
pauseTIMER	sep	#$30
	ldx	theSLOT16
	lda	theTIMER
	stal	$c082,x
	rep	#$30
	rts

*------- Stop TIMER

stopTIMER2	sep	#$30
	sta	theTIMER
stopTIMER	sep	#$30
	ldx	theSLOT16	; 4 ** yes **
	lda	theTIMER	; 4 ** yes **
	stal	$c082,x	; 5 ** yes **
	rep	#$30
	rts

*------- Set T2 frequency

setT2FREQUENCY2	sep	#$30
	sta	theFREQ
setT2FREQUENCY	sep	#$30
	ldx	theSLOT16
	lda	theFREQ
	stal	$c084,x
	rep	#$30
	rts

*------- Turn off/on display

setT2DISPLAY2	sep	#$30
	sta	theDISPLAY
setT2DISPLAY	sep	#$30
	ldx	theSLOT16
	lda	theDISPLAY
	stal	$c085,x
	rep	#$30
	rts

*------- Read T1 value

readTIMER2	sep	#$30
	sta	theTIMER
readTIMER	sep	#$30
	lda	theTIMER
	cmp	#T1
	beq	readT1
	cmp	#T2
	beq	readT2
	rep	#$30
	rts

readT1	sep	#$30
	ldx	theSLOT16
	ldal	$c088,x	; T1
	sta	valTIMER
	ldal	$c089,x
	sta	valTIMER+1
	ldal	$c08a,x
	sta	valTIMER+2
	ldal	$c08b,x
	sta	valTIMER+3
	rep	#$30
	rts

*------- Read T2 value

readT2	sep	#$30
	ldx	theSLOT16
	ldal	$c08c,x	; T2
	sta	valTIMER
	ldal	$c08d,x
	sta	valTIMER+1
	ldal	$c08e,x
	sta	valTIMER+2
	ldal	$c08f,x
	sta	valTIMER+3
	rep	#$30
	rts

*----------------------------
* DATA
*----------------------------

strSETSLOT	asc	8d
	asc	"Set slot (1-7) > "00

strSETFREQ	asc	8d
	asc	"1- A2-F0 clock"8d
	asc	"2- A2-3.5 MHz"8d
	asc	"3- 20 MHz clock"8d
	asc	"4- Custom quartz"8d
	asc	"Set frequency (1-4) > "00


*------- Data

valTIMER	ds	4
theTIMER	ds	2	; 1..2
theFREQ	ds	2	; 0..3
theDISPLAY	ds	2	; 0..1
theSLOT	ds	2	; 0..7
theSLOT16	ds	2	; 10=slot 1, ..., 70=slot 7


