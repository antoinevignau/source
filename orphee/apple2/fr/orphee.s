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

picSALSOM	=	116	; salle obscure
picMORT	=	117	; mort
picVICTOIRE	=	118	; victoire
picVOYAGE	=	119	; voyage aux enfers
picORPHEE	=	120	; orphée

MAX_LEN	=	32
NB_CAR	=	16	; max size of a word
LEN_WORD	=	5	; but limit to 4

NBCONDITIONS	=	26
NBPOINTEURS	=	67
MAXPORTES	=	7	; pas plus de 7 objets

iSUJET	=	1	; 
iVERBE	=	2	; 
iCOD	=	3	; 
iADJECTIF	=	4	; 
iATTRIBUT	=	5	; 
iARTICLE	=	6	; 

wINVENTAIRE	=	1
wPERSONNAGE	=	2
wSALLE	=	3
wMESSAGE	=	4

*-----------------------------------
* MACROS
*-----------------------------------

@asc	mac
	asc	#]2
	dfb	#]1
	eom

@print	mac
	jsr	RETURN
	<<<

@draw	mac
	jsr	GRAPHE
	<<<

@get_salsomb	mac
	ldx	#]1
	jsr	GET_SALSOMB
	<<<
	
@set_salsomb	mac
	ldx	]1
	lda	]2
	jsr	SET_SALSOMB
	<<<
	
@get_objsal	mac
	ldx	#]1
	jsr	GET_OBJSAL
	<<<

@set_objsal	mac
	ldx	]1
	lda	]2
	jsr	SET_OBJSAL
	<<<
	
@get_perssal	mac
	ldx	#]1
	jsr	GET_PERSSAL
	<<<

@set_perssal	mac
	ldx	]1
	lda	]2
	jsr	SET_PERSSAL
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

PLAY	@MODE	#1
	@INK	#0;#26	; blanc
	@INK	#1;#0	; noir
	@INK	#2;#9	; vert
	@INK	#3;#15	; orange
	@PAPER	#0;#0	; blanc
	@PEN	#0;#1	; noir
	
	@CLS	#0

	@WINDOW	#wINVENTAIRE;#tblWINDOW1	; pour l'inventaire
	@PAPER	#wINVENTAIRE;#0
	@PEN	#wINVENTAIRE;#1
	
	@WINDOW	#wPERSONNAGE;#tblWINDOW2	; pour les personnages
	@PAPER	#wPERSONNAGE;#0
	@PEN	#wPERSONNAGE;#1

	@WINDOW	#wSALLE;#tblWINDOW3	; pour la salle
	@PAPER	#wSALLE;#0
	@PEN	#wSALLE;#1
	
	@WINDOW	#wMESSAGE;#tblWINDOW4	; pour les messages
	@PAPER	#wMESSAGE;#0
	@PEN	#wMESSAGE;#1

REPLAY	jsr	PRESENT
	jsr	INIT_ALL
	jsr	RIRE

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
	
CALCUL			; inutile
	
DESSIN	lda	SALLE
	ldy	#SALLE$
	jsr	CHERC
	jsr	AFFIC3
	ldx	SALLE	; parce qu'on peut inverser
	lda	ADR-1,x	; des salles
	jsr	GRAPHE
	jsr	ISSUE
	jmp	DEPA2

*-----------------------------------

SOMBR	@get_objsal	#6
	cmp	SALLE
	beq	CALCUL
	cmp	#-1
	beq	CALCUL
	
	@get_objsal	#14
	cmp	SALLE
	beq	CALCUL
	cmp	#-1
	beq	CALCUL
	
	@get_perssal	#1
	cmp	SALLE
	bne	SOMBRE
	
	lda	L81BC
	cmp	#6
	beq	CALCUL
	cmp	#14
	beq	CALCUL

*-----------------------------------

SOMBRE	lda	#TRUE
	sta	fgSOMBRE

	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
	
	@draw	#picSALSOM

*-----------------------------------

DEPA2
*	jsr	VERIFI

	lda	fgSOMBRE
	cmp	#TRUE
	bne	DEPA2_1
	jmp	DEPA3

DEPA2_1	@CLS	#wINVENTAIRE
	@PRINT	#wINVENTAIRE;#strOBJETSPRESENTS
	
	lda	SALLE	; affiche les objets
	sta	N	; de la salle
	jsr	LISTE
	
	@CLS	#wPERSONNAGE
	@PRINT	#wPERSONNAGE;#strPERSONNAGES

	lda	#FALSE
	sta	DRAP
	ldx	#1
]lp	sep	#$20
	lda	PERSSAL-1,x
	cmp	SALLE
	beq	IMPRIM
DEPA2_2	inx
	cpx	#NBPERSONNAGE
	bcc	]lp
	beq	]lp
	rep	#$20

	lda	DRAP
	cmp	#TRUE
	beq	DEPA3
	
NESSUN	@PRINT	#wPERSONNAGE;#strAUCUN
	jmp	DEPA3

	mx	%10
	
IMPRIM	stx	IX
	rep	#$20

	txa
	ldy	#PERSONNAGE$
	jsr	CHERC
	jsr	AFFIC2
	
	lda	#TRUE
	sta	DRAP
	sep	#$20
	ldx	IX
	bra	DEPA2_2

	mx	%00

*-----------------------------------

DEPA3	jsr	GETCOM	; saisie des caracteres
	jsr	DCRIPT	; déchiffre la chaîne saisie
	jsr	showSALLE
	
	lda	SUJET
	and	#$ff
	cmp	#FALSE
	bne	DEPA31	; CP 0 ... JR NZ,DEPA31
	lda	VERBE
	and	#$ff
	cmp	#FALSE
	beq	DEPA32	; CP 0 ... JR Z,DEPA32
	cmp	#12
	bne	DEPA31	; CP 12 ... JR NZ,DEPA31
	
DEPA32	lda	COD	; = MOT$+3
	cmp	#FALSE
	beq	DEPA31	; CP 0 ... JR Z,DEPA31
	jsr	MVT

DEPA31	jsr	ANALYS
	jmp	DEPA2

*--- DEBUG

RETURN	rts		; ne fait rien

*-----------------------------------
* REJOU
*-----------------------------------

REJOU	@PRINT	#wMESSAGE;#strREJOUER
	
*-----------------------------------
* ATTEN
*-----------------------------------

ATTEN	@INKEY
	cmp	#chrYES
	beq	ATTEN_1
	cmp	#chrNO
	bne	ATTEN
	jmp	QUIT
ATTEN_1	jmp	REPLAY	; return to the IIgs

*-----------------------------------
* MORT
*-----------------------------------

MORT	@PRINT	#wMESSAGE;#strRETURN
	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
	@draw	#picMORT
	jsr	RIRE
	jsr	MUSMORT
	jmp	REJOU

*-----------------------------------
* MVT
*-----------------------------------

MVT	lda	SALLE	; pointe sur la table
	ldy	#TBLMOUVEMENT	; de direction de la salle
	jsr	CHERC
	sta	dpFROM
	
	sep	#$20

	ldy	#0
]lp	lda	(dpFROM),y	; prend la direction
	cmp	#chrNULL	; fin de ligne
	bne	MVT_1
	rep	#$20
	sec
	rts		; on sort sans avoir trouvé

	mx	%10
	
MVT_1	cmp	COD
	bne	MVT_2	; pas la bonne direction

	iny		; direction trouvée
	lda	(dpFROM),y	; récupère la salle
	sta	SALLE
	rep	#$20
	clc
	pla
	jmp	DEPA1	; on sort en ayant trouvé

	mx	%10
	
MVT_2	iny		; +2
	iny
	bra	]lp

	mx	%00

*-----------------------------------
* CHERC
*-----------------------------------
* A: index cherchée
* Y: pointeur vers table

CHERC	cmp	#0
	bne	CHERC_1
	rts

CHERC_1	dec
	beq	CHERC_2
	tax		; number of entries 
]lp	iny
	lda	|$0000,y
	and	#$ff
	bne	]lp	; loop until \0
	dex		; entries--
	bne	]lp	; loop if non-zero
	iny		; found it, pointer++
	
CHERC_2	tya		; return the pointer
	rts

*-----------------------------------
* RETOBJ
*-----------------------------------

RETOBJ	txa
	sep	#$20
	ldy	#1
]lp	cmp	PERSOBJ-1,y
	beq	RETOBJ_1
	inx
	cpx	#8
	bcc	]lp
	beq	]lp
	rep	#$20
	rts
	
	mx	%10

RETOBJ_1	lda	#FALSE
	sta	PERSOBJ-1,x
	rep	#$20
	rts

	mx	%00
	
*-----------------------------------
* PASICI
*-----------------------------------

PASICI	@PRINT	#wMESSAGE;#strPASICI
	bra	OBJ_EXIT
	
*-----------------------------------
* NOOBJ
*-----------------------------------
* Vous ne pouvez pas poser ce que vous n'avez pas

NOOBJ	@PRINT	#wMESSAGE;#strNOTOWNED

OBJ_EXIT	lda	#DEPA2
	sec
	rts

*-----------------------------------
* TROOBJ
*-----------------------------------
* Vous ne pouvez pas porter tant

TROOBJ	@PRINT	#wMESSAGE;#strTROPPORTER
	bra	OBJ_EXIT

*-----------------------------------
* DEJOBJ
*-----------------------------------
* Vous l'avez déjà

DEJOBJ	@PRINT	#wMESSAGE;#strVOUSLAVEZ
	bra	OBJ_EXIT

*-----------------------------------
* DEJAUN
*-----------------------------------
* Je ne porte pas plus d'un objet

DEJAUN	@PRINT	#wMESSAGE;#strPASPLUS
	bra	OBJ_EXIT

*-----------------------------------
* PASOBJ
*-----------------------------------
* Je ne porte rien

PASOBJ	@PRINT	#wMESSAGE;#strPORTERIEN
	bra	OBJ_EXIT

*-----------------------------------
* AIDEJA
*-----------------------------------
* Je l'ai déjà

AIDEJA	@PRINT	#wMESSAGE;#strAIDEJA
	bra	OBJ_EXIT

*-----------------------------------
* FINDMO
*-----------------------------------

FINDMO	sta	dpFROM	; cherche un mot de 5 lettres
			; dans une liste

FINDMO_1	sep	#$20
	ldy	#0
]lp	lda	(dpFROM),y
	and	#$ff
	cmp	#chrNULL	; fin de table ?
	beq	FINDMO_2	; oui, sors
	cmp	WORDBUFFER,y	; non, compare
	bne	FINDMO_3
	iny
	cpy	#LEN_WORD
	bcc	]lp

	lda	(dpFROM),y	; l'index du mot
FINDMO_2	rep	#$20
	and	#$ff
	tay
	rts

FINDMO_3	rep	#$20	; on n'a pas trouvé
	lda	dpFROM	; met le prochain mot
	clc
	adc	#LEN_WORD+1	; 5+1 = 6
	sta	dpFROM
	bra	FINDMO_1

	mx	%00

*-----------------------------------
* FENETR
*-----------------------------------

FENETR	@GFXPEN	#1	; noir

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

tblWINDOW1	dw	36,52,8,18
tblWINDOW2	dw	36,52,20,24
tblWINDOW3	dw	2,33,8,8
tblWINDOW4	dw	2,52,2,6

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

*-------------------------------
* DEBUG
*-------------------------------

showSALLE	lda	SUJET
	jsr	getDEBUG
	sta	strCOMMANDE+0
	lda	VERBE
	jsr	getDEBUG
	sta	strCOMMANDE+2
	lda	COD
	jsr	getDEBUG
	sta	strCOMMANDE+4
	lda	ARTICLE
	jsr	getDEBUG
	sta	strCOMMANDE+6
	lda	ADJECTIF
	jsr	getDEBUG
	sta	strCOMMANDE+8
	lda	ATTRIBUT
	jsr	getDEBUG
	sta	strCOMMANDE+10
	rts
	
getDEBUG	pha
	PushLong	#strDEBUG
	PushWord	#2
	PushWord	#FALSE
	_Int2Dec

	lda	strDEBUG
	ora	#'00'
	sta	strDEBUG
	rts

*--- Data

strDEBUG	ds	3	; trailing \0

*---------------

showBORDER	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts

*-----------------------------------
* VERIFI
*-----------------------------------

VERIFI	lda	#TBLCONDITIONS
	sta	dpCONDITIONS

	jsr	getCONDITION
VERIFI_1	cmp	#'a'	; teste une action
	bcs	VERIFI_3	; oui
	
	jsr	TESTCO	; non une action, "A".."Z"
	bcc	VERIFI_1

VERIFI_2	jsr	getCONDITION	; erreur, boucle
	cmp	#chrEOL	; jusqu'à la fin
	bne	VERIFI_2	; de la ligne
	
VERIFI_4	jsr	getCONDITION	; prend la nouvelle
	cmp	#chrEOT	; valeur et sort si
	bne	VERIFI_1	; fin de table
	rts

VERIFI_3	jsr	TESTAC	; "a".."z"
	bcc	VERIFI_5
	sta	VERIFI_31+1
VERIFI_31	jmp	RETURN

VERIFI_5	jsr	getCONDITION
	cmp	#chrEOL
	bne	VERIFI_3
	beq	VERIFI_4

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

TEST	lda	nbMOTS	; nombre de mots trouvés
	beq	TEST_1
	rts
TEST_1	pla		; aucun !
	jmp	DEPA3

*-----------------------------------
* ZERO
*-----------------------------------

ZERO	stz	SUJET
	stz	VERBE
	stz	COD
	stz	ARTICLE
	stz	ADJECTIF
	stz	ATTRIBUT
	
	stz	gotATTRIBUT	; on a déjà trouvé un attribut
	stz	endMOTS	; plus de mots si TRUE
	stz	nbMOTS	; nombre de mots trouvés
	stz	fgATTRIBUT
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
	
	lda	endMOTS
	cmp	#TRUE
	beq	TEST	; on sort

	jsr	TESTMO	; est-il dans les tables ?
	bra	DCRIPT_1

*-----------------------------------
* TESTMO
*-----------------------------------

TESTMO	jsr	RETROU	; cherche parmi les 5 tables
	cmp	#chrNULL	; on n'a pas trouvé
	bne	TESTMO_1
	jmp	PACAPI	; on n'a pas compris

* A: index, X: famille

TESTMO_1	inc	nbMOTS	; nombre de mots trouvés++

	cpx	#iARTICLE
	bne	DCRIPT_4

	lda	endMOTS
	cmp	#TRUE
	bne	DCRIPT_9
	jmp	SYNERR

DCRIPT_4	cpx	#iATTRIBUT
	bne	DCRIPT_5
	
	lda	endMOTS
	cmp	#TRUE
	beq	DCRIPT_SYNERR
	cmp	gotATTRIBUT	; IY+1
	beq	DCRIPT_SYNERR
	lda	#TRUE
	sta	gotATTRIBUT
	jmp	DCRIPT_9

DCRIPT_5	cpx	#iVERBE
	bne	DCRIPT_6
	lda	fgATTRIBUT
	cmp	#TRUE
	beq	DCRIPT_SYNERR
	lda	VERBE
	bne	DCRIPT_SYNERR
	sty	VERBE

DCR_FIN	lda	endMOTS
	cmp	#TRUE
	bne	DCRIPT_9
	rts

DCRIPT_9	jmp	DCRIPT_1

DCRIPT_SYNERR	jmp	SYNERR

DCRIPT_6	cpx	#iADJECTIF
	bne	DCRIPT_7
	lda	ADJECTIF
	and	#$ff
	bne	SYNERR
	sty	ADJECTIF
	jmp	DCR_FIN

DCRIPT_7	cpx	#iCOD
	bne	DCRIPT_8
	lda	fgATTRIBUT
	cmp	#TRUE
	bne	DCR_COD

DCR_A	lda	ARTICLE
	and	#$ff
	bne	SYNERR
	sty	ARTICLE
	stz	fgATTRIBUT
	jmp	DCR_FIN

DCR_COD	lda	COD
	and	#$ff
	bne	SYNERR
	sty	COD
	jmp	DCR_FIN

DCRIPT_8	cpx	nbMOTS
	beq	DCR_SUJ
	cpx	fgATTRIBUT
	bne	DCR_COD
	jmp	DCR_A

DCR_SUJ	lda	SUJET
	and	#$ff
	bne	SYNERR
	sty	SUJET
	jmp	DCR_FIN

*-----------------------------------
* SYNERR
*-----------------------------------

SYNERR	@PRINT	#wMESSAGE;#strPBGRAMMAIRE
	pla
	jmp	DEPA3
	
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

NEXTMO_1	rep	#$20
	lda	#TRUE	; retourne sans avoir trouvé
	sta	endMOTS
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
	cmp	#chrGUILLEMET
	beq	NEXTMO_4
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

PACAPI	@PRINT	#wMESSAGE;#strPBCOMPRENDRE
	@PRINT	#wMESSAGE;#TEXTBUFFER
	rts

*-----------------------------------
* PRESENT
*-----------------------------------

PRESENT	jsr	FENETR

	@CLS	#wMESSAGE
	@LOCATE	#wMESSAGE;#1;#5
	@PRINT	#wMESSAGE;#phrase01
	@CLS	#wINVENTAIRE
	@LOCATE	#wINVENTAIRE;#1;#11
	@PRINT	#wINVENTAIRE;#phrase05

	ldal	HORIZCNT	; affiche image 119 ou 120
	and	#%00000001
yurk 	clc
	adc	#picVOYAGE
	jsr	GRAPHE

	@INKEY
	@CLS	#wMESSAGE
	@CLS	#wINVENTAIRE
	rts

*-----------------------------------
* VICTOI
*-----------------------------------

VICTOI	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
	@draw	#picVICTOIRE
	jsr	MUSVIC
	jmp	REJOU

*-----------------------------------
* GETCOM
*-----------------------------------

GETCOM	@PRINT	#wMESSAGE;#strRETURN
	@PRINT	#wMESSAGE;#strCOMMANDE
	@INPUT	#TEXTBUFFER;#MAX_LEN
	stx	lenSTRING
	rts

*-----------------------------------
* GRAPHE
*-----------------------------------
* IF A<192 THEN
*  DRAW B,A +2
* ELSE
*  0 : PLOT C,B,A2 +3
*  1 : PAINT +3
*  2 : BORDER/INK0/INK1/INK2/INK3 +5
*  3 : PRINT (A STRING UNTIL FF) +n
*
	
GRAPHE	jsr	loadPIC	; charge une image (16-bits)
	bcc	GRAPHEOK
	rts
	
GRAPHEOK	lda	#bufIMAGE
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

	lda	#GFX_MAX_Y
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
	lda	#GFX_MAX_Y
	sec
	sbc	theB
	sta	fillY
	jsr	FILL_O
	jmp	skip3

spPLOT	lda	theC
	sta	theX
	lda	#GFX_MAX_Y
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
	lda	#GFX_MAX_Y+8
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
*	PushLong	patternPtr
	PushLong	#redPATTERN
	PushLong	#leakTblPtr
	_SeedFill
	rts

*----------- DATA

theSTEP	ds	2	; pas courant
maxSTEPS	ds	2	; nombre de pas dans un image

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
	dw	$000F	; color 0 is concerned
	
*-----------------------------------
* CLEARW
*-----------------------------------

CLEARW	rts

*-----------------------------------
* ANALYS
*-----------------------------------

ANALYS	lda	#TBLANALYSE
	sta	dpCONDITIONS

	lda	#FALSE
	sta	DRAP
	
MOTS	jsr	getCONDITION
MOTS_1	cmp	SUJET
	beq	MOTS_2
	cmp	#99	; non pertinent
	bne	NOUVEL

MOTS_2	jsr	getCONDITION
	cmp	VERBE
	beq	MOTS_3
	cmp	#99	; non pertinent
	bne	NOUVEL

MOTS_3	jsr	getCONDITION
	cmp	COD
	beq	MOTS_4
	cmp	#99	; non pertinent
	bne	NOUVEL

MOTS_4	jsr	getCONDITION
	cmp	ARTICLE
	beq	MOTS_5
	cmp	#99	; non pertinent
	bne	NOUVEL
	
MOTS_5	jsr	getCONDITION
	cmp	ADJECTIF
	beq	MOTS_6
	cmp	#99	; non pertinent
	beq	MOTS_6

	lda	#TRUE
	sta	DRAP
	jmp	NOUVEL
	
MOTS_6	jmp	CONDIT

*----------

NOUVEL	jsr	getCONDITION
	cmp	#chrEOL
	bne	NOUVEL
	
*----------

FIN	jsr	getCONDITION
	cmp	#chrEOT
	bne	MOTS_1

*---------- 

IMPOSS	lda	DRAP
	cmp	#TRUE
	beq	IMPOSS_2
IMPOSS_1	@PRINT	#wMESSAGE;#strIMPOSSIBLE
	rts

IMPOSS_2	lda	DRAP
	eor	DRAP
	cmp	VERBE
	beq	IMPOSS_1
	@PRINT	#wMESSAGE;#strPLUSPRECIS
	rts

*-----------------------------------
* CONDIT
*-----------------------------------

CONDIT	jsr	getCONDITION
	cmp	#'a'	; est-ce une action ?
	bcs	CONDIT_2	; oui
	
CONDIT_1	jsr	getCONDITION
	tax
	jsr	TESTCO
	bcc	CONDIT	; on boucle si OK
	jmp	NOUVEL	; sinon, on sort

CONDIT_2	jmp	ACTION

*---------- 

TESTCO	cmp	#'A'
	bne	TESTCO_2
	jmp	CONDA
TESTCO_2	cmp	#'B'
	bne	TESTCO_3
	jmp	CONDB
TESTCO_3	cmp	#'C'
	bne	TESTCO_4
	jmp	CONDC
TESTCO_4	cmp	#'D'
	bne	TESTCO_5
	jmp	CONDD
TESTCO_5	cmp	#'E'
	bne	TESTCO_6
	jmp	CONDE
TESTCO_6	cmp	#'F'
	bne	TESTCO_7
	jmp	CONDF
TESTCO_7	cmp	#'G'
	bne	TESTCO_8
	jmp	CONDG
TESTCO_8	cmp	#'H'
	bne	TESTCO_9
	jmp	CONDH
TESTCO_9	cmp	#'I'
	bne	TESTCO_10
	jmp	CONDI
TESTCO_10	cmp	#'J'
	bne	TESTCO_11
	jmp	CONDJ
TESTCO_11	cmp	#'K'
	bne	TESTCO_12
	jmp	CONDK
TESTCO_12	cmp	#'L'
	bne	TESTCO_13
	jmp	CONDL
TESTCO_13	cmp	#'M'
	bne	TESTCO_14
	jmp	CONDM
TESTCO_14	clc
	rts
	
*-----------------------------------
* TOUTES LES CONDITIONS
*-----------------------------------

*---------- A - EST-ON DANS LA SALLE ?

CONDA	cpx	SALLE
	beq	CONDA_1
	sec
	rts
CONDA_1	clc
	rts

*---------- B - OBJET DANS LA SALLE OU PORTé ?

CONDB	sep	#$20
	lda	OBJSAL-1,x
	cmp	SALLE
	beq	CONDB_1
	cmp	#TRUE
	beq	CONDB_1
	rep	#$20
	sec
	rts
CONDB_1	rep	#$20
	clc
	rts

*---------- C - OBJET PAS DANS LA SALLE OU PAS PORTé ?

CONDC	sep	#$20
	lda	OBJSAL-1,x
	cmp	SALLE
	beq	CONDC_1
	cmp	#TRUE
	beq	CONDC_1
	rep	#$20
	clc
	rts
CONDC_1	rep	#$20
	sec
	rts

*---------- D - OBJET PORTé ?

CONDD	sep	#$20
	lda	OBJSAL-1,x
	cmp	#TRUE
	beq	CONDD_1
	rep	#$20
	sec
	rts
CONDD_1	rep	#$20
	clc
	rts

*---------- E - POINTEUR ACTIF ?

CONDE	sep	#$20
	lda	P-1,x
	cmp	#TRUE
	beq	CONDE_1
	rep	#$20
	sec
	rts
CONDE_1	rep	#$20
	clc
	rts

*---------- F - POINTEUR INACTIF ?

CONDF	sep	#$20
	lda	P-1,x
	cmp	#TRUE
	beq	CONDF_1
	rep	#$20
	clc
	rts
CONDF_1	rep	#$20
	sec
	rts

*---------- G - CONDITION ACTIVE ?

CONDG	sep	#$20
	lda	C-1,x
	cmp	#TRUE
	beq	CONDG_1
	rep	#$20
	sec
	rts
CONDG_1	rep	#$20
	clc
	rts

*---------- H - RANDOM < N ALORS OK

CONDH	sta	N
	jsr	RANDOM
	and	#$0f	; AND 15
	asl		; SLA A
	cmp	N	; CP C
	bcs	CONDH_1	; JP P,MAUVAI (si A<=N)
	clc
	rts
CONDH_1	sec
	rts

*---------- I - N'EST PAS DANS LA SALLE

CONDI	cpx	SALLE
	bne	CONDI_1
	sec
	rts
CONDI_1	clc
	rts

*---------- J - PERSONNAGE DANS LA SALLE ?

CONDJ	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CONDJ_1
	sec
	rts
CONDJ_1	clc
	rts

*---------- K - PERSONNAGE PAS DANS LA SALLE ?

CONDK	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	bne	CONDK_1
	sec
	rts
CONDK_1	clc
	rts

*---------- L - PERSONNAGE PORTE L'OBJET DEMANDE ?

CONDL	lda	PERSOBJ-1,x
	and	#$ff
	sta	N
	
	jsr	getCONDITION
	cmp	N
	beq	CONDL_1
	sec
	rts
CONDL_1	clc
	rts

*---------- M - PERSONNAGE NE PORTE PAS L'OBJET DEMANDE ?

CONDM	lda	PERSOBJ-1,x
	and	#$ff
	sta	N
	
	jsr	getCONDITION
	cmp	N
	bne	CONDM_1
	sec
	rts
CONDM_1	clc
	rts

*---------- INVERSE LE FLAG S

INVERZ	rts

*---------- BON RETOUR

BON	rts

*---------- MAUVAIS RETOUR

MAUVAIS	rts

*-----------------------------------
* AFFICH
*-----------------------------------

AFFICH	rts

*-----------------------------------
* AFFIC0 - message
*-----------------------------------

AFFIC0	sta	N
	@PRINT	#wMESSAGE;N
	rts

*-----------------------------------
* AFFIC1 - inventaire
*-----------------------------------

AFFIC1	sta	N
	@PRINT	#wINVENTAIRE;N
	rts

*-----------------------------------
* AFFIC2 - personnage
*-----------------------------------

AFFIC2	sta	N
	@PRINT	#wPERSONNAGE;N	
	rts

*-----------------------------------
* AFFIC3 - salle
*-----------------------------------

AFFIC3	sta	N
	@CLS	#wSALLE
	lda	SALLE
	and	#$ff
	jsr	getDEBUG
	@PRINT	#wSALLE;#strDEBUG
	@PRINT	#wSALLE;#strSPACE
	@PRINT	#wSALLE;N
	rts

*-----------------------------------
* CLEARF
*-----------------------------------

CLEARF	rts

*-----------------------------------
* ACTION
*-----------------------------------

ACTION	jsr	getCONDITION
	cmp	#chrEOL
	bne	ACTION_1
	rts

ACTION_1	jsr	TESTAC	; on boucle
	bcc	ACTION

	sta	ACTION_2+1
ACTION_2	jmp	RETURN	; saute

*---------- 

TESTAC	cmp	#'a'
	bne	TESTAC_2
	jmp	ACTIONA
TESTAC_2	cmp	#'b'
	bne	TESTAC_3
	jmp	ACTIONB
TESTAC_3	cmp	#'c'
	bne	TESTAC_4
	jmp	ACTIONC
TESTAC_4	cmp	#'d'
	bne	TESTAC_5
	jmp	ACTIOND
TESTAC_5	cmp	#'e'
	bne	TESTAC_6
	jmp	ACTIONE
TESTAC_6	cmp	#'f'
	bne	TESTAC_7
	jmp	ACTIONF
TESTAC_7	cmp	#'g'
	bne	TESTAC_8
	jmp	ACTIONG
TESTAC_8	cmp	#'h'
	bne	TESTAC_9
	jmp	ACTIONH
TESTAC_9	cmp	#'i'
	bne	TESTAC_10
	jmp	ACTIONI
TESTAC_10	cmp	#'z'
	bne	TESTAC_11
	jmp	ACTIONZ
TESTAC_11	cmp	#$7b	; {
	bne	TESTAC_12
	jmp	ACTION0
TESTAC_12	cmp	#'j'
	bne	TESTAC_13
	jmp	ACTIONJ
TESTAC_13	cmp	#'k'
	bne	TESTAC_14
	jmp	ACTIONK
TESTAC_14	cmp	#'w'
	bne	TESTAC_15
	jmp	ACTIONW
TESTAC_15	cmp	#'x'
	bne	TESTAC_16
	jmp	ACTIONX
TESTAC_16	cmp	#'l'
	bne	TESTAC_17
	jmp	ACTIONL
TESTAC_17	cmp	#'v'
	bne	TESTAC_18
	jmp	ACTIONV
TESTAC_18	cmp	#'m'
	bne	TESTAC_19
	jmp	ACTIONM
TESTAC_19	cmp	#'y'
	bne	TESTAC_20
	jmp	ACTIONY
TESTAC_20	cmp	#'n'
	bne	TESTAC_21
	jmp	ACTIONN
TESTAC_21	cmp	#'o'
	bne	TESTAC_22
	jmp	ACTIONO
TESTAC_22	cmp	#'p'
	bne	TESTAC_23
	jmp	ACTIONP
TESTAC_23	cmp	#'t'
	bne	TESTAC_24
	jmp	ACTIONT
TESTAC_24	cmp	#'q'
	bne	TESTAC_25
	jmp	ACTIONQ
TESTAC_25	cmp	#'u'
	bne	TESTAC_26
	jmp	ACTIONU
TESTAC_26	cmp	#'r'
	bne	TESTAC_27
	jmp	ACTIONR
TESTAC_27	cmp	#'s'
	bne	TESTAC_28
	jmp	ACTIONS
TESTAC_28	cmp	#$7c
	bne	TESTAC_29
	jmp	ACTIONQUITTER
TESTAC_29	clc
	rts

*-----------------------------------
* TOUTES LES ACTIONS
*-----------------------------------

*---------- #$7c - QUITTER

ACTIONQUITTER	@PRINT	#wINVENTAIRE;#strQUITTER
	@INKEY
	cmp	#chrNO
	beq	ACTIONQU_1
	cmp	#chrYES
	bne	ACTIONQU_1
	
	lda	#QUIT	; return to the IIgs
	sec
	rts

ACTIONQU_1	clc
	rts

*---------- A - INVENTAIRE

ACTIONA	@CLS	#wINVENTAIRE
	@PRINT	#wINVENTAIRE;#strOBJETSPORTES

	lda	#TRUE	; affiche les objets portés
	sta	N

LISTE	ldx	#1	; les inits
	stx	IX
	lda	#FALSE	; aucun objet trouvé
	sta	DRAP

	ldx	IX
]lp	lda	OBJSAL-1,x	; prend l'objet X
	and	#$ff
	cmp	N	; dans la salle ou porté (TRUE)
	bne	LISTE_1	; non

	txa		; oui, affiche le
	ldy	#OBJET$
	jsr	CHERC
	jsr	AFFIC1

	lda	#TRUE
	sta	DRAP

LISTE_1	inc	IX	; prochain objet
	ldx	IX
	cpx	#NBOBJET
	bcc	]lp
	beq	]lp

	lda	DRAP	; on sort, a-t-on
	cmp	#FALSE	; trouvé un objet ?
	bne	AUCUN_1	; oui

	@PRINT	#wINVENTAIRE;#strAUCUN

AUCUN_1	clc
	rts

*---------- B - PREND UN OBJET

ACTIONB	jsr	getCONDITION
	tax
	lda	OBJSAL-1,x
	and	#$ff
	cmp	#TRUE
	bne	ACTIONB_1
	jmp	DEJOBJ
ACTIONB_1	cmp	SALLE
	beq	ACTIONB_2
	jmp	PASICI
ACTIONB_2	lda	NBOBJ
	cmp	#MAXPORTES
	bcc	ACTIONB_3
	beq	ACTIONB_3
	jmp	TROOBJ
ACTIONB_3	sep	#$20
	lda	#TRUE
	sta	OBJSAL-1,x
	inc	NBOBJ
	rep	#$20
	jsr	RETOBJ
	clc
	rts

*---------- C - POSER UN OBJET POSSEDE DANS LA SALLE COURANTE

ACTIONC	jsr	getCONDITION
	tax
	lda	OBJSAL-1,x
	and	#$ff
	cmp	#TRUE
	beq	ACTIONC_1
	jmp	NOOBJ
ACTIONC_1	sep	#$20
	lda	SALLE
	sta	OBJSAL-1,x
	rep	#$20
	dec	NBOBJ
	clc
	rts

*---------- D - AFFICHE UNE DESCRIPTION

ACTIOND	jsr	getCONDITION
	ldy	#MESSAGE$
	jsr	CHERC
	jsr	AFFIC0
	clc
	rts

*---------- E - ACTIVE LE POINTEUR M

ACTIONE	jsr	getCONDITION
	tax
	sep	#$20
	lda	#TRUE
	sta	P-1,x
	rep	#$20
	clc
	rts

*---------- F - DESACTIVE LE POINTEUR M

ACTIONF	jsr	getCONDITION
	tax
	sep	#$20
	lda	#FALSE
	sta	P-1,x
	rep	#$20
	clc
	rts

*---------- G - FIXE LE COMPTEUR M A LA VALEUR N

ACTIONG	jsr	getCONDITION	; get M
	tax
	jsr	getCONDITION	; get N
	sep	#$20
	sta	C-1,x
	rep	#$20
	clc
	rts

*---------- H - DETRUIT L'OBJET M

ACTIONH	jsr	getCONDITION
	tax
	sep	#$20
	lda	#FALSE
	sta	OBJSAL-1,x
	rep	#$20
	clc
	rts

*---------- I - PROCHAINE SALLE

ACTIONI	jsr	getCONDITION
	sta	SALLE
	clc
	rts

*---------- J - AFFICHE D'ACCORD

ACTIONJ	@PRINT	#wMESSAGE;#strDACCORD	; jmp below...

*---------- K - RETOURNE A DEPA2

ACTIONK	lda	#DEPA2
	sec
	rts

*---------- L - RETOURNE A DEPA3

ACTIONL	lda	#DEPA3
	sec
	rts
	
*---------- M - RETOURNE A DEPA1

ACTIONM	lda	#DEPA1
	sec
	rts

*---------- N - MORT

ACTIONN	lda	#MORT
	sec
	rts

*---------- O - POSE UN OBJET DANS LA SALLE COURANTE (CREATION)

ACTIONO	jsr	getCONDITION
	tax
	sep	#$20
	lda	SALLE
	sta	OBJSAL-1,x
	rep	#$20
	clc
	rts

*---------- P - POSE PERSONNAGE ET OBJET

ACTIONP	jsr	getCONDITION
	tax
	sep	#$20
	lda	SALLE
	sta	PERSSAL-1,x	; pose le personnage
	
	lda	PERSOBJ-1,x	; prend l'index de l'objet
	tax
	lda	SALLE
	sta	OBJSAL-1,x	; pose l'objet dans la salle
	rep	#$20
	clc
	rts

*---------- Q - DETRUIT PERSONNAGE ET OBJET M

ACTIONQ	jsr	getCONDITION
	tax
	sep	#$20
	lda	#FALSE
	sta	PERSSAL-1,x
	sta	PERSOBJ-1,x
	rep	#$20
	clc
	rts

*---------- R - DONNER UN OBJET A UN PERSONNAGE

ACTIONR	jsr	getCONDITION
	tax		; index de personnage
	lda	PERSOBJ-1,x
	and	#$ff
	sta	N	; l'objet qu'il porte
	
	jsr	getCONDITION
	tay		; index de l'objet
	cmp	N	; même index ?
	bne	ACTIONR_1	; non
	jmp	AIDEJA	; oui, le perso le porte déjà
ACTIONR_1	lda	N	; est-ce un objet ?
	cmp	#FALSE
	beq	ACTIONR_2	; non, vide
	jmp	DEJAUN	; oui, le porte porte déjà un objet

ACTIONR_2	lda	OBJSAL-1,y	; est-ce que l'objet est en salle ?
	and	#$ff
	cmp	SALLE	; oui
	beq	ACTIONR_4
	cmp	#TRUE	; ou le porte-t-on ?
	beq	ACTIONR_3	; oui
	jmp	PASICI	; non, erreur
ACTIONR_3	dec	NBOBJ	; si on porte, on le retire

ACTIONR_4	sep	#$20
	lda	SALLE	; le personnage reçoit la salle
	sta	PERSSAL-1,x	; et l'index de l'objet
	tya
	sta	PERSOBJ-1,x
	lda	SALLE	; et aussi l'objet dans la salle
	sta	OBJSAL-1,y
	rep	#$20
	clc
	rts

*---------- S - RETIRER UN OBJET A UN PERSONNAGE ET POSE LE EN SALLE

ACTIONS	jsr	getCONDITION
	tax
	lda	PERSOBJ-1,x
	and	#$ff
	cmp	#FALSE
	bne	ACTIONS_1
	jmp	PASOBJ
ACTIONS_1	sep	#$20
	tay
	lda	#FALSE
	sta	PERSOBJ-1,x
	lda	SALLE
	sta	OBJSAL-1,y
	rep	#$20
	clc
	rts

*---------- T - SAUVE UNE PARTIE

ACTIONT	@PRINT	#wMESSAGE;#strSAVE
	jsr	slotGAME
	bcs	ACTIONT_NOTOK
	jsr	saveGAME
	bcc	ACTIONT_OK

ACTIONT_NOTOK	@PRINT	#wMESSAGE;#strSAVENOTOK
	bra	ACTIONT_END

ACTIONT_OK	@PRINT	#wMESSAGE;#strSAVEOK

ACTIONT_END	@WAIT	#60
	lda	#DEPA2
	sec
	rts

*---------- U - CHARGE UNE PARTIE

ACTIONU	@PRINT	#wMESSAGE;#strLOAD
	jsr	slotGAME
	bcs	ACTIONU_NOTOK
	jsr	loadGAME
	bcc	ACTIONU_OK

ACTIONU_NOTOK	@PRINT	#wMESSAGE;#strLOADNOTOK
	bra	ACTIONU_END

ACTIONU_OK	@PRINT	#wMESSAGE;#strLOADOK

ACTIONU_END	@WAIT	#60
	lda	#DEPA1
	sec
	rts

*---------------

slotGAME	@INKEY	#SLOT$
	sep	#$20
	lda	SLOT$	; est-ce un chiffre ?
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

*---------- V - DECREMENTE UNE CONDITION

ACTIONV	jsr	getCONDITION
	tax
	lda	C-1,x
	and	#$ff
	cmp	#1
	bcc	ACTIONV_1
	beq	ACTIONV_1
	sep	#$20
	dec	C-1,x
	rep	#$20
ACTIONV_1	clc
	rts

*---------- W - JOUE DE LA SYNTHESE SONORE

ACTIONW	clc
	rts

*---------- X - JOUE DES BRUITS

ACTIONX	clc
	rts

*---------- Y - INVERSE LES POINTEURS DES DEUX IMAGES

ACTIONY	jsr	getCONDITION	; 1ère image
	tax
	jsr	getCONDITION	; 2nde image
	tay

	sep	#$20
	lda	ADR-1,x	; image 1
	pha
	lda	ADR-1,y	; image 2
	sta	ADR-1,x	; devient image 1
	pla
	sta	ADR-1,y	; image 1 devient image 2
	rep	#$20
	clc
	rts

*---------- Z - VICTOIRE

ACTIONZ	lda	#VICTOI
	sec
	rts

*---------- ] - GROS MOTS

ACTION0	jsr	getCONDITION

	sep	#$20
	ldal	CLOCKCTL
	sta	N
	stz	NL
	rep	#$20
	
]lp	@INKEY_TRUE
	cmp	#TRUE
	beq	ACTION0_1

	sep	#$20
	lda	NL
	inc
	and	#$0f
	sta	NL

	ldal	CLOCKCTL
	and	#$f0
	ora	NL
	stal	CLOCKCTL
	rep	#$20
	bra	]lp

ACTION0_1	sep	#$20
	ldal	CLOCKCTL
	and	#$f0
	ora	N
	stal	CLOCKCTL
	rep	#$20
	clc
	rts

*-----------------------------------
* getANALYSE
*-----------------------------------

getANALYSE	lda	(dpANALYSE)
	and	#$ff
	inc	dpANALYSE
	rts

*-----------------------------------
* getCONDITION
*-----------------------------------

getCONDITION	lda	(dpCONDITIONS)
	and	#$ff
	inc	dpCONDITIONS
	rts

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
	
ISSUE	@PRINT	#wMESSAGE;#strISSUES

	lda	SALLE	; >0
	bne	ISSUE_1
	rts
ISSUE_1	cmp	#NBISSUE	; <= nb salle
	bcc	ISSUE_2
	beq	ISSUE_2
	rts

ISSUE_2	tax		; get the data
	lda	TBLISSUE-1,x
	and	#$ff
	bne	ISSUE_3

	@PRINT	#wMESSAGE;#strAUCUNE
	rts

ISSUE_3	xba
	stz	DRAP	; pour la virgule

IS_N	asl
	bcc	IS_S
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strNORD
	pla

IS_S	asl
	bcc	IS_E
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strSUD
	pla
	
IS_E	asl
	bcc	IS_O
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strEST
	pla
	
IS_O	asl
	bcc	IS_H
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strOUEST
	pla

IS_H	asl
	bcc	IS_B
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strHAUT
	pla

IS_B	asl
	bcc	IS_ENTREE
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strBAS
	pla

IS_ENTREE	asl
	bcc	IS_SORTIE
	pha
	jsr	VIRG
	@PRINT	#wMESSAGE;#strENTREE
	pla

IS_SORTIE	asl
	bcc	IS_FIN

	jsr	VIRG
	@PRINT	#wMESSAGE;#strSORTIE

IS_FIN	rts

*---------- Affiche une virgule de séparation

VIRG	bit	DRAP
	bpl	VIR

	@PRINT	#wMESSAGE;#strCOMMA
	
VIR	lda	#TRUE
	sta	DRAP
	rts

*-----------------------------------
* INIT
*-----------------------------------

INIT_ALL	sep	#$20

	ldx	#FIN_DATA-DEBUT_DATA
]lp	stz	SALLE-1,x
	dex
	bne	]lp

	ldx	#NBOBJET	; reset OBJET table
]lp	lda	refOBJSAL-1,x
	sta	OBJSAL-1,x
	dex
	bne	]lp

	ldx	#NBPERSONNAGE	; reset PERSSAL table
]lp	lda	refPERSSAL-1,x
	sta	PERSSAL-1,x
	lda	refPERSOBJ-1,x
	sta	PERSOBJ-1,x
	dex
	bne	]lp

	ldx	#NBSALLE	; les indexes des images
]lp	txa		; 1, 2, ..., 114, 115
	sta	ADR-1,x
	dex
	bne	]lp
	
	rep	#$20

	lda	#1
	sta	SALLE
	stz	NBOBJ
	rts

*-----------------------------------
* 20000 - PERDU
*-----------------------------------

:perdu	@PRINT	#wMESSAGE;#strREJOUER
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

:gagne	jmp	:perdu_bis

*-----------------------------------
* CODE SPECIFIQUE
*-----------------------------------

*-----------------------------------
* GET/SET
*-----------------------------------

GET_SALSOMB	lda	SALSOMB-1,x
	and	#$ff
	cmp	#$ff
	bne	GET_SALSOMB_1
	lda	#TRUE
GET_SALSOMB_1	rts

SET_SALSOMB	sep	#$20
	sta	SALSOMB-1,x
	rep	#$20
	rts

GET_OBJSAL	lda	OBJSAL-1,x
	and	#$ff
	cmp	#$ff
	bne	GET_OBJSAL_1
	lda	#TRUE
GET_OBJSAL_1	rts

SET_OBJSAL	sep	#$20
	sta	OBJSAL-1,x
	rep	#$20
	rts
	
GET_PERSSAL	lda	PERSSAL-1,x
	and	#$ff
	cmp	#$ff
	bne	GET_PERSSAL_1
	lda	#TRUE
GET_PERSSAL_1	rts

SET_PERSSAL	sep	#$20
	sta	PERSSAL-1,x
	rep	#$20
	rts

*-----------------------------------
* CHARGE UNE IMAGE
*-----------------------------------

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
* DATA
*-----------------------------------

TEXTBUFFER	ds	MAX_LEN+1
WORDBUFFER	ds	MAX_LEN+1

*-----------------------------------

*--- Données diverses

DRAP	ds	2
IX	ds	2
IY	ds	2
IZ	ds	2
N	ds	2
NL	ds	2
SLOT$	ds	2	; slot de load/save + trailing 00

MOT
SUJET	ds	2	; 1
VERBE	ds	2	; 2
COD	ds	2	; 4
ARTICLE	ds	2	; 3
ADJECTIF	ds	2	; 5
ATTRIBUT	ds	2	; 6

gotATTRIBUT	ds	2	; on a déjà trouvé un attribut
endMOTS	ds	2	; plus de mots si TRUE
nbMOTS	ds	2	; nombre de mots trouvés
fgATTRIBUT	ds	2
TEXT_X	ds	2	; index dans TEXTBUFFER

fgSOMBRE	ds	2
L81BC	ds	2

*--- Données du jeu

DEBUT_DATA

SALLE	ds	2
NBOBJ	ds	2
OBJSAL	ds	NBOBJET	; dans quelle salle se trouve l'objet d'index X
PERSSAL	ds	NBPERSONNAGE	; dans quelle salle se trouve le personnage d'index X
PERSOBJ	ds	NBPERSONNAGE	; l'objet possédé par un personnage
ADR	ds	NBSALLE	; on met les indexes des salles pour les images
C	ds	NBCONDITIONS	; toutes les conditions
P	ds	NBPOINTEURS	; toutes les "énigmes"

FIN_DATA

*--- The lazy decimal to hexadecimal conversion

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
