*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

	ext	picGENIUS
	ext	picMONDE

	ext	telexRECT
	ext	txtTELEX1
	ext	txtTELEX2
	ext	txtTELEX3
	ext	txtTELEX4
	ext	txtTELEX5
	
	ext	txtGENIUSTEXTE
	ext	txtSERPENT1
	ext	txtSERPENT2
	ext	txtSERPENT3
	ext	txtSERPENT4
	ext	txtECRITPAR1
	ext	txtECRITPAR2
	ext	txtECRITPAR3
	ext	txtECRITPAR4
	ext	txtECRITPAR5
	ext	txtECRITPAR6
	ext	txtMONDE
	ext	txtEXPLICATIONS1
	ext	txtEXPLICATIONS2
	ext	txtEXPLICATIONS3
	ext	txtEXPLICATIONS4

*-----------------------------------
* CODE
*-----------------------------------

intro	jsr	intro_telex
	bcs	intro_end
	jsr	intro_genius_texte
	bcs	intro_end
	jsr	intro_serpent
	bcs	intro_end
	jsr	intro_ecritpar
	bcs	intro_end
	jsr	intro_genius_image
	bcs	intro_end
	jsr	intro_monde
	bcs	intro_end
	jsr	intro_explications
intro_end	rts

*-----------------------------------
* TELEX
*-----------------------------------

	mx	%00

it1STLINE	=	18
it1stROW	=	10

intro_telex
	PushLong	#telexRECT
	PushWord	#$7777
	PushWord	#$7777
	_SpecialRect

	PushWord #$1000
	PushWord #$fffe		; Shaston 16
	PushWord #0
	_InstallFont

	PushWord	#0
	_GetTextMode
	
	PushWord	#modeForeCopy
	_SetTextMode
	
	PushWord	#it1stROW
	PushWord	#it1STLINE
	_MoveTo
	PushLong	#txtTELEX1
	_DrawCString
	
	PushWord	#it1stROW
	PushWord	#it1STLINE+20
	_MoveTo
	PushLong	#txtTELEX2
	_DrawCString

	PushWord	#it1stROW
	PushWord	#it1STLINE+40
	_MoveTo
	PushLong	#txtTELEX3
	_DrawCString

	PushWord	#it1stROW
	PushWord	#it1STLINE+60
	_MoveTo
	PushLong	#txtTELEX4
	_DrawCString

	PushWord	#it1stROW
	PushWord	#it1STLINE+80
	_MoveTo
	PushLong	#txtTELEX5
	_DrawCString

	_SetTextMode

	ldy	#60*3

*-----------

waitMS16	ldal	KBD-1
	bmi	waitMS169
	
]lp	ldal	RDVBLBAR-1
	bpl	]lp
]lp	ldal	RDVBLBAR-1
	bmi	]lp
	dey
	bne	waitMS16
waitMS168	clc
	rts
	
waitMSBIS	ldal	KBD-1
	bpl	waitMS168
	
waitMS169	stal	KBDSTROBE-1
	and	#$ff00
	cmp	#$9b00
	bne	waitMS168
	sec
	rts

*-----------------------------------
* GENIUS TEXTE
*-----------------------------------

	mx	%00

intro_genius_texte
	PushWord	#0
	_ClearScreen

	PushWord #$0800
	PushWord #$fffe		; Shaston 8
	PushWord #0
	_InstallFont

	lda	#txtGENIUSTEXTE
	sta	dpFROM
	lda	#^txtGENIUSTEXTE
	sta	dpFROM+2

	stz	textX
	lda	#charHEIGHT
	sta	textY

]lp	PushWord	textX
	PushWord	textY
	_MoveTo

	jsr	KEY	; retour en 8-bit
	rep	#$30
	
	jsr	waitMSBIS	; keypress?
	bcc	igt_ok
igt_end	rts
	
igt_ok	lda	[dpFROM]	; get char
	and	#$ff
	beq	igt_end
	cmp	#chrRET
	beq	igt_ret
	
	pha
	_DrawChar
	
	lda	textX	; next x
	clc
	adc	#charWIDTH
	sta	textX
	cmp	#maxX
	bcc	igt_next

igt_ret	stz	textX	; next line
	lda	textY
	clc
	adc	#16
	sta	textY
	
igt_next	ldy	#4	; wait 4/60eme
	jsr	waitMS16

	inc	dpFROM
	bra	]lp
	
*-----------------------------------
* ANIMATION DU SERPENT
*-----------------------------------

	mx	%00

intro_serpent
	PushWord	#0
	_ClearScreen

	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#redPATTERN
	_SetPenPat

	PushWord #$1000
	PushWord #$fffe		; Shaston 16
	PushWord #0
	_InstallFont

	PushWord	#90
	PushWord	#80
	_MoveTo

	PushLong	#txtSERPENT1
	_DrawCString

	PushLong	#curPATTERN
	_SetPenPat
	
	PushWord #$0800
	PushWord #$fffe		; Shaston 8
	PushWord #0
	_InstallFont

	PushWord	#92
	PushWord	#100
	_MoveTo

	PushLong	#txtSERPENT2
	_DrawCString

	PushWord	#110
	PushWord	#110
	_MoveTo

	PushLong	#txtSERPENT3
	_DrawCString

	PushWord	#102
	PushWord	#120
	_MoveTo

	PushLong	#txtSERPENT4
	_DrawCString

*-----------

	ldy	#60*30
	jmp	waitMS16

*-----------------------------------
* DE QUI EST CE LOGICIEL ?
*-----------------------------------

	mx	%00

intro_ecritpar
	PushWord	#$9999
	_ClearScreen
	
	jsr	petit_genius
	rts

*----------- Affiche le petit Genius

petit_genius
	lda	#picGENIUS
	sta	dpFROM
	lda	#^picGENIUS
	sta	dpFROM+2

	lda	ptrSCREEN
	clc
	adc	#56	; pour center
	sta	dpTO
	lda	ptrSCREEN+2
	sta	dpTO+2
	
	ldx	#0
pgLOOP	ldy	#0
	sep	#$20
]lp	lda	[dpFROM],y
	jsr	outputPG
	iny
	cpy	#17
	bcc	]lp

	rep	#$20
	
	lda	dpFROM
	clc
	adc	#17
	sta	dpFROM
	
	txa
	clc
	adc	#160-51	; 17x3 (6 bits = 3 pixels)
	tax
	cpx	#84*160	; 84 lignes
	bcc	pgLOOP

*-----------

	ldy	#60*5
	jmp	waitMS16

*-----------

	mx	%10

outputPG	phy
	pha
	txy
	
	lda	#$99
	sta	dpPX
	lda	1,s
	and	#%0010_0000
	beq	outputPG1
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputPG1	lda	1,s
	and	#%0001_0000
	beq	outputPG2
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputPG2	lda	dpPX
	sta	[dpTO],y
	iny
	
	lda	#$99
	sta	dpPX
	lda	1,s
	and	#%0000_1000
	beq	outputPG3
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputPG3	lda	1,s
	and	#%0000_0100
	beq	outputPG4
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputPG4	lda	dpPX
	sta	[dpTO],y
	iny

	lda	#$99
	sta	dpPX
	lda	1,s
	and	#%0000_0010
	beq	outputPG5
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputPG5	lda	1,s
	and	#%0000_0001
	beq	outputPG6
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputPG6	lda	dpPX
	sta	[dpTO],y
	iny
	tyx

	pla
	ply
	rts

*-----------------------------------
* GENIUS
*-----------------------------------

	mx	%00

intro_genius_image
	PushWord	#$7777
	_ClearScreen

	lda	#picGENIUS
	sta	dpFROM
	lda	#^picGENIUS
	sta	dpFROM+2

	lda	ptrSCREEN
	clc
	adc	#34	; pour center
	sta	dpTO
	lda	ptrSCREEN+2
	sta	dpTO+2
	
	ldx	#0
igLOOP	ldy	#0
	sep	#$20
]lp	lda	[dpFROM],y
	jsr	outputIG
	iny
	cpy	#17
	bcc	]lp

	rep	#$20
	
	lda	dpFROM
	clc
	adc	#17
	sta	dpFROM
	
	txa
	clc
	adc	#320-102	; 17x6 (6 bits = 3 pixels)
	tax
	cpx	#168*160	; 84x2 lignes
	bcc	igLOOP

*-----------

	ldy	#60*5
	jmp	waitMS16

*-----------

colIGBK	=	$77

	mx	%10

outputIG	phy
	pha
	txy
	
	lda	1,s
	and	#%0010_0000
	beq	outputIG1
	lda	#$00
	beq	outputIG1B
outputIG1	lda	#colIGBK
outputIG1B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny

	lda	1,s
	and	#%0001_0000
	beq	outputIG2
	lda	#$00
	beq	outputIG2B
outputIG2	lda	#colIGBK
outputIG2B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny

	lda	1,s
	and	#%0000_1000
	beq	outputIG3
	lda	#$00
	beq	outputIG3B
outputIG3	lda	#colIGBK
outputIG3B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny

	lda	1,s
	and	#%0000_0100
	beq	outputIG4
	lda	#$00
	beq	outputIG4B
outputIG4	lda	#colIGBK
outputIG4B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny

	lda	1,s
	and	#%0000_0010
	beq	outputIG5
	lda	#$00
	beq	outputIG5B
outputIG5	lda	#colIGBK
outputIG5B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny

	lda	1,s
	and	#%0000_0001
	beq	outputIG6
	lda	#$00
	beq	outputIG6B
outputIG6	lda	#colIGBK
outputIG6B	phy
	pha
	sta	[dpTO],y
	rep	#$20
	tya
	clc
	adc	#160
	tay
	sep	#$20
	pla
	sta	[dpTO],y
	ply
	iny
	tyx

	pla
	ply
	rts

*-----------------------------------
* LA UNE DU MONDE
*-----------------------------------

	mx	%00

intro_monde
	PushWord	#$ffff
	_ClearScreen

	lda	#picMONDE
	sta	dpFROM
	lda	#^picMONDE
	sta	dpFROM+2

	lda	ptrSCREEN
	clc
	adc	#20	; pour center
	sta	dpTO
	lda	ptrSCREEN+2
	sta	dpTO+2

*-----------

	ldx	#0
imLOOP	lda	#0
	tay
	sep	#$20

	lda	#$F0	; valeurs par défaut
	sta	dpCOL1
	lda	#$0F
	sta	dpCOL2
	stz	dpBK

]lp	lda	[dpFROM],y	; l'attribute
	jsr	outputIM
	iny
	cpy	#40
	bcc	]lp

	rep	#$20
	
	lda	dpFROM
	clc
	adc	#40
	sta	dpFROM
	
	txa
	clc
	adc	#40	; 160-(40*3)
	tax
	cpx	#160*200
	bcc	imLOOP

*-----------

	ldy	#60*5
	jmp	waitMS16

*--- Attribut d'un pixel
*
* ibbaaxxx
*   i: bit 7 - inverted bit (eor #$ff on the byte colors itself)
*  bb: bits 6-5 - both 0 mean attribute byte
*  aa: bits 4-3
*      00 : foreground color
*      01 : text attributes
*      10 : background color
*      11 : video mode
* xxx: bits 2-0
*     000 : black, red, green, yellow, blue magenta, cyan, white

* méthode simple : si le bit 6 est à 0, c'est un attribut et on sort 0
*                                    1, c'est un pixel
* 0x : foreground color
* 1x : background color

*----------- Output le pixel

	mx	%10
	
outputIM	phy
	pha

	lda	1,s		; bit 6 à 1, c'est un pixel
	and	#%0100_0000
	bne	gotPIXEL

	lda	1,s
	and	#%0001_0000		; est-ce que c'est le mode foreground color (00)?
	bne	attribute1		; non

	lda	1,s		; oui
	and	#%00000111
	tay
	lda	o2gsCOLP,y
	sta	dpCOL1
	lda	o2gsCOLI,y
	sta	dpCOL2
	bra	attribute2

attribute1	cmp	#%0001_0000 	; est-ce que c'est le mode background color (10)?
	bne	attribute2		; non

	lda	1,s
	and	#%00000111
	tay
	lda	o2gsBK,y
	sta	dpBK

attribute2	lda	#0		; on force un pixel vide
	sta	1,s

*--- c'est un pixel en fait
	
gotPIXEL	txy
	lda	dpBK
	sta	dpPX
	lda	1,s
	and	#%0010_0000
	beq	output1
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
output1	lda	1,s
	and	#%0001_0000
	beq	output2
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
output2	lda	1,s
	bpl	output2n
	lda	dpPX
	eor	#$ff
	sta	dpPX
output2n	lda	dpPX
	sta	[dpTO],y
	iny

	lda	dpBK
	sta	dpPX
	lda	1,s
	and	#%0000_1000
	beq	output3
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
output3	lda	1,s
	and	#%0000_0100
	beq	output4
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
output4	lda	1,s
	bpl	output4n
	lda	dpPX
	eor	#$ff
	sta	dpPX
output4n	lda	dpPX
	sta	[dpTO],y
	iny

	lda	dpBK
	sta	dpPX
	lda	1,s
	and	#%0000_0010
	beq	output5
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
output5	lda	1,s
	and	#%0000_0001
	beq	output6
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
output6	lda	1,s
	bpl	output6n
	lda	dpPX
	eor	#$ff
	sta	dpPX
output6n	lda	dpPX
	sta	[dpTO],y
	iny
	tyx
	
	pla
	ply
	rts

*-----------------------------------
* EXPLICATIONS
*-----------------------------------

	mx	%00

intro_explications
	rts

	mx	%00
	
*-----------------------------------
* DATA INTRO 
*-----------------------------------

o2gsCOLP	hex	00,70,A0,90,40,C0,B0,F0	; index pour les pixels pairs
o2gsCOLI	hex	00,07,0A,09,04,0C,0B,0F	; index pour les pixels impairs
o2gsBK	hex	00,77,AA,99,44,CC,BB,FF	; index pour le background

* Color info
*  0: black
*  1: red
*  2: green
*  3: yellow
*  4: blue
*  5: magenta
*  6: cyan
*  7: white

	