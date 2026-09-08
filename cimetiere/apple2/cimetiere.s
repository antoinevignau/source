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
MAX_LIEU	=	64
MAX_MESSAGE	=	152
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
	@INK	#0;#0
	@INK	#1;#26
	@INK	#2;#9
	@INK	#3;#15
	
	@PAPER	#0;#0
	@PEN	#0;#1
	@CLS	#0

	jsr	:8000	; init all
	jsr	:1000	; dessine le cadre
	jmp	:2000	; joue

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

	@PEN	#0;#1
	@LOCATE	#0;#9;#2
	@message	#1
	@PEN	#0;#2
	@LOCATE	#0;#29;#5
	@message	#2
	rts
	
*-------------------------------
* 2000 - BOUCLE PRINCIPALE
*-------------------------------

:2000	lda	SP
	cmp	LP
	beq	:2005

	jsr	:3000	; load level
	lda	SP	; save level
	sta	LP
	jsr	:3180	; draw frame
	jsr	:3500	; level title
	jmp	:2006

:2005	jsr	:3510	; print directions

:2006	jsr	:4000	; print objects
	jsr	:4500	; print inventory

	lda	SP
	cmp	VP
	beq	:2010
	
	jsr	:7050

:2009	lda	1
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

:3500	@PEN	#0;#0
	@LOCATE	#0;#3;#15
	@lieu	SP
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

:3510	@PEN	#0;#2
	@LOCATE	#0;#3;#18
	@message	#5	; SORTIE(S) : 
	rts

*-------------------------------
* 4000 - AFFICHE LES OBJETS
*-------------------------------

:4000
	rts

*-------------------------------
* 4500 - INVENTAIRE
*-------------------------------

:4500
	rts

*-------------------------------
* 5000 - SAISIE DE LA COMMANDE
*-------------------------------

:5000	@PEN	#0;#2
	@LOCATE	#0;#3;#24
	@message	#15
	@PEN	#0;#1
	@INPUT	#TEXTBUFFER;#MAX_LEN

*-------------------------------
* 5010 - VERIFICATION DU VOCABULAIRE
*-------------------------------

:5010	@UPPER	#TEXTBUFFER;#TEXTBUFFER

	lda	lenSTRING
	bne	:5012
	rts

:5012	@STRCMP	#strCHEAT;#TEXTBUFFER
	bcs	:5015
	
	lda	#WIN_ROOM
	sta	SP
	jmp	:6580

:5015	@getvn	#TEXTBUFFER

	brk	$bd

	lda	MO$1
	ora	MO$2
	bne	:5016

	lda	#17	; je ne comprends pas
	jmp	:5900

:5016	rts

:5140	jsr	:5600

:5160	lda	#18	; vous ne pouvez pas faire ca ici
	sta	M$
:5161	jmp	:5900

*-------------------------------
* 5240 - SET DIRECTIONS
*-------------------------------

:5240	lda	SP
	asl
	asl
	clc
	adc	DR

	lda	tblDIRECTIONS-1,x	; b/c DR is 1..4
	and	#$ff
	sta	NX
	rts

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

:5253
	rts

*-------------------------------
* 5300 - DIRECTIONS
*-------------------------------

:5300	jsr	:5240

	lda	NX
	bne	:5301
	
	lda	#19	; aucun chemin dans cette direction
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
:5785

:5787	@SET_F	#21;#-1
	lda	#3
	sta	CI
	jsr	:5480
	lda	#21
	sta	CI
	jsr	:5480
	lda	#122	; vous voyez un passage vers la jungle
	jmp	:5898
:5788	rts

:5790	sta	AC
	rts

*-------------------------------
* 5900 - AFFICHAGE CENTRE
*-------------------------------

:5898

:5900
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

:6400
	rts

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

	@INKEY
	rts

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
* LES HABITUELLES ROUTINES
*-------------------------------

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
	jsr	PRINT
	rts

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
printMESSAGE_A	jmp	PRINT	; patched JMP/RTS

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
	jsr	PRINT
	rts

*-------------------------------
* GET/SET_F - GET/SET F VALUE
*-------------------------------

GET_F	lda	F,x
	and	#$ff
	rts

SET_F	sep	#$20
	sta	F,x
	rep	#$20
	rts

*-------------------------------
* GET/SET_O - GET/SET O VALUE
*-------------------------------

GET_OP	lda	OP,x
	and	#$ff
	rts

SET_OP	sep	#$20
	sta	OP,x
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
DD	ds	2
DR	ds	2
EC	ds	2
G	ds	2
GA	ds	2
GE	ds	2
GF	ds	2
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
