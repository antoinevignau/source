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
	asc	'You look around,'0d
	asc	'hoping to find a clue...'0d
	asc	'or a phone charger'0d
	asc	'forgotten by another tourist.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nothing like that, just plants,'0d
	asc	'a huge palm tree,'0d
	dfb	ePEN,3
	asc	''0d
	asc	'and a promise of bites in series.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Yet,'0d
	asc	'you have the strange feeling'0d
	asc	'this jungle whispers a secret...'0d
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
	asc	'You shake the palm tree'0d
	asc	'with the enthusiasm'0d
	asc	'of a Sunday athlete.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bad plan: CRACK... SPLASH!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A coconut falls, aims your head'0d
	asc	'and lands a perfect strike.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The palms just won this round.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Score: Nature 1 - Tourist 0'0d
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
	asc	'You take out your knife'0d
	asc	'and proudly start carving'0d
	asc	'your name...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But surprise:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'someone passed before you!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'On the bark, you read:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'10 teeth, less than a crocodile'0d
	dfb	ePEN,1
	asc	''0d
	asc	'And it'27's signed: A.M.S.'0d
	asc	''0d
	asc	'Weird...'0d
	asc	''0d
	asc	'Maybe it'27's good'0d
	asc	'to remember this info.'0d
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
	asc	'You lift the leaves...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'            ERROR!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A squadron of tiger mosquitoes'0d
	asc	'appears, helmets on,'0d
	asc	'walkie-talkies buzzing.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'- Visual target confirmed,'0d
	asc	'  let'27's drain it!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'They charge you in Delta formation,'0d
	asc	'sucking your blood like a Capri-Sun.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Last vision:'0d
	asc	'A mosquito saluting you,'0d
	asc	'standing at attention.'0d
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
	asc	'You make your way'0d
	asc	'towards the north.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Well, you try...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The plants are so dense'0d
	asc	'they look like a Black Friday line.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You push, you force...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'SCHLACK!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A vine detaches,'0d
	asc	'wraps around your neck,'0d
	asc	'and hoists you up'0d
	asc	'like a ham on sale.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nature, sometimes, is not cool...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
