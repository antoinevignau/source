*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

POULIE	@LOAD	#pPOULIE
POULIE_60	@SHOWPIC
POULIE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	POULIE_200
	cmp	#'2'
	beq	POULIE_300
	cmp	#'3'
	beq	POULIE_400
	cmp	#'4'
	beq	POULIE_500
	cmp	#'5'
	bne	POULIE_140
	jmp	TROU
POULIE_140	cmp	#'6'
	bne	POULIE_LOOP
	jmp	GROTTE5

POULIE_200	@PRINT	#poulie_str200
	@INKEY
	jmp	POULIE_60

POULIE_300	@PRINT	#poulie_str300
	@INKEY
	jmp	PIANO

POULIE_400	@PRINT	#poulie_str400
	@INKEY
	jmp	POULIE_60

POULIE_500	@PRINT	#poulie_str500
	@INKEY
	jmp	MORT

*---

pPOULIE	strl	'@/data/poulie'

poulie_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous passez vos mains sur les pierres,'0d
	asc	'grattez, fouillez chaque interstice'0d
	asc	'avec la minutie d'27'une f'8e'e du logis'0d
	asc	'en pleine crise de m'8e'nage.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Verdict :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Une belle '8e'paisseur de poussi'8f're !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      - merci pour l'27'allergie -'0d
	dfb	ePEN,2
	asc	''0d
	asc	'D'8e'tail intrigant,'0d
	asc	'vous rep'8e'rez une zone'0d
	asc	'o'9d' la pierre semble bien plus us'8e'e...'0d
	asc	'Comme si elle avait boug'8e'.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Alors,'0d
	asc	'heureux d'27'avoir astiqu'8e' un mur inca ?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

poulie_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'A votre grande surprise,'0d
	asc	'les pierres suspendues'0d
	asc	'ne s'278E'crasent pas'0d
	asc	'sur votre cr'89'ne brillant.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Elles descendent lentement,'0d
	asc	'jouant le r'99'le de contrepoids.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Un pan du mur de pierres,'0d
	asc	'glisse vers le haut,'0d
	asc	'r'8e'v'8e'lant une ouverture '88' l'27'EST.'0d
	dfb	eLOCATE,28,11
	dfb	ePEN,1
	asc	'EST'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Sans perdre une seconde,'0d
	asc	'vous vous y engrouffrez'0d
	asc	'avant qu'27'elle se referme.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

poulie_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Vous observez attentivement'0d
	asc	'le m'8e'canisme :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un levier reli'8e0d
	asc	88' d'27'imposantes pierres massives,'0d
	asc	'suspendues au plafond'0d
	asc	'par un ing'8e'nieux syst'8f'me'0d
	asc	'de poulies.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Il faut l'27'avouer,'0d
	asc	'cela n'27'inspire pas vraiment confiance.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'De la belle ouvrage,'0d
	asc	'sign'8e'e des anciens Incas,'0d
	asc	'sans le moindre doute !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

poulie_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Franchement,'0d
	asc	'c'278e'tait pourtant '8e'vident, non ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A aucun moment vous ne vous '90'tes dit :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Et si ces '8e'normes pierres suspendues'0d
	asc	'me tombent sur la tronche'0d
	asc	'quand je passe dessous ?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Non ? Vraiment ?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Eh bien... vous auriez d'9e0d
	asc	''0d
	asc	'Parce que c'27'est EXACTEMENT'0d
	asc	'ce qui vient d'27'arriver.'0d
	dfb	ePEN,3
	dfb	eLOCATE,17,14
	asc	'EXACTEMENT'0d
	dfb	eLOCATE,1,17
	asc	'Vous '90'tes mort,'0d
	asc	'aplati comme une cr'8f'pre bretonne.'0d
	asc	'On pourrait presque vous servir'0d
	asc	'avec du sucre.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
