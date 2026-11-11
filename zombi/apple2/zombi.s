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
	
*-----------------------------------
* MAIN LOOP
*-----------------------------------

	ldx	ptrPLATEAU+2
	ldy	ptrPLATEAU
	lda	#TRUE
	jsr	fadeIN

outerLOOP	lda	SALLE
	jsr	loadPICTURE
	
]lp	jsr	INKEY	; wait for something
	bcs	]lp

	inc	SALLE
	lda	SALLE
	cmp	#MAX_SALLE
	bcc	outerLOOP
	beq	outerLOOP

	lda	#TRUE
	jsr	fadeOUT
	jmp	QUIT
	
*-----------------------------------
* INIT
*-----------------------------------

INIT_ALL	ldx	#FIN_DATA-DEBUT_DATA
]lp	stz	SALLE,x
	dex
	bpl	]lp
	
	lda	#FIRST_ROOM
	sta	SALLE
	rts

*-----------------------------------
* CODE SPECIFIQUE
*-----------------------------------

*-------------------------------
* The real INKEY...

INKEY	jsr	checkREPLAY

	pha
	PushWord #%11111111_11111111
	PushLong #taskREC
	_GetNextEvent
	pla
	beq	INKEY_NO

*	jsr	checkMUSIC
*	bcc	INKEY

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

*--- Données du jeu

DEBUT_DATA

SALLE	ds	2
NBOBJ	ds	2

FIN_DATA

*--- End of code