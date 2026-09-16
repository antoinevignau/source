*
* Orphee
*
* (c) 1985, Laurent Benes & Loriciels
* (c) 2024, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-----------------------------------
* LES PRIMITIVES 8-BITS EN 16-BITS
*-----------------------------------

*-----------------------------------
* ROUTINE TEMPS (MERCI THE TINIES)
*-----------------------------------
*
*	mx	%11
*	
*intTIME	ds	4
*	dw	60
*	dw	$a55a
*
*	lda	#60
*	stal	intTIME+4
*
*	ldal	fgTIME
*	beq	intTIME1
*
*	lda	switchTEMPS+1	; switch is off
*	bne	intTIME1
*	
*	sed
*	ldal	SECONDES
*	sec
*	sbc	#1
*	stal	SECONDES
*	cmp	#$99
*	bne	intTIME1
*
*	lda	#$59
*	stal	SECONDES
*
*	ldal	MINUTES
*	sec
*	sbc	#1
*	stal	MINUTES
*	cmp	#$99
*	bne	intTIME1
*
*	lda	#0
*	stal	MINUTES	; on a perdu !!!
*	stal	SECONDES
*
*intTIME1	cld
*	clc
*	rtl
*
*-----------------------------------
*
*	mx	%00
*	
*printTEMPS	lda	fgTEXT
*	beq	pt1
*	rts
*pt1	lda	fgTIME
*	bne	pt2
*	rts
*
*pt2	sep	#$30
*	lda	MINUTES
*	and	#%1111_0000
*	lsr
*	lsr
*	lsr
*	lsr
*	ora	#'0'
*	sta	strTEMPS
*
*	lda	MINUTES
*	and	#%0000_1111
*	ora	#'0'
*	sta	strTEMPS+1
*
*	lda	SECONDES
*	and	#%1111_0000
*	lsr
*	lsr
*	lsr
*	lsr
*	ora	#'0'
*	sta	strTEMPS+3
*
*	lda	SECONDES
*	and	#%0000_1111
*	ora	#'0'
*	sta	strTEMPS+4
*
*	rep	#$30
*	PushWord	#250
*	PushWord	#20
*	_MoveTo
*	PushLong	#strTEMPS
*	_DrawCString
*	rts
*
*-----------------------------------

	mx	%00

FULLHGR	rep	#$30
	PushWord	#0
	_ClearScreen
	sep	#$30
	rts

*-----------------------------------
*
*	mx	%00
*	
*HGR	rep	#$30
*	lda	ptrSCREEN
*	sta	dpTO
*	lda	ptrSCREEN+2
*	sta	dpTO+2
*
*	ldy	#160*160-2
*	lda	#0
*]lp	sta	[dpTO],y
*	dey
*	dey
*	bpl	]lp
*
*	sep	#$30
*	rts
*
*-----------------------------------

	mx	%11

RDKEY	jsr	CURSOR	; shows the cursor
RDKEY2	rep	#$30

]lp	inc	VBLCounter0	; for RND

*	jsr	checkREPLAY
*	jsr	printTEMPS
*	jsr	testENERGIE
*	bcs	RDKEY99
*	jsr	testTEMPS
*	bcs	RDKEY99

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
	clc
	rts
RDKEY99	sep	#$30
	sec
	rts

*-----------------------------------
	
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
screenRECT	dw	0,0,200,320
*drawRECT	dw	0,0,159,239	; 319 - voir windowIMAGE
bottomRECT	dw	160,0,199,319
lastlineRECT dw	190,0,199,319
cursorRECT	dw	0,0,0,0	; y2 and x2 are y1+charWIDTH and x1+charWIDTH

*-----------------------------------

	mx	%11

CURSOR_ERASE
	rep	#$30

	lda	textY
	sta	cursorRECT+4
	sec
	sbc	#charWIDTH
	sta	cursorRECT
	
	lda	textX
	sta	cursorRECT+2
	clc
	adc	#charWIDTH
	sta	cursorRECT+6
	
	lda	#cursorRECT
	jsr	eraseLINES	; retour en 8-bits
	rep	#$30

	lda	textX
	sec
	sbc	#charWIDTH
	sta	textX

	sep	#$30
	rts

*-----------------------------------

	mx	%11

WHITE_SPACE
	rep	#$30

	lda	textY
	sta	cursorRECT+4
	sec
	sbc	#charWIDTH
	sta	cursorRECT
	
	lda	textX
	sta	cursorRECT+2
	clc
	adc	#charWIDTH
	sta	cursorRECT+6
	
	lda	#cursorRECT
	jmp	eraseLINES	; retour en 8-bits

*-----------------------------------

	mx	%11
	
CURSOR	rep	#$30
	lda	textX
	pha
	lda	textY
	pha
	sep	#$30
	lda	#$a5	; black bullet
	jsr	COUT	; returns in 8-bit
	rep	#$30
	pla
	sta	textY
	pla
	sta	textX
	sep	#$30
	rts
	
*-----------------------------------

	mx	%11

GOTOXY2	stx	textX
	sty	textY
	bra	GOTOXYEND
	
GOTOXY	stx	textX
	lda	tblROWS,y
	sta	textY

GOTOXYEND	stz	textX+1
	stz	textY+1
	
	rep	#$30
	PushWord	textX
	PushWord	textY
	_MoveTo
	sep	#$30
	rts

*-----------------------------------

	mx	%11
	
COUT	rep	#$30
	and	#$ff
	cmp	#chrRET	; next line, please
	beq	COUT1
	pha

	PushWord	textX
	PushWord	textY
	_MoveTo
	_DrawChar

*----------- next X position

COUT0	lda	textX
	clc
	adc	#charWIDTH
	sta	textX
	cmp	#maxX
	bcs	COUT1
	
COUT99	sep	#$30
	rts

*----------- next Y position
	
	mx	%00

COUT1	stz	textX	; a new line

	lda	textY
	clc
	adc	#charHEIGHT
	sta	textY
	cmp	#maxY
	bcs	COUT2
	bcc	COUT99	; on sort

*----------- Etape 0 : on attend une touche

COUT2	lda	tblROWS+19	; on se remet sur la dernière ligne
	sta	textY
	
*----------- on doit bouger les écrans
*
* 1 - ptrTEXTE est décalé de 8 lignes vers le haut
* 2 - on copie 10 lignes de l'écran vers ptrTEXT
* 3 - on décale le texte d'une ligne vers le haut
* 4 - on met un bloc noir

	mx	%00

*----------- Etape 1

	lda	ptrTEXT+2	; source commence ligne 10
	pha
	lda	ptrTEXT
	clc
	adc	#160*10
	pha
	PushLong	ptrTEXT	; destination en haut
	PushLong	#160*150	; on copie 150 lignes
	_BlockMove

*----------- Etape 2

	lda	ptrSCREEN+2	; source commence ligne 160
	pha
	lda	ptrSCREEN
	clc
	adc	#160*160
	pha

	lda	ptrTEXT+2	; destination commence ligne 150
	pha
	lda	ptrTEXT
	clc
	adc	#160*150
	pha
	PushLong	#160*10	; on copie 10 lignes
	_BlockMove

*----------- Etape 3

	lda	ptrSCREEN+2	; source commence ligne 170
	pha
	lda	ptrSCREEN
	clc
	adc	#160*170
	pha
	
	lda	ptrSCREEN+2	; destination commence ligne 160
	pha
	lda	ptrSCREEN
	clc
	adc	#160*160
	pha
	
	PushLong	#160*30	; on copie 30 lignes
	_BlockMove
	
*----------- Etape 3

	lda	#lastlineRECT
	jsr	eraseLINES	; en 8-bits à la sortie
	brl	COUT99

*-----------------------------------

	mx	%11

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

	mx	%11
	
	ext	sndEXPLODE
	ext	sndZAP
	ext	sndKEY

EXPLODE	rep	#$30
	ldx	#^sndEXPLODE
	ldy	#sndEXPLODE
	lda	#139
	bra	playSOUND
	
ZAP	rep	#$30
	ldx	#^sndZAP
	ldy	#sndZAP
	lda	#22
	bra	playSOUND

KEY	rep	#$30
	ldx	#^sndKEY
	ldy	#sndKEY
	lda	#5

playSOUND	sty	waveSTART
	stx	waveSTART+2
	sta	waveSIZE

	lda	seqPlay	; midi playing
	beq	playSOUND1	; nope
	_MSSuspend
	
playSOUND1	PushWord #%0000_0000_1000_0000
	_FFStopSound

	PushWord #$0701
	PushLong #waveSTART
	_FFStartSound

	lda	seqPlay	; midi playing
	beq	playSOUND2	; nope
	_MSResume
	
playSOUND2	sep	#$30
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
	
checkACTION	lda	#<ACTION$	; POINTEUR
	sta	dpFROM
	lda	#>ACTION$
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
            LDA	OBJSAL,X	; les objets
            CMP	#-1
            BEQ	L9552
            CMP	SALLE
            BEQ	L9552
            JMP	L95EF

*-- C - 

L95A3       TAX
            LDA	OBJSAL,X
            CMP	#-1
            BEQ	L95EF
            CMP	SALLE
            BEQ	L95EF
            JMP	L9552

*-- D - 

L95B3       TAX
            LDA	OBJSAL,X
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
* IIGS PRIMITIVES
*-----------------------------------

*-----------------------------------
* CENTRAGE DE TEXTE
*-----------------------------------

	mx	%00

centerME	sty	theY

	PushWord	#^txtREF	; pointer to string
	pha
	
	PushWord	#0	; get string length
	PushWord	#^txtREF
	pha
	_StringWidth	; return left on stack
	
	lda	#320	; why 160?
	sec
	sbc	1,s
	bpl	cm1
	lda	#0
cm1	lsr
	sta	1,s	; X
	
	PushWord	theY	; pour MoveTo
	_MoveTo
	_DrawString
	rts

	ldy	#60*1
	jmp	waitMS16

*-----------------------------------
* ON ATTEND DE DIFFERENTES MANIERES
*-----------------------------------

waitMS16	ldal	KBD-1
	bmi	waitMS169
	
]lp	ldal	RDVBLBAR-1
	bpl	]lp
]lp	ldal	RDVBLBAR-1
	bmi	]lp
	dey
	bne	waitMS16
waitMS168	clc
	rts
	
waitMSBIS	ldal	KBD-1
	bpl	waitMS168
	
waitMS169	stal	KBDSTROBE-1
	and	#$ff00
	cmp	#$9b00
	bne	waitMS168
	sec
	rts

*-----------------------------------
* AFFICHE UNE IMAGE - ORPHEE
*-----------------------------------
*
* IF A<192 THEN
*  DRAW B,A +2
* ELSE
*  0 : PLOT C,B,A2 +3
*  1 : PAINT +3
*  2 : BORDER/INK0/INK1/INK2/INK3 +5
*  3 : PRINT (A STRING UNTIL FF) +n
*

	mx	%00
	
showPIC
*	stz	fgTIME
	rep	#$30
	jsr	loadPIC	; charge une image (16-bits)
	bcc	showPICOK
*	inc	fgTIME
	rts
	
showPICOK	lda	#bufIMAGE
	sta	dpFROM

	ldy	#2	; nombre de pas dans une image
	lda	(dpFROM),y
	sta	maxSTEPS
	stz	theSTEP
	
	lda	dpFROM	; on se met au début des images
	clc
	adc	#4
	sta	dpFROM
	
	PushLong	#windowIMAGE
	PushWord	#-1
	PushWord	#0
	_SpecialRect
*	PushLong	#windowIMAGE
*	_FrameRect
*	PushLong	#screenRECT
*	_GetPortRect
*	PushLong	#windowIMAGE
*	_SetPortRect

*--- Boucle principale

spLOOP	ldy	#0
	lda	(dpFROM),y
	and	#$ff
	sta	theA
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theB
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theC

	lda	theA
	cmp	#192	; commande %11xx_xxxx
	bcs	spOTHER

	lda	#maxY
	sec
	sbc	theA
	sta	theY	; <192 alors DRAW
	lda	theB
	sta	theX
            jsr	DRAW
            jmp	skip2

*--- Gère les autres cas

spOTHER	lda	theA
	and	#%00110000
	lsr
	lsr
	lsr
	lsr
	sta	theA1

	lda	theA
	and	#%00001100
	lsr
	lsr
	sta	theA2
	
	lda	theA
	and	#%00000011
	sta	theA3
	beq	spPLOT
	cmp	#2
	beq	spINK
	cmp	#3
	beq	spECRIT

spPAINT	lda	theC
	sta	fillX
	lda	#maxY
	sec
	sbc	theB
	sta	fillY
	jsr	FILL
	jmp	skip3

spPLOT	lda	theC
	sta	theX
	lda	#maxY
	sec
	sbc	theB
	sta	theY
	jsr	PLOT
	jmp	skip3

spINK	lda	theB
	sta	theINK0
	lda	theC
	sta	theINK1
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK2
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK3
	jmp	skip5

spECRIT	lda	theC
	pha
	lda	#maxY+8
	sec
	sbc	theB
	pha
	_MoveTo

*	ldx	theA1
*	lda	a2gsCOLOR,x
*	and	#$ff
*	pha
*	_SetSolidPenPat
	
	PushWord	#0
	_GetTextMode

*	PushWord	theINK0
*	_SetSolidPenPat

	PushWord	#modeForeCopy
	_SetTextMode

	ldy	#3
]lp	lda	(dpFROM),y
	and	#$ff
	cmp	#$ff
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

	jmp	skip1

*--- Next one, please...

skip5	inc	dpFROM
skip4	inc	dpFROM
skip3	inc	dpFROM
skip2	inc	dpFROM
skip1	inc	dpFROM

	inc	theSTEP
	lda	theSTEP
	cmp	maxSTEPS
	bcs	drawEXIT
	jmp	spLOOP

drawEXIT
*	PushLong	#screenRECT
*	_SetPortRect

	sep	#$30
*	inc	fgTIME
	rts

	mx	%00
	
*-----------------------------------

PLOT
*	ldx	theINK0
*	lda	a2gsCOLOR,x
*	and	#$ff
*	pha
*	_SetSolidPenPat

	PushWord	theX	; On déplace le curseur seulement
	PushWord	theY
	_MoveTo
	PushWord	theX	; On trace un point
	PushWord	theY
	_LineTo
	rts

*-----------------------------------

DRAW
*	ldx	theINK0
*	lda	a2gsCOLOR,x
*	and	#$ff
*	pha
*	_SetSolidPenPat

	PushWord	theX	; On trace une ligne
	PushWord	theY
	_LineTo
	rts

*-----------------------------------

resMode	=	%0001_0000000000_10

FILL	ldx	theA1	; sets the pattern to use
	lda	a2gsCOLOR,x
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
* CHARGE UNE IMAGE
*-----------------------------------

	mx	%00
	
loadPIC	and	#$ff
	pha
	PushLong	#strSALLE
	PushWord	#3
	PushWord	#FALSE
	_Int2Dec

*--- Comment on recopie la string

	ldx	#0
	sep	#$20

	lda	strSALLE
	cmp	#' '
	beq	noCHAR1
	inx
	sta	pSALLE,x

noCHAR1	lda	strSALLE+1
	cmp	#' '
	beq	noCHAR2
	inx
	sta	pSALLE,x

noCHAR2	lda	strSALLE+2
	cmp	#' '
	beq	noCHAR3
	inx
	sta	pSALLE,x
	
noCHAR3	rep	#$20
	txa
	clc
	adc	#19	; on ajoute
	sta	pIMAGE	; la longueur par défaut

	lda	#'.B'
	sta	pSALLE+1,x
	lda	#'IN'
	sta	pSALLE+3,x

*--- Open/Read/Write

	jsl	GSOS
	dw	$2010
	adrl	proOPENPIC
	bcs	loadPIC99

	lda	proOPENPIC+2
	sta	proREADPIC+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADPIC
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadPIC99	rts

*---

strSALLE	ds	3	; len max d'une salle

pIMAGE	strl	'1/data/images/'
pSALLE	asc	'D'
	ds	7	; xxx.BIN

proOPENPIC	dw	2
	ds	2
	adrl	pIMAGE

proREADPIC	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	bufIMAGE	; 4 - data_buffer
	adrl	2048	; 8 - request_count
	ds	4	; C - transfer_count

*-----------------------------------
* DONNEES
*-----------------------------------

	mx	%11
	
*----------- AMSTRAD values

theBORDER	ds	2
theINK0	ds	2	; 4 encres utilisées
theINK1	ds	2
theINK2	ds	2
theINK3	ds	2
theX	ds	2
theY	ds	2

theA	ds	2
theB	ds	2
theC	ds	2
theD	ds	2
theE	ds	2

theA1	ds	2
theA2	ds	2
theA3	ds	2

theSTEP	ds	2	; pas courant
maxSTEPS	ds	2	; nombre de pas dans un image

*----------- FILL

fillX	ds	2
fillY	ds	2
fillCOLOR	ds	2

srcLocInfoPtr
	dw	mode320	; mode 320
	adrl	ptr012000
	dw	160
*	dw	0,0,179,239
	dw	68,0
	dw	200,204

srcRect
*	dw	0,0,179,239
	dw	68,0
	dw	200,204

patternPtr	adrl	blackPATTERN ; pointer to pattern

leakTblPtr	dw	1
	dw	$0000	; color 0 is concerned
	
*----------- CIRCLE

theRADIUS	ds	2

circleRECT	ds	2	; Y0
	ds	2	; X0
	ds	2	; Y1
	ds	2	; X1

*----------- POLICE DE CARACTERE IIgs

theFONT	hex	00000000	; espace
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00000000
	hex	00F00000
	hex	00000000
	hex	0F0F0000
	hex	0F0F0000
	hex	0F0F0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	0FF0FF00
	hex	0FF0FF00
	hex	FFFFFFF0
	hex	0FF0FF00
	hex	FFFFFFF0
	hex	0FF0FF00
	hex	0FF0FF00
	hex	00000000
	hex	00F00000
	hex	0FFFF000
	hex	F0F00000
	hex	FFFFF000
	hex	00F0F000
	hex	FFFF0000
	hex	00F00000
	hex	00000000
	hex	FF00F000
	hex	FF0FF000
	hex	000F0000
	hex	00F00000
	hex	0F000000
	hex	FF0FF000
	hex	F00FF000
	hex	00000000
	hex	0FF00000
	hex	F00F0000
	hex	F00F0000
	hex	0FF00000
	hex	F0F0F000
	hex	F00F0000
	hex	0FF0F000
	hex	00000000
	hex	00F00000
	hex	00F00000
	hex	0F000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	0FF00000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	0FF00000
	hex	00000000
	hex	00FF0000
	hex	000FF000
	hex	000FF000
	hex	000FF000
	hex	000FF000
	hex	000FF000
	hex	00FF0000
	hex	00000000
	hex	00000000
	hex	F000F000
	hex	0FFF0000
	hex	FFFFF000
	hex	0FFF0000
	hex	F000F000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	000F0000
	hex	000F0000
	hex	0FFFFF00
	hex	000F0000
	hex	000F0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	0FF00000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	0FFF0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	00000000
	hex	00000FF0
	hex	0000FF00
	hex	000FF000
	hex	00FF0000
	hex	0FF00000
	hex	FF000000
	hex	F0000000
	hex	00000000
	hex	0FFF0000
	hex	F000F000
	hex	F00FF000
	hex	F0F0F000
	hex	FF00F000
	hex	F000F000
	hex	0FFF0000
	hex	00000000
	hex	00F00000
	hex	0FF00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	0FFF0000
	hex	00000000
	hex	0FFF0000
	hex	F000F000
	hex	000FF000
	hex	00FF0000
	hex	0FF00000
	hex	FF000000
	hex	FFFFF000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	0000F000
	hex	000F0000
	hex	0000F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF0F0000
	hex	FF0F0000
	hex	FFFFF000
	hex	000F0000
	hex	00000000
	hex	FFFFF000
	hex	FF000000
	hex	FF000000
	hex	FFFF0000
	hex	0000F000
	hex	0000F000
	hex	FFFF0000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF000000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FFFFF000
	hex	F00FF000
	hex	000FF000
	hex	00FF0000
	hex	0FF00000
	hex	FF000000
	hex	F0000000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	0FFF0000
	hex	F00FF000
	hex	F00FF000
	hex	0FFFF000
	hex	000FF000
	hex	F00FF000
	hex	0FFF0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	00000000
	hex	00FF0000
	hex	00FF0000
	hex	0FF00000
	hex	0000FF00
	hex	000FF000
	hex	00FF0000
	hex	0FF00000
	hex	00FF0000
	hex	000FF000
	hex	0000FF00
	hex	00000000
	hex	00000000
	hex	00000000
	hex	0FFF0000
	hex	00000000
	hex	0FFF0000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	0FF00000
	hex	00FF0000
	hex	000FF000
	hex	0000FF00
	hex	000FF000
	hex	00FF0000
	hex	0FF00000
	hex	00000000
	hex	0FFF0000
	hex	F000F000
	hex	0000F000
	hex	000F0000
	hex	00F00000
	hex	00000000
	hex	00F00000
	hex	00000000
	hex	0FFFFF00
	hex	FF000FF0
	hex	FF0FFFF0
	hex	FF0FFFF0
	hex	FF0FFFF0
	hex	FF000000
	hex	0FFFFF00
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FFFFF000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	00000000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FFFF0000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FFFF0000
	hex	00000000
	hex	0FFFF000
	hex	FF000000
	hex	FF000000
	hex	FFFF0000
	hex	FF000000
	hex	FF000000
	hex	0FFFF000
	hex	00000000
	hex	0FFFF000
	hex	FF000000
	hex	FF000000
	hex	FFFF0000
	hex	FF000000
	hex	FF000000
	hex	0F000000
	hex	00000000
	hex	0FFFF000
	hex	FF000000
	hex	FF000000
	hex	FF0FF000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FFFFF000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	00000000
	hex	0FFF0000
	hex	0FFF0000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	0FFF0000
	hex	0FFF0000
	hex	00000000
	hex	00FFF000
	hex	00FFF000
	hex	000F0000
	hex	000F0000
	hex	000F0000
	hex	F00F0000
	hex	0FF00000
	hex	00000000
	hex	FF00F000
	hex	FF0FF000
	hex	FFFF0000
	hex	FFF00000
	hex	FFFF0000
	hex	FF0FF000
	hex	FF00F000
	hex	00000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	FF00F000
	hex	FFFFF000
	hex	00000000
	hex	F000F000
	hex	FF0FF000
	hex	FFFFF000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	00000000
	hex	F000F000
	hex	FF00F000
	hex	FFF0F000
	hex	FFFFF000
	hex	FF0FF000
	hex	FF00F000
	hex	FF00F000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FFFF0000
	hex	FF000000
	hex	FF000000
	hex	FF000000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF0F0000
	hex	0FF0F000
	hex	00000000
	hex	FFFF0000
	hex	FF00F000
	hex	FF00F000
	hex	FFFF0000
	hex	FF0F0000
	hex	FF00F000
	hex	FF00F000
	hex	00000000
	hex	0FFF0000
	hex	FF00F000
	hex	FF000000
	hex	0FFF0000
	hex	0000F000
	hex	FF00F000
	hex	0FFF0000
	hex	00000000
	hex	FFFFF000
	hex	F0F0F000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	00000000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	0FFFF000
	hex	00000000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	0FFF0000
	hex	00F00000
	hex	00000000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FF00F000
	hex	FFFFF000
	hex	FF0FF000
	hex	F000F000
	hex	00000000
	hex	F000F000
	hex	FF0FF000
	hex	0FFF0000
	hex	00F00000
	hex	0FFF0000
	hex	FF0FF000
	hex	F000F000
	hex	00000000
	hex	F000F000
	hex	FF0FF000
	hex	0FFF0000
	hex	00F00000
	hex	00F00000
	hex	00F00000
	hex	0FFF0000
	hex	00000000
	hex	FFFFF000
	hex	0000F000
	hex	000F0000
	hex	00F00000
	hex	0F000000
	hex	F0000000
	hex	FFFFF000
	hex	00000000
	hex	00FFFF00	; [
	hex	00FF0000
	hex	00FF0000
	hex	00FF0000
	hex	00FF0000
	hex	00FF0000
	hex	00FFFF00
	hex	00000000

*----------- BUFFER POUR L'IMAGE

bufIMAGE	ds	2048

*--- End of code
