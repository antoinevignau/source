*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

DISCO	@LOAD	#pDISCO

DISCO_60	@SHOWPIC
DISCO_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	DISCO_400
	cmp	#'2'
	beq	DISCO_300
	cmp	#'3'
	beq	DISCO_200
	cmp	#'4'
	bne	DISCO_126
	jmp	DISCO_600
DISCO_126	cmp	#'5'
	beq	DISCO_500
	bne	DISCO_LOOP

DISCO_200	@PRINT	#disco_str200
	@INKEY
	jmp	DISCO_60

DISCO_300	@PRINT	#disco_str300
	@INKEY
	jmp	DISCO_60

DISCO_400	@PRINT	#disco_str400
	@INKEY
	jmp	MORT

*---

DISCO_500	@PRINT	#disco_str500
	
	stz	disco_str	; clear answer
	stz	disco_str+1

	sep	#$20	; set default values
	lda	#'9'
	sta	disco_boum
	rep	#$20

	lda	#295
	sta	disco_sound
	
	jsr	DISCO_ENTER
	bcs	DISCO_520	; we lost
	jmp	DISCO_900	; we won

DISCO_520	@PRINT	#disco_str520
	@SOUND	#1;#100;#0
	lda	#150
	jsr	nowWAIT_ALT
	@PRINT	#disco_str540
	lda	#120
	jsr	nowWAIT_ALT
	@PRINT	#disco_str550
	@INKEY

	@CLS
	@INK	#3;#6

	ldx	#10
]lp	phx

	@PRINT	#disco_boum

	ldx	#1
	ldy	disco_sound
	lda	#60
	jsr	nowWAIT_ALT

	dec	disco_boum
	lda	disco_sound
	sec
	sbc	#5
	sta	disco_sound

	plx
	dex
	bne	]lp

	@PRINT	#disco_str580
	@SOUND	#1;#80;#200
	lda	#140
	jsr	nowWAIT_ALT
	@PRINT	#disco_str582
	@INKEY
	jmp	MORT
	
DISCO_600	@PRINT	#disco_str600
	@INKEY
	jmp	DISCO_60

DISCO_900	@PRINT	#disco_str900
	@INKEY
	jmp	EPILOGUE

*---

DISCO_ENTER	ldx	#0
]lp	phx
	@INKEY
	pha
	jsr	COUT
	pla
	plx
	cmp	#chrRET
	beq	DISCO_ENTER_1
	sep	#$20
	sta	disco_str,x
	rep	#$20
	inx
	cpx	#3
	bcc	]lp

DISCO_ENTER_1	ldx	#0
]lp	lda	disco_good,x	; check one entry
	beq	DISCO_ENTER_3
	cmp	disco_str
	bne	DISCO_ENTER_2
	lda	disco_good+1,x
	cmp	disco_str+1
	beq	DISCO_ENTER_4
DISCO_ENTER_2	inx		; next entry
	inx
	inx
	bne	]lp
DISCO_ENTER_3	sec		; bad answer
	rts
DISCO_ENTER_4	clc		; good answer
	rts

*---

disco_good	asc	'FF'00
	asc	' FF'
	asc	'F F'
	dfb	eEOD,eEOD

*---

pDISCO	strl	'@/data/disco'

disco_str	ds	3	; up to three characters
disco_boum	asc	'9'0d
	dfb	eEOD
disco_sound	ds	2

disco_str200	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'While analyzing hex codes,'0d
	asc	'a detail freezes you:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'the word     ,'0d
	asc	'followed by      and      .'0d
	dfb	eLOCATE,8,5
	dfb	ePEN,3
	dfb	eLOCATE,10,5
	asc	'BOOM'0d
	dfb	eLOCATE,13,6
	asc	'TIME'0d
	dfb	eLOCATE,22,6
	asc	'2 YEARS'
	dfb	ePEN,1
	dfb	eLOCATE,1,8
	asc	'Suddenly, it becomes clear:'0d
	asc	''0d
	asc	'It'27's a countdown to a disaster'0d
	asc	'planned by the Incas centuries ago'0d
	asc	''0d
	asc	'    ...ending in just two years!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'This must be stopped, or at least'0d
	asc	'delayed...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Do not mess this up!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str300	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You pull out your smartphone and'0d
	asc	'with a single bar of signal,'0d
	asc	'you load CPC-Power'27's website'0d
	asc	''0d
	asc	'         It reads:'0d
	dfb	ePEN,2
	asc	''0d
	asc	''0d
	asc	'CPC 464 RAM : 64 KB'0d
	asc	'Processor: Z80'0d
	asc	'Clock speed: 4 MHz'0d
	asc	'Palette colors: 27'0d
	dfb	ePEN,3
	asc	''0d
	asc	'High score in Gryzor: 999998'0d
	asc	''0d
	asc	'For 255 lives, replace XX with FF'0d
	asc	'in the sequence 3E XX 32'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Hardware sprites on CPC 6128: 00'0d
	asc	'Keyboard test: CALL &BB06'0d
	dfb	ePEN,1
	asc	''0d
	asc	'There must be something useful'0d
	asc	'in here somewhere!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str400	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'Seriously?'0d
	asc	'Pressing at random?'0d
	asc	''0d
	asc	'You probably type'0d
	asc	'your passwords like that too...'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Obviously, that wasn'27't'0d
	asc	'what the machine expected.'0d
	asc	''0d
	asc	'You only had one shot,'0d
	asc	'and you blew it...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'CLACK!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'The ceiling begins to lower...'0d
	asc	''0d
	asc	'fast,'0d
	asc	'     heavy,'0d
	asc	'           unstoppable.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Game over, weekend hacker!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str500	dfb	eMODE,2
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,26
	dfb	eINK,5,26	; for 640-dithered
	dfb	eINK,9,26	; "
	dfb	eINK,13,26	; "
	dfb	eLOCATE,26,12
	dfb	ePEN,1
	asc	'Enter your value: '0d
	dfb	eEOD

disco_str520	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,8
	dfb	ePEN,1
	asc	'You confirm the value...'0d
	asc	'The screen flashes.'0d
	dfb	eEOD

disco_str540	dfb	ePEN,3
	asc	''0d
	asc	''0d
	asc	'  FATAL ERROR: INVALID COMMAND'0d
	dfb	eEOD

disco_str550	dfb	ePEN,2
	asc	''0d
	asc	''0d	
	asc	'The computer emits a sharp beep,'0d
	asc	'then displays a worrying sequence.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
disco_str580	asc	''0d
	asc	''0d
	asc	'                 BOOM !!!'0d
	dfb	eEOD

disco_str582	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'A massive explosion erases the place'0d
	asc	'from the map!'0d
	asc	''0d
	asc	'Too bad... you were so close...'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
	
disco_str600	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	dfb	ePEN,1
	asc	'You panic like a pro:'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Sweat, screams,'0d
	asc	'even a little fear dance.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'After five full minutes,'0d
	asc	'you realize it changed'0d
	asc	'absolutely nothing...'0d
	asc	'except your dignity.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Come on, pull yourself together!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

disco_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eLOCATE,1,1
	asc	'            Well played!'0d
	dfb	ePEN,1
	asc	''0d
	asc	''0d
	asc	'By replacing the value with FF'0d
	asc	'(that'27's 255 in decimal),'0d
	asc	'you delay the countdown!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Humanity just earned 255 more years!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You can now leave this place'0d
	asc	'with a light heart,'0d
	asc	'and a sense of duty done!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
