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
	asc	'Cinq orifices qui s'27'illuminent en'0d
	asc	'rouge, bleu ou vert selon vos'0d
	asc	'manipulations.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Vous avez d'8e'j'88' vu '8d'a quelque part...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais oui ! Cela vous revient !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un bon vieux Mastermind,'0d
	asc	'        ... version sacrifice humain.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une intuition vous souffle que la'0d
	asc	'bonne combinaison d'8e'verrouillera'0d
	asc	'un passage secret.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Mais... combien d'27'essais avant'0d
	asc	'la mal'8e'diction ?'0d
	dfb	ePEN,2
	asc	'Si vous avez trouv'8e' un indice'0d
	asc	'durant votre aventure, je pense que'0d
	asc	'c'27'est le moment de vous en servir !'0d
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
	asc	'Vous vous jetez sur la porte'0d
	asc	'avec la conviction d'27'un h'8e'ros'0d
	asc	'de film d'27'action !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'... et rebondissez comme une cr'8f'pe sur'0d
	asc	'une po'90'le en fonte.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'La porte ? M'90'me pas une '8e'gratin'8e'e.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous ? Une c'99'te l'8e'g'8f'rement froiss'8e'e'0d
	asc	'et l'278e'go en miettes.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Bref, la porte reste close...'0d
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
	asc	'Vous choisissez le passage '88' l'27'Ouest'0d
	asc	'persuda'8e' que la gloire se cache'0d
	asc	'toujours '88' gauche.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Quelques pas plus loin...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Clic !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Oh, ce doux son qui annonce'0d
	asc	'un m'8e'canisme ancestral !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Soudain, des lances jaillissent'0d
	asc	'des murs avec la pr'8e'cision d'27'un'0d
	asc	'chef '8e'toil'8e' dressant ses plates.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous tentez d'27'esquiver... rat'8e'.'0d
	dfb	ePEN,2
	asc	'Votre aventure se termine en'0d
	asc	'brochette humaine.'0d
	asc	'Au moins, c'27'est exotique.'0d
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
	asc	'Ding-Dong !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Tous les orifices s'27'illuminent comme'0d
	asc	'un sapin de No'91'l sous acide !'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Vous avez entr'8e' la bonne combinaison !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un bruit sourd retentit et la porte'0d
	asc	'au SUD glisse avec '8e'l'8e'gance...'0d
	dfb	ePEN,1
	asc	''0d
	asc	'ou en tout cas, avec autant d'278e'l'8e'gance'0d
	asc	'qu'27'une tonne de granite peut avoir.'0d
	dfb	ePEN,3
	asc	''0d
	asc	'La voie est libre !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD
