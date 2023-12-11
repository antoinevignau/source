*
* Kikekankoi : intro
*

	mx	%11
	org	$4000
	lst	off

*-----------------------------
* SOFTSWITCHES & FRIENDS
*-----------------------------

LINNUM	=	$50	; result from GETADR
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord

maxY	=	191	; 0 to 191 = 192
nbLINES	=	200	; 200 lignes sur un CPC

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

	lda	#1
	sta	SALLE
	
loop	lda	SALLE
	jsr	showPIC
	bcs	theEND

]lp	lda	KBD
	bpl	]lp
	bit	KBDSTROBE
	
	inc	SALLE
	bne	loop
	
theEND	rts

*---

showPIC	asl
	tax
	lda	tblIMAGES,x
	sta	$fe
	lda	tblIMAGES+1,x
	sta	$ff
	ora	$fe
	bne	showPIC1
	sec
	rts
showPIC1	jsr	HGR
	sta	MIXCLR

	@draw	#picFRAME

	ldx	$ff
	ldy	$fe
	jsr	drawPICTURE
	clc
	rts

*---

SALLE	ds	1
	
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
	jsr	HPLOT

	lda	theX2	; TO x2,Y2
	ldx	theX2+1
	ldy	theY2
	jsr	HILIN	; draw the line

	lda	X0L	; save the updated coords
	sta	theX
	lda	X0H
	sta	theX+1
	lda	Y0
	sta	theY
	jmp	drawLOOP

*-------- Read data
	
drawREAD	lda	$bdbd
	inc	drawREAD+1
	bne	drawREAD1
	inc	drawREAD+2
drawREAD1	pha
	lda	drawREAD+2
	cmp	#$50
	bcc	drawREAD2
	pla
	lda	#0
	pha
drawREAD2	pla
	rts
	
*----------------------
* Donnes du moteur
*----------------------

theX	dw	140	; milieu de l'cran par dfaut
theY	ds	96
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

	put	common/images.s
