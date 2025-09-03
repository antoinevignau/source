*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

SAUT	@LOAD	#pSAUT
SAUT_60	@SHOWPIC
SAUT_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	SAUT_110
	cmp	#'2'
	beq	SAUT_120
	cmp	#'3'
	beq	SAUT_130
	cmp	#'4'
	beq	SAUT_200
	cmp	#'5'
	beq	SAUT_300
	cmp	#'6'
	beq	SAUT_400
	cmp	#'7'
	beq	SAUT_500
	bne	SAUT_LOOP	

SAUT_110	jmp	GROTTE2

SAUT_120	jmp	INCA1

SAUT_130	jmp	ORIFICES

SAUT_200	@PRINT	#saut_str200
	@INKEY
	jmp	SAUT_60

SAUT_300	@PRINT	#saut_str300
	@INKEY
	jmp	SAUT_60

SAUT_400	@PRINT	#saut_str400
	@INKEY
	jmp	SAUT_60

SAUT_500	@PRINT	#saut_str500
	@INKEY
	jmp	SAUT_60

*---

pSAUT	strl	'@/data/saut'

saut_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You squint, frown, and strike'0d
	asc	'the serious pose of someone at'0d
	asc	'an ancient geology oral exam.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Gold, iron oxide, cobalt oxide...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nope, not an energy smoothie'0d
	asc	'recipe, but a wall packed'0d
	asc	'with minerals.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'With so much magnetic matter,'0d
	asc	'you could almost store'0d
	asc	'a thousand-year-old secret...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'...or maybe some precious data,'0d
	asc	'on the sly.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

saut_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Like a bargain-bin Arsene Lupin,'0d
	asc	'you steal a crystal with flair.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'One more tacky gem for your shelf,'0d
	asc	'right next to the golden resin'0d
	asc	'bust of David Hasselhoff'0d
	asc	'you secretly worship.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But a cold sweat runs down your spine:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'What if it'27's kryptonite?!?!!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Then you relax...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'No danger.'0d
	asc	'You'27're about as SUPER'0d
	asc	'as a Monday morning.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

saut_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You pull out your ancient phone'0d
	asc	'and pose with your best angle'0d
	asc	'in front of this old wall.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'             CLICK! FLASH!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'And then... miracle! The light'0d
	asc	'from the crystals gives you'0d
	asc	'a radioactive yet flattering glow.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A little '22'epic mist'22' filter later,'0d
	asc	'and you'27've got the perfect pic...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'...until you zoom in'0d
	asc	'and notice, just behind you,'0d
	asc	'a lizard sticking out its tongue'0d
	asc	'with smug elegance.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Congrats. You'27've just snapped'0d
	asc	'the first ever '22'geoselfie bombed'0d
	asc	'by a snarky reptile.'220d
	dfb	ePEN,1
	asc	''0d
	asc	'Instagram isn'27't ready. Neither are you.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

saut_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You'27've got a flair for drama...'0d
	asc	'...or maybe just recklessness.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The ledge, bumpy and unstable,'0d
	asc	'is no dance floor, but no matter:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You step back, arms semi-graceful,'0d
	asc	'eyes to the sky... and launch'0d
	asc	'into a bold moonwalk.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Result: half a slip,'0d
	asc	'a knee twist one could call creative,'0d
	asc	'and a final pose'0d
	asc	'clinging to the wall with'0d
	asc	'the grace of a llama caught'0d
	asc	'in an avalanche.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A lizard watches you.'0d
	asc	'He'27's torn between admiration'0d
	asc	'...and denunciation to the police.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

