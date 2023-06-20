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

                  use       4/Int.Macs
                  use       4/Locator.Macs
                  use       4/Mem.Macs
                  use       4/Misc.Macs
                  use       4/Text.Macs
                  use       4/Util.Macs

Debut             =         $00
GSOS              =         $e100a8

*----------

dcREMOVE          =         $0004
dcONLINE          =         $0010
dcBLOCKDEVICE     =         $0080

maxDEVICES        =         128

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

pollDEVICES	lda	#1                   ; start with device 1
	sta	proDINFO+2

]lp	jsl	GSOS                 ; do a DInfo
	dw	$202c
	adrl	proDINFO
	bcc	found

	cmp	#$0011               ; no more devices
	bne	loop
	rts

loop	inc	proDINFO+2
	bra	]lp

*---------- Show device

found	lda	proDINFO+8           ; block device?
	and	#dcBLOCKDEVICE
	beq	loop

	lda	devINFO1             ; from a STRL to a STR
	xba
	sta	devINFO1

	ldx	#10	; compare name
]lp	lda	devINFO2,x
	cmp	strDEVICE,x
	bne	loop
	dex
	dex
	bpl	]lp
	
*--- Show device ID

	lda	proDINFO+2
	sta	proDREAD+2
	sta	proDWRITE+2
	sta	proDSTATUS+2
	jsr	showHEX

	PushWord  #$20
	_WriteChar

*--- Show Characteristics

	lda	proDINFO+8
	jsr	showHEX

	PushWord  #$20
	_WriteChar

*--- Show Name

	PushLong  #devINFO2
	_WriteString

*--- Perform a DStatus

	PushLong  #strDSTATUS	; show the string
	_WriteCString

	jsl	GSOS
	dw	$202d
	adrl	proDSTATUS
	jsr	showERRCODE

*--- Show device status characteristics

	PushLong  #strCHARS	; show device characteristics
	_WriteCString
	
	lda	myLIST
	jsr	showHEX
	
*--- Show device status number of blocks

	PushLong  #strBLOCKS	; show number of blocks
	_WriteCString
	
	lda	myLIST+4
	jsr	showHEX
	lda	myLIST+2
	jsr	showWORD
	
*--- Perform a DRead

	PushLong  #strDREAD	; show the string
	_WriteCString

	jsl	GSOS
	dw	$202f
	adrl	proDREAD
	jsr	showERRCODE

	jsr	printBUFFER	; output two lines of buffer
	
	lda	errCODE	; only write if read is OK
	beq	okWRITE
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

strDREAD	asc	0d0d'DRead '00
strDWRITE	asc	0d0d'DWrite '00
strDSTATUS	asc	0d0d'DStatus '00

strCHARS	asc	' Characteristics:  '00
strBLOCKS	asc	0d' Number of blocks: '00

strERR	asc	'- Error code '00

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
	adrl	myBUFFER	; 04 buffer
	adrl	512	; 08 requestCount
	ds	4	; 0C startingBlock
	dw	512	; 10 blockSize
	ds	4	; 14 transferCount
	
proDWRITE	dw	6	; pCount
	ds	2	; 02 devNum
	adrl	myBUFFER	; 04 buffer
	adrl	512	; 08 requestCount
	ds	4	; 0C startingBlock
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

myBUFFER	ds	512
myLIST	ds	512

