*
* L'affaire Vera Cruz
*
* (c) Gilles Blancon
* (c) 1985, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* EXTERNALS
*-------------------------------

	ext	objetALLUMETTES
	ext	objetBOUTON
	ext	objetCARNET
	ext	objetCENDRIER
	ext	objetDOUILLE
	ext	objetLETTRE
	ext	objetMAINGAUCHE
	ext	objetPISTOLET
	ext	objetROTHMANS
	ext	objetSACAMAIN

*-------------------------------
* PARTIE 1
*-------------------------------
* Cadre :	32,40 to 255,191
*
* Allumettes	44,70 to 91,145
* Bouton	48,72 to 79,103
* Carnet	32,63 to 107,149
* Cendrier	28,51 to 119,118
* Douille	50,52 to 79,99
* Lettre	30,56 to 109,175
* Main gauche	16,53 to 115,119
* Piqure	
* Pistolet	18,51 to 117,112
* Rothmans	28,51 to 103,179
* Sac à main	24,52 to 119,103

indexCARNET	=	2
NB_OBJETS	=	11

*---

partie1	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO

	stz	bo	; on n'a pas trouve le bouton noir
	stz	do	; on n'a pas trouve le pistolet ni la douille
	stz	ec	; on n'a pas trouve la lettre d'adieu
	stz	og	; on n'a pas trouve la main gauche
	stz	ro	; on n'a pas trouve le paquet de Rothmans

	lda	#-1	; l'indice de la zone cliquée
	sta	adoldclic	; précédemment
	
	lda	#pPARTIE1	; charge l'image
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	lda	#pSCENE	; charge l'image
	ldx	ptrFOND2+2
	stx	restoreLocPtr+4
	ldy	ptrFOND2
	sty	restoreLocPtr+2
	jsr	loadFILE

*--- 1ère image

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	lda	#TRUE
	jsr	fadeIN

	lda	#indexWHITE
	jsr	setBORDER
	
	lda	#2
	jsr	nowWAIT

	lda	#TRUE
	jsr	fadeOUT

*--- 2nde image

	ldx	ptrFOND2+2
	ldy	ptrFOND2
	lda	#TRUE
	jsr	fadeIN

	lda	#indexBLACK
	jsr	setBORDER
	
	PushLong	#monCURSEUR
	_SetCursor
	_ShowCursor

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

*--- Draw all buttons (hidden feature)

	ldal	BUTN0-1
	bpl	loopPARTIE1
	
	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#redPATTERN
	_SetPenPat
	
	ldx	#0
]lp	phx
	lda	tblSCENE,x
	cmp	#-1
	beq	doneson

	lda	tblSCENE,x
	sta	beauRECT
	lda	tblSCENE+2,x
	sta	beauRECT+2
	lda	tblSCENE+4,x
	sta	beauRECT+4
	lda	tblSCENE+6,x
	sta	beauRECT+6
	
	PushLong	#beauRECT
	_FrameRect
	
	pla
	clc
	adc	#8
	tax
	bra	]lp

doneson	plx
	PushLong	#curPATTERN
	_SetPenPat

*---
	
loopPARTIE1	jsr	RDKEY	; attend une action
	cmp	#mouseDownEvt	; mouse event?
	beq	verifCLIC1	;  yes
	cmp	#keyDownEvt	; key press event?
	bne	loopPARTIE1	;  yes

	cpx	#'Q'
	beq	quitNOW
	cpx	#'q'
	beq	quitNOW

	cpx	#chrRET	; is it return?
	bne	loopPARTIE1	;  no
	brl	endPARTIE1	;  yes

quitNOW	lda	taskMODIFIERS
	and	#appleKey
	cmp	#appleKey
	bne	loopPARTIE1
	jmp	QUIT

*--- On verifie la zone cliquee

verifCLIC1	lda	#0	; from 1
]lp	pha
	asl
	asl
	asl
	tax
	lda	taskWHERE+2	; compare le X
	cmp	tblSCENE+2,x
	bcc	icone1_ko
	lda	tblSCENE+6,x
	cmp	taskWHERE+2
	bcc	icone1_ko
	
	lda	taskWHERE	; et le Y
	cmp	tblSCENE,x
	bcc	icone1_ko
	lda	tblSCENE+4,x
	cmp	taskWHERE
	bcc	icone1_ko

	pla		; on a notre icône
	jsr	afficheINDICE
	bra	loopPARTIE1
	
icone1_ko	pla
	inc
	cmp	#NB_OBJETS	; 0..11
	bcc	]lp
	bra	loopPARTIE1	; not found

*-------------------------------

*--- On quitte l'ecran

endPARTIE1	_HideCursor

	lda	#pPARTIE2	; charge l'image
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	lda	#TRUE
	jsr	fadeIN

	lda	#indexWHITE
	jsr	setBORDER
	
	lda	#2
	jsr	nowWAIT

	lda	#TRUE
	jmp	fadeOUT

*-------------------------------
* QUELQUES ROUTINES
*-------------------------------

afficheINDICE	sta	adcurclic	; indice du clic

	lda	#texte1FR
	sta	Debut	; tableau du texte

	PushLong	#texteRECT	; efface le cadre
	PushWord	#$7777
	PushWord	#$FFFF
	_SpecialRect

	jsr	calculeINDICE	; quel indice activer
	jsr	afficheOBJET	; l'indice
	jsr	afficheTEXTE	; le texte

*--- Wait for a keypress and restore background

]lp	jsr	RDKEY
	cmp	#mouseDownEvt	; mouse event?
	beq	afficheINDICE9	;  yes
	cmp	#keyDownEvt	; key press event?
	bne	]lp	;  yes

afficheINDICE9	PushLong	#restoreLocPtr
	PushLong	#texteRECT
	PushWord	#20
	PushWord	#32
	PushWord	#modeCopy
	_PPToPort

	lda	adcurclic	; sauve le numéro cliqué
	sta	adoldclic
	rts

*--- 

calculeINDICE	lda	adcurclic
	asl
	tax
	lda	pgmSCENE,x
	sta	calculeINDICE1+1
calculeINDICE1	jsr	calculeINDICE9
calculeINDICE9	rts
	
*--

indiALLUMETTES
indiPIQURE
indiSACAMAIN	rts

*--

indiBOUTON	lda	#TRUE	; BO=1
	sta	bo
	rts

*--
	
indiCARNET	lda	adcarnet
	eor	#1
	sta	adcarnet
	beq	indiCARNET2
	
	ldx	#texteCARNET	; vide
	stx	texte1FR+4
	ldy	#objetCARNET	; image du carnet
	sty	tblOBJET+4
	rts
indiCARNET2	ldx	#texteCARNET2	; le texte
	stx	texte1FR+4
	ldy	#-1	; pas d'image
	sty	tblOBJET+4
	rts

*--

indiCENDRIER			; RO=1
indiROTHMANS	lda	#TRUE
	sta	ro
	rts

*--

indiDOUILLE			; DO=1
indiPISTOLET	lda	#TRUE
	sta	do
	rts

*--

indiLETTRE	lda	#TRUE	; EC=1
	sta	ec
	rts

*--

indiMAINGAUCHE	lda	#TRUE	; OG=1
	sta	og
	rts

*---

afficheOBJET	lda	adcurclic	; calcule l'adresse
	asl		; du sprite
	tax
	asl
	tay
	lda	tblOBJET,x	; adresse du sprite
	cmp	#-1	; ou -1 si absent
	beq	afficheOBJET9
	sta	srcLocPtr+2	; adresse du sprite

	lda	sizeALLUMETTES,y
	sta	srcRectPtr+4
	lda	sizeALLUMETTES+2,y
	sta	srcLocPtr+6	; width in words
	asl
	sta	srcRectPtr+6

	PushLong	#srcLocPtr
	PushLong	#srcRectPtr
	lda	posALLUMETTES,y
	pha
	lda	posALLUMETTES+2,y
	pha
	PushWord	#modeCopy
	_PPToPort
afficheOBJET9	rts

*--- 

afficheTEXTE	lda	adcurclic
	asl
	tay
	lda	(Debut),y
	sta	Debut

	jsr	SETBLACKCHARS

	lda	adcurclic
	cmp	#indexCARNET	; carnet
	bne	afficheTEXTE2
	ldy	#48
	bra	afficheTEXTE4
	
afficheTEXTE2	ldy	#122
afficheTEXTE4	ldx	#22
	jsr	GOTOXY

]lp	lda	(Debut)
	and	#$ff
	bne	afficheTEXTE6

	rts

afficheTEXTE6	inc	Debut
	cmp	#chrRET
	beq	afficheTEXTE8
	
	pha
	_DrawChar
	jmp	]lp

afficheTEXTE8	lda	textY
	clc
	adc	charHEIGHT
	sta	textY
	tay
	jmp	afficheTEXTE4

*-------------------------------
* DATA
*-------------------------------

*--- partie 1

adcurclic	ds	2	; indice cliqué
adoldclic	ds	2	; indice précédemment cliqué
adcarnet	ds	2	; carnet déjà cliqué ?

pgmSCENE	da	indiALLUMETTES
	da	indiBOUTON
	da	indiCARNET
	da	indiCENDRIER
	da	indiDOUILLE
	da	indiLETTRE
	da	indiMAINGAUCHE
	da	indiPIQURE
	da	indiPISTOLET
	da	indiROTHMANS
	da	indiSACAMAIN
	
tblSCENE	dw	140,281,151,289	; allumettes
	dw	107,11,123,19	; bouton
	dw	158,66,165,74	; carnet
	dw	168,305,190,320	; cendrier
	dw	54,188,66,196	; douille
	dw	152,254,185,304	; lettre
	dw	181,157,197,182	; main gauche
	dw	162,133,173,148	; piqure
	dw	102,229,119,244	; pistolet
	dw	140,295,153,311	; rothmans
	dw	137,53,157,87	; sac à main
	dw	-1

* Allumettes	44,70 to 91,145
* Bouton	48,72 to 79,103
* Carnet	32,63 to 107,149
* Cendrier	28,51 to 119,118
* Douille	50,52 to 79,99
* Lettre	30,56 to 109,175
* Main gauche	16,53 to 115,119
* Pistolet	18,51 to 117,112
* Rothmans	28,51 to 103,179
* Sac à main	24,52 to 119,103

posALLUMETTES	dw	48,70	; where to put on screen X,Y
posBOUTON	dw	52,72
posCARNET	dw	32,63
posCENDRIER	dw	31,43
posDOUILLE	dw	54,52
posLETTRE	dw	32,56
posMAINGAUCHE	dw	21,53
posPIQURE	dw	0,0
posPISTOLET	dw	22,51
posROTHMANS	dw	32,51
posSACAMAIN	dw	24,52

sizeALLUMETTES	dw	$004C,$0018	; height,width of sprite
sizeBOUTON	dw	$0020,$0010
sizeCARNET	dw	$0057,$0026
sizeCENDRIER	dw	$0044,$002E
sizeDOUILLE	dw	$0030,$0010
sizeLETTRE	dw	$0078,$0028
sizeMAINGAUCHE	dw	$0043,$0032
sizePIQURE	dw	$0000,$0000
sizePISTOLET	dw	$003E,$0032
sizeROTHMANS	dw	$0081,$0026
sizeSACAMAIN	dw	$0034,$0030

tblOBJET	da	objetALLUMETTES
	da	objetBOUTON
	da	objetCARNET	; +4 ou -1
	da	objetCENDRIER
	da	objetDOUILLE
	da	objetLETTRE
	da	objetMAINGAUCHE
	dw	-1	; pas d'image
	da	objetPISTOLET
	da	objetROTHMANS
	da	objetSACAMAIN

texteRECT	dw	32,20,191,124		; le cadre du texte de droite

srcLocPtr	dw	mode320	; mode 320
	adrl	objetALLUMETTES	; pointer to object
	dw	28	; width in words
srcRectPtr	dw	0,0,150,56	; rectangle

objetX	ds	2
objetY	ds	2

restoreLocPtr	dw	mode320
	ds	4
	dw	160
	dw	0,0,200,320

beauRECT	dw	0,0,0,0

*---

pPARTIE1	strl	'@/data/partie1'
pPARTIE2	strl	'@/data/partie2'
pSCENE	strl	'@/data/scene'

*---

monCURSEUR	dw	18,7
	hex	0000000000000000000000000000
	hex	0000008888880000000000000000
	hex	0000888888888800000000000000
	hex	0008888000088880000000000000
	hex	0088800000000888000000000000
	hex	0088000888800088000000000000
	hex	0888000000880088800000000000
	hex	0880000000008008888888888000
	hex	0880000000008008888888888000
	hex	0880000000000008888888888000
	hex	0880000000000008888888888000
	hex	0888000000000088800000000000
	hex	0088000000000088000000000000
	hex	0088800000000888000000000000
	hex	0008888000088880000000000000
	hex	0000888888888800000000000000
	hex	0000008888880000000000000000
	hex	0000000000000000000000000000
	hex	0000000000000000000000000000
	hex	000000FFFFFF0000000000000000
	hex	0000FFFFFFFFFF00000000000000
	hex	000FFFF0000FFFF0000000000000
	hex	00FFF00000000FFF000000000000
	hex	00FF000FFFF000FF000000000000
	hex	0FFF000000FF00FFF00000000000
	hex	0FF000000000F00FFFFFFFFFF000
	hex	0FF000000000F00FFFFFFFFFF000
	hex	0FF000000000000FFFFFFFFFF000
	hex	0FF000000000000FFFFFFFFFF000
	hex	0FFF0000000000FFF00000000000
	hex	00FF0000000000FF000000000000
	hex	00FFF00000000FFF000000000000
	hex	000FFFF0000FFFF0000000000000
	hex	0000FFFFFFFFFF00000000000000
	hex	000000FFFFFF0000000000000000
	hex	0000000000000000000000000000
	dw	9,9
