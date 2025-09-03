*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ROUAGE	@LOAD	#pROUAGE
ROUAGE_60	@SHOWPIC
ROUAGE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	ROUAGE_200
	cmp	#'2'
	beq	ROUAGE_300
	cmp	#'3'
	beq	ROUAGE_400
	cmp	#'4'
	beq	ROUAGE_500
	cmp	#'5'
	beq	ROUAGE_100
	bne	ROUAGE_LOOP

ROUAGE_100	jmp	ENVIRONS

ROUAGE_200	@PRINT	#rouage_str200
	@INKEY
	jmp	ROUAGE_60

ROUAGE_300	@PRINT	#rouage_str300
	@INKEY
	jmp	ROUAGE_60

ROUAGE_400	@PRINT	#rouage_str400
	@INKEY
	jmp	MORT

ROUAGE_500	@PRINT	#rouage_str500
	@INKEY
	jmp	MORT

*---

pROUAGE	strl	'@/data/rouage'

rouage_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'The artefact looks like an old'0d
	asc	'Inca cog, carved in stone with'0d
	asc	'disturbing precision.'0d
	dfb	ePEN,2
	asc	0d
	asc	'It has ten teeth,'0d
	asc	'weighs about 800 grams,'0d
	asc	'and its center shows the stern'0d
	asc	'face of a forgotten god...'0d
	dfb	ePEN,1
	asc	0d
	asc	'On the back, an engraved text'0d
	asc	'catches your attention:'0d
	dfb	ePEN,3
	asc	0d
	asc	'    Retriquay, Ignoru o Cansalco.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Strange...'0d
	asc	0d
	asc	'These words sound familiar...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Hey, do you think you'27're Aladdin?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'This is no magic lamp,'0d
	asc	'but an old Inca gear!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Wrong story, my friend!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Yet as you rub it hard,'0d
	asc	'fine magnetic dust starts to'0d
	asc	'shine under the sunlight.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'As if the stone still whispered'0d
	asc	'some ancient secrets...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You dip the cog in seawater,'0d
	asc	'hoping to uncover more secrets.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But the salt starts to attack'0d
	asc	'the old stone insidiously.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Suddenly, a deep rumble'0d
	asc	'echoes through the cave...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A crack appears, and water'0d
	asc	'seeps into a hidden mechanism.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The cog spins wildly,'0d
	asc	'triggering a chain reaction'0d
	asc	'that swallows you'0d
	asc	'in a merciless torrent...'0d
	dfb	ePEN,3
	asc	'Your adventure ends here.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD

rouage_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You shake the cog like a maraca,'0d
	asc	'convinced it will reveal a clue.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bad idea:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A rattling sound follows,'0d
	asc	'then a worrying click...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Congrats, you'27've just triggered'0d
	asc	'the Inca-style self-destruct!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You only have time to think:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'     Why the heck did I shake?!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'...Before being turned into'0d
	asc	'     ...archaeological dust!'0d
	dfb	ePEN,3
	asc	'        End of the adventure!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER '
	dfb	eEOD
