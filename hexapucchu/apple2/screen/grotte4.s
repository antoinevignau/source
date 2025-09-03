*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE4	@LOAD	#pGROTTE4
GROTTE4_60	@SHOWPIC
GROTTE4_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE4_120
	jmp	GROTTE3
GROTTE4_120	cmp	#'2'
	bne	GROTTE4_130
	jmp	TROU
GROTTE4_130	cmp	#'3'
	beq	GROTTE4_300
	cmp	#'4'
	beq	GROTTE4_400
	cmp	#'5'
	beq	GROTTE4_500
	cmp	#'6'
	beq	GROTTE4_600
	cmp	#'7'
	beq	GROTTE4_700
	bne	GROTTE4_LOOP

GROTTE4_300	@PRINT	#grotte4_str300
	@INKEY
	jmp	GROTTE4_60

GROTTE4_400	@PRINT	#grotte4_str400
	@INKEY
	jmp	GROTTE5

GROTTE4_500	@PRINT	#grotte4_str500
	@INKEY
	jmp	GROTTE4_60

GROTTE4_600	@PRINT	#grotte4_str600
	@INKEY
	jmp	MORT

GROTTE4_700	@PRINT	#grotte4_str700
	@INKEY
	jmp	GROTTE4_60

*---

pGROTTE4	strl	'@/data/grotte4'

grotte4_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous observez les lieux de plus pr'8f's.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ce boyau n'27'est pas qu'27'un simple'0d
	asc	'couloir balay'8e' par le vent :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Le visage sculpt'8e' dans le mur NORD'0d
	asc	'semble trop d'8e'taill'8e' pour n'2790'tre'0d
	asc	'qu'27'un '8e'l'8e'ment d'8e'coratif.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Son nez, notamment, d'8e'passe '8e'trangement'0d
	asc	'C'27'est peut-'90'tre un indice.'0d
	asc	'Ou juste un Inca avec un gros pif.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Par ailleurs, en y regardant bien,'0d
	asc	'il semble aussi tirer la langue.'0d
	dfb	ePEN,3
	asc	'Ce d'8e'tail vous trouble.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un message cod'8e' ?'0d
	asc	'Une blague mill'8e'naire ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'On simplement un sculpteur fac'8e'tieux'0d
	asc	'avec du temps '88' perdre ?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'D'8e'j'88' fatigu'8e' apr'8f's trois cailloux'0d
	asc	'et deux flaques ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il va falloir s'8e'rieusement penser'0d
	asc	88' vous inscrire '88' la salle...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Soupirant, vous vous adossez'0d
	asc	'au mur pour souffler un peu.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Quand soudain : CLIC ! WHOOSH !!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Votre dos vient d'27'appuyer pile sur'0d
	asc	'le nez de la statue.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Le mur se met '88' pivoter dans un'0d
	asc	'grondement ancestral.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous perdez l'278e'quilibre,'0d
	asc	'basculez en arri'8f're'0d
	asc	'et disparaissez dans l'27'ombre...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Direction  Myst'8f're ! Mais c'27'est au NORD'0d
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous placez face au visage'0d
	asc	'sculpt'8e' et, dans un '8e'lan de grande'0d
	asc	'maturit'8e', vous tirez la langue'0d
	asc	88' votre tour.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Rien ne se passe...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Si ce n'27'est un grand moment de solitude.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais qui sait ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'Peut-'90'tre que quelque part,'0d
	asc	'dans un monde parall'8f'le,'0d
	asc	'une autre statue vous r'8e'pond...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,3
	asc	'          SESAME, OUVRE TOI !!!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'H'8e'las, ce n'27'est ni la bonne '8e'poque,'0d
	asc	'ni la bonne civilisation,'0d
	asc	'ni la bonne voix...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A votre cri, un vieux m'8e'canisme'0d
	asc	'grince et s'27'active.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Un geyser de boue chaude jaillit'0d
	asc	'alors de la bouche du visage sculpt'8e' !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous voil'88' copieusement barbouill'8e0d
	dfb	ePEN,3
	asc	''0d
	asc	'             ...et surtout tr'8f's mort.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Derni'8f'res pens'8e'es :'0d
	asc	''0d
	asc	'Je savais que j'27'aurais d'9e' tenter'0d
	asc	'ABRACADABRA'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous d'8e'cidez '88' uriner,'0d
	asc	'avec la d'8e'termination et la maturit'8e0d
	asc	'qui vous caract'8e'risent.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'C'27'est-'88'-dire, en visant la bouche'0d
	asc	'du visage sculpt'8e' dans le mur...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Puisqu'27'on est l'88', autant s'27'amuser.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Surprise !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Votre jet se transforme instantan'8e'ment'0d
	asc	'en une colonne de vapeur au contact'0d
	asc	'de l'27'orifice du mur !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Alors soit vous avez de sacr'8e's talents'0d
	asc	'pyrotechniques, soit une source de'0d
	asc	'chaleur myst'8e'rieuse bouillonne'0d
	asc	'derri'8f're ce mur.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

