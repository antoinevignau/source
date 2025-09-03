*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

DISCO	@LOAD	#pDISCO

DISCO_60	@SHOWPIC
DISCO_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	DISCO_400
	cmp	#'2'
	beq	DISCO_300
	cmp	#'3'
	beq	DISCO_200
	cmp	#'4'
	bne	DISCO_126
	jmp	DISCO_600
DISCO_126	cmp	#'5'
	beq	DISCO_500
	bne	DISCO_LOOP

DISCO_200	@PRINT	#disco_str200
	@INKEY
	jmp	DISCO_60

DISCO_300	@PRINT	#disco_str300
	@INKEY
	jmp	DISCO_60

DISCO_400	@PRINT	#disco_str400
	@INKEY
	jmp	MORT

*---

DISCO_500	@PRINT	#disco_str500
	
	stz	disco_str	; clear answer
	stz	disco_str+1

	sep	#$20	; set default values
	lda	#'9'
	sta	disco_boum
	rep	#$20

	lda	#295
	sta	disco_sound
	
	jsr	DISCO_ENTER
	bcs	DISCO_520	; we lost
	jmp	DISCO_900	; we won

DISCO_520	@PRINT	#disco_str520
	@SOUND	#1;#100;#0
	lda	#150
	jsr	nowWAIT_ALT
	@PRINT	#disco_str540
	lda	#120
	jsr	nowWAIT_ALT
	@PRINT	#disco_str550
	@INKEY

	@CLS
	@INK	#3;#6

	ldx	#10
]lp	phx

	@PRINT	#disco_boum

	ldx	#1
	ldy	disco_sound
	lda	#60
	jsr	nowWAIT_ALT

	dec	disco_boum
	lda	disco_sound
	sec
	sbc	#5
	sta	disco_sound

	plx
	dex
	bne	]lp

	@PRINT	#disco_str580
	@SOUND	#1;#80;#200
	lda	#140
	jsr	nowWAIT_ALT
	@PRINT	#disco_str582
	@INKEY
	jmp	MORT
	
DISCO_600	@PRINT	#disco_str600
	@INKEY
	jmp	DISCO_60

DISCO_900	@PRINT	#disco_str900
	@INKEY
	jmp	EPILOGUE

*---

DISCO_ENTER	ldx	#0
]lp	phx
	@INKEY
	pha
	jsr	COUT
	pla
	plx
	cmp	#chrRET
	beq	DISCO_ENTER_1
	sep	#$20
	sta	disco_str,x
	rep	#$20
	inx
	cpx	#3
	bcc	]lp

DISCO_ENTER_1	ldx	#0
]lp	lda	disco_good,x	; check one entry
	beq	DISCO_ENTER_3
	cmp	disco_str
	bne	DISCO_ENTER_2
	lda	disco_good+1,x
	cmp	disco_str+1
	beq	DISCO_ENTER_4
DISCO_ENTER_2	inx		; next entry
	inx
	inx
	bne	]lp
DISCO_ENTER_3	sec		; bad answer
	rts
DISCO_ENTER_4	clc		; good answer
	rts

*---

disco_good	asc	'FF'00
	asc	' FF'
	asc	'F F'
	dfb	eEOD,eEOD

*---

pDISCO	strl	'@/data/disco'

disco_str	ds	3	; up to three characters
disco_boum	asc	'9'0d
	dfb	eEOD
disco_sound	ds	2

disco_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'En analysant les codes hexad'8e'cimaux,'0d
	asc	'un d'8e'tail vous glace :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'le mot     ,'0d
	asc	'suivi de       et      .'0d
	dfb	eLOCATE,8,5
	dfb	ePEN,3
	asc	'BOOM'0d
	dfb	eLOCATE,10,6
	asc	'TEMPS'0d
	dfb	eLOCATE,19,6
	asc	'2 ANS'0d
	dfb	ePEN,1
	dfb	eLOCATE,1,8
	asc	'Soudain, tout s'278e'claire : '0d
	asc	''0d
	asc	'Il s'27'agit d'27'un compte '88' rebours pour'0d
	asc	'un cataclysme imagin'8e' par les Incas'0d
	asc	'depuis des si'8f'cles et qui prendra fin'0d
	asc	''0d
	asc	'      ...dans deux ans seulement !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il faut absolument arr'90'ter cela,'0d
	asc	'ou au moins tenter de le retarder...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Ne vous trompez pas !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous sortez votre smartphone et,'0d
	asc	'gr'89'ce '88' une unique barre de r'8e'seau,'0d
	asc	'parvenez '88' charger la page de CPC-Power'0d
	asc	''0d
	asc	'            Vous y lisez '0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'RAM du CPC 464 : 64 Ko'0d
	asc	'Processeur : Z80'0d
	asc	'Fr'8e'quence du processeur : 4 MHz'0d
	asc	'Nombre de couleurs dans la palette : 27'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Meilleur score '88' Gryzor : 999998'0d
	asc	''0d
	asc	'Pour 255 vies, remplacez XX par FF'0d
	asc	'dans la s'8e'quence 3E XX 32'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nb de sprite Hardware sur CPC 6128 : 00'0d
	asc	'Test clavier : CALL &BB06'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Il doit bien y avoir une information'0d
	asc	'pertinente l'88'-dedans !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'S'8e'rieusement ?'0d
	asc	'Appuyer au hasard ? '0d
	asc	''0d
	asc	'Vous devriez aussi taper'0d
	asc	'vos mots de passe comme '8d'a...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Forc'8e'ment, ce n'278e'tait pas'0d
	asc	'la valeur attendue par la machine.'0d
	asc	''0d
	asc	'Vous n'27'aviez qu'27'une seule chance,'0d
	asc	'et vous l'27'avez g'89'ch'8e'e...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLAC !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Le plafond descend...'0d
	asc	''0d
	asc	'rapide,'0d
	asc	'        lourd,'0d
	asc	'               in'8e'vitable.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Fin de la partie, hacker du dimanche !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str500	dfb	eMODE,2
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,26
	dfb	eINK,5,26	; for 640-dithered
	dfb	eINK,9,26	; "
	dfb	eINK,13,26	; "
	dfb	eLOCATE,26,12
	dfb	ePEN,1
	asc	'Saisissez votre valeur : '
	dfb	eEOD

disco_str520	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,8
	dfb	ePEN,1
	asc	'Vous validez la valeur...'0d
	asc	'L'278e'cran clignote.'
	dfb	eEOD

disco_str540	dfb	ePEN,3
	asc	''0d
	asc	''0d
	asc	'  ERREUR FATALE : INSTRUCTION INVALIDE'0d
	dfb	eEOD

disco_str550	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'L'27'ordinateur '8e'met un bip strident,'0d
	asc	'puis une s'8e'quence inqui'8e'tante appara'94't.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
disco_str580	asc	''0d
	asc	''0d
	asc	'                 BOOM !!!'0d
	dfb	eEOD

disco_str582	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'Une gigantesque explosion'0d
	asc	'raye les lieux de la carte !'
	asc	''0d
	asc	'Dommage, vous '8e'tiez si pr'8f's du but...'
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
disco_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous paniquez magistralement :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Sueur, cris,'0d
	asc	'm'90'me une petite danse de la peur.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Apr'8f's cinq bonnes minutes,'0d
	asc	'vous r'8e'alisez que cela n'27'a'0d
	asc	'strictement rien chang'8e'...'0d
	asc	'sauf votre dignit'8e'.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Allez, reprenez-vous, h'8e'ros !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	asc	'              Bien jou'8e' !'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'En rempla'8d'ant la valeur par FF'0d
	asc	'(soit 255 en d'8e'cimal),'0d
	asc	'vous repoussez le compte '88' rebours.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'L'27'humanit'8e' vient de gagner'0d
	asc	'255 ans de r'8e'pit !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous pouvez '88' pr'8e'sent quitter ces lieux'0d
	asc	'le coeur l'8e'ger et avec le sentiment'0d
	asc	'du devoir accompli !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
