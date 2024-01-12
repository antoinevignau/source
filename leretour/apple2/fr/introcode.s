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

	ext	picLORICIELS

	ext	txtINTRO1
	ext	txtINTRO2
	ext	txtINTRO3
	ext	txtINTRO4
	ext	txtINTRO5
	ext	txtINTRO6
	ext	txtINTRO7
	
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
	ext	txtTITRE1
	ext	txtTITRE2
	ext	txtTITRE3
	ext	ecritparRECT
	ext	txtECRITPAR1
	ext	txtECRITPAR2
	ext	txtECRITPAR3
	ext	txtECRITPAR4
	ext	txtECRITPAR5
	ext	txtECRITPAR6
	ext	txtECRITPAR7
	ext	txtMONDE
	ext	txtEXPLICATIONS1
	ext	txtEXPLICATIONS2
	ext	txtEXPLICATIONS3
	ext	txtEXPLICATIONS4

*-----------------------------------
* CODE
*-----------------------------------

intro
	jsr	intro_intro		; faut soigner son ego
	bcs	intro_end
	jsr	intro_logo		; ok
	bcs	intro_end
	jsr	intro_telex		; ok
	bcs	intro_end
	jsr	intro_genius_texte	; ok
	bcs	intro_end
	jsr	intro_serpent	; ok
	bcs	intro_end
	jsr	intro_ecritpar	; ok (sauf les couleurs)
	bcs	intro_end
	jsr	intro_monde		; ok
	bcs	intro_end
	jsr	intro_explications	; ok
	bcs	intro_end
	jsr	intro_genius_image	; ok

intro_end	PushWord	#0
	_ClearScreen
	
	PushWord	#0
	PushLong	#palette320
	_SetColorTable
	rts

*-----------------------------------
* INTRO
*-----------------------------------

	mx	%00

iiY	=	85

intro_intro
	PushWord	#0
	_ClearScreen
	
	ldy	#iiY
	lda	#txtINTRO1
	jsr	centerME
	bcs	ii_end

	ldy	#iiY+20
	lda	#txtINTRO2
	jsr	centerME
	bcs	ii_end

	ldy	#iiY+40
	lda	#txtINTRO3
	jsr	centerME
	bcs	ii_end

	ldy	#60*1
	jsr	waitMS16
	bcs	ii_end

*----------- La suite du copyright

	PushWord	#0
	_ClearScreen
	
	ldy	#iiY
	lda	#txtINTRO5
	jsr	centerME
	bcs	ii_end

	ldy	#iiY+20
	lda	#txtINTRO6
	jsr	centerME
	bcs	ii_end

	ldy	#iiY+40
	lda	#txtINTRO7
	jsr	centerME
	bcs	ii_end

	ldy	#60*1
	jsr	waitMS16
	bcs	ii_end

*----------- Le merci du copyright

	PushWord	#0
	_ClearScreen
	
	ldy	#iiY+20
	lda	#txtINTRO4
	jsr	centerME

	ldy	#60*1
	jsr	waitMS16
ii_end	rts

*----------- Merci La Belle Zohra

centerME	sty	theY

	PushWord	#^txtINTRO1	; pointer to string
	pha
	
	PushWord	#0	; get string length
	PushWord	#^txtINTRO1
	pha
	_StringWidth	; return left on stack
	
	lda	#320	; why 160?
	sec
	sbc	1,s
	bpl	cm1
	lda	#0
cm1	lsr
	sta	1,s	; X
	
	PushWord	theY	; pour MoveTo
	_MoveTo
	_DrawString
	
	ldy	#60*1
	jmp	waitMS16

*-----------------------------------
* LE LOGO LORICIELS
*-----------------------------------

intro_logo
	PushLong	#picLORICIELS
	PushLong	ptrSCREEN
	PushLong	#32768
	_BlockMove
	
	ldy	#60*5
	jmp	waitMS16

*-----------------------------------
* TELEX
*-----------------------------------

	mx	%00

it1STLINE	=	18
it1stROW	=	10

intro_telex
	PushWord	#0
	_ClearScreen

	PushWord	#0
	PushLong	#palette320
	_SetColorTable
	
	PushLong	#telexRECT
	PushWord	#$7777
	PushWord	#$7777
	_SpecialRect

	jsr	fontSHASTON16

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

	jsr	fontSHASTON8

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
	rts

igt_end	ldy	#60*2
	jmp	waitMS16

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
	bcs	igt_end
	
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
	
	jsr	snake_1
	bcs	is_end
	jsr	snake_2
	bcs	is_end

	ldy	#60*2
	jsr	waitMS16

is_end	PushLong	#curPATTERN
	_SetPenPat
	rts

*-----------

snake_1	PushLong	#curPENSIZE
	_GetPenSize

	PushLong	#checkeredPATTERN
	_SetPenPat
	
	PushWord	#8
	PushWord	#8
	_SetPenSize
	
	jsr	snake_draw
	php
	
	PushWord	curPENSIZE
	PushWord	curPENSIZE+2
	_SetPenSize
	
	plp
	rts

*-----------

snake_draw	stz	theK

*--- For K=0 TO 7 STEP 2

sd_k	lda	theK
	sta	theN
	lda	#39
	sec
	sbc	theK
	sta	maxN

]lp	lda	theN
	asl
	asl
	asl
	sta	theX
	
	lda	theK
	asl
	asl
	asl
	sta	theY

	PushWord	theX
	PushWord	theY
	_MoveTo

	PushWord	#1
	PushWord	#1
	_Line

	jsr	KEY	; retour en 8-bit
	rep	#$30

	ldy	#1	; wait 4/60eme
	jsr	waitMS16
	bcc	sd_1
	rts
sd_1
	inc	theN
	lda	maxN
	cmp	theN
	bcs	]lp

*--- Loop 2 (line 420)

	lda	theK
	sta	theN
	lda	#25
	sec
	sbc	theK
	sta	maxN
	
]lp	lda	#39
	sec
	sbc	theK
	asl
	asl
	asl
	pha		; X
	
	lda	theN
	asl
	asl
	asl
	pha		; Y
	_MoveTo

	PushWord	#1
	PushWord	#1
	_Line

	jsr	KEY	; retour en 8-bit
	rep	#$30

	ldy	#1	; wait 4/60eme
	jsr	waitMS16
	bcc	sd_2
	rts
sd_2

	inc	theN
	lda	theN
	cmp	maxN
	bcc	]lp

*--- Loop 3 (line 430)

	lda	#38
	sec
	sbc	theK
	sta	theN
	
	lda	theK
	sta	maxN
	
]lp	lda	theN
	asl
	asl
	asl
	pha		; X
	
	lda	#24
	sec
	sbc	theK
	asl
	asl
	asl
	pha		; Y
	_MoveTo

	PushWord	#1
	PushWord	#1
	_Line

	jsr	KEY	; retour en 8-bit
	rep	#$30

	ldy	#1	; wait 4/60eme
	jsr	waitMS16
	bcc	sd_3
	rts
sd_3
	dec	theN
	lda	maxN
	cmp	theN
	bne	]lp

*--- Loop 4 (line 440)

	lda	#24
	sec
	sbc	theK
	sta	theN
	
	lda	theK
	inc
	sta	maxN
	
]lp	lda	theK
	asl
	asl
	asl
	pha		; X
	
	lda	theN
	asl
	asl
	asl
	pha		; Y
	_MoveTo

	PushWord	#1
	PushWord	#1
	_Line

	jsr	KEY	; retour en 8-bit
	rep	#$30

	ldy	#1	; wait 4/60eme
	jsr	waitMS16
	bcc	sd_4
	rts
sd_4
	dec	theN
	lda	maxN
	cmp	theN
	bcc	]lp

*--- Line 450

	lda	theK
	cmp	#6
	beq	sd_nextk

	lda	theK
	inc
	asl
	asl
	asl
	pha
	
	lda	theK
	inc
	inc
	asl
	asl
	asl
	pha
	_MoveTo

	PushWord	#1
	PushWord	#1
	_Line

*----------- NEXT K

sd_nextk	lda	theK
	clc
	adc	#2
	sta	theK
	cmp	#8
	bcs	sd_end
	jmp	sd_k

sd_end	PushWord #%1111_1111_1111_1111	; on arrête tout pour MIDI Synth
	_FFStopSound
	rts

*-----------

theK	ds	2
theN	ds	2
maxN	ds	2

*-----------

snake_2	PushWord	#0
	_GetForeColor
	
	PushWord	#7
	_SetForeColor

	jsr	fontSHASTON16

	ldy	#80
	lda	#txtSERPENT1
	jsr	centerME

	_SetForeColor
	jsr	fontSHASTON8

	ldy	#105
	lda	#txtSERPENT2
	jsr	centerME
	bcs	s2_end
	
	ldy	#118
	lda	#txtSERPENT3
	jsr	centerME
	bcs	s2_end
	
	ldy	#131
	lda	#txtSERPENT4
	jsr	centerME
	
*-----------

	ldy	#60*2
	jsr	waitMS16
s2_end	rts

*-----------------------------------
* DE QUI EST CE LOGICIEL ?
*-----------------------------------

	mx	%00

intro_ecritpar
	PushWord	#$9999
	_ClearScreen
	
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

*----------- Affiche le titre

	PushWord	#0
	_GetForeColor
	
	PushWord	#0
	_SetForeColor
	
	PushWord	#0
	_GetTextMode
	
	PushWord	#modeForeCopy
	_SetTextMode
	
	PushWord	#70
	PushWord	#110
	_MoveTo
	PushLong	#txtTITRE1
	_DrawCString

	PushWord	#70
	PushWord	#120
	_MoveTo
	PushLong	#txtTITRE2
	_DrawCString

	jsr	fontSHASTON16

	PushWord	#160
	PushWord	#118
	_MoveTo
	PushLong	#txtTITRE3
	_DrawCString

*----------- Affiche les anneaux

	PushLong	#curPATTERN
	_GetPenPat

	PushLong	#blackPATTERN
	_SetPenPat

*--- Boucle 1

ovalHEIGHT	=	8
ovalX1	=	30
ovalX2	=	290
ovalY1	=	130
ovalY2	=	180

	lda	#ovalY1
	sta	ovalRECT
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+4

	lda	#ovalX1
]lp	sta	ovalRECT+2
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+6
	
	jsr	outputOVAL

	lda	ovalRECT+2
	clc
	adc	#5
	cmp	#ovalX2
	bcc	]lp
	
*--- Boucle 2

	lda	#ovalX2
	sta	ovalRECT+2
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+6

	lda	#ovalY1
]lp	sta	ovalRECT
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+4
	
	jsr	outputOVAL

	lda	ovalRECT
	clc
	adc	#5
	cmp	#ovalY2
	bcc	]lp

*--- Boucle 3

	lda	#ovalY2
	sta	ovalRECT
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+4

	lda	#ovalX2
]lp	sta	ovalRECT+2
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+6
	
	jsr	outputOVAL

	lda	ovalRECT+2
	sec
	sbc	#5
	cmp	#ovalX1
	bcs	]lp

*--- Boucle 4

	lda	#ovalX1
	sta	ovalRECT+2
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+6

	lda	#ovalY2
]lp	sta	ovalRECT
	clc
	adc	#ovalHEIGHT
	sta	ovalRECT+4
	
	jsr	outputOVAL

	lda	ovalRECT
	sec
	sbc	#5
	cmp	#ovalY1
	bcs	]lp

*--- La suite...

	PushLong	#curPATTERN
	_SetPenPat

*----------- Affiche les noms

	jsr	fontSHASTON8
	
	ldy	#150
	lda	#txtECRITPAR1
	jsr	centerME
	ldy	#162
	lda	#txtECRITPAR2
	jsr	centerME
	ldy	#174
	lda	#txtECRITPAR3
	jsr	centerME

*---

	_SetTextMode
	_SetForeColor

	jsr	initMIDI
	jsr	doSOUNDON

	inc	fgINTRO	; même si KO, on aura démarré la musique
	
	ldy	#60*10
	jsr	waitMS16
	
*----------- Boucle sur les couleurs (ou pas)

*----------- Affiche la suite

	PushLong	#ecritparRECT
	PushWord	#$4444
	PushWord	#$4444
	_SpecialRect

	jsr	fontSHASTON16

	PushWord	#0
	_GetForeColor
	
	PushWord	#0
	_GetTextMode
	
	PushWord	#modeForeCopy
	_SetTextMode

	PushWord	#11
	_SetForeColor

	ldy	#179
	lda	#txtECRITPAR6
	jsr	centerME
	
	ldy	#199
	lda	#txtECRITPAR7
	jsr	centerME

	_SetTextMode
	_SetForeColor
	
	jsr	fontSHASTON8

	ldy	#60*1
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

*---

outputOVAL
	PushLong	#ovalRECT
	_FrameOval
	
	ldy	#1	; wait 2/60eme
	jmp	waitMS16

*---
	
ovalRECT	ds	8

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

	ldy	#60*10
	jsr	waitMS16
	bcs	im_end

*----------- 2ème partie : le texte

	PushWord	#0
	_GetForeColor
	
	lda	#txtMONDE
	ldx	#9
	jsr	showTEXTE

	_SetForeColor
im_end	rts

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

	mx	%00

*-----------
* A: pointer to texte
* X: fore color index
* Clears screen, sets fore color, draws text, wait

showTEXTE	sta	dpFROM
	lda	#^txtGENIUSTEXTE
	sta	dpFROM+2

	phx
	_SetForeColor
	
	PushWord	#0
	_ClearScreen

	stz	textX
	lda	#charHEIGHT
	sta	textY

]lp	PushWord	textX
	PushWord	textY
	_MoveTo

	jsr	waitMSBIS	; keypress?
	bcc	st_ok
	rts

st_end	ldy	#60*10	; wait before exiting
	jmp	waitMS16
	
st_ok	lda	[dpFROM]	; get char
	and	#$ff
	beq	st_end
	cmp	#chrRET
	beq	st_ret
	
	pha
	_DrawChar
	
	lda	textX	; next x
	clc
	adc	#charWIDTH
	sta	textX
	cmp	#maxX
	bcc	st_next

st_ret	stz	textX	; next line
	lda	textY
	clc
	adc	#charHEIGHT
	sta	textY

st_next	inc	dpFROM
	bra	]lp

*-----------------------------------
* EXPLICATIONS
*-----------------------------------

	mx	%00

intro_explications
	PushWord	#0
	_GetForeColor

	lda	#txtEXPLICATIONS1	; Texte 1
	ldx	#9
	jsr	showTEXTE
	bcs	ie_end

*	lda	#txtEXPLICATIONS2	; Texte 2 non affiché
*	ldx	#11
*	jsr	showTEXTE
*	bcs	ie_end

	lda	#txtEXPLICATIONS3	; Texte 3
	ldx	#7
	jsr	showTEXTE

ie_end	_SetForeColor
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
	adc	#2594	; pour center : 160x16+34
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

	ldy	#60*3
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

	mx	%00

*-----------------------------------
* QUELQUES ROUTINES
*-----------------------------------

fontSHASTON8
	PushWord #$0800
	bra	fontSHASTON
fontSHASTON16
	PushWord #$1000
fontSHASTON
	PushWord #$fffe		; Shaston 16
	PushWord #0
	_InstallFont
	rts

*-----------------------------------
* DATA INTRO 
*-----------------------------------

fgINTRO	ds	2	; 0 : on n'a pas démarré la musique dans l'intro
			; 1 : on a démarré la musique dans l'intro

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
