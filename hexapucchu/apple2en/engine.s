*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	mx	%00

*--- Les accents

* Les accents (encore et toujours)
*
* à	88
* â	89
* ä	8a
* ç	8d
* é	8e
* è	8f
* ê	90
* ë	91
* î	94
* ï	95
* ô	99
* ù	9d
* û	9e
* (c) 	a9 (only c)
* oe	cf
* "	22

*-------------------------------
* ENGINE
*-------------------------------

LOAD	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	LOAD1
	
	@PRINT	#strLOADERR
	rts

LOAD1	lda	proEOF
	ldx	#0
	txy
	jmp	unpackLZ4

*---

strLOADERR	dfb	eINK,0,0
	dfb	eINK,2,6
	dfb	eCLS
	dfb	ePEN,2
	asc	'Loading error'00

*-------------------------------
* SOUND G,H,I
*  G: channel (mandatory)
*     1: left
*     2: center
*     3: right
*  H: tone period (mandatory)
*     Frequency = 125000 / period
*  I: duration (optional, default is 20)
*     <0: number of repeats
*     >0: duration in 1/100ths second
      
SOUND	lda	seqPlay	; for MIDI compatibility
	bne	SOUND9

	lda	fgSOUND
	bne	SOUND9

	sty	waveFREQ	; ahem...

	PushWord #%0000_0000_1000_0000	; stop sound
	_FFStopSound

	PushWord #$0701		; start sound
	PushLong #waveSTART
	_FFStartSound

]lp	PushWord	#0	; has sound ended?
	PushWord	#7
	_FFSoundDoneStatus
	pla
	cmp	#-1
	bne	]lp

SOUND9	rts

*--

waveSTART	adrl	squareWAVE	; waveStart
waveSIZE	dw	9	; waveSize in pages
waveFREQ	dw	107	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
waveVOLUME	dw	255	; volSetting

*-------------------------------

SHOWPIC	PushLong	ptrIMAGE
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove
	rts

*-------------------------------

INPUT	ldx	#0
INPUT2	stx	lenSTRING

]lp	lda	#$a5	; black bullet
	jsr	COUT

	dec	theLOCATEX
	jsr	GOTOXY

	jsr	INKEY

	ldx	lenSTRING
	cmp	#chrRET
	beq	doEXIT
	cmp	#chrDEL
	beq	doBACK
	cmp	#chrLA
	beq	doBACK
	cmp	#chrSPACE	; must not be another control character
	bcc	]lp
	beq	doSPC

doIT	sep	#$20
	sta	IN,x
	rep	#$20
	jsr	COUT
doNEXT	ldx	lenSTRING
	inx
	cpx	#maxLEN
	bcc	INPUT2

doEXIT	sep	#$20
	stz	IN,x
	rep	#$20
	stx	lenSTRING
	lda	#143
	jsr	COUT160
	lda	#chrRET
	jsr	COUT
	ldx	lenSTRING
	rts

doSPC	lda	#143
	jsr	COUT160
	dec	theLOCATEX
	jsr	GOTOXY
	ldx	lenSTRING
	lda	#chrSPACE
	bra	doIT

doBACK	cpx	#0	; ANTx
	beq	]lp
	
	lda	#143
	jsr	COUT160
	
	dec	theLOCATEX
	dec	theLOCATEX
	jsr	GOTOXY
	
	ldx	lenSTRING
	dex
	jmp	INPUT2

*-------------------------------

INKEY	jsr	checkREPLAY

	pha
	PushWord #keyDownMask
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY

	lda	taskMODIFIERS	; test open-apple
	and	#appleKey
	cmp	#appleKey
	beq	INKEY2

	lda	taskREC
	cmp	#keyDownEvt
	bne	INKEY

	lda	taskMESSAGE
	cmp	#'a'
	bcc	INKEY1
	cmp	#'z'+1
	bcs	INKEY1
	and	#$df	; make it A-Z
INKEY1	rts

INKEY2	lda	taskMESSAGE	; -m for music
	cmp	#'m'
	beq	INKEY3
	cmp	#'M'
	bne	INKEY4
INKEY3	jsr	doMUSIK
	bra	INKEY

INKEY4	cmp	#'q'	; -q to quit
	beq	INKEY5
	cmp	#'Q'
	bne	INKEY
INKEY5	jmp	QUIT

*-------------------------------

BORDER	cmp	theCOLORS
	bcc	BORDER1
	rts
BORDER1	sta	theBORDER
	asl
	tax
	lda	iigsINK,x
	and	#$ff
	pha
	PushWord	#$1c
	_WriteBParam
	rts

*-------------------------------

CLS	lda	thePAPER
	asl
	tax
	lda	tblFULLCOLOR,x
	pha
	_ClearScreen
	
*--- Init cursor location

	ldx	#FIRSTCOLUMN
	stx	theLOCATEX
	ldy	#FIRSTROW
	sty	theLOCATEY

*--- Set cursor location

	jmp	GOTOXY

*-------------------------------

INK	cpx	theCOLORS	; check index
	bcc	INK1
	rts
INK1	cpy	#MAXCOLORS	; check color index
	bcc	INK2
	rts
INK2	stx	theINKINDEX
	sty	theINKVALUE

	PushWord	#0	; for SetColorEntry
	phx
	
	txa		; save color index at index*2
	asl
	tax
	tya
	sta	tblINK,x
	
	tya
	asl
	tay
	lda	tblBORDER,y	; save border index at index*2
	sta	iigsINK,x

	lda	amsPAL320,y
	pha
	_SetColorEntry
	rts
	
*-------------------------------

LOCATE
*	cpx	theMAXX
*	bcc	LOCATE1
*	beq	LOCATE1
*	rts
LOCATE1
*	cpy	theMAXY
*	bcc	LOCATE2
*	bne	LOCATE2
*	rts
LOCATE2	stx	theLOCATEX
	sty	theLOCATEY

*--- Calculate IIgs coordinates

GOTOXY	pha		; x-1 * character width = X pixel
	pha
	lda	theLOCATEX
	dec
	pha
	PushWord	theWIDTHSTEP
	_Multiply
	pla
	sta	theIIGSX
	pla

	pha		; y * character height - 1 = Y pixel
	pha
	PushWord	theLOCATEY
	PushWord	theHEIGHTSTEP
	_Multiply
	pla
	dec
	sta	theIIGSY
	pla
	
	PushWord	theIIGSX
	PushWord	theIIGSY
	_MoveTo
	rts

*-------------------------------

MODE	cmp	#MAXMODE
	bcc	MODE1
	rts
MODE1	sta	theMODE

	asl
	tay

	ldx	tblMODE,y
	ldy	#0
]lp	lda	|$0000,x
	sta	theMAXX,y
	inx
	inx
	iny
	iny
	cpy	#tblMODE1-tblMODE0
	bcc	]lp

*--- Switch resolution

	lda	theIIGSMODE
	pha
	pha
	_SetMasterSCB
	_SetAllSCBs
	PushLong	mainPORT
	_InitPort

	PushWord	#0
	PushWord	theIIGSWIDTH
	PushWord	#0
	PushWord	#200
	_ClampMouse
	_HomeMouse

*--- Set new palette

	lda	theMODE
	cmp	#2
	beq	MODE_640

MODE_320	PushWord	#0	; MODES 0/1
	PushLong	#palette320
	_SetColorTable
	bra	MODE_960

MODE_640	PushWord	#0	; MODE 2
	PushLong	#palette640
	_SetColorTable

MODE_960

*--- Set default paper & pen (LOGO)

	lda	#0
	jsr	PAPER

	lda	#0
	jsr	PEN

*--- Erase screen (which does LOCATE 1,1)

	jmp	CLS

*-------------------------------

PAPER	cmp	theCOLORS	; set the paper
	bcc	PAPER1
	beq	PAPER1
	rts
PAPER1	sta	thePAPER

	asl
	tax
	lda	tblFULLCOLOR,x
	pha
	pha		; as the background color
	_SetBackColor
	
	pla
	ldx	#32-2
]lp	sta	thePATTERN,x
	dex
	dex
	bpl	]lp

	PushLong	#thePATTERN	; white pattern
	_SetPenPat
	rts

*-------------------------------

PEN	cmp	theCOLORS	; set the pen
	bcc	PEN1
	beq	PEN1
	rts
PEN1	sta	thePEN

	asl
	tax
	lda	tblFULLCOLOR,x
	pha		; as the foreground color
	_SetForeColor

	PushWord	#modeCopy
	_SetTextMode
	
	rts

*------------------------------- Print a CSTRING

PRINT	sta	GET_CHAR+1

PRINT1	jsr	GET_CHAR	; get a character
	cmp	#eEOD
	bne	PRINT2	; end of string
	rts

PRINT2	cmp	#chrRET	; >$0d, print char
	bcc	PRINT_FN
	jsr	COUT	; print character
	bra	PRINT1	; and loop

PRINT_FN	cmp	#eINK	; handle INK change
	bne	PRINT3
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	INK
	bra	PRINT1

PRINT3	cmp	#ePEN	; handle PEN change
	bne	PRINT4
	jsr	GET_CHAR
	jsr	PEN
	bra	PRINT1
	
PRINT4	cmp	#ePAPER	; handle PAPER change
	bne	PRINT5
	jsr	GET_CHAR
	jsr	PAPER
	bra	PRINT1

PRINT5	cmp	#eLOCATE	; handle LOCATE change
	bne	PRINT6
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	LOCATE
	bra	PRINT1

PRINT6	cmp	#eBORDER	; handle PAPER change
	bne	PRINT7
	jsr	GET_CHAR
	jsr	BORDER
	bra	PRINT1

PRINT7	cmp	#eCLS
	bne	PRINT8
	jsr	CLS
	bra	PRINT1
	
PRINT8	cmp	#eMODE	; handle PAPER change
	bne	PRINT9
	jsr	GET_CHAR
	jsr	MODE
	bra	PRINT1

PRINT9	cmp	#eWAIT
	bne	PRINT10
	jsr	GET_CHAR
	jsr	nowWAIT_ALT
	brl	PRINT1

PRINT10	cmp	#eSOUND
	bne	PRINT_NOTFN
	jsr	GET_CHAR
	tax
	jsr	GET_CHAR
	tay
	jsr	GET_CHAR
	jsr	SOUND
PRINT_NOTFN	brl	PRINT1
	
*--- Get a character

GET_CHAR	lda	$bdbd
	and	#$ff
	inc	GET_CHAR+1
	rts

*-------------------------------

COUT	cmp	#chrRET
	beq	COUT2
	
	pha		; draw the character
	_DrawChar
	
COUT1	inc	theLOCATEX	; x++
	lda	theLOCATEX	
	cmp	theMAXX
	bcc	COUT3
	beq	COUT3

COUT2	ldx	#FIRSTCOLUMN	; reset x
	stx	theLOCATEX

	inc	theLOCATEY	; y++
	lda	theLOCATEY
	cmp	theMAXY
	bcc	COUT3
	beq	COUT3
	
	ldy	#FIRSTROW	; reset y
	sty	theLOCATEY

COUT3	jmp	GOTOXY	; calculate IIgs coordinates

*-------------------------------

firstTILE	=	143

COUT160	sec
	sbc	#firstTILE
	asl
	asl
	asl
	sta	iconToSourceRect
	clc
	adc	#8
	sta	iconToSourceRect+4
	
	lda	theIIGSY
	sec
	sbc	#7
	sta	iconToDestPoint
	lda	theIIGSX
	sta	iconToDestPoint+2

	PushLong #iconParamPtr
	_PaintPixels
	
	bra	COUT1

*-------------------------------
* VARIABLES
*-------------------------------

DATA_IN

*--- Default strings

strCR	asc	0d00

*--- Amstrad

theBORDER	ds	2
theINKINDEX	ds	2
theINKVALUE	ds	2
theLOCATEX	ds	2
theLOCATEY	ds	2
theMODE	ds	2
thePAPER	ds	2
thePEN	ds	2

tblINK	ds	MAXINK*2	; 0..15
iigsINK	ds	MAXINK*2	; corresponding index color

*--- nb chars, nb lines, nb colors, screen width, screen height
*--- IIgs screen width, IIgs mode, char x-increment, char y-increment

tblMODE	da	tblMODE0,tblMODE1,tblMODE2

tblMODE0	dw	20,25,16,screen160,200	; 160
	dw	screen320,mode320,16,8
tblMODE1	dw	40,25,16,screen320,200	; 320
	dw	screen320,mode320,8,8
tblMODE2	dw	80,25,16,screen640,200	; 640
	dw	screen640,mode640,8,8

*--- 

tblFULLCOLOR	dw	$0000,$1111,$2222,$3333
	dw	$4444,$5555,$6666,$7777
	dw	$8888,$9999,$AAAA,$BBBB
	dw	$CCCC,$DDDD,$EEEE,$FFFF

*--- Apple IIgs

theMAXX	ds	2	; 20/40/80
theMAXY	ds	2	; 25
theCOLORS	ds	2	; 2/4/16
theWIDTH	ds	2	; 160/320/640
theHEIGHT	ds	2	; 200 lines
theIIGSWIDTH	ds	2	; 320/320/640
theIIGSMODE	ds	2	; 320/640
theWIDTHSTEP	ds	2	; column increment in pixels
theHEIGHTSTEP	ds	2	; line increment in pixels
theFULLCOLOR	ds	2	; 16-bit color index for screen cleaning

theIIGSX	ds	2	; x-pixel cursor location
theIIGSY	ds	2	; y-pixel cursor location

*--- Amstrad fake font 160

iconParamPtr
	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconToSourceLocInfo
	dw	$0000	; mode 320
	adrl	char8F	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	8
	dw	0,0,136,16
	
iconToDestLocInfo
	dw	$0000	; mode 320
	adrl	ptr012000
	dw	160
	dw	0,0,199,319
	
iconToSourceRect
	dw	0,0,8,16
iconToDestPoint
	dw	0,0


char8F	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF

char90	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char91	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char92	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	000000FFFFFFFFFF
	hex	000000FFFFFFFFFF
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char93	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFFFFFFFF
	hex	0000000FFFFFFFFF
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char94	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char95	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char96	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000FFFFFFFFF
	hex	000000FFFFFFFFFF
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char97	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFFFFFFFF
	hex	000000FFFFFFFFFF
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char98	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	FFFFFFFFFF000000
	hex	FFFFFFFFFF000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char99	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	FFFFFFFFFF000000
	hex	FFFFFFFFF0000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char9A	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char9B	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000

char9C	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	FFFFFFFFF0000000
	hex	FFFFFFFFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char9D	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	FFFFFFFFFF000000
	hex	FFFFFFFFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char9E	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

char9F	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	FFFFFFFFFFFFFFFF
	hex	FFFFFFFFFFFFFFFF
	hex	000000FFFF000000
	hex	000000FFFF000000
	hex	000000FFFF000000

*--- Amstrad palette

amsPAL320	dw	$0000	;  0 black
	dw	$0008	;  1 blue
	dw	$000F	;  2 bright blue
	dw	$0800	;  3 red
	dw	$0808	;  4 magenta
	dw	$080F	;  5 mauve
	dw	$0F00	;  6 bright red
	dw	$0F08	;  7 purple
	dw	$0F0F	;  8 bright magenta
	dw	$0080	;  9 green
	dw	$0088	; 10 cyan
	dw	$008F	; 11 sky blue
	dw	$0880	; 12 yellow
	dw	$0888	; 13 white
	dw	$088F	; 14 pastel blue
	dw	$0F80	; 15 orange
	dw	$0F88	; 16 pink
	dw	$0F8F	; 17 pastel magenta
	dw	$00F0	; 18 bright green
	dw	$00F8	; 19 sea green
	dw	$00FF	; 20 bright cyan
	dw	$08F0	; 21 lime
	dw	$08F8	; 22 pastel green
	dw	$08FF	; 23 pastel cyan
	dw	$0FF0	; 24 bright yellow
	dw	$0FF8	; 25 pastel yellow
	dw	$0FFF	; 26 bright white

*--- 320 Palette

palette640	dw	$0000,$000F,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	dw	$0000,$0F00,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF

palette320	dw	$0000	;  0
	dw	$0777	;  1
	dw	$0841	;  2
	dw	$072C	;  3
	dw	$000F	;  4
	dw	$0080	;  5
	dw	$0F70	;  6
	dw	$0D00	;  7
	dw	$0FA9	;  8
	dw	$0FF0	;  9
	dw	$00E0	; 10
	dw	$04DF	; 11
	dw	$0DAF	; 12
	dw	$078F	; 13
	dw	$0CCC	; 14
	dw	$0FFF	; 15

*--- Pattern

thePATTERN	ds	32

blackPATTERN	ds	32,$00
	ds	32,$11
	ds	32,$22
	ds	32,$33
	ds	32,$44
	ds	32,$55
	ds	32,$66
redPATTERN	ds	32,$77
	ds	32,$88
yellowPATTERN	ds	32,$99
	ds	32,$aa
cyanPATTERN	ds	32,$bb
	ds	32,$cc
	ds	32,$dd
	ds	32,$ee
whitePATTERN	ds	32,$ff

*--- Border table

tblBORDER	dw	0	;'Black' color message number
	dw	2	;'Deep Red' color message number
	dw	7	;'Dark Blue' color message number
	dw	1	;'Purple' color message number
	dw	3	;'Dark Green' color message number
	dw	3	;'Dark Gray' color message number
	dw	1	;'Medium Blue' color message number
	dw	3	;'Light Blue' color message number
	dw	8	;'Brown' color message number
	dw	4	;'Orange' color message number
	dw	8	;'Light Gray' color message number
	dw	6	;'Pink' color message number
	dw	1	;'Light Green' color message number3
	dw	5	;'Yellow' color message number
	dw	6	;'Aquamarine' color message number
	dw	9	;'White' color message number
	dw	11
	dw	11
	dw	12
	dw	12
	dw	14
	dw	12
	dw	12
	dw	14
	dw	13
	dw	13
	dw	15

*--- Keyboard

lenSTRING	ds	2
IN	ds	maxLEN+2

*--- End of engine
