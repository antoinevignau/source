*
* FM Radio
* A test app to listen to the radio on the Apple IIgs
*
* (c) 2023, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00
	
	rel
	lst	off
	
*----------

	use	4/ADB.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

GSOS	=	$e100a8

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
*   ADDR = 0..15
*   RR = 0..3
*

*---------- Apple IIgs SendInfo ADB Commands (the ADB Tool Set *only*)

transmitADBBytes =	%01000111	; $47
enableSRQ	=	%01010000	; $50
disableSRQ	=	%01110000	; $70
listen	=	%10000000	; $80
talk	=	%11000000	; $C0

*---------- Error codes

cmdIncomplete =	$0910	; Command not completed
cantSync	=	$0911	; Can't synchronize with system
adbBusy	=	$0982	; ADB busy (command pending)
devNotAtAddr =	$0983	; Device not present at address
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
* In a Listen 2 command ,the fist byte seems to always be 0x41. In a Talk command, the bits of the first bytes are as follows:
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
*----------------------------
* ENTRY POINT
*----------------------------

	phk
	plb

	clc
	xce
	rep	#$30

	_TLStartUp
	pha
	_MMStartUp
	pla
	sta	appID
	ora	#$0100
	sta	myID

	_MTStartUp
	_TextStartUp
	_IMStartUp
	_ADBStartUp

*----------

	PushWord	#$00FF
	PushWord	#$0080
	_SetInGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetOutGlobals
	PushWord	#$00FF
	PushWord	#$0080
	_SetErrGlobals
	
	PushWord	#0
	PushLong	#3
	_SetInputDevice
	PushWord	#0
	PushLong	#3
	_SetOutputDevice
	PushWord	#0
	PushLong	#3
	_SetErrorDevice
	
	PushWord	#0
	_InitTextDev
	PushWord	#1
	_InitTextDev
	PushWord	#2
	_InitTextDev

	PushWord	#$0c                 ; home
	_WriteChar

*----------------------------
* MENU: MAIN
*----------------------------

mainMENU
	PushLong	#strMAINMENU
	_WriteCString

	jsr	waitFORKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	bne 	mmNOT1
	jmp	broadcastRangeMENU
mmNOT1	cmp	#"2"
	bne	mmNOT2
	jmp	volumeDownMENU
mmNOT2	cmp	#"3"
	bne	mmNOT3
	jmp	volumeUpMENU
mmNOT3	cmp	#"4"
	bne	mmNOT4
	jmp	setFrequencyMENU
mmNOT4	cmp	#"-"
	bne	mmNOT5
	jmp	decreaseFREQUENCY
mmNOT5	cmp	#"+"
	bne	mainMENU
	jmp	increaseFREQUENCY
	
*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT
	_ADBShutDown
	_IMShutDown
	_TextShutDown
	_MTShutDown

	PushWord	myID
	_DisposeAll

	PushWord	appID
	_MMShutDown

	_TLShutDown

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*---------- Data

strMAINMENU
	asc	0d'FM Radio'0d
	asc	'(c) 2023, Brutal Deluxe Software'0d
	asc	' 1. Set FM broadcast range'0d
	asc	' 2. Volume down'0d
	asc	' 3. Volume up'0d
	asc	' 4. Set frequency'0d
	asc	' Q. Quit'0d00

*----------------------------
* MENU: FM BROADCAST RANGE
*----------------------------
* There are different FM broadcast ranges in the world,
* a couple are shown here, and will let the users select
* their own range. See the text below to find your range.
*
* The values match those of the FM Radio (including the -10.7 MHz thing)
*

broadcastRangeMENU
	PushLong  #strBROADCASTMENU
	_WriteCString

]lp	jsr	waitFORKEY           ; is it 0-9
	cmp	#"0"
	bcc	]lp
	bne	brmOK
	jmp	mainMENU             ; or even 0 to exit

brmOK	cmp	#"4"+1
	bcs	]lp

	sec                            ; we have our device ID
	sbc	#"1"
	asl
	asl
	tax
	lda	freqTABLE,x
	sta	freqMIN
	lda	freqTABLE+2,x
	sta	freqMAX
	jmp	mainMENU

*---------- Data

strBROADCASTMENU
	asc	0d'Select your area:'0d
	asc	' 1. Brazil (76.1 MHz to 108 MHz)'0d
	asc	' 2. Europe (87.5 MHz to 108 MHz)'0d
	asc	' 3. Japan (76 MHz to 95 MHz)'0d
	asc	' 4. USA (88 MHz to 108 MHz)'0d
	asc	' 0. Back to main menu'0d00

freqTABLE
	dw	$1B20,$2518	; Brazil
	dw	$1EB0,$2518	; Europe
	dw	$1B18,$2108	; Japan
	dw	$1ED8,$2518	; USA
	
*----------------------------
* MENU: VOLUME DOWN
*----------------------------
* We simply subtract 0x11 to the current volume
*

volumeDownMENU
	sep	#$20	; switch to 8-bit
	lda	volume
	bne	vdOK
	rep	#$20	; cannot change volume
	jmp	mainMENU

	mx	%10	; still in 8-bit for A
	
vdOK	sec
	sbc	#%0001_0001	; decrements by 0x11
	sta	volume
	rep	#$20	; back to 16-bit world

	mx	%00
	
	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp
skipmedown
	jsr	FMSendRegister1

	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp
	
	jmp	mainMENU

*----------------------------
* MENU: VOLUME UP
*----------------------------
* We add 0x11 to the current volume
*

volumeUpMENU
	sep	#$20	; switch to 8-bit
	lda	volume
	cmp	#%1111_1111	; max volume?
	bne	vuOK
	rep	#$20	; cannot change volume
	jmp	mainMENU

	mx	%10	; still in 8-bit for A
	
vuOK	clc
	adc	#%0001_0001	; decrements by 0x11
	sta	volume
	rep	#$20	; back to 16-bit world

	mx	%00
	
	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp
skipmeup

	jsr	FMSendRegister1

	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp

	jmp	mainMENU

*----------------------------
* MENU: SET FREQUENCY
*----------------------------
* We set the requested FM Frequency.
* Some checks are done but not all.
* It is a proof of concept app :-)
* For < 100 MHz stations, either enter 095.2 or 95.20
*

maxCount	=	5

setFrequencyMENU
	PushLong  #strSETFREQUENCYMENU
	_WriteCString

* Clear entry buffer

	sep	#$20
	ldx	#maxCount-1
	lda	#"."
]lp	sta	strBUFFER,x
	dex
	bpl	]lp
	rep	#$20
	
	PushWord	#0	; wordspace
	PushLong	#strBUFFER	; bufferPtr
	PushWord	#maxCount	; maxCount
	PushWord	#$8d	; eolChar
	PushWord	#1	; echoFlag
	_ReadLine
	pla
	bne	sfmOK
sfmKO	jmp	mainMENU

sfmOK	cmp	#2	; two chars at a minimum!
	bcc	sfmKO

* Reset the frequency string

	lda	#"00"
	sta	mySTRFREQ
	sta	mySTRFREQ+2
	
* Copy string (skip separator)

	sep	#$20	; 8-bit world

	ldx	#0
	txy
]lp	lda	strBUFFER,x
	cmp	#"."	; skip dot
	beq	sfmDOT
	cmp	#$8d	; CR
	beq	sfmDOT
	sta	mySTRFREQ,y
	iny
sfmDOT	inx
	cpx	#maxCount
	bcc	]lp

* Right justify it now

	lda	mySTRFREQ
	cmp	#"1"
	beq	sfmNADA
	
	lda	mySTRFREQ+2
	sta	mySTRFREQ+3
	lda	mySTRFREQ+1
	sta	mySTRFREQ+2
	lda	mySTRFREQ
	sta	mySTRFREQ+1
	lda	#"0"
	sta	mySTRFREQ

* Convert in hex

sfmNADA	rep	#$20

	PushLong	#0
	PushLong	#mySTRFREQ
	PushWord	#4	; strLength
	PushWord	#0	; unsigned
	_Dec2Long
	pla
	plx
	bcc	sfmNEXT	; no error, that's cool
	jmp	mainMENU	; we quit!!

* We have the hex equivalent of the frequency

sfmNEXT	asl		; *8
	asl
	asl
	clc
	adc	#baseFREQ	; +$358
	sta	freqCURRENT
	
* Now compare with the limits

theHiddenCall

	lda	freqCURRENT
	cmp	freqMIN
	bcs	stmFREQOK
	cmp	freqMAX
	bcc	stmFREQOK
	beq	stmFREQOK
	jmp	mainMENU
	
stmFREQOK	xba		; big endian world
	sta	frequency	; final frequency!

	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp

skipme2	jsr	FMSendRegister2

	ldx	#8
]lp	phx
	jsr	FMTalkRegister0
	plx
	dex
	bne	]lp

	jmp	mainMENU

*---------- Data

strSETFREQUENCYMENU
	asc	0d'Which frequency (88, 95.2, 107.7)? '00

strBUFFER	ds	maxCount	; 102.7 is the max length
mySTRFREQ	asc	'0000'	; 1055 1000 0995
	
*---------- My frequency data is little endian

freqCURRENT	dw	$2500	; The default 
freqMIN	ds	2
freqMAX	ds	2

*----------------------------
* MENU: DECREASE/INCREASE FREQUENCY
*----------------------------
* frequency -= 8 or frequency += 8

decreaseFREQUENCY
	lda	freqCURRENT
	sec
	sbc	#8
	sta	freqCURRENT
	brl	theHiddenCall

increaseFREQUENCY
	lda	freqCURRENT
	clc
	adc	#8
	sta	freqCURRENT
	brl	theHiddenCall
	
*------------------------------------------------
*
* ADB TOOL SET ROUTINES
*
*------------------------------------------------

*-----------------------
* LISTEN routines to send
* data to the radio
*-----------------------

FMSendRegister1	; send volume & tone data to the FM Radio

]lp	PushWord	#1+3	; command (1) + data (3)
	PushLong	#dataListen1
	PushWord	#transmitADBBytes+3	; + number of data bytes
	_SendInfo
	bcc	FMLR1OK
	cmp	#adbBusy
	beq	]lp
FMLR1OK	rts
	
*-----------

dataListen1
	dfb	%0111_10_01	; ADB command: Address (0111) + Listen (10) + Register (01)
volume	dfb	%0111_0111	; volume (by increments of 0x11)
	dfb	%0001_0001	; treble (1) and bass (1)
	dfb	%0000_0000	; mute (off) & fading (normal)

*-----------------------

FMSendRegister2	; send FM frequency to the FM Radio

]lp	PushWord	#1+3	; command (1) + data (3)
	PushLong	#dataListen2
	PushWord	#transmitADBBytes+3	; + number of data bytes
	_SendInfo
	bcc	FMLR2OK
	cmp	#adbBusy
	beq	]lp
FMLR2OK	rts
	
*-----------

dataListen2
	dfb	%0111_10_10	; ADB command: Address (0111) + Listen (10) + Register (10)
	dfb	%0100_0001	; Default value (0x41)
frequency	hex	2500	; Frequency (107.5 MHz, big endian)

*-----------------------
* TALK routines to get
* data from the radio
*-----------------------

FMTalkRegister0	; ask the FM Radio to talk to me on register 0

	lda	#dataTalk0
	sta	cpBuffer+1
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_00_0111	; talk (11) + register (00) + address (0111)
	_AsyncADBReceive
	bcc	FMTR0OK
	cmp	#adbBusy
	beq	]lp
FMTR0OK	rts

*-----------

dataTalk0	ds	8	; unknown format

*-----------------------

FMTalkRegister1	; ask the FM Radio to talk to me on register 1

	lda	#dataTalk1
	sta	cpBuffer+1
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_01_0111	; talk (11) + register (01) + address (0111)
	_AsyncADBReceive
	bcc	FMTR1OK
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

FMTalkRegister2	; ask the FM Radio to talk to me on register 2

	lda	#dataTalk2
	sta	cpBuffer+1
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_10_0111	; talk (11) + register (10) + address (0111)
	_AsyncADBReceive
	bcc	FMTR2OK
	cmp	#adbBusy
	beq	]lp
FMTR2OK	rts

*-----------

dataTalk2	ds	1	; FM indicators
	ds	2	; frequency
	ds	5	; padding
	
*-----------------------

fmTalkRegister3	; ask the FM Radio to talk to me on register 3

	lda	#dataTalk3
	sta	cpBuffer+1
	
]lp	PushLong	#completionRoutine
	PushWord	#%11_11_0111	; talk (11) + register (11) + address (0111)
	_AsyncADBReceive
	bcc	FMTR3OK
	cmp	#adbBusy
	beq	]lp
FMTR3OK	rts

*-----------

dataTalk3	ds	2	; address & handler
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
cpBuffer	stal	dataTalk0,x	; patch this address please
	dey
	bne	]lp
endpool	pld
	rtl
	
	mx	%00	; back to the 16-bit world
	
*------------------------------------------------
*
* SUB-ROUTINES
*
*------------------------------------------------

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display a word

showWORD	pha	; from a word to a string
	pha
	pha	; <= here, really
	_HexIt
	PullLong	strHEX

	PushLong	#strHEX	; show the string
	_WriteCString
	rts

*--- Data

strHEX	asc	'0000'00

*---------- Wait for a key in a range 0-Acc
* A: high key
* X: high ptr to C string
* Y: low ptr to C string

keyINRANGE	sta	keyHIGH
	sty	strKEY
	stx	strKEY+2

]lp	PushLong  strKEY
	_WriteCString

	PushWord	#0
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff
	cmp	#"0"
	bcc	]lp
	cmp	keyHIGH
	bcc	keyINRANGE9
	beq	keyINRANGE9
	bra	]lp

keyINRANGE9	sec
	sbc	#"0"
	pha
	bra	waitKEY8

*--- Data

strKEY	ds	4	; pointer to string
keyHIGH	ds	2

*---------- Wait for a key

waitKEY	PushWord	#$0d
	_WriteChar

	PushWord	#0
	PushWord	#0	; don't echo char
	_ReadChar
	bra	waitKEY1	; go below

*---------- Wait for a key

waitFORKEY	PushLong  #strINPUT
	_WriteCString

	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar

waitKEY1	lda	1,s	; check CR
	and	#$ff	; of typed
	sta	1,s	; in char
	cmp	#$8d
	beq	waitKEY9

waitKEY8	PushWord	#$0d	; return
	_WriteChar

waitKEY9	pla	; restore entered char
	rts

*--- Data

strINPUT          asc       'Select an entry: '00

*----------------------------
* DATA
*----------------------------

*--- GS/OS

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*---------- Application

appID	ds	2
myID	ds	2
