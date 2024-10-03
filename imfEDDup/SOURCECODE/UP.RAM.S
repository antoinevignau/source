*
* I'm fEDD up ;-)
*
* (c) 2012-17, Brutal Deluxe Software
*

*----------------------------
* v2.3 - This is where we
* put the memory management
* routines for the IIgs and IIe
*

*----------------------------
* IIGS
*----------------------------

*---------- Init IIgs RAM pointer

iigsINITRAM   =     *

              lda   #<ptrNIB
              sta   iigsTORAM1+1
              sta   iigsFROMRAM1+1
              lda   #>ptrNIB
              sta   iigsTORAM1+2
              sta   iigsFROMRAM1+2
              lda   #^ptrNIB
              sta   iigsTORAM1+3
              sta   iigsFROMRAM1+3
              rts

*---------- Copy from bank 00 to IIgs RAM

iigsTORAM     =     *

              clc                   ; copy $4000 bytes
              xce
              rep   #$30

              ldx   #$4000-2
]lp           lda   L4000,x
iigsTORAM1    stal  $020000,x
              dex
              dex
              bpl   ]lp

              lda   iigsTORAM1+2
              clc
              adc   #$40
              sta   iigsTORAM1+2

              sec
              xce
              sep   #$30
              rts

*---------- Copy from IIgs RAM to bank 00

iigsFROMRAM   =     *

              clc                   ; copy $4000 bytes
              xce
              rep   #$30

              ldx   #$4000-2
iigsFROMRAM1  ldal  $020000,x
              sta   L4000,x
              dex
              dex
              bpl   iigsFROMRAM1

              lda   iigsFROMRAM1+2
              clc
              adc   #$40
              sta   iigsFROMRAM1+2

              sec
              xce
              sep   #$30
              rts

*----------------------------
* IIE
*----------------------------

*---------- Check the amount of RAM in a IIe
* Code from Applied Engineering

iieCHECKRAM   =     *

              sta   SETALTZP
              ldy   #$7f
]lp           sty   BANKSEL
              sty   $00
              tya
              eor   #$ff
              sta   $01
              dey
              bpl   ]lp

              lda   #0
              tax
              tay
]lp           sty   BANKSEL
              sta   BANKSEL+3
              cpy   $00
              bne   NotOne
              tya
              eor   #$ff
              cmp   $01
              bne   NotOne
* inx
              tya
              sta   iieBankTbl,x
              inx
              cpx   #minBANKS
              bcs   Done
NotOne        iny
              bpl   ]lp

Done          lda   #0              ; reset to bank 0
              sta   BANKSEL
              sta   SETSTDZP
* stx iieBankTbl
* lda #-1
* sta iieBankTbl+1,x

              cpx   #minBANKS
              bcc   NoRAM

              lda   #1              ; We have at least 3MB
              sta   fgIIE

              lda   RD80COL
              sta   fgC018

NoRAM         rts

iieBankTbl    ds    minBANKS        ; At least 3MB

iieBANK       ds    1               ; current bank
iieSBANK      ds    1               ; to RAM bank index
iieDBANK      ds    1               ; from RAM bank index

fgC018        ds    1               ; 0: write $C000, 1: write $C001

*---------- Init IIe RAM pointer

iieINITRAM    =     *

              lda   #$00
              sta   iieTORAM3+1
              sta   iieTORAM3+2
              sta   iieTOLC1+17     ; init LC code

              lda   #1              ; start at bank 1
              sta   iieSBANK
              sta   iieDBANK
              rts

*---------- Copy from bank 00 to IIe RAM

iieTORAM      =     *
              lda   #>L4000
              sta   iieTORAM2+2

              sta   CLR80COL        ; turn off 80Store
              sta   SETALTZP        ; use alternate zero page

              ldx   iieSBANK        ; get bank
              lda   iieBankTbl,x
              sta   BANKSEL         ; set bank

              ldx   #$40            ; copy #$40 pages
              ldy   #0

iieTORAM1     sta   WRCARDRAM       ; write to auxiliary memory

iieTORAM2     lda   L4000,y
iieTORAM3     sta   $0000,y
              iny
              bne   iieTORAM2

              sta   WRMAINRAM       ; write to main memory

              inc   iieTORAM2+2
              inc   iieTORAM3+2

              dex                   ; next page
              bne   iieTORAM1

* Shall we move to the next bank?

              lda   iieTORAM3+2
              cmp   #$c0            ; we stop at 48K
              bcc   iieTORAM4

              lda   #0              ; reset to 0
              sta   iieTORAM3+2
              inc   iieSBANK        ; next bank please

iieTORAM4     lda   #0              ; restore bank
              sta   BANKSEL
              sta   SETSTDZP
              jmp   iieEXITRAM

*---------- Copy from IIe RAM to bank 00
*
* This routine MUST be in another bank than 0
* Grrr! I hate that beast
*

iieFROMRAM    =     *
              sta   CLR80COL        ; turn off 80Store
              sta   SETALTZP        ; use alternate zero page

              ldx   iieDBANK        ; get bank
              lda   iieBankTbl,x
              sta   BANKSEL         ; set bank

              lda   LCBANK1         ; copy the move aux to main
              lda   LCBANK1         ; routine in LC bank 1

              ldy   #57-1
]lp           ldx   iieTOLC1,y      ; get code
              lda   $d000,y         ; get destination
              sta   iieTOLC1,y      ; save it
              txa
              sta   $d000,y         ; save new code
              dey
              bpl   ]lp

              jsr   $d000           ; call the move aux to main
              pha                   ; save pointer

              ldy   #57-1           ; restore code
]lp           ldx   $d000,y         ; get code
              lda   iieTOLC1,y      ; get destination
              sta   $d000,y         ; save it
              txa
              sta   iieTOLC1,y      ; save new code
              dey
              bpl   ]lp

              sta   ROMIN           ; restore ROM

              pla                   ; restore pointer
              bne   iieFROMRAM1
              inc   iieDBANK        ; next bank

iieFROMRAM1   lda   #0              ; restore bank
              sta   BANKSEL
              sta   SETSTDZP        ; use standard zero page

*---------- Exit from a read or write
*
* Must be after iieFROMRAM
*

iieEXITRAM    =     *

              lda   fgC018          ; status of 80STORE
              bpl   iieEXIT1
              sta   SET80COL

iieEXIT1      rts

*---------- Routine for LC BANK 2

*--- Standard copy now
* Keep 51 bytes

iieTOLC1      hex   A9408D          ; lda #$40 sta
              hex   14D0A2          ; $d011 ldx
              hex   40A000          ; #$40 ldy #$00
              hex   8D03C0          ; sta $c003
              hex   8d04c0          ; sta $c004 wrmainram
              hex   B90000          ; lda $0000,y
              hex   990040          ; sta $4000,y
              hex   C8D0F7          ; iny bne ]lp
              hex   8D05C0          ; sta $c005 wrcardram
              hex   EE11D0          ; inc $d00e
              hex   EE14D0          ; inc $d011
              hex   CAD0E5          ; dex bne ]lp
              hex   AD11D0          ; lda $d00e
              hex   C9C090          ; cmp #$c0 bcc
              hex   05A900          ; *+5 lda #$00
              hex   8D11D0          ; sta $d00e
              hex   8D02C0          ; sta $c002
              HEX   8D04C0          ; sta $c004
              hex   C90060          ; cmp #$00 rts

