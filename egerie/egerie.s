*
* L'Égérie
*
* (c) 1990, François Coulon & Laurent Cotton
* (c) 2021, Antoine Vignau & Olivier Zardini
*

         lst   off
         rel
         dsk   egerie.l

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
*	 use   4/MIDISyn.Macs
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

CHEAT_MODE	=	0	; 1 si on veut le code de cheat
SALLE_CHEAT	=	1

*-------------- Softswitches

RDVBLBAR = $E0C019
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
Second	=	dpTO+4
dpSTR	=	Second+4
dpBUF	=	dpSTR+4
dpSALLE	=	dpBUF+4
lenFROM	=	dpSALLE+4
lenTO	=	lenFROM+4

Debut	=	lenTO+4
Arrivee	=	Debut+4

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

*--- 64K pour les images compressees

        jsr	make64KB
        bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
	stx	ptrICONS+2
	
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
*	 jsr	initMIDI
*	 jsr	randomMIDI	; select a sequence 0-7

	jsl	TWILIGHToff
	
	lda	myDP
	clc
	adc	#$100
	pha
	_SoundStartUp

*--- Charge les textes

	PushWord #0
	PushWord #$1c
	_ReadBParam
	pla
	sta	saveBORDER

	jsr	set_texte	; set text language
	jsr	load_texte	; exit if error
	jsr	init_texte	; set all pointers
	jsr	load_dedicaces	; exit if error
	jsr	init_dedicaces	; set all pointers
	jsr	load_soustitres	; exit if error
	jsr	init_soustitres	; set all pointers
*	jsr	load_font
	jsr	initialisation2
	jsr	init_constantes

*	jsr	doSOUNDON	; midi on

*--- Affichage desktop

	_HideMenuBar
 
	PushWord #0
	PushWord #%11111111_11111111
	PushWord #0
	_FlushEvents
	pla

	_InitCursor
	jsr	souris_off
		
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

*----------------------------------------
* TITRE
*----------------------------------------

	PushWord #0
	PushWord #$1c
	_WriteBParam

	sep	#$20	; black border
	ldal	$e0c034
	and	#$f0
	stal	$e0c034
	rep	#$20
	
	stz	salle
	jsr	changement_salle2	; to skip the 0 check

	ldal	$c060
	bmi	skip_titre
	jsr	titre
skip_titre
	jsr	load_font	; font courier pour le jeu
	
	jsr	initialisation

	PushWord #15
	PushWord #$1c
	_WriteBParam

	sep	#$20	; white border
	ldal	$e0c034
	and	#$f0
	ora	#$0f
	stal	$e0c034
	rep	#$20

	jsr	souris_on
	
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
	
	jsr	changement_salle
*	jsr	changement_texte

*	jsr	checkREPLAY	; midi replay

	PushWord #0
	PushWord #%11111111_11111111
	PushLong #taskREC
	_TaskMaster

*---

	lda	follow
	beq	tm_bis

	pha
	PushWord #7
	_FFGeneratorStatus
	pla
	and	#%10000000_00000000
	beq	tm_bis

	stz	follow	; le son est fini

*	lda	seqPlay	; midi playing
*	bne	tm_bis	; nope
*
*	_MSResume

tm_bis

*---

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
*	asc	'Zz'

	DO	CHEAT_MODE
	asc	'Cc'
	asc	'Hh'
	asc	'Pp'
	asc	'Nn'
	asc	'Jj'
	asc	'Kk'
	FIN
	hex	ff
	
tblKEYADDRESS
	da	doQUIT,doQUIT,doLOAD,doLOAD,doSAVE,doSAVE
	da	doRESTART,doRESTART
*	da	doMUSIK,doMUSIK

	DO	CHEAT_MODE
	da	doCHEAT,doCHEAT
	da	doFORCE,doFORCE
	da	doPREVIOUS,doPREVIOUS
	da	doNEXT,doNEXT
	da	doSETINDIC,doSETINDIC
	da	doZEROINDIC,doZEROINDIC

*----------------------------------- Ici, c'est le royaume de la triche !

doCHEAT
	lda	fgCHEAT
	bne	doCHEAT9
	
	lda	#TRUE
	sta	fgCHEAT

	lda	#SALLE_CHEAT
	sta	salle_cheat
	sta	salle
	
doCHEAT9
	rts

fgCHEAT	ds	2	; non zero means cheat is on
salle_cheat	ds	2

*---

doFORCE
	lda	fgCHEAT
	beq	doFORCE9

	lda	salle_cheat
	sta	salle

	PushWord salle
	PushLong #strSALLE
	PushWord #3
	PushWord #0
	_Int2Dec

	PushWord #10
	PushWord #10
	_MoveTo

	PushLong #strSALLE
	_DrawCString
	
doFORCE9
	rts

strSALLE	ds	4

*---

doPREVIOUS
	lda	fgCHEAT
	beq	doPREVIOUS9
	
	lda	salle_cheat
	cmp	#1
	beq	doPREVIOUS9

	dec
	sta	salle_cheat
	sta	salle

doPREVIOUS9
	rts

*---
	
doNEXT
	lda	fgCHEAT
	beq	doNEXT9

	lda	salle_cheat
	cmp	salle_fin2
	beq	doNEXT9

	inc
	sta	salle_cheat
	sta	salle

doNEXT9
	rts
	
*---
	
doSETINDIC
	lda	fgCHEAT
	beq	doSETINDIC9

	sep	#$20
	ldx	#NB_INDICATEURS
	lda	#TRUE
]lp	sta	indicateur-1,x
	dex
	bne	]lp
	rep	#$20

doSETINDIC9
	rts

*---

doZEROINDIC
	lda	fgCHEAT
	beq	doZEROINDIC9
	
	sep	#$20
	ldx	#NB_INDICATEURS
	lda	#FALSE
]lp	sta	indicateur-1,x
	dex
	bne	]lp
	rep	#$20

doZEROINDIC9
	rts
	
	FIN

*----------------------------------- Gestion du mouseUp
* on compare les coordonnées avec celles du incontent
* si dans le même rectangle, on traite

doMOUSEUP
	lda	salle
	cmp	nombre_salle
	bcc	doMOUSEUP1
	rts
doMOUSEUP1
	asl
	tax
	jmp	(tblSALLE,x)

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
        rtl

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
        rtl

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
        rtl

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
        rtl

*--- Twilight II

ptrTWILIGHT	ds	4
fgTWILIGHT	ds	2
offTWILIGHT	ds	2

*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN
	PushLong #paintParamPtr
	_PaintPixels

	PushLong wiMAIN
	_DrawControls
	
	phb
	phk
	plb

	jsr	font_it	; force Courier
	lda	le_texte
	jsr	texte2

	plb
	rtl
	
*----------------------------------------
* CODE DU JEU
*----------------------------------------

image
	PushWord salle
	PushLong #tempSTR
	PushWord #3
	PushWord #0
	_Int2Dec

	lda	tempSTR
	ora	#'00'
	sta	pIMAGE+17
	lda	tempSTR+1
	ora	#'00'
	sta	pIMAGE+18

*---

	lda	salle
	cmp	salle_fin2
	bne	image1
	lda	#TRUE
	sta	fade
image1
	lda	fade
	cmp	#TRUE
	bne	decompression_image
	
	jsr	fadeOUT

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

	lda	fade
	cmp	#TRUE
	bne	di_1

	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	fadeIN
	
di_1	
	PushWord #0
	lda	ptrIMAGE+2
	pha
	lda	ptrIMAGE
	clc
	adc	#$7e00
	pha
	_SetColorTable
	_ShowCursor

	DO	CHEAT_MODE
	jsr	doFORCE	; cheat mode to display the room number
	FIN

di_err
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
	ds	4	; ptrIMAGE
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

tempSTR	ds	4	

*----------------------------------------

*--- Donnees du jeu

instruction1	ds	2
instruction2	ds	2
zone_cliquee	ds	2

*----------------------------------- Open

doLOAD
*	jsr	doSOUNDOFF	; midi off
	jsr	saveBACK
	
	PushWord #30
	PushWord #43
	PushLong #strLOADFILE
	PushLong #0
	PushLong #typeLIST
	PushLong #replyPTR
	_SFGetFile

	jsr	loadBACK
*	jsr	doSOUNDON	; midi on
	
	lda	replyPTR
	bne	doLOAD1
	rts

doLOAD1
	jsr	copyPATH
	jsr	loadALL
	
	stz	ancienne_salle
	stz	instruction1
	stz	instruction2
	rts

*----------------------------------- Save

doSAVE
*	jsr	doSOUNDOFF	; midi off
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
*	jsr	doSOUNDON	; midi on
	
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
	ldx	#2
	ldy	#salle
	jsr	loadIT
	
	ldx	#3
	ldy	#dial
	jsr	loadIT

*	ldx	#2
*	ldy	#disquette
*	jsr	loadIT
	
	ldx	#2
	ldy	#le_texte
	jsr	loadIT
	
	ldx	#2
	ldy	#chiffre
	jsr	loadIT
	
	ldx	#2
	ldy	#fade
	jsr	loadIT

	ldx	#2
	ldy	#texte_enfant
	jsr	loadIT

	ldx	#2
	ldy	#salle_bain
	jsr	loadIT

	ldx	#NB_INDICATEURS
	ldy	#indicateur

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
	ldx	#2
	ldy	#salle
	jsr	saveIT
	
	ldx	#3
	ldy	#dial
	jsr	saveIT

*	ldx	#2
*	ldy	#disquette
*	jsr	saveIT
	
	ldx	#2
	ldy	#le_texte
	jsr	saveIT

	ldx	#2
	ldy	#chiffre
	jsr	saveIT
	
	ldx	#2
	ldy	#fade
	jsr	saveIT

	ldx	#2
	ldy	#texte_enfant
	jsr	saveIT

	ldx	#2
	ldy	#salle_bain
	jsr	saveIT

	ldx	#NB_INDICATEURS
	ldy	#indicateur

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
	jsr	initialisation2
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
*	jsr	stopMIDI
	jsl	TWILIGHTon
	
	_SoundShutDown

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
	
*	jsr	resumeMUSIC	; midi off
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
*	jmp	resumeMUSIC	; midi on
	rts
	
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

*--------------------------------------

fadeIMAGE
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE

fadeIN	sty   Debut
	stx   Debut+2

         ldy   #$2000
         sty   Arrivee
         ldx   #$00e1
         stx   Arrivee+2

*         cmp   #0
*         beq   fadeIN1
*
*         ldy   #$7dfe
*]lp      lda   [Debut],y
*         sta   [Arrivee],y
*         dey
*         dey
*         bpl   ]lp

fadeIN1  lda   Debut
         clc
         adc   #$7e00
         sta   Debut
         lda   Debut+2
         adc   #0
         sta   Debut+2

         lda   Arrivee
         clc
         adc   #$7e00
         sta   Arrivee
         lda   Arrivee+2
         adc   #0
         sta   Arrivee+2

	 ldx   #$000f
fadeIN2  ldy   #$01fe
fadeIN3  lda   [Arrivee],y
         and   #$000f
         sta   temp
         lda   [Debut],y
         and   #$000f
         cmp   temp
         beq   fadeIN4
         lda   [Arrivee],y
         clc
         adc   #$0001
         sta   [Arrivee],y
fadeIN4  lda   [Arrivee],y
         and   #$00f0
         sta   temp
         lda   [Debut],y
         and   #$00f0
         cmp   temp
         beq   fadeIN5
         lda   [Arrivee],y
         clc
         adc   #$0010
         sta   [Arrivee],y
fadeIN5  lda   [Arrivee],y
         and   #$0f00
         sta   temp
         lda   [Debut],y
         and   #$0f00
         cmp   temp
         beq   fadeIN6
         lda   [Arrivee],y
         clc
         adc   #$0100
         sta   [Arrivee],y

fadeIN6  dey
         dey
         bpl   fadeIN3
         jsr   nextVBL
         dex
         bpl   fadeIN2
         rts

*--------------------------------------

fadeOUT  lda   #$9e00
         sta   Debut
         lda   #$00e1
         sta   Debut+2

         ldx   #$000f
fadeOUT1 ldy   #$01fe
fadeOUT2 lda   [Debut],y
         and   #$000f
         beq   fadeOUT3
         lda   [Debut],y
         sec
         sbc   #$0001
         sta   [Debut],y
fadeOUT3 lda   [Debut],y
         and   #$00f0
         beq   fadeOUT4
         lda   [Debut],y
         sec
         sbc   #$0010
         sta   [Debut],y
fadeOUT4 lda   [Debut],y
         and   #$0f00
         beq   fadeOUT5
         lda   [Debut],y
         sec
         sbc   #$0100
         sta   [Debut],y

fadeOUT5 dey
         dey
         bpl   fadeOUT2
         jsr   nextVBL
         dex
         bpl   fadeOUT1
         rts

*--------------------------------------

nextVBL  lda   #75
         pha
]lp      ldal  $e0c02e
         and   #$7f
         cmp   1,s
         blt   ]lp
         cmp   #100
         bge   ]lp
         pla
waitVBL  ldal  $e0c018
         bpl   waitVBL
         rts

*--- Genere un nombre aleatoire

Random   ldal  $e0c02e
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

ptrTEXTES	ds	4	; where the very long texts are loaded
ptrDEDICACES	ds	4	; where the dedicaces texts are loaded
ptrSOUSTITRES	ds	4	; where the subtitles texts are loaded

fgSND	ds	2	; set if sound file not loaded
haSND	ds	4	; the handle to the sound pointer
temp	ds	2

saveBORDER	ds	2
saveLANGUAGE	ds	2

*----------------------- Tool locator

verSTR1	str	'System 6.0.1 Required!'
verSTR2	str	'Press a key to quit'
fntSTR1	str	'Courier.09 font missing'
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
         da    doNOT      ; wInControl
         da    doNOT      ; wInControlMenu

*----------------------------------------
* STD FILE
*----------------------------------------

*---

strLOADFILE	str	'Load which game?'
strSAVEFILE	str	'Save game as...'

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
        adrl	$801d	; aux_type
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

*--- offset to image number is +17

pIMAGE	strl	'1/data/images/s000.lz4'
pSON	strl	'1/data/sounds/s000.snd'
pDEDICACES	strl	'1/data/textes/fr/dedicaces.txt'
pSOUSTITRES	strl	'1/data/textes/fr/soustitres.txt'
pTEXTES	strl	'1/data/textes/fr/textes.txt'

pGAME	strl	'0/               '

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	game.s
*	put	midi.s
	
*---

	asc	0d
	asc	"----------------"0d
	asc	"                "0d
	asc 	"    L'EGERIE    "0d
	asc	"                "0d
	asc	" Antoine Vignau "0d
	asc	"Olivier  Zardini"0d
	asc	"                "0d
	asc	"Jeu de Noel 2021"0d
	asc	"                "0d
	asc	"----------------"0d