*         XC
*         TR
*         TR    ADR
*

	mx	%11
	org	$2000
	lst	off

COUT	=	$fded
	
* GS Port Driver Bios
* written by Andy Nicholas on July 26, 1987
*
* History:
*
* 11/07/89 AMW
* 1. History section added
* 2. Checked and or modified for LLUCE
* 3. Section titles added
*
* 11/10/89 AMW
* Added interrupt buffers
*--------------------------
*         rel
*SLOT     KBD   'Slot to assemble for (1/2)'
SLOT	=	2
N0       =     SLOT*16
CN       =     SLOT!$C0
SLTADR   =     SLOT!$C0*256
FLAG     =     SLOT-1

CR       =     $0d
LF       =     $0a

	jsr	INIT
	jsr	SETSPEED
	ldx	#>strSA
	ldy	#<strSA
	jsr	sendSTRING
	jsr	receiveSTRING

	ldx	#>strPL
	ldy	#<strPL
	jsr	sendSTRING
	jsr	receiveSTRING
	rts

receiveSTRING
]lp	jsr	INP
	beq	receive9
	cmp	#CR
	beq	receive9
	ora	#$80
	jsr	COUT
	bra	]lp
receive9	rts
	
sendSTRING	sty	sendstr1+1
	stx	sendstr1+2
	
	ldx	#0
sendstr1	lda	$bdbd,x
	beq	sendstr2
	jsr	OUT
	inx
	bne	sendstr1
	
sendstr2	lda	#CR
	jsr	OUT
	rts

strSA	asc	'SA'00
strPL	asc	'PL'00

*-------------------------------
*-------------------------------

MODEM    DB    N0         ;serial card slot * 16
INITSPD  DB    0          ;init speed for modem
CALLSPD  DB    0          ;Speed of current call

BYTCNT   DB    0,0,0

DOINIT   JMP   SLTADR
DOREAD   JMP   SLTADR
DOWRITE  JMP   SLTADR
DOSTATUS JMP   SLTADR
DOEXT    JMP   SLTADR

* init the serial port pascal locations
*-------------------------------

INIT     LDA   SLTADR+$D  ;get init address
         STA   DOINIT+1
         LDA   SLTADR+$E  ;get read address
         STA   DOREAD+1
         LDA   SLTADR+$F  ;get write address
         STA   DOWRITE+1
         LDA   SLTADR+$10 ;get status address
         STA   DOSTATUS+1
         LDA   SLTADR+$12
         STA   DOEXT+1

         RTS

* input data
*-------------------------------

INP      PHX              ;Save x
         PHY
         LDX   #CN        ;are we ready?
         LDY   #N0
         LDA   #1
         JSR   DOSTATUS
         BCC   :INP2      ;nope, exit

         LDX   #CN        ;yes, read
         LDY   #N0
         JSR   DOREAD

         SEC
:INP1    PLY
         PLX              ;Restore & return
         RTS

:INP2    LDA   #0
         BRA   :INP1

* output data
*-------------------------------

OUT      PHX              ;Save x
         PHY              ;Save y
         PHA              ;Save a

:OUT1    LDX   #CN        ;ready for send?
         LDY   #N0
         LDA   #0
         JSR   DOSTATUS
         BCC   :OUT1      ;nope

         PLA              ;Get a
         LDX   #CN
         LDY   #N0
         JSR   DOWRITE    ;send it

         PLY              ;Get y
         PLX              ;Get x
         RTS

* wait routine
*-------------------------------

WAIT     SEC              ;from apple ][+ ref man - pg 147
:WAIT2   PHA
:WAIT3   SBC   #1
         BNE   :WAIT3
         PLA
         SBC   #1
         BNE   :WAIT2
         RTS

* set the rs-232 speed [speed offset in Y]
*
* 0 =   300 baud
* 1 =  1200 baud
* 2 =  2400 baud
* 3 =  4800 baud
* 4 =  9600 baud
* 5 = 19200 baud
*-------------------------------

SETSPEED LDX   #<B4800
         LDA   #>B4800

:SETBAUD STX   :BAUDRD+1
         STA   :BAUDRD+2

         LDX   #CN
         LDY   #N0
         JSR   DOINIT

         LDX   #0
:BAUDRD  LDA   -1,X
         BEQ   :FINISH
         JSR   OUT
         INX
         BRA   :BAUDRD

:FINISH  LDX   #0
:LOOP    LDA   PORTINIT,X
         BEQ   :DONE
         JSR   OUT
         INX
         BRA   :LOOP

:DONE    LDA   #<OUT_BUF
         LDX   #>OUT_BUF
         LDY   #0
         JSR   DOEXT

         RTS

PORTINIT DB    1
         ASC   '0D'       ;8 bits
         DB    1
         ASC   '0P'       ;no parity
*         db    1
*         asc   '0N'
         db    1
         asc   'LD'
         db    1
         asc   'ME'
         DB    1
         ASC   'AD'       ;auto-tabbing
         DB    1
         ASC   'XD'       ;no xoff recognition
         DB    1
         ASC   'FD'       ;no find keyboard
         DB    1
         ASC   'CD'       ;no column overflow
         DB    1
         ASC   'ED'       ;echo disabled
*         DB    1
*         ASC   'MD'       ;no lf masking
         DB    1
         ASC   'BE'       ;buffering enabled
         DB    1
         ASC   'Z'
         DB    0          ;no more control characters

B4800    DB    1
         ASC   '12B'00    ;accept 4800 Baud

*-------------------------------

OUT_BUF  DB    4          ;Parameters to set the
         DB    $13        ;Output buffer
         DA    0
         ADRL  BUFFER     ;Buffer it where
         DA    2          ;Buffer 2 bytes

*-------------------------------

CARRLIST DB    3          ;Parameter list for
         DB    6          ;detecting carrier drop
         DA    0
CARRBITS DA    0          ;Carrier status here

*-------------------------------

DTRLST   DB    3          ;Parameter list for
         DB    $B         ;setting DTR
         DA    0
DTRSTATE DA    0          ;Bit 7 affects DTR

*-------------------------------

FLUSHLST DB    2          ;parameter list for flushing input queue
         DB    $14
         DA    0

*-------------------------------

BUFFER	ds	256
