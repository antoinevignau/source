*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	CHAT_str100
	ext	CHAT_str200
	ext	CHAT_str300
	ext	CHAT_str400
	ext	CHAT_str500
	ext	CHAT_str600
	ext	CHAT_str800
	ext	CHAT_str900
	ext	CHAT_str1000
	ext	CHAT_str1100
	ext	CHAT_str1200
	ext	CHAT_str1300

CHAT	@LOAD	#pCHAT
CHAT_60	@SHOWPIC

	@WINDOW	#1;#theWINDOW1
	@PRINT	#1;CHAT_str100
	@PRINT	#0;CHAT_str200

CHAT_LOOP	@INKEY
	@DEBUG
	cmp	#'1'
	bne	CHAT_200
	jmp	CHAT_300
	
CHAT_200	cmp	#'2'
	bne	CHAT_210
	jmp	CAIRE
	
CHAT_210	cmp	#'3'
	bne	CHAT_220
	jmp	CHAT_400
	
CHAT_220	cmp	#'4'
	bne	CHAT_230
	jmp	CHAT_700
	
CHAT_230	cmp	#'5'
	bne	CHAT_240
	jmp	CHAT_500
	
CHAT_240	cmp	#'6'
	bne	CHAT_LOOP	
	jmp	CHAT_600

*---

CHAT_300	@PRINT	#0;CHAT_str300
	@INKEY
	jmp	CHAT_60

CHAT_400	@PRINT	#0;CHAT_str400
	@INKEY
	jmp	CHAT_60

CHAT_500	@PRINT	#0;CHAT_str500
	@INKEY
	jmp	MORT

CHAT_600	@PRINT	#0;CHAT_str600
	@INKEY
	jmp	CHAT_60

CHAT_700	lda	PEEK_7002	; assume the other value is always FALSE
	cmp	#TRUE
	beq	CHAT_800

	lda	PEEK_7000
	cmp	#2
	bcc	CHAT_900
	bcs	CHAT_1100

CHAT_800	@PRINT	#0;CHAT_str800
	@INKEY
	jmp	CHAT_60

CHAT_900	@PRINT	#0;CHAT_str900
	@INKEY
	jmp	CHAT_60

CHAT_1100	@PRINT	#0;CHAT_str1100
CHAT_1140	@INKEY
	cmp	#chrNO
	beq	CHAT_1300
	cmp	#chrYES
	bne	CHAT_1140

CHAT_1200	@PRINT	#0;CHAT_str1200
	@INKEY
	
	lda	#TRUE
	sta	PEEK_7002
	jmp	CHAT_60

CHAT_1300	@PRINT	#0;CHAT_str1300
	@INKEY
	jmp	CHAT_60

*---

pCHAT	strl	'@/data/chat.lz4'
