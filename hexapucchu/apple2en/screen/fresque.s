*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

FRESQUE	@LOAD	#pFRESQUE
FRESQUE_60	@SHOWPIC
FRESQUE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	FRESQUE_120
	jmp	PIANO
FRESQUE_120	cmp	#'2'
	beq	FRESQUE_200
	cmp	#'3'
	beq	FRESQUE_300
	cmp	#'4'
	beq	FRESQUE_400
	cmp	#'5'
	beq	FRESQUE_500
	bne	FRESQUE_LOOP	

FRESQUE_200	@PRINT	#fresque_str200
	@INKEY
	jmp	FRESQUE_60

FRESQUE_300	@PRINT	#fresque_str300
	@INKEY
	jmp	MORT

FRESQUE_400	@PRINT	#fresque_str400
	@INKEY
	jmp	FRESQUE_60

FRESQUE_500	@PRINT	#fresque_str500
	@INKEY
	@PRINT	#fresque_str560
	@INKEY
	jmp	FRESQUE_60

*---

pFRESQUE	strl	'@/data/fresque'

fresque_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You pull out your phone,'0d
	asc	'frame the shot, and click...'0d
	asc	'Memory saved!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You post it on Insta with the caption:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Inca art? Sci-fi? Boom boom?'0d
	asc	''0d
	asc	22' #MillennialMystery #2BarsLeft '220d
	dfb	ePEN,2
	asc	''0d
	asc	'And now you wait for likes...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Even deep inside an Inca temple,'0d
	asc	'the algorithm never sleeps.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You press your ear to the'0d
	asc	'cold stone, hoping to hear something.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'An ancient voice?'0d
	asc	''0d
	asc	'The whisper of the Ancients?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nothing...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But suddenly, a sharp pain:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A small scorpion was right at'0d
	asc	'that spot.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'He said nothing either, but'0d
	asc	'he clearly told you to leave...'0d
	asc	'Feet first!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Feeling lonely, are we?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'You caress the fresco with the care'0d
	asc	'of a cave painting expert...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But nothing happens.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'No thrill, no whisper,'0d
	asc	'not even a stone sigh.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'At least you tried to bond'0d
	asc	'with the rock.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'That'27's something, right?'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'The walls are covered with'0d
	asc	'a massive fresco carved in stone.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The shapes are simple, stylized,'0d
	asc	'but carved with eerie precision.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'To the left: a man with'0d
	asc	'a solemn and powerful gaze.'0d
	asc	''0d
*	asc	'La date 1984 est grav'8e' juste au dessous.'0d
	asc	'The year 1984 is engraved below.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'To his right, a strange angular'0d
	asc	'object... could it be... a computer!!!'0d
	asc	''0d
	asc	'The year 984 is carved below'0d
	asc	'this curious figure.'0d
	dfb	ePEN,3
	dfb	eLOCATE,21,16
	asc	'ordinateur'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

fresque_str560	dfb	eCLS
	dfb	ePEN,3
	asc	''0d
	asc	'Farther along, a tortured shape'0d
	asc	'evokes a nuclear mushroom cloud,'0d
	asc	'frozen in time.'0d
	asc	''0d
	asc	'The year 2028 is carved beneath'0d
	asc	'this apocalyptic symbol.'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'What does this strange fresco mean?'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'A warning? A prophecy?'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
