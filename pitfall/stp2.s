*
* Sounds for Pitfall
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	$B3
	dsk	STP2.l
	lst	off

*-----------------------------------
* MACRO FILES
*-----------------------------------

	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Util.Macs

*-----------------------------------
* SOFTSWITCHES
*-----------------------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
SOUNDCTL	=	$e0c03c
SOUNDDATA	=	$e0c03d
SOUNDADRL	=	$e0c03e
SOUNDADRH	=	$e0c03f

dpSOUNDCTL	=	$3c	; same as above
dpSOUNDDATA	=	$3d	; but set as direct page
dpSOUNDADRL	=	$3e	; for faster accesses
dpSOUNDADRH	=	$3f

GSOS	=	$e100a8
IRQ_VOLUME	=	$e100ca

*-----------------------------------
* EQUATES
*-----------------------------------

dpFROM	=	$0
dpTO	=	dpFROM+4

TRUE	=	255
FALSE	=	0

AUDIO_VINE	=	0
AUDIO_JUMP	=	1
AUDIO_TREASURE	=	2
AUDIO_DAMAGE	=	3
AUDIO_DAMAGE2	=	4
AUDIO_FALLING	=	5
AUDIO_DEATH	=	6	; +7

NUM_AUDIO_SOURCES	=	8

NUM_OSCILLATORS	=	NUM_AUDIO_SOURCES*2	; number of oscillators to configure

*-----------------------------------
* ENTRY POINT
*-----------------------------------

	phk
	plb

	clc
	xce
	rep	#$30

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	myID
	_MTStartUp

	PushLong	#0	; compact memory
	PushLong	#$8fffff
	PushWord	myID
	PushWord	#%11000000_00000000
	PushLong	#0
	_NewHandle
	_DisposeHandle
	_CompactMem

	jsr	doTHEWORK

	_MTShutDown
	PushWord	myID
	_DisposeAll
	PushWord	myID
	_MMShutDown
	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT
	brk	$bd	; ...if GS/OS fails

*-----------------------------------
* THE MAGIC IS HERE
*-----------------------------------

doTHEWORK	jsr	initSOUND	; set vector
	jsr	loadFILES	; load all files
	jsr	initENSONIQ	; init the ensoniq
	jsr	doPIANO	; handle keypresses
	jsr	stopENSONIQ	; stop all oscillators
	jmp	stopSOUND	; restore vector and return

*-----------------------------------
* HANDLE KEYPRESSES (A-X and ESCAPE)
*-----------------------------------

doPIANO	sep	#$20

]lp	ldal	KBD	; get a key
	bpl	]lp
	stal	KBDSTROBE
	cmp	#$9b	; esc to quit
	beq	piano_end
	cmp	#"A"	; A-G are possible keys
	bcc	]lp
	cmp	#"G"+1
	bcs	]lp
	sec
	sbc	#"A"
	rep	#$20
	and	#$00ff
	jsr	playSOUND	; and play
	bra	doPIANO	; so force A=8 now

piano_end	rep	#$20
	rts

*-----------------------------------
* LOAD ALL FILES
*-----------------------------------

loadFILES
	lda	#pSOUNDBANK	; The 64KB wavebank
	ldy	#0
	jsr	loadFILE
	sty	ptrSOUNDBANK
	stx	ptrSOUNDBANK+2

	jmp	skipME
	
	lda	#pVINE
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+0	; 0
	sty	ptrVINE
	stx	ptrVINE+2
	
	lda	#pJUMP
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+2	; 1
	sty	ptrJUMP
	stx	ptrJUMP+2
	
	lda	#pTREASURE
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+4	; 2
	sty	ptrTREASURE
	stx	ptrTREASURE+2
	
	lda	#pDAMAGE
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+6	; 3
	sty	ptrDAMAGE
	stx	ptrDAMAGE+2
	
	lda	#pDAMAGE2
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+8	; 4
	sty	ptrDAMAGE2
	stx	ptrDAMAGE2+2
	
	lda	#pFALLING
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+10	; 5
	sty	ptrFALLING
	stx	ptrFALLING+2

skipME
	
	lda	#pDEATH
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+12	; 6
	sty	ptrDEATH
	stx	ptrDEATH+2
	
	rts

*-----------------------------------
* LOAD A FILE
*-----------------------------------

loadFILE	sta	proOPEN+4	; A contains the filename pointer
	sty	lf_skip+1	; if Y=$bdbd then skip NewHandle

	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	bcs	lf_err

	lda	proOPEN+2	; get file ID
	sta	proREAD+2
	sta	proCLOSE+2

	lda	proEOF	; get length
	sta	proREAD+8
	lda	proEOF+2
	sta	proREAD+10

lf_skip	lda	#0	; skip NewHandle
	cmp	#$bdbd	; if $BDBD
	beq	lf_ok
	
	PushLong	#0
	PushLong	proEOF
	PushWord	myID
	PushWord	#%11000000_00001100	; no special memory, page aligned
	PushLong	#0
	_NewHandle
	phd		; dereference handle
	tsc		; to get RAM pointer
	tcd
	lda	[3]
	sta	proREAD+4
	ldy	#2
	lda	[3],y
	sta	proREAD+6
	pld
	pla
	pla
	bcs	lf_err
	
lf_ok	jsl	GSOS
	dw	$2012
	adrl	proREAD

lf_err	php		; exit w/ or w/o error
	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	plp
	
	lda	proEOF+1	; return the number of pages
	ldy	proREAD+4	; and the RAM pointer
	ldx	proREAD+6	
	rts

*-----------------------------------
* INIT THE ENSONIQ
*-----------------------------------

initENSONIQ
	php
	sei
	sep	#$20

	jsr	stopALLOSCS
	
* 2. Move the sound bank in the DOCRAM

	ldy	ptrSOUNDBANK
	sty	dpFROM
	ldx	ptrSOUNDBANK+2
	stx	dpFROM+2
	
	ldal	IRQ_VOLUME	; get the volume
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	stal	SOUNDCTL

	lda	#0	; DOCRAM address $0000
	stal	SOUNDADRL
	stal	SOUNDADRH

	ldy	#0	; Move 64K
]lp	lda	[dpFROM],y
	stal	SOUNDDATA
	iny
	bne	]lp

* 3. Set all the oscillators settings (but the CONTROL)

]lp	ldal	SOUNDCTL
	bmi	]lp
	and	#%0000_1111	; bit 6: access DOC, bit 5: disable auto increment
	stal	SOUNDCTL

	ldy	#0	; configure the oscillators
]lp	tya		; frequency low
	stal	SOUNDADRL
	lda	oscFREQL,y
	stal	SOUNDDATA

	tya		; frequency high
	ora	#$20
	stal	SOUNDADRL
	lda	oscFREQH,y
	stal	SOUNDDATA
	
	tya		; volume
	ora	#$40
	stal	SOUNDADRL
	lda	oscVOLUME,y
	stal	SOUNDDATA

	tya		; address
	ora	#$80
	stal	SOUNDADRL
	lda	oscADDRESS,y
	stal	SOUNDDATA

	tya		; size
	ora	#$c0
	stal	SOUNDADRL
	lda	oscWAVRES,y
	stal	SOUNDDATA

	iny		; next one please
	cpy	#NUM_OSCILLATORS
	bcc	]lp

	rep	#$20
	plp
	rts

*----------------------------------------
* STOP ALL THE OSCILLATORS
*----------------------------------------

stopENSONIQ	php
	sei
	sep	#$20

	jsr	stopALLOSCS
	
	rep	#$20
	plp
	rts

*----------------------------------------
* THE MANDATORY ROUTINE
*----------------------------------------

	mx	%10
	
stopALLOSCS

]lp	ldal	SOUNDCTL
	bmi	]lp
	and	#%1001_1111	; bit 6: access DOCRAM, bit 5: disable auto increment
	stal	SOUNDCTL

	ldx	#2	; 2 loops
ie_1	ldy	#$1f	; 32 oscillos
]lp	tya
	ora	#$a0
	stal	SOUNDADRL
	lda	#%0000_0001	; stop oscillator
	stal	SOUNDDATA
	dey
	bpl	]lp
	dex
	bne	ie_1
	rts

	mx	%00
	
*----------------------------------------
* SET/UNSET THE SOUND VECTOR
*----------------------------------------

initSOUND	php		; get the previous sound interrupt vector
	sei
	PushLong	#0
	PushWord	#11
	_GetVector
	PullLong	sndVECTOR


	PushWord	#11	; set mine
	PushLong	#sndINTERRUPT
	_SetVector
	plp
	rts

*--------- Remove the vector

stopSOUND	php		; restore the original sound interrupt vector
	sei
	PushWord	#11
	PushLong	sndVECTOR
	_SetVector
	plp
	rts

*--------- Data

sndVECTOR	ds	4

*-----------------------------------
* PLAY A SOUND
*-----------------------------------

playSOUND	and	#$ff
	tax
	lda	snd2OSC,x	; get the associated oscillator
	and	#$ff
	tay

	sep	#$20
	
	lda	sndPLAY,x	; check if sound is in DOCRAM
	bpl	ps_ram	; no, handle RAM sound

*--- Play the sound from the DOCRAM
	
	ldal	IRQ_VOLUME
	and	#%1001_1111	; bit 6: access DOC, bit 5: disable auto increment
	stal	SOUNDCTL

	tya		; stop the oscillators
	clc
	adc	#$a0
	stal	SOUNDADRL
	lda	#%0000_0001
	stal	SOUNDDATA
	tya
	clc
	adc	#$a1
	stal	SOUNDADRL
	lda	#%0000_0001
	stal	SOUNDDATA

	tya		; start the oscillators
	ora	#$a0
	stal	SOUNDADRL
	lda	#%0000_0100	; left sync mode (which is right)
	stal	SOUNDDATA
	tya
	ora	#$a1
	stal	SOUNDADRL
	lda	#%0001_0100	; right sync mode (which is left)
	stal	SOUNDDATA
	rep	#$20
	rts

	mx	%10

*--- Prepare the streaming of a sound
* X: sound index (0..23)
* Y: oscillator (0..28)

ps_ram	php
	sei
	phd

	rep	#$20

	lda	#$c000	; we need speed
	tcd		; we put the direct page in the firmware space

	lda	#0	; to clear the upper 8-bits
	
*--- Stop oscillos

	sep	#$20
	phy		; save even's oscillator

	lda	dpSOUNDCTL
	and	#%1001_1111	; bit 6: access DOC, bit 5: disable auto increment
	sta	dpSOUNDCTL

	tya		; stop the oscillators
	ora	#$a0
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a2
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a3
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA

*--- Set sound parms (address, nb of pages)

	rep	#$20

	txa		; get the number of pages (word)
	asl
	tax
	lda	sndPAGE,x	; sound index
	sta	oscPAGE,y	; oscillator index
	
	tya		; save it as a long too
	asl
	asl
	tay
	
	lda	sndADDRESS,x	; get pointer
	tax
	lda	|$0000,x	; save it
	sta	oscRAMPTR,y
	sta	ps_patch+1
	
	sep	#$20
	lda	|$0002,x
	sta	oscRAMPTR+2,y
	
	pha
	plb

*--- Move 512 bytes to DOCRAM (A: bank, Y: address)

	lda	dpSOUNDCTL
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	sta	dpSOUNDCTL
	
ps_patch	ldy	#$bdbd	; address = oscRAMPTR

]move	=	$00
	lup	512	; fill the two 256-byte areas
	lda	]move,y
	sta	dpSOUNDDATA
]move	=	]move+1
	--^

	phk
	plb
	ply
	
*--- Start the first two oscillators (one holds the interrupt)

	lda	dpSOUNDCTL
	and	#%1001_1111	; bit 6: access DOC, bit 5: disable auto increment
	sta	dpSOUNDCTL

	tya		; start the oscillators
	ora	#$a0
	sta	dpSOUNDADRL
	lda	#%0000_0100	; left, no interrupt, sync mode, start oscillator
	sta	dpSOUNDDATA
	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0001_1100	; right, interrupt, sync mode, start oscillator
	sta	dpSOUNDDATA

*--- The end (the rest is handled in the interrupt)

	rep	#$20
	pld
	plp
	rts

*-----------------------------------
* SOUND INTERRUPT
*-----------------------------------

	mx	%11
	
sndINTERRUPT
	phb		; prepare the context
	phd
	
	phk
	plb

	rep	#$30

	lda	#$c000
	tcd

	lda	#0	; clear upper 8-bits
	tax		; that helps!
	tay
	
*---

	sep	#$20

]lp	lda	dpSOUNDCTL
	bmi	]lp
	and	#%1001_1111	; bit 6: access DOC, bit 5: disable auto increment
	sta	dpSOUNDCTL

	lda	#$e0	; get interrupt register
	sta	dpSOUNDADRL

	lda	dpSOUNDDATA	; perform two reads
	lda	dpSOUNDDATA
	and	#%00111110	; bits 1..5 contain the oscillator
	lsr
	sta	theREALOSC
	and	#%1111_1110
	sta	theMASKEDOSC
	cmp	#NUM_OSCILLATORS
	bcc	si_ours
	
*--- Exit interrupt

si_exit	sep	#$30
	
	pld
	plb
	clc
	rtl

	mx	%10

*--- Stop the oscillos

si_ours	asl
	asl
	tax

*--- Check if we reached the end of the music?

	ldy	theMASKEDOSC
	lda	oscPAGE+1,y	; did we reach the end of the music
	bmi	si_theend
	ora	oscPAGE,y
	bne	si_continue

si_theend	tya
	ora	#$a0	; stop the oscillators
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a2
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	tya
	ora	#$a3
	sta	dpSOUNDADRL
	lda	#%0000_0001
	sta	dpSOUNDDATA
	bra	si_exit
	
*--- Set the sound address where to stream data

si_continue	lda	dpSOUNDCTL
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	sta	dpSOUNDCTL

	stz	dpSOUNDADRL	; DOCRAM address $xx00

	ldy	theREALOSC
	lda	oscADDRESS,y
	sta	dpSOUNDADRH

*--- And move the page

	lda	oscRAMPTR+2,x
	ldy	oscRAMPTR,x
	pha
	plb

]move	=	$00
	lup	256
	lda	]move,y
	sta	dpSOUNDDATA
]move	=	]move+1
	--^

	phk
	plb

*--- Start the sound

	lda	dpSOUNDCTL
	and	#%1001_1111	; bit 6: access DOC, bit 5: disable auto increment
	sta	dpSOUNDCTL

	ldy	theMASKEDOSC
	lda	theREALOSC
	cmp	#AUDIO_DEATH*2+1	; impair AUDIO_DEATH * 2 + 1
	bne	si_impair

* play first pair

	tya
	ora	#$a0
	sta	dpSOUNDADRL
	lda	#%0000_0100	; left, sync mode, no interrupt
	sta	dpSOUNDDATA
	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0001_1100	; right, sync mode, interrupt
	sta	dpSOUNDDATA
	bra	si_next

* play second pair

si_impair	tya
	ora	#$a2
	sta	dpSOUNDADRL
	lda	#%0000_0100	; left, sync mode, no interrupt
	sta	dpSOUNDDATA
	tya
	ora	#$a3
	sta	dpSOUNDADRL
	lda	#%0001_1100	; right, sync mode, interrupt
	sta	dpSOUNDDATA

*--- Prepare the data for the next interrupt

si_next	rep	#$20

	inc	oscRAMPTR+1,x ; RAM ptr++
	tyx
	dec	oscPAGE,x	; nb pages--
	brl	si_exit

	mx	%00

*-----------------------------------
* SOUND DATA
*-----------------------------------

sndADDRESS	da	ptrVINE	; 0
	da	ptrJUMP	; 1
	da	ptrTREASURE	; 2
	da	ptrDAMAGE	; 3
	da	ptrDAMAGE2	; 4
	da	ptrFALLING	; 5
	da	ptrDEATH	; 6 ** only this one is in RAM **
	da	ptrDEATH	; 6 ** only this one is in RAM **

sndPAGE	dw	$5B	; 0 - number of sound pages - word
	dw	$12	; 1
	dw	$26	; 2
	dw	$0b	; 3
	dw	$18	; 4
	dw	$1c	; 5
	dw	$66	; 6
	dw	$66	; 6

sndPLAY	dfb	TRUE	; A 0 - in DOCRAM if TRUE, in RAM if TRUE
	dfb	TRUE	; B 1
	dfb	TRUE	; C 2
	dfb	TRUE	; D 3
	dfb	TRUE	; E 4
	dfb	TRUE	; F 5
	dfb	FALSE	; G 6
	dfb	FALSE	; G 7
	
snd2OSC	dfb	0	; A 0 - sound index to oscillator index
	dfb	2	; B 1
	dfb	4	; C 2
	dfb	6	; D 3
	dfb	8	; E 4
	dfb	10	; F 5
	dfb	12	; G 6
	dfb	14	; G 7
	
*-----------------------------------
* ENSONIQ DATA
*-----------------------------------

* FREQUENCY CONTROL LOW AND HIGH

oscFREQL	hex	D6,D6,D6,D6,D6,D6,D6,D6	; AC,AC,AC,AC,AC,AC,AC
	hex	D6,D6,D6,D6,D6,D6,D6,D6
oscFREQH	hex	00,00,00,00,00,00,00,00	; 01,01,01,01,01,01,01
	hex	00,00,00,00,00,00,00,00

* VOLUME

oscVOLUME	hex	FF,FF,FF,FF,FF,FF,FF,FF
	hex	FF,FF,FF,FF,FF,FF,FF,FF

* ADDRESS POINTER

oscADDRESS	hex	00,00,C0,C0,80,80,B0,B0	; for sounds in DOCRAM
	hex	E0,E0,60,60,F8,F8,F9,F9

* WAVEFORM TABLE SIZE / RESOLUTION / BANK SELECT (00abcabc)
* 256: 00 0000_0000	00 01 02 03 04 05 06 07
* 512: 09 0000_1001	00 02 04 06 08 0A 0C 0E
*  1k: 12 0001_0010	00 04 08 0C 10 14 18 1C
*  2k: 1b 0001_1011	00 08 10 18 20 28 30 38
*  4k: 24 0010_0100	00 10 20 30 40 50 60 70
*  8k: 2d 0010_1101	00 20 40 60 80 A0 C0 E0
* 16k: 36 0011_0110	00 40 80 C0
* 32k: 3f 0011_1111	00 80

oscWAVRES	hex	3F,3F,2D,2D,36,36,24,24
	hex	2D,2D,2D,2D,00,00,00,00

oscRAMPTR	ds	4*NUM_OSCILLATORS	; current RAM pointer of the sound
oscPAGE	ds	2*NUM_OSCILLATORS	; remaining pages to push (until 0)

theREALOSC	ds	2
theMASKEDOSC	ds	2

*-----------------------------------
* DATA
*-----------------------------------

*----------------------- Memory Manager

myID	ds	2

ptrSOUNDBANK	ds	4
			; Length	DOC size	DOCRAM	INDEX
ptrVINE	ds	4	; 5B00	32k	0000..5FFF	*
ptrJUMP	ds	4	; 1200	8k	C000..D3FF	*
ptrTREASURE	ds	4	; 2600	16k	8000..A7FF	*
ptrDAMAGE	ds	4	;  B00	4k	B000..BFFF	*
ptrDAMAGE2	ds	4	; 1800	8k	E000..F7FF	*
ptrFALLING	ds	4	; 1C00	8k	6000..7FFF	*
ptrDEATH	ds	4	; 6600

*----------------------- GS/OS

proOPEN	dw	12
	ds	2
	adrl	pSOUNDBANK
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	8
	ds	8
	ds	4
proEOF	ds	4

proREAD	dw	4	; 0 - nb parms
	ds	2	; 2 - file id
	ds	4	; 4 - pointer
	ds	4	; 8 - length
	ds	4	; C - length read

proCLOSE	dw	1
	ds	2

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*---------- Files

pSOUNDBANK	strl	'1/snd/soundbank'

pVINE	strl	'1/snd/vine.snd'	; in soundbank
pJUMP	strl	'1/snd/jump.snd'	; in soundbank
pTREASURE	strl	'1/snd/treasure.snd'	; in soundbank
pDAMAGE	strl	'1/snd/damage.snd'	; in soundbank
pDAMAGE2	strl	'1/snd/damage2.snd'	; in soundbank
pFALLING	strl	'1/snd/falling.snd'	; in soundbank
pDEATH	strl	'1/snd/death.snd'	; loaded
