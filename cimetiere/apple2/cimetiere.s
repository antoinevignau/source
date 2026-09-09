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

MAX_LEN	=	30
NB_CAR	=	16	; max size of a word
LEN_WORD	=	4	; but limit to 4

FIRST_ROOM	=	1
WIN_ROOM	=	64

MAX_AF	=	41
MAX_ENIGME	=	32
MAX_LIEU	=	64
MAX_MESSAGE	=	153
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

GAME	@MODE	#1	; 320x200
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
tblWINDOW3	dw	29,39,6,13	; inventaire plateau
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
	@DRAW	#624;#144
	@DRAW	#16;#144
	@DRAW	#16;#176
	@MOVE	#16;#136
	@DRAW	#624;#136
	@DRAW	#624;#92
	@DRAW	#16;#92
	@DRAW	#16;#136
	@MOVE	#192;#136
	@DRAW	#192;#92
	@MOVE	#16;#84
	@DRAW	#624;#84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#84
	@MOVE	#16;#32
	@DRAW	#624;#32
	@DRAW	#624;#2
	@DRAW	#16;#2
	@DRAW	#16;#32

	@PEN	#0;#1	; blanc
	@LOCATE	#0;#9;#2
	@message	#1
	@PEN	#0;#2	; vert
	@LOCATE	#0;#29;#5
	@message	#2
	rts
	
*-------------------------------
* 2000 - BOUCLE PRINCIPALE
*-------------------------------

:2000	@STREAM	#0	; go back to the main window

*	lda	SP
*	cmp	LP
*	beq	:2005

	jsr	:3000	; load level
	lda	SP	; save level
	sta	LP
	jsr	:3180	; draw frame
	jsr	:3500	; level title

:2005	jsr	:3510	; print directions
:2006	jsr	:4000	; print objects
	jsr	:4500	; print inventory

	lda	SP
	cmp	VP
	beq	:2010
	
	jsr	:7050

:2009	lda	#1
	sta	DD
	jsr	:5900
	stz	DD
	
	lda	SP
	sta	VP

:2010	jsr	:5000	; saisie et traitement commande
	jmp	:2000	; loop

*-------------------------------
* 3000 - CHARGE LE NIVEAU
*-------------------------------

:3000			; load level then...

* LOAD LEVEL...

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
	@DRAW	#624;#144
	@DRAW	#16;#144
	@DRAW	#16;#176
	@MOVE	#16;#136
	@DRAW	#624;#136
	@DRAW	#624;#92
	@DRAW	#16;#92
	@DRAW	#16;#136
	@MOVE	#192;#136
	@DRAW	#192;#92
	@MOVE	#16;#84
	@DRAW	#624;#84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#84
	@MOVE	#16;#32
	@DRAW	#624;#32
	@DRAW	#624;#2
	@DRAW	#16;#2
	@DRAW	#16;#32
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
	@MOVE	#16;#84
	@DRAW	#624;#84
	@DRAW	#624;#40
	@DRAW	#16;#40
	@DRAW	#16;#84
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
	tax
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
	
	lda	SP	; adresse des directions
	beq	:3540
	dec
	asl		; de la salle
	asl
	clc
	adc	#tblDIRECTIONS
	sta	dpFROM
	
	ldx	#0	; cherche une direction valable
	txy
	sep	#$20
]lp	lda	(dpFROM),y
	beq	:3530	; pas de direction valable
	
	bit	I	; une direction trouvee
	bpl	:3520	; doit-on mettre une virgule ?

	lda	#chrCOMMA
	sta	strISSUES,x
	inx
:3520	lda	refISSUES,y	; met la lettre de la direction
	sta	strISSUES,x
	dec	I	; on devra mettre une virgule
	inx
	
:3530	iny
	cpy	#4
	bcc	]lp

	lda	#chrNULL	; put a trailing zero
	sta	strISSUES,x

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
	@LOCATE	#4;#9;#1
	@message	#6	; vous voyez
	@PEN	#4;#1
			; LOGO
	@LOCATE	#4;#12;#2
	@message	#7	; rien
	rts

*-------------------------------
* 4500 - INVENTAIRE (PLATEAU)
*-------------------------------

:4500	@CLS	#3
	@PAPER	#3;#3
			; LOGO
	rts

*-------------------------------
* 4530 - INVENTAIRE (COMMANDE)
*-------------------------------

:4530	@CLS	#0
	@LOCATE	#0;#15;#1	; #0;#35;#1 in MODE 2
	@message	#2

	lda	#3
	sta	IX
	sta	IY
	
	ldx	#0
]lp	phx
	lda	OP,x
	and	#$ff
	cmp	#-1
	bne	:4530_NEXT
	
	@LOCATE	#0;IX;IY

	pla
	pha
	jsr	printOBJET
	inc	IY
	
:4530_NEXT	plx
	inx
	cpx	#MAX_OBJET
	bcc	]lp

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
	@message	#15	; affiche COMMANDE >_
	@PEN	#0;#1
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
	jmp	:6700

:5025
:5030	lda	MO$1
	cmp	#39	; R/REGARDER
	bne	:5040
	jsr	:7050
	jmp	:5900

:5040	lda	MO$1
	cmp	#7	; I/INVENTAIRE
	bne	:5050
	jmp	:4530

:5050	lda	MO$1
	cmp	#91	; SAUVER/SAVE
	bne	:5060
	jmp	:6000

:5060	lda	MO$1
	cmp	#90	; CHARGER/LOAD
	bne	:5070
	jmp	:6200

* Les directions

:5070	stz	DR

	lda	MO$1
	cmp	#5	; une direction directe ?
	bcs	:5080
	sta	DR	; oui
	jmp	:5110

:5080	lda	MO$1
	cmp	#10	; VA/ALLER ?
	bne	:5110

:5090	lda	MO$2
	cmp	#5
	bcs	:5110
	sta	DR

:5110	lda	DR
	beq	:5120
	jmp	:5300

* On reprend les actions

:5120	lda	MO$1
	cmp	#38	; PRENDRE
	bne	:5122
	jmp	:5400

:5122	lda	MO$1
	cmp	#26	; JETTE/JETER
	bne	:5130
	jmp	:5482

:5130	lda	MO$1
	cmp	#23	; examiner
	beq	:5130_OK
	cmp	#16	; chercher
	beq	:5130_OK
	cmp	#24	; fouiller
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
	jmp	$5450

:5155	jsr	:5800
	lda	AC
	cmp	#-1
	bne	:5160
	rts

:5160	lda	#18	; vous ne pouvez pas faire ca ici
	sta	M$
	jmp	:5900

*-------------------------------
* 5240 - SET DIRECTIONS
*-------------------------------

:5240	lda	SP
	beq	:5245
	dec
	asl
	asl
	clc
	adc	DR
	tax
	lda	tblDIRECTIONS-1,x	; b/c DR is 1..4
	and	#$ff
	sta	NX
:5245	rts

*-------------------------------
* 5250 - LA CHANCE
*-------------------------------

:5250	lda	#-1
	sta	GA
	jsr	:5240
	
	lda	NX
	bne	:5251
	sta	GA
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
	lda	F,y
	and	#$ff
	bne	:5252

	lda	EC	; AND NOT(EC = 4445 AND SP = 45)
	cmp	#4445
	beq	:5252
	lda	SP
	cmp	#45
	beq	:5252

	stz	GA
	lda	#14
	sta	G

:5252	inx
	inx
	cpx	#14*2	; difference entre 14 du FOR et la table de 15 entrées
	bcc	]lp

* Toutes les conditions

:5253	lda	EC
	cmp	#2129
	bne	:5254
	
:5254	lda	EC
	cmp	#4142
	bne	:5255

:5255	lda	EC
	cmp	#4755
	bne	:5256
	
:5256	lda	EC
	cmp	#5556
	bne	:5257

:5257	lda	EC
	cmp	#4957
	bne	:5258

:5258	lda	SP
	cmp	#47
	bne	:5259

:5259	lda	EC
	cmp	#2532
	bne	:5260

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
	rts

*-------------------------------
* 5450 - POSER UN OBJET
*-------------------------------

:5450	jsr	:5390
	stz	OI
	rts

:5470	@SET_OP	OI;SP
	lda	#34	; objet pose
	sta	M$
	jmp	:5900

:5480	@SET_OP	CI;#-2
		rts

*-------------------------------
* 5482 - JETER UN OBJET
*-------------------------------

:5482	jsr	:5390
	stz	OI
	rts

*-------------------------------
* 5500 - FOUILLER
*-------------------------------

:5500	lda	#-1
	sta	AC
	stz	OI
	rts

*-------------------------------
* 5600 - AUTRES ACTIONS
*-------------------------------

:5600	lda	#-1
	sta	AC

:5780	lda	SP
	cmp	#63
	bne	:5785
	lda	MO$1
	cmp	#31	; ouvrir
	bne	:5785
	jmp	:6400

*-------------------------------
* 5785 - EXTENSION POUR LA CORDE
*-------------------------------

:5785	lda	SP
	cmp	#41
	bne	:5790
	lda	MO$2
	cmp	#28	; CORDE
	beq	:5785_OK
	cmp	#30	; CROCHET
	bne	:5790

:5785_OK	@GET_OP	#3	; a-t-on la corde ?
	cmp	#-1
	beq	:5786	; oui
	lda	#120	; il vous manque une corde
	sta	M$
	rts

:5786	@GET_OP	#21	; a-t-on le crochet ?
	cmp	#-1
	beq	:5787	; oui
	cmp	#41
	beq	:5787
	lda	#121	; il vous manque un crochet
	sta	M$
	rts

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
	rts

:5795	@INKEY
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
	stz	M$

:5801	lda	SP
	cmp	#3
	bne	:5803
	lda	MO$1
	cmp	#43	; TRAVERSER
	beq	:5801_OK
	cmp	#33	; PASSER
	bne	:5803
:5801_OK	@GET_F	#22
	bne	:5803
	lda	#123	; le pont cedera sans planche
	sta	M$
	jmp	:5898

:5803	lda	SP
	cmp	#6
	bne	:5804
	lda	MO$1
	cmp	#21	; ENTRER
	beq	:5803_OK
	cmp	#31	; OUVRIR
	bne	:5804
:5803_OK	lda	MO$2
	cmp	#67	; PORTE
	bne	:5804
	@GET_F	#4
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
	beq	:5805
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
	cmp	#-1
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
	cmp	#-1
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
	cmp	#-1
	beq	:5812
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

	ldx	#0	; est-ce que le nom
]lp	lda	tblOV,x	; est un objet ?
	and	#$ff
	cmp	MO$2
	bne	:5851	; non, continue
	
	lda	F,x	; a-t-on l'objet ?
	and	#$ff
	beq	:5851	; non, continue

	stx	OI	; oui, sort
	rts
	
:5851	inx		; next entry
	cpx	#MAX_OBJET
	bcc	]lp
	
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

:6000
	rts

*-------------------------------
* 6200 - LOAD GAME
*-------------------------------

:6200
	rts

*-------------------------------
* 6400 - VERIFICATION ENIGMES
*-------------------------------

:6400	ldy	#-1
	
	ldx	#0
]lp	lda	F,x
	and	#$ff
	bne	:6405
	tay		; pas realise
:6405	inx
	cpx	#MAX_ENIGME
	bcc	]lp

	cpy	#0	; des manquements ?
	bne	:6430	; non
	
	lda	#139	; il reste des objets ou...
	sta	M$
	jmp	:5900

:6430	@SET_F	#40;#-1
	lda	#140	; la porte grince...
	sta	M$
	jmp	:5900

*-------------------------------
* 6500 - MORT
*-------------------------------

:6500	sta	M$
	
	@CLS	#0
	@PEN	#0;#3
	@LOCATE	#0;#14;#9
	@message	#141	; vous êtes mort

	lda	M$	; message index
	jsr	getMESSAGE	; its address in A
	jsr	LEN	; get string length
	pha
	
	lda	#DFT_WIDTH	; X = (WIDTH - LEN) / 2
	sec
	sbc	1,s
	lsr
	tax
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

:6530
	rts

*-------------------------------
* 6580 - ATTENTE FACE B
*-------------------------------

:6580
			; va dessous...

*-------------------------------
* 6600 - GAGNE
*-------------------------------

GAGNE
:6600	@MODE	#1
	@CLS	#0
	@PEN	#0;#3
	@LOCATE	#0;#17;#6
	@message	#145	; Bravo
	@PEN	#0;#1
	@LOCATE	#0;#6;#10
	@message	#146	; Vous avez trouve le cimetiere
	@LOCATE	#0;#8;#12
	@message	#147	; des Ocelots et son tresor
	@PEN	#0;#2
	@LOCATE	#0;#5;#18
	@message	#148	; Appuyez sur une touche pour
	@LOCATE	#0;#9;#20
	@message	#149	; entrer dans la salle
	@INKEY

* Load FIN.SCR

	rts

*-------------------------------
* 6700 - QUITTER
*-------------------------------

:6700	@CLS	#0
	@PEN	#0;#3
	@LOCATE	#0;#7;#17
	@message	#153	; voulez-vous quitter ?
	
	@INKEY
	cmp	#chrYES
	bne	:6520
	jmp	QUIT
:6520	jmp	REPLAY

*-------------------------------
* 7050 - SCENE DESCRIPTION
*-------------------------------

:7050
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

	ldx	#0	; copie la table
]lp	lda	tblOBJETS,x	; des objets
	sta	OP,x
	inx
	cpx	#MAX_OBJET
	bcc	]lp

	rep	#$20
	
	lda	#FIRST_ROOM
	sta	SP
	rts

*-------------------------------
* 8050 - LE GENRE DU NOM
*-------------------------------

:8050	lda	tblMF,x	; Male ou Femelle
	and	#$ff
	cmp	#'M'
	beq	:8051
	cmp	#'F'
	bne	:8052
	lda	#strUNE	; UNE_
	rts
:8051	lda	#strUN	; UN_
	rts
:8052	lda	#0	; rien
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
* LES HABITUELLES DONNEES
*-------------------------------

*DS	ds	2
*NS	ds	2

DATA_IN

AC	ds	2
CI	ds	2
DD	ds	2	; Majuscule
DR	ds	2
EC	ds	2
G	ds	2
GA	ds	2
GE	ds	2
GF	ds	2
I	ds	2
IX	ds	2
IY	ds	2
LP	ds	2
M$	ds	2	; numero du message
N1	ds	2
N2	ds	2
N3	ds	2
N4	ds	2
NX	ds	2
OI	ds	2
SP	ds	2
VP	ds	2

OP	ds	MAX_OBJET	; from tblOBJETS
F	ds	MAX_AF

DATA_OUT

strBONJOUR	asc	'Bonjour'00

*-------------- Routine texte

MO$1	ds	2	; mot 1
MO$2	ds	2	; mot 2
X$1_SAVE	ds	2	; save length for a SAY command
X$2_SAVE	ds	2	; save length for a SAY command

X$1	ds	NB_CAR+1	; premier mot saisi
X$2	ds	NB_CAR+1	; second mot saisi

TEXTBUFFER	ds	MAX_LEN
