*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	debug_str

DEBUG	@PRINT	#0;debug_str
DEBUG_LOOP	@INKEY
	cmp	#'0'
	beq	DEBUG_QUIT
	cmp	#'A'
	bcc	DEBUG_LOOP
	cmp	#'Z'+1
	bcs	DEBUG_LOOP
	sec
	sbc	#'A'
	asl
	tax
	lda	tblDEBUG,x
	sta	DEBUG_JUMP+1
DEBUG_JUMP	jmp	$bdbd

DEBUG_QUIT	jmp	QUIT

*---

tblDEBUG	da	DISC
	da	BUREAU
	da	CAIRE
	da	CHAT
	da	DESERT1
	da	DESERT2
	da	DESERT3
	da	DESERT4
	da	PYRAMID1
	da	PYRAMID2
	da	PYRAMID3
	da	PYRAMID4
	da	PYRAMID5
	da	PYRAMID6
	da	PYRAMID7
	da	PYRAMID8
	da	PYRAMID9
	da	PYRAMIDA
	da	PYRAMIDB
	da	PYRAMIDC
	da	SOUK
	da	EPILOGUE
	da	MORT
