*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CPC	@LOAD	#pCPC
CPC_60	@SHOWPIC
CPC_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CPC_200
	cmp	#'2'
	beq	CPC_1000
	cmp	#'3'
	beq	CPC_300
	cmp	#'4'
	beq	CPC_400
	bne	CPC_LOOP	

CPC_200	@PRINT	#cpc_str200
	@INKEY
	jmp	MORT

CPC_300	@PRINT	#cpc_str300
	@INKEY
	jmp	MORT

CPC_400	@PRINT	#cpc_str400
	@INKEY
	jmp	CPC_60

CPC_1000	@PRINT	#cpc_str1000
CPC_1190	@PRINT	#cpc_str1190
	@INPUT
	jsr	CPC_CHECKBAD
	bcc	CPC_1500
	jsr	CPC_CHECKGOOD
	bcc	CPC_2000

	@SOUND	#1;#100;#0
	
	@LOCATE	#13;#24	; clear the "choix"
	ldx	#0
]lp	phx
	lda	#143
	jsr	COUT160
	plx
	inx
	cpx	#15
	bcc	]lp
	jmp	CPC_1190
	
CPC_1500	@PRINT	#cpc_str1500
	@INKEY
	jmp	MORT

CPC_2000	jmp	DISCO

*---

CPC_CHECKBAD	ldy	#0
]lp	lda	tblBADWORDS,y
	beq	CPC_NOBAD
	sta	CPC_CHECK1+1
	jsr	CPC_CHECK	; compare a word
	bcc	CPC_OKBAD
	iny
	iny
	bne	]lp
CPC_NOBAD	sec		; no bad word found
CPC_OKBAD	rts		; ...or found

*---

CPC_CHECKGOOD	ldy	#0
]lp	lda	tblGOODWORDS,y
	beq	CPC_NOGOOD
	sta	CPC_CHECK1+1
	jsr	CPC_CHECK	; compare a word
	bcc	CPC_OKGOOD
	iny
	iny
	bne	]lp
CPC_NOGOOD	sec		; no bad word found
CPC_OKGOOD	rts		; ...or found

*--- Compare a word

CPC_CHECK	ldx	#0
	sep	#$20
CPC_CHECK1	lda	$bdbd,x
	cmp	IN,x
	bne	CPC_NOCHECK
	lda	IN,x
	beq	CPC_OKCHECK
	inx
	cpx	#maxLEN
	bcc	CPC_CHECK1
CPC_NOCHECK	rep	#$20	; different word
	sec
	rts
CPC_OKCHECK	rep	#$20	; same word
	clc
	rts

*---

pCPC	strl	'@/data/cpc'

tblBADWORDS	da	badword1,badword2,badword3
	da	badword4,badword5,badword6
	da	badword7,badword8,badword9
	da	badwordA,badwordB,badwordC
	ds	2

badword1	asc	'1'00	
badword2	asc	'BARBARIAN'00
badword3	asc	'BARBARIAN.BIN'00
badword4	asc	'3'00
badword5	asc	'GRYZOR'00
badword6	asc	'GRYZOR.BIN'00
badword7	asc	'4'00
badword8	asc	'IKARI'00
badword9	asc	'IKARI.BIN'00
badwordA	asc	'5'00
badwordB	asc	'RENEGADE'00
badwordC	asc	'RENAGADE.BIN'00

tblGOODWORDS	da	goodword1,goodword2,goodword3
	ds	2

goodword1	asc	'2'00	
goodword2	asc	'DISCO'00
goodword3	asc	'DISCO.BAS'00

*---

cpc_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'A peine la touche rel'89'ch'8e'e,'0d
	asc	'l'27'ordinateur s'27'emballe et affiche :'0d
	dfb	eWAIT,120
	dfb	ePEN,2
	asc	''0d
	asc	'Boot en cours...'0d
	dfb	eWAIT,90
	dfb	ePEN,3
	asc	''0d
	asc	'Intrusion d'8e'tect'8e'e !'0d
	dfb	eWAIT,90
	dfb	ePEN,2
	asc	''0d
	asc	'Syst'8f'me verrouill'8e'.'0d
	dfb	eWAIT,90
	asc	''0d
	asc	'Initialisation de l'27'autodestruction...'0d
	dfb	eWAIT,90
	dfb	ePEN,1
	asc	''0d
	asc	'Un petit PLOC r'8e'sonne...'0d
	asc	'suivi d'27'un '8e'norme BADABOUM !'0d
	asc	'Tout explose.'0d
	asc	''0d
	asc	'        ...Et vous avec !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous plongez la main dans l'27'orifice'0d
	asc	'o'9d' reposait l'27'engrenage.'0d
	asc	'Vous fouillez '88' t'89'tons...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLAC !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un bruit sec,'0d
	asc	'suivi d'27'une douleur atroce :'0d
	asc	'Un pi'8f'ge vient de vous trancher'0d
	asc	'la main net !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le sang jaillit comme un geyser.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous comprenez alors deux choses :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'1) Ce n'278e'tait pas une bonne id'8e'e.'0d
	asc	'2) Vous n'278e'crirez plus jamais'0d
	asc	'vos m'8e'moires.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous vous videz de votre sang'0d
	asc	'et mourez dans un cri... ridicule.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Mais oui, '8d'a vous revient ! '0d
	asc	''0d
	asc	'Cette machine a des airs'0d
	asc	'd'27'AMSTRAD CPC 6128 !!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Celui que vous aviez re'8d'u '88' No'91'l,'0d
	asc	'quand vous '8e'tiez gamin !'0d
	asc	''0d
	asc	'Et si cet engrenage '8e'tait en fait...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'une disquette antique ?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cpc_str1000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,24
	dfb	eINK,2,20
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	dfb	eSOUND,1,100,0
	asc	'Incatrad 16K Microcomputer  (v0.1)'0d
	dfb	eWAIT,20
	asc	''0d
	asc	a9'984 Incatrad Consumer Electronics plc'0d	; (c) copyright
	dfb	eWAIT,20
	asc	'          and Locomotive Software Ltd.'0d
	dfb	eWAIT,20
	asc	''0d
	asc	'BASIC 0.1 '0d
	dfb	eWAIT,40
*	dfb	eWAIT,50
	dfb	ePEN,1
	asc	''0d
	asc	'CAT'0d
	dfb	eWAIT,90
	asc	''0d
	asc	'Drive A: user 0'0d
	asc	''0d
	asc	'BARBARIAN.BIN  10K    DISCO   .BAS   2K'0d
	dfb	eWAIT,20
	asc	'GRYZOR   .BIN  12K    IKARI   .BIN  13K'0d
	dfb	eWAIT,20
	asc	'RENEGADE .BIN  9K'0d
	dfb	eWAIT,20
	asc	''0d
	asc	'132K free'0d
	dfb	eWAIT,20
	dfb	ePEN,2
	dfb	eLOCATE,1,19
	asc	'Saisissez le nom du programme '88' ex'8e'cuter'0d
	dfb	eEOD

cpc_str1190	dfb	ePEN,1
	dfb	eLOCATE,1,24
	asc	'Votre choix '
	dfb	eEOD

cpc_str1500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'S'8e'rieusement ?'0d
	asc	''0d
	asc	'Vous croyez vraiment'0d
	asc	'que c'27'est le moment de jouer ?'0d
	asc	''0d
	asc	'Franchement ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'H'8e'las, il s'27'agissait d'27'un syst'8f'me'0d
	asc	'de s'8e'curit'8e' visant '88' d'8e'tecter'0d
	asc	'les petits joueurs...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Et il semblerait que vous'0d
	asc	'en soyez un.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'L'27'ordinateur initie une s'8e'quence'0d
	asc	'de d'8e'fense...'0d
	asc	''0d
	asc	'juste avant que tout n'27'explose !'0d
	asc	''0d
	dfb	ePEN,1
	asc	'Game Over mon ami.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
