*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%00

*-----------------------------------
* EQUATES
*-----------------------------------

freqRUNNER	=	2
freqWALL	=	4

*-----------------------------------
* LES ROUTINES D'INTERRUPTION
*-----------------------------------

*--- DŽplace les murs sur la gauche

intWALL	ds	4
	dw	freqWALL
	dw	$a55a

	rep	#$30

	lda	#freqWALL
	stal	intWALL+4

	ldal	$e19e02
	pha
	ldal	$e19e02+4
	stal	$e19e00+2
	ldal	$e19e02+6
	stal	$e19e00+4
	ldal	$e19e02+8
	stal	$e19e00+6
	ldal	$e19e02+10
	stal	$e19e00+8
	ldal	$e19e02+12
	stal	$e19e00+10
	ldal	$e19e02+14
	stal	$e19e00+12
	ldal	$e19e02+16
	stal	$e19e00+14
	pla
	stal	$e19e02+16

	sep	#$30
	clc
	rtl
	
*--- DŽplace Lode Runner

	mx	%00
	
intRUNNER	ds	4
	dw	freqRUNNER
	dw	$a55a

	phb
	phk
	plb
	rep	#$30

	lda	#freqRUNNER
	sta	intRUNNER+4
	
]lp	ldx	iANIM
	lda	tblANIM,x
	and	#$ff
	cmp	#$ff
	bne	showSPRITE
	
	lda	#32
	sta	iANIM
	bra	]lp

showSPRITE	asl
	tax
	ldy	tblRUNNER,x
	ldx	xPOS
]lp	lda	|$0000,y
	stal	$e12000,x
	lda	|$0002,y
	stal	$e12002,x
	lda	|$0004,y
	stal	$e12004,x
	lda	|$0006,y
	stal	$e12006,x
	lda	|$0008,y
	stal	$e12008,x
	lda	|$000A,y
	stal	$e1200A,x
	lda	|$000C,y
	stal	$e1200C,x
	lda	|$000E,y
	stal	$e1200E,x
	lda	|$0010,y
	stal	$e12010,x
	lda	|$0012,y
	stal	$e12012,x
	lda	|$0014,y
	stal	$e12014,x
	lda	|$0016,y
	stal	$e12016,x
	lda	|$0018,y
	stal	$e12018,x
	lda	|$001A,y
	stal	$e1201A,x
	lda	|$001C,y
	stal	$e1201C,x
	lda	|$001E,y
	stal	$e1201E,x

	tya
	clc
	adc	#32
	tay

	txa
	clc
	adc	#160
	tax
	cpx	#114*160	; max 54 lignes below = 60 + 54
	bcs	endSPRITE
	brl	]lp

*---

endSPRITE	inc	iANIM

	lda	iANIM	; move x-pos every 2 steps
	cmp	#32	; to make it run
	bcs	exitSPRITE
	inc	xPOS
	
exitSPRITE	sep	#$30
	plb
	clc
	rtl

	mx	%00
	
*-----------------------------------
* DATA
*-----------------------------------

xPOS	dw	$2580	; position sur l'Žcran SHR
iANIM	dw	0	; index dans tblANIM

*		                    1                   2                   3                   4
*		0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9
tblANIM
*	dfb	1,2,2,3,3,4,5,6,6,2,7,7,4,4,5,8,8,2,2,7,3,3,5,5,8,6,6,7,7,4,4,8
	dfb	1,2,7,3,3,4,5,5,8,6,6,2,7,7,3,4,4,5,8,8,6,2,2,7,3,3,4,5,5,8,6,6
	dfb	2,7,7,3,4,4,5,8,8,6,2,2,7,3,3,4,5,5,8,6,6
	dfb	-1

tblRUNNER	da	$0000
	da	sprRUNNER1
	da	sprRUNNER2
	da	sprRUNNER3
	da	sprRUNNER4
	da	sprRUNNER5
	da	sprRUNNER6
	da	sprRUNNER7
	da	sprRUNNER8

	put	sprite1.s
	put	sprite2.s
	put	sprite3.s
	put	sprite4.s
	put	sprite5.s
	put	sprite6.s
	put	sprite7.s
	put	sprite8.s
