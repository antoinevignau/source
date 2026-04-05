*
* ROMDISK internal driver
* (c) Brutal Deluxe Software, 2016
* for Plamen and his magic fingers!
*
* v0.1 - 11/JUL/2016
*  - Start of code
*  - No support for extended commands
*
* v0.9 - 14/JUL/2016
*  - All code done
*  - Support for extended commands
*  - Code is <$200 bytes, 1st block at $800
*    we leave room for expansion, that's safer
*  - Added some values for the GS/OS to use
*    that will prevent bad usage
*
* v1.0 - 7/DEC/2016
*  - Reactivating the write options
*

               mx    %11
               org   $f00000
               lst   off

*----------------------------

*---------- Blah-blah
*
* A block device must answer to the following calls
* either in standard or extended mode:
*  - $00/$40: Status
*  - $01/$41: ReadBlock
*  - $02/$42: WriteBlock
*  - $03/$43: Format
*  - $04/$44: Control
*  - $05/$45: Init
*
* Memory organization:
*  - $F0/0800: block $  0 (   0)
*  - $F1/0000: block $ 7C ( 124)
*  - $F2/0000: block $ FC ( 252)
*  - $F7/0000: block $37C ( 892)
*  - $F7/FE00: block $3FB (1019)
*
*----------

*---------- Equates

cmdSTATUS      =     $00
cmdREADBLOCK   =     $01
cmdWRITEBLOCK  =     $02
cmdFORMAT      =     $03
cmdCONTROL     =     $04
cmdINIT        =     $05
cmdEXT         =     %01000000          ; extended command
maskEXT        =     %10111111          ; mask for extended command

ptrROMDISK     =     $f00000            ; static ROM disk address
eqFBLOCK       =     ptrROMDISK+$0800   ; address of first block
maxBLOCK       =     $3FB               ; latest block number
eqNBBLOCKS     =     $3FC               ; number of blocks
blockSIZE      =     $200               ; a block is 512 bytes

spBUFFER       =     $42                ; $42 (3)
spCMD          =     spBUFFER+3         ; $45 (1)
spPCOUNT       =     spCMD+1            ; $46 (1)
spBUF24        =     spPCOUNT+1         ; $47 (1) - always 0
spBLOCK        =     spBUF24+1          ; $48 (4)
spSTATUS       =     spBLOCK            ; $48 (1)
spCONTROL      =     spBLOCK            ; $48 (1)
spERROR        =     spBLOCK+8          ; $50 (1)
spLENGTH       =     spERROR+1          ; $51 (2)
fgEXT          =     spLENGTH           ; $51 (1) bit 7 = 1 : extended command

noERR          =     $00                ; no error
badcmdERR      =     $01                ; A nonexistent command was issued
badpcntERR     =     $04                ; A bad call parameter count was given
badctlERR      =     $21                ; The control or status code is not supported
badctlparmERR  =     $22                ; The control list contains invalid information
ioERR          =     $27                ; I/O error
ibnERR         =     $2D                ; Illegal block number

*----------------------------
*---------- Code (entry in 8-bit)

               asc   "ROMDISK"          ; Signature
               jmp   entryPOINT         ; +7

firstBLOCK     adrl  eqFBLOCK           ; +A
nbBLOCKS       dw    eqNBBLOCKS         ; +E
               ds    16                 ; reserved for future expansion

*---

               mx    %11

entryPOINT     lda   spCMD              ; Support 0-5 commands
               and   #maskEXT           ; mask ext cmd
               cmp   #cmdINIT+1
               bcc   doCMD
               lda   #badcmdERR         ; unsupported command
               sec
               rtl

doCMD          phb                      ; save bank
               phk                      ; we are in $F0 now
               plb

               lda   spCMD              ; get the command
               tax                      ; save it
               and   #cmdEXT            ; is it an ext cmd?
               asl                      ; put result in bit 7
               sta   fgEXT              ; save it for later use

               txa                      ; restore the command
               and   #maskEXT           ; mask bit 6
               asl                      ; *2
               tax                      ; execute
               jsr   (tblCMD,x)         ; execute it

               sta   spERROR            ; return error code
               stx   spLENGTH           ; set the number of
               sty   spLENGTH+1         ; bytes returned
               plb
               rtl

*--- Table of commands

tblCMD         da    doSTATUS
               da    doREADBLOCK
               da    doWRITEBLOCK
               da    doFORMAT
               da    doCONTROL
               da    doINIT

*----------------------------
*---------- The driver commands

*----------------------------
*---------- Status

               mx    %11

doSTATUS       =     *
               jsr   checkST            ; Check parms
               bcc   doSTATUS1
               rts
doSTATUS1      asl                      ; execute command
               tax
               jsr   (tblSTATUS,x)
               rts

*--- Table of status pointers

tblSTATUS      da    statcmd00
               da    statcmd01
               da    statcmd02
               da    statcmd03

*---

statcmd00      =     *                  ; Return device status
               jsr   DIBpart1           ; return DIB part one
               lda   #noERR             ; and return
               tay                      ; x is set by DIBpart1
               clc
               rts

*---

statcmd01      =     *                  ; Return device control block
statcmd02      =     *                  ; Return newline status (char devices only)
               lda   #badctlERR
               ldx   #0
               txy
               sec
               rts

*---

statcmd03      =     *                  ; Return device information block
               jsr   DIBpart1           ; return DIB part one
               jsr   DIBpart2           ; return DIB part two

               ldx   #4+21              ; part 1 + part 2
               lda   fgEXT              ; is it an extended call?
               bpl   statcmd0399
               inx
statcmd0399    lda   #noERR             ; and return
               tay
               clc
               rts


*--- DIBpart1 returns status and number of blocks

DIBpart1       =     *                  ; Return DIB part 1
*- bit 7: 1 = block device
*- bit 6: 1 = write allowed
*- bit 5: 1 = read allowed
*- bit 4: 1 = device online or disk in drive
*- bit 3: 1 = format allowed
*- bit 2: 0 = media is write protected
*- bit 1: 0 = device is currently not interrupting
*- bit 0: 0 = device is currently not open (char devices only)

               ldx   #4                 ; number of bytes to return
               lda   #%1111_1000        ; General status byte
               sta   [spBUFFER]
               ldy   #1                 ; Number of blocks
               lda   nbBLOCKS
               sta   [spBUFFER],y
               iny
               lda   nbBLOCKS+1
               sta   [spBUFFER],y
               iny
               lda   #0
               sta   [spBUFFER],y

               iny
               lda   fgEXT              ; is it an extended call?
               bpl   DIBpart19
               inx                      ; number of bytes to return
               lda   #0                 ; yes, store another 0
               sta   [spBUFFER],y
DIBpart19      rts

*--- DIBpart2 returns the rest of the DIB

DIBpart2       =     *
               ldx   #0                 ; return the rest
]lp            lda   DIBdata,x          ; DIB fields
               sta   [spBUFFER],y
               iny
               inx
               cpx   #DIBdata2-DIBdata
               bne   ]lp
               rts

*----------------------------
*---------- ReadBlock (from ROMdisk to memory)

               mx    %11

doREADBLOCK    =     *
               jsr   checkRW
               bcc   doREAD1
               rts

doREAD1        rep   #$30               ; from ROM to RAM
               ldx   #blockSIZE-2
]lp            txy
doREAD2        ldal  eqFBLOCK,x
               sta   [spBUFFER],y
               dex
               dex
               bpl   ]lp

*---

doRWEND        sep   #$30               ; exit with no error
               lda   #noERR
               ldx   #<blockSIZE
               ldy   #>blockSIZE
               clc
               rts

*----------------------------
*---------- WriteBlock (from memory to ROMdisk)

               mx    %11

doWRITEBLOCK   =     *
               jsr   checkRW            ; Check common parms
               bcc   doWRITE1
               rts

doWRITE1       rep   #$30               ; from RAM to ROM
               ldy   #blockSIZE-2
]lp            tyx
               lda   [spBUFFER],y
doWRITE2       stal  eqFBLOCK,x
               dey
               dey
               bpl   ]lp

               jmp   doRWEND            ; exit

*--- CheckRW (check common parms)

               mx    %11

checkRW        =     *
               lda   spPCOUNT           ; Check pcount
               cmp   #$03
               beq   checkRW1

               lda   #badpcntERR
checkRWERR     ldx   #0
               txy
               sec
               rts

*- Check block number

checkRW1       lda   spBLOCK+2          ,
               beq   checkRW3           ; must be zero

checkRW2       sep   #$20               ; restore 8-bit A
               lda   #ibnERR
               bne   checkRWERR

checkRW3       rep   #$20               ; block number
               lda   spBLOCK
               cmp   nbBLOCKS
               bcs   checkRW2           ; must be <$3FC

*- Calculate block address in ROMDISK

               asl                      ; *2
               clc                      ; add pointer of block 0
               adc   firstBLOCK+1
               sta   doREAD2+2          ; save for read & write
               sta   doWRITE2+2

               sep   #$20               ; return
               clc
               rts

*----------------------------
*---------- Control

               mx    %11

doCONTROL      =     *
               jsr   checkST            ; Check parms
               bcc   doCONTROL1
               rts
doCONTROL1     asl                      ; execute command
               tax
               jsr   (tblCONTROL,x)
               rts

*--- Table of control pointers

tblCONTROL     da    contcmd00
               da    contcmd01
               da    contcmd02
               da    contcmd03

*---

contcmd00      =     *                  ; resets the device
contcmd01      =     *                  ; sets device control block
               lda   #noERR
               tax
               tay
               clc
               rts

contcmd02      =     *                  ; sets newline status (char devices only)
contcmd03      =     *                  ; services device interrupt
               lda   #badctlERR
               bne   checkSTERR

*--- checkST (check common parms)

checkST        =     *
               lda   spPCOUNT           ; Check pcount
               cmp   #$03
               beq   checkST1

               lda   #badpcntERR
checkSTERR     ldx   #0                 ; zero bytes returned
               txy
               sec
checkST2       rts

checkST1       lda   spSTATUS           ; Check status/command code
               cmp   #$04               ; 0-3 supported
               bcc   checkST2           ; we're good

               lda   #badctlparmERR
               bne   checkSTERR

*----------------------------
*---------- Format & Init

               mx    %11

doFORMAT       =     *
doINIT         =     *
               lda   #noERR
               ldx   #0
               txy
               clc
               rts

*----------------------------
*--- My DIB

DIBdata        hex   07                 ; ID string length
               asc   'ROMDISK'          ; ID string
               asc   '         '        ; ...on 16 bytes
               hex   00                 ; device type byte
               hex   C0                 ; device subtype byte
               dw    $0100              ; version word
DIBdata2       =     *

*--- Internal signature

               asc   0d
               asc   'Antoine Vignau & Olivier Zardini'0d
               asc   'Brutal Deluxe Software, 2016'
               asc   0d

               ds    \

