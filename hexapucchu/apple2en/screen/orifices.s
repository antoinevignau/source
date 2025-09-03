*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

ORIFICES	@LOAD	#pORIFICES
ORIFICES_60	@SHOWPIC
ORIFICES_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	ORIFICES_200
	cmp	#'2'
	beq	ORIFICES_200
	cmp	#'3'
	beq	ORIFICES_200
	cmp	#'4'
	beq	ORIFICES_300
	cmp	#'5'
	bne	ORIFICES_160
	jmp	SAUT
ORIFICES_160	cmp	#'6'
	beq	ORIFICES_400
	bne	ORIFICES_LOOP	

ORIFICES_200	@PRINT	#orifices_str200
	@INKEY
	jmp	MORT

ORIFICES_300	@PRINT	#orifices_str300
	@INKEY
	jmp	CPC

ORIFICES_400	@PRINT	#orifices_str400
	@INKEY
	jmp	ORIFICES_60

*---

pORIFICES	strl	'@/data/orifices'

orifices_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You insert the gear'0d
	asc	'into the orifice...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLACK!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A dry sound,'0d
	asc	'then a sinister hissing.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'The gear shoots out like a'0d
	asc	'boomerang, cuts through air'0d
	asc	'like a kamikaze pigeon,'0d
	asc	'and hits right between your eyes.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You barely have time to think:'0d
	dfb	ePEN,1
	asc	'Damn! I should'27've made a better'0d
	asc	'choice or worn safety glasses!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Then everything goes black.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

orifices_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You slide the gear'0d
	asc	'into the slot with 10 notches,'0d
	asc	'the exact number of teeth'0d
	asc	'on the artefact.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'After a promising click,'0d
	asc	'the gear starts spinning'0d
	asc	'in its housing.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A stone turns and... SURPRISE!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'An old computer appears!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'No, you'27're not dreaming.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

orifices_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You examine the orifices.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Above each one, you notice'0d
	asc	'notches in various numbers.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Is it a code? An adornment?'0d
	asc	'Or how many times the Incas'0d
	asc	'lost at Minesweeper?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'It must refer to the gear.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Its weight? Its age?'0d
	asc	'Its number of teeth?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Whatever it is,'0d
	asc	'you must choose wisely...'0d
	asc	''0d
	asc	'...or pray really hard!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

