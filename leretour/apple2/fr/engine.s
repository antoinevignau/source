*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%00

*-----------------------------------
* AFFICHE UNE IMAGE
*-----------------------------------

showIMAGE	asl
	tax
	lda	tblIMAGES,x
	bne	L92A5
	rts
	
L92A5	sta	dpFROM

L92A6	ldy	#0
	lda	(dpFROM),y
	and	#$ff
	bne	L92A7
	rts

L92A7	CMP	#'A'	; A
            BNE	L92B1
            JMP	L9319

L92B1	CMP	#'B'	; B
            BNE	L92B8
            JMP	L933E

L92B8	CMP	#'C'	; C
            BNE	L92BF
            JMP	L9368

L92BF	CMP	#'D'	; D
            BNE	L92C6
            JMP	L9398

L92C6	CMP	#'E'	; E
            BNE	L92CD
            JMP	L93C8

L92CD	CMP	#'F'	; F
            BNE	L92D4
            JMP	L93FD

L92D4	CMP	#'G'	; G
            BNE	L92DB
            JMP	L9402

L92DB	CMP	#'H'	; H
            BNE	L92E2
            JMP	L9407

L92E2	CMP	#'I'	; I
            BNE	L92E9
            JMP	L940C

L92E9	CMP	#'J'	; J
            BNE	L92F0
            JMP	L9411

L92F0	CMP	#'K'	; K
            BNE	L92F7
            JMP	L9426

L92F7	CMP	#'L'	; L
            BNE	L92FE
            JMP	L943B

L92FE	CMP	#'M'	; M
            BNE	L9305
            JMP	L9462

L9305	CMP	#'N'	; N
            BNE	L930C
            JMP	L94BC

L930C	CMP	#'O'	; O
            BNE	L9313
            JMP	L94D8

L9313       brk	$bd

*--- A - CURSET

L9319       iny
            lda	(dpFROM),y	; X
	and	#$ff
	pha
	sta	curX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	pha
	sta	curY
	_MoveTo
	jmp	skip2

*--- B - DRAW X,Y

L933E       lda	#$01
L9340	sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- C - DRAW ^X,Y

L9368       lda	#$01
L936A       sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	eor	#-1
	inc
*	and	#$ff
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- D - DRAW X,^Y

L9398       lda	#$01
L939A       sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	eor	#-1
	inc
*	and	#$ff
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- E - DRAW ^X,^Y

L93C8       lda	#$01
L93CA       sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	eor	#-1
	inc
*	and	#$ff
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	eor	#-1
	inc
*	and	#$ff
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- F - DRAW X,Y,3 = CURMOV

L93FD       lda	#$03
            jmp	L9340

*--- G - DRAW ^X,Y,3 = CURMOV

L9402       lda	#$03
            jmp	L936A

*--- H - DRAW X,^Y,3 = CURMOV

L9407       lda	#$03
            jmp	L939A

*--- I - DRAW ^X,^Y,3 = CURMOV

L940C       lda	#$03
            jmp	L93CA

*--- J - INK

L9411	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	theINK
	jsr	INK
	jmp	skip1

*--- K - PAPER

L9426	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	thePAPER
	jsr	PAPER
	jmp	skip1

*--- L - FILL

L943B	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	fillX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	sta	fillY
	iny
	lda	(dpFROM),y	; fill color
	and	#$ff
	sta	fillCOLOR
	jsr	FILL
	jmp	skip3

*--- M - CHAR_ALT

L9462	iny
            lda	(dpFROM),y	; X
	and	#$ff
	pha
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	clc
	adc	#8	; QDII: Y est le bas du texte, pas le haut
	pha
	_MoveTo
	ldy	#3
]lp	sty	dpY
	lda	(dpFROM),y
	and	#$ff
	beq	L94B9
	pha
	_DrawChar
	ldy	dpY
	iny
	bne	]lp
L94B9       tya
	clc
	adc	dpFROM
	sta	dpFROM
	jmp	skip0

*--- N - CIRCLE

L94BC	iny
	lda	(dpFROM),y	; radius
	and	#$ff
	sta	theRADIUS
	jsr	CIRCLE
	jmp	skip1

*--- O - OUT

L94D8	iny
	lda	(dpFROM),y
	and	#$ff
	rts

*--- Next one, please...

skip3	inc	dpFROM
skip2	inc	dpFROM
skip1	inc	dpFROM
skip0	inc	dpFROM

	ldal	$c034
	inc
	stal	$c034

	jmp	L92A6

*-----------------------------------
* IIGS PRIMITIVES
*-----------------------------------

* FG info
*  0: points are plotted in the background color
*  1: points are plotted in the foreground color
*  2: points are inverted (NOT)
*  3: points are not drawn but cursor is updated

* Color info
*  0: black
*  1: red
*  2: green
*  3: yellow
*  4: blue
*  5: magenta
*  6: cyan
*  7: white

*-----------------------------------

DRAW	lda	theFB
	cmp	#3	; only move
	beq	DRAW9

	tax
	lda	o2gsFB,x
	and	#$ff
	pha
	_SetPenMode

	PushWord	theX	; On trace une ligne
	PushWord	theY
	_Line
	PushLong	#curY
	_GetPen
	rts

DRAW9	PushWord	theX	; On déplace le curseur seulement
	PushWord	theY
	_Move
	PushLong	#curY
	_GetPen
	rts

*-----------------------------------

INK	ldx	theINK
	lda	o2gsCOLOR,x
	and	#$ff
	sta	iigsINK
	
	PushWord	#^blackPATTERN
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#blackPATTERN
	pha
	_SetPenPat
	rts

*-----------------------------------

PAPER	ldx	thePAPER
	lda	o2gsCOLOR,x
	and	#$ff
	sta	iigsPAPER
	rts

*-----------------------------------

FILL	rts	; NADA FOR NOW (FillRgn ou SeedFill)

*-----------------------------------

CIRCLE	lda	curX
	sec
	sbc	theRADIUS
	bpl	CIRCLE1
	lda	#0
CIRCLE1	sta	circleRECT+2

	lda	curX
	clc
	adc	theRADIUS
	cmp	#maxX
	bcc	CIRCLE2
	lda	#maxX-1
CIRCLE2	sta	circleRECT+6

	lda	curY
	sec
	sbc	theRADIUS
	bpl	CIRCLE3
	lda	#0
CIRCLE3	sta	circleRECT

	lda	curY
	clc
	adc	theRADIUS
	cmp	#maxY
	bcc	CIRCLE4
	lda	#maxY-1
CIRCLE4	sta	circleRECT+4

	PushLong	#circleRECT
	_FrameOval
	rts

*-----------------------------------

CHAR_ALT	rts

*-----------------------------------
* DONNEES
*-----------------------------------

o2gsCOLOR	dfb	0,7,10,9,4,12,11,15
o2gsFB	dfb	0,0,2,0

ICI	=	*

curY	ds	2	; cursor position
curX	ds	2

iigsINK	ds	2	; translated IIgs data
iigsPAPER	ds	2
iigsFB	ds	2

theINK	ds	2	; original Oric data
thePAPER	ds	2
theFB	ds	2
theX	ds	2
theY	ds	2
theX2	ds	2	; global dest X-coord (curX + theX)
theY2	ds	2	; global dest Y-coord (curY + theY)
fillX	ds	2
fillY	ds	2
fillCOLOR	ds	2
theCHAR	ds	2
theRADIUS	ds	2

nbTOURS	ds	5

circleRECT	ds	2	; Y0
	ds	2	; X0
	ds	2	; Y1
	ds	2	; X1
