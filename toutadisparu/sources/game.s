*
* Tout a disparu
*
* (c) 1992, François Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* CONSTANTES
*-----------------------

NB_INDICATEURS =	10
NB_MOTS	=	25	; on ne peut pas avoir plus de 25 mots par ecran
NB_TEXTES	=	160	; nombre de textes du jeu

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

lf_ok	rts

*--- Really load the font

font_it
	PushWord #$0A00	; Taille 10
	PushWord #$0016	; Courier
	PushWord #0
	_InstallFont
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
* next_index
*-----------------------

next_index	inc	dpINDEX
	bne	ni_1
	inc	dpINDEX+2
ni_1	lda	[dpINDEX]
	and	#$ff
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

	lda	dpFROM	; += 2
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

get_textes	cmp	#0
	beq	get_textes1
	cmp	nbTEXTES
	bcc	get_textes2
	beq	get_textes2
get_textes1	sec
	rts

get_textes2	dec
	asl
	asl
	tax
	lda	tblTEXTES,x
	sta	dpTEXTES
	lda	tblTEXTES+2,x
	sta	dpTEXTES+2
	clc
	rts

*-----------------------
* LE JEU
*-----------------------

*-----------------------
* GENERIQUE - OK
*-----------------------
* generique

generique	jsr	switch_640
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

	@cprint	#gen_str7;14	; Apple IIgs
	@cprint	#gen_str8;15	; version by nous :-)
	
	@cprint	#gen_str5;17
	@cprint	#gen_str6;18

	jsr	waitEVENT
	
	_SetBackColor
	_SetForeColor
	
	jmp	fadeOUT

*-----------

gen_str1	asc	'Un logiciel de Fran'8d'ois Coulon'00
gen_str2	asc	'&'00
gen_str3	asc	'Sylvie Sarrat, Faustino Ribeiro, Laurent Cotton'00
gen_str4	asc	'Programmation : Pascal Piat - Noiz'27': Erik Ecqier'00
gen_str5	asc	'Les logiciels d'27'en face 1992'00
gen_str6	asc	'Reproduction, location et revente interdites'00
gen_str7	asc	'Version Apple IIgs par Brutal Deluxe Software'00
gen_str8	asc	'Antoine Vignau & Olivier Zardini'00

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
	jsr	nowWAIT
	jmp	fadeOUT
	
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

instrSPACE	=	$20
instrDIESE	=	$23
instrECOMM	=	$26
instrPERCE	=	$25

*---

initialisation_tableaux
	jsr	load_index	; exit if error

	lda	ptrINDEX	; début du fichier IND
	sta	dpINDEX
	lda	ptrINDEX+2
	sta	dpINDEX+2

	bra	onsaute
	
*--- Initialise les valeurs du jeu

	ldx	#SUITE_DATA	; on efface tout
]lp	stz	|$0000,x
	inx
	cpx	#FIN_DATA
	bcc	]lp

*--- Initialise les valeurs RVB

onsaute

	ldx	#1	; RVB par défaut
	sep	#$20
]lp	lda	#4
	sta	rouge1-1,x
	lda	#1
	sta	rouge2-1,x
	lda	#7
	sta	vert1-1,x
	sta	vert2-1,x
	stz	bleu1-1,x
	stz	bleu2-1,x
	inx
	cpx	#NB_TEXTES
	bcc	]lp
	beq	]lp
	rep	#$20

*--- Decode chaque ligne

itab_loop	lda	[dpINDEX]	; read a byte
	and	#$ff
	bne	itab_1
	rts		; we reached 0, we exit

itab_1	cmp	#instrECOMM
	bne	itab_2

	jsr	doECOMM	; handle & - "image à charger"
	bra	itab_4
	
itab_2	cmp	#instrPERCE
	bne	itab_3

	jsr	doPERCE	; handle % - "couleur de fond du texte"
	bra	itab_4
	
itab_3	cmp	#instrDIESE
	bne	itab_4

	jsr	doDIESE	; handle # - "mot clicable"

*--- Next index

itab_4	jsr	next_index	; move to the first char of the next line
	bra	itab_loop	; loop

*--- Handle % - les valeurs RVB

doPERCE	jsr	next_index
	dec
	tax		; la scene

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	rouge1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	vert1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	bleu1,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	rouge2,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	vert2,x
	rep	#$20

	jsr	next_index
	sep	#$20
	sec
	sbc	#'0'
	sta	bleu2,x
	rep	#$20
	
	jmp	next_index	; skip the final 0

*--- Handle & - une image à charger

doECOMM	jsr	next_index
	dec
	asl		; tableau de words
	tax		; index du nom de l'image

	jsr	next_index	; pointe sur le nom du fichier
	lda	dpINDEX	; sauve son adresse dans le tableau
	sta	image_a_charger,x

]lp	jsr	next_index	; move to the end of the string (final zero)
	bne	]lp
	rts

*--- Handle # - les mots cliquables

doDIESE	jsr	next_index
	dec
	tax		; la scene
	
	sep	#$20	; un mot en plus
	inc	pointeur_mots,x
	lda	pointeur_mots,x
	dec
	sta	localPOINT
	rep	#$20

	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	phx		; index de scène
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	sta	localOFFSET	; 0=>0, 1=>25, 2=>50
	pla

*-- fonction_mot$(scene|,pointeur_mots|(scene|))=MID$(ligne$,2,espace%-2)

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	dpINDEX	; sauve l'offset du mot
	sta	fonction_mots,x

	jsr	next_index

*--- Maintenant, on parcout la chaîne jusqu'à l'espace

]lp	jsr	next_index
	cmp	#instrSPACE
	bne	]lp

*--- condition&(scene|,pointeur_mots|(scene|)) = 
*--- ASC(MID$(ligne$,espace%+2,1))*VAL(MID$(ligne$,espace%+1,1)+"1")
*--- Ici, on ne fait pas le calcul de la version Atari pour le moment

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	[dpINDEX]	; prend le mot sur 16-bit
	sta	condition,x

	jsr	next_index

*--- aiguillage|(scene|,pointeur_mots|(scene|))=ASC(MID$(ligne$,espace%+3))

	jsr	next_index

	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	clc
	adc	localPOINT	; +=
	tax
	
	sep	#$20
	lda	[dpINDEX]	; prend le caractère 8-bit
	sta	aiguillage,x
	rep	#$20

*--- Recopie la phrase si elle existe

	jsr	next_index
	bne	doDIESE1	; on a une chaîne
	rts

doDIESE1	lda	localOFFSET	; 0/25/50 => 0/50/100
	asl
	pha
	lda	localPOINT	; 0/1/2 => 0/2/4
	asl
	clc
	adc	1,s	; +=
	tax
	pla
	
	lda	dpINDEX	; prend le mot sur 16-bit
	sta	phrase,x

*--- Maintenant, on parcout la chaîne jusqu'à la fin (00)

]lp	jsr	next_index
	bne	]lp
	rts

*--- Local data

localOFFSET	ds	2	; offset de chaque rangée
localPOINT	ds	2	; index du mot

*-----------------------
* INITIALISATION_CACHE - OK
*-----------------------
* initialisation_cache

initialisation_cache
	rts

*-----------------------
* AFFICHE_TEXTE
*-----------------------
* affiche_texte

texteSPACE	=	$5f
texteRC	=	$9c

affiche_texte

	lda	#1
	sta	i	; on commence à 1

	lda	#texte_final
	sta	dpTO

	sep	#$20	; A en 8-bits

* 1- saute les premiers RC

	ldy	#0
	tyx
]lp	lda	[dpTEXTES],y
	cmp	#texteRC
	bne	at_1
	iny
	bne	]lp

* 2- recopie le texte

at_1	lda	[dpTEXTES],y
	sta	texte,x
	iny
	inx
	cmp	#0
	bne	at_1	; jusqu'à la fin du texte de la scène

	inx
	stx	longueur_texte

* ligne_max$=MID$(texte$,i%,max_colonnes|)

at_2	sep	#$20

	ldy	#0
	ldx	i
]lp	lda	texte-1,x
	sta	ligne_max,y
	inx
	iny
	cpy	#max_colonnes
	bcc	]lp

* return$=LEFT$(ligne_max$,INSTR(ligne_max$,"ú"))

	ldx	#0
]lp	lda	texte,x
	sta	ligne_return,x
	cmp	#texteRC
	beq	at_3	; on a trouvé un RC
	inx
	cpx	#max_colonnes
	bcc	]lp
	ldx	#-1	; on n'a pas trouvé

at_3	inx
	stx	return	; on a l'index du RC

	cpx	#0
	beq	at_case0
	cpx	#1
	beq	at_case1
	brl	at_default
	
* CASE 0 - aucun RC, on coupe le texte

* ligne_max$=LEFT$(ligne_max$,RINSTR(ligne_max$," "))

at_case0	ldx	#max_colonnes-1
]lp	lda	ligne_max,x
	cmp	#instrSPACE	; un vrai espace
	beq	at_4
	dex
	bne	]lp

at_4	inx
	stx	len_max

* b$=b$+ligne_max$+SPACE$(max_colonnes|-LEN(ligne_max$))

	ldx	#0
]lp	lda	ligne_max,x
	jsr	set_textefinal
	inx
	cpx	len_max
	bcc	]lp

	rep	#$20
	lda	#max_colonnes
	sec
	sbc	len_max
	tax
	sep	#$20
	jsr	set_space
	
* ADD i%,LEN(ligne_max$)

	rep	#$20
	lda	i
	clc
	adc	len_max
	sta	i
	sep	#$20
	bra	at_8
	
* CASE 1 - ligne blanche

at_case1	ldx	i	; on utilise X pour être en 16-bits
	inx
	stx	i

	ldx	#max_colonnes
	jsr	set_space
	bra	at_8

* DEFAULT

* DEC return%

at_default	dec	return

* ligne_max$=LEFT$(return$,return%)

	ldx	#0
]lp	lda	ligne_max,x
	jsr	set_textefinal
	inx
	cpx	return
	bcc	]lp

* b$=b$+ligne_max$+SPACE$(max_colonnes|-return%)

	rep	#$20
	lda	#max_colonnes
	sec
	sbc	return
	tax
	sep	#$20
	jsr	set_space

* ADD i%,return%+1
	
	rep	#$20
	lda	i
	clc
	adc	return
	inc
	sta	i
	sep	#$20

* UNTIL i%>=longueur_texte%

at_8	ldx	i
	cpx	longueur_texte
	bcs	at_9
	brl	at_2	; we loop

* on comble de lignes blanches
	
at_9	ldx	#0	; on remplit de space chars
	lda	#texteSPACE
]lp	sta	texte,x
	inx
	cpx	#max_colonnes*max_lignes
	bcc	]lp

	rep	#$20	; la longueur du texte final
	lda	dpTO
	sec
	sbc	#texte_final
	sta	return
	sep	#$20
	
	ldx	#0
]lp	lda	texte_final,x
	sta	texte+max_colonnes,x
	inx
	cpx	return
	bcc	]lp
	
* on imprime le texte (enfin)

modeForeCopy =	$0004	; QDII Table 16-10

	mx	%00
	
	rep	#$20
	
	jsr	switch_640	; switch to 640

* on s'occupe des couleurs d'index 5 et A

	bra	skipME
	
	lda	ptrFOND
	sta	dpFROM
	lda	ptrFOND+2
	sta	dpFROM+2

	ldx	scene_actuelle
	sep	#$20
	lda	rouge1-1,x
	sta	rvb5+1
	lda	vert1-1,x
	asl
	asl
	asl
	asl
	sta	rvb5
	lda	bleu1-1,x
	ora	rvb5
	sta	rvb5

	lda	rouge2-1,x
	sta	rvbA+1
	lda	vert2-1,x
	asl
	asl
	asl
	asl
	sta	rvbA
	lda	bleu2-1,x
	ora	rvbA
	sta	rvbA

	rep	#$20

	ldy	#$7E00+$0A	; 5x2
	lda	rvb5
	sta	[dpFROM],y

	ldy	#$7E00+$14	; Ax2
	lda	rvbA
	sta	[dpFROM],y

skipME

* et on affiche enfin

	ldx	ptrFOND+2
	ldy	ptrFOND
	jsr	fadeIN

	PushWord	#0	; save current mode
	_GetTextMode

	PushWord	#modeForeCopy
	_SetTextMode

	PushLong	#texte
	PushWord	#1
	PushWord	#1
	PushWord	#0	; c'est normalement le modeForeCopy
	jsr	print

	_SetTextMode	; restore original mode
	
	jsr	attente
	rts

*--- output X space char dans texte final

	mx	%10
	
set_space
	lda	#texteSPACE
]lp	jsr	set_textefinal
	dex
	bne	]lp
	rts

*--- output dans texte final

set_textefinal
	sta	(dpTO)
	inc	dpTO
	bne	set_tf1
	inc	dpTO+1
set_tf1	rts

*--- Local data

len_max	ds	2	; longueur de ligne_max
longueur_texte ds	2	; nombre de caracteres du texte d'origine
return	ds	2	; premier RC dans une ligne
i	ds	2	; index dans texte
rvb5	ds	2
rvbA	ds	2

	mx	%00	; on revient en 16-bits
	
*-----------------------
* DEBUT_AVENTURE - OK
*-----------------------
* debut_aventure

debut_aventure
	lda	#1
	sta	scene_actuelle

	ldx	#1
	sep	#$20
	lda	#FALSE
]lp	sta	scene_visitee-1,x
	inx
	cpx	#NB_TEXTES
	bcc	]lp
	beq	]lp
	rep	#$20
	
	lda	#TRUE
	sta	deplacement
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
* nouvelle_scene(scene à charger)

nouvelle_scene
	cmp	#0	; not 0
	beq	ns_99
	dec
	tax
	lda	#TRUE
	sep	#$20
	sta	scene_visitee,x
	rep	#$20
	
	lda	#FALSE
	sta	deplacement
	
	stz	option_mot
ns_99	rts

*-----------------------
* CLIC_MOT
*-----------------------
* clic_mot

clic_mot
	rts

*-----------------------
* SURLIGNER_MOT
*-----------------------
* surligner_mot(texte$,mot$,pointeur_mot%,cycles)

surligner_mot
	rts
	
*-----------------------
* PRINT - OK
*-----------------------
* print(texte$,colonne&,ligne&,mode)
* 1,s	w	return address
* 3,s	w	mode
* 5,s	w	Y
* 7,s	w	X
* 9,s	l	text pointer

max_colonnes =	80
max_lignes	=	20
largeur_caractere = 	8
hauteur_caractere =	10

*---

print	lda	11,s
	sta	dpFROM+2
	lda	9,s
	sta	dpFROM
	lda	7,s
	sta	printX
	lda	5,s
	sta	printY
	lda	3,s
	sta	printMODE
	
printLOOP	lda	[dpFROM]
	and	#$ff
	bne	print1

printEXIT	lda	1,s
	plx
	plx
	plx
	plx
	plx
	sta	1,s
	rts

* 1- print char

print1	cmp	#instrSPACE	; skip space char
	beq	print2
	cmp	#texteSPACE
	beq	print2
	cmp	#texteRC
	beq	print3

	tax
	lda	tblATARI,x
	and	#$ff
	pha

	lda	printX
	asl
	tax
	lda	x_coord,x
	pha
	
	lda	printY
	asl
	tay
	lda	y_coord,y
	pha
	_MoveTo
	_DrawChar

* 4- next character

print2	inc	printX
	lda	printX
	cmp	#max_colonnes
	bcc	print4

print3	lda	7,s	; reset X-coord
	sta	printX

	inc	printY
	lda	printY
	cmp	#max_lignes
	bcc	print4
	
	brl	printEXIT	; out of SHR screen, we exit

* 6- we loop

print4	inc	dpFROM
	bne	print5
	inc	dpFROM+2

print5	brl	printLOOP

*---

printMODE	ds	2
printX	ds	2
printY	ds	2

*---

x_coord	=	*
]x	=	0	; Première ligne
	lup	max_colonnes
	dw	]x
]x	=	]x+largeur_caractere
	--^

y_coord	=	*
]y	=	0	; Première ligne
	lup	max_lignes
	dw	]y
]y	=	]y+hauteur_caractere
	--^

*---

* Apple		Atari
* 88	à	85
* 89	â	83
* 8D	ç	87
* 8E	é	82
* 8F	è	8A
* 90	ê	88
* 91	ë	
* 94	î	8C
* 95	ï	8B
* 99	ô	93
* 9E	ù	97
* CE	OE	B4
* CF	oe	B5

tblATARI	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	606162636465666768696A6B6C6D6E6F
	hex	707172737475767778797A7B7C7D7E7F
	hex	80818E898488868D88898F90948D8E8F
	hex	909192999495969E98999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3CECFB6B7B8B9BBBABCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

*-----------------------
* CPRINT - OK
*-----------------------
* cprint(texte$,ligne&,mode)
* A= ptr to string
* Y= line index

cprint	pea	^cprint	; ptr to text
	pha
	pha	; X
	phy	; Y
	pea	$0000	; mode

*	pea	$0000	; space for result
*	pea	^cprint	; pointer to string
*	pha
*	_CStringWidth

	pea	$0000	; count nb of chars in the string
	sta	dpFROM
	
	ldy	#0
	sep	#$20
]lp	lda	(dpFROM),y
	beq	cprint1
	iny
	bne	]lp

cprint1	rep	#$20	; nb chars x 8 to get width
	tya
	asl
	asl
	asl
	sta	1,s

*--- now, calculate where we should display it online
	
	lda	mainWIDTH	; 320 or 640
	sec
	sbc	1,s	; stringWidth in pixels
	plx		; free stack
	lsr		; /2
	lsr		; /4
	lsr		; /8
	lsr		; /16
	sta	5,s	; fill X from above
	jsr	print
	rts		; must be RTS
	
*-----------------------
* ATTENTE - OK
*-----------------------
* attente

attente	jmp	waitEVENT	; LoGo - check if we support keypresses as well
	
*-----------------------
* IMAGE - OK
*-----------------------
* image(scene à charger)

image	cmp	#0	; not 0
	beq	image_ko
	dec
	asl
	tax
	lda	image_a_charger,x
	bne	image_1
	
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
	adc	#3	; strl (2) + '7/' (2) + la correction sur la longueur de chaîne
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

ai_1	jsr	switch_320
	jsr	noircit_ecran
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	fadeIN
	jsr	waitEVENT
	jsr	fadeOUT	; noircit_ecran
	jmp	switch_640

*-----------------------
* SUITE_FORCEE - 
*-----------------------
* suite_forcee(scene)

suite_forcee
	cmp	#0
	bne	sf_2
	
sf_1	lda	#FALSE
	rts

sf_2	dec		; prend la scene
	pha		; calcul l'index dans la dimension NB_MOTS
	pha
	pha		; index de scène
	PushWord #NB_MOTS	; taille d'une dimension
	_Multiply
	pla
	sta	localOFFSET	; 0=>0, 1=>25, 2=>50
	asl		; parce qu'on est sur des words
	clc
	adc	#fonction_mots
	sta	dpFROM	; on pointe sur l'index du premier mot
	pla

	lda	(dpFROM)	; prend la valeur du premier mot
	sta	dpINDEX	; de fonction_mots
	lda	ptrINDEX
	sta	dpINDEX+2	; et met son pointeur 32-bits

	ldy	#6-2	; len('suite ') sur 16-bits
]lp	lda	[dpINDEX],y
	cmp	strSUITE,y
	bne	sf_1
	dey
	dey
	bpl	]lp

	jsr	attente	; on attend

	lda	#aiguillage
	clc
	adc	localOFFSET
	sta	dpFROM
	
	lda	(dpFROM)	; la prochaine scène
	and	#$ff
	sta	scene_actuelle
	
	lda	#TRUE
	sta	deplacement
	rts
sf_99	lda	#FALSE
	rts

strSUITE	asc	'suite '

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
* HELP - OK
*-----------------------
* help

help	lda	mainWIDTH	; save current width
	sta	oldWIDTH
	jsr	saveBACK	; save background
	jsr	switch_640	; switch to 640

	ldx	ptrFOND+2
	ldy	ptrFOND
	jsr	fadeIN

	PushLong	#old_pattern	; save current pattern
	_GetPenPat

* The frame

	PushLong	#black_pattern	; black pattern
	_SetPenPat

	PushLong #helpRECT1
	PushWord #10
	PushWord #10
	_FrameRRect
	
* The rectangle

	PushLong	#white_pattern	; white pattern
	_SetPenPat

	PushLong #helpRECT2
	PushWord #10
	PushWord #10
	_PaintRRect

	lda	aventure
	cmp	#2
	beq	help2
	cmp	#3
	beq	help3

	@cprint	#help_str1_1;3
	@cprint	#help_str1_2;5
	bra	help4
help2	@cprint	#help_str2_1;3
	@cprint	#help_str2_2;5
	bra	help4
help3	@cprint	#help_str3_1;3
	@cprint	#help_str3_2;5

help4
	@cprint	#help_str8;8
	@cprint	#help_str9;9
	@cprint	#help_str11;11
	@cprint	#help_str12;12
	@cprint	#help_str13;13
	@cprint	#help_str14;14
	@cprint	#help_str16;16
	
help9	jsr	waitEVENT

*--- Restore all
	
	PushLong	#old_pattern
	_SetPenPat

	jsr	fadeOUT	; fade
	jsr	loadBACK	; restore background
	lda	oldWIDTH	; restore width
	sta	mainWIDTH
	rts		; and exit

*---

helpRECT1	dw	5,125,195,515
helpRECT2	dw	7,127,193,512

white_pattern
	ds	32,$ff
	
help_str1_1	asc	'1. 'd2' Heurts d'27'ouverture 'd300
help_str1_2	asc	'- Fran'8d'ois Coulon et Sylvie Sarrat -'00
help_str2_1	asc	'2. 'd2' Cheek to cheek & ashes to ashes 'd300
help_str2_2	asc	'- Fran'8d'ois Coulon et Faustino Ribeiro -'00
help_str3_1	asc	'3. 'd2' Un appel '88' la m'8e'moire 'd300
help_str3_2	asc	'- Fran'8d'ois Coulon et Laurent Cotton -'00

help_str8	asc	'OA-S : sauver la situation'00
help_str9	asc	'OA-O : recharger une situation'00
help_str11	asc	'OA-Z : musique on/off'00
help_str12	asc	'OA-R : retour au d'8e'but de l'27'aventure'00
help_str13	asc	'ESC : retour au menu'00
help_str14	asc	'Toute autre touche : retour '88' l'27'aventure'00
help_str16	asc	'OA-Q : quitter le jeu'00

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

