*
* AppleSqueezer - SD Driver
*
* (c) 2023, Niek Van Suchtelen
* (c) 2023, Brutal Deluxe Software
*

* v1.0 (202304) - AV
*   Reads a sector
*   Type must be $BB
*   Auxtype must be $0101
*
* v1.1 (202306) - AV
*   Writes a sector too!
*

	mx	%00
	rel
	typ	$bb
	dsk	ASSDDriver

	use	AS.EQUATES.S
	
	use	4/Util.Macs

*-----------------------------------
* AS DRIVER EQUATES
*-----------------------------------

maxIMAGES	=	1	; no more than N images
blockSIZE	=	512	; ProDOS 8 block size
maxBLOCKS	=	$ffffffff	; that is a huge number of blocks

* 0 0000
* 3 0011 not speed dependent
* E 1110 block device + write allowed + read allowed
* C 1100 format allowed + removable media

dftCHAR	=	$03EC	; default characteristics
dftSLOT	=	$8000	; not slot dependent
dftUNIT	=	$0001	; unit 1
dftVERSION	=	$1000	; v1

*-----------------------------------------------

*
* Entry point
*

RAMDisk	da	MyDIB-RAMDisk	; offset to 1st DIB
	dw	maxIMAGES		; number of devices
	dw	$0000		; no configuration list

*
* Dispatch routine
*

entryPOINT	phk			; Dispatch
	plb
	cmp	#$0009
	bcc	L0012
	lda	#$0020
	bra	L001D
L0012	asl
	tax
	stz	errCODE
	jsr	(tblDISPATCH,x)
	lda	errCODE
L001D	cmp	#$0001
	rtl

tblDISPATCH	da	DStartup		; Driver_Startup
	da	DOpen   		; Driver_Open
	da	DRead   		; Driver_Read
	da	DWrite  		; Driver_Write
	da	DClose  		; Driver_Close
	da	DStatus 		; Driver_Status
	da	DControl		; Driver_Control
	da	DFlush  		; Driver_Flush
	da	DShutdown		; Driver_Shutdown

*
* Driver_Startup
*

DStartup
	ldal	FL_IDLE
	and	#$ff
	cmp	#$01
	bne	DShutdown	; no AS found

	ldal	FL_VERSION
	and	#$ff
	cmp	#minVERSION
	bcc	DShutdown	; no minimum version

	lda	#1	; we're on
	sta	fgSTARTED
	rts
	
*
* Driver_Shutdown
*

DShutdown	stz	fgSTARTED

*
* Driver_Open
* Driver_Close
* Driver_Flush
*

DOpen			; Driver_Open
DClose			; Driver_Close
DFlush			; Driver_Flush
	rts

*
* Driver_Read
*

DRead	jsr	doSETUP
	bcc	dr1
	rts

*--- The AS magic is here

dr1	pei	bufferPtr+1	; save pointer

	sep	#$20
	lda	blockNum+3
	stal	SD_ADDRESS_SET_MSB
	lda	blockNum+2
	stal	SD_ADDRESS_SET_MSB_1
	lda	blockNum+1
	stal	SD_ADDRESS_SET_MSB_2
	lda	blockNum
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldx	nbPAGES	; number of 512-byte pages to copy
dr2	ldy	#0	; read one block
	sep	#$20
]lp	ldal	SD_ACCESS
	sta	[bufferPtr],y
	iny
	cpy	#blockSIZE
	bcc	]lp

	rep	#$20	; move destination pointer
	lda	bufferPtr+1
	clc
	adc	#>blockSIZE	; rwBlockSize+1
	sta	bufferPtr+1

	dex		; next block
	bne	dr2
	
	pla		; restore pointer
	sta	bufferPtr+1
	rts

*--- The AS magic ends here

*
* Driver_Write
*

DWrite	jsr	doSETUP
	bcc	dw1
	rts

*--- The AS magic is here

dw1	pei	bufferPtr+1	; save pointer

	sep	#$20
	lda	blockNum+3
	stal	SD_ADDRESS_SET_MSB
	lda	blockNum+2
	stal	SD_ADDRESS_SET_MSB_1
	lda	blockNum+1
	stal	SD_ADDRESS_SET_MSB_2
	lda	blockNum
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_WRITE

	ldx	nbPAGES	; number of 512-byte pages to copy
dw2	ldy	#0	; read one block
	sep	#$20
]lp	lda	[bufferPtr],y
	stal	SD_ACCESS
	iny
	cpy	#blockSIZE
	bcc	]lp

	rep	#$20	; move destination pointer
	lda	bufferPtr+1
	clc
	adc	#>blockSIZE	; rwBlockSize+1
	sta	bufferPtr+1

	dex		; next block
	bne	dw2
	
	pla		; restore pointer
	sta	bufferPtr+1
	rts

*--- The AS magic ends here

*
* Driver_Status
*

DStatus	lda	statusCode
	cmp	#4+1
	bcc	DStatus1
	lda	#$0021                           ; drvrBadCode
	sta	errCODE
	rts

DStatus1	asl
	tax
	stz	transferCount
	stz	transferCount+2
	jsr	(tblSTATUS,x)
	rts

tblSTATUS	da	SGetStatus	; GetDeviceStatus
	da	SGet	; GetConfigParameters
	da	SGet	; GetWaitStatus
	da	SGet	; GetFormatOptions
	da	SNada	; GetPartitionMap

SNada	rts

*----------- GetDeviceStatus

SGetStatus	lda	#2		; GetDeviceStatus
	sta	transferCount
	
	lda	requestCount	; check length of buffer
	cmp	#6
	bcc	SGS1
	lda	#6
	sta	transferCount

	ldy	#2		; we can send the number of blocks
	lda	#maxBLOCKS
	sta	[statusListPtr],y
	iny
	iny
	lda	#^maxBLOCKS
	sta	[statusListPtr],y

SGS1	ldx	#diskInDriveBit
	lda	fgSTARTED		; send the status of the driver
	bne	SGS2
	inx
SGS2	txa
	ora	#uncertainBlockCountBit	; we are uncertain of the block count
	sta	[statusListPtr]
	rts

*----------- GetConfigParameters / GetWaitStatus

SGet	lda	#0                           ; GetConfigParameters
	sta	[statusListPtr]              ; GetWaitStatus
	lda	#2
	sta	transferCount
	rts

*
* Driver_Control
*

DControl	jsr	checkSWITCHED
	bcc	DControl1
	rts

DControl1	lda	controlCode
	cmp	#9+1
	bcc	DControl2

	lda	#$0021
	sta	errCODE
	rts

DControl2	asl
	tax
	stz	transferCount
	stz	transferCount+2
	jsr	(tblCONTROL,x)
	rts

tblCONTROL	da	CNada	; 0 ResetDevice
	da	CNada	; 1 FormatDevice
	da	CNada	; 2 EjectMedium
	da	CSet	; 3 SetConfigParameters
	da	CSet	; 4 SetWaitStatus
	da	CSet	; 5 SetFormatOptions
	da	CNada	; 6 AssignPartitionOwner
	da	CNada	; 7 ArmSignal
	da	CNada	; 8 DisarmSignal
	da	CNada	; 9 SetPartitionMap

CNada	rts

*----------- SetConfigParameters / SetWaitStatus

CSet	lda	[controlListPtr]                 ; SetConfigParameters
	bne	CSetERR                          ; SetWaitStatus
	rts
CSetERR	lda	#$0022
	sta	errCODE
	rts

*----------------------------

* Status flag of the current device
* $0001: image has been switched (disk switched)
* $0010: image is active (disk in drive)
* $0100: image has been modified

*
* Checks everything is OK
*

doSETUP	jsr	checkSWITCHED
	bcc	ds2
	rts
	
ds2	lda	requestCount	; nb of bytes to read
	ora	requestCount+2
	bne	ds4

	lda	#$002C		; invalidByteCount
	sta	errCODE
	sec
	rts

* $0102_0400 = 

*--- requestcount : $0200 => 1
*--- From a Block to a RAM address

ds4	lda	requestCount+3	; number of pages
	and	#$00ff		; to calculate
	lsr
	lda	requestCount+1	; $01020400 => $010204 => $8102
	ror
	sta	nbPAGES		; to calculate

	lda	requestCount	; multiple of $0200
	and	#blockSIZE-1
	beq	ds6

	lda	#$002D		; bad block count
	sta	errCODE
	sec
	rts

*--- Generic transfer now

ds6	lda	requestCount	; assume transfer=request
	sta	transferCount
	lda	requestCount+2
	sta	transferCount+2

	clc
	rts
	
*----------------------------

checkSWITCHED
	lda	fgSTARTED
	bne	cs1
	
	jsl	SET_DISKSW

	lda	#1
	sta	fgSTARTED
	lda	#$002e
	sta	errCODE
	sec
	rts

cs1	clc
	rts

*----------------------------

fgSTARTED	ds	2	; 0: not started, 1: started
errCODE	ds	2
thePAGE	ds	4	; page to read/write: $hh/ll00
nbPAGES	ds	2	; number of blockSIZEP pages to copy

MyDIB	ds	4	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	ds	4	; +0A block count
	str	'ASSDDevice' ; +0E device name
	ds	21	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	dftUNIT	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	devHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	adrl	$00000000	; +3A extended DIB ptr
	dw	$0000	; +3E device number
