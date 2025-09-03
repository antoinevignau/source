*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE2	@LOAD	#pGROTTE2
GROTTE2_60	@SHOWPIC
GROTTE2_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	GROTTE2_110
	cmp	#'2'
	beq	GROTTE2_200
	cmp	#'3'
	beq	GROTTE2_130
	cmp	#'4'
	beq	GROTTE2_300
	cmp	#'5'
	beq	GROTTE2_600
	cmp	#'6'
	beq	GROTTE2_400
	cmp	#'7'
	beq	GROTTE2_500
	bne	GROTTE2_LOOP

GROTTE2_110	jmp	GROTTE3

GROTTE2_130	jmp	GROTTE1

GROTTE2_200	@PRINT	#grotte2_str200
	@INKEY
	jmp	MORT

GROTTE2_300	@PRINT	#grotte2_str300
	@INKEY
	jmp	GROTTE2_60

GROTTE2_400	@PRINT	#grotte2_str400
	@INKEY
	jmp	GROTTE2_60

GROTTE2_500	@PRINT	#grotte2_str500
	@INKEY
	jmp	GROTTE2_60

GROTTE2_600	@PRINT	#grotte2_str600
	@INKEY
	jmp	GROTTE2_60

*---

pGROTTE2	strl	'@/data/grotte2'

grotte2_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Eyes fixed on the ceiling, you'0d
	asc	'scan the stalactites in case one'0d
	asc	'might fall as you'27're passing'0d
	asc	'under the NORTHERN vault.'0d
	dfb	ePEN,3
	asc	0d
	asc	'Suddenly, your foot hits a'0d
	asc	'treacherous stalagmite!'0d
	dfb	ePEN,2
	asc	0d
	asc	'You are delicately impaled,'0d
	asc	'like a skewer offered to the'0d
	asc	'Inca gods.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Indeed, the real danger wasn'27't'0d
	asc	'up there...'0d
	dfb	ePEN,2
	asc	0d
	asc	'        But right under your feet!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'The echo gives back a PLOP each'0d
	asc	'step, as if the cave itself'0d
	asc	'were clapping your curiosity.'0d
	dfb	ePEN,2
	asc	0d
	asc	'To the west, an old staircase'0d
	asc	'cut into the rock climbs up to'0d
	asc	'the upper floor (no railing,'0d
	asc	'of course).'0d
	dfb	ePEN,3
	asc	0d
	asc	'To the NORTH, a vault bristling'0d
	asc	'with stalactites seems to shout:'0d
	asc	'       '22'Come stab yourself here!'220d
	dfb	ePEN,2
	asc	0d
	asc	'And that ladder to the EAST,'0d
	asc	'heroically trying to reach a'0d
	asc	'ledge where a stone wall'0d
	asc	'obviously wants attention...'0d
	dfb	ePEN,2
	asc	0d
	asc	'Conclusion:'0d
	dfb	ePEN,1
	asc	0d
	asc	'The place is as welcoming as an'0d
	asc	'escape room made by a sadistic mason.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Dig? Seriously?'0d
	dfb	ePEN,3
	asc	0d
	asc	'Still that obsession with'0d
	asc	'messing with the ground?'0d
	dfb	ePEN,1
	asc	0d
	asc	'Where does it come from?'0d
	asc	'A trauma with a sandbox'0d
	asc	'badly stored?'0d
	asc	'A repressed archaeologist urge?'0d
	dfb	ePEN,2
	asc	0d
	asc	'Want to talk about it?'0d
	asc	'No? Great!'0d
	dfb	ePEN,1
	asc	0d
	asc	'Because the cave has nothing to say.'0d
	asc	0d
	asc	'Nor does the rock.'0d
	asc	0d
	asc	'Not even a worm to chat with.'0d
	dfb	ePEN,4
	asc	0d
	asc	'In short, you find nothing.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You rise up, arms in the air,'0d
	asc	'possessed gaze, and solemnly say:'0d
	dfb	ePEN,3
	asc	0d
	asc	22'O ancestral spirit of this cave,'0d
	asc	'show yourself!'220d
	dfb	ePEN,2
	asc	0d
	asc	'A solemn silence settles in.'0d
	asc	'No mystic light,'0d
	asc	'no voice from the depths,'0d
	asc	'not even a dramatic breeze.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Just a dripping sound that'0d
	asc	'seems to mark your failure.'0d
	dfb	ePEN,2
	asc	0d
	asc	'       Plop... Plop... Plop...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Congrats. You just summoned'0d
	asc	'the age-old indifference of'0d
	asc	'a damp rock.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte2_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You dash toward the ladder!'0d
	dfb	ePEN,2
	asc	0d
	asc	'Alas... barely do you lift your foot'0d
	asc	'toward the first rung when'0d
	asc	'you realize:'0d
	dfb	ePEN,3
	asc	0d
	asc	'It'27's too short.'0d
	asc	'Way too short.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Unless you'27're the short one.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Hard to say, but if you ever'0d
	asc	'lost a fight to a stool,'0d
	asc	'maybe think about it...'0d
	dfb	ePEN,1
	asc	0d
	asc	'You jump, groan, sigh.'0d
	asc	'Nothing works:'0d
	dfb	ePEN,3
	asc	0d
	asc	'The ladder mocks you from its'0d
	asc	'ledge, like a perched star'0d
	asc	'refusing autographs.'0d
	dfb	ePEN,1
	asc	'In short, you'27're stuck below,'0d
	asc	'and the ladder seems'0d
	asc	'perfectly fine with it.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
