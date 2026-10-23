*
* Futuria
* by William Demas
*
* (c) 1985, Unicorn Software
* (c) 2026, Brutal Deluxe Software
*

	mx	%11
	lst	off

*-----------------------------------
* EQUATES
*-----------------------------------

scrWIDTH	=	80	; number of columns
SIZE_TEXTBUFFER	=	80

*-----------------------------------
* INIT PLATFORM
*-----------------------------------

INIT_PLATFORM	rts
	
*-----------------------------------
* LOAD/SAVE GAME
*-----------------------------------

SAVE_GAME	@print	#strSAVEGAME
	jsr	GET_SLOT
	bcc	saveSLOT
	rts
saveSLOT	jmp	saveGAME

*-------------- load a game

GET_SLOT	jsr	RDKEY
	cmp	#'1'
	bcc	GET_SLOT_END
	cmp	#'9'+1
	bcs	GET_SLOT_END

	jsr	COUT
	clc
	rts
GET_SLOT_END	sec
	rts

*-------------- load a game

LOAD_GAME	@print	#strLOADGAME
	jsr	GET_SLOT
	bcc	loadSLOT
	rts
loadSLOT	jmp	loadGAME

*-----------------------------------
* INIT VIDEO MODE
*-----------------------------------

SET_TEXTMODE	stz	OURCH	; x-coord is zero
	rts

*-----------------------------------
* ERASE A RECTANGLE
*-----------------------------------

ERASE_RECTANGLE	rts

*-----------------------------------
* LOAD AN IMAGE
*-----------------------------------

LOAD_IMAGE	rts

*-----------------------------------
* COUT
*-----------------------------------

COUT	rep	#$30
	and	#$ff
	pha
	_DrawChar
	sep	#$30
	
	inc	OURCH
	lda	OURCH
	cmp	#scrWIDTH
	bcc	COUT1
	stz	OURCH
COUT1	rts

*-----------------------------------
* INPUT A STRING
*-----------------------------------

RDKEY	ldx	#0
	rts
	rep	#$30
	pha
	PushLong	#TEXTBUFFER
	PushWord	#1
	PushWord	#chrNULL
	PushWord	#1
	_ReadLine
	plx
	sep	#$30
	rts

*---

inputSTRING	ldx	#0
	rts
	rep	#$30
	pha
	PushLong	#TEXTBUFFER
	PushWord	#SIZE_TEXTBUFFER
	PushWord	#chrNULL
	PushWord	#1
	_ReadLine
	plx
	sep	#$30
	rts

*-----------------------------------
* PRINT A PASCAL STRING
*-----------------------------------

printSTRING	sty	dpFROM
	stx	dpFROM+1
	
	ldy	#0	; get length
	lda	(dpFROM),y
	sta	N	; save nb of chars
	clc
	adc	OURCH	; check with screen width
	cmp	#scrWIDTH
	bcc	ps1	; we can output the word normally
	beq	ps1
	
	lda	#chrRETURN	; must perform a CR before outputting
	jsr	COUT

ps1	iny		; get char
	lda	(dpFROM),y
	
	bit	fgCASE
	bpl	ps2

	tax
	lda	tblKEY,x

ps2	jsr	COUT	; output it
	
	dec	N	; next char
	bne	ps1
	rts

*-----------------------------------
* PRINT A C STRING
*-----------------------------------

printCSTRING	sty	pcs1+1
	stx	pcs1+2
	sty	dpFROM
	stx	dpFROM+1

*--- All cases: check string length

	ldy	#0
]lp	lda	(dpFROM),y
	beq	pcsEOS
	cmp	#chrBACKSLASH
	beq	pcsEOS
	iny
	bne	]lp
	ldy	#scrWIDTH
pcsEOS	cpy	#scrWIDTH
	bcc	pcs1
	jmp	pcsLONG

*--- Case 1: string length is <40

pcs1	lda	$ffff
	beq	pcs4
	cmp	#chrBACKSLASH
	beq	pcs4
	
	bit	fgCASE
	bpl	pcs2

	tax		; remove accents
	lda	tblKEY,x

pcs2	jsr	COUT
	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
	
pcs4	rts

*--- Case 2: string length is >39

* 012345678
* ANTOINE_TOINET
* ANTOINE/

pcsLONG	ldy	#0
	sty	wordLEN

]lp	lda	(dpFROM),y	; get word length
	beq	pcslEOS	; end of string
	cmp	#chrBACKSLASH
	beq	pcslEOS
	cmp	#chrRETURN
	beq	pcslEOW	; end of word (with a return)
	cmp	#chrSPACE
	beq	pcslEOW	; end of word (with a space)
	iny
	bne	]lp

pcslEOW	iny		; output the space character
pcslEOS	sty	wordLEN	; save nb of chars to output
	tya		; end X pos =+ word length
	clc
	adc	OURCH
	cmp	#scrWIDTH
	bcc	pcslGOOD	; we can output the word normally
	beq	pcslGOOD
	
	lda	#chrRETURN	; must perform a CR before outputting
	jsr	COUT

pcslGOOD	ldy	#0
]lp	lda	(dpFROM),y
	beq	pcslEND
	cmp	#chrBACKSLASH
	beq	pcslEND

	bit	fgCASE
	bpl	pcslg2

	tax		; from lower to upper
	lda	tblKEY,x

pcslg2	cmp	#chrSPACE	; shall we skip the space character?
	bne	pcslg4

	lda	OURCH	; beginning of screen
	beq	pcslg5
	cmp	#scrWIDTH-1	; end of screen
	beq	pcslg5
	lda	#chrSPACE

pcslg4	jsr	COUT	; output the char

	iny		; until end of string
	cpy	wordLEN
	bcc	]lp
	
pcslg5	lda	dpFROM
	clc
	adc	wordLEN
	sta	dpFROM
	lda	dpFROM+1
	adc	#0
	sta	dpFROM+1
	jmp	pcsLONG

pcslEND	rts

*--- Data

OURCH	ds	2	; 0..79
wordLEN	ds	2
TEXTBUFFER	ds	SIZE_TEXTBUFFER

*--- It's the end