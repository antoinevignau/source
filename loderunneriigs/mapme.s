*
* Lode Runner
* Map Me
*

	mx	%11
	org	$1000
	lst	off

*---------------------------------------

lvlWIDTH	=	28	; $1c
lvlHEIGHT	=	16	; $10

sprWIDTH	=	10
sprHEIGHT	=	11
sprBYTES	=	5

ptrSPR	=	$f8
ptrHGR1	=	$fa
theLEVEL	=	$fe

ptrLEVELS	=	$020000

*---------------------------------------
* ENTRY POINTS
*---------------------------------------

	jmp	initALL	; 4096
	jmp	printLEVEL	; 4099
	jmp	copyONE	; 4102
	
*---------------------------------------
* COPIE L'IMAGE SECONDE PARTIE
*---------------------------------------

	clc		; 4105
	xce
	rep	#$30
	
	ldx	#16384-2
]lp	ldal	$e16000,x
	stal	$002000,x
	dex
	dex
	bpl	]lp

	sec
	xce
	sep	#$30
	rts

*---------------------------------------

copyONE	clc
	xce
	rep	#$30
	
	ldx	#16384-2
]lp	ldal	$e12000,x
	stal	$002000,x
	dex
	dex
	bpl	]lp

	sec
	xce
	sep	#$30
	rts

*---------------------------------------
* GERE L'AFFICHAGE
*---------------------------------------

printLEVEL	clc
	xce
	rep	#$30
	
	lda	theLEVEL
	and	#$ff
	dec
	xba
	sta	monNIV+1
	
	stz	theX
	stz	theY
	
	sep	#$30

	ldx	#0
]lp	phx
monNIV	ldal	ptrLEVELS,x
	jsr	drawME
	plx
	inx
	cpx	#224
	bcc	]lp

*-----------

	lda	theLEVEL
	jsr	hex2dec
	lda	theCENTAINE
	jsr	coutNB
	lda	theDIZAINE
	jsr	coutNB
	lda	theUNITE
	jsr	coutNB
	
	sec
	xce
	sep	#$30
	rts
		
*---------------------------------------
* INIT SHR AND FRIENDS
*---------------------------------------

initALL	clc
	xce
	rep	#$30
	ldx	#0
	txa
]lp	stal	$e12000,x
	inx
	inx
	bpl	]lp
	
	ldx	#32-2
]lp	lda	palette320,x
	stal	$e19e00,x
	dex
	dex
	bpl	]lp

	sec
	xce
	sep	#$30
	lda	#$c1
	sta	$c029
	rts
	
*---------------------------------------
* PRINT CHAR - TATA
*---------------------------------------

	mx	%11

coutNB	clc
	adc	#10
	bne	coutHGR
	
drawME	pha
	and	#$0f
	jsr	coutHGR
	pla
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	
coutHGR	STA	theA	; char in $1E

	LDY	theY	; take Y
	LDA	ytable,Y	;  in: board X/Y
	TAY
	LDA	xhgr,Y
	STA	ptrHGR1
	LDA	yhgr,Y
	STA	ptrHGR1+1
	lda	#$e1
	sta	ptrHGR1+2

	ldx	theX
	LDA	xtable,X

	rep	#$30

	and	#$ff
	clc
	adc	ptrHGR1
	sta	ptrHGR1
	
	lda	theA	; X for sprite
	and	#$ff
	asl
	tax
patchSPR1	lda	tblSPRITES,x
	sta	ptrSPR

	lda	#sprHEIGHT
	sta	nbLINES2

outerCOUT	lda	#0
	tax
	tay

	sep	#$30

]lp	lda	(ptrSPR),y
	sta	[ptrHGR1],y
	iny
	cpy	#sprBYTES
	bcc	]lp
	
	rep	#$30

	lda	ptrHGR1
	clc
	adc	#160
	sta	ptrHGR1
	
	lda	ptrSPR
	clc
	adc	#sprBYTES
	sta	ptrSPR
	
	dec	nbLINES2
	bne	outerCOUT

	sep	#$30
	
	inc	theX
	lda	theX
	cmp	#lvlWIDTH
	bcc	coutHGR9
	stz	theX
	inc	theY
coutHGR9	rts

*-------------------------------
* CONVERSION
*-------------------------------

hex2dec	LDX	#$00
	STX	theDIZAINE
	STX	theCENTAINE	; centaine
L7AFE	CMP	#100
	BCC	L7B08
	INC	theCENTAINE
	SBC	#100
	BNE	L7AFE
L7B08	CMP	#10
	BCC	L7B12
	INC	theDIZAINE
	SBC	#10
	BNE	L7B08
L7B12	STA	theUNITE
	RTS

*-------------------------------
* DATA
*-------------------------------

theCENTAINE	ds	2
theDIZAINE	ds	2
theUNITE	ds	2

nbLINES2	ds	2
theA	ds	2
theX	ds	2
theY	ds	2

*--- Palette

palette320	dw	$0000,$0777,$0841,$072C,$000F,$0080,$0F70,$0D00
	dw	$0FA9,$0FF0,$00E0,$04DF,$0DAF,$078F,$0CCC,$0FFF

*--- Line numbers

xhgr
]debut	=	$2000
	lup	190
	dfb	<]debut
]debut	=	]debut+160
	--^

yhgr
]debut	=	$2000
	lup	190
	dfb	>]debut
]debut	=	]debut+160
	--^

*--- From a X in board to a X in HGR

xtable
]debut	=	10
	lup	lvlWIDTH
	dfb	]debut
]debut	=	]debut+5
	--^

*--- From a Y in board to a Y in HGR

ytable	DB	$00	; HGR line index
	DB	$0B	;   0.11.22.33
	DB	$16	;  22
	DB	$21	;  33
	DB	$2C	;  44
	DB	$37	;  55
	DB	$42	;  66
	DB	$4D	;  77
	DB	$58	;  88
	DB	$63	;  99
	DB	$6E	; 110
	DB	$79	; 121
	DB	$84	; 132
	DB	$8F	; 143
	DB	$9A	; 154
	DB	$A5	; 165
	DB	$B5	; 181	; ligne de texte

tblSPRITES
	da	spr00
	da	spr01
	da	spr02
	da	spr03
	da	spr04
	da	spr05
	da	spr06
	da	spr07
	da	spr08
	da	spr09
	da	spr3B
	da	spr3C
	da	spr3D
	da	spr3E
	da	spr3F
	da	spr40
	da	spr41
	da	spr42
	da	spr43
	da	spr44
	
spr00	hex	0000000000	; empty
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
spr01	hex	4444400044	; diggable floor
	hex	4444400044
	hex	4444400044
	hex	4444400044
	hex	0000000000
	hex	4000444444
	hex	4000444444
	hex	4000444444
	hex	4000444444
	hex	4000444444
	hex	0000000000
spr02	hex	4444444444	; solid floor
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	4444444444
	hex	0000000000
spr03	hex	0FF0000FF0	; ladder
	hex	0FF0000FF0
	hex	0FFFFFFFF0
	hex	0FF0000FF0
	hex	0FF0000FF0
	hex	0FF0000FF0
	hex	0FF0000FF0
	hex	0FFFFFFFF0
	hex	0FF0000FF0
	hex	0FF0000FF0
	hex	0FF0000FF0
spr04	hex	0000000000	; bar
	hex	FFFFFFFFFF
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
spr05	hex	4444444440	; trap
	hex	4444444440
	hex	0000000000
	hex	00FFFFFF00
	hex	0000FF0000
	hex	0000FF0000
	hex	0000FF0000
	hex	0000FF0000
	hex	4444444440
	hex	4444444440
	hex	0000000000
spr06	hex	0FF0000000	; invisible ladder
	hex	0FF0000000
	hex	0FFFFFFFF0
	hex	0FF0000FF0
	hex	0000000FF0
	hex	0000000FF0
	hex	0000000FF0
	hex	0FF0000FF0
	hex	0FFFFFFFF0
	hex	0FF0000000
	hex	0FF0000000
spr07	hex	0000000000	; chest
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	0000000000
	hex	000FFFFF00
	hex	0006666600
	hex	000FFFFF00
	hex	0006666600
	hex	000FFFFF00
	hex	0000000000
spr08	hex	0000400000	; foe
	hex	0006660000
	hex	0006660000
	hex	0000060000
	hex	0006666600
	hex	0600060006
	hex	00000FF000
	hex	0000FFF000
	hex	000FF4FFFF
	hex	000FF00000
	hex	000FF00000
spr09	hex	0000004000	; hero runs right 1
	hex	00000FFF00
	hex	00000FFF00
	hex	0000FFF000
	hex	00FF6FFF00
	hex	0FF4FF00FF
	hex	0000FF0000
	hex	0000FFF000
	hex	0FFFF4FF00
	hex	000000FF00
	hex	000000FF00
spr3B	hex	0000000000	; 0
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000600
	hex	0600000600
	hex	0600000600
	hex	0600066600
	hex	0600066600
	hex	0600066600
	hex	0666666600
spr3C	hex	0000000000	; 1
	hex	0000000000
	hex	0000000000
	hex	0006660000
	hex	0006660000
	hex	0000060000
	hex	0000060000
	hex	0000060000
	hex	0000060000
	hex	0006666600
	hex	0006666600
spr3D	hex	0000000000	; 2
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000600
	hex	0000000600
	hex	0666666600
	hex	0600000000
	hex	0600000000
	hex	0600066600
	hex	0666666600
spr3E	hex	0000000000	; 3
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000600
	hex	0000000600
	hex	0006666600
	hex	0000000600
	hex	0000000600
	hex	0600000600
	hex	0666666600
spr3F	hex	0000000000	; 4
	hex	0000000000
	hex	0000000000
	hex	0666000600
	hex	0666000600
	hex	0666000600
	hex	0666666600
	hex	0000000600
	hex	0000000600
	hex	0000000600
	hex	0000000600
	
*--- 40..4F

spr40	hex	0000000000	; 5
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000000
	hex	0600000000
	hex	0666666600
	hex	0000066600
	hex	0000066600
	hex	0000066600
	hex	0666666600
spr41	hex	0000000000	; 6
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000600
	hex	0600000000
	hex	0600000000
	hex	0666666600
	hex	0600066600
	hex	0600066600
	hex	0666666600
spr42	hex	0000000000	; 7
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0000066600
	hex	0000066600
	hex	0000066600
	hex	0006660000
	hex	0006000000
	hex	0006000000
	hex	0006000000
spr43	hex	0000000000	; 8
	hex	0000000000
	hex	0000000000
	hex	0006666600
	hex	0006000600
	hex	0006000600
	hex	0666666600
	hex	0600000600
	hex	0600000600
	hex	0600000600
	hex	0666666600
spr44	hex	0000000000	; 9
	hex	0000000000
	hex	0000000000
	hex	0666666600
	hex	0600000600
	hex	0600000600
	hex	0666666600
	hex	0000066600
	hex	0000066600
	hex	0000066600
	hex	0000066600