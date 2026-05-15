*
* QuickTake Protocol Test
*

	mx	%00
	org	$1000
	lst	off

*-------------------------------------------------

	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Util.Macs
	
*-------------------------------------------------

	clc
	xce
	rep	#$30
	
	lda	#0
	tax
	tay
	sep	#$30

	jsr	call0	; init all
	
	bit	call1	; say hello
	bit	call2	; turn even parity on before calling
	bit	call3	; get information

	bit	call4	; à la manière de dandumontp
	bit	shutDown
	
	sec
	xce
	sep	#$20
	rts

*----------- Init me

call0	jsr	init
	jsr	raisedtr
	
	ldy	#4
	jsr	setspeed

	lda	#0
	jmp	wait

*----------- Say hello

call1	ldx	#0
]lp	jsr	receive
	sta	response1,x
	inx
	cpx	#response1end-response1
	bne	]lp
	
	ldx	#0
]lp	lda	answer1,x
	jsr	send
	inx
	cpx	#answer1end-answer1
	bne	]lp

	ldx	#0
]lp	jsr	receive
	sta	response2,x
	inx
	cpx	#response2end-response2
	bne	]lp
	rts

*---

response1	ds	7
response1end

answer1	hex	5A,A5,55,05,00,00,25,80,00,80,02,00,80
answer1end

response2	ds	10
response2end

*----------- Separator (change parity in the control panel before call)

call2	ldx	#0
]lp	lda	str3,x
	jsr	send
	inx
	cpx	#str3end-str3
	bne	]lp

	jsr	receive
	jsr	$fdda
	rts

*---

str3	hex	16,00,00,00,00,00,00
str3end	

*----------- Get camera information

call3	ldx	#0
]lp	lda	str4,x
	jsr	send
	inx
	cpx	#str4end-str4
	bne	]lp

	ldx	#0
]lp	jsr	receive
	sta	response3,x
	inx
	cpx	#response3end-response3
	bne	]lp
	rts
	
*---

str4	hex	16,28,00,30,00,00,00,00,00,80,00
str4end

response3	ds	128
response3end

*----------- A la manière de dandumontp (parité paire)

call4	lda	#5
	jsr	send

	jsr	receive
	jmp	$fdda
	
*-------------------------------------------------
* GS Port Driver Bios -- Slot #2
*
* written by Andy Nicholas on July 26, 1987
*
* History:
*
* Modified to use an 16k buffer May, 1991 by andy
*-------------------------------------------------

cr       equ   $0d
lf       equ   $0a

initstr  equ   $11d0
ansstr   equ   $11c0
cdbyte   equ   $11bf

*--------

	hex	20	;serial card slot * 16
initspd	dfb	5
callspd	dfb	0	; speed of call

bytcnt   dfb   0,0,0

	jmp	init
	jmp	ringset
	jmp	ring
	jmp	answerRing
	jmp	hangup
	jmp	inp
	jmp	out
	jmp	getcarr
	jmp	setspeed
	jmp	raisedtr
	jmp	flush      ;mdmFlush
	jmp	shutDown   ;shutdown

*-------------------------------------------------
* init the serial port pascal locations

init     lda   $c20d      ;get init address
         sta   doinit+1
         lda   $c20e      ;get read address
         sta   doread+1
         lda   $c20f      ;get write address
         sta   dowrite+1
         lda   $c210      ;get status address
         sta   dostatus+1
         lda   $c212
         sta   doext+1

         lda   #<GetOutBuffer
         ldx   #>GetOutBuffer
         ldy   #0
         jsr   doext

         lda   #<GetInBuffer
         ldx   #>GetInBuffer
         ldy   #0
         jsr   doext

         clc
         xce
         rep   #$30
         mx    %00

         pha
         pea   $1000      ;type 1, application, auxID = 0
         _GetNewID
         pla
         sta   OurID

         pha
         pha
         pea   0
         pea   $4000      ;want 16k
         pha              ;our user id
         pea   $c018      ;locked, fixed, NO special memory, noCross
         pea   0          ;(if we use special memory, acos gets clobbered)
         pea   0          ;no fixed location
         _NewHandle
         bcc   :good

         pla
         pla
         lda   #$eaea     ;put no-ops over the input buffer change
         sta   patchIn    ;JSR if we couldn't get any memory
         sta   patchIn+1
         bra   :done

:good    pla
         sta   0          ;get the handle
         sta   OurHandle
         pla
         sta   2
         sta   OurHandle+2

         lda   [0]        ;deref the handle and put the address
         tax
         ldy   #2
         lda   [0],y
         sta   In_Buf+4+2
         stx   In_Buf+4

         lda   #$4000     ;how big, 16k
         sta   In_Buf+8

         mx    %11
:done    sec
         xce
         rts

*-------------------------------------------------
* shutDown -- reset the port buffer to its old buffer size and
*             address, and kill the memory we allocated for the 16k
*             buffer which we used.
*
*             We do this for both the input and output buffers

shutDown
         ldx   #5         ;move 6 bytes
:loop    lda   GetOutBuffer+4,x
         sta   Out_Buf+4,x
         dex
         bpl   :loop

         ldx   #5         ;move 6 bytes
:loop2   lda   GetInBuffer+4,x
         sta   In_Buf+4,x
         dex
         bpl   :loop2

         lda   patchIn    ;did the allocate succeed?
         cmp   #$ea       ;if this is patched out, it didn't so don't
         beq   :noInputBuffer ;reset the input buffer and dispose memory

         lda   #<In_Buf   ;reset the input buffer
         ldx   #>In_Buf
         ldy   #0
         jsr   doext

         clc
         xce
         rep   #$30
         mx    %00

         lda   OurHandle+2
         pha
         lda   OurHandle
         pha
         _DisposeHandle

         mx    %11
         sec
         xce

:noInputBuffer

         lda   #<Out_Buf  ;reset the input buffer
         ldx   #>Out_Buf
         ldy   #0
         jmp   doext

*-------------------------------------------------
* input data

receive
inp      phx              ;save x
         phy
         ldx   #$c2       ;are we ready?
         ldy   #$20
         lda   #1
         jsr   dostatus
         bcc   inp2       ;nope, exit

         ldx   #$c2       ;yes, read
         ldy   #$20
         jsr   doread

         sec
         ply
         plx              ;restore & return
         rts

inp2     lda   #0
         clc
         ply
         plx              ;restore & return
         rts

*-------------------------------------------------
* Check for carrier using Get_Port_Stat routine

getcarr  phx
         phy

         lda   #Carrlist
         ldx   #>Carrlist
         ldy   #0
         jsr   doext

         lda   carrbits
         and   cdbyte
         beq   inp2       ;do a dirty and use common exit routines

         sec
         ply
         plx              ;restore & return
         rts

*-------------------------------------------------
* raise dtr

raisedtr lda   #0
         phx
         phy

         jsr   gsdtr

         ply
         plx              ;restore & return
         rts

*-------------------------------------------------
* output data

send
out      phx              ;save x
         phy              ;save y
         pha              ;save a

out1     ldx   #$c2       ;ready for send?
         ldy   #$20
         lda   #$00
         jsr   dostatus
         bcc   out1       ;nope

         pla              ;get a
         ldx   #$c2
         ldy   #$20
         jsr   dowrite    ;send it

         ply
         plx              ;restore & return
         rts

*-------------------------------------------------
* setup for call

ringset  jsr   hangup

         lda   #0         ;let modem reset
         jsr   wait
         jsr   wait

         lda   #$00
         jsr   gsdtr

         ldy   initspd    ;set init speed
         jsr   setspeed

         lda   #0         ;slight delay (let modem do init)
         jsr   wait

         ldx   #$FF
rset2    inx              ;do pre-inc
         lda   initstr,x  ;get modem init string
         beq   rset3      ;we are done

         jsr   out        ;output
         bra   rset2      ;loop (Z-bit set after wait)

rset3    ldx   #6
         stx   count

rset4    ldy   #$FF
rset5    dey
         beq   decount

         jsr   inp
         bcc   rset5
         and   #$7f
         cmp   #'0'       ;check for "0" result
         beq   leave
         jmp   rset5

decount  dex
         bne   rset4
         dec   count
         bne   rset4
         jmp   ringset

leave    jsr   inp        ;grab the <cr> off the tail end of the "0"
         bcc   leave

         jsr   flush

         lda   #0
         sta   bytcnt     ;reset byte counter
         sta   bytcnt+1
         sta   bytcnt+2
         clc
         rts              ;return

*-------------------------------
* test for a ring and handle it

ring     jsr   inp        ;check for a char
         bcc   noRing     ;nope...

         and   #$7f       ;strip high
         cmp   #'2'       ;is it a 'ring'? (numeric)
         bne   notRing    ;nope, check for connect messages

********************************
grabCR   jsr   inp        ;grab the <cr> off the tail end of the "2"
         bcc   grabCR

answerRing jsr answer     ;the phone rang, so send 'ATA'

noRing   clc
         rts

********************************
notRing
         cmp   #'1'       ;is it a '1' or '10' or '11' or '12' or '14'?
         beq   gotCode    ;yes, save it
         cmp   #'5'       ;is it connect 1200?
         bne   noRing     ;nope

gotCode  sta   code

secondChar jsr inp        ;second character will ALWAYS be there
         bcc   secondChar

         and   #$7f       ;strip high
         cmp   #cr        ;but might be a <cr>
         bne   multiCode

********************************
singleCode ldy #0         ;connect 300?
         lda   code
         cmp   #'1'
         beq   ring3

         iny
         cmp   #'5'       ;connect 1200?
         beq   ring3      ;nope, unknown code, keep checking
         jmp   noRing

********************************
multiCode
         sta   code+1

         lda   code       ;get the first code char
         cmp   #'1'       ;must be a one
         bne   noRing     ;if not, then keep trying

         ldx   #rCodesEnd-rCodes-1
         lda   code+1
:loop    cmp   rCodes,x
         beq   :bingo
         dex
         bpl   :loop
         jmp   noRing

:bingo   lda   sCodes,x
         tay
ring3    jsr   setspeed   ;set the correct speed

         ldy   #5
ring4    lda   #0         ;let carrier's settle
         jsr   wait
         dey
         bne   ring4

         jsr   flush      ;remove any garbage
         sec              ;we have a connection!
         rts

*-------------------------------
* clear the input buffer

flush
         phx
         phy

         lda   #Flush_List
         ldx   #>Flush_List
         ldy   #0
         jsr   doext

         ply
         plx
         rts

*-------------------------------------------------
* set DTR on GS Serial Port, and hangup if needed

hangup   lda   #$80       ;blow 'em off (hangup)
gsdtr    sta   DTRstate

         lda   #DTR_List
         ldx   #>DTR_List
         ldy   #0
         jmp   doext

*-------------------------------------------------
* wait routine

wait     sec              ;from apple ][+ ref man - pg 147
wait2    pha
wait3    sbc   #1
         bne   wait3
         pla
         sbc   #1
         bne   wait2
         rts

*-------------------------------------------------
* send ata to phone

answer   lda   #$80
         jsr   wait

         ldx   #$ff
answer2  inx
         lda   ansstr,x   ;get text
         beq   answer3    ;we are done

         jsr   out        ;send it
         bra   answer2

answer3  rts

*-------------------------------------------------
* set the rs-232 speed, speed offset in Y
*
* 0 =   300 baud
* 1 =  1200 baud
* 2 =  2400 baud
* 3 =  4800 baud
* 4 =  9600 baud
* 5 = 19200 baud
*-------------------------------------------------

setspeed phx
         phy

         lda   #1         ;find caller speed (x300)
         sta   callspd
         cpy   #0         ;at 300?
         beq   Do_Baud    ;yep

         asl   callspd    ;speed = speed * 2
setspeed2 asl  callspd    ;speed = speed * 2
         dey
         bne   setspeed2  ;loop until correct speed found

Do_Baud  pla              ;get y-reg
         asl   a
         tay
         lda   baudAddresses,y
         sta   Baudread+1
         lda   baudAddresses+1,y
         sta   Baudread+2

SetBaud  ldx   #$c2
         ldy   #$20
         jsr   doinit

         lda   #$01       ;firmware attention character
         jsr   out

         ldx   #0
Baudread lda   $ffff,x
         pha
         jsr   out
         pla
         cmp   #'B'       ;finish -after- we get a 'B'
         beq   Fin_Init
         inx
         bra   Baudread

Fin_Init ldx   #0
Init_Loop lda  Port_Init,x
         beq   doneBaud
         jsr   out
         inx
         bra   Init_Loop

doneBaud
         ldx   #5
:loop    lda   OutDefaults,x
         sta   Out_Buf+4,x
         dex
         bpl   :loop

         lda   #<Out_Buf
         ldx   #>Out_Buf
         ldy   #0
         jsr   doext

patchIn  jsr   inbuff     ;set the input buffer, can be self-modified

         plx
         rts

********************************
baudAddresses
         da    Baud300
         da    Baud1200
         da    Baud2400
         da    Baud4800
         da    Baud9600
         da    Baud19200

inbuff
         lda   #<In_Buf   ;reset the input buffer
         ldx   #>In_Buf
         ldy   #0
         jmp   doext

*-------------------------------------------------
* globals

doinit   jmp   $c200
doread   jmp   $c200
dowrite  jmp   $c200
dostatus jmp   $c200
doext    jmp   $c200

rCodes   asc   '0'        ;2400
         asc   '1'        ;4800
         asc   '2'        ;9600
         asc   '4'        ;19200
         asc   '5'        ;1200/ARQ
         asc   '6'        ;2400/ARQ
         asc   '7'        ;9600/ARQ
rCodesEnd

sCodes   dfb   2          ;2400
         dfb   3          ;4800
         dfb   4          ;9600
         dfb   5          ;19200
         dfb   1          ;1200/ARQ
         dfb   2          ;2400/ARQ
         dfb   4          ;9600/ARQ

OurID    ds    2
OurHandle ds   4
count    db    0
code     ds    2          ;2 byte code returned by modem

Baud300  asc   '6B'
Baud1200 asc   '8B'
Baud2400 asc   '10B'
Baud4800 asc   '12B'
Baud9600 asc   '14B'
Baud19200 asc  '15B'

Port_Init
         hex   01
         asc   '0D'       ;8 bits
         hex   01
         asc   '2P'       ;no parity
         hex   01
         asc   'AD'       ;auto-tabbing
         hex   01
         asc   'XD'       ;no xoff recognition
         hex   01
         asc   'FD'       ;no find keyboard
         hex   01
         asc   'CD'       ;no column overflow
         hex   01
         asc   'ED'       ;echo disabled
         hex   01
         asc   'MD'       ;no lf masking
         hex   01
         asc   'BE'       ;buffering enabled
         hex   01
         asc   'Z'
         hex   00

*-------------------------------------------------
* These get copied to Out_Buf

OutDefaults
         adrl  buffer
         dw    3

*-------------------------------------------------
GetOutBuffer
         hex   04
         hex   11
         dw    0          ;result
         ds    4          ;address
         dw    0          ;length

*-------------------------------------------------
Out_Buf  hex   04         ;Parameters to set the
         hex   13         ;Output buffer
         da    0
         adrl  buffer     ;Buffer it where
         dw    3          ;buffer 3 bytes

*-------------------------------------------------
GetInBuffer
         hex   04
         hex   10
         dw    0          ;result
         ds    4          ;address
         dw    0          ;length

*-------------------------------------------------
In_Buf   hex   04         ;Parameters to set the
         hex   12         ;Output buffer
         da    0
         adrl  buffer     ;Buffer it where (modified later)
         dw    $4000      ;buffer 16k

*-------------------------------------------------
Carrlist hex   03         ;Parameter list for
         hex   06         ;detecting carrier drop
         da    0
carrbits da    0          ;Carrier

*-------------------------------------------------
DTR_List hex   03         ;Parameter list for
         hex   0b         ;setting DTR
         da    0
DTRstate da    0          ;bit

*-------------------------------------------------
Flush_List hex 02         ;parameter list for flushing input queue
         hex   14
         da    0

buffer   ds    3


