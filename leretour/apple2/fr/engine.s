*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-----------------------------------
* LES PRIMITIVES 8-BITS EN 16-BITS
*-----------------------------------

HGR	rep	#$30
	PushWord	#0
	_ClearScreen
	sep	#$30
	rts

*-----------------------------------

RDKEY
	PushWord	#0
	PushWord	#%0000_0000_0000_1000
	PushLong	#eventREC
	_GetNextEvent
	pla
	beq	RDKEY

	lda	eventREC
	cmp	#
         PEA   ^eventREC
         PEA   eventREC
         _GetNextEvent
         PLA
         TAY
         beq   L011DBE
         LDA   eventREC
         CMP   #$0001	; mouseDownEvt
         BEQ   L011DE4
         BRL   L011EC4

*--------

eventREC
oWHAT	DW	$0000	; what - event code
oMESSAGE	ADRL	$00000000 	; message - event message
	ADRL	$00000000	; when - tick count
oWHERE
oWHEREY	DW	$0000	; where - mouse location
oWHEREX	DW	$0000
oMODIFIERS	DW	$0000	; modifiers - modifiers

*-----------------------------------
* RECOPIE ACTION A$
*-----------------------------------

	mx	%11
	
checkACTION	lda	#<newA$	; POINTEUR
	sta	dpFROM
	lda	#>newA$
	sta	dpFROM+1
	
L953B       LDY	#0
            LDA	(dpFROM),Y
            CMP	MO$1	; premier mot
            BEQ	L9546
            JMP	L95EF
L9546       INY	
            LDA	(dpFROM),Y
            BEQ	L9552
            CMP	MO$2	; second mot
            BEQ	L9552
            JMP	L95EF

L9552       INY		; on a trouvé, on gère
            LDA	(dpFROM),Y
            INY	
            TAX	
            LDA	(dpFROM),Y
            CPX	#$41	; A
            BEQ	L958B
            CPX	#$42	; B
            BEQ	L9593
            CPX	#$43	; C
            BEQ	L95A3
            CPX	#$44	; D
            BEQ	L95B3
            CPX	#$45	; E
            BEQ	L95BE
            CPX	#$46	; F
            BEQ	L95C7
            CPX	#$47	; G
            BEQ	L95D0
            CPX	#$48	; H
            BEQ	L95DB
            CPX	#$49	; I
            BEQ	L95E7

            LDX	#0	; sinon, on recopie until FF
L957F       LDA	(dpFROM),Y
            STA	E$+1,X
            INY	
            INX	
            CMP	#-1
            BNE	L957F
	dex		; save len
	stx	E$
            rts

*-- A - 

L958B       CMP	SALLE
            BNE	L95EF
            JMP	L9552		; on boucle

*-- B - 

L9593       TAX
            LDA	O,X	; les objets
            CMP	#-1
            BEQ	L9552
            CMP	SALLE
            BEQ	L9552
            JMP	L95EF

*-- C - 

L95A3       TAX
            LDA	O,X
            CMP	#-1
            BEQ	L95EF
            CMP	SALLE
            BEQ	L95EF
            JMP	L9552

*-- D - 

L95B3       TAX
            LDA	O,X
            CMP	#-1
            BEQ	L9552
            JMP	L95EF

*-- E - 

L95BE       TAX
            LDA	P,X
            BNE	L9552
            JMP	L95EF

*-- F - 

L95C7       TAX
            LDA	P,X
            BEQ	L9552
            JMP	L95EF

*-- G - 

L95D0       TAX
            LDA	C,X
            CMP	#1
            BNE	L95EF
            JMP	L9552

*-- H - RANDOM

L95DB	jmp	L95EF	; LOGO - Use the QDII RND

*	STA   $7C
*           LDA   $0306
*           CMP   $7C
*           BCS   L95EF
*           JMP   L9552

*-- I - 

L95E7       CMP	SALLE
            BEQ	L95EF
            JMP	L9552

*--- next

L95EF	inc	dpFROM
	bne	L95F0
	inc	dpFROM+1
L95F0	lda	(dpFROM)	; until the end
	cmp	#-1
	bne	L95EF
	
	inc	dpFROM
	bne	L95F1
	inc	dpFROM+1
L95F1	lda	(dpFROM)	; on a parcouru
	beq	L9619	; le tableau, on sort
	jmp	L953B
L9619       sta	E$	; on n'a rien trouvé
	rts

*-----------------------------------
* AFFICHE UNE IMAGE
*-----------------------------------

	mx	%00
	
showPIC	rep	#$30
	and	#$00ff
	asl
	tax
	lda	tblIMAGES,x
	bne	L92A5
showPIC99	sep	#$30
	rts

	mx	%00

L92A5	sta	dpFROM

L92A6	ldy	#0
	lda	(dpFROM),y
	and	#$ff
	beq	showPIC99

L92A7	CMP	#'A'	; A $41 CURSET
            BNE	L92B1
            JMP	L9319

L92B1	CMP	#'B'	; B $42 DRAW X,Y
            BNE	L92B8
            JMP	L933E

L92B8	CMP	#'C'	; C $43 DRAW ^X,Y
            BNE	L92BF
            JMP	L9368

L92BF	CMP	#'D'	; D $44 DRAW X,^Y
            BNE	L92C6
            JMP	L9398

L92C6	CMP	#'E'	; E $45 DRAW ^X,^Y
            BNE	L92CD
            JMP	L93C8

L92CD	CMP	#'F'	; F $46 MOVE X,Y
            BNE	L92D4
            JMP	L93FD

L92D4	CMP	#'G'	; G $47 MOVE ^X,Y
            BNE	L92DB
            JMP	L9402

L92DB	CMP	#'H'	; H $48 MOVE X,^Y
            BNE	L92E2
            JMP	L9407

L92E2	CMP	#'I'	; I $49 MOVE ^X,^Y
            BNE	L92E9
            JMP	L940C

L92E9	CMP	#'J'	; J $4A INK
            BNE	L92F0
            JMP	L9411

L92F0	CMP	#'K'	; K $4B PAPER
            BNE	L92F7
            JMP	L9426

L92F7	CMP	#'L'	; L $4C FILL
            BNE	L92FE
            JMP	L943B

L92FE	CMP	#'M'	; M $4D MESSAGE
            BNE	L9305
            JMP	L9462

L9305	CMP	#'N'	; N $4E CIRCLE
            BNE	L930C
            JMP	L94BC

L930C	CMP	#'O'	; O $4F OUTPUT
            BNE	L9313
            JMP	L94D8

L9313       brk	$bd

*--- A $41 CURSET

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

*--- B $42 DRAW X,Y

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

*--- C $43 DRAW ^X,Y

L9368       lda	#$01
L936A       sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	eor	#-1
	inc
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- D $44 DRAW X,^Y

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
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- E $45 DRAW ^X,^Y

L93C8       lda	#$01
L93CA       sta	theFB
	iny
            lda	(dpFROM),y	; X
	and	#$ff
	eor	#-1
	inc
	sta	theX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	eor	#-1
	inc
	sta	theY
            jsr	DRAW
            jmp	skip2

*--- F $46 DRAW X,Y,3 = CURMOV

L93FD       lda	#$03
            jmp	L9340

*--- G $47 DRAW ^X,Y,3 = CURMOV

L9402       lda	#$03
            jmp	L936A

*--- H $48 DRAW X,^Y,3 = CURMOV

L9407       lda	#$03
            jmp	L939A

*--- I $49 DRAW ^X,^Y,3 = CURMOV

L940C       lda	#$03
            jmp	L93CA

*--- J $4A INK

L9411	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	theINK
	jsr	INK
	jmp	skip1

*--- K $4B PAPER

L9426	iny
            lda	(dpFROM),y	; X
	and	#$ff
	sta	thePAPER
	jsr	PAPER
	jmp	skip1

*--- L $4C FILL

L943B	iny
            lda	(dpFROM),y	; X
	and	#$ff
	clc
	lda	curX
	sta	fillX
	iny
	lda	(dpFROM),y	; Y
	and	#$ff
	clc
	lda	curY
	sta	fillY
	iny
	lda	(dpFROM),y	; fill color
	and	#$ff
	sta	fillCOLOR
	jsr	FILL
	jmp	skip3

*--- M $4D CHAR_ALT

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
	
	PushWord	#0
	_GetTextMode
	
	PushWord	#modeForeCopy
	_SetTextMode

	ldy	#3
]lp	lda	(dpFROM),y
	and	#$ff
	beq	L94B9
	phy
	pha
	_DrawChar
	ply
	iny
	bne	]lp
L94B9	tya
	clc
	adc	dpFROM
	sta	dpFROM

	_SetTextMode

	jmp	skip0

*--- N $4E CIRCLE

L94BC	iny
	lda	(dpFROM),y	; radius
	and	#$ff
	sta	theRADIUS
	jsr	CIRCLE
	jmp	skip1

*--- O $4F OUT

L94D8	iny
	lda	(dpFROM),y
	and	#$ff
	sep	#$30
	rts

	mx	%00

*--- Next one, please...

skip3	inc	dpFROM
skip2	inc	dpFROM
skip1	inc	dpFROM
skip0	inc	dpFROM

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

	PushWord	#0
	PushWord	#15
	asl
	tax
	lda	palette320,x
	pha
	_SetColorEntry
	
*	PushWord	#^blackPATTERN
*	asl
*	asl
*	asl
*	asl
*	asl
*	clc
*	adc	#blackPATTERN
*	pha
*	_SetPenPat
	rts

*-----------------------------------

PAPER	ldx	thePAPER
	lda	o2gsCOLOR,x
	and	#$ff
	sta	iigsPAPER
	
	PushWord	#0
	PushWord	#0
	
	asl
	tax
	lda	palette320,x
	pha
	_SetColorEntry
	
	ldal	$c034
	inc
	stal	$c034
	rts

*-----------------------------------

resMode	=	%0001_0000000000_10

FILL	ldx	fillCOLOR	; sets the pattern to use
	lda	o2gsCOLOR,x
	and	#$ff
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#blackPATTERN
	sta	patternPtr

	PushLong	#srcLocInfoPtr
	PushLong	#srcRect
	PushLong	#srcLocInfoPtr
	PushLong	#srcRect
	PushWord	fillX
	PushWord	fillY
	PushWord	#resMode
	PushLong	patternPtr
	PushLong	#leakTblPtr
	_SeedFill
	rts

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
* DONNEES
*-----------------------------------

o2gsCOLOR	dfb	0,7,10,9,4,12,11,15
o2gsFB	dfb	0,0,2,0

curY	ds	2	; cursor position
curX	ds	2

*----------- IIgs values

iigsINK	ds	2	; translated IIgs data
iigsPAPER	ds	2
iigsFB	ds	2

*----------- ORIC values

theINK	ds	2	; original Oric data
thePAPER	ds	2
theFB	ds	2
theX	ds	2
theY	ds	2

*----------- FILL

fillX	ds	2
fillY	ds	2
fillCOLOR	ds	2

srcLocInfoPtr
	dw	mode320	; mode 320
	adrl	ptr012000
	dw	160
	dw	0,0,199,239

srcRect	dw	0,0,179,239

patternPtr	adrl	blackPATTERN ; pointer to pattern

leakTblPtr	dw	1
	dw	$0000	; color 0 is concerned
	
*----------- CIRCLE

theRADIUS	ds	2

circleRECT	ds	2	; Y0
	ds	2	; X0
	ds	2	; Y1
	ds	2	; X1
