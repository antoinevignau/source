*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	MORT_STR
	
MORT	@LOAD	#pMORT
MORT_60	@SHOWPIC
	@PRINT	#0;MORT_STR
MORT_LOOP	@INKEY
	@DEBUG
	cmp	#chrYES
	beq	MORT_100
	cmp	#chrNO
	beq	MORT_200
	bne	MORT_LOOP

MORT_100	jsr	INIT_VARIABLES
	jmp	CAIRE

MORT_200	jmp	QUIT

*---

pMORT	strl	'@/data/mort.lz4'
