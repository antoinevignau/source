*
* ADB Devices
* Show all connected devices
*
* (c) 2026, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	xc
	xc
	mx	%00

	rel
	dsk	adbdevices.l
	lst	off

*----------

	use	4/ADB.Macs
	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs

Debut	=	$00
Arrivee	=	$04

GSOS	=	$e100a8

*----------

maxDEVICES        =         16		; really 15 b/c 0 is reserved

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

	PushWord	#$0c	; home
	_WriteChar

*----------------------------
* MAIN MENU
*----------------------------

mainMENU	PushLong	#strMAINMENU
	_WriteCString

	jsr	waitFORKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	bne	mainMENU

	jsr	pollDEVICES	; show ADB devices
	jsr	showRESULTS
	jmp	mainMENU

*--- Data

strMAINMENU	asc	'Show ADB devices'0d
	asc	'(c) 2026, Brutal Deluxe Software'0d
	asc	' 1. Poll ADB devices'0d
	asc	' Q. Quit'0d00

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT	_ADBShutDown
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
* POLL DEVICES
*----------------------------

pollDEVICES	lda	#1	; start with device 1
	sta	theDEVICE

]lp	jsr	ADBGetInfo3	; register 3
	
	inc	theDEVICE
	lda	theDEVICE
	cmp	#maxDEVICES
	bcc	]lp
	rts

*----------------------------
* SHOW RESULTS
*----------------------------

showRESULTS	PushLong	#strPRESSAKEY
	_WriteCString
	jsr	waitFORKEY

	PushLong	#strDEVICES
	_WriteCString

	lda	#1	; start with device 1
	sta	theDEVICE

]lp	jsr	showDEVICEINFO
	
	inc	theDEVICE
	lda	theDEVICE
	cmp	#maxDEVICES
	bcc	]lp
	rts

*---

strPRESSAKEY	asc	0d'Press a key to see the results... '0d00

strDEVICES	asc	0d
	asc	'Address  Error  Length Register 3'0d00
	asc	'$00      $0000  $00    $00000000000000000000'00

theDEVICE	ds	2

*----------------------------
* SHOW DEVICE INFO
*----------------------------

showDEVICEINFO	asl
	tax
	lda	errCODE,x
	sta	errCODE
	
	lda	adbLENGTH,x
	sta	adbLENGTH

	lda	ptrTalk,x
	sta	dataTalk
	
	PushWord	#'$'
	_WriteChar
	lda	theDEVICE
	jsr	showBYTE

	PushLong	#strSPACE6	; $xxxxxxxxxxxxxxxx
	_WriteCString
	lda	errCODE
	jsr	showWORD
	
	PushLong	#strSPACE2	; $xxxxxxxxxxxxxxxx
	_WriteCString
	lda	adbLENGTH
	jsr	showBYTE
	
	PushLong	#strSPACE4	; $xxxxxxxxxxxxxxxx
	_WriteCString
	ldx	dataTalk+2
	ldy	dataTalk
	jsr	showHEX
	
	PushWord	#$0d	; carriage return
	_WriteChar
	rts

*---------- Data

strSPACE6	asc	'  '
strSPACE4	asc	'  '
strSPACE2	asc	'  '
	asc	'$'00

*----------------------------
* ADB ROUTINES
*----------------------------

	put	adb_routines.s

*----------------------------
* TEXT ROUTINES
*----------------------------

*----------------------------
* TEXT ROUTINES
*----------------------------

*---------- Display in string offset
* A: offset in
* X: nb of chars to print
* offset from commandBUFF

showTEXT	pea	#^buff
	clc
	adc	#buff
	pha
	pea	$0000
	phx
	_TextWriteBlock
	rts

*---------- Display decimal
* A: word

showDECIMAL	and	#$ff
	pha

	lda	#'  '	; space by default
	sta	strDECIMAL

	PushLong	#strDECIMAL
	PushWord	#2
	PushWord	#0
	_Int2Dec

	PushLong	#strDECIMAL
	_WriteCString
	rts

*--- Data

strDECIMAL	asc	'00'00

*---------- Display bits
* A: word
* X: nb of bits to display (1-8)

showBITS	cpx	#16
	bcc	showBITS0
	rts

showBITS0	ldy	#0	; index
]lp	pha
	asl		; bit in carry
	bcs	showBITS1

	lda	#'00'	; output 0
	bra	showBITS2
showBITS1	lda	#'11'	; output 1
showBITS2	sta	strBITS,y

	pla
	asl
	iny
	dex
	bne	]lp

	lda	#0	; end C string
	sta	strBITS,y

	PushLong	#strBITS	; show the string
	_WriteCString
	rts

*--- Data

strBITS	ds	18	; 16 bits + 2 zeros

*---------- Display a byte

showBYTE	pha		; from a byte to a string
	pha
	pha		; <= here, really
	_HexIt
	pla		; we don't use
	pla
	sta	strBYTE

	PushLong	#strBYTE	; show the string
	_WriteCString
	rts

*--- Data

strBYTE	asc	'00'00

*---------- Display a word

showWORD	pha		; from a word to a string
	pha
	pha		; <= here, really
	_HexIt
	PullLong	strWORD

	PushLong	#strWORD	; show the string
	_WriteCString
	rts

*--- Data

strWORD	asc	'0000'00

*---------- Display a long

showLONG	phx
	phy
	PushLong	#strLONG
	PushWord	#8
	_Long2Hex
	
	PushLong	#strLONG	; show the string
	_WriteCString
	rts

*--- Data

strLONG	asc	'00000000'00

*---------- Display 8 bytes

showHEX	sty	Debut
	stx	Debut+2
	
	ldy	#0
]lp	phy
	lda	[Debut],y
	jsr	showBYTE
	ply
	iny
	cpy	#8
	bcc	]lp
	rts

*---------- Wait for a key

waitFORKEY	pha		; wait for key
	PushWord	#1	; echo char
	_ReadChar

waitKEY1	lda	1,s	; check CR
	and	#$ff	; of typed
	sta	1,s	; in char
	cmp	#$8d
	beq	waitKEY9

waitKEY8	PushWord  #$0d	; return
	_WriteChar

waitKEY9	pla		; restore entered char
	rts

*----------------------------
* DATA
*----------------------------

proQUIT	dw	2	; pcount
	ds	4	; pathname
	ds	2	; flags

*----------

appID	ds	2
myID	ds	2
myDP	ds	2

*----------

buff	ds	512
