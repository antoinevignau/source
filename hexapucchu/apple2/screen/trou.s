*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

TROU	@LOAD	#pTROU
TROU_60	@SHOWPIC
TROU_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	TROU_100
	jmp	POULIE
TROU_100	cmp	#'2'
	bne	TROU_110
	jmp	GROTTE4
TROU_110	cmp	#'3'
	beq	TROU_200
	cmp	#'4'
	beq	TROU_300
	cmp	#'5'
	beq	TROU_400
	cmp	#'6'
	beq	TROU_500
	bne	TROU_LOOP

TROU_200	@PRINT	#trou_str200
	@INKEY
	jmp	GROTTE1

TROU_300	@PRINT	#trou_str300
	@INKEY
	jmp	MORT

TROU_400	@PRINT	#trou_str400
	@INKEY
	jmp	TROU_60

TROU_500	@PRINT	#trou_str500
	@INKEY
	jmp	MORT

*---

pTROU	strl	'@/data/trou'

trou_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous vous penchez sur le trou'0d
	asc	'comme si vous attendiez un miracle...'0d
	asc	''0d
	asc	'...et il arrive :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'             la gravit'8e' !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Votre pied ripe,'0d
	asc	'et vous voil'88' projet'8e0d
	asc	'dans un toboggan naturel,'0d
	asc	'en hurlant des sons inhumains.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Apres une glissade interminable,'0d
	asc	'vous atterrissez violemment...'0d
	asc	'au niveau inf'8e'rieur de la grotte.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Votre chor'8e'graphie TikTok'0d
	asc	8e'tait presque parfaite...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Jusqu'2788' ce que les vibrations'0d
	asc	'provoqu'8e'es par vos sauts erratiques'0d
	asc	'd'8e'crochent un gros rocher du plafond.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'SCOUIRK !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous faites d'8e'sormais'0d
	asc	'partie du plancher.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Ok, vous sifflez, pourquoi pas.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'L'278e'cho rebondit dans la grotte,'0d
	asc	''0d
	asc	'Une fois,'0d
	asc	'          deux fois...'0d
	asc	'                       trois fois.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Tiens ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'La troisi'8f'me r'8e'sonance'0d
	asc	'semble venir d'27'un mur creux...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A moins que cela ne soit d'9e0d
	asc	'au trou b'8e'ant du sol !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Au moins, on sait '88' pr'8e'sent'0d
	asc	'que le trou est profond.'0d
	asc	'C'27'est d'8e'j'88' '8d'a !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Tel un athl'8f'te'0d
	asc	'pr'90't pour le lancer du poids,'0d
	asc	'vous prenez votre '8e'lan'0d
	asc	'et envoyez le caillou'0d
	asc	'de toutes vos forces dans le trou.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Autant dire... pas tr'8f's fort.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais assez pour r'8e'veiller'0d
	asc	'une arm'8e'e de chauves-souris'0d
	asc	'qui y dormait tranquillement.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Elles vous fondent dessus'0d
	asc	'et vous vident de votre sang.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Groupe B Rh'8e'sus Positif :'0d
	asc	'leur menu pr'8e'f'8e'r'8e' !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
