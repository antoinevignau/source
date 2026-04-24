*
* ensoniq 64k
*
* (c) 2023, Brutal Deluxe Software
*

	mx	%11
	org	$1000
	lst	off
	dsk	ensoniqloop
	typ	BIN
	
*-----------------------------------
* EQUATES
*-----------------------------------

thePAGE	=	$ff	; ZP

KBD	=	$c000
KBDSTROBE	=	$c010
SOUNDCTL	=	$c03c
SOUNDDATA	=	$c03d
SOUNDADRL	=	$c03e
SOUNDADRH	=	$c03f

*-----------------------------------
* ENTRY POINT
*-----------------------------------

	clc
	xce
	sep	#$30

	stz	thePAGE	; page 0

	jsr	init_doc
	jsr	read_doc2
	jmp	theEND

]lp	jsr	read_doc
	jsr	push_doc
	jsr	play_doc
	
	lda	KBD
	bpl	]lp
	sta	KBDSTROBE

theEND	jsr	stop_oscillators
	
	sec
	xce
	sep	#$30
	rts

*-----------------------------------
* READ 65536 BYTES
*-----------------------------------

read_doc2	rep	#$10

	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	sta	SOUNDCTL
	
	ldx	#0
	lda	#$e2
	sta	SOUNDADRL
	lda	SOUNDDATA
]lp	lda	SOUNDDATA
	bne	read_doc2_ok
	lda	#1
read_doc2_ok	stal	$020000,x

	ldy	#32
]lp	dey
	bne	]lp

	inx
	bne	]lp

	sep	#$10
	rts

*-----------------------------------
* READ 256 BYTES
*-----------------------------------

read_doc	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	sta	SOUNDCTL
	
	ldx	#0
	lda	#$e2
	sta	SOUNDADRL
	lda	SOUNDDATA
]lp	lda	SOUNDDATA
	bne	read_doc_ok
	lda	#1
read_doc_ok	sta	myPAGE,x

	ldy	#32
]lp	dey
	bne	]lp

	inx
	bne	]lp

	rts

*-----------------------------------
* MOVE SOUND DATA TO DOC RAM BANK 0
*-----------------------------------

push_doc	ldal	$e100ca
	and	#%0000_1111	; keep sound level
	ora	#%0110_0000	; to DOC RAM + auto increment + bank 0
	sta	SOUNDCTL

	lda	#0
	sta	SOUNDADRL
	lda	thePAGE	; 0 or 1
	sta	SOUNDADRH
	eor	#1
	sta	thePAGE
	
	ldx	#0
]lp	lda	myPAGE,x
	sta	SOUNDDATA
	inx
	bne	]lp
	
	rts

*-----------------------------------
* INIT DOC
*-----------------------------------

init_doc	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	sta	SOUNDCTL

	ldy	#0	; the first oscillator

*---------------------- Frequency is $D1 for the two oscillators

	tya
	sta	SOUNDADRL
	lda	#$d1
	sta	SOUNDDATA
	tya
	ora	#$01
	sta	SOUNDADRL
	lda	#$d1
	sta	SOUNDDATA 

	tya
	ora	#$20
	sta	SOUNDADRL
	lda	#0
	sta	SOUNDDATA
	tya
	ora	#$21
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA

*---------------------- Volume is $FF for the two oscillators

	tya
	ora	#$40
	sta	SOUNDADRL
	lda	#$ff
	sta	SOUNDDATA
	tya
	ora	#$41
	sta	SOUNDADRL
	lda	#$ff
	sta	SOUNDDATA

*---------------------- DOC RAM address

	tya
	ora	#$80
	sta	SOUNDADRL
	lda	#0	; $0000 for the first oscillator
	sta	SOUNDDATA
	tya
	ora	#$81
	sta	SOUNDADRL
	lda	#1	; $0100 for the second oscillator
	sta	SOUNDDATA

*---------------------- Waveform table size / Resolution and Bank Select

	tya
	ora	#$c0
	sta	SOUNDADRL
	lda	#%0000_0000	; Bank 0, Table size 32K, Resolution 32K
	sta	SOUNDDATA
	tya
	ora	#$c1
	sta	SOUNDADRL
	lda	#%0000_0000	; Bank 0, Table size 32K, Resolution 32K
	sta	SOUNDDATA

	rts

*-----------------------------------
* PLAY DOC
*-----------------------------------

play_doc	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	sta	SOUNDCTL

*---------------------- Control register: start the sound

	lda	thePAGE
	beq	play_doc_1	; 0 to 1, 1 to 0

	lda	#$a0
	sta  	SOUNDADRL
	lda	#%0000_0010	; Channel 0, One-shot
	sta	SOUNDDATA
	rts

play_doc_1	lda   	#$a1
	sta	SOUNDADRL
	lda	#%0000_0010	; Channel 0, One-shot
	sta	SOUNDDATA
	rts

*---------------------- Frequency is $D1 for the two oscillators

*-----------------------------------
* WAIT FOR A KEYPRESS
*-----------------------------------

wait_for_key
]lp	lda	KBD
	bpl	]lp
	sta	KBDSTROBE
	rts

*-----------------------------------
* STOP THE OSCILLATORS
*-----------------------------------

stop_oscillators
	lda	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	sta	SOUNDCTL

	ldy	#0	; the first oscillator

*---------------------- Control register: stop the sound

	tya
	ora	#$a0
	sta  	SOUNDADRL
	lda	#%0000_0001	; stop oscillator
	sta	SOUNDDATA
	tya
	ora   	#$a1
	sta	SOUNDADRL
	lda	#%0001_0001	; stop oscillator
	sta	SOUNDDATA

	rts

*-----------------------------------
* DATA
*-----------------------------------

	ds	\
myPAGE	ds	256

