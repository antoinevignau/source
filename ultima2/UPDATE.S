*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $0240
         MX    %11
         LST   OFF

*----------------------------

L472C    EQU   $472C
L47EC    EQU   $47EC
L4B00    EQU   $4B00
L4C00    EQU   $4C00

*----------------------------

L0240    LDA   $10
         CMP   #$FF
         BNE   L0249
         JMP   L02D7

L0249    SEC
         LDA   $01
         SBC   #$05
         STA   $03
         SEC
         LDA   $00
         SBC   #$09
         STA   $02
         LDA   #$00
         STA   $05
         STA   $04
         TAY
         TAX
L025F    CLC
         LDA   $04
         ADC   $02
         CMP   #$40
         BCS   L0270
         LDA   $05
         ADC   $03
         CMP   #$40
         BCC   L0275
L0270    LDA   $10
         JMP   L0291

L0275    STA   $06+1
         LDA   #$00
         LSR   $06+1
         ROR
         LSR   $06+1
         ROR
         ADC   $04
         ADC   $02
         STA   $06
         CLC
         LDA   $06+1
         ADC   #$10
         STA   $06+1
         LDA   ($06),Y
         LSR
         AND   #$FE
L0291    CMP   L4C00,X
         BNE   L02A0
         CMP   #$00
         BEQ   L02A0
         CMP   #$2E
         BEQ   L02A0
         ORA   #$80
L02A0    STA   L4B00,X
         INX
         INC   $04
         LDA   $04
         CMP   #$14
         BNE   L025F
         STY   $04
         INC   $05
         LDA   $05
         CMP   #$0A
         BNE   L025F
         LDA   L4B00+$6D
         STA   $12
         LDA   L4B00+$59
         STA   $13
         LDA   L4B00+$81
         STA   $14
         LDA   L4B00+$6C
         STA   $16
         LDA   L4B00+$6E
         STA   $15
         LDA   $11
         STA   L4B00+$6D
         JMP   L035E

L02D7    SEC
         LDA   $01
         SBC   #$05
         AND   #$3F
         STA   $03
         SEC
         LDA   $00
         SBC   #$09
         AND   #$3F
         STA   $02
         LDA   #$00
         STA   $05
         STA   $04
         TAY
         TAX
L02F1    CLC
         LDA   $04
         ADC   $02
         AND   #$3F
         STA   $17
         CLC
         LDA   $05
         ADC   $03
         AND   #$3F
         STA   $06+1
         LDA   #$00
         LSR   $06+1
         ROR
         LSR   $06+1
         ROR
         ADC   $17
         STA   $06
         CLC
         LDA   $06+1
         ADC   #$10
         STA   $06+1
         LDA   ($06),Y
         LSR
         AND   #$FE
         CMP   L4C00,X
         BNE   L032A
         CMP   #$00
         BEQ   L032A
         CMP   #$2E
         BEQ   L032A
         ORA   #$80
L032A    STA   L4B00,X
         INX
         INC   $04
         LDA   $04
         CMP   #$14
         BNE   L02F1
         STY   $04
         INC   $05
         LDA   $05
         CMP   #$0A
         BNE   L02F1
         LDA   L4B00+$6D
         STA   $12
         LDA   L4B00+$59
         STA   $13
         LDA   L4B00+$81
         STA   $14
         LDA   L4B00+$6C
         STA   $16
         LDA   L4B00+$6E
         STA   $15
         LDA   $11
         STA   L4B00+$6D
L035E    LDX   #$00
         STX   $0C
L0362    LDY   $0C
         LDA   L472C,Y
         STA   L0399+1
         STA   L03A5+1
         LDA   L47EC,Y
         STA   L0399+2
         STA   L03A5+2
         TYA
         AND   #$0F
         LSR
         ORA   #$08
         STA   L0394+2
         STA   L039F+2
         LDA   #$00
         STA   $0D
         ROR
         STA   L0394+1
         ADC   #$01
         STA   L039F+1
L038F    LDY   L4B00,X
         BMI   L03A8
L0394    LDA   $FFFF,Y
         LDY   $0D
L0399    STA   $FFFF,Y
         LDY   L4B00,X
L039F    LDA   $FFFF,Y
         LDY   $0D
         INY
L03A5    STA   $FFFF,Y
L03A8    INX
         LDA   $0D
         CLC
         ADC   #$02
         STA   $0D
         CMP   #$28
         BNE   L038F
         INC   $0C
         LDA   $0C
         CMP   #$A0
         BEQ   L03C7
         AND   #$0F
         BEQ   L0362
         TXA
         SBC   #$13
         TAX
         JMP   L0362

L03C7    LDX   #$00
L03C9    LDA   L4B00,X
         AND   #$7F
         STA   L4C00,X
         INX
         CPX   #$F0
         BNE   L03C9
         RTS

         HEX   A0
         HEX   D3
