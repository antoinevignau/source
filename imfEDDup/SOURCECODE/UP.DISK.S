*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*---------------------------

dpNIBBLE27   =     $f2
tempFILE     =     $f3
dpSECTORS    =     $f4
dpPTR        =     $f5
dpBUFFER     =     $f6            ; word
dpNIBBLE     =     $f8

*----------------------------
* THE DISK COPY PART
*----------------------------

* V2.1: calc free blocks
doDSK        jsr   showFREE       ; calc free blocks
             jsr   checkDSK525    ; calc required blocks
             bcs   doDSK1         ; handle fgOVERWRITE

             jsr   doFILE

             lda   fileNAME       ; empty filename
             bne   doDSK2
             sec
doDSK1       jmp   theEND
*doDSK1 jsr BELL
* jmp mainLOOP

doDSK2       jsr   resetSTEP      ; only full track copy
             jsr   initEDD

*---------- Guess format or not?

             ldx   #16-1
]lp          lda   INTERDOS,x
             sta   tblDSKinter,x
             dex
             bpl   ]lp

             lda   fgGUESS
             bne   doDSK3

             jmp   doDSKfound

*---------- Read first track

doDSK3       jsr   MTRON

             lda   #>L4000
             sta   dpPTR

             lda   STARTTRK
             jsr   ARMV
             jsr   showPHASE
             jsr   dskTRACK

             jsr   MTROFF

*---------- Analyze it

doDSKanal    ldx   #8-1
]lp          lda   L4000,x
             cmp   TAGDOS,x
             bne   notDOS33
             dex
             bpl   ]lp

             jmp   doDSKfound

notDOS33     ldx   #8-1
]lp          lda   L4000,x
             cmp   TAGPRODOS,x
             bne   notPRODOS1
             dex
             bpl   ]lp

             jmp   foundPRODOS

notPRODOS1   ldx   #8-1
]lp          lda   L4000,x
             cmp   TAGPRODOS2,x
             bne   notPRODOS2
             dex
             bpl   ]lp

             jmp   foundPRODOS

notPRODOS2   ldx   #8-1
]lp          lda   L4000,x
             cmp   TAGPASCAL,x
             bne   notPASCAL      ; not found really
             dex
             bpl   ]lp

             jmp   foundPRODOS    ; same interleaving as ProDOS

notPASCAL    ldx   #8-1
]lp          lda   L4000,x
             cmp   TAGCPM,x
             bne   doDSKfound     ; assume DOS order
             dex
             bpl   ]lp

foundPRODOS  ldx   #16-1
]lp          lda   INTERPRODOS,x
             sta   tblDSKinter,x
             dex
             bpl   ]lp

             lda   #filePO
             jmp   doDSKok

*---

doDSKfound   lda   #fileDSK
doDSKok      sta   tempFILE
             jsr   createFILE
             bcc   doDSK5

doDSK4       jmp   doDSK9

* V2.1: check free blocks only here
doDSK5       jsr   showFREE       ; calculate free space
             jsr   calcVOLFREE2   ; firstly, check the size of the image
             bcs   doDSK4         ; fgOVERWRITE not taken

*---------- Main copy loop

doDSKLOOP    =     *

             jsr   MTRON          ; motor on

             lda   #>L4000
             sta   dpPTR

]lp          lda   STARTTRK       ; move arm
             jsr   ARMV
             jsr   showPHASE

             jsr   dskTRACK       ; read track

             jsr   K7
             bcs   doDSK9

             lda   dpPTR
             clc
             adc   #$10           ; $1000 bytes more
             sta   dpPTR

             jsr   NTRKCALC       ; calc next track
             sta   STARTTRK

*---------- Exit condition 1: end of disk

             bcs   doDSK7

*---------- Exit condition 2: buffer full

             lda   dpPTR
             cmp   #>LB000        ; until end of buffer
             bcc   ]lp

doDSK7       jsr   MTROFF

             lda   dpPTR
             sec
             sbc   #>L4000
             tay
             lda   tempFILE       ; save Y chunk
             jsr   saveFILE2
             bcs   doDSK9

             lda   CTRK           ; exit condition 1 end
             cmp   ENDTRK         ; means did we read
             bcs   doDSK8         ; the last track?

             jmp   doDSKLOOP      ; we loop

doDSK8       clc                  ; v2.3
doDSK9       php
             jsr   MTROFF
             plp
             jmp   theEND
* jsr BELL
* jmp mainFREE

*----------

INTERDOS     HEX   00070E060D050C04
             HEX   0B030A020901080F

INTERPRODOS  HEX   00080109020A030B
             HEX   040C050D060E070F

*INTERCPM HEX 000B06010C07020D
* HEX 08030E09040F0A05

tblDSKinter  HEX   00070E060D050C04
             HEX   0B030A020901080F

tblDSKptr    ds    16             ; pointers

*----------

TAGDOS       HEX   01A527C909D018A5

TAGPRODOS    HEX   0138B0034C1C0978
TAGPRODOS2   HEX   0138B0034C32A186

TAGPASCAL    HEX   01E060F0034CE308

TAGCPM       HEX   01A527C909D0138A

             ds    \

*----------

dskTRACK     =     *

             ldx   #16-1
             stx   dpSECTORS

             ldy   dpPTR
]lp          tya
             clc
             adc   tblDSKinter,x
             sta   tblDSKptr,x

             dex
             bpl   ]lp

             lda   #<L4000
             sta   dpBUFFER


*----------

* Read header

readHEADER   CLC
readDATA     PHP

             ldx   CSLT

read1        LDA   $C08C,X
             BPL   read1
             lsr
             cmp   #$6A           ; #$D5
             BNE   read1
]lp          LDA   $C08C,X
             BPL   ]lp
             CMP   #$AA
             BNE   read1          ; read2
]lp          LDA   $C08C,X
             BPL   ]lp
             CMP   #$96
             BEQ   doHEADER
             PLP
             BCC   readHEADER
             EOR   #$AD
             BEQ   doDATA
             BNE   readHEADER

* Read header

doHEADER     LDY   #4
]lp          LDA   $C08C,X        ; skip 4*4 vol/track nibbles
             BPL   ]lp
             DEY
             BNE   ]lp

]lp          LDA   $C08C,X
             BPL   ]lp
             ROL
             STA   dpNIBBLE
]lp          LDA   $C08C,X
             BPL   ]lp
             AND   dpNIBBLE
             and   #$0f           ; force if needed...
             PLP

             tax
             lda   tblDSKptr,x
             beq   readHEADER     ; already read ?
             sta   dpBUFFER+1

             lda   #0             ; mark as read
             sta   tblDSKptr,x

             sec
             bcs   readDATA

* Read data

doDATA       LDY   #$56
             lda   #0             ; patch v1.2
doDATA1      STY   dpNIBBLE

]lp          LDY   $C08C,X
             BPL   ]lp
             EOR   LBA96-$96,Y

             LDY   dpNIBBLE
             DEY
             STA   LBC00,Y
             BNE   doDATA1

doDATA2      STY   dpNIBBLE

]lp          LDY   $C08C,X
             BPL   ]lp
             EOR   LBA96-$96,Y
             LDY   dpNIBBLE
             STA   (dpBUFFER),Y
             INY
             BNE   doDATA2

*]lp LDY $C08C,X ; checksum
* BPL ]lp
* EOR LBA96-$96,Y
* beq doNIBBLE0
* jmp readHEADER

* Deniblize

doNIBBLE0    LDY   #$00
doNIBBLE1    LDX   #$56
doNIBBLE2    DEX
             BMI   doNIBBLE1
             LDA   (dpBUFFER),Y
             LSR   LBC00,X
             ROL
             LSR   LBC00,X
             ROL
             STA   (dpBUFFER),Y
             INY
             BNE   doNIBBLE2

             dec   dpSECTORS
             bmi   dskTRACK9

             jmp   readHEADER

dskTRACK9    rts

*---------- Nibble table

* INDEX IN THE NIBBLE TABLE

LBA96        HEX   0001989902039C040506A0A1A2A3A4A5
             HEX   0708A8A9AA090A0B0C0DB0B10E0F1011
             HEX   1213B81415161718191AC0C1C2C3C4C5
             HEX   C6C7C8C9CA1BCC1C1D1ED0D1D21FD4D5
             HEX   2021D822232425262728E0E1E2E3E429
             HEX   2A2BE82C2D2E2F303132F0F133343536
             HEX   3738F8393A3B3C3D3E3F

* ds \

