*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

TROU	@LOAD	#pTROU
TROU_60	@SHOWPIC
TROU_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	TROU_100
	jmp	POULIE
TROU_100	cmp	#'2'
	bne	TROU_110
	jmp	GROTTE4
TROU_110	cmp	#'3'
	beq	TROU_200
	cmp	#'4'
	beq	TROU_300
	cmp	#'5'
	beq	TROU_400
	cmp	#'6'
	beq	TROU_500
	bne	TROU_LOOP

TROU_200	@PRINT	#trou_str200
	@INKEY
	jmp	GROTTE1

TROU_300	@PRINT	#trou_str300
	@INKEY
	jmp	MORT

TROU_400	@PRINT	#trou_str400
	@INKEY
	jmp	TROU_60

TROU_500	@PRINT	#trou_str500
	@INKEY
	jmp	MORT

*---

pTROU	strl	'@/data/trou'

trou_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You lean over the hole'0d
	asc	'as if waiting for a miracle...'0d
	asc	''0d
	asc	'...and here it comes:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'             gravity!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your foot slips,'0d
	asc	'and here you go, launched'0d
	asc	'into a natural slide,'0d
	asc	'screaming non-human sounds.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'After a never-ending slide,'0d
	asc	'you land violently...'0d
	asc	'in the lower cave level.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Your TikTok choreography'0d
	asc	'was almost flawless...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Until your bouncy moves'0d
	asc	'triggered vibrations'0d
	asc	'that shook a big rock loose.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'SQUUUIRK!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You'27're now part of the floor...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Okay, you'27're whistling. Why not.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The echo bounces in the cave,'0d
	asc	'Once,'0d
	asc	'         twice...'0d
	asc	'                     three times.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Huh?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The third echo seems to'0d
	asc	'come from a hollow wall...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Or maybe it'27's just the'0d
	asc	'gaping hole in the floor!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'At least now we know'0d
	asc	'the hole is deep.'0d
	asc	'That'27's something!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

trou_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Like an athlete'0d
	asc	'ready to throw the discuss,'0d
	asc	'you take a run-up'0d
	asc	'and hurl the rock'0d
	asc	'with all your strength down the hole.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Let'27's say... not very far.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But enough to awaken'0d
	asc	'a whole army of bats'0d
	asc	'sleeping peacefully inside.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'They swarm at you'0d
	asc	'and drain all your blood.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Blood type B Positive:'0d
	asc	'their favourite menu!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
