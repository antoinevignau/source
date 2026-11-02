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

FIRST_ROOM	=	1	; salle de démarrage

MAX_LEN	=	32
NB_CAR	=	16	; max size of a word
LEN_WORD	=	5	; but limit to 4

NBCONDITIONS	=	26
NBPOINTEURS	=	67
MAXPORTES	=	7	; pas plus de 7 objets

ZERO	=	0
ONE	=	1
CARRIED	=	255	; objet porté

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

************************************
* The following code to load and
* save all original pictures as
* apple iigs SHR screens
************************************

	lda	#116
	sta	picINDEX
	stz	fgFILL

]lp	PushLong	#rectangle
	PushLong	#blackPATTERN
	_FillRect

	lda	picINDEX
	jsr	GRAPHE
notakey	@INKEY
	cmp	#'F'
	bne	notfill
	
	lda	fgFILL
	eor	#TRUE
	sta	fgFILL
	bra	]lp

notfill	cmp	#'Q'
	bne	notquit
	jmp	QUIT

notquit	cmp	#chrRETURN
	bne	notsave
	jsr	savePIC
	inc	picINDEX
	bra	]lp

notsave	cmp	#'P'
	bne	notakey
	dec	picINDEX
	bra	]lp

*---

picINDEX	ds	2
fgFILL	ds	2
rectangle	dw	0,0,200,320

*---

*-----------------------------------
* SAUVE UNE IMAGE
*-----------------------------------

savePIC	sep	#$20	; copy suffix
	ldx	#0
]lp	lda	pSALLE,x
	sta	pSALLE2,x
	inx
	cpx	#8
	bcc	]lp
	rep	#$20

	lda	pIMAGE	; strl length
	sta	pIMAGE2

*---

	jsl	GSOS
	dw	$2002
	adrl	proDESTROYPIC2
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATEPIC2

	jsl	GSOS
	dw	$2010
	adrl	proOPENPIC2

	lda	proOPENPIC2+2
	sta	proWRITEPIC2+2
	sta	proCLOSE2+2
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITEPIC2
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE2
	rts

*---

pIMAGE2	strl	'8/pics/images/'
pSALLE2	asc	'D'
	ds	7	; xxx.BIN

proOPENPIC2	dw	2
	ds	2
	adrl	pIMAGE2

proWRITEPIC2	dw	4	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	ptrE12000	; 4 - data_buffer
	adrl	32768	; 8 - request_count
	ds	4	; C - transfer_count

proCLOSE2	dw	1
	ds	2

*--- For the game party

proCREATEPIC2	dw	7	; pcount
	adrl	pIMAGE2	; pathname
	dw	$c3	; access_code
	dw	$c1	; file_type
	ds	4	; aux_type
	ds	2	; storage_type
	adrl	32768	; eof
	ds	4	; resource_eof

proDESTROYPIC2	dw	1	; pcount
	adrl	pIMAGE2	; pathname

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

	@GFXPAPER	#0	; background color
	@GFXPEN	#1	; foreground color
	
REPLAY	jsr	PRESENT
	jsr	INIT_ALL

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
	
DESSIN	ldx	SALLE	; parce qu'on peut inverser
	lda	ADR-1,x	; des salles
	jsr	GRAPHE
	jsr	FENETR

	lda	#FALSE
	sta	fgSOMBRE

	lda	SALLE
	ldy	#SALLE$
	jsr	CHERC
	jsr	AFFIC3
	jsr	ISSUE
	jmp	DEPA2

*-----------------------------------

SOMBR	ldx	#6	; une torche ?
	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE	; dans la salle
	beq	CALCUL
	cmp	#CARRIED	; ou portée ?
	beq	CALCUL
	
	ldx	#14	; une torche ?
	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE	; dans la salle
	beq	CALCUL
	cmp	#CARRIED	; ou portée ?
	beq	CALCUL
	
	ldx	#1
	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	bne	SOMBRE
	
	lda	PERSOBJ-1,x
	and	#$ff
	cmp	#6	; une torche ?
	beq	CALCUL
	cmp	#14	; une torche ?
	beq	CALCUL

*-----------------------------------

SOMBRE	lda	#TRUE
	sta	fgSOMBRE

	@draw	#picSALSOM
	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
	
*-----------------------------------

DEPA2	jsr	VERIFI

	lda	fgSOMBRE
	cmp	#TRUE
	bne	DEPA2_1
	jmp	DEPA3

DEPA2_1	@CLS	#wINVENTAIRE
	@PRINT	#wINVENTAIRE;#strOBJETSPRESENTS

	lda	SALLE	; affiche les objets
	sta	NN	; de la salle
	jsr	LISTE

* Affiche les personnages présents dans la salle

PERSO	@CLS	#wPERSONNAGE
	@PRINT	#wPERSONNAGE;#strPERSONNAGES

	lda	#FALSE
	sta	DRAP

	ldx	#1
]lp	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	IMPRIM
DEPA2_2	inx
	cpx	#NBPERSONNAGE
	bcc	]lp
	beq	]lp

	lda	DRAP
	cmp	#TRUE
	beq	DEPA3
	
NESSUN	@PRINT	#wPERSONNAGE;#strAUCUN
	jmp	DEPA3

IMPRIM	stx	IX
	txa
	ldy	#PERSONNAGE$
	jsr	CHERC
	jsr	AFFIC2
	
	lda	#TRUE
	sta	DRAP
	ldx	IX
	bra	DEPA2_2

*-----------------------------------8

DEPA3	jsr	GETCOM	; saisie des caracteres
	jsr	DCRIPT	; déchiffre la chaîne saisie
	jsr	showSALLE
	
	lda	SUJET
	cmp	#ZERO
	bne	DEPA31	; CP 0 ... JR NZ,DEPA31
	lda	VERBE
	cmp	#ZERO
	beq	DEPA32	; CP 0 ... JR Z,DEPA32
	cmp	#12
	bne	DEPA31	; CP 12 ... JR NZ,DEPA31
	
DEPA32	lda	COD	; = MOT$+3
	cmp	#ZERO
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

MORT	@draw	#picMORT
	@PRINT	#wMESSAGE;#strRETURN
	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
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
	beq	CHERC_2

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
	iny
	cpy	#NBPERSONNAGE
	bcc	]lp
	beq	]lp
	rep	#$20
	rts
	
	mx	%10

RETOBJ_1	lda	#ZERO
	sta	PERSOBJ-1,y
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
* Vous ne pouvez pas porter ce que vous n'avez pas

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

FENETR	stz	IX
	
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
	cmp	#80	; 10*2*5 - was 100
	bcc	FENETR_1
	rts

*--- Data

CODFEN
*	dw	0,0	; les coordonnées des fenetres
*	dw	0,260	; was 262
*	dw	406,260	; was 262
*	dw	406,0
*	dw	0,0

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
tblWINDOW4	dw	2,51,2,6

windowTEXTE
	dw	0,0
	dw	51,320
	
windowLIEU
	dw	54,0
	dw	65,204

windowIMAGE
	dw	69,0
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
	lda	ARTICLE
	jsr	getDEBUG
	sta	strCOMMANDE+4
	lda	COD
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
	lda	#^TBLCONDITIONS	; DEBUG - inutile
	sta	dpCONDITIONS+2
	
VERIFI_1	jsr	getCONDITION
VERIFI_1BIS	cmp	#'a'	; teste si c'est une action
	bcs	VERIFI_3	; oui
	
	jsr	TESTCO	; non, une condition "A".."Z"
	bcc	VERIFI_1	; condition réussie, on continue

VERIFI_2	jsr	getCONDITION	; condition ratée, on boucle
	cmp	#chrEOL	; jusqu'à la fin
	bne	VERIFI_2	; de la ligne
	
VERIFI_4	jsr	getCONDITION	; prend la nouvelle
	cmp	#chrEOT	; valeur et sort si
	bne	VERIFI_1BIS	; fin de table
	rts

VERIFI_3	jsr	TESTAC	; oui, une action "a".."z"
	bcc	VERIFI_5
	sta	VERIFI_6+1	; on sort
VERIFI_6	jmp	$bdbd

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

ZERO_CODE	stz	SUJET
	stz	VERBE
	stz	ATTRIBUT
	stz	COD
	stz	ARTICLE
	stz	ADJECTIF
	
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

DCRIPT	jsr	ZERO_CODE

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

* A/Y: index, X: type (1..6)

TESTMO_1	inc	nbMOTS	; nombre de mots trouvés++

	cpx	#iARTICLE	; 6
	bne	DCRIPT_4

	lda	endMOTS
	cmp	#TRUE
	bne	DCRIPT_9
	jmp	SYNERR

DCRIPT_4	cpx	#iATTRIBUT	; 5
	bne	DCRIPT_5
	
	lda	endMOTS
	cmp	#TRUE
	beq	DCRIPT_SYNERR
	lda	fgATTRIBUT
	cmp	#TRUE
	beq	DCRIPT_SYNERR
	lda	#TRUE
	sta	fgATTRIBUT
	jmp	DCRIPT_9

DCRIPT_5	cpx	#iVERBE	; 2
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

DCRIPT_6	cpx	#iADJECTIF	; 4
	bne	DCRIPT_7
	lda	ADJECTIF
	bne	SYNERR
	sty	ADJECTIF
	jmp	DCR_FIN

DCRIPT_7	cpx	#iCOD	; 3
	bne	DCRIPT_8
	lda	fgATTRIBUT
	cmp	#TRUE
	bne	DCR_COD

DCR_A	lda	ATTRIBUT
	bne	SYNERR
	sty	ATTRIBUT
	stz	fgATTRIBUT
	jmp	DCR_FIN

DCR_COD	lda	COD
	bne	SYNERR
	sty	COD
	jmp	DCR_FIN

DCRIPT_8	cpx	nbMOTS
	beq	DCR_SUJ
	cpx	fgATTRIBUT
	bne	DCR_COD
	jmp	DCR_A

DCR_SUJ	lda	SUJET
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

PRESENT	ldal	HORIZCNT	; affiche image 119 ou 120
	and	#%00000001
 	clc
	adc	#picVOYAGE
	jsr	GRAPHE

	jsr	FENETR

*	@CLS	#wMESSAGE
	@LOCATE	#wMESSAGE;#1;#5
	@PRINT	#wMESSAGE;#phrase01
*	@CLS	#wINVENTAIRE
	@LOCATE	#wINVENTAIRE;#1;#11
	@PRINT	#wINVENTAIRE;#phrase05

	@INKEY
	jsr	RIRE
	@CLS	#wMESSAGE
	@CLS	#wINVENTAIRE
	rts

*-----------------------------------
* VICTOI
*-----------------------------------

VICTOI	@draw	#picVICTOIRE
	@CLS	#wINVENTAIRE
	@CLS	#wPERSONNAGE
	@CLS	#wSALLE
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
	
GRAPHE	jsr	loadPIC	; charge une image (16 bits)
	bcc	GRAPHEOK
	rts

GRAPHEOK	rts

************************************************
* The following code runs fine
* but the SeedFill algorithm is so slow
* that it takes 50 seconds to display a pic!
************************************************

	lda	#bufIMAGE
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
	PushWord	#$1111
	PushWord	#$0000
	_SpecialRect

*--- Boucle principale

spLOOP	ldy	#0
	lda	(dpFROM),y
	and	#$ff
	sta	theA	; soit Y, soit une commande
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theB
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theC

	lda	theA
	cmp	#%1100_0000	; commande %11xx_xxxx
	bcs	spOTHER

	lda	#GFX_MAX_Y
	dec
	sec
	sbc	theA
	asl
	lsr
	sta	theY	; <192 alors DRAW
	lda	theB
	asl
	lsr
	sta	theX
	jsr	DRAW_O
	jmp	skip2

*--- Gère les autres cas

spOTHER	lda	theA
	and	#%00110000	; 16
	lsr
	lsr
	lsr
	lsr
	sta	theE1

	lda	theA
	and	#%00001100	; 4
	lsr
	lsr
	sta	theE2
	
	lda	theA
	and	#%00000011
	beq	spPLOT
	cmp	#2
	beq	spINK
	cmp	#3
	beq	spECRIT

spPAINT	lda	theC
	asl
	lsr
	sta	fillX
	lda	#GFX_MAX_Y
	dec
	sec
	sbc	theB
	asl
	lsr
	sta	fillY
	jsr	FILL_O
	jmp	skip3

spPLOT	lda	theC
	asl
	lsr
	sta	theX
	lda	#GFX_MAX_Y
	dec
	sec
	sbc	theB
	asl
	lsr
	sta	theY
	jsr	PLOT_O
	jmp	skip3

spINK	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK2
	iny
	lda	(dpFROM),y
	and	#$ff
	sta	theINK3
	
*	@BORDER	theB
	@INK	#0;theB
	@INK	#1;theC
	@INK	#2;theINK2
	@INK	#3;theINK3
	jmp	skip5

spECRIT	lda	theC
	asl
	lsr
	pha
	lda	#GFX_MAX_Y+8
	dec
	sec
	sbc	theB
	asl
	lsr
	pha
	_MoveTo

	@PAPER	#0;theE1
	@PEN	#0;theE2
	
	PushWord	#0
	_GetTextMode

	PushWord	#modeForeCopy
	_SetTextMode

	ldy	#3
]lp	lda	(dpFROM),y
	and	#$ff
	cmp	#chrEOL
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
	
	@GFXPEN	theE2
	
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

resMode	=	%0000_0000000000_10

FILL_O	lda	fgFILL
	beq	FILL_OK
	rts

FILL_OK	lda	theE1
	asl
	asl
	clc
	adc	theE2
	asl
	asl
	asl
	asl
	asl
	clc
	adc	#fillPATTERNS
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

theA	ds	2
theB	ds	2
theC	ds	2
theE1	ds	2
theE2	ds	2
theX	ds	2
theY	ds	2
theINK2	ds	2
theINK3	ds	2

*----------- FILL

fillX	ds	2
fillY	ds	2
fillCOLOR	ds	2

srcLocInfoPtr	dw	mode320	; mode 320
	adrl	ptrE12000
	dw	160
	dw	0,0,200,320

srcRect	dw	69,0,200,204

patternPtr	adrl	fillPATTERNS	; pointer to pattern

leakTblPtr	dw	1
	dw	$0000	; color 0 is concerned

fillPATTERNS	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000
	hex	00000000

	hex	01010101
	hex	10101010
	hex	01010101
	hex	10101010
	hex	01010101
	hex	10101010
	hex	01010101
	hex	10101010

	hex	02020202
	hex	20202020
	hex	02020202
	hex	20202020
	hex	02020202
	hex	20202020
	hex	02020202
	hex	20202020

	hex	03030303
	hex	30303030
	hex	03030303
	hex	30303030
	hex	03030303
	hex	30303030
	hex	03030303
	hex	30303030

*---

	hex	10101010
	hex	01010101
	hex	10101010
	hex	01010101
	hex	10101010
	hex	01010101
	hex	10101010
	hex	01010101

	hex	11111111
	hex	11111111
	hex	11111111
	hex	11111111
	hex	11111111
	hex	11111111
	hex	11111111
	hex	11111111

	hex	12121212
	hex	21212121
	hex	12121212
	hex	21212121
	hex	12121212
	hex	21212121
	hex	12121212
	hex	21212121

	hex	13131313
	hex	31313131
	hex	13131313
	hex	31313131
	hex	13131313
	hex	31313131
	hex	13131313
	hex	31313131

*---

	hex	20202020
	hex	02020202
	hex	20202020
	hex	02020202
	hex	20202020
	hex	02020202
	hex	20202020
	hex	02020202

	hex	21212121
	hex	12121212
	hex	21212121
	hex	12121212
	hex	21212121
	hex	12121212
	hex	21212121
	hex	12121212

	hex	22222222
	hex	22222222
	hex	22222222
	hex	22222222
	hex	22222222
	hex	22222222
	hex	22222222
	hex	22222222

	hex	23232323
	hex	32323232
	hex	23232323
	hex	32323232
	hex	23232323
	hex	32323232
	hex	23232323
	hex	32323232

*---

	hex	30303030
	hex	03030303
	hex	30303030
	hex	03030303
	hex	30303030
	hex	03030303
	hex	30303030
	hex	03030303

	hex	31313131
	hex	13131313
	hex	31313131
	hex	13131313
	hex	31313131
	hex	13131313
	hex	31313131
	hex	13131313

	hex	32323232
	hex	23232323
	hex	32323232
	hex	23232323
	hex	32323232
	hex	23232323
	hex	32323232
	hex	23232323

	hex	33333333
	hex	33333333
	hex	33333333
	hex	33333333
	hex	33333333
	hex	33333333
	hex	33333333
	hex	33333333

*-----------------------------------
* CLEARW
*-----------------------------------

CLEARW	rts

*-----------------------------------
* ANALYS
*-----------------------------------

ANALYS	lda	#TBLANALYSE
	sta	dpCONDITIONS

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
	cmp	ARTICLE
	beq	MOTS_4
	cmp	#99	; non pertinent
	bne	NOUVEL

MOTS_4	jsr	getCONDITION
	cmp	COD
	beq	MOTS_5
	cmp	#99	; non pertinent
	bne	NOUVEL
	
MOTS_5	jsr	getCONDITION
	cmp	ADJECTIF
	beq	CONDIT
	cmp	#99	; non pertinent
	beq	CONDIT

	lda	#TRUE
	sta	motPASTROUVE
	
*----------

NOUVEL	jsr	getCONDITION	; va jusqu'à la fin de la ligne
	cmp	#chrEOL
	bne	NOUVEL
	
*----------

FIN	jsr	getCONDITION	; nouvelle ligne, fin de table ?
	cmp	#chrEOT
	bne	MOTS_1	; non, boucle

*---------- 

IMPOSS	lda	motPASTROUVE	; fin de table, a-t-on trouvé ?
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
* CONDIT (A..Z)
*-----------------------------------

CONDIT	lda	#FALSE	; on a trouvé un mot
	sta	motPASTROUVE
	
CONDIT_1	jsr	getCONDITION
	cmp	#'a'	; est-ce une action ?
	bcs	CONDIT_2	; oui
	sta	N

	jsr	getCONDITION
	tax
	jsr	TESTCO
	bcs	NOUVEL	; on boucle si OK
	bcc	CONDIT_1	; sinon, on sort

CONDIT_2	jmp	ACTION

*---------- 

TESTCO	lda	N
	cmp	#'A'
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
TESTCO_14	sec
	rts
	
*-----------------------------------
* TOUTES LES CONDITIONS
*-----------------------------------

*---------- A 41 - EST-ON DANS LA SALLE ?

CONDA	cpx	SALLE
	beq	CONDA_1
	sec
	rts
CONDA_1	clc
	rts

*---------- B 42 - OBJET DANS LA SALLE OU PORTÉ ?

CONDB	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CONDB_1
	cmp	#CARRIED
	beq	CONDB_1
	sec
	rts
CONDB_1	clc
	rts

*---------- C 43 - OBJET PAS DANS LA SALLE OU PAS PORTé ?

CONDC	lda	OBJSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CONDC_1
	cmp	#CARRIED
	beq	CONDC_1
	clc
	rts
CONDC_1	sec
	rts

*---------- D 44 - OBJET PORTÉ ?

CONDD	lda	OBJSAL-1,x
	and	#$ff
	cmp	#CARRIED
	beq	CONDD_1
	sec
	rts
CONDD_1	clc
	rts

*---------- E 45 - POINTEUR ACTIF ?

CONDE	lda	P-1,x
	and	#$ff
	cmp	#ONE
	beq	CONDE_1
	sec
	rts
CONDE_1	clc
	rts

*---------- F 46 - POINTEUR INACTIF ?

CONDF	lda	P-1,x
	and	#$ff
	cmp	#ZERO
	beq	CONDF_1
	sec
	rts
CONDF_1	clc
	rts

*---------- G 47 - COMPTEUR ACTIF ?

CONDG	lda	C-1,x
	and	#$ff
	cmp	#ZERO
	bne	CONDG_1
	sec
	rts
CONDG_1	clc
	rts

*---------- H 48 - 2*RANDOM <= N ALORS OK

CONDH	sta	N
	jsr	RANDOM
	and	#$0f	; AND 15
	asl		; SLA A
	cmp	N	; CP C
	bcs	CONDH_1	; JP P,MAUVAI (si 2RND<=N)
	clc
	rts
CONDH_1	sec
	rts

*---------- I 49 - N'EST PAS DANS LA SALLE

CONDI	cpx	SALLE
	bne	CONDI_1
	sec
	rts
CONDI_1	clc
	rts

*---------- J 4A - PERSONNAGE DANS LA SALLE ?

CONDJ	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	beq	CONDJ_1
	sec
	rts
CONDJ_1	clc
	rts

*---------- K 4B - PERSONNAGE PAS DANS LA SALLE ?

CONDK	lda	PERSSAL-1,x
	and	#$ff
	cmp	SALLE
	bne	CONDK_1
	sec
	rts
CONDK_1	clc
	rts

*---------- L 4C - PERSONNAGE PORTE L'OBJET DEMANDE ?

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

*---------- M 4D - PERSONNAGE NE PORTE PAS L'OBJET DEMANDE ?

CONDM	lda	PERSOBJ-1,x
	and	#$ff
	sta	N
	
	jsr	getCONDITION	; INVERZ is done here
	cmp	N
	bne	CONDM_1
	sec
	rts
CONDM_1	clc
	rts

*---------- INVERSE LE FLAG Z
* Z is zero is both values are equal

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
	@PRINT	#wMESSAGE;#strRETURN
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
* ACTION (a..z)
*-----------------------------------

ACTION	cmp	#chrEOL
	bne	ACTION_1
	rts

ACTION_1	jsr	TESTAC	; on exécute
	bcc	ACTION_3	; on continue
	sta	ACTION_2+1	; on sort
ACTION_2	jmp	ACTION_2

ACTION_3	jsr	getCONDITION
	bra	ACTION

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
TESTAC_29	jmp	ACTIONM	; retourne à DEPA1

*-----------------------------------
* TOUTES LES ACTIONS (a..z)
*-----------------------------------

*---------- #$7c - QUITTER

ACTIONQUITTER	@PRINT	#wMESSAGE;#strQUITTER
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

*---------- a 61 - INVENTAIRE

ACTIONA	@CLS	#wINVENTAIRE
	@PRINT	#wINVENTAIRE;#strOBJETSPORTES
	
	lda	#CARRIED	; affiche les objets portés
	sta	NN

LISTE	ldx	#1	; les inits
	stx	IX
	lda	#FALSE	; aucun objet trouvé
	sta	DRAP

	ldx	IX
]lp	lda	OBJSAL-1,x	; prend l'objet X
	and	#$ff
	cmp	NN	; dans la salle ou porté (<TRUE)
	bne	LISTE_1	; non

	txa		; oui, affiche le
	ldy	#OBJET$
	jsr	CHERC
	jsr	AFFIC1

	lda	#TRUE
	sta	DRAP

	@PRINT	#wINVENTAIRE;#strRETURN

LISTE_1	inc	IX	; prochain objet
	ldx	IX
	cpx	#NBOBJET
	bcc	]lp
	beq	]lp

	lda	DRAP	; on sort, a-t-on
	cmp	#FALSE	; trouvé un objet ?
	bne	AUCUN_1	; oui

	@PRINT	#wINVENTAIRE;#strAUCUN

AUCUN_1	lda	NN
	cmp	#CARRIED
	bne	AUCUN_2
	@INKEY		; pause clavier pour inventaire
AUCUN_2	clc
	rts

*---------- b 62 - PREND UN OBJET

ACTIONB	jsr	getCONDITION	; check object
	tax
	lda	OBJSAL-1,x
	and	#$ff
	cmp	#CARRIED
	bne	ACTIONB_1
	jmp	DEJOBJ	; on l'a déjà

ACTIONB_1	cmp	SALLE
	beq	ACTIONB_2
	jmp	PASICI	; pas ici

ACTIONB_2	lda	NBOBJ
	cmp	#MAXPORTES
	bcc	ACTIONB_3
	beq	ACTIONB_3
	jmp	TROOBJ	; on en porte trop

ACTIONB_3	sep	#$20
	lda	#CARRIED
	sta	OBJSAL-1,x
	rep	#$20
	inc	NBOBJ
	jsr	RETOBJ
	clc
	rts

*---------- c 63 - POSER UN OBJET POSSEDE DANS LA SALLE COURANTE

ACTIONC	jsr	getCONDITION
	tax
	lda	OBJSAL-1,x
	and	#$ff
	cmp	#CARRIED
	beq	ACTIONC_1
	jmp	NOOBJ	; on ne l'a pas

ACTIONC_1	sep	#$20
	lda	SALLE
	sta	OBJSAL-1,x
	rep	#$20
	dec	NBOBJ
	clc
	rts

*---------- d 64 - AFFICHE UNE DESCRIPTION

ACTIOND	jsr	getCONDITION
	ldy	#MESSAGE$
	jsr	CHERC
	jsr	AFFIC0
	clc
	rts

*---------- e 65 - ACTIVE LE POINTEUR M

ACTIONE	jsr	getCONDITION
	tax
	sep	#$20
	lda	#ONE
	sta	P-1,x
	rep	#$20
	clc
	rts

*---------- f 66 - DESACTIVE LE POINTEUR M

ACTIONF	jsr	getCONDITION
	tax
	sep	#$20
	lda	#ZERO
	sta	P-1,x
	rep	#$20
	clc
	rts

*---------- g 67 - FIXE LE COMPTEUR M A LA VALEUR N

ACTIONG	jsr	getCONDITION	; get M
	tax
	jsr	getCONDITION	; get N
	sep	#$20
	sta	C-1,x
	rep	#$20
	clc
	rts

*---------- h 68 - DETRUIT L'OBJET M

ACTIONH	jsr	getCONDITION
	tax
	sep	#$20
	lda	#ZERO
	sta	OBJSAL-1,x
	rep	#$20
	jsr	RETOBJ
	clc
	rts

*---------- i 69 - PROCHAINE SALLE

ACTIONI	jsr	getCONDITION
	sta	SALLE
	clc
	rts

*---------- j 6A - AFFICHE D'ACCORD

ACTIONJ	@PRINT	#wMESSAGE;#strDACCORD	; jmp below...
	
*---------- k 6B - RETOURNE A DEPA2

ACTIONK	lda	#DEPA2
	sec
	rts

*---------- l 6C - RETOURNE A DEPA3

ACTIONL	lda	#DEPA3
	sec
	rts
	
*---------- m 6D - RETOURNE A DEPA1

ACTIONM	lda	#DEPA1
	sec
	rts

*---------- n 6E - MORT

ACTIONN	lda	#MORT
	sec
	rts

*---------- o 6F - POSE UN OBJET DANS LA SALLE COURANTE (CREATION)

ACTIONO	jsr	getCONDITION
	tax
	sep	#$20
	lda	SALLE
	sta	OBJSAL-1,x
	rep	#$20
	clc
	rts

*---------- p 70 - POSE PERSONNAGE ET OBJET

ACTIONP	jsr	getCONDITION
	tax
	sep	#$20
	lda	SALLE
	sta	PERSSAL-1,x	; pose le personnage
	
	lda	PERSOBJ-1,x	; prend l'index de l'objet
	beq	ACTIONP_1	; DEBUG
	tax
	lda	SALLE
	sta	OBJSAL-1,x	; pose l'objet dans la salle
ACTIONP_1	rep	#$20
	clc
	rts

*---------- q 71 - DETRUIT PERSONNAGE ET OBJET M

ACTIONQ	jsr	getCONDITION
	tax
	sep	#$20
	lda	#ZERO
	sta	PERSSAL-1,x
	sta	PERSOBJ-1,x
	rep	#$20
	clc
	rts

*---------- r 72 - POSER UN OBJET

ACTIONR	jsr	getCONDITION
	tax		; index de personnage
	lda	PERSOBJ-1,x
	and	#$ff
	sta	NN	; l'objet qu'il porte
	
	jsr	getCONDITION
	tay		; index de l'objet
	cmp	NN	; même index ?
	bne	ACTIONR_1	; non
	jmp	AIDEJA	; oui, le perso le porte déjà

ACTIONR_1	lda	NN	; est-ce un objet ?
	cmp	#ZERO
	beq	ACTIONR_2	; non, vide
	jmp	DEJAUN	; oui, le perso porte déjà un objet

ACTIONR_2	lda	OBJSAL-1,y	; est-ce que l'objet est en salle ?
	and	#$ff
	cmp	SALLE	; oui
	beq	ACTIONR_4
	cmp	#CARRIED	; ou le porte-t-on ?
	beq	ACTIONR_3	; oui
	jmp	PASICI	; non, erreur

ACTIONR_3	dec	NBOBJ	; si on porte, on le retire

ACTIONR_4	sep	#$20
	lda	SALLE	; le personnage reçoit la salle
*	sta	PERSSAL-1,x	; et l'index de l'objet
*	tya
	sta	PERSOBJ-1,x
	lda	SALLE	; et aussi l'objet dans la salle
	sta	OBJSAL-1,y
	rep	#$20
	clc
	rts

*---------- s 73 - RETIRER UN OBJET A UN PERSONNAGE ET POSE LE EN SALLE

ACTIONS	jsr	getCONDITION
	tax
	lda	PERSOBJ-1,x
	and	#$ff
	cmp	#ZERO
	bne	ACTIONS_1
	jmp	PASOBJ

ACTIONS_1	sep	#$20
	tay
	lda	#ZERO
	sta	PERSOBJ-1,x
	lda	SALLE
	sta	OBJSAL-1,y
	rep	#$20
	clc
	rts

*---------- t 74 - SAUVE UNE PARTIE

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

*---------- u 75 - CHARGE UNE PARTIE

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

slotGAME	@INKEY
	cmp	#'1'
	bcc	slotGAME_ERR
	cmp	#'9'+1
	bcs	slotGAME_ERR
	sta	pGAME+10
	clc
	rts
slotGAME_ERR	sec
	rts

*---------- v 76 - DECREMENTE UN COMPTEUR

ACTIONV	jsr	getCONDITION
	tax
	lda	C-1,x
	and	#$ff
	cmp	#ONE+1
	bcc	ACTIONV_1
	sep	#$20
	dec	C-1,x
	rep	#$20
ACTIONV_1	clc
	rts

*---------- w 77 - JOUE DE LA SYNTHESE SONORE

ACTIONW	jsr	getCONDITION
	clc
	rts

*---------- x 78 - JOUE DES BRUITS

ACTIONX	jsr	getCONDITION
	clc
	rts

*---------- y 79 - INVERSE LES POINTEURS DES DEUX IMAGES

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

*---------- z 7A - VICTOIRE

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

RIRE	lda	#pRIRE
	jsr	loadBIGFILE
	bcc	RIRE_1
	rts

RIRE_1	sty	waveSTART
	stx	waveSTART+2
	sta	waveSIZE
	ldy	#380
	jmp	SOUND

*---

pRIRE	strl	'8/data/sons/rire.snd'

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

VIRG	lda	DRAP
	cmp	#TRUE
	bne	VIR

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

	lda	#FIRST_ROOM
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
	adc	#16	; (was 19) on ajoute
	sta	pIMAGE	; la longueur par défaut

	lda	#'.L'	; '.B'
	sta	pSALLE+1,x
	lda	#'Z4'	; 'IN'
	sta	pSALLE+3,x

*--- Open/Read/Write

	lda	#pIMAGE
	ldx	ptrUNPACK+2
	ldy	ptrUNPACK
	jsr	loadFILE
	bcs	loadPIC99

	lda	proEOF
	jsr	unpackLZ4

*	PushLong	ptrIMAGE	; copy from line 69 to 200
	lda	ptrIMAGE+2	; + SCBs and palettes
	pha
	lda	ptrIMAGE
	clc
	adc	#69*160
	pha
*	PushLong	ptrSCREEN
	lda	ptrSCREEN+2
	pha
	lda	ptrSCREEN
	clc
	adc	#69*160
	pha
	PushLong	#32768-11040
	_BlockMove
	
loadPIC99	rts

*---

strSALLE	ds	3	; len max d'une salle

pIMAGE	strl	'8/data/lz4/'	; 11
pSALLE	asc	'D'	;  1
	ds	7	;  4 xxx.LZ4 (was BIN)

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
NN	ds	2
SLOT$	ds	2	; slot de load/save + trailing 00

MOT
SUJET	ds	2	; 1
VERBE	ds	2	; 2
ARTICLE	ds	2	; 3
COD	ds	2	; 4
ADJECTIF	ds	2	; 5
ATTRIBUT	ds	2	; 6

fgATTRIBUT	ds	2
endMOTS	ds	2	; plus de mots si TRUE
motPASTROUVE	ds	2	; on a trouvé une correspondance ou pas (TRUE)
nbMOTS	ds	2	; nombre de mots trouvés

TEXT_X	ds	2	; index dans TEXTBUFFER

fgSOMBRE	ds	2

*--- Données du jeu

DEBUT_DATA

SALLE	ds	2
NBOBJ	ds	2
OBJSAL	ds	NBOBJET	; dans quelle salle se trouve l'objet d'index X
PERSSAL	ds	NBPERSONNAGE	; dans quelle salle se trouve le personnage d'index X
PERSOBJ	ds	NBPERSONNAGE	; l'objet possédé par un personnage
ADR	ds	NBSALLE	; on met les indexes des salles pour les images
C	ds	NBCONDITIONS	; tous les compteurs (les valeurs 0..n)
P	ds	NBPOINTEURS	; tous les pointeurs (les drapeaux activés ou non)

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
