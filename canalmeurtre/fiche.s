*
* Canal Meurtre (éditeur)
*
* (c) 1986, Froggy Software
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	lst	off
	rel
	dsk	Fiche.l

	mx	%00
	xc
	xc

*----------------------------------- Macros

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Scrap.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/TextEdit.Macs
	use	4/Util.Macs
	use	4/Window.Macs

*----------------------------------- Constantes

*-------------- Softswitches

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
RDVBLBAR	=	$e0c019
GSOS	=	$e100a8

*-------------- GUI

wMAIN	=	1

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

*--- Programme

NB_FICHES	=	200	; nombre de fiches du jeu
TAILLE_FICHE =	255	; taille d'une fiche en octets

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
	
*--- 64K pour les NEWTV.BASE

	jsr	make64KB

	sty	ptrFICHES
	sty	proREAD+4
	sty	proWRITE+4
	stx	ptrFICHES+2
	stx	proREAD+6
	stx	proWRITE+6
	
	jsr	loadFILE
	jsr	init_fiche

*--- Chargement des outils

	pha
	pha
	PushWord myID
	PushWord #refIsResource
	PushLong #1
	_StartUpTools
	PullLong SStopREC

	_InitCursor

*--- Nettoie le cache de l'Event Manager

	PushWord #0
	PushWord #%11111111_11111111
	PushWord #0
	_FlushEvents
	pla

*----------------------------------------
* INITIALISATIONS
*----------------------------------------

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

	jsr	getFICHE
	
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

*----------------------------------- Gestion des contrôles (ça veut dire boutons ou lineedit)

doCONTROL
	lda	taskREC+38
	dec
	asl
	tax
	jsr	(taskCTL,x)
	rts

taskCTL	da	doLINE
	da	doLINE
	da	doLINE
	da	doLINE
	da	doLINE
	da	doQUIT
	da	doPREVIOUS
	da	doNEXT
	da	doSAVE

*----------------------------------------
* CODE DU JEU
*----------------------------------------

doNOT

*--- Les Line Edit

doLINE
	rts

*--- Bouton Enregistrer

doSAVE
	jsr	putFICHE
	jmp	saveFILE

*--- Bouton Quitter

doQUIT
	jsr	doSAVE

meQUIT
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

*--- Bouton Fiche précédente

doPREVIOUS
	jsr	putFICHE
	
	lda	P
	cmp	#1
	bne	okPREV
	rts
okPREV	sec
	sbc	#1
	sta	P
	jmp	getFICHE

*--- Bouton Fiche suivante

doNEXT
	jsr	putFICHE
	
	lda	P
	cmp	nbFICHES
	bcc	okNEXT
	beq	okNEXT
	rts
okNEXT	clc
	adc	#1
	sta	P
	jmp	getFICHE
	
*----------------------------------------
* GESTION DES FICHES
*----------------------------------------

*-----------------------
* printP - affiche le numéro de la fiche
*-----------------------

printP
	lda	#'  '
	sta	strP
	sta	strP+2

	PushWord P
	PushLong #strP
	PushWord #3
	PushWord #FALSE
	_Int2Dec

	pha
	pha
	_GetPort
	
	PushLong wiMAIN
	_SetPort
	
	PushWord #210
	PushWord #130
	_MoveTo
	
	PushLong #strP
	_DrawCString

	_SetPort
	rts

strP	asc	'      '00

*-----------------------
* getFICHE - De F à la fenêtre
*-----------------------

getFICHE
	jsr	get_fiche

	sep	#$30
	
	lda	#40	; Tell length is 40 chars
	sta	B1_6
	sta	B1_8
	sta	B1_10
	sta	B1_12
	sta	B1_14

	ldx	#0	; Move strings to the buffer
]lp	lda	C2_6,x
	sta	B2_6,x
	lda	C2_8,x
	sta	B2_8,x
	lda	C2_10,x
	sta	B2_10,x
	lda	C2_12,x
	sta	B2_12,x
	lda	C2_14,x
	sta	B2_14,x
	inx
	cpx	#40
	bcc	]lp

	rep	#$30
	
	PushLong wiMAIN	; Set LE
	PushLong #1
	PushLong #B1_6
	_SetLETextByID

	PushLong wiMAIN
	PushLong #2
	PushLong #B1_8
	_SetLETextByID

	PushLong wiMAIN
	PushLong #3
	PushLong #B1_10
	_SetLETextByID

	PushLong wiMAIN
	PushLong #4
	PushLong #B1_12
	_SetLETextByID

	PushLong wiMAIN
	PushLong #5
	PushLong #B1_14
	_SetLETextByID
	
	jmp	printP
	
*-----------------------
* putFICHE - De la fenêtre à F
*-----------------------

putFICHE
	PushLong wiMAIN	; Get LE
	PushLong #1
	PushLong #B1_6
	_GetLETextByID

	PushLong wiMAIN
	PushLong #2
	PushLong #B1_8
	_GetLETextByID

	PushLong wiMAIN
	PushLong #3
	PushLong #B1_10
	_GetLETextByID

	PushLong wiMAIN
	PushLong #4
	PushLong #B1_12
	_GetLETextByID

	PushLong wiMAIN
	PushLong #5
	PushLong #B1_14
	_GetLETextByID

	sep	#$30

	ldx	#0	; Clear destination strings
	lda	#' '
]lp	sta	C2_6,x
	sta	C2_8,x
	sta	C2_10,x
	sta	C2_12,x
	sta	C2_14,x
	inx
	cpx	#40
	bcc	]lp

	ldx	B1_6	; Move strings to buffer
	beq	pf_2
	ldx	#0
]lp	lda	B2_6,x
	sta	C2_6,x
	inx
	cpx	B1_6
	bcc	]lp
pf_2
	ldx	B1_8
	beq	pf_3
	ldx	#0
]lp	lda	B2_8,x
	sta	C2_8,x
	inx
	cpx	B1_8
	bcc	]lp
pf_3
	ldx	B1_10
	beq	pf_4
	ldx	#0
]lp	lda	B2_10,x
	sta	C2_10,x
	inx
	cpx	B1_10
	bcc	]lp
pf_4
	ldx	B1_12
	beq	pf_5
	ldx	#0
]lp	lda	B2_12,x
	sta	C2_12,x
	inx
	cpx	B1_12
	bcc	]lp
pf_5
	ldx	B1_14
	beq	pf_6
	ldx	#0
]lp	lda	B2_14,x
	sta	C2_14,x
	inx
	cpx	B1_14
	bcc	]lp
pf_6

	rep	#$30
	jmp	set_fiche	; and save the data at ptrFICHES
	
*-----------------------
* init_fiche
*-----------------------

init_fiche
	stz	nbFICHES	; 0 texts on entry

	lda	proEOF	; is file empty?
	ora	proEOF+2
	bne	if1
	rts

if1
	lda	ptrFICHES
	sta	dpFROM
	clc
	adc	proEOF
	sta	dpTO
	lda	ptrFICHES+2
	sta	dpFROM+2
	adc	proEOF+2
	sta	dpTO+2
	
if2
	lda	dpFROM+2	; did we reach the end of the file?
	cmp	dpTO+2
	bcc	if3
	lda	dpFROM
	cmp	dpTO
	bcc	if3
	rts			; we are done!

if3
	lda	nbFICHES	; save the address of the string
	asl
	asl
	tax
	lda	dpFROM
	sta	tblFICHES,x
	lda	dpFROM+2
	sta	tblFICHES+2,x

	lda	dpFROM
	clc
	adc	#TAILLE_FICHE
	sta	dpFROM
	lda	dpFROM+2
	adc	#0
	sta	dpFROM+2
	
	inc	nbFICHES	; increment the number of strings
	lda	nbFICHES	; into our limit
	cmp	#NB_FICHES
	bcc	if2
	rts

*-----------------------
* get_fiche(fiche%) - From ptrFICHES to F
*-----------------------

get_fiche
	lda	P
	bne	get_fiche1
	rts

get_fiche1
	cmp	nbFICHES
	bcc	get_fiche2
	beq	get_fiche2
	rts

get_fiche2
	dec
	asl
	asl
	tax
	lda	tblFICHES,x
	sta	dpFICHES
	lda	tblFICHES+2,x
	sta	dpFICHES+2

	ldy	#TAILLE_FICHE-1
	sep	#$20
]lp	lda	[dpFICHES],y
	sta	F,y
	dey
	bpl	]lp
	rep	#$20
	rts

*-----------------------
* set_fiche(fiche%) - From F to ptrFICHES
*-----------------------

set_fiche
	lda	P
	bne	set_fiche1
	rts

set_fiche1
	cmp	nbFICHES
	bcc	set_fiche2
	beq	set_fiche2
	rts

set_fiche2
	dec
	asl
	asl
	tax
	lda	tblFICHES,x
	sta	dpFICHES
	lda	tblFICHES+2,x
	sta	dpFICHES+2

	ldy	#TAILLE_FICHE-1
	sep	#$20
]lp	lda	F,y
	sta	[dpFICHES],y
	dey
	bpl	]lp
	rep	#$20
	rts

*---------------------------------------- Les données d'une fiche

P	dw	1	; 1ère fiche
nbFICHES	ds	2

tblFICHES	ds	4*NB_FICHES

F	ds	1	; fiche OK (non zero) ou KO (zero)
C2_1	ds	2
C2_2	ds	25
C2_3	ds	2
C2_4	ds	2
C2_5	ds	4
C2_6	ds	40
C2_7	ds	4
C2_8	ds	40
C2_9	ds	4
C2_10	ds	40
C2_11	ds	4
C2_12	ds	40
C2_13	ds	4
C2_14	ds	40
	ds	3	; garbage

*---------------------------------------- Les données des LineEdit

B1_6	ds	1
B2_6	ds	40

B1_8	ds	1
B2_8	ds	40

B1_10	ds	1
B2_10	ds	40

B1_12	ds	1
B2_12	ds	40

B1_14	ds	1
B2_14	ds	40

	ds	117	; bad coder...
	
*----------------------------------------
* FENETRES
*----------------------------------------

PAINTMAIN
	PushLong wiMAIN
	_DrawControls
	rtl
	
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
* DATA
*----------------------------------------

*----------------------- Fenetres

wiMAIN	ds	4

*----------------------- Memory manager

myID	ds	2
myDP	ds	2

SStopREC	ds	4

ptrFICHES	ds	4

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
         da    doNOT      ; mouseUpEvt
         da    doNOT      ; keyDownEvt
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
* GS/OS
*----------------------------------------

loadFILE
	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	
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

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*---

saveFILE
	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	
	lda	proOPEN+2
	sta	proWRITE+2
	sta	proCLOSE+2
	
	lda	proEOF
	sta	proWRITE+8
	lda	proEOF+2
	sta	proWRITE+10
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITE

	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	rts

*--- GS/OS data

proOPEN
	dw	12
	ds	2
	adrl	pFICHES
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

proWRITE
	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	ds	4	; 4 - data_buffer (we are in same bank)
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

proCLOSE
	dw	1
	ds	2

proQUIT
	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*---

pFICHES	strl	'1/NEWTV.BASE'
