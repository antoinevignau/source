*
* Le manoir du Dr Genius
*

	mx	%11
	org	$1800
	lst	off

*-----------------------------------

GOSUBTKN	=	$b0	; the GOSUB token

WNDLFT	=	$20	; left edge of text window 
WNDWDTH	=	$21	; width of text window 
WNDTOP	=	$22	; top of text window 
WNDBTM	=	$23	; bottom+1 of text window 
CH	=	$24	; cursor horizontal position 
CV	=	$25	; cursor vertical position 
LINNUM	=	$50	; result from GETADR
CURLIN	=	$75	; current line number
DATPTR	=	$7d	; DATA statement pointer
FORPNT	=	$85  	; temp pointer
LOWTR	=	$9b	; FNDLIN puts link ptr here
CHRGET	=	$b1  	; get next program token
TXTPTR	=	$b8	; current token address
X0L	=	$e0	; X-coord
X0H	=	$e1
Y0	=	$e2	; Y-coord
HPAG	=	$e6
AMPERV	=	$3f5

GETSTK	=	$d3d6	; check stack space
FNDLIN	=	$d61a	; find line in memory
NEWSTT	=	$d7d2	; execute statements
GOTO	=	$d93e	; go to new line number
FRMNUM	=	$dd67	; Evaluate a numeric expression
CHKCOM	=	$debe	; syntax error if no comma
SYNERR	=	$dec9	; syntax error
GETADR	=	$e752	; convert num to 2-byte int
HGR	=	$f3e2	; HGR
HPLOT	=	$f457	; HPLOT
HCOLOR	=	$f6e9	; HCOLOR= (call+3)
HILIN	=	$f53a	; HPLOT TO
HOME	=	$fc58	; HOME routine
WAIT	=	$fca8	; WAIT routine

*-----------------------------------
* Useful info @ https://llx.com/Neil/a2/as.addons.html

* Les routines & qu'on fait :
*  CURMOV	M
*  CURSET	S
*  INK	I
*  PAPER	P
*  HIRES	H
*  WAIT	W
*  DRAW	D
*  RESTORE  R to a line number
*  GOSUB    G to an expression

*
* On ne fait pas :
*  CIRCLE	C
*  EXPLODE	E
*
* On des/installe par CALL 6144

*-----------------------------------

myENTRY	lda	#0
	bne	doUNINSTALL

	inc	myENTRY+1	; on dit qu'on installe
	
	lda	AMPERV	; on sauve
	sta	myPTR
	lda	AMPERV+1
	sta	myPTR+1
	lda	AMPERV+2
	sta	myPTR+2

	lda	#$4c	; on installe le vecteur
	sta	AMPERV
	lda	#<myVECTOR
	sta	AMPERV+1
	lda	#>myVECTOR
	sta	AMPERV+2
	rts

doUNINSTALL	dec	myENTRY+1

	lda	myPTR
	sta	AMPERV
	lda	myPTR+1
	sta	AMPERV+1
	lda	myPTR+2
	sta	AMPERV+2
	rts

myPTR	ds	3	; 4C xx yy

*-----------------------------------

myVECTOR	ldx	#myADRS-myCMDS-1
]lp	cmp	myCMDS,x
	beq	doVECTOR
	dex
	bpl	]lp
	jmp	SYNERR

doVECTOR	txa
	asl
	tax
	lda	myADRS+1,x
	pha
	lda	myADRS,x
	pha
	rts
	
myCMDS	asc	'SMDCIPHWERG'

myADRS	da	doS-1
	da	doM-1
	da	doD-1
	da	doC-1
	da	doI-1
	da	doP-1
	da	doH-1
	da	doW-1
	da	doE-1
	da	doR-1
	da	doG-1
	
*----------------------------------- Data

theX	dw	140	; milieu de l'écran par défaut
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

*----------------------------------- CURSET x,y,fb

doS	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theX
	lda	LINNUM+1
	sta	theX+1	; new X-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theY
	lda	LINNUM+1
	sta	theY+1	; new Y-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theFB
	rts

*----------------------------------- CURMOV x,y,fb

doM
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	clc
	adc	theX
	sta	theX
	lda	LINNUM+1
	adc	theX+1
	sta	theX+1	; new X-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	clc
	adc	theY
	sta	theY
	lda	LINNUM+1
	adc	theY+1
	sta	theY+1	; new Y-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theFB
	rts

*----------------------------------- DRAW x,y,fb

doD	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	clc
	adc	theX
	sta	theX2
	lda	LINNUM+1
	adc	theX+1
	sta	theX2+1	; new X-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	clc
	adc	theY
	sta	theY2
	lda	LINNUM+1
	adc	theY
	sta	theY2+1	; new Y-coord

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theFB

*---------- It is now time to draw as we have all variables

	ldy	theINK	; the ink color
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
	rts
	
*----------------------------------- CIRCLE n,fb

doC	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theRADIUS	; the radius

	jsr	CHKCOM	; check for comma
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theFB	; the foreground color
	rts

*----------------------------------- INK fb

doI
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	theINK
	rts

*----------------------------------- PAPER fb

doP	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	lda	LINNUM
	sta	thePAPER
	rts

*----------------------------------- HIRES

doH
	jsr	CHRGET	; get next token

	lda	#0
	sta	WNDLFT
	lda	#40
	sta	WNDWDTH
	lda	#20
	sta	WNDTOP
	lda	#24
	sta	WNDBTM
	jsr	HOME

	jsr	HGR
	rts

*----------------------------------- WAIT x

doW	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int

	ldx	LINNUM+1
doW1	ldy	LINNUM
]lp	lda	#60	; 1/100ème de seconde
	jsr	WAIT
	dey
	bne	]lp
	dex
	bpl	doW1
	rts

*----------------------------------- EXPLODE

doE	
	jsr	CHRGET
	rts

*----------------------------------- RESTORE address

doR	
	jsr	CHRGET	; get next token
	jsr	FRMNUM	; eval expression
	jsr	GETADR	; convert to int
	jsr	FNDLIN	; find chosen line no.

	ldy	LOWTR+1	; point DATPTR at byte before it
	ldx	LOWTR
	bne	dx
	dey
dx	dex
	sty	DATPTR+1
	stx	DATPTR
	rts

*----------------------------------- GOSUB address

doG	
	lda	#3	; make sure there's enough stack
	jsr	GETSTK

	lda	TXTPTR+1	; push marker for RETURN
	pha
	lda	TXTPTR
	pha
	lda	CURLIN+1
	pha
	lda	CURLIN
	pha
	lda	#GOSUBTKN
	pha

	jsr	CHRGET	; get next token
	jsr	FRMNUM	; parse numeric expr
	jsr	GETADR	; convert it to int
	jsr	GOTO+3	; point at chosen statement
	jmp	NEWSTT	; start running it

*--- End of code

	asc	"(c) 2023, Antoine Vignau & Olivier Zardini"
