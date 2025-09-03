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
	asc	'You run your hands over the stones,'0d
	asc	'scratching, checking each gap'0d
	asc	'with the care of a house fairy'0d
	asc	'in full cleaning frenzy.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Verdict:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A nice thick layer of dust!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      - thanks for the allergy -'0d
	dfb	ePEN,2
	asc	''0d
	asc	'One odd detail:'0d
	asc	'a spot where the stone'0d
	asc	'looks way more worn out...'0d
	asc	'As if it had been moved.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'So,'0d
	asc	'happy to scrub an Inca wall?'0d
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
	asc	'To your great surprise,'0d
	asc	'the hanging stones'0d
	asc	'don'27't come crashing'0d
	asc	'onto your shiny skull.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'They slowly go down,'0d
	asc	'acting as counterweights.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A stone wall section'0d
	asc	'slides upward,'0d
	asc	'revealing a path to the EAST.'0d
	dfb	eLOCATE,28,11
	dfb	ePEN,1
	asc	'EAST'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Without wasting a second,'0d
	asc	'you slip right through'0d
	asc	'before it closes again.'0d
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
	asc	'You carefully observe'0d
	asc	'the mechanism:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A lever connects'0d
	asc	'to huge heavy stones,'0d
	asc	'hanging from the ceiling'0d
	asc	'by an ingenious system'0d
	asc	'of pulleys.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Let'27's be honest,'0d
	asc	'it doesn'27't feel very safe.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Fine craftsmanship,'0d
	asc	'signed by the ancient Incas,'0d
	asc	'without a doubt!'0d
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
	asc	'Honestly,'0d
	asc	'it was kind of obvious, no?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You never once thought:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'What if these giant stones'0d
	asc	'drop right on my head'0d
	asc	'as I walk under them?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'No? Really?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Well... you should have.'0d
	asc	''0d
	asc	'Because that is EXACTLY'0d
	asc	'what just happened.'0d
	dfb	ePEN,3
	dfb	eLOCATE,17,14
	asc	'EXACTLY'0d
	dfb	eLOCATE,1,17
	asc	'You are dead,'0d
	asc	'flattened like a pancake.'0d
	asc	'One could almost serve you'0d
	asc	'with some sugar.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
