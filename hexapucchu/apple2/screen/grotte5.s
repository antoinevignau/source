*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE5	@LOAD	#pGROTTE5

	stz	P

GROTTE5_60	@SHOWPIC
GROTTE5_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE5_100
	lda	P
	beq	GROTTE5_200
	jmp	GROTTE6
GROTTE5_100	cmp	#'2'
	bne	GROTTE5_110
	lda	P
	beq	GROTTE5_200
	jmp	GROTTE4
GROTTE5_110	cmp	#'3'
	bne	GROTTE5_120
	lda	P
	beq	GROTTE5_200
	jmp	GROTTE5_700
GROTTE5_120	cmp	#'4'
	bne	GROTTE5_130
	lda	P
	beq	GROTTE5_200
	jmp	POULIE
GROTTE5_130	cmp	#'5'
	beq	GROTTE5_300
	cmp	#'6'
	beq	GROTTE5_400
	cmp	#'7'
	beq	GROTTE5_500
	cmp	#'8'
	beq	GROTTE5_600
	bne	GROTTE5_LOOP

GROTTE5_200	@PRINT	#grotte5_str200
	@INKEY
	jmp	MORT

GROTTE5_300	@PRINT	#grotte5_str300
	@INKEY
	jmp	GROTTE5_60

GROTTE5_400	@PRINT	#grotte5_str400
	@INKEY
	
	lda	#1
	sta	P
	
	jmp	GROTTE5_60

GROTTE5_500	@PRINT	#grotte5_str500
	@INKEY
	jmp	GROTTE5_60

GROTTE5_600	@PRINT	#grotte5_str600
	@INKEY
	jmp	GROTTE5_60

GROTTE5_700	@PRINT	#grotte5_str700
	@INKEY
	jmp	CORNICHE

*---

pGROTTE5	strl	'@/data/grotte5'

P	ds	2

grotte5_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous quittez la cavit'8e','0d
	asc	'persuad'8e' que tout va bien.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Erreur !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'La statue,'0d
	asc	'visiblement pas fan des adieux,'0d
	asc	'vous tire une fl'8f'che dans le dos.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Le poison fait son effet :'0d
	asc	'c'27'est votre dernier voyage.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Moralit'8e' :'0d
	asc	'Ne jamais tourner le dos '88' l'27'art.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte5_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'En observant la statue,'0d
	asc	'vous d'8e'couvrez un orifice...'0d
	asc	'pile '88' un endroit'0d
	asc	'qui ferait rougir un Inca.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Et sous son visage grima'8d'ant fig'8e','0d
	asc	'une base polie par le temps.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Elle a l'27'air de pouvoir tourner.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Le sol, poli par des g'8e'n'8e'rations,'0d
	asc	'r'8e'v'8f'le que la statue'0d
	asc	'fut longtemps honor'8e'e'0d
	asc	'par des offrandes sacr'8e'es.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Pour le reste, quatre passages,'0d
	asc	'chacun vers un point cardinal.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte5_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous prenez appui,'0d
	asc	'et poussez de toutes vos forces...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'GROOONC...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'La statue pivote lentement'0d
	asc	'avec un sinistre grincement.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Un d'8e'clic, puis le silence.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Un m'8e'canisme semble avoir '8e't'8e' d'8e'sarm'8e' !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous respirez enfin.'0d
	asc	''0d
	asc	'Bon...'0d
	asc	'Tant que vous '90'tes l'88','0d
	asc	'souriez-lui : elle adore '8d'a.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte5_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous tentez la conversation :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'M'8e't'8e'o, foot, politique...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Rien.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous tentez alors une blague :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Quel ustensile a '8e't'8e' invent'8e0d
	asc	'par les Azt'8f'ques ?'0d
	asc	''0d
	asc	'....le couteau azt'8f'que !!!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Rien.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Le couteau '88' steak, quoi !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Toujours rien...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'M'90'me pas un sourire en pierre.'0d
	asc	'Public difficile.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte5_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous mettez '88' genoux,'0d
	asc	'mains jointes,'0d
	asc	'priant avec ferveur...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une mouche se pose sur votre nez.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'c'27'est le seul signe divin'0d
	asc	'que vous recevrez aujourd'27'hui.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte5_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous empruntez l'27'issue '88' l'27'Ouest,'0d
	asc	'tout en reculant prudemment pour garder'0d
	asc	'un oeil sur la statue meurtri'8f're...'0d
	asc	'On ne sait jamais !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un pas, deux pas...'0d
	dfb	ePEN,3
	asc	'... et soudain, le vide !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'La corniche escarp'8e'e n'278e'tait'0d
	asc	'clairement pas pr'8e'vue au programme...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous basculez, t'90'te la premi'8f're,'0d
	asc	'pr'8f't '88' embrasser la roche...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais miracle :'0d
	dfb	ePEN,1
	asc	'la jungle vous tend ses bras !'0d
	asc	'Une v'8e'g'8e'tation dense amortit'0d
	asc	'votre chute.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Dix m'8f'tres plus bas,'0d
	asc	'vous vous relevez, indemne,'0d
	asc	'entour'8e' d'27'arbres, de foug'8f'res'0d
	asc	'... et de moustiques affam'8e's.'0d
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
