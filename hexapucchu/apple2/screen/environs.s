*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ENVIRONS	@LOAD	#pENVIRONS
ENVIRONS_60	@SHOWPIC
ENVIRONS_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	ENVIRONS_120
	jmp	JUNGLE
ENVIRONS_120	cmp	#'2'
	bne	ENVIRONS_130
	jmp	NATURE1
ENVIRONS_130	cmp	#'3'
	bne	ENVIRONS_140
	jmp	CASCADE
ENVIRONS_140	cmp	#'4'
	beq	ENVIRONS_200
	cmp	#'5'
	beq	ENVIRONS_300
	cmp	#'6'
	beq	ENVIRONS_400
	cmp	#'7'
	beq	ENVIRONS_500
	bne	ENVIRONS_LOOP

ENVIRONS_200	@PRINT	#environs_str200
	@INKEY
	jmp	ENVIRONS_60
	
ENVIRONS_300	@PRINT	#environs_str300
	@INKEY
	jmp	ENVIRONS_60
	
ENVIRONS_400	@PRINT	#environs_str400
	@INKEY
	jmp	ENVIRONS_60

ENVIRONS_500	@PRINT	#environs_str500
	@INKEY
	jmp	MORT
	
*---

pENVIRONS	strl	'@/data/environs'

environs_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'A l'27'OUEST, un sentier s'27'enfonce dans'0d
	asc	'une jungle '8e'paisse, verte, luxuriante'0d
	asc	'et inqui'8e'tante..'0d
	dfb	ePEN,2
	asc	0d'Au NORD, un chemin m'8f'ne '88' une prairie'0d
	asc	'paisible, presque trop belle pour '90'tre'0d
	asc	'honn'90'te.'0d
	dfb	ePEN,1
	asc	0d'A l'27'EST, un sentier escarp'8e' grimpe'0d
	asc	'vers la montagne, envelopp'8e'e de'0d
	asc	'brumes mena'8d'antes.'0d
	dfb	ePEN,3
	asc	0d'Pas facile de choisir tant chaque'0d
	asc	'destination a l'27'air encore plus'0d
	asc	'accueillante que la pr'8e'c'8e'dente, hein ?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Apr'8f's les ch'89'teaux de sable, c'27'est au'0d
	asc	'tour de la cabane des bois ?'0d
	dfb	ePEN,2
	asc	0d'Vous '90'tes un vrai gamin, vous !'0d
	dfb	ePEN,1
	asc	0d'Vous commencez '88' empiler des branches...'0d
	dfb	ePEN,2
	asc	'Apr'8f's 3 heures,'0d
	asc	'vous avez une oeuvre d'27'art'0d
	asc	'conceptuelle baptis'8e'e :'0d
	dfb	ePEN,3
	asc	0d'  '22' Tas de bois qui tient pas debout '220d
	dfb	ePEN,1
	asc	0d'Bravo, architecte.'0d
	dfb	ePEN,2
	asc	0d'On est d'27'accord que '8d'a n'27'a servi '88' rien'0d
	asc	'A part collectionner les '8e'chardes'0d
	asc	'et se fatiguer pour rien.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous pensez que creuser est la r'8e'ponse'0d
	asc	88' tous vos probl'8f'mes ?'0d
	dfb	ePEN,3
	asc	0d0d'Newsflash : la vie c'27'est pas Minecraft !'0d
	dfb	ePEN,2
	asc	0d'Ce n'27'est pas parce que vous avez'0d
	asc	'trouv'8e' un engrenage une fois, que'0d
	asc	'le sol est devenu une brocante magique.'0d
	dfb	ePEN,3
	asc	0d'Ici, tout ce que vous gagnez,'0d
	asc	'c'27'est des ampoules.'0d
	dfb	ePEN,1
	asc	0d'Bon,'0d
	asc	'faudrait voir '88' se reprendre un peu,'0d
	asc	'Hein, Mr Boulder Dash du dimanche.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Ah, le bon vieux plan B : repartir.'0d
	dfb	ePEN,3
	asc	0d'Le plan des l'89'ches, quoi.'0d
	dfb	ePEN,2
	asc	0d'Soit...'0d
	dfb	ePEN,1
	asc	0d'Vous foncez '88' l'27'a'8e'roport avec votre'0d
	asc	'engrenage sous le bras et embarquez'0d
	asc	'dans le premier vol retour'0d
	asc	'pour la France.'0d
	dfb	ePEN,3
	asc	0d'Probl'8f'me :'0d
	dfb	ePEN,2
	asc	0d'Durant le vol,'0d
	asc	'votre souvenir inca brouille les'0d
	asc	'instruments de bord...'0d
	dfb	ePEN,1
	asc	0d'Conclusion ?'0d
	asc	0d'Un vol sans escale, direct dans l'27'oc'8e'an'0d
	asc	'Pas de mile accumul'8e','0d
	asc	'mais une jolie noyade offerte.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
