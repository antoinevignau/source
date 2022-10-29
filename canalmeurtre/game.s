*
* Canal Meurtre
*
* (c) 1986, Froggy Software
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* constantes
*-----------------------

NB_INDICATEURS =	10
NB_FICHES	=	150	; nombre de fiches du jeu
TAILLE_FICHE =	255	; taille d'une fiche en octets

*--- affiche une fiche

print_fiche
	jsr	gosub9	; cadre
	jmp	gosub54	; type d'entrée

*--- efface cadre du texte

gosub9
	jsr	gosub58
	
	PushLong #theCADRE
	PushWord #4
	PushWord #4
	PushLong #thePATTERN
	_FillRRect

	PushLong #blackPATTERN
	_SetPenPat
	
	PushLong #theCADRE
	PushWord #4
	PushWord #4
	_FrameRRect
	
	PushLong #thePATTERN
	_SetPenPat
	rts

*---

theCADRE	dw	135
	dw	10
	dw	195
	dw	280

thePATTERN	ds	32,$ff

blackPATTERN ds	32,$00

sourcePAT	ds	32

*--- charge une image (ou pas)

gosub47
	lda	C2_2	; si la chaîne commence par 'Bo' comme 'Boot'
	cmp	#'Bo'	; alors on a une image
	beq	g47_1
	rts

g47_1	lda	C2_2+5	; recopie les 4 caractères
	sta	pIMAGE+16
	lda	C2_2+7
	sta	pIMAGE+18

	jsr	gosub22	; pour gérer le couloir

	lda	#pIMAGE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	g47_2
	rts
g47_2	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	unpackAPF
	jsr	show_cartouche

	lda	S	; il faut affiche les numéros de salle
	beq	g47_3
	jsr	gosub4	; oui
	stz	S

g47_3
	rts
	
*--- gestion du couloir

gosub22
	lda	C2_2+5
	cmp	#'CO'
	beq	gosub22_1
	rts

gosub22_1
	lda	C2_2+6
	cmp	#'OU'
	beq	gosub22_2
	rts

gosub22_2
	ldx	#1	; couloir par défaut

	lda	P	; IF P>S2 THEN S=1 ELSE S=2
	cmp	S2
	beq	gosub22_3
	bcs	gosub22_4

gosub22_3
	ldx	#2

gosub22_4
	stx	S	; sauve le numéro de couloir
	
	sep	#$20	; met COU1 ou COU2
	lda	S
	ora	#'0'
	sta	pIMAGE+19
	rep	#$20
	rts
	
*--- affiche les numéros de salle

gosub4
	pha
	_GetTextSize

	lda	S
	cmp	#1
	beq	gosub16	; couloir de gauche
	brl	gosub44	; couloir de droite

gosub16
	PushWord #149
	PushWord #42
	_MoveTo

	lda	P
	sec
	sbc	#129
	asl
	sec
	sbc	#1
	jsr	printSALLE

*-
	
	PushWord #6
	_SetTextSize
	
	PushWord #29
	PushWord #54
	_MoveTo

	lda	P
	sec
	sbc	#129
	asl
	jsr	printSALLE

*-

	PushWord #4
	_SetTextSize
	
	PushWord #72
	PushWord #76
	_MoveTo

	ldx	#2

	lda	P
	cmp	#141
	bcs	gosub16_1
	
	lda	P
	sec
	sbc	#129
	asl
	clc
	adc	#2
	tax

gosub16_1	
	txa
	jsr	printSALLE
	
	_SetTextSize
	rts

*--
	
gosub44
	PushWord #28
	PushWord #42
	_MoveTo

	lda	P
	sec
	sbc	#129
	asl
	sec
	sbc	#1
	jsr	printSALLE

*-

	PushWord #6
	_SetTextSize
	
	PushWord #155
	PushWord #53
	_MoveTo

	lda	P
	sec
	sbc	#129
	asl
	jsr	printSALLE

*-

	PushWord #4
	_SetTextSize
	
	PushWord #113
	PushWord #76
	_MoveTo

	ldx	#24
	lda	P
	cmp	#130
	beq	gosub44_1
	
	lda	P
	sec
	sbc	#129
	asl
	sec
	sbc	#2
	tax

gosub44_1
	txa
	jsr	printSALLE

	_SetTextSize
	rts

*---

printSALLE
	stz	strSALLE
	
	pha
	PushLong #strSALLE
	PushWord #2
	PushWord #FALSE
	_Int2Dec

	PushLong #strSALLE
	_DrawCString
	rts

*---

strSALLE	ds	3	; aabb00

*--- gestion du type d'entree

gosub54
	lda	P
	jsr	get_fiche

	lda	F
	and	#$ff
	beq	pf_ok
	sec
	rts

pf_ok
	jsr	gosub47
	
	@left #T2;#C2_3;#1
	@charcmp #T2;#'R'
	bne	pf_notR

	jsr	gosub8	; REPONSES
	stz	T1
	rts

pf_notR
	@charcmp #T2;#'C'
	bne	pf_notC

	jsr	gosub2	; CHOIX
	stz	T1
	rts

pf_notC
	@charcmp #T2;#'D'
	bne	pf_notD

	jsr	gosub7	; DIALOGUES
	stz	T1
	rts

pf_notD
	@charcmp #T2;#'T'
	bne	pf_notT

	jsr	gosub53	; T
	lda	#1
	sta	T1
	rts

pf_notT
	@charcmp #T2;#'M'
	bne	pf_notM

	jsr	gosub6	; MESSAGES
	stz	T1
	rts

pf_notM
	@charcmp #T2;#'I'
	bne	pf_notI

	jsr	gosub33	; INVENTAIRES
	lda	#1
	sta	T1
	rts

pf_notI
	@charcmp #T2;#'E'
	bne	pf_notE

	jsr	gosub23	; ENTREES
	lda	#1
	sta	T1
	rts

pf_notE
	@charcmp #T2;#'G'
	bne	pf_notG

	@copystring #C5;#strFROGGY;#40
	jsr	gosub3	; print & quit
	brl	meQUIT

pf_notG
	@charcmp #T2;#'F'
	bne	pf_notF

	@copystring #C5;#strERREUR;#40
	jsr	gosub3	; print & quit
	brl	meQUIT

pf_notF
	rts

*---

strFROGGY	asc	'(c) FROGGY SOFTWARE                     '
strERREUR	asc	'VOUS AVEZ COMMIS UNE GRAVE ERREUR! ADIEU'

*-----------------------
* eviv busog
*-----------------------

*--- gestion des choix

gosub2
	PushWord xTEXT
	PushWord yTEXT
	_MoveTo

	PushLong #C2_6
	PushWord #40
	_DrawText	

	lda	#1
	sta	N0

	lda	#1	; affiche 1 bouton
	jmp	bouton

*--- gestion des messages

gosub6
	@val #C2_1;#2
	sta	C

	lda	#0
]lp	pha
	asl
	tax
	phx

	lda	xTEXT,x
	pha
	lda	yTEXT,x
	pha
	_MoveTo

	plx
	pea	^ptrTEXT
	lda	ptrTEXT,x
	pha
	PushWord #40
	_DrawText
	
	pla
	inc
	cmp	C
	bcc	]lp
*	beq	]lp

	lda	#1	; affiche 1 bouton
	jmp	bouton

*---

xTEXT	dw	30,30,30,30,30
yTEXT	dw	146,157,168,179,190
ptrTEXT	da	C2_6,C2_8,C2_10,C2_12,C2_14

*--- gestion des dialogues

gosub7
	PushWord xTEXT
	PushWord yTEXT
	_MoveTo

	PushLong #C2_6
	PushWord #40
	_DrawText	

	PushLong	#0
	PushLong	wiMAIN
	PushWord	#2
	PushLong	#6
	_NewControl2
	_DrawOneCtl
	
	PushLong	#0
	PushLong	wiMAIN
	PushWord	#2
	PushLong	#7
	_NewControl2
	_DrawOneCtl
	
	lda	#1
	sta	N0
	sta	N1
	rts

*--- gestion des reponses

gosub8
	@val #C2_1;#2
	sta	C

	lda	#0
]lp	pha
	asl
	tax
	phx

	lda	xTEXT,x
	pha
	lda	yTEXT,x
	pha
	_MoveTo

	plx
	pea	^ptrTEXT
	lda	ptrTEXT,x
	pha
	PushWord #40
	_DrawText

	lda	1,s	; affiche le bouton
	inc
	jsr	bouton
	
	pla
	inc
	cmp	C
	bcc	]lp
*	beq	]lp
	rts

*--- gestion des entrées (le nom des salles)

gosub23
	@instr #C2_6;#'*';#40
	dec
	sta	L2
	@left #C3;#C2_6;L2

*	PushWord #0
*	_GetTextFace

*	PushWord #$0080
*	_SetTextFace
	
	PushWord #70
	PushWord #53
	_MoveTo

	PushLong #C3
	PushWord L2
	_DrawText

*	_SetTextFace
	
	@val #C2_13;#4
	sta	P
	jmp	print_fiche
	
*--- gestion des inventaires

gosub33
	jsr	gosub35
	
	ldx	N2
	sep	#$20
*	lda	V
	lda	#1
	sta	C1-1,x
	rep	#$20
	
	@val #C2_7;#4
	sta	P
	jmp	print_fiche

*--- gestion des T

gosub53
	jsr	gosub35
	
	ldy	#3	; bonne réponse

	ldx	N2
	lda	C1-1,x
	and	#$ff
*	cmp	V
*	beq	gosub53_1
	bne	gosub53_1

	dey		; mauvaise réponse

gosub53_1	
	pea	$0004	; nombre de caractères
	tya
	dec
	asl
	tax
	lda	tblREP,x
	pha
	jsr	val
	sta	P
	jmp	print_fiche

*--- récupère la valeur dans une chaîne

gosub35
	@instr #C2_6;#'*';#40
	sta	L2
	
	@left #B0;#C2_6;L2
	@val #B0;L2
	sta	N2
	
*	@val #C2_5;#4	; on met 1, c'est pareil
*	sta	V
	rts

*--- affiche la chaîne C5 et attend un peu

gosub3
	jsr	gosub58
	jsr	gosub9
	
	PushWord xTEXT
	PushWord yTEXT
	_MoveTo
	
	PushLong #C5
	PushWord #40
	_DrawText

*	lda	#2	; #4000
*	jsr	nowWAIT

*--- attend

gosub52
	lda	#2	; #6000
	jmp	nowWAIT
	
*--- ferme les boutons et dialogues si nécessaire

gosub58
	PushLong wiMAIN
	_KillControls

	stz	N0
	stz	N1
	rts

*-----------------------
* bouton
*-----------------------
*
* On crée un bouton
* A contains the button index to display

bouton
	sta	nbBOUTONS	; useful to check if we clicked on a valid area
	tax
	
	PushLong	#0
	PushLong	wiMAIN
	PushWord	#2
	pea	$0000
	phx
	_NewControl2
	_DrawOneCtl
	rts

*---
	
rectBOUTON	dw	0,0,0,0

x1BOUTON	dw	20,20,20,20,20
x2BOUTON	dw	28,28,28,28,28
y1BOUTON	dw	144,153,162,171,180
y2BOUTON	dw	152,161,170,179,188

nbBOUTONS	ds	2	; nombre de boutons actifs (up to 5)

*-----------------------
* affiche_cadre
*-----------------------
*
* If TV is on, we do something with the first 3 buttons
* If 4th button is pressed, we switch on/off TV, that's all

*-----------------------
* check_boutonstv
*-----------------------
*
* If TV is on, we do something with the first 3 buttons
* If 4th button is pressed, we switch on/off TV, that's all

check_boutonstv
	lda	#0
]lp
	tay
	lda	taskWHERE
	cmp	tblBOUTONSTV,y	; Y1
	bcc	next_boutontv
	cmp	tblBOUTONSTV+4,y	; Y2
	bcs	next_boutontv

	lda	taskWHERE+2
	cmp	tblBOUTONSTV+2,y	; X1
	bcc	next_boutontv
	cmp	tblBOUTONSTV+6,y	; X2
	bcs	next_boutontv
	tya
	lsr
	lsr
	lsr		; /8
	inc		; 1-4
	tay
	rts		; on a un bouton !
	
next_boutontv
	tya
	clc
	adc	#8
	cmp	#8*4	; parce qu'on a 4 boutons
	bcc	]lp
	rts		; pas de bouton pressé
	
*---

tblBOUTONSTV
	dw	19,182,26,189
	dw	32,182,39,189
	dw	44,182,51,189
	dw	72,181,77,189

*-----------------------
* handle_boutonstv
*-----------------------
*
* 1 : about
* 2 : plan
* 3 : remet les contrôles
* 4 : TV on/off

handle_boutonstv
	sty	C0	; sauve le bouton actif
	cpy	#4
	bne	hb_istvon

	lda	fgTVON	; allume/éteint la TV
	eor	#-1
	sta	fgTVON
	bne	hb_tvon

	ldx	ptrDECORB+2	; show TV off
	ldy	ptrDECORB
	jmp	show_picture

hb_tvon
	ldx	ptrDECORN+2	; show TV on
	ldy	ptrDECORN
	jsr	show_picture
	jmp	print_fiche

*--- teste les autres boutons

hb_istvon
	lda	fgTVON	; do something if TV is on only
	bne	hb_3
	rts

*---

hb_3	cpy	#3	; bouton 3 - remet l'image active
	bne	hb_2

	jmp	print_fiche
	
*---

hb_2
	jsr	gosub9	; erase le cadre

	ldy	C0
	cpy	#2	; affiche le plan
	bne	hb_1

	jsr	saveBACK
	
	lda	#pPLAN
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	hb_21
	rts
hb_21	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	unpackAPF
	jsr	show_cartouche
	jmp	gosub26	; affiche le personnage

*---
	
hb_1
	cpy	#1	; affiche l'image de pub
	bne	hb_0

	jsr	saveBACK
	
	lda	#pPUB
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	hb_11
	rts
hb_11	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	unpackAPF
	jmp	show_cartouche

*---

hb_0
	rts

*--- affiche le personnage sur le plan

gosub26
	lda	P
	cmp	#121
	bcc	gosub26_1
	beq	gosub26_1
	rts

gosub26_1
	PushWord #0	; get MOD 10
	PushWord #0
	PushWord P
	PushWord #10
	_UDivide
	pla
	plx
	
	cmp	#0	; exit if 0
	beq	gosub26_2

	sec		; get P / 10
	sbc	#1
	asl
	tax
	lda	xPERSO,x
	sta	ptrToDestPoint3+2
	lda	yPERSO,x
	sta	ptrToDestPoint3
	
	PushLong #paintParamPtr3
	_PaintPixels

gosub26_2
	rts

*---

xPERSO	dw	132,70,40,42,68,130,66,84,66,86,106,106
yPERSO	dw	85,113,85,61,31,62,88,88,51,55,51,91

paintParamPtr3
	adrl	ptrToSourceLocInfo3
	adrl	ptrToDestLocInfo3
	adrl	ptrToSourceRect3
	adrl	ptrToDestPoint3
	dw	$0000	; mode copy
	ds	4

ptrToSourceLocInfo3
	dw	$0000	; mode 320
	adrl	$e12000
	dw	160
	dw	0,0,200,320
	
ptrToDestLocInfo3
	dw	$0000	; mode 320
	adrl	$e12000
	dw	160
	dw	0,0,200,320
	
ptrToSourceRect3
	dw	112,136,122,141

ptrToDestPoint3
	dw	0,0

*-----------------------
* load_font
*-----------------------

load_font
	jsr	font_it
	bcc	lf_ok

	pha
	PushLong #fntSTR1
	PushLong #fntSTR2
	PushLong #errSTR3
	PushLong #errSTR2
	_TLTextMountVolume
	pla

lf_ok
	rts

*--- Really load the font

font_it
	PushWord #$0900
	PushWord #$0015		; Helvetica.9
	PushWord #0
	_InstallFont
	rts

*-----------------------
* set_texte
*-----------------------

set_texte
	PushWord #0
	PushWord #$29
	_ReadBParam
	pla
	cmp	#20
	bcc	st_ok
	rts

* index
* TEXTES : +16

st_ok
	jsr	st_setit	; try IIgs language
	bcc	st_ok99
	
	lda	#0	; if not, try EN US
	jsr	st_setit
	bcc	st_ok99

	lda	#2	; it not, force FR - It always exists
	jsr	st_setit
st_ok99
	rts

*---

st_setit			; set language code
	sta	saveLANGUAGE
	asl
	tax
	lda	tblLANG,x
	sta	pFICHES+16

	lda	#pFICHES	; check file exists
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	st_setit99
	
	lda	proOPEN+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

st_setit99
	rts

*---
	
tblLANG
	asc	'us'	; 0
	asc	'uk'
	asc	'fr'	; 2
	asc	'nl'
	asc	'es'	; 4
	asc	'it'
	asc	'de'	; 6
	asc	'se'
	asc	'us'
	asc	'ca'
	asc	'nl'
	asc	'he'
	asc	'jp'
	asc	'ar'
	asc	'gr'
	asc	'tr'
	asc	'fi'
	asc	'ta'
	asc	'hi'
	asc	'us'	; 19

*-----------------------
* initialisation
*-----------------------

initialisation
	stz	fgTVON	; TV is off on entry
	
	lda	#1
	sta	P

	stz	S	; pas de sens de couloir
	
	lda	#129
	sta	S2

	ldx	#NB_INDICATEURS
	sep	#$20
]lp	stz	C1-1,x
	dex
	dex
	bne	]lp
	rep	#$20
	rts

*-----------------------
* load_fiche
*-----------------------

load_fiche
	lda	#pFICHES
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	lt_err2

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2

	lda	ptrFICHES
	sta	proREAD+4
	lda	ptrFICHES+2
	sta	proREAD+6
	
	lda	proEOF
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10

	jsl	GSOS
	dw	$2012
	adrl	proREAD
	bcs	lt_err

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

lt_err
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

lt_err2
	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*-----------------------
* init_fiche
*-----------------------

init_fiche
	stz	nbFICHES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	if1
	rts

if1
	lda	ptrFICHES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrFICHES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2
	
if2
	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	if3
	lda	dpFROM
	cmp	dpTO
	bcc	if3
	rts			; we are done!

if3
	lda	nbFICHES	; save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblFICHES,x
	lda	dpFROM+2
	sta	tblFICHES+2,x

	lda	dpFROM
	clc
	adc	#TAILLE_FICHE
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2
	
	inc	nbFICHES	; increment the number of strings
	lda	nbFICHES	; into our limit
	cmp	#NB_FICHES
	bcc	if2
	rts

*-----------------------
* get_fiche(fiche%)
*-----------------------

get_fiche
	cmp	#0
	bne	get_fiche1
	rts

get_fiche1
	cmp	nbFICHES
	bcc	get_fiche2
	beq	get_fiche2
	rts

get_fiche2
	dec
	asl
	asl
	tax
	lda	tblFICHES,x
	sta	dpFICHES
	lda	tblFICHES+2,x
	sta	dpFICHES+2

	ldy	#TAILLE_FICHE-1
	sep	#$20
]lp	lda	[dpFICHES],y
	sta	F,y
	dey
	bpl	]lp
	rep	#$20
	rts

*-----------------------
* TEXT ROUTINES
*-----------------------

*-----------------------
* add_char
*-----------------------
* 5,s char to add
* 3,s pointer to string
* 1,s RTS

add_char
	lda	3,s
	sta	dpTO

	sep	#$30		; 02 AB
	lda	(dpTO)	; cannot exceed 255 chars
	cmp	#$ff
	bcs	add_char1

	inc			; 03 AB
	sta	(dpTO)		; 03
	tay
	lda	5,s		; C
	sta	(dpTO),y	; 03 ABC
	
add_char1
	rep	#$30
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	sta	1,s	; remet le RTS
	rts

*-----------------------
* copy_string
*-----------------------
* 7,s number of chars to copy
* 5,s pointer to source string
* 3,s pointer to destination string
* 1,s RTS

copy_string
	lda	5,s
	sta	dpFROM
	lda	3,s
	sta	dpTO

	sep	#$20
	ldy	#0
]lp	lda	(dpFROM),y	; recopie les caractères
	sta	(dpTO),y
	iny
	tya
	cmp	7,s
	bcc	]lp
*	beq	]lp
	
	rep	#$20
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	sta	1,s	; remet le RTS
	rts

*-----------------------
* charcmp
*-----------------------
* 5,s char to compare
* 3,s pointer to string
* 1,s RTS

charcmp
	lda	3,s
	sta	dpFROM
	
	ldx	#FALSE	; default value, les chaînes sont différentes

	sep	#$20
	lda	(dpFROM)
	cmp	5,s	; compare strings
	bne	charcmp1

	ldx	#TRUE	; même chaîne

charcmp1
	rep	#$20
	lda	1,s	; récupère RTS
	ply		; dépile les paramètres
	ply
	sta	1,s	; remet le RTS
	txa		; return value
	cmp	#TRUE	; met les valeurs de comparaison
	rts

*-----------------------
* left
*-----------------------
* 7,s number of chars to copy
* 5,s pointer to source string
* 3,s pointer to destination string
* 1,s RTS

left
	lda	5,s
	sta	dpFROM
	lda	3,s
	sta	dpTO

* check added length

	sep	#$30	; check length

	ldy	#0
]lp	lda	(dpFROM),y	; recopie les caractères
	sta	(dpTO),y
	iny
	tya
	cmp	7,s
	bcc	]lp
*	beq	]lp
	
	rep	#$30
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	sta	1,s	; remet le RTS
	rts

*-----------------------
* val
*-----------------------
* 5,s string length
* 3,s pointer to source string
* 1,s RTS
* on return, A = unsigned value

val
	lda	3,s
	sta	dpFROM

	sep	#$20
	ldy	#0
	tyx
]lp	lda	(dpFROM),y	; recopie les caractères
	cmp	#' '	; skip space char
	beq	val1
	sta	val_temp,x	; save
	inx
val1	iny
	tya
	cmp	5,s
	bcc	]lp
*	beq	]lp

	cpx	#0	; exit if len is still 0
	beq	val2

	rep	#$20
	
	PushWord #0		; wordspace
	PushLong #val_temp	; strPtr
	phx		; strLength
	pea	$0000	; signedFlag
	_Dec2Int
	plx		; intResult
	
val2
	rep	#$20
	lda	1,s	; récupère RTS
	ply		; dépile les paramètres
	ply
	sta	1,s	; remet le RTS
	txa		; return value
	rts

val_temp	ds	8	; longueur de la chaîne temporaire

*-----------------------
* instr
*-----------------------
* 7,s length of string to search
* 5,s pointer to character to find
* 3,s pointer to source string
* 1,s RTS

instr
	lda	3,s
	sta	dpFROM

	sep	#$20
	
	ldy	#0	; AB
]lp	lda	(dpFROM),y
	iny
	cmp	5,s
	beq	instr2	; on a trouvé le caractère
	tya
	cmp	7,s
	bcc	]lp
*	beq	]lp
instr1
	ldy	#-1	; on n'a pas trouvé le caractère

instr2
	rep	#$20
	lda	1,s	; récupère RTS
	plx		; dépile les paramètres
	plx
	plx
	sta	1,s	; remet le RTS
	tya		; return value
	rts

*-----------------------
* strcmp
*-----------------------
* 7,s length to compare
* 5,s pointer to string 2
* 3,s pointer to string 1
* 1,s RTS

strcmp
	lda	3,s
	sta	dpFROM
	lda	5,s
	sta	dpTO
	
	ldx	#FALSE	; default value, les chaînes sont différentes

	sep	#$30

	ldy	#0		; AB
]lp	lda	(dpFROM),y
	cmp	(dpTO),y
	bne	strcmp2
	iny
	tya
	cmp	7,s
	bcc	]lp
*	beq	]lp
strcmp1
	ldx	#TRUE	; même chaîne

strcmp2
	rep	#$30
	lda	1,s	; récupère RTS
	ply		; dépile les paramètres
	ply
	ply
	sta	1,s	; remet le RTS
	txa		; return value
	cmp	#TRUE	; met les valeurs de comparaison
	rts

*-----------------------
* data
*-----------------------

theDATA	=	*

*-----------------------
* Variables 
*-----------------------

*--- Variables du jeu

debutVARIABLES	=	*

	asc	"fgTVON"

fgTVON	ds	2	; 0 if TV off, -1 otherwise

	asc	"C,C0,H,L2,L3,N0,N1,N2,P,S,S2,T1,T2,V"

C	ds	2	; nombre de messages
C0	ds	2	; bouton de la television actif
H	ds	2
L2	ds	2
L3	ds	2
N0	ds	2
N1	ds	2
N2	ds	2
P	ds	2	; fiche activée
S	ds	2	; sens du couloir
S2	ds	2	; 129 au début
T1	ds	2
T2	ds	2
V	ds	2

	asc	"C1"

C1	ds	NB_INDICATEURS

	asc	"F ET C2"

F	ds	1	; fiche OK (non zero) ou KO (zero)
C2_1	ds	2
C2_2	ds	25
C2_3	ds	2
C2_4	ds	2
C2_5	ds	4
C2_6	ds	40
C2_7	ds	4
C2_8	ds	40
C2_9	ds	4
C2_10	ds	40
C2_11	ds	4
C2_12	ds	40
C2_13	ds	4
C2_14	ds	40
	ds	3	; garbage

	asc	"B0,C3,C5,R0,R1"

B0	ds	40
C3	ds	40
C5	ds	40
R0	ds	1	; length byte of R1
R1	ds	40

finVARIABLES	=	*

*--- Variables Apple IIgs

nbFICHES	ds	2
tblFICHES	ds	4*NB_FICHES

