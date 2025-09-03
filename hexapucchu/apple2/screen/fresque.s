*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

FRESQUE	@LOAD	#pFRESQUE
FRESQUE_60	@SHOWPIC
FRESQUE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	FRESQUE_120
	jmp	PIANO
FRESQUE_120	cmp	#'2'
	beq	FRESQUE_200
	cmp	#'3'
	beq	FRESQUE_300
	cmp	#'4'
	beq	FRESQUE_400
	cmp	#'5'
	beq	FRESQUE_500
	bne	FRESQUE_LOOP	

FRESQUE_200	@PRINT	#fresque_str200
	@INKEY
	jmp	FRESQUE_60

FRESQUE_300	@PRINT	#fresque_str300
	@INKEY
	jmp	MORT

FRESQUE_400	@PRINT	#fresque_str400
	@INKEY
	jmp	FRESQUE_60

FRESQUE_500	@PRINT	#fresque_str500
	@INKEY
	@PRINT	#fresque_str560
	@INKEY
	jmp	FRESQUE_60

*---

pFRESQUE	strl	'@/data/fresque'

fresque_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous d'8e'gainez votre t'8e'l'8e'phone,'0d
	asc	'ajustez le cadre, et clic :'0d
	asc	'souvenir pris !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous postez sur Insta avec la l'8e'gende :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Art inca ? Science-fiction ? Boum Boum ?'0d
	asc	22' '23'Myst'8f'reMill'8e'naire '23'JaiEncore2Barres '220d
	dfb	ePEN,2
	asc	''0d
	asc	'Et vous attendez les likes...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Parce que m'90'me au fond d'27'une'0d
	asc	'pyramide inca, l'27'algorithme, lui,'0d
	asc	'ne dort jamais.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous collez votre oreille contre la '0d
	asc	'pierre froide, dans l'27'espoir'0d
	asc	'd'27'entendre quelque chose.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Une voix ancienne ?'0d
	asc	''0d
	asc	'Le murmure des Anciens ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Rien...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'En revanche, vous ressentez une'0d
	asc	'vive douleur :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Un petit scorpion logeait pile '880d
	asc	'cet endroit.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il n'27'a rien dit non plus, mais il'0d
	asc	'vous a clairement demand'8e' de d'8e'gager...'0d
	asc	'Les deux pieds devant !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'En manque d'27'affection ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'Vous caressez la fresque avec tout le'0d
	asc	's'8e'rieux d'27'un expert en art rupestre...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais rien ne se passe.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Pas un frisson, pas un murmure,'0d
	asc	'm'90'me pas un soupir de la pierre.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Au moins vous aurez tent'8e' de cr'8e'er'0d
	asc	'du lien avec la roche.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'C'27'est d'8e'j'88' '8d'a, non ?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Les murs de la pi'8f'ce sont recouverts'0d
	asc	'd'27'une fresque monumentale taill'8e'e dans'0d
	asc	'la pierre.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Les formes sont simples, stylis'8e'es,'0d
	asc	'mais d'27'une pr'8e'cision '8e'tonnante.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A gauche, figure un homme au regard'0d
	asc	'grave et puissant.'0d
	asc	''0d
*	asc	'La date 1984 est grav'8e' juste au dessous.'0d
	asc	'La date 1984 est grav'8e'e au dessous.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A sa droite, un curieux objet'0d
	asc	'g'8e'om'8e'trique aux lignes anguleuses'0d
	asc	'ressemblant '88' un ordinateur !!!'0d
	asc	''0d
	asc	'La date 984 est inscrite au dessous'0d
	asc	'de cet '8e'trange dessin.'0d
	dfb	ePEN,3
	dfb	eLOCATE,21,16
	asc	'ordinateur'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str560	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Plus loin une forme tourment'8e'e '8e'voque'0d
	asc	'un champignon atomique, silhouette'0d
	asc	'mena'8d'ante, suspendue dans le temps.'0d
	asc	''0d
	asc	'L'27'ann'8e'e 2028 est grav'8e'e sous ce symbole'0d
	asc	'd'27'apocalypse.'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'Que signifie cette '8e'nigmatique fresque ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'Un avertissement ? Une proph'8e'tie ?'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
