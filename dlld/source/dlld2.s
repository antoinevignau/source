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

KBD	=	$c000
KBDSTROBE	=	$c010

HOME	=	$fc58
COUT	=	$fded

*-----------------------------------
* CODE
*-----------------------------------

	jsr	showME
	jsr	initSERIAL	; set the serial addresses
	jsr	initPORT	; init the serial port for LD support

	jsr	showFRAME

	ldx	#>strSA	; start the player
	ldy	#<strSA
	jsr	sendLDCommand

*---

mainLOOP	
]lp	lda	KBD	; wait for a key
	bpl	]lp
	bit	KBDSTROBE
	sta	$427
	
	ldx	#0	; quelle touche ?
]lp	cmp	tblKEY,x
	beq	foundIT
	inx
	cpx	#19+1
	bcc	]lp
	bra	mainLOOP
foundIT	txa
	asl
	tax
	lda	tblADR,x
	sta	gotoIT+1
	lda	tblADR+1,x
	sta	gotoIT+2
	
gotoIT	jsr	$bdbd
	bcc	doIT

	ldx	#>strRJ	; It's the end!
	ldy	#<strRJ
	jsr	sendLDCommand
	rts

doIT	ldx	#>strFR	; Set frame and search
	ldy	#<strFR
	jsr	sendLDCommand
	bra	mainLOOP

*---

doESC	sec
	rts

*--- Move backwards

doQ	ldx	#>1800	; 1 minute
	lda	#<1800
	bra	doREVERSE
doW	ldx	#>900	; 30 secondes
	lda	#<900
	bra	doREVERSE
doE	ldx	#>300	; 10 secondes
	lda	#<300
	bra	doREVERSE
doR	ldx	#>150	; 5 secondes
	lda	#<150
	bra	doREVERSE
doT	ldx	#>90	; 3 secondes
	lda	#<90
	bra	doREVERSE
doA	ldx	#>30	; 30 frames = 1 seconde
	lda	#<30
	bra	doREVERSE
doS	ldx	#>15	; 15 frames
	lda	#<15
	bra	doREVERSE
doD	ldx	#>3	; 3 frames
	lda	#<3
	bra	doREVERSE
doF	ldx	#>1	; 1 frame
	lda	#<1

doREVERSE	sta	theINDEX

	clc
	xce
	rep	#$30
	
	lda	theFRAME
	sec
	sbc	theINDEX
	beq	revONE
	bpl	revOK
revONE	lda	#1
revOK	sta	theFRAME

	pha
	lda	#'00'
	sta	strFRAME
	sta	strFRAME+2
	sta	strFRAME+3
	PushLong	#strFRAME
	PushWord	#5
	PushWord	#0
	_Int2Dec

	sec
	xce
	sep	#$30
	clc
	rts

*--- Move forwards

doY	ldx	#>90	; 3 secondes
	lda	#<90
	bra	doFORWARD
doU	ldx	#>150	; 5 secondes
	lda	#<150
	bra	doFORWARD
doI	ldx	#>300	; 10 secondes
	lda	#<300
	bra	doFORWARD
doO	ldx	#>900	; 30 secondes
	lda	#<900
	bra	doFORWARD
doP	ldx	#>1800	; 1 minute
	lda	#<1800
	bra	doFORWARD
doH	ldx	#>1	; 1 frame
	lda	#<1
	bra	doFORWARD
doJ	ldx	#>3	; 3 frames
	lda	#<3
	bra	doFORWARD
doK	ldx	#>15	; 15 frames
	lda	#<15
	bra	doFORWARD
doL	ldx	#>30	; 30 frames
	lda	#<30

doFORWARD	sta	theINDEX
	stx	theINDEX+1

	clc
	xce
	rep	#$30
	
	lda	theFRAME
	clc
	adc	theINDEX
	bcc	ffOK
	lda	#65535
ffOK	sta	theFRAME

	pha
	lda	#'00'
	sta	strFRAME
	sta	strFRAME+2
	sta	strFRAME+3
	PushLong	#strFRAME
	PushWord	#5
	PushWord	#0
	_Int2Dec

	sec
	xce
	sep	#$30
	clc
	rts

*---

showFRAME	ldx	#>strDS	; on veut la frame number
	ldy	#<strDS
	jsr	sendLDCommand
	clc
	rts

*--- Data

strDS	asc	'1DS'00	; display frame number
strCO	asc	'CO'00	; close the door
strSA	asc	'SA'00	; start player
strRJ	asc	'RJ'00	; stop the player

strFR	asc	'FR'	; set frame...
strFRAME	asc	'00001'
	asc	'SE'00	; ...and search

*---

theINDEX	dw	0	; variation en nombre de frames
theFRAME	dw	1	; the frame number (1.65535)

tblKEY	asc	9B"V"
	asc	"QWERTYUIOP"	; 
	asc	"ASDFHJKL"
	
tblADR	da	doESC	; 0
	da	showFRAME	; 1
	da	doQ	; 2
	da	doW	; 3
	da	doE	; 4
	da	doR	; 5
	da	doT	; 6
	da	doY	; 7
	da	doU	; 8
	da	doI	; 9
	da	doO	; 10
	da	doP	; 11
	da	doA	; 12
	da	doS	; 13
	da	doD	; 14
	da	doF	; 15
	da	doH	; 16
	da	doJ	; 17
	da	doK	; 18
	da	doL	; 19

*-----------------------------------
* TEXT
*-----------------------------------

showME	jsr	HOME
	ldx	#>myTEXT
	stx	dpFROM+1
	ldy	#<myTEXT
	sty	dpFROM
	
]lp	lda	(dpFROM)
	beq	showDONE
	jsr	COUT
	inc	dpFROM
	bne	]lp
	inc	dpFROM+1
	bne	]lp
showDONE	rts

*----------

*	asc	"0123456789012345678901234567890123456789"

myTEXT	asc	"DLLD Browser  (c) 2024, Brutal Deluxe > "
	asc	"----------------------------------------"
	asc	8d
	asc	8d
	asc	"<<              Seconds               >>"
	asc	"----------------------------------------"
	asc	"60  30  10  5  3  -  +  3  5  10  30  60"
	asc	" Q   W   E  R  T        Y  U   I   O   P"
	asc	8d
	asc	8d
	asc	"<<               Frames               >>"
	asc	"----------------------------------------"
	asc	"    30  15  3  1  -  +  1  3  15  30    "
	asc	"     A   S  D  F        H  J   K   L    "
	asc	8d
	asc	8d
	asc	"V to show the frame number"8d
	asc	"Press ESC to quit"00
	
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
	ldx	#8
	ldy	#0
	
]lp	phx
	phy

*	lda	#"I"
*	sta	$427
	
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
	ldx	#8
	ldy	#0
	
]lp	phx
	phy

*	lda	#"O"
*	sta	$427
	
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
*	lda	#"S"
*	sta	$426

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
*	lda	#"R"
*	sta	$426

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

