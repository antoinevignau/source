*
* Orphee
*
* (c) 1985, Laurent Benes & Loriciels
* (c) 2024, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

LINNUM	=	$50	; result from GETADR

NBSALLE	=	115

picSALSOM	=	116	; salle obscure
picMORT	=	117	; mort
picVICTOIRE	=	118	; victoire
picVOYAGE	=	119	; voyage aux enfers
picORPHEE	=	120	; orphée

MAX_LEN	=	32
NB_CAR	=	16	; max size of a word
LEN_WORD	=	5	; but limit to 4

iSUJET	=	1	; 
iVERBE	=	2	; 
iCOD	=	3	; 
iADJECTIF	=	4	; 
iATTRIBUT	=	5	; 
iARTICLE	=	6	; 

*-----------------------------------
* MACROS
*-----------------------------------

@asc	mac
	asc	#]2
	dfb	#]1
	eom

@gotoxy2	mac
	jsr	RETURN
	<<<
	
@gotoxy	mac
	jsr	RETURN
	<<<
	
@print	mac
	jsr	RETURN
	<<<

@center	mac
	jsr	RETURN
	<<<

@draw	mac
	jsr	showPIC
	<<<

@cout	mac
	jsr	RETURN
	<<<
	
*-----------------------------------
* Ordre d'affichage
*
* on affiche le titre de l'image
* on affiche l'image
* on affiche les issues
* on efface la fenêtre objet
* on affiche les objets en défilant
* on efface la fenêtre personnage
* on affiche les personnages en défilant
*

*-----------------------------------
* CODE BASIC EN ASM :-)
*-----------------------------------

PLAY	jsr	PRESENT
	jsr	INIT
	jsr	RIRE

REPLAY	@CLS	#0
	@MODE	#1
	@INK	#0;#26	; blanc
	@INK	#1;#0	; noir
	@INK	#2;#9	; vert
	@INK	#3;#15	; orange
	@PAPER	#0;#0	; blanc
	@PEN	#0;#1	; noir
	
	@WINDOW	#1;#tblWINDOW1	; pour les descriptions
	@PAPER	#1;#0
	@PEN	#1;#1
*	@CLS	#1

	@WINDOW	#2;#tblWINDOW2	; pour la salle
	@PAPER	#2;#0
	@PEN	#2;#1
*	@CLS	#2
	
	@WINDOW	#3;#tblWINDOW3	; pour l'inventaire
	@PAPER	#3;#0
	@PEN	#3;#1
*	@CLS	#3
	
	@WINDOW	#4;#tblWINDOW4	; pour les personnages
	@PAPER	#4;#0
	@PEN	#4;#1
*	@CLS	#4

*	stz	SALLE
*loopME	inc	SALLE
*	lda	SALLE
*	cmp	#NBSALLE+1
*	bcs	theEND

*-----------------------------------
* MAIN LOOP
*-----------------------------------

DEPA1	ldx	#1	; est-on dans une salle sombre ?
]lp	lda	SALSOMB-1,x
	and	#$ff
	cmp	SALLE
	beq	SOMBR	; oui
	inx
	cpx	#NBSALSOMB
	bcc	]lp
	beq	]lp
	
CALCUL	jsr	FENETR
	jsr	NOMSALLE
	
	lda	SALLE
	jsr	showPIC
	jsr	ISSUE
	jmp	DEPA2

*-----------------------------------

SOMBR	ldx	#6
	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CALCUL
	cmp	#-1
	beq	CALCUL
	
	ldx	#14
	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CALCUL
	cmp	#-1
	beq	CALCUL
	
	ldx	#1
	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	bne	SOMBRE
	
	lda	L81BC
	cmp	#6
	beq	CALCUL
	cmp	#14
	beq	CALCUL

*-----------------------------------

SOMBRE	jsr	FENETR	; affiche DESSOM (DESSIN SOMBRE)

	@draw	#picSALSOM

	lda	#TRUE
	sta	fgSOMBRE

*-----------------------------------

DEPA2	jsr	VERIFI

	lda	fgSOMBRE
	cmp	#FALSE
	beq	DEPA22
	jmp	DEPA3

DEPA22	@gotoxy2	#26*8;#63
	@print	#strILYA
	jsr	LISTE

	@gotoxy2	#26*8;#158
	@print	#strPERSONNAGES
	@gotoxy2	#26*8;#178
	@print	#strAUCUN

*-----------------------------------

DEPA3	jsr	GETCOM	; saisie des caracteres
	jsr	DCRIPT	; déchiffre la chaîne saisie

	lda	SUJET
	bne	DEPA31
	lda	VERBE
	beq	DEPA32
	cmp	#12
	bne	DEPA31
	
DEPA32	lda	COD	; = MOT$+3
	beq	DEPA31
	jsr	MVT

DEPA31	jsr	ANALYS
	jmp	DEPA2

*--- DEBUG

RND
RETURN	rts		; ne fait rien

*-----------------------------------
* REJOU
*-----------------------------------

REJOU	@gotoxy	#1;#1
	@print	#strREJOUER
	@INKEY
	cmp	#chrNO
	beq	REJOU_2
	cmp	#chrYES
	bne	REJOU
	jmp	PLAY
REJOU_2	jmp	QUIT	; return to the IIgs
	
*-----------------------------------
* ATTEN
*-----------------------------------

ATTEN
	rts

*-----------------------------------
* MORT
*-----------------------------------

MORT	jsr	FENETR
	@draw	#picMORT
	jsr	RIRE
	jsr	MUSMORT
	jmp	REJOU

*-----------------------------------
* MVT
*-----------------------------------

MVT
	rts
	
*-----------------------------------
* CHERC
*-----------------------------------

CHERC
	rts

*-----------------------------------
* NOOBJ
*-----------------------------------

	rts

*-----------------------------------
* TROOBJ
*-----------------------------------

TROOBJ
	rts

*-----------------------------------
* DEJOBJ
*-----------------------------------

DEJOBJ
	rts

*-----------------------------------
* DEJAUN
*-----------------------------------

DEJAUN
	rts

*-----------------------------------
* PASOBJ
*-----------------------------------

PASOBJ
	rts

*-----------------------------------
* AIDEJA
*-----------------------------------

AIDEJA
	rts

*-----------------------------------
* FINDMO
*-----------------------------------

FINDMO	sta	dpFROM	; cherche un mot de 5 lettres
			; dans une liste

FINDMO_1	sep	#$20
	ldy	#0
]lp	lda	(dpFROM),y
	cmp	#chrEOT	; fin de table ?
	beq	FINDMO_4	; oui, sors
	cmp	WORDBUFFER,y	; non, compare
	bne	FINDMO_3
	iny
	cpy	#LEN_WORD
	bcc	]lp

	lda	(dpFROM),y	; l'index du mot
FINDMO_2	rep	#$20
	and	#$ff
	rts

FINDMO_3	rep	#$20	; on n'a pas trouvé
	lda	dpFROM	; met le prochain mot
	clc
	adc	#LEN_WORD+1	; 5+1 = 6
	sta	dpFROM
	bra	FINDMO_1

	mx	%10

FINDMO_4	lda	#chrNULL
	bra	FINDMO_2
	
	mx	%00

*-----------------------------------
* FENETR
*-----------------------------------

FENETR	@GFXPEN	#1

	stz	IX
	
FENETR_1	ldx	IX	; 1. plot
	ldy	CODFEN+2,x
	lda	CODFEN,x
	tax
	jsr	MOVE

	lda	IX
	clc
	adc	#4
	sta	IY
	clc
	adc	#16
	sta	IZ
	
FENETR_2	ldx	IY	; 2. draw 4 lines
	ldy	CODFEN+2,x
	lda	CODFEN,x
	tax
	jsr	DRAW
	
	lda	IY	; new line within window
	clc
	adc	#2*2
	sta	IY
	cmp	IZ	; 2*2*4
	bcc	FENETR_2
	
	lda	IX	; next window
	clc
	adc	#10*2
	sta	IX
	cmp	#100	; 10*2*5
	bcc	FENETR_1
	rts

*--- Data

CODFEN	dw	0,0	; les coordonnées des fenetres
	dw	0,262
	dw	406,262
	dw	406,0
	dw	0,0

	dw	0,268	; 0,134
	dw	406,268	; 203,134
	dw	406,290	; 203,195
	dw	0,290	; 0,195
	dw	0,268	; 0,134

	dw	0,296
	dw	0,398
	dw	638,398
	dw	638,296
	dw	0,296

	dw	412,290
	dw	638,290
	dw	638,106
	dw	412,106
	dw	412,290

	dw	412,100
	dw	638,100
	dw	638,0
	dw	412,0
	dw	412,100

*---

tblWINDOW1	dw	2,39,2,6
tblWINDOW2	dw	2,25,8,8
tblWINDOW3	dw	27,39,8,18
tblWINDOW4	dw	27,39,20,24

windowTEXTE
	dw	0,0
	dw	51,320
	
windowLIEU
	dw	54,0
	dw	65,204

windowIMAGE
	dw	68,0
	dw	200,204

windowOBJET
	dw	54,206
	dw	146,320

windowPERSONNAGE
	dw	149,206
	dw	200,320

*-----------------------------------
* VERIFI
*-----------------------------------

VERIFI	
	rts

*-----------------------------------
* RETROU
*-----------------------------------

RETROU	lda	#SUJET$	; cherche WORDBUFFER
	jsr	FINDMO	; dans les différentes listes...
	cmp	#chrNULL
	beq	RETROU_1
	ldx	#iSUJET	; 1
	rts
RETROU_1	lda	#ADJECTIF$
	jsr	FINDMO
	cmp	#chrNULL
	beq	RETROU_2
	ldx	#iADJECTIF	; 4
	rts
RETROU_2	lda	#COD$
	jsr	FINDMO
	cmp	#chrNULL
	beq	RETROU_3
	ldx	#iCOD	; 3
	rts
RETROU_3	lda	#VERBE$
	jsr	FINDMO
	cmp	#chrNULL
	beq	RETROU_4
	ldx	#iVERBE	; 2
	rts
RETROU_4	lda	#ATTRIBUT$
	jsr	FINDMO
	cmp	#chrNULL
	beq	RETROU_5
	ldx	#iATTRIBUT	; 5
	rts
RETROU_5	lda	#ARTICLE$
	jsr	FINDMO
	ldx	#iARTICLE	; 6
	rts

*-----------------------------------
* TEST
*-----------------------------------

TEST
	rts

*-----------------------------------
* ZERO
*-----------------------------------

ZERO	sep	#$20	; efface l'index des mots
	ldx	#1
]lp	stz	MOT-1,x
	stz	DEJA-1,x
	inx
	cpx	#LEN_WORD
	bcc	]lp
	beq	]lp
	rep	#$20
	stz	TEXT_X	; index courant dans TEXTBUFFER
	rts

*-----------------------------------
* SPACE
*-----------------------------------

SPACE	sep	#$20	; remplit la zone du mot
	ldx	#0	; par des espaces
	lda	#chrSPACE	; pour faciliter la
]lp	sta	WORDBUFFER,x	; comparaison des
	inx		; résultats avec
	cpx	#LEN_WORD	; cinq lettres
	bcc	]lp
	rep	#$20
	rts

*-----------------------------------
* DCRIPT
*-----------------------------------

DCRIPT	jsr	ZERO

DCRIPT_1	jsr	SPACE	; efface la zone du mot cible
	jsr	NEXTMO	; cherche un mot, recopie-le
	jsr	TESTMO	; est-il dans les tables ?

	lda	TEXT_X	; si zero, on n'a plus
	bne	DCRIPT_1	; de mot à chercher

	lda	#MOT
	brk	$bd
	rts

*-----------------------------------
* TESTMO
*-----------------------------------

TESTMO	jsr	RETROU	; cherche parmi les 5 tables
	cmp	#chrNULL	; on n'a pas trouvé
	bne	TESTMO_1
	rts
TESTMO_1	sep	#$20	; on a trouvé
	bit	DEJA-1,x
	bmi	TESTMO_2

	sta	MOT-1,x	; enregistre l'index
	lda	#$ff
	sta	DEJA-1,x	; dit qu'on a trouve

TESTMO_2	rep	#$20
	rts

*-----------------------------------
* NEXTMO
*-----------------------------------

NEXTMO	sep	#$20
	ldx	TEXT_X	; cherche le premier caractere
]lp	lda	TEXTBUFFER,x
	cmp	#chrNULL
	beq	NEXTMO_1
	cmp	#chrSPACE
	bne	NEXTMO_2	; on a trouvé un caractère
	inx
	cpx	lenSTRING
	bcc	]lp
NEXTMO_1	rep	#$20	; retourne sans avoir trouvé
	stz	TEXT_X
	sec		
	rts

	mx	%10
	
* 2. recopie le mot

NEXTMO_2	ldy	#0
]lp	lda	TEXTBUFFER,x
	cmp	#chrNULL
	beq	NEXTMO_4
	cmp	#chrSPACE
	beq	NEXTMO_4
	sta	WORDBUFFER,y
	inx
	cpx	lenSTRING
	bcs	NEXTMO_4
	iny
	cpy	#LEN_WORD
	bcc	]lp

NEXTMO_3	lda	TEXTBUFFER,x	; on est là, on peut avoir
	cmp	#chrNULL	; coupé un mot, ie <>_ ou \0
	beq	NEXTMO_4
	cmp	#chrSPACE
	beq	NEXTMO_4
	inx
	cpx	lenSTRING
	bcc	NEXTMO_3
	
NEXTMO_4	rep	#$20	; retourne en ayant trouvé
	stx	TEXT_X
	clc
	rts

	mx	%00
	
*-----------------------------------
* PACAPI
*-----------------------------------

PACAPI
	rts

*-----------------------------------
* PRESENT
*-----------------------------------

PRESENT	@MODE	#1	; 320x200
	@BORDER	#0;#0
	@INK	#0;#0	; noir
	@INK	#1;#26	; blanc
	@INK	#2;#9	; vert
	@INK	#3;#15	; orange

	@PAPER	#0;#0	; noir
	@PEN	#0;#1	; blanc
	@CLS	#0

	jsr	FENETR
	
	rts
	
	ldal	HORIZCNT	; affiche image 119 ou 120
	and	#%00000001
	clc
	adc	#picVOYAGE
	jsr	showPIC

	@center	#10;#phrase01
	@center	#26;#phrase02
	@center	#34;#phrase03
	@center	#42;#phrase04

	@gotoxy	#30*8;#6
	@print	#phrase05
	@gotoxy	#30*8;#7
	@print	#phrase06
	@gotoxy	#28*8;#8
	@print	#phrase07
	@gotoxy	#29*8;#9
	@print	#phrase08
	@gotoxy	#26*8;#10
	@print	#phrase09
	@gotoxy	#28*8;#11
	@print	#phrase10
	@gotoxy	#28*8;#12
	@print	#phrase11
	@gotoxy	#27*8;#13
	@print	#phrase12
	@gotoxy	#26*8;#14
	@print	#phrase13

	@INKEY
	rts

*-----------------------------------
* VICTOI
*-----------------------------------

VICTOI	jsr	FENETR
	@draw	#picVICTOIRE
	jsr	MUSVIC
	jmp	REJOU

*-----------------------------------
* GETCOM
*-----------------------------------

GETCOM	@LOCATE	#1;#1;#5
	@PRINT	#1;#strCOMMANDE
	@INPUT	#TEXTBUFFER;#MAX_LEN
	stx	lenSTRING
	rts

*-----------------------------------
* CLEARW
*-----------------------------------

CLEARW
	rts

*-----------------------------------
* ANALYS
*-----------------------------------

ANALYS
	rts

*---------- 

IMPOSS

*-----------------------------------
* CONDIT
*-----------------------------------

CONDIT
	rts
	
*----------  

TESTCO

*-----------------------------------
* TOUTES LES CONDITIONS
*-----------------------------------

*---------- A - 

CONDA

*---------- B - 

CONDB

*---------- C - 

CONDC

*---------- D - 

CONDD

*---------- E - 

CONDE

*---------- F - 

CONDF

*---------- G - 

CONDG

*---------- H - 

CONDH

*---------- I - 

CONDI

*---------- J - 

CONDJ

*---------- K - 

CONDK

*---------- L - 

CONDL

*---------- M - 

CONDM

*---------- INVERSE LE FLAG S

INVERZ

*---------- BON RETOUR

BON

*---------- MAUVAIS RETOUR

MAUVAIS

*-----------------------------------
* AFFICH
*-----------------------------------

AFFICH
	rts

*-----------------------------------
* AFFIC0
*-----------------------------------

AFFIC0	
	rts

*-----------------------------------
* AFFIC1
*-----------------------------------

AFFIC1
	rts

*-----------------------------------
* AFFIC2
*-----------------------------------

AFFIC2	
	rts

*-----------------------------------
* AFFIC3
*-----------------------------------

AFFIC3	
	rts

*-----------------------------------
* CLEARF
*-----------------------------------

CLEARF
	rts

*-----------------------------------
* ACTION
*-----------------------------------

ACTION

*---------- 

NEXTAC

*---------- 

TESTAC

*-----------------------------------
* TOUTES LES ACTIONS
*-----------------------------------

*---------- A - 

ACTIONA	rts

LISTE	@gotoxy2	#26*8;#78
	@print	#strAUCUN
	rts

*---------- B - 

ACTIONB	rts

*---------- C - 

ACTIONC	rts

*---------- D - 

ACTIOND	rts

*---------- E - 

ACTIONE	rts

*---------- F - 

ACTIONF	rts

*---------- G - 

ACTIONG	rts

*---------- H - 

ACTIONH	rts

*---------- I - 

ACTIONI	rts

*---------- J - 

ACTIONJ	rts

*---------- K - 

ACTIONK	rts

*---------- L - 

ACTIONL	rts

*---------- M - 

ACTIONM	rts

*---------- N - 

ACTIONN	rts

*---------- O - 

ACTIONO	rts

*---------- P - 

ACTIONP	rts

*---------- Q - 

ACTIONQ	rts

*---------- R - 

ACTIONR	rts

*---------- S - 

ACTIONS	rts

*---------- T - 

ACTIONT	rts

*---------- U - 

ACTIONU	rts

*---------- V - 

ACTIONV	rts

*---------- W - 

ACTIONW	rts

*---------- X - 

ACTIONX	rts

*---------- Y - 

ACTIONY	rts

*---------- Z - 

ACTIONZ	rts

*---------- ] - GROS MOTS

ACTION0	rts

*-----------------------------------
* MUSIQUE DE MORT
*-----------------------------------

MUSMORT
	rts

*-----------------------------------
* MUSIQUE DE LA VICTOIRE
*-----------------------------------

MUSVIC
	rts

*-----------------------------------
* MUSIQUE DE PRESENTATION
*-----------------------------------

MUSPRE
	rts

*-----------------------------------
* RIRE
*-----------------------------------

RIRE	rts

*-----------------------------------
* GESTION DES ISSUES
*-----------------------------------
	
ISSUE	lda	SALLE
	cmp	#NBISSUE
	bcc	ISSUE1
	beq	ISSUE1
	rts

ISSUE1	@gotoxy2	#8;#38
	@print	#strISSUES

	ldx	SALLE
	lda	ISSUE$,x
	bne	ISSUE2

	@print	#strAUCUNE
	rts

ISSUE2	stz	DRAP	; pour la virgule

	asl
	bcc	IS_S
	pha
	jsr	VIRG
	@print	#strNORD
	pla

IS_S	asl
	bcc	IS_E
	pha
	jsr	VIRG
	@print	#strSUD
	pla
	
IS_E	asl
	bcc	IS_O
	pha
	jsr	VIRG
	@print	#strEST
	pla
	
IS_O	asl
	bcc	IS_H
	pha
	jsr	VIRG
	@print	#strOUEST
	pla

IS_H	asl
	bcc	IS_B
	pha
	jsr	VIRG
	@print	#strHAUT
	pla

IS_B	asl
	bcc	IS_ENTREE
	pha
	jsr	VIRG
	@print	#strBAS
	pla

IS_ENTREE	asl
	bcc	IS_SORTIE
	pha
	jsr	VIRG
	@print	#strENTREE
	pla

IS_SORTIE	asl
	bcc	IS_FIN

	jsr	VIRG
	@print	#strSORTIE

IS_FIN	rts

*---------- Affiche une virgule de séparation

VIRG	lda	DRAP
	beq	VIR

	@print	#strCOMMA
	
VIR	inc	DRAP
	rts

*-----------------------------------
* DU BASIC A L'ASSEMBLEUR (BEURK)
*-----------------------------------

:100	ldx	#$11
	lda	P,x
	cmp	#1
	beq	:140

:101	lda	SALLE
	cmp	#23
	bne	:102
	ldx	#3
	lda	P,x
	cmp	#1
	beq	:130

:102	lda	SALLE
	cmp	#14
	bne	:104
	ldx	#4
	lda	P,x
	cmp	#1
	beq	:130
	
:104	lda	SALLE
	cmp	#20
	bne	:106
	ldx	#5
	lda	P,x
	cmp	#1
	beq	:130

:106	lda	SALLE
	cmp	#29
	bne	:108
	ldx	#6
	lda	P,x
	cmp	#1
	beq	:130
	
:108	lda	SALLE
	cmp	#38
	bne	:110
	ldx	#7
	lda	P,x
	cmp	#1
	beq	:130

:110	jmp	:200

:130
*	jsr	HGR
*	@print	#strILFAITNOIR
*	jsr	:30000
	jmp	:500

:140
*	jsr	HGR
*	@print	#strVOSYEUX
	jmp	:500

*-----------------------------------
* 200 - description salle
*-----------------------------------

:200
*	jsr	HGR
	@draw	SALLE

	lda	A2	; trace des dessins
	beq	:206
	cmp	#1
	bne	:204
*	jsr	:12010	; 1er "cadre"
	bra	:206
:204	cmp	#2
	bne	:206
*	jsr	:12020	; 2nd "cadre"

:206	lda	PP
	bne	:210
	
	lda	SALLE
	cmp	#11
	bne	:300

	lda	#1
	sta	PP
*	jsr	:4920

:210	ldx	#-1
	lda	SALLE
	cmp	#21
	bcs	:220
	ldx	#1
	jmp	:270

:220	cmp	#26
	bcs	:230
	ldx	#3
	jmp	:270

:230	cmp	#31
	bcs	:240
	ldx	#0
	jmp	:270

:240	cmp	#52
	bcs	:270
	ldx	#2
	cmp	#26

:270	cpx	#-1
	beq	:300
	
	txa
*	jsr	printNIVEAU
	
*-----------------------------------
		
:300	lda	#0
	sta	H
	sta	HH	; for comma
	lda	#1
	sta	N
	
:310	ldx	N
	lda	OBJSAL,x
	cmp	SALLE
	bne	:400
	
	lda	H
	bne	:350

	@print	#strILYA
	
	inc	H

:350	lda	HH
	beq	:360

	@print	#strCOMMA

:360	@print	#strSPACE

	lda	N
	asl
	tax
	ldy	tblOBJSAL,x
	lda	tblOBJSAL+1,x
	tax
*	jsr	printCSTRING

	inc	HH
	
:400	inc	N
	lda	N
	cmp	#NBOBJET
	bcc	:310
	beq	:310

*	@print	#strRETURN
	
*-----------------------------------
* 500 - ACCEPTATION COMMANDE
*-----------------------------------

:500	lda	SALLE
	cmp	#51
	beq	:510
	cmp	#48
	beq	:510
	cmp	#22
	beq	:510
	cmp	#4
	beq	:510
	cmp	#17
	beq	:510
	jmp	:3500

:510	ldx	#3
	lda	C,x
	dec	C,x
	cmp	#1
	bne	:520
*	jmp	:4820	; mort par contamination radioactive

:520	jmp	:3500

*-----------

:530	@print	#strCOMMANDE	; commande avec energie

:535	@INPUT	#TEXTBUFFER;#MAX_LEN
	@UPPER	#TEXTBUFFER;#TEXTBUFFER

	lda	SUJET
	bne	:900

	@print	#strJENECOMPRENDSPAS
	jmp	:3500

*-----------------------------------
* 900 - CONTROLES APPLE II
*-----------------------------------
*
*:900	cmp	#idxTIMER
*	bne	:905
*	
*	jsr	switchTEMPS	; temps et énergie
*	jmp	:100
*
*:905	cmp	#idxMUSIC
*	bne	:915
*	
*	jsr	switchMUSIC
*	jmp	:100
*
*-----------------------------------
* 910 - CONTROLE MVT
*-----------------------------------

:900
:915	ldy	#0

*	jsr	gereFORCE	; FORCE--
	
:920	lda	SALLE	; T$=MID(M$(SALLE),Z,2)
	asl
	tax
	lda	tblMOUVEMENT$,x
	sta	LINNUM
	lda	tblMOUVEMENT$+1,x
	sta	LINNUM+1
	
	lda	(LINNUM),y
	beq	:980
	cmp	SUJET
	bne	:970

:950	iny
	lda	(LINNUM),y
	sta	SALLE
	jmp	:100
	
:970	iny
	iny
	bne	:920

:980	lda	#0
	sta	T
	sta	A1
	
*-----------------------------------
* 1000 - CONTROLE
*-----------------------------------

:1000	lda	#10	; met n'importe quoi
	sta	BFF0
	jsr	checkACTION
	lda	BFF0
	bne	:1700	; 0 si rien trouvé
	
	@print	#strIMPOSSIBLE

	lda	SUJET	; les directions
	cmp	#9
	bcs	:1040
	
*	@print	#strCECHEMIN
	
:1040	@print	#strEXCLAM
	jmp	:500

*-----------------------------------
* 1700 - ACTIONS
*-----------------------------------

:1700	lda	#0
	sta	E

	ldx	#0
]lp	lda	BFE0,x
	sta	E$,x
	inx
	cmp	#-1
	bne	]lp

:1710	ldx	E
	lda	E$,x
	sec
	sbc	#'A'
	pha		; LI

	lda	E$+1,x
	cmp	#'.'
	beq	:1740
	sec
	sbc	#'0'
	tay
	lda	tblD2H,y
	sta	N

	lda	E$+2,x
	sec
	sbc	#'0'
	clc
	adc	N
	sta	N

:1740	lda	#0
	sta	BREAK

	pla
	cmp	#190	; 255-65 = 190 = la fin
	beq	:1760

:1745	asl
	tax
	lda	tbl1800,x
	sta	:1750+1
	lda	tbl1800+1,x
	sta	:1750+2

:1750	jsr	$bdbd

:1760	lda	BREAK
	beq	:1780
	asl
	tax
	lda	tblBRKA,x
	sta	:1762+1
	lda	tblBRKA+1,x
	sta	:1762+2
:1762	jmp	$bdbd

:1780	lda	E
	clc
	adc	#3
	sta	E
	jmp	:1710

*-------- The modified BREAK table

tblBRKA	da	$bdbd
	da	:100,:500,:530
	
*-----------------------------------
* 1800
*-----------------------------------

tbl1800	da	:1800,:1900
	da	:2000,:2100,:2200,:2300,:2400,:2500,:2600,:2700,:2800,:2900
	da	:3000,:3100,:3200
	
*-------- A

:1800	lda	#0
	sta	G
	sta	HH
	sta	H	; for comma
	
	lda	#2	; 500
	sta	BREAK

:1810	inc	G
	lda	G
	tax
	lda	OBJSAL,x
	cmp	#-1
	beq	:1840

	lda	G
	cmp	#NBOBJET
	bcc	:1810
	bcs	:1870
	
:1840	lda	HH
	bne	:1850

	@print	#strVOUSDETENEZ
	
:1850	inc	HH

	lda	H
	beq	:1860
	
	@print	#strCOMMA

:1860	@print	#strSPACE

	lda	G
	asl
	tax
	ldy	tblOBJSAL,x
	lda	tblOBJSAL+1,x
	tax
*	jsr	printCSTRING

	inc	H
	
	lda	G
	cmp	#NBOBJET
	bcc	:1810
	
:1870	lda	HH
	beq	:1880

	@print	#strPOINT
	rts

:1880	@print	#strVOUSRIEN
	rts

*-------- B

:1900	ldx	N
	lda	OBJSAL,x
	cmp	#-1
	bne	:1960

	@print	#strVOUSLAVEZ
	
	lda	#2	; 500
	sta	BREAK
	rts

:1960	lda	#-1
	sta	OBJSAL,x
	
	inc	S
	rts

*-------- C

:2000	ldx	N
	lda	OBJSAL,x
	cmp	#-1
	beq	:2030

	@print	#strNOTOWNED

	lda	#2
	sta	BREAK
	rts

:2030	lda	SALLE
	sta	OBJSAL,x

	dec	S
	rts

*-------- D

:2100	lda	N
	asl
	tax
	lda	tbl4000,x
	sta	:2112+1
	lda	tbl4000+1,x
	sta	:2112+2

:2112	jmp	$bdbd

*-------- E

:2200	ldx	N
	lda	#1
	sta	P,x
	rts

*-------- F

:2300	ldx	N
	lda	#0
	sta	P,x
	rts

*-------- G

:2400	ldy	E	; +3
	iny
	iny
	sty	E
	iny
	lda	E$,y
	sec
	sbc	#'0'
	tax
	lda	tblD2H,x
	
	ldx	N
	sta	C,x
	
	iny
	lda	E$,y
	sec
	sbc	#'0'
	clc
	adc	C,x
	sta	C,x
	rts

*-------- H

:2500	ldx	N
	lda	#0
	sta	OBJSAL,x
	rts

*-------- I

:2600	lda	N
	sta	SALLE
	rts

*-------- J

:2700	@print	#strDACCORD	; jump into K

*-------- K

:2800
	lda	#2	; 500
	sta	BREAK
	rts

*-------- L

:2900	lda	#3	; 530
	sta	BREAK
	rts

*-------- M

:3000	lda	#1	; 100
	sta	BREAK
	rts
	
*-------- N

:3100	jmp	:perdu

*-------- O

:3200	ldx	N
	lda	SALLE
	sta	OBJSAL,x
	rts

*-----------------------------------
* 3500 - LES VERIFICATIONS
*-----------------------------------

:3500	lda	SALLE
	cmp	#11
	bne	:3502
	ldx	#1
	lda	#1
	sta	P,x

:3502	lda	SALLE
	cmp	#19
	bne	:3504
	
	ldx	#1
	lda	#0
	sta	P,x

:3504	lda	SALLE
	cmp	#36
	bne	:3510
	ldx	#2
	lda	P,x
	cmp	#1
	beq	:3510

:3506	ldx	#$d
	lda	OBJSAL,x
	cmp	#-1
	bne	:3508

	@WAIT	#100
*	jsr	:4010
	
	ldx	#2
	lda	#1
	sta	P,x
	jmp	:3510

:3508	@WAIT	#100
*	jmp	:4020

:3510	ldx	#4
	lda	OBJSAL,x
	cmp	#-1
	bne	:3516

:3512	ldx	#8
	dec	C,x
	
:3514	ldx	#8
	lda	C,x
	bne	:3516
*	jmp	:4740

:3516	ldx	#1
	lda	C,x
	beq	:3534
	
:3518	dec	C,x

:3520	lda	C,x
	cmp	#1
	bcs	:3534

:3522	ldx	#3
	lda	OBJSAL,x
	cmp	#-1
	bne	:3524
*	jmp	:4750

:3524	cmp	#51
	beq	:3526
*	jmp	:4760

:3526	lda	SALLE
	cmp	#51
	bne	:3528
*	jmp	:4750

:3528	ldx	#4
	lda	OBJSAL,x
	cmp	#51
	beq	:3530
	ldx	#$13
	lda	OBJSAL,x
	cmp	#51
	beq	:3530
*	jmp	:4780

:3530	lda	SALLE
	cmp	#46
	beq	:3531
	cmp	#49
	bne	:3532
:3531
*	jmp	:4770

:3532	ldx	#$c
	lda	#0
	sta	P,x
*	jsr	:4790
	ldx	#$10
	lda	#1
	sta	P,x
	bne	:3540

:3534	ldx	#$e
	lda	P,x
	beq	:3537

:3535	ldx	#2
	dec	C,x
	lda	C,x
	cmp	#1
	bcs	:3540
	
:3536	ldx	#$e
	lda	#0
	sta	P,x

:3537	ldx	#$c	; LOGO - It was a PEEK not a DEEK
	lda	P,x
	cmp	#0
	bcs	:3540
	
:3538	lda	SALLE
	cmp	#50
	beq	:3540
*	jmp	:4800

:3540	ldx	#$10
	lda	P,x
	beq	:3544

:3542	ldx	#5
	dec	C,x
	lda	C,x
	cmp	#1
	bne	:3544
*	jmp	:4810

:3544	ldx	#6
	lda	C,x
	beq	:3548

:3546	
	dec	C,x
	lda	C,x
	bne	:3548
*	jsr	:4830
	ldx	#8
	lda	#0
	sta	P,x

:3548	ldx	#8
	lda	P,x
	cmp	#1
	beq	:3552

:3550	ldx	#7
	dec	C,x
	lda	C,x
	bne	:3552
*	jsr	:4580
	jmp	:perdu

:3552	ldx	#4
	lda	C,x
	beq	:3556

:3554
	dec	C,x
	lda	C,x
	cmp	#1
	bne	:3556
*	jmp	:4840
	
:3556	jmp	:530

*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

tbl4000
*	da	$bdbd,:4010,:4020,:4030,:4040,:4050,:4060,:4070,:4080,:4090
*	da	:4100,:4110,:4120,:4130,:4140,:4150,:4160,:4170,:4180,:4190
*	da	:4200,:4210,:4220,:4230,:4240,:4250,:4260,:4270,:4280,:4290
*	da	:4300,:4310,:4320,:4330,:4340,:4350,:4360,:4370,:4380,:4390
*	da	:4400,:4410,:4420,:4430,:4440,:4450,:4460,:4470,:4480,:4490
*	da	:4500,:4510,:4520,:4530,:4540,:4550,:4560,:4570,:4580,:4590
*	da	:4600,:4610,:4620,:4630,:4640,:4650,:4660,:4670,:4680,:4690
*	da	:4700,:4710,:4720,:4730,:4740,:4750,:4760,:4770,:4780,:4790
*	da	:4800,:4810,:4820,:4830,:4840,:4850,:4860,:4870,:4880,:4890
*	da	:4900,:4910,:4920
*	
*--------

*-----------------------------------
* GESTION DU NOM DES SALLES
*-----------------------------------

NOMSALLE	lda	SALLE
	cmp	#NBDESCRIPTION
	bcc	NOMSALLE1
	beq	NOMSALLE1
	rts

NOMSALLE1	RTS

	PushLong	#windowLIEU
	PushWord	#-1
	PushWord	#0
	_SpecialRect
	
	@gotoxy2	#8;#63

	lda	SALLE
	asl
	tax
	lda	tblDESCRIPTION,x
	sta	dpFROM
	lda	tblDESCRIPTION+1,x
	sta	dpFROM+1
	
	lda	(dpFROM)
	and	#$ff
	cmp	#'^'
	bne	NOMSALLE2
	rts

NOMSALLE2	RTS
*	jmp	printSTRING2	; b/c dpFROM is set

*-----------------------------------
* INIT
*-----------------------------------

INIT	ldx	#FIN_DATA-DEBUT_DATA
]lp	stz	A1-1,x
	dex
	bne	]lp

*---

	ldx	#NBOBJET	; reset OBJET table
]lp	lda	refOBJSAL-1,x
	sta	OBJSAL-1,x
	dex
	bne	]lp

	ldx	#NBPERSSAL	; reset PERSSAL table
]lp	lda	refPERSSAL-1,x
	sta	PERSSAL-1,x
	dex
	bne	]lp

	ldx	#NBPERSOBJ	; reset PERSOBJ table
]lp	lda	refPERSOBJ-1,x
	sta	PERSOBJ-1,x
	dex
	bne	]lp


*---

	lda	#1
	sta	SALLE
	stz	NBOBJ
	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:perdu
:perdu_bis	

:20050	@INKEY
	cmp	#chrNO
	beq	:20001
	cmp	#chrYES
	bne	:20050
	jmp	PLAY

:20001	jmp	QUIT	; return to the IIgs

*-----------------------------------
* 32000 - GAGNE
*-----------------------------------

:gagne	jmp	:20050

*-----------------------------------
* CODE SPECIFIQUE
*-----------------------------------

*-----------------------------------
* AFFICHE UNE IMAGE - ORPHEE
*-----------------------------------
*
* IF A<192 THEN
*  DRAW B,A +2
* ELSE
*  0 : PLOT C,B,A2 +3
*  1 : PAINT +3
*  2 : BORDER/INK0/INK1/INK2/INK3 +5
*  3 : PRINT (A STRING UNTIL FF) +n
*
	
showPIC	jsr	loadPIC	; charge une image (16-bits)
	bcc	showPICOK
	rts
	
showPICOK	lda	#bufIMAGE
	sta	dpFROM

	ldy	#2	; nombre de pas dans une image
	lda	(dpFROM),y
	sta	maxSTEPS
	stz	theSTEP
	
	lda	dpFROM	; on se met au début des images
	clc
	adc	#4
	sta	dpFROM
	
	PushLong	#windowIMAGE
	PushWord	#-1
	PushWord	#0
	_SpecialRect

*--- Boucle principale

spLOOP	ldy	#0
	lda	(dpFROM),y
	and	#$ff
	sta	theA
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theB
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theC

	lda	theA
	cmp	#192	; commande %11xx_xxxx
	bcs	spOTHER

	lda	#maxY
	sec
	sbc	theA
	sta	theY	; <192 alors DRAW
	lda	theB
	sta	theX
	jsr	DRAW_O
	jmp	skip2

*--- Gère les autres cas

spOTHER	lda	theA
	and	#%00110000
	lsr
	lsr
	lsr
	lsr
	sta	theA1

	lda	theA
	and	#%00001100
	lsr
	lsr
	sta	theA2
	
	lda	theA
	and	#%00000011
	sta	theA3
	beq	spPLOT
	cmp	#2
	beq	spINK
	cmp	#3
	beq	spECRIT

spPAINT	lda	theC
	sta	fillX
	lda	#maxY
	sec
	sbc	theB
	sta	fillY
	jsr	FILL_O
	jmp	skip3

spPLOT	lda	theC
	sta	theX
	lda	#maxY
	sec
	sbc	theB
	sta	theY
	jsr	PLOT_O
	jmp	skip3

spINK	lda	theB
	sta	theINK0
	lda	theC
	sta	theINK1
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK2
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK3
	jmp	skip5

spECRIT	lda	theC
	pha
	lda	#maxY+8
	sec
	sbc	theB
	pha
	_MoveTo
	
	PushWord	#0
	_GetTextMode

	PushWord	#modeForeCopy
	_SetTextMode

	ldy	#3
]lp	lda	(dpFROM),y
	and	#$ff
	cmp	#$ff
	beq	L94B9
	phy
	pha
	_DrawChar
	ply
	iny
	bne	]lp
L94B9	tya
	clc
	adc	dpFROM
	sta	dpFROM

	_SetTextMode

	jmp	skip1

*--- Next one, please...

skip5	inc	dpFROM
skip4	inc	dpFROM
skip3	inc	dpFROM
skip2	inc	dpFROM
skip1	inc	dpFROM

	inc	theSTEP
	lda	theSTEP
	cmp	maxSTEPS
	bcs	drawEXIT
	jmp	spLOOP

drawEXIT	rts

*-----------------------------------

PLOT_O	PushWord	theX	; On déplace le curseur seulement
	PushWord	theY
	_MoveTo
	PushWord	theX	; On trace un point
	PushWord	theY
	_LineTo
	rts

*-----------------------------------

DRAW_O	PushWord	theX	; On trace une ligne
	PushWord	theY
	_LineTo
	rts

*-----------------------------------

resMode	=	%0001_0000000000_10

FILL_O	ldx	theA1	; sets the pattern to use
	lda	a2gsCOLOR,x
	and	#$ff
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#blackPATTERN
	sta	patternPtr

	PushLong	#srcLocInfoPtr
	PushLong	#srcRect
	PushLong	#srcLocInfoPtr
	PushLong	#srcRect
	PushWord	fillX
	PushWord	fillY
	PushWord	#resMode
	PushLong	patternPtr
	PushLong	#leakTblPtr
	_SeedFill
	rts

*----------- DATA

theSTEP	ds	2	; pas courant
maxSTEPS	ds	2	; nombre de pas dans un image

*----------- FILL

fillX	ds	2
fillY	ds	2
fillCOLOR	ds	2

srcLocInfoPtr	dw	mode320	; mode 320
	adrl	ptr012000
	dw	160
	dw	68,0,200,204

srcRect	dw	68,0,200,204

patternPtr	adrl	blackPATTERN ; pointer to pattern

leakTblPtr	dw	1
	dw	$0000	; color 0 is concerned
	
*-----------------------------------
* CHARGE UNE IMAGE
*-----------------------------------

	mx	%00
	
loadPIC	and	#$ff
	pha
	PushLong	#strSALLE
	PushWord	#3
	PushWord	#FALSE
	_Int2Dec

*--- Comment on recopie la string

	ldx	#0
	sep	#$20

	lda	strSALLE
	cmp	#' '
	beq	noCHAR1
	inx
	sta	pSALLE,x

noCHAR1	lda	strSALLE+1
	cmp	#' '
	beq	noCHAR2
	inx
	sta	pSALLE,x

noCHAR2	lda	strSALLE+2
	cmp	#' '
	beq	noCHAR3
	inx
	sta	pSALLE,x
	
noCHAR3	rep	#$20
	txa
	clc
	adc	#19	; on ajoute
	sta	pIMAGE	; la longueur par défaut

	lda	#'.B'
	sta	pSALLE+1,x
	lda	#'IN'
	sta	pSALLE+3,x

*--- Open/Read/Write

	jsl	GSOS
	dw	$2010
	adrl	proOPENPIC
	bcs	loadPIC99

	lda	proOPENPIC+2
	sta	proREADPIC+2
	sta	proCLOSE+2
	
	jsl	GSOS
	dw	$2012
	adrl	proREADPIC
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE

loadPIC99	rts

*---

strSALLE	ds	3	; len max d'une salle

pIMAGE	strl	'8/data/images/'
pSALLE	asc	'D'
	ds	7	; xxx.BIN

proOPENPIC	dw	2
	ds	2
	adrl	pIMAGE

proREADPIC	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	bufIMAGE	; 4 - data_buffer
	adrl	2048	; 8 - request_count
	ds	4	; C - transfer_count

*-----------------------------------
* RECOPIE ACTION A$
*-----------------------------------
	
checkACTION	lda	#ACTION$	; POINTEUR
	sta	dpFROM
	sep	#$30
	
L953B       LDY	#0
            LDA	(dpFROM),Y
            CMP	MO$1	; premier mot
            BEQ	L9546
            JMP	L95EF
L9546       INY	
            LDA	(dpFROM),Y
            BEQ	L9552
            CMP	MO$2	; second mot
            BEQ	L9552
            JMP	L95EF

L9552       INY		; on a trouvé, on gère
            LDA	(dpFROM),Y
            INY	
            TAX	
            LDA	(dpFROM),Y
            and	#$ff
            CPX	#$41	; A
            BEQ	L958B
            CPX	#$42	; B
            BEQ	L9593
            CPX	#$43	; C
            BEQ	L95A3
            CPX	#$44	; D
            BEQ	L95B3
            CPX	#$45	; E
            BEQ	L95BE
            CPX	#$46	; F
            BEQ	L95C7
            CPX	#$47	; G
            BEQ	L95D0
            CPX	#$48	; H
            BEQ	L95DB
            CPX	#$49	; I
            BEQ	L95E7

            LDX	#0	; sinon, on recopie until FF
L957F       LDA	(dpFROM),Y
            STA	BFE0,X
            INY	
            INX	
            CMP	#-1
            BNE	L957F
            
            rep	#$30
            RTS

	mx	%11

*-- A - 

L958B       CMP	SALLE
            BNE	L95EF
            JMP	L9552		; on boucle

*-- B - 

L9593       TAX
            LDA	OBJSAL-1,X	; les objets
            CMP	#-1
            BEQ	L9552
            CMP	SALLE
            BEQ	L9552
            JMP	L95EF

*-- C - 

L95A3       TAX
            LDA	OBJSAL-1,X
            CMP	#-1
            BEQ	L95EF
            CMP	SALLE
            BEQ	L95EF
            JMP	L9552

*-- D - 

L95B3       TAX
            LDA	OBJSAL-1,X
            CMP	#-1
            BEQ	L9552
            JMP	L95EF

*-- E - 

L95BE       TAX
            LDA	P-1,X
            BNE	L9552
            JMP	L95EF

*-- F - 

L95C7       TAX
            LDA	P-1,X
            BEQ	L9552
            JMP	L95EF

*-- G - 

L95D0       TAX
            LDA	C-1,X
            CMP	#1
            BNE	L95EF
            JMP	L9552

*-- H - RANDOM

L95DB	STA	$7C
*	LDA	$0306
	jsr	RND
	CMP	$7C
	BCS	L95EF
	JMP	L9552

*-- I - 

L95E7       CMP	SALLE
            BEQ	L95EF
            JMP	L9552

*--- next

L95EF	inc	dpFROM
	bne	L95F0
	inc	dpFROM+1
L95F0	lda	(dpFROM)	; until the end
	cmp	#-1
	bne	L95EF
	
	inc	dpFROM
	bne	L95F1
	inc	dpFROM+1
L95F1	lda	(dpFROM)	; on a parcouru
            cmp	#chrNULL
	beq	L9619	; le tableau, on sort
	cmp	#chrEOT
	beq	L9619
	jmp	L953B

L9619	LDA	#$00
	STA	BFF0
	rep	#$30
	RTS

	mx	%00
	
*--- data

BFE0	ds	16
BFF0	ds	16

*-----------------------------------
* DATA
*-----------------------------------

TEXTBUFFER	ds	MAX_LEN+1
WORDBUFFER	ds	MAX_LEN+1

*-----------------------------------

DEBUT_DATA

A1	ds	2
A2	ds	2	; $400
BREAK	ds	2
E	ds	2
G	ds	2
H	ds	2
HH	ds	2
I	ds	2
IX	ds	2
IY	ds	2
IZ	ds	2

MOT
SUJET	ds	1
VERBE	ds	1
ARTICLE	ds	1
COD	ds	1
ADJECTIF	ds	1
ATTRIBUT	ds	1

DEJA	ds	6	; 0 si pas trouvé, -1 sinon

TEXT_X	ds	2

fgSOMBRE	ds	2
L81BC	ds	2

N	ds	2
NL	ds	2
OK	ds	2
PP	ds	2
S	ds	2	; parce qu'on l'utilise en 16-bits aussi
SALLE	ds	2
NBOBJ	ds	2
DRAP	ds	2
T	ds	2

theA	ds	2
theA1	ds	2
theA2	ds	2
theA3	ds	2
theB	ds	2
theC	ds	2
theX	ds	2
theY	ds	2
theINK0	ds	2
theINK1	ds	2
theINK2	ds	2
theINK3	ds	2

C	ds	32
P	ds	32
E$	ds	32

OBJSAL	ds	NBOBJET+1
PERSSAL	ds	NBPERSSAL+1
PERSOBJ	ds	NBPERSOBJ+1

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

tblD2H	dfb	0,10,20,30,40,50,60,70,80,90

indexCPC	dfb	20,04,21,28,24,29,12,05,13,22
	dfb	06,23,30,00,31,14,07,15,18,02
	dfb	19,26,25,27,10,03,11,01,08,09
	dfb	16,17

a2gsCOLOR	dfb	0,1,2,3,4,5,6,7,8,9
	dfb	0,1,2,3,4,5,6,7,8,9
	dfb	0,1,2,3,4,5,6,7,8,9
	dfb	0,1
	
paletteCPC	dw	$0000,$0005,$000F,$0D00,$0D05,$0D0F,$0F00,$0F05,$0F0F,$00D0
	dw	$00D5,$00DF,$0DD0,$0DD5,$0DDF,$0FD0,$0FD5,$0FDF,$00F0,$00F5
	dw	$00FF,$0DF0,$0DF5,$0DFF,$0FF0,$0FF5,$0FFF,$0DD5,$0F05,$0FF5
	dw	$0005,$00F5

*---

bufIMAGE	ds	2048
