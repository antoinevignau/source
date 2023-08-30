* 
* La Belle Zohra
* 
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
* 

	mx    %00

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

*-----------------------
* GESTION DES ICONES
*-----------------------

test_icone
	lda	#0			; from 1
]lp	pha
	asl
	asl
	asl
	tax
	lda	taskWHERE+2		; compare le X
	cmp	coordonnees_peches,x
	bcc	icone_ko
	lda	coordonnees_peches+4,x
	cmp	taskWHERE+2
	bcc	icone_ko
	
	lda	taskWHERE		; et le Y
	cmp	coordonnees_peches+2,x
	bcc	icone_ko
	lda	coordonnees_peches+6,x
	cmp	taskWHERE
	bcc	icone_ko
	
	pla				; on a notre icône
	inc
*	sta	instruction2
	rts

icone_ko
	pla
	inc
	cmp	#nombre_objets-1		; et non plus nombre_icones
	bcc	]lp
	rts

*---

efface_icone	; X is object
	cpx	#0
	beq	ei1
	jsr	set_icone

	_HideCursor
	PushLong #iconParamPtr
	_PaintPixels
	_ShowCursor	
ei1	rts
	
*---

affiche_icone	; X is object
	cpx	#0
	beq	ai1
	jsr	set_icone

	_HideCursor
	PushLong #fondParamPtr
	_PaintPixels
	_ShowCursor	
ai1	rts

*---

set_icone	txa
	dec
	asl
	asl
	asl		; because we are 16-bit
	tax
	lda	coordonnees_peches+2,x
	sta	iconToSourceRect
	sta	iconToDestPoint
	lda	coordonnees_peches,x
	sta	iconToSourceRect+2
	sta	iconToDestPoint+2
	lda	coordonnees_peches+6,x
	sta	iconToSourceRect+4
	lda	coordonnees_peches+4,x
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
	dw	0,0,199,319
	
iconToSourceLocInfo
	dw	mode_320	; mode 320
	adrl	$8000	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	160
	dw	0,0,199,319
	
iconToDestLocInfo
	dw	mode_320	; mode 320
	adrl	ptrE12000
	dw	160
	dw	0,0,199,319
	
iconToSourceRect
	dw	3,0,109,272
iconToDestPoint
	dw	3,0

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
	sta	pREF+16
	sta	pTEXTES+16

	lda	#pREF	; check file exists
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
* XX - OK
*-----------------------

xx
	rts

*-----------------------
* MAIN - OK
*-----------------------

main
	rts

*-----------------------
* VIGIL - OK
*-----------------------
* vigil(max_x%,max_y%,max_xx%,max_yy%,sauvegarde!)

vigil
	rts
	
*-----------------------
* TEST_FIN - OK
*-----------------------

teste_fin	lda	paragraphes_lus
	sec
	sbc	pointeur_paragraphes
	cmp	#1
	bne	tf_99
	
	jmp	the_end
	
tf_99	rts

*-----------------------
* 
*-----------------------

demande_objet
	rts

*-----------------------
* 
*-----------------------

demande_peche
	rts

*-----------------------
* 
*-----------------------

recherche_references
	rts

*-----------------------
* 
*-----------------------

affiche_image
	rts

*-----------------------
* 
*-----------------------

sauvegarde
	rts

*-----------------------
* 
*-----------------------

chargement
	rts

*-----------------------
* 
*-----------------------

the_end
	rts

*-----------------------
* 
*-----------------------

pre_scrolling
	rts

*-----------------------
* 
*-----------------------

scrolling
	rts

*-----------------------
* 
*-----------------------

verif
	rts

*-----------------------
* 
*-----------------------

init
	rts

*-----------------------
* 
*-----------------------

init2
	rts

*-----------------------
* 
*-----------------------

init_resolution
	rts

*-----------------------
* 
*-----------------------

init_indicateurs
	rts

*-----------------------
* 
*-----------------------

init_objets
	rts

*-----------------------
* 
*-----------------------

init_peches
	rts

*-----------------------
* 
*-----------------------

init_icones
	rts

*-----------------------
* 
*-----------------------

init_routines
	rts

*-----------------------
* 
*-----------------------

init_fenetres
	rts

*-----------------------
* 
*-----------------------

init_souris
	rts

*-----------------------
* 
*-----------------------

datas_init
	rts

*-----------------------
* 
*-----------------------

init_texte
	rts

*-----------------------
* 
*-----------------------

init_indicateurs_texte
	rts

*-----------------------
* 
*-----------------------

lookindex
	rts

*-----------------------
* PRESENTATION - OK
*-----------------------
* presentation
*  A: numéro du texte

presentation
	cmp	#9	; 1..8
	bcc	pr_1
	rts
pr_1	cmp	#0
	beq	pr_2
	pha
	
	PushWord	#0
	_ClearScreen
	
	pla
	dec
	asl
	tax
	jsr	(tbl_pres,x)
pr_2	rts

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

pr_case_1
	@carre	#prSTR11;#100;#80;#$0771
	@carre	#prSTR12;#100;#120;#$0774
	rts
	
pr_case_2
	@carre	#prSTR21;#25;#20;#$0437
	rts
	
pr_case_3
	@carre	#prSTR31;#25;#180;#$0275
	rts
	
pr_case_4
	@carre	#prSTR41;#100;#0;#$0743
	rts
	
pr_case_5
	@carre	#prSTR51;#150;#20;#$0743
	@carre	#prSTR52;#50;#100;#$0743
	@carre	#prSTR53;#70;#180;#$0177
	rts
	
pr_case_6
	@carre	#prSTR61;#0;#100;#$0607
	@carre	#prSTR62;#20;#150;#$0607
	rts
	
pr_case_7
	@carre	#prSTR71;#0;#99;#$0073
	rts
	
pr_case_8
	@carre	#prSTR81;#100;#180;#$0555
	rts
	
*---

prSTR11	str	'la belle zohra'
prSTR12	str	'(morceaux de bravoure)'
prSTR13	str	'fran'8d'ois coulon'
prSTR14	str	'les logiciels d'27'en face 1992.reproduction interdite'
prSTR21	str	'graphismes faustino ribeiro'
prSTR31	str	'programmation pascal piat'
prSTR41	str	'musique erik ecqier'
prSTR51	str	'un grand merci '88':'
prSTR52	str	'emmanuel talmy'
prSTR53	str	'sans qui ce logiciel... etc.'
prSTR61	str	'miss zohra c'8e'lestibus est habill'8e'...'
prSTR62	str	'...par aristide aristibus'
prSTR71	str	8e'crit et r'8e'alis'8e' par fran'8d'ois coulon'
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

carre	lda	3,s
	sta	carreRGB
	lda	5,s
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
	
carreEXIT	lda	1,s
	plx
	plx
	plx
	plx
	plx
	sta	1,s
	rts

*---

carreRGB	ds	2	; couleur du carre

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
* 
*-----------------------
* cree_fenetre(objet%,paragraphe%)

cree_fenetre
	rts

*-----------------------
* 
*-----------------------
* display_text(ligne%,niveau%)

display_text
	rts

*-----------------------
* 
*-----------------------
* ice_load(fichier$)

ice_load
	rts

*-----------------------
* 
*-----------------------
* ice_disp(adresse_image%)

ice_disp
	rts

*-----------------------
* 
*-----------------------
* palette(palette$)

palette
	rts

*-----------------------
* 
*-----------------------

hide_screen
	rts

*-----------------------
* 
*-----------------------

show_screen
	rts

*-----------------------
* 
*-----------------------

hide_screen2
	rts

*-----------------------
* 
*-----------------------

show_screen2
	rts

*-----------------------
* 
*-----------------------

mouse_on
	rts

*-----------------------
* 
*-----------------------

mouse_off
	rts

*-----------------------
* 
*-----------------------

musique
	rts

*-----------------------
* 
*-----------------------

init_musique
	rts

*-----------------------
* 
*-----------------------
* rythme(rythme%)

rythme
	rts

*-----------------------
* 
*-----------------------

charge_son
	rts

*-----------------------
* 
*-----------------------

clavier_sonore
	rts

*-----------------------
* 
*-----------------------
* mix(numero_son%)

mix
	rts

*-----------------------
* 
*-----------------------

stop_sample
	rts

*-----------------------
* 
*-----------------------

fin_musique
	rts

*-----------------------
* 
*-----------------------

data_fichiers_musique
	rts

*-----------------------
* T - OK
*-----------------------
* t(ligne%,texte$)
*  A: @texte$
*  Y: ligne%

t	PushWord	#^t	; pointer to string
	pha
	
	tya		; pour MoveTo
	asl
	asl
	asl
	pha		; Y

	PushWord	#0	; get string length
	PushWord	#^t
	pha
	_StringWidth	; return left on stack
	
	lda	#160
	sec
	sbc	1,s
	bpl	t1
	lda	#0
t1	sta	1,s	; X
	_MoveTo
	_DrawString
	rts

*-----------------------
* FIN - OK
*-----------------------

fin
	rts
