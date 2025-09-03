*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

SAUT	@LOAD	#pSAUT
SAUT_60	@SHOWPIC
SAUT_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	SAUT_110
	cmp	#'2'
	beq	SAUT_120
	cmp	#'3'
	beq	SAUT_130
	cmp	#'4'
	beq	SAUT_200
	cmp	#'5'
	beq	SAUT_300
	cmp	#'6'
	beq	SAUT_400
	cmp	#'7'
	beq	SAUT_500
	bne	SAUT_LOOP	

SAUT_110	jmp	GROTTE2

SAUT_120	jmp	INCA1

SAUT_130	jmp	ORIFICES

SAUT_200	@PRINT	#saut_str200
	@INKEY
	jmp	SAUT_60

SAUT_300	@PRINT	#saut_str300
	@INKEY
	jmp	SAUT_60

SAUT_400	@PRINT	#saut_str400
	@INKEY
	jmp	SAUT_60

SAUT_500	@PRINT	#saut_str500
	@INKEY
	jmp	SAUT_60

*---

pSAUT	strl	'@/data/saut'

saut_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous plissez les yeux, froncez les'0d
	asc	'sourcils et adoptez l'27'air grave de'0d
	asc	'quelqu'27'un qui passe un oral de'0d
	asc	'g'8e'ologie antique.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Or, oxyde de fer, oxyde de cobalt...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Non, ce n'27'est pas la recette d'27'un'0d
	asc	'smoothie '8e'nerg'8e'tique, mais bien un mur'0d
	asc	'riche en min'8e'raux.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Avec une telle concentration de mati'8f're'0d
	asc	'magn'8e'tique, on pourrait presque stocker'0d
	asc	'un secret mill'8e'naire...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'...ou quelques pr'8e'cieuses donn'8e'es,'0d
	asc	'en mode discret.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

saut_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Tel un Ars'8f'ne Lupin version discount,'0d
	asc	'vous d'8e'robez un cristal avec panache.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Une jolie touche kitsch de plus pour'0d
	asc	'votre '8e'tag'8f're, juste '88' c'99't'8e' du buste'0d
	asc	'en r'8e'sine dor'8e'e de David Hasselhoff'0d
	asc	'que vous v'8e'n'8e'rez en secret.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais une sueur froide vous parcourt'0d
	asc	'tout '88' coup :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Et si c'278e'tait de la kryptonite ?!?!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Puis vous vous d'8e'tendez...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Aucun danger.'0d
	asc	'Vous '90'tes '88' peu pr'8f's aussi SUPER'0d
	asc	'qu'27'un lundi matin.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

saut_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous sortez votre antique smartphone'0d
	asc	'et cadrez votre meilleur profil'0d
	asc	'devant ce mur millenaire.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'             CLIC ! FLASH !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Et l'88', miracle : l'278e'clairage des'0d
	asc	'cristaux vous donne un teint l'8e'g'8f'rement'0d
	asc	'radioactif mais '8e'tonnamment flatteur.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un petit filtre '228e'pique brume'22' plus'0d
	asc	'tard, vous obtenez la photo parfaite...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'...jusqu'2788' ce que vous zoomiez'0d
	asc	'et r'8e'alisiez que derri'8f're vous,'0d
	asc	'un l'8e'zard tire la langue avec une'0d
	asc	8e'l'8e'gance moqueuse.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bravo. Vous venez de capturer le tout'0d
	asc	'premier '22'g'8e'oselfie photobombe par un'0d
	asc	'reptile cynique.'220d
	dfb	ePEN,1
	asc	''0d
	asc	'Instagram n'27'est pas pr'90't. Vous, non plus'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

saut_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous avez le sens du panache...'0d
	asc	'...ou de l'27'inconscience.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'La corniche, bossel'8e'e et incertaine,'0d
	asc	'n'27'a rien d'27'une piste de danse, mais'0d
	asc	'qu'27'importe :'0d
	dfb	ePEN,
	asc	''0d
	asc	'Vous reculez, bras semi-gracieux,'0d
	asc	'yeux lev'8e's au ciel... et vous vous'0d
	asc	'lancez dans un moonwalk audacieux.'0d
	dfb	ePEN,
	asc	''0d
	asc	'R'8e'sultat : un demi-glissement,'0d
	asc	'une torsion du genou qu'27'on pourrait'0d
	asc	'qualifier de cr'8e'ative, et une pose'0d
	asc	'finale accroch'8e'e '88' la paroi avec'0d
	asc	'l'278e'l'8e'gance d'27'un lama pris dans une'0d
	asc	'avalanche.'0d
	dfb	ePEN,
	asc	''0d
	asc	'Un l'8e'zard vous observe.'0d
	asc	'Il h'8e'site entre l'27'admiration'0d
	asc	'...et le signalement.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

