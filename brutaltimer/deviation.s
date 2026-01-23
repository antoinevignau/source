*
* Brutal Timer Test
* by Plamen Vaysilov
*
* (c) 2026, Brutal Deluxe Software
*

	typ	BIN
	org	$2000
	lst	off
	dsk	deviation

*-------------- FIRMWARE

CH	=	$24
CV	=	$25

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

VERSION	=	2	; v0.x

NB_ENTRIES	=	20	; array size

T0	=	0
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

loopMAIN	jsr	HOME
	@printSTRING	#strHELLO

*---

loopTEST	@printSTRING	#strMENU
	jsr	RDKEY
	jsr	COUT
	cmp	#"0"
	bne	noTEST0

	@printSTRING	#strGOODBYE
	jmp	INIT

noTEST0	cmp	#"1"	; set slot
	bne	noTEST1
	jmp	doSETSLOT
	
noTEST1	cmp	#"2"	; test
	bne	loopTEST
	jmp	doDEVIATION

*-------------- SET SLOT

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
	jmp	loopTEST

*-------------- DEVIATION TEST

	ds	\

doDEVIATION	jsr	HOME

	lda	#T0	; stop 
	jsr	stopTIMER2
	jsr	clearTIMER	; reset both timers
	lda	#T1	; we work with T1 now
	sta	theTIMER

*--- Clear all entries

	ldx	#0
	txa
	sta	nbENTRIES	; current nb entries
]lp	sta	devTIMER,x
	sta	cntTIMER,x
	inx
	cpx	#NB_ENTRIES*4
	bcc	]lp

*--- Perform the test

* When you have time if it possible to write simple program to show histogram of deviation of 20Mhz timer ( T1 or 2 no matter ) .
* clear - start - count -wait - stop -  store value and count how times this value is existing.  loop.... 
* ( can be use simple array of 20 values the increment location of array is Current Value - mimimum possible value .
* And after this show this 20 (or 10) values . and loop until keypressed . 
* -> expect 100, read value, see what you get

]lp	jsr	clearTIMER	; clear the timer
	jsr	startTIMER	; start it

	jsr	doTEST	; execute the test : 6 + 6 + 400 + 6 + 400 + 6
	
*	lda	#200	; wait
*	jsr	WAIT
	
	jsr	stopTIMER

	jsr	addVALUE

	lda	KBD	; loop until keypress
	bpl	]lp

*--- Exit

	sta	KBDSTROBE
	jsr	waitFORKEY	; wait for a key
	jmp	loopMAIN	; return to main menu

*--- Add value

addVALUE	jsr	readT1	; read T1

	ldy	#0-1	; nb of entries
	ldx	#0-4	; start offset
	
]lp	iny
	txa		; index in array
	clc
	adc	#4
	tax
	lda	devTIMER,x	; check if value is already present
	cmp	valTIMER
	bne	tryNEXT
	lda	devTIMER+1,x
	cmp	valTIMER+1
	bne	tryNEXT
	lda	devTIMER+2,x
	cmp	valTIMER+2
	bne	tryNEXT
	lda	devTIMER+2,x
	cmp	valTIMER+2
	bne	tryNEXT

	lda	cntTIMER,x	; found it, increment
	clc
	adc	#1
	sta	cntTIMER,x
	lda	cntTIMER+1,x
	adc	#0
	sta	cntTIMER+1,x
	lda	cntTIMER+2,x
	adc	#0
	sta	cntTIMER+2,x
	lda	cntTIMER+3,x
	adc	#0
	sta	cntTIMER+3,x
	jmp	printARRAY	; and print

tryNEXT	cpy	nbENTRIES	; are we at the end of the array?
	bcc	]lp	; no, check other entries

	iny
	cpy	#NB_ENTRIES
	bcc	saveIT
	rts		; array is full!
	
saveIT	sty	nbENTRIES	; new number of entries

	lda	valTIMER
	sta	devTIMER,X
	lda	valTIMER+1
	sta	devTIMER+1,X
	lda	valTIMER+2
	sta	devTIMER+2,X
	lda	valTIMER+3
	sta	devTIMER+3,X

	lda	#1
	sta	cntTIMER,x	; and go below...

*--- Print array

printARRAY	@gotoxy	#0;#0

	ldy	#0
	ldx	#0

]lp	lda	devTIMER+3,x	; 32-bits
	jsr	PRBYTE
	lda	devTIMER+2,x
	jsr	PRBYTE
	lda	devTIMER+1,x
	jsr	PRBYTE
	lda	devTIMER,x
	jsr	PRBYTE
	lda	#" "
	jsr	COUT

	lda	cntTIMER+3,x	; 32-bits
	jsr	PRBYTE
	lda	cntTIMER+2,x
	jsr	PRBYTE
	lda	cntTIMER+1,x
	jsr	PRBYTE
	lda	cntTIMER,x
	jsr	PRBYTE
	lda	#$8d
	jsr	COUT

	inx
	inx
	inx
	inx
	
	iny
	cpy	nbENTRIES
	bcc	]lp
	rts

*--- Data

nbENTRIES	ds	1	; current active entries

	ds	\

devTIMER	ds	4*NB_ENTRIES	; deviation read
cntTIMER	ds	4*NB_ENTRIES	; number of occurrences

*-------------- THE TEST

	ds	\	; page aligned

doTEST	jsr	doTEST2	; 6 + 400 + 6 + 400 + 6
doTEST2	lup	200
	nop		; 2 cycles x 200
	--^
	rts		; 6

	ds	\

*-------------- BRUTAL TIMER ROUTINES

*------- Clear TIMER

clearTIMER2	sta	theTIMER
clearTIMER	ldx	theSLOT16
	lda	theTIMER
	sta	$c080,x
	rts

*------- Start TIMER

startTIMER2	sta	theTIMER
startTIMER	ldx	theSLOT16	; 4 ** no **
	lda	theTIMER	; 4 ** no **
	sta	$c081,x	; 5
	rts		; 6

*------- Stop TIMER

stopTIMER2	sta	theTIMER
stopTIMER	ldx	theSLOT16	; 4 ** yes **
	lda	theTIMER	; 4 ** yes **
	sta	$c082,x	; 5 ** yes **
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
theSLOT	ds	1	; 0..7
theSLOT16	ds	1	; 10=slot 1, ..., 70=slot 7
valTIMER	ds	4

strHELLO	asc	"Brutal Timer Deviation v0.@"8d
	asc	"(c) 2026, Plamen Vaysilov &"8d
	asc	"Brutal Deluxe Software"8d00

*	asc	"1234567890123456789012345"

strMENU	asc	8d
	asc	"1- Set slot (#)"8d
	asc	"2- Test deviation"8d
	asc	"Select entry (0 to exit) > "00

strSETSLOT	asc	8d
	asc	"Set slot (1-7) > "00

strGOODBYE	asc	8d"Good bye!"00