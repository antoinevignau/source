*
* ADB Play
*
* (c) 2023, Brutal Deluxe Software
*

* Talk: from a device to the host
* Listen: from the host to a device
*

	mx	%00
	org	$1000
	lst	off

*-----------

dpLISTEN	=	$fc
dpTALK	=	dpLISTEN+2

*-----------

DATAREG	=	$c026
CMDREG	=	DATAREG
KMSTATUS	=	CMDREG+1

* DATAREG bits defined as follows
*    bit 7,6,5,4,3,2,1,0 = data to/from keyboard micro
*
* Data at interrupt time in this register is defined as
*    bit 7= Response byte if set, otherwise status byte
*    bit 6= ABORT valid if set and all other bits reset
*    bit 5= Desktop manager key sequence pressed
*    bit 4= Flush buffer key sequence pressed
*    bit 3= SRQ valid if set
*    bit 2,1,0 If all bits clear then no FDB data valid,
*              else the bits indicate the number of valid
*              bytes received minus 1. (2-8 bytes total)

* KMSTATUS bits defined as follows
*    bit 7= 1 if mouse register full
*    bit 6= mouse interrupt disable/enable
*    bit 5= 1 if data register full
*    bit 4= data interrupt enable
*    bit 3= 1 if key data full  <<<<<------NEVER USE, WON'T WORK
*    bit 2= key data interrupt enable  <<<<<------NEVER USE, WON'T WORK
*    bit 1= 0 = mouse 'X' register data available
*           1 = mouse 'Y' register data available
*    bit 0= Command register full

* UC status (for $C026)

STATUSBIT	=	%1000_0000
ABORTBIT	=	%0100_0000
DESKBIT	=	%0010_0000
FLUSHBIT	=	%0001_0000
SRQBIT	=	%0000_1000

* Keygloo status (for $C027)

DATAFULL	=	%0010_0000
CMDFULL	=	%0000_0001

* ADB commands masks

IDREG	=	%1111_0000
DISSRQ	=	%0111_0000
ENSRQ	=	%0101_0000
TALKCMD	=	%1100_0000

*-----------

	clc
	xce
	rep	#$30
	
	lda	#0	; ensure all high byte is 0
	tax
	tay

	sep	#$20
	jsr	playADB
	
	sec
	xce
	sep	#$30
	rts

	mx	%10	; A=8, XY=16

*-----------

playADB
	bra	play_ok1
	
* LISTEN, REG=1, ADR=7
	lda	#%10010111	; xxrraaaa 10 01 0111
	ldx	#3	; how many bytes to send after command
	ldy	#bufLISTEN	; the data to send
	jsr	SEND
	bcc	play_ok1
	jsr	$FDDA
play_ok1	

* TALK, REG=1, ADR=7
	lda	#%11010111	; xxrraaaa 11 01 0111
	ldx	#4	; how many bytes to receive
	ldy	#bufTALK	; the data to receive
	jsr	RECEIVE
	bcc	play_ok2
	jsr	$FDDA
play_ok2
	rts

	asc 	"--BUFFER--"
bufLISTEN	hex	00,00,00,00,00,00,00,00
bufTALK	hex	00,00,00,00,00,00,00,00

*-----------------------------------
*
* ADB ROUTINES
*
*-----------------------------------

*-----------------------
* SEND - aka LISTEN
* Sends a full command to a device

SEND
	sta	theCOMMAND
	stx	howMANY
	sty	dpLISTEN
	
	jsr	send_command
	bcs	error
	jsr	send_command_string
	bcs	error
	rts

error	inc	$c034
	rts
	
*-----------------------
* RECEIVE - aka TALK
* Receives data from a device

RECEIVE
	sta	theCOMMAND
	stx	howMANY
	sty	dpTALK
	
	jsr	send_command ; send the command
	bcs	error
	
	jsr	read_response
	rts

	ldy	#0	; set up data counter
]lp	jsr	receive_data ; get data
	sta	(dpTALK),y	; save data
	iny
	cpy	howMANY
	bcc	]lp
	rts

*-----------------------
* SEND_COMMAND
* Sends a command to the uC and cleans data reg for response

send_command
	jsr	send_data
	and	#DATAFULL	; test if data reg full (bit 5)
	beq	sc_ret	; if 0, is empty
	
	lda	DATAREG	; read it to clear it
sc_ret	rts

*-----------------------
* SEND_COMMAND_STRING
* Sends any bytes after the initial command byte

send_command_string
	ldy	#0	; set up data counter
	lda	(dpLISTEN),y ; get data
	jsr	send_data	; send data
	bcs	scs_err
	iny
	cpy	howMANY
	bcc	]lp
	clc
scs_err	rts

*-----------------------
* CHECK_PING
* Reads response to if ping flag is set

check_ping
	jsr	read_response
	bcs	cp_err
	clc
cp_err	rts

*-----------------------
* SEND_DATA
* Sends data or command to the uC using the command reg

send_data
	tax		; save off data
	lda	KMSTATUS	; get command reg full bit (bit 0)
	ror		; in carry
	txa		; get data back
	bcs	sd_err	; still full, error

	sta	CMDREG	; store away new command (or data)
	
	ldx	#7500	; time out of 30ms
]lp	dex
	beq	adb_timeout
	lda	KMSTATUS	; get command reg full bit (bit 0)
	ror
	bcs	]lp
sd_err	rts


*-----------------------
* RECEIVE_DATA
* Gets data from the data register
* Assumes the data register does not contain status
*

receive_data
	clc
	ldx	#7500	; time out of 30ms
]lp	dex
	beq	adb_timeout

	lda	KMSTATUS	; get data reg full bit (bit 5)
	and	#DATAFULL	; and test
	beq	]lp	; still full

	lda	DATAREG	; empty, get new data
	rts

*---

adb_timeout	sec
	rts

*-----------------------
* READ_RESPONSE
* Reads a response from a FDB pending command
*

read_response
]lp	jsr	receive_data
	bcs	rr_err	; time out error
	bpl	]lp	; got status byte if bit 7 = 0

*	and	#%0111_1111	; clear response bit
	and	#%0000_0111	; get count
	beq	rr_err	; 0 means error
	tay
	iny		; count+1
]lp	jsr	receive_data ; get data
	bcs	rr_err
	sta	(dpTALK),y	; and save it
	dey
	bne	]lp
	clc
rr_err	rts

*-----------------------
* DATA
*

	asc	" CMD NBR "
theCOMMAND	ds	2
howMANY	ds	2
	ds	4

	asc	"-LISTEN"
ptrLISTEN	ds	16

	asc	"--TALK--"
ptrTALK	ds	16

	dw	$bdbd	; Its's the end!
