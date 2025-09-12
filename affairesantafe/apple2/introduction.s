*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* INTRODUCTION
*-------------------------------

introduction	ldal	BUTN0-1
	bpl	introduction1
	rts
	
introduction1	lda	#pTITLE	; charge l'image
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	jsr	loadFILE

	jsr	initMIDI
	jsr	doMUSIK
	
*--- 1ère image

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrIMAGE+2
	ldy	ptrIMAGE
	lda	#TRUE
	jsr	fadeIN

	@border	#indexBLACK

*--- Wait

	lda	#3
	jsr	nowWAIT

	lda	#TRUE	; fade out + clear screen
	jsr	fadeOUT

	PushWord	#0
	PushLong	#palette320
	_SetColorTable
	
*--- We were here!

	@mode	#1	; 320x200 4-cols
	
*	ldx	#charHEIGHTdft
*	ldy	#charWIDTHdft
*	jsr	SETCHARSINFO
*	jsr	SETWHITECHARS
	
	@paper	#0;#indexBLACK
	@pen	#0;#indexWHITE
	@locate	#0;#1;#8
	@print	#0;#strBRUTAL

	lda	#3
	jmp	nowWAIT

*---

strBRUTAL	asc	'           Version Apple IIgs'0d
	asc	'                   de'0d
	asc	'         Brutal Deluxe Software'0d
	asc	0d
	asc	'    Antoine Vignau & Olivier Zardini'0d
	asc	0d
	asc	0d
	asc	'           13 septembre 2025'00

*-------------------------------
* DATA
*-------------------------------

*--- introduction

pTITLE	strl	'@/data/titre'

