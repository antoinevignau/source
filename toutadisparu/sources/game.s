*
* Tout a disparu
*
* (c) 1992, François Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* constantes
*-----------------------

NB_INDICATEURS =	10
NB_MOTS	=	25	; on ne peut pas avoir plus de 25 mots par ecran
NB_INDEX	=	512	; nombre de fiches du jeu
NB_TEXTES	=	512	; nombre de textes du jeu

*-----------------------
* loadFONT
*-----------------------

loadFONT
	lda	#pFONT
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	lf_ok

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

lf_ok	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrFONT
	PushLong	#32768
	_BlockMove
	rts
	
*-----------------------
* set_language
*-----------------------

set_language
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
	sta	pINDEX+16
	sta	pTEXTES+16

	lda	#pINDEX	; check file exists
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
* load_index
*-----------------------

load_index
	lda	#pINDEX
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	li_err2

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2

	lda	ptrINDEX
	sta	proREAD+4
	lda	ptrINDEX+2
	sta	proREAD+6
	
	lda	proEOF
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10

	jsl	GSOS
	dw	$2012
	adrl	proREAD
	bcs	li_err

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

li_err
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

li_err2
	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

*-----------------------
* init_index
*-----------------------

init_index
	stz	nbINDEX	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	ii1
	rts

ii1	lda	ptrINDEX
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrINDEX+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2

	ldy	#1	; tell to store string
ii2	cpy	#1	; save string pointer?
	bne	ii3	; nope

	lda	nbINDEX	; yes, save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblINDEX,x
	lda	dpFROM+2
	sta	tblINDEX+2,x
	dey		; string is saved

	inc	nbINDEX	; increment the number of strings
	lda	nbINDEX	; into our limit
	cmp	#NB_INDEX
	bcc	ii3
	rts

ii3	lda	[dpFROM]	; is it the end of a string?
	and	#$ff
	bne	ii4	; nope
	iny		; yes, tell to store string
	
ii4	inc	dpFROM
	bne	ii5
	inc	dpFROM+2
	
ii5	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	ii2
	lda	dpFROM
	cmp	dpTO
	bcc	ii2
	rts		; we are done!

*-----------------------
* get_index(index%)
*-----------------------

get_index
	cmp	#0
	bne	get_index1
	rts

get_index1
	cmp	nbINDEX
	bcc	get_index2
	beq	get_index2
	rts

get_index2
	dec
	asl
	asl
	tax
	lda	tblINDEX,x
	sta	dpINDEX
	lda	tblINDEX+2,x
	sta	dpINDEX+2
	rts

*-----------------------
* load_textes
*-----------------------

load_textes
	lda	#pTEXTES
	sta	proOPEN+4

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	lt_err2

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2

	lda	ptrTEXTES
	sta	proREAD+4
	lda	ptrTEXTES+2
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
* init_textes
*-----------------------

init_textes
	stz	nbTEXTES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	it1
	rts

it1	lda	ptrTEXTES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrTEXTES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2

*--- Nombre de textes en little endian

	lda	[dpFROM]	; le premier word est le nombre de textes
	xba
	sta	nbTEXTES2	; pour comparer avec notre valeur

	lda	dpFROM	; * += 2
	clc
	adc	#2
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2

*---
	
	ldy	#1	; tell to store string
it2	cpy	#1	; save string pointer?
	bne	it3	; nope

	lda	nbTEXTES	; yes, save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblTEXTES,x
	lda	dpFROM+2
	sta	tblTEXTES+2,x
	dey		; string is saved

	inc	nbTEXTES	; increment the number of strings
	lda	nbTEXTES	; into our limit
	cmp	#NB_TEXTES
	bcc	it3
	rts

it3	lda	[dpFROM]	; is it the end of a string?
	and	#$ff
	bne	it4	; nope
	iny		; yes, tell to store string
	
it4	inc	dpFROM
	bne	it5
	inc	dpFROM+2
	
it5	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	it2
	lda	dpFROM
	cmp	dpTO
	bcc	it2
	rts		; we are done!

*-----------------------
* get_textes(textes%)
*-----------------------

get_textes
	cmp	#0
	bne	get_textes1
	rts

get_textes1
	cmp	nbTEXTES
	bcc	get_textes2
	beq	get_textes2
	rts

get_textes2
	dec
	asl
	asl
	tax
	lda	tblTEXTES,x
	sta	dpTEXTES
	lda	tblTEXTES+2,x
	sta	dpTEXTES+2
	rts

*-----------------------
* LE JEU
*-----------------------

*-----------------------
* MAIN - OK
*-----------------------
* main

main
	jsr	switch_320
	jsr	choix_aventure
	jsr	initialisation_relative
	jmp	fadeOUT

*-----------

DEBUT_DATA	=	*	; C'est vachement pratique pour tout effacer !

aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
max_musiques ds	2
max_colonnes ds	2
max_lignes	ds	2
largeur_caractere ds	2
hauteur_caractere ds	2
marge_gauche ds	2
marge_gauche_pixel ds	2
max_mots	ds	2
taille_image ds	2	; not used
i	ds	2
j	ds	2
scene	ds	2
deplacement	ds	2
fichier	ds	2
espace	ds	2
phrase	ds	2
longueur	ds	2
index	ds	2
pointeur	ds	2
fonction_mots ds	2
aiguillage	ds	2
conditions	ds	2
pointeur_mots ds	2
numero_mot	ds	2	; WORD
mot	ds	128	; le mot à chercher (jusqu'au caractère espace)
option_mot	ds	128	; le mot est enregistré s'il est dans la liste (c'est bien long quand même)
scene_visitee	ds	NB_TEXTES	; BYTE - par scene, on met true ou false
image_a_charger	ds	NB_TEXTES*2	; WORD - par scene, on y met le pointeur vers le nom de l'image
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; WORD - TRUE or FALSE

rouge1	ds	NB_TEXTES	; les composants RVB pour le fond
vert1	ds	NB_TEXTES
bleu1	ds	NB_TEXTES
rouge2	ds	NB_TEXTES
vert2	ds	NB_TEXTES
bleu2	ds	NB_TEXTES

FIN_DATA	=	*	; Ben, ouais !

*-----------------------
* GENERIQUE - OK
*-----------------------
* generique

generique
	jsr	switch_640
	jsr	tag
	
	PushWord	#0
	_GetForeColor
	PushWord	#0
	_GetBackColor

	PushWord	#15
	_SetForeColor
	PushWord	#0
	_SetBackColor
	
	@cprint	#gen_str1;8
	@cprint	#gen_str2;9
	@cprint	#gen_str3;10
	@cprint	#gen_str4;12

	@cprint	#gen_str6;14	; Apple IIgs
	@cprint	#gen_str7;15	; version by nous :-)
	
	@cprint	#gen_str5;17

	jsr	waitEVENT
	
	_SetBackColor
	_SetForeColor
	
	jmp	fadeOUT

*-----------

gen_str1	str	'un logiciel de Fran'8d'ois Coulon'
gen_str2	str	'&'
gen_str3	str	'Sylvie Sarrat, Faustino Ribeiro, Laurent Cotton'
gen_str4	str	'programmation: Pascal Piat  noiz'27': Erik Ecqier'
gen_str5	str	'Les logiciels d'27'en face 1992. Reproduction, location et revente interdites'
gen_str6	str	'Version Apple IIgs par Brutal Deluxe Software'
gen_str7	str	'Antoine Vignau & Olivier Zardini'

*-----------------------
* TAG - OK 
*-----------------------
* tag

tag
	PushLong	#old_pattern
	_GetPenPat

	PushLong	#the_pattern	; blue pattern
	_SetPenPat

	ldx	#0
]lp	phx
	lda	tag_points,x
	cmp	#$ffff
	beq	tag_end
	
	and	#$ff	; keep X
	clc
	adc	#194	; 40 center it
	sta	tag_rect+2
	clc
	adc	#4
	sta	tag_rect+6
	
	lda	tag_points+1,x
	and	#$ff	; keep Y
	sta	tag_rect
	clc
	adc	#4
	sta	tag_rect+4

	PushLong	#tag_rect
	_PaintOval

tag_hop	plx
	inx
	inx
	bra	]lp
tag_end	plx

	PushLong	#old_pattern
	_SetPenPat
	rts

*-----------

old_pattern	ds	32
the_pattern	ds	32,$dd

*-----------

tag_rect	ds	2	; y0
	ds	2	; x0
	ds	2	; y1
	ds	2	; x1

*-----------------------
* CHOIX_AVENTURE - OK
*-----------------------
* choix_aventure

choix_aventure
	jsr	switch_320
	
	lda	#pMENU
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	ca_ok

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

ca_ok	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrMENU
	PushLong	#32768
	_BlockMove
	
	ldx	ptrMENU+2
	ldy	ptrMENU
	jsr	fadeIN

*--- On restaure les patterns

	PushLong	#old_pattern
	_GetBackPat

	PushLong	#black_pattern	; black pattern
	_SetBackPat

	jsr	ca_choice	; choix de l'aventure
	sta	aventure	; numéro de l'aventure

*--- Prépare le préfixe GS/OS 7 pour les images

	sep	#$20	; sauve
	ora	#'0'
	sta	pathIMAGES+25
	rep	#$20

	jsl	GSOS
	dw	$2009
	adrl	proSETPFX
	
*---

	PushLong	#old_pattern
	_GetBackPat

	lda	#2
	jmp	nowWAIT
	
*----------- Wait for a click

ca_choice	jsr	waitEVENT
	beq	ca_choice

	lda	taskREC+12	; where did we click?
	cmp	#106+1
	bcc	ca_clear23
	cmp	#212+1
	bcc	ca_clear13

*----------- Clear accordingly...
	
ca_clear12	jsr	ca_clear1
	jsr	ca_clear2
	lda	#3
	rts

ca_clear23	jsr	ca_clear2
	jsr	ca_clear3
	lda	#1
	rts

ca_clear13	jsr	ca_clear1
	jsr	ca_clear3
	lda	#2
	rts

ca_clear1	PushLong	#ca_rect1
	_EraseRect
	rts
	
ca_clear2	PushLong	#ca_rect2
	_EraseRect
	rts
	
ca_clear3	PushLong	#ca_rect3
	_EraseRect
	rts

*-----------

ca_rect1	dw	0,0,200,106
ca_rect2	dw	0,106,200,212
ca_rect3	dw	0,212,200,320

black_pattern
	ds	32,$00
	
*-----------------------
* INITIALISATION_ABSOLUE - OK
*-----------------------
* initialisation_absolue

initialisation_absolue
	jsr	initialisation_resolution
	jsr	noircit_ecran
	jsr	initialisation_constantes
	jsr	initialisation_fonte
	jsr	initialisation_fond
	jmp	initialisation_souris
	
*-----------------------
* INITIALISATION_CONSTANTES - OK
*-----------------------
* initialisation_constantes

initialisation_constantes
	lda	#3
	sta	max_musiques
	lda	#75
	sta	max_colonnes
	lda	#18
	sta	max_lignes
	lda	#8
	sta	largeur_caractere
	lda	#11
	sta	hauteur_caractere
	lda	#3
	sta	marge_gauche
	lda	#3*8	; marge_gauche * largeur_caractere
	sta	marge_gauche_pixel
	
	lda	#NB_MOTS
	sta	max_mots
	
	lda	#32000
	sta	taille_image
	rts
	
*-----------------------
* INITIALISATION_RESOLUTION - OK
*-----------------------
* initialisation_resolution

initialisation_resolution
	rts
	
*-----------------------
* INITIALISATION_FONTE - OK
*-----------------------
* initialisation_fonte

initialisation_fonte
	rts
	
*-----------------------
* INITIALISATION_FOND - OK
*-----------------------
* initialisation_fond

initialisation_fond
	lda	#pFOND
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	fo_ok

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

fo_ok	tya
	jsr	unpackLZ4

	PushLong	ptrIMAGE
	PushLong	ptrFOND
	PushLong	#32768
	_BlockMove
	rts
	
*-----------------------
* INITIALISATION_SOURIS - OK
*-----------------------
* initialisation_souris

initialisation_souris
	rts
	
*-----------------------
* INITALISATION_RELATIVE - OK
*-----------------------
* initialisation_relative

initialisation_relative
	jsr	initialisation_textes
	jsr	initialisation_tableaux
	jsr	initialisation_cache
	jmp	debut_aventure
	
*-----------------------
* INITIALISATION_TEXTES - OK
*-----------------------

initialisation_textes
	sep	#$20	; put aventure value
	lda	aventure
	ora	#'0'
	sta	pINDEX+25
	sta	pTEXTES+25
	rep	#$20
	
	jsr	load_textes
	jsr	init_textes
	
	lda	nbTEXTES
	dec
	sta	nombre_scenes
	rts

*-----------------------
* INITIALISATION_TABLEAUX - OK
*-----------------------

initialisation_tableaux
	jsr	load_index	; exit if error
	jmp	init_index
	
*-----------------------
* INITIALISATION_CACHE - OK
*-----------------------
* initialisation_cache

initialisation_cache
	rts
	
*-----------------------
* DEBUT_AVENTURE - OK
*-----------------------
* debut_aventure

debut_aventure
	lda	#1
	sta	scene_actuelle
	
	rts
	
*-----------------------
* FIN_AVENTURE - OK
*-----------------------
* fin_aventure

fin_aventure
	jsr	noircit_ecran
	
	ldx	#DEBUT_DATA	; on efface tout
]lp	stz	|$0000,x
	inx
	inx
	cpx	#FIN_DATA
	bcc	]lp

	lda	#FALSE
	sta	escape
	rts
	
*-----------------------
* FIN - OK
*-----------------------
* fin

fin
	rts
	
*-----------------------
* NOUVELLE_SCENE - OK
*-----------------------
* nouvelle_scene(scene)

nouvelle_scene
	ldx	scene
	lda	#TRUE
	sep	#$20
	sta	scene_visitee,x
	rep	#$20
	
	lda	#FALSE
	sta	deplacement
	
	stz	option_mot
	rts
	
*-----------------------
* SURLIGNER_MOT
*-----------------------
* surligner_mot(texte$,mot$,pointeur_mot%,cycles)

surligner_mot
	rts
	
*-----------------------
* PRINT
*-----------------------
* print(texte$,colonne&,ligne&,mode)
* A= ptr to string
* X= column index
* Y= line index

print
	pea	^print
	pha	; ptr to string

	phx	; push X for _MoveTo
	
	pha	; space for result
	pha
	phy	; push ligne
	PushWord	hauteur_caractere	; 11
	_Multiply
	pla	; get low result
	plx	; skip high result
	pha	; or lda 1,s sta 3,s pla
	_MoveTo
	_DrawString
	rts

*-----------------------
* NEWPRINT
*-----------------------

	PushLong #paintParamPtr
	_PaintPixels

	lda	#8
	sta	largeur_caractere
	lda	#11
	sta	hauteur_caractere

*--- Next X,Y on screen

	lda	ptrToDestPoint+2	; next X
	clc
	adc	largeur_caractere
	sta	ptrToDestPoint+2
	cmp	#screen_640
	bcc	ok_nextchar

	stz	ptrToDestPoint+2	; new line
	lda	ptrToDestPoint
	clc
	adc	hauteur_caractere
	sta	ptrToDestPoint
	cmp	#200
	bcc	ok_nextchar
	stz	ptrToDestPoint

ok_nextchar	rts
	
paintParamPtr
	adrl	ptrToSourceLocInfo
	adrl	ptrToDestLocInfo
	adrl	ptrToSourceRect
	adrl	ptrToDestPoint
	ds	2	; mode
	ds	4	; maskHandle

ptrToSourceLocInfo		; this is where FONT is
	dw	mode_640
	adrl	$8000
	dw	160
	dw	0
	dw	0
	dw	640
	dw	200
	
ptrToDestLocInfo		; this is where to draw
	dw	mode_640
	adrl	$e12000
	dw	160
	dw	0
	dw	0
	dw	640
	dw	200
	
ptrToSourceRect		; this is the rect of the source char
	ds	2	; y0
	ds	2	; x0
	ds	2	; y1
	ds	2	; x1
	
ptrToDestPoint		; and where to print on screen
	ds	2	; y0
	ds	2	; x0
	
*-----------------------
* CPRINT - OK
*-----------------------
* cprint(texte$,ligne&,mode)
* A= ptr to string
* Y= line index

cprint
	pha
	phy
	
	pea	$0000	; space for result
	pea	^cprint	; pointer to string
	pha
	_StringWidth

	lda	mainWIDTH	; 320 - 
	sec
	sbc	1,s	; stringWidth in pixels
	lsr		; /2
	sta	1,s
	plx		; =W X
	ply
	pla
	jmp	print

*-----------------------
* LES DONNES DE LA POLICE
*-----------------------
* on a 2 lignes de 67 caractères, 1 de 52
* les lignes sont à Y=10, 20, 30

tblFONT_X	=	*

]ligne10	=	0
]index	=	0
	lup	67
	dfb	]ligne10+]index
]index	=	]index+2
	--^

]ligne20	=	0
]index	=	0
	lup	67
	dfb	]ligne20+]index
]index	=	]index+2
	--^

]ligne30	=	0
]index	=	0
	lup	52
	dfb	]ligne30+]index
]index	=	]index+2
	--^

tblFONT_Y	=	*

]ligne10	=	10
	lup	67
	dfb	]ligne10
	--^

]ligne20	=	20
	lup	67
	dfb	]ligne20
	--^

]ligne30	=	30
	lup	52
	dfb	]ligne30
	--^

*-----------------------
* ATTENTE - OK
*-----------------------
* attente
	jmp	waitEVENT	; LoGo - check if we support keypresses as well
	
*-----------------------
* IMAGE - OK
*-----------------------
* image(scene)

image
	lda	scene
	asl
	tax
	lda	image_a_charger,x
	beq	image_1
	
image_ko	lda	#FALSE
	sta	image_chargee
	rts

*--- on copie le nom à pIMAGE+2

image_1	sta	Debut
	lda	ptrINDEX+2
	sta	Debut+2
	
	ldy	#0	; 1METRO.PI1
	sep	#$20	; 01234567
]lp	lda	[Debut],y
	sta	pIMAGE+4,y
	iny
	cmp	#'.'	
	bne	]lp

	lda	aventure	; 1->A ($41), 2->B ($42), 3->C ($43)
	ora	#'A'-1
	sta	pIMAGE+4	; 1METRO. -> AMETRO.
	
	lda	#'l'	; lz4
	sta	pIMAGE+4,y
	iny		; 8
	lda	#'z'
	sta	pIMAGE+4,y
	iny		; 9
	lda	#'4'
	sta	pIMAGE+4,y

	tya
	clc
	adc	#5	; strl (2) + '7/' (2) + la correction sur la longueur de chaîne
	sta	pIMAGE
	rep	#$20
	
*--- et on charge l'image

	lda	#pIMAGE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	image_ko
	tya
	jsr	unpackLZ4

	lda	#TRUE
	sta	image_chargee
	jmp	affiche_image

*-----------------------
* CHARGEMENT_HARD - OK
*-----------------------
* chargement_hard(fichier$)

chargement_hard
	rts
	
*-----------------------
* AFFICHE_IMAGE - OK
*-----------------------
* affiche_image(adresse_image%,palette$,fondu!)

affiche_image
	lda	image_chargee
	cmp	#TRUE
	beq	ai_1
	rts

ai_1
	jsr	switch_320
	jsr	noircit_ecran
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	fadeIN
	jsr	waitEVENT
	jsr	fadeOUT	; noircit_ecran
	jmp	switch_640
	
*-----------------------
* CHARGE_IMAGE - OK
*-----------------------
* charge_image(fichier$)

charge_image
	rts
	
*-----------------------
* IMAGE_ECRAN - OK
*-----------------------
* image_ecran(adresse_image%)

image_ecran
	rts
	
*-----------------------
* FADEIN - OK
*-----------------------
* fadein(palette2$)
	rts

*-----------------------
* FADEOUT - OK
*-----------------------
* fadeout(palette2$)
	rts

palette_320
	hex	0000770741082C070F008000700F000D
	hex	A90FF00FE000DF04AF0D8F07CC0CFF0F

*-----------------------
* FADEIN_MID - OK
*-----------------------
* fadein_mid

fadein_mid
	rts
	
*-----------------------
* FADEOUT_MID - OK
*-----------------------
* fadeout_mid

fadeout_mid
	rts
	
*-----------------------
* PALETTE_TEXTE - OK
*-----------------------
* palette_texte

palette_texte
	rts
	
*-----------------------
* NOIRCIT_ECRAN - OK
*-----------------------
* noircit_ecran

noircit_ecran
	PushWord #0
	_ClearScreen
	rts

*-----------------------
* PALETTE - OK
*-----------------------
* palette(palette$)

palette
	rts
	
*-----------------------
* HELP
*-----------------------
* help

help
	rts
	
*-----------------------
* MOTS_CLICABLES
*-----------------------
* mots_clicables(texte$)

mots_clicables
	rts
	
*-----------------------
* MUSIQUE - OK
*-----------------------
* musique(module$)

musique
	rts
	
*-----------------------
* FIN_MUSIQUE - OK
*-----------------------
* fin_musique

fin_musique
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

C1	ds	1
P	ds	1
	
finVARIABLES	=	*

*--- Variables Apple IIgs

nbINDEX	ds	2
nbTEXTES	ds	2
nbTEXTES2	ds	2	; nombre de textes indiqué dans le fichier .TEX

tblINDEX	ds	4*NB_INDEX
tblTEXTES	ds	4*NB_TEXTES

