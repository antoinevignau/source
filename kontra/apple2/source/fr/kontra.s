*
* Kontrabant
*
* (c) 1984, Radio Student
* (c) 2023, Tomaz Stih
* (c) 2024, Janez J. Starc & Brutal Deluxe Software
*
* See the MIT license @ https://github.com/iskra-delta/idp-quill/blob/main/LICENSE
*

	mx	%11
	org	$2000
	typ	$FF
	dsk	Kontra.System
	lst	off
	
*------------------------------
* EQUATES
*------------------------------

*-------------- Zero page & friends

BASL	=	$28
HPAG	=	$e6

src	=	$f8
dst	=	src+2

*-------------- Game

ptrPREFIX	=	$280
ptrRELOCATE	=	$1000
HGRPAGE1	=	$2000
ptrTITLE	=	$4000
theGAME	=	$2000
proBUFFER	=	$bb00
PRODOS	=	$bf00

*-------------- Softswitches

KBD	=	$C000
CLR80VID	=	$C00C
KBDSTROBE	=	$C010
VBL	=	$C019
MONOCOLOR	=	$C021
NEWVIDEO	=	$C029
VERTCNT	=	$C02E
SPKR	=	$C030
CYAREG	=	$C036
TXTCLR	=	$C050
TXTSET	=	$C051
MIXCLR	=	$C052
MIXSET	=	$C053
TXTPAGE1	=	$C054
TXTPAGE2	=	$C055
LORES	=	$C056
HIRES	=	$C057

*-------------- The firmware routines

HGR	=	$F3E2
HPOSN	=	$F417
INIT	=	$FB2F
TABV	=	$FB5B
SETPWRC	=	$FB6F
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
GETLN1	=	$FD6F
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89
BELL	=	$FF3A

*-----------------------------------
* RELOCATE ME
*-----------------------------------

	ldx	#8
	ldy	#0
theFROM	lda	ICI,y
theTO	sta	ptrRELOCATE,y
	iny
	bne	theFROM
	inc	theFROM+2
	inc	theTO+2
	dex
	bne	theFROM
	jmp	ptrRELOCATE

ICI
	
*-----------------------------------
* LOAD THE GAME
*-----------------------------------

	org	ptrRELOCATE	; we are relocated

	jsr	PRODOS	; get the prefix
	dfb	$c7
	da	proGETPFX

	jsr	PRODOS	; set it
	dfb	$c6
	da	proGETPFX

	sec
	jsr	IDROUTINE
	bcs	in_notiigs

	lda	NEWVIDEO	; B/W hi-res
	sta	oldNEWVIDEO
	ora	#%0010_0000
	sta	NEWVIDEO

	lda	MONOCOLOR	; disables color
	sta	oldMONOCOLOR
	ora	#%1000_0000
	sta	MONOCOLOR

in_notiigs	lda	#>HGRPAGE1
	sta	HPAG
	jsr	HGR
	lda	MIXCLR

*--- Load title picture

	lda	#>ptrTITLE
	ldy	#<pTITLE
	ldx	#>pTITLE
	jsr	loadFILE
	jsr	unpackLZ4

*--- Wait

	ldx	#250
platform_pause	lda	#86	; 0.02s
	jsr	WAIT
	lda	KBD
	bmi	pp_exit
	dex
	bne	platform_pause
pp_exit	sta	KBDSTROBE

*--- Set text mode

	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jsr	HOME	; home cursor and clear 

*--- Please wait

	lda	#11
	jsr	TABV

	ldx	#0
	ldy	#11	; (40-18)/2 = 11
]lp	lda	strWAIT,x
	beq	endWAIT
	sta	(BASL),y
	inx
	iny
	bne	]lp
	
*--- Load game

endWAIT	lda	#>theGAME
	ldy	#<pGAME
	ldx	#>pGAME
	jsr	loadFILE

	sec
	jsr	IDROUTINE
	bcs	out_notiigs

	lda	oldNEWVIDEO	; B/W hi-res
	sta	NEWVIDEO

	lda	oldMONOCOLOR	; disables color
	sta	MONOCOLOR
	
out_notiigs	jmp	theGAME

*--- Data

strWAIT	asc	"VEUILLEZ PATIENTER"00

oldMONOCOLOR	ds	2	; $C027
oldNEWVIDEO	ds	2	; $C029

*--------------------------------------
* unpackLZ4
*
* Unpack a LZ4 image
* Code by Peter Ferrie
* Used with permission
* Adapted for the game engine
*
*--------------------------------------

unpackLZ4	ldy	#<ptrTITLE	; src
	ldx	#>ptrTITLE

	tya		; end
	clc
	adc	proGETEOF+2
	sta	lz4end
	txa
	adc	proGETEOF+3
	sta	lz4end+1
	
	lda	#<HGRPAGE1	; dest
	sta	dst
	lda	#>HGRPAGE1
	sta	dst+1

	tya		; move to data
	clc
	adc	#16
	sta	src
	txa
	adc	#0
	sta	src+1
	
	ldy	#0	; src/dst index
	sty	count

parsetoken	jsr	getsrc
	pha
	lsr
	lsr
	lsr
	lsr
	beq	copymatches
	jsr	buildcount
	tax
	jsr	docopy

	lda	src	; did we reach the end?
	cmp	lz4end
	lda	src+1
	sbc	lz4end+1
	bcs	lz4done

copymatches	jsr	getsrc
	sta	delta
	jsr	getsrc
	sta	delta+1
	pla
	and	#$0f
	jsr	buildcount
	clc
	adc	#4
	tax
	bcc	copymatches1
	inc	count+1
copymatches1	lda	src+1
	pha
	lda	src
	pha
	sec
	lda	dst
	sbc	delta
	sta	src
	lda	dst+1
	sbc	delta+1
	sta	src+1
	jsr	docopy
	pla
	sta	src
	pla
	sta	src+1
	jmp	parsetoken

lz4done	pla		; yes, exit!
	rts

*---

docopy	jsr	getput
	dex
	bne	docopy
	dec	count+1
	bne	docopy
	rts

*---

buildcount	ldx	#1
	stx	count+1
	cmp	#$0f
	bne	buildcount2
]lp	sta	count
	jsr	getsrc
	tax
	clc
	adc	count
	bcc	buildcount1
	inc	count+1
buildcount1	inx
	beq	]lp
buildcount2	rts

*---

getput	jsr	getsrc

putdst	sta 	(dst), y
	inc	dst
	bne	putdst1
	inc	dst+1
putdst1	rts

*---

getsrc	lda 	(src), y
	inc	src
	bne	getsrc1
	inc	src+1
getsrc1	rts

*--- Data

lz4end	ds	2
count	ds	2
delta	ds	2

*-----------------------------------
* LOAD A FILE
*-----------------------------------

loadFILE	sta	proREAD+3
	sty	proOPEN+1
	stx	proOPEN+2
	
	jsr	PRODOS
	dfb	$c8
	da	proOPEN
	bcs	quitME

	lda	proOPEN+5	; zou, on prend l'ID
	sta	proGETEOF+1
	sta	proREAD+1
	sta	proCLOSE+1

	jsr	PRODOS	; longueur du fichier
	dfb	$d1
	da	proGETEOF
	bcs	quitME

	lda	proGETEOF+2
	sta	proREAD+4
	lda	proGETEOF+3
	sta	proREAD+5

	jsr	PRODOS	; lecture du fichier
	dfb	$ca
	da	proREAD
	bcs	quitME
	
	jsr	PRODOS	; fermeture du fichier
	dfb	$cc
	da	proCLOSE
	bcs	quitME

	rts

quitME	jsr	PRODOS	; exit
	dfb	$65
	da	proQUIT

	brk	$bd	; on ne se refait pas ;-)
	
*--- Data

proQUIT	dfb	$4
	ds	1
	ds	2
	ds	1
	ds	2	

proGETPFX	dfb	$1
	da	ptrPREFIX

proOPEN	dfb	$3
	da	pTITLE	; pathname (par défaut, le moteur)
	da	proBUFFER	; io_buffer
	ds	1	; ref_num

proREAD	dfb	$4
	ds	1	; ref_num
	da	ptrTITLE	; data_buffer
	ds	2	; request_count
	ds	2	; transfer_count

proCLOSE	dfb	$1
	ds	1	; ref_num

proGETEOF	dfb	$2
	ds	1	; ref_num
	ds	3	; eof

pTITLE	str	'data/title.lz4'
pGAME	str	'game'

*--- The end
