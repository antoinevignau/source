*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ORIFICES	@LOAD	#pORIFICES
ORIFICES_60	@SHOWPIC
ORIFICES_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	ORIFICES_200
	cmp	#'2'
	beq	ORIFICES_200
	cmp	#'3'
	beq	ORIFICES_200
	cmp	#'4'
	beq	ORIFICES_300
	cmp	#'5'
	bne	ORIFICES_160
	jmp	SAUT
ORIFICES_160	cmp	#'6'
	beq	ORIFICES_400
	bne	ORIFICES_LOOP	

ORIFICES_200	@PRINT	#orifices_str200
	@INKEY
	jmp	MORT

ORIFICES_300	@PRINT	#orifices_str300
	@INKEY
	jmp	CPC

ORIFICES_400	@PRINT	#orifices_str400
	@INKEY
	jmp	ORIFICES_60

*---

pORIFICES	strl	'@/data/orifices'

orifices_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous ins'8e'rez l'27'engrenage'0d
	asc	'dans l'27'orifice...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLAC !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un bruit sec,'0d
	asc	'puis un sifflement sinistre.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'L'27'engrenage ressort tel un boomerang,'0d
	asc	'traverse l'27'air '88' la vitesse'0d
	asc	'd'27'un pigeon kamikaze'0d
	asc	'et se loge pile entre vos deux yeux.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez juste le temps de penser :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Ah, j'27'aurais d'9e' faire un meilleur choix,ou porter des lunettes de protection !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Puis tout devient noir.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

orifices_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous glissez l'27'engrenage'0d
	asc	'dans l'27'orifice aux 10 entailles,'0d
	asc	'pile-poil le m'90'me nombre de dents'0d
	asc	'que l'27'art'8e'fact.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Apr'8f's un cliquetis prometteur,'0d
	asc	'l'27'engrenage se met '88' tourner'0d
	asc	'dans son logement.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Une pierre pivote et... SURPRISE !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Un ordinateur ancien se r'8e'v'8f'le !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Non, vous n'2790'tes pas en train de r'90'ver.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

orifices_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous inspectez les orifices.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Au-dessus de chacun, vous distinguez'0d
	asc	'des entailles, en nombre variable.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Serait-ce un code ? Une d'8e'co ?'0d
	asc	'Le nombre de fois o'9d' les Incas'0d
	asc	'ont perdu au d'8e'mineur ?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Cela doit certainement'0d
	asc	'faire r'8e'f'8e'rence '88' l'27'engrenage.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Est-ce son poids ? Son '89'ge ?'0d
	asc	'Son nombre de dents ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Quoi qu'27'il en soit,'0d
	asc	'va falloir choisir intelligemment...'0d
	asc	''0d
	asc	'...ou prier tr'8f's fort !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

