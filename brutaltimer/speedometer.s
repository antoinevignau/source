*
* Speedometer: Time to read a xxK file
*
* (c) 2013-2026, Brutal Deluxe Software
*
* v1.0 - 20251209
* v1.1 - 20260303 with Brutal Timer
* v1.2 - 20260319 with CSV file generation
* v1.3 - 20260321 with low-level GS/OS calls (does not help)
*      I am sure GS/OS does many useful things in the OPEN call
*      Yes, it does... I found what!
* v1.4 - 20260326 with SetMark support
* v1.5 - 20260406 decimal CSV export
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
FREQ_7MHZ	=	1
FREQ_20MHZ	=	2
FREQ_CUSTOM	=	3

T2_DISP_OFF	=	0
T2_DISP_ON	=	1

FALSE	=	0
TRUE	=	255

*----------

Debut	=	$00
Arrivee	=	$04

dpCSV	=	$08	; where we output text

GSOS	=	$e100a8

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

* Get 256KB and make it our read buffer

	pha
	pha
	PushLong	#$040000	; demande 256k finalement
	PushWord	myID
	PushWord	#%11000000_00001100
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

	pha
	pha
	PushLong	#$010000	; demande 64K pour le texte
	PushWord	myID
	PushWord	#%11000000_00011100
	PushLong	#0
	_NewHandle
	phd
	tsc
	tcd
	lda	[3]
	sta	ptrCSV
	sta	proWRITECSV+4
	ldy	#2
	lda	[3],y
	sta	ptrCSV+2
	sta	proWRITECSV+6
	pld
	ply
	sty	haCSV
	plx
	stx	haCSV+2

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

	lda	#strINTRO
	jsr	printCSTRING

	lda	ptrCSV	; reset pointer to CSV buffer
	sta	dpCSV
	lda	ptrCSV+2
	sta	dpCSV+2
	
	PushWord	#0	; wait for key
	PushWord	#1	; echo char
	_ReadChar
	pla
	and	#$ff	; mask bits 15-8
	sta	theKEY

	cmp	#"3"	; file read in one page
	bne	noFREAD64K
	jmp	doFREAD64K

noFREAD64K	cmp	#"4"	; file read in 512 chunks
	bne	noFREAD512B
	jmp	doFREAD512B

noFREAD512B	cmp	#"5"	; file read per block
	bne	noBREAD
	jmp	doBREAD

noBREAD	cmp	#"6"	; file read per block
	bne	noLLREAD	; using GS/OS low-levels calls
	jmp	doLLREAD
	
noLLREAD	cmp	#"1"	; set file size
	bne	noFILESIZE
	jmp	doFILESIZE

noFILESIZE	cmp	#"2"	; set Brutal Timer slot
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

	jsr	saveCSV

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

	jsl	GSOS
	dw	$2029
	adrl	proQUIT

	brk	$bd

*----------------------------
* SAVE CSV FILE
*----------------------------

saveCSV	lda	theSLOT	; Brutal Timer slot not set
	bne	saveCSVOK
	rts		; do not save, go buy one, ask Plamen!
	
saveCSVOK	PushLong	#strENDOFPROCESS
	_WriteCString

	lda	theSIZE	; pointer to file
	asl
	tax
	lda	ptrCSVFILE,x
	sta	proCREATECSV+2
	sta	proOPENCSV+4

	lda	dpCSV	; calculate data size
	sec
	sbc	ptrCSV
	sta	proWRITECSV+8
	stz	proWRITECSV+10
	
	jsl	GSOS
	dw	$2001
	adrl	proCREATECSV
	
	jsl	GSOS
	dw	$2010
	adrl	proOPENCSV
	bcs	saveKO99

	lda	proOPENCSV+2
*	sta	proGETEOFCSV+2
	sta	proSETMARKCSV+2
	sta	proWRITECSV+2
	sta	proCLOSECSV+2

*	jsl	GSOS
*	dw	$2019
*	adrl	proGETEOF
*	
*	lda	proGETEOF+4
*	sta	proSETMARKCSV+6
*	lda	proGETEOF+6
*	sta	proSETMARKCSV+8

	jsl	GSOS	; base 1 + disp 0 = GET_EOF :-)
	dw	$2016
	adrl	proSETMARKCSV
	
	jsl	GSOS
	dw	$2013
	adrl	proWRITECSV
	
	jsl	GSOS
	dw	$2014
	adrl	proCLOSECSV

saveKO99	rts

*---

proCREATECSV	dw	7	; pcount
	adrl	csv64	; pathname
	dw	$c3	; access_code
	dw	$4	; file_type (TXT)
	ds	4	; aux_type
	ds	2	; storage_type
	ds	4	; eof
	ds	4	; resource_eof

proOPENCSV	dw	2	; 0 - pcount
	ds	2	; 2 - ref_num
	adrl	csv64	; 4 - pathname

proWRITECSV	dw	5	; 0 - pcount
	ds	2	; 2 - ref_num
	ds	4	; 4 - data_buffer
	ds	4	; 8 - request_count
	ds	4	; C - transfer_count
	dw	1	; cache_priority

proCLOSECSV	dw	1	; 0 - pcount
	ds	2	; 2 - ref_num

proSETMARKCSV	dw	3	; 0 - pcount
	ds	2	; 2 - ref_num
	dw	1	; 4 - base (1 = EOF - displacement)
	ds	4	; 6 - displacement (0)

*proGETEOFCSV	dw	2	; 0 - pcount
*	ds	2	; 2 - ref_num
*	ds	4	; 4 - eof
	
*----------------------------
* PRINT C STRING
*----------------------------

printCSTRING	sta	Debut

]lp	lda	(Debut)
	and	#$ff
	bne	pcs1
	rts
	
pcs1	cmp	#'$'
	bne	pcs2
	lda	theSLOT
	ora	#'0'
	bra	pcs3
pcs2	cmp	#'#'
	bne	pcs3

	pea	^ptrSIZE
	lda	theSIZE
	asl
	tax
	lda	ptrSIZE,x
	pha
	_WriteCString
	bra	pcs4
	
pcs3	pha
	_WriteChar

pcs4	inc	Debut
	bra	]lp

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
* READ FILE SPEED xxK
*----------------------------

doFREAD64K	jsr	resetTICK
	bcc	doFREAD64L
	jmp	mainNEXT

doFREAD64L	lda	theSIZE
	asl
	tax
	lda	ptrPATHNAME,x
*	lda	#pathname64
	sta	proOPEN+4

	lda	ptrBUFFER	; the buffer
	sta	proREAD+4
	lda	ptrBUFFER+2
	sta	proREAD+6

	lda	#0	; the size
	sta	proREAD+8
*	lda	#1
	lda	fileSIZE,x
	sta	proREAD+10

	jsr	initMINMAX
	jsr	showHEADER
	
	lda	#strBeforeOpen
	jsr	showTICKIN

	jsl	GSOS	; open
	dw	$2010
	adrl	proOPEN

	lda	#strAfterOpen
	jsr	showTICKOUT
	
*--------------

	lda	proOPEN+2
	sta	proREAD+2
	
	lda	#strBeforeRead
	jsr	showTICKIN

	jsl	GSOS	; read
	dw	$2012
	adrl	proREAD

	lda	#strAfterRead
	jsr	showTICKOUT
	
*--------------

	lda	proOPEN+2
	sta	proSETMARK+2
	
	lda	#strBeforeSetMark
	jsr	showTICKIN

	jsl	GSOS
	dw	$2016
	adrl	proSETMARK

	lda	#strAfterSetMark
	jsr	showTICKOUT

*---

	lda	proOPEN+2
	sta	proCLOSE+2

	lda	#strBeforeClose
	jsr	showTICKIN

	jsl	GSOS	; close
	dw	$2014
	adrl	proCLOSE

	lda	#strAfterClose
	jsr	showTICKOUT
	
	jmp	mainNEXT

*----------------------------
* READ FILE SPEED 512B
*----------------------------

doFREAD512B	jsr	resetTICK
	bcc	doFREAD512C
	jmp	mainNEXT

doFREAD512C	lda	theSIZE
	asl
	tax
	lda	ptrPATHNAME,x
*	lda	#pathname64	; the file
	sta	proOPEN+4

	lda	ptrBUFFER	; the buffer
	sta	proREAD+4
	lda	ptrBUFFER+2
	sta	proREAD+6

	lda	#512	; the size
	sta	proREAD+8
	lda	#0
	sta	proREAD+10
	
	jsr	initMINMAX
	jsr	showHEADER
	
	lda	#strBeforeOpen
	jsr	showTICKIN

	jsl	GSOS	; open
	dw	$2010
	adrl	proOPEN

	lda	#strAfterOpen
	jsr	showTICKOUT
	
*--------------

	lda	proOPEN+2
	sta	proREAD+2
	
]lp	lda	#strBeforeRead
	jsr	showTICKIN

*	PushWord	#$0d
*	_WriteChar

	jsl	GSOS	; read
	dw	$2012
	adrl	proREAD
	bcs	doFREAD512B2
	
	lda	#strAfterRead
	jsr	showTICKOUT
	jsr	calcMINMAX
	jmp	]lp

*--------------

doFREAD512B2	lda	#strAfterRead
	jsr	showTICKOUT
	jsr	calcMINMAX
	jsr	showMINMAX

	lda	proOPEN+2
	sta	proSETMARK+2
	
	lda	#strBeforeSetMark
	jsr	showTICKIN

	jsl	GSOS
	dw	$2016
	adrl	proSETMARK

	lda	#strAfterSetMark
	jsr	showTICKOUT

*---

	lda	proOPEN+2
	sta	proCLOSE+2

	lda	#strBeforeClose
	jsr	showTICKIN

	jsl	GSOS	; close
	dw	$2014
	adrl	proCLOSE

	lda	#strAfterClose
	jsr	showTICKOUT
	
	jmp	mainNEXT

*----------------------------
* CHANGE FILE SIZE
*----------------------------

doFILESIZE	lda	theSIZE	; 0: 64K
	clc		; 1: 128K
	adc	#1	; 2: 256K
	cmp	#3
	bcc	doFS1
	lda	#0
doFS1	sta	theSIZE
	jmp	mainLOOP
	
*----------------------------
* HEARTBEAT
*----------------------------

*myHEARTBEAT	ds	4	; it does nothing
*	dw	$0000
*	dw	$a55a
*
*	rtl

*----------------------------
* READ BLOCK SPEED
*----------------------------

*----------------------------
* Entry point for menu 3

doBREAD	jsr	resetTICK
	bcc	doBREADOK
	jmp	mainNEXT

doBREADOK	lda	#pathname	; the folder as a file
	sta	proOPEN+4

	lda	#dataBUFFER
	sta	proREAD+4	; the DATA folder buffer then
	lda	#^dataBUFFER
	sta	proREAD+6
	
	stz	proDREAD+12	; init block pointer
	stz	proDREAD+14

	jsr	initMINMAX
	jsr	showHEADER
	
	lda	#strBeforeOpen
	jsr	showTICKIN

*--- First, get our prefix

	jsl	GSOS	; get our prefix
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

buildVOL1	jsl	GSOS	; get device info
	dw	$202C
	adrl	proDINFO
	bcc	buildVOL3

	cmp	#$0011	; no more devices
	bne	buildVOL9
	jmp	mainNEXT	; done and not found!

buildVOL9	inc	proDINFO+2
	bra	buildVOL1

*--- Check the block device

buildVOL3	lda	proDINFO+8
	and	#$0080	; block device + read allowed
	beq	buildVOL9	; not a block device

	jsl	GSOS
	dw	$2008
	adrl	proVOLUME
	bcs	buildVOL9	; probably no disk in drive

*--- Is it a GSOS file system (for v2 ;-))

	lda	proVOLUME+$12
	cmp	#1	; GSOS
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

	jsl	GSOS	; open
	dw	$2010
	adrl	proOPEN

	lda	proOPEN+2
	sta	proREAD+2
	sta	proCLOSE+2
	
	jsl	GSOS	; read
	dw	$2012
	adrl	proREAD

	jsl	GSOS	; close
	dw	$2014
	adrl	proCLOSE

*--- Where is the file?

	lda	#dataBUFFER	; first file points here
	clc
	adc	#$2b
	sta	Debut

	lda	theSIZE	; file to compare to is here
	asl
	tax
	lda	ptrFILE,x
	sta	Arrivee
	lda	maxBLOCKS,x
	sta	maxINDEX
	
	sep	#$30
	
findFILE	lda	(Debut)	; compare lengths
	and	#$0f
	sta	theLENGTH
	cmp	(Arrivee)
	bne	findNEXT	; not the same length = different file
	lda	(Debut)
	and	#$f0
	lsr
	lsr
	lsr
	lsr
	sta	theKIND	; either 2 or 3

	ldy	#1
]lp	lda	(Debut),y
	cmp	(Arrivee),y
	bne	findNEXT
	iny
	cpy	theLENGTH
	bcc	]lp
	beq	]lp
	bra	foundIT

findNEXT	lda	Debut
	clc
	adc	#$27
	sta	Debut
	bcc	findFILE
	
	rep	#$30
	jmp	mainNEXT	; file not found!

*--- What is the key block pointer of File?

foundIT	rep	#$30

	lda	#blocksTOREAD	; where to put the blocks
	sta	Arrivee
	
	ldy	#$11	; read the key pointer block
	lda	(Debut),y
	sta	proDREAD+12
	
	jsl	GSOS
	dw	$202f	; DRead
	adrl	proDREAD

	lda	theKIND
	cmp	#2	; simple file for 64/128
	beq	simpleREAD

	jsr	makeTYPE3	; advanced type for 256
	
simpleREAD	jsr	makeTABLE

*--- We have the File block pointer at dataBUFFER now

	stz	theINDEX

	lda	#strAfterOpen
	jsr	showTICKOUT

*	PushWord	#$0d
*	_WriteChar

*---

]lp	lda	#strBeforeBlockRead
	jsr	showTICKIN

	lda	theINDEX	; get block to read
	asl
	tay
	lda	blocksTOREAD,y
	sta	proDREAD+12

doBREAD3	jsl	GSOS
	dw	$202f	; DRead
	adrl	proDREAD
	bcs	doBREAD3B	; the end

	lda	#strAfterBlockRead
	jsr	showTICKOUT
	jsr	calcMINMAX

	inc	theINDEX
	lda	theINDEX
	cmp	maxINDEX
	bcc	]lp
	jmp	doBREAD2

doBREAD3B	lda	#strAfterBlockRead
	jsr	showTICKOUT
	jsr	calcMINMAX

doBREAD2	jsr	showMINMAX

	lda	#strBeforeSetMark	; DO NOTHING
	jsr	showTICKIN

	lda	#strAfterSetMark
	jsr	showTICKOUT

	lda	#strBeforeClose
	jsr	showTICKIN

	lda	#strAfterClose
	jsr	showTICKOUT

	jmp	mainNEXT

*--- double read of blocks for type 3

makeTYPE3	sep	#$30	; get the pointers
	lda	dataBUFFER
	sta	firstBLOCK
	lda	dataBUFFER+256
	sta	firstBLOCK+1
	
	lda	dataBUFFER+1
	sta	secondBLOCK
	lda	dataBUFFER+257
	sta	secondBLOCK+1
	rep	#$30

	lda	firstBLOCK	; read first block
	sta	proDREAD+12
	jsl	GSOS
	dw	$202f
	adrl	proDREAD
	jsr	makeTABLE	; make first table

	lda	secondBLOCK	; read second block
	sta	proDREAD+12
	jsl	GSOS
	dw	$202f
	adrl	proDREAD
	rts		; and return

*--- get 256 blocks pointers and put them in blockstoread

makeTABLE	sep	#$30
	ldy	#0
]lp	lda	dataBUFFER,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt1
	inc	Arrivee+1
mt1	lda	dataBUFFER+256,y
	sta	(Arrivee)
	inc	Arrivee
	bne	mt2
	inc	Arrivee+1
mt2	iny
	bne	]lp
	rep	#$30
	rts

*----------------------------
* READ BLOCK SPEED LOW-LEVEL
*----------------------------

GSOSBusy	=	$E100BE
DEREF	=	$01FC38
FIND_VCR	=	$01FC48
FIND_FCR	=	$01FC4C

*
* a ProDOS FCR has the following useful information:
* 9A75 FCR		+$0
* 9AC4 master_blk_num	+$4F	** not useful **
* 9AC8 io_start		+$53	** useful **
*	pour un type 3, contient l'index vers les deux blocs
*	sachant que le premier est dŽjˆ en mŽmoire dessous...
* 9CC8 data_size 	+$253	** useful **
*	...contient le premier bloc d'index
* 9EC8 index_size	+$453	** not useful **
* A0C8 master_size	+$653	** not useful **
*

*---

doLLREAD	jsr	resetTICK
	bcc	doLLREAD1
	jmp	mainNEXT

doLLREAD1	lda	theSIZE
	asl
	tax
	lda	ptrPATHNAME,x
	sta	proOPEN+4

	lda	theSIZE	; file to compare to is here
	asl
	tax
	lda	maxBLOCKS,x
	sta	maxINDEX

	jsr	initMINMAX
	jsr	showHEADER
	
	lda	#strBeforeOpen
	jsr	showTICKIN

	jsl	GSOS	; open
	dw	$2010
	adrl	proOPEN

*-------------- The low-level part

]lp	ldal	GSOSBusy	; Thank you Window Manager
	bmi	]lp
	ora	#$8000
	stal	GSOSBusy

	phd
	lda	#$bd00
	tcd

	sep	#$20
	ldal	$e0c068
	pha
	ldal	$e0c08b
	ldal	$e0c08b
	rep	#$20

	lda	proOPEN+2
	jsl	FIND_FCR
	jsl	DEREF
	stx	theFCRVOL+1
	stx	ptrFCR
	sep	#$10
	sty	theFCRVOL+3
	sty	ptrFCR+2
	rep	#$10

	ldx	#8	; indirectly get the device ID
theFCRVOL	ldal	$bdbdbd,x	; of the volume ID
	jsl	FIND_VCR	; of the FCR ID
	jsl	DEREF
	stx	theVCR+1
	sep	#$10
	sty	theVCR+3
	rep	#$10

	sep	#$20
	pla
	stal	$e0c068
	rep	#$20

	pld

	ldal	GSOSBusy
	asl
	lsr
	stal	GSOSBusy

*--- VCR : rŽcupre le device ID

	ldx	#12	; device ID from the VCR
theVCR	ldal	$bdbdbd,x
	sta	proDREAD+2

*--- FCR : recopie le premier block ID

	lda	ptrFCR	; pointeur
	sta	Debut
	lda	ptrFCR+2
	sta	Debut+2
	
	ldy	#$253	; key block pointer from the FCR
	ldx	#512-2
]lp	lda	[Debut],y
	sta	dataBUFFER-$253,y
	iny
	iny
	dex
	dex
	bpl	]lp

*-------------- Now, onto block read

	lda	#blocksTOREAD	; where to put the blocks
	sta	Arrivee
	
	jsr	makeTABLE	; on doit toujours faire une table

	lda	theSIZE
	cmp	#2	; simple file for 64/128
	bne	doLL1	; on sort

	sep	#$20	; on lit le prochain bloc
	ldy	#$54
	lda	[Debut],y
	sta	proDREAD+12
	ldy	#$154
	lda	[Debut],y
	sta	proDREAD+13
	rep	#$20

	jsl	GSOS
	dw	$202f
	adrl	proDREAD
	
	jsr	makeTABLE	; et on complte la table

doLL1	lda	#strAfterOpen
	jsr	showTICKOUT

*--- We have the File block pointer at dataBUFFER now

	stz	theINDEX

]lp	lda	#strBeforeBlockRead
	jsr	showTICKIN

	lda	theINDEX	; get block to read
	asl
	tay
	lda	blocksTOREAD,y
	sta	proDREAD+12

	jsl	GSOS
	dw	$202f	; DRead
	adrl	proDREAD
	bcs	doLLENDERR	; the end

	lda	#strAfterBlockRead
	jsr	showTICKOUT
	jsr	calcMINMAX

	inc	theINDEX
	lda	theINDEX
	cmp	maxINDEX
	bcc	]lp
	jmp	doLLEND

doLLENDERR	lda	#strAfterBlockRead
	jsr	showTICKOUT
	jsr	calcMINMAX
	
*--------------

doLLEND	jsr	showMINMAX

	lda	proOPEN+2
	sta	proSETMARK+2
	
	lda	#strBeforeSetMark
	jsr	showTICKIN

	jsl	GSOS
	dw	$2016
	adrl	proSETMARK

	lda	#strAfterSetMark
	jsr	showTICKOUT

	lda	proOPEN+2
	sta	proCLOSE+2

	lda	#strBeforeClose
	jsr	showTICKIN

	jsl	GSOS	; close
	dw	$2014
	adrl	proCLOSE

	lda	#strAfterClose
	jsr	showTICKOUT
	jmp	mainNEXT

*----------------------------
* INIT MIN & MAX
*----------------------------

initMINMAX	lda	#-1
	sta	theMIN
	sta	theMIN+2

	stz	theMAX
	stz	theMAX+2
	rts

*----------------------------
* CALCULATE MIN & MAX
*----------------------------

calcMINMAX	ldx	valTIMEROUT+2
	ldy	valTIMEROUT

	cpx	theMIN+2
	bcc	newMIN
	cpy	theMIN
	bcc	newMIN
	bcs	calcMAX

newMIN	stx	theMIN+2
	sty	theMIN

calcMAX	cpx	theMAX+2
	bcc	exitMAX
	cpy	theMAX
	bcc	exitMAX
	beq	exitMAX

	stx	theMAX+2
	sty	theMAX
exitMAX	rts

*---

theMIN	ds	4
theMAX	ds	4

*----------------------------
* SHOW HEADER
*----------------------------

showHEADER	lda	theKEY
	sec
	sbc	#"3"
	asl
	tay
	lda	ptrSTRTESTTYPE,y
	jsr	outputCSV

	lda	theSIZE
	asl
	tay
	lda	ptrSTRFILESIZE,y	; and slip below...
	
*----------------------------
* OUTPUT CSV
*----------------------------

outputCSV	sta	outputCSV1+1

	ldx	#0
outputCSV1	lda	$ffff,x
	and	#$ff
	beq	outputCSV9
	sep	#$20
	sta	[dpCSV]
	rep	#$20
	inc	dpCSV
	inx
	bne	outputCSV1
outputCSV9	rts

*--- output only digits

outputCSVDIGIT	sta	outputCSVD1+1
	ldx	#0
outputCSVD1	lda	$ffff,x
	and	#$ff
	beq	outputCSVD9
	cmp	#' '
	beq	outputCSVD2
	sep	#$20
	sta	[dpCSV]
	rep	#$20
	inc	dpCSV
outputCSVD2	inx
	bne	outputCSVD1
outputCSVD9	rts

*----------------------------
* SHOW TICK IN
*----------------------------

showTICKIN	jsr	outputCSV

	lda	#T2
	jsr	stopTIMER2
	
	lda	#T2
	jsr	readTIMER2

*--- Output decimal value

	lda	#'  '	; init string
	sta	strTick
	sta	strTick+2
	sta	strTick+4
	sta	strTick+6
	sta	strTick+8
	
	lda	valTIMER+2
	pha
	lda	valTIMER
	pha
	PushLong	#strTick
	PushWord	#10
	PushWord	#FALSE
	_Long2Dec

	lda	valTIMER	; save start value
	sta	valTIMERIN	; for later
	lda	valTIMER+2
	sta	valTIMERIN+2
	
	lda	#strTick
	jsr	outputCSVDIGIT

*--- Output end of in line

	lda	#strComma	; output one comma
	jsr	outputCSV
	
	lda	#strReturn	; output end of line
	jsr	outputCSV
	
	lda	#T2
	jmp	startTIMER2

*---

valTIMERIN	ds	4

*----------------------------
* SHOW TICK OUT
*----------------------------

showTICKOUT	jsr	outputCSV

	lda	#T2
	jsr	stopTIMER2
	
	lda	#T2
	jsr	readTIMER2

*--- Output decimal value

	lda	#'  '	; init string
	sta	strTick
	sta	strTick+2
	sta	strTick+4
	sta	strTick+6
	sta	strTick+8
	
	lda	valTIMER+2
	pha
	lda	valTIMER
	pha
	PushLong	#strTick
	PushWord	#10
	PushWord	#FALSE
	_Long2Dec

	lda	#strTick
	jsr	outputCSVDIGIT

	lda	#strComma	; output one comma
	jsr	outputCSV

*--- Now calculate difference and show it

	lda	#'  '	; init string
	sta	strTick
	sta	strTick+2
	sta	strTick+4
	sta	strTick+6
	sta	strTick+8
	
	lda	valTIMER
	sec
	sbc	valTIMERIN
	sta	valTIMEROUT
	tay
	lda	valTIMER+2
	sbc	valTIMERIN+2
	sta	valTIMEROUT+2
	
	pha
	phy
	PushLong	#strTick
	PushWord	#10
	PushWord	#FALSE
	_Long2Dec

	lda	#strTick
	jsr	outputCSVDIGIT

	lda	#strReturn	; output end of line
	jsr	outputCSV
	
*--- Restart timer

	lda	#T2
	jmp	startTIMER2

*---

valTIMEROUT	ds	4	; the calculated difference (out - in)

*----------------------------
* SHOW MIN & MAX
*----------------------------

showMINMAX	lda	#T2
	jsr	stopTIMER2
	
*--- Output decimal value of MIN

	lda	#'  '	; init string
	sta	strTick
	sta	strTick+2
	sta	strTick+4
	sta	strTick+6
	sta	strTick+8
	
	lda	theMIN+2
	pha
	lda	theMIN
	pha
	PushLong	#strTick
	PushWord	#10
	PushWord	#FALSE
	_Long2Dec

	lda	#strMin
	jsr	outputCSV

	lda	#strTick
	jsr	outputCSVDIGIT

	lda	#strComma
	jsr	outputCSV
	lda	#strReturn
	jsr	outputCSV

*--- Output decimal value of MAX

	lda	#'  '	; init string
	sta	strTick
	sta	strTick+2
	sta	strTick+4
	sta	strTick+6
	sta	strTick+8
	
	lda	theMAX+2
	pha
	lda	theMAX
	pha
	PushLong	#strTick
	PushWord	#10
	PushWord	#FALSE
	_Long2Dec

	lda	#strMax
	jsr	outputCSV

	lda	#strTick
	jsr	outputCSVDIGIT

	lda	#strComma
	jsr	outputCSV
	lda	#strReturn
	jsr	outputCSV

*--- Restart timer

	lda	#T2
	jmp	startTIMER2

*----------------------------
* CODE
*----------------------------

resetTICK	lda	theSLOT	; Brutal Timer slot not set
	bne	resetTICKOK
	sec
	rts

resetTICKOK	lda	#FREQ_A2F0	; set to 1MHz
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
	asc	' 1- File size is #K'0d
	asc	' 2- Set Brutal Timer slot ($)'0d
	asc	' 3- Read file in one pass'0d
	asc	' 4- Read file per 512 bytes'0d
	asc	' 5- Read file per block'0d
	asc	' 6- Low-level read file per block'0d
	asc	'Input your choice (Q to quit) >'00

strBTSLOT	asc	0d'Brutal Timer slot (1-7) >'00

strENDOFPROCESS	asc	0d'End of process... Saving...'00
strBYE	asc	0d'Press a key to continue...'00

strBeforeOpen	asc	'Open entry,'00
strAfterOpen	asc	'Open exit,'00
strBeforeRead	asc	'Read entry,'00
strAfterRead	asc	'Read exit,'00
strBeforeClose	asc	'Close entry,'00
strAfterClose	asc	'Close exit,'00
strBeforeBlockRead asc	'Block read entry,'00
strAfterBlockRead asc	'Block read exit,'00
strBeforeSetMark asc	'Set mark entry,'00
strAfterSetMark	asc	'Set mark exit,'00

strMin	asc	'min,'00
strMax	asc	'max,'00

* WHAT, time in decimal, <empty>
* what, time in decimal, difference

strTick	asc	'          '00
strComma	asc	','00
strReturn	asc	0d00

strREAD	asc	'Read... '00
strBLOCKS	asc	'Blocks'00
strRERR	asc	'Read error'00
strCANCEL	asc	'Cancel'00

ptrSTRFILESIZE	da	strFILE64
	da	strFILE128
	da	strFILE256

strFILE64	asc	'File size is 64Kb,'0d00
strFILE128	asc	'File size is 128Kb,'0d00
strFILE256	asc	'File size is 256Kb,'0d00

ptrSTRTESTTYPE	da	strTESTTYPE1
	da	strTESTTYPE2
	da	strTESTTYPE3
	da	strTESTTYPE4
	
strTESTTYPE1	asc	'Read file in one pass,'00
strTESTTYPE2	asc	'Read file per 512 bytes,'00
strTESTTYPE3	asc	'Read file block-by-block,'00
strTESTTYPE4	asc	'Read file b-by-b low level,'00

*----------

ptrPATHNAME	da	pathname64
	da	pathname128
	da	pathname256
	
pathname	strl	'1/Data'	; this is a folder
pathname64	strl	'1/Data/File64'	; this ia a 64K file
pathname128	strl	'1/Data/File128'	; this ia a 128K file
pathname256	strl	'1/Data/File256'	; this ia a 256K file

fileSIZE	dw	1,2,4	; 64K, 128K, 256

ptrFILE	da	file64	; pointer to file names to check for read block
	da	file128
	da	file256

file64	str	'FILE64'
file128	str	'FILE128'
file256	str	'FILE256'

ptrSIZE	da	size64	; pointer to size strings for menu display
	da	size128
	da	size256

maxBLOCKS	dw	128,256,512

size64	asc	'64'00
size128	asc	'128'00
size256	asc	'256'00

ptrCSVFILE	da	csv64
	da	csv128
	da	csv256

csv64	strl	'1/File64.csv'
csv128	strl	'1/File128.csv'
csv256	strl	'1/File256.csv'

ptrFCR	ds	4

*----------

proOPEN	dw	15	; pcount
	ds	2	; ref_num
	adrl	pathname64	; pathname
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

proSETMARK	dw	3	; 0 - pcount
	ds	2	; 2 - ref_num
	dw	0	; 4 - base (0 = displacement)
	ds	4	; 6 - displacement (0)

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
	adrl	dataBUFFER	; 04 buffer
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

theKEY	ds	2	; selected key

theSIZE	ds	2	; 0..2 for 64, 128, and 256K
theLENGTH	ds	2	; filename length 6 or 7
theKIND	ds	2	; 2 or 3

theINDEX	ds	2
maxINDEX	ds	2
filesize	ds	4	; in KB

firstBLOCK	ds	2
secondBLOCK	ds	2

*----------

appID	ds	2
myID	ds	2

myDP	ds	2
ptrBUFFER	ds	4
haBUFFER	ds	4

ptrCSV	ds	4
haCSV	ds	4

*----------

blocksTOREAD	ds	1024	; up to 512 16-bit blocks to read
dataBUFFER	ds	1024	; 2 blocks for type 3 files
