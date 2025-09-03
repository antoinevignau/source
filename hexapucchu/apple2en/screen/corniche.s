*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

CORNICHE	@LOAD	#pCORNICHE
CORNICHE_60	@SHOWPIC
CORNICHE_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	CORNICHE_200
	cmp	#'2'
	beq	CORNICHE_200
	cmp	#'3'
	beq	CORNICHE_200
	cmp	#'4'
	beq	CORNICHE_200
	cmp	#'5'
	beq	CORNICHE_300
	cmp	#'6'
	beq	CORNICHE_400
	cmp	#'7'
	beq	CORNICHE_500
	cmp	#'8'
	beq	CORNICHE_600
	cmp	#'9'
	beq	CORNICHE_700
	bne	CORNICHE_LOOP	

CORNICHE_200	@PRINT	#corniche_str200
	@INKEY
	jmp	CORNICHE_60

CORNICHE_300	@PRINT	#corniche_str300
	@INKEY
	jmp	CORNICHE_60

CORNICHE_400	@PRINT	#corniche_str400
	@INKEY
	jmp	CORNICHE_60

CORNICHE_500	@PRINT	#corniche_str500
	@INKEY
	jmp	CORNICHE_60

CORNICHE_600	@PRINT	#corniche_str600
	@INKEY
	jmp	MORT

CORNICHE_700	@PRINT	#corniche_str700
CORNICHE_750	@PRINT	#corniche_str750
	@INKEY
	cmp	#'Y'
	beq	CORNICHE_800
	cmp	#'N'
	beq	CORNICHE_760
CORNICHE_760	jmp	CORNICHE_60

CORNICHE_800	@PRINT	#corniche_str800
	@INKEY
	jmp	ENVIRONS
*---

pCORNICHE	strl	'@/data/corniche'

corniche_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You try to make your way through...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'...but the jungle mocks you.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Every branch blocks you,'0d
	asc	'like a nightclub bouncer.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You push a bush -- it pushes back.'0d
	asc	'You try to break a vine --'0d
	asc	'it slaps your face.'0d
	asc	''0d
	asc	'The jungle wins.'0d
	asc	'It holds you hostage...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Verdict :'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You'27're stuck here, VIP guest of'0d
	asc	22'Club Vegetation'220d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You look around...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Trees, ferns, vines everywhere.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Well done, Sherlock.'0d
	asc	'You'27're officially in'0d
	asc	'the middle of a jungle!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Nothing surprising so far...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Except your hairstyle'0d
	asc	'quit ten meters ago.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'If you have a manual called'0d
	asc	22'How to Survive in a Giant Salad Bowl'220d
	asc	'now'27's the time to open it...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You try to climb up.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Two meters in, a branch'0d
	asc	'whips your cheek.'0d
	asc	''0d
	asc	'Three meters,'0d
	asc	'a frog stares at you...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'After 12 heroic seconds,'0d
	asc	'your arms send a clear message:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'           '22' WITHOUT US ! '220d
	dfb	ePEN,2
	asc	''0d
	asc	'You go back down faster'0d
	asc	'than you climbed,'0d
	asc	'soaked in sweat and regret.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You scream so loud Tarzan'0d
	asc	'would be ashamed of you.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Result:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A parrot repeats your cries'0d
	asc	'...on a loop.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'It'27's official:'0d
	asc	'Even the wildlife mocks you.'0d
	asc	''0d
	asc	'And of course, it achieved'0d
	asc	'absolutely nothing.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You lie down,'0d
	asc	'enjoying the tropical calm.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Birdsong, warm air...'0d
	asc	'A real peaceful moment.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Your mattress feels strangely'0d
	asc	'comfortable...'0d
	asc	'...until it starts to wiggle.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bad surprise.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You just stole the spot of'0d
	asc	'an anaconda napping and digesting.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'It wakes up angry, and guess what?'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You'27're its brunch.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

corniche_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You climb the tree with all the'0d
	asc	'grace of a drunk koala.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'After groans, scratches'0d
	asc	'and early muscle despair,'0d
	asc	'you reach the top.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'There, you spot a tight rope!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A makeshift zipline of vines'0d
	asc	'that screams '0d
	asc	''0d
	dfb	ePEN,3
	asc	'    '22' Jungle accident zone '220d
	dfb	ePEN,1
	asc	''0d
	asc	'             for miles...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'But hey, who doesn'27't like'0d
	asc	'a bit of thrill before death?'0d
	dfb	eEOD

corniche_str750	dfb	ePEN,3
	dfb	eLOCATE,2,22
	asc	'Use the zipline (Y/N) 'a5
	dfb	eEOD

corniche_str800	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You grab the vine,'0d
	asc	'take a deep breath...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'And here we go!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You slice through the air'0d
	asc	'like a rocket, hair (what'27's left)'0d
	asc	'floating in zero gravity.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You'27're going fast, really fast.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You barely have time'0d
	asc	'to regret your life choices'0d
	asc	'before spotting the ground.'0d
	asc	''0d
	asc	'A smooth landing...'0d
	asc	'like a fridge dropped from a plane.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But a landing nonetheless!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
