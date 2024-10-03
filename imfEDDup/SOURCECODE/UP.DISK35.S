*
* I'm fEDD up ;-)
* Disk read GS
* A fast way of reading 3.5" NIB
*
* (c) 2016, Brutal Deluxe Software
* (c) 2015, John Brooks
*

*----------------------------
* THE DISK COPY PART
*----------------------------
*
* We can enter the code if:
* - //gs
* - cold boot
* - 3MB
*
* We must have:
* - 3.5" drive in slot 5, drive 1
*

doDSK35       lda   fgIIGS         ; if we have the IIgs requirements
              beq   doDSK351       ; we play...

*--- We are good, let's play

* V2.1: calc free blocks
              jsr   showFREE       ; calc free blocks
              jsr   checkVOL35     ; calc required blocks
              bcs   doDSK351       ; handle fgOVERWRITE

              jsr   doFILE         ; enter filename

              lda   fileNAME       ; empty filename
              bne   doDSK352

doDSK350      sec                  ; v2.3
doDSK351      jmp   theEND         ; v2.3
*doDSK351 jsr BELL ; exit
* jmp mainLOOP

doDSK352      lda   #fileD35       ; want a 3.5" NIB file
              jsr   createFILE
              bcs   doDSK351       ; error

              lda   fgWRITENIT     ; skip nit
              beq   doDSK353

              lda   #fileT35
              jsr   createFILE
              bcs   doDSK351       ; error

* V2.1: force free block
doDSK353      jsr   showFREE       ; calculate free space
              jsr   calcVOLFREE2   ; do we have enough room
              bcs   doDSK351       ; on the destination volume

*--- The read part

doDSK35LOOP   =     *

              ldx   #>msgREAD
              ldy   #<msgREAD
              jsr   doDSK35PRINT

              lda   #<ptrNIB       ; where to put data
              sta   johnNIB+1
              sta   doDSK358+1
              lda   #>ptrNIB
              sta   johnNIB+2
              sta   doDSK358+2
              lda   #^ptrNIB
              sta   johnNIB+3
              sta   doDSK358+3

              lda   #<ptrNIT       ; where to put data
              sta   johnNIT+1
              lda   #>ptrNIT
              sta   johnNIT+2
              lda   #^ptrNIT
              sta   johnNIT+3

              jsr   johnBROOKS     ; read the 3.5" disk

*--- Did the user pressed a key to cancel?

              jsr   K7             ; did the user press a key?
              bcc   doDSK35next    ; unless we pressed a key
              cmp   #keyESC
              beq   doDSK350       ; v2.3

*--- Check we've read ALL the data
* it must end at $16/FFxx

doDSK35next   =     *

              lda   johnNIB+3
              cmp   #$16
              bne   doDSK35KO      ; not at bank $16

              lda   johnNIB+2
              cmp   #$ff
              beq   doDSK35OK      ; we've done everything

doDSK35KO     lda   fgRETRY35      ; shall we retry?
              beq   doDSK350       ;  no!
              bne   doDSK35LOOP    ; yes!

*--- The write part for NIB

doDSK35OK     ldx   #>msgWRITENIB
              ldy   #<msgWRITENIB
              jsr   doDSK35PRINT

* lda #<ptrNIB ; where to put data
* sta doDSK358+1
* lda #>ptrNIB
* sta doDSK358+2
* lda #^ptrNIB
* sta doDSK358+3

              lda   #fileD35
              ldy   #>ptrNIB2      ; end of data
              ldx   #^ptrNIB2
              jsr   doDSKWRITE

*--- Write timing bits?

              lda   fgWRITENIT
              bne   doDSK354
              jmp   doDSK355

*--- Now correct timing

doDSK354      ldx   #>msgWRITETIM
              ldy   #<msgWRITETIM
              jsr   doDSK35PRINT

              jsr   calcTIME

*--- Now write NIT

              ldx   #>msgWRITENIT
              ldy   #<msgWRITENIT
              jsr   doDSK35PRINT

              lda   #<ptrNIT       ; where to put data
              sta   doDSK358+1
              lda   #>ptrNIT
              sta   doDSK358+2
              lda   #^ptrNIT
              sta   doDSK358+3

              lda   #fileT35       ; type of file
              ldy   #>ptrNIT2      ; end of data
              ldx   #^ptrNIT2
              jsr   doDSKWRITE

*--- End of process - Thank you, John

*doDSK355 sec
* xce
* sep #$30
*
doDSK355      jmp   theEND         ; v2.3

* ldx #>msgEMPTY
* ldy #<msgEMPTY
* jsr doDSK35PRINT
*
* jsr BELL
* jmp mainFREE

*--- Lighten the code

doDSK35PRINT  =     *
              txa
              pha
              tya
              pha

              ldx   #xMESSAGE
              ldy   #yMESSAGE
              jsr   tabXY

              pla
              tay
              pla
              tax
              jsr   printSTR
              rts

* We copy blocks of $4000 until we reach the end...

doDSKWRITE    sty   end35          ; end of data
              stx   end35+1
              sta   file35

              clc                  ; copy $4000 bytes
              xce
              rep   #$30

doDSK357      ldx   #$4000-2
doDSK358      ldal  $020000,x
              sta   L4000,x
              dex
              dex
              bpl   doDSK358

              sec                  ; tell which bank
              xce                  ; we are saving
              sep   #$30

              lda   doDSK358+3
              pha
              and   #%1111_0000
              lsr
              lsr
              lsr
              lsr

              ldx   #xTRACK
              ldy   #yTRACK
              jsr   printBIG

              pla
              and   #%0000_1111
              ldx   #xTRACK2
              ldy   #yTRACK2
              jsr   printBIG

*---

              jsr   K7
              bcs   doDSK359

              lda   file35         ; and save
              jsr   saveFILE
              bcs   doDSK359

              clc                  ; did we reach the end?
              xce
              rep   #$30

              lda   doDSK358+2     ; next RAM pointer
              clc
              adc   #$0040         ; $4000 more
              sta   doDSK358+2

* lda doDSK358+2 ; now compare
              cmp   end35          ; the BB/AAxx
              bcc   doDSK357       ; we are below
* rep #$20
* lda doDSK358+1 ; now compare
* cmp johnNIB+1 ; the address
* bcc doDSK357 ; we are below

              sec
              xce
              sep   #$30
              clc
doDSK359      rts

*---

file35        ds    1
end35         ds    2

msgREAD       str   'READ 3.5"'
msgWRITENIB   str   'SAVE .N35'
msgWRITETIM   str   'CALC TIME'
msgWRITENIT   str   'SAVE .T35'
msgEMPTY      str   '         '

* ds \

*
* Disk Read GS
* (c) 2015, John Brooks
*

johnBROOKS    =     *              ; enter in 8-bit mode

              clc
              xce
              sei
              pea   $C000
              pld

*--- Re-init values

              rep   #$30           ; in 16-bit

              stz   L2200
              lda   #$FD44
              sta   L2119+1
              lda   #$29CC
              sta   L2168+1
              lda   #$0300
              sta   L2189

              sep   #$30           ; in 8-bit
              lda   #$41
              sta   L21F9          ; 1+$36
              lda   #$51
              sta   L21FC          ; 1+$30
              lda   #$4F
              sta   L21FF          ; 1+$33

*--- Save values

* lda $31
* pha
* lda #$40
* sta $31
* lda $36
* pha
* lda #$80
* sta $36
* lda $2d
* pha
* stz $2d
* lda $29
* pha
* lda #$c1
* sta $29

*---

              LDY   #$00
              JSR   L208A
              BCS   L2033

              REP   #$31
              LDA   #$1111
              LDX   #$001E
L2016         SBC   #$0111
              STAL  $E19E00,X
              DEX
              DEX
              BPL   L2016
              LDX   #$7DFE
L2024         STAL  $E12000,X
              DEX
              DEX
              BPL   L2024

              SEP   #$30
              LDY   #$30
              JSR   L208A

L2033         LDY   #$20
              JSR   L208A

* pla
* sta $29
* pla
* sta $2d
* pla
* sta $36
* pla
* sta $31

              PEA   $0000
              PLD
              SEC
              XCE
              CLI
* LDX #$25
*L2041 LDA L21A1,X
* JSR COUT
* DEX
* BPL L2041
              RTS

*---

              mx    %11

L204B         BIT   $E0
              BIT   $E3
              BIT   $E6
              BIT   $E4
              LSR
              BCC   L2058
              BIT   $E5
L2058         LSR
              TAX
              LDA   #$80
              ROR
              STA   $31
              TXA
              LSR
              BCC   L2065
              BIT   $E1
L2065         TAX
              BIT   $E2,X
              RTS

L2069         DEC   L21FF
              BPL   L207C
              RTS

L206F         BIT   $ED
              BIT   $EE
              BMI   L207C
              RTS

L2076         BIT   $ED
              BIT   $EE
              BMI   L2089
L207C         CMP   #$08
              BCC   L2083
              ORA   #$F0
              CLC
L2083         PHA
              TYA
              ADC   $01,S
              TAY
              PLA
L2089         RTS

L208A         SEC
              ROR   L2201
L208E         LDA   L21C7,Y
              PHA
              LSR
              LSR
              LSR
              AND   #$1E
              TAX
              PLA
              AND   #$0F
              JSR   (L218B,X)
              INY
              REP   #$20
              DEC   L2200
              SEP   #$21
              BNE   L208E
              RTS

L20A9         TAX
              LDA   $E0,X
              RTS

*L20AD rts

L20AD         PHY
              TAY
              LDX   L20C0,Y
              LDA   $00,X
              XBA
              LDA   L20C4,Y
              STA   $00,X
              XBA
              STA   L20C4,Y
              PLY
              RTS

*--- Values to set per $C0xx

L20C0         HEX   31362D29
L20C4         HEX   408000C1

L20C8         JSR   L204B
              BIT   $E7
              BIT   $E6
              RTS

L20D0         LSR
              PLA
              PLA
              RTS

L20D4         TAX
L20D5         LDA   $EE
              AND   #$20
              BNE   L20D5
L20DB         STX   $EF
              TXA
              EOR   $EE
              AND   #$1F
              BNE   L20DB
              RTS

L20E5         BEQ   L210B
              LDA   #$4F
              STA   L21FF
              LDA   #$43
              STA   L21F9
              STZ   L21FC
              REP   #$31
              LDA   #$02BC
              STA   L2119+1
              LDA   #$FD44
              ADC   L2168+1
              STA   L2168+1
              STZ   L2200
              SEP   #$30
              RTS

L210B         PHY
              LDA   L21FF
              INC
              AND   #$0F
              REP   #$31
              BNE   L211F
              LDA   L2168+1
L2119         ADC   #$FD44
              STA   L2168+1
L211F         SEP   #$21
              LDA   #$4F
              SBC   L21FF
              LDY   L2189
              PEA   $00E1
              PLB
              LDX   #$0000
              XBA
L2131         LDA   $EC
              BPL   L2131
              XBA
              BRA   johnNIB
L2138         LDY   #$0300
L213B         LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BMI   johnNIB
              LDA   $EC
              BPL   L213B

johnNIB       STAL  $020000,X
              STA   $1D00,Y
              LDA   $2F
johnNIT       STAL  $180000,X
              INX
              INY
              BMI   L2138
L2168         CPX   #$29CC
              BCC   L213B
              PLB
              STY   L2189
              REP   #$31
              TXA
              ADC   johnNIB+1
              STA   johnNIB+1
              STA   johnNIT+1
              BCC   L2185
              INC   johnNIB+3
              INC   johnNIT+3
L2185         SEP   #$30
              PLY
              RTS

L2189         DW    $0300

L218B         DA    L20D0
              DA    L20A9
              DA    L20AD
              DA    L20D4
              DA    L204B
              DA    L20C8
              DA    L2076
              DA    L206F
              DA    L207C
              DA    L2069
              DA    L20E5

*L21A1 ASC "5102/7/9 skoorB nhoJ yB"8D
* ASC "6.0v egamIksiD"

L21C7         DB    $21
              DB    $22
              DB    $23
              DB    $18
              DB    $10
              DB    $12
              DB    $14
              DB    $16
              DB    $1A
              DB    $1C
              DB    $1E
              DB    $1D
              DB    $3F
              DB    $1C
              DB    $20
              DB    $19
              DB    $42
              DB    $61
              DB    $0F
              DB    $58
              DB    $51
              DB    $82
              DB    $54
              DB    $6F
              DB    $4A
              DB    $7C
              DB    $50
              DB    $4B
              DB    $71
              DB    $6F
              DB    $7F
              DB    $00
              DB    $59
              DB    $18
              DB    $10
              DB    $12
              DB    $14
              DB    $16
              DB    $20
              DB    $1D
              DB    $30
              DB    $1C
              DB    $23
              DB    $22
              DB    $21
              DB    $00
              DB    $54
              DB    $6F
              DB    $4B
              DB    $7F
L21F9         DB    $41
              DB    $A0
              DB    $99
L21FC         DB    $51
              DB    $A1
              DB    $8A
L21FF         DB    $4F
L2200         db    $00
L2201         db    $00

*--- Calc time

calcTIME      =     *

              MX    %11

* LDX #$30
*L2002 LDA L2090,X
* JSR COUT
* DEX
* BPL L2002
              CLC
              XCE
              SEI
              PEA   $1F00
              PLD
              REP   #$30

              LDA   #$8000
              STA   $00
              STA   $04
              LDA   #$0016
              STA   $02
              LDA   #$002C
              STA   $06

              LDY   #$7EFE
L2028         SEP   #$20
L202A         LDA   [$04],Y
              AND   #$7F
              STA   $0C
              INY
              LDA   [$00],Y
* BMI L204C
* PHY
* PHD
* SEP #$30
* SEC
* XCE
* PEA $0000
* PLD
* LDA #$AE
* JSR COUT
* CLC
* XCE
* REP #$10
* PLD
* PLY
* BRA L2066
              bpl   L2066          ; track number

L204C         LDX   #$0000
              LDA   [$04],Y
              BPL   L2056
              LDX   #$0080
L2056         STX   $0D
              AND   #$7F
              SEC
              SBC   $0C
              BCS   L2060
              INC
L2060         AND   #$3F
              ORA   $0D
L2066         =     *              ; moved here
              STA   [$04],Y
              DEY                  ; was here
              DEY
              BPL   L202A
              REP   #$30
              LDA   $01
              SEC
              SBC   #$0080
              CMP   #$0200
              BCC   L2087
              STA   $01
              LDA   $05
              SEC
              SBC   #$0080
              STA   $05
              LDY   #$7FFE
              JMP   L2028

L2087         SEP   #$30
              PEA   $0000
              PLD
              SEC
              XCE
              cli                  ; grrrr!
              RTS

*L2090 ASC 8D
* ASC "5102/7/9 skoorB nhoJ yB"8D
* ASC "6.0v emit clac egamIksiD"

