*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

PIANO	@LOAD	#pPIANO
PIANO_60	@SHOWPIC

PIANO_100	@INKEY
	@DEBUG
	cmp	#'1'
	bne	PIANO_120
	@SOUND	#1;#159;#60
	@SOUND	#1;#142;#60
	@SOUND	#1;#179;#60
	@SOUND	#1;#358;#60
	@SOUND	#1;#239;#60
	jmp	PIANO_100
PIANO_120	cmp	#'2'
	bne	PIANO_130
	@SOUND	#1;#358;#60
	jmp	PIANO_100
PIANO_130	cmp	#'3'
	bne	PIANO_140
	@SOUND	#2;#239;#60
	jmp	PIANO_100
PIANO_140	cmp	#'4'
	bne	PIANO_150
	@SOUND	#3;#179;#60
	jmp	PIANO_100
PIANO_150	cmp	#'5'
	bne	PIANO_160
	@SOUND	#1;#159;#60
	jmp	PIANO_200
PIANO_160	cmp	#'6'
	bne	PIANO_170
	@SOUND	#2;#142;#60
	jmp	PIANO_100
PIANO_170	cmp	#'7'
	bne	PIANO_180
	jmp	FRESQUE
PIANO_180	cmp	#'8'
	bne	PIANO_185
	jmp	POULIE
PIANO_185	cmp	#'9'
	bne	PIANO_190
	jmp	PIANO_700
PIANO_190	jmp	PIANO_100

PIANO_200	@INKEY
	cmp	#'1'
	bne	PIANO_220
	@SOUND	#1;#159;#60
	@SOUND	#1;#142;#60
	@SOUND	#1;#179;#60
	@SOUND	#1;#358;#60
	@SOUND	#1;#239;#60
	jmp	PIANO_100
PIANO_220	cmp	#'2'
	bne	PIANO_230
	@SOUND	#1;#358;#60
	jmp	PIANO_100
PIANO_230	cmp	#'3'
	bne	PIANO_240
	@SOUND	#2;#239;#60
	jmp	PIANO_100
PIANO_240	cmp	#'4'
	bne	PIANO_250
	@SOUND	#3;#179;#60
	jmp	PIANO_100
PIANO_250	cmp	#'5'
	bne	PIANO_260
	@SOUND	#2;#159;#60
	jmp	PIANO_100
PIANO_260	cmp	#'6'
	bne	PIANO_270
	@SOUND	#1;#142;#60
	jmp	PIANO_300
PIANO_270	cmp	#'7'
	bne	PIANO_280
	jmp	FRESQUE
PIANO_280	cmp	#'8'
	bne	PIANO_285
	jmp	POULIE
PIANO_285	cmp	#'9'
	bne	PIANO_290
	jmp	PIANO_700
PIANO_290	jmp	PIANO_200

PIANO_300	@INKEY
	cmp	#'1'
	bne	PIANO_320
	@SOUND	#1;#159;#60
	@SOUND	#1;#142;#60
	@SOUND	#1;#179;#60
	@SOUND	#1;#358;#60
	@SOUND	#1;#239;#60
	jmp	PIANO_100
PIANO_320	cmp	#'2'
	bne	PIANO_330
	@SOUND	#1;#358;#60
	jmp	PIANO_100
PIANO_330	cmp	#'3'
	bne	PIANO_340
	@SOUND	#2;#239;#60
	jmp	PIANO_100
PIANO_340	cmp	#'4'
	bne	PIANO_350
	@SOUND	#3;#179;#60
	jmp	PIANO_400
PIANO_350	cmp	#'5'
	bne	PIANO_360
	@SOUND	#2;#159;#60
	jmp	PIANO_100
PIANO_360	cmp	#'6'
	bne	PIANO_370
	@SOUND	#1;#142;#60
	jmp	PIANO_100
PIANO_370	cmp	#'7'
	bne	PIANO_380
	jmp	FRESQUE
PIANO_380	cmp	#'8'
	bne	PIANO_385
	jmp	POULIE
PIANO_385	cmp	#'9'
	bne	PIANO_390
	jmp	PIANO_700
PIANO_390	jmp	PIANO_300

PIANO_400	@INKEY
	cmp	#'1'
	bne	PIANO_420
	@SOUND	#1;#159;#60
	@SOUND	#1;#142;#60
	@SOUND	#1;#179;#60
	@SOUND	#1;#358;#60
	@SOUND	#1;#239;#60
	jmp	PIANO_100
PIANO_420	cmp	#'2'
	bne	PIANO_430
	@SOUND	#1;#358;#60
	jmp	PIANO_500
PIANO_430	cmp	#'3'
	bne	PIANO_440
	@SOUND	#2;#239;#60
	jmp	PIANO_100
PIANO_440	cmp	#'4'
	bne	PIANO_450
	@SOUND	#3;#179;#60
	jmp	PIANO_100
PIANO_450	cmp	#'5'
	bne	PIANO_460
	@SOUND	#2;#159;#60
	jmp	PIANO_100
PIANO_460	cmp	#'6'
	bne	PIANO_470
	@SOUND	#1;#142;#60
	jmp	PIANO_100
PIANO_470	cmp	#'7'
	bne	PIANO_480
	jmp	FRESQUE
PIANO_480	cmp	#'8'
	bne	PIANO_485
	jmp	POULIE
PIANO_485	cmp	#'9'
	bne	PIANO_490
	jmp	PIANO_700
PIANO_490	jmp	PIANO_400

PIANO_500	@INKEY
	cmp	#'1'
	bne	PIANO_520
	@SOUND	#1;#159;#60
	@SOUND	#1;#142;#60
	@SOUND	#1;#179;#60
	@SOUND	#1;#358;#60
	@SOUND	#1;#239;#60
	jmp	PIANO_100
PIANO_520	cmp	#'2'
	bne	PIANO_530
	@SOUND	#1;#358;#60
	jmp	PIANO_100
PIANO_530	cmp	#'3'
	bne	PIANO_540
	@SOUND	#2;#239;#60
	jmp	PIANO_600
PIANO_540	cmp	#'4'
	bne	PIANO_550
	@SOUND	#3;#179;#60
	jmp	PIANO_100
PIANO_550	cmp	#'5'
	bne	PIANO_560
	@SOUND	#2;#159;#60
	jmp	PIANO_100
PIANO_560	cmp	#'6'
	bne	PIANO_570
	@SOUND	#1;#142;#60
	jmp	PIANO_100
PIANO_570	cmp	#'7'
	bne	PIANO_580
	jmp	FRESQUE
PIANO_580	cmp	#'8'
	bne	PIANO_585
	jmp	POULIE
PIANO_585	cmp	#'9'
	bne	PIANO_590
	jmp	PIANO_700
PIANO_590	jmp	PIANO_500

PIANO_600	@PRINT	#piano_str600
	@INKEY
	jmp	INCA1

PIANO_700	@PRINT	#piano_str700
	@INKEY
	jmp	PIANO_60

*---

pPIANO	strl	'@/data/piano'

piano_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Les six blocs vibrent '88' l'27'unisson'0d
	asc	'et r'8e'sonnent dans la caverne'0d
	dfb	ePEN,2
	asc	''0d
	asc	'La derni'8f're note s'278e'teint,'0d
	asc	'puis un silence pesant s'27'installe.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Soudain, un grondement sourd.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Les pierres tremblent,'0d
	asc	'la poussi'8f're tombe du plafond...'0d
	asc	''0d
	asc	'Et vous r'8e'alisez avec un sourire'0d
	asc	'que vous venez d'27'impressionner'0d
	asc	'Steven Spielberg lui-m'90'me !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Un pan du mur glisse lentement,'0d
	asc	'd'8e'voilant un passage vers le SUD.'0d
	dfb	ePEN,3
	asc	'SUD'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous l'27'empruntez sans attendre !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

piano_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'De myst'8e'rieux symboles ornent les blocs.'0d
	asc	'Le temps et l'27'humidit'8e0d
	asc	'ont poli leurs surfaces,'0d
	asc	'mais des marques d'27'usure'0d
	asc	'laissent deviner qu'27'ils ont '8e't'8e0d
	asc	'souvent actionn'8e's.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un souffle d'27'air froid'0d
	asc	'traverse les interstices.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous posez la main sur une touche :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Elle s'27'enfonce l'8e'g'8f'rement'0d
	asc	'et un son grave r'8e'sonne dans la caverne'0d
	asc	'vibrant jusque dans votre poitrine.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Cet orgue n'27'est pas qu'27'un simple d'8e'cor,'0d
	asc	'il cache peut-'90'tre un secret...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
