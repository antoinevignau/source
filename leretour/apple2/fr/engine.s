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

	mx	%11
	
BORDER	ldal	$c034
	inc
	stal	$c034
	rts

*-----------------------------------
	
	mx	%11
	
printNIVEAU	ora	#'0'
	sta	strNIVEAU+9
	
	rep	#$30
	
	PushWord	#250
	PushWord	#10
	_MoveTo
	PushLong	#strNIVEAU
	_DrawCString
	sep	#$30
	rts

*-----------------------------------

	mx	%00
	
HGR	rep	#$30
	PushWord	#0
	_ClearScreen
	sep	#$30
	rts

*-----------------------------------

RDKEY	phx
	jsr	CURSOR	; shows the cursor
	rep	#$30

]lp	inc	VBLCounter0	; for RND

	pha
	PushWord #%00000000_00001000
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	]lp

	lda	taskREC
	cmp	#keyDownEvt
	bne	]lp

	lda	taskMESSAGE
	
	sep	#$30
	plx
	rts

*-----------------------------------

HOME	rep	#$30

*----------- Efface le simulacre d'ecran texte

	lda	ptrTEXT
	sta	dpTO
	lda	ptrTEXT+2
	sta	dpTO+2
	
	ldy	#0
	tya
]lp	sta	[dpTO],y
	iny
	iny
	bpl	]lp

	lda	#bottomRECT

*----------- Efface les 3 lignes du bas
	
	mx	%00
	
eraseLINES	sta	pointerRECT
	
	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#blackPATTERN
	_SetPenPat
	
	PushLong	pointerRECT
	_PaintRect

	PushLong	#curPATTERN
	_SetPenPat
	
	sep	#$30
	rts

*-----------

pointerRECT	adrl	bottomRECT

bottomRECT	dw	170,0,199,319
lastlineRECT dw	190,0,199,319
cursorRECT	dw	0,0,0,0	; y2 and x2 are y1+7 and x1+7

testme	ds	2

*-----------------------------------

	mx	%11

*CURSOR_ERASE
	phx
	lda	CH
	pha
	lda	CV
	pha

	lda	#' '
	jsr	COUT

	pla
	sta	CV
	pla
	sta	CH

	dec	CH
	jsr	TABV
	plx
	rts

*-----------------------------------

	mx	%11

CURSOR_ERASE
	phx
	rep	#$30

	lda	textY
	sta	cursorRECT+4
	sec
	sbc	#8
	sta	cursorRECT
	
	lda	textX
	sta	cursorRECT+2
	clc
	adc	#8
	sta	cursorRECT+6
	
	lda	#cursorRECT
	jsr	eraseLINES	; retour en 8-bits

	mx	%11
	
	dec	CH
	jsr	TABV
	plx
	rts

*-----------------------------------

	mx	%11
	
CURSOR	lda	CH
	pha
	lda	CV
	pha
	lda	#$a5	; black bullet
	jsr	COUT
	pla
	sta	CV
	pla
	sta	CH
	
*-----------------------------------

	mx	%11
	
TABV	rep	#$30
	lda	CV
	and	#$ff
	asl
	tax
	lda	text2shr,x
	sta	textY

	lda	CH	; 8 pixels de large par caractere
	and	#$ff
	asl
	asl
	asl
	sta	textX
	sep	#$30
	rts

*-----------------------------------

	mx	%11

GOTOXY	stx	textX
	sty	textY
	lda	#0
	sta	textX+1
	sta	textY+1
	
	rep	#$30
	PushWord	textX
	PushWord	textY
	_MoveTo
	sep	#$30
	rts

*-----------------------------------

	mx	%11
	
COUTXY	pea	^COUTXY
	phx
	phy
	rep	#$30
	_DrawCString
	sep	#$30
	rts

*-----------------------------------

	mx	%11
	
COUT	phx
	phy
	rep	#$30
	and	#$ff
	cmp	#chrRET	; next line, please
	beq	COUT1
	pha

	PushWord	textX
	PushWord	textY
	_MoveTo
	_DrawChar

*----------- next X position

	sep	#$20
	inc	CH
	rep	#$20
	
	lda	textX
	clc
	adc	#8
	sta	textX
	cmp	#maxX
	bcs	COUT1
	
COUT99	sep	#$30
	ply
	plx
	rts

*----------- next Y position
	
	mx	%00

COUT1	stz	textX	; a new line
	sep	#$20
	stz	CH

	lda	CV	; où est-on ?
	cmp	#maxTROW
	bcs	COUT2	; on est deja sur la derniere ligne

	inc	CV	; non, encore de la place
	rep	#$20
	lda	textY
	clc
	adc	#10
	sta	textY
	bra	COUT99	; on sort

*----------- on doit bouger les écrans
*
* 1 - ptrTEXTE est décalé de 8 lignes vers le haut
* 2 - on copie 10 lignes de l'écran vers ptrTEXT
* 3 - on décale le texte d'une ligne vers le haut
* 4 - on met un bloc noir

	mx	%00

COUT2	rep	#$20

*----------- Etape 1

	lda	ptrTEXT+2	; source commence ligne 10
	pha
	lda	ptrTEXT
	clc
	adc	#160*10
	pha
	PushLong	ptrTEXT	; destination en haut
	PushLong	#160*170	; on copie 170 lignes
	_BlockMove

*----------- Etape 2

	lda	ptrSCREEN+2	; source commence ligne 170
	pha
	lda	ptrSCREEN
	clc
	adc	#160*170
	pha

	lda	ptrTEXT+2	; destination commence ligne 160
	pha
	lda	ptrTEXT
	clc
	adc	#160*160
	pha
	PushLong	#160*10	; on copie 10 lignes
	_BlockMove

*----------- Etape 3

	lda	ptrSCREEN+2	; source commence ligne 180
	pha
	lda	ptrSCREEN
	clc
	adc	#160*180
	pha
	
	lda	ptrSCREEN+2	; destination commence ligne 170
	pha
	lda	ptrSCREEN
	clc
	adc	#160*170
	pha
	
	PushLong	#160*20	; on copie 20 lignes
	_BlockMove
	
*----------- Etape 3

	lda	#lastlineRECT
	jsr	eraseLINES	; en 8-bits à la sortie

	mx	%11
	
	ply
	plx
	rts

*----------- Exit

text2shr	dw	9,19,29,39,49,59,69,79,89,99
	dw	109,119,129,139,149,159,169,179,189,199
	
*text2shr	dw	8,16,24,32,40,48,56,64
*	dw	72,80,88,96,104,112,120,128
*	dw	136,144,152,160,168,176,184,192
*	dw	200
	
*-----------------------------------

	mx	%11

*RND	rep	#$30
*	PushWord	#0
*	_Random
*	pla
*	sep	#$30
*	rts

RND	rep	#$30
	ldal	VERTCNT
	xba
	clc
	adc	VBLCounter0
	sta	VBLCounter0
	and	#$ff
	sep	#$30
	rts

VBLCounter0	ds	2

*-----------------------------------
* LES SONS DE L'ORIC
*-----------------------------------

	ext	sndEXPLODE
	ext	sndZAP
	
EXPLODE	rep	#$30
	ldx	#^sndEXPLODE
	ldy	#sndEXPLODE
	lda	#139
	bra	playSOUND
	
ZAP	rep	#$30
	ldx	#^sndZAP
	ldy	#sndZAP
	lda	#22

playSOUND	sty	waveSTART
	stx	waveSTART+2
	sta	waveSIZE

	PushWord #%0000_0000_1000_0000
	_FFStopSound

	PushWord #$0701
	PushLong #waveSTART
	_FFStartSound

	sep	#$30
	rts

*--- Donnees Sound Tool Set

waveSTART	ds	4	; waveStart
waveSIZE	ds	2	; waveSize
	dw	428	; freqOffset
	dw	$0000	; docBuffer
	dw	$0000	; bufferSize
	ds	4	; nextWavePtr
	dw	255	; volSetting

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
            STA	BFE0,X
            INY	
            INX	
            CMP	#-1
            BNE	L957F
	RTS

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

L95DB	STA	$7C
*	LDA	$0306
	jsr	RND
	CMP	$7C
	BCS	L95EF
	JMP	L9552

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

L9619       LDA	#$00
	STA	BFF0
	RTS

*--- data

BFE0	ds	16
BFF0	ds	16

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

L9313       lda	#0
	sep	#$30
	sta	A2
	rts

	mx	%00
	
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
	sta	A2	; the variable at $400
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
