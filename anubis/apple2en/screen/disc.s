*
* Le secret d'Anubis
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

	ext	DISC180
	ext	DISC350
	ext	DISC530
	ext	DISC620
	ext	DISC_BD
	
DISC	@LOAD	#pTITLE
	@SHOWPIC
	@INKEY
	
	@WINDOW	#0;#theWINDOW0
	@PRINT	#0;DISC180
	@INKEY
	@PRINT	#0;DISC350
	@INKEY
	@PRINT	#0;DISC530
	@INKEY
	@PRINT	#0;DISC620
	@INKEY
	@PRINT	#0;DISC_BD
	@INKEY
	@CLS            #0
	jmp	BUREAU

*---

pTITLE	strl	'@/data/titre.lz4'

theWINDOW0	dw	1,40,1,25	; fenêtre principale
theWINDOW1	dw	25,35,4,19	; description
theWINDOW80	dw	1,80,1,25	; 80-colonnes
theWINDOW20	dw	1,20,1,25	; 20-colonnes