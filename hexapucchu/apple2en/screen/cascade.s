*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CASCADE	@LOAD	#pCASCADE
CASCADE_60	@SHOWPIC
CASCADE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CASCADE_100
	cmp	#'2'
	beq	CASCADE_300
	cmp	#'3'
	beq	CASCADE_400
	cmp	#'4'
	beq	CASCADE_500
	cmp	#'5'
	beq	CASCADE_600
	cmp	#'6'
	beq	CASCADE_700
	bne	CASCADE_LOOP

CASCADE_100	jmp	ENVIRONS

CASCADE_300	@PRINT	#cascade_str300
	@INKEY
	jmp	CASCADE_60

CASCADE_400	@PRINT	#cascade_str400
	@INKEY
	jmp	MORT

CASCADE_500	@PRINT	#cascade_str500
	@INKEY
	jmp	CASCADE_60

CASCADE_600	@PRINT	#cascade_str600
	@INKEY
	jmp	CASCADE_60

CASCADE_700	@PRINT	#cascade_str700
CASCADE_750	@PRINT	#cascade_str750
	@INKEY
	pha
	dec	theLOCATEX
	jsr	GOTOXY
	lda	1,s
	jsr	COUT
	
	pla
	cmp	#'N'
	beq	CASCADE_770
	
	cmp	#'Y'
	bne	CASCADE_750

CASCADE_760	jmp	GROTTE1

CASCADE_770	jmp	CASCADE

*---

pCASCADE	strl	'@/data/cascade'

cascade_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You climb, and climb...'0d
	asc	0d'and...'0d
	asc	0d'And still climb...'0d
	dfb	ePEN,2
	asc	0d'...well, in your head.'0d
	dfb	ePEN,3
	asc	0d'In truth, you'27've been stuck'0d
	asc	'on the same rock for 10 mins,'0d
	asc	'sweaty and gasping.'0d
	dfb	ePEN,1
	asc	0d'Exhausted, you give up, going'0d
	asc	'back down the might 1,5 meters'0d
	asc	'you had painfully climbed...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You dip your hands in icy water'0d
	asc	'and gulp it down greedily.'0d
	dfb	ePEN,2
	asc	0d'Delicious...'0d
	dfb	ePEN,3
	asc	0d
	asc	'...until your stomach throws'0d
	asc	'a full-on rave party.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Looks like this water held more'0d
	asc	'bacteria than a shared'0d
	asc	'computer keyboard.'0d
	dfb	ePEN,3
	asc	0d
	asc	'You give up the ghost in pain'0d
	asc	'and intestinal despair.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You shape your fingers like'0d
	asc	'hooks and wait...'0d
	dfb	ePEN,3
	asc	0d
	asc	'Patiently... very patiently.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Ten minutes later,'0d
	asc	'a fish swims up,'0d
	asc	'stares at you like it knows'0d
	asc	'a terrible secret, then leaves.'0d
	dfb	ePEN,1
	asc	0d
	asc	'Intriguing.'0d
	dfb	ePEN,2
	asc	0d
	asc	'Two hours later, success!'0d
	asc	'You catch... some seaweed...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
cascade_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,3
	asc	'SPLASH!'0d
	dfb	ePEN,1
	asc	0d
	asc	'You dive like you know how to swim'0d
	dfb	ePEN,3
	asc	0d
	asc	'...except you don'27't.'0d
	dfb	ePEN,2
	asc	0d
	asc	'The icy water grabs you, your'0d
	asc	'organs resign one by one...'0d
	asc	'but you SURVIVE!'0d
	dfb	eLOCATE,21,9
	dfb	ePEN,1
	asc	'SURVIVE'0d
	asc	0d
	asc	'Soaked, frozen, and cleaner'0d
	asc	'than a lab'27's cleanroom.'0d
	dfb	ePEN,3
	asc	0d
	asc	'By the way,'0d
	asc	'you thought you saw a weird'0d
	asc	'glow under the waterfall...'0d
	dfb	ePEN,2
	asc	'But your chattering teeth'0d
	asc	'drown out any thought.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

cascade_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You really think there'27's a path'0d
	asc	'behind the waterfall?'0d
	dfb	ePEN,2
	asc	0d
	asc	'A bit too clich'8e', no?'0d
	dfb	ePEN,1
	asc	0d
	asc	'But filled with hope and a good'0d
	asc	'dose of wishful thinking, you take'0d
	asc	'the small, slippery stone path'0d
	asc	'leading behind the water curtain.'0d
	dfb	ePEN,3
	asc	0d'And then... A MIRACLE!!!'0d
	dfb	ePEN,2
	asc	0d
	asc	'A secret opening reveals'0d
	asc	'the entrance to a cave to the EAST!'0d
	asc	''
	dfb	eEOD

cascade_str750	dfb	ePEN,3
	dfb	eLOCATE,5,22
	asc	'Will you enter it (Y/N) 'a5
	dfb	eEOD
