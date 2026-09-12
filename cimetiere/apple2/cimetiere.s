*
* Le cimetière des ocelots
*
* (c) 2026, Turk182
* (c) 2026, Brutal Deluxe Software
*

	mx	%00

*-------------------------------
* EQUATES
*-------------------------------

MAX_LEN	=	32
NB_CAR	=	16	; max size of a word
LEN_WORD	=	5	; but limit to 4

FIRST_ROOM	=	1
WIN_ROOM	=	64

MAX_AF	=	41
MAX_ENIGME	=	32
MAX_LIEU	=	64
MAX_MESSAGE	=	154	; two added
MAX_OBJET	=	32

*-------------------------------
* MACROS
*-------------------------------

@getvn	mac
	lda	]1
	jsr	GETVN
	<<<

@lieu	mac
	lda	]1
	jsr	printLIEU
	<<<

@message	mac
	lda	]1
	jsr	printMESSAGE
	<<<

@objet	mac
	lda	]1
	jsr	printOBJET
	<<<

@GET_F	mac
	ldx	]1
	jsr	GET_F
	<<<
	
@SET_F	mac
	ldx	]1
	lda	]2
	jsr	SET_F
	<<<

@GET_OP	mac
	ldx	]1
	jsr	GET_OP
	<<<
	
@SET_OP	mac
	ldx	]1
	lda	]2
	jsr	SET_OP
	<<<

*-------------------------------
* THE GAME
*-------------------------------

GAME	lda	#SP
	stal	$300
	lda	#^SP
	stal	$302

	@MODE	#1	; 320x200
	@BORDER	#0;#0
	@INK	#0;#0	; noir
	@INK	#1;#26	; blanc
	@INK	#2;#9	; vert
	@INK	#3;#15	; orange
	
	@PAPER	#0;#0
	@PEN	#0;#1
	@CLS	#0

	@WINDOW	#1;#tblWINDOW1	; pour les dialogues
	@PAPER	#1;#0
	@PEN	#1;#1
	
	@WINDOW	#2;#tblWINDOW2	; pour les commandes
	@PAPER	#2;#0
	@PEN	#2;#1
	
	@WINDOW	#3;#tblWINDOW3	; pour l'inventaire
	@PAPER	#3;#0
	@PEN	#3;#1
	
	@WINDOW	#4;#tblWINDOW4	; pour les objets visibles
	@PAPER	#4;#0
	@PEN	#4;#1
	
	@WINDOW	#5;#tblWINDOW5	; pour les directions
	@PAPER	#5;#0
	@PEN	#5;#1
	
	@WINDOW	#6;#tblWINDOW6	; pour le nom de la salle
	@PAPER	#6;#0
	@PEN	#6;#1
	
	jsr	:8000	; init all
	jsr	:1000	; dessine le cadre
	jmp	:2000	; joue

*---

tblWINDOW1	dw	3,39,21,22	; dialogue
tblWINDOW2	dw	3,39,24,24	; commande
tblWINDOW3	dw	29,39,5,13	; inventaire plateau
tblWINDOW4	dw	14,39,18,19	; objets de la salle
tblWINDOW5	dw	3,12,18,19	; directions de la salle
tblWINDOW6	dw	3,39,16,16	; nom de la salle

*-------------------------------
* 1000 - DESSINE LE CADRE
*-------------------------------

:1000	@CLS	#0
	
	@GFXPEN	#2
	@MOVE	#8;#398
	@DRAW	#632;#398
	@DRAW	#632;#2
	@DRAW	#8;#2
	@DRAW	#8;#398

	@MOVE	#16;#394
	@DRAW	#624;#394
	@DRAW	#624;#352
	@DRAW	#16;#352
	@DRAW	#16;#394

	@MOVE	#16;#344
	@DRAW	#420;#344
	@DRAW	#420;#184
	@DRAW	#16;#184
	@DRAW	#16;#344

	@MOVE	#428;#344
	@DRAW	#624;#344
	@DRAW	#624;#184
	@DRAW	#428;#184
	@DRAW	#428;#344

	@MOVE	#16;#176
	@DRAW	#624;#176
	@DRAW	#624;#136	; 144
	@DRAW	#16;#136	; 144
	@DRAW	#16;#176

	@MOVE	#16;#136
	@DRAW	#624;#136
	@DRAW	#624;#92
	@DRAW	#16;#92
	@DRAW	#16;#136

	@MOVE	#192;#136
	@DRAW	#192;#92

	@MOVE	#16;#92	; 84
	@DRAW	#624;#92	; 84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#92	; 84

	@MOVE	#16;#40	; ,32
	@DRAW	#624;#40	; 624,32
	@DRAW	#624;#8	; ,6
	@DRAW	#16;#8	; ,2
	@DRAW	#16;#40	; 32

	@PEN	#0;#1	; blanc
	@LOCATE	#0;#9;#2
	@message	#1
	rts
	
*-------------------------------
* 2000 - BOUCLE PRINCIPALE
*-------------------------------

:2000	@STREAM	#0	; go back to the main window

	lda	SP
	cmp	LP
	beq	:2005

	jsr	:3000	; load level
	lda	SP	; save level
	sta	LP
	jsr	:3180	; draw frame
	jsr	:3500	; level title

:2005	jsr	:3510	; print directions
	jsr	:4000	; print objects
	jsr	:4500	; print inventory

	lda	SP
	cmp	VP
	beq	:2010
	
	@CLS	#1
	jsr	:7050	; prend la description

	lda	#1	; affiche la
	sta	DD
	jsr	:5900
	stz	DD
	
	lda	SP	; on a changé de salle
	sta	VP

:2010	jsr	:5000	; saisie et traitement commande
	jmp	:2000	; loop

*-------------------------------
* 3000 - CHARGE LE NIVEAU
*-------------------------------

:3000	lda	SP	; load level then...
	jsr	loadLEVEL

* Décodons les octets

	lda	ptrIMAGE
	sta	dpTO
	lda	ptrIMAGE+2
	sta	dpTO+2
	
	ldx	#0
	txy
	sep	#$20
]lp	lda	ptrLEVEL,x
	and	#%1000_1000	; 00 08 80 88
	tay
	lda	tblAMS2IIGS2,y
	sta	[dpTO]
	lda	ptrLEVEL,x
	and	#%0100_0100	; 00 04 40 44
	tay
	lda	tblAMS2IIGS1,y
	ora	[dpTO]
	sta	[dpTO]

	inc	dpTO
	bne	:3010
	inc	dpTO+1

:3010	lda	ptrLEVEL,x
	and	#%0010_0010	; 00 02 20 22
	tay
	lda	tblAMS2IIGS2,y
	sta	[dpTO]
	lda	ptrLEVEL,x
	and	#%0001_0001	; 00 01 10 11
	tay
	lda	tblAMS2IIGS1,y
	ora	[dpTO]
	sta	[dpTO]

	inc	dpTO
	bne	:3020
	inc	dpTO+1

:3020	inx
	cpx	#48*78
	bcc	]lp
	
	rep	#$20
	
*			; 00 01 02 03
*	and	#%1000_1000	; 00 08 80 88
*	and	#%0100_0100	; 00 04 40 44
*	and	#%0010_0010	; 00 02 20 22
*	and	#%0001_0001	; 00 01 10 11
*
	
	PushLong #levelParamPtr
	_PaintPixels
	rts

*---

tblAMS2IIGS1	hex	00,02,02,00,02,00,00,00,02,00,00,00,00,00,00,00
	hex	01,03,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	01,00,03,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	01,00,00,00,03,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	01,00,00,00,00,00,00,00,03

tblAMS2IIGS2	hex	00,20,20,00,20,00,00,00,20,00,00,00,00,00,00,00
	hex	10,30,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	10,00,30,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	10,00,00,00,30,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	10,00,00,00,00,00,00,00,30

*---

levelParamPtr	adrl	levelToSourceLocInfo
	adrl	iconToDestLocInfo
	adrl	levelToSourceRect
	adrl	levelToDestPoint
	dw	$0000	; mode copy
	ds	4

levelToSourceLocInfo
	dw	mode320	; mode 320
	ds	4
	dw	96	; width in byte
	dw	0,0,78,192	; 

levelToSourceRect
	dw	0,0,78,192	; 126

levelToDestPoint
	dw	30,14

*-------------------------------
* 3180 - AFFICHE LE CADRE
*-------------------------------

:3180	@GFXPEN	#2
	@MOVE	#16;#344
	@DRAW	#420;#344
	@DRAW	#420;#184
	@DRAW	#16;#184
	@DRAW	#16;#344

	@MOVE	#428;#344
	@DRAW	#624;#344
	@DRAW	#624;#184
	@DRAW	#428;#184
	@DRAW	#428;#344

	@MOVE	#16;#176
	@DRAW	#624;#176
	@DRAW	#624;#136	; 144
	@DRAW	#16;#136	; 144
	@DRAW	#16;#176

	@MOVE	#16;#136
	@DRAW	#624;#136
	@DRAW	#624;#92
	@DRAW	#16;#92
	@DRAW	#16;#136

	@MOVE	#192;#136
	@DRAW	#192;#92

	@MOVE	#16;#92	; 84
	@DRAW	#624;#92	; 84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#92	; 84

	@MOVE	#16;#40	; ,32
	@DRAW	#624;#40	; 624,32
	@DRAW	#624;#8	; ,6
	@DRAW	#16;#8	; ,2
	@DRAW	#16;#40	; 32
	rts

:3240	@GFXPEN	#2
	@MOVE	#16;#136
	@DRAW	#624;#136
	@DRAW	#624;#92
	@DRAW	#16;#92
	@DRAW	#16;#136

	@MOVE	#192;#136
	@DRAW	#192;#92
	rts
	
:3250	@GFXPEN	#2
	@MOVE	#16;#92	; 84
	@DRAW	#624;#92	; 84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#92	; 84
	rts

*-------------------------------
* 3500 - LE TITRE
*-------------------------------

:3500	@CLS	#6
	@PEN	#6;#3	; orange

	lda	SP	; lieu index
	jsr	getLIEU	; its address in A
	jsr	LEN	; get string length
	pha
	
	lda	#DFT_WIDTH	; X = (WIDTH - LEN) / 2
	sec
	sbc	1,s
	lsr
	bne	:3501
	inc
:3501	tax
	pla
	ldy	#1	; Y = 1
	lda	#6	; S =  6
	jsr	LOCATE
	@lieu	SP	; print lieu
	rts

*-------------------------------
* 3505 - LES DIRECTIONS
*-------------------------------

:3505	@GFXPEN	#2
	@MOVE	#16;#176
	@DRAW	#624;#176
	@DRAW	#624;#144
	@DRAW	#16;#144
	@DRAW	#16;#176

:3510	@CLS	#5
	@PEN	#5;#2
	@LOCATE	#5;#1;#1	; #1;#3;#18
	@message	#5	; SORTIE(S):

	@PEN	#5;#1	; blanc

	stz	I	; flag pour la virgule
	
*	lda	SP	; adresse des directions
*	beq	:3540
*	dec
*	asl		; de la salle
*	asl
*	clc
*	adc	#tblDIRECTIONS
*	sta	dpFROM
*	
*	ldx	#0	; cherche une direction valable
*	txy
*	sep	#$20
*]lp	lda	(dpFROM),y
*	beq	:3530	; pas de direction valable

	lda	#1
	sta	DR
	sta	IX

]lp	jsr	:5250

	ldx	IX
	ldy	DR

	lda	GA
	beq	:3530

	bit	I	; une direction trouvee
	bpl	:3520	; doit-on mettre une virgule ?

	lda	#chrCOMMA
	sta	strISSUES-1,x
	inx
:3520	lda	refISSUES-1,y	; met la lettre de la direction
	sta	strISSUES-1,x
	dec	I	; on devra mettre une virgule
	inx
	stx	IX

:3530	inc	DR
	lda	DR
	cmp	#4
	bcc	]lp
	beq	]lp

	lda	#chrNULL	; put a trailing zero
	sta	strISSUES-1,x

*---

	rep	#$20	; affiche la chaîne
	
	cpx	#0	; aucune issue ?
	beq	:3540	; non, sort

	@LEN	#strISSUES
	pha

	lda	#12	; X = (WIDTH - LEN) / 2
	sec
	sbc	1,s
	lsr
	tax
	pla
	ldy	#2	; Y = 2
	lda	#5	; S =  5
	jsr	LOCATE
	@PRINT	#5;#strISSUES	; print lieu
:3540	rts

*-------------------------------
* 4000 - AFFICHE LES OBJETS
*-------------------------------

:4000	@CLS	#4
	@PEN	#4;#2

	stz	I	; flag pour la virgule

	ldx	#1
	ldy	#0

]lp	lda	OP-1,x	; a-t-on un objet
	and	#$ff	; dans la salle ?
	cmp	SP
	bne	:4010
	
	jsr	:4030	; ajoute l'objet à T$
	bcs	:4020	; ...on doit sortir

:4010	inx		; on boucle
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

* Quelle chaîne affichons-nous ?

:4020	cpy	#0	; a-t-on trouvé un objet ? ie. chaîne non vide
	bne	:4025	; oui

	@LOCATE	#4;#9;#1
	@message	#6	; vous voyez
	@PEN	#4;#1
	@LOCATE	#4;#12;#2
	@message	#7	; rien
	rts

:4025	@LOCATE	#4;#1;#1
	@message	#6	; vous voyez
	@PEN	#4;#1
	@LOCATE	#4;#13;#1	; affiche la chaîne des objets
	@PRINT	#4;#T$	; print les objets de la salle
	rts

* Ajout des objets

:4030	stx	IX	; save X

	bit	I	; si on a trouve un objet,
	bpl	:4040	; doit-on mettre une virgule ?
	
	lda	#strVIRGULE	; ajoute ", "
	jsr	:4070

:4040	ldx	IX
	jsr	:8050	; A contient @article
	jsr	:4070	; ajoute "Un " ou "Une "
	dec	I	; on aura besoin d'une virgule

	sty	IY	; sauve Y
	lda	IX	; index = objet
	jsr	getOBJET	; A contient @objet
	ldy	IY	; restaure Y
	jsr	:4070	; ajoute à la chaîne

	ldx	IX	; restore X
	cpy	#128
	bcs	:4060	; 128 = longueur maxi de la chaîne T$
	rts
:4060	sec		; on sort mécontent
	rts

* Ajoute à la chaîne

:4070	tax
	sep	#$20
]lp	lda	|$0000,x
	sta	T$,y
	beq	:4080
	inx
	iny
	bne	]lp
:4080	rep	#$20
	rts
	
*-------------------------------
* 4500 - INVENTAIRE (PLATEAU)
*-------------------------------

:4500	@CLS	#3
	@PEN	#3;#2	; vert
	@LOCATE	#3;#1;#1
	@message	#2
	@PEN	#3;#1	; blanc

	ldy	#2	; on commence ligne 2
	sty	IY

	ldx	#1
]lp	stx	I
	lda	OP-1,x
	and	#$ff
	cmp	#255
	bne	:4515
	
	@LOCATE	#3;#1;IY

	lda	I
	ldx	#8	; index pour Clé bronze
	cmp	#4
	beq	:4509
	cmp	#12
	beq	:4508
	cmp	#20
	beq	:4507
	cmp	#15
	beq	:4506
	cmp	#25
	beq	:4505
	cmp	#18
	beq	:4504
	jsr	printOBJET
	jmp	:4510

:4504	inx		; 13 pied biche
:4505	inx		; 12 sceau
:4506	inx		; 11 plan
:4507	inx		; 10 huile
:4508	inx		;  9 médaille
:4509	txa		;  8 clé bronze
	jsr	printMESSAGE

:4510	inc	IY	; on finit ligne 9
	lda	IY
	cmp	#2+8
	bcs	:4520
	
:4515	ldx	I
	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

:4520	rts

*-------------------------------
* 4530 - INVENTAIRE (COMMANDE)
*-------------------------------

:4530	@CLS	#0
	@LOCATE	#0;#15;#1	; #0;#35;#1 in MODE 2
	@message	#2

	lda	#3
	sta	IX
	sta	IY
	
	ldx	#1
]lp	stx	I
	lda	OP-1,x
	and	#$ff
	cmp	#255
	bne	:4530_NEXT
	
	@LOCATE	#0;IX;IY

	lda	I
	jsr	printOBJET
	inc	IY
	
:4530_NEXT	ldx	I
	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

	@LOCATE	#0;#11;#23	; #0;#30;#23 in MODE 2
	@message	#14
	@INKEY
	
	jsr	:1000
	stz	LP
	stz	VP
	rts

*-------------------------------
* 5000 - SAISIE DE LA COMMANDE
*-------------------------------

:5000	@CLS	#2	; efface la fenêtre de commande
	@PEN	#2;#2
	@LOCATE	#2;#1;#1	; #0;#3;#24
	
	jsr	showSALLE	; oh le vilain debug

	@message	#15	; affiche COMMANDE >_
	@PEN	#2;#1
	@INPUT	#TEXTBUFFER;#MAX_LEN

*-------------------------------
* 5010 - VERIFICATION DU VOCABULAIRE
*-------------------------------

:5010	@UPPER	#TEXTBUFFER;#TEXTBUFFER

	lda	lenSTRING	; a-t-on saisi des caractères ?
	bne	:5012	; oui
	rts		; non

:5012	@STRCMP	#strCHEAT;#TEXTBUFFER
	bcs	:5015
	
	lda	#WIN_ROOM	; c'est le cheat ;-)
	sta	SP
	jmp	:6580

:5015	@getvn	#TEXTBUFFER	; cherche verbe et nom
	@CLS	#1	; efface la fenêtre de dialogue
	
	lda	MO$1	; a-t-on des résultats ?
	ora	MO$2
	bne	:5016

	lda	#17	; je ne comprends pas
	sta	M$
	jmp	:5900
	
:5016			; on vérifie la forme du verbe (on s'en moque ici)
:5020	lda	MO$1
	cmp	#93	; QUITTER
	bne	:5025
	jsr	:6700
	rts

:5025
:5030	lda	MO$1
	cmp	#39	; R/REGARDER
	bne	:5040
	jsr	:7050
	jsr	:5900
	rts

:5040	lda	MO$1
	cmp	#7	; I/INVENTAIRE
	bne	:5050
	jsr	:4530
	rts

:5050	lda	MO$1
	cmp	#91	; SAUVER/SAVE
	bne	:5060
	jsr	:6000
	rts

:5060	lda	MO$1
	cmp	#90	; CHARGER/LOAD
	bne	:5065
	jsr	:6200
	rts

:5065	lda	MO$1
	cmp	#92	; RECOMMENCER
	bne	:5070
	jsr	:6800
	rts

* Les directions

:5070	stz	DR

	lda	MO$1
	cmp	#5	; une direction directe ?
	bcs	:5080
	sta	DR	; oui
	bra	:5110

:5080	lda	MO$1
	cmp	#10	; VA/ALLER ?
	bne	:5110

:5090	lda	MO$2
	cmp	#5
	bcs	:5110
	sta	DR

:5110	lda	DR
	beq	:5120
	jsr	:5300
	rts

* On reprend les actions

:5120	lda	MO$1
	cmp	#38	; PRENDRE
	bne	:5122
	jsr	:5400
	rts

:5122	lda	MO$1
	cmp	#26	; JETTE/JETER
	bne	:5130
	jsr	:5482
	rts

:5130	lda	MO$1
	cmp	#23	; EXAMINER
	beq	:5130_OK
	cmp	#16	; CHERCHER
	beq	:5130_OK
	cmp	#24	; FOUILLER
	bne	:5140

:5130_OK	jsr	:5500
	lda	AC
	cmp	#-1
	bne	:5140
	rts

:5140	jsr	:5600
	lda	AC
	cmp	#-1
	bne	:5150
	rts

:5150	lda	MO$1
	cmp	#36	; POSER
	bne	:5155
	jsr	:5450
	rts

:5155	jsr	:5800
	lda	AC
	cmp	#-1
	bne	:5160
	rts

:5160	lda	#18	; vous ne pouvez pas faire ca ici
	sta	M$
	jsr	:5900
	rts
	
*-------------------------------
* 5240 - SET DIRECTIONS
*-------------------------------

:5240	lda	SP
	beq	:5245
	dec		; -1
	asl
	asl		; *4
	clc
	adc	DR	; +1
	tax
	lda	tblDIRECTIONS-1,x	; b/c DR is 1..4
	and	#$ff
:5245	sta	NX
	rts

*-------------------------------
* 5250 - LES OUVERTURES CACHEES
*-------------------------------

:5250	lda	#-1
	sta	GA
	jsr	:5240
	
	lda	NX
	bne	:5251
	stz	GA
	rts

* EC = MIN(SP,NX) * 100 + MAX (SP,NX)

:5251	pha
	pha

	lda	SP
	cmp	NX
	bcc	:5251_MIN
	lda	NX
:5251_MIN	pha

	PushWord	#100
	_Multiply
	pla
	sta	EC
	pla		; we don't use
	
	lda	SP
	cmp	NX
	bcs	:5251_MAX
	lda	NX
:5251_MAX	clc
	adc	EC
	sta	EC

* FOR G = 1 TO 14 (la table a 15 entrées !)

	ldx	#0
]lp	lda	tbl8890,x	; IF EC = GE
	beq	:5253
	cmp	EC
	bne	:5252
	
	ldy	tbl8890+2,x	; AND F(GF) = 0
	lda	F-1,y
	and	#$ff
	bne	:5252

	lda	EC	; AND NOT(EC = 4445 AND SP = 45)
	cmp	#4445
	beq	:5252
	lda	SP
	cmp	#45
	beq	:5252

	stz	GA
	rts		; G=14 means end of FOR, ie. exit

:5252	inx
	inx
	cpx	#14*2	; difference entre 14 du FOR et la table de 15 entrées
	bcc	]lp

* Toutes les conditions

:5253	lda	EC
	cmp	#2129
	bne	:5253_1
	@GET_F	#18
	bne	:5253_1
	stz	GA
	jmp	:5254
:5253_1	lda	EC
	cmp	#3334
	bne	:5253_2
	@GET_F	#17
	bne	:5253_2
	stz	GA
	jmp	:5254
:5253_2	lda	EC
	cmp	#4048
	bne	:5254
	lda	SP
	cmp	#40
	bne	:5254
	@GET_F	#5
	bne	:5254
	stz	GA

:5254	lda	EC
	cmp	#4142
	bne	:5254_1
	@GET_F	#35
	bne	:5254_1
	stz	GA
	jmp	:5255
:5254_1	lda	SP
	cmp	#44
	bne	:5254_2
	lda	NX
	cmp	#43
	bne	:5254_2
	@GET_F	#39
	bne	:5254_2
	stz	GA
	jmp	:5255
:5254_2	lda	EC
	cmp	#3132
	bne	:5255
	@GET_F	#10
	bne	:5255
	stz	GA

:5255	lda	EC
	cmp	#4755
	bne	:5255_1
	lda	SP
	cmp	#47
	bne	:5255_1
	@GET_OP	#16
	cmp	#255
	beq	:5255_1
	@GET_F	#16
	bne	:5255_1
	stz	GA
	jmp	:5256
:5255_1	lda	EC
	cmp	#4856
	bne	:5256
	stz	GA
	
:5256	lda	EC
	cmp	#5556
	bne	:5256_1
	@GET_OP	#13
	cmp	#255
	beq	:5256_1
	stz	GA
	jmp	:5257
:5256_1	lda	EC
	cmp	#5253
	bne	:5257
	@GET_F	#35
	beq	:5256_2
	@GET_OP	#11
	cmp	#255
	beq	:5257
:5256_2	stz	GA

:5257	lda	EC
	cmp	#4957
	bne	:5257_1
	@GET_F	#38
	bne	:5257_1
	stz	GA
	jmp	:5258
:5257_1	lda	EC
	cmp	#6263
	bne	:5257_2
	lda	SP
	cmp	#62
	bne	:5257_2
	@GET_OP	#28
	cmp	#255
	beq	:5257_2
	stz	GA
	jmp	:5258
:5257_2	lda	EC
	cmp	#6364
	bne	:5258
	@GET_F	#40
	bne	:5258
	stz	GA

:5258	lda	SP
	cmp	#47
	bne	:5258_1
	lda	NX
	cmp	#48
	bne	:5258_1
	stz	GA
	jmp	:5259
:5258_1	lda	SP
	cmp	#48
	bne	:5259
	stz	GA
	lda	NX
	cmp	#47
	bne	:5259
	@GET_F	#31
	beq	:5259
	lda	#-1
	sta	GA

:5259	lda	EC
	cmp	#2532
	bne	:5259_1
	@GET_F	#41
	bne	:5259_1
	stz	GA
	jmp	:5260
:5259_1	lda	SP
	cmp	#47
	bne	:5259_2
	lda	NX
	cmp	#33
	bne	:5259_2
	@GET_F	#32
	bne	:5259_2
	stz	GA
	jmp	:5260
:5259_2	lda	SP
	cmp	#54
	bne	:5259_3
	lda	NX
	cmp	#41
	bne	:5259_3
	@GET_F	#19
	bne	:5259_3
	stz	GA
	jmp	:5260
:5259_3	lda	SP
	cmp	#63
	bne	:5259_4
	lda	NX
	cmp	#62
	bne	:5259_4
	lda	#-1
	sta	GA
	jmp	:5260
:5259_4	lda	SP
	cmp	#28
	bne	:5260
	lda	NX
	cmp	#29
	bne	:5260
	@GET_F	#25
	bne	:5260
	stz	GA
	
:5260	rts

*-------------------------------
* 5300 - DIRECTIONS
*-------------------------------

:5300	jsr	:5240

	lda	NX
	bne	:5301
	lda	#19	; aucun chemin dans cette direction
	sta	M$
	jmp	:5900

:5301	lda	SP
	cmp	#3
	bne	:5302
	lda	DR
	cmp	#4
	bne	:5302
	@GET_F	#22
	cmp	#0
	bne	:5302
	lda	#20	; vous tombez dans le ravin
	jmp	:6500

:5302	lda	SP
	cmp	#10
	bne	:5303
	lda	DR
	cmp	#4
	bne	:5303
	@GET_F	#33
	cmp	#0
	bne	:5303
	lda	#21	; la passerelle cede sous vos pieds
	jmp	:6500

:5303	lda	SP
	cmp	#43
	bne	:5303_2
	lda	DR
	cmp	#4
	bne	:5303_2
	@GET_F	#30
	bne	:5303_2
	lda	#22	; votre odeur n'a pas echappe au predateur
	jmp	:6500

:5303_2	lda	SP
	cmp	#51
	bne	:5304
	lda	DR
	cmp	#4
	bne	:5304
	@GET_F	#29
	cmp	#0
	bne	:5304
	lda	#23	; les pieges du temple vous sont fatals
	jmp	:6500

:5304	lda	SP
	cmp	#32
	bne	:5304_2
	lda	DR
	cmp	#1
	bne	:5304_2
	@GET_F	#41
	cmp	#0
	beq	:5304_2
	lda	#25
	sta	SP
	rts
:5304_2	jsr	:5250
	lda	GA
	bne	:5305
	lda	#24	; passage bloque. examinez le lieu
	sta	M$
	jmp	:5900

:5305	lda	NX
	sta	SP
	cmp	#WIN_ROOM
	beq	:5306
	rts
:5306	jmp	:6600	; on a gagné !

*-------------------------------
* 5390 - RETRAIT DES ARTICLES
*-------------------------------

:5390	rts

*-------------------------------
* 5400 - PRENDRE UN OBJET
*-------------------------------

:5400	jsr	:5390

	lda	SP
	cmp	#52
	bne	:5400_1
	lda	MO$2
	cmp	#55	; MASQUE
	bne	:5400_1
	@GET_F	#35
	cmp	#0
	bne	:5400_1

	lda	#25	; des dards jaillissent...
	jmp	:6500

:5400_1	stz	OI
	ldx	#1	; est-ce que le nom
]lp	lda	tblOV1-1,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	beq	:5400_2
	lda	tblOV2-1,x
	and	#$ff
	cmp	MO$2
	bne	:5400_3	; non, continue
	lda	OP-1,x
	and	#$ff	; il est dans la salle ?
	cmp	SP
	bne	:5400_3
:5400_2	stx	OI	; oui
	jmp	:5425	; saute la suite
	
:5400_3	inx		; prochain objet
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

:5410	lda	OI
	bne	:5425
	lda	SP
	cmp	#53
	bne	:5410_1
	lda	MO$2
	cmp	#33	; DENT
	bne	:5410_1
	lda	#26	; elle semble bouger
	sta	M$
	jmp	:5898

:5410_1	lda	OI
	bne	:5412

	stz	I
	ldx	#1	; est-ce que le nom
]lp	lda	tblOV1-1,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	beq	:5410_2
	lda	tblOV2-1,x
	and	#$ff
	cmp	MO$2
	bne	:5410_3	; non, continue
:5410_2	inc	I	; oui
:5410_3	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp
	
:5412	lda	OI
	bne	:5425
	lda	I
	beq	:5412_2
	lda	#27	; il n'y a pas cela ici
	sta	M$
	jmp	:5898
:5412_2	lda	#17	; je ne comprends pas
	sta	M$
	jmp	:5898

:5425	lda	OI
	cmp	#18
	bne	:5426
	@SET_OP	OI;#-1
	lda	#28	; tres utile pour le puits sec
	sta	M$
	jmp	:5900

:5426	lda	OI
	cmp	#13
	bne	:5427
	lda	SP
	cmp	#55
	bne	:5427
	@SET_OP	OI;#-1
	lda	#29	; une porte s'ouvre à l'est
	sta	M$
	jmp	:5898
	
:5427	lda	OI
	cmp	#19
	bne	:5428
	lda	SP
	cmp	#54
	bne	:5428
	@SET_OP	OI;#-1
	@SET_F	#19;#-1
	lda	#30	; vous prenez la lanterne...
	sta	M$
	jmp	:5898
	
:5428	lda	SP
	cmp	#34
	bne	:5429
	lda	OI
	cmp	#27
	beq	:5428_1
	cmp	#16
	bne	:5429
:5428_1	@SET_OP	OI;#-1
	lda	#31	; vous prenez le fragment
	sta	M$
	lda	OI
	cmp	#16
	bne	:5429
	lda	#32	; vous prenez la craie
	sta	M$
	
:5429	lda	SP
	cmp	#34
	bne	:5430
	lda	OI
	cmp	#27
	beq	:5429_1
	cmp	#16
	bne	:5430
:5429_1	jsr	:5900
	@WAIT	#60	; 1 seconde
	jsr	:7050
	lda	#1
	sta	DD
	jsr	:5900
	stz	DD
	rts

:5430	@SET_OP	OI;#-1	; on prend l'objet

	lda	OI
	sta	I
	
	@message	#33	; vous avez pris
	ldx	OI
	jsr	:8050	; UN/UNE
	jsr	PRINT_ALT	; nom de l'objet
	@objet	OI
	rts

*-------------------------------
* 5450 - POSER UN OBJET
*-------------------------------

:5450	jsr	:5390

	stz	OI
	ldx	#1	; est-ce que le nom
]lp	lda	tblOV1-1,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	beq	:5450_1
	lda	tblOV2-1,x
	and	#$ff
	cmp	MO$2
	bne	:5450_2	; non, continue
:5450_1	stx	OI	; oui, sors
	jmp	:5460
:5450_2	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

:5460	lda	OI
	bne	:5470
	lda	#17	; je ne comprends pas
	sta	M$
	jmp	:5900
	
:5470	@SET_OP	OI;SP

	lda	#34	; objet pose
	sta	M$
	jmp	:5900

*-------------------------------
* ADIEU OBJET
*-------------------------------

:5480	@SET_OP	CI;#-2
	rts

*-------------------------------
* 5482 - JETER UN OBJET
*-------------------------------

:5482	jsr	:5390

	stz	OI
	ldx	#1	; est-ce que le nom
]lp	lda	tblOV1-1,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	beq	:5402_1
	lda	tblOV2-1,x
	and	#$ff
	cmp	MO$2
	bne	:5482_2	; non, continue
:5402_1	stx	OI	; oui, sors
	jmp	:5484
:5482_2	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

:5484	lda	OI
	bne	:5486
	lda	#17	; je ne comprends pas
	sta	M$
	jmp	:5900

:5486	@SET_OP	OI;#-2
	lda	OI
	sta	I

	@message	#35	; vous jetez
	ldx	OI
	jsr	:8050	; UN/UNE
	jsr	PRINT_ALT	; nom de l'objet
	@objet	OI
	rts

*-------------------------------
* 5500 - FOUILLER
*-------------------------------

:5500	lda	#-1
	sta	AC
	stz	OI

:5501	lda	SP
	cmp	#1
	bne	:5502
	lda	MO$2
	cmp	#80	; STATUE
	beq	:5501_1
	cmp	#59
	bne	:5502
:5501_1	@GET_OP	#1
	cmp	#0
	bne	:5502
	@SET_OP	#1;#1
	lda	#36	; vous trouvez une pelle
	sta	M$
	jmp	:5898

:5502	lda	SP
	cmp	#2
	bne	:5503
	lda	MO$1
	cmp	#24	; FOUILLER
	bne	:5503
	lda	MO$2
	cmp	#42	; FOUGERE
	bne	:5503
	lda	#22
	sta	OI
	jmp	:5540

:5503	lda	SP
	cmp	#2
	bne	:5504
	lda	MO$2
	cmp	#42	; FOUGERE
	bne	:5504
	lda	#37	; j'ai l'impression qu'il y a...
	sta	M$
	jmp	:5898

:5504	lda	SP
	cmp	#3
	bne	:5505
	lda	MO$2
	cmp	#66	; PONT
	bne	:5505
	lda	#38	; le pont est fragile
	sta	M$
	jmp	:5898

:5505	lda	SP
	cmp	#5
	bne	:5506
	lda	MO$2
	cmp	#25	; CHENE
	bne	:5506
	@GET_OP	#4
	cmp	#0
	bne	:5505_1
	lda	#4
	sta	OI
	jmp	:5540
:5505_1	lda	#39	; la cavite est vide
	sta	M$
	jmp	:5898

:5506	lda	SP
	cmp	#13
	bne	:5507
	lda	MO$2
	cmp	#72	; ROCHER
	bne	:5507
	@GET_OP	#14
	cmp	#0
	bne	:5507
	@SET_OP	#14;#13
	lda	#40	; quelqu'un semble avoir oublie sa gourde
	sta	M$
	jmp	:5898

:5507	lda	SP
	cmp	#13
	bne	:5508
	lda	MO$2
	cmp	#79	; SOURCE
	beq	:5507_1
	cmp	#34
	bne	:5508
:5507_1	lda	#41	; l'eau semble suspecte
	sta	M$
	jmp	:5898

:5508	lda	SP
	cmp	#18
	bne	:5509
	lda	MO$2
	cmp	#86	; TREUIL
	bne	:5509
	@GET_F	#3
	cmp	#0
	beq	:5508_1
	lda	#42	; la corde est bien fixée
	sta	M$
	jmp	:5898
:5508_1	lda	#43	; on dirait qu'il manque une corde
	sta	M$
	jmp	:5898

:5509	lda	SP
	cmp	#22
	bne	:5510
	lda	MO$2
	cmp	#13	; ATELIER
	bne	:5510
	@GET_OP	#6
	cmp	#0
	bne	:5510
	@SET_OP	#6;#22
	@SET_OP	#7;#22
	lda	#44	; vous trouvez un marteau et un burin
	sta	M$
	jmp	:5898

:5510	lda	SP
	cmp	#20
	bne	:5511
	lda	MO$2
	cmp	#73	; SALLE
	bne	:5511
	lda	#45	; la salle résonne, idéal pour jouer de la musique
	sta	M$
	jmp	:5898

:5511	lda	SP
	cmp	#25
	bne	:5512
	lda	MO$2
	cmp	#87	; VILLAGE
	bne	:5512
	lda	#46	; c'est plein de débris
	sta	M$
	jmp	:5898

:5512	lda	SP
	cmp	#26
	bne	:5513
	lda	MO$2
	cmp	#68	; PUITS
	bne	:5513
	lda	#25
	sta	OI
	jmp	:5540

:5513	lda	SP
	cmp	#27
	bne	:5514
	lda	MO$2
	cmp	#53	; MAISON
	bne	:5514
	lda	#47	; vous voyez un blason et une table
	sta	M$
	jmp	:5898

:5514	lda	SP
	cmp	#27
	bne	:5515
	lda	MO$2
	cmp	#91	; TABLE
	bne	:5515
	lda	#15
	sta	OI
	jmp	:5540

:5515	lda	SP
	cmp	#28
	bne	:5516
	lda	MO$2
	cmp	#40	; FORGE
	bne	:5516
	@GET_OP	#20
	cmp	#0
	bne	:5516
	@SET_OP	#20;#28
	lda	#48	; vous trouvez une fiole d'huile
	sta	M$
	jmp	:5898

:5516	lda	SP
	cmp	#30
	bne	:5517
	lda	MO$2
	cmp	#83	; TOMBE
	bne	:5517
	lda	#5
	sta	OI
	jmp	:5540

:5517	lda	SP
	cmp	#31
	bne	:5518
	lda	MO$2
	cmp	#48	; JARDIN
	beq	:5517_1
	cmp	#65	; PLANTE
	bne	:5518
:5517_1	@GET_OP	#10
	cmp	#0
	bne	:5518
	@SET_OP	#10;#31
	lda	#49	; vous voyez un miroir et un autel
	sta	M$
	jmp	:5898

:5518	lda	SP
	cmp	#32
	bne	:5519
	lda	MO$2
	cmp	#85	; TOUR
	bne	:5519
	@GET_OP	#9
	cmp	#0
	bne	:5518_1
	@SET_OP	#9;#32
	lda	#50	; vous voyez une boussole et un escalier qui monte
	sta	M$
	jmp	:5898
:5518_1	lda	#51	; vous voyez un escalier qui monte
	sta	M$
	jmp	:5898

:5519	lda	SP
	cmp	#33
	bne	:5520
	lda	MO$2
	cmp	#80	; STATUE
	bne	:5520
	lda	#52	; elle bloque un passage
	sta	M$
	jmp	:5898

:5520	lda	SP
	cmp	#34
	bne	:5521
	lda	MO$2
	cmp	#95	; FRAGMENT
	beq	:5520_1
	cmp	#81	; STELE
	bne	:5521
:5520_1	@GET_OP	#27
	cmp	#0
	bne	:5521
	@SET_OP	#27;#34
	lda	#53	; vous trouvez le fragment manquant...
	sta	M$
	jmp	:5898

:5521	lda	SP
	cmp	#34
	bne	:5522
	lda	MO$2
	cmp	#78	; SOL
	bne	:5522
	lda	#16
	sta	OI
	jmp	:5540

:5522	lda	SP
	cmp	#34
	bne	:5523
	lda	MO$2
	cmp	#77	; SOCLE
	bne	:5523
	lda	#23
	sta	OI
	jmp	:5540

:5523	lda	SP
	cmp	#41
	bne	:5524
	lda	MO$2
	cmp	#11	; ANCRAGE
	bne	:5524
	lda	#21
	sta	OI
	jmp	:5540

:5524	lda	SP
	cmp	#43
	bne	:5525
	lda	MO$2
	cmp	#82	; TOILE
	bne	:5525
	lda	#30
	sta	OI
	jmp	:5540

:5525	lda	SP
	cmp	#46
	bne	:5526
	lda	MO$2
	cmp	#23	; CASCADE
	bne	:5526
	lda	#31
	sta	OI
	jmp	:5540

:5526	lda	SP
	cmp	#49
	bne	:5527
	lda	MO$2
	cmp	#38	; FLEUR
	bne	:5527
	lda	#32
	sta	OI
	jmp	:5540

:5527	lda	SP
	cmp	#50
	bne	:5528
	lda	MO$2
	cmp	#12	; ARBRE
	bne	:5528
	lda	#29
	sta	OI
	jmp	:5540

:5528	lda	SP
	cmp	#52
	bne	:5528_1	; on pourrait sauter à 5529 directement
	lda	MO$2
	cmp	#19	; BRAS
	bne	:5528_1
	lda	#54	; il semble qu'ils controlent...
	sta	M$
	jmp	:5898
:5528_1	lda	SP
	cmp	#52
	bne	:5529
	lda	MO$2
	cmp	#55	; MASQUE
	bne	:5529
	@GET_F	#35
	cmp	#0
	beq	:5529
	@GET_OP	#11
	cmp	#0
	bne	:5529
	@SET_OP	#11;#52
	lda	#55	; c'est un masque d'ocelot
	sta	M$
	jmp	:5898

:5529	lda	SP
	cmp	#53
	bne	:5530
	lda	MO$2
	cmp	#59	; OCELOT
	bne	:5530
	@GET_OP	#24
	cmp	#0
	bne	:5530
	lda	#56	; une dent bouge
	sta	M$
	jmp	:5898

:5530	lda	SP
	cmp	#54
	bne	:5531
	lda	MO$2
	cmp	#70	; RAYON
	bne	:5531
	lda	#26
	sta	OI
	jmp	:5540

:5531	lda	SP
	cmp	#54
	bne	:5532
	lda	MO$2
	cmp	#15	; BIBLIOTHEQUE
	bne	:5532
	lda	#19
	sta	OI
	jmp	:5540

:5532	lda	SP
	cmp	#10
	bne	:5533
	lda	MO$2
	cmp	#66	; PONT
	beq	:5532_1
	cmp	#60	; PASSERELLE
	bne	:5533
:5532_1	@GET_F	#33
	cmp	#0
	bne	:5532_2
	lda	#57	; la passerelle est fragile
	sta	M$
	jmp	:5898
:5532_2	lda	#58	; la passerelle semble sécurisée
	sta	M$
	jmp	:5898
	
:5533	lda	SP
	cmp	#6
	bne	:5534
	lda	MO$2
	cmp	#75	; SERRURE
	bne	:5534
	lda	#59	; elle semble faite de bronze
	sta	M$
	jmp	:5898

:5534	lda	SP
	cmp	#6
	bne	:5535
	lda	MO$2
	cmp	#21	; CABANE
	bne	:5535
	@GET_F	#4
	cmp	#0
	beq	:5535
	@GET_OP	#2
	cmp	#0
	bne	:5535
	@SET_OP	#2;#6
	lda	#60	; vous trouvez une torche
	sta	M$
	jmp	:5898

:5535	lda	SP
	cmp	#6
	bne	:5536
	lda	MO$2
	cmp	#21	; CABANE
	bne	:5536
	lda	#61	; vous ne voyez rien de spécial
	sta	M$
	jmp	:5898

:5536	lda	SP
	cmp	#29
	bne	:5537
	lda	MO$2
	cmp	#24	; CHAPELLE
	bne	:5537
	lda	#62	; il semble qu'un sceau a été arraché
	sta	M$
	jmp	:5898

:5537	lda	SP
	cmp	#25
	bne	:5538
	lda	MO$2
	cmp	#32	; DEBRIS
	bne	:5538
	lda	#18
	sta	OI
	jmp	:5540

:5538	lda	SP
	cmp	#27
	bne	:5539
	lda	MO$2
	cmp	#17	; BLASON
	bne	:5539
	lda	#12
	sta	OI
	jmp	:5540

:5539	lda	SP
	cmp	#31
	bne	:5540
	lda	MO$2
	cmp	#14	; AUTEL
	bne	:5540
	lda	#63	; avec un miroir vous y verrez mieux
	sta	M$
	jmp	:5898

:5540	lda	OI
	cmp	#0
	beq	:5541
	@GET_OP	OI
	cmp	#0
	bne	:5541
	@SET_OP	OI;SP
	lda	OI
	sta	I
	@message	#64	; vous trouvez...
	ldx	OI
	jsr	:8050	; UN/UNE
	jsr	PRINT_ALT
	@objet	OI	; nom de l'objet
	rts

:5541	lda	SP
	cmp	#44
	bne	:5542
	lda	MO$2
	cmp	#41	; FOSSE
	beq	:5541_1
	cmp	#64	; PIEU
	bne	:5542
:5541_1	lda	#65	; ah si j'avais un marteau...
	sta	M$
	jmp	:5898

:5542	lda	SP
	cmp	#47
	bne	:5543
	lda	MO$2
	cmp	#52	; LYNX
	bne	:5543
	lda	#66	; il semble attiré par une offrande qui sent bon
	sta	M$
	jmp	:5898

:5543	lda	SP
	cmp	#55
	bne	:5544
	lda	MO$2
	cmp	#43	; FRESQUE
	bne	:5544
	lda	#67	; ces traits effacés pourraient être retracés
	sta	M$
	jmp	:5898

:5544	lda	SP
	cmp	#35
	bne	:5544_1
	lda	MO$2
	cmp	#14	; AUTEL
	bne	:5544_1
	lda	#68	; il semble attendre une pierre
	sta	M$
	jmp	:5898
:5544_1	lda	SP
	cmp	#35
	bne	:5546
	lda	MO$2
	cmp	#71	; RIGOLE
	bne	:5546
	lda	#69	; elles devaient contenir de l'eau
	sta	M$
	jmp	:5898
	
:5546	lda	SP
	cmp	#39
	bne	:5547
	lda	MO$2
	cmp	#31	; CRYPTE
	bne	:5547
	lda	#70	; une empreinte ronde semble attendre...
	sta	M$
	jmp	:5898

:5547	lda	SP
	cmp	#58
	bne	:5548
	lda	MO$2
	cmp	#63	; PIERRE
	bne	:5548
	lda	#71	; elles ont l'air d'avoir perdu le nord
	sta	M$
	jmp	:5898

:5548	lda	SP
	cmp	#60
	bne	:5549
	lda	MO$2
	cmp	#37	; ESCALIER
	bne	:5549
	lda	#72	; vous voyez une inscription
	sta	M$
	jmp	:5898

:5549	lda	SP
	cmp	#62
	bne	:5550
	lda	MO$2
	cmp	#76	; SILHOUETTE
	bne	:5550
	lda	#73	; le gardien semble vouloir vous parler
	sta	M$
	jmp	:5898

:5550	stz	AC
	rts

*-------------------------------
* 5600 - AUTRES ACTIONS
*-------------------------------

:5600	lda	#-1
	sta	AC

:5601	lda	SP
	cmp	#41
	bne	:5602
	@INSTR	#TEXTBUFFER;#strCORDE
	cmp	#TRUE
	bne	:5602
	@INSTR	#TEXTBUFFER;#strCROCHET
	cmp	#TRUE
	bne	:5602
	jmp	:5785

:5602	lda	SP
	cmp	#41
	bne	:5605
	@INSTR	#TEXTBUFFER;#strCROCHET
	cmp	#FALSE
	beq	:5605
	@INSTR	#TEXTBUFFER;#strCORDE
	cmp	#TRUE
	bne	:5605
	lda	#74	; avec une corde, ce serait mieux
	sta	M$
	jmp	:5898

:5605	lda	SP
	cmp	#3
	bne	:5606
	lda	MO$2
	cmp	#92	; PLANCHE
	bne	:5606
	@GET_OP	#22
	cmp	#255
	bne	:5606
	@SET_F	#22;#-1
	lda	#75	; le pont semble securise
	sta	M$
	jmp	:5898

:5606	lda	SP
	cmp	#10
	bne	:5610
	lda	MO$2
	cmp	#92	; PLANCHE
	bne	:5610
	@GET_OP	#22
	cmp	#255
	bne	:5610
	@SET_F	#33;#-1
	lda	#22
	sta	CI
	jsr	:5480
	lda	#76	; la passerelle semble securisee
	sta	M$
	jmp	:5898
	
:5610	lda	SP
	cmp	#6
	bne	:5615
	lda	MO$2
	cmp	#26	; CLE
	bne	:5615
	@GET_OP	#4
	cmp	#255
	bne	:5615
	@SET_F	#4;#-1
	lda	#4
	sta	CI
	jsr	:5480
	lda	#77	; la porte s'ouvre
	sta	M$
	jmp	:5898

:5615	lda	SP
	cmp	#13
	bne	:5620
	lda	MO$1
	cmp	#40	; REMPLIR
	bne	:5620
	lda	MO$2
	cmp	#44	; GOURDE
	beq	:5615_1
	cmp	#34	; EAU
	bne	:5620
:5615_1	@GET_OP	#14
	cmp	#255
	bne	:5620
	@SET_F	#34;#-1
	lda	#78	; la gourde est pleine
	sta	M$
	jmp	:5898
	
:5620	lda	SP
	cmp	#14
	bne	:5625
	lda	MO$1
	cmp	#17	; CREUSER
	beq	:5620_1
	lda	MO$2
	cmp	#61	; PELLE
	bne	:5625
:5620_1	@GET_OP	#1
	cmp	#255
	bne	:5625
	@SET_F	#1;#-1
	lda	#1
	sta	CI
	jsr	:5480
	lda	#79	; vous degagez le passage vers le sud
	sta	M$
	jmp	:5898

:5625	lda	SP
	cmp	#18
	bne	:5629
	lda	MO$2
	cmp	#28	; CORDE
	bne	:5629
	@GET_OP	#3
	cmp	#255
	bne	:5629
	@SET_F	#3;#-1
	lda	#3
	sta	CI
	jsr	:5480
	lda	#80	; la corde est fixée
	sta	M$
	jmp	:5898

:5629	stz	TR
	lda	MO$1
	cmp	#42	; TOURNER
	beq	:5629_1
	cmp	#44	; UTILISER
	bne	:5630
:5629_1	lda	MO$2
	cmp	#86	; TREUIL
	bne	:5630
	lda	#-1
	sta	TR

:5630	lda	SP
	cmp	#18
	bne	:5635
	lda	TR
	beq	:5635
	@GET_F	#3
	cmp	#0
	bne	:5635
	lda	#81	; il manque une corde
	sta	M$
	jmp	:5898
	
:5635	lda	SP
	cmp	#18
	bne	:5640
	lda	TR
	cmp	#0
	beq	:5640
	@GET_F	#3
	cmp	#0
	beq	:5640
	@GET_OP	#8
	cmp	#0
	bne	:5640
	@SET_OP	#8;#18	; fait apparaître la flûte
	@SET_OP	#3;#-1	; récupère la corde
	lda	#82	; une trappe s'ouvre...
	sta	M$
	jmp	:5898

:5640	lda	SP
	cmp	#20
	bne	:5645
	lda	MO$2
	cmp	#39	; FLUTE
	bne	:5645
	@GET_OP	#8
	cmp	#255
	bne	:5645
	@SET_F	#8;#-1
	lda	#8
	sta	CI
	jsr	:5480
	lda	#83	; un mur vibre...
	sta	M$
	jmp	:5898

:5645	lda	SP
	cmp	#21
	bne	:5647
	lda	MO$2
	cmp	#62	; PIED
	beq	:5645_1
	cmp	#16	; BICHE
	bne	:5647
:5645_1	@GET_OP	#18
	cmp	#255
	bne	:5647
	@SET_F	#18;#-1
	lda	#18
	sta	CI
	jsr	:5480
	lda	#84	; la grille s'ouvre...
	sta	M$
	jmp	:5898

:5647	lda	SP
	cmp	#21
	bne	:5650
	lda	MO$1
	cmp	#18	; DESCENDRE
	bne	:5650
	@GET_F	#18
	cmp	#0
	beq	:5650
	lda	#29
	sta	SP
	lda	#85	; vous descendez vers la chapelle
	sta	M$
	jmp	:5898
	
:5650	@INSTR	#TEXTBUFFER;#strHUILE
	cmp	#TRUE
	bne	:5655
	@INSTR	#TEXTBUFFER;#strTORCHE
	cmp	#TRUE
	bne	:5655
	@GET_OP	#20
	cmp	#255
	bne	:5655
	@GET_OP	#2
	cmp	#255
	bne	:5655
	@GET_F	#20
	cmp	#0
	bne	:5655
	@SET_F	#20;#-1
	lda	#20
	sta	CI
	jsr	:5480
	lda	#86	; torche huilée
	sta	M$
	jmp	:5898

:5655	lda	SP
	cmp	#29
	bne	:5657
	lda	MO$2
	cmp	#74	; SCEAU
	bne	:5657
	@GET_OP	#25
	cmp	#255
	bne	:5657
	@SET_F	#25;#1
	lda	#25
	sta	CI
	jsr	:5480
	lda	#87	; une inscription apparaît
	sta	M$
	jmp	:5898

:5657	lda	SP
	cmp	#29
	bne	:5660
	lda	MO$1
	cmp	#28	; LIRE
	bne	:5660
	lda	MO$2
	cmp	#47	; INSCRIPTION
	bne	:5660
	@GET_F	#25
	cmp	#1
	bne	:5660
	@SET_F	#25;#-1
	lda	#88	; félins : faites tinter le métal
	sta	M$
	jmp	:5898
	
:5660	lda	SP
	cmp	#31
	bne	:5662
	@INSTR	#TEXTBUFFER;#strMIROIR
	cmp	#TRUE
	bne	:5662
	@INSTR	#TEXTBUFFER;#strAUTEL
	cmp	#TRUE
	bne	:5662
	@GET_OP	#10
	cmp	#255
	bne	:5662
	@SET_F	#10;#-1
	lda	#10
	sta	CI
	jsr	:5480
	lda	#89	; le reflet vise une tour à l'est
	sta	M$
	jmp	:5898
	
:5662	lda	SP
	cmp	#32
	bne	:5664
	lda	MO$1
	cmp	#30	; MONTER
	bne	:5664
	@SET_F	#41;#-1
	lda	#90	; vous voyez un passage au nord
	sta	M$
	jmp	:5898
	
:5664	lda	SP
	cmp	#33
	bne	:5670
	lda	MO$2
	cmp	#27	; CLOCHETTE
	bne	:5670
	@GET_OP	#17
	cmp	#255
	bne	:5670
	@SET_F	#17;#-1
	lda	#17
	sta	CI
	jsr	:5480
	lda	#91	; un passage vers l'est s'est ouvert
	sta	M$
	jmp	:5898
	
:5670	lda	SP
	cmp	#34
	bne	:5675
	lda	MO$1
	cmp	#13	; ASSEMBLER
	bne	:5675
	@GET_OP	#15
	cmp	#255
	bne	:5675
	@GET_OP	#27
	cmp	#255
	bne	:5675
	@SET_F	#15;#-1
	@SET_F	#27;#-1
	@SET_F	#37;#-1
	lda	#15
	sta	CI
	jsr	:5480
	lda	#27
	sta	CI
	jsr	:5480
	lda	#94	; plan complet
	sta	M$
	jmp	:5898

:5675	lda	SP
	cmp	#35
	bne	:5680
	lda	MO$2
	cmp	#63	; PIERRE
	bne	:5680
	@GET_OP	#23
	cmp	#255
	bne	:5680
	@GET_F	#37
	cmp	#0
	bne	:5675_1
	lda	#95	; le plan n'est pas complet
	sta	M$
	jmp	:5898
:5675_1	@SET_F	#23;#-1
	lda	#23
	sta	CI
	jsr	:5480
	lda	#96	; des rigoles seches apparaissent
	sta	M$
	jmp	:5898

:5680	lda	SP
	cmp	#35
	bne	:5685
	lda	MO$2
	cmp	#44	; GOURDE
	beq	:5680_1
	cmp	#34	; EAU
	bne	:5685
:5680_1	@GET_F	#34
	cmp	#0
	beq	:5685
	@GET_F	#23
	cmp	#0
	beq	:5685
	@SET_F	#14;#-1
	lda	#14
	sta	CI
	jsr	:5480
	lda	#97	; elle dessine une flèche vers l'est
	sta	M$
	jmp	:5898

:5685	lda	SP
	cmp	#36
	bne	:5690
	lda	MO$1
	cmp	#44	; UTILISER
	beq	:5685_1
	cmp	#11	; ALLUMER
	bne	:5690
:5685_1	lda	MO$2
	cmp	#84	; TORCHE
	bne	:5690
	@GET_F	#20
	cmp	#0
	bne	:5685_2
	lda	#98	; ...mets de l'huile
	sta	M$
	jmp	:5898
:5685_2	@SET_F	#2;#-1
	lda	#2
	sta	CI
	jsr	:5480
	lda	#99	; passage vers le lac est révélé
	sta	M$
	jmp	:5898
	
:5690	lda	SP
	cmp	#39
	bne	:5695
	lda	MO$2
	cmp	#56	; MEDAILLE
	bne	:5695
	@GET_OP	#12
	cmp	#255
	bne	:5695
	@SET_F	#12;#-1
	lda	#12
	sta	CI
	jsr	:5480
	lda	#100	; le couloir des os...
	sta	M$
	jmp	:5898

:5695	lda	SP
	cmp	#40
	bne	:5705
	lda	MO$2
	cmp	#26	; CLE
	bne	:5705
	@GET_OP	#5
	cmp	#255
	bne	:5705
	@SET_F	#5;#-1
	lda	#5
	sta	CI
	jsr	:5480
	lda	#101	; la grille s'ouvre vers le sud
	sta	M$
	jmp	:5898

:5705	lda	SP
	cmp	#43
	bne	:5710
	lda	MO$1
	cmp	#44	; UTILISER
	beq	:5705_1
	cmp	#35	; PORTER
	bne	:5710
:5705_1	lda	MO$2
	cmp	#22	; CAPE
	bne	:5710
	@GET_OP	#30
	cmp	#255
	beq	:5705_2
	cmp	#30
	bne	:5710
:5705_2	@SET_F	#30;#-1
	lda	#30
	sta	CI
	jsr	:5480
	lda	#102	; votre odeur est masquée
	sta	M$
	jmp	:5898

:5710	lda	SP
	cmp	#44
	bne	:5711
	lda	MO$2
	cmp	#54	; MARTEAU
	beq	:5710_1
	cmp	#20	; BURIN
	bne	:5711
:5710_1	@GET_OP	#6
	cmp	#255
	beq	:5711
	lda	#103	; il vous manque un marteau
	sta	M$
	jmp	:5898

:5711	lda	SP
	cmp	#44
	bne	:5712
	lda	MO$2
	cmp	#54	; MARTEAU
	beq	:5711_1
	cmp	#20	; BURIN
	bne	:5712
:5711_1	@GET_OP	#6
	cmp	#255
	bne	:5712
	@GET_OP	#7
	cmp	#255
	beq	:5712
	lda	#104	; il vous manque un burin
	sta	M$
	jmp	:5898

:5712	lda	SP
	cmp	#44
	bne	:5715
	lda	MO$2
	cmp	#20	; BURIN
	beq	:5712_1
	cmp	#54	; MARTEAU
	bne	:5715
:5712_1	@GET_OP	#6
	cmp	#255
	bne	:5715
	@GET_OP	#7
	cmp	#255
	bne	:5715
	@SET_F	#6;#-1
	@SET_F	#7;#-1
	@SET_F	#39;#-1
	lda	#6
	sta	CI
	jsr	:5480
	lda	#7
	sta	CI
	jsr	:5480
	lda	#105	; le mécanisme libère...
	sta	M$
	jmp	:5898

:5715	lda	SP
	cmp	#48
	bne	:5720
	lda	MO$2
	cmp	#49	; JETON
	bne	:5720
	@GET_OP	#31
	cmp	#255
	bne	:5720
	@SET_F	#31;#-1
	lda	#31
	sta	CI
	jsr	:5480
	lda	#106	; le jeton disparaît...
	sta	M$
	jmp	:5898

:5720	lda	SP
	cmp	#47
	bne	:5725
	lda	MO$2
	cmp	#38	; FLEUR
	bne	:5725
	@GET_OP	#32
	cmp	#255
	bne	:5725
	@SET_F	#32;#-1
	lda	#32
	sta	CI
	jsr	:5480
	@SET_OP	#17;#-1
	lda	#107	; un passage vers l'ouest et la clochette...
	sta	M$
	jmp	:5898

:5725	lda	SP
	cmp	#51
	bne	:5730
	lda	MO$2
	cmp	#96	; BATON
	beq	:5725_1
	cmp	#36	; ENCENS
	bne	:5730
:5725_1	@GET_OP	#29
	cmp	#255
	bne	:5730
	@SET_F	#29;#-1
	lda	#29
	sta	CI
	jsr	:5480
	lda	#108	; les pièges sont maintenant visibles...
	sta	M$
	jmp	:5898

:5730	lda	SP
	cmp	#52
	bne	:5735
	lda	MO$1
	cmp	#22	; ETEINDRE
	bne	:5735
	@GET_F	#29
	cmp	#0
	beq	:5735
	@SET_F	#35;#-1
	lda	#109	; vous désarmez les pièges
	sta	M$
	jmp	:5898

:5735	lda	SP
	cmp	#54
	bne	:5745
	lda	MO$2
	cmp	#51	; LIVRE
	bne	:5745
	@GET_OP	#26
	cmp	#255
	bne	:5745
	@SET_F	#26;#-1
	lda	#26
	sta	CI
	jsr	:5480
	lda	#110	; trois preuves : masque, jade dent
	sta	M$
	jmp	:5898

:5745	lda	SP
	cmp	#55
	bne	:5750
	lda	MO$2
	cmp	#29	; CRAIE
	bne	:5750
	@GET_OP	#16
	cmp	#255
	bne	:5750
	@SET_F	#16;#-1
	lda	#16
	sta	CI
	jsr	:5480
	@SET_OP	#13;#55
	lda	#111	; une amulette est révélée
	sta	M$
	jmp	:5898

:5750	lda	SP
	cmp	#56
	bne	:5755
	lda	MO$2
	cmp	#55	; MASQUE
	bne	:5755
	@GET_OP	#11
	cmp	#255
	bne	:5755
	@SET_F	#11;#-1
	@SET_F	#38;#-1
	lda	#11
	sta	CI
	jsr	:5480
	lda	#112	; un passage secret...
	sta	M$
	jsr	:5900
	jmp	:5795
	
:5755	lda	SP
	cmp	#58
	bne	:5760
	lda	MO$2
	cmp	#18	; BOUSSOLE
	bne	:5760
	@GET_OP	#9
	cmp	#255
	bne	:5760
	@SET_F	#9;#-1
	lda	#9
	sta	CI
	jsr	:5480
	lda	#113	; l'une désigne une pierre à l'est
	sta	M$
	jmp	:5898
	
:5760	lda	SP
	cmp	#60
	bne	:5761
	lda	MO$2
	cmp	#10	; AMULETTE
	bne	:5761
	@GET_OP	#13
	cmp	#255
	bne	:5761
	@SET_F	#13;#-1
	@SET_F	#19;#-1
	lda	#13
	sta	CI
	jsr	:5480
	@GET_OP	#19
	cmp	#255
	bne	:5761
	lda	#19
	sta	CI
	jsr	:5480

:5761	lda	SP
	cmp	#60
	bne	:5765
	@GET_F	#13
	cmp	#0
	beq	:5765
	lda	#114	; vous découvrez un passage à l'est
	sta	M$
	jmp	:5898
	
:5765	lda	SP
	cmp	#62
	bne	:5767
	lda	MO$1
	cmp	#32	; PARLER
	bne	:5767
	@GET_OP	#28
	cmp	#0
	bne	:5767
	@SET_OP	#28;#62
	lda	#115	; il vous tend une cle noire
	sta	M$
	jmp	:5898

:5767	lda	SP
	cmp	#53
	bne	:5769
	lda	MO$1
	cmp	#37	; POUSSER
	beq	:5767_1
	cmp	#41	; TIRER
	bne	:5769
:5767_1	lda	MO$2
	cmp	#33	; DENT
	bne	:5769
	@GET_OP	#24
	cmp	#0
	bne	:5769
	@SET_OP	#24;#-1
	lda	#116	; vous avez pris une dent d'ocelot
	sta	M$
	jmp	:5898

:5769	lda	SP
	cmp	#63
	bne	:5770
	lda	MO$2
	cmp	#26	; CLE
	bne	:5770
	@GET_OP	#28
	cmp	#255
	bne	:5770
	@GET_F	#24
	cmp	#0
	bne	:5770
	lda	#117	; votre cle a du mal à rentrer...
	sta	M$
	jmp	:5898

:5770	lda	SP
	cmp	#63
	bne	:5775
	lda	MO$2
	cmp	#26	; CLE
	bne	:5775
	@GET_OP	#28
	cmp	#255
	bne	:5775
	@GET_F	#24
	cmp	#0
	beq	:5775
	@SET_F	#28;#-1
	lda	#28
	sta	CI
	jsr	:5480
	lda	#118	; le verrou est débloqué
	sta	M$
	jmp	:5898

:5775	lda	SP
	cmp	#63
	bne	:5780
	lda	MO$2
	cmp	#33	; DENT
	bne	:5780
	@GET_OP	#24
	cmp	#255
	bne	:5780
	@SET_F	#24;#-1
	lda	#24
	sta	CI
	jsr	:5480
	lda	#119	; dent placée
	sta	M$
	jmp	:5898
	
:5780	lda	SP
	cmp	#63
	bne	:5781
	lda	MO$1
	cmp	#31	; OUVRIR
	bne	:5785
	jmp	:6400	; vérifie la résolution des énigmes

:5781	stz	AC
	rts

*-------------------------------
* 5785 - EXTENSION POUR LA CORDE
*-------------------------------

:5785	lda	SP
	cmp	#41
	bne	:5790
	@INSTR	#TEXTBUFFER;#strCORDE
	cmp	#FALSE
	beq	:5790
	@INSTR	#TEXTBUFFER;#strCROCHET
	cmp	#FALSE
	beq	:5790

	@GET_OP	#3	; a-t-on la corde ?
	cmp	#255
	beq	:5786	; oui
	lda	#120	; il vous manque une corde
	sta	M$
	jmp	:5898

:5786	@GET_OP	#21	; a-t-on le crochet ?
	cmp	#255
	beq	:5787	; oui
	cmp	#41
	beq	:5787
	lda	#121	; il vous manque un crochet
	sta	M$
	jmp	:5898

:5787	@SET_F	#21;#-1
	lda	#3
	sta	CI
	jsr	:5480
	lda	#21
	sta	CI
	jsr	:5480
	lda	#122	; vous voyez un passage vers la jungle
	jmp	:5898

:5790	stz	AC
	lda	#92	; chaîne vide
	jmp	:5898

* Retour vers la jungle basse, cf. 5750

:5795	@WAIT	#180	; 3 secondes plutôt qu'INKEY
*	@INKEY
	lda	#49
	sta	SP
	stz	VP
	stz	LP
	rts

*-------------------------------
* 5800 - AUTRES ACTIONS
*-------------------------------

:5800	lda	#-1
	sta	AC

:5801	lda	SP
	cmp	#3
	bne	:5803
	lda	MO$1
	cmp	#43	; TRAVERSER
	beq	:5801_OK
	cmp	#33	; PASSER
	bne	:5803
:5801_OK	@GET_F	#22
	cmp	#0
	bne	:5803
	lda	#123	; le pont cedera sans planche
	sta	M$
	jmp	:5898

:5803	lda	SP
	cmp	#6
	bne	:5804
	lda	MO$1
	cmp	#21	; ENTRER
	beq	:5803_1
	cmp	#31	; OUVRIR
	bne	:5804
:5803_1	lda	MO$2
	cmp	#21	; CABANE
	beq	:5803_2
	cmp	#67	; PORTE
	bne	:5804
:5803_2	@GET_F	#4
	cmp	#0	
	bne	:5804
	lda	#124	; elle est fermee a cle
	sta	M$
	jmp	:5898

:5804	lda	SP
	cmp	#6
	bne	:5805
	lda	MO$1
	cmp	#21	; ENTRER
	beq	:5804_OK
	cmp	#31	; OUVRIR
	bne	:5805
:5804_OK	@GET_F	#4
	cmp	#255
	bne	:5805
	lda	#125	; la porte est ouverte
	sta	M$
	jmp	:5898

:5805	lda	SP
	cmp	#13
	bne	:5806
	lda	MO$1
	cmp	#15	; BOIS/BOIRE
	bne	:5806
	lda	#126	; l'eau vous empoisonne
	sta	M$
	jmp	:5898

:5806	lda	SP
	cmp	#13
	bne	:5807
	lda	MO$1
	cmp	#40	; REMPLIR
	bne	:5807
	lda	MO$2
	cmp	#34	; EAU
	bne	:5807
	@GET_OP	#14
	cmp	#255
	beq	:5807
	lda	#127	; il faut une gourde
	sta	M$
	jmp	:5898

:5807	lda	SP
	cmp	#14
	bne	:5808
	lda	MO$1
	cmp	#46	; AVANCER
	beq	:5807_OK
	cmp	#33	; PASSER
	bne	:5808
:5807_OK	lda	MO$2
	cmp	#69	; RACINE
	bne	:5808
	@GET_F	#1
	cmp	#0
	bne	:5808
	lda	#128	; une pelle degagerait les racines
	sta	M$
	jmp	:5898

:5808	lda	MO$1
	cmp	#28	; LIRE
	bne	:5809
	lda	MO$2
	cmp	#65	; PLAN
	bne	:5809
	@GET_OP	#15
	cmp	#255
	beq	:5809
	lda	#129	; vous n'avez pas de plan
	sta	M$
	jmp	:5898

:5809	lda	SP
	cmp	#20
	bne	:5810
	lda	MO$1
	cmp	#20	; ECOUTER
	beq	:5809_OK1
	cmp	#23	; EXAMINER
	bne	:5810
:5809_OK1	lda	MO$2
	cmp	#35	; ECHO
	beq	:5809_OK2
	cmp	#58	; MUR
	beq	:5809_OK2
	cmp	#72	; SALLE
	bne	:5810
:5809_OK2	@GET_F	#8
	cmp	#0
	bne	:5810
	lda	#130	; la salle resonne
	sta	M$
	jmp	:5898

:5810	lda	SP
	cmp	#21
	bne	:5811
	lda	MO$1
	cmp	#18	; DESCENDRE
	bne	:5811
	lda	MO$2
	cmp	#67	; PUIT
	beq	:5810_OK
	cmp	#45	; GRILLE
	bne	:5811
:5810_OK	@GET_F	#18
	cmp	#0
	bne	:5811
	lda	#131	; la grille necessite un pied de biche
	jmp	:5898

:5811	lda	MO$1
	cmp	#28	; LIRE
	bne	:5812
	lda	MO$2
	cmp	#65	; PLAN
	bne	:5812
	@GET_OP	#15
	cmp	#255
	bne	:5812
	lda	#132	; il manque un fragment
	sta	M$
	jmp	:5898
	
:5812	lda	SP
	cmp	#60
	bne	:5841
	lda	MO$1
	cmp	#28	; LIRE
	bne	:5841
	lda	MO$2
	cmp	#47	; INSCRIPTION
	bne	:5841
	lda	#133	; les inscriptions ne s'effacent...
	sta	M$
	jmp	:5898
	
:5841	lda	MO$1
	cmp	#44	; utiliser
	bne	:5843
	jsr	:5850	; ...un objet ?
	lda	OI
	beq	:5843	; ce n'en est pas un

	@COUT	#$d2	; " ouvrant
	@objet	OI
	@COUT	#$d3	; " fermant
	lda	#134	; _ne sert à rien ici
	sta	M$
	jmp	:5898
	
:5843	lda	MO$1
	cmp	#23	; examiner
	beq	:5843_OK
	cmp	#16	; chercher
	beq	:5843_OK
	cmp	#24	; fouiller
	bne	:5844
:5843_OK	lda	#61	; vous ne voyez rien de special
	sta	M$
	jmp	:5898
	
:5844	stz	AC
	rts

* Veut-on UTILISER OBJET ?

:5850	jsr	:5390
	stz	OI

	lda	MO$2	; on n'a pas précisé de nom
	beq	:5853	; on sort

	ldx	#1	; est-ce que le nom
]lp	lda	tblOV1-1,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	beq	:5851
	lda	tblOV2-1,x
	and	#$ff
	cmp	MO$2
	bne	:5852	; non, continue
	
:5851	lda	F-1,x	; a-t-on l'objet ?
	and	#$ff
	beq	:5852	; non, continue
	stx	OI	; oui, sort
	rts
	
:5852	inx		; next entry
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

:5853	rts

*-------------------------------
* 5900 - AFFICHAGE CENTRE
*-------------------------------

:5898

:5900	lda	DD
	bne	:5901

:5901	@PEN	#1;#3
	@message	M$
	rts

*-------------------------------
* 6000 - SAVE GAME
*-------------------------------

:6000	jsr	slotGAME
	bcs	:6005
	jsr	saveGAME
	bcc	:6010

:6005	lda	#92
	sta	M$
	jmp	:5900

:6010	lda	#137
	sta	M$
	jmp	:5900

*-------------------------------
* 6200 - LOAD GAME
*-------------------------------

:6200	jsr	slotGAME
	bcs	:6205
	jsr	loadGAME
	bcc	:6210

:6205	lda	#92
	sta	M$
	jmp	:5900

:6210	stz	LP
	stz	VP
	
	lda	#138
	sta	M$
	jmp	:5900

*---------------

slotGAME	sep	#$20	; mets le slot de la partie 0..9
	lda	X$2
	cmp	#1	; a-t-on mis un caractère ?
	bne	slotGAME_ERR
	stz	X$2

	lda	X$2+1	; est-ce un chiffre ?
	cmp	#'1'
	bcc	slotGAME_ERR
	cmp	#'9'+1
	bcs	slotGAME_ERR
	sta	pGAME+10
	rep	#$20
	clc
	rts
slotGAME_ERR	rep	#$20
	sec
	rts

*-------------------------------
* 6400 - VERIFICATION ENIGMES
*-------------------------------

:6400	ldy	#0
	
	ldx	#1
]lp	lda	F-1,x
	and	#$ff
	bne	:6405
	tay		; pas realise
	bra	:6410
:6405	inx
	cpx	#MAX_ENIGME
	bcc	]lp
	beq	]lp

:6410	cpy	#0	; des manquements ?
	beq	:6430	; non
	
	lda	#139	; il reste des objets ou...
	sta	M$
	jmp	:5900

:6430	@SET_F	#40;#-1
	lda	#140	; la porte grince...
	sta	M$
	jsr	:5900
	rts

*-------------------------------
* 6500 - MORT
*-------------------------------

:6500	sta	M$
	
	@CLS	#0
	@PEN	#0;#3
	@LOCATE	#0;#14;#9
	@message	#141	; vous êtes mort

	@PEN	#0;#1

	lda	M$	; message index
	jsr	getMESSAGE	; its address in A
	jsr	LEN	; get string length
	pha
	
	lda	#DFT_WIDTH	; X = (WIDTH - LEN) / 2
	sec
	sbc	1,s
	lsr
	bne	:6501
	inc
:6501	tax
	pla
	ldy	#12	; Y = 12
	lda	#0	; S =  0
	jsr	LOCATE
	@message	M$	; print message
	
	@LOCATE	#0;#12;#17
	@message	#142	; recommencer ?
	
	@INKEY
	cmp	#chrYES
	bne	:6520
	jmp	REPLAY
:6520	jmp	QUIT

*-------------------------------
* 6530 - ATTENTE FACE A
*-------------------------------

:6530	rts

*-------------------------------
* 6580 - ATTENTE FACE B
*-------------------------------

:6580	rts

*-------------------------------
* 6600 - GAGNE
*-------------------------------

GAGNE
:6600	@MODE	#1
	@CLS	#0
	@PEN	#0;#3
	@LOCATE	#0;#15;#6
	@message	#145	; Bravo
	@PEN	#0;#1
	@LOCATE	#0;#5;#10
	@message	#146	; Vous avez trouve le cimetiere
	@LOCATE	#0;#7;#12
	@message	#147	; des Ocelots et son tresor
	@PEN	#0;#2
	@LOCATE	#0;#6;#18
	@message	#148	; Appuyez sur une touche pour
	@LOCATE	#0;#10;#20
	@message	#149	; entrer dans la salle
	@INKEY

* Load FIN.SCR

	rts

*-------------------------------
* 6700 - QUITTER
*-------------------------------

:6700	@CLS	#0
	@PEN	#0;#1
	@LOCATE	#0;#7;#17
	@message	#153	; voulez-vous quitter ?
	
	@INKEY
	cmp	#chrYES
	bne	:6710
	jmp	QUIT
:6710	jmp	REPLAY

*-------------------------------
* 6800 - RECOMMENCER
*-------------------------------

:6800	@CLS	#0
	@PEN	#0;#1
	@LOCATE	#0;#7;#17
	@message	#93	; voulez-vous recommencer ?
	
	@INKEY
	cmp	#chrYES
	beq	:6810
	jmp	QUIT
:6810	jmp	REPLAY

*-------------------------------
* 7050 - SCENE DESCRIPTION
*-------------------------------

:7050	stz	M$

	lda	SP
	cmp	#26
	bne	:7050_2
	@GET_F	#25
	beq	:7050_2
	
	lda	#150	; le puits a déjà été fouillé
	sta	M$
	rts

:7050_2	lda	SP
	cmp	#51
	bne	:7050_3
	@GET_F	#29
	beq	:7050_3
	
	lda	#151	; les pieges sont maintenant visibles
	sta	M$
	rts

* AD is the offset to the string to display

:7050_3	lda	#$0ea0
	sta	AD

:7051	ldx	#0
	sep	#$20

]lp	lda	tbl11000,x
	beq	:7054_2
	cmp	SP
	bne	:7053
	lda	tbl11000+1,x
	cmp	#1
	bne	:7053
	ldy	tbl11000+2,x
	lda	F-1,y
	and	#$ff
	bne	:7053

	lda	#$0ed0
	sta	AD

:7053	lda	tbl11000,x
	beq	:7054_2
	cmp	SP
	bne	:7054
	lda	tbl11000+1,x
	cmp	#2
	bne	:7054
	ldy	tbl11000+2,x
	lda	OP-1,y
	and	#$ff
	bne	:7054

	lda	#$0ed0
	sta	AD

:7054	inx
	inx
	inx
	cpx	#3*24
	bcc	]lp

:7054_2	rep	#$20

	lda	SP
	cmp	#47
	bne	:7060
	@GET_OP	#16
	cmp	#255
	beq	:7054_3
	@GET_F	#16
	beq	:7054_4
:7054_3	lda	#152	; le passage au sud est ouvert
	sta	M$
:7054_4	rts

:7060	ldx	AD
	ldy	#0
]lp	lda	ptrLEVEL,x
	sta	strDESCRIPTION,y
	inx
	inx
	iny
	iny
	cpy	#48
	bcc	]lp
	
	lda	#154	; description à afficher
	sta	M$
	rts

*-------------------------------
* 8000 - INITIALISE LE JEU
*-------------------------------

initALL

:8000	sep	#$20
	ldx	#DATA_IN
]lp	stz	|$0000,x
	inx
	cpx	#DATA_OUT
	bcc	]lp

	ldx	#1	; copie la table
]lp	lda	tblOBJETS-1,x	; des objets
	sta	OP-1,x
	inx
	cpx	#MAX_OBJET
	bcc	]lp
	beq	]lp

	rep	#$20
	
	lda	#FIRST_ROOM
	sta	SP
	rts

*-------------------------------
* 8050 - LE GENRE DU NOM
*-------------------------------

:8050	lda	tblMF-1,x	; Male ou Femelle
	and	#$ff
	cmp	#'M'
	beq	:8051
	cmp	#'F'
	bne	:8052
	lda	#strUNE	; UNE_
	rts
:8051	lda	#strUN	; UN_
	rts
:8052	lda	#strVIDE	; rien
	rts
	
*-------------------------------
* LES HABITUELLES ROUTINES
*-------------------------------

*-------------------------------
* GET LIEU ADDRESS
*-------------------------------

getLIEU	cmp	#MAX_LIEU
	bcc	getLIEU_1
	beq	getLIEU_1
	rts

getLIEU_1	ldy	#strLIEU
	dec
	beq	getLIEU_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
getLIEU_9	tya
	rts

*-------------------------------
* PRINT LIEU
*-------------------------------

printLIEU	cmp	#MAX_LIEU
	bcc	printLIEU_1
	beq	printLIEU_1
	rts

printLIEU_1	ldy	#strLIEU
	dec
	beq	printLIEU_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
printLIEU_9	ldx	#^strLIEU
	lda	theSTREAM
	jmp	PRINT

*-------------------------------
* GET MESSAGE ADDRESS
*-------------------------------

getMESSAGE	cmp	#MAX_MESSAGE
	bcc	getMESSAGE_1
	beq	getMESSAGE_1
	rts

getMESSAGE_1	ldy	#strMESSAGE
	dec
	beq	getMESSAGE_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
getMESSAGE_9	tya
	rts

*-------------------------------
* PRINT MESSAGE
*-------------------------------

printMESSAGE	cmp	#MAX_MESSAGE
	bcc	printMESSAGE_1
	beq	printMESSAGE_1
	rts

printMESSAGE_1	ldy	#strMESSAGE
	dec
	beq	printMESSAGE_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
printMESSAGE_9	ldx	#^strMESSAGE
	lda	theSTREAM
	jmp	PRINT	; patched JMP/RTS

*-------------------------------
* GET OBJET ADDRESS
*-------------------------------

getOBJET	cmp	#MAX_OBJET
	bcc	getOBJET_1
	beq	getOBJET_1
	rts

getOBJET_1	ldy	#strOBJET
	dec
	beq	getOBJET_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
getOBJET_9	tya
	rts

*-------------------------------
* PRINT OBJET
*-------------------------------

printOBJET	cmp	#MAX_OBJET
	bcc	printOBJET_1
	beq	printOBJET_1
	rts

printOBJET_1	ldy	#strOBJET
	dec
	beq	printOBJET_9
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
printOBJET_9	ldx	#^strOBJET
	lda	theSTREAM
	jmp	PRINT

*-------------------------------
* GET/SET_F - GET/SET F VALUE
*-------------------------------

GET_F	lda	F-1,x
	and	#$ff
	rts

SET_F	sep	#$20
	sta	F-1,x
	rep	#$20
	rts

*-------------------------------
* GET/SET_O - GET/SET O VALUE
*-------------------------------

GET_OP	lda	OP-1,x
	and	#$ff
	rts

SET_OP	sep	#$20
	sta	OP-1,x
	rep	#$20
	rts

*-------------------------------
* 6000 - ANALYSE DU MOT
*-------------------------------

GETVN	sta	GETVN_6400+1	; pointeur vers le buffer

	stz	MO$1	; index du verbe
	stz	MO$2	; index du nom

	lda	lenSTRING	; empty string
	bne	:6010	; nah

:6005	rep	#$30	; b/c :6021
	rts

* 1. cherche le premier caractère

:6010	sep	#$30

	ldx	#0	; cherche le premier caractere
]lp	jsr	GETVN_6400
	cmp	#chrRETURN
	beq	:6021
	cmp	#chrSPACE
	bne	:6022	; on a trouvé un caractère
	inx
	cpx	lenSTRING
	bcc	]lp
	beq	]lp
:6021	bcs	:6005	; retourne sans avoir trouve

* 2. recopie le mot

:6022	ldy	#1	; longueur du mot
]lp	jsr	GETVN_6400
	cmp	#chrRETURN
	beq	:6024
	cmp	#chrSPACE	; 0 1 B 1 2
	beq	:6023	; 1 2 U 2 3
	sta	X$1,y	; 2 3 Y 3 4
	inx		; 3 4 _
	cpx	lenSTRING
	beq	]lp
	bcs	:6024
	iny
	cpy	#NB_CAR
	bcc	]lp
	beq	]lp	; on sort si 5
:6023	dey
:6024	sty	X$1	; sauve la longueur
	
* 3. cherche le second non espace

]lp	jsr	GETVN_6400
	cmp	#chrRETURN
	beq	:6100
	cmp	#chrSPACE
	bne	:6032
	inx		; 5
	cpx	lenSTRING
	bcc	]lp
	bcs	:6100
	
* 4. recopie le mot

:6032	ldy	#1
]lp	jsr	GETVN_6400
	cmp	#chrRETURN
	beq	:6034
	cmp	#chrSPACE
	beq	:6033
	sta	X$2,y
	inx
	cpx	lenSTRING
	beq	]lp
	bcs	:6034
	iny
	cpy	#NB_CAR
	bcc	]lp
	beq	]lp
:6033	dey
:6034	sty	X$2	; sauve la longueur

* 4b. réduit la longueur des mots trouvés

:6100	ldx	#LEN_WORD
	lda	X$1
	sta	X$1_SAVE	; for Draw Verb
	cmp	#LEN_WORD
	bcc	:6102
	beq	:6102
	stx	X$1

:6102	lda	X$2
	sta	X$2_SAVE	; for Draw Noun
	cmp	#LEN_WORD
	bcc	:6104
	beq	:6104
	stx	X$2

* 5. cherche le mot dans les verbes
	
:6104	lda	X$1
	bne	:6110
	rep	#$30
	rts

	mx	%11

:6110	lda	#<tblVERB	; check verb
	sta	GETVN_6450+1
	lda	#>tblVERB
	sta	GETVN_6450+2

	ldy	#1	; first index is 1
]lp	ldx	#1
:6225	jsr	GETVN_6450
	cmp	X$1,x
	bne	:6250
	inx
	cpx	X$1
	bcc	:6225
	beq	:6225
	
	ldx	#0	; check length of word
	jsr	GETVN_6450
	cmp	X$1	; mismatch
	bne	:6250	; try the next one
	
:6230	lda	tblV,y	; get word index
	sta	MO$1
	jmp	:6300
	
:6250	ldx	#0	; calculate address of
	jsr	GETVN_6450	; next word
	clc
	adc	GETVN_6450+1	; @adr = @adr + word_len + 1
	sta	GETVN_6450+1
	lda	GETVN_6450+2
	adc	#0
	sta	GETVN_6450+2
	inc	GETVN_6450+1
	bne	:6260
	inc	GETVN_6450+2

:6260	iny
	jsr	GETVN_6450	; get char
	bne	]lp	; if not 0, loop

* 6. cherche le mot dans les noms

:6300	lda	X$2
	bne	:6310
	rep	#$30
	rts

	mx	%11

:6310	lda	#<tblNOUN	; check verb
	sta	GETVN_6450+1
	lda	#>tblNOUN
	sta	GETVN_6450+2
	
	ldy	#1	; first index is 1
]lp	ldx	#1
:6325	jsr	GETVN_6450
	cmp	X$2,x
	bne	:6350
	inx
	cpx	X$2
	bcc	:6325
	beq	:6325
	
	ldx	#0	; check length of word
	jsr	GETVN_6450
	cmp	X$2	; mismatch
	bne	:6350	; try the next one
	
:6330	lda	tblN,y	; get word index
	sta	MO$2
:6340	rep	#$30
	rts

	mx	%11

:6350	ldx	#0	; calculate address of
	jsr	GETVN_6450	; next word
	clc
	adc	GETVN_6450+1	; @adr = @adr + word_len + 1
	sta	GETVN_6450+1
	lda	GETVN_6450+2
	adc	#0
	sta	GETVN_6450+2
	inc	GETVN_6450+1
	bne	:6360
	inc	GETVN_6450+2

:6360	iny
	jsr	GETVN_6450
	bne	]lp	; if not 0, loop
	tay		; word not found
	beq	:6330	; always taken

*---

GETVN_6400	lda	$bdbd,x	; get a char from the buffer
	rts
	
GETVN_6450	lda	$bdbd,x	; get a char from a list
	rts

	mx	%00

*-------------------------------
* DEBUG
*-------------------------------

showSALLE	lda	SP
	jsr	getDEBUG
	sta	strCOMMANDE

	lda	MO$1
	jsr	getDEBUG
	sta	strCOMMANDE+3
	lda	MO$2
	jsr	getDEBUG
	sta	strCOMMANDE+6
	rts
	
getDEBUG	pha
	PushLong	#strDEBUG
	PushWord	#2
	PushWord	#FALSE
	_Int2Dec

	lda	strDEBUG
	ora	#'00'
	rts

*--- Data

strDEBUG	ds	2

*---------------

showBORDER	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts

*-------------------------------
* LES HABITUELLES DONNEES
*-------------------------------

DATA_IN

AC	ds	2
AD	ds	2	; Pointeur de texte
CI	ds	2
DD	ds	2	; Majuscule
DR	ds	2
EC	ds	2
GA	ds	2
GE	ds	2
GF	ds	2
I	ds	2
IX	ds	2
IY	ds	2
LP	ds	2
M$	ds	2	; numero du message
NX	ds	2
OI	ds	2
TR	ds	2
VP	ds	2

SAVE_IN

SP	ds	2
OP	ds	MAX_OBJET	; from tblOBJETS
F	ds	MAX_AF

DATA_OUT
SAVE_OUT

*-------------- Routine texte

MO$1	ds	2	; mot 1
MO$2	ds	2	; mot 2
X$1_SAVE	ds	2	; save length for a SAY command
X$2_SAVE	ds	2	; save length for a SAY command

X$1	ds	NB_CAR+1	; premier mot saisi
X$2	ds	NB_CAR+1	; second mot saisi

TEXTBUFFER	ds	MAX_LEN
