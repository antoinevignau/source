*
* Speedometer: Time to read a 64K file
*
* (c) 2013-2026, Brutal Deluxe Software
*
* v1.0 - 20251209
* v1.1 - 20260303 with Brutal Timer
*

	xc
	xc
	mx	%00

*----------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

*-------------- EQUATES

T0	=	0
T1	=	1
T2	=	2

FREQ_A2F0	=	0
FREQ_A235	=	1
FREQ_20MHZ	=	2
FREQ_CUSTOM	=	3

T2_DISP_OFF	=	0
T2_DISP_ON	=	1

FALSE	=	0
TRUE	=	255

*----------

Debut	=	$00
proDOS	=	$e100a8

*----------

	phk
	plb

	tdc
	sta	myDP

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

* Get 64KB and make it our read buffer

	pha
	pha
	PushLong	#$010000
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrBUFFER
	ldy	#2
	lda	[3],y
	sta	ptrBUFFER+2
	pld
	ply
	sty	haBUFFER
	plx
	stx	haBUFFER+2

*----------

*	PushLong	#myHEARTBEAT
*	_SetHeartBeat

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

*----------

mainLOOP	PushWord	#$0c	; home
	_WriteChar

	PushLong	#strINTRO
	_WriteCString

	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff	; mask bits 15-8

	cmp	#"1"
	bne	noFREAD64K
	jmp	doFREAD64K

noFREAD64K	cmp	#"2"
	bne	noFREAD512B
	jmp	doFREAD512B

noFREAD512B	cmp	#"3"
	bne	noBREAD
	jmp	doBREAD

noBREAD	cmp	#"4"
	bne	noBTSLOT
	jmp	setBTSLOT
	
noBTSLOT	cmp	#"q"
	beq	doQUIT
	cmp	#"Q"
	beq	doQUIT

	jmp	mainLOOP

*---------- End of routine, wait for key

mainNEXT	lda	#T2
	jsr	stopTIMER2

	PushLong	#strBYE
	_WriteCString

	PushWord	#0
	PushWord	#0
	_ReadChar
	pla
	jmp	mainLOOP

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT
*	PushLong	#myHEARTBEAT
*	_DelHeartBeat
	
	_IMShutDown
	_TextShutDown
	_MTShutDown

	PushWord	myID
	_DisposeAll

	PushWord	appID
	_MMShutDown

	_TLShutDown

	jsl	proDOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------
* SET BRUTAL TIMER SLOT
*----------------------------

setBTSLOT	PushLong	#strBTSLOT
	_WriteCString

	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff	; mask bits 15-8
	cmp	#"1"
	bcc	exitBTSLOT
	cmp	#"7"+1
	bcs	exitBTSLOT

	sec
	sbc	#"0"
	sta	theSLOT
	asl
	asl
	asl
	asl
	sta	theSLOT16

exitBTSLOT	jmp	mainLOOP

*----------------------------
* READ FILE SPEED 64K
*----------------------------

doFREAD64K	jsr	resetTICK
	bcc	doFREAD64L
	jmp	mainNEXT

doFREAD64L	lda	#pathname1	; the file
	sta	proOPEN+4

	lda	ptrBUFFER	; the buffer
	sta	proREAD+4
	lda	ptrBUFFER+2
	sta	proREAD+6

	lda	#0	; the size
	sta	proREAD+8
	lda	#1
	sta	proREAD+10

	lda	#strBeforeOpen
	jsr	showTICK

	jsl	proDOS	; open
	dw	$2010
	adrl	proOPEN

	lda	#strAfterOpen
	jsr	showTICK
	
*--------------

	lda	proOPEN+2
	sta	proREAD+2
	
	lda	#strBeforeRead
	jsr	showTICK

	jsl	proDOS	; read
	dw	$2012
	adrl	proREAD

	lda	#strAfterRead
	jsr	showTICK
	

*--------------

	lda	proOPEN+2
	sta	proCLOSE+2

	lda	#strBeforeClose
	jsr	showTICK

	jsl	proDOS	; close
	dw	$2014
	adrl	proCLOSE

	lda	#strAfterClose
	jsr	showTICK
	
	jmp	mainNEXT

*----------------------------
* READ FILE SPEED 512B
*----------------------------

doFREAD512B	jsr	resetTICK
	bcc	doFREAD512C
	jmp	mainNEXT

doFREAD512C	lda	#pathname1	; the file
	sta	proOPEN+4

	lda	ptrBUFFER	; the buffer
	sta	proREAD+4
	lda	ptrBUFFER+2
	sta	proREAD+6

	lda	#512	; the size
	sta	proREAD+8
	lda	#0
	sta	proREAD+10
	
	lda	#strBeforeOpen
	jsr	showTICK

	jsl	proDOS	; open
	dw	$2010
	adrl	proOPEN

	lda	#strAfterOpen
	jsr	showTICK
	
*--------------

	lda	proOPEN+2
	sta	proREAD+2
	
	lda	#strBeforeRead
	jsr	showTICK

	PushWord	#$0d
	_WriteChar

]lp	jsl	proDOS	; read
	dw	$2012
	adrl	proREAD
	bcs	doFREAD512B2
	
	jsr	showTICK_ALT
	jmp	]lp

*--------------

doFREAD512B2	lda	proOPEN+2
	sta	proCLOSE+2

	lda	#strBeforeClose
	jsr	showTICK

	jsl	proDOS	; close
	dw	$2014
	adrl	proCLOSE

	lda	#strAfterClose
	jsr	showTICK
	
	jmp	mainNEXT

*----------------------------
* HEARTBEAT
*----------------------------

myHEARTBEAT	ds	4	; it does nothing
	dw	$0000
	dw	$a55a

	rtl

*----------------------------
* READ BLOCK SPEED
*----------------------------

*----------------------------
* Entry point for menu 3

doBREAD	jsr	resetTICK
	bcc	doBREADOK
	jmp	mainNEXT

doBREADOK	lda	#pathname	; the file
	sta	proOPEN+4

	lda	#dataBUFFER
	sta	proREAD+4	; the DATA folder buffer then
	sta	proDREAD+4	; the key block pointer block
	lda	#^dataBUFFER
	sta	proREAD+6
	sta	proDREAD+6
	
	stz	proDREAD+12	; init block pointer
	stz	proDREAD+14
	
*--- First, get our prefix

	jsl	proDOS	; get our prefix
	dw	$200a
	adrl	proGETPREFIX

*--- Make it a volume name

	sep	#$20	; make a short one

	dec	pfxNAMEopen	; remove final ':'

	ldx	#1	; find the first :
]lp	lda	pfxNAMEopen2,x
	cmp	#':'
	beq	doBREAD1	; we'll get a volume name

	inx
	cpx	pfxNAMEopen
	bne	]lp

doBREAD1	stx	pfxNAMEopen	; save new length

	rep	#$20

*--- Browse the list of devices and get our devnum

	lda	#1	; start with device 1
	sta	proDINFO+2

buildVOL1	jsl	proDOS	; get device info
	dw	$202C
	adrl	proDINFO
	bcc	buildVOL3

	cmp	#$0011	; no more devices
	bne	buildVOL9

	brk	$cc
	jmp	mainNEXT	; done and not found!

buildVOL9	inc	proDINFO+2
	bra	buildVOL1

*--- Check the block device

buildVOL3	lda	proDINFO+8
	and	#$0080	; block device + read allowed
	beq	buildVOL9	; not a block device

	jsl	proDOS
	dw	$2008
	adrl	proVOLUME
	bcs	buildVOL9	; probably no disk in drive

*--- Is it a ProDOS file system (for v2 ;-))

	lda	proVOLUME+$12
	cmp	#1	; ProDOS
	bne	buildVOL9

	lda	proVOLUME+$14
	cmp	#512	; blockSize
	bne	buildVOL9

*--- Now compare

buildVOL4	lda	pfxNAMEopen	; length...
	cmp	volNAMEopen
	bne	buildVOL9

	ldx	#0	; string
]lp	lda	pfxNAMEopen,x
	cmp	volNAMEopen,x
	bne	buildVOL9
	inx
	cpx	pfxNAMEopen
	bne	]lp

*--- Here we have our volume, yeah!

	lda	proDINFO+2	; Get the device ID
	sta	proDREAD+2

*--- Read the DATA folder

	jsl	proDOS	; open
	dw	$2010
	adrl	proOPEN

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	jsl	proDOS	; read
	dw	$2012
	adrl	proREAD

	jsl	proDOS	; close
	dw	$2014
	adrl	proCLOSE

*--- What is the key block pointer of File?

	ldy	#$3c
	lda	dataBUFFER,y
	sta	proDREAD+12

	jsl	proDOS
	dw	$202f	; DRead
	adrl	proDREAD

*--- We have the File block pointer at dataBUFFER now

	stz	theINDEX

	lda	ptrBUFFER	; the buffer
	sta	proDREAD+4
	lda	ptrBUFFER+2
	sta	proDREAD+6

	lda	#strBeforeRead
	jsr	showTICK

	PushWord	#$0d
	_WriteChar

*---

]lp	ldy	theINDEX	; get block to read
	sep	#$20
	lda	dataBUFFER,y
	sta	proDREAD+12
	lda	dataBUFFER+256,y
	sta	proDREAD+13
	rep	#$20

	lda	proDREAD+12
	bne	doBREAD3

doBREAD2	lda	#strAfterRead
	jsr	showTICK
	jmp	mainNEXT

doBREAD3	jsl	proDOS
	dw	$202f	; DRead
	adrl	proDREAD
	bcs	doBREAD2	; the end

	jsr	showTICK_ALT

	inc	theINDEX
	bra	]lp

*----------------------------
* SHOW TICK
*----------------------------

showTICK_ALT	jsr	showTICK2

	PushLong	#strEmpty
	_WriteCString
	rts
	
showTICK	pea	^strBeforeOpen
	pha
	_WriteCString

showTICK2	lda	#T2
	jsr	stopTIMER2
	
	lda	#T2
	jsr	readTIMER2

	lda	valTIMER+2
	pha
	lda	valTIMER
	pha
	PushLong	#strTick
	PushWord	#8
	_Long2Hex
	
	PushLong	#strTick
	_WriteCString

	lda	#T2
	jsr	startTIMER2
	rts

*----------------------------
* CODE
*----------------------------

resetTICK	lda	theSLOT	; Brutal Timer slot not set
	bne	resetTICKOK
	sec
	rts

resetTICKOK	lda	#FREQ_20MHZ	; set to 20MHz
	jsr	setT2FREQUENCY2

	lda	#T2	; select T2
	jsr	resetTIMER2
	
	lda	#T2_DISP_ON
	jsr	setT2DISPLAY2
	
	clc
	rts

*-------------- BRUTAL TIMER ROUTINES

*------- Reset TIMER

resetTIMER2	sep	#$30
	sta	theTIMER
resetTIMER	sep	#$30
	ldx	theSLOT16
	lda	theTIMER
	stal	$c080,x
	rep	#$30
	rts

*------- Start TIMER

startTIMER2	sep	#$30
	sta	theTIMER
startTIMER	sep	#$30
	ldx	theSLOT16	; 4 ** no **
	lda	theTIMER	; 4 ** no **
	stal	$c081,x	; 5
	rep	#$30
	rts		; 6

*------- Pause TIMER

pauseTIMER2	sep	#$30
	sta	theTIMER
pauseTIMER	sep	#$30
	ldx	theSLOT16
	lda	theTIMER
	stal	$c082,x
	rep	#$30
	rts

*------- Stop TIMER

stopTIMER2	sep	#$30
	sta	theTIMER
stopTIMER	sep	#$30
	ldx	theSLOT16	; 4 ** yes **
	lda	theTIMER	; 4 ** yes **
	stal	$c082,x	; 5 ** yes **
	rep	#$30
	rts

*------- Set T2 frequency

setT2FREQUENCY2	sep	#$30
	sta	theFREQ
setT2FREQUENCY	sep	#$30
	ldx	theSLOT16
	lda	theFREQ
	stal	$c084,x
	rep	#$30
	rts

*------- Turn off/on display

setT2DISPLAY2	sep	#$30
	sta	theDISPLAY
setT2DISPLAY	sep	#$30
	ldx	theSLOT16
	lda	theDISPLAY
	stal	$c085,x
	rep	#$30
	rts

*------- Read T1 value

readTIMER2	sep	#$30
	sta	theTIMER
readTIMER	sep	#$30
	lda	theTIMER
	cmp	#T1
	beq	readT1
	cmp	#T2
	beq	readT2
	rep	#$30
	rts

readT1	sep	#$30
	ldx	theSLOT16
	ldal	$c088,x	; T1
	sta	valTIMER
	ldal	$c089,x
	sta	valTIMER+1
	ldal	$c08a,x
	sta	valTIMER+2
	ldal	$c08b,x
	sta	valTIMER+3
	rep	#$30
	rts

*------- Read T2 value

readT2	sep	#$30
	ldx	theSLOT16
	ldal	$c08c,x	; T2
	sta	valTIMER
	ldal	$c08d,x
	sta	valTIMER+1
	ldal	$c08e,x
	sta	valTIMER+2
	ldal	$c08f,x
	sta	valTIMER+3
	rep	#$30
	rts

*------- Data

valTIMER	ds	4
theTIMER	ds	2	; 1..2
theFREQ	ds	2	; 0..3
theDISPLAY	ds	2	; 0..1
theSLOT	ds	2	; 0..7
theSLOT16	ds	2	; 10=slot 1, ..., 70=slot 7

*----------------------------
* DATA
*----------------------------

strINTRO	asc	'Speedometer by Brutal Deluxe Software'0d
	asc	' 1- Read 64K file in one pass'0d
	asc	' 2- Read 64K file per 512 bytes'0d
	asc	' 3- Read 64K per block'0d
	asc	' 4- Set Brutal Timer slot'0d
	asc	'Input your choice (Q to quit) >'00

strBTSLOT	asc	0d'Brutal Timer slot (1-7) >'00

strBYE	asc	0d'Press a key to continue...'00

strBeforeOpen	asc	0d'Before  open... '00
strAfterOpen	asc	0d' After  open... '00
strBeforeRead	asc	0d'Before  read... '00
strAfterRead	asc	0d' After  read... '00
strBeforeClose	asc	0d'Before close... '00
strAfterClose	asc	0d' After close... '00
strEmpty	asc	'  '00

strTick	asc	'        '00

strREAD	asc	'Read... '00
strBLOCKS	asc	'Blocks'00
strRERR	asc	'Read error'00
strCANCEL	asc	'Cancel'00

*----------

pathname	strl	'1/Data'	; this is a folder
pathname1	strl	'1/Data/File'	; this ia a file

*----------

proOPEN	dw	15	; pcount
	ds	2	; ref_num
	adrl	pathname1	; pathname
	ds	2	; request_access
	ds	2	; resource_num
	ds	2	; access
	ds	2	; file_type
	ds	4	; aux_type
	ds	2	; storage_type
	ds	8	; create_td
	ds	8	; modify_td
	ds	4	; option_list
	ds	4	; eof
	ds	4	; blocks_used
	ds	4	; resource_eof
	ds	4	; resource_blocks

proREAD	dw	5	; +00 pcount
	ds	2	; +02 ref_num
	ds	4	; +04 data_buffer
	adrl	$00010000	; +08 request_count
	ds	4	; +12 transfer_count
	dw	1	; +16 cache_priority

proCLOSE	dw	1	; pcount
	ds	2	; ref_num

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*----------

proGETPREFIX	dw	2	; Parms for GetPrefix
	dw	1	; 02 prefix num
	adrl	pfxOPEN	; 04 prefix

proDINFO	dw	4	; Parms for DInfo
	ds	2	; 02 device num
	adrl	devOPEN	; 04 device name
	ds	2	; 08 characteristics
	ds	4	; 0A total blocks

proDREAD	dw	6	; Parms for DRead
	ds	2	; 02 device num
	ds	4	; 04 buffer
	adrl	512	; 08 request count
	ds	4	; 0C starting block
	dw	512	; 10 block size
	ds	4	; 12 transfer count

proVOLUME	dw	6	; Parms for Volume
	adrl	devNAMEopen	;02  device name
	adrl	volOPEN	; 06 volume name
	ds	4	; 0A total blocks
	ds	4	; 0E free blocks
	ds	2	; 12 file_sys_id
	ds	2	; 14 block_size

devOPEN	dw	$0032	; buffer size
devNAMEopen	db	$00	; length
devNAMEopen1	db	$00
devNAMEopen2	ds	$30	; data

pfxOPEN	dw	$00c2	; buffer size
pfxNAMEopen	db	$00	; length
pfxNAMEopen1	db	$00
pfxNAMEopen2	ds	$c0	; data

volOPEN	dw	$0032	; buffer size
volNAMEopen	db	$00	; length
volNAMEopen1	db	$00
volNAMEopen2	ds	$30	; data

*----------

asciitime	ds	32

hextime1	ds	8
hextime2	ds	8

seconds1	ds	4
seconds2	ds	4
seconds	ds	4

kbs	ds	4
strCALCKBS	ds	8

*----------

theINDEX	ds	2
maxINDEX	ds	2
filesize	ds	4	; in KB

*----------

appID	ds	2
myID	ds	2

myDP	ds	2
ptrBUFFER	ds	4
haBUFFER	ds	4

*----------

dataBUFFER	ds	512
