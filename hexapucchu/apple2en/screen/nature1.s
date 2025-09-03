*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

NATURE1	@LOAD	#pNATURE1

	stz	T
	
NATURE1_60	@SHOWPIC

	lda	T
	cmp	#19+1
	bcc	NATURE1_LOOP
	lda	#1
	sta	T

NATURE1_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	NATURE1_110
	cmp	#'2'
	beq	NATURE1_120
	cmp	#'3'
	beq	NATURE1_200
	cmp	#'4'
	beq	NATURE1_300
	cmp	#'5'
	beq	NATURE1_2000
	cmp	#'6'
	beq	NATURE1_400
	bne	NATURE1_LOOP

NATURE1_110	jmp	NATURE2

NATURE1_120	jmp	ENVIRONS

NATURE1_200	@PRINT	#nature1_str200
	@INKEY
	jmp	NATURE1_60

NATURE1_300	@PRINT	#nature1_str300
	@INKEY
	jmp	NATURE1_60

NATURE1_400	@PRINT	#nature1_str400
	@INKEY
	jmp	NATURE1_60

NATURE1_2000	lda	T
	bne	NATURE1_2100

	@PRINT	#nature1_str2000
	jmp	NATURE1_2150

NATURE1_2100	@PRINT	#nature1_strheader

	lda	T
	dec
	asl
	tax
	lda	tblT,x
	jsr	PRINT

NATURE1_2150	inc	T
	@PRINT	#nature1_strfooter
	@INKEY
	jmp	NATURE1_60

*---

pNATURE1	strl	'@/data/nature1'

T	ds	2

tblT	da	nature1_str2200
	da	nature1_str2300
	da	nature1_str2400
	da	nature1_str2500
	da	nature1_str2600
	da	nature1_str2700
	da	nature1_str2800
	da	nature1_str2900
	da	nature1_str3000
	da	nature1_str3100
	da	nature1_str3200
	da	nature1_str3300
	da	nature1_str3400
	da	nature1_str3500
	da	nature1_str3600
	da	nature1_str3700
	da	nature1_str3800
	da	nature1_str3900
	da	nature1_str4000

nature1_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'With all the grace of a clumsy cat'0d
	asc	'on a waxed floor, you charge ahead,'0d
	asc	'ready to tame these stubborn rocks.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Alas... each rock you try to climb'0d
	asc	'decides to live its own life:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'It slips, it rolls, it ignores you.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You climb a bit, slip twice as much,'0d
	asc	'and land flat in the grass with the'0d
	asc	'grace of an oyster on a slide...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Nice try though, really.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You look over the field around you.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The grass bends softly in the breeze'0d
	asc	'framed by dense plants that seem'0d
	asc	'ready to throw you a silent challenge.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'To the left, the Inca statue gives'0d
	asc	'a rather unfriendly grimace, as if'0d
	asc	'jealously keeping its secrets...'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'To the right, a cave entrance is'0d
	asc	'blocked by an unstable rockfall,'0d
	asc	'making entry impossible...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'              ... for now.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You attack the pile of rocks like'0d
	asc	'an eager young archaeologist...'0d
	asc	'or a child hunting a treasure'0d
	asc	'buried long ago by their dog.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You flip, shift, stack, examine...'0d
	asc	'to finally uncover a heart-shaped'0d
	asc	'stone, a slimy slug, and an empty nut.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'A good lesson in expectations,'0d
	asc	'that'27's for sure.'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD

nature1_str2000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Talking to a statue in the field?'0d
	asc	'A genius idea, just after brushing'0d
	asc	'a rock'27's teeth or teaching salsa'0d
	asc	'to a compass.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You stand before the statue,'0d
	asc	'using your most solemn tone:'0d
	dfb	ePEN,3
	asc	''0d
	asc	'O great spirit of stone, speak!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Against all odds, the statue'0d
	asc	'mutters in a rocky voice:'0d
	dfb	ePEN,3
	asc	''0d
	asc	22'Ah, another nutcase!'0d
	asc	'Haven'27't chatted in ages! Go on,'0d
	asc	'I have so much to share.'220d
	dfb	ePEN,2
	asc	''0d
	asc	'A chat with the statue might'0d
	asc	'not be that dumb after all...'0d
	dfb	eEOD

nature1_str2200	asc	'Watch out, behind you!'0d
	asc	'...Ha, you jumped so high!'0d
	dfb	eEOD

nature1_str2300	asc	'Your shoes are awful.'0d
	asc	'There, I said it.'0d
	dfb	eEOD

nature1_str2400	asc	'You smell like a human...'0d
	asc	'And sunscreen...'0d
	dfb	eEOD

nature1_str2500	asc	'Want a clue?'0d
	asc	'Ask my cousin, the pebble.'0d
	dfb	eEOD

nature1_str2600	asc	'Frozen for 1000 years, yet'0d
	asc	'I still look less stiff than you.'0d
	dfb	eEOD

nature1_str2700	asc	'I chew flint!'0d
	dfb	eEOD

nature1_str2800	asc	'Here'27's a secret:'0d
	asc	'I'27'm chattier than your ex.'0d
	dfb	eEOD

nature1_str2900	asc	'My hobby: standing still.'0d
	asc	'Yours? Struggling...'0d
	dfb	eEOD

nature1_str3000	asc	'I saw empires fall.'0d
	asc	'You trip over rocks...'0d
	dfb	eEOD

nature1_str3100	asc	'Lightning obeys me!'0d
	dfb	eEOD

nature1_str3200	asc	'I survived the Inca empire,'0d
	asc	'and Spanish conquest too.'0d
	asc	'But not sure I will survive'0d
	asc	'your awkward sense of humor.'0d
	dfb	eEOD

nature1_str3300	asc	'I'27'm Inca.'0d
	asc	'You... you'27're a case.'0d
	dfb	eEOD

nature1_str3400	asc	'Your fate is written...'0d
	asc	'but I haven'27't read it.'0d
	dfb	eEOD

nature1_str3500	asc	'Even bears fear me!'0d
	dfb	eEOD

nature1_str3600	asc	'Incan potions bring visions,'0d
	asc	'sometimes even secret codes!'0d
	dfb	eEOD

nature1_str3700	asc	'Aztecs sacrificed people,'0d
	asc	'I sacrifice my peace for you.'0d
	dfb	eEOD

nature1_str3800	asc	'I'27'm not sulking...'0d
	asc	'I'27've got bad digestion.'0d
	dfb	eEOD

nature1_str3900	asc	'Want a selfie with me?'0d
	asc	'Come back 900 years ago,'0d
	asc	'I was trending back then.'0d
	dfb	eEOD

nature1_str4000	asc	'How about some poker?'0d
	asc	'I'27'm the queen of poker face!'0d
	dfb	eEOD
	
nature1_strheader
	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
*	dfb	eBORDER,0
	dfb	eLOCATE,6,9
	dfb	ePEN,1
	asc	'The statue replies:'0d
	dfb	ePEN,3
	dfb	eLOCATE,1,10
	asc	22	; heading "
	dfb	eEOD

nature1_strfooter
	asc	22	; trailing "
	dfb	ePEN,2
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
