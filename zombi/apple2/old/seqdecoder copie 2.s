*
* SEQ DECODER
*
* (c) 2026, Brutal Deluxe Software
* Antoine Vignau & Olivier Zardini
*

	org	$1000
	lst	off
	typ	BIN
	dsk	SEQDECODER

*-------------------------------
* DIRECT PAGE
*-------------------------------

dpFROM	=	$00	; start of .SEQ
dpPIC	=	dpFROM+4	; SHR screen
dpHEADER	=	dpPIC+4	; points to SEQ header
dpFLICKER	=	dpHEADER+4	; points to a FLICKER entry
dpFLICKER2	=	dpFLICKER+4	; "

*-------------------------------
* EQUATES
*-------------------------------

ptrSEQ	=	$020000
ptrSCREEN	=	$e12000

header_skip	=	2	; skip the first word
header_size	=	$80
end_of_data	=	$ffff
shr_width	=	160

nb_planes	=	4

fHEADER_SIZE	=	128

fHEADER	=	$0000
fPALETTE	=	fHEADER+4
fWIDTH	=	fHEADER+58
fHEIGHT	=	fHEADER+60
fCOMPRESS	=	fHEADER+62	; 1 if compressed
fBYTES	=	fHEADER+66	; if word, +64 if long

KBD	=	$C000
KBDSTROBE	=	$C010
NEWVIDEO	=	$C029

*-------------------------------
* CODE
*-------------------------------

	clc
	xce
	rep	#$30
	
	lda	#ptrSEQ
	sta	dpFROM
	lda	#^ptrSEQ
	sta	dpFROM+2
	
	lda	dpFROM	; points to the header
	clc		; list of FLICKER pointers
	adc	#header_size
	sta	dpHEADER
	lda	dpFROM+2
	adc	#0
	sta	dpHEADER+2

	sep	#$20
	lda	#$c1
	sta	NEWVIDEO
	rep	#$20

*---------------
* Inits
*---------------

	stz	nbENTRIES	; start with first FLICKER

	lda	#nb_planes
	sta	picPLANES
	
	lda	#fHEADER_SIZE
	sta	fliHEADER_SIZE

*---------------
* Boucle
*---------------

seqLOOP	lda	nbENTRIES	; get entry pointer
	asl
	asl
	tay
	lda	[dpHEADER],y	; from 68000 to 65816
	xba
	tax
	iny
	iny
	lda	[dpHEADER],y
	xba

	cpx	#end_of_data	; exit if $FFFF0000
	bne	seqHANDLE
	cmp	#0
	beq	seqEND

seqHANDLE	clc
	adc	dpFROM
	sta	dpFLICKER
	sta	dpFLICKER2
	txa
	adc	dpFROM+2
	sta	dpFLICKER+2
	sta	dpFLICKER2+2

	jsr	handleFLICKER
	jsr	handleKEY
	
	cmp	#0
	beq	seqEND
	cmp	#1
	beq	seqLOOP
	
	inc	nbENTRIES
	bra	seqLOOP

seqEND	sec
	xce
	sep	#$30
	lda	#$01
	sta	NEWVIDEO
	rts
	
	mx	%00

*-------------------------------
* HANDLE KEY
*-------------------------------

handleKEY	sep	#$20

]lp	lda	KBD
	bpl	]lp
	bit	KBDSTROBE
	cmp	#$9b
	beq	hk_END
	cmp	#"A"
	beq	hk_A
	cmp	#"Z"
	beq	hk_Z
	cmp	#"O"
	beq	hk_O
	cmp	#"P"
	bne	hk_NEXT
hk_P	inc	fliHEADER_SIZE
	bra	hk_LOOP
hk_O	dec	fliHEADER_SIZE
	bra	hk_LOOP
hk_A	dec	picPLANES
	bra	hk_LOOP
hk_Z	inc	picPLANES

hk_LOOP	rep	#$20
	lda	#1
	rts
hk_END	rep	#$20
	lda	#0
	rts
hk_NEXT	rep	#$20
	lda	#-1
	rts
	
*-------------------------------
* HANDLE FLICKER
*-------------------------------

handleFLICKER	ldy	#fHEADER	; does flicker start with $FFFF
	lda	[dpFLICKER],y
	cmp	#end_of_data
	beq	hf_1	; yes, handle it
	rts		; no, exit

hf_1	ldy	#fPALETTE	; recopy palette
	ldx	#0
]lp	lda	[dpFLICKER],y
	xba
	asl
	stal	$e19e00,x
	iny
	iny
	inx
	inx
	cpx	#32
	bcc	]lp

	jmp	noGREY
	
	ldx	#0
	txa
]lp	stal	$e19e00,x
	clc
	adc	#$0111
	inx
	inx
	cpx	#32
	bcc	]lp

noGREY

	ldy	#fWIDTH	; the width...
	lda	[dpFLICKER],y
	xba
	sta	picWIDTH	; in pixels
	lsr
	sta	fliWIDTH	; in bytes
	
	ldy	#fHEIGHT	; the height...
	lda	[dpFLICKER],y
	xba
	sta	picHEIGHT	; in pixels

	ldy	#fCOMPRESS	; the compression method...
	lda	[dpFLICKER],y
	xba
	sta	fliCOMPRESS

	ldy	#fBYTES	; the size...
	lda	[dpFLICKER],y
	xba
	sta	fliSIZE	; in bytes

*-------------------------------
* UNPACK FLICKER DATA
*-------------------------------

	lda	#ptrSCREEN
	sta	dpPIC
	lda	#^ptrSCREEN
	sta	dpPIC+2

	ldy	#0	; clear SHR
	tya
]lp	sta	[dpPIC],y
	iny
	iny
	cpy	#$7e00
	bcc	]lp

*--- Left part

	ldy	#0
	stz	numLIGNE	; start line 0
	
	lda	dpFLICKER	; points to data
	clc
	adc	fliHEADER_SIZE
	sta	dpFLICKER
	lda	dpFLICKER+2
	adc	#0
	sta	dpFLICKER+2

	jsr	doUNCOMPRESS

*--- Right part

	ldy	#0
	stz	numLIGNE	; start line 0
	
	lda	fliWIDTH
	lsr
	clc
	adc	dpFLICKER2	; points to data
	adc	fliHEADER_SIZE
	sta	dpFLICKER
	lda	dpFLICKER2+2
	adc	#0
	sta	dpFLICKER+2

	lda	fliWIDTH
	lsr
	clc
	adc	#ptrSCREEN
	sta	dpPIC
	lda	#0
	adc	#^ptrSCREEN
	sta	dpPIC+2
	
	jsr	doUNCOMPRESS

	rts

*---

	lda	fliCOMPRESS	; how to unpack now?
	bne	doCOMPRESS

*- Image non compressee ILBM

doUNCOMPRESS
]lp	jsr	unpIFF90	; Hi, Convert 32OO!
	jsr	unpIFFy
	bcs	]lp
	rts

doCOMPRESS
*	jmp	unpIFF60

*- Image compressee PBM (1-8 plans)

unpIFF80	jsr	unpIFF90
	cmp	#$81
	bcc	unpIFF85

	eor	#$ff
	inc	
	sta	IFFcnt
	jsr	unpIFF90
]lp	lda	IFFb
	jsr	unpIFFy20
	bcc	unpIFF81
	dec	IFFcnt
	bpl	]lp
	bra	unpIFF80
unpIFF81	rts

unpIFF85	sta	IFFcnt
]lp	jsr	unpIFF90
	jsr	unpIFFy20
	bcc	unpIFF86
	dec	IFFcnt
	bpl	]lp
	bra	unpIFF80
unpIFF86	rts

*- Image compressee ILBM (1-8 plans)

unpIFF60	jsr	unpIFF90
	cmp	#$81
	bcc	unpIFF70

	eor	#$ff
	inc
	sta	IFFcnt
	jsr	unpIFF90
]lp	lda	IFFb
	jsr	unpIFFy
	bcc	unpIFF61
	dec	IFFcnt
	bpl	]lp
	bra	unpIFF60
unpIFF61	rts

unpIFF70	sta	IFFcnt
]lp	jsr	unpIFF90
	jsr	unpIFFy
	bcc	unpIFF71
	dec	IFFcnt
	bpl	]lp
	bra	unpIFF60
unpIFF71	rts

*---

unpIFFy	sta	tempTABLE,y
	iny
	cpy	fliWIDTH
	bcs	unpIFFy1
	sec
	rts
unpIFFy1	sep	#$20

	ldx	#0	; clear la ligne de destination
]lp	stz	tempLIGNE,x
	inx
	cpx	#1024
	bcc	]lp

	lda	#%0000_0001	; on remet les variables
	sta	IFFpmask
	stz	IFFplanes

	ldx	#0
unpIFFy2	ldy	#0
unpIFFy3	lda	tempTABLE,x
	and	#%1000_0000
	beq	unpIFFy4
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy4	iny	
	lda	tempTABLE,x
	and	#%0100_0000
	beq	unpIFFy5
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy5	iny	
	lda	tempTABLE,x
	and	#%0010_0000
	beq	unpIFFy6
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy6	iny	
	lda	tempTABLE,x
	and	#%0001_0000
	beq	unpIFFy7
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy7	iny	
	lda	tempTABLE,x
	and	#%0000_1000
	beq	unpIFFy8
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy8	iny	
	lda	tempTABLE,x
	and	#%0000_0100
	beq	unpIFFy9
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy9	iny	
	lda	tempTABLE,x
	and	#%0000_0010
	beq	unpIFFy10
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy10	iny	
	lda	tempTABLE,x
	and	#%0000_0001
	beq	unpIFFy11
	lda	tempLIGNE,y	; [dpPIC],y
	ora	IFFpmask
	sta	tempLIGNE,y	; [dpPIC],y
unpIFFy11	iny	
	inx	
	cpx	picWIDTH
	bcs	unpIFFy13
	cpy	fliWIDTH
	bcs	unpIFFy12
	brl	unpIFFy3

unpIFFy12	asl	IFFpmask
	inc	IFFplanes
	lda	IFFplanes
	cmp	picPLANES
	beq	unpIFFy13
	brl	unpIFFy2

unpIFFy13	ldx	#0
	txy
]lp	lda	tempLIGNE,x
	asl
	asl
	asl
	asl
	ora	tempLIGNE+1,x
	sta	[dpPIC],y
	iny
	inx
	inx
	cpx	picWIDTH
	bcc	]lp

	rep	#$20
	inc	numLIGNE
	lda	numLIGNE
	cmp	picHEIGHT
	bcs	unpIFFy14
	lda	dpPIC
	clc
	adc	#shr_width
	sta	dpPIC
	lda	dpPIC+2
	adc	#0
	sta	dpPIC+2
	ldy	#0
	sec
	rts
unpIFFy14	clc
	rts

unpIFFy20	sta	tempLIGNE,y
	iny
	cpy	picWIDTH
	bcs	unpIFFy13
	sec
	rts

*--- Lecture d'un octet

unpIFF90	lda	[dpFLICKER]
	and	#$ff
	sta	IFFb
	inc	dpFLICKER
	bne	unpIFF91
	inc	dpFLICKER+2
unpIFF91	rts

*--- Data

IFFb	ds	2
IFFcnt	ds	2
IFFpmask	ds	2
IFFplanes	ds	2

*-------------------------------
* DATA
*-------------------------------

nbENTRIES	ds	2

picWIDTH	ds	2
picHEIGHT	ds	2
picPLANES	ds	2
numLIGNE	ds	2

fliWIDTH	ds	2
fliCOMPRESS	ds	2
fliSIZE	ds	2
fliHEADER_SIZE	ds	2

tempTABLE	ds	512
tempLIGNE	ds	1024

