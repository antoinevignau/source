*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	bureau_str100
	ext	bureau_str200
	ext	bureau_str300
	ext	bureau_str400
	ext	bureau_str500
	ext	bureau_str600
	ext	bureau_str700
	ext	bureau_str720
	ext	bureau_str800
	ext	bureau_str900
	ext	bureau_str1000
	ext	bureau_str1100
	ext	bureau_str1200
	ext	bureau_str1400
	ext	bureau_str1500
	ext	bureau_str1600
	
BUREAU	@LOAD	#pBUREAU
BUREAU_60	@SHOWPIC

	@WINDOW	#1;#theWINDOW1
	@PRINT	#1;bureau_str100
	@PRINT	#0;bureau_str200
BUREAU_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	BUREAU2
	jmp	BUREAU300
BUREAU2	cmp	#'2'
	bne	BUREAU3
	lda	T
	cmp	#0
	bne	BUREAU2BIS
	jmp	BUREAU400
BUREAU2BIS	lda	T
	cmp	#1
	bne	BUREAU3
	jmp	BUREAU500
BUREAU3	cmp	#'3'
	bne	BUREAU4
	jmp	BUREAU1000
BUREAU4	cmp	#'4'
	bne	BUREAU5
	jmp	BUREAU1100
BUREAU5	cmp	#'5'
	bne	BUREAU_LOOP
	jmp	BUREAU1200
	
	jmp	QUIT

*---

BUREAU300	@PRINT	#0;bureau_str300
	@INKEY
	jmp	BUREAU_60

BUREAU400	@PRINT	#0;bureau_str400
	@INKEY
	lda	#1
	sta	L
	jmp	BUREAU_60

BUREAU500	lda	L
	cmp	#1
	bne	BUREAU510
	jmp	BUREAU800

BUREAU510	@PRINT	#0;bureau_str500
	@INKEY
	@PRINT	#0;bureau_str600
BUREAU620	@INKEY
	cmp	#chrYES
	beq	BUREAU700
	cmp	#chrNO
	bne	BUREAU620
	jmp	BUREAU_60

BUREAU700	@CLS	#0
	@PRINT	#0;bureau_str700
	@INPUT	#NOM$;#30
	@STRCMP	#NOM$;#strQATTARA
	cmp	#TRUE
	beq	BUREAU720
	jmp	BUREAU900
BUREAU720	@PRINT	#0;bureau_str720
	@INKEY
	jmp	CAIRE

BUREAU800	@PRINT	#0;bureau_str800
BUREAU850	@INKEY
	cmp	#chrYES
	beq	BUREAU700
	cmp	#chrNO
	bne	BUREAU850
	jmp	BUREAU_60

BUREAU900	@PRINT	#0;bureau_str900
BUREAU950	@INKEY
	cmp	#chrYES
	beq	BUREAU700
	cmp	#chrNO
	bne	BUREAU950
	jmp	BUREAU_60

BUREAU1000	@PRINT	#0;bureau_str1000
	@INKEY
	jmp	BUREAU_60

BUREAU1100	@PRINT	#0;bureau_str1100
	@INKEY
	jmp	BUREAU_60

BUREAU1200	@PRINT	#0;bureau_str1200
BUREAU1280	@INKEY
	cmp	#'1'
	beq	BUREAU1400
	cmp	#'2'
	beq	BUREAU1500
	cmp	#'3'
	beq	BUREAU1600
	cmp	#'0'
	bne	BUREAU1280
	jmp	BUREAU_60

BUREAU1400	lda	#1
	sta	T
	
	@PRINT	#0;bureau_str1400
	jmp	BUREAU1280

BUREAU1500	@PRINT	#0;bureau_str1500
	jmp	BUREAU1280

BUREAU1600	@PRINT	#0;bureau_str1600
	jmp	BUREAU1280

*---

pBUREAU	strl	'@/data/bureau.lz4'

strQATTARA	asc	'QATTARA'00
