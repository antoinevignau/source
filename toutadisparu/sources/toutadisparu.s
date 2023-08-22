*
* Tout a disparu
*
* (c) 1992, François Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx    %00

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
	use   4/Misc.Macs
	use   4/Print.Macs
	use   4/Qd.Macs
	use   4/QdAux.Macs
	use   4/Resource.Macs
	use   4/Scrap.Macs
	use   4/Std.Macs
	use   4/TextEdit.Macs
	use   4/Tool222.Macs
	use   4/Util.Macs
	use   4/Window.Macs

*-----------------------
* macros
*-----------------------

@cprint	mac
	ldx	#^]1
	ldy	#]1
	lda	#]2
	jsr	cprint
	eom

*----------------------------------- Constantes

*-------------- Softswitches

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
GSOS	=	$e100a8

*-------------- GUI

alertQUIT	=	$0100
alertRESTART =	$0200

refIsPointer =	0
refIsHandle	=	1
refIsResource =	2

appleKey	=	$0100
mouseDownEvt =	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

*--------------

dpFROM	=	$80
dpTO	=	dpFROM+4

dpINDEX	= 	dpFROM+$10	; pointeur vers les INDEX
dpTEXTES	=	dpINDEX+4	; pointeur vers les TEXTES

Debut	=	dpINDEX+$10
Arrivee	=	Debut+4
Second	=	Arrivee+4

*---

mode_320	=	$00
mode_640	=	$80

screen_320	=	320
screen_640	=	640

ptr012000	=	$012000
ptrE12000	=	$e12000

*---

TRUE	=	1
FALSE	=	0

fgLOAD	=	1	; flags for choix_aventure
fgRESTART	=	2

*----------------------------------- Entry point

	phk
	plb

	clc
	xce
	rep	#$30
	
	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	mainID
	ora	#$0100
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

okMEM1	sty	ptrIMAGE
	stx	ptrIMAGE+2
	stx	ptrMENU+2	; l'image de menu

*--- 64K pour la sauvegarde de l'écran

	jsr	make64KB
	bcs	koMEM
	
	sep	#$10	; save pointer+2
	stx	saveBACK1+3	; for interactions
	stx	loadBACK1+3	; with the toolbox
	stx	ptrFOND+2	; l'image de fond
	rep	#$10

*--- 64K pour les images compressees

	jsr	make64KB
	bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
	
*--- 64K pour les INDEX des textes

	jsr	make64KB
	bcs	koMEM

	sty	ptrINDEX
	stx	ptrINDEX+2
	
*--- 64K pour les TEXTES

	jsr	make64KB
	bcs	koMEM

	sty	ptrTEXTES
	stx	ptrTEXTES+2
	
*--- Chargement des outils

	pha
	pha
	PushWord	mainID
	PushWord	#refIsResource
	PushLong	#1
	_StartUpTools
	PullLong	SStopREC
	bcc	okTOOL
	
	pha
	PushLong	#tolSTR1
	PushLong	#errSTR2
	PushLong	#errSTR1
	PushLong	#errSTR2
	_TLTextMountVolume
	pla
	brl	meQUIT0

*--- Et la musique...

okTOOL	_HideMenuBar

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

	_InitCursor
	_HideCursor

	PushLong	#0
	_GetPort
	PullLong	mainPORT

	PushLong	mainPORT
	_SetPort
	
*----------------------------------------
* INITIALISATIONS
*----------------------------------------

	jsr	load_font	; charge courier.10
	jsr	initNTP
	jsr	randomNTP	; select a sequence 0-7
	
	jsr	set_language
	jsr	doSOUNDON	; NTP on
	
	jsr	initialisation_absolue
	jsr	generique

*-----------------------
* MAIN - OK
*-----------------------
* main

main	jsr	fadeOUT
	jsr	choix_aventure
	jsr	initialisation_relative
	jsr	fadeOUT

*---
	
mainLOOP	lda	scene_actuelle
	jsr	nouvelle_scene	; on initialise la scène
	lda	scene_actuelle
	jsr	image		; on charge une image éventuelle
	lda	scene_actuelle
	jsr	get_textes		; on détermine le texte
	jsr	prepare_texte	; que l'on prepare le texte
	jsr	mots_clicables	; on y ajoute les mots cliquables
	jsr	affiche_texte	; et on l'affiche
	
*----------------------------------------
* TASK MASTER (no more)
*----------------------------------------

taskLOOP	inc	VBLCounter0

	PushWord #0
	PushWord #0
	PushWord #$c000
	PushWord #0
	_HandleDiskInsert
	pla
	pla

	pha
	PushWord #%00000000_00001010
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	taskLOOP

	lda	taskREC
	asl
	tax
	jsr	(taskTBL,x)

	lda	escape	; on a une condition de sortie
	cmp	#FALSE
	bne	main
	
	lda	fgSUITEFORCEE
	cmp	#TRUE
	beq	mainLOOP

	lda	deplacement	; si on doit bouger, on fait un...
	cmp	#TRUE
	beq	mainLOOP	; ...grand saut
	bne	taskLOOP	; ...sinon on attend

*----------------------------------- Gestion du keyDown
* on gère les open-apple-qqch

doKEYDOWN	lda	taskMODIFIERS
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
	asc	'?'
	hex	ff
	
tblKEYADDRESS
	da	doQUIT,doQUIT,doLOAD,doLOAD,doSAVE,doSAVE
	da	doRESTART,doRESTART
	da	doMUSIK,doMUSIK
	da	help

*----------------------------------- Gestion du mouseUp
* on compare les coordonnées avec celles du incontent
* si dans le même rectangle, on traite

doMOUSEDOWN

doMOUSEUP	lda	scene_actuelle	; a-t-on des mots cliquables ?
	jsr	suite_forcee
	
	lda	fgSUITEFORCEE
	cmp	#FALSE
	beq	mup1
	rts		; non, on sort

mup1	jsr	clic_mot	; oui, on vérifie si on a cliqué sur un mot => mot$
	bcc	mup2	; oui
	rts
mup2	lda	scene_actuelle
	jsr	aiguille	; on aiguille le joueur si c'est le second clic
	rts
	
*-----------------------------------
* AUTRES ROUTINES
*-----------------------------------

switch_320	lda	#0	; Switch to 320 mode
	ldy	#screen_320
	bra	switch_res

switch_640	lda	#$80	; Switch to 640 mode
	ldy	#screen_640
	
*-----------

switch_res	sty	mainWIDTH
	pha
	pha
	_SetMasterSCB
	_SetAllSCBs
	PushLong	#$e19e00
	_InitColorTable
	_InitCursor
	PushLong mainPORT
	_InitPort
	_HideCursor

	PushWord	#0
	PushWord	mainWIDTH
	PushWord	#0
	PushWord	#200
	_ClampMouse
	_HomeMouse
	PushLong	#monCURSEUR
	_SetCursor
	_ShowCursor
	_WindNewRes
	_MenuNewRes
	_CtlNewRes
	rts

*-----------

mainWIDTH	ds	2
oldWIDTH	ds	2
mainPORT	ds	4

*----------------------------------- Open

doLOAD	jsr	suspendMUSIC	; NTP off
	jsr	saveBACK
	
	PushWord #30
	PushWord #43
	PushLong #strLOADFILE
	PushLong #0
	PushLong #typeLIST
	PushLong #replyPTR
	_SFGetFile

	jsr	loadBACK

	lda	replyPTR
	bne	doLOAD1
	jsr	resumeMUSIC	; NTP on
	rts

doLOAD1	jsr	copyPATH
	jsr	loadALL
	bcc	doLOAD2
	rts
doLOAD2	jsr	fin_aventure
	jsr	initialisation_absolue

	lda	fiAVENTURE
	sta	aventure
	lda	fiSCENEACTUELLE
	sta	scene_actuelle
	
	sep	#$20
	ldx	#0
]lp	lda	fiSCENEVISITEE,x
	sta	scene_visitee,x
	inx
	cpx	#NB_TEXTES
	bcc	]lp
	rep	#$20
	
	lda	#fgLOAD
	sta	escape
	rts
	
*----------------------------------- Save

doSAVE	jsr	suspendMUSIC	; NTP off
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
	jsr	resumeMUSIC	; NTP on
	
	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1	jsr	copyPATH
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

loadALL	jsl	GSOS
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

loadKO99	rts

*---

loadPART	ldx	#2
	ldy	#fiAVENTURE
	jsr	loadIT

	ldx	#2
	ldy	#fiSCENEACTUELLE
	jsr	loadIT
	
	ldx	#NB_TEXTES
	ldy	#fiSCENEVISITEE
	
loadIT	stx	proREADGAME+8
	sty	proREADGAME+4
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME
	rts

*--- Enregistre le fichier de sauvegarde

saveALL	jsl	GSOS
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

saveKO99	rts

*---

savePART	ldx	#2
	ldy	#aventure
	jsr	saveIT

	ldx	#2
	ldy	#scene_actuelle
	jsr	saveIT
	
	ldx	#NB_TEXTES
	ldy	#scene_visitee
	
saveIT	stx	proWRITEGAME+8
	sty	proWRITEGAME+4
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME
	rts

*----------------------------------- Restart

doRESTART	jsr	suspendMUSIC	; NTP off
	jsr	saveBACK

	PushWord #0
	PushWord #5
	PushLong #0
	pea	$0000
	lda	#alertRESTART
	ora	saveLANGUAGE
	pha
	_AlertWindow
	
	jsr	loadBACK
	
	pla
	beq	re1
	jmp	resumeMUSIC	; NTP on
	
re1	jsr	fin_aventure
	jsr	initialisation_absolue
	lda	#fgRESTART
	sta	escape
	rts

*----------------------------------- Quit

doQUIT	jsr	suspendMUSIC	; NTP off
	jsr	saveBACK
	
	PushWord #0
	PushWord #5
	PushLong #0
	pea	$0000
	lda	#alertQUIT
	ora	saveLANGUAGE
	pha
	_AlertWindow
	
	jsr	loadBACK
	jsr	resumeMUSIC	; NTP on
	
	pla
	beq	meQUIT
	rts

*----------------------------------- Quit

meQUIT	jsr	stopNTP
	
meQUIT0
	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1
	PushWord myID
	_DisposeAll

	PushWord mainID
	_DisposeAll

	PushWord mainID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------------------
* MEMOIRE
*----------------------------------------

make64KB	pha
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

*--------------------------------------

nextVBL	lda	#75
	pha
]lp	ldal	$e0c02e
	and	#$7f
	cmp	1,s
	blt	]lp
	cmp	#100
	bge	]lp
	pla

waitVBL	ldal	RDVBLBAR-1
	bpl	waitVBL
	rts

waitKEY	ldal	KBD-1
	bpl	waitKEY
	stal	KBDSTROBE-1
	rts

*--- On attend un clic ou une combinaison de touches

waitEVENT	inc	VBLCounter0

	PushWord #0
	PushWord #%00000000_00001010
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	waitEVENT
	
	lda	taskREC
	cmp	#mouseDownEvt
	beq	we_1
	rts
	
we_1	inc	VBLCounter0

	PushWord	#0
	PushWord	#0
	_StillDown
	pla
	bne	we_1
	
	lda	#mouseDownEvt
	rts

*--------------------------------------

fadeIN	sty   Debut
	stx   Debut+2

	_HideCursor
         
	ldy   #$2000
	sty   Arrivee
	ldx   #$00e1
	stx   Arrivee+2

	ldy	#$7e00
	lda	#0
]lp	sta	[Arrivee],y
	iny
	iny
	bpl	]lp

         ldy   #$7dfe
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

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
         
         _ShowCursor
         rts

*---

fadeOUT  lda   #$9e00
         sta   Debut
         lda   #$00e1
         sta   Debut+2

         _HideCursor
         
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
         
         _ShowCursor
         jmp	noircit_ecran

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrUNPACK: packed img (MUST BE AT $0000)
*   - ptrIMAGE: temp unpack zone
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

*----------------------- Memory manager

mainID	ds	2	; app ID
myID	ds	2	; user ID
myDP	ds	2

SStopREC	ds	4

* même 64k
ptrIMAGE	ds	4	; $0000: where a scene image is loaded
ptrMENU	adrl	$8000	; $8000: the menu picture

ptrFOND	adrl	$8000	; $0000: copy/paste du desktop, $8000: the fond picture

ptrUNPACK	ds	4	; $0000: where the background picture is laoded
ptrINDEX	ds	4	; les index des textes
ptrTEXTES	ds	4	; les textes

fgSND	ds	2	; set if sound file not loaded
haSND	ds	4	; the handle to the sound pointer
temp	ds	2

saveLANGUAGE	ds	2

*----------------------- Tool locator

verSTR1	str	'System 6.0.1 Required!'
verSTR2	str	'Press a key to quit'
fntSTR1	str	'Courier.10 font missing'
fntSTR2	str	'Please install it!'
tolSTR1	str	'Error while loading tools'
memSTR1	str	'Cannot allocate memory'
filSTR1	str	'Cannot load file'
errSTR1	str	'Quit'
errSTR2	str	''
errSTR3	str	'Continue'

*----------------------- Window manager

taskREC	ds	2	; wmWhat           +0
taskMESSAGE	ds	4	; wmMessage        +2
taskWHEN	ds	4	; wmWhen           +6
taskWHERE	ds	4	; wmWhere          +10
taskMODIFIERS ds	2	; wmModifiers      +14
taskDATA	ds	4	; wmTaskData       +16

taskTBL	da	doNOT	; 0 Null
	da	doMOUSEDOWN	; 1 mouseDownEvt
	da	doMOUSEUP	; 2 mouseUpEvt
	da	doKEYDOWN	; 3 keyDownEvt
	da	doNOT
	da	doNOT	; 5 autoKeyEvt
	da	doNOT	; 6 updateEvt
	da	doNOT
	da	doNOT	; 8 activateEvt
	da	doNOT	; 9 switchEvt
	da	doNOT	; A deskAccEvt
	da	doNOT	; B driverEvt
	da	doNOT	; C app1Evt
	da	doNOT	; D app2Evt
	da	doNOT	; E app3Evt
	da	doNOT	; F app4Evt

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

loadFILE	sta	proOPEN+4  ; filename
	sty	proREAD+4  ; RAM pointer low
	stx	proREAD+6  ; RAM pointer high

loadFILE1	stz	proERR

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

loadFILE2	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

	ldy	proREAD+12 ; length read
	ldx	proREAD+14
	clc
	rts

loadERR	sta	proERR
	jsr	loadFILE2
	ldy	#0
	tyx
	sec
	rts

*--- GS/OS data

proERR	ds	2

*--- For the game party

proCREATEGAME
	dw	7	; pcount
	adrl	pGAME	; pathname
	dw	$c3	; access_code
	dw	$5d	; file_type
	adrl	$801f	; aux_type
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

proSETPFX	dw	2
	dw	7
	adrl	pathIMAGES
	
proOPEN
	dw	12
	ds	2
	adrl	pMENU
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

pMENU	strl	'1/data/images/general/menu.lz4'
pFOND	strl	'1/data/images/general/fond.lz4'
pFONT	strl	'1/data/images/general/font.lz4'
pINDEX	strl	'1/data/textes/fr/TEXTES1.IND'
pTEXTES	strl	'1/data/textes/fr/TEXTES1.TEX'

*--- offset to aventure number is +25

pathIMAGES	strl	'1/data/images/aventure.x'
pIMAGE	strl	'7/x1234567.lz4'

pGAME	strl	'0/               '

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	game.s
	put	data.s
	put	ecr.s
	put	ntp.s
	
*---

	asc	0d
	asc	"----------------"0d
	asc	"                "0d
	asc	" TOUT A DISPARU "0d
	asc	"                "0d
	asc	" Antoine Vignau "0d
	asc	"Olivier  Zardini"0d
	asc	"                "0d
	asc	"   Noel  2022   "0d
	asc	"                "0d
	asc	"----------------"0d