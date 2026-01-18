*
* Brutal Timer Test
* by Plamen Vaysilov
*
* (c) 2026, Brutal Deluxe Software
*

	typ	BIN
	org	$2000
	lst	off
	dsk	brutaltimer
	
*-------------- FIRMWARE

WNDLFT	=	$20
WNDWDTH	=	$21
WNDTOP	=	$22
WNDBTM	=	$23
CH	=	$24
CV	=	$25

maxY	=	22

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

VERSION	=	9	; v0.x

T	=	0
T1	=	1
T2	=	2

F1	=	0
F1X	=	1
F35	=	2

FALSE	=	0
TRUE	=	255

*-------------- MACROS

@printSTRING	mac
	ldx	#>]1
	ldy	#<]1
	jsr	printSTRING
	<<<

@gotoxy	mac
	ldx	#]1
	ldy	#]2
	jsr	gotoxy
	<<<

*-------------- CODE

	jsr	HOME
	lda	#maxY	; last line for status
	sta	WNDBTM
	@printSTRING	#strHELLO

*---

loopTEST	@printSTRING	#strMENU
	jsr	readKEY
	cmp	#"0"
	bne	noTEST0

	@printSTRING	#strGOODBYE
	jmp	INIT

noTEST0	cmp	#"1"	; set slot
	bne	noTEST1
	jmp	doSETSLOT
	
noTEST1	cmp	#"2"	; T1 one-shot
	bne	noTEST2
	jmp	doONESHOTT1

noTEST2	cmp	#"3"	; T1 loop
	bne	noTEST3
	jmp	doLOOPT1

noTEST3	cmp	#"4"	; set frequency
	bne	noTEST4
	jmp	doSETFREQ
	
noTEST4	cmp	#"5"	; T2 one-shot
	bne	noTEST5
	jmp	doONESHOTT2

noTEST5	cmp	#"6"	; T2 loop
	bne	noTEST6
	jmp	doLOOPT2

noTEST6	cmp	#"7"
	bne	loopTEST
	jmp	doSTATUS

*-------------- READ KEY

readKEY	lda	CH
	sta	saveCH
	lda	CV
	sta	saveCV

readKEY_LOOP	lda	KBD
	bpl	readKEY1
	sta	KBDSTROBE
	
	pha		; restore cursor position
	ldx	saveCH
	ldy	saveCV
	jsr	gotoxy
	pla
	rts

readKEY1	lda	theSLOT	; skip if slot not set
	beq	readKEY_LOOP
	
	@gotoxy	#0;#23
	@printSTRING	#strT1

	jsr	readSTATUS	; check T1
	bpl	readKEY2	; T1 is not running
	lda	#T1	; T1 is running
	jsr	pauseTIMER2
	jsr	readT1
	jsr	printTIMER_ALT
	lda	#T1
	jsr	startTIMER2
	jmp	readKEY3

readKEY2	@printSTRING	#strNOT

readKEY3	@printSTRING	#strT2
	jsr	readSTATUS	; check T2
	asl
	bpl	readKEY4	; T2 is not running
	lda	#T2	; T2 is running
	jsr	pauseTIMER2
	jsr	readT2
	jsr	printTIMER_ALT
	lda	#T2
	jsr	startTIMER2
	jmp	readKEY5

readKEY4	@printSTRING	#strNOT

readKEY5	jmp	readKEY_LOOP	; loop until a keypress


*---

saveCH	ds	1
saveCV	ds	1

strT1	asc	"T1: "00
strT2	asc	" / T2: "00
strNOT	asc	"--------"00

*-------------- SET SLOT

doSETSLOT	@printSTRING	#strSETSLOT
	jsr	RDKEY
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
	jmp	loopTEST
	
*-------------- SET T2 FREQUENCY

doSETFREQ	@printSTRING	#strSETFREQ
	jsr	RDKEY
	cmp	#"1"
	bcc	doSETFREQ
	cmp	#"4"+1
	bcs	doSETFREQ

	sec
	sbc	#"1"	; 1..4 -> 0..3
	sta	theFREQ
	jsr	setT2FREQUENCY
	jmp	loopTEST

*-------------- STATUS

doSTATUS	jsr	readSTATUS

*--- Timers status

	pha
	bpl	doSTATUS1	; T1 is off
	@printSTRING	#strT1ON
	jmp	doSTATUS2
doSTATUS1	@printSTRING	#strT1OFF

doSTATUS2	pla
	asl
	bpl	doSTATUS3	; T1 is off
	@printSTRING	#strT2ON
	jmp	doSTATUS4
doSTATUS3	@printSTRING	#strT2OFF

*--- Frequency

doSTATUS4	@printSTRING	#strT2FREQ

	jsr	readFREQUENCY
	and	#%1100_0000
	cmp	#%0000_0000
	bne	doSTATUS5
	@printSTRING	#strT2FREQ0
	jmp	doSTATUS8

doSTATUS5	cmp	#%0100_0000
	bne	doSTATUS6
	@printSTRING	#strT2FREQ1
	jmp	doSTATUS8

doSTATUS6	cmp	#%1000_0000
	bne	doSTATUS7
	@printSTRING	#strT2FREQ2
	jmp	doSTATUS8

doSTATUS7	cmp	#%1100_0000
	bne	doSTATUS8
	@printSTRING	#strT2FREQ3

doSTATUS8	jmp	loopTEST

*-------------- ONE SHOT

	ds	\

doONESHOTT1	lda	#T1
	jmp	doONESHOT
doONESHOTT2	lda	#T2

doONESHOT	sta	theTIMER
	jsr	resetTIMER
	jsr	startTIMER
	jsr	doTEST
	jsr	stopTIMER
	jsr	printTIMER
	jsr	waitFORKEY
	jmp	loopTEST

*-------------- LOOP TEST

	ds	\
	
doLOOPT1	lda	#T1
	jmp	doLOOP
doLOOPT2	lda	#T2

doLOOP	sta	theTIMER

*--- We have the timer to handle, was it active?

	ldx	theTIMER
	lda	theT1LOOP-1,x
	cmp	#FALSE
	beq	doLOOPSTART

*--- Stop it now

	lda	#FALSE
	sta	theT1LOOP-1,x

	jsr	stopTIMER
*	jsr	printTIMER
	jmp	loopTEST

*--- Start it now

doLOOPSTART	lda	#TRUE	; start it
	sta	theT1LOOP-1,x

	jsr	startTIMER
	jmp	loopTEST
	
*	jsr	resetTIMER
*
*	lda	#0
*	sta	theLOOP
*
*]lp	jsr	startTIMER
*	jsr	doTEST
*	jsr	pauseTIMER
*	
*	@printSTRING	#strTHELOOP
*	lda	theLOOP
*	jsr	PRBYTE
*	jsr	printTIMER2
*
*	inc	theLOOP
*
*	lda	KBD
*	bpl	]lp
*	sta	KBDSTROBE
*	jsr	stopTIMER
*	jmp	loopTEST

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
startTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c081,x
	rts

*------- Pause TIMER

pauseTIMER2	sta	theTIMER
pauseTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c082,x
	rts

*------- Stop TIMER

stopTIMER2	sta	theTIMER
stopTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c082,x
	rts

*------- Set T2 frequency

setT2FREQUENCY2	sta	theFREQ
setT2FREQUENCY	ldx	theSLOT16
	lda	theFREQ
	sta	$c084,x
	rts

*------- Read TIMER status

readSTATUS	ldx	theSLOT16
	lda	$c081,x
	rts

*------- Read TIMER frequency

readFREQUENCY	ldx	theSLOT16
	lda	$c084,x
	rts

*------- Read T1 value

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

*printTIMER2	@printSTRING	#strTIMER2
*	jmp	printTIMER1

printTIMER	@printSTRING	#strTIMER

printTIMER1	ldx	theSLOT16
	lda	theTIMER
	cmp	#T1
	beq	printTIMER3
	cmp	#T2
	beq	printTIMER4
	rts

printTIMER3	jsr	readT1	; T1
	jmp	printTIMER5

printTIMER4	jsr	readT2	; T2

printTIMER_ALT
printTIMER5	lda	valTIMER+3
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

*------- gotoXY

gotoxy	stx	CH
	tya
	jmp	TABV

*------- waitFORKEY

waitFORKEY	lda	KBD
	bpl	waitFORKEY
	sta	KBDSTROBE
	rts

*-------------- DATA

theTIMER	ds	1	; 1..2
theFREQ	ds	1	; 0..3
theLOOP	ds	1	; 0..255
theSLOT	ds	1	; 0..7
theSLOT16	ds	1	; 10=slot 1, ..., 70=slot 7

theT1LOOP	ds	1	; 0: off, 1: on
theT2LOOP	ds	1	; 0: off, 1: on

strHELLO	asc	"Brutal Timer Test v0.@"8d
	asc	"(c) 2026, Plamen Vaysilov &"8d
	asc	"Brutal Deluxe Software"8d00

*	asc	"1234567890123456789012345"

strMENU	asc	8d
	asc	"1- Set slot (#)"8d
	asc	"2- T1 One-shot test"8d
	asc	"3- T1 Loop test"8d
	asc	"4- T2 Set frequency"8d
	asc	"5- T2 One-shot test"8d
	asc	"6- T2 Loop test"8d
	asc	"7- Status"8d
	asc	"Select entry (0 to exit) > "00

strSETSLOT	asc	8d
	asc	"Set slot (1-7) > "00

strSETFREQ	asc	8d
	asc	"1- A2-F0 clock"8d
	asc	"2- A2-3.5 MHz"8d
	asc	"3- 20 MHz clock"8d
	asc	"4- Custom quartz"8d
	asc	"Set frequency (1-4) > "00

strT1ON	asc	8d"Timer 1 is  on"00
strT1OFF	asc	8d"Timer 1 is off"00
strT2ON	asc	8d"Timer 2 is  on"00
strT2OFF	asc	8d"Timer 2 is off"00

strT2FREQ	asc	8d"Timer 2 frequency is: "00
strT2FREQ0	asc	"A2-F0 clock"00
strT2FREQ1	asc	"A2-3.5 MHz"00
strT2FREQ2	asc	"20 MHz clock"00
strT2FREQ3	asc	"Custom quartz"00

strGOODBYE	asc	8d"Good bye!"00