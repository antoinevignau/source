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

ADBGetInfo	jsr	ADBSetAddress

	stz	dataTalk
	stz	dataTalk+2
	stz	dataTalk+4
	stz	dataTalk+6

	ldx	#NB_RETRY
]lp	phx
	jsr	ADBTalkRegister3
	plx
	bcc	ADBGetInfo1
	dex
	bne	]lp

ADBGetInfo1	rts

*	lda	#2	; two bytes for a reset
*	jsr	ADBListenRegister3
*
*	ldx	#NB_RETRY
*]lp	phx
*	jsr	ADBTalkRegister3
*	plx
*	dex
*	bne	]lp
*	
*	plx
*	txa
*	and	#%0000_0011
*	asl
*	tax
*	jsr	(ADBTalkPtr,x)
*	rts

ADBGetInfo3	asl
	tax
	jsr	(ptrTalkRegister3,x)
	rts

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
	ds	7
	
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
	ds	7
	
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
	ds	7

*-----------------------
* LISTEN TO REGISTER 3
*-----------------------

ADBListenRegister3
	sta	dataLength3

	lda	#NB_RETRY
	sta	errCNT

]lp	lda	#1	; command (1) + data (1)
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

dataLength3	ds	2	; length of data
dataListen3	dfb	%0000_10_11	; ADB command: Address (0000) + Listen (10) + Register (11)
	dfb	%1111_1111
	ds	6

*-----------------------
* TALK routines to get
* data from the device
*-----------------------

ADBTalkPtr	da	ADBTalkRegister0
	da	ADBTalkRegister1
	da	ADBTalkRegister2
	da	ADBTalkRegister3

*-----------------------
* TALK TO REGISTER 0
*-----------------------

ADBTalkRegister0

*	lda	#dataTalk0
*	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	lda	#%11_00_0000	; talk (11) + register (00) + address (0000)
	ora	addLOW
	pha
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

ADBTalkRegister1

*	lda	#dataTalk1
*	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	lda	#%11_01_0000	; talk (11) + register (01) + address (0000)
	ora	addLOW
	pha
	_AsyncADBReceive
	bcc	FMTR1OK
	dec	errCNT
	beq	FMTR1OK
	cmp	#adbBusy
	beq	]lp
FMTR1OK	rts

*-----------

dataTalk1	ds	8

*-----------------------
* TALK TO REGISTER 2
*-----------------------

ADBTalkRegister2

*	lda	#dataTalk2
*	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	lda	#%11_10_0000	; talk (11) + register (10) + address (0000)
	ora	addLOW
	pha
	_AsyncADBReceive
	bcc	FMTR2OK
	dec	errCNT
	beq	FMTR2OK
	cmp	#adbBusy
	beq	]lp
FMTR2OK	rts

*-----------

dataTalk2	ds	8
	
*-----------------------
* TALK TO REGISTER 3
*-----------------------

NADA	rts

ptrTalkRegister3
	da	NADA
	da	ADBTalkRegister3_1
	da	ADBTalkRegister3_2
	da	ADBTalkRegister3_3
	da	ADBTalkRegister3_4
	da	ADBTalkRegister3_5
	da	ADBTalkRegister3_6
	da	ADBTalkRegister3_7
	da	ADBTalkRegister3_8
	da	ADBTalkRegister3_9
	da	ADBTalkRegister3_10
	da	ADBTalkRegister3_11
	da	ADBTalkRegister3_12
	da	ADBTalkRegister3_13
	da	ADBTalkRegister3_14
	da	ADBTalkRegister3_15
	
*-----------

ADBTalkRegister3

*	lda	#dataTalk3
*	sta	cpBuffer+1

	lda	#NB_RETRY
	sta	errCNT
	
]lp	PushLong	#completionRoutine
	lda	#%11_10_0000	; talk (11) + register (10) + address (0000)
	ora	addLOW
	pha
	_AsyncADBReceive
	bcc	FMTR3OK
	dec	errCNT
	beq	FMTR3OK
	cmp	#adbBusy
	beq	]lp
FMTR3OK	rts

*-----------

ADBTalkRegister3_1
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_1
	PushWord	#%11_11_0001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_1
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_2
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_2
	PushWord	#%11_11_0010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_2
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_3
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_3
	PushWord	#%11_11_0011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_3
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_4
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_4
	PushWord	#%11_11_0100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_4
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_5
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_5
	PushWord	#%11_11_0101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_5
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_6
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_6
	PushWord	#%11_11_0110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_6
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_7
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_7
	PushWord	#%11_11_0111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_7
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_8
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_8
	PushWord	#%11_11_1000	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_8
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_9
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_9
	PushWord	#%11_11_1001	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_9
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_10
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_10
	PushWord	#%11_11_1010	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_10
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_11
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_11
	PushWord	#%11_11_1011	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_11
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_12
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_12
	PushWord	#%11_11_1100	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_12
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_13
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_13
	PushWord	#%11_11_1101	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_13
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_14
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_14
	PushWord	#%11_11_1110	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_14
	cmp	#adbBusy
	beq	]lp
	rts

ADBTalkRegister3_15
	lda	#NB_RETRY
	sta	errCNT
]lp	PushLong	#completionRoutine_15
	PushWord	#%11_11_1111	; talk (11) + register (11) + address (0000)
	_AsyncADBReceive
	sta	errCODE_15
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

*-----------------------

	mx	%11	; enter the 8-bit world

completionRoutine		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool
	tay
	iny
	tya
	stal	adbLENGTH
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk,x	; patch this address please
	dey
	bne	]lp
endpool	pld
	clc
	rtl
	
completionRoutine_1		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_1
	tay
	iny
	tya
	stal	adbLENGTH_1
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_1,x	; patch this address please
	dey
	bne	]lp
endpool_1	pld
	clc
	rtl
	
completionRoutine_2		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_2
	tay
	iny
	tya
	stal	adbLENGTH_2
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_2,x	; patch this address please
	dey
	bne	]lp
endpool_2	pld
	clc
	rtl
	
completionRoutine_3		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_3
	tay
	iny
	tya
	stal	adbLENGTH_3
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_3,x	; patch this address please
	dey
	bne	]lp
endpool_3	pld
	clc
	rtl
	
completionRoutine_4		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_4
	tay
	iny
	tya
	stal	adbLENGTH_4
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_4,x	; patch this address please
	dey
	bne	]lp
endpool_4	pld
	clc
	rtl
	
completionRoutine_5		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_5
	tay
	iny
	tya
	stal	adbLENGTH_5
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_5,x	; patch this address please
	dey
	bne	]lp
endpool_5	pld
	clc
	rtl
	
completionRoutine_6		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_6
	tay
	iny
	tya
	stal	adbLENGTH_6
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_6,x	; patch this address please
	dey
	bne	]lp
endpool_6	pld
	clc
	rtl
	
completionRoutine_7		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_7
	tay
	iny
	tya
	stal	adbLENGTH_7
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_7,x	; patch this address please
	dey
	bne	]lp
endpool_7	pld
	clc
	rtl
	
completionRoutine_8		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_8
	tay
	iny
	tya
	stal	adbLENGTH_8
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_8,x	; patch this address please
	dey
	bne	]lp
endpool_8	pld
	clc
	rtl
	
completionRoutine_9		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_9
	tay
	iny
	tya
	stal	adbLENGTH_9
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_9,x	; patch this address please
	dey
	bne	]lp
endpool_9	pld
	clc
	rtl
	
completionRoutine_10		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_10
	tay
	iny
	tya
	stal	adbLENGTH_10
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_10,x	; patch this address please
	dey
	bne	]lp
endpool_10	pld
	clc
	rtl
	
completionRoutine_11		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_11
	tay
	iny
	tya
	stal	adbLENGTH_11
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_11,x	; patch this address please
	dey
	bne	]lp
endpool_11	pld
	clc
	rtl
	
completionRoutine_12		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_12
	tay
	iny
	tya
	stal	adbLENGTH_12
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_12,x	; patch this address please
	dey
	bne	]lp
endpool_12	pld
	clc
	rtl
	
completionRoutine_13		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_13
	tay
	iny
	tya
	stal	adbLENGTH_13
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_13,x	; patch this address please
	dey
	bne	]lp
endpool_13	pld
	clc
	rtl
	
completionRoutine_14		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_14
	tay
	iny
	tya
	stal	adbLENGTH_14
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_14,x	; patch this address please
	dey
	bne	]lp
endpool_14	pld
	clc
	rtl
	
completionRoutine_15		; nearly standard ADB completion routine
	phd
	tsc
	tcd
	lda	[6]
	beq	endpool_15
	tay
	iny
	tya
	stal	adbLENGTH_15
]lp	lda	[6],y
	tyx
	dex
	stal	dataTalk_15,x	; patch this address please
	dey
	bne	]lp
endpool_15	pld
	clc
	rtl
	
	mx	%00	; back to the 16-bit world
	
*--- ADB Data

errCODE	ds	2	; value
errCODE_1	ds	2
errCODE_2	ds	2
errCODE_3	ds	2
errCODE_4	ds	2
errCODE_5	ds	2
errCODE_6	ds	2
errCODE_7	ds	2
errCODE_8	ds	2
errCODE_9	ds	2
errCODE_10	ds	2
errCODE_11	ds	2
errCODE_12	ds	2
errCODE_13	ds	2
errCODE_14	ds	2
errCODE_15	ds	2

adbLENGTH	ds	2	; value
adbLENGTH_1	ds	2
adbLENGTH_2	ds	2
adbLENGTH_3	ds	2
adbLENGTH_4	ds	2
adbLENGTH_5	ds	2
adbLENGTH_6	ds	2
adbLENGTH_7	ds	2
adbLENGTH_8	ds	2
adbLENGTH_9	ds	2
adbLENGTH_10	ds	2
adbLENGTH_11	ds	2
adbLENGTH_12	ds	2
adbLENGTH_13	ds	2
adbLENGTH_14	ds	2
adbLENGTH_15	ds	2

ptrTalk	da	dataTalk
	da	dataTalk_1
	da	dataTalk_2
	da	dataTalk_3
	da	dataTalk_4
	da	dataTalk_5
	da	dataTalk_6
	da	dataTalk_7
	da	dataTalk_8
	da	dataTalk_9
	da	dataTalk_10
	da	dataTalk_11
	da	dataTalk_12
	da	dataTalk_13
	da	dataTalk_14
	da	dataTalk_15

dataTalk	adrl	dataTalk	; pointer
dataTalk_1	ds	8
dataTalk_2	ds	8
dataTalk_3	ds	8
dataTalk_4	ds	8
dataTalk_5	ds	8
dataTalk_6	ds	8
dataTalk_7	ds	8
dataTalk_8	ds	8
dataTalk_9	ds	8
dataTalk_10	ds	8
dataTalk_11	ds	8
dataTalk_12	ds	8
dataTalk_13	ds	8
dataTalk_14	ds	8
dataTalk_15	ds	8

dataListen	ds	8
errCNT	ds	2	; this is an error counter word!
addLOW	ds	2	; 0000aaaa
addHIGH	ds	2	; aaaa0000