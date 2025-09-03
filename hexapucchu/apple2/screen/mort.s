*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

MORT	@LOAD	#pMORT
MORT_60	@SHOWPIC
MORT_LOOP	@INKEY
	@DEBUG
	cmp	#'O'
	beq	MORT_100
	cmp	#'N'
	beq	MORT_200
	bne	MORT_LOOP

MORT_100	jmp	PLAGE

MORT_200	jmp	QUIT

*---

pMORT	strl	'@/data/mort'
