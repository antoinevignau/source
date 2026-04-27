*
* ADB (nearly) low-level routines
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

NB_RETRY	=	8

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

*------------------------------------------------
*
* ADB TOOL SET ROUTINES
*
*------------------------------------------------

*-----------------------
* GET DEVICE INFO
*-----------------------
* Talk to a device
*
* A: device address (0..F)
* X: register to talk to (0..3)

ADBGetInfo	lda	theDEVICE
	jsr	ADBGetInfo_0
	lda	theDEVICE
	jsr	ADBGetInfo_1
	lda	theDEVICE
	jsr	ADBGetInfo_2
	
	lda	fgADDRESS3
	bne	ADBGetInfo1
	
	lda	theDEVICE
	jsr	ADBGetInfo_3

ADBGetInfo1	rts

*---

fgADDRESS3	ds	2	; 0: poll it, <>0: skip polling it

*-----------------------
* GET DEVICE INFO REGISTER 0
*-----------------------
* Talk to a device
*
* A: device address (0..F)
* X: register to talk to (0..3)

ADBGetInfo_0	jsr	ADBSetAddress

*	stz	dataTalk
*	stz	dataTalk+2
*	stz	dataTalk+4
*	stz	dataTalk+6

	ldy	#NB_RETRY
]lp	phy

	lda	theDEVICE
	asl
	tax
	jsr	(ptrTalkRegister_0,x)

	ply
	dey
	bne	]lp

ADBGetInfo_0_1	rts

*-----------------------
* GET DEVICE INFO REGISTER 1
*-----------------------
* Talk to a device
*
* A: device address (0..F)
* X: register to talk to (0..3)

ADBGetInfo_1	jsr	ADBSetAddress

*	stz	dataTalk
*	stz	dataTalk+2
*	stz	dataTalk+4
*	stz	dataTalk+6

	ldy	#NB_RETRY
]lp	phy

	lda	theDEVICE
	asl
	tax
	jsr	(ptrTalkRegister_1,x)

	ply
	dey
	bne	]lp

ADBGetInfo_1_1	rts

*-----------------------
* GET DEVICE INFO REGISTER 2
*-----------------------
* Talk to a device
*
* A: device address (0..F)
* X: register to talk to (0..3)

ADBGetInfo_2	jsr	ADBSetAddress

*	stz	dataTalk
*	stz	dataTalk+2
*	stz	dataTalk+4
*	stz	dataTalk+6

	ldy	#NB_RETRY
]lp	phy

	lda	theDEVICE
	asl
	tax
	jsr	(ptrTalkRegister_2,x)

	ply
	dey
	bne	]lp

ADBGetInfo_2_1	rts

*-----------------------
* GET DEVICE INFO REGISTER 3
*-----------------------
* Talk to a device
*
* A: device address (0..F)
* X: register to talk to (0..3)

ADBGetInfo_3	jsr	ADBSetAddress

*	stz	dataTalk
*	stz	dataTalk+2
*	stz	dataTalk+4
*	stz	dataTalk+6

	ldy	#NB_RETRY
]lp	phy

	lda	theDEVICE
	asl
	tax
	jsr	(ptrTalkRegister_3,x)

	ply
	dey
	bne	]lp

ADBGetInfo_3_1	rts

*-----------------------
* SET ADDRESS
*-----------------------

ADBSetAddress	and	#%0000_1111
	sta	addLOW	; 0000aaaa
	asl
	asl
	asl
	asl
	sta	addHIGH	; aaaa0000

	sep	#$20
	lda	dataListen0
	and	#%0000_1111
	ora	addHIGH
	sta	dataListen0

	lda	dataListen1
	and	#%0000_1111
	ora	addHIGH
	sta	dataListen1

	lda	dataListen2
	and	#%0000_1111
	ora	addHIGH
	sta	dataListen2

	lda	dataListen3
	and	#%0000_1111
	ora	addHIGH
	sta	dataListen3
	rep	#$20
	rts

*-----------------------
* LISTEN routines
* to send data
*-----------------------

ADBListenPtr	da	ADBListenRegister0
	da	ADBListenRegister1
	da	ADBListenRegister2
	da	ADBListenRegister3

*-----------------------
* LISTEN TO REGISTER 0
*-----------------------

ADBListenRegister0
	sta	dataLength0
	
	lda	#NB_RETRY
	sta	errCNT

]lp	lda	#1	; command (1) + data (3)
	clc
	adc	dataLength0
	pha
	PushLong	#dataListen0
	lda	#transmitADBBytes	; + number of data bytes
	clc
	adc	dataLength0
	pha
	_SendInfo
	bcc	FMLR0OK
	dec	errCNT
	beq	FMLR1OK
	cmp	#adbBusy
	beq	]lp
FMLR0OK	rts
	
*-----------

dataLength0	ds	2	; length of data
dataListen0	dfb	%0000_10_00	; ADB command: Address (0000) + Listen (10) + Register (00)
	ds	8
	
*-----------------------
* LISTEN TO REGISTER 1
*-----------------------

ADBListenRegister1
	sta	dataLength1

	lda	#NB_RETRY
	sta	errCNT

]lp	lda	#1	; command (1) + data (3)
	clc
	adc	dataLength1
	pha
	PushLong	#dataListen1
	lda	#transmitADBBytes	; + number of data bytes
	clc
	adc	dataLength1
	pha
	_SendInfo
	bcc	FMLR1OK
	dec	errCNT
	beq	FMLR1OK
	cmp	#adbBusy
	beq	]lp
FMLR1OK	rts
	
*-----------

dataLength1	ds	2	; length of data
dataListen1	dfb	%0000_10_01	; ADB command: Address (0000) + Listen (10) + Register (01)
	ds	8

*-----------------------
* LISTEN TO REGISTER 2
*-----------------------

ADBListenRegister2
	sta	dataLength2

	lda	#NB_RETRY
	sta	errCNT

]lp	lda	#1	; command (1) + data (3)
	clc
	adc	dataLength2
	pha
	PushLong	#dataListen2
	lda	#transmitADBBytes	; + number of data bytes
	clc
	adc	dataLength2
	pha
	_SendInfo
	bcc	FMLR2OK
	dec	errCNT
	beq	FMLR2OK
	cmp	#adbBusy
	beq	]lp
FMLR2OK	rts
	
*-----------

dataLength2	ds	2	; length of data
dataListen2	dfb	%0000_10_10	; ADB command: Address (0000) + Listen (10) + Register (10)
	ds	8
	ds	2

*-----------------------
* LISTEN TO REGISTER 3
*-----------------------

ADBListenRegister3
	sta	dataLength3

	lda	#NB_RETRY
	sta	errCNT

]lp	lda	#1	; command (1) + data (x)
	clc
	adc	dataLength3
	pha
	PushLong	#dataListen3
	lda	#transmitADBBytes	; + number of data bytes
	clc
	adc	dataLength3
	pha
	_SendInfo
	bcc	FMLR3OK
	dec	errCNT
	beq	FMLR3OK	; no more tries, exit
	cmp	#adbBusy
	beq	]lp	; loop for a busy ADB
FMLR3OK	rts

*-----------

dataLength3	dw	2	; length of data
dataListen3	dfb	%0000_10_11	; ADB command: Address (0000) + Listen (10) + Register (11)
	dfb	%0000_0001	; change to handler ID++
	dfb	%0000_0011	; the device at address 3
	ds	6
	
*-----------------------
* TALK routines to get
* data from the device
*-----------------------
*
*ADBTalkPtr	da	ADBTalkRegister0
*	da	ADBTalkRegister1
*	da	ADBTalkRegister2
*	da	ADBTalkRegister3
*
*-----------------------
* TALK TO REGISTER 0
*-----------------------
*
*ADBTalkRegister0
*
*	lda	#dataTalk0
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_00_0000	; talk (11) + register (00) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR0OK
*	dec	errCNT
*	beq	FMTR0OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR0OK	rts
*
*-----------
*
*dataTalk0	ds	8	; unknown format
*
*-----------------------
* TALK TO REGISTER 1
*-----------------------
*
*ADBTalkRegister1
*
*	lda	#dataTalk1
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_01_0000	; talk (11) + register (01) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR1OK
*	dec	errCNT
*	beq	FMTR1OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR1OK	rts
*
*-----------
*
*dataTalk1	ds	8
*
*-----------------------
* TALK TO REGISTER 2
*-----------------------
*
*ADBTalkRegister2
*
*	lda	#dataTalk2
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_10_0000	; talk (11) + register (10) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR2OK
*	dec	errCNT
*	beq	FMTR2OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR2OK	rts
*
*-----------
*
*dataTalk2	ds	8
*
*-----------------------
* TALK TO REGISTER 0
*-----------------------

ptrTalkRegister_0
	da	ADBTalkRegister_0_0
	da	ADBTalkRegister_0_1
	da	ADBTalkRegister_0_2
	da	ADBTalkRegister_0_3
	da	ADBTalkRegister_0_4
	da	ADBTalkRegister_0_5
	da	ADBTalkRegister_0_6
	da	ADBTalkRegister_0_7
	da	ADBTalkRegister_0_8
	da	ADBTalkRegister_0_9
	da	ADBTalkRegister_0_10
	da	ADBTalkRegister_0_11
	da	ADBTalkRegister_0_12
	da	ADBTalkRegister_0_13
	da	ADBTalkRegister_0_14
	da	ADBTalkRegister_0_15

*-----------
*
*ADBTalkRegister3
*
*	lda	#dataTalk3
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_00_0000	; talk (11) + register (10) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR3OK
*	dec	errCNT
*	beq	FMTR3OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR3OK	rts
*
*-----------

ADBTalkRegister_0_0
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_0
	PushWord	#%11_00_0000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_0
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_1
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_1
	PushWord	#%11_00_0001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_1
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_2
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_2
	PushWord	#%11_00_0010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_2
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_3
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_3
	PushWord	#%11_00_0011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_3
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_4
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_4
	PushWord	#%11_00_0100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_4
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_5
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_5
	PushWord	#%11_00_0101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_5
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_6
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_6
	PushWord	#%11_00_0110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_6
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_7
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_7
	PushWord	#%11_00_0111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_7
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_8
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_8
	PushWord	#%11_00_1000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_8
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_9
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_9
	PushWord	#%11_00_1001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_9
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_10
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_10
	PushWord	#%11_00_1010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_10
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_11
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_11
	PushWord	#%11_00_1011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_11
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_12
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_12
	PushWord	#%11_00_1100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_12
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_13
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_13
	PushWord	#%11_00_1101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_13
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_14
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_14
	PushWord	#%11_00_1110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_14
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_0_15
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_0_15
	PushWord	#%11_00_1111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_0_15
	cmp	#adbBusy
	beq	]lp
	rts

*-----------------------
* TALK TO REGISTER 1
*-----------------------

ptrTalkRegister_1
	da	ADBTalkRegister_1_0
	da	ADBTalkRegister_1_1
	da	ADBTalkRegister_1_2
	da	ADBTalkRegister_1_3
	da	ADBTalkRegister_1_4
	da	ADBTalkRegister_1_5
	da	ADBTalkRegister_1_6
	da	ADBTalkRegister_1_7
	da	ADBTalkRegister_1_8
	da	ADBTalkRegister_1_9
	da	ADBTalkRegister_1_10
	da	ADBTalkRegister_1_11
	da	ADBTalkRegister_1_12
	da	ADBTalkRegister_1_13
	da	ADBTalkRegister_1_14
	da	ADBTalkRegister_1_15

*-----------
*
*ADBTalkRegister3
*
*	lda	#dataTalk3
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_01_0000	; talk (11) + register (10) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR3OK
*	dec	errCNT
*	beq	FMTR3OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR3OK	rts
*
*-----------

ADBTalkRegister_1_0
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_0
	PushWord	#%11_01_0000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_0
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_1
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_1
	PushWord	#%11_01_0001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_1
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_2
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_2
	PushWord	#%11_01_0010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_2
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_3
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_3
	PushWord	#%11_01_0011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_3
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_4
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_4
	PushWord	#%11_01_0100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_4
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_5
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_5
	PushWord	#%11_01_0101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_5
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_6
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_6
	PushWord	#%11_01_0110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_6
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_7
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_7
	PushWord	#%11_01_0111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_7
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_8
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_8
	PushWord	#%11_01_1000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_8
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_9
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_9
	PushWord	#%11_01_1001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_9
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_10
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_10
	PushWord	#%11_01_1010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_10
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_11
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_11
	PushWord	#%11_01_1011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_11
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_12
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_12
	PushWord	#%11_01_1100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_12
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_13
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_13
	PushWord	#%11_01_1101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_13
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_14
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_14
	PushWord	#%11_01_1110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_14
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_1_15
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1_15
	PushWord	#%11_01_1111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1_15
	cmp	#adbBusy
	beq	]lp
	rts

*-----------------------
* TALK TO REGISTER 2
*-----------------------

ptrTalkRegister_2
	da	ADBTalkRegister_2_0
	da	ADBTalkRegister_2_1
	da	ADBTalkRegister_2_2
	da	ADBTalkRegister_2_3
	da	ADBTalkRegister_2_4
	da	ADBTalkRegister_2_5
	da	ADBTalkRegister_2_6
	da	ADBTalkRegister_2_7
	da	ADBTalkRegister_2_8
	da	ADBTalkRegister_2_9
	da	ADBTalkRegister_2_10
	da	ADBTalkRegister_2_11
	da	ADBTalkRegister_2_12
	da	ADBTalkRegister_2_13
	da	ADBTalkRegister_2_14
	da	ADBTalkRegister_2_15

*-----------
*
*ADBTalkRegister3
*
*	lda	#dataTalk3
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_10_0000	; talk (11) + register (10) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR3OK
*	dec	errCNT
*	beq	FMTR3OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR3OK	rts
*
*-----------

ADBTalkRegister_2_0
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_0
	PushWord	#%11_10_0000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_0
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_1
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_1
	PushWord	#%11_10_0001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_1
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_2
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_2
	PushWord	#%11_10_0010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_2
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_3
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_3
	PushWord	#%11_10_0011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_3
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_4
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_4
	PushWord	#%11_10_0100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_4
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_5
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_5
	PushWord	#%11_10_0101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_5
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_6
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_6
	PushWord	#%11_10_0110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_6
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_7
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_7
	PushWord	#%11_10_0111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_7
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_8
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_8
	PushWord	#%11_10_1000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_8
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_9
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_9
	PushWord	#%11_10_1001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_9
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_10
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_10
	PushWord	#%11_10_1010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_10
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_11
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_11
	PushWord	#%11_10_1011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_11
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_12
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_12
	PushWord	#%11_10_1100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_12
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_13
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_13
	PushWord	#%11_10_1101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_13
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_14
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_14
	PushWord	#%11_10_1110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_14
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_2_15
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2_15
	PushWord	#%11_10_1111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2_15
	cmp	#adbBusy
	beq	]lp
	rts

*-----------------------
* TALK TO REGISTER 3
*-----------------------

ptrTalkRegister_3
	da	ADBTalkRegister_3_0
	da	ADBTalkRegister_3_1
	da	ADBTalkRegister_3_2
	da	ADBTalkRegister_3_3
	da	ADBTalkRegister_3_4
	da	ADBTalkRegister_3_5
	da	ADBTalkRegister_3_6
	da	ADBTalkRegister_3_7
	da	ADBTalkRegister_3_8
	da	ADBTalkRegister_3_9
	da	ADBTalkRegister_3_10
	da	ADBTalkRegister_3_11
	da	ADBTalkRegister_3_12
	da	ADBTalkRegister_3_13
	da	ADBTalkRegister_3_14
	da	ADBTalkRegister_3_15

*-----------
*
*ADBTalkRegister3
*
*	lda	#dataTalk3
*	sta	cpBuffer+1
*
*	lda	#NB_RETRY
*	sta	errCNT
*	
*]lp	PushLong	#completionRoutine
*	lda	#%11_10_0000	; talk (11) + register (10) + address (0000)
*	ora	addLOW
*	pha
*	_AsyncADBReceive
*	bcc	FMTR3OK
*	dec	errCNT
*	beq	FMTR3OK
*	cmp	#adbBusy
*	beq	]lp
*FMTR3OK	rts
*
*-----------

ADBTalkRegister_3_0
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_0
	PushWord	#%11_11_0000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_0
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_1
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_1
	PushWord	#%11_11_0001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_1
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_2
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_2
	PushWord	#%11_11_0010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_2
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_3
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_3
	PushWord	#%11_11_0011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_3
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_4
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_4
	PushWord	#%11_11_0100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_4
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_5
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_5
	PushWord	#%11_11_0101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_5
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_6
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_6
	PushWord	#%11_11_0110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_6
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_7
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_7
	PushWord	#%11_11_0111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_7
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_8
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_8
	PushWord	#%11_11_1000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_8
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_9
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_9
	PushWord	#%11_11_1001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_9
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_10
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_10
	PushWord	#%11_11_1010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_10
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_11
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_11
	PushWord	#%11_11_1011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_11
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_12
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_12
	PushWord	#%11_11_1100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_12
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_13
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_13
	PushWord	#%11_11_1101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_13
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_14
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_14
	PushWord	#%11_11_1110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_14
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister_3_15
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3_15
	PushWord	#%11_11_1111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3_15
	cmp	#adbBusy
	beq	]lp
	rts

*-----------

dataTalk3	ds	1	; address
			; 67 = -1-- = exceptional event, device specific; always 1 if not used
			;      --1- = service request enable; 1 = enabled 
			;      0111 = address
	ds	1	; 79 = handler ID
	ds	6	; padding

*----------------------- REGISTER 0

	mx	%11	; enter the 8-bit world

completionRoutine_0_0		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_0
	tay
	iny
	tya
	stal	adbLENGTH_0_0
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_0,x	; patch this address please
	dey
	bne	]lp
endpool_0_0	pld
	clc
	rtl
	
completionRoutine_0_1		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_1
	tay
	iny
	tya
	stal	adbLENGTH_0_1
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_1,x	; patch this address please
	dey
	bne	]lp
endpool_0_1	pld
	clc
	rtl
	
completionRoutine_0_2		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_2
	tay
	iny
	tya
	stal	adbLENGTH_0_2
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_2,x	; patch this address please
	dey
	bne	]lp
endpool_0_2	pld
	clc
	rtl
	
completionRoutine_0_3		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_3
	tay
	iny
	tya
	stal	adbLENGTH_0_3
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_3,x	; patch this address please
	dey
	bne	]lp
endpool_0_3	pld
	clc
	rtl
	
completionRoutine_0_4		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_4
	tay
	iny
	tya
	stal	adbLENGTH_0_4
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_4,x	; patch this address please
	dey
	bne	]lp
endpool_0_4	pld
	clc
	rtl
	
completionRoutine_0_5		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_5
	tay
	iny
	tya
	stal	adbLENGTH_0_5
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_5,x	; patch this address please
	dey
	bne	]lp
endpool_0_5	pld
	clc
	rtl
	
completionRoutine_0_6		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_6
	tay
	iny
	tya
	stal	adbLENGTH_0_6
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_6,x	; patch this address please
	dey
	bne	]lp
endpool_0_6	pld
	clc
	rtl
	
completionRoutine_0_7		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_7
	tay
	iny
	tya
	stal	adbLENGTH_0_7
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_7,x	; patch this address please
	dey
	bne	]lp
endpool_0_7	pld
	clc
	rtl
	
completionRoutine_0_8		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_8
	tay
	iny
	tya
	stal	adbLENGTH_0_8
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_8,x	; patch this address please
	dey
	bne	]lp
endpool_0_8	pld
	clc
	rtl
	
completionRoutine_0_9		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_9
	tay
	iny
	tya
	stal	adbLENGTH_0_9
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_9,x	; patch this address please
	dey
	bne	]lp
endpool_0_9	pld
	clc
	rtl
	
completionRoutine_0_10		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_10
	tay
	iny
	tya
	stal	adbLENGTH_0_10
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_10,x	; patch this address please
	dey
	bne	]lp
endpool_0_10	pld
	clc
	rtl
	
completionRoutine_0_11		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_11
	tay
	iny
	tya
	stal	adbLENGTH_0_11
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_11,x	; patch this address please
	dey
	bne	]lp
endpool_0_11	pld
	clc
	rtl
	
completionRoutine_0_12		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_12
	tay
	iny
	tya
	stal	adbLENGTH_0_12
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_12,x	; patch this address please
	dey
	bne	]lp
endpool_0_12	pld
	clc
	rtl
	
completionRoutine_0_13		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_13
	tay
	iny
	tya
	stal	adbLENGTH_0_13
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_13,x	; patch this address please
	dey
	bne	]lp
endpool_0_13	pld
	clc
	rtl
	
completionRoutine_0_14		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_14
	tay
	iny
	tya
	stal	adbLENGTH_0_14
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_14,x	; patch this address please
	dey
	bne	]lp
endpool_0_14	pld
	clc
	rtl
	
completionRoutine_0_15		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_0_15
	tay
	iny
	tya
	stal	adbLENGTH_0_15
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_0_15,x	; patch this address please
	dey
	bne	]lp
endpool_0_15	pld
	clc
	rtl
	
	mx	%00	; back to the 16-bit world
	
*----------------------- REGISTER 1

	mx	%11	; enter the 8-bit world

completionRoutine_1_0		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_0
	tay
	iny
	tya
	stal	adbLENGTH_1_0
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_0,x	; patch this address please
	dey
	bne	]lp
endpool_1_0	pld
	clc
	rtl
	
completionRoutine_1_1		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_1
	tay
	iny
	tya
	stal	adbLENGTH_1_1
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_1,x	; patch this address please
	dey
	bne	]lp
endpool_1_1	pld
	clc
	rtl
	
completionRoutine_1_2		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_2
	tay
	iny
	tya
	stal	adbLENGTH_1_2
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_2,x	; patch this address please
	dey
	bne	]lp
endpool_1_2	pld
	clc
	rtl
	
completionRoutine_1_3		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_3
	tay
	iny
	tya
	stal	adbLENGTH_1_3
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_3,x	; patch this address please
	dey
	bne	]lp
endpool_1_3	pld
	clc
	rtl
	
completionRoutine_1_4		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_4
	tay
	iny
	tya
	stal	adbLENGTH_1_4
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_4,x	; patch this address please
	dey
	bne	]lp
endpool_1_4	pld
	clc
	rtl
	
completionRoutine_1_5		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_5
	tay
	iny
	tya
	stal	adbLENGTH_1_5
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_5,x	; patch this address please
	dey
	bne	]lp
endpool_1_5	pld
	clc
	rtl
	
completionRoutine_1_6		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_6
	tay
	iny
	tya
	stal	adbLENGTH_1_6
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_6,x	; patch this address please
	dey
	bne	]lp
endpool_1_6	pld
	clc
	rtl
	
completionRoutine_1_7		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_7
	tay
	iny
	tya
	stal	adbLENGTH_1_7
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_7,x	; patch this address please
	dey
	bne	]lp
endpool_1_7	pld
	clc
	rtl
	
completionRoutine_1_8		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_8
	tay
	iny
	tya
	stal	adbLENGTH_1_8
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_8,x	; patch this address please
	dey
	bne	]lp
endpool_1_8	pld
	clc
	rtl
	
completionRoutine_1_9		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_9
	tay
	iny
	tya
	stal	adbLENGTH_1_9
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_9,x	; patch this address please
	dey
	bne	]lp
endpool_1_9	pld
	clc
	rtl
	
completionRoutine_1_10		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_10
	tay
	iny
	tya
	stal	adbLENGTH_1_10
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_10,x	; patch this address please
	dey
	bne	]lp
endpool_1_10	pld
	clc
	rtl
	
completionRoutine_1_11		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_11
	tay
	iny
	tya
	stal	adbLENGTH_1_11
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_11,x	; patch this address please
	dey
	bne	]lp
endpool_1_11	pld
	clc
	rtl
	
completionRoutine_1_12		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_12
	tay
	iny
	tya
	stal	adbLENGTH_1_12
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_12,x	; patch this address please
	dey
	bne	]lp
endpool_1_12	pld
	clc
	rtl
	
completionRoutine_1_13		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_13
	tay
	iny
	tya
	stal	adbLENGTH_1_13
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_13,x	; patch this address please
	dey
	bne	]lp
endpool_1_13	pld
	clc
	rtl
	
completionRoutine_1_14		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_14
	tay
	iny
	tya
	stal	adbLENGTH_1_14
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_14,x	; patch this address please
	dey
	bne	]lp
endpool_1_14	pld
	clc
	rtl
	
completionRoutine_1_15		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1_15
	tay
	iny
	tya
	stal	adbLENGTH_1_15
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1_15,x	; patch this address please
	dey
	bne	]lp
endpool_1_15	pld
	clc
	rtl
	
	mx	%00	; back to the 16-bit world
	
*----------------------- REGISTER 2

	mx	%11	; enter the 8-bit world

completionRoutine_2_0		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_0
	tay
	iny
	tya
	stal	adbLENGTH_2_0
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_0,x	; patch this address please
	dey
	bne	]lp
endpool_2_0	pld
	clc
	rtl
	
completionRoutine_2_1		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_1
	tay
	iny
	tya
	stal	adbLENGTH_2_1
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_1,x	; patch this address please
	dey
	bne	]lp
endpool_2_1	pld
	clc
	rtl
	
completionRoutine_2_2		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_2
	tay
	iny
	tya
	stal	adbLENGTH_2_2
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_2,x	; patch this address please
	dey
	bne	]lp
endpool_2_2	pld
	clc
	rtl
	
completionRoutine_2_3		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_3
	tay
	iny
	tya
	stal	adbLENGTH_2_3
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_3,x	; patch this address please
	dey
	bne	]lp
endpool_2_3	pld
	clc
	rtl
	
completionRoutine_2_4		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_4
	tay
	iny
	tya
	stal	adbLENGTH_2_4
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_4,x	; patch this address please
	dey
	bne	]lp
endpool_2_4	pld
	clc
	rtl
	
completionRoutine_2_5		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_5
	tay
	iny
	tya
	stal	adbLENGTH_2_5
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_5,x	; patch this address please
	dey
	bne	]lp
endpool_2_5	pld
	clc
	rtl
	
completionRoutine_2_6		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_6
	tay
	iny
	tya
	stal	adbLENGTH_2_6
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_6,x	; patch this address please
	dey
	bne	]lp
endpool_2_6	pld
	clc
	rtl
	
completionRoutine_2_7		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_7
	tay
	iny
	tya
	stal	adbLENGTH_2_7
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_7,x	; patch this address please
	dey
	bne	]lp
endpool_2_7	pld
	clc
	rtl
	
completionRoutine_2_8		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_8
	tay
	iny
	tya
	stal	adbLENGTH_2_8
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_8,x	; patch this address please
	dey
	bne	]lp
endpool_2_8	pld
	clc
	rtl
	
completionRoutine_2_9		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_9
	tay
	iny
	tya
	stal	adbLENGTH_2_9
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_9,x	; patch this address please
	dey
	bne	]lp
endpool_2_9	pld
	clc
	rtl
	
completionRoutine_2_10		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_10
	tay
	iny
	tya
	stal	adbLENGTH_2_10
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_10,x	; patch this address please
	dey
	bne	]lp
endpool_2_10	pld
	clc
	rtl
	
completionRoutine_2_11		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_11
	tay
	iny
	tya
	stal	adbLENGTH_2_11
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_11,x	; patch this address please
	dey
	bne	]lp
endpool_2_11	pld
	clc
	rtl
	
completionRoutine_2_12		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_12
	tay
	iny
	tya
	stal	adbLENGTH_2_12
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_12,x	; patch this address please
	dey
	bne	]lp
endpool_2_12	pld
	clc
	rtl
	
completionRoutine_2_13		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_13
	tay
	iny
	tya
	stal	adbLENGTH_2_13
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_13,x	; patch this address please
	dey
	bne	]lp
endpool_2_13	pld
	clc
	rtl
	
completionRoutine_2_14		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_14
	tay
	iny
	tya
	stal	adbLENGTH_2_14
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_14,x	; patch this address please
	dey
	bne	]lp
endpool_2_14	pld
	clc
	rtl
	
completionRoutine_2_15		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2_15
	tay
	iny
	tya
	stal	adbLENGTH_2_15
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2_15,x	; patch this address please
	dey
	bne	]lp
endpool_2_15	pld
	clc
	rtl
	
	mx	%00	; back to the 16-bit world
	
*----------------------- REGISTER 3

	mx	%11	; enter the 8-bit world

completionRoutine_3_0		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_0
	tay
	iny
	tya
	stal	adbLENGTH_3_0
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_0,x	; patch this address please
	dey
	bne	]lp
endpool_3_0	pld
	clc
	rtl
	
completionRoutine_3_1		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_1
	tay
	iny
	tya
	stal	adbLENGTH_3_1
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_1,x	; patch this address please
	dey
	bne	]lp
endpool_3_1	pld
	clc
	rtl
	
completionRoutine_3_2		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_2
	tay
	iny
	tya
	stal	adbLENGTH_3_2
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_2,x	; patch this address please
	dey
	bne	]lp
endpool_3_2	pld
	clc
	rtl
	
completionRoutine_3_3		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_3
	tay
	iny
	tya
	stal	adbLENGTH_3_3
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_3,x	; patch this address please
	dey
	bne	]lp
endpool_3_3	pld
	clc
	rtl
	
completionRoutine_3_4		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_4
	tay
	iny
	tya
	stal	adbLENGTH_3_4
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_4,x	; patch this address please
	dey
	bne	]lp
endpool_3_4	pld
	clc
	rtl
	
completionRoutine_3_5		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_5
	tay
	iny
	tya
	stal	adbLENGTH_3_5
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_5,x	; patch this address please
	dey
	bne	]lp
endpool_3_5	pld
	clc
	rtl
	
completionRoutine_3_6		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_6
	tay
	iny
	tya
	stal	adbLENGTH_3_6
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_6,x	; patch this address please
	dey
	bne	]lp
endpool_3_6	pld
	clc
	rtl
	
completionRoutine_3_7		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_7
	tay
	iny
	tya
	stal	adbLENGTH_3_7
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_7,x	; patch this address please
	dey
	bne	]lp
endpool_3_7	pld
	clc
	rtl
	
completionRoutine_3_8		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_8
	tay
	iny
	tya
	stal	adbLENGTH_3_8
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_8,x	; patch this address please
	dey
	bne	]lp
endpool_3_8	pld
	clc
	rtl
	
completionRoutine_3_9		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_9
	tay
	iny
	tya
	stal	adbLENGTH_3_9
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_9,x	; patch this address please
	dey
	bne	]lp
endpool_3_9	pld
	clc
	rtl
	
completionRoutine_3_10		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_10
	tay
	iny
	tya
	stal	adbLENGTH_3_10
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_10,x	; patch this address please
	dey
	bne	]lp
endpool_3_10	pld
	clc
	rtl
	
completionRoutine_3_11		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_11
	tay
	iny
	tya
	stal	adbLENGTH_3_11
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_11,x	; patch this address please
	dey
	bne	]lp
endpool_3_11	pld
	clc
	rtl
	
completionRoutine_3_12		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_12
	tay
	iny
	tya
	stal	adbLENGTH_3_12
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_12,x	; patch this address please
	dey
	bne	]lp
endpool_3_12	pld
	clc
	rtl
	
completionRoutine_3_13		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_13
	tay
	iny
	tya
	stal	adbLENGTH_3_13
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_13,x	; patch this address please
	dey
	bne	]lp
endpool_3_13	pld
	clc
	rtl
	
completionRoutine_3_14		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_14
	tay
	iny
	tya
	stal	adbLENGTH_3_14
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_14,x	; patch this address please
	dey
	bne	]lp
endpool_3_14	pld
	clc
	rtl
	
completionRoutine_3_15		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3_15
	tay
	iny
	tya
	stal	adbLENGTH_3_15
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3_15,x	; patch this address please
	dey
	bne	]lp
endpool_3_15	pld
	clc
	rtl
	
	mx	%00	; back to the 16-bit world
	
*--- ADB Data

tblERR	da	errCODE_0_0
	da	errCODE_1_0
	da	errCODE_2_0
	da	errCODE_3_0
	
tblLENGTH	da	adbLENGTH_0_0
	da	adbLENGTH_1_0
	da	adbLENGTH_2_0
	da	adbLENGTH_3_0

tblTALK	da	ptrTalk_0
	da	ptrTalk_1
	da	ptrTalk_2
	da	ptrTalk_3

errCODE_0_0	ds	2	; value
errCODE_0_1	ds	2
errCODE_0_2	ds	2
errCODE_0_3	ds	2
errCODE_0_4	ds	2
errCODE_0_5	ds	2
errCODE_0_6	ds	2
errCODE_0_7	ds	2
errCODE_0_8	ds	2
errCODE_0_9	ds	2
errCODE_0_10	ds	2
errCODE_0_11	ds	2
errCODE_0_12	ds	2
errCODE_0_13	ds	2
errCODE_0_14	ds	2
errCODE_0_15	ds	2

errCODE_1_0	ds	2	; value
errCODE_1_1	ds	2
errCODE_1_2	ds	2
errCODE_1_3	ds	2
errCODE_1_4	ds	2
errCODE_1_5	ds	2
errCODE_1_6	ds	2
errCODE_1_7	ds	2
errCODE_1_8	ds	2
errCODE_1_9	ds	2
errCODE_1_10	ds	2
errCODE_1_11	ds	2
errCODE_1_12	ds	2
errCODE_1_13	ds	2
errCODE_1_14	ds	2
errCODE_1_15	ds	2

errCODE_2_0	ds	2	; value
errCODE_2_1	ds	2
errCODE_2_2	ds	2
errCODE_2_3	ds	2
errCODE_2_4	ds	2
errCODE_2_5	ds	2
errCODE_2_6	ds	2
errCODE_2_7	ds	2
errCODE_2_8	ds	2
errCODE_2_9	ds	2
errCODE_2_10	ds	2
errCODE_2_11	ds	2
errCODE_2_12	ds	2
errCODE_2_13	ds	2
errCODE_2_14	ds	2
errCODE_2_15	ds	2

errCODE_3_0	ds	2	; value
errCODE_3_1	ds	2
errCODE_3_2	ds	2
errCODE_3_3	ds	2
errCODE_3_4	ds	2
errCODE_3_5	ds	2
errCODE_3_6	ds	2
errCODE_3_7	ds	2
errCODE_3_8	ds	2
errCODE_3_9	ds	2
errCODE_3_10	ds	2
errCODE_3_11	ds	2
errCODE_3_12	ds	2
errCODE_3_13	ds	2
errCODE_3_14	ds	2
errCODE_3_15	ds	2

adbLENGTH_0_0	ds	2	; value
adbLENGTH_0_1	ds	2
adbLENGTH_0_2	ds	2
adbLENGTH_0_3	ds	2
adbLENGTH_0_4	ds	2
adbLENGTH_0_5	ds	2
adbLENGTH_0_6	ds	2
adbLENGTH_0_7	ds	2
adbLENGTH_0_8	ds	2
adbLENGTH_0_9	ds	2
adbLENGTH_0_10	ds	2
adbLENGTH_0_11	ds	2
adbLENGTH_0_12	ds	2
adbLENGTH_0_13	ds	2
adbLENGTH_0_14	ds	2
adbLENGTH_0_15	ds	2

adbLENGTH_1_0	ds	2	; value
adbLENGTH_1_1	ds	2
adbLENGTH_1_2	ds	2
adbLENGTH_1_3	ds	2
adbLENGTH_1_4	ds	2
adbLENGTH_1_5	ds	2
adbLENGTH_1_6	ds	2
adbLENGTH_1_7	ds	2
adbLENGTH_1_8	ds	2
adbLENGTH_1_9	ds	2
adbLENGTH_1_10	ds	2
adbLENGTH_1_11	ds	2
adbLENGTH_1_12	ds	2
adbLENGTH_1_13	ds	2
adbLENGTH_1_14	ds	2
adbLENGTH_1_15	ds	2

adbLENGTH_2_0	ds	2	; value
adbLENGTH_2_1	ds	2
adbLENGTH_2_2	ds	2
adbLENGTH_2_3	ds	2
adbLENGTH_2_4	ds	2
adbLENGTH_2_5	ds	2
adbLENGTH_2_6	ds	2
adbLENGTH_2_7	ds	2
adbLENGTH_2_8	ds	2
adbLENGTH_2_9	ds	2
adbLENGTH_2_10	ds	2
adbLENGTH_2_11	ds	2
adbLENGTH_2_12	ds	2
adbLENGTH_2_13	ds	2
adbLENGTH_2_14	ds	2
adbLENGTH_2_15	ds	2

adbLENGTH_3_0	ds	2	; value
adbLENGTH_3_1	ds	2
adbLENGTH_3_2	ds	2
adbLENGTH_3_3	ds	2
adbLENGTH_3_4	ds	2
adbLENGTH_3_5	ds	2
adbLENGTH_3_6	ds	2
adbLENGTH_3_7	ds	2
adbLENGTH_3_8	ds	2
adbLENGTH_3_9	ds	2
adbLENGTH_3_10	ds	2
adbLENGTH_3_11	ds	2
adbLENGTH_3_12	ds	2
adbLENGTH_3_13	ds	2
adbLENGTH_3_14	ds	2
adbLENGTH_3_15	ds	2

ptrTalk_0	da	dataTalk_0_0
	da	dataTalk_0_1
	da	dataTalk_0_2
	da	dataTalk_0_3
	da	dataTalk_0_4
	da	dataTalk_0_5
	da	dataTalk_0_6
	da	dataTalk_0_7
	da	dataTalk_0_8
	da	dataTalk_0_9
	da	dataTalk_0_10
	da	dataTalk_0_11
	da	dataTalk_0_12
	da	dataTalk_0_13
	da	dataTalk_0_14
	da	dataTalk_0_15

dataTalk_0_0	ds	8
dataTalk_0_1	ds	8
dataTalk_0_2	ds	8
dataTalk_0_3	ds	8
dataTalk_0_4	ds	8
dataTalk_0_5	ds	8
dataTalk_0_6	ds	8
dataTalk_0_7	ds	8
dataTalk_0_8	ds	8
dataTalk_0_9	ds	8
dataTalk_0_10	ds	8
dataTalk_0_11	ds	8
dataTalk_0_12	ds	8
dataTalk_0_13	ds	8
dataTalk_0_14	ds	8
dataTalk_0_15	ds	8

ptrTalk_1	da	dataTalk_1_0
	da	dataTalk_1_1
	da	dataTalk_1_2
	da	dataTalk_1_3
	da	dataTalk_1_4
	da	dataTalk_1_5
	da	dataTalk_1_6
	da	dataTalk_1_7
	da	dataTalk_1_8
	da	dataTalk_1_9
	da	dataTalk_1_10
	da	dataTalk_1_11
	da	dataTalk_1_12
	da	dataTalk_1_13
	da	dataTalk_1_14
	da	dataTalk_1_15

dataTalk_1_0	ds	8
dataTalk_1_1	ds	8
dataTalk_1_2	ds	8
dataTalk_1_3	ds	8
dataTalk_1_4	ds	8
dataTalk_1_5	ds	8
dataTalk_1_6	ds	8
dataTalk_1_7	ds	8
dataTalk_1_8	ds	8
dataTalk_1_9	ds	8
dataTalk_1_10	ds	8
dataTalk_1_11	ds	8
dataTalk_1_12	ds	8
dataTalk_1_13	ds	8
dataTalk_1_14	ds	8
dataTalk_1_15	ds	8

ptrTalk_2	da	dataTalk_2_0
	da	dataTalk_2_1
	da	dataTalk_2_2
	da	dataTalk_2_3
	da	dataTalk_2_4
	da	dataTalk_2_5
	da	dataTalk_2_6
	da	dataTalk_2_7
	da	dataTalk_2_8
	da	dataTalk_2_9
	da	dataTalk_2_10
	da	dataTalk_2_11
	da	dataTalk_2_12
	da	dataTalk_2_13
	da	dataTalk_2_14
	da	dataTalk_2_15

dataTalk_2_0	ds	8
dataTalk_2_1	ds	8
dataTalk_2_2	ds	8
dataTalk_2_3	ds	8
dataTalk_2_4	ds	8
dataTalk_2_5	ds	8
dataTalk_2_6	ds	8
dataTalk_2_7	ds	8
dataTalk_2_8	ds	8
dataTalk_2_9	ds	8
dataTalk_2_10	ds	8
dataTalk_2_11	ds	8
dataTalk_2_12	ds	8
dataTalk_2_13	ds	8
dataTalk_2_14	ds	8
dataTalk_2_15	ds	8

ptrTalk_3	da	dataTalk_3_0
	da	dataTalk_3_1
	da	dataTalk_3_2
	da	dataTalk_3_3
	da	dataTalk_3_4
	da	dataTalk_3_5
	da	dataTalk_3_6
	da	dataTalk_3_7
	da	dataTalk_3_8
	da	dataTalk_3_9
	da	dataTalk_3_10
	da	dataTalk_3_11
	da	dataTalk_3_12
	da	dataTalk_3_13
	da	dataTalk_3_14
	da	dataTalk_3_15

dataTalk_3_0	ds	8
dataTalk_3_1	ds	8
dataTalk_3_2	ds	8
dataTalk_3_3	ds	8
dataTalk_3_4	ds	8
dataTalk_3_5	ds	8
dataTalk_3_6	ds	8
dataTalk_3_7	ds	8
dataTalk_3_8	ds	8
dataTalk_3_9	ds	8
dataTalk_3_10	ds	8
dataTalk_3_11	ds	8
dataTalk_3_12	ds	8
dataTalk_3_13	ds	8
dataTalk_3_14	ds	8
dataTalk_3_15	ds	8

dataTalk_0	adrl	dataTalk_0	; pointer
dataTalk_1	adrl	dataTalk_1	; pointer
dataTalk_2	adrl	dataTalk_2	; pointer
dataTalk_3	adrl	dataTalk_3	; pointer

dataListen	ds	8
errCODE	ds	2
adbLENGTH	ds	2
errCNT	ds	2	; this is an error counter word!
addLOW	ds	2	; 0000aaaa
addHIGH	ds	2	; aaaa0000