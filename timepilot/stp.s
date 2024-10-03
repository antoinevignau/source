*
* Sounds for Time Pilot
*
* (c) 2024, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	$B3
	dsk	STP.l
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

AUDIO_BIG_EXPLOSION    	=	0
AUDIO_BOMB             	=	1
AUDIO_BOOOMERANG       	=	2
AUDIO_BOSSL0           	=	3
AUDIO_BOSSL1           	=	4
AUDIO_BOSSL2           	=	5
AUDIO_BOSSL3           	=	6
AUDIO_BOSSL4           	=	7
AUDIO_COINDROP         	=	8
AUDIO_ENEMY_EXPLODE    	=	9
AUDIO_ENEMY_SHOOT      	=	10
AUDIO_ENEMY_SHOOT_SPACE	=	11
AUDIO_EXTRA_LIFE       	=	12
AUDIO_GAME_START       	=	13
AUDIO_HIGHSCORE        	=	14
AUDIO_NEXT_LEVEL       	=	15
AUDIO_PICKUP           	=	16
AUDIO_PLAYER_SHOOT     	=	17
AUDIO_ROCKET_FLY       	=	18
AUDIO_ROCKET_LAUNCH    	=	19
AUDIO_STAGE_CLEAR      	=	20
AUDIO_TIMEWARP         	=	21
AUDIO_WAPON_EXPLODE    	=	22
AUDIO_WAVE_START       	=	23

NUM_AUDIO_SOURCES      	=	24

NUM_OSCILLATORS	=	30	; leave the last 2 alone

*-----------------------------------
* ENTRY POINT
*-----------------------------------

	phk
	plb

	clc
	xce
	rep	#$30
	
	lda	#sndADDRESS
	stal	$300
	lda	#^sndADDRESS
	stal	$302

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
	cmp	#"A"	; A-W are possible keys
	bcc	]lp
	cmp	#"X"+1
	bcs	]lp
	sec
	sbc	#"A"
	rep	#$20
	jsr	playSOUND	; and play
	bra	doPIANO	; so force A=8 now

piano_end	rep	#$20
	rts

*-----------------------------------
* LOAD ALL FILES
*-----------------------------------

loadFILES	lda	#pSOUNDBANK	; The 64KB wavebank
	ldy	#0
	jsr	loadFILE
	sty	ptrSOUNDBANK
	stx	ptrSOUNDBANK+2

	lda	#pBIGEXPLO
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE	; 0 - save number of pages
	sty	ptrBIGEXPLO	; and RAM pointer
	stx	ptrBIGEXPLO+2
	
	lda	#pBOMB
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+2	; 1
	sty	ptrBOMB
	stx	ptrBOMB+2

	lda	#pBOOMERANG
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+4	; 2
	sty	ptrBOOMERANG
	stx	ptrBOOMERANG+2

	lda	#pBOSS
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+6	; 3
	sty	ptrBOSS
	stx	ptrBOSS+2
	
	lda	#pCOINDROP
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+16	; 8
	sty	ptrCOINDROP
	stx	ptrCOINDROP+2

	lda	#pEXTRALIFE
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+24	; 12
	sty	ptrEXTRALIFE
	stx	ptrEXTRALIFE+2

	lda	#pGAMESTART
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+26	; 13
	sty	ptrGAMESTART
	stx	ptrGAMESTART+2

	lda	#pHIGHSCORE
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+28	; 14
	sty	ptrHIGHSCORE
	stx	ptrHIGHSCORE+2
	
	lda	#pNEXTLEVEL
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+30	; 15
	sty	ptrNEXTLEVEL
	stx	ptrNEXTLEVEL+2

	lda	#pSTAGECLEAR
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+40	; 20
	sty	ptrSTAGECLEAR
	stx	ptrSTAGECLEAR+2

	lda	#pTIMEWARP
	ldy	#0
	jsr	loadFILE
	sta	sndPAGE+42	; 21
	sty	ptrTIMEWARP
	stx	ptrTIMEWARP+2
	rts

*-----------------------------------
* LOAD THE BOSS
*-----------------------------------

loadBOSS	sep	#$20
	ora	#'0'
	sta	pBOSS+12
	rep	#$20

	ldy	ptrBOSS	; set the RAM pointer
	sty	proREAD+4
	ldx	ptrBOSS+2
	stx	proREAD+6
	
	lda	#pBOSS
	ldy	#$bdbd	; no new memory handle
	jsr	loadFILE
	
	lda	proEOF+1	; if no bytes loaded
	bne	lb_1	; do not replace the
	rts		; sound data

*--- And move the sound into DOCRAM

lb_1	php
	sei
	sep	#$20

	ldy	ptrBOSS
	sty	dpFROM
	ldx	ptrBOSS+2
	stx	dpFROM+2
	
	ldal	IRQ_VOLUME
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	stal	SOUNDCTL

	lda	#$00	; DOCRAM address $3000
	stal	SOUNDADRL
	lda	#$30
	stal	SOUNDADRH

	ldy	#0	; Move 4K
]lp	lda	[dpFROM],y
	stal	SOUNDDATA
	iny
	cpy	#$1000
	bcc	]lp

	rep	#$20
	plp
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

	ldy	#0	; configure the first 30 oscillators
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
	lda	#%0000_0010	; left one shot (which is right)
	stal	SOUNDDATA
	tya
	ora	#$a1
	stal	SOUNDADRL
	lda	#%0001_0010	; right one shot (which is left)
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

	lda	#$c000	; we need speed,
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
	
	lda	sndADDRESS,x ; get pointer
	tax
	lda	|$0000,x	; save it
	sta	oscRAMPTR,y
	sta	ps_patch+1
	
	sep	#$20
	lda	|$0002,x
	sta	oscRAMPTR+2,y
	
	pha
	plb

*--- Move 256 bytes to DOCRAM (A: bank, Y: address)

	lda	dpSOUNDCTL
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	sta	dpSOUNDCTL
	
ps_patch	ldy	#$bdbd	; address = oscRAMPTR

]move	=	$00
	lup	256
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
	lda	#%0000_1110	; left, interrupt, swap, start oscillator
	sta	dpSOUNDDATA
	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0000_0111	; right, no interrupt, swap, start oscillator
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
	bra	si_exit
	
*--- Set the sound address where to stream data

si_continue	lda	dpSOUNDCTL
	ora	#%0110_0000	; bit 6: access RAM, bit 5: enable auto increment
	sta	dpSOUNDCTL

	stz	dpSOUNDADRL	; DOCRAM address $xx00

	ldy	theREALOSC
	lda	oscADDRESS2,y
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
	lsr
	bcc	si_impair

* impair a généré l'interruption, on doit jouer sur le pair

	tya
	ora	#$a0
	sta	dpSOUNDADRL
	lda	#%0000_1110
	sta	dpSOUNDDATA
	bra	si_next

* pair a généré l'interruption, on doit jouer sur l'impair

si_impair	tya
	ora	#$a1
	sta	dpSOUNDADRL
	lda	#%0000_1110
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

sndADDRESS	da	ptrBIGEXPLO	; 0
	da	ptrBOMB	; 1
	da	ptrBOOMERANG	; 2
	da	$0000	; 3
	da	$0000	; 4
	da	$0000	; 5
	da	$0000	; 6
	da	$0000	; 7
	da	ptrCOINDROP	; 8
	da	$0000	; 9
	da	$0000	; 10
	da	$0000	; 11
	da	ptrEXTRALIFE	; 12
	da	ptrGAMESTART	; 13
	da	ptrHIGHSCORE	; 14
	da	ptrNEXTLEVEL	; 15
	da	$0000	; 16
	da	$0000	; 17
	da	$0000	; 18
	da	$0000	; 19
	da	ptrSTAGECLEAR	; 20
	da	ptrTIMEWARP	; 21
	da	$0000	; 22
	da	$0000	; 23

sndPAGE	dw	0	; 0 - number of sound pages - word
	dw	0	; 1
	dw	0	; 2
	dw	0	; 3
	dw	0	; 4
	dw	0	; 5
	dw	0	; 6
	dw	0	; 7
	dw	0	; 8
	dw	0	; 9
	dw	0	; 10
	dw	0	; 11
	dw	0	; 12
	dw	0	; 13
	dw	0	; 14
	dw	0	; 15
	dw	0	; 16
	dw	0	; 17
	dw	0	; 18
	dw	0	; 19
	dw	0	; 20
	dw	0	; 21
	dw	0	; 22
	dw	0	; 23

sndPLAY	dfb	FALSE	; A 0 - in DOCRAM if TRUE, in RAM if FALSE
	dfb	FALSE	; B 1 - 
	dfb	FALSE	; C 2 - 
	dfb	TRUE	; D 3 - 
	dfb	TRUE	; E 4 - 
	dfb	TRUE	; F 5 - 
	dfb	TRUE	; G 6 - 
	dfb	TRUE	; H 7 - 
	dfb	FALSE	; I 8 - 
	dfb	TRUE	; J 9 - 
	dfb	TRUE	; K 10 - 
	dfb	TRUE	; L 11 - 
	dfb	FALSE	; M 12 - 
	dfb	FALSE	; N 13 - 
	dfb	FALSE	; O 14 - 
	dfb	FALSE	; P 15 - 
	dfb	TRUE	; Q 16 - 
	dfb	TRUE	; R 17 - 
	dfb	TRUE	; S 18 - 
	dfb	TRUE	; T 19 - 
	dfb	FALSE	; U 20 - 
	dfb	FALSE	; V 21 - 
	dfb	TRUE	; W 22 - 
	dfb	TRUE	; X 23 - 
	
snd2OSC	dfb	18	; A 0 - sound index to oscillator index
	dfb	24	; B 1
	dfb	24	; C 2 - boomerang?
	dfb	2	; D 3
	dfb	2	; E 4
	dfb	2	; F 5
	dfb	2	; G 6
	dfb	2	; H 7
	dfb	26	; I 8
	dfb	4	; J 9
	dfb	6	; K 10
	dfb	6	; L 11 - enemy shoot space?
	dfb	22	; M 12
	dfb	26	; N 13
	dfb	26	; O 14
	dfb	20	; P 15
	dfb	8	; Q 16
	dfb	10	; R 17
	dfb	14	; S 18
	dfb	16	; T 19
	dfb	26	; U 20 - stage clear?
	dfb	28	; V 21
	dfb	0	; W 22
	dfb	12	; X 23

*-----------------------------------
* ENSONIQ DATA
*-----------------------------------

* FREQUENCY CONTROL LOW AND HIGH

oscFREQL	hex	D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6
	hex	D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,D6,00,00

oscFREQH	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
	hex	00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

* VOLUME

oscVOLUME	hex	FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF
	hex	FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,FF,00,00

* ADDRESS POINTER

oscADDRESS	hex	00,00,30,30,40,40,70,70,80,80,B0,B0,C0,C0,E0,E0
	hex	F0,F0,D8,D9,DA,DB,DC,DD,DE,DF,BC,BD,BE,BF,00,00

oscADDRESS2	hex	00,00,30,30,40,40,70,70,80,80,B0,B0,C0,C0,E0,E0
	hex	F0,F0,D9,D8,DB,DA,DD,DC,DF,DE,BD,BC,BF,BE,00,00

* WAVEFORM TABLE SIZE / RESOLUTION / BANK SELECT (00abcabc)
* 256: 00 0000_0000
* 512: 09 0000_1001
*  1k: 12 0001_0010
*  2k: 1b 0001_1011
*  4k: 24 0010_0100
*  8k: 2d 0010_1101
* 16k: 36 0011_0110

oscWAVRES	hex	36,36,24,24,36,36,24,24,36,36,24,24,2D,2D,24,24
	hex	24,24,00,00,00,00,00,00,00,00,00,00,00,00,00,00

oscRAMPTR	ds	4*NUM_OSCILLATORS	; current RAM pointer of the sound
oscPAGE	ds	2*NUM_OSCILLATORS	; remaining pages to push (until 0)

theREALOSC	ds	2
theMASKEDOSC ds	2

*-----------------------------------
* DATA
*-----------------------------------

*----------------------- Memory Manager

myID	ds	2

ptrSOUNDBANK ds	4

ptrBIGEXPLO	ds	4
ptrBOMB	ds	4
ptrBOOMERANG ds	4
ptrBOSS	ds	4
ptrCOINDROP	ds	4
ptrEXTRALIFE ds	4
ptrGAMESTART ds	4
ptrHIGHSCORE ds	4
ptrNEXTLEVEL ds	4
ptrSTAGECLEAR ds	4
ptrTIMEWARP	ds	4

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

pBIGEXPLO	strl	'1/snd/bigexplo.snd'
pBOMB	strl	'1/snd/bomb.snd'
pBOOMERANG	strl	'1/snd/boomerang.snd'
pBOSS	strl	'1/snd/boss0.snd'	; +12 for the level
pCOINDROP	strl	'1/snd/coindrop.snd'
pEXTRALIFE	strl	'1/snd/extralife.snd'
pGAMESTART	strl	'1/snd/gamestart.snd'
pHIGHSCORE	strl	'1/snd/highscore.snd'
pNEXTLEVEL	strl	'1/snd/nextlevel.snd'
pSTAGECLEAR	strl	'1/snd/stageclear.snd'
pTIMEWARP	strl	'1/snd/timewarp.snd'
