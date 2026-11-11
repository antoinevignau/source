*
* Zombi
*
* (c) 1986, Yannick Cadin et Ubisoft
* (c) 2026, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

FIRST_ROOM	=	1	; 62 - salle de démarrage
MAX_SALLE	=	82

NBPERSONNAGES	=	4

iGAUCHE	=	1
iDROITE	=	2
iHAUT	=	3
iBAS	=	4

JOUR_DEBUT	=	1	; 1er jour
HEURE_DEBUT	=	11	; 11h15
MINUTE_DEBUT	=	15
FREQUENCE_TEMPS	=	300	; 300 frames / 60 = 5 secondes

*-----------------------------------
* MACROS
*-----------------------------------

*-----------------------------------
* PRESENTATION
*-----------------------------------

PRESENTATION	lda	#pPRESENT	; get the title page
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	loadFILE
	
	ldx	ptrIMAGE+2	; show it
	ldy	ptrIMAGE
	lda	#TRUE
	jsr	fadeIN

	_ShowCursor
	
	lda	#pSCREEN	; load the screen image
	ldx	ptrPLATEAU+2
	ldy	ptrPLATEAU
	jsr	loadFILE
	
	lda	#pMASK	; load the mask image
	ldx	ptrMASK+2
	ldy	ptrMASK
	jsr	loadFILE
	
]lp	jsr	INKEY	; wait for something
	bcs	]lp
	
	lda	#TRUE	; fade out
	jsr	fadeOUT
	rts

*-----------------------------------
* GAME
*-----------------------------------

PLAY	
REPLAY	jsr	INIT_ALL

	lda	#changeSALLE
	stal	$300
	lda	#^changeSALLE
	stal	$302
		
*-----------------------------------
* MAIN LOOP
*-----------------------------------

	ldx	ptrPLATEAU+2
	ldy	ptrPLATEAU
	lda	#TRUE
	jsr	fadeIN

	inc	fgHORLOGE	; début du temps !

outerLOOP	lda	SALLE
	jsr	loadPICTURE
	
]lp	jsr	INKEY	; wait for something
	bcs	]lp

	cmp	#'1'
	bne	not_1
	lda	#1
	bra	changePERSO

not_1	cmp	#'2'
	bne	not_2
	lda	#2
	bra	changePERSO
	
not_2	cmp	#'3'
	bne	not_3
	lda	#3
	bra	changePERSO
	
not_3	cmp	#'4'
	bne	not_4
	lda	#4

changePERSO	sta	PERSO_CHOISI
	jsr	changePERSONNAGE
	bra	]lp

not_4	cmp	#chrLA
	bne	not_la
	lda	#iGAUCHE
	bra	changeLASALLE

not_la	cmp	#chrRA
	bne	not_ra
	lda	#iDROITE
	bra	changeLASALLE
	
not_ra	cmp	#chrUA
	bne	not_ua
	lda	#iHAUT
	bra	changeLASALLE
	
not_ua	cmp	#chrDA
	bne	not_da
	lda	#iBAS
changeLASALLE	jsr	changeSALLE
	bcs	]lp
	ldy	SALLE
	sty	OLD_SALLE
	sta	SALLE
	bra	outerLOOP

not_da	cmp	#chrDELETE
	bne	]lp
	
	lda	#TRUE
	jsr	fadeOUT
	jmp	QUIT

*-------------------------------
* DEBUG
*-------------------------------

setBORDER	sep	#$20
	ldal	CLOCKCTL
	inc
	stal	CLOCKCTL
	rep	#$20
	rts

*-----------------------------------
* INIT
*-----------------------------------

INIT_ALL	bra	noCLEAR

	ldx	#FIN_DATA-DEBUT_DATA
]lp	stz	DEBUT_DATA,x
	dex
	bpl	]lp

noCLEAR	stz	fgHORLOGE	; on arrête l'horloge
	lda	#JOUR_DEBUT
	sta	JOUR
	lda	#HEURE_DEBUT
	sta	HEURE
	lda	#MINUTE_DEBUT
	sta	MINUTE
	lda	#FREQUENCE_TEMPS
	sta	intTIME+4
	
	lda	#refPLAN_X
	sta	PLAN_X
	lda	#refPLAN_Y
	sta	PLAN_Y
	lda	#refPLAN_INDEX	; on se positionne au bon endroit
	sta	PLAN_INDEX
	jsr	getSALLE	; prend la salle
	sta	SALLE
	
	rts

*-----------------------------------
* ROUTINES DU JEU
*-----------------------------------

*-----------------------------------
* RETOURNE LA PROCHAINE SALLE
*-----------------------------------
* In
*  A: l'index appuyé (1 : gauche, 2 : droite, 3 : haut: 4 : bas)
* Out
*  C: carry set on error
*  A: nouvelle salle
*  X: nouvel index de salle

changeSALLE	sta	I	; l'index
	cmp	#iGAUCHE
	bne	GNS_1

	lda	PLAN_X	; peut-on aller à gauche ?
	cmp	#xPLAN_MIN	; on est au minimum
	beq	GNS_ERR_1	; oui
	lda	PLAN_INDEX
	dec		; non, regarde si la salle
	jsr	getSALLE	; de gauche existe
	bcs	GNS_ERR_1	; non
	dec	PLAN_X	; oui
	brl	GNS_EXIT
GNS_ERR_1	sec
	rts

GNS_1	cmp	#iDROITE
	bne	GNS_2

	lda	PLAN_X	; peut-on aller à droite ?
	cmp	#xPLAN_MAX	; on est au maximum
	beq	GNS_ERR_1	; oui
	lda	PLAN_INDEX
	inc		; non, regarde si la salle
	jsr	getSALLE	; de droite existe
	bcs	GNS_ERR_1	; non
	inc	PLAN_X	; oui
	bra	GNS_EXIT

GNS_2	cmp	#iHAUT
	bne	GNS_3

	lda	PLAN_Y	; on essaye d'abord
	cmp	#yPLAN_MIN	; dans le même niveau
	beq	GNS_2_BIS
	lda	PLAN_INDEX
	sec
	sbc	#xPLAN_MAX	; -8
	jsr	getSALLE
	bcs	GNS_2_BIS
	dec	PLAN_Y	; on avance dans le même niveau
	bra	GNS_EXIT
GNS_2_BIS	lda	PLAN_INDEX	; peut-on monter de niveau ?
	clc
	adc	#PLAN_TAILLE
	cmp	#PLAN_FIN
	bcs	GNS_ERR_2	; non, on est sorti du plan
	jsr	getSALLE	; est-ce que la salle existe ?
	bcs	GNS_ERR_2	; non, sort
	bra	GNS_EXIT	; oui, sort avec succès

GNS_3	cmp	#iBAS
	bne	GNS_ERR_2

	lda	PLAN_Y	; on essaye d'abord
	cmp	#yPLAN_MAX	; dans le même niveau
	beq	GNS_3_BIS
	lda	PLAN_INDEX
	clc
	adc	#xPLAN_MAX	; +8
	jsr	getSALLE
	bcs	GNS_3_BIS
	inc	PLAN_Y	; on recule dans le même niveau
	bra	GNS_EXIT

GNS_3_BIS	lda	PLAN_INDEX	; peut-on descendre de niveau ?
	sec
	sbc	#PLAN_TAILLE
	bmi	GNS_ERR_2	; non, on est sorti du plan
	jsr	getSALLE	; est-ce que la salle existe ?
	bcc	GNS_EXIT	; oui, sort avec succès

GNS_ERR_2	sec
	rts

GNS_EXIT	lda	J	; et tombe dans getSALLE...
	sta	PLAN_INDEX
	
*-----------------------------------
* RETOURNE LA SALLE CHOISIE
*-----------------------------------
* In
*  A: l'index de la salle du plan
* Out
*  C: carry set on error
*  A: room index otherwise

getSALLE	sta	J
	tax
	lda	PLAN,x
	and	#$ff
	beq	GS_1
	clc
	rts
GS_1	sec
	rts

*-----------------------------------
* AFFICHE LES PERSONNAGES
*-----------------------------------

affichePERSONNAGES
	stz	I
	
*-----------------------------------
* AFFICHE UN PERSONNAGE
*-----------------------------------

affichePERSONNAGE

* on doit afficher son icone
	jsr	afficheETATDESANTE
	rts

*-----------------------------------
* AFFICHE L'ETAT DE SANTE DU PERSO
*-----------------------------------

afficheETATDESANTE
	jsr	afficheFORCE
	jsr	afficheHABILETE
	jsr	afficheSANTE
	rts

*-------------------------------
* FORCE DU PERSO
*-------------------------------

afficheFORCE	lda	PERSO_FORCE
	clc
	adc	#rectDEBUT
	sta	rectFORCE_R+6
	sta	rectFORCE_F+2

	PushLong	#rectFORCE_R
	PushLong	#patternCCCC
	_FillRect

	PushLong	#rectFORCE_F
	PushLong	#patternBBBB
	_FillRect
	rts

*-------------------------------
* HABILETE DU PERSO
*-------------------------------

afficheHABILETE	lda	PERSO_HABILETE
	clc
	adc	#rectDEBUT
	sta	rectHABILETE_R+6
	sta	rectHABILETE_F+2

	PushLong	#rectHABILETE_R
	PushLong	#patternCCCC
	_FillRect

	PushLong	#rectHABILETE_F
	PushLong	#patternBBBB
	_FillRect
	rts

*-------------------------------
* SANTE DU PERSO
*-------------------------------

afficheSANTE	lda	PERSO_SANTE
	clc
	adc	#rectDEBUT
	sta	rectSANTE_R+6
	sta	rectSANTE_F+2

	PushLong	#rectSANTE_R
	PushLong	#patternCCCC
	_FillRect

	PushLong	#rectSANTE_F
	PushLong	#patternBBBB
	_FillRect
	rts

*-----------------------------------
* DEFINIT LE RECTANGLE
* D'AFFICHAGE D'UN PERSO
*-----------------------------------

setPERSO_RECT	dec		; 1..7 -> 0..6
	asl
	tax
	lda	tblPERSO_Y1,x
	sta	rectPERSO
	lda	tblPERSO_X1,x
	sta	rectPERSO+2
	lda	tblPERSO_Y2,x
	sta	rectPERSO+4
	lda	tblPERSO_X2,x
	sta	rectPERSO+6
	rts
	

*-----------------------------------
* CHANGE DE PERSONNAGE
*-----------------------------------

changePERSONNAGE
	lda	PERSO_ACTIF	; a-t-on choisi le même
	cmp	PERSO_CHOISI	; personnage ?
	bne	CP_1	; non
	rts		; oui, sort

CP_1	lda	PERSO_ACTIF	; avait-on déjà choisi un perso ?
	beq	CP_2	; non, on saute

	asl		; oui, sauve le valeurs du perso courant
	tax
	ldy	tblPERSO,x
	ldx	#0
]lp	lda	PERSO_ETAT,x
	sta	|$0000,y
	inx
	inx
	iny
	iny
	cpx	#16
	bcc	]lp

CP_2	lda	PERSO_CHOISI	; met le nouveau personnage en place
	sta	PERSO_ACTIF
	asl
	tax
	ldy	tblPERSO,x
	ldx	#0
]lp	lda	|$0000,y
	sta	PERSO_ETAT,x
	inx
	inx
	iny
	iny
	cpx	#16
	bcc	]lp

	jsr	affichePERSONNAGE

	lda	SALLE
	sta	OLD_SALLE
	jmp	loadPICTURE
	
*-----------------------------------
* CODE SPECIFIQUE
*-----------------------------------

*-----------------------------------
* The real INKEY...ou presque
*-----------------------------------

INKEY	jsr	checkREPLAY

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY_NO

*	jsr	checkMUSIC
*	bcc	INKEY

	lda	taskREC
	cmp	#keyDownEvt
	bne	INKEY_NO

	lda	taskMESSAGE
	clc
	rts
INKEY_NO	lda	#FALSE
	sec
	rts

*-----------------------------------
* CHARGE UNE IMAGE
*-----------------------------------

loadPICTURE	and	#$ff
	pha
	PushLong	#strSALLE
	PushWord	#2
	PushWord	#FALSE
	_Int2Dec

	lda	strSALLE
	ora	#'00'
	sta	pIMAGE+19
	
	lda	#pIMAGE
	ldx	ptrLIEUX+2	; ptrUNPACK+2
	ldy	ptrLIEUX	; UNPACK
	jsr	loadFILE

	_HideCursor
	PushLong #imageParamPtr
	_PaintPixels
	_ShowCursor

loadPICTURE99	rts

*---

strSALLE	ds	2	; len max d'une salle
pIMAGE	strl	'8/shr/lieux/lieux00.shr'	; 19

imageParamPtr	adrl	imageToSourceLocInfo
	adrl	imageToDestLocInfo
	adrl	imageToSourceRect
	adrl	imageToDestPoint
	dw	modeCopy	; mode copy
	ds	4

imageToSourceLocInfo
	dw	mode320	; mode 320
	adrl	$00000000	; ptrLIEUX - bank set on entry
	dw	160
	dw	0,0,200,320
	
imageToDestLocInfo
	dw	mode320	; mode 320
	adrl	ptrE12000
	dw	160
	dw	0,0,200,320
	
imageToSourceRect
	dw	0,0,80,160
imageToDestPoint
	dw	48,8

*-----------------------------------
* DATA
*-----------------------------------

pMASK	strl	'8/shr/autres/mask.shr'
pPRESENT	strl	'8/shr/autres/present.shr'
pSCREEN	strl	'8/shr/autres/screen.shr'

*--- Quelques tables

tblPERSO	da	PERSO_ETAT	; 0
	da	PERSO1_ETAT	; 1
	da	PERSO2_ETAT	; 2
	da	PERSO3_ETAT	; 3
	da	PERSO4_ETAT	; 4

*--- Variables

I	ds	2
J	ds	2
K	ds	2
L	ds	2
X	ds	2
Y	ds	2
Z	ds	2
fgHORLOGE	ds	2	; 0: off, <>0: on

*--- Données du jeu

DEBUT_DATA

OLD_SALLE	ds	2	; salle précédente
NBOBJ	ds	2
PERSO_ACTIF	ds	2	; personnage courant : 1 à 4
PERSO_CHOISI	ds	2	; personnage choisi : 1 à 4

PLAN_INDEX	ds	2
PLAN_X	ds	2
PLAN_Y	ds	2

PERSO_ETAT	ds	2	; -1: MORT, 0: VIVANT, 1: MORT-VIVANT
SALLE	ds	2	; quel homme rusé je suis !
PERSO_FORCE	ds	2
PERSO_HABILETE	ds	2
PERSO_SANTE	ds	2
PERSO_OBJETS	ds	4	; 4 objets maxi
	ds	2	; pour faire 16, c'est plus joli
	
PERSO1_ETAT	dw	0	; MORT, 0: VIVANT, 1: MORT-VIVANT, 2: MORT
PERSO1_SALLE	dw	2
PERSO1_FORCE	dw	80
PERSO1_HABILETE	dw	80
PERSO1_SANTE	dw	80
PERSO1_OBJETS	ds	4	; 4 objets maxi
	ds	2

PERSO2_ETAT	dw	0	; MORT, 0: VIVANT, 1: MORT-VIVANT, 2: MORT
PERSO2_SALLE	dw	40
PERSO2_FORCE	dw	30
PERSO2_HABILETE	dw	20
PERSO2_SANTE	dw	10
PERSO2_OBJETS	ds	4	; 4 objets maxi
	ds	2

PERSO3_ETAT	dw	1	; MORT, 0: VIVANT, 1: MORT-VIVANT, 2: MORT
PERSO3_SALLE	dw	62
PERSO3_FORCE	dw	40
PERSO3_HABILETE	dw	50
PERSO3_SANTE	dw	40
PERSO3_OBJETS	ds	4	; 4 objets maxi
	ds	2

PERSO4_ETAT	dw	2	; MORT, 0: VIVANT, 1: MORT-VIVANT, 2: MORT
PERSO4_SALLE	dw	77
PERSO4_FORCE	dw	50
PERSO4_HABILETE	dw	60
PERSO4_SANTE	dw	70
PERSO4_OBJETS	ds	4	; 4 objets maxi
	ds	2

FIN_DATA

*--- End of code