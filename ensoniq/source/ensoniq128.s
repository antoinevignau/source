*
* ensoniq 128k
*
* (c) 2023, Brutal Deluxe Software
*

	mx	%00
	org	$1000
	lst	off

*-----------------------------------
* EQUATES
*-----------------------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
SOUNDCTL	=	$e0c03c
SOUNDDATA	=	$e0c03d
SOUNDADRL	=	$e0c03e
SOUNDADRH	=	$e0c03f

sound_bank_1 =	$020000
sound_bank_2 =	$030000

*-----------------------------------
* ENTRY POINT
*-----------------------------------

	clc
	xce
	rep	#$30

	jsr	move_to_first_bank
	jsr	move_to_second_bank
	jsr	play_sound
	jsr	wait_for_key
	jsr	stop_oscillators
	
	sec
	xce
	sep	#$30
	rts

	mx	%00
	
*-----------------------------------
* MOVE SOUND DATA TO DOC RAM BANK 0
*-----------------------------------

move_to_first_bank
	sep	#$20

	ldal	$e100ca
	and	#%0000_1111	; keep sound level
	ora	#%0110_0000	; to DOC RAM + auto increment + bank 0
	stal	SOUNDCTL

	lda	#0
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldx	#0
]lp	ldal	sound_bank_1,x
	stal	SOUNDDATA
	inx
	bne	]lp

	rep	#$20
	cli
	rts

*-----------------------------------
* MOVE SOUND DATA TO DOC RAM BANK 1
*-----------------------------------

move_to_second_bank
	sep	#$20

	ldal	$e100ca
	and	#%0000_1111	; keep sound level
	ora	#%0111_0000	; to DOC RAM + auto increment + bank 1
	stal	SOUNDCTL

	lda	#0
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldx	#0
]lp	ldal	sound_bank_2,x
	stal	SOUNDDATA
	inx
	bne	]lp

	rep	#$20
	cli
	rts

*-----------------------------------
* PLAY SOUND
*-----------------------------------

play_sound
	sep	#$20
	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	stal	SOUNDCTL

	ldy	#0	; the first oscillator

*---------------------- Frequency is $D1 for the two oscillators

	tya
	stal	SOUNDADRL
	lda	#$d1
	stal	SOUNDDATA
	tya
	ora	#$01
	stal	SOUNDADRL
	lda	#$d1
	stal	SOUNDDATA 

	tya
	ora	#$20
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA
	tya
	ora	#$21
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA

*---------------------- Volume is $FF for the two oscillators

	tya
	ora	#$40
	stal	SOUNDADRL
	lda	#$ff
	stal	SOUNDDATA
	tya
	ora	#$41
	stal	SOUNDADRL
	lda	#$ff
	stal	SOUNDDATA

*---------------------- DOC RAM address is $0000 for the two oscillators

	tya
	ora	#$80
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA
	tya
	ora	#$81
	stal	SOUNDADRL
	lda	#0
	stal	SOUNDDATA

*---------------------- Waveform table size / Resolution and Bank Select

	tya
	ora	#$c0
	stal	SOUNDADRL
	lda	#%0011_1111	; Bank 0, Table size 32K, Resolution 32K
	stal	SOUNDDATA
	tya
	ora	#$c1
	stal	SOUNDADRL
	lda	#%0111_1111	; Bank 1, Table size 32K, Resolution 32K
	stal	SOUNDDATA

*---------------------- Control register: start the sound

	tya
	ora	#$a0
	stal  	SOUNDADRL
	lda	#%0000_0110	; Channel 0, Swap mode, start oscillator
	stal	SOUNDDATA
	tya
	ora   	#$a1
	stal	SOUNDADRL
	lda	#%0001_0011	; Channel 1, One-shot, Halt bit is set
	stal	SOUNDDATA

	rep	#$20
	rts
         
*-----------------------------------
* WAIT FOR A KEYPRESS
*-----------------------------------

wait_for_key
	sep	#$20
]lp	ldal	KBD
	bpl	]lp
	stal	KBDSTROBE
	rep	#$20
	rts

*-----------------------------------
* STOP THE OSCILLATORS
*-----------------------------------

stop_oscillators
	sep	#$20
	ldal	$e100ca
	and	#%0000_1111	; to DOC registers, no auto increment
	stal	SOUNDCTL

	ldy	#0	; the first oscillator

*---------------------- Control register: stop the sound

	tya
	ora	#$a0
	stal  	SOUNDADRL
	lda	#%0000_0001	; stop oscillator
	stal	SOUNDDATA
	tya
	ora   	#$a1
	stal	SOUNDADRL
	lda	#%0001_0001	; stop oscillator
	stal	SOUNDDATA

	rep	#$20
	rts
	