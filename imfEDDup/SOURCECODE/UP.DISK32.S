*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*---------------------------

LDOS32       =     L4000+$6800

*----------------------------
* THE DISK COPY PART
*----------------------------

doDSK32      jsr   doFILE

             lda   fileNAME       ; empty filename
             bne   ddoDSK2

             sec
             jmp   theEND         ; mainLOOP

ddoDSK2      jsr   resetSTEP      ; only full track copy
             jsr   initEDD

             lda   #fileD13
             jsr   createFILE

*---------- Main copy loop

ddoDSK4      jsr   MTRON          ; motor on

             lda   #>L4000
             sta   dpPTR

]lp          lda   STARTTRK       ; move arm
             jsr   ARMV
             jsr   showPHASE

             jsr   ddskTRACK      ; read track

             jsr   K7
             bcs   ddoDSK9

             lda   dpPTR
             clc
             adc   #$0D           ; $0D00 bytes more
             sta   dpPTR

             jsr   NTRKCALC       ; calc next track
             sta   STARTTRK

*---------- Exit condition 1: end of disk

             bcs   ddoDSK7

*---------- Exit condition 2: buffer full

             lda   dpPTR
             cmp   #>LDOS32       ; until end of buffer
             bne   ]lp

ddoDSK7      jsr   MTROFF

             lda   dpPTR
             sec
             sbc   #>L4000
             tay
             lda   tempFILE       ; save Y chunk
             jsr   saveFILE2
             bcs   ddoDSK9

             lda   CTRK           ; exit condition 1 end
             cmp   ENDTRK         ; means did we read
             bcs   ddoDSK8        ; the last track?

             jmp   ddoDSK4

ddoDSK8      clc
ddoDSK9      php
             jsr   MTROFF
             plp
             jmp   theEND

*ddoDSK9 jsr MTROFF
*
* jsr BELL
* jmp mainFREE

*tblD32inter hex 000A0704010B0805020C090603
tblD32inter  hex   0306090C0205080B0104070A00

             ds    \

*----------

ddskTRACK    =     *

             ldx   #13-1
             stx   dpSECTORS

             ldy   dpPTR
]lp          tya
             clc
             adc   tblD32inter,x
             sta   tblDSKptr,x

             dex
             bpl   ]lp

             lda   #<L4000
             sta   dpBUFFER

*----------

* Read header

dreadHEADER  CLC
dreadDATA    PHP

             ldx   CSLT

dread1       LDA   $C08C,X
             BPL   dread1
             lsr
             cmp   #$6A           ; #$D5
             BNE   dread1
]lp          LDA   $C08C,X
             BPL   ]lp
             CMP   #$AA
             BNE   dread1         ; read2
]lp          LDA   $C08C,X
             BPL   ]lp
             CMP   #$B5
             BEQ   ddoHEADER
             PLP
             BCC   dreadHEADER
             EOR   #$AD
             BEQ   ddoDATA
             BNE   dreadHEADER

* Read header

ddoHEADER    LDY   #4
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
             beq   dreadHEADER    ; already read ?
             sta   dpBUFFER+1

             lda   #0             ; mark as read
             sta   tblDSKptr,x

             sec
             bcs   dreadDATA

* Read data

ddoDATA      LDY   #$9A
             lda   #0             ; patch v1.2
ddoDATA1     STY   dpNIBBLE

]lp          LDY   $C08C,X
             BPL   ]lp
             EOR   LBAAB-$AB,Y

             LDY   dpNIBBLE
             DEY
             STA   LBC00,Y
             BNE   ddoDATA1

LB934        STY   dpNIBBLE
]lp          LDY   $C08C,X
             BPL   ]lp
             EOR   LBAAB-$AB,Y
             LDY   dpNIBBLE
             STA   LBB00,Y
             INY
             BNE   LB934

*LB946 LDY $C08C,X
* BPL LB946
* CMP LBAAB-$AB,Y
* BNE LB963

*-----------
* DENIBBLIZE
*-----------

DENIBBLIZE   LDX   #$32
             LDY   #$00
LB9C5        LDA   LBC00,X
             LSR
             LSR
             LSR
             STA   dpNIBBLE27
             LSR
             STA   dpNIBBLE
             LSR
             ORA   LBB00,X
             STA   (dpBUFFER),Y
             INY
             LDA   LBC00+$33,X
             LSR
             LSR
             LSR
             LSR
             ROL   dpNIBBLE27
             LSR
             ROL   dpNIBBLE
             ORA   LBB00+$33,X
             STA   (dpBUFFER),Y
             INY
             LDA   LBC00+$66,X
             LSR
             LSR
             LSR
             LSR
             ROL   dpNIBBLE27
             LSR
             ROL   dpNIBBLE
             ORA   LBB00+$66,X
             STA   (dpBUFFER),Y
             INY
             LDA   dpNIBBLE
             AND   #$07
LB9FF        ORA   LBB00+$99,X
             STA   (dpBUFFER),Y
             INY
             LDA   dpNIBBLE27
             AND   #$07
             ORA   LBB00+$CC,X
             STA   (dpBUFFER),Y
             INY
             DEX
             BPL   LB9C5

             LDA   LBC00+$99
             LSR
             LSR
             LSR
             ORA   LBB00+$FF
             STA   (dpBUFFER),Y

             dec   dpSECTORS
             bmi   ddskTRACK9

             jmp   dreadHEADER

ddskTRACK9   rts

             ds    \

*---------- Tables are aligned ;-)

* BC9A.BCFF

LBAAB        HEX   00010810180203040506202830070938
             HEX   400A4850580B0C0D0E0F111213141516
             HEX   17191A1B1C1D1E212223246068252670
             HEX   7827808890292A2B2C2D2E2F31323398
             HEX   A034A8B0B8353637393AC0C8D03B3CD8
             HEX   E03EE8F0F8

