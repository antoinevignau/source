Z8530 SCC Samples
ref. file Z8530_SCCsamples.zip

After downloading, unzip using WinZIP or a similar
utility.

Resulting file is Z8530ROUTNS.SHK

After transferring Z8530ROUTNS.SHK to your Apple IIgs,
unShrink using GS.ShrinkIt ("GSHK", "ShrinkIt.GS", ...).




The enclosed file will show you how to access the Z8530 Serial Communications
controller in the Apple IIgs, without "breaking" the system in any way. These
routines are taken from a working development version of Warp Six BBS version
9.0, a shareware program. Currently version 8.9.1 is released; version 9.0 is
still under development. Warp Six is copyright, but the enclosed routines are
dedicated to the public domain, so you can use them in any way you wish.

The code is well commented, so read it and enjoy it. It's in Merlin 16+
format.

You will also want a copy of the Zilog Z8030/Z8530 SCC Technical Manual,
published by Zilog. Here are some of their phone numbers from the back of
that same manual. Some of these may have changed, so if you can't get
through, try directory assistance at (area code) 555-1212:

Toronto, Canada       (416) 673-0634
Campbell, CA, USA     (408) 370-8120
Dallas, TX, USA       (214) 987-9987

Munich, Germany       49-89-672-045
Tokyo, Japan          81-3-587-0528
Kowloon, Hong Kong      852-7238979
Maidenhead, UK        44-628-392-00

Note: should you find any problems with the source code, please let me know;
however, take note that I don't warrant they are bullet-proof.
---
GEnie: J.FERR  CompuServe: 73057,2455 | Jim Ferr, 26-95 DeCarie Circle
Internet: 73057.2455@compuserve.com   | Etobicoke, Ontario M9B 3J5 CANADA

____________

* Sample IIGS source code by Jim Ferr.
* I hereby place this code in the public domain.
* March 19, 1992.

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

* This little routine intercepts the Interrupt
* Manager vector at $E1/0010 or wherever it may
* be in the future, pointing it to our IRQIN
* routine. We save the original manager's address
* so we can pass interrupts that aren't ours to
* the slow-poke firmware.

	XC
	XC

ALLOCATE	SEI
	CLC		;go to native mode
	XCE
	REP	#$30	;with 16-bit registers
	MX	%00

	PEA	$0000	;push long
	PEA	$0000
	PEA	$0004	;Interrupt Manager refnum

	LDX	#$1103	;GetVector
	JSL	$E10000

	PLA		;save orgmgr address
	STA	ORGMGR
	PLA
	STA	ORGMGR+2

	PEA	$0004	;Interrupt Manager refnum
	PEA	$0000	;bank zero
	PEA	#IRQIN	;our manager address

	LDX	#$1003	;SetVector
	JSL	$E10000

	SEC		;emulation mode
	XCE
	SEP	#$30	;with 8-bit registers
	MX	%11
	CLI
	RTS

	XC	OFF
	XC
	XC	; set to full 65816 opcodes

	MX	%11	; set Merlin 16+ to 8-bit mode

* Data carrier detect flag for main program

DCDSTATE	DS	1	;flag. Non-zero means no DCD.

* Default baud rate

BAUD	DFB	7	;1=300, 2=1200, 3=2400
			;4=4800, 5=9600, 6=19200
			;7=38400, 8=57600.

* Interrupt Manager
*
* Here is where we get the irqs and steal ours from
* the teeth of the firmware, as it were. If the irq
* isn't ours, we exit to the firmware. If it is ours,
* we process it and RTI (Return from interrupt).

	LST	ON
IRQIN	CLC		;emulation or native mode?
	LST	OFF
	XCE		;enter native mode
	BCC	:NATIVE	;was already in native mode

* Emulation mode entry

	SEC		;was in emulation mode, so
	XCE		;lets go back to it.

	PHP		;save status for firmware
	PHA		;save registers
	PHX
	PHY

	LDA	#$FF
	STA	:FIRST	;first time through flag
	STA	:EMULATE	;emulation mode flag
	BRA	:IRQTEST	;check if our irq

* Native mode entry

:NATIVE	PHP		;save status for firmware
	REP	#$30	;16-bit mode
	MX	%00

	PHA		;save all registers
	PHX
	PHY
	PHB		;save DBR

	PEA	$0000
	PLB		;switch in data bank zero
	PLB		;pull 16 bits

	SEP	#$30	;8-bit mode
	MX	%11

	LDA	#$FF
	STA	:FIRST	;first time through flag
	STZ	:EMULATE	;kill emulation mode flag
			;fall through to :IRQTEST

* Test if irq pending on SCC Channel B

:IRQTEST	LDX	#3
	STX	GSCMDA
	LDA	GSCMDA	;read rr3 ch A ip bits
	AND	#%00000101	;check for Rx and ext/stat
			;in Ch B only.
	BNE	:GETINT
	JMP	:EXIT

:GETINT	STZ	:FIRST	;is definitely our irq
	LDX	#2
	STX	GSCMDB
	LDA	GSCMDB	;get vector from rr2B

	AND	#%01110000	;examine bits 6-5-4

	CMP	#%00100000	;Rx?
	BEQ	:RX

	CMP	#%01100000	;special?
	BEQ	:SPECIAL
			;if not, must be exint.

* Handle external status interrupts

:EXINT	LDA	#%00010000	;reset exint pending
	STA	GSCMDB

	LDA	GSCMDB

* The two lines below are commented out because this
* driver assumes carrier detect is in GPi.

* AND #%00100000 ;get CTS/HSKi bit
* EOR #%00100000 ;flip the CTS/HSKi bit

	AND	#%00001000	;get DCD/GPi bit
	EOR	#%00001000	;flip the DCD/GPi bit

	STA	DCDSTATE	;non-zero means offline
	BRA	:IRQTEST

* Special condition (error)

:SPECIAL	LDX	#1	;rr1
	STX	GSCMDB
	LDA	GSCMDB
	TAX
	AND	#%01000000	;framing error?
	BNE	:BAD
	TXA
	AND	#%00100000	;overrun? (latched)
	BEQ	:BAD

	LDA	#%00110000	;error reset command
	STA	GSCMDB	;to clear latched error.
	BRA	:IRQTEST

:BAD	LDA	GSDATAB	;eat bad character!
	BRA	:IRQTEST

* Get received character

:RX	LDA	GSDATAB	;get good char

*** STUFF DELETED (BUFFER THE CHARACTER)

	BRA	:IRQTEST	;test for more!

:FIRST	DS	1	;flag for first time thru

:EMULATE	DS	1	;flag/ were we in emulation
			;mode or native mode.

* The ONLY exit (from IRQIN)

:EXIT	BIT	:EMULATE
	BPL	:EXIT3

* Emulation mode; irq exit routine

:EXIT1	BIT	:FIRST	;first time through?
	BMI	:EXIT2	;if so, not our irq
	PLY
	PLX
	PLA
	PLP		;restore status
	RTI		;was ours.

:EXIT2	PLY
	PLX
	PLA
	PLP
	BRA	:JUMP	;go to the firmware

* Native mode, irq exit routine

:EXIT3	BIT	:FIRST	;first time through?
	BMI	:EXIT4	;if so, not our irq

	REP	#$30	;16-bit mode
	MX	%00
	PLB		;restore data bank register
	PLY		;restore Y
	PLX		;restore X
	PLA		;restore A
	PLP		;restore original status
	RTI		;return from interrupt

:EXIT4	REP	#$30	;16-bit mode
	PLB		;restore data bank register
	PLY		;restore Y
	PLX		;restore X
	PLA		;restore A
	PLP		;restore original status
	MX	%11

* JML to firmware's handler (and let it worry about
* this interrupt.)

:JUMP	DFB	$5C	;JML
	LST	ON
ORGMGR	DS	4	;to original manager address
	LST	OFF

* This routine removes our intercept of the vector
* and restores the original firmware vector.

REMOVE	SEI
	JSR	DISABLE	;disable modem port!
			;and put it back in state
			;the serial port firmware
			;can handle.
	CLC
	XCE
	REP	#$30	;full 16-bit mode

	PEA	$0004	;Interrupt Manager refnum
	LDA	ORGMGR+2
	PHA
	LDA	ORGMGR	;original manager address
	PHA

	LDX	#$1003	;SetVector
	JSL	$E10000

	SEC		;emulation mode
	XCE
	SEP	#$30
	MX	%11
	CLI
	RTS

* INITGS: initialize the Modem Port
* (Channel B is modem port, A is printer port)

INITGS	SEI

	LDA	GSCMDB	;hit rr0 once to sync up

	LDX	#9	;wr9
	LDA	#RESETCHB	;load constant to reset Ch B
			;for Ch A, use RESETCHA
	STX	GSCMDB
	STA	GSCMDB
	NOP		;SCC needs 11 pclck to recover

	LDX	#4	;wr4
	LDA	#%01000100	;X16 clock mode,
	STX	GSCMDB	;1 stop bit, no parity
	STA	GSCMDB	;could be 1.5 or 2 stop bits
			;1.5 set bits 3,2 to 1,0
			;2   set bits 3,2 to 1,1
	LDX	#3	;wr3
	LDA	#%11000000	;8 data bits, receiver disabled
	STX	GSCMDB	;could be 7 or 6 or 5 data bits
	STA	GSCMDB	;for 8 bits, bits 7,6 = 1,1

	LDX	#5	;wr5
	LDA	#%01100010	;DTR enabled 0=/HIGH, 8 data bits
	STX	GSCMDB	;no BRK, xmit disabled, no SDLC
	STA	GSCMDB	;RTS *MUST* be disabled, no crc
	LDX	#11	;wr11
	LDA	#WR11B	;load constant to write
			;use #WR11A for channel A
	STX	GSCMDB
	STA	GSCMDB
	JSR	TIMECON	;set up wr12 and wr13
			;to set baud rate.
	LDX	#14	;wr14
	LDA	#%00000000	;null cmd, no loopback
	STX	GSCMDB	;no echo, /DTR follows wr5
	STA	GSCMDB	;BRG source is XTAL or RTxC

* Enables

	ORA	#%00000001	;enable baud rate gen
	LDX	#14	;wr14
	STX	GSCMDB
	STA	GSCMDB	;write value

	LDA	#%11000001	;8 data bits, Rx enable
	LDX	#3
	STX	GSCMDB
	STA	GSCMDB	;write value

	LDA	#%01101010	;DTR enabled; Tx enable
	LDX	#5
	STX	GSCMDB
	STA	GSCMDB	;write value

* Enable Interrupts

	LDX	#15	;wr15

* The next line is commented out. This driver wants
* interrupts when GPi changes state, ie. the user
* on the BBS may have hung up. You can write a 0
* to this register if you don't need any external
* status interrupts. Then in the IRQIN routine you
* won't need handling for overruns; they won't be
* latched. See the Zilog Tech Ref. for details.

* LDA #%00100000 ;allow ext. int. on CTS/HSKi

	LDA	#%00001000	;allow ext. int. on DCD/GPi

	STX	GSCMDB
	STA	GSCMDB

	LDX	#0
	LDA	#%00010000	;reset ext. stat. ints.
	STX	GSCMDB
	STA	GSCMDB	;write it twice

	STX	GSCMDB
	STA	GSCMDB

	LDX	#1	;wr1
	LDA	#%00010001	;Wait Request disabled
	STX	GSCMDB	;allow IRQs on Rx all & ext. stat
	STA	GSCMDB	;No transmit interrupts (b1)

	LDX	#9	;re-write wr9
	LDA	#%00011001	;set Master Interrupt Enable
	STX	GSCMDB	;this value gives us vector
	STA	GSCMDB	;information with each irq,
			;in vector bits 6-5-4,
			;also including status.

* The vector bits are not used by firmware and IIGS
* TechNote #18. But they make irq handling easier.

			;(See IRQIN routine.)
	CLI
	RTS		;we're done!


* DISABLE: ensure serial port IRQ's turned off
* (DTR unaffected; use HANGUP or GSDTR)
* This routine puts the port in normal firmware
* state, with no interrupts possible.

DISABLE	SEI
	LDA	#%00000010	;disable MIE temporarily
	LDX	#9
	STX	GSCMDB
	STA	GSCMDB

* Interrupt Status

	LDX	#1	;wr1
	LDA	#%00000000	;no DMA, no interrupts
	STX	GSCMDB
	STA	GSCMDB

	LDA	GSDATAB	;eat any character waiting

	LDX	#0	;wr0
	LDA	#%00010000	;clear any ext ints
	STX	GSCMDB
	STA	GSCMDB

	STX	GSCMDB	;write it twice
	STA	GSCMDB

	LDA	#%00001010	;reset MIE for firmware use
	LDX	#9
	STX	GSCMDB
	STA	GSCMDB

	CLI
	RTS

* TIMECON: Set time constant bytes in wr12 & wr13
* (In other words, set the baud rate.)

TIMECON	LDY	BAUD
	LDA	#12
	STA	GSCMDB
	LDA	BAUDL-1,Y	;load time constant low
	STA	GSCMDB

	LDA	#13
	STA	GSCMDB
	LDA	BAUDH-1,Y	;load time constant high
	STA	GSCMDB
	RTS

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

* DOBAUD: Set baud rate without resetting entire 8530
* (Stop clock, set time constant, restart clock)

DOBAUD	SEI
	LDA	#0	;disable BRG (stop clock)
	LDX	#14	;wr14
	STX	GSCMDB
	STA	GSCMDB	;write it

	JSR	TIMECON	;set time constant bytes

	LDA	#%00000001	;re-enable BRG
	LDX	#14
	STX	GSCMDB
	STA	GSCMDB

:EXIT	CLI
	RTS

* MOUT: send character in A to modem, regardless of
* carrier state. Preserves all registers.

MOUT	STA	:TEMPA
	STX	:TEMPX

:SEND	LDA	GSCMDB	;rr0

	TAX
	AND	#%00000100	;test bit 2 (hardware handshaking)
	BEQ	:SEND
	TXA
	AND	#%00100000	;test bit 5 (ready to send?)
	BEQ	:SEND

:EXIT0	LDA	:TEMPA	;get char to send
	STA	GSDATAB	;send the character

:EXIT	LDX	:TEMPX
	LDA	:TEMPA
	RTS

:TEMPA	DS	1
:TEMPX	DS	1

* Code for checking if data in buffer deleted

* CLRMBUF: clear mbuf.

CLRMBUF	SEI

** stuff deleted (fix buffer pointers)

	LDA	GSDATAB	ensure	no	data	in	SCC
	LDA	GSDATAB	by	reading	data	3	times
	LDA	GSDATAB	(it	has	a	3	byte	fifo)

:EXIT	CLI
	RTS
