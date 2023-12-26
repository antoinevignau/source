*
* Kikekankoi : intro
*

	mx	%11
	org	$4000
	lst	off

*-----------------------------
* SOFTSWITCHES & FRIENDS
*-----------------------------

WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord

maxY	=	191	; 0 to 191 = 192
nbLINES	=	200	; 200 lignes sur un CPC
deltaY	=	32

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010
VBL	=	$c019
VERTCNT	=	$c02e
SPKR	=	$c030
CYAREG	=	$C036
TXTCLR	=	$c050
TXTSET	=	$c051
MIXCLR	=	$c052
MIXSET	=	$c053
TXTPAGE1	=	$c054
TXTPAGE2	=	$c055
LORES	=	$c056
HIRES	=	$c057

*--- The firmware routines

HGR	=	$F3E2	; HGR
HPLOT	=	$F457	; HPLOT
HILIN	=	$F53A	; HPLOT TO
HCOLOR	=	$F6E9	; HCOLOR= (call+3)
INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
WAIT	=	$FCA8
RDKEY	=	$FD0C
GETLN1	=	$FD6F
PRBYTE	=	$FDDA
COUT	=	$FDED
IDROUTINE	=	$FE1F
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* MACROS
*-----------------------------------

@draw	mac
	ldx	#>]1
	ldy	#<]1
	jsr	drawPICTURE
	eom

*-----------------------------
* CODE
*-----------------------------

	jsr	HGR
	sta	MIXSET
	jsr	HOME
	
	jsr	printCSTRING
	
	@draw	#picFRAME

	lda	#1
	jsr	showPIC
	jsr	RDKEY
	rts

*---

showPIC	asl
	tax
	lda	tblIMAGES,x
	sta	$fd
	lda	tblIMAGES+1,x
	sta	$fe
	ora	$fd
	bne	showPIC1
	rts

showPIC1	ldx	$fe
	ldy	$fd
	jsr	drawPICTURE
	rts

tblIMAGES	da	$bdbd
	da	L98CB
	da	filleNUE

*-----------------------------
* MOTEUR
*-----------------------------

picFRAME	hex	42
	dfb	0,0
	hex	41
	dfb	0,149
	hex	41
	dfb	199,149
	hex	41
	dfb	199,0
	hex	41
	dfb	0,0
	hex	00

*----------------------
* drawPICTURE
*----------------------

drawPICTURE
	sty	drawREAD+1
	stx	drawREAD+2

drawLOOP	jsr	drawREAD
	cmp	#0
	bne	drawPIC1
	rts		; the end

drawPIC1	pha
	and	#%11_000000
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sta	theINK	; c'est PEN mais bon

	pla
	lsr
	bcs	doLINE
	lsr
	bcs	doPLOT

* fill

	jsr	drawREAD
	jsr	drawREAD
	jmp	drawLOOP

*----------------------------------- PLOT

doPLOT	jsr	drawREAD
	sta	theX
	jsr	drawREAD
	sta	theY
	
	lda	#nbLINES
	sec
	sbc	theY
	sta	theY
	jmp	drawLOOP

*----------------------------------- LINE ABS

doLINE	jsr	drawREAD
	sta	theX2

	jsr	drawREAD
	sta	theY2

	lda	#nbLINES
	sec
	sbc	theY2
	sta	theY2

*---------- Check height

	lda	theY
	cmp	#maxY
	bcc	doD1
	lda	#maxY
	sta	theY

doD1	lda	theY2
	cmp	#maxY
	bcc	doD2
	lda	#maxY
	sta	theY2
doD2
	
*---------- It is now time to draw as we have all variables

	ldy	theINK	; the ink color
	ldy	#0	; LOGO
	ldx	oric2hgr,y	; from the Oric to the Apple II
	jsr	HCOLOR+3	; to skip CHRGET 

	ldx	theX	; HPLOT x,y
	ldy	theX+1
	lda	theY
	sec
	sbc	#deltaY
	jsr	HPLOT

	ldy	theY2
	lda	theY2
	sec
	sbc	#deltaY
	tay
	lda	theX2	; TO x2,Y2
	ldx	theX2+1
	jsr	HILIN	; draw the line

	lda	X0L	; save the updated coords
	sta	theX
	lda	X0H
	sta	theX+1
	lda	Y0
	clc
	adc	#deltaY
	sta	theY
	jmp	drawLOOP

*-------- Read data
	
drawREAD	lda	$bdbd
	inc	drawREAD+1
	bne	drawREAD1
	inc	drawREAD+2
drawREAD1	rts
	
*----------------------
* Donnes du moteur
*----------------------

theX	dw	140	; milieu de l'cran par dfaut
theY	dw	96
theX2	ds	2
theY2	ds	2
theRADIUS	ds	1
theFB	ds	1
theINK	ds	1
thePAPER	ds	1

*	APPLE	ORIC
* 0	black1	black
* 1	green	red
* 2	blue	green
* 3	white1	yellow
* 4	black2	blue
* 5	-	magenta
* 6	-	cyan
* 7	white2	white

oric2hgr	hex	0705010602030400

*-----------------------------
* DONNEES
*-----------------------------

*	put	common/images.s
*	put	fr/fr.s

*-----------------------------

printCSTRING
	sty	pcs1+1
	stx	pcs1+2
	
	lda	#0
	sta	CH
	lda	#20
	jsr	TABV
	
pcs1	lda	$ffff
	beq	pcs3
	jsr	COUT	
	inc	pcs1+1
	bne	pcs1
	inc	pcs1+2
	bne	pcs1
pcs3	rts

*---

filleNUE    DB    $48
            DB    $10
            DB    $18
            DB    $42
            DB    $47
            DB    $01
            DB    $41
            DB    $47
            DB    $1A
            DB    $41
            DB    $40
            DB    $1A
            DB    $41
            DB    $40
            DB    $20
            DB    $41
            DB    $93
            DB    $20
            DB    $41
            DB    $AD
            DB    $15
            DB    $41
            DB    $AD
            DB    $10
            DB    $41
            DB    $93
            DB    $1A
            DB    $41
            DB    $48
            DB    $1A
            DB    $42
            DB    $93
            DB    $1A
            DB    $41
            DB    $93
            DB    $20
            DB    $42
            DB    $90
            DB    $19
            DB    $41
            DB    $90
            DB    $01
            DB    $42
            DB    $A9
            DB    $11
            DB    $41
            DB    $A9
            DB    $01
            DB    $C2
            DB    $5F
            DB    $62
            DB    $41
            DB    $5D
            DB    $6B
            DB    $41
            DB    $57
            DB    $7F
            DB    $41
            DB    $57
            DB    $85
            DB    $41
            DB    $60
            DB    $8E
            DB    $41
            DB    $6B
            DB    $8D
            DB    $41
            DB    $75
            DB    $82
            DB    $41
            DB    $78
            DB    $72
            DB    $41
            DB    $76
            DB    $6F
            DB    $41
            DB    $74
            DB    $5F
            DB    $41
            DB    $72
            DB    $65
            DB    $41
            DB    $71
            DB    $73
            DB    $41
            DB    $6E
            DB    $7A
            DB    $41
            DB    $67
            DB    $84
            DB    $41
            DB    $63
            DB    $86
            DB    $41
            DB    $61
            DB    $81
            DB    $41
            DB    $5D
            DB    $84
            DB    $41
            DB    $5C
            DB    $79
            DB    $41
            DB    $62
            DB    $71
            DB    $41
            DB    $65
            DB    $71
            DB    $41
            DB    $6E
            DB    $78
            DB    $42
            DB    $63
            DB    $71
            DB    $41
            DB    $5F
            DB    $6F
            DB    $41
            DB    $5F
            DB    $6C
            DB    $41
            DB    $62
            DB    $66
            DB    $41
            DB    $5D
            DB    $5E
            DB    $41
            DB    $5E
            DB    $5E
            DB    $41
            DB    $5F
            DB    $5B
            DB    $41
            DB    $62
            DB    $59
            DB    $41
            DB    $66
            DB    $57
            DB    $42
            DB    $64
            DB    $57
            DB    $41
            DB    $63
            DB    $53
            DB    $41
            DB    $69
            DB    $48
            DB    $41
            DB    $68
            DB    $40
            DB    $41
            DB    $6B
            DB    $38
            DB    $41
            DB    $6C
            DB    $34
            DB    $42
            DB    $6A
            DB    $38
            DB    $41
            DB    $5C
            DB    $30
            DB    $41
            DB    $4E
            DB    $21
            DB    $42
            DB    $57
            DB    $21
            DB    $41
            DB    $64
            DB    $2D
            DB    $41
            DB    $75
            DB    $38
            DB    $42
            DB    $7E
            DB    $21
            DB    $41
            DB    $81
            DB    $23
            DB    $41
            DB    $85
            DB    $21
            DB    $42
            DB    $8B
            DB    $21
            DB    $41
            DB    $87
            DB    $26
            DB    $41
            DB    $84
            DB    $2C
            DB    $42
            DB    $72
            DB    $21
            DB    $41
            DB    $83
            DB    $2C
            DB    $41
            DB    $86
            DB    $32
            DB    $41
            DB    $85
            DB    $39
            DB    $41
            DB    $80
            DB    $41
            DB    $41
            DB    $7B
            DB    $4B
            DB    $41
            DB    $7E
            DB    $51
            DB    $41
            DB    $7F
            DB    $55
            DB    $41
            DB    $87
            DB    $4A
            DB    $41
            DB    $84
            DB    $46
            DB    $42
            DB    $87
            DB    $4A
            DB    $41
            DB    $89
            DB    $4C
            DB    $42
            DB    $84
            DB    $3C
            DB    $41
            DB    $8F
            DB    $47
            DB    $41
            DB    $90
            DB    $4A
            DB    $41
            DB    $88
            DB    $5B
            DB    $41
            DB    $85
            DB    $63
            DB    $41
            DB    $78
            DB    $70
            DB    $42
            DB    $77
            DB    $94
            DB    $41
            DB    $77
            DB    $7A
            DB    $42
            DB    $84
            DB    $94
            DB    $41
            DB    $84
            DB    $65
            DB    $42
            DB    $84
            DB    $4D
            DB    $41
            DB    $84
            DB    $3D
            DB    $54
            DB    $7A
            DB    $93
            DB    $54
            DB    $7E
            DB    $4C
            DB    $42
            DB    $7F
            DB    $56
            DB    $41
            DB    $7A
            DB    $5C
            DB    $41
            DB    $79
            DB    $5F
            DB    $41
            DB    $7A
            DB    $62
            DB    $42
            DB    $6D
            DB    $65
            DB    $41
            DB    $68
            DB    $61
            DB    $41
            DB    $66
            DB    $5E
            DB    $41
            DB    $67
            DB    $5A
            DB    $41
            DB    $6C
            DB    $57
            DB    $41
            DB    $73
            DB    $59
            DB    $42
            DB    $6A
            DB    $5D
            DB    $82
            DB    $7C
            DB    $4D
            DB    $81
            DB    $7C
            DB    $48
            DB    $42
            DB    $84
            DB    $2D
            DB    $42
            DB    $6C
            DB    $3D
            DB    $42
            DB    $6C
            DB    $3E
            DB    $42
            DB    $6D
            DB    $34
            DB    $41
            DB    $6C
            DB    $36
            DB    $41
            DB    $6F
            DB    $35
            DB    $42
            DB    $6D
            DB    $35
            DB    $A4
            DB    $54
            DB    $22
            DB    $A4
            DB    $87
            DB    $22
            DB    $A4
            DB    $60
            DB    $22
            DB    $A4
            DB    $6B
            DB    $79
            DB    $F4
            DB    $74
            DB    $6E
            DB    $42
            DB    $67
            DB    $81
            DB    $41
            DB    $64
            DB    $7F
            DB    $42
            DB    $65
            DB    $7D
            DB    $42
            DB    $5D
            DB    $7D
            DB    $41
            DB    $5F
            DB    $7D
            DB    $42
            DB    $5E
            DB    $7B
            DB    $82
            DB    $68
            DB    $73
            DB    $82
            DB    $60
            DB    $74
            DB    $42
            DB    $63
            DB    $7A
            DB    $42
            DB    $62
            DB    $79
            DB    $42
            DB    $62
            DB    $78
            DB    $42
            DB    $63
            DB    $78
            DB    $42
            DB    $63
            DB    $7B
            DB    $42
            DB    $65
            DB    $76
            DB    $41
            DB    $62
            DB    $76
            DB    $42
            DB    $64
            DB    $75
            DB    $42
            DB    $63
            DB    $75
            DB    $42
            DB    $6D
            DB    $66
            DB    $42
            DB    $6D
            DB    $67
            DB    $42
            DB    $66
            DB    $71
            DB    $41
            DB    $68
            DB    $6F
            DB    $41
            DB    $68
            DB    $6D
            DB    $82
            DB    $69
            DB    $49
            DB    $81
            DB    $69
            DB    $44
            DB    $42
            DB    $68
            DB    $44
            DB    $41
            DB    $67
            DB    $4A
            DB    $42
            DB    $63
            DB    $57
            DB    $41
            DB    $63
            DB    $55
            DB    $82
            DB    $7B
            DB    $4D
            DB    $81
            DB    $7B
            DB    $49
            DB    $B4
            DB    $49
            DB    $02
            DB    $74
            DB    $95
            DB    $02
            DB    $64
            DB    $43
            DB    $1C
            DB    $54
            DB    $97
            DB    $1C
            DB    $42
            DB    $69
            DB    $49
            DB    $00

L98CB       DB    $48	; The missing picture (patch line 3300)
            DB    $10
            DB    $18
            DB    $42
            DB    $01
            DB    $01
            DB    $41
            DB    $58
            DB    $69
            DB    $41
            DB    $58
            DB    $94
            DB    $42
            DB    $59
            DB    $69
            DB    $41
            DB    $90
            DB    $69
            DB    $42
            DB    $98
            DB    $69
            DB    $41
            DB    $C6
            DB    $69
            DB    $42
            DB    $91
            DB    $90
            DB    $41
            DB    $91
            DB    $58
            DB    $41
            DB    $98
            DB    $58
            DB    $41
            DB    $98
            DB    $90
            DB    $41
            DB    $91
            DB    $90
            DB    $42
            DB    $90
            DB    $60
            DB    $41
            DB    $8A
            DB    $60
            DB    $41
            DB    $72
            DB    $43
            DB    $41
            DB    $72
            DB    $3F
            DB    $41
            DB    $9B
            DB    $3F
            DB    $41
            DB    $AC
            DB    $5B
            DB    $41
            DB    $AC
            DB    $60
            DB    $41
            DB    $99
            DB    $60
            DB    $42
            DB    $AB
            DB    $5F
            DB    $41
            DB    $9A
            DB    $44
            DB    $41
            DB    $73
            DB    $44
            DB    $42
            DB    $76
            DB    $3E
            DB    $41
            DB    $76
            DB    $2B
            DB    $41
            DB    $99
            DB    $2B
            DB    $41
            DB    $AA
            DB    $49
            DB    $41
            DB    $AA
            DB    $57
            DB    $42
            DB    $98
            DB    $2C
            DB    $41
            DB    $98
            DB    $3E
            DB    $42
            DB    $01
            DB    $3D
            DB    $41
            DB    $55
            DB    $74
            DB    $42
            DB    $01
            DB    $71
            DB    $41
            DB    $55
            DB    $83
            DB    $42
            DB    $0B
            DB    $73
            DB    $41
            DB    $0B
            DB    $93
            DB    $42
            DB    $39
            DB    $7E
            DB    $41
            DB    $39
            DB    $93
            DB    $42
            DB    $23
            DB    $77
            DB    $41
            DB    $23
            DB    $57
            DB    $42
            DB    $4A
            DB    $6E
            DB    $41
            DB    $4A
            DB    $7F
            DB    $42
            DB    $39
            DB    $61
            DB    $41
            DB    $39
            DB    $47
            DB    $42
            DB    $0B
            DB    $0E
            DB    $41
            DB    $0B
            DB    $41
            DB    $54
            DB    $95
            DB    $5B
            DB    $42
            DB    $9A
            DB    $40
            DB    $41
            DB    $9A
            DB    $43
            DB    $54
            DB    $AA
            DB    $5B
            DB    $64
            DB    $96
            DB    $42
            DB    $74
            DB    $A8
            DB    $4F
            DB    $F4
            DB    $95
            DB    $3B
            DB    $B4
            DB    $8C
            DB    $5E
            DB    $F4
            DB    $02
            DB    $06
            DB    $74
            DB    $5A
            DB    $93
            DB    $42
            DB    $92
            DB    $57
            DB    $41
            DB    $97
            DB    $57
            DB    $00
            DB    $00
            DB    $00
