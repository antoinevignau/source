*
* L'affaire Vera Cruz
*
* (c) Gilles Blancon
* (c) 1985, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* INTRODUCTION
*-------------------------------
* sons
* frequence
*  $D6
*
* nombre de pages
*     bip :  2 à chaque clic ou touche
*   ligne : 39 à chaque impression de ligne
*  retour :  7 à chaque retour chariot
*  sirene : 47 x 12 fois crescendo (intro) & decrescendo (victoire)
*     tir : 54 x  1 fois
*

introduction	ldal	BUTN0-1
	bpl	introduction1
	rts
	
introduction1	lda	#pINFOGRAMES	; charge l'image
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	jsr	loadFILE

	jsr	initMIDI
	jsr	doMUSIK
	
*--- 1ère image

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	lda	#TRUE
	jsr	fadeIN

	lda	#indexBLACK
	jsr	setBORDER

*--- Wait

	lda	#3
	jsr	nowWAIT

	lda	#TRUE
	jsr	fadeOUT
	
	ldx	ptrFOND1+2
	ldy	ptrFOND1
	lda	#FALSE
	jsr	fadeIN
	
*--- We were here!

	ldx	#8
	ldy	#9
	jsr	SETCHARSINFO
	jsr	SETWHITECHARS
	
	lda	#strBRUTAL
	ldx	#0
	ldy	#64
	jsr	PRINTCSTRING
	
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
	asc	'              31 ao'9e't 2025'00

*-------------------------------
* DATA
*-------------------------------

*--- introduction

pINFOGRAMES	strl	'@/data/infogrames'

