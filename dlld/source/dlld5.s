*
* DLLD
* Let's play Dragon's Lair :-)
*
* (c) 2024, Brutal Deluxe Software
*

	mx	%11
	org	$2000
	lst	off

	use	4/Int.Macs
	use	4/Misc.Macs
	use	4/Util.Macs
	
*-----------------------------------
* MACROS
*-----------------------------------

_sendSTRING	mac
	ldx	#>]1
	ldy	#<]1
	jsr	sendString
	eom

*-----------------------------------
* EQUATES
*-----------------------------------

SLOT	=	2
N0	=	SLOT*16
CN	=	SLOT!$C0

dpFROM	=	$fc
dpTO	=	dpFROM+2

chrRETURN	=	$0d

*----------

CH	=	$24

KBD	=	$c000
CLR80VID	=	$c00c
KBDSTROBE	=	$c010

INIT	=	$FB2F
TABV	=	$FB5B
HOME	=	$FC58
PRBYTE	=	$FDDA
COUT	=	$FDED
SETNORM	=	$FE84
SETKBD	=	$FE89

*-----------------------------------
* CODE
*-----------------------------------

	bra	jumpME

theFRAME	ds	2

jumpME	sta	CLR80VID
	jsr	INIT	; text screen
	jsr	SETNORM	; set normal text mode
	jsr	SETKBD	; reset input to keyboard
	jsr	HOME	; home cursor and clear to end of page

	clc
	xce
	rep	#$30
	lda	#323
	sta	theFRAME
	sec
	xce
	sep	#$30

	jsr	initSERIAL	; set the serial addresses
	jsr	initPORT	; init the serial port for LD support

	ldx	#>strDS	; on veut la frame number
	ldy	#<strDS
	jsr	sendLDCommand

	ldx	#>strSA	; start the player
	ldy	#<strSA
	jsr	sendLDCommand

	jsr	setINT

*----------

]lp	lda	KBD	; wait for a key
	bpl	]lp
	bit	KBDSTROBE

	ldx	#>strSE	; Move to frame
	ldy	#<strSE
	jsr	sendLDCommand

	ldx	#>strPL	; Play to frame
	ldy	#<strPL
	jsr	sendLDCommand

	jsr	startINT

*----------
	
]lp	lda	#0
	sta	CH
	jsr	TABV
	
	lda	theFRAME+1
	jsr	PRBYTE
	lda	theFRAME
	jsr	PRBYTE

	lda	KBD	; wait for a key
	bpl	]lp
	bit	KBDSTROBE

	jsr	stopINT
	jsr	unsetINT

*----------
	
	ldx	#>strRJ	; It's the end!
	ldy	#<strRJ
	jsr	sendLDCommand
	rts

*--- Data

strDS	asc	'1DS'00	; display frame number
strCO	asc	'CO'00	; close the door
strSA	asc	'SA'00	; start player
strRJ	asc	'RJ'00	; stop the player
strQF	asc	'?F'00	; which frame are we on?

strSE	asc	'FR00323SE'00	; set frame...
strPL	asc	'FR01359PL'00	; play to frame...

*-----------------------------------
* INTERRUPT
*-----------------------------------

setINT	clc
	xce
	rep	#$30
	
	php
	sei
	PushLong	#theINT
	_SetHeartBeat
	plp
	
	sec
	xce
	sep	#$30
	rts
	
*----------
	
unsetINT	clc
	xce
	rep	#$30
	
	php
	sei
	PushLong	#theINT
	_DelHeartBeat
	plp
	
	sec
	xce
	sep	#$30
	rts

*----------
	
theINT	ds	4
	dw	2
	dw	$a55A

	phk
	plb
	rep	#$30

	lda	#2
	sta	theINT+4
	
	inc	theFRAME
	
	sep	#$30
	clc
	rtl
	
*----------
	
startINT	clc
	xce
	rep	#$30
	
	PushWord	#2
	_IntSource
	
	sec
	xce
	sep	#$30
	rts

*----------
	
stopINT	clc
	xce
	rep	#$30

	PushWord	#3
	_IntSource
	
	sec
	xce
	sep	#$30
	rts

*-----------------------------------
* SERIAL PORT (MODEM)
*-----------------------------------

*---------- Set all addressses

initSERIAL
	lda	$c20d
	sta	doinit+1
	lda	$c20e
	sta	doread+1
	lda	$c20f
	sta	dowrite+1
	lda	$c210
	sta	dostatus+1
	rts

doinit	jmp	$c20d
doread	jmp	$c20e
dowrite	jmp	$c20f
dostatus	jmp	$c210

*---------- Init modem port for LD support

initPORT	ldx	#CN
	ldy	#N0
	jsr	doinit

	_sendSTRING	#strED	; Don't echo output
	_sendSTRING	#strBE	; Input buffering: on
	_sendSTRING	#str12B	; Baud rate: 4800 BPS
	_sendSTRING	#str0D	; Data/Stop bits: 8/1
	_sendSTRING	#str0P	; Parity: none
	_sendSTRING	#str0N	; Line length: 0
	_sendSTRING	#strAD	; Do not implement basic tabs
	_sendSTRING	#strCD	; Disable line formatting
	_sendSTRING	#strXD	; Ignore XOFF
	_sendSTRING	#strFD	; Disable keyboard input
	_sendSTRING	#strLD	; Do not add line feeds after CR
	_sendSTRING	#strME	; Mask line feed in
	_sendSTRING	#strZ	; Suppress control characters
	jsr	checkInputReady
	rts

*---------- Check the input is ready

checkInputReady
	ldx	#16
	ldy	#0
	
]lp	phx
	phy

	ldx	#CN
	ldy	#N0
	lda	#1
	jsr	dostatus
	bcs	checkIR1

	ply
	plx
	dey
	bne	]lp
	dex
	bne	]lp

	sec
	rts
checkIR1	ply
	plx
	clc
	rts

*---------- Check the output is ready

checkOutputReady
	ldx	#16
	ldy	#0
	
]lp	phx
	phy

	ldx	#CN
	ldy	#N0
	lda	#0
	jsr	dostatus
	bcs	checkOR1

	ply
	plx
	dey
	bne	]lp
	dex
	bne	]lp

	sec
	rts
checkOR1	ply
	plx
	clc
	rts

*---------- Send a LD command

sendLDCommand
	jsr	sendString
	bcs	sendLDError
	jsr	receiveString
sendLDError	rts

*---------- Send a string

sendString
	sty	dpFROM
	stx	dpFROM+1

]lp	lda	(dpFROM)
	beq	sendCRS1	; end of string?
	jsr	sendCharacter
	bcs	sendError	; error!

	inc	dpFROM
	bne	]lp
	inc	dpFROM+1
	bne	]lp

sendCRS1	lda	#chrRETURN	; yes, add a final CR
	jsr	sendCharacter

sendError	rts

*---------- Send serial character

sendCharacter
	pha

]lp	jsr	checkOutputReady
	bcc	sensSC1
	pla
	sec
	rts

sensSC1	pla
	ldx	#CN
	ldy	#N0
	jsr	dowrite
	clc
	rts
	
*---------- Receive string

receiveString
	ldx	#>responseBUF
	ldy	#<responseBUF
	sty	dpTO
	stx	dpTO+1

	ldy	#0
receiveSTR1	phy
]lp	jsr	checkInputReady
	bcs	receiveSTR9

	ldx	#CN
	ldy	#N0
	jsr	doread
	cpx	#0
	bne	receiveSTR9

	ply
	sta	(dpTO),y
	cmp	#chrRETURN
	beq	receiveSTR8
	iny
	bne	receiveSTR1
receiveSTR8	clc
	rts
receiveSTR9	ply
	sec
	rts

*-----------------------------------
* DATA
*-----------------------------------

*---------- Serial data

strED	asc	01'ED'00	; *Don't echo output
strBE	asc	01'BE'00	; *Input buffering: on
str12B	asc	01'12B'00	; *Baud rate: 4800 BPS
str0D	asc	01'0D'00	; *Data/Stop bits: 8/1
str0P	asc	01'0P'00	; *Parity: none
str0N	asc	01'0N'00	; Line length: 0
strAD	asc	01'AD'00	; *Do not implement basic tabs
strCD	asc	01'CD'00	; *Disable line formatting
strXD	asc	01'XD'00	; *Ignore XOFF
strFD	asc	01'FD'00	; *Disable keyboard input
strLD	asc	01'LD'00	; Do not add line feeds after CR
strME	asc	01'ME'00	; Mask line feed in
strZ	asc	01'Z'00	; *Suppress control characters

*---------- Laserdisc

	ds	\
	
responseBUF	ds	256	; LD player response
	
*-----------------------------------
* END OF CODE
*-----------------------------------

