*
* Debug
* Play with the SD card
*
* (c) 2023, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

                  xc
                  xc
                  mx        %00

                  rel
                  dsk       debug.l
                  lst       off

*----------

SECTOR	=	$0000

SD_ADDRESS_SET_MSB =	$e40000
SD_ADDRESS_SET_MSB_1 =	$e40002
SD_ADDRESS_SET_MSB_2 =	$e40004
SD_ADDRESS_SET_MSB_3 =	$e40006
SD_START_READ	=	$e40008	; starts reading the sector (if it was idle)
SD_READ 	=	$e4000a 
SD_START_WRITE 	=	$e4000c	; starts writing the sector (if it was idle)

                  use       4/Int.Macs
                  use       4/Locator.Macs
                  use       4/Mem.Macs
                  use       4/Misc.Macs
                  use       4/Text.Macs
                  use       4/Util.Macs

Debut             =         $00
GSOS              =         $e100a8

dpSDREAD	=	Debut+4

*----------

dcREMOVE          =         $0004
dcONLINE          =         $0010
dcBLOCKDEVICE     =         $0080

maxDEVICES        =         128

KBD	=	$c000
KBDSTROBE	=	$c010

*----------

                  phk
                  plb

                  tdc
                  sta       myDP

                  _TLStartUp
                  pha
                  _MMStartUp
                  pla
                  sta       appID
                  ora       #$0100
                  sta       myID

                  _MTStartUp
                  _TextStartUp

                  _IMStartUp

                  pha
                  pha
                  PushLong  #$010000
                  PushWord  myID
                  PushWord  #%11000000_00011100
                  PushLong  #0
                  _NewHandle
                  phd
                  tsc
                  tcd
                  lda       [3]
                  sta       ptrBUFFER
                  ldy       #2
                  lda       [3],y
                  sta       ptrBUFFER+2
                  pld
                  ply
                  sty       haBUFFER
                  plx
                  stx       haBUFFER+2

	  lda	#myBUFFER1
	  stal	$300
	  lda	#^myBUFFER1
	  stal	$302
	  
*----------

                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetInGlobals
                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetOutGlobals
                  PushWord  #$00FF
                  PushWord  #$0080
                  _SetErrGlobals

                  PushWord  #0
                  PushLong  #3
                  _SetInputDevice
                  PushWord  #0
                  PushLong  #3
                  _SetOutputDevice
                  PushWord  #0
                  PushLong  #3
                  _SetErrorDevice

                  PushWord  #0
                  _InitTextDev
                  PushWord  #1
                  _InitTextDev
                  PushWord  #2
                  _InitTextDev

                  PushWord  #$0c                 ; home
                  _WriteChar

*----------------------------
* MAIN MENU
*----------------------------

mainMENU	PushLong	#strMAINMENU
	_WriteCString

	jsr	pollDEVICES          ; show CD-ROM devices
	jsr	waitFORKEY           ; is it 0-9
	jmp	doQUIT

*--- Data

strMAINMENU	asc	0d'Debug ASSD'0d
	asc	'(c) 2023, Brutal Deluxe Software'0d0d00

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT	_IMShutDown
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
* POLL DEVICES
*----------------------------

pollDEVICES	PushWord	#$0d
	_WriteChar

doREAD	lda	#$00e4
	sta	dpSDREAD+2
	stz	dpSDREAD
	
	jsr	debugBORDER
	
	jsr	readablock1
	jsr	readablock2

	lda	#^myBUFFER
	jsr	showWORD
	lda	#myBUFFER
	jsr	showWORD

	brk	$bd
	
	ldal	KBD-1
	bpl	nextBLOCK
	stal	KBDSTROBE-1
	xba
	and	#$ff
	cmp	#$9b
	beq	doEXIT
	
nextBLOCK	inc	proDREAD+12
	bne	doREAD
	inc	proDREAD+14
	bra	doREAD
doEXIT	rts

*---

readablock	sep	#$20
	lda	#SD_ADDRESS_SET_MSB
	sta	dpSDREAD
	lda	proDREAD+15
	sta	[dpSDREAD]
	jsr	waitPLEASE
	
	lda	#SD_ADDRESS_SET_MSB_1
	sta	dpSDREAD
	lda	proDREAD+14
	sta	[dpSDREAD]
	jsr	waitPLEASE

	lda	#SD_ADDRESS_SET_MSB_2
	sta	dpSDREAD
	lda	proDREAD+13
	sta	[dpSDREAD]
	jsr	waitPLEASE

	lda	#SD_ADDRESS_SET_MSB_3
	sta	dpSDREAD
	lda	proDREAD+12
	sta	[dpSDREAD]
	jsr	waitPLEASE

	lda	#SD_START_READ
	sta	dpSDREAD
	lda	#1
	sta	[dpSDREAD]
	jsr	waitPLEASE

	rep	#$20
	lda	#SD_READ
	sta	dpSDREAD

	ldy	#0
]lp	lda	[dpSDREAD]
	and	#$ff
	sta	myBUFFER1,y
	jsr	waitPLEASE
	iny
	cpy	#512
	bne	]lp

checkBLOCK	ldx	#512-2
]lp	lda	myBUFFER1,x
	bne	gotDATA
	dex
	dex
	bpl	]lp
	rts
gotDATA	lda	#^myBUFFER1
	jsr	showWORD
	lda	#myBUFFER1
	jsr	showWORD

*	lda	proDREAD+14
*	jsr	showWORD
*	lda	proDREAD+12
*	jsr	showWORD
*	
*	PushWord	#' '
*	_WriteChar
	
	brk	$bd
	rts

waitPLEASE	ds	128,$EA	; 32 NOP x 2 cycles = 64 + JSR/RTS
	rts
	
*---

readablock1	sep	#$20
	lda	#0
	stal	SD_ADDRESS_SET_MSB
	lda	#0
	stal	SD_ADDRESS_SET_MSB_1
	lda	#0
	stal	SD_ADDRESS_SET_MSB_2
	lda	#0
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldx	#0
]lp	ldal	SD_READ
	sta	myBUFFER1,x
	jsr	waitPLEASE
	inx
	cpx	#512
	bcc	]lp

	rep	#$20
	rts
	
*---

readablock2	sep	#$20
	lda	#$00
	stal	SD_ADDRESS_SET_MSB
	lda	#$00
	stal	SD_ADDRESS_SET_MSB_1
	lda	#$20
	stal	SD_ADDRESS_SET_MSB_2
	lda	#$00
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldx	#0
]lp	ldal	SD_READ
	sta	myBUFFER2,x
	jsr	waitPLEASE
	inx
	cpx	#512
	bcc	]lp

	rep	#$20
	rts
	
*--- Perform a DWrite

okWRITE	PushLong  #strDWRITE	; show the string
	_WriteCString

	jsl	GSOS
	dw	$2030
	adrl	proDWRITE
	jmp	showERRCODE

*--- Code end

showERRCODE
	sta	errCODE	; save it

	PushLong  #strERR	; show the string
	_WriteCString

	lda	errCODE	; show the error code
	jsr	showHEX

	PushWord  #$0d
	_WriteChar
	rts

*--- Print a line of buffer

printBUFFER	PushWord	#$20
	_WriteChar

	lda	myBUFFER
	jsr	printME
	lda	myBUFFER+2
	jsr	printME
	lda	myBUFFER+4
	jsr	printME
	lda	myBUFFER+6
	jsr	printME
	lda	myBUFFER+8
	jsr	printME
	lda	myBUFFER+10
	jsr	printME
	lda	myBUFFER+12
	jsr	printME
	lda	myBUFFER+14
	jsr	printME

	PushWord	#$0d
	_WriteChar

	PushWord	#$20
	_WriteChar

	lda	myBUFFER+16
	jsr	printME
	lda	myBUFFER+18
	jsr	printME
	lda	myBUFFER+20
	jsr	printME
	lda	myBUFFER+22
	jsr	printME
	lda	myBUFFER+24
	jsr	printME
	lda	myBUFFER+26
	jsr	printME
	lda	myBUFFER+28
	jsr	printME
	lda	myBUFFER+30	; ends into the code below...

printME	pha	; from a word to a string
	pha
	pha	; <= here, really
	_HexIt
	PullLong  strBUFFER

	PushLong  #strBUFFER	; show the string
	_WriteCString
	rts
	
*---------- Data

strDREAD	asc	0d0d'DRead block $'00
strDWRITE	asc	0d0d'DWrite '00
strDSTATUS	asc	0d0d'DStatus '00

strCHARS	asc	' Characteristics:  '00
strBLOCKS	asc	0d' Number of blocks: '00

strERR	asc	0d'- Error code '00

*----------------------------
* DEBUG
*----------------------------

debugBORDER	sep	#$20
	ldal	$c034
	inc
	stal	$c034
	rep	#$20
	rts

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Wait for a key

waitFORKEY	PushWord  #0                   ; wait for key
	PushWord  #1                   ; echo char
	_ReadChar

waitKEY1	lda       1,s                  ; check CR
	and       #$ff                 ; of typed
	sta       1,s                  ; in char
	cmp       #$8d
	beq       waitKEY9

waitKEY8	PushWord  #$0d                 ; return
	_WriteChar

waitKEY9	pla                            ; restore entered char
	rts

*---------- Display a word

showWORD	pha                            ; from a word to a string
	pha
	pha                            ; <= here, really
	_HexIt
	PullLong  strHEX

	PushLong  #strHEX              ; show the string
	_WriteCString
	rts

*---------- Display a hex word with a $

showHEX	pha	; from a word to a string
	pha
	pha	; <= here, really
	_HexIt
	PullLong  strHEX

	PushLong  #strHEX1	; show the string
	_WriteCString
	rts

*--- Data

strHEX1	asc	'$'
strHEX	asc	'0000'00
strBUFFER	asc	'0000 '00

*----------------------------
* DATA
*----------------------------

errCODE	ds	2

proQUIT	dw	2	; pCount
	ds	4	; 02 pathname
	ds	2	; 06 flags

proDINFO	dw	8	; Parms for DInfo
	ds	2	; 02 device num
	adrl	devINFO	; 04 device name
	ds	2	; 08 characteristics
	ds	4	; 0A total blocks
	ds	2	; 0E slot number
	ds	2	; 10 unit number
	ds	2	; 12 version
	ds	2	; 14 device id

proDREAD	dw	6	; pCount
	ds	2	; 02 devNum
	adrl	myBUFFER1	; 04 buffer
	adrl	512	; 08 requestCount
	adrl	SECTOR	; 0C startingBlock
	dw	512	; 10 blockSize
	ds	4	; 14 transferCount
	
proDWRITE	dw	6	; pCount
	ds	2	; 02 devNum
	adrl	myBUFFER1	; 04 buffer
	adrl	512	; 08 requestCount
	adrl	SECTOR	; 0C startingBlock
	dw	512	; 10 blockSize
	ds	4	; 14 transferCount

proDSTATUS	dw	5	; pCount
	ds	2	; 02 devNum
	ds	2	; 04 code ($0000 = Device Status)
	adrl	myLIST	; 06 list
	adrl	512	; 0A requestCount (a big buffer)
	ds	4	; 0E transferCount

*----------

strDEVICE	str	'.ASSDDevice'	; length is 12 chars (including length byte)

devINFO	dw	$0032                ; buffer size
devINFO1	db	$00                  ; length
devINFO2	db	$00
devINFO3	ds	$30                  ; data

*----------

appID	ds	2
myID	ds	2

myDP	ds	2
ptrBUFFER	ds	4
haBUFFER	ds	4

*----------

myBUFFER
myBUFFER1	ds	512,$bd
	ds	2,$ff
	
myBUFFER2	ds	512,$bd
	ds	2,$ff

myLIST	ds	512

