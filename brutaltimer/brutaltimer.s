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

CH	=	$24
CV	=	$25

KBD	=	$C000
KBDSTROBE	=	$C010

TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
PRBYTE	=	$FDDA
COUT	=	$FDED

*-------------- EQUATES

T	=	0
T1	=	1
T2	=	2

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
	@printSTRING	#strHELLO

loopTEST	@printSTRING	#strMENU
	jsr	RDKEY
	cmp	#"0"
	bne	noTEST0

	@printSTRING	#strGOODBYE
	rts

noTEST0	cmp	#"1"
	bne	noTEST1
	jmp	doSETSLOT
	
noTEST1	cmp	#"2"
	bne	noTEST2
	jmp	doONESHOT

noTEST2	cmp	#"3"
	bne	loopTEST
	jmp	doLOOP

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
	
*-------------- ONE SHOT

	ds	\

doONESHOT	jsr	resetTIMER
	jsr	startTIMER
	jsr	doTEST
	jsr	stopTIMER
	jsr	printTIMER
	jsr	waitFORKEY
	jmp	loopTEST

*-------------- LOOP TEST

	ds	\
	
doLOOP	jsr	resetTIMER

	lda	#0
	sta	theLOOP

]lp	jsr	startTIMER
	jsr	doTEST
	jsr	pauseTIMER
	
	@printSTRING	#strTHELOOP
	lda	theLOOP
	jsr	PRBYTE
	jsr	printTIMER2

	inc	theLOOP

	lda	KBD
	bpl	]lp
	sta	KBDSTROBE
	jsr	stopTIMER
	jmp	loopTEST

*-------------- THE TEST

	ds	\	; page aligned

doTEST	lup	200
	nop		; 2 cycles x 200
	--^
	rts		; 6

	ds	\

*-------------- BRUTAL TIMER ROUTINES

*------- Reset T1

resetTIMER	ldx	theSLOT16
	lda	#T
	sta	$c080,x
	rts

*------- Start T1

startTIMER	ldx	theSLOT16
	lda	#T1
	sta	$C081,x
	rts

*------- Pause T1

pauseTIMER	ldx	theSLOT16
	lda	#T1
	sta	$C082,x
	rts

*------- Stop T1

stopTIMER	ldx	theSLOT16
	lda	#T1
	sta	$c080,x
	rts

*------- Print timer value

printTIMER2	@printSTRING	#strTIMER2
	jmp	printTIMER1

printTIMER	@printSTRING	#strTIMER

printTIMER1	ldx	theSLOT16
	lda	$c088,x
	sta	theTIMER
	lda	$c089,x
	sta	theTIMER+1
	lda	$c08a,x
	sta	theTIMER+2
	lda	$c08b,x
	sta	theTIMER+3

	jsr	PRBYTE
	lda	theTIMER+2
	jsr	PRBYTE
	lda	theTIMER+1
	jsr	PRBYTE
	lda	theTIMER
	jmp	PRBYTE
	
*---

strTHELOOP	asc	8d"Loop: "00
strTIMER2	asc	" / Timer: "00
strTIMER	asc	8d"Timer: "00
theTIMER	ds	4	; the 32-bit value

*------- Miscellaneous

printSTRING	sty	printSTRING1+1
	stx	printSTRING1+2

printSTRING1	lda	$bdbd
	beq	printSTRING3

	cmp	#"#"
	bne	printSTRING2
	lda	theSLOT
	ora	#"0"

printSTRING2	jsr	COUT
	
	inc	printSTRING1+1
	bne	printSTRING1
	inc	printSTRING1+2
	lda	printSTRING1+2	; force end of routine
	cmp	#$c0	; if we reach $C000
	bcc	printSTRING1

printSTRING3	rts

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

theLOOP	ds	1
theSLOT	ds	1	; 0..7
theSLOT16	ds	1	; 10=slot 1, ..., 70=slot 7

strHELLO	asc	"Brutal Timer Test"8d
	asc	"(c) 2026, Plamen Vaysilov &"8d
	asc	"Brutal Deluxe"8d00

*	asc	"1234567890123456789012345"

strMENU	asc	8d
	asc	"1- Set slot (#)"8d
	asc	"2- One-shot test"8d
	asc	"3- Loop test"8d
	asc	"Select entry (0 to exit) > "00

strSETSLOT	asc	8d
	asc	"Set slot (1-7) > "00

strGOODBYE	asc	8d"Good bye!"00