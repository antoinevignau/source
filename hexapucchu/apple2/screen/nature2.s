*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

NATURE2	@LOAD	#pNATURE2

	stz	L

NATURE2_60	@SHOWPIC
NATURE2_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	NATURE2_200
	cmp	#'2'
	beq	NATURE2_400
	cmp	#'3'
	beq	NATURE2_600
	cmp	#'4'
	beq	NATURE2_700
	cmp	#'5'
	beq	NATURE2_900
	bne	NATURE2_LOOP

NATURE2_200	lda	L
	bne	NATURE2_300
	
	@PRINT	#nature2_str200
	@INKEY
	jmp	NATURE2_60

NATURE2_300	@PRINT	#nature2_str300
	@INKEY
	jmp	NATURE2_60

NATURE2_400	lda	L
	bne	NATURE2_500
	
	@PRINT	#nature2_str400
	@INKEY
	jmp	MORT

NATURE2_500	@PRINT	#nature2_str500
	@INKEY
	jmp	NATURE1

NATURE2_600	@PRINT	#nature2_str600
	@INKEY
	jmp	NATURE2_60

NATURE2_700	@PRINT	#nature2_str700
	@INKEY
	jmp	MORT

NATURE2_900	@PRINT	#nature2_str900
	@INKEY
	
	lda	#1
	sta	L
	
	jmp	NATURE2_60


*---

pNATURE2	strl	'@/data/nature2'

L	ds	2

nature2_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous plissez les yeux,'0d
	asc	'vous tirez la langue,'0d
	asc	'vous vous rapprochez...'0d
	asc	''0d
	asc	'Vous tentez m'90'me la technique'0d
	asc	'du clignement rapide.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'... mais rien.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'C'27'est '8e'crit plus petit'0d
	asc	'qu'27'un contrat d'27'assurance !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Il vous faudrait une loupe,'0d
	asc	'ou une vue d'27'aigle.'0d
	asc	''0d
	asc	'Spoiler : vous n'2790'tes pas un aigle.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous abandonnez :'0d
	asc	'Hors de question de perdre'0d
	asc	'deux dizi'8f'mes par oeil pour '8d'a !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Les inscriptions sont ridiculement'0d
	asc	'minuscules.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mais gr'89'ce '88' votre loupe toute neuve,'0d
	asc	'miracle :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'  les signes graves se d'8e'voilent !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      SOL-LA-FA-FA-DO : 56423'0d
	dfb	ePEN,2
	asc	''0d
	asc	'C'27'est quoi ca ?!?!?'0d
	asc	''0d
	asc	'Une berceuse pour lamas insomniaques ?'0d
	asc	'Une playlist pour danse du soleil ?'0d
	asc	'Ou le premier tube des Andes ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Allez savoir...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous faites demi-tour,'0d
	asc	'quand une petite lueur sur une feuille'0d
	asc	'attire votre attention.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Curieux comme un chat,'0d
	asc	'vous vous penchez.'0d
	asc	'Mais la chose est vraiment petite.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous d'8e'cidez de l'27'attraper'0d
	asc	'pour l'27'examiner de plus pr'8f's.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mauvaise id'8e'e :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'C'27'est une Phoneutria Nigriventer'0d
	asc	'l'27'araign'8e'e la plus venimeuse du monde.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous venez de lui offrir votre main,'0d
	asc	'et elle vous offre... la mort.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Tout '8d'a ne serait pas arriv'8e','0d
	asc	'si vous aviez utilis'8e' votre loupe avant !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Enfin, je dis '8d'a, je dis rien, hein.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'En chemin, votre vision'0d
	asc	'am'8e'lior'8e'e par la loupe rep'8f're'0d
	asc	'une minuscule silhouette poilue.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'     Une Phoneutria Nigriventer !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Si vous ne le saviez pas encore,'0d
	asc	'ce petit nom d'27'arachnide'0d
	asc	'se traduit par :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'     Game Over en trois minutes !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais gr'89'ce '88' votre clairvoyance,'0d
	dfb	ePEN,2
	asc	'et surtout votre loupe,'0d
	dfb	ePEN,1
	asc	''0d
	asc	'vous l'278e'vitez et continuez au Sud,'0d
	asc	'vivant et fier,'0d
	dfb	ePEN,2
	asc	''0d
	asc	'PS : Vous replacez la loupe o'9d' vous'0d
	asc	'l'27'aviez trouv'8e'e : Ca pourrait servir'0d
	asc	88' un autre aventurier aussi peaum'8e0d
	asc	'que vous...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous plongez sous l'27'arche'0d
	asc	'soulevez des pierres,'0d
	asc	'inspectez les fissures...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'...Rien.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Pas une relique, pas un pi'8f'ge.'0d
	asc	''0d
	asc	'M'90'me pas une carte Pok'8e'mon'0d
	asc	'oubli'8e'e par un conquistador.'0d
	asc	''0d
	asc	'Nada, que dalle.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous esp'8e'riez un tr'8e'sor ?'0d
	asc	''0d
	asc	'Mauvaise pioche : Indiana Jones,'0d
	asc	'c'27'est '88' trois kilom'8f'tres au Nord.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous '8e'cartez les feuillages'0d
	asc	'avec un courage admirable et...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Tombez nez '88' nez avec un serpent'0d
	asc	'qui vous mord avant que vous ne'0d
	asc	'puissiez chercher '22'Antidote Serpent'220d
	asc	'sur Google.'0d
	dfb	eLOCATE,7,6
	dfb	ePEN,2
	asc	'Antidote Serpent'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,9	
	asc	'Votre vision se trouble,'0d
	asc	'vos jambes se ramollissent...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Et vous vous dites que finalement,'0d
	asc	'les bosquets,'0d
	asc	'Ce n'27'est pas votre truc.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Fin de l'27'histoire.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Apr'8f's avoir d'8e'plac'8e' assez de pierres'0d
	asc	'pour construire un mur Inca,'0d
	asc	'vous tombez sur... UNE LOUPE !'0d
	dfb	eLOCATE,20,3
	dfb	ePEN,4
	asc	'Une LOUPE'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un objet aussi excitant'0d
	asc	'qu'27'un dictionnaire,'0d
	asc	'mais qui pourrait bien'0d
	asc	'vous sauver la mise.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Comme quoi,'0d
	asc	'les taupes aussi laissent des tr'8e'sors.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Merci '88' l'27'Indiana Jones de la cataracte'0d
	asc	'qui l'27'a laiss'8e'e l'88'.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
