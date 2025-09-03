*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE3	@LOAD	#pGROTTE3
GROTTE3_60	@SHOWPIC
GROTTE3_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE3_120
	jmp	GROTTE3_700
GROTTE3_120	cmp	#'2'
	bne	GROTTE3_130
	jmp	GROTTE4
GROTTE3_130	cmp	#'3'
	bne	GROTTE3_140
	jmp	GROTTE2
GROTTE3_140	cmp	#'4'
	beq	GROTTE3_200
	cmp	#'5'
	beq	GROTTE3_300
	cmp	#'6'
	beq	GROTTE3_400
	cmp	#'7'
	beq	GROTTE3_500
	cmp	#'8'
	beq	GROTTE3_600
	bne	GROTTE3_LOOP

GROTTE3_200	@PRINT	#grotte3_str200
	@INKEY
	jmp	GROTTE3_60

GROTTE3_300	@PRINT	#grotte3_str300
	@INKEY
	jmp	MORT

GROTTE3_400	@PRINT	#grotte3_str400
	@INKEY
	jmp	GROTTE3_60

GROTTE3_500	@PRINT	#grotte3_str500
	@INKEY
	jmp	MORT

GROTTE3_600	@PRINT	#grotte3_str600
	@INKEY
	jmp	GROTTE3_60

GROTTE3_700	@PRINT	#grotte3_str700
	@INKEY
	jmp	NATURE1

*---

pGROTTE3	strl	'@/data/grotte3'

grotte3_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	dfb	ePEN,3
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You bravely bite the loaf'0d
	asc	'and your teeth are the first to'0d
	asc	'explode!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The bread stays intact.'0d
	asc	'Your ego crumbles like'0d
	asc	'a soggy biscuit.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You unknowingly trigger a prophecy:'0d
	dfb	ePEN,1
	asc	''0d
	asc	'He who bites the Bread of Time'0d
	asc	'will only get shame and'0d
	asc	'ancient pain.'0d
	asc	''0d
	asc	'Pathetic.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You put the loaf back...'0d
	asc	'while planning your future'0d
	asc	'dental appointment.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You uncork the vial...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A scent of fermented cactus'0d
	asc	'tickles your nose.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You swallow...'0d
	asc	'and trip into a technicolor dream!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Flashes of colors follow:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'    Green, red, blue, black, green'0d
	dfb	ePEN,2
	asc	''0d
	asc	'When you come back to yourself,'0d
	asc	'you'27're soaked, shivering,'0d
	asc	'convinced the rock has a sense'0d
	asc	'of humor...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'I don'27't know what that was...'0d
	asc	'But that was some good stuff!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You go for the banana,'0d
	asc	'mummified since the golden age'0d
	asc	'of human sacrifices.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'One bite... and BAM!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your tongue swells like a balloon,'0d
	asc	'your eyes go wild, and you wiggle'0d
	asc	'like a possessed puppet before'0d
	asc	'ending up asphyxiated on the cold'0d
	asc	'cave floor.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Moral of the story:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The Inca banana'0d
	asc	'is not your totem fruit.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Game Over!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You whistle a cheerful tune.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nothing happens...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Except a distant stalactite'0d
	asc	'that seems to roll its eyes.'0d
	dfb	ePEN,3
	asc	''0d
	asc	''0d
	asc	'At least you livened up the cave.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte3_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You head WEST.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'No sooner have you crossed the threshold'0d
	asc	'that the ground, weakened by ages,'0d
	asc	'gives way beneath your feet.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You fall several meters'0d
	asc	'down a narrow rocky passage...'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'After a chaotic descent,'0d
	asc	'you land outside the cave,'0d
	asc	'in the middle of nature.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
