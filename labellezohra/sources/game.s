* 
* La Belle Zohra
* 
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
* 

	mx    %00

*-----------------------

soundctl	=	$3c	; $c03c
sounddata	=	$3d	; $c03d
soundadrl	=	$3e	; $c03e
soundadrh	=	$3f	; $c03f

*-----------------------
* macros
*-----------------------

@carre	mac
	PushLong	]1
	PushWord	]2
	PushWord	]3
	PushWord	]4
	jsr	carre
	eom

@t	mac
	lda	]1
	ldy	]2
	jsr	t
	eom

@cree_fenetre	mac
	lda	]1
	ldx	]2
	jsr	cree_fenetre
	eom

*-----------------------
* DATA_ERROR - OK
*-----------------------
* data_error

data_error	pha
	PushLong #pgmSTR1
	PushLong #pgmSTR2
	PushLong #errSTR3
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	sec
	rts

*-----------------------
* LOAD_TEXTE - OK
*-----------------------
* load_texte

load_texte
	lda	#pTXT
	sta	proOPEN+4  ; filename

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	lt_err2
	
	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	ldy	proEOF
	sty	proREAD+8
	ldx	proEOF+2
	stx	proREAD+10

	pha
	pha
	phx
	phy
	PushWord	myID
	PushWord	#%11000000_00001100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrTEXTES
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	ptrTEXTES+2
	sta	proREAD+6
	pld
	pla
	pla
	bcs	lt_err1
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD

lt_err1	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
lt_err2	rts

*-----------------------
* TEST LA FIN DU JEU
*-----------------------

test_fin
	rts

*-----------------------
* GESTION DES ICONES DES PECHES
*-----------------------

test_peche	stz	peche_selectionne

	lda	#1		; from 1
]lp	pha
	asl
	tax
	lda	taskWHERE+2		; compare le X
	cmp	peche_x,x
	bcc	icone_ko
	lda	peche_xx,x
	cmp	taskWHERE+2
	bcc	icone_ko
	
	lda	taskWHERE		; et le Y
	cmp	peche_y,x
	bcc	icone_ko
	lda	peche_yy,x
	cmp	taskWHERE
	bcc	icone_ko
	
	pla				; on a notre icône
	sta	peche_selectionne
	clc
	rts

icone_ko	pla
	inc
	cmp	#nombre_peches		; et non plus nombre_icones
	bcc	]lp
	beq	]lp
	sec
	rts

*---

efface_peche	; X is object
	cpx	#0
	beq	ei1
	jsr	set_peche

	_HideCursor
	PushLong #fondParamPtr
	_PaintPixels
	_ShowCursor	
ei1	rts
	
*---

affiche_peche	; X is object
	cpx	#0
	beq	ai1
	jsr	set_peche

	_HideCursor
	PushLong #iconParamPtr
	_PaintPixels
	_ShowCursor	
ai1	rts

*---

set_peche	txa
	asl
	tax
	lda	peche_y,x		; x is 2..4..6..8
	sta	iconToSourceRect
	sta	iconToDestPoint
	lda	peche_x,x
	sta	iconToSourceRect+2
	sta	iconToDestPoint+2
	lda	peche_yy,x
	sta	iconToSourceRect+4
	lda	peche_xx,x
	sta	iconToSourceRect+6
	rts

*---

fondParamPtr
	adrl	fondToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconParamPtr
	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

fondToSourceLocInfo
	dw	mode_320	; mode 320
	ds	4	; ptrFOND - $0000 on entry, high set after _NewHandle
	dw	160
	dw	0,0,200,320
	
iconToSourceLocInfo
	dw	mode_320	; mode 320
	adrl	$8000	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	160
	dw	0,0,200,320
	
iconToDestLocInfo
	dw	mode_320	; +0 mode 320
	adrl	ptr012000	; +2
	dw	160
	dw	0,0,200,320
	
iconToSourceRect
	dw	3,0,109,272
iconToDestPoint
	dw	3,0

*-----------------------
* GESTION DES OBJETS
*-----------------------

test_objet	stz	objet_selectionne

	lda	#1		; from 1
]lp	pha
	asl
	tax
	lda	taskWHERE+2		; compare le X
	cmp	objet_x,x
	bcc	objet_ko
	lda	objet_xx,x
	cmp	taskWHERE+2
	bcc	objet_ko
	
	lda	taskWHERE		; et le Y
	cmp	objet_y,x
	bcc	objet_ko
	lda	objet_yy,x
	cmp	taskWHERE
	bcc	objet_ko
	
	pla			; on a notre icône
	sta	objet_selectionne
	clc
	rts

objet_ko	pla
	cmp	#nombre_objets	; et non plus nombre_objets
	bcc	]lp
	beq	]lp
	sec
	rts

*---

efface_objet	; X is object
	cpx	#0
	beq	eo1
	jsr	set_objet

	_HideCursor
	PushLong #fondParamPtr
	_PaintPixels
	_ShowCursor	
eo1	rts
	
*---

affiche_objet	; X is object
	cpx	#0
	beq	ao1
	jsr	set_objet

	_HideCursor
	PushLong	#iconParamPtr
	_PaintPixels
	_ShowCursor	
ao1	rts

*---

set_objet	txa
	asl
	tax
	lda	objet_y,x		; x is 2..4..6..8
	sta	iconToSourceRect
	sta	iconToDestPoint
	lda	objet_x,x
	sta	iconToSourceRect+2
	sta	iconToDestPoint+2
	lda	objet_yy,x
	sta	iconToSourceRect+4
	lda	objet_xx,x
	sta	iconToSourceRect+6
	rts

*-----------------------
* set_language
*-----------------------

set_language
	PushWord	#0
	PushWord	#$29
	_ReadBParam
	pla
	cmp	#20
	bcc	st_ok
	rts

* index
* TEXTES : +16

st_ok	jsr	st_setit	; try IIgs language
	bcc	st_ok99
	
	lda	#0	; if not, try EN US
	jsr	st_setit
	bcc	st_ok99

	lda	#2	; it not, force FR - It always exists
	jsr	st_setit
st_ok99	rts

*---

st_setit	sta	saveLANGUAGE
	asl
	tax
	lda	tblLANG,x
	sta	pTXT+16

	lda	#pTXT	; check file exists
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

st_setit99	rts

*---
	
tblLANG	asc	'us'	; 0
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
* THE_END - OK
*-----------------------
* the_end

the_end
*	@cree_fenetre #9;pointeur_paragraphes
*	jsr	pre_scrolling
	
	PushWord	#0
	_ClearScreen
	
	lda	#TRUE
	sta	fgTHEEND
	rts

*-----------------------
* CHOIX D'ENTREE - OK
*-----------------------

antoine
	@t	#strMENU1;#10
	@t	#strMENU2;#12
	@t	#strMENU3;#14

]lp	pha
	PushWord #%00000000_00001010
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	]lp

	lda	taskREC	; une touche ?
	cmp	#keyDownEvt
	bne	]lp

	lda	taskMESSAGE	; entre 0 et 9 ?
	cmp	#'1'
	beq	laZIK
	cmp	#'2'
	beq	laPREZ
	cmp	#'3'
	bne	]lp
	rts
laZIK	jsr	musique
laPREZ	jmp	presentation

*-----------------------
* INIT - OK
*-----------------------
* init

init	PushWord	#$ffff
	_ClearScreen
	rts

*-----------------------
* INIT2 - OK
*-----------------------

init2
*	ldx	#FIN_DATA-DEBUT_DATA
*]lp	stz	fgTHEEND,x
*	dex
*	bne	]lp

	ldx	#0	; l'indicateur 0 est toujours vrai
	sep	#$20
	lda	#TRUE
	sta	indicateur,x
	rep	#$20

	jsr	init_icones
	jsr	init_souris
	jsr	load_texte
	jsr	init_texte
	jmp	mouse_on

*-----------------------
* INIT_ICONES - OK
*-----------------------
* init_icones

init_icones
	@loadfile	#pFOND;ptrFOND
	@loadfile	#pICONES;ptrICONES
	rts

*-----------------------
* INIT_SOURIS - OK
*-----------------------
* init_souris

init_souris
	PushLong	#monCURSEUR
	_SetCursor
	rts

*-----------------------
* INIT_TEXTE
*-----------------------
* init_texte

init_texte
	lda	ptrTEXTES
	sta	Debut
	lda	ptrTEXTES+2
	sta	Debut+2

	ldx	#1
	sep	#$20

]lp	lda	[Debut]	; un paragraphe débute toujours par *
it_1	cmp	#'*'
	beq	it_ok
	jsr	it_next
	bra	it_1
it_ok	jsr	it_objpec	; enregistre le *
	jsr	it_condit	; le &, condition
	jsr	it_conseq	; le =, consequence
	jsr	it_texte	; le pointeur du texte

	inx
	cpx	#nombre_paragraphes
	bcc	]lp
	beq	]lp

	rep	#$20
	rts

	mx	%10

*--- * - objet + peche (tjs 2)

it_objpec	jsr	it_next
	sec
	sbc	#'0'
	sta	objet,x
	jsr	it_next
	sec
	sbc	#'0'
	sta	peche,x
	jmp	it_return

*--- & - condition

it_condit	jsr	it_next
	sec
	sbc	#'0'
	sta	condition,x
	jsr	it_next
	cmp	#' '
	beq	it_condit1	; c'était bien une unité
	cmp	#chrRET
	beq	it_condit1
	sec		; c'était une dizaine
	sbc	#'0'
	clc
	adc	#10
	sta	condition,x
it_condit1	jmp	it_return

*--- =

it_conseq	jsr	it_next
	sec
	sbc	#'0'
	sta	consequence,x
	jsr	it_next
	cmp	#' '
	beq	it_conseq1	; c'était bien une unité
	cmp	#chrRET
	beq	it_conseq1
	sec		; c'était une dizaine
	sbc	#'0'
	clc
	adc	#10
	sta	consequence,x
it_conseq1		; fall into it_return

*--- positionnne juste après un return

it_return	lda	[Debut]
]lp	cmp	#chrRET
	beq	it_return1
	jsr	it_next
	bra	]lp
it_return1		; fall into it_next

*--- next value

it_next	inc	Debut
	bne	it_next1
	inc	Debut+1
	bne	it_next1
	inc	Debut+2
it_next1	lda	[Debut]
	rts

*--- adresse du texte

it_texte	rep	#$20
	txa
	asl
	asl
	tay
	lda	Debut
	sta	texteDEBUT,y
	lda	Debut+2
	sta	texteDEBUT+2,y
	sep	#$20
	rts

	mx	%00

*-----------------------
* TEST_OBJETS
*-----------------------
* test_objets = affiche les objets possibles

test_objets	stz	textes_encore_presents

	sep	#$30
	ldx	#1
]lp	stz	icone_objets,x
	inx
	cpx	#nombre_objets
	bcc	]lp
	beq	]lp

	ldx	#1
]lp	lda	deja_lu,x
	cmp	#FALSE
	bne	to_1
	ldy	condition,x
	lda	indicateur,y
	cmp	#TRUE
	bne	to_1
	ldy	objet,x
	lda	#TRUE
	sta	icone_objets,y
	sta	textes_encore_presents

to_1	inx
	cpx	#nombre_paragraphes
	bcc	]lp
	beq	]lp
	
	rep	#$30

*-------- Affichage des objets

	ldx	#1
]lp	phx
	lda	icone_objets,x
	and	#$ff
	cmp	#TRUE
	bne	to_2

	jsr	affiche_objet
	
to_2	plx
	inx
	cpx	#nombre_objets
	bcc	]lp
	beq	]lp
	rts

*-----------------------
* TEST_PECHES
*-----------------------
* test_peches = affiche les peches possibles

test_peches	sep	#$30

	ldx	#1
]lp	stz	icone_peches,x
	inx
	cpx	#nombre_peches
	bcc	]lp
	beq	]lp

	ldx	#1
]lp	lda	objet,x
	cmp	objet_selectionne
	bne	tp_1
	lda	deja_lu,x
	cmp	#FALSE
	bne	tp_1
	ldy	condition,x
	lda	indicateur,y
	cmp	#TRUE
	bne	tp_1
	ldy	peche,x
	lda	#TRUE
	sta	icone_peches,y
tp_1	inx
	cpx	#nombre_paragraphes
	bcc	]lp
	beq	]lp

	rep	#$30

*-------- Affichage des peches

	ldx	#1
]lp	phx
	lda	icone_peches,x
	and	#$ff
	cmp	#TRUE
	bne	do_2

	jsr	affiche_peche
	
do_2	plx
	inx
	cpx	#nombre_peches
	bcc	]lp
	beq	]lp
	rts

	rts

*-----------------------
* RETOUR
*-----------------------
* retour = le texte est lu

retour	sep	#$30

	ldx	texte_selectionne
	lda	#TRUE
	sta	deja_lu,x
	
	ldy	consequence,x
	sta	indicateur,y
	
	rep	#$30
	rts

*-----------------------
* AIGUILLAGE
*-----------------------
* aiguillage = le texte à afficher

aiguillage	stz	texte_selectionne

	sep	#$30
	ldx	#1
]lp	lda	objet,x
	cmp	objet_selectionne
	bne	ai_next
	lda	peche,x
	cmp	peche_selectionne
	bne	ai_next
	lda	deja_lu,x
	cmp	#FALSE
	bne	ai_next
	ldy	condition,x
	lda	indicateur,y
	cmp	#TRUE
	bne	ai_next
	lda	texte_selectionne
	bne	ai_next
	stx	texte_selectionne	; on a trouvé un texte
ai_next	inx
	cpx	#nombre_paragraphes
	bcc	]lp
	beq	]lp

	rep	#$30
	rts

*-----------------------
* PRESENTATION - OK
*-----------------------
* presentation

presentation
	lda	#1
]lp	sta	index

	PushWord	#0
	_ClearScreen
	
	lda	index
	dec
	asl
	tax
	jsr	(tbl_pres,x)

	lda	#2
	jsr	nowWAIT

	lda	index
	inc
	cmp	#nombre_objets
	bcc	]lp
	beq	]lp
	rts

*---

tbl_pres	da	pr_case_1
	da	pr_case_2
	da	pr_case_3
	da	pr_case_4
	da	pr_case_5
	da	pr_case_6
	da	pr_case_7
	da	pr_case_8

*---

pr_case_1	@carre	#prSTR11;#100;#80;#$0771
	@carre	#prSTR12;#100;#120;#$0774

	PushWord	#15
	_SetForeColor
	PushWord	#0
	_SetBackColor

	@t	#prSTR13;#21
	@t	#prSTR14;#22
	@t	#prSTR15;#23
	rts
	
pr_case_2	@carre	#prSTR21;#25;#20;#$0437
	rts
	
pr_case_3	@carre	#prSTR31;#25;#180;#$0275
	rts
	
pr_case_4	@carre	#prSTR41;#100;#0;#$0743
	rts
	
pr_case_5	@carre	#prSTR51;#150;#20;#$0743
	@carre	#prSTR52;#50;#100;#$0743
	@carre	#prSTR53;#70;#180;#$0177
	rts
	
pr_case_6	@carre	#prSTR61;#0;#100;#$0607
	@carre	#prSTR62;#20;#150;#$0607
	rts
	
pr_case_7	@carre	#prSTR71;#0;#99;#$0073

	PushWord	#15
	_SetForeColor
	PushWord	#0
	_SetBackColor

	@t	#prSTR72;#20
	@t	#prSTR73;#21
	@t	#prSTR74;#22
	@t	#prSTR75;#23
	rts
	
pr_case_8	@carre	#prSTR81;#100;#180;#$0555
	rts
	
*---

prSTR11	str	'la belle zohra'
prSTR12	str	'(morceaux de bravoure)'
prSTR13	str	'fran'8d'ois coulon'
prSTR14	str	'les logiciels d'27'en face 1992'
prSTR15	str	'reproduction interdite'
prSTR21	str	'graphismes faustino ribeiro'
prSTR31	str	'programmation pascal piat'
prSTR41	str	'musique erik ecqier'
prSTR51	str	'un grand merci '88':'
prSTR52	str	'emmanuel talmy'
prSTR53	str	'sans qui ce logiciel... etc.'
prSTR61	str	'miss zohra c'8e'lestibus est habill'8e'e...'
prSTR62	str	'...par aristide aristibus'
prSTR71	str	8e'crit et r'8e'alis'8e' par fran'8d'ois coulon'
prSTR72	str	'Version Apple IIgs'
prSTR73	str	'par'
prSTR74	str	'Brutal Deluxe Software'
prSTR75	str	'Antoine Vignau & Olivier Zardini'
prSTR81	str	88' la famille paspire...'
	
*-----------------------
* CARRE
*-----------------------
* carre(texte$,x%,y%,couleur$)
*  3,s word : RGB color
*  5,s word : y
*  7,s word : x
*  9,s long : @text

* couleur$ est pour le carré
* le texte est toujours en jaune

carre	lda	5,s
	sta	carreRECT
	clc
	adc	#12
	sta	carreRECT+4
	lda	7,s
	sta	carreRECT+2
	clc
	adc	#12
	sta	carreRECT+6
	lda	9,s
	sta	dpFROM
	lda	11,s
	sta	dpFROM+2

*--- la couleur du GS

	lda	3,s	; R
	and	#$0f00
	asl
	sta	carreRGB

	lda	3,s	; G
	and	#$00f0
	asl
	ora	carreRGB
	sta	carreRGB

	lda	3,s	; B
	and	#$000f
	asl
	ora	carreRGB
	sta	carreRGB
	
*--- draw square

	PushWord	#0	; on met du RGB
	PushWord	index
	PushWord	carreRGB
	_SetColorEntry
	
	ldx	index
	lda	carreRECT	; la couleur si > 100
	cmp	#100+1
	bcs	carre_1
	ldx	#8	; le rose sinon
carre_1	phx
	_SetSolidPenPat
	
	lda	carreRECT+2
	pha
	lda	carreRECT
	pha
	_MoveTo

	PushLong	#carreRECT
	_PaintRect

*--- print text in bold typeface

	pha
	_GetTextFace
	pha
	_GetForeColor
	pha
	_GetBackColor
	
	PushWord	#%00000000_00000001	; bold
	_SetTextFace
	PushWord	#15
	_SetForeColor
	PushWord	#0
	_SetBackColor
	
	lda	carreRECT+2
	clc
	adc	#15
	pha
	lda	carreRECT
	clc
	adc	#8
	pha
	_MoveTo
	PushLong	dpFROM
	_DrawString
	
	_SetBackColor
	_SetForeColor
	_SetTextFace		; restore

carreEXIT	lda	1,s
	plx
	plx
	plx
	plx
	plx
	sta	1,s
	rts

*---

carreRGB	ds	2	; couleur du carre (4 bits)

carreRECT	ds	2	; y0
	ds	2	; x0
	ds	2	; y0+12
	ds	2	; y0+12

*-----------------------
* RAMDISK - OK
*-----------------------

ramdisk
	rts

*-----------------------
* 
*-----------------------

shoot_text
	rts

*-----------------------
* 
*-----------------------

shoot_ligne
	rts

*-----------------------
* CREE_FENETRE
*-----------------------
* cree_fenetre(objet%,paragraphe%)
*  A : objet
*  X : paragraphe

cree_fenetre
	rts

*-----------------------
* 
*-----------------------
* display_text(ligne%,niveau%)

display_text
	rts

*-----------------------
* ICE_LOAD - OK
*-----------------------
* ice_load(fichier$)

ice_load
	rts

*-----------------------
* ICE_DISP - OK
*-----------------------
* ice_disp(adresse_image%)

ice_disp
	rts

*-----------------------
* PALETTE - OK
*-----------------------
* palette(palette$)

palette
	rts

*-----------------------
* HIDE_SCREEN - OK
*-----------------------

hide_screen
	rts

*-----------------------
* SHOW_SCREEN - OK
*-----------------------

show_screen
	rts

*-----------------------
* HIDE_SCREEN2 - OK
*-----------------------

hide_screen2
	rts

*-----------------------
* SHOW_SCREEN2 - OK
*-----------------------

show_screen2
	rts

*-----------------------
* MOUSE_ON - OK
*-----------------------
* mouse_on

mouse_on	_ShowCursor
	rts

*-----------------------
* MOUSE_OFF - OK
*-----------------------
* mouse_off

mouse_off	_HideCursor
	rts

*-----------------------
* MUSIQUE - OK
*-----------------------
* musique

musique	lda	fgSND	; can we play?
	bne	mu_1	; yes
	rts		; no

mu_1	jsr	init_musique

	lda	#1
	sta	i
	
]lp	lda	i
	jsr	rythme	; charge le rythme
	jsr	rythme_joue	; joue le rythme
	lda	i
	jsr	charge_son	; charge les sons
	jsr	clavier_sonore ; joue les sons
	bcs	mu_exit	; si *, on quitte le clavier sonore
	jsr	nettoie_musique
	inc	i
	lda	i
	cmp	#5
	bcc	]lp
	beq	]lp
mu_exit	jmp	fin_musique

*-----------------------
* NETTOIE_MUSIQUE - OK
*-----------------------
* nettoie_musique

nettoie_musique
	PushLong	haBEAT
	_DisposeHandle

	lda	#0
]lp	pha
	asl
	asl
	tax
	lda	haSND1+2,x
	pha
	lda	haSND1,x
	pha
	_DisposeHandle
	pla
	inc
	cmp	j	; nombre de sons
	bcc	]lp
	rts

*-----------------------
* INIT_MUSIQUE - OK
*-----------------------

init_musique
	sei
	pha
	pha
	PushWord	#11
	_GetVector
	PullLong	sndVECTOR
	
	PushWord	#11
	PushLong	#sndINTERRUPT
	_SetVector
	cli

	PushWord	#$ffff
	_ClearScreen	
	rts

*-----------------------
* THE SOUND INTERRUPT
*-----------------------

	mx	%00
	
sndINTERRUPT	
	phd

	clc
	xce
	rep	#$30

	lda	#$c000
	tcd

	sep	#$20

]lp	lda	soundctl
	bmi	]lp

	ldal	$e100ca
	and	#%0000_1111
	sta	soundctl

	lda	#$e0	; which oscillo
	sta	soundadrl	; has generated
	lda	sounddata	; the interrupt?
	lda	sounddata
	and	#%0011_1110
	lsr
	cmp	#1	; oscillo 1 (lié à 0)
	beq	sndINTERRUPT1
	cmp	#3	; oscillo 3 (lié à 2)
	bne	sndINTERRUPT99
	
	lda	#-1	; dis au programme
	stal	fgCLEAR	; d'effacer le cadre
	bra	sndINTERRUPT99

sndINTERRUPT1
	lda	#$a0	; oscillos 0 & 1
	sta	soundadrl
	lda	#%0000_0000
	sta	sounddata
	lda	#$a1
	sta	soundadrl
	lda	#%0001_1000	; with interrupt
	sta	sounddata
	
sndINTERRUPT99
	sep	#$30
	pld
	clc
	rtl

	mx	%00
	
*-----------------------
* RYTHME - OK
*-----------------------
* rythme(rythme%)

*--- offset to beat number is +22

rythme	sep	#$20
	ora	#'0'
	sta	pBEAT+22
	rep	#$20

*---

	lda	#pBEAT
	sta	proOPEN+4  ; filename

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	ry_err2
	
	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	ldy	proEOF
	sty	proREAD+8
	ldx	proEOF+2
	stx	proREAD+10

	pha
	pha
	phx
	phy
	PushWord	myID
	PushWord	#%11000000_00001100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrBEAT
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	ptrBEAT+2
	sta	proREAD+6
	pld
	pla
	sta	haBEAT
	pla
	sta	haBEAT+2
	bcs	ry_err1
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD

ry_err1	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
ry_err2	rts

*-----------------------
* RYTHME_JOUE - OK
*-----------------------
* rythme_joue

rythme_joue
	lda	ptrBEAT
	sta	rj_from+1
	lda	ptrBEAT+1
	sta	rj_from+2
	lda	proEOF
	sta	rj_eof+1
	
* 1. on met en RAM son

	sei
	phd
	lda	#$c000
	tcd
	sep	#$20

	ldal	$e100ca
	and	#%0000_1111
	ora	#%0110_0000
	sta	soundctl

	lda	#0
	sta	soundadrl
	sta	soundadrh

	ldx	#0
rj_from	ldal	$aabbcc,x
	sta	sounddata
	inx
rj_eof	cpx	#$ffff
	bcc	rj_from

* 2. on démarre

	jsr	ensoniq_beat
		
* 3. on sort et ça joue

	rep	#$20
	pld
	cli
	rts

	mx	%10
	
*-----------------------
* ENSONIQ_BEAT - OK
*-----------------------
* ensoniq_beat

ensoniq_beat
	ldy	#0	; oscillos 0 & 1

	ldal	$e100ca	; volume
	and	#%0000_1111
	sta	soundctl

	tya		; fréquence basse
	sta	soundadrl
	lda	#217
	sta	sounddata
	tya
	ora	#$01
	sta	soundadrl
	lda	#217
	sta	sounddata

	tya		; fréquence haute
	ora	#$20
	sta	soundadrl
	lda	#0
	sta	sounddata
	tya
	ora	#$21
	sta	soundadrl
	lda	#0
	sta	sounddata

	tya		; volume
	ora	#$40
	sta	soundadrl
	lda	#$ff
	sta	sounddata
	tya
	ora	#$41
	sta	soundadrl
	lda	#$ff
	sta	sounddata

	tya		; address pointer (at $0000 and not $4000)
	ora	#$80
	sta	soundadrl
	lda	#$00
	sta	sounddata
	tya
	ora	#$81
	sta	soundadrl
	lda	#$00
	sta	sounddata

	tya		; waveform table size (32K)
	ora	#$c0
	sta	soundadrl
	lda	#%00111111
	sta	sounddata
	tya
	ora	#$c1
	sta	soundadrl
	lda	#%00111111
	sta	sounddata

	tya		; control register
	ora	#$a0
	sta	soundadrl
	lda	#%0000_0000
	sta	sounddata
	tya
	ora	#$a1
	sta	soundadrl
	lda	#%0001_1000	; with interrupt
	sta	sounddata
	rts
	
	mx	%00

*-----------------------
* SON_JOUE - OK
*-----------------------
* son_joue

son_joue
	
* 1. on met en RAM son

	sei
	phd
	lda	#$c000
	tcd
	sep	#$20

	ldal	$e100ca
	and	#%0000_1111
	ora	#%0110_0000
	sta	soundctl

	lda	#$00
	sta	soundadrl
	lda	#$80
	sta	soundadrh

	ldx	#0
sj_from	ldal	$aabbcc,x
	sta	sounddata
	inx
sj_eof	cpx	#$ffff
	bne	sj_from

* 2. on démarre

	ldy	#2	; oscillos 2 & 3

	ldal	$e100ca	; volume
	and	#%0000_1111
	sta	soundctl

	tya		; fréquence basse
	sta	soundadrl
	lda	waveFREQ
	sta	sounddata
	tya
	ora	#$01
	sta	soundadrl
	lda	waveFREQ
	sta	sounddata

	tya		; fréquence haute
	ora	#$20
	sta	soundadrl
	lda	waveFREQ+1
	sta	sounddata
	tya
	ora	#$21
	sta	soundadrl
	lda	waveFREQ+1
	sta	sounddata

	tya		; volume
	ora	#$40
	sta	soundadrl
	lda	#$ff
	sta	sounddata
	tya
	ora	#$41
	sta	soundadrl
	lda	#$ff
	sta	sounddata

	tya		; address pointer (at $8000)
	ora	#$80
	sta	soundadrl
	lda	#$80
	sta	sounddata
	tya
	ora	#$81
	sta	soundadrl
	lda	#$80
	sta	sounddata

	tya		; waveform table size (32K)
	ora	#$c0
	sta	soundadrl
	lda	#%00111111
	sta	sounddata
	tya
	ora	#$c1
	sta	soundadrl
	lda	#%00111111
	sta	sounddata

	tya		; control register
	ora	#$a0
	sta	soundadrl
	lda	#%0000_0010	; one-shot
	sta	sounddata
	tya
	ora	#$a1
	sta	soundadrl
	lda	#%0001_1010	; with interrupt
	sta	sounddata
		
* 3. on sort et ça joue

	rep	#$20
	pld
	cli
	rts

	mx	%00
		
*-----------------------
* CHARGE_SON - OK
*-----------------------
* charge_son

*--- offset to sfxs number is +21

charge_son	dec
	asl		; pointe sur la table de pointeurs
	tax		; par niveau (1..5)
	lda	tblSND,x
	cmp	#-1
	bne	ch_1
	sec
	rts
ch_1	sta	dpFROM	; pointe sur sndPARTx

	lda	#1	; on charge tous les sons maintenant
	sta	j
	
]lp	lda	j
	dec
	asl
	tay
	tax
	lda	(dpFROM),y
	cmp	#-1	; fin d'une structure
	bne	ch_2
	dec	j	; corrige l'index j
	clc
	rts
ch_2	sta	dpTO	; pointe sur l'entrée de la structure d'un son

	lda	(dpTO)	; nom du son
	sta	pSND+21
	ldy	#2
	lda	(dpTO),y
	sta	tblFREQ,x	; la fréquence du son

	lda	dpTO
	clc
	adc	#4
	sta	tblSTR1,x	; on pointe sur la première string
	sta	dpTO
	lda	(dpTO)
	and	#$ff
	clc
	adc	tblSTR1,x
	inc
	sta	tblSTR2,x

	jsr	charge_un_son

	inc	j
	bra	]lp
	
*---

charge_un_son
	lda	#pSND
	sta	proOPEN+4  ; filename

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	cus_err2
	
	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	ldy	proEOF
	sty	proREAD+8
	ldx	proEOF+2
	stx	proREAD+10

	pha
	pha
	phx
	phy
	PushWord	myID
	PushWord	#%11000000_00001100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	
	lda	j
	dec
	asl
	tay
	asl
	tax
	lda	proEOF	; nombre d'octets
	sta	tblSIZE,y

	lda	[3]
	sta	ptrSND1,x
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	ptrSND1+2,x
	sta	proREAD+6
	pld
	pla
	sta	haSND1,x
	pla
	sta	haSND1+2,x
	bcs	cus_err1
	
	jsl	GSOS
	dw	$2012
	adrl	proREAD

cus_err1	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	clc
cus_err2	rts

*-----------------------
* CLAVIER_SONORE - OK
*-----------------------

clavier_sonore
	ldx	#0	; init keyboard
	lda	#FALSE
]lp	sta	sndKEY,x
	inx
	inx
	cpx	#10*2
	bcc	]lp

cl_loop	lda	fgCLEAR
	beq	cl_noclear
	jsr	paintZIK
	stz	fgCLEAR

cl_noclear	pha
	PushWord #%00000000_00001010
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	cl_loop

	lda	taskREC	; une touche ?
	cmp	#keyDownEvt
	bne	cl_loop

	lda	taskMESSAGE	; entre 0 et 9 ?
	cmp	#chrESC
	beq	cl_exit
	cmp	#'0'
	bne	cl_1

cl_0	jsr	paintZIK	; 0 pour sortir
	clc
	rts		; * pour quitter

cl_exit	jsr	paintZIK
	sec		; définitivement
	rts

cl_1	cmp	#'1'
	bcc	cl_loop
	cmp	#'9'+1
	bcs	cl_loop

	sec
	sbc	#'1'
	cmp	j	; dans la limite du nombre de sons
	bcs	cl_loop

	asl		; affiche les chaînes
	tax
	asl
	tay
	lda	tblSIZE,x
	bpl	cl_size
	lda	#$8000	; on ne dépasse pas 32K
cl_size	sta	sj_eof+1
	lda	tblFREQ,x
	sta	waveFREQ

	lda	ptrSND1,y
	sta	sj_from+1
	lda	ptrSND1+1,y
	sta	sj_from+2

* Une petite différence avec la version ST

*	lda	sndKEY,x	; did we press the key?
*	cmp	#TRUE
*	bne	cl_2	; no, we can play
*	brl	cl_loop
*	
*cl_2	lda	#TRUE
*	sta	sndKEY,x
	
	phx
	jsr	paintZIK

	plx
	phx
	
	lda	tblSTR1,x
	ldy	#22
	jsr	t

	plx
	lda	tblSTR2,x
	ldy	#23
	jsr	t

	jsr	son_joue	; met le son en RAM son et le joue
	brl	cl_loop

*---------- The rectangle

paintZIK	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#whitePATTERN
	_SetPenPat
	
	PushLong	#zikRECT
	_PaintRect

	PushLong	#curPATTERN
	_SetPenPat
	rts

*---

zikRECT	dw	150,0,200,320
fgCLEAR	ds	2	; -1 set by interrupt

*-----------------------
* MIX - OK
*-----------------------
* mix(numero_son%)

mix
	rts

*-----------------------
* STOP_SAMPLE - OK
*-----------------------
* stop_sample

stop_sample
	rts

*-----------------------
* FIN_MUSIQUE - OK
*-----------------------
* fin_musique

fin_musique
	sei

	PushWord	#11
	PushLong	sndVECTOR
	_SetVector

	phd
	lda	#$c000
	tcd
	sep	#$20

	ldal	$e100ca
	and	#%0000_1111
	sta	soundctl

	ldx	#2	; boucle 2 fois
fm_1	ldy	#$1f
]lp	tya
	ora	#$a0
	sta	soundadrl
	lda	#$01
	sta	sounddata
	dey
	bpl	]lp
	dex
	bne	fm_1

	rep	#$20
	pld
	cli
	rts

*-----------------------
* DATA_FICHIERS_MUSIQUE - OK
*-----------------------
* data_fichiers_musique

data_fichiers_musique
	rts

*-----------------------
* T - OK
*-----------------------
* t(ligne%,texte$)
*  A: @texte$
*  Y: ligne%

t	sty	theY

	PushWord	#^t	; pointer to string
	pha
	
	PushWord	#0	; get string length
	PushWord	#^t
	pha
	_StringWidth	; return left on stack
	
	lda	#320	; why 160?
	sec
	sbc	1,s
	bpl	t1
	lda	#0
t1	lsr
	sta	1,s	; X
	
	lda	theY	; pour MoveTo
	asl
	asl
	asl
	pha		; Y	
	_MoveTo
	_DrawString
	rts

*-----------------------
* FIN - OK
*-----------------------

fin
	rts

*-----------------------
* MON BEAU CURSEUR
*-----------------------

monCURSEUR
	dw	16,5
	hex	FF000000000000000000	; data
	hex	F0F00000000000000000
	hex	F00F0000000000000000
	hex	F000F000000000000000
	hex	F0000F000FFFFF000000
	hex	F00000F0F00000F00000
	hex	F000000F00FFF00F0000
	hex	F0000FFF00F0F00F0000
	hex	F0F00F0F00F0F00F0000
	hex	FF0F00FF00F0F00F0000
	hex	F000F00FFFFFF00F0000
	hex	00000F00000000F00000
	hex	000000FFFFFFFF000000
	hex	0FFFFFFF00F000000000
	hex	F00000000F0000000000
	hex	0FFFFFFFF00000000000

	hex	FF000000000000000000	; mask
	hex	FFF00000000000000000
	hex	FFFF0000000000000000
	hex	FFFFF000000000000000
	hex	FFFFFF000FFFFF000000
	hex	FFFFFFF0FFFFFFF00000
	hex	FFFFFFFFFFFFFFFF0000
	hex	FFFFFFFFFFF0FFFF0000
	hex	FFFFFF0FFFF0FFFF0000
	hex	FF0FFFFFFFF0FFFF0000
	hex	F000FFFFFFFFFFFF0000
	hex	00000FFFFFFFFFF00000
	hex	000000FFFFFFFF000000
	hex	0FFFFFFFFFF000000000
	hex	FFFFFFFFFF0000000000
	hex	0FFFFFFFF00000000000
	
	dw	1,1

*--- The end
