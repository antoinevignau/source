*
* Bill Palmer
*
* (c) 1987, François Coulon
* (c) 2021, Brutal Deluxe
*

         lst   off
         rel
         dsk   palmer.l

         mx    %00
         xc
         xc

*----------------------------------- Macros

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Event.Macs
         use   4/Int.Macs
	 use   4/Line.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
	 use   4/MIDISyn.Macs
         use   4/Misc.Macs
         use   4/Print.Macs
         use   4/Qd.Macs
         use   4/QdAux.Macs
         use   4/Resource.Macs
         use   4/Scrap.Macs
	 use   4/Sound.Macs
         use   4/Std.Macs
         use   4/TextEdit.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*----------------------------------- Constantes

*-------------- Softswitches

RDVBLBAR = $E0C019
GSOS	=	$e100a8

*-------------- GUI

wMAIN	=	1
alertQUIT	=	1
alertRESTART	=	2

refIsPointer = $0
refIsHandle =  $1
refIsResource = $2

appleKey	=	$0100

*--------------

dpFROM	=	$00
dpTO	=	dpFROM+4
Second	=	dpTO+4
dpSTR	=	Second+4
dpBUF	=	dpSTR+4
dpSALLE	=	dpBUF+4

*---

TRUE	=	255
FALSE	=	0

*----------------------------------- Entry point

         phk
         plb

         _TLStartUp
         pha
         _MMStartUp
         pla
         sta   myID

	 tdc
	 sta	myDP
	 
*--- Version du systeme

	jsl	GSOS
	dw	$202a
	adrl	proVERS
	
	lda	proVERS+2
	and	#%01111111_11111111
	cmp	#$0402
        bcs	okVERS

        pha
        PushLong #verSTR1
        PushLong #verSTR2
        PushLong #errSTR1
        PushLong #errSTR2
        _TLTextMountVolume
        pla
        brl	meQUIT1

*--- 64K pour les images des scènes

okVERS   jsr	make64KB
         bcc	okMEM1

koMEM    pha
         PushLong #memSTR1
         PushLong #errSTR2
         PushLong #errSTR1
         PushLong #errSTR2
         _TLTextMountVolume
         pla
         brl   meQUIT1

okMEM1
	sty	ptrIMAGE
	sty	ptrToSourceLocInfo+2
	stx	ptrIMAGE+2
	stx	ptrToSourceLocInfo+4

	sep	#$10		; save ptrIMAGE+2
	stx	saveBACK1+3	; for interactions
	stx	loadBACK1+3	; with the toolbox
	rep	#$10

*--- 64K pour les images compressees et les icônes

        jsr	make64KB
        bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
	stx	ptrICONS+2	; ptrICONS is set to $8000
	stx	iconToSourceLocInfo+4

*--- Chargement des outils

         pha
         pha
         PushWord myID
         PushWord #refIsResource
         PushLong #1
         _StartUpTools
         PullLong SStopREC
         bcc   okTOOL

         pha
         PushLong #tolSTR1
         PushLong #errSTR2
         PushLong #errSTR1
         PushLong #errSTR2
         _TLTextMountVolume
         pla
         brl   meQUIT

*--- Et la musique...

okTOOL  
	 jsr	initMIDI

*--- Charge les images nécessaires du jeu

	lda	#pICONS
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	okMEM2

	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT1

okMEM2
	tya
	jsr	unpackLZ4

	PushLong ptrIMAGE
	PushLong ptrICONS
	PushLong #32768
	_BlockMove
	
*--- Affichage desktop

	 _HideMenuBar
	 
         PushWord #0
         PushWord #%11111111_11111111
         PushWord #0
         _FlushEvents
         pla

	 _InitCursor

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

memOK
	PushLong #0
	PushWord #5	; SetDeskPat
	PushWord #$4000
	PushWord #$00F0
	_Desktop
	pla
	pla

	pha
	pha
	PushLong #0
	PushLong #wMAIN
	PushLong #PAINTMAIN
	PushLong #0
	PushWord #refIsResource
	PushLong #wMAIN
	PushWord #$800e
	_NewWindow2
	PullLong wiMAIN

*----------------------------------------
* DEBUT DU JEU
*----------------------------------------

	jsr	debut
	jsr	chargement_image
	jsr	doSOUNDON

*----------------------------------------
* TASK MASTER
*----------------------------------------

taskLOOP
	PushWord #0
	PushWord #0
	PushWord #$c000
	PushWord #0
	_HandleDiskInsert
	pla
	pla

	jsr	checkREPLAY

	PushWord #0
	PushWord #%11111111_11111111
	PushLong #taskREC
	_TaskMaster
	pla
	beq	taskLOOP
	 
        asl
        tax
	jsr	(taskTBL,x)
	
	lda	instruction1
	ora	instruction2
	ora	instructionDIR
	ora	zone_cliquee
	beq	taskLOOP99

	jsr	commentaires
	jsr	directions		; clr instructionDIR
	jsr	actions_permanentes
	
	lda	instruction1
	beq	taskLOOP99
	
	lda	salle
	asl
	tax
	jsr	(lessalles,x)

taskLOOP99
	stz	zone_cliquee
	stz	instruction2
	
	jsr	chargement_image
	bra	taskLOOP

*----------------------------------- Gestion du keyDown
* on gère les directions et les open-apple-qqch

doKEYDOWN
	lda	taskMODIFIERS
	and	#appleKey
	cmp	#appleKey
	beq	doOPENAPPLE

*--- gère les directions

	lda	taskMESSAGE
	ldx	#nord
	cmp	#$0b
	beq	keydownOK
	ldx	#sud
	cmp	#$0a
	beq	keydownOK
	ldx	#gauche
	cmp	#$08
	beq	keydownOK
	ldx	#droite
	cmp	#$15
	beq	keydownOK
	rts
keydownOK
	stx	instructionDIR
	rts

*--- gère les open-apple-qqch

doOPENAPPLE
	ldx	#-1
	sep	#$20
]lp	inx
	lda	tblKEYVALUE,x	; get key
	cmp	#$ff		; end of table
	beq	doOPENAPPLE99	; so exit
	cmp	taskMESSAGE	; same as pressed key?
	bne	]lp		; no, loop
	
	rep	#$20
	txa
        asl
        tax
        jmp	(tblKEYADDRESS,x)

doOPENAPPLE99
doNOT
	rep	#$20
	rts

*---
* Main / Oreille / Bouche sont pris également ! ! !

tblKEYVALUE
	asc	'QqLlSs??'
	asc	'Dd'
	asc	'Cc'
	asc	'Zz'
	hex	ff
	
tblKEYADDRESS
	da	doQUIT,doQUIT,doLOAD,doLOAD,doSAVE,doSAVE,doCOPYRIGHT,doCOPYRIGHT
	da	doRESTART,doRESTART
	da	doCHEAT,doCHEAT		; cheat mode
	da	doMUSIK,doMUSIK
	
*----------------------------------- Gestion du mouseUp
* on compare les coordonnées avec celles du incontent
* si dans le même rectangle, on traite

doMOUSEUP
	jsr	test_icone
	jmp	test_zone
	
*----------------------------------- Gestion des controles

doCONTROL
	lda	taskREC+38
	asl
	tax
	jmp	(ctrlTBL,x)

*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN
	PushLong wiMAIN
	_DrawControls

* BOX 1,161,318,198

	PushWord #1
	PushWord #160
	_MoveTo
	
	PushWord #317
	PushWord #160
	_LineTo
	
	PushWord #317
	PushWord #198
	_LineTo
	
	PushWord #1
	PushWord #198
	_LineTo
	
	PushWord #1
	PushWord #160
	_LineTo

* BOX 1,1,273,110

	PushWord #1
	PushWord #1
	_MoveTo
	
	PushWord #273
	PushWord #1
	_LineTo
	
	PushWord #273
	PushWord #110
	_LineTo
	
	PushWord #1
	PushWord #110
	_LineTo
	
	PushWord #1
	PushWord #1
	_LineTo

	rtl
	
*----------------------------------------
* ACTIONS DES CONTROLES DU JEU
*----------------------------------------

doNORD
doSUD
doGAUCHE
doDROITE
doEXIT
	lda	taskREC+38
	sta	instructionDIR
	rts

*--- Main

doMAIN
	lda	fgMAIN
	eor	#1
	sta	fgMAIN
	
	lda	fgMAIN
	ldx	#main
	stx	instruction1
	jsr	setCTLVALUE

	lda	fgMAIN
	bne	mainOK

	stz	instruction1
	ldx	#main
	jmp	invalCTL
	
mainOK
	stz	fgOEIL
	stz	fgBOUCHE
	
	lda	#FALSE		; plus de oeil
	ldx	#oeil
	jsr	setCTLVALUE
	ldx	#oeil
	jsr	invalCTL

	lda	#FALSE		; plus de bouche
	ldx	#bouche
	jsr	setCTLVALUE
	ldx	#bouche
	jmp	invalCTL

*--- Oeil

doOEIL
	lda	fgOEIL
	eor	#1
	sta	fgOEIL
	
	lda	fgOEIL
	ldx	#oeil
	stx	instruction1
	jsr	setCTLVALUE

	lda	fgOEIL
	bne	oeilOK

	stz	instruction1
	ldx	#oeil
	jmp	invalCTL
	
oeilOK
	stz	fgMAIN
	stz	fgBOUCHE
	
	lda	#FALSE		; plus de main
	ldx	#main
	jsr	setCTLVALUE
	ldx	#main
	jsr	invalCTL

	lda	#FALSE		; plus de bouche
	ldx	#bouche
	jsr	setCTLVALUE
	ldx	#bouche
	jmp	invalCTL

*--- Bouche

doBOUCHE
	lda	fgBOUCHE
	eor	#1
	sta	fgBOUCHE
	
	ldx	#bouche		; on force la bouche
	stx	instruction1
	jsr	setCTLVALUE	; et on met la value dans le controle

	lda	fgBOUCHE	; et on a quoi en valeur
	bne	boucheOK	; 1 = on va invalider les autres

	stz	instruction1
	ldx	#bouche		; 0 = on s'invalide
	jmp	invalCTL

boucheOK
	stz	fgMAIN
	stz	fgOEIL
	
	lda	#FALSE		; plus de main
	ldx	#main
	jsr	setCTLVALUE
	ldx	#main
	jsr	invalCTL
	
	lda	#FALSE		; plus d'oeil
	ldx	#oeil
	jsr	setCTLVALUE
	ldx	#oeil
	jmp	invalCTL

*--- Play with controls

getCTLVALUE
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0000
	phx
	_GetCtlValueByID
	pla
	rts

setCTLVALUE
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	phx
	_SetCtlValueByID
	rts

invalCTL
	pea	$0000		; space for result
	pea	$0000
	pea	$0000		; top window
	pea	$0000
	pea	$0000		; ID value for desired control
	phx
	_GetCtlHandleFromID
	_DrawOneCtl
	rts

*---

fgMAIN	ds	2
fgOEIL	ds	2
fgBOUCHE	ds	2

*----------------------------------------
* CODE DU JEU
*----------------------------------------

actions_permanentes
	lda	instruction1		; quelle action ?
	cmp	#oeil
	bne	ap5			; ce n'est pas un oeil

* cliquer sur un objet avec une instruction avant (que l'on limite à l'oeil)

ap1	lda	instruction2		; est-on sur un objet ?
	bne	ap2
	rts
ap2	cmp	#nombre_objets		; oeil + objet
	bcc	ap3			; ne teste pas animation
	rts

ap3	tax				; objet visible ?
	lda	objet_apparu-1,x
	and	#$ff
	bne	ap4
	rts

ap4	txa				; get address of description
	dec
	asl
	tax
	lda	description_objet,x
	jmp	ecriture		; output it

* cliquer sur un objet sans instruction avant

ap5	lda	instruction1		; on ne doit pas avoir
	beq	ap6			; d'action active
	rts

ap6	lda	instruction2		; est-on sur un objet ?
	bne	ap7
	rts
ap7	cmp	#nombre_objets
	bcc	ap8			; ne teste pas animation
	rts

ap8	tax
	lda	objet-1,x		; a-t-on pris l'objet ?
	and	#$ff
	cmp	#objet_pris
	bne	ap9
	
	sep	#$20			; on pose l'objet
	lda	salle
	sta	objet-1,x
	rep	#$20
	jmp	inversion_icone

* on n'a pas pris l'objet

ap9	cmp	salle			; on est dans la meme salle ?
	bne	ap10
	
	sep	#$20			; si on est dans la bonne salle
	lda	#objet_pris
	sta	objet-1,x
	rep	#$20
	jmp	affichage_icone

ap10	rts
	
*--- Teste si on a cliqué sur un objet

test_icone
	stz	instruction2
	
	lda	#0			; from 1
]lp	pha
	asl
	asl
	asl
	tax
	lda	taskWHERE+2		; compare le X
	cmp	icones_coordonnees,x
	bcc	icone_ko
	lda	icones_coordonnees+4,x
	cmp	taskWHERE+2
	bcc	icone_ko
	
	lda	taskWHERE		; et le Y
	cmp	icones_coordonnees+2,x
	bcc	icone_ko
	lda	icones_coordonnees+6,x
	cmp	taskWHERE
	bcc	icone_ko
	
	pla				; on a notre icône
	inc
	sta	instruction2
	rts

icone_ko
	pla
	inc
	cmp	#nombre_objets		; et non plus nombre_icones
	bcc	]lp
	rts

*---

test_zone
	stz	zone_cliquee
	
	lda	salle
	dec
	asl
	tax
	lda	table_salle,x
	sta	dpSALLE		; salle1 à salle56
	
	ldy	#0
	lda	(dpSALLE),y
	sta	nb_zones

	lda	dpSALLE		; pointe sur les coordonnees de la première zone
	clc
	adc	#10
	sta	dpSALLE
	
	lda	#0
]lp	pha

	ldy	#0
	lda	taskWHERE+2		; compare le X
	cmp	(dpSALLE),y
	bcc	zone_ko
	ldy	#4
	lda	(dpSALLE),y
	cmp	taskWHERE+2
	bcc	zone_ko
	
	ldy	#2
	lda	taskWHERE		; et le Y
	cmp	(dpSALLE),y
	bcc	zone_ko
	ldy	#6
	lda	(dpSALLE),y
	cmp	taskWHERE
	bcc	zone_ko

	pla
	inc
	sta	zone_cliquee
	rts
	
zone_ko
	lda	dpSALLE		; pointe sur la prochaine zone
	clc
	adc	#14
	sta	dpSALLE
	
	pla
	inc
	cmp	nb_zones	; to nb_zones
	bcc	]lp
	rts

nb_zones	ds	2

*---

commentaires
	lda	zone_cliquee
	bne	comm1
	rts

comm1
	ldy	#0		; index du pointeur du commentaire dans la zone
	lda	instruction1
	cmp	#main
	beq	comm2
	ldy	#2
	cmp	#oeil
	beq	comm2
	ldy	#4
	cmp	#bouche
	beq	comm2
	rts

comm2
	lda	salle
	dec
	asl
	tax
	lda	table_salle,x
	clc
	adc	#18		; pointe sur les pointeurs des commentaires de la premiere zone
	sta	dpSALLE		; salle1 à salle56
	
	lda	#0		; on fait +14 X fois
	ldx	zone_cliquee	; X est l'index de la zone cliquée
]lp	dex
	beq	comm3
	clc
	adc	#14
	bra	]lp

comm3
	clc			; on met à jour le pointeur
	adc	dpSALLE
	sta	dpSALLE
	
	lda	(dpSALLE),y	; et on retourne le pointeur vers le commentaire main/oeil/bouche
	jmp	ecriture

*---

apparition_objet	; X is object, A is string
	pha
	
	lda	objet_apparu-1,x
	and	#$ff
	bne	do99	; = TRUE, ie <> 0
	
	sep	#$20
	lda	salle
	sta	objet-1,x
	lda	#TRUE
	sta	objet_apparu-1,x
	rep	#$20
	
	jsr	inversion_icone
	bra	fin_objet

*---

disparition_objet	; X is object
	pha
	
	lda	objet_apparu-1,x
	and	#$ff
	beq	do99

	sep	#$20
	lda	#objet_detruit
	sta	objet-1,x
	rep	#$20
	
	jsr	disparition_icone
	
*---

fin_objet
	pla
	jmp	ecriture
do99	pla
	rts
	
*---

directions
	lda	salle
	cmp	#38
	bne	dire1
	lda	instructionDIR	; 1
	cmp	#droite
	bne	dire1
	
	lda	#di_str1
	jsr	ecriture

dire1
	lda	salle
	cmp	#36
	bne	dire2
	lda	instructionDIR	; 1
	cmp	#nord
	bne	dire2
	
	lda	#di_str2
	jsr	ecriture

dire2
	lda	salle
	cmp	#22
	bne	dire3
	lda	instructionDIR	; 1
	cmp	#gauche
	bne	dire3
	
	lda	#di_str3
	jsr	ecriture

dire3
	lda	salle
	cmp	#21
	bne	dire4
	lda	instructionDIR	; 1
	cmp	#gauche
	bne	dire4
	
	lda	#di_str4
	jsr	ecriture

dire4
	lda	salle
	cmp	#11
	bne	dire5
	lda	instructionDIR	; 1
	cmp	#droite
	bne	dire5
	
	lda	#di_str5
	jsr	ecriture

dire5
	lda	instructionDIR	; 1
	cmp	#nord
	bcc	dire6
	lda	#droite
	cmp	instructionDIR	; 1
	bcc	dire6

	lda	salle		; salle
	dec			; - 1
	asl			; *2 parce que 16-bits
	tax
	lda	table_salle,x	; pointe sur les données de la salle
	inc
	inc
	sta	dpSALLE		; pointe sur le tableau des directions
	
	lda	instructionDIR	; instruction1
	sec
	sbc	#nord		; - première direction
	asl			; *2 parce que 16-bits
	tay
	lda	(dpSALLE),y	; récupère la prochaine salle
	beq	direNOSALLE	; 0 = pas de salle
	sta	salle
direNOSALLE
	stz	instructionDIR	; 1
	
dire6
	lda	salle
	cmp	#25
	bne	dire7
	ldx	#elephant_enfuis
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	dire7
	
	lda	#26
	sta	salle

dire7
	lda	salle
	cmp	#28
	bne	dire8
	ldx	#mechant_assome
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	dire8
	
	lda	#27
	sta	salle
	
dire8
	lda	salle
	cmp	#29
	bne	dire9
	ldx	#mechant_assome
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	dire9
	
	lda	#30
	sta	salle
	
dire9
	lda	salle
	cmp	#32
	bne	dire10
	ldx	#mechant_assome
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	dire10
	
	lda	#31
	sta	salle
	
dire10
	lda	salle
	cmp	#34
	bne	dire11
	ldx	#feu_allume
	lda	indicateur-1,x
	and	#$ff
	cmp	#TRUE
	bne	dire11
	
	lda	#35
	sta	salle
	
dire11
	lda	salle
	cmp	#36
	bne	dire12
	ldx	#photo_montree
	lda	indicateur-1,x
	and	#$ff
	cmp	#FALSE
	bne	dire12
	
	lda	#33
	sta	salle

dire12
	rts
	
*---

di_str1	str	'Mieux vaudrait ne pas suivre le Professeur...'
di_str2	str	'Il n'27'y a qu'2788' pousser la porte... (auriez-vous peur de quelque chose ?)'
di_str3	str	'Bill saute facilement du train et attend que celui-ci reparte'
di_str4	str	'Ce genre de saut ne marche que dans les films...'
di_str5	str	'Bill s'27'envole pour l'27'Afrique'

*---

disparition_icone	; X is object
	cpx	#0
	beq	di1
	txa
	dec
	asl
	asl
	asl		; because we are 16-bit
	tax
	lda	icones_coordonnees+2,x
	sta	diRECT
	lda	icones_coordonnees,x
	sta	diRECT+2
	lda	icones_coordonnees+6,x
	sta	diRECT+4
	lda	icones_coordonnees+4,x
	sta	diRECT+6

	_HideCursor
	PushLong #diRECT
	_EraseRect
	_ShowCursor
di1
	rts

diRECT	ds	8

	rts
	
*---

affichage_icone		; X is object
	cpx	#0
	beq	ai1
	txa
	dec
	asl
	asl
	asl		; because we are 16-bit
	tax
	lda	icones_coordonnees+2,x
	sta	iconToSourceRect
	sta	iconToDestPoint
	lda	icones_coordonnees,x
	sta	iconToSourceRect+2
	sta	iconToDestPoint+2
	lda	icones_coordonnees+6,x
	sta	iconToSourceRect+4
	lda	icones_coordonnees+4,x
	sta	iconToSourceRect+6

	_HideCursor
	PushLong #iconParamPtr
	_PaintPixels
	_ShowCursor
	
ai1
	rts

*---

iconParamPtr
	adrl	iconToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	iconToSourceRect
	adrl	iconToDestPoint
	dw	$0000	; mode copy
	ds	4

iconToSourceLocInfo
	dw	$0000	; mode 320
	adrl	$8000	; ptrICON - $8000 on entry, high set after _NewHandle
	dw	160
	dw	0,0,199,319
	
iconToDestLocInfo
	dw	$0000	; mode 320
	adrl	$012000
	dw	160
	dw	0,0,199,319
	
iconToSourceRect
	dw	3,0,109,272
iconToDestPoint
	dw	3,0

*---

inversion_icone		; X is object
	cpx	#0
	beq	ii1
	phx
	jsr	affichage_icone
	pla
	dec
	asl
	asl
	asl		; because we are 16-bit
	tax
	lda	icones_coordonnees+2,x
	sta	iiRECT
	lda	icones_coordonnees,x
	sta	iiRECT+2
	lda	icones_coordonnees+6,x
	sta	iiRECT+4
	lda	icones_coordonnees+4,x
	sta	iiRECT+6

	_HideCursor
	PushLong #iiRECT
	_InvertRect
	_ShowCursor

ii1
	rts

iiRECT	ds	8

*---

affichage_objets
	ldx	#1
]lp	phx
	jsr	disparition_icone
	
	plx
	phx
	lda	objet-1,x
	and	#$ff
	cmp	salle
	bne	ao_1
	jsr	inversion_icone
	bra	ao_2

ao_1
	cmp	#objet_pris
	bne	ao_2
	jsr	affichage_icone

ao_2
	plx
	inx
	cpx	#nombre_objets	; to 20 - do not want the animation icon
	bcc	]lp
	rts

*---

ecriture
	sta	dpFROM
	
	lda	(dpFROM)	; get length of string
	and	#$ff
	bne	ecriture1
	rts

ecriture1
	pea	#^strVIDE	; get pointer to string
	ldx	dpFROM
	inx
	phx
	pha			; push length
	PushLong #myRECT
	PushWord #0	; left justified
	_LETextBox2
	rts

myRECT	dw	161
	dw	2
	dw	198
	dw	317

*---

chargement_image
	lda	salle
	cmp	ancienne_salle
	bne	ci_ok
	rts
ci_ok
	sta	ancienne_salle

	jsr	reset_icones		; etat initial
	jsr	affichage_objets	; affiche les objets
	jmp	affichage_image		; charge l'image
*	lda	#strVIDE		; plus de texte
*	jmp	ecriture

*---

affichage_image
	PushWord salle
	PushLong #tempSTR
	PushWord #2
	PushWord #0
	_Int2Dec

	lda	tempSTR
	ora	#'00'
	sta	pIMAGE+10
	jmp	decompression_image
	
tempSTR	ds	4	

*---

decompression_image
	lda	#pIMAGE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	di_err
	
decompression_image_cheat

	lda	proREAD+12
	jsr	unpackLZ4

	_HideCursor
	PushLong #paintParamPtr
	_PaintPixels
	
	PushWord #0
	lda	ptrIMAGE+2
	pha
	lda	ptrIMAGE
	clc
	adc	#$7e00
	pha
	_SetColorTable
	
	jsr	showCHEAT	; the cheat mode
	
	_ShowCursor

di_err
	rts

paintParamPtr
	adrl	ptrToSourceLocInfo
	adrl	ptrToDestLocInfo
	adrl	ptrToSourceRect
	adrl	ptrToDestPoint
	dw	$0000	; mode copy
	ds	4

ptrToSourceLocInfo
	dw	$0000	; mode 320
	ds	4	; ptrIMAGE
	dw	160
	dw	0,0,199,319
	
ptrToDestLocInfo
	dw	$0000	; mode 320
	adrl	$012000
	dw	160
	dw	0,0,199,319
	
ptrToSourceRect
	dw	3,0,109,272
ptrToDestPoint
	dw	3,0

*---

fin
	jsr	ecriture
	jsr	debut

	lda	#5
	jmp	nowWAIT
	
*---

debut
	sep	#$20

	ldx	#nombre_objets
	lda	#objet_inexistant
]lp	sta	objet-1,x
	dex
	bne	]lp
	
	ldx	#nombre_objets
	lda	#FALSE
]lp	sta	objet_apparu-1,x
	dex
	bne	]lp
	
	ldx	#nombre_indicateurs
]lp	sta	indicateur-1,x
	dex
	bne	]lp

	rep	#$20
	
	lda	#4
	sta	salle
	stz	ancienne_salle

*---

reset_icones

	stz	instruction1
	stz	instruction2
	stz	instructionDIR
	stz	zone_cliquee
	
	stz	fgMAIN
	stz	fgOEIL
	stz	fgBOUCHE
	
	ldx	#main
	lda	#FALSE
	jsr	setCTLVALUE
	ldx	#oeil
	lda	#FALSE
	jsr	setCTLVALUE
	ldx	#bouche
	lda	#FALSE
	jsr	setCTLVALUE

	ldx	#main
	jsr	invalCTL
	ldx	#oeil
	jsr	invalCTL
	ldx	#bouche
	jmp	invalCTL
	
*----------------------------------------

*--- Donnees du jeu

salle	ds	2
ancienne_salle	ds	2
instruction1	ds	2
instruction2	ds	2
instructionDIR	ds	2
zone_cliquee	ds	2

*----------------------------------- Copyright

doCOPYRIGHT
	lda	#0
]lp	pha
	asl
	tax
	lda	message,x
	jsr	ecriture
	
	lda	#3	; 150 ms / 50 (GFA) = 3 secondes
	jsr	nowWAIT
	
	pla
	inc
	cmp	#nombre_messages
	bcc	]lp
	rts
	
*----------------------------------- Open

doLOAD
	jsr	doSOUNDOFF
	jsr	saveBACK
	
	PushWord #30
	PushWord #43
	PushLong #strLOADFILE
	PushLong #0
	PushLong #typeLIST
	PushLong #replyPTR
	_SFGetFile

	jsr	loadBACK
	jsr	doSOUNDON
	
	lda	replyPTR
	bne	doLOAD1
	rts

doLOAD1
	jsr	copyPATH
	jsr	loadALL
	
	stz	ancienne_salle
	stz	instruction1
	stz	instruction2
	stz	instructionDIR

	jsr	reset_icones
	
	lda	#strVIDE
	jmp	ecriture

*----------------------------------- Save

doSAVE
	jsr	doSOUNDOFF
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
	jsr	doSOUNDON
	
	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1
	jsr	copyPATH
	jsr	saveALL
	
	lda	#strVIDE
	jmp	ecriture
	
*--- Recopie le filename du fichier de sauvegarde

copyPATH
	sep	#$20
	ldx	#16-1
]lp	lda	namePATH1,x
	sta	pGAME+4,x
	dex
	bpl	]lp
	
	lda	namePATH
	inc
	inc
	sta	pGAME
	rep	#$20
	rts

*--- Charge le fichier de sauvegarde en mémoire

loadALL
	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	loadKO99

	lda	proOPENGAME+2
	sta	proREADGAME+2
	sta	proCLOSE+2
	
	jsr	loadPART
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadKO99
	rts

*---

loadPART
	ldx	#nombre_indicateurs
	ldy	#indicateur
	jsr	loadIT
	
	ldx	#nombre_objets
	ldy	#objet
	jsr	loadIT
	
	ldx	#nombre_objets
	ldy	#objet_apparu
	jsr	loadIT
	
	ldx	#1
	ldy	#salle

loadIT
	stx	proREADGAME+8
	sty	proREADGAME+4
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME
	rts


*--- Enregistre le fichier de sauvegarde

saveALL
	jsl	GSOS
	dw	$2002
	adrl	proDESTROYGAME
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATEGAME
	bcs	saveKO99

	jsl	GSOS
	dw	$2010
	adrl	proOPENGAME
	bcs	saveKO99

	lda	proOPENGAME+2
	sta	proWRITEGAME+2
	sta	proCLOSE+2
	
	jsr	savePART
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

saveKO99
	rts

*---

savePART
	ldx	#nombre_indicateurs
	ldy	#indicateur
	jsr	saveIT
	
	ldx	#nombre_objets
	ldy	#objet
	jsr	saveIT
	
	ldx	#nombre_objets
	ldy	#objet_apparu
	jsr	saveIT
	
	ldx	#1
	ldy	#salle

saveIT
	stx	proWRITEGAME+8
	sty	proWRITEGAME+4
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME
	rts

*----------------------------------- Restart

doRESTART
	jsr	saveBACK
	
	PushWord #0
	PushWord #5
	PushLong #0
	PushLong #alertRESTART
	_AlertWindow
	
	jsr	loadBACK
	
	pla
	beq	re1
	rts

re1
	jmp	debut

*-----------------------------------

doCHEAT
	lda	fgCHEAT
	eor	#1
	sta	fgCHEAT
	
	jmp	decompression_image_cheat

*---

showCHEAT
	lda	fgCHEAT
	bne	showCHEAT1
	rts

showCHEAT1
	lda	salle
	dec
	asl
	tax
	lda	table_salle,x
	sta	dpSALLE		; salle1 à salle56
	
	ldy	#0
	lda	(dpSALLE),y
	sta	nb_zones

	lda	dpSALLE		; pointe sur les coordonnees de la première zone
	clc
	adc	#10
	sta	dpSALLE
	
	lda	#0
]lp	pha

	ldy	#0
	lda	(dpSALLE),y	; X1
	sta	frameRECT+2
	ldy	#2
	lda	(dpSALLE),y	; Y1
	sta	frameRECT
	ldy	#4
	lda	(dpSALLE),y	; X2
	sta	frameRECT+6
	ldy	#6
	lda	(dpSALLE),y	; Y2
	sta	frameRECT+4

	PushLong #frameRECT
	_FrameRect
	
*---

	lda	dpSALLE		; pointe sur la prochaine zone
	clc
	adc	#14
	sta	dpSALLE
	
	pla
	inc
	cmp	nb_zones	; to nb_zones
	bcc	]lp
	rts

*---

fgCHEAT	ds	2

frameRECT
	ds	8

*----------------------------------- Quit

doQUIT
	jsr	saveBACK
	
	PushWord #0
	PushWord #5
	PushLong #0
	PushLong #alertQUIT
	_AlertWindow
	
	jsr	loadBACK
	
	pla
	beq	meQUIT
	rts

*----------------------------------- Quit

meQUIT
	jsr	stopMIDI

	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1	PushWord myID
	_DisposeAll

	PushWord myID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------------------
* MEMOIRE
*----------------------------------------

make64KB pha
         pha
         PushLong #$010000
         PushWord myID
         PushWord #%11000000_00011100
         PushLong #0
         _NewHandle
         phd
         tsc
         tcd
         lda   [3]
         tax		; low in X
         ldy   #2
         lda   [3],y
	 txy		; low in Y
         tax		; high in X
         pld
         pla		; we do not keep track of the handle
         pla
         rts

*----------------------------------------
* GFX
*----------------------------------------

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrDG: temp unpack zone
*
* Entry:
*  A: packed data size
*
* Exit:
*  A: unpacked data size
*
*----------------------------

unpackLZ4
	sta	LZ4_Limit+1
	
	jsr	suspendMUSIC
	sep	#$20

*--- Source

         lda   ptrUNPACK+2
         sta   LZ4_Literal_3+2
         sta   LZ4_ReadToken+3
         sta   LZ4_Match_1+3
         sta   LZ4_GetLength_1+3

*--- Destination

         lda   ptrIMAGE+2
         sta   LZ4_Literal_3+1
         sta   LZ4_Match_5+1
         sta   LZ4_Match_5+2

         rep   #$20

* REP #$30
* STY LZ4_Limit+1

*--

         ldy   #0         ; Init Target unpacked Data offset
         ldx   #16        ; Offset after header

LZ4_ReadToken LDAL $AA0000,X ; Read Token Byte
         INX
         STA   LZ4_Match_2+1

*----------------

LZ4_Literal AND #$00F0    ; >>> Process Literal Bytes <<<
         BEQ   LZ4_Limit  ; No Literal
         CMP   #$00F0
         BNE   LZ4_Literal_1
         JSR   LZ4_GetLengthLit ; Compute Literal Length with next bytes
         BRA   LZ4_Literal_2
LZ4_Literal_1 LSR         ; Literal Length use the 4 bit
         LSR
         LSR
         LSR

LZ4_Literal_2 DEC         ; Copy A+1 Bytes
LZ4_Literal_3 MVN $AA,$BB ; Copy Literal Bytes from packed data buffer
         PHK              ; X and Y are auto incremented
         PLB

*----------------

LZ4_Limit CPX  #$AAAA     ; End Of Packed Data buffer ?
         BEQ   LZ4_End

*----------------

LZ4_Match TYA             ; >>> Process Match Bytes <<<
         SEC
LZ4_Match_1 SBCL $AA0000,X ; Match Offset
         INX
         INX
         STA   LZ4_Match_4+1

LZ4_Match_2 LDA #$0000    ; Current Token Value
         AND   #$000F
         CMP   #$000F
         BNE   LZ4_Match_3
         JSR   LZ4_GetLengthMat ; Compute Match Length with next bytes
LZ4_Match_3 CLC
         ADC   #$0003     ; Minimum Match Length is 4 (-1 for the MVN)

         PHX
LZ4_Match_4 LDX #$AAAA    ; Match Byte Offset
LZ4_Match_5 MVN $BB,$BB   ; Copy Match Bytes from unpacked data buffer
         PHK              ; X and Y are auto incremented
         PLB
         PLX
         BRA   LZ4_ReadToken

*----------------

LZ4_GetLengthLit LDA #$000F ; Compute Variable Length (Literal or Match)
LZ4_GetLengthMat STA LZ4_GetLength_2+1
LZ4_GetLength_1 LDAL $AA0000,X ; Read Length Byte
         INX
         AND   #$00FF
         CMP   #$00FF
         BNE   LZ4_GetLength_3
         CLC
LZ4_GetLength_2 ADC #$000F
         STA   LZ4_GetLength_2+1
         BRA   LZ4_GetLength_1
LZ4_GetLength_3 ADC LZ4_GetLength_2+1
         RTS

*----------------

LZ4_End	sty	lenDATA		; Y = length of unpacked data
	jmp	resumeMUSIC

*---

lenDATA	ds	4

*-----------------------------------
* SAVE THE SHR SCREEN
*-----------------------------------

saveBACK
	_HideCursor

	ldx	#$8000-2
]lp	ldal	$e12000,x
saveBACK1
	stal	$008000,x
	dex
	dex
	bpl	]lp
	
exitBACK	_ShowCursor
	rts

*-----------------------------------
* RESTORE THE SHR SCREEN
*-----------------------------------

loadBACK
	_HideCursor

	ldx	#$8000-2
loadBACK1
	ldal	$008000,x
	stal	$012000,x
	stal	$e12000,x
	dex
	dex
	bpl	loadBACK1
	bmi	exitBACK

*----------------------------
* nowWAIT
*  Wait A seconds
*
* Entry:
*  A: nb of seconds to wait
*
* Exit:
*  A/X: scrambled
*
*----------------------------

nowWAIT  dec
         tax
         lda   #0
]lp      clc
         adc   #60
         cpx   #0
         beq   nowWAIT1
         dex
         bra   ]lp

nowWAIT1 pha
]lp      ldal  RDVBLBAR-1
         bpl   ]lp
]lp      ldal  RDVBLBAR-1
         bmi   ]lp

         pla
         dec
         bne   nowWAIT1
         sec
         rts

*----------------------------------------
* DATA
*----------------------------------------

*----------------------- Fenetres

wiMAIN	ds	4

*----------------------- Memory manager

myID	ds	2
myDP	ds	2

SStopREC	ds	4

ptrIMAGE	ds	4	; where a scene image is loaded
ptrUNPACK	ds	4	; where the background picture is laoded
ptrICONS	adrl	$8000	; where the icons are stored (ptrBACKGROUND+$8000)

fgLOAD   ds    2
fgSAVE   ds    2

temp     ds    2

*----------------------- Tool locator

verSTR1  str   'System 6.0.1 Required!'
verSTR2  str   'Press a key to quit'
tolSTR1  str   'Error while loading tools'
memSTR1  str   'Cannot allocate memory'
filSTR1  str   'Cannot load file'
errSTR1  str   'Quit'
errSTR2  str   ''

*----------------------- Window manager

taskREC  ds    2          ; wmWhat           +0
taskMESSAGE ds 4          ; wmMessage        +2
taskWHEN ds    4          ; wmWhen           +6
taskWHERE ds   4          ; wmWhere          +10
taskMODIFIERS ds 2        ; wmModifiers      +14
taskDATA ds    4          ; wmTaskData       +16
         adrl  $001fffff  ; wmTaskMask       +20
         ds    4          ; wmLastClickTick  +24
         ds    2          ; wmClickCount     +28
         ds    4          ; wmTaskData2      +30
         ds    4          ; wmTaskData3      +34
         ds    4          ; wmTaskData4      +38
         ds    4          ; wmLastClickPt    +42

taskTBL  da    doNOT      ; Null
         da    doNOT      ; mouseDownEvt
         da    doMOUSEUP  ; mouseUpEvt
         da    doKEYDOWN  ; keyDownEvt
         da    doNOT
         da    doNOT      ; autoKeyEvt
         da    doNOT      ; updateEvt
         da    doNOT
         da    doNOT      ; activateEvt
         da    doNOT      ; switchEvt
         da    doNOT      ; deskAccEvt
         da    doNOT      ; driverEvt
         da    doNOT      ; app1Evt
         da    doNOT      ; app2Evt
         da    doNOT      ; app3Evt
         da    doNOT      ; app4Evt
         da    doNOT      ; wInDesk
         da    doNOT      ; wInMenuBar
         da    doNOT      ; wCLickCalled
         da    doNOT      ; wInContent - was doCONTENT
         da    doNOT      ; wInDrag
         da    doNOT      ; wInGrow
         da    doNOT      ; wInGoAway
         da    doNOT      ; wInZoom
         da    doNOT      ; wInInfo
         da    doNOT      ; wInSpecial
         da    doNOT      ; wInDeskItem
         da    doNOT      ; wInFrame
         da    doNOT      ; wInactMenu
         da    doNOT      ; wInClosedNDA
         da    doNOT      ; wInCalledSysEdit
         da    doNOT      ; wInTrackZoom
         da    doNOT      ; wInHitFrame
         da    doCONTROL  ; wInControl
         da    doNOT      ; wInControlMenu

ctrlTBL	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNOT
	da	doNORD
	da	doSUD
	da	doGAUCHE
	da	doDROITE
	da	doMAIN
	da	doOEIL
	da	doBOUCHE
	da	doCOPYRIGHT
	da	doSAVE
	da	doLOAD

*----------------------------------------
* STD FILE
*----------------------------------------

*---

strLOADFILE	str	'Charger quelle partie ?'
strSAVEFILE	str	'Enregistrer sous...'

typeLIST	hex	01
	hex	5d	; Game/Edu files
replyPTR	ds	2	; 0 good
	ds	2	; 2 fileType
	ds	2	; 4 auxFileType
namePATH
	hex	06	; 6 fileName
namePATH1
	asc	'Partie'	; 7 fileName (16 normally)
	ds	9
loadPATH
	ds	1	; 22 fullPathname (string length)
loadPATH1
	ds	129	; 23 fullPathname (128 normally)

*----------------------------------------
* GS/OS
*----------------------------------------

loadFILE
	sta	proOPEN+4  ; filename
        sty	proREAD+4  ; RAM pointer low
        stx	proREAD+6  ; RAM pointer high

loadFILE1
	stz	proERR

        jsl	GSOS
        dw	$2010
        adrl	proOPEN
        bcs	loadERR

        lda	proOPEN+2
        sta	proREAD+2
        sta	proCLOSE+2

        lda	proEOF
        sta	proREAD+8
        lda	proEOF+2
        sta	proREAD+10

        jsl	GSOS
        dw	$2012
        adrl	proREAD
        bcs	loadERR

loadFILE2
	jsl	GSOS
        dw	$2014
        adrl	proCLOSE

	ldy	proREAD+12 ; length read
	ldx	proREAD+14
	rts

loadERR	jsr	loadFILE2
	ldy	#0
	tyx
	sec
	rts

*--- GS/OS data

proERR
	ds	2

*--- For the game party

proCREATEGAME
	dw	7	; pcount
        adrl	pGAME	; pathname
        dw	$c3	; access_code
        dw	$5d	; file_type
        adrl	$801b	; aux_type
        ds	2	; storage_type
        ds	4	; eof
        ds	4	; resource_eof

proDESTROYGAME
	dw	1	; pcount
        adrl	pGAME	; pathname

proOPENGAME
	dw	2
        ds	2
        adrl	pGAME

proREADGAME
	dw	4	; 0 - pcount
        ds	2	; 2 - ref_num
        adrl	pGAME	; 4 - data_buffer
        ds	4	; 8 - request_count
        ds	4	; C - transfer_count

proWRITEGAME
	 dw	5	; 0 - pcount
         ds	2	; 2 - ref_num
         adrl	pGAME	; 4 - data_buffer (we are in same bank)
         ds	4	; 8 - request_count
         ds	4	; C - transfer_count
         dw	1	; cache_priority

*--- For the game images

proOPEN
	dw	12
        ds	2
        adrl	pIMAGE
        ds	2
        ds	2
        ds	2
        ds	2
        ds	4
        ds	2
        ds	8
        ds	8
        ds	4
proEOF  ds	4

proREAD
	dw	4	; 0 - nb parms
        ds	2	; 2 - file id
        ds	4	; 4 - pointer
        ds	4	; 8 - length
        ds	4	; C - length read

proCLOSE
	dw	1
        ds	2

proQUIT
	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags
	
proVERS
	dw	1	; pcount
	ds	2	; version

*--- offset to image number is +10

pIMAGE	strl	'1/data/p00.lz4'
pICONS	strl	'1/data/icons.lz4'

pGAME	strl	'0/               '

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	datafr.asm
	put	roomfr.asm
	put	midi.s
	
*---
