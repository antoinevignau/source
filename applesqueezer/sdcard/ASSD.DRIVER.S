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
* v1.3 (202604) - AV
*   Read/Write/Erase/Format
*   MBR partition map support
*   That's cool!
*

	mx	%00
	rel
	typ	$bb
	dsk	ASSDDriver

	use	AS.EQUATES.S
	
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

DStartup	lda	fgSTARTED	; we've been here
	bne	DStartend	; avoid scanning other devices

	ldal	FL_IDLE
	and	#$ff
	cmp	#$01
	bne	DStarterr	; no AS found
	
	ldal	FL_VERSION
	and	#$ff
	cmp	#minVERSION
	bcc	DStarterr	; no minimum version

	ldal	SD_CARD_INSERTED
	and	#$ff
	beq	DStarterr	; no SD card found (oops)
	
	jsr	checkVOLUME	; what kind of volume do we have here?
	
	lda	#1	; we're on
	sta	fgSTARTED
DStartend	rts
	
DStarterr	lda	#$0028	; no device connected. Goodbye!
	sta	errCODE
	rts
	
*
* Driver_Shutdown
*

DShutdown	stz	fgSTARTED	; we're off

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

dr1
dr2	sep	#$20
	lda	myBlockNum+3
	stal	SD_ADDRESS_SET_MSB
	lda	myBlockNum+2
	stal	SD_ADDRESS_SET_MSB_1
	lda	myBlockNum+1
	stal	SD_ADDRESS_SET_MSB_2
	lda	myBlockNum
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldy	#0	; read one block
]lp	ldal	SD_ACCESS
	sta	[bufferPtr],y
	iny
	cpy	#blockSIZE
	bne	]lp

	rep	#$20	; move destination pointer
	lda	bufferPtr+1
	clc
	adc	#>blockSIZE
	sta	bufferPtr+1
	
	inc	myBlockNum
	bne	dr3
	inc	myBlockNum+2
	
dr3	dex
	bne	dr2
	
	lda	myBufferPtr
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

dw1
dw2	sep	#$20
	lda	myBlockNum+3
	stal	SD_ADDRESS_SET_MSB
	lda	myBlockNum+2
	stal	SD_ADDRESS_SET_MSB_1
	lda	myBlockNum+1
	stal	SD_ADDRESS_SET_MSB_2
	lda	myBlockNum
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_WRITE

	ldy	#0	; write one block
]lp	lda	[bufferPtr],y
	stal	SD_ACCESS
	iny
	cpy	#blockSIZE
	bcc	]lp

	rep	#$20	; move destination pointer
	lda	bufferPtr+1
	clc
	adc	#>blockSIZE
	sta	bufferPtr+1
	
	inc	myBlockNum
	bne	dw3
	inc	myBlockNum+2
	
dw3	dex
	bne	dw2
	
	lda	myBufferPtr
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

tblSTATUS	da	SGetStatus	; 0 GetDeviceStatus
	da	SGet	; 1 GetConfigParameters
	da	SGet	; 2 GetWaitStatus
	da	SGetFormatOptions	; 3 GetFormatOptions
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

*	ldy	#2		; we can send the number of blocks
*	lda	#maxBLOCKS
*	sta	[statusListPtr],y
*	iny
*	iny
*	lda	#^maxBLOCKS
*	sta	[statusListPtr],y

	ldy	#48		; we can send the number of blocks v2
	lda	[dibPointer],y
	dec
	asl
	asl
	asl
	asl			; *16
	tax
	ldy	#2
	lda	tblPARTITION+4,x
	sta	[statusListPtr],y
	iny
	iny
	lda	tblPARTITION+6,x
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

*----------- GetFormatOptions

SGetFormatOptions
	lda	requestCount	; check size of buffer
	cmp	#formatOptionsTableEnd-formatOptionsTable
	bcc	SGetFormat1

	ldy	#0		; and move data
]lp	lda	formatOptionsTable,y
	sta	[statusListPtr],y
	iny
	iny
	cpy	#formatOptionsTableEnd-formatOptionsTable
	bcc	]lp
	sty	transferCount	; save size

SGetFormat1	rts

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
	da	CFormatDevice	; 1 FormatDevice
	da	CNada	; 2 EjectMedium
	da	CSet	; 3 SetConfigParameters
	da	CSet	; 4 SetWaitStatus
	da	CSetFormatOptions	; 5 SetFormatOptions
	da	CNada	; 6 AssignPartitionOwner
	da	CNada	; 7 ArmSignal
	da	CNada	; 8 DisarmSignal
	da	CNada	; 9 SetPartitionMap

CNada	rts

*----------- FormatDevice

CFormatDevice	ldy	#48	; get the first block of the partition
	lda	[dibPointer],y
	dec
	asl
	asl
	asl
	asl		; *16
	tax
	lda	tblPARTITION,x
	sta	myBlockNum
	lda	tblPARTITION+2,x
	sta	myBlockNum+2

*---

	ldx	#0	; 65536 blocks to format
	
cf2	sep	#$20	; set the block
	lda	myBlockNum+3
	stal	SD_ADDRESS_SET_MSB
	lda	myBlockNum+2
	stal	SD_ADDRESS_SET_MSB_1
	lda	myBlockNum+1
	stal	SD_ADDRESS_SET_MSB_2
	lda	myBlockNum
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_WRITE

	ldy	#512	; format the block
	lda	#0
]lp	stal	SD_ACCESS
	dey
	bne	]lp

	rep	#$20	; next block
	inc	myBlockNum
	bne	cf3
	inc	myBlockNum+2
	
cf3	dex		; until the end
	bne	cf2
	rts

*----------- SetFormatOptions

CSetFormatOptions
	lda	[controlListPtr]
	beq	CSFO9	; empty option is not ours
	cmp	#3	; 1-2 only
	bcs	CSFO9

	ldy	#maxBLOCKS	; it is 1, default values for ProDOS
	sty	fBlockCount
	ldx	#^maxBLOCKS
	stx	fBlockCount+2

CSFO9	rts

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

*--- requestcount : $0200 => 1

ds4	lda	requestCount	; multiple of $0200
	and	#blockSIZE-1
	beq	ds6

	lda	#$002D	; bad block count
	sta	errCODE
	sec
	rts

*--- Generic transfer now

ds6	lda	requestCount	; assume transfer=request
	sta	transferCount
	lda	requestCount+2
	sta	transferCount+2

*--- Save data

	lda	bufferPtr+1
	sta	myBufferPtr

*--- Prepare the real block value

	ldy	#48
	lda	[dibPointer],y
	dec
	asl
	asl
	asl
	asl		; *16
	tax
	lda	tblPARTITION,x
	clc
	adc	blockNum
	sta	myBlockNum
	lda	tblPARTITION+2,x
	adc	blockNum+2
	sta	myBlockNum+2

*--- Number of pages to read (is always a multiple of 2)
	
	lda	requestCount+1
	lsr
	tax

	clc
	rts
	
*----------------------------

checkSWITCHED
	lda	fgSTARTED
	bne	cs1

	ldy	#48
	lda	[dibPointer],y
	dec
	asl
	asl
	asl
	asl		; *16
	tax
	lda	tblPARTITION+8,x
	cmp	#TRUE	; is partition active?
	beq	cs1	; yes, exit

	lda	tblPARTITION+12,x
	cmp	#TRUE	; is switched already done?
	beq	cs1	; yes, exit
	
	jsl	SET_DISKSW	; partition is inactive

	ldy	#48
	lda	[dibPointer],y
	dec
	asl
	asl
	asl
	asl		; *16
	tax
	lda	#TRUE	; set switched done
	sta	tblPARTITION+12,x
	
*	lda	#1
*	sta	fgSTARTED
	lda	#$002e
	sta	errCODE
	sec
	rts

cs1	clc
	rts

*----------------------------
* CHECK VOLUME
*----------------------------

VOL_SIG	=	$aa55
BOOT_SIG1	=	$e9
BOOT_SIG2	=	$eb
GSOS_PART	=	$20	; reserved but unused partition ID
SIZE_PART	=	16
SIZE_DIB	=	64

*---

checkVOLUME

*--- Reset partition and DIB data

	ldx	#PART_END-PART_BEGIN-2
]lp	stz	tblPARTITION,x
	dex
	dex
	bpl	]lp

	ldx	#0	; reset DIB data (chars and block count)
]lp	lda	#dftCHAR	; no disk
	sta	MyDIB+8,x
	stz	MyDIB+10,x	; size is 0
	stz	MyDIB+12,x

	txa
	clc
	adc	#SIZE_DIB
	tax
	cpx	#64*NB_PARTITIONS
	bcc	]lp

*--- Read block 0

	sep	#$20
	lda	#0
	stal	SD_ADDRESS_SET_MSB
	stal	SD_ADDRESS_SET_MSB_1
	stal	SD_ADDRESS_SET_MSB_2
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldy	#0
]lp	ldal	SD_ACCESS
	sta	firstBLOCK,y
	iny
	cpy	#blockSIZE
	bcc	]lp
	rep	#$20
	
*--- Do we have a MBR?

	lda	firstBLOCK+$1fe
	cmp	#VOL_SIG
	beq	cv_MBR	; yes

cv_STD	lda	#maxBLOCKS	; partition 1 begins at block 0
	sta	tblPARTITION+4	; and is a big one
	sta	MyDIB+10
	lda	#^maxBLOCKS
	sta	tblPARTITION+6
	sta	MyDIB+12
	lda	#TRUE
	sta	tblPARTITION+8	; partition exists
	sta	tblPARTITION+12	; disk is inserted
	lda	#GSOS_PART
	sta	tblPARTITION+10	; define a GS/OS partition
	lda	#dftCHARWITHDISK ; we have a disk in it
	sta	MyDIB+8
	rts

*--- Do we really have a MBR?

cv_MBR	lda	firstBLOCK
	and	#$ff
	cmp	#BOOT_SIG1
	beq	cv_STD	; yes
	cmp	#BOOT_SIG2
	beq	cv_STD	; yes
	cmp	#0
	bne	cv_STD	; at least, not a partition map

*--- We believe we have a partition map, let's check it

PART1_OFFSET	=	$1be
NB_PARTITIONS	=	4

	ldy	#0
	ldx	#PART1_OFFSET
]lp	jsr	checkPARTID	; check partition ID
	bcs	cv_NEXT	; not authorized
	
	lda	firstBLOCK+8,x	; copy 1st LBA sector
	sta	tblPARTITION,y	; and number of sectors
	lda	firstBLOCK+10,x	; of partition
	sta	tblPARTITION+2,y
	lda	firstBLOCK+12,x
	sta	tblPARTITION+4,y
	lda	firstBLOCK+14,x
	sta	tblPARTITION+6,y
	lda	#TRUE	; partition is active
	sta	tblPARTITION+8,y
	lda	firstBLOCK+4,x	; partition ID
	and	#$ff
	sta	tblPARTITION+10,y
	tya		; we do not set switchedStatus
	clc		; it is already set to 0
	adc	#SIZE_PART
	tay

cv_NEXT	txa
	clc
	adc	#SIZE_PART
	tax
	cpx	#$1fe
	bcc	]lp

*--- Update the DIBs if needed

	ldx	#0
	txy
]lp	lda	tblPARTITION+8,x	; do we have a partition?
	cmp	#TRUE
	bne	cv_NOUPDATE		; no
	lda	#dftCHARWITHDISK	; yes, we have a disk in it
	sta	MyDIB+8,y
	lda	tblPARTITION+4,x	; and copy block count
	sta	MyDIB+10,y
	lda	tblPARTITION+6,x
	sta	MyDIB+12,y

cv_NOUPDATE	txa
	clc
	adc	#SIZE_PART
	tax
	
	tya
	clc
	adc	#SIZE_DIB
	tay
	cpy	#64*NB_PARTITIONS
	bcc	]lp

*--- We're done! Pas vraiment mais bon...

	rts

*--- Check if the partition ID is in my authorized list

checkPARTID	phy
	sep	#$20
	
	ldy	#0
]lp	lda	listPARTID,y
	cmp	#$ff	; end of list
	beq	cpid_KO
	
	cmp	firstBLOCK+4,x	; is it in my list?
	beq	cpid_OK	; yes, authorized
	iny		; next one, please
	bne	]lp

cpid_KO	rep	#$20	; not in my list
	ply
	sec
	rts
cpid_OK	rep	#$20	; in my list
	ply
	clc
	rts

*----------------------------

formatOptionsTable

* 8 bytes
	dw	1	; numOptions
	dw	1	; numDisplayed
	dw	1	; recommendedOption
	dw	1	; currentOption

* 16 bytes
	dw	1	; formatOptionNum
	dw	0	; linkRefNum
	dw	9	; flags 1001 - MB size - Apple format
	adrl	maxBLOCKS	; blockCount is 491520 for HFS
	dw	blockSIZE	; blockSize is 512 bytes
	dw	0	; interleaveFactor
	dw	32	; mediaSize 1000 - MB size

formatOptionsTableEnd

*--- Default formatting options

fBlockCount	adrl	maxBLOCKS

*----------------------------

fgSTARTED	ds	2	; 0: not started, 1: started
errCODE	ds	2

myBufferPtr	ds	2
myBlockNum	ds	4	; requested block number + LBA 1st sector

*---------------------------- My DIBs

MyDIB	adrl	MyDIB2	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	adrl	maxBLOCKS	; +0A block count
	str	'ASSDDEVICEA'	; +0E device name
	ds	20	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	$0001	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	dftHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	ds	4	; +3A extended DIB ptr
	dw	$0000	; +3E device number

MyDIB2	adrl	MyDIB3	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	adrl	maxBLOCKS	; +0A block count
	str	'ASSDDEVICEB'	; +0E device name
	ds	20	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	$0002	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	dftHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	ds	4	; +3A extended DIB ptr
	dw	$0000	; +3E device number

MyDIB3	adrl	MyDIB4	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	adrl	maxBLOCKS	; +0A block count
	str	'ASSDDEVICEC'	; +0E device name
	ds	20	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	$0003	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	dftHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	ds	4	; +3A extended DIB ptr
	dw	$0000	; +3E device number

MyDIB4	ds	4	; +00 pointer to the next DIB
	adrl	entryPOINT	; +04 driver entry point
	dw	dftCHAR	; +08 characteristics
	adrl	maxBLOCKS	; +0A block count
	str	'ASSDDEVICED'	; +0E device name
	ds	20	; 32 - 11 = 21
	dw	dftSLOT	; +2E slot number
	dw	$0004	; +30 unit number
	dw	dftVERSION	; +32 version
	dw	dftHDD	; +34 device ID
	dw	$0000	; +36 first linked device
	dw	$0000	; +38 next linked device
	ds	4	; +3A extended DIB ptr
	dw	$0000	; +3E device number

*----------------------------

listPARTID	dfb	$01,$04,$06,$0b,$0c,$0e,$0f
	dfb	$11,$14,$16,$1b,$1c,$1e,$1f
	dfb	GSOS_PART,$af
	dfb	$ff	; end of list and a part ID I do not support
	
PART_BEGIN
tblPARTITION	ds	16	;  +0: offset (32-bit),  +4: size in blocks (32-bit)
	ds	16	;  +8: active (16-bit), +10: partition ID (16-bit)
	ds	16	; +12: switchedStatus (16-bit) (from 0 to 1)
	ds	16
PART_END

*--- End of code

firstBLOCK	ds	512
