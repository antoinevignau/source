* Sample IIGS source code by Jim Ferr.
* I hereby place this code in the public domain.
* March 19, 1992.
*
* Made relocatable in 2026
* Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* ROUTINES
*
* 1.ALLOCATE	Install the new IM
* 2.INITGS	Inits the SCC
* 3.DOBAUD	Set baud rate with A = 0..8
* 4.MOUT	Send character in A to modem
* 4.REMOVE	Remove the new IM
* CLRMBUF	Clears the buffer
*
* When a command is sent to the SCC,
* result is expected in the 256-byte buffer


*-----------------------------------------------
* Apple IIgs Z8530 registers and constants

GSCMDB	=	$C038
GSCMDA	=	$C039
GSDATAB	=	$C03A
GSDATAA	=	$C03B

WR11A	=	%11010000	;init wr11 in Ch A
WR11B	=	%01010000	;init wr11 in Ch B
			;crystal not used by Ch B
			;3.6864MHz external crystal
			;Rx/Tx clock source = BRG
			;TRxC is an input (tied to cts)
			;bits 1 and 0 insignificant

RESETCHA	=	%11010001	;constant to reset Ch A
RESETCHB	=	%01010001	;constant to reset Ch B

*-----------------------------------------------
* This little routine intercepts the Interrupt
* Manager vector at $E1/0010 or wherever it may
* be in the future, pointing it to our IRQIN
* routine. We save the original manager's address
* so we can pass interrupts that aren't ours to
* the slow-poke firmware.

	mx	%00

ALLOCATE	pha
	pha
	PushWord	#4	; Interrupt Manager
	_GetVector
	PullLong	ORGMGR

	lda	#5	; 19200 by default
	sta	BAUD
	stz	idxBUFFER	; reset buffer index
	
	PushWord	#4	; Interrupt Manager
	PushLong	#IRQIN
	_SetVector
	rts

*-----------------------------------------------
* This routine removes our intercept of the vector
* and restores the original firmware vector.

	mx	%00
	
REMOVE	php
	sei
	jsr	DISABLE	;disable modem port!
			;and put it back in state
			;the serial port firmware
			;can handle.
	clc
	xce
	rep	#$30	;full 16-bit mode

	PushWord	#4
	PushLong	ORGMGR
	_SetVector

	plp
	rts

*-----------------------------------------------
* Data carrier detect flag for main program

DCDSTATE	DS	1	;flag. Non-zero means no DCD.

* Default baud rate

BAUD	dw	5	;1=300, 2=1200, 3=2400
			;4=4800, 5=9600, 6=19200
			;7=38400, 8=57600.
		
	mx	%11	; set Merlin 16+ to 8-bit mode

*-----------------------------------------------
* Interrupt Manager
*
* Here is where we get the irqs and steal ours from
* the teeth of the firmware, as it were. If the irq
* isn't ours, we exit to the firmware. If it is ours,
* we process it and RTI (Return from interrupt).

IRQIN	clc		;emulation or native mode?
	xce		;enter native mode
	bcc	:NATIVE	;was already in native mode

* Emulation mode entry

	sec		;was in emulation mode, so
	xce		;lets go back to it.

	php		;save status for firmware
	pha		;save registers
	phx
	phy

	lda	#$FF
	stal	:FIRST	;first time through flag
	stal	:EMULATE	;emulation mode flag
	bra	:IRQTEST	;check if our irq

* Native mode entry

:NATIVE	php		;save status for firmware
	rep	#$30	;16-bit mode
	mx	%00

	pha		;save all registers
	phx
	phy
	phb		;save DBR

*	PEA	$0000
*	PLB		;switch in data bank zero
*	PLB		;pull 16 bits

	phk
	plb

	sep	#$30	;8-bit mode
	mx	%11

	lda	#$FF
	sta	:FIRST	;first time through flag
	stz	:EMULATE	;kill emulation mode flag
			;fall through to :IRQTEST

* Test if irq pending on SCC Channel B

:IRQTEST	lda	#3
	stal	GSCMDA
	ldal	GSCMDA	;read rr3 ch A ip bits
	and	#%00000101	;check for Rx and ext/stat
			;in Ch B only.
	bne	:GETINT
	jmp	:EXIT

:GETINT	stz	:FIRST	;is definitely our irq
	lda	#2
	stal	GSCMDB
	ldal	GSCMDB	;get vector from rr2B

	and	#%01110000	;examine bits 6-5-4

	cmp	#%00100000	;Rx?
	beq	:RX

	cmp	#%01100000	;special?
	beq	:SPECIAL
			;if not, must be exint.

* Handle external status interrupts

:EXINT	lda	#%00010000	;reset exint pending
	stal	GSCMDB

	ldal	GSCMDB

* The two lines below are commented out because this
* driver assumes carrier detect is in GPi.

* AND #%00100000 ;get CTS/HSKi bit
* EOR #%00100000 ;flip the CTS/HSKi bit

	and	#%00001000	;get DCD/GPi bit
	eor	#%00001000	;flip the DCD/GPi bit

	sta	DCDSTATE	;non-zero means offline
	bra	:IRQTEST

* Special condition (error)

:SPECIAL	lda	#1	;rr1
	stal	GSCMDB
	ldal	GSCMDB
	tax
	and	#%01000000	;framing error?
	bne	:BAD
	txa
	and	#%00100000	;overrun? (latched)
	beq	:BAD

	lda	#%00110000	;error reset command
	stal	GSCMDB	;to clear latched error.
	bra	:IRQTEST

:BAD	ldal	GSDATAB	;eat bad character!
	bra	:IRQTEST

* Get received character

:RX	ldy	idxBUFFER
	ldal	GSDATAB	;get good char
	sta	myBUFFER,y
	iny
	sty	idxBUFFER
	bra	:IRQTEST	;test for more!

*---

:FIRST	DS	1	;flag for first time thru

:EMULATE	DS	1	;flag/ were we in emulation
			;mode or native mode.

* The ONLY exit (from IRQIN)

:EXIT	bit	:EMULATE
	bpl	:EXIT3

* Emulation mode; irq exit routine

:EXIT1	bit	:FIRST	;first time through?
	bmi	:EXIT2	;if so, not our irq
	ply
	plx
	pla
	plp		;restore status
	rti		;was ours.

:EXIT2	ply
	plx
	pla
	plp
	bra	:JUMP	;go to the firmware

* Native mode, irq exit routine

:EXIT3	bit	:FIRST	;first time through?
	bmi	:EXIT4	;if so, not our irq

	rep	#$30	;16-bit mode
	mx	%00
	plb		;restore data bank register
	ply		;restore Y
	plx		;restore X
	pla		;restore A
	plp		;restore original status
	rti		;return from interrupt

:EXIT4	rep	#$30	;16-bit mode
	plb		;restore data bank register
	ply		;restore Y
	plx		;restore X
	pla		;restore A
	plp		;restore original status

	mx	%11

* JML to firmware's handler (and let it worry about
* this interrupt.)

:JUMP	DFB	$5C	;JML
ORGMGR	DS	4	;to original manager address

*-----------------------------------------------
* INITGS: initialize the Modem Port
* (Channel B is modem port, A is printer port)

	mx	%00
	
INITGS	php
	sei
	sep	#$30

	ldal	GSCMDB	;hit rr0 once to sync up

	lda	#9	;wr9
	stal	GSCMDB
	lda	#RESETCHB	;load constant to reset Ch B
			;for Ch A, use RESETCHA
	stal	GSCMDB
	nop		;SCC needs 11 pclck to recover

	lda	#4	;wr4
	stal	GSCMDB	;1 stop bit, no parity
	lda	#%01000100	;X16 clock mode,
	stal	GSCMDB	;could be 1.5 or 2 stop bits
			;1.5 set bits 3,2 to 1,0
			;2   set bits 3,2 to 1,1
	lda	#3	;wr3
	stal	GSCMDB	;could be 7 or 6 or 5 data bits
	lda	#%11000000	;8 data bits, receiver disabled
	stal	GSCMDB	;for 8 bits, bits 7,6 = 1,1

	lda	#5	;wr5
	stal	GSCMDB	;no BRK, xmit disabled, no SDLC
	lda	#%01100010	;DTR enabled 0=/HIGH, 8 data bits
	stal	GSCMDB	;RTS *MUST* be disabled, no crc
	lda	#11	;wr11
	stal	GSCMDB
	lda	#WR11B	;load constant to write
			;use #WR11A for channel A
	stal	GSCMDB

	jsr	TIMECON	;set up wr12 and wr13
			;to set baud rate.
	lda	#14	;wr14
	stal	GSCMDB	;no echo, /DTR follows wr5
	lda	#%00000000	;null cmd, no loopback
	stal	GSCMDB	;BRG source is XTAL or RTxC

* Enables

	lda	#14	;wr14
	stal	GSCMDB
	lda	#%00000001	;enable baud rate gen
	stal	GSCMDB	;write value

	lda	#3
	stal	GSCMDB
	lda	#%11000001	;8 data bits, Rx enable
	stal	GSCMDB	;write value

	lda	#5
	stal	GSCMDB
	lda	#%01101010	;DTR enabled; Tx enable
	stal	GSCMDB	;write value

* Enable Interrupts

	lda	#15	;wr15
	stal	GSCMDB

* The next line is commented out. This driver wants
* interrupts when GPi changes state, ie. the user
* on the BBS may have hung up. You can write a 0
* to this register if you don't need any external
* status interrupts. Then in the IRQIN routine you
* won't need handling for overruns; they won't be
* latched. See the Zilog Tech Ref. for details.

* LDA #%00100000 ;allow ext. int. on CTS/HSKi

	lda	#%00001000	;allow ext. int. on DCD/GPi
	stal	GSCMDB

	lda	#0
	stal	GSCMDB
	lda	#%00010000	;reset ext. stat. ints.
	stal	GSCMDB	;write it twice

	lda	#0
	stal	GSCMDB
	lda	#%00010000	;reset ext. stat. ints.
	stal	GSCMDB	;write it twice

	lda	#1	;wr1
	stal	GSCMDB	;allow IRQs on Rx all & ext. stat
	lda	#%00010001	;Wait Request disabled
	stal	GSCMDB	;No transmit interrupts (b1)

	lda	#9	;re-write wr9
	stal	GSCMDB	;this value gives us vector
	lda	#%00011001	;set Master Interrupt Enable
	stal	GSCMDB	;information with each irq,
			;in vector bits 6-5-4,
			;also including status.

* The vector bits are not used by firmware and IIGS
* TechNote #18. But they make irq handling easier.

	rep	#$30	;(See IRQIN routine.)
	plp
	rts		;we're done!

*-----------------------------------------------
* DISABLE: ensure serial port IRQ's turned off
* (DTR unaffected; use HANGUP or GSDTR)
* This routine puts the port in normal firmware
* state, with no interrupts possible.

DISABLE	php
	sei
	sep	#$20

	lda	#9
	stal	GSCMDB
	lda	#%00000010	;disable MIE temporarily
	stal	GSCMDB

* Interrupt Status

	lda	#1	;wr1
	stal	GSCMDB
	lda	#%00000000	;no DMA, no interrupts
	stal	GSCMDB

	ldal	GSDATAB	;eat any character waiting

	lda	#0	;wr0
	stal	GSCMDB
	lda	#%00010000	;clear any ext ints
	stal	GSCMDB

	lda	#0	;wr0
	stal	GSCMDB	;write it twice
	lda	#%00010000	;clear any ext ints
	stal	GSCMDB

	lda	#9
	stal	GSCMDB
	lda	#%00001010	;reset MIE for firmware use
	stal	GSCMDB

	rep	#$20
	plp
	rts

*-----------------------------------------------
* TIMECON: Set time constant bytes in wr12 & wr13
* (In other words, set the baud rate.)

	mx	%11
	
TIMECON	ldy	BAUD
	lda	#12
	stal	GSCMDB
	lda	BAUDL-1,Y	;load time constant low
	stal	GSCMDB

	lda	#13
	stal	GSCMDB
	lda	BAUDH-1,Y	;load time constant high
	stal	GSCMDB
	rts

* Table of values for different baud rates. There is
* a low byte and a high byte table.

BAUDL	DFB	126	;300 bps (1)
	DFB	94	;1200 (2)
	DFB	46	;2400 (3)
	DFB	22	;4800 (4)
	DFB	10	;9600 (5)
	DFB	4	;19200 (6)
	DFB	1	;38400 (7)
	DFB	0	;57600 (8)

BAUDH	DFB	1	;300 bps (1)
	DFB	0	;1200 (2)
	DFB	0	;2400 (3)
	DFB	0	;4800 (4)
	DFB	0	;9600 (5)
	DFB	0	;19200 (6)
	DFB	0	;38400 (7)
	DFB	0	;57600 (8)

*-----------------------------------------------
* DOBAUD: Set baud rate without resetting entire 8530
* (Stop clock, set time constant, restart clock)

	mx	%00

DOBAUD	php
	sei
	sep	#$20

	sta	BAUD	; save baud speed

	lda	#14	;wr14
	stal	GSCMDB
	lda	#0	;disable BRG (stop clock)
	stal	GSCMDB	;write it

	jsr	TIMECON	;set time constant bytes

	lda	#14
	stal	GSCMDB
	lda	#%00000001	;re-enable BRG
	stal	GSCMDB

	rep	#$20
	plp
	rts

*-----------------------------------------------
* MOUT: send character in A to modem, regardless of
* carrier state. Preserves all registers.

	mx	%00

MOUT	sta	:TEMPA
	stx	:TEMPX
	sep	#$30

:SEND	ldal	GSCMDB	;rr0

	tax
	and	#%00000100	;test bit 2 (hardware handshaking)
	beq	:SEND
	txa
	and	#%00100000	;test bit 5 (ready to send?)
	beq	:SEND

	lda	:TEMPA	;get char to send
	stal	GSDATAB	;send the character

	rep	#$30
	ldx	:TEMPX
	lda	:TEMPA
	rts

:TEMPA	ds	2
:TEMPX	ds	2

*-----------------------------------------------
* Code for checking if data in buffer deleted

* CLRMBUF: clear mbuf.

	mx	%00

CLRMBUF	php		;stuff deleted (fix buffer pointers)
	sei
	sep	#$20
	ldal	GSDATAB	;ensure no data in SCC
	ldal	GSDATAB	;by reading data 3 times
	ldal	GSDATAB	;(it has a 3 byte fifo)

	rep	#$20
	plp
	rts

*-----------------------------------------------
* Buffer area

idxBUFFER	ds	2	; 0..255 but init'ed in 16 bits
myBUFFER	ds	256	; a rolling buffer

