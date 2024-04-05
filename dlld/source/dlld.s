*
* DLLD
* Let's play Dragon's Lair :-)
*
* (c) 2024, Brutal Deluxe Software
*

	mx	%11
	org	$2000
	lst	off

*-----------------------------------
* MACROS
*-----------------------------------

_sendLD	mac
	ldx	#>]1
	ldy	#<]1
	jsr	sendSERIAL
	eom

_receiveLD mac
	ldx	#>]1
	ldy	#<]1
	jsr	receiveSERIAL
	eom

_sendLDCommand mac
	ldx	#>]1
	ldy	#<]1
	jsr	sendLDCommand
	eom

_sendreceiveLD mac
	ldx	#>]1
	ldy	#<]1
	jsr	sendreceiveLD
	eom

_readSTRING	mac
	ldx	#>]1
	ldy	#<]1
	jsr	receiveSERIAL
	eom
	
_sendSTRING	mac
	ldx	#>]1
	ldy	#<]1
	jsr	sendSerialString
	eom

*-----------------------------------
* EQUATES
*-----------------------------------

dpFROM	=	$fc
dpTO	=	dpFROM+2

KBD	=	$c000
KBDSTROBE	=	$c010
RDVBLBAR	=	$c019

HOME	=	$fc58
WAIT	=	$fca8
COUT	=	$fded

chrCTRLA	=	$01
chrLINEFEED	=	$0a
chrRETURN	=	$0d
chrSPACE	=	$20

*-----------------------------------
* CODE
*-----------------------------------

	jsr	initSERIAL	; set the serial addresses
	jsr	initPORT	; init the serial port for LD support
	jsr	initLDDS	; show text
	jsr	initLDCO	; close the door
	jsr	initLDSA	; spin the disc
	jmp	initLDPL	; start playing
	jmp	initLDC	; get register C

	jmp	resetSERIAL ; do not activate it when code is light
			; or all commands will not be handled

*-----------------------------------
* LASERDISC
*-----------------------------------

initLDDS	_sendLDCommand #strDS	; 4-28 DISPLAY TEXT
	_sendLDCommand #strAV	; 4-28 DISPLAY TEXT
	rts
initLDCO	_sendLDCommand #strCO	; 4-11 CLOSE
	rts
initLDSA	_sendLDCommand #strSA	; 4-12 START
	rts
initLDPL	_sendLDCommand #strPL	; 4-13 PLAY
	rts
initLDC	_sendLDCommand #strC	; 4-45 $C
	rts

*---------- Send LD command and Receive answer

sendreceiveLD
	jsr	sendSERIAL
	
	nop
	lda	#150
	jsr	WAIT
	nop

	_readSTRING	#responseBUF
	rts

*-----------------------------------
* SERIAL PORT (MODEM)
*-----------------------------------

*---------- Init modem port for LD support

initPORT	jsr	resetSERIAL
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
	jsr	checkSerialInputReady
	rts

*---------- Check serial input is ready

checkSerialInputReady
]lp	lda	#1	; is input ready?
	jsr	statusSERIAL
	beq	checkSIR9

	jsr	readSERIAL	; exit when nothing to read
	bcs	]lp

checkSIR9	rts

*---------- Check the input is ready

checkInputReady
]lp	jsr	getSerialInputStatus
	bne	checkIR1

	lda	#0
	jsr	WAIT
	jsr	WAIT
	
	lda	KBD
	bpl	]lp
	bit	KBDSTROBE
	lda	#1
	rts
checkIR1	lda	#0
	rts

*---------- Get serial output status

getSerialOutputStatus
	lda	#0
	jsr	statusSERIAL
	rts

*---------- Get serial input status

getSerialInputStatus
	lda	#1
	jsr	statusSERIAL
	rts

*---------- Set all addressses

initSERIAL
	lda	$c10d
	sta	resetSERIAL+5
	lda	$c10e
	sta	readSERIAL+5
	lda	$c10f
	sta	writeSERIAL+5
	lda	$c110
	sta	statusSERIAL+5
	rts

*---------- Reset port, restore control panel defaults

resetSERIAL
	ldx	#$c2
	ldy	#$20
	jsr	$c10d
	bcs	resetSER1
	lda	#0	; carry clear, not ready
	beq	resetSER2
resetSER1	lda	#1	; carry set, ready

resetSER2	cpx	#0	; check error code
	beq	resetSER3
	lda	#2	; reset error!
resetSER3	rts

*---------- Wait for and get next character

readSERIAL
	ldx	#$c2	; yes
	ldy	#$20
	jsr	$c10e
	cpx	#0	; carry holds the error
	beq	readSER1	; and A the character
	sec
	hex	24
readSER1	clc
	rts

*---------- Send a LD command

sendLDCommand
	sty	dpFROM
	stx	dpFROM+1

	jsr	checkSerialInputReady
	bne	sendLDC9

	jsr	sendCRString
	bne	sendLDC9
	
	jsr	receiveLDAnswer

sendLDC9	rts

*---------- Send a serial string (it begins with a 1)

sendSerialString
	sty	dpFROM
	stx	dpFROM+1

	lda	#chrCTRLA
	jsr	sendSerialCharacter
	bne	sendCRS9	; on error, jump to the end
			; or goes below to sendCRString

*---------- Send CR string

sendCRString
]lp	lda	(dpFROM)
	beq	sendCRS1	; end of string?
	jsr	sendSerialCharacter
	bne	sendCRS9	; error!

	inc	dpFROM
	bne	]lp
	inc	dpFROM+1
	bne	]lp

sendCRS1	lda	#chrRETURN	; yes, add a final CR
	jsr	sendSerialCharacter
sendCRS9	rts

*---------- Send serial character

sendSerialCharacter
	pha
	
]lp	jsr	getSerialOutputStatus
	bne	sensSC1

	pla
	lda	#1	; return busy
	rts

sensSC1	pla
	jsr	writeSERIAL
	
*---------- Send character

writeSERIAL
	ldx	#$c2
	ldy	#$20
	jsr	$c10f
	cpx	#0
	beq	writeSER1
	ldx	#2
writeSER1	txa
	rts

*---------- Inquire if character has been received

statusSERIAL
	ldx	#$c2
	ldy	#$20
	jsr	$c110
	cpx	#0
	beq	statusSER1
	ldx	#2
statusSER1	txa
	rts

*---------- Receive a LD answer

receiveLDAnswer
	ldx	#>responseBUF
	ldy	#<responseBUF
	jsr	receiveSTRING

	lda	responseBUF
	ora	#$80
	jsr	COUT
	rts

*---------- Receive String

receiveSTRING
	sty	dpTO
	stx	dpTO+1
	
]lp	jsr	checkInputReady
	cmp	#1
	bne	receiveSTR1
	rts

receiveSTR1	jsr	readSERIAL
	bcc	receiveSTR2
	lda	#2
	rts

receiveSTR2	sta	(dpTO)
	cmp	#chrRETURN
	beq	receiveSTR3
	
	inc	dpTO
	bne	]lp
	inc	dpTO+1
	bne	]lp

receiveSTR3	lda	#0
	rts

*---------- Receive string

receiveSERIAL
	sty	dpTO
	stx	dpTO+1

]lp	nop
	nop
	lda	#1
	jsr	statusSERIAL
	bcc	]lp

	nop
	clc
	jsr	readSERIAL
	and	#$7f
	pha
	ora	#$80
	jsr	COUT
	pla
	cmp	#chrSPACE
	bcs	]lp
	rts

	ldy	#0
receiveSER1	phy
]lp	lda	#1	; Do you have input ready?
	jsr	statusSERIAL
	bcc	]lp	; no
	jsr	readSERIAL	; yes, jump below
	ply
	sta	(dpTO),y
	cmp	#chrRETURN
	beq	receiveSER9
	cmp	#chrLINEFEED
	beq	receiveSER9
	iny
	bne	receiveSER1	
receiveSER9	rts

*---------- Send string

sendSERIAL	sty	dpFROM
	stx	dpFROM+1

	ldy	#0
sendSERIAL1	lda	(dpFROM),y
	beq	sendSERIAL9
	phy
	pha

]lp	lda	#0	; Are you ready to accept output?
	jsr	statusSERIAL
	bcc	]lp	; no
	
	pla
	jsr	writeSERIAL
	ply
	iny
	bne	sendSERIAL1	; limit to 256 characters
sendSERIAL9	rts

*-----------------------------------
* DATA
*-----------------------------------

*---------- Serial data

strED	asc	'ED'00	; *Don't echo output
strBE	asc	'BE'00	; *Input buffering: on
str12B	asc	'12B'00	; *Baud rate: 4800 BPS
str0D	asc	'0D'00	; *Data/Stop bits: 8/1
str0P	asc	'0P'00	; *Parity: none
str0N	asc	'0N'00	; Line length: 0
strAD	asc	'AD'00	; *Do not implement basic tabs
strCD	asc	'CD'00	; *Disable line formatting
strXD	asc	'XD'00	; *Ignore XOFF
strFD	asc	'FD'00	; *Disable keyboard input
strLD	asc	'LD'00	; Do not add line feeds after CR
strME	asc	'ME'00	; Mask line feed in
strZ	asc	'Z'00	; *Suppress control characters

*---------- Laserdisc

strDS	asc	'1DS CS'00
strAV	asc	'ANTOINE'00
strCO	asc	'CO'00
strSA	asc	'SA'00
strPL	asc	'PL'00
strC	asc	'$C'00

	ds	\
	
responseBUF	ds	256	; LD player response
	
*-----------------------------------
* END OF CODE
*-----------------------------------

