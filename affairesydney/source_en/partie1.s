*
* L'affaire Sydney
*
* (c) 1986, Gilles Blancon
* (c) 1986, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* EXTERNALS
*-------------------------------

	ext	picCARNET
	ext	picCLEF
	ext	picDOUILLE
	ext	picEMPREINTE
	ext	picIMPACT
	ext	picMEGOT
	ext	picPHOTO
	ext	picPORTEFEUILLE
	ext	picSACOCHE

*-------------------------------
* PARTIE 1
*-------------------------------
* Objets : 6,116 à 137,191
*   impact : 126,23
*     clef : 150,78
* pfeuille : 166,63
*  sacoche : 86,78 & carnet & photo
*    megot : 118,79
*  douille : 86,102
* empreint : 38,54
*
* Textes : 232,32 à 316,158
*

partie1
	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO

	stz	adimpact	; on n'a pas trouve l'impact
	stz	adclef	; on n'a pas trouve la cle
	stz	adportefeuille	; on n'a pas trouve le porte-feuille
	stz	adsacoche	; on n'a pas trouve la sacoche
	stz	adcarnet	; on n'a pas trouve le carnet
	stz	adphoto	; on n'a pas trouve la photo

	lda	#-1	; l'indice de la zone cliquée
	sta	adoldclic	; précédemment
	stz	adfenetre	; vue sur rue
	
	lda	#pRUE	; charge l'image
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	lda	#pINTERIEUR	; charge l'image
	ldx	ptrFOND2+2
	ldy	ptrFOND2
	jsr	loadFILE

	jsr	initMIDI
	jsr	doMUSIK
	
*--- 1ère image

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	lda	#TRUE
	jsr	fadeIN

	lda	#indexRED
	jsr	setBORDER
	
	PushLong	#monCURSEUR
	_SetCursor
	_ShowCursor

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
	cmp	tblPARTIE1,x
	bcc	icone1_ko
	lda	tblPARTIE1+4,x
	cmp	taskWHERE+2
	bcc	icone1_ko
	
	lda	taskWHERE	; et le Y
	cmp	tblPARTIE1+2,x
	bcc	icone1_ko
	lda	tblPARTIE1+6,x
	cmp	taskWHERE
	bcc	icone1_ko
	
	pla		; on a notre icône
	ldx	#table1FR
	jsr	afficheINDICE
	brl	loopPARTIE1
	
icone1_ko	pla
	inc
	cmp	#4	; 0..3
	bcc	]lp
	brl	loopPARTIE1	; not found

*-------------------------------

*--- On quitte l'ecran

endPARTIE1	_HideCursor

*--- 2nde image

	stz	adempreinte	; on n'a pas trouve l'empreinte
	stz	admegot	; on n'a pas trouve le megot
	stz	addouille	; on n'a pas trouve la douille

	dec	adfenetre	; on passe à la vue interieure (-1)
	
	lda	#TRUE
	jsr	fadeOUT

	ldx	ptrFOND2+2
	ldy	ptrFOND2
	lda	#TRUE
	jsr	fadeIN

	lda	#indexORANGE
	jsr	setBORDER
	
	PushLong	#monCURSEUR
	_SetCursor
	_ShowCursor

*---
	
loopPARTIE2	jsr	RDKEY	; attend une action
	cmp	#mouseDownEvt	; mouse event?
	beq	verifCLIC2	;  yes
	cmp	#keyDownEvt	; key press event?
	bne	loopPARTIE2	;  yes
	cpx	#chrRET	; is it return?
	bne	loopPARTIE2	;  no
	brl	endPARTIE2	;  yes

*--- On verifie la zone cliquee

verifCLIC2	lda	#0	; from 1
]lp	pha
	asl
	asl
	asl
	tax
	lda	taskWHERE+2	; compare le X
	cmp	tblPARTIE2,x
	bcc	icone2_ko
	lda	tblPARTIE2+4,x
	cmp	taskWHERE+2
	bcc	icone2_ko
	
	lda	taskWHERE	; et le Y
	cmp	tblPARTIE2+2,x
	bcc	icone2_ko
	lda	tblPARTIE2+6,x
	cmp	taskWHERE
	bcc	icone2_ko
	
	pla		; on a notre icône
	ldx	#table2FR
	jsr	afficheINDICE
	brl	loopPARTIE2
	
icone2_ko	pla
	inc
	cmp	#3	; 0..2
	bcc	]lp
	brl	loopPARTIE2	; not found

*-------------------------------

*--- On quitte l'ecran

endPARTIE2	_InitCursor
	_HideCursor
	
	lda	#indexBLACK
	jmp	setBORDER

*-------------------------------
* QUELQUES ROUTINES
*-------------------------------

afficheINDICE	sta	adcurclic	; indice du clic
	stx	Debut	; tableau du texte

	PushLong	#texteRECT	; efface le cadre
	PushWord	#$FFFF
	PushWord	#$FFFF
	_SpecialRect

	jsr	calculeINDICE	; quel indice activer
	jsr	afficheTEXTE	; le texte
	jsr	afficheOBJET	; l'indice

	lda	adcurclic	; sauve le numéro cliqué
	sta	adoldclic
	rts

*--- Vue intérieure

calculeINDICE	ldx	#TRUE	; notre booleen magique

	bit	adfenetre	; sur quelle fenêtre est-on ?
	bpl	calculeINDICE1	; la rue

	lda	adcurclic	; le megot ?
	bne	calind1
	stx	admegot
	rts
calind1	cmp	#1	; la douille ?
	bne	calind2
	stx	addouille
	rts
calind2	cmp	#2	; l'empreinte ?
	bne	calind3
	stx	adempreinte
calind3	rts

*--- Rue

calculeINDICE1	lda	adcurclic	; l'impact ?
	bne	calind11
	stx	adimpact
	rts
calind11	cmp	#1	; clef ?
	bne	calind12
	stx	adclef
	rts
calind12	cmp	#2	; porte-feuille ?
	bne	calind13
	stx	adportefeuille
	rts
calind13	cmp	#3	; sacoche ?
	bne	calind19	; non

	lda	adclef	; a-t-on deja la clef ?
	beq	calind19	; non

	lda	adsacoche	; a-t-on jamais cliqué ?
	bne	calind14	; oui

	stx	adsacoche	; non, n'affiche que la sacoche
	bra	calind19	; et dit qu'on a cliqué dessus
	
calind14	inc	adcurclic	; dire qu'il faut afficher le contenu (4)
	stx	adcarnet	; on a le carnet

	lda	adcurclic	; etait-on déjà sur la sacoche ouverte ?
	cmp	adoldclic
	bne	calind19	; non
	
	inc	adcurclic	; oui, sprite 5
	stx	adphoto	; on a la photo

calind19	rts

*--- 

afficheTEXTE	lda	adcurclic
	asl
	tay
	lda	(Debut),y
	sta	Debut

	jsr	SETBLACKCHARS

	ldy	#40
afficheTEXTE0	ldx	#227
	jsr	GOTOXY

]lp	lda	(Debut)
	and	#$ff
	bne	afficheTEXTE1

	rts

afficheTEXTE1	inc	Debut
	cmp	#chrRET
	beq	afficheTEXT2
	
	pha
	_DrawChar
	jmp	]lp

afficheTEXT2	lda	textY
	clc
	adc	charHEIGHT
	sta	textY
	tay
	jmp	afficheTEXTE0

*---

afficheOBJET	lda	adcurclic	; calcule l'adresse
	asl		; du sprite
	tax
	lda	tblOBJET1,x	; vue rue
	
	bit	adfenetre	; sur quelle vue sommes-nous ?
	bpl	afficheOBJET2

	lda	tblOBJET2,x	; vue interieure

afficheOBJET2	sta	srcLocPtr+2	; adresse du sprite

	PushLong	#srcLocPtr
	PushLong	#srcRectPtr
	PushWord	#6
	PushWord	#116
	PushWord	#modeCopy
	_PPToPort
	rts

*-------------------------------
* DATA
*-------------------------------

*--- partie 1

adcurclic	ds	2	; indice cliqué
adoldclic	ds	2	; indice précédemment cliqué
adfenetre	ds	2	; 0 : rue, 1 : interieur

adimpact	ds	2
adclef	ds	2
adportefeuille	ds	2
adsacoche	ds	2
adcarnet	ds	2
adphoto	ds	2
adempreinte	ds	2
admegot	ds	2
addouille	ds	2

tblPARTIE1	dw	126-8,23-8,126+8,23+8	; impact
	dw	150-8,78-8,150+8,78+8	; clef
	dw	166-8,63-8,166+8,63+8	; porte-feuille
	dw	86-16,78-8,86+16,78+8	; sacoche + carnet + photo

tblPARTIE2	dw	118-8,78-8,118+8,78+8	; megot
	dw	86-8,102-8,86+8,102+8	; douille
	dw	38-8,54-8,38+8,54+8	; empreinte

tblOBJET1	da	picIMPACT
	da	picCLEF
	da	picPORTEFEUILLE
	da	picSACOCHE
	da	picCARNET
	da	picPHOTO

tblOBJET2	da	picMEGOT
	da	picDOUILLE
	da	picEMPREINTE

*texteRECT	dw	32,232,166,316		; le cadre du texte de droite
texteRECT	dw	32,227,166,320		; le cadre du texte de droite

srcLocPtr	dw	mode320	; mode 320
	adrl	picCARNET	; pointer to object
	dw	66
srcRectPtr	dw	0,0,76,132

*---

pRUE	strl	'@/data/rue'
pINTERIEUR	strl	'@/data/interieur'

*---

monCURSEUR	dw	18,7
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
