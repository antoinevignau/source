*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

PLAGE	@LOAD	#pPLAGE
PLAGE_60	@SHOWPIC
PLAGE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	PLAGE_300
	cmp	#'2'
	beq	PLAGE_100
	cmp	#'3'
	beq	PLAGE_200
	bne	PLAGE_LOOP

PLAGE_100	jmp	ROUAGE

PLAGE_200	@PRINT	#plage_str200
	@INKEY
	jmp	MORT

PLAGE_300	@PRINT	#plage_str300
	@INKEY
	jmp	MORT

*---

pPLAGE	strl	'@/data/plage'

plage_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous vous allongez tranquillement'0d
	asc	'sur le sable chaud, bien d'8e'cid'8e0d
	asc	88' profiter du soleil p'8e'ruvien.'0d
	dfb	ePEN,2
	asc	0d'Le bruit des vagues berce votre esprit.'0d
	dfb	ePEN,1
	asc	0d'Vous fermez les yeux, savourant'0d
	asc	'ce moment de d'8e'tente.'0d
	dfb	ePEN,3
	asc	0d'Mais l'27'astre br'9e'lant ne vous fait aucun cadeau. '
	asc	'Peu '88' peu, la chaleur vous vide de vos forces. '
	asc	'La soif vous tenaille,'0d
	asc	'puis le monde devient flou...'0d
	asc	'jusqu'27'au noir complet.'0d
	dfb	ePEN,2
	asc	0d'On vous retrouvera plus tard,'0d
	asc	'plus grill'8e' qu'27'une vieille merguez'0d
	asc	'oubli'8e'e sur un barbecue...'
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
plage_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'L'27'eau scintille sous le soleil,'0d
	asc	'et vous ne r'8e'sistez pas '88' l'27'appel'0d
	asc	'de la fra'94'cheur.'0d
	dfb	ePEN,2
	asc	0d'Vous courez, prenez votre '8e'lan...'0d
	asc	'SPLASH ! Le choc est brutal :'0d
	dfb	ePEN,3
	asc	0d'Votre corps, chauff'8e' '88' blanc, rencontre'0d
	asc	'l'27'oc'8e'an gla'8d8e'.'0d
	dfb	ePEN,1
	asc	0d'Votre coeur n'27'appr'8e'cie pas la surprise.'0d
	asc	'Une d'8e'charge gla'8d'iale parcourt'0d
	asc	'vos veines.'0d
	asc	'Tout s'27'arr'90'te. Plus de battement.'0d
	asc	'Plus rien...'0d
	dfb	ePEN,2
	asc	0d'Les vagues vous ber'8d'ent une derni'8f're'0d
	asc	'fois, comme une caresse fatale.'0d
	asc	'On racontre qu'27'on vous a rep'90'ch'8e' avec    '
	asc	'un sourire fig'8e', comme si vous '8e'tiez'0d
	asc	'ravi de votre plongeon express...'0d
	asc	'...vers l'27'au-del'880d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
