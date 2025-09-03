*
* Hexapucchu, la Cite Perdue de Patchucca
*
* (c) 2025, Eric Cubizolle (TITAN)
* (c) 2025, Brutal Deluxe Software
*

DEBUG	@PRINT	#debug_str
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
	da	CASCADE
	da	CORNICHE
	da	CPC
	da	DISCO
	da	ENVIRONS
	da	FRESQUE
	da	GROTTE1
	da	GROTTE2
	da	GROTTE3
	da	GROTTE4
	da	GROTTE5
	da	GROTTE6
	da	INCA1
	da	JUNGLE
	da	NATURE1
	da	NATURE2
	da	ORIFICES
	da	PIANO
	da	PLAGE
	da	POULIE
	da	ROUAGE
	da	SAUT
	da	TROU
	da	EPILOGUE
	da	MORT

debug_str	dfb	eMODE,1
	dfb	eINK,0,0
	dfb	eINK,1,26
	dfb	ePEN,1
	asc	'HEXAPUCCHU DEBUG MENU'0d
	asc	'--------------------'
	asc	'--------------------'
	asc	''0d
	asc	'A-DISC              '
	asc	'B-CASCADE'0d
	asc	'C-CORNICHE          '
	asc	'D-CPC'0d
	asc	'E-DISCO             '
	asc	'F-ENVIRONS'0d
	asc	'G-FRESQUE           '
	asc	'H-GROTTE1'0d
	asc	'I-GROTTE2           '
	asc	'J-GROTTE3'0d
	asc	'K-GROTTE4           '
	asc	'L-GROTTE5'0d
	asc	'M-GROTTE6           '
	asc	'N-INCA1'0d
	asc	'O-JUNGLE            '
	asc	'P-NATURE1'0d
	asc	'Q-NATURE2           '
	asc	'R-ORIFICES'0d
	asc	'S-PIANO             '
	asc	'T-PLAGE'0d
	asc	'U-POULIE            '
	asc	'V-ROUAGE'0d
	asc	'W-SAUT              '
	asc	'X-TROU'0d
	asc	'Y-EPILOGUE          '
	asc	'Z-MORT'0d
	asc	0d
	asc	'0-QUITTER'0d
	dfb	ePEN,2
	dfb	eLOCATE,15,24
	asc	' ENTER  'a5
	dfb	eEOD

