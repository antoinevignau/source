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

*-----------------------------------
* CODE
*-----------------------------------

intro	jsr	intro_telex
	bcs	intro_end
	jsr	intro_genius_texte
	bcs	intro_end
	jsr	intro_serpent
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

intro_telex
	rts

*-----------------------------------
* GENIUS TEXTE
*-----------------------------------

	mx	%00

intro_genius_texte
	rts

*-----------------------------------
* ANIMATION DU SERPENT
*-----------------------------------

	mx	%00

intro_serpent
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
	adc	#56	; pour center
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
	adc	#160-51	; 17x3 (6 bits = 3 pixels)
	tax
	cpx	#84*160	; 84 lignes
	bcc	igLOOP

*-----------

	sep	#$20
igK2	ldal	KBD
	bpl	igK2
	stal	KBDSTROBE
	rep	#$20
	clc
	rts

*-----------

	mx	%10

outputIG	phy
	pha
	txy
	
	lda	#$77
	sta	dpPX
	lda	1,s
	and	#%0010_0000
	beq	outputIG1
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputIG1	lda	1,s
	and	#%0001_0000
	beq	outputIG2
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputIG2	lda	dpPX
	sta	[dpTO],y
	iny

	lda	#$77
	sta	dpPX
	lda	1,s
	and	#%0000_1000
	beq	outputIG3
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputIG3	lda	1,s
	and	#%0000_0100
	beq	outputIG4
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputIG4	lda	dpPX
	sta	[dpTO],y
	iny

	lda	#$77
	sta	dpPX
	lda	1,s
	and	#%0000_0010
	beq	outputIG5
	lda	dpPX
	and	#$0f
	ora	dpCOL1
	sta	dpPX
outputIG5	lda	1,s
	and	#%0000_0001
	beq	outputIG6
	lda	dpPX
	and	#$f0
	ora	dpCOL2
	sta	dpPX
outputIG6	lda	dpPX
	sta	[dpTO],y
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

	sep	#$20
imK2	ldal	KBD
	bpl	imK2
	stal	KBDSTROBE
	rep	#$20
	clc
	rts

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

	