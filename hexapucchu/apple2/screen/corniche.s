*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CORNICHE	@LOAD	#pCORNICHE
CORNICHE_60	@SHOWPIC
CORNICHE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CORNICHE_200
	cmp	#'2'
	beq	CORNICHE_200
	cmp	#'3'
	beq	CORNICHE_200
	cmp	#'4'
	beq	CORNICHE_200
	cmp	#'5'
	beq	CORNICHE_300
	cmp	#'6'
	beq	CORNICHE_400
	cmp	#'7'
	beq	CORNICHE_500
	cmp	#'8'
	beq	CORNICHE_600
	cmp	#'9'
	beq	CORNICHE_700
	bne	CORNICHE_LOOP	

CORNICHE_200	@PRINT	#corniche_str200
	@INKEY
	jmp	CORNICHE_60

CORNICHE_300	@PRINT	#corniche_str300
	@INKEY
	jmp	CORNICHE_60

CORNICHE_400	@PRINT	#corniche_str400
	@INKEY
	jmp	CORNICHE_60

CORNICHE_500	@PRINT	#corniche_str500
	@INKEY
	jmp	CORNICHE_60

CORNICHE_600	@PRINT	#corniche_str600
	@INKEY
	jmp	MORT

CORNICHE_700	@PRINT	#corniche_str700
CORNICHE_750	@PRINT	#corniche_str750
	@INKEY
	cmp	#'O'
	beq	CORNICHE_800
	cmp	#'N'
	beq	CORNICHE_760
CORNICHE_760	jmp	CORNICHE_60

CORNICHE_800	@PRINT	#corniche_str800
	@INKEY
	jmp	ENVIRONS
*---

pCORNICHE	strl	'@/data/corniche'

corniche_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous tentez de vous frayer un chemin...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'... mais la jungle vous rit au nez.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Chaque branche bloque votre passage,'0d
	asc	'tel un videur de bo'94'te de nuit.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous poussez un buisson,'0d
	asc	'il vous repousse.'0d
	asc	''0d
	asc	'Vous tentez de casser une liane,'0d
	asc	'elle vous claque au visage.'0d
	asc	''0d
	dfb	ePEN,2
	asc	'La jungle a gagn'8e0d
	asc	'Elle vous garde en otage...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Verdict :'0d
	asc	''0d
	asc	'Vous restez coinc'8e' ici,'0d
	asc	'en VIP du '22'Club V'8e'g'8e'tation'220d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous jetez un oeil autour de vous :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Des arbres, des foug'8f'res, des lianes.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bravo Sherlock,'0d
	asc	'vous '90'tes officiellement au milieu'0d
	asc	'd'27'une jungle !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Rien de surprenant, en somme...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Si ce n'27'est que votre brushing'0d
	asc	'a d'8e'clar'8e' forfait il y a dix m'8f'tres.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Si vous avez un manuel intitul'8e0d
	asc	22'Comment survivre dans un saladier XXL'220d
	asc	'c'27'est le moment de le consulter...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous tentez l'27'ascension.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Deux m'8f'tres plus haut,'0d
	asc	'une branche vous fouette la joue.'0d
	asc	''0d
	asc	'Trois m'8f'tres,'0d
	asc	'une grenouille vous juge...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Apr'8f's 12 secondes d'27'efforts h'8e'ro'95'ques,'0d
	asc	'vos bras envoient un message clair :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'            '22' SANS NOUS '220d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous redescendez,'0d
	asc	'plus vite que vous '90'tes mont'8e0d
	asc	'tremp'8e' de sueur et de regrets.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous criez si fort que Tarzan'0d
	asc	'lui-m'90'me aurait honte pour vous.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'R'8e'sultat :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un perroquet r'8e'p'8f'te vos supplications'0d
	asc	'... en boucle.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'C'22'est officiel :'0d
	asc	'M'90'me la faune se fout de vous.'0d
	asc	''0d
	asc	'Et bien s'9e'r, '8D'a n'27'a servi'0d
	asc	'absolument '88' rien.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous allongez,'0d
	asc	'savourant le calme tropical.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Le chant des oiseaux,'0d
	asc	'l'27'air ti'8f'de... un vrai moment d'8e'tente.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Votre matelas semble par ailleurs'0d
	asc	8e'tonnamment confortable...'0d
	asc	'... jusqu'27''88' ce qu'27'il se mette '88' onduler.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mauvaise surprise :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous venez de piquer la place'0d
	asc	'd'27'un anaconda en pleine sieste digestive'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Il se r'8e'veille, furieux,'0d
	asc	'et devinez quoi ?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous '90'tes son brunch.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous escaladez l'27'arbre avec toute la'0d
	asc	'dignit'8e' d'27' koala bourr'8e'.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Apr'8f's quelques r'89'les, '8e'corchures'0d
	asc	'et un d'8e'but de d'8e'pression musculaire,'0d
	asc	'vous atteignez le sommet.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'L'88', vous d'8e'couvrez une corde tendue !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une tyrolienne improvis'8e'e faite de'0d
	asc	'lianes, qui crie :'0d
	asc	''0d
	dfb	ePEN,3
	asc	'      '22' Accident de la jungle '220d
	dfb	ePEN,1
	asc	''0d
	asc	'                  '88' des kilom'8f'tres...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mais bon, qui n'27'imerait pas'0d
	asc	'un peu d'27'adr'8e'naline avant de mourir ?'0d
	dfb	eEOD

corniche_str750	dfb	ePEN,3
	dfb	eLOCATE,2,22
	asc	'Utilisez-vous la tyrolienne (O/N) 'a5
	dfb	eEOD

corniche_str800	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous vous agrippez '88' la liane,'0d
	asc	'inspirez un grand coup...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Et c'27'est parti !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous fendez l'27'air comme une fus'8e'e,'0d
	asc	'les cheveux (ou ce qu'27'il en reste)'0d
	asc	'en apesanteur.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Ca va vite, tr'8f's vite.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez '88' peine le temps'0d
	asc	'de regretter toutes vos d'8e'cisions'0d
	asc	'de vie avant d'27'apercevoir le sol.'0d
	asc	''0d
	asc	'Atterrisage tout en finesse...'0d
	asc	'comme un frigo qu'27'on jette d'27' avion.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Mais atterissage quand m'90'me !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
