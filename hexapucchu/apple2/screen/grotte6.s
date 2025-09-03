*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

GROTTE6	@LOAD	#pGROTTE6
GROTTE6_60	@MODE	#0
	@SHOWPIC

	@INK	#1;#6
	@INK	#2;#2
	@INK	#3;#18
	@INK	#15;#6
	
	stz	VAR_A2
	stz	VAR_B2
	stz	VAR_C2
	stz	VAR_D2
	stz	VAR_E2
	stz	VAR_F2

GROTTE6_LOOP
GROTTE6_100	@INKEY
	@DEBUG
	cmp	#'1'
	bne	GROTTE6_120
	inc	VAR_A2
	@SOUND	#1;#100;#0
	jmp	GROTTE6_200
GROTTE6_120	cmp	#'2'
	bne	GROTTE6_130
	inc	VAR_B2
	@SOUND	#1;#120;#0
	jmp	GROTTE6_300
GROTTE6_130	cmp	#'3'
	bne	GROTTE6_140
	inc	VAR_C2
	@SOUND	#1;#140;#0
	jmp	GROTTE6_400
GROTTE6_140	cmp	#'4'
	bne	GROTTE6_150
	inc	VAR_D2
	@SOUND	#1;#160;#0
	jmp	GROTTE6_500
GROTTE6_150	cmp	#'5'
	bne	GROTTE6_160
	inc	VAR_E2
	@SOUND	#1;#180;#0
	jmp	GROTTE6_600
GROTTE6_160	cmp	#'6'
	bne	GROTTE6_170
	inc	VAR_F2
	@SOUND	#1;#220;#0
	jmp	GROTTE6_700
GROTTE6_170	cmp	#'7'
	bne	GROTTE6_180
	jmp	GROTTE6_800
GROTTE6_180	cmp	#'8'
	bne	GROTTE6_190
	jmp	GROTTE6_900
GROTTE6_190	cmp	#'9'
	bne	GROTTE6_195
	jmp	GROTTE5
GROTTE6_195	jmp	GROTTE6_LOOP

*---

GROTTE6_200	lda	VAR_A2
	cmp	#12+1
	bcc	GROTTE6_210
	lda	#1
	sta	VAR_A2

GROTTE6_210	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_220
	inc
	sta	VAR_A2
GROTTE6_220	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_230
	inc	VAR_A2

GROTTE6_230	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_240
	inc	VAR_B2
GROTTE6_240	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_250
	inc	VAR_B2

GROTTE6_250	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_260
	inc	VAR_C2
GROTTE6_260	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_270
	inc	VAR_C2

GROTTE6_270	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_280
	inc	VAR_D2
GROTTE6_280	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_290
	inc	VAR_D2

GROTTE6_290	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_291
	inc	VAR_E2
GROTTE6_291	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_292
	inc	VAR_E2

GROTTE6_292	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_293
	inc	VAR_F2
GROTTE6_293	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_294
	inc	VAR_F2

GROTTE6_294	@LOCATE	#8;#12
	@PEN	#1
	lda	VAR_A2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_300	lda	VAR_B2
	cmp	#12+1
	bcc	GROTTE6_310
	lda	#1
	sta	VAR_B2

GROTTE6_310	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_320
	inc
	sta	VAR_A2
GROTTE6_320	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_330
	inc	VAR_A2

GROTTE6_330	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_340
	inc	VAR_B2
GROTTE6_340	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_350
	inc	VAR_B2

GROTTE6_350	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_360
	inc	VAR_C2
GROTTE6_360	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_370
	inc	VAR_C2

GROTTE6_370	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_380
	inc	VAR_D2
GROTTE6_380	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_390
	inc	VAR_D2

GROTTE6_390	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_391
	inc	VAR_E2
GROTTE6_391	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_392
	inc	VAR_E2

GROTTE6_392	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_393
	inc	VAR_F2
GROTTE6_393	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_394
	inc	VAR_F2

GROTTE6_394	@LOCATE	#9;#12
	@PEN	#1
	lda	VAR_B2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_400	lda	VAR_C2
	cmp	#12+1
	bcc	GROTTE6_410
	lda	#1
	sta	VAR_C2

GROTTE6_410	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_420
	inc
	sta	VAR_A2
GROTTE6_420	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_430
	inc	VAR_A2

GROTTE6_430	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_440
	inc	VAR_B2
GROTTE6_440	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_450
	inc	VAR_B2

GROTTE6_450	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_460
	inc	VAR_C2
GROTTE6_460	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_470
	inc	VAR_C2

GROTTE6_470	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_480
	inc	VAR_D2
GROTTE6_480	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_490
	inc	VAR_D2

GROTTE6_490	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_491
	inc	VAR_E2
GROTTE6_491	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_492
	inc	VAR_E2

GROTTE6_492	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_493
	inc	VAR_F2
GROTTE6_493	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_494
	inc	VAR_F2

GROTTE6_494	@LOCATE	#8;#13
	@PEN	#1
	lda	VAR_C2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_500	lda	VAR_D2
	cmp	#12+1
	bcc	GROTTE6_510
	lda	#1
	sta	VAR_D2

GROTTE6_510	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_520
	inc
	sta	VAR_A2
GROTTE6_520	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_530
	inc	VAR_A2

GROTTE6_530	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_540
	inc	VAR_B2
GROTTE6_540	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_550
	inc	VAR_B2

GROTTE6_550	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_560
	inc	VAR_C2
GROTTE6_560	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_570
	inc	VAR_C2

GROTTE6_570	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_580
	inc	VAR_D2
GROTTE6_580	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_590
	inc	VAR_D2

GROTTE6_590	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_591
	inc	VAR_E2
GROTTE6_591	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_592
	inc	VAR_E2

GROTTE6_592	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_593
	inc	VAR_F2
GROTTE6_593	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_594
	inc	VAR_F2

GROTTE6_594	@LOCATE	#8;#14
	@PEN	#1
	lda	VAR_D2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_600	lda	VAR_E2
	cmp	#12+1
	bcc	GROTTE6_610
	lda	#1
	sta	VAR_E2

GROTTE6_610	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_620
	inc
	sta	VAR_A2
GROTTE6_620	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_630
	inc	VAR_A2

GROTTE6_630	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_640
	inc	VAR_B2
GROTTE6_640	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_650
	inc	VAR_B2

GROTTE6_650	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_660
	inc	VAR_C2
GROTTE6_660	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_670
	inc	VAR_C2

GROTTE6_670	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_680
	inc	VAR_D2
GROTTE6_680	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_690
	inc	VAR_D2

GROTTE6_690	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_691
	inc	VAR_E2
GROTTE6_691	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_692
	inc	VAR_E2

GROTTE6_692	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_693
	inc	VAR_F2
GROTTE6_693	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_694
	inc	VAR_F2

GROTTE6_694	@LOCATE	#7;#14
	@PEN	#1
	lda	VAR_E2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_700	lda	VAR_F2
	cmp	#12+1
	bcc	GROTTE6_710
	lda	#1
	sta	VAR_F2

GROTTE6_710	lda	VAR_A2
	cmp	#7
	bne	GROTTE6_720
	inc
	sta	VAR_A2
GROTTE6_720	lda	VAR_A2
	cmp	#11
	bne	GROTTE6_730
	inc	VAR_A2

GROTTE6_730	lda	VAR_B2
	cmp	#7
	bne	GROTTE6_740
	inc	VAR_B2
GROTTE6_740	lda	VAR_B2
	cmp	#11
	bne	GROTTE6_750
	inc	VAR_B2

GROTTE6_750	lda	VAR_C2
	cmp	#7
	bne	GROTTE6_760
	inc	VAR_C2
GROTTE6_760	lda	VAR_C2
	cmp	#11
	bne	GROTTE6_770
	inc	VAR_C2

GROTTE6_770	lda	VAR_D2
	cmp	#7
	bne	GROTTE6_780
	inc	VAR_D2
GROTTE6_780	lda	VAR_D2
	cmp	#11
	bne	GROTTE6_790
	inc	VAR_D2

GROTTE6_790	lda	VAR_E2
	cmp	#7
	bne	GROTTE6_791
	inc	VAR_E2
GROTTE6_791	lda	VAR_E2
	cmp	#11
	bne	GROTTE6_792
	inc	VAR_E2

GROTTE6_792	lda	VAR_F2
	cmp	#7
	bne	GROTTE6_793
	inc	VAR_F2
GROTTE6_793	lda	VAR_F2
	cmp	#11
	bne	GROTTE6_794
	inc	VAR_F2

GROTTE6_794	@LOCATE	#6;#14
	@PEN	#1
	lda	VAR_F2
	clc
	adc	#144
	jsr	COUT160
	jmp	GROTTE6_1000

*---

GROTTE6_800	@PRINT	#grotte6_str800
	@INKEY
	jmp	GROTTE6_60

GROTTE6_900	@PRINT	#grotte6_str900
	@INKEY
	jmp	MORT

*---

GROTTE6_1000	lda	VAR_A2
	cmp	#6
	bne	GROTTE6_1130
	lda	VAR_B2
	cmp	#9
	bne	GROTTE6_1130
	lda	VAR_C2
	cmp	#5
	bne	GROTTE6_1130
	lda	VAR_D2
	cmp	#9
	bne	GROTTE6_1130
	lda	VAR_E2
	cmp	#10
	bne	GROTTE6_1130
	lda	VAR_F2
	cmp	#6
	bne	GROTTE6_1130

	@SOUND	#1;#300;#0
	@SOUND	#1;#250;#0
	@SOUND	#1;#200;#0
	@SOUND	#1;#150;#0
	@SOUND	#1;#100;#0
	@SOUND	#1;#50;#0

GROTTE6_1130	lda	VAR_A2
	cmp	#6
	bne	GROTTE6_1140
	lda	VAR_B2
	cmp	#9
	bne	GROTTE6_1140
	lda	VAR_C2
	cmp	#5
	bne	GROTTE6_1140
	lda	VAR_D2
	cmp	#9
	bne	GROTTE6_1140
	lda	VAR_E2
	cmp	#10
	bne	GROTTE6_1140
	lda	VAR_F2
	cmp	#6
	bne	GROTTE6_1140

	jsr	GROTTE6_ANIM
	lda	#1
	jsr	nowWAIT
	jmp	GROTTE6_3000

GROTTE6_1140	lda	VAR_A2
	cmp	#6
	bne	GROTTE6_1150
	lda	VAR_B2
	cmp	#9
	bne	GROTTE6_1150
	lda	VAR_C2
	cmp	#5
	bne	GROTTE6_1150
	lda	VAR_D2
	cmp	#5
	bne	GROTTE6_1150

	@SOUND	#1;#50;#0
	@SOUND	#1;#100;#0
	@SOUND	#1;#150;#0
	@SOUND	#1;#200;#0
	@SOUND	#1;#250;#0
	@SOUND	#1;#300;#0

	lda	#1
	jsr	nowWAIT
	jmp	GROTTE6_2000

GROTTE6_1150	lda	VAR_A2
	cmp	#6
	bne	GROTTE6_1160
	lda	VAR_B2
	cmp	#9
	bne	GROTTE6_1160
	lda	VAR_C2
	cmp	#5
	bne	GROTTE6_1160
	lda	VAR_D2
	cmp	#9
	bne	GROTTE6_1160
	lda	VAR_E2
	cmp	#6
	bne	GROTTE6_1160

	@SOUND	#1;#50;#0
	@SOUND	#1;#100;#0
	@SOUND	#1;#150;#0
	@SOUND	#1;#200;#0
	@SOUND	#1;#250;#0
	@SOUND	#1;#300;#0

	lda	#1
	jsr	nowWAIT
	jmp	GROTTE6_2000

GROTTE6_1160	jmp	GROTTE6_100
	
GROTTE6_2000	@PRINT	#grotte6_str2000
	@INKEY
	jmp	MORT

GROTTE6_3000	@PRINT	#grotte6_str3000
	@INKEY

* We jump to GROTTE6_60 where we zero
* the following variables.
* No need to do it twice.
	
*	stz	VAR_A2
*	stz	VAR_B2
*	stz	VAR_C2
*	stz	VAR_D2
*	stz	VAR_E2
*	stz	VAR_F2

	jmp	GROTTE6_60

*---

GROTTE6_ANIM	stz	VAR_I2

]lp	ldx	#15
	ldy	VAR_I2	; set INK x,x
	jsr	INK
	
	lda	VAR_I2	; set PEN x
	jsr	PEN
	
	@LOCATE	#8;#12
	lda	#150
	jsr	COUT160
	lda	#153
	jsr	COUT160
	@LOCATE	#8;#13
	lda	#149
	jsr	COUT160
	@LOCATE	#6;#14
	lda	#150
	jsr	COUT160
	lda	#154
	jsr	COUT160
	lda	#153
	jsr	COUT160
	
	lda	#5
	jsr	nowWAIT1
	
	inc	VAR_I2
	lda	VAR_I2
	cmp	#14+1
	bcc	]lp
	beq	]lp
	rts

*---

pGROTTE6	strl	'@/data/grotte6'

VAR_A2	ds	2
VAR_B2	ds	2
VAR_C2	ds	2
VAR_D2	ds	2
VAR_E2	ds	2
VAR_F2	ds	2
VAR_I2	ds	2

grotte6_str800	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Face '88' vous, un mur inca fa'8d'on'0d
	asc	'puzzle hydraulique,'0d
	asc	'avec des conduits serpentant comme'0d
	asc	'un plan de m'8e'tro dessin'8e' par un fou.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'En haut, une arriv'8e'e de fluide rouge'0d
	asc	'qui attend son heure.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'En bas, trois r'8e'ceptacles align'8e's,'0d
	asc	'l'27'air innocents'0d
	dfb	ePEN,3
	asc	''0d
	asc	'mais mortels si vous les nourrissez mal.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Bref, jouez au plombier, mais'0d
	asc	'rappelez-vous :'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Ici, Mario, c'27'est vous...'0d
	asc	'     ... et il n y a qu'27'une seule vie !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte6_str900	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,1
	asc	'Vous go'9e'tez le fluide rouge.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Surprise : c'27'est sucr'8e' !'0d
	asc	''0d
	asc	'Vous savourez...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'Jusqu'2788' ce que vos dents d'8e'cident de'0d
	asc	'fondre comme du fromage '88' raclette.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Quelques secondes plus tard,'0d
	asc	'vous n'2790'tes plus qu'27'une flaque'0d
	asc	'rouge'89'tre assortie au mur.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Bravo, vous '90'tes devenu la d'8e'co !'0d
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte6_str2000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,3
	asc	'Bravo, Einstein !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez brillamment guid'8e0d
	asc	'le fluide...'0d
	dfb	ePEN,3
	asc	''0d
	asc	'dans le MAUVAIS r'8e'ceptacle !!!'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Une r'8e'action chimique se produit'0d
	asc	'au contact des deux fluides,'0d
	asc	'lib'8e'rant un gaz mortel.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez juste invent'8e' la mort'0d
	asc	'par inhalation express.'0d
	dfb	ePEN,1
	asc	''0d
	asc	'F'8e'licitations !'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

grotte6_str3000	dfb	eMODE,1
	dfb	eINK,0,0
*	dfb	eBORDER,0
	dfb	eINK,1,20
	dfb	eINK,2,24
	dfb	eINK,3,6
	dfb	eCLS
	dfb	eLOCATE,1,2
	dfb	ePEN,3
	asc	'Incroyable !'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Vous avez assembl'8e' les tuyaux comme'0d
	asc	'un plombier intergalactique !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Le fluide rouge glisse jusqu'27'au'0d
	asc	'bon r'8e'ceptacle et, miracle,'0d
	asc	'aucun gaz, mortel aucune explosion,'0d
	asc	'pas m'90'me une petite br'9e'lure chimique.'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Mario peut aller se rhabiller'0d
	asc	'vous '90'tes officiellement le ma'94'tre'0d
	asc	'des canalisations incas !'0d
	dfb	ePEN,1
	asc	''0d
	asc	'Au fait, vous venez de d'8e'clencher un'0d
	asc	'petit m'8e'canisme secret :'0d
	dfb	ePEN,2
	asc	''0d
	asc	'Un caillou grav'8e' avec les lettres :'0d
	dfb	ePEN,3
	asc	'               Disco FF'0d
	dfb	ePEN,2
	asc	'vient de tomber juste '88' vos pieds.'0d
	dfb	eLOCATE,15,25
	asc	' ENTER  'a5
	dfb	eEOD
