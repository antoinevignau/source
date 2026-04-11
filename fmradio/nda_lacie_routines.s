*
* FM Radio NDA
*
* (c) 2026, Brutal Deluxe Software
*
* v1.0 - 2026
*

	mx	%00

*---------- ADB
*
* Sources
*  Macintosh Inside Mac ADB Manager
*   https://drive.google.com/file/d/16xFkb8oUzATYxg81mgSRrTVVxJlStRA1/view?usp=share_link
*
*  Apple IIgs Toolbox Reference Volume 1
*   https://drive.google.com/file/d/1uUJtv4EI7XCUd29V0EQ_RzSw9hfEJl3W/view?usp=share_link
*
*  ADB specifications
*   Rev B: http://www.brutaldeluxe.fr/documentation/cortland/v5/Front%20Desk%20Bus%20Specifications%20-%20062-0267%20Rev%20B%20-%2019850916.pdf
*   v2.50: http://www.brutaldeluxe.fr/documentation/cortland/v3/Front%20Desk%20Bus%20ERS%20-%20Peter%20Baum%20-%20v02.50%20-%2019851024.pdf
*   v3.0 : http://www.brutaldeluxe.fr/documentation/cortland/v3_10_FDBERS.pdf

*  Apple IIgs ADB toolset ERS
*   v1.0: http://www.brutaldeluxe.fr/documentation/cortland/v3/The%20FDB%20uC%20Tool%20Set%20-%20Peter%20Baum%20-%20Rev%201.0%20-%2019860312.pdf
*   v1.1: http://www.brutaldeluxe.fr/documentation/cortland/v3/The%20ADB%20uC%20Tool%20Set%20-%20Peter%20Baum%20-%20Rev%201.1%20-%2019860515.pdf

*  Tashtari's notes (thank you a lot for your help)
*   http://github.com/lampmerchant/tashnotes/blob/main/macintosh/adb/other/lacie_fm_radio.md
*
* Comments
*  The Mac directly talks/listens to the ADB chip
*  The IIgs communicates with the ADB chip through the Keygloo.
*  The Keygloo allows communication between the uC and the system processor.
*  All commands described in the Apple IIgs Toolbox Reference Volume 1 are between the toolset and the Keygloo *ONLY*
*
* ADB commands
*  Talk: from a device to the host - It means: "Device, talk to me, send me data"
*  Listen: from the host to a device - It means: "Device, listen to me, eat my data"
*
*  Command syntax
*   7654 32 10 Command
*   --------------------
*   xxxx 00 00 SENDRESET
*   ADDR 00 01 FLUSH
*   XXXX 00 10 RESERVED
*   XXXX 00 11 RESERVED
*   XXXX 01 XX RESERVED
*   ADDR 10 RR LISTEN
*   ADDR 11 RR TALK
*
*   ADDR = 0..15 - device address
*   RR = 0..3 - register
*

*---------- Apple IIgs SendInfo ADB Commands (the ADB Tool Set *only*)

transmitADBBytes =	%01000111	; $47
enableSRQ	=	%01010000	; $50
disableSRQ	=	%01110000	; $70
listen	=	%10000000	; $80
talk	=	%11000000	; $C0

*---------- Error codes

cmdIncomplete	=	$0910	; Command not completed
cantSync	=	$0911	; Can't synchronize with system
adbBusy	=	$0982	; ADB busy (command pending)
devNotAtAddr	=	$0983	; Device not present at address
srqListFull	=	$0984	; SRQ list full

*---------- FM Radio registers (big endian ordering in RAM, from Tashtari)

baseFREQ	=	$0358	; (-)10.7 MHz

* Register 1 - Volume and tone controls
* Register 1 sets the volume and tone controls and is three bytes in length.
* Talk 1 has a fourth byte appended which is the firmware revision of the FM Radio (mine is 0x0A).
*
*   Bit  Description
* 23-16  Volume, apparently set in increments of 0x11 by the application
*    15  Always zero
* 14-12  Treble
*    11  Always zero
*  10-8  Bass
*     7  Mute, active high
*   6-5  Sound fading, 0 = normal, 1 = low, 2 = medium, 3 = high
*   4-1  Undetermined, apparently always zero
*     0  Undetermined, initially zero but always set high by the application
*
* Register 2 - FM station selection
* 
* First byte
* In a Listen 2 command, the fist byte seems to always be 0x41. In a Talk command, the bits of the first bytes are as follows:
*
* Bit  Description
*   7  FM stereo indicator, active high
* 6-1  Undetermined, apparently always zero
*   0  Signal strength indicator, active high
*
* Second and third bytes (big endian)
* The second and third bytes indicate the FM station. Starting from a base of -10.7 MHz (0x358), the following values are added to it:
*
* Bit  Description
*  15  Undetermined, always zero
*  14  Undetermined, always zero
*  13  102.4 MHz
*  12  51.2 MHz
*  11  25.6 MHz
*  10  12.8 MHz
*   9  6.4 MHz
*   8  3.2 MHz
*   7  1.6 MHz
*   6  800 kHz
*   5  400 kHz
*   4  200 kHz
*   3  100 kHz
*   2  50 kHz
*   1  Undetermined, always zero
*   0  Undetermined, always zero
*
* Register 3 - Default device data
*
*  For FM Radio, this is 0779
*   Default address is 07
*   Default handler ID is 79
*
* -------------------------------
* 1 1 1 1 1
* 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
* -------------------------------
* 0 ! ! 0 ------- ---------------
*   ! !   Address Dev handler ID
*   ! > Service request enable
*   > Exceptional event
*
*
* HOW TO USE
*  To set volume & tone: send 8 Talk 0 commands, then a Listen 1 command followed by 8 Talk 0 commands
*  To set the frequency: send 8 Talk 0 commands, then a Listen 2 command followed by 8 Talk 0 commands
* 

ID_LACIE	=	$79	; handler ID of the LaCie FM Radio
NB_RETRY	=	8

	mx	%00

*----------------------------
* GET DEVICE INFO
*----------------------------

lacie_getINFO
	ldx	#NB_RETRY
]lp	phx
	jsr	FMTalkRegister3
	plx
	dex
	bne	]lp

ok_getINFO1	jsr	FMListenRegister3	; reset please

	ldx	#NB_RETRY
]lp	phx
	jsr	FMTalkRegister3
	plx
	bcc	ok_getINFO2
	dex
	bne	]lp

ok_getINFO2	lda	dataTalk3+1	; return the FM Radio handler ID
	and	#$ff	; or 0 if no radio is found
	cmp	#ID_LACIE
	rts

*----------------------------
* SET DEFAULT VALUES
*----------------------------

lacie_setDFTVAL
	lda	#DFT_VOL
	sta	theVOL
	lda	#DFT_FREQ
	sta	theFREQ
	lda	#DFT_OFF
	sta	fgMUTE
	lda	#DFT_ON
	sta	fgRDS
	rts
	
*----------------------------
* TURN DEVICE OFF
*----------------------------

lacie_switchOFF
	lda	#DFT_ON
	sta	fgMUTE
	lda	#0
	sta	theVOL	; and go below...
	
*----------------------------
* SET VOLUME
*----------------------------

lacie_setVOLUME
	pha		; _UDivide 0..100

	pha
	pha
	PushWord	theVOL	; volume x 100
	PushWord	#10	
	_Multiply

	PushWord	#66	; =100/15
	_UDivide
	pla
	plx
	
	sep	#$20
	
	and	#$0f	; 0v
	sta	volume
	asl
	asl
	asl
	asl
	ora	volume
	sta	volume	; vv

	lda	fgMUTE	; mute
	beq	nomute
	lda	#$80	; bit 7
nomute	sta	mute

	rep	#$20

*--- Set the register

*	ldx	#NB_RETRY
*]lp	phx
*	jsr	FMTalkRegister1
*	plx
*	dex
*	bne	]lp

ok_setVOL1	jsr	FMListenRegister1

	ldx	#NB_RETRY
]lp	phx
	jsr	FMTalkRegister1
	plx
	bcc	ok_setVOL2
	dex
	bne	]lp

ok_setVOL2	lda	dataTalk1	; volume + bass/treble equal?
	cmp	dataListen1+1
	bne	ok_setVOL1
	lda	dataTalk1+1	; bass/treble + mute equal?
	cmp	dataListen1+2
	bne	ok_setVOL1
	rts		; yes, exit

*----------------------------
* SET FREQUENCY
*----------------------------

lacie_setFREQUENCY
	lda	theFREQ
	asl
	tax
	lda	tblFREQUENCY,x
	xba
	sta	frequency

*--- Set the register
	
*	ldx	#NB_RETRY
*]lp	phx
*	jsr	FMTalkRegister2
*	plx
*	dex
*	bne	]lp

ok_setFREQ1	jsr	FMListenRegister2

	ldx	#NB_RETRY
]lp	phx
	jsr	FMTalkRegister2
	plx
	bcc	ok_setFREQ2
	dex
	bne	]lp

ok_setFREQ2	lda	dataTalk2+1	; are frequencies equal?
	cmp	dataListen2+2
	bne	ok_setFREQ1
	rts		; yes, exit

*----------------------------
* DISPLAY FREQUENCY
*----------------------------
* Formula = (76 x 100) + (theFREQ x 5)

lacie_printFREQUENCY
	lda	#'00'
	sta	strFREQUENCY
	
	lda	theFREQ	; convert to string
	asl
	asl
	clc
	adc	theFREQ
	adc	#76*100
	pha
	PushLong	#strFREQUENCY
	PushWord	#5
	PushWord	#FALSE
	_Int2Dec

	PushWord	#10
	PushWord	#30
	_MoveTo

*
* Font: LED.24 font, ID#32671, from BRCC Font #4 disk
*

	jsr	lacie_printNEW
	rts

	PushWord #$1800
	PushWord #32671		; LED.24
	PushWord #0
	_InstallFont

	PushLong	#strFREQUENCY
	_DrawCString
	rts

*---

valFREQUENCY	ds	4	; Formula (max 650*5 + 7600)
strFREQUENCY	asc	'00000'00	; '10550'

*----------------------------
* FREQUENCY TABLE
*----------------------------

tblFREQUENCY
]theFREQ	=	$1b18
	lup	650
	dw	]theFREQ
]theFREQ	=	]theFREQ+4
	--^

*------------------------------------------------
*
* ADB TOOL SET ROUTINES
*
*------------------------------------------------

*-----------------------
* LISTEN routines to send
* data to the radio
*-----------------------

*-----------------------
* LISTEN TO REGISTER 1
*-----------------------

FMListenRegister1		; send volume & tone data to the FM Radio

	lda	#NB_RETRY
	sta	errCNT

]lp	PushWord	#1+3	; command (1) + data (3)
	PushLong	#dataListen1
	PushWord	#transmitADBBytes+3	; + number of data bytes
	_SendInfo
	bcc	FMLR1OK
	dec	errCNT
	beq	FMLR1OK
	cmp	#adbBusy
	beq	]lp
FMLR1OK	rts
	
*-----------

dataListen1	dfb	%0111_10_01	; ADB command: Address (0111) + Listen (10) + Register (01)
volume	dfb	%0111_0111	; volume (by increments of 0x11)
	dfb	%0001_0001	; treble (1) and bass (1)
mute	dfb	%0000_0000	; mute (off) & fading (normal)

*-----------------------
* LISTEN TO REGISTER 2
*-----------------------

FMListenRegister2		; send FM frequency to the FM Radio

	lda	#NB_RETRY
	sta	errCNT

]lp	PushWord	#1+3	; command (1) + data (3)
	PushLong	#dataListen2
	PushWord	#transmitADBBytes+3	; + number of data bytes
	_SendInfo
	bcc	FMLR2OK
	dec	errCNT
	beq	FMLR2OK
	cmp	#adbBusy
	beq	]lp
FMLR2OK	rts
	
*-----------

dataListen2	dfb	%0111_10_10	; ADB command: Address (0111) + Listen (10) + Register (10)
	dfb	%0100_0001	; Default value (0x41)
frequency	hex	2500	; Frequency (107.5 MHz, big endian)

*-----------------------
* LISTEN TO REGISTER 3
*-----------------------

FMListenRegister3		; send a request to the FM Radio

	lda	#NB_RETRY
	sta	errCNT

]lp	PushWord	#1+1	; command (1) + data (1)
	PushLong	#dataListen3
	PushWord	#transmitADBBytes+1	; + number of data bytes
	_SendInfo
	bcc	FMLR3OK
	dec	errCNT
	beq	FMLR3OK	; no more tries, exit
	cmp	#adbBusy
	beq	]lp	; loop for a busy ADB
FMLR3OK	rts

*-----------

dataListen3	dfb	%0111_10_11	; ADB command: Address (0111) + Listen (10) + Register (11)
	dfb	%1111_1111	; initiate a self-test

*-----------------------
* TALK routines to get
* data from the radio
*-----------------------

*-----------------------
* TALK TO REGISTER 0
*-----------------------

FMTalkRegister0		; ask the FM Radio to talk to me on register 0

	lda	#dataTalk0
	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_00_0111	; talk (11) + register (00) + address (0111)
	_AsyncADBReceive
	bcc	FMTR0OK
	dec	errCNT
	beq	FMTR0OK
	cmp	#adbBusy
	beq	]lp
FMTR0OK	rts

*-----------

dataTalk0	ds	8	; unknown format

*-----------------------
* TALK TO REGISTER 1
*-----------------------

FMTalkRegister1		; ask the FM Radio to talk to me on register 1

	lda	#dataTalk1
	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_01_0111	; talk (11) + register (01) + address (0111)
	_AsyncADBReceive
	bcc	FMTR1OK
	dec	errCNT
	beq	FMTR1OK
	cmp	#adbBusy
	beq	]lp
FMTR1OK	rts

*-----------

dataTalk1	ds	1	; volume
	ds	1	; tone
	ds	1	; mute / fading
	ds	1	; firmware revision
	ds	4	; padding

*-----------------------
* TALK TO REGISTER 2
*-----------------------

FMTalkRegister2		; ask the FM Radio to talk to me on register 2

	lda	#dataTalk2
	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_10_0111	; talk (11) + register (10) + address (0111)
	_AsyncADBReceive
	bcc	FMTR2OK
	dec	errCNT
	beq	FMTR2OK
	cmp	#adbBusy
	beq	]lp
FMTR2OK	rts

*-----------

dataTalk2	ds	1	; FM indicators
	ds	2	; frequency
	ds	5	; padding
	
*-----------------------
* TALK TO REGISTER 3
*-----------------------

FMTalkRegister3		; ask the FM Radio to talk to me on register 3

	lda	#dataTalk3
	sta	cpBuffer+1
	
	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_11_0111	; talk (11) + register (11) + address (0111)
	_AsyncADBReceive
	bcc	FMTR3OK
	dec	errCNT
	beq	FMTR3OK
	cmp	#adbBusy
	beq	]lp
FMTR3OK	rts

*-----------

dataTalk3	ds	1	; address
			; 67 = -1-- = exceptional event, device specific; always 1 if not used
			;      --1- = service request enable; 1 = enabled 
			;      0111 = address
	ds	1	; 79 = handler ID
	ds	6	; padding

*-----------------------

	mx	%11	; enter the 8-bit world

completionRoutine	; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool
	tay
	iny
]lp	lda	[6],y
	tyx
	dex		; x = y - 1
cpBuffer	stal	dataTalk0,x	; patch this address please
	dey
	bne	]lp
endpool	pld
	rtl
	
	mx	%00	; back to the 16-bit world
	
*--- ADB Data

errCNT	ds	2	; this is an error counter word!
