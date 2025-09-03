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
	asc	'You lie down peacefully'0d
	asc	'on the warm sand, ready'0d
	asc	'to enjoy the Peruvian sun.'0d
	dfb	ePEN,2
	asc	0d
	asc	'The sound of waves soothes your mind.'0d
	dfb	ePEN,1
	asc	0d
	asc	'You close your eyes, savoring'0d
	asc	'this moment of pure rest.'0d
	dfb	ePEN,3
	asc	0d
	asc	''0d
	asc	'But the burning sun shows no mercy.'0d
	asc	'Heat slowly drains your strength.'0d
	asc	'Thirst grips you, then all blurs...'0d
	asc	'...until total darkness.'0d
	dfb	ePEN,2
	asc	0d
	asc	'They'27'll find you later,'0d
	asc	'more roasted than an old sausage'0d
	asc	'left on the barbecue...'0d
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
	asc	'The water shimmers in the sun,'0d
	asc	'and you can'27't resist the call'0d
	asc	'of freshness.'0d
	dfb	ePEN,2
	asc	0d
	asc	'You run, take a big leap...'0d
	asc	'SPLASH! The shock is brutal:'0d
	dfb	ePEN,3
	asc	0d
	asc	'Your sun-heated body hits'0d
	asc	'the icy ocean.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Your heart dislikes the surprise.'0d
	asc	'A freezing jolt runs'0d
	asc	'through your veins.'0d
	asc	'Everything stops. No more beating.'0d
	asc	'Nothing left...'0d
	dfb	ePEN,2
	asc	0d
	asc	'The waves cradle you one last'0d
	asc	'time, a fatal caress.'0d
	asc	'They say you were pulled out'0d
	asc	'with a frozen smile, as if'0d
	asc	'happy with your quick dive...'0d
	asc	'...into the beyond!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
