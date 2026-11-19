*
* Zombi
*
* (c) 1986, Yannick Cadin et Ubisoft
* (c) 2026, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-------------------------------
* PASCAL LIBRARY
*-------------------------------

*-------------------------------
* EQUATES
*-------------------------------

MIN_TEXT_X	=	1
MIN_TEXT_Y	=	1
MAX_TEXT_X	=	40
MAX_TEXT_Y	=	25

*-------------------------------
* DIRECT PAGE
*-------------------------------

dpPRINT	=	$80
textX	=	dpPRINT+4
textY	=	textX+2
shrX	=	textY+2
shrY	=	shrX+2
foreCOLOR	=	shrY+2
backCOLOR	=	foreCOLOR+2
theHERTZ	=	backCOLOR+2	; 50 (1) or 60 (0) Hertz

*-------------------------------
* MACROS
*-------------------------------

@CLEARSCREEN	mac
	jsr	CLEARSCREEN
	<<<

@DELAY	mac
	lda	]1
	jsr	DELAY
	<<<

@GOTOXY	mac
	ldx	]1
	ldy	]2
	jsr	GOTOXY
	<<<

@GRAPHMODE	mac
	jsr	GRAPHMODE
	<<<

@PRINT	mac
	ldx	^]1
	ldy	]1
	jsr	PRINT
	<<<

*-------------------------------
* 
*-------------------------------

*-------------------------------
* CLEARSCREEN
*-------------------------------

CLEARSCREEN	PushWord	#0
	_ClearScreen
	rts

*-------------------------------
* DELAY (A IN MS)
*-------------------------------

DELAY	cmp	#0
	bne	DELAY1
	rts

DELAY1	ldy	#0	; how many Y
]lp	iny		; every 60 A
	sec
	sbc	theHERTZ
	bpl	]lp

]lp	jsr	nextVBL
	dey
	bne	]lp
	rts

*-------------------------------
* GOTOXY (X,Y)
*-------------------------------

GOTOXY	cpx	#0
	beq	GOTOXY9
	cpy	#0
	beq	GOTOXY9

	stx	textX
	sty	textY
GOTOXY9	rts

*-------------------------------
* GRAPHMODE
*-------------------------------

GRAPHMODE	PushWord	#0	; are we running in
	PushWord	#$1d	; 60 Hz: 0
	_ReadBParam		; 50 Hz: 1
	pla
	ldx	#50
	cmp	#1
	beq	GRAPHMODE1
	ldx	#60	
GRAPHMODE1	stx	theHERTZ

* Mettre la palette du jeu

	rts

*-------------------------------
* SETGOTOXY FOR PRINT
*-------------------------------

setGOTOXY	lda	textX
	asl
	tax
	lda	tblX,x
*	sta	shrX
	pha
	
	lda	textY
	asl
	tay
	lda	tblY,y
*	sta	shrY
	pha
	_MoveTo
	rts

*-------------------------------
* PRINT (@ X/Y)
*-------------------------------

PRINT	sty	dpPRINT	; set pointer
	stx	dpPRINT+2

]lp	jsr	setGOTOXY	; set coordinates
	
	lda	[dpPRINT]	; get a character
	and	#$ff
	bne	PRINT1
	rts		; exit if null

PRINT1	inc	dpPRINT	; pointer++
	bne	PRINT2
	inc	dpPRINT+2

PRINT2	cmp	#chrSPACE	; skip display if space
	beq	PRINT3
	cmp	#chrRETURN	; next line if return
	beq	PRINT4

	pha		; or draw character
	_DrawChar

PRINT3	lda	textX	; x++
	inc
	cmp	#MAX_TEXT_X+1
	bcs	PRINT4
	sta	textX
	bra	]lp

PRINT4	lda	#MIN_TEXT_X	; y++
	sta	textX

	lda	textY
	inc
	cmp	#MAX_TEXT_Y+1
	bcs	PRINT5
	lda	#MIN_TEXT_Y
	sta	textY
	bra	]lp
PRINT5	rts

*-------------------------------
* TABLES
*-------------------------------

tblX	dw	0	; un premier 0
]valeur	=	$0
	lup	40
	dw	]valeur
]valeur	=	]valeur+8
	--^

tblY			; pas de premier 0
]valeur	=	$0
	lup	25
	dw	]valeur
]valeur	=	]valeur+8
	--^
	