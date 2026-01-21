*
* Brutal Timer Test
* by Plamen Vaysilov
*
* (c) 2026, Brutal Deluxe Software
*

	typ	BIN
	org	$2000
	lst	off
	dsk	brutaltester
	
*-------------- FIRMWARE

WNDLFT	=	$20
WNDWDTH	=	$21
WNDTOP	=	$22
WNDBTM	=	$23
CH	=	$24
CV	=	$25

dpSTRING	=	$fc
dpDFTVALUE	=	$fe

KBD	=	$C000
KBDSTROBE	=	$C010

INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
PRBYTE	=	$FDDA
COUT	=	$FDED

*-------------- EQUATES

VERSION	=	1	; v0.x

T0	=	0
T1	=	1
T2	=	2

FREQ_A2F0	=	0
FREQ_A235	=	1
FREQ_20MHZ	=	2
FREQ_CUSTOM	=	3

T2_DISP_OFF	=	0
T2_DISP_ON	=	1

FALSE	=	0
TRUE	=	255

chrRET	=	$8d

*-------------- MACROS

@printSTRING	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printSTRING
	<<<

@setDPSTRING	mac
	ldx	#>]1
	stx	dpSTRING+1
	ldy	#<]1
	sty	dpSTRING
	<<<

@setDPDFTVALUE	mac
	ldx	#>]1
	stx	dpDFTVALUE+1
	ldy	#<]1
	sty	dpDFTVALUE
	<<<

*-------------- CODE

	jsr	HOME
	@printSTRING	#strHELLO

*---

loopTEST	@printSTRING	#strMENU
	jsr	RDKEY
	jsr	COUT
	cmp	#"0"
	bne	noTEST0

	@printSTRING	#strGOODBYE
	jsr	INIT
	rts

noTEST0	cmp	#"1"	; set slot & launch tests
	bne	noTEST1
	jmp	doSETSLOT
	
noTEST1	cmp	#"2"	; launch tests
	bne	loopTEST
	jmp	doTESTS

*-------------- SET SLOT AND LAUNCH TESTS...

doSETSLOT	@printSTRING	#strSETSLOT
	jsr	RDKEY
	jsr	COUT
	cmp	#"1"
	bcc	doSETSLOT
	cmp	#"7"+1
	bcs	doSETSLOT

	sec
	sbc	#"0"
	sta	theSLOT
	asl
	asl
	asl
	asl
	sta	theSLOT16

*	jmp	loopTEST
	
*-------------- DO ALL TESTS
* 1- reset T1, start/stop/display/compare/reset to 0

* Can you write simple test program for automatic check cart 
* ( Start/Stop timer and check value for T1. Clear and check if 0 , 
* Start/Stop T2 and check value , change Source freq and check again value . 
* On/Off display )
* .This can be automatic . I will provide values of timer for different Freq .

doTESTS	lda	#T0	; reset all timers
	jsr	resetTIMER2

	lda	#chrRET	; want a CR
	jsr	COUT
	
	@setDPSTRING	#strT1dft	; test T1
	@setDPDFTVALUE	#dftT1

	lda	#T1	; do it
	jsr	testTIMER

	lda	#0	; test T2
]lp	sta	theFREQ
	asl
	tax
	lda	tblSTRT2,x	; default string
	sta	dpSTRING
	lda	tblSTRT2+1,x
	sta	dpSTRING+1

	lda	tblDFTT2,x	; default expected value
	sta	dpDFTVALUE
	lda	tblDFTT2+1,x
	sta	dpDFTVALUE+1

	lda	theFREQ	; set frequency
	jsr	setT2FREQUENCY2
	lda	#T2	; do it
	jsr	testTIMER
	lda	theFREQ	; next frequency
	clc
	adc	#1
	cmp	#3+1
	bcc	]lp

	jsr	testDISPLAY	; test the display
	jmp	loopTEST	; exit

*---

strT1dft	asc	"000001B5"00
strT2F0dft	asc	"00000000"00
strT2F1dft	asc	"00000100"00
strT2F2dft	asc	"00000200"00
strT2F3dft	asc	"00000300"00

tblSTRT2	da	strT2F0dft
	da	strT2F1dft
	da	strT2F2dft
	da	strT2F3dft

tblDFTT2	da	dftT2F0
	da	dftT2F1
	da	dftT2F2
	da	dftT2F3

dftT1	adrl	437
dftT2F0	adrl	$000
dftT2F1	adrl	$100
dftT2F2	adrl	$200
dftT2F3	adrl	$300

*-------------- TEST DISPLAY

testDISPLAY	lda	#0	; set to 1MHz
	jsr	setT2FREQUENCY2

	lda	#T2	; select T2
	jsr	resetTIMER2

	@printSTRING	#strDISPLAYOFF	; tell it
	lda	#T2_DISP_OFF	; turn display off
	jsr	doDISPLAY	; test

	@printSTRING	#strDISPLAYON
	lda	#T2_DISP_ON	; turn display on
	jsr	doDISPLAY	; test

	jsr	waitFORKEY	; wait
	jmp	loopTEST	; and return
	
*---

NBTESTS	=	15

doDISPLAY	jsr	setT2DISPLAY2	; turn display on/off

	lda	#T2	; start timer
	jsr	startTIMER2
	ldx	#0	; make 10 loops
]lp	lda	#"."	; show it
	jsr	COUT
	jsr	doTEST	; make the test
	inx
	cpx	#NBTESTS
	bcc	]lp	; loop

	lda	#T2	; stop the timer
	jmp	stopTIMER2	; we do not reset it

*---

strDISPLAYOFF	asc	8d"Display is off "00
strDISPLAYON	asc	8d"Display is  on "00

*-------------- TEST & COMPARE

	ds	\

testTIMER	sta	theTIMER
	jsr	resetTIMER	; make it 0
	jsr	startTIMER	; start it
	jsr	doTEST	; do the test
	jsr	stopTIMER	; stop it
	jsr	readTIMER	; read value

	@printSTRING	#strTVALUE	; Tx want
	ldx	dpSTRING+1
	ldy	dpSTRING	; aabbccdd
	jsr	printSTRING
	@printSTRING	#strTREAD	; read...
	jsr	printTIMER	; show read value

	ldy	#0
]lp	lda	(dpDFTVALUE),y
	cmp	valTIMER,y
	bne	notTHESAME
	iny
	cpy	#4
	bcc	]lp
	@printSTRING	#strOK
	jmp	testRESET
notTHESAME	@printSTRING	#strNOTOK

*--- test the reset

testRESET	jsr	resetTIMER
	jsr	readTIMER
	@printSTRING	#strRESET
	
	lda	valTIMER
	ora	valTIMER+1
	ora	valTIMER+2
	ora	valTIMER+3
	bne	notRESET
	@printSTRING	#strOK
	rts
notRESET	@printSTRING	#strNOTOK
	rts

*---

strTVALUE	asc	8d"T% want "00
strTREAD	asc	" read "00
strOK	asc	" OK"00
strNOTOK	asc	" NOT OK"00
strRESET	asc	8d"   Reset"00

*-------------- THE TEST

	ds	\	; page aligned

doTEST	lup	200
	nop		; 2 cycles x 200
	--^
	rts		; 6

	ds	\

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

*------- Print timer value

printTIMER	lda	valTIMER+3
	jsr	PRBYTE
	lda	valTIMER+2
	jsr	PRBYTE
	lda	valTIMER+1
	jsr	PRBYTE
	lda	valTIMER
	jmp	PRBYTE

*---

strTHELOOP	asc	8d"Loop: "00
strTIMER2	asc	" / Timer: "00
strTIMER	asc	8d"Timer: "00
valTIMER	ds	4	; the 32-bit value

*------- Miscellaneous

printSTRING	sty	printSTRING1+1
	stx	printSTRING1+2

printSTRING1	lda	$bdbd
	beq	printSTRING4

	ldx	theTIMER
	cmp	#"%"
	beq	printSTRING2
	ldx	#VERSION
	cmp	#"@"
	beq	printSTRING2
	ldx	theSLOT
	cmp	#"#"
	bne	printSTRING3
printSTRING2	txa
	ora	#"0"

printSTRING3	jsr	COUT
	
	inc	printSTRING1+1
	bne	printSTRING1
	inc	printSTRING1+2
	lda	printSTRING1+2	; force end of routine
	cmp	#$c0	; if we reach $C000
	bcc	printSTRING1

printSTRING4	rts

*------- waitFORKEY

waitFORKEY	lda	KBD
	bpl	waitFORKEY
	sta	KBDSTROBE
	rts

*-------------- DATA

theTIMER	ds	1	; 1..2
theFREQ	ds	1	; 0..3
theDISPLAY	ds	1	; 0..1
theSLOT	dfb	7	; 0..7
theSLOT16	dfb	$70	; 10=slot 1, ..., 70=slot 7

strHELLO	asc	"Brutal Timer Auto Test v0.@"8d
	asc	"(c) 2026, Plamen Vaysilov &"8d
	asc	"Brutal Deluxe Software"00

*	asc	"1234567890123456789012345"

strMENU	asc	8d8d
	asc	"1- Set slot & Test (#)"8d
	asc	"2- Launch tests"8d
	asc	"Select entry (0 to exit) > "00

strSETSLOT	asc	8d
	asc	"Set slot (1-7) > "00

strT2FREQ0	asc	"A2-F0 clock"00
strT2FREQ1	asc	"A2-3.5 MHz"00
strT2FREQ2	asc	"20 MHz clock"00
strT2FREQ3	asc	"Custom quartz"00

strGOODBYE	asc	8d"Good bye!"00