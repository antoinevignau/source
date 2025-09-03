*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ENVIRONS	@LOAD	#pENVIRONS
ENVIRONS_60	@SHOWPIC
ENVIRONS_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	ENVIRONS_120
	jmp	JUNGLE
ENVIRONS_120	cmp	#'2'
	bne	ENVIRONS_130
	jmp	NATURE1
ENVIRONS_130	cmp	#'3'
	bne	ENVIRONS_140
	jmp	CASCADE
ENVIRONS_140	cmp	#'4'
	beq	ENVIRONS_200
	cmp	#'5'
	beq	ENVIRONS_300
	cmp	#'6'
	beq	ENVIRONS_400
	cmp	#'7'
	beq	ENVIRONS_500
	bne	ENVIRONS_LOOP

ENVIRONS_200	@PRINT	#environs_str200
	@INKEY
	jmp	ENVIRONS_60
	
ENVIRONS_300	@PRINT	#environs_str300
	@INKEY
	jmp	ENVIRONS_60
	
ENVIRONS_400	@PRINT	#environs_str400
	@INKEY
	jmp	ENVIRONS_60

ENVIRONS_500	@PRINT	#environs_str500
	@INKEY
	jmp	MORT
	
*---

pENVIRONS	strl	'@/data/environs'

environs_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'To the WEST, a path leads into a'0d
	asc	'thick, green, lush and creepy jungle.'0d
	dfb	ePEN,2
	asc	0d
	asc	'To the NORTH, a trail goes to a field'0d
	asc	'so peaceful, it seems too good'0d
	asc	'to be true.'0d
	dfb	ePEN,1
	asc	0d
	asc	'To the EAST, a steep path climbs'0d
	asc	'toward the mountain, hidden in'0d
	asc	'ominous fog.'0d
	dfb	ePEN,3
	asc	0d
	asc	'Hard to choose... each direction'0d
	asc	'looks even more welcoming'0d
	asc	'than the last, right?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Sandcastles were fun, now it'27's'0d
	asc	'time for a treehouse?'0d
	dfb	ePEN,2
	asc	0d
	asc	'You'27're such a child, really!"'0d
	dfb	ePEN,1
	asc	0d
	asc	'You start stacking branches...'0d
	dfb	ePEN,2
	asc	0d
	asc	'After 3 hours,'0d
	asc	'you'27've created a true piece'0d
	asc	'of modern art, titled:'0d
	dfb	ePEN,3
	asc	0d
	asc	'    '22'Pile of sticks falling over'220d
	dfb	ePEN,1
	asc	0d
	asc	'Bravo, architect.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Totally useless, except for'0d
	asc	'collecting splinters'0d
	asc	'and wasting your energy.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You think digging solves'0d
	asc	'all your problems?'0d
	dfb	ePEN,3
	asc	0d
	asc	0d
	asc	'Newsflash: life ain'27't Minecraft!'0d
	dfb	ePEN,2
	asc	0d
	asc	'Just because you found'0d
	asc	'a gear once doesn'27't mean'0d
	asc	'the ground is a magic thrift shop.'0d
	dfb	ePEN,3
	asc	0d
	asc	'Here, all you get are blisters.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Okay,'0d
	asc	'time to pull it together,'0d
	asc	'Mr. Weekend Boulder Dash.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

environs_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Ah yes, classic plan B: go home.'0d
	dfb	ePEN,3
	asc	0d
	asc	'The coward'27's plan, clearly.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Fine...'0d
	dfb	ePEN,1
	asc	0d
	asc	'You rush to the airport, gear'0d
	asc	'in hand, and board the first'0d
	asc	'flight home to France.'0d
	dfb	ePEN,3
	asc	0d
	asc	'Problem:'0d
	dfb	ePEN,2
	asc	0d
	asc	'During the flight,'0d
	asc	'your Incan relic scrambles'0d
	asc	'the instruments...'0d
	dfb	ePEN,1
	asc	0d
	asc	'Result?'0d
	asc	0d
	asc	'A direct dive towards the sea.'0d
	asc	'No miles earned,'0d
	asc	'but a lovely drowning instead.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
