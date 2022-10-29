*
* Canal Meurtre (FR)
*
* (c) 1986, Froggy Software
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	lst   off
	rel
	dsk   CanalMeurtre.l

	mx    %00
	xc
	xc

*----------------------------------- Macros

	use   4/Ctl.Macs
	use   4/Desk.Macs
	use   4/Event.Macs
	use   4/Font.Macs
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

*-----------------------
* macros
*-----------------------

@val	mac
	PushWord ]2
	PushWord ]1
	jsr	val
	eom
	
@left	mac
	PushWord ]3
	PushWord ]2
	PushWord ]1
	jsr	left
	eom

@charcmp	mac
	PushWord #]2
	PushWord #]1
	jsr	charcmp
	eom

@copystring	mac
	PushWord #]3
	PushWord #]2
	PushWord #]1
	jsr	copy_string
	eom

@instr	mac
	PushWord #]3
	PushWord #]2
	PushWord #]1
	jsr	instr
	eom

*----------------------------------- Constantes

*-------------- Softswitches

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
GSOS	=	$e100a8

*-------------- GUI

wMAIN	=	1
alertQUIT	=	$0100
alertRESTART	=	$0200

refIsPointer = $0
refIsHandle =  $1
refIsResource = $2

appleKey	=	$0100
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

*--------------

dpFROM	=	$80
dpTO	=	dpFROM+4

dpFICHES	= 	$90	; pointeur vers NEWTV.BASE
dpENTREE	=	dpFICHES+4	; pointeur vers une fiche

Debut	=	$a0
Arrivee	=	Debut+4
Second	=	Arrivee+4

*---

TRUE	=	1
FALSE	=	0

*----------------------------------- Entry point

	phk
	plb

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	myID

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

okVERS	jsr	make64KB
	bcc	okMEM1

koMEM	pha
	PushLong #memSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT1

okMEM1
	sty	ptrIMAGE	; set pointer to show_cartouche
	sty	ptrToSourceLocInfo2+2
	stx	ptrIMAGE+2
	stx	ptrToSourceLocInfo2+4

*--- 64K pour la sauvegarde de l'écran

	jsr	make64KB
	bcs	koMEM
	
	sep	#$10	; save pointer+2
	stx	saveBACK1+3	; for interactions
	stx	loadBACK1+3	; with the toolbox
	rep	#$10

*--- 64K pour les images compressees

	jsr	make64KB
	bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
	
*--- 64K pour les décors

	jsr	make64KB
	bcs	koMEM

	sty	ptrDECORB
	stx	ptrDECORB+2
	stx	ptrDECORN+2
	
*--- 64K pour les NEWTV.BASE

	jsr	make64KB
	bcs	koMEM

	sty	ptrFICHES
	stx	ptrFICHES+2
	
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
	brl   meQUIT0

*--- Et la musique...

okTOOL
	_InitCursor

	jsr	set_texte	; set text language

*--- Nettoie le cache de l'Event Manager

	PushWord #0
	PushWord #%11111111_11111111
	PushWord #0
	_FlushEvents
	pla

*--- On continue...

	jsr	initMIDI
	jsr	randomMIDI	; select a sequence 0-7
	jsr	TWILIGHToff
	
*--- Et la bordure...

	PushWord #0
	PushWord #$1c
	_ReadBParam
	pla
	sta	saveBORDER

	PushWord #0
	PushWord #$1c
	_WriteBParam

	sep	#$20	; black border
	ldal	$e0c034
	and	#$f0
	stal	$e0c034
	rep	#$20

	PushLong #sourcePAT
	_GetPenPat
	
	PushLong #thePATTERN
	_SetPenPat

*--- Charge et décompresse les décors

	lda	#pDECORB
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcc	decor_ok

decor_ko
	pha
	PushLong #filSTR1
	PushLong #errSTR2
	PushLong #errSTR1
	PushLong #errSTR2
	_TLTextMountVolume
	pla
	brl   meQUIT

decor_ok
	ldx	ptrDECORB+2
	ldy	ptrDECORB
	jsr	unpackAPF

	lda	#pDECORN
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	decor_ko

	ldx	ptrDECORN+2
	ldy	ptrDECORN
	jsr	unpackAPF

*--- Charge les textes

	jsr	load_fiche	; exit if error
	jsr	init_fiche
	jsr	load_font
	jsr	initialisation

	jsr	doSOUNDON	; midi on

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

memOK
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

	ldx	ptrDECORB+2
	ldy	ptrDECORB
	jsr	show_picture

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

	inc	VBLCounter0
	
	jsr	checkREPLAY	; midi replay

	PushWord #0
	PushWord #%11111111_11111111
	PushLong #taskREC
	_TaskMaster
	pla
	beq	taskLOOP
	 
	asl
	tax
	jsr	(taskTBL,x)
	bra	taskLOOP

*----------------------------------- Gestion du keyDown
* on gère les open-apple-qqch

doKEYDOWN
	lda	taskMODIFIERS
	and	#appleKey
	cmp	#appleKey
	beq	doOPENAPPLE
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

tblKEYVALUE
	asc	'QqOoSs'
	asc	'Rr'
	asc	'Zz'
	hex	ff
	
tblKEYADDRESS
	da	doQUIT,doQUIT,doLOAD,doLOAD,doSAVE,doSAVE
	da	doRESTART,doRESTART
	da	doMUSIK,doMUSIK

*----------------------------------- Gestion des contrôles (ça veut dire boutons ou lineedit)

doCONTROL
	lda	taskREC+38
	cmp	#6
	bcc	doBOUTON
	bne	doOK
	rts		; c'est le line edit, on ne fait rien
	
*--- Le bouton OK est l'ID 7

doOK
	jmp	gosub43

*--- Les boutons de 1 à 5 (routines TO, 55)

doBOUTON
	@charcmp #T2;#'R'
	bne	ctl_notR

gosub49
	pea	$0004	; nombre de caractères
	lda	taskREC+38	; gère le choix de la REPONSE
	dec
	asl
	tax
	lda	tblREP,x
	pha
	jsr	val
	sta	P
	jmp	print_fiche

tblREP	da	C2_5,C2_7,C2_9,C2_11,C2_13

ctl_notR
	@charcmp #T2;#'M'
	bne	ctl_notM

gosub39
	@val #C2_5;#4	; gère le choix du MESSAGE (tjs le premier)
	sta	P
	jmp	print_fiche

ctl_notM
	@charcmp #T2;#'C'
	bne	ctl_notC

	jmp	gosub31

ctl_notC
	@charcmp #T2;#'D'
	bne	ctl_notD

	jmp	gosub43

ctl_notD			; do nada
	rts

*--- Gestion des choix possibles (c'est aléatoire)

gosub31
	jsr	Random
	and	#3	; 0..1..2..3
	inc		; 1..2..3..4
	sta	H
	
	@val #C2_5;#4
	cmp	H
	beq	goto37	; <=
	bcs	goto18	; >

goto37
	@val #C2_9;#4
	sta	P
	
	@copystring #C5;#C2_10;#40
	jsr	gosub3
	jmp	print_fiche

goto18
	@val #C2_7;#4
	sta	P
	
	@copystring #C5;#C2_8;#40
	jsr	gosub3
	jmp	print_fiche
	
*--- Gestion de l'edit line saisi (il faut comparer les chaînes)

gosub43
	PushLong wiMAIN
	PushLong #6
	PushLong #R0
	_GetLETextByID

	lda	R0	; longueur de chaîne
	and	#$ff
	sta	L3
	beq	gosub43_1	; un p'tit string

	jsr	upperCASE	; mets la chaîne en MAJUSCULES STP
	
	@val #C2_1;#2	; entree max
	sta	C

	lda	#3-1	; compare les chaînes
]lp	pha
	asl
	tax
	PushWord L3
	lda	ptrTEXT,x
	pha
	PushWord #R1
	jsr	strcmp
	beq	gosub43_2	; même chaîne
	
	pla
	inc
	cmp	C
	bcc	]lp
*	beq	]lp

* on n'a pas trouvé de correspondance

gosub43_1

	@copystring #C5;#C2_8;#40
	jsr	gosub3
	@val #C2_7;#4
	sta	P
	jmp	print_fiche
	
*--- on a trouvé une correspondance

gosub43_2	
	pla
	@val #C2_9;#4
	sta	P
	jmp	print_fiche

*----------------------------------- UPPERcase

upperCASE
	sep	#$30
	
	ldy	#0
]lp	ldx	R1,y
	lda	tblUPPER,x
	sta	R1,y
	iny
	cpy	R0
	bcc	]lp
*	beq	]lp
	
	rep	#$30
	rts

tblUPPER
	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	604142434445464748494A4B4C4D4E4F	; a-z => A-Z
	hex	505152535455565758595A7B7C7D7E7F
	hex	808182838485868788898A8B8C8D8E8F
	hex	909192939495969798999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF
	
*----------------------------------- Gestion du mouseUp
* on compare les coordonnées avec celles du incontent
* si dans le même rectangle, on traite

doMOUSEUP
	jsr	check_boutonstv	; vérifie les boutons de la télévision
	bcs	doMOUSEUP1		; not handled, others are controls
	jmp	handle_boutonstv	; handle it, please
doMOUSEUP1
	rts

*----------------------------
* TWILIGHToff
*  Turns Twilight II off
*
* Entry:
*  n/a
*
* Exit:
*  n/a
*
*----------------------------

*Debut	=	$00
*Arrivee	=	Debut+4

lenV1	=	$49bf
lenV2	=	$539a

offV1	=	$117a
offV2	=	$154c

TWILIGHToff
	phd
	lda	myDP
	tcd

	ldal	$e11600
	sta	Debut
	ldal	$e11602
	sta	Debut+2

TWILIGHToff1
	ldy	#8
	lda	[Debut],y
	ldx	#offV1
	cmp	#lenV1
	beq	TWILIGHToff2
	ldx	#offV2
	cmp	#lenV2
	bne	TWILIGHToff3
	
TWILIGHToff2
	stx	offTWILIGHT
         
	lda	[Debut]
	sta	Arrivee
	sta	ptrTWILIGHT
	ldy	#2
	lda	[Debut],y
	sta	Arrivee+2
	sta	ptrTWILIGHT+2
	
	txy
	lda	[Arrivee],y
	cmp	#$0ef0
	bne	TWILIGHToff3
	lda	#$0e80
	sta	[Arrivee],y
	inc	fgTWILIGHT
	pld
	rts

TWILIGHToff3
	ldy	#16
	lda	[Debut],y
	tax
	iny
	iny
	lda	[Debut],y
	sta	Debut+2
	txa
	sta	Debut
	
	lda	Debut
	ora	Debut+2
	bne	TWILIGHToff1
	pld
	rts

*----------------------------
* TWILIGHTon
*  Turns Twilight II on
*
* Entry:
*  n/a
*
* Exit:
*  n/a
*
*----------------------------

TWILIGHTon
	lda	fgTWILIGHT
	bne	TWILIGHTon1
	rts

TWILIGHTon1
	phd
	lda	myDP
	tcd

	lda	ptrTWILIGHT
	sta	Arrivee
	lda	ptrTWILIGHT+2
	sta	Arrivee+2
	ldy	offTWILIGHT
	lda	#$0ef0
	sta	[Arrivee],y
	
	pld
	rts

*--- Twilight II

ptrTWILIGHT	ds	4
fgTWILIGHT	ds	2
offTWILIGHT	ds	2

*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN
	PushLong wiMAIN
	_DrawControls
	
	phb
	phk
	plb

	jsr	font_it	; force Courier

	plb
	rtl
	
*----------------------------------------
* CODE DU JEU
*----------------------------------------

*----------------------------------------
* Affiche une image de décor
*----------------------------------------

show_picture
	sty	ptrToSourceLocInfo+2
	stx	ptrToSourceLocInfo+4

	_HideCursor
	PushLong #paintParamPtr
	_PaintPixels

	PushWord #0
	PushLong #ColorTableArray
	_SetColorTable
	PushWord #0
	_SetAllSCBs
	_ShowCursor
	rts

*---

paintParamPtr
	adrl	ptrToSourceLocInfo
	adrl	ptrToDestLocInfo
	adrl	ptrToSourceRect
	adrl	ptrToDestPoint
	dw	$0000	; mode copy
	ds	4

ptrToSourceLocInfo
	dw	$0000	; mode 320
	ds	4	; ptrDECORB or ptrDECORN
	dw	160
	dw	0,0,200,320
	
ptrToDestLocInfo
	dw	$0000	; mode 320
	adrl	$012000
	dw	160
	dw	0,0,200,320
	
ptrToSourceRect
	dw	0,0,200,320
ptrToDestPoint
	dw	0,0

*----------------------------------------
* Affiche une image de télévision
*----------------------------------------

show_cartouche
	_HideCursor
	PushLong #paintParamPtr2
	_PaintPixels
	_ShowCursor
	rts

*---

paintParamPtr2
	adrl	ptrToSourceLocInfo2
	adrl	ptrToDestLocInfo2
	adrl	ptrToSourceRect2
	adrl	ptrToDestPoint2
	dw	$0000	; mode copy
	ds	4

ptrToSourceLocInfo2
	dw	$0000	; mode 320
	ds	4	; ptrIMAGE
	dw	160
	dw	0,0,200,320
	
ptrToDestLocInfo2
	dw	$0000	; mode 320
	adrl	$012000
	dw	160
	dw	0,0,200,320
	
ptrToSourceRect2
	dw	0,0,117,138	; Rectangle of the source rectangle (because I tweaked the unpackAPF routine)
ptrToDestPoint2
	dw	13,27		; This is where the cartouche is displayed

*----------------------------------- Open

doLOAD
	jsr	doSOUNDOFF	; midi off
	jsr	saveBACK
	
	PushWord #30
	PushWord #43
	PushLong #strLOADFILE
	PushLong #0
	PushLong #typeLIST
	PushLong #replyPTR
	_SFGetFile

	jsr	loadBACK
	jsr	doSOUNDON	; midi on
	
	lda	replyPTR
	bne	doLOAD1
	rts

doLOAD1
	jsr	copyPATH
	jmp	loadALL
	
*----------------------------------- Save

doSAVE
	jsr	doSOUNDOFF	; midi off
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
	jsr	doSOUNDON	; midi on
	
	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1
	jsr	copyPATH
	jmp	saveALL
	
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
	ldx	#NB_INDICATEURS
	ldy	#C1
	jsr	loadIT
	
	ldx	#2
	ldy	#P
	
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
	ldx	#NB_INDICATEURS
	ldy	#C1
	jsr	saveIT
	
	ldx	#2
	ldy	#P

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
*	PushLong #alertRESTART
	pea	$0000
	lda	#alertRESTART
	ora	saveLANGUAGE
	pha
	_AlertWindow
	
	jsr	loadBACK
	
	pla
	beq	re1
	rts

re1
*	jsr	initialisation2
	jmp	initialisation
	
*----------------------------------- Quit

doQUIT
	jsr	saveBACK
	
	PushWord #0
	PushWord #5
	PushLong #0
*	PushLong #alertQUIT
	pea	$0000
	lda	#alertQUIT
	ora	saveLANGUAGE
	pha
	_AlertWindow
	
	jsr	loadBACK
	
	pla
	beq	meQUIT
	rts

*----------------------------------- Quit

meQUIT
	jsr	stopMIDI
	jsr	TWILIGHTon
	
	_SoundShutDown

	PushLong #sourcePAT
	_SetPenPat

	PushWord saveBORDER
	PushWord #$1c
	_WriteBParam

	sep	#$20
	ldal	$e0c034
	and	#$f0
	ora	saveBORDER
	stal	$e0c034
	rep	#$20

meQUIT0
	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1
	PushWord myID
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

make64KB
	pha
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

unpackAPF
	sty	Arrivee		; where to unpack the image located at ptrUNPACK
	stx	Arrivee+2

	lda	ptrUNPACK
	sta	Debut
	lda	ptrUNPACK+2
	sta	Debut+2

	ldy	#$0b
	lda	[Debut],y
	sta	PixelsPerScanLine
	
	ldy	#$0f
	ldx	#0
]lp	lda	[Debut],y
	sta	ColorTableArray,x
	iny
	iny
	inx
	inx
	cpx	#32
	bcc	]lp

	lda	Debut	; ScanLineDirectory
	clc
	adc	#$31
	sta	Second
	lda	Debut+2
	adc	#0
	sta	Second+2
	
	lda	[Debut],y	; PackedScanLines
	sta	NumScanLines
	asl
	asl
*	tax
	clc
	adc	#$31
	sta	Debut
*	lda	Debut+2
*	adc	#0
*	sta	Debut+2

	lda	#0
	
* Decompresse les lignes now

unpackAPF1
	pha
	asl
	asl
	tay
	lda	[Second],y
	sta	APFpackedSize

	lda	Debut
	sta	APFpackedHa
	lda	Debut+2
	sta	APFpackedHa+2

	lda	Arrivee
	sta	APFstartHa
	lda	Arrivee+2
	sta	APFstartHa+2
	
	lda	#1536
	sta	APFsizePtr
	
	pha
	PushLong  APFpackedHa
	PushWord  APFpackedSize
	PushLong  #APFstartHa
	PushLong  #APFsizePtr
	_UnPackBytes
	pla		; next from
	clc
	adc	Debut
	sta	Debut
*	lda	#0	; same bank
*	adc	Debut+2
*	sta	Debut+2
	
*	lda	PixelsPerScanLine	; next to
*	lsr
*	clc
*	adc	Arrivee
	lda	Arrivee
	clc
	adc	#160
	sta	Arrivee
*	lda	#0	; same bank
*	adc	Arrivee+2
*	sta	Arrivee+2

	pla
	inc
	cmp	NumScanLines
	bcc	unpackAPF1
	rts

*-- Data

PixelsPerScanLine	ds	2
ColorTableArray	ds	32
NumScanLines	ds	2

APFpackedHa    ds        4
APFpackedSize  ds        2
APFstartHa     ds        4
APFsizePtr     ds        2

*-----------------------------------
* SAVE THE SHR SCREEN
*-----------------------------------

saveBACK
	_HideCursor

	ldx	#$8000-2
]lp	ldal	$e12000,x
saveBACK1	stal	$000000,x
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
loadBACK1	ldal	$000000,x
	stal	$012000,x
	stal	$e12000,x
	dex
	dex
	bpl	loadBACK1
	bmi	exitBACK

*--- Genere un nombre aleatoire

Random
	ldal  $e0c02e
	xba
	clc
	adc   VBLCounter0
	sta   VBLCounter0
	and   #$ff
	rts

VBLCounter0	ds	2

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

nowWAIT
	dec
	tax
	lda   #0
]lp	clc
	adc   #60
	cpx   #0
	beq   nowWAIT1
	dex
	bra   ]lp
	
nowWAIT1	pha
]lp	ldal  RDVBLBAR-1
	bpl   ]lp
]lp	ldal  RDVBLBAR-1
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
ptrDECORB	ds	4	; décor lumière allumée
ptrDECORN	adrl	$8000	; décord lumière éteinte (ptrDECORB+$8000)

ptrFICHES	ds	4	; les données multilingues du jeu

fgSND	ds	2	; set if sound file not loaded
haSND	ds	4	; the handle to the sound pointer
temp	ds	2

saveBORDER	ds	2
saveLANGUAGE	ds	2

*----------------------- Tool locator

verSTR1	str	'System 6.0.1 Required!'
verSTR2	str	'Press a key to quit'
fntSTR1	str	'Helvetica.09 font missing'
fntSTR2	str	'Please install it!'
tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
filSTR2	str	'Cannot load text file'
filSTR3	str	'Cannot load font file'
errSTR1	str	'Quit'
errSTR2	str	''
errSTR3	str	'Continue'

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

*----------------------------------------
* STD FILE
*----------------------------------------

*---

strLOADFILE	str	'Charger quel jeu ?'
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
	adrl	$801e	; aux_type
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
proEOF	ds	4

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

*--- offset to image number is +16

pIMAGE	strl	'1/data/images/XXXX'
pDECORB	strl	'1/data/images/DECORB'
pDECORN	strl	'1/data/images/DECORN'
pPUB	strl	'1/data/images/PUB'
pPLAN	strl	'1/data/images/PLAN'
pFICHES	strl	'1/data/textes/fr/NEWTV.BASE'

pGAME	strl	'0/               '

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	game.s
	put	midi.s
	
*---

	asc	0d
	asc	"----------------"0d
	asc	"                "0d
	asc 	" CANAL  MEURTRE "0d
	asc	"                "0d
	asc	" Antoine Vignau "0d
	asc	"Olivier  Zardini"0d
	asc	"                "0d
	asc	"  Paques  2022  "0d
	asc	"                "0d
	asc	"----------------"0d