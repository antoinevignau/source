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
	asc	'You leave the cavern,'0d
	asc	'convinced all is well.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Error!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The statue,'0d
	asc	'clearly no fan of goodbyes,'0d
	asc	'shoots an arrow in your back.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The poison takes effect:'0d
	asc	'this is your last journey.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Moral of the story'0d
	asc	'Never turn your back on art.'0d
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
	asc	'Watching the statue,'0d
	asc	'you find a hole...'0d
	asc	'right where'0d
	asc	'an Inca might blush.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'And beneath the grimacing face,'0d
	asc	'a base worn smooth by time.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'It looks like it can turn.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The floor, polished by ages,'0d
	asc	'shows the statue'0d
	asc	'was long honored'0d
	asc	'with sacred offerings.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Four passages remain,'0d
	asc	'each toward a cardinal point.'0d
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
	asc	'You brace yourself,'0d
	asc	'and push with all your might...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'GROOONC...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The statue slowly turns'0d
	asc	'with a sinister creak.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A click, then silence.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A mechanism seems disarmed!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You finally breathe.'0d
	asc	''0d
	asc	'Well...'0d
	asc	'As long as you'27're here,'0d
	asc	'smile at it: it loves that.'0d
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
	asc	'You try to talk:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Weather, soccer, politics...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Nothing.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Then you try a joke:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'What utensil did the Aztecs invent?'0d
	asc	''0d
	asc	'....the Aztec knife!!!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Nothing.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The steak knife, duh!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Still nothing...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Not even a stone smile.'0d
	asc	'Tough crowd.'0d
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
	asc	'You kneel down,'0d
	asc	'hands clasped,'0d
	asc	'praying fervently...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A fly lands on your nose.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'This is the only divine sign'0d
	asc	'you receive today.'0d
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
	asc	'You take the west exit,'0d
	asc	'while cautiously backing up to keep'0d
	asc	'an eye on the deadly statue...'0d
	asc	'Just in case!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'One step, two steps...'0d
	dfb	ePEN,3
	asc	'... and suddenly, the void!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The steep ledge was'0d
	asc	'clearly not planned...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You topple, headfirst,'0d
	asc	'ready to kiss the rock...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But miracle:'0d
	dfb	ePEN,1
	asc	'the jungle welcomes you!'0d
	asc	'Dense vegetation softens your fall.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Ten meters below,'0d
	asc	'you get up unharmed,'0d
	asc	'surrounded by trees, ferns'0d
	asc	'... and hungry mosquitoes.'0d
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
