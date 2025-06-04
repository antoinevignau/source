*
* Lode Runner
* from MSX to A2
*

	mx	%11
	org	$800
	lst	off

*---

source	=	$1000
destination	=	$4800
nbLEVELS	=	50

theLEVEL	=	$fd
theLINE	=	$fe
nibble	=	$ff

*---

	clc
	xce
	rep	#$30
	
	lda	#source
	sta	readFROM+1
	lda	#destination
	sta	writeTO+1

	sep	#$30
	
*---

	stz	theLEVEL
	
outerLOOP	stz	theLINE
	
innerLOOP	ldx	#0
]lp	jsr	readFROM
	pha
	and	#$0f
	tay
	lda	msx2apple,y
	sta	nibble
	pla
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	tay
	lda	msx2apple,y
	asl
	asl
	asl
	asl
	ora	nibble
	jsr	writeTO
	inx
	cpx	#14	; et non pas 28		
	bcc	]lp

	lda	readFROM+1	; next line
	and	#$f0
	clc
	adc	#$10
	sta	readFROM+1
	
	inc	theLINE
	lda	theLINE
	cmp	#16
	bcc	innerLOOP

	stz	readFROM+1
	inc	readFROM+2	; next top line
	
	stz	writeTO+1
	inc	writeTO+2

	inc	theLEVEL
	lda	theLEVEL
	cmp	#nbLEVELS
	bcc	outerLOOP
	rts

*---

readFROM	lda	$bdbd
	inc	readFROM+1
	bne	readFROM1
	inc	readFROM+2
readFROM1	rts

*---

writeTO	sta	$bdbd
	inc	writeTO+1
	bne	writeTO1
	inc	writeTO+2
writeTO1	rts

*--- Data

msx2apple	hex	00,05,01,02,04,03,06,07,08,09