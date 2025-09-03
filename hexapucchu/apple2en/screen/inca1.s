*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

INCA1	@LOAD	#pINCA1
	
	stz	SUD
	
INCA1_60	@MODE	#0
	@SHOWPIC

	stz	VAR_A
	stz	VAR_B
	stz	VAR_C
	stz	VAR_D
	stz	VAR_E

	@INK	#0;#0
	@PEN	#0
	@LOCATE	#3;#12
	@COUT160	#143
	@LOCATE	#5;#12
	@COUT160	#143
	@LOCATE	#7;#12
	@COUT160	#143
	@LOCATE	#9;#12
	@COUT160	#143
	@LOCATE	#11;#12
	@COUT160	#143

	@INK	#1;#6
	@INK	#2;#2
	@INK	#3;#18
	
INCA1_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	beq	INCA1_200
	cmp	#'2'
	beq	INCA1_300
	cmp	#'3'
	beq	INCA1_400
	cmp	#'4'
	beq	INCA1_500
	cmp	#'5'
	beq	INCA1_600
	cmp	#'6'
	beq	INCA1_700
	cmp	#'7'
	beq	INCA1_170
	cmp	#'8'
	beq	INCA1_800
	cmp	#'9'
	bne	INCA1_LOOP	
	jmp	INCA1_2000

INCA1_170	jmp	PIANO

INCA1_200	lda	#0
	bra	INCA1_1000

INCA1_300	lda	#1
	bra	INCA1_1000

INCA1_400	lda	#2
	bra	INCA1_1000

INCA1_500	lda	#3
	bra	INCA1_1000

INCA1_600	lda	#4
	bra	INCA1_1000

INCA1_700	@PRINT	#inca1_str700
	@INKEY
	jmp	INCA1_60

INCA1_800	lda	SUD
	beq	INCA1_900
	jmp	SAUT

INCA1_900	@PRINT	#inca1_str900
	@INKEY
	jmp	INCA1_60
	
INCA1_1000	asl
	tay		; n = A * 2
	phy
	
	lda	VAR_A,y	; n+=1
	inc
	and	#3	; 0..3
	sta	VAR_A,y

	ldx	#1	; SOUND 1,n
	lda	inca1_sound,y
	tay
	jsr	SOUND

	ply
	phy

	ldx	inca1_locate,y	; LOCATE n,12
	ldy	#12
	jsr	LOCATE
	
	ply
	lda	VAR_A,y
	jsr	PEN	; PEN n
	@COUT	#$A5

*--- The real 1000

	lda	VAR_A
	cmp	#3
	bne	INCA1_1020
	lda	VAR_B
	cmp	#1
	bne	INCA1_1020
	lda	VAR_C
	cmp	#2
	bne	INCA1_1020
	lda	VAR_D
	cmp	#0
	bne	INCA1_1020
	lda	VAR_E
	cmp	#3
	bne	INCA1_1020

	@SOUND	#1;#50;#0
	@SOUND	#1;#100;#0
	@SOUND	#1;#150;#0
	@SOUND	#1;#200;#0
	@SOUND	#1;#250;#0
	@SOUND	#1;#300;#0
	jmp	INCA1_3000
	
INCA1_1020	jmp	INCA1_LOOP

INCA1_2000	@PRINT	#inca1_str2000
	@INKEY
	jmp	MORT

INCA1_3000	@PRINT	#inca1_str3000
	@INKEY

	lda	#1
	sta	SUD
	jmp	INCA1_60

*---

pINCA1	strl	'@/data/inca1'

VAR_A	ds	2
VAR_B	ds	2
VAR_C	ds	2
VAR_D	ds	2
VAR_E	ds	2
SUD	ds	2

inca1_locate
	dw	3,5,7,9,11
inca1_sound	dw	100,120,140,160,180

inca1_str700	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,2
	asc	'Five orifices light up in'0d
	asc	'red, blue or green depending on'0d
	asc	'your manipulations.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'You'27've seen this somewhere before...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Yes! It'27's coming back to you!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'An old Mastermind game,'0d
	asc	'      ... human sacrifice version.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A hunch tells you the right'0d
	asc	'combination will unlock'0d
	asc	'a secret passage.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'But... how many tries before'0d
	asc	'the curse strikes?'0d
	dfb	ePEN,2
	asc	''0d
	asc	'If you found a clue on your adventure,'0d
	asc	'now is the time to use it!'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

inca1_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,2
	asc	'You throw yourself against the'0d
	asc	'door with an action hero'27's'0d
	asc	'conviction!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'...and bounce like a crepe on'0d
	asc	'a cast-iron pan.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The door? Not a scratch.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'You? A bruised rib and'0d
	asc	'your ego in pieces.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Anyway, the door stays closed...'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

inca1_str2000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,2
	asc	'You choose the West passage,'0d
	asc	'convinced glory hides'0d
	asc	'always on the left.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'A few steps ahead...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Click!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Oh, that sweet sound that'0d
	asc	'announces an ancient mechanism!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Suddenly, spears shoot'0d
	asc	'from the walls with the'0d
	asc	'precision of a master chef.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You try to dodge... fail.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Your adventure ends as human kebab.'0d
	asc	'At least it'27's exotic.'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

inca1_str3000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,3
	asc	'Ding-Dong!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'All orifices light up like'0d
	asc	'a Christmas tree on acid!'0d
	dfb	ePEN,3
	asc	''0d
	asc	'You entered the right code!'0d
	dfb	ePEN,2
	asc	''0d
	asc	'A dull noise sounds and the South'0d
	asc	'door slides open with elegance...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'or at least as elegant as a ton'0d
	asc	'of granite can be.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'The way is clear!'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
