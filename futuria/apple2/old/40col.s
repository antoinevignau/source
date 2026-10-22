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

scrWIDTH	=	40	; number of columns
ptrPREFIX	=	$280
proBUFFER	=	$800
PRODOS	=	$bf00
MACHID	=	$bf98

*-----------------------------------
* INIT PLATFORM
*-----------------------------------

INIT_PLATFORM	sec
	jsr	IDROUTINE
	bcs	notiigs

	lda	CYAREG	; 1 MHz vaincra!
	sta	sauveCYA
	and	#%0111_1111
	sta	CYAREG

notiigs	lda	MACHID
	and	#%0000_1000	; bit 3
	bne	pi_oklower	; on means //c
	lda	MACHID
	bmi	pi_oklower
	
	lda	#$80	; force UPPER
	sta	fgCASE
	
pi_oklower	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX
	rts

*-----------------------------------
* QUIT PRODOS
*-----------------------------------

QUIT	lda	sauveCYA
	sta	CYAREG

	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT
	brk	$bd	; on ne se refait pas ;-)

*--- Data

proQUIT	dfb	4
	ds	1
	ds	2
	ds	1
	ds	2

proGETPFX	dfb	$1
	da	ptrPREFIX

sauveCYA	ds	1

*-----------------------------------
* LOAD/SAVE GAME
*-----------------------------------

SAVE_GAME	@print	#strSAVEGAME
	jsr	RDKEY
	cmp	#"1"
	bcc	save_end
	cmp	#"9"+1
	bcs	save_end

	jsr	COUT	; show chosen slot
	jsr	saveSLOT

save_end	rts

*---

saveSLOT	sta	pPARTY+5

	jsr	PRODOS
	dfb	$C1
	da	gDESTROY

	jsr	PRODOS
	dfb	$C0
	da	gCREATE

	jsr	PRODOS
	dfb	$C8
	da	gOPEN
	bcs	ss_end

	lda	gOPEN+5
	sta	gREAD+1
	sta	gCLOSE+1
	
	jsr	PRODOS
	dfb	$CB	; it is a WRITE
	da	gREAD

	php
	jsr	PRODOS
	dfb	$CC
	da	gCLOSE
	plp
ss_end	rts

*--- Data

gDESTROY	dfb	$01
	da	pPARTY	; +01

gCREATE	dfb	$07
	da	pPARTY	; +01
	dfb	$e3	; +03
	dfb	$5d	; +04
	dw	$802c	; +05
	dfb	$01	; +07
	ds	2	; +08
	ds	2	; +0A

*-------------- load a game

LOAD_GAME	@print	#strLOADGAME
	jsr	RDKEY
	cmp	#"1"
	bcc	load_end
	cmp	#"9"+1
	bcs	load_end

	jsr	loadSLOT
load_end	rts

*---

loadSLOT	sta	pPARTY+5

	jsr	PRODOS
	dfb	$C8
	da	gOPEN
	bcs	ls_end

	lda	gOPEN+5
	sta	gREAD+1
	sta	gCLOSE+1
	
	jsr	PRODOS
	dfb	$CA
	da	gREAD

	php
	jsr	PRODOS
	dfb	$CC
	da	gCLOSE
	plp
ls_end	rts

*--- Data

pPARTY	str	"GAME0"

gOPEN	dfb	$3
	da	pPARTY	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

gREAD	dfb	$4
	ds	1	; ref_num
	da	DEBUT_DATA	; data_buffer
	dw	FIN_DATA-DEBUT_DATA	; request_count
	ds	2	; transfer_count

gCLOSE	dfb	$1
	ds	1	; ref_num

*-----------------------------------
* INIT VIDEO MODE
*-----------------------------------

SET_TEXTMODE	sta	CLR80VID	; 40x24 text
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jsr	HOME	; home cursor and clear to end of page

	lda	#0
	sta	WNDTOP
	lda	#24
	sta	WNDBTM
	rts

*-----------------------------------
* GOTOXY
*-----------------------------------

GOTOXY	stx	CH
	tya
	jmp	TABV
	
*-----------------------------------
* SAVEXY
*-----------------------------------

SAVEXY	ldx	CH
	stx	OLDCH
	ldy	CV
	sty	OLDCV
	rts

RESTOREXY	ldx	OLDCH
	ldy	OLDCV
	jmp	GOTOXY

*---

OLDCH	ds	1
OLDCV	ds	1

*-----------------------------------
* SETWINDOW
*-----------------------------------

SETWINDOW	stx	WNDTOP
	sty	WNDBTM
	rts

SAVEWINDOW	ldx	WNDTOP
	stx	OLDTOP
	ldy	WNDBTM
	sty	OLDBTM
	rts

RESTOREWINDOW	ldx	OLDTOP
	stx	WNDTOP
	ldy	OLDBTM
	sty	WNDBTM
	rts

*---

OLDTOP	ds	1
OLDBTM	ds	1

*-----------------------------------
* ERASE A RECTANGLE
*-----------------------------------

ERASE_RECTANGLE	rts

*-----------------------------------
* LOAD AN IMAGE
*-----------------------------------

LOAD_IMAGE	rts

*-----------------------------------
* INPUT A STRING
*-----------------------------------

inputSTRING	jmp	GETLN1	; easy for 40-col

*-----------------------------------
* PRINT A PASCAL STRING
*-----------------------------------

printSTRING	sty	dpFROM
	stx	dpFROM+1
	
	ldy	#0	; get length
	lda	(dpFROM),y
	sta	N	; save nb of chars
	clc
	adc	CH	; check with screen width
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
	adc	CH
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

	lda	CH	; beginning of screen
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

wordLEN	ds	2

*--- It's the end