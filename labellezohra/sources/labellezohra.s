*
* La Belle Zohra
*
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
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

@loadfile	mac
	lda	]1
	ldx	]2+2
	ldy	]2
	jsr	loadFILE
	eom

@fadein	mac
	lda	]2
	ldx	]1+2
	ldy	]1
	jsr	fadeIN
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
alertRESTART =	$0200

refIsPointer =	0
refIsHandle	=	1
refIsResource =	2

appleKey	=	$0100
mouseDownEvt =	$0001
mouseUpEvt	=	$0002
keyDownEvt	=	$0003

chrRET	=	$0d
chrESC	=	$1b

*--------------

dpFROM	=	$80
dpTO	=	dpFROM+4
dpTEXTES	=	dpTO+4	; pointeur vers les TEXTES
Debut	=	dpTEXTES+4
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

TRUE	=	255
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

	lda	#MES_DONNEES
	stal	$300
	lda	#^MES_DONNEES
	stal	$302
	
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

*--- Compacte la mémoire

okVERS	PushLong	#0
	PushLong	#$8fffff
	PushWord	myID
	PushWord	#%11000000_00000000
	PushLong	#0
	_NewHandle
	_DisposeHandle
	_CompactMem

*--- 64K pour les images des scènes

	jsr	make64KB
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
	stx	ptrBACKGND+2
	
*--- 64K pour les images du jeu

	jsr	make64KB
	bcs	koMEM

	sty	ptrFOND
	stx	ptrFOND+2
	stx	ptrICONES+2
	stx	fondToSourceLocInfo+4	; fond
	stx	iconToSourceLocInfo+4	; icon
	
*--- 64K pour les images compressees

	jsr	make64KB
	bcs	koMEM

	sty	ptrUNPACK
	stx	ptrUNPACK+2
	
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

*---

okTOOL	PushWord	#0
	_GetMasterSCB
	pla
	bmi	okSHADOW	; shadowing is on if bit 15 is set

	lda	#^ptrE12000	; shadowing is off, use slow RAM
	sta	ptrSCREEN+2

*--- Et la musique...

okSHADOW	pha
	_SoundToolStatus
	pla
	bne	noSOUND

	lda	#1
	sta	fgSND

noSOUND	_HideMenuBar

	PushWord	#0
	PushWord	#%11111111_11111111
	PushWord	#0
	_FlushEvents
	pla

	_InitCursor

	PushLong	#0
	PushWord	#5	; SetDeskPat
	PushWord	#$4000
	PushWord	#$0000
	_Desktop
	pla
	pla

	pha
	pha
	PushLong	#0
	PushLong	#wMAIN
	PushLong	#PAINTMAIN
	PushLong	#0
	PushWord	#refIsResource
	PushLong	#wMAIN
	PushWord	#$800e
	_NewWindow2
	PullLong	wiMAIN

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

entryPOINT
	jsr	TWILIGHToff
	jsr	set_language
	jsr	init
	jsr	antoine	; on change !
	jsr	init2
	
*-----------------------
* MAIN
*-----------------------

	@fadein	ptrFOND;#TRUE
	jsr	waitEVENT
	@fadein	ptrICONES;#TRUE
	
mainLOOP	jsr	teste_fin
	jsr	demande_objet
	
*----------------------------------------
* TASK MASTER
*----------------------------------------

taskLOOP	inc	VBLCounter0

	PushWord	#0
	PushWord	#0
	PushWord	#$c000
	PushWord	#0
	_HandleDiskInsert
	pla
	pla

*	jsr	checkREPLAY

	PushWord	#0
	PushWord	#%11111111_11111111
	PushLong	#taskREC
	_TaskMaster
	pla
	beq	taskLOOP
	 
	asl
	tax
	jsr	(taskTBL,x)
	bra	taskLOOP
	
*	lda	escape	; on a une condition de sortie
*	cmp	#FALSE
*	bne	main
*	
*	lda	deplacement	; si on doit bouger, on fait un...
*	ora	fgSUITEFORCEE
*	cmp	#TRUE
*	beq	mainLOOP	; ...grand saut
*	bne	taskLOOP	; ...sinon on attend

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
	asc	'*'
	hex	ff
	
tblKEYADDRESS
	da	doQUIT,doQUIT,doLOAD,doLOAD,doSAVE,doSAVE
	da	doRESTART,doRESTART
	da	doMUSIK,doMUSIK
	da	monitor
	
doMUSIK	rts

*----------------------------------- Gestion du mouseUp
* on compare les coordonnées avec celles du incontent
* si dans le même rectangle, on traite

doMOUSEDOWN

doMOUSEUP
*	lda	fgSUITEFORCEE
*	cmp	#FALSE
*	beq	mup1
*	rts		; non, on sort
*
*mup1	jsr	clic_mot	; oui, on vérifie si on a cliqué sur un mot => mot$
*	bcc	mup2	; oui
*	rts
*mup2	jsr	aiguille	; on aiguille le joueur (1 ou 2 clics)
	rts

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
	PushLong	wiMAIN
	_DrawControls
	rtl

*-----------------------------------
* AUTRES ROUTINES
*-----------------------------------

*----------------------------------- Open

doLOAD
*	jsr	suspendMUSIC	; NTP off
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
*	jsr	resumeMUSIC	; NTP on
	rts

doLOAD1	jsr	copyPATH
	jsr	loadALL
	bcc	doLOAD2
	rts
doLOAD2	rts

*----------------------------------- Save

doSAVE
*	jsr	suspendMUSIC	; NTP off
	jsr	saveBACK
	
	PushWord #25
	PushWord #36
	PushLong #strSAVEFILE
	PushLong #namePATH
	PushWord #15
	PushLong #replyPTR
	_SFPutFile

	jsr	loadBACK
*	jsr	resumeMUSIC	; NTP on
	
	lda	replyPTR
	bne	doSAVE1
	rts

doSAVE1	jsr	copyPATH
	jmp	saveALL
	
*--- Recopie le filename du fichier de sauvegarde

copyPATH	sep	#$20
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
	
	jsl	GSOS
	dw	$2012
	adrl	proREADGAME

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadKO99	rts

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
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITEGAME
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

saveKO99	rts

*----------------------------------- Restart

doRESTART
*	jsr	suspendMUSIC	; NTP off
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
*	jmp	resumeMUSIC	; NTP on
	
re1
*	jsr	fin_aventure
*	jsr	initialisation_absolue
*	lda	#fgRESTART
*	sta	escape
	rts

*----------------------------------- Quit

doQUIT
*	jsr	suspendMUSIC	; NTP off
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
*	jsr	resumeMUSIC	; NTP on
	
	pla
	beq	meQUIT
	rts

*----------------------------------- Quit

meQUIT
*	jsr	stopNTP
	jsr	TWILIGHTon
	
meQUIT0	PushWord #refIsHandle
	PushLong SStopREC
	_ShutDownTools

meQUIT1	PushWord myID
	_DisposeAll

	PushWord mainID
	_DisposeAll

	PushWord mainID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

monitor	brk	$bd

*----------------------------------------
* TWILIGHT
*----------------------------------------

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

lenV1	=	$49bf
lenV2	=	$539a

offV1	=	$117a
offV2	=	$154c

TWILIGHToff
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
	lda	ptrTWILIGHT
	sta	Arrivee
	lda	ptrTWILIGHT+2
	sta	Arrivee+2
	ldy	offTWILIGHT
	lda	#$0ef0
	sta	[Arrivee],y
	rts

*--- Twilight II

ptrTWILIGHT	ds	4
fgTWILIGHT	ds	2
offTWILIGHT	ds	2

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

fadeIN	pha
	sty	Debut
	stx	Debut+2

	_HideCursor
         
	ldy	#$2000
	sty	Arrivee
	ldx	ptrSCREEN+2
	stx	Arrivee+2

	ldy	#$7e00
	lda	#0
]lp	sta	[Arrivee],y
	iny
	iny
	bpl	]lp

	pla		; ne copie pas les données
	cmp	#FALSE	; si à FALSE
	beq	fadeIN1
	
	ldy	#$7dfe
]lp	lda	[Debut],y
	sta	[Arrivee],y
	dey
	dey
	bpl	]lp

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

fadeOUT	lda	#$9e00
	sta	Debut
	lda	ptrSCREEN+2
	sta	Debut+2

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
*	jmp	noircit_ecran
	rts
	
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
*  lenDATA: unpacked data size
*
*----------------------------

unpackLZ4	sta	LZ4_Limit+1
	
*	jsr	suspendMUSIC
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
*	jmp	resumeMUSIC

*---

lenDATA	ds	4

*-----------------------------------
* SAVE THE SHR SCREEN
*-----------------------------------

saveBACK	_HideCursor
	PushLong	ptrSCREEN
	PushLong	ptrBACKGND
	PushLong	#32768
	_BlockMove
	_ShowCursor
	rts

*-----------------------------------
* RESTORE THE SHR SCREEN
*-----------------------------------

loadBACK	_HideCursor
	PushLong	ptrBACKGND
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove
	rts

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

mainID	ds	2	; app ID
myID	ds	2	; user ID
myDP	ds	2

SStopREC	ds	4

ptrSCREEN	adrl	ptr012000	; l'écran actif
ptrIMAGE	ds	4	; $0000: where a scene image is loaded
ptrBACKGND	adrl	$8000	; $8000: where the screen is saved
ptrFOND	ds	4	; $0000: fond de jeu
ptrICONES	adrl	$8000	; $0000: fond d'icônes du jeu
ptrUNPACK	ds	4	; $0000: where the background picture is laoded

ptrTEXTES	ds	4	; les pointeurs des textes

haBEAT	ds	4
ptrBEAT	ds	4

haSND1	ds	4
haSND2	ds	4
haSND3	ds	4
haSND4	ds	4
haSND5	ds	4
haSND6	ds	4
haSND7	ds	4
haSND8	ds	4
haSND9	ds	4
ptrSND1	ds	4
ptrSND2	ds	4
ptrSND3	ds	4
ptrSND4	ds	4
ptrSND5	ds	4
ptrSND6	ds	4
ptrSND7	ds	4
ptrSND8	ds	4
ptrSND9	ds	4

temp	ds	2

saveLANGUAGE	ds	2

*----------------------------------- Quickdraw II

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

palette640	dw	$0000,$000F,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	dw	$0000,$0F00,$00F0,$0FFF,$0000,$000F,$0FF0,$0FFF
	
blackPATTERN ds	32,$00
	ds	32,$11
	ds	32,$22
	ds	32,$33
	ds	32,$44
	ds	32,$55
	ds	32,$66
	ds	32,$77
	ds	32,$88
	ds	32,$99
	ds	32,$aa
	ds	32,$bb
	ds	32,$cc
	ds	32,$dd
	ds	32,$ee
whitePATTERN ds	32,$ff

checkeredPATTERN
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0
	hex	0F0F0F0F
	hex	F0F0F0F0

curPATTERN	ds	32

curPENSIZE	ds	4

*----------------------- Tool locator

verSTR1	str	'System 6.0.1 Required!'
verSTR2	str	'Press a key to quit'
fntSTR1	str	'Courier.10 font missing'
fntSTR2	str	'Please install it!'
pgmSTR1	str	'Data parsing error'
pgmSTR2	str	'Please report!'
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
	adrl	$001fffff	; wmTaskMask       +20
	ds	4	; wmLastClickTick  +24
	ds	2	; wmClickCount     +28
	ds	4	; wmTaskData2      +30
	ds	4	; wmTaskData3      +34
	ds	4	; wmTaskData4      +38
	ds	4	; wmLastClickPt    +42

taskTBL	da	doNOT	; 0 Null
	da	doMOUSEDOWN	; 1 mouseDownEvt
	da	doNOT	; 2 mouseUpEvt
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
	da	doNOT	; wInDesk
	da	doNOT	; wInMenuBar
	da	doNOT	; wCLickCalled
	da	doNOT	; wInContent - was doCONTENT
	da	doNOT	; wInDrag
	da	doNOT	; wInGrow
	da	doNOT	; wInGoAway
	da	doNOT	; wInZoom
	da	doNOT	; wInInfo
	da	doNOT	; wInSpecial
	da	doNOT	; wInDeskItem
	da	doNOT	; wInFrame
	da	doNOT	; wInactMenu
	da	doNOT	; wInClosedNDA
	da	doNOT	; wInCalledSysEdit
	da	doNOT	; wInTrackZoom
	da	doNOT	; wInHitFrame
	da	doNOT	; wInControl
	da	doNOT	; wInControlMenu

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
	adrl	$8020	; aux_type
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
	adrl	DEBUT_DATA	; 4 - data_buffer
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count

proWRITEGAME
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	DEBUT_DATA	; 4 - data_buffer (we are in same bank)
	adrl	FIN_DATA-DEBUT_DATA	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

*--- For the game images

proOPEN	dw	12
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

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	ds	4	; 4 - pointer
	ds	4	; 8 - length
	ds	4	; C - length read

proCLOSE	dw	1
	ds	2

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

proVERS	dw	1	; pcount
	ds	2	; version

*--- offset to image number is +19
*--- offset to language is +16
*--- offset to text number is +22
*--- offset to beat number is +22
*--- offset to sfxs number is +21

*                                1         2         3
*                        23456789012345678901234567890123456789

pIMAGE	strl	'1/data/images/PIC1.PIC'
pFOND	strl	'1/data/images/PIC10.PIC'
pICONES	strl	'1/data/images/PIC11.PIC'
pTXT	strl	'1/data/textes/fr/TEXTES'
pBEAT	strl	'1/data/musiques/BEAT1.SPL'
pSND	strl	'1/data/musiques/SND10.SND'

pGAME	strl	'0/               '

*----------------------------------------
* LES AUTRES FICHIERS
*----------------------------------------

	put	data.s
	put	game.s
	
*---

	asc	0d
	asc	"----------------"0d
	asc	"                "0d
	asc	" LA BELLE ZOHRA "0d
	asc	"                "0d
	asc	" Antoine Vignau "0d
	asc	"Olivier  Zardini"0d
	asc	"                "0d
	asc	"   Noel  2023   "0d
	asc	"                "0d
	asc	"----------------"0d