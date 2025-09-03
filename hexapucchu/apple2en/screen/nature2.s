*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

NATURE2	@LOAD	#pNATURE2

	stz	L

NATURE2_60	@SHOWPIC
NATURE2_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	NATURE2_200
	cmp	#'2'
	beq	NATURE2_400
	cmp	#'3'
	beq	NATURE2_600
	cmp	#'4'
	beq	NATURE2_700
	cmp	#'5'
	beq	NATURE2_900
	bne	NATURE2_LOOP

NATURE2_200	lda	L
	bne	NATURE2_300
	
	@PRINT	#nature2_str200
	@INKEY
	jmp	NATURE2_60

NATURE2_300	@PRINT	#nature2_str300
	@INKEY
	jmp	NATURE2_60

NATURE2_400	lda	L
	bne	NATURE2_500
	
	@PRINT	#nature2_str400
	@INKEY
	jmp	MORT

NATURE2_500	@PRINT	#nature2_str500
	@INKEY
	jmp	NATURE1

NATURE2_600	@PRINT	#nature2_str600
	@INKEY
	jmp	NATURE2_60

NATURE2_700	@PRINT	#nature2_str700
	@INKEY
	jmp	MORT

NATURE2_900	@PRINT	#nature2_str900
	@INKEY
	
	lda	#1
	sta	L
	
	jmp	NATURE2_60


*---

pNATURE2	strl	'@/data/nature2'

L	ds	2

nature2_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'You squint your eyes,'0d
	asc	'you stick out your tongue,'0d
	asc	'you get closer...'0d
	asc	''0d
	asc	'You even try the technique'0d
	asc	'of rapid blinking.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'... but nothing.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Written smaller than'0d
	asc	'an insurance contract!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You'27'd need a magnifying glass,'0d
	asc	'or eagle sight.'0d
	asc	''0d
	asc	'Spoiler: you'27're not an eagle.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You give up:'0d
	asc	'No way you'27'll lose'0d
	asc	'two tenths per eye for this!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'The carvings are ridiculously tiny.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'But with your brand new magnifier,'0d
	asc	'miracle:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'  the sacred signs appear!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'      G-A-F-F-C : 56423'0d
	dfb	ePEN,2
	asc	''0d
	asc	'What is that?!?'0d
	asc	''0d
	asc	'A lullaby for sleepless llamas?'0d
	asc	'A playlist for sun dancing?'0d
	asc	'Or a lost hit from the Andes?'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Who knows...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You turn back'0d
	asc	'when a small light on a leaf'0d
	asc	'catches your eye.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Curious like a cat,'0d
	asc	'you lean closer.'0d
	asc	'But it'27's really tiny.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You decide to grab it'0d
	asc	'to take a closer look.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Bad idea:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'It'27's a Phoneutria Nigriventer'0d
	asc	'the most venomous spider.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You offered your hand,'0d
	asc	'and it offers... death.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'This wouldn'27't have happened'0d
	asc	'if you'27'd used a magnifier first!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Just saying. Your call.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str500	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'On your way, your enhanced vision'0d
	asc	'from the glass spots a tiny'0d
	asc	'hairy shape.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'     A Phoneutria Nigriventer!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'If you didn'27't know yet, this fancy'0d
	asc	'spider name means:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'     Game Over in three minutes!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'But thanks to your wisdom,'0d
	dfb	ePEN,2
	asc	'and mostly your magnifier,'0d
	dfb	ePEN,1
	asc	'you dodge it and head South,'0d
	asc	'alive and proud.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'PS: You put the magnifier back'0d
	asc	'where you found it. Might help'0d
	asc	'some lost adventurer like you...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You dive under the arch'0d
	asc	'lift some stones,'0d
	asc	'inspect the cracks...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'...Nothing.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'No relic, no trap.'0d
	asc	''0d
	asc	'Not even a Pokemon card'0d
	asc	'forgotten by a conquistador.'0d
	asc	''0d
	asc	'Nothing. Nada.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Expected a treasure?'0d
	asc	''0d
	asc	'Wrong call: Indiana Jones'0d
	asc	'is 3 km to the North.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You push the leaves aside'0d
	asc	'with admirable courage and...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You face a snake'0d
	asc	'that bites before you can'0d
	asc	'type '22'Snake Antidote'22' into Google.'0d
	dfb	eLOCATE,7,6
	dfb	ePEN,2
	asc	'Snake Antidote'0d
	dfb	ePEN,2
	dfb	eLOCATE,1,9	
	asc	'Your vision blurs,'0d
	asc	'your legs get weak...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'And you realize maybe, bushes'0d
	asc	'aren'27't your thing.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The story ends here.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature2_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'After moving enough rocks'0d
	asc	'to build an Inca wall,'0d
	asc	'you find... A MAGNIFYING GLASS!'0d
	dfb	eLOCATE,20,3
	dfb	ePEN,4
	asc	'A MAGNIFYING GLASS'0d
	dfb	ePEN,2
	asc	''0d
	asc	'An item as thrilling as a dictionary,'0d
	asc	'but it could save your life.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Turns out,'0d
	asc	'moles hide treasures too.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Thanks to the Indiana Jones'0d
	asc	'of cataracts who left it here.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
