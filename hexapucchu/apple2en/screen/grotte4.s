*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE4	@LOAD	#pGROTTE4
GROTTE4_60	@SHOWPIC
GROTTE4_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE4_120
	jmp	GROTTE3
GROTTE4_120	cmp	#'2'
	bne	GROTTE4_130
	jmp	TROU
GROTTE4_130	cmp	#'3'
	beq	GROTTE4_300
	cmp	#'4'
	beq	GROTTE4_400
	cmp	#'5'
	beq	GROTTE4_500
	cmp	#'6'
	beq	GROTTE4_600
	cmp	#'7'
	beq	GROTTE4_700
	bne	GROTTE4_LOOP

GROTTE4_300	@PRINT	#grotte4_str300
	@INKEY
	jmp	GROTTE4_60

GROTTE4_400	@PRINT	#grotte4_str400
	@INKEY
	jmp	GROTTE5

GROTTE4_500	@PRINT	#grotte4_str500
	@INKEY
	jmp	GROTTE4_60

GROTTE4_600	@PRINT	#grotte4_str600
	@INKEY
	jmp	MORT

GROTTE4_700	@PRINT	#grotte4_str700
	@INKEY
	jmp	GROTTE4_60

*---

pGROTTE4	strl	'@/data/grotte4'

grotte4_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You look closely at the place.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'This tunnel is not just a'0d
	asc	'simple corridor swept by wind.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The face carved in the NORTH wall'0d
	asc	'looks too detailed to be'0d
	asc	'just decoration.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Its nose sticks out oddly.'0d
	asc	'Maybe it'27's a clue.'0d
	asc	'Or just an Inca with a big nose.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Also, if you look well,'0d
	asc	'it seems to be sticking out its tongue.'0d
	dfb	ePEN,3
	asc	'This detail puzzles you.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A coded message?'0d
	asc	'A thousand-year-old joke?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Or just a playful sculptor'0d
	asc	'with too much time on hand?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Tired after three rocks and two'0d
	asc	'puddles?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You should really think about'0d
	asc	'joining a gym...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Sighing, you lean'0d
	asc	'against the wall to rest.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'When suddenly: CLICK! WHOOSH!!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your back just pressed right on the'0d
	asc	'statue'27's nose.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The wall starts to turn with an'0d
	asc	'ancient rumble.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You lose your balance, fall backward'0d
	asc	'and vanish into the shadows...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Direction: Mystery! But it'27's NORTH.'0d
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You face the carved face and,'0d
	asc	'in a burst of great maturity,'0d
	asc	'you stick out your tongue too.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Nothing happens...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Except a big moment of loneliness.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But who knows?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'Maybe somewhere,'0d
	asc	'in a parallel world,'0d
	asc	'another statue answers you...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,3
	asc	'         SESAME, OPEN UP!!!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Alas, this is neither the time,'0d
	asc	'nor the civilization,'0d
	asc	'nor the right voice...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your shout triggers an old'0d
	asc	'mechanism creaking to life.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A geyser of hot mud bursts'0d
	asc	'from the carved face'27's mouth!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You are now thoroughly covered'0d
	dfb	ePEN,3
	asc	''0d
	asc	'        ...and mostly very dead.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Last thoughts:'0d
	asc	''0d
	asc	'I knew I should have tried'0d
	asc	'ABRACADABRA...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte4_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You decide to pee,'0d
	asc	'with the determination and maturity'0d
	asc	'that define you.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'That is, aiming at the mouth'0d
	asc	'of the carved face in the wall...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Since you'27're here, might as well have'0d
	asc	'fun.'
	dfb	ePEN,3
	asc	''0d
	asc	'Surprise!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Your stream instantly turns into'0d
	asc	'a steam column on contact'0d
	asc	'with the wall opening!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Either you have pyrotechnic skills,'0d
	asc	'or a mysterious heat source'0d
	asc	'is boiling behind the wall.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

