*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	epilogue_str100
	ext	epilogue_str270
	ext	epilogue_str410
	ext	epilogue_str560
	ext	epilogue_str700
	ext	epilogue_str800
	ext	epilogue_str900
	ext	epilogue_str1000
	ext	epilogue_str1100

EPILOGUE	@LOAD	#pEPILOGUE
	@MODE	#2
	@WINDOW	#2;#theWINDOW80

	@SHOWPIC
	@PRINT	#2;epilogue_str100
	@INKEY
	@SHOWPIC
	@PRINT	#2;epilogue_str270
	@INKEY
	@SHOWPIC
	@PRINT	#2;epilogue_str410
	@INKEY
	@SHOWPIC
	@PRINT	#2;epilogue_str560
EPILOGUE650	@INKEY
	cmp	#'2'
	beq	EPILOGUE800
	cmp	#'3'
	beq	EPILOGUE900
	cmp	#'1'
	bne	EPILOGUE650
	
EPILOGUE700	@SHOWPIC
	@PRINT	#2;epilogue_str700
	@INKEY
	jmp	EPILOGUE1000

EPILOGUE800	@SHOWPIC
	@PRINT	#2;epilogue_str800
	@INKEY
	jmp	EPILOGUE1000

EPILOGUE900	@SHOWPIC
	@PRINT	#2;epilogue_str900
	@INKEY

EPILOGUE1000	@MODE	#1
	@PRINT	#0;epilogue_str1000
	@INKEY

	@MODE	#2
	@WINDOW	#2;#theWINDOW80
	@SHOWPIC
	@PRINT	#2;epilogue_str1100
	@INKEY

	jmp	QUIT

*---

pEPILOGUE	strl	'@/data/epilogue.lz4'
