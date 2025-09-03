*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

JUNGLE	@LOAD	#pJUNGLE
JUNGLE_60	@SHOWPIC
JUNGLE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	JUNGLE_200
	cmp	#'2'
	beq	JUNGLE_300
	cmp	#'3'
	beq	JUNGLE_400
	cmp	#'4'
	beq	JUNGLE_500
	cmp	#'5'
	beq	JUNGLE_600
	cmp	#'6'
	bne	JUNGLE_LOOP
	jmp	ENVIRONS

JUNGLE_200	@PRINT	#jungle_str200
	@INKEY
	jmp	JUNGLE_60

JUNGLE_300	@PRINT	#jungle_str300
	@INKEY
	jmp	MORT

JUNGLE_400	@PRINT	#jungle_str400
	@INKEY
	jmp	JUNGLE_60

JUNGLE_500	@PRINT	#jungle_str500
	@INKEY
	jmp	MORT

JUNGLE_600	@PRINT	#jungle_str600
	@INKEY
	jmp	MORT

*---

pJUNGLE	strl	'@/data/jungle'

jungle_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous regardez autour de vous,'0d
	asc	'esp'8e'rant voir un indice...'0d
	asc	'ou un chargeur de t'8e'l'8e'phone'0d
	asc	'oubli'8e' par un autre touriste.'0d
	dfb	ePEN,2
	asc	0d'Rien de tel, juste des plantes,'0d
	asc	'un plamier imposant,'0d
	dfb	ePEN,3
	asc	'et une promesse de piq'9e'res en s'8e'rie.'0d
	dfb	ePEN,1
	asc	0d'Pourtant,'0d
	asc	'vous avez la curieuse impression'0d
	asc	'que cette jungle murmure un secret...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

jungle_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous secouez le palmie'0d
	asc	'avec l'27'enthousiasme'0d
	asc	'd'27'un sportif du dimanche.'0d
	dfb	ePEN,3
	asc	0d'Mauvais plan : CRAC... PLOC !'0d
	dfb	ePEN,1
	asc	0d'Une noix de coco se d'8e'tache,'0d
	asc	'vise votre t'90'te'0d
	asc	'et marque un parfait strike.'0d
	dfb	ePEN,2
	asc	0d'Les palmiers viennent de remporter'0d
	asc	'la manche.'0d
	dfb	ePEN,1
	asc	0d'Score : Nature 1 - Touriste 0'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

jungle_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous sortez votre couteau'0d
	asc	'et commencez '88' sculpter fi'8f'rement'0d
	asc	'votre blaze...'0d
	dfb	ePEN,3
	asc	0d'Mais surprise :'0d
	asc	0d'quelqu'27'un est pass'8e' avant vous !'0d
	dfb	ePEN,1
	asc	0d'Sur l'278e'corce, vous d'8e'chiffrez :'0d
	dfb	ePEN,3
	asc	0d'10 dents, c'27'est moins que le crocodile'0d
	dfb	ePEN,1
	asc	0d'Et c'27' sign'8e' : A.M.S'0d
	asc	0d'Bizarre...'0d
	asc	0d'Peut-'90'tre serait-il bon'0d
	asc	'de retenir cette information.'
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

jungle_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous soulevez les feuillages...'0d
	dfb	ePEN,3
	asc	0d'                ERREUR !'0d
	dfb	ePEN,2
	asc	0d'Une escadrille de moustiques tigres'0d
	asc	'surgit, casques en t'90'te,'0d
	asc	'talkie-walkies gr'8e'sillants.'0d
	dfb	ePEN,3
	asc	0d'- Objectif visuel confirm'8e','0d
	asc	'  On l'278E'puise !'0d
	dfb	ePEN,1
	asc	0d'Ils vous chargent en formation Delta,'0d
	asc	'vous vident de votre sang'0d
	asc	'comme un Capri-Sum.'0d
	dfb	ePEN,2
	asc	0d'Derni'8f're vision :'0d
	asc	0d'Un moustique qui vous salue,'0d
	asc	'au garde-'88'-vous.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

jungle_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous frayez un chemin'0d
	asc	'vers le nord.'0d
	dfb	ePEN,2
	asc	0d'Enfin, vous essayez...'0d
	dfb	ePEN,1
	asc	0d'Les plantes sont si denses'0d
	asc	'qu'27'on dirait une file d'27'attente'0d
	asc	'pour le Black Friday.'0d
	dfb	ePEN,2
	asc	0d'Vous poussez, vous for'8d'ez...'0d
	dfb	ePEN,3
	asc	0d'SCHLACK !'0d
	dfb	ePEN,1
	asc	'Une liane se d'8e'tache,'0d
	asc	's'27'enroule autour de votre cou'0d
	asc	'et vous hisse dans les airs'0d
	asc	'comme un jambon en promo.'0d
	dfb	ePEN,2
	asc	0d'La nature, parfois, elle est pas cool...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
