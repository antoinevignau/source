*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	SOUK_str100
	ext	SOUK_str200
	ext	SOUK_str300
	ext	SOUK_str400
	ext	SOUK_str500
	ext	SOUK_str600
	ext	SOUK_str700
	ext	SOUK_str800
	ext	SOUK_str860
	ext	SOUK_str890
	ext	SOUK_str900
	ext	SOUK_str1000
	ext	SOUK_str1100
	ext	SOUK_str1180
	ext	SOUK_str1200
	ext	SOUK_str1300

SOUK	@LOAD	#pSOUK
SOUK_60	@SHOWPIC

	@WINDOW	#1;#theWINDOW1
	@PRINT	#1;SOUK_str100
	@PRINT	#0;SOUK_str200

SOUK_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	SOUK_200
	jmp	CAIRE
SOUK_200	cmp	#'2'
	bne	SOUK_210
	jmp	SOUK_300
SOUK_210	cmp	#'3'
	bne	SOUK_220
	jmp	SOUK_250
SOUK_220	cmp	#'4'
	bne	SOUK_230
	jmp	SOUK_400
SOUK_230	cmp	#'5'
	bne	SOUK_240
	jmp	SOUK_500
SOUK_240	cmp	#'6'
	bne	SOUK_LOOP
	jmp	SOUK_600

*---

SOUK_250	lda	PEEK_7000
	cmp	#0
	bne	SOUK_251
	jmp	SOUK_700
SOUK_251	cmp	#1
	bne	SOUK_252
	jmp	SOUK_800
SOUK_252	cmp	#2
	bne	SOUK_253
	jmp	SOUK_900
SOUK_253	cmp	#3
	bne	SOUK_254
	jmp	SOUK_1000
SOUK_254	cmp	#4
	bne	SOUK_255
	jmp	SOUK_1100
SOUK_255	cmp	#5
	bne	SOUK_LOOP
	jmp	SOUK_1300
	
SOUK_300	@PRINT	#0;SOUK_str300
	@INKEY
	jmp	SOUK_60

SOUK_400	@PRINT	#0;SOUK_str400
	@INKEY
	jmp	SOUK_60

SOUK_500	@PRINT	#0;SOUK_str500
	@INKEY
	jmp	SOUK_60

SOUK_600	@PRINT	#0;SOUK_str600
	@INKEY
	jmp	MORT

SOUK_700	@PRINT	#0;SOUK_str700
	@INKEY
	lda	#1
	sta	PEEK_7000
	jmp	SOUK_60

SOUK_800	@PRINT	#0;SOUK_str800
SOUK_820	@INKEY
	cmp	#chrYES
	bne	SOUK_840
	
	lda	#2
	sta	D
	jmp	SOUK_890

SOUK_840	cmp	#chrNO
	bne	SOUK_820

	@PRINT	#0;SOUK_str860
	@INKEY
	jmp	SOUK_60

SOUK_890	@PRINT	#0;SOUK_str890
	@INKEY
	lda	#2
	sta	PEEK_7000
	jmp	SOUK_60

SOUK_900	@PRINT	#0;SOUK_str900
	@INKEY
	lda	#3
	sta	PEEK_7000
	jmp	SOUK_60

SOUK_1000	@PRINT	#0;SOUK_str1000
	@INKEY
	lda	#4
	sta	PEEK_7000
	jmp	SOUK_60

SOUK_1100	lda	PEEK_7001
	cmp	#FALSE
	beq	SOUK_1120
	cmp	#TRUE
	beq	SOUK_1200
	
SOUK_1120	@PRINT	#0;SOUK_str1100
	@INKEY
	@PRINT	#0;SOUK_str1180
	@INKEY
	jmp	SOUK_60

SOUK_1200	@PRINT	#0;SOUK_str1200
	@INKEY
	lda	#5
	sta	PEEK_7000
	jmp	SOUK_60

SOUK_1300	@PRINT	#0;SOUK_str1300
	@INKEY
	jmp	SOUK_60

*---

pSOUK	strl	'@/data/souk.lz4'
