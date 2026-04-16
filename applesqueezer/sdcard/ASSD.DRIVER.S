*
* AppleSqueezer - SD Driver
*
* (c) 2023, Niek Van Suchtelen
* (c) 2023-24, Brutal Deluxe Software
*

* v1.0 (202304) - AV
*   Reads a sector
*   Type must be $BB
*   Auxtype must be $0101
*
* v1.1 (202306) - AV
*   Writes a sector too!
*
* v1.2 (202411) - AV
*   The Time flies version
*   We read/write 512 bytes only
*   I know what a partition map is...
*

	mx	%00
	rel
	typ	$bb
	dsk	ASSDDriver

	use	AS.EQUATES.S
	
	use	4/Sch.Macs
	use	4/Util.Macs

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
	cmp	#8+1
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

tblDISPATCH	da	DStartup		; 0 Driver_Startup
	da	DOpen   		; 1 Driver_Open
	da	DRead   		; 2 Driver_Read
	da	DWrite  		; 3 Driver_Write
	da	DClose  		; 4 Driver_Close
	da	DStatus 		; 5 Driver_Status
	da	DControl		; 6 Driver_Control
	da	DFlush  		; 7 Driver_Flush
	da	DShutdown		; 8 Driver_Shutdown

*
* Driver_Startup
*

DStartup	ldal	FL_IDLE
	and	#$ff
	cmp	#$01
	bne	DShutdown	; no AS found
	
	ldal	FL_VERSION
	and	#$ff
	cmp	#minVERSION
	bcc	DShutdown	; no minimum version

	lda	#1	; we're on
	sta	fgSTARTED

*	PushWord	#0
*	PushLong	#myTASK
*	_SchAddTask
*	pla

*---

	lda	#firstBLOCK
	stal	$328
	lda	#^firstBLOCK
	stal	$32a
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

dr1	sep	#$20
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

	ldy	#0	; read one block
]lp	ldal	SD_ACCESS
	sta	[bufferPtr],y
	iny
	cpy	#blockSIZE
	bne	]lp

	rep	#$20
	rts

*--- The AS magic ends here

*
* Driver_Write
*

DWrite	jsr	doSETUP
	bcc	dw1
	rts

*--- The AS magic is here

dw1	sep	#$20
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

	ldy	#0	; read one block
]lp	lda	[bufferPtr],y
	stal	SD_ACCESS
	iny
	cpy	#blockSIZE
	bne	]lp

	rep	#$20	; move destination pointer
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

tblSTATUS	da	SGetStatus	; 0 GetDeviceStatus
	da	SGet	; 1 GetConfigParameters
	da	SGet	; 2 GetWaitStatus
	da	SGet	; 3 GetFormatOptions
	da	SNada	; 4 GetPartitionMap

SNada	rts

*----------- GetDeviceStatus

SGetStatus	lda	#2		; GetDeviceStatus
	sta	transferCount
	
	lda	requestCount		; check length of buffer
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
	
	lda	#$002C	; invalidByteCount
	sta	errCODE
	sec
	rts

* $0102_0400 = 

*--- requestcount : $0200 => 1
*--- From a Block to a RAM address

ds4	lda	requestCount	; multiple of $0200
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

checkSWITCHED	lda	fgSTARTED
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

*---------------------------- Check RAMDISK was init'ed

myTASK	PushLong	#proVOLUME
	PushWord	#$2008
	jsl	GSOS2
*	bcc	myTASK1
*
*	PushLong	#proFORMAT
*	PushWord	#$2024
*	jsl	GSOS2
*
*	lda	#1	; tell the driver we've been there
*	stal	fgFORMAT	; a format will now be a real format
*
*	lda	#$4000	; no more silent formatting
*	stal	proFORMAT+14

myTASK1	rtl

*---------------------------- GS/OS

proVOLUME	dw	2
	adrl	proDEVNAME
	adrl	outVOLNAME

proFORMAT	dw	5	; +00
	adrl	proDEVNAME	; +02
	adrl	proVOLNAME	; +06
	dw	6	; +10
	dw	6	; +12 - Default is ProDOS
	dw	$2000	; +14 - Cant rename, can change selection, silent formatting

proDEVNAME	strl	'.ASSDDEVICE'
proVOLNAME	strl	':AppleSDqueezer'

outVOLNAME	dw	36	; (word) output buffer
	ds	34	; (word) strl + (array) string

*----------------------------

fgSTARTED	ds	2	; 0: not started, 1: started
fgFORMAT	ds	2	; 0: GS/OS Format never called, 1 instead
errCODE	ds	2
thePAGE	ds	4	; page to read/write: $hh/ll00
nbPAGES	ds	2	; number of blockSIZEP pages to copy

*----------------------------

MyDIB	ds	4	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	adrl	maxBLOCKS	; +0A block count
	str	'ASSDDEVICE'	; +0E device name
	ds	21	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	$0001	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	dftHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	ds	4	; +3A extended DIB ptr
	dw	$0000	; +3E device number
*
* My DIB extension
*
ExtDIB	ds	2	; kind of image data (FAT, MacOS...)
	ds	4	; first sector of image data

*--- End of code

firstBLOCK	ds	512
