
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         TYP   BIN

         ORG   $000220
         MX    %11
L0220    LDA   #$1E
         STA   $20
         LDA   #$42
         STA   $21
         LDA   #$B0
         STA   $22
         LDA   #$02
         STA   $23
         JSR   $421E
         LDY   #$00
L0235    STA   $45C3,Y
         INY
         CPY   #$3A
         BNE   L0235
         LDA   #$F0
         STA   $F9
         STA   $FB
         LDY   #$91
         TYA
         CLC
         ADC   #$2E
         STA   $FA
         LDA   ($F9),Y
         ROR
         STA   $F0
         LDA   ($F9),Y
         ROL
         STA   $F1
         LDX   #$DF
         STX   $FC
         LDY   #$10
         DEX
         DEX
         TXA
         STA   ($FB),Y
         LDY   #$90
         LDA   ($F9),Y
         STA   $F2
         LDY   #$10
         LDA   ($FB),Y
         CMP   #$DD
         BNE   L0271
         STA   $0F53
L0271    LDY   #$92
         LDA   ($F9),Y
         ROR
         STA   $FF
         LDA   ($F9),Y
         ROL
         STA   $94
         LDA   $0F53
         BEQ   L02A5
         LDA   #$53
         STA   $41A4
         LDA   #$AD
         STA   $D033
         LDY   #$91
L028E    LDA   ($F9),Y
         ROR
         STA   $F0
         LDA   ($F9),Y
         ROL
         STA   $F1
         LDY   #$00
         LDA   #$FF
L029C    STA   L0220,Y
         INY
         CPY   #$9B
         BNE   L029C
         RTS

L02A5    LDY   #$92
         BNE   L028E
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         LDA   #$F0
         STA   $F9
         LDY   #$93
         TYA
         CLC
         ADC   #$9C
         STA   $FA
         LDA   $0F53
         BEQ   L02DD
L02C1    LDA   ($F9),Y
         ROR
         STA   $F0
         LDA   ($F9),Y
         ROL
         STA   $F1
         INC   $41A4
         DEC   $D033
         LDA   $41A4
         CLC
         ADC   $D033
         BEQ   L02DD
         JMP   $6535

L02DD    LDY   #$92
         LDA   ($F9),Y
         ROR
         STA   $F0
         LDA   ($F9),Y
         ROL
         STA   $F1
         RTS              ; LDY INSTEAD?

         DB    $92
         BNE   L02C1
         TYA
         CLC
         ADC   #$2E
         STA   $FA
         RTS

         DB    $FE
         DB    $FE
         DB    $FE
         DB    $FE
         DB    $00
         DB    $08
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $07
         DB    $06
         DB    $05
         DB    $04
         DB    $03
         DB    $02
         DB    $01
         DB    $00
         DB    $F9
         DB    $FA
         DB    $FB
         DB    $FC
         DB    $FD
         DB    $FE
         DB    $FF
         DB    $1F
         DB    $00
         DB    $13
         DB    $00
         DB    $0A
         DB    $00
         DB    $0C
         DB    $00
         DB    $0D
         DB    $00
         DB    $0E
         DB    $00
         DB    $02
         DB    $00
         DB    $0E
         DB    $00
         DB    $07
         DB    $00
         DB    $13
         DB    $00
         DB    $0A
         DB    $00
         DB    $0C
         DB    $00
         DB    $0D
         DB    $00
         DB    $0E
         DB    $00
         DB    $02
         DB    $00
         DB    $0E
         DB    $00
         DB    $07
         DB    $00
         DB    $13
         DB    $00
         DB    $0A
         DB    $00
         DB    $0C
         DB    $00
         DB    $0D
         DB    $00
         DB    $0E
         DB    $00
         DB    $02
         DB    $00
         DB    $0E
         DB    $00
         DB    $07
         DB    $00
         DB    $13
         DB    $00
         DB    $0A
         DB    $00
         DB    $0C
         DB    $00
         DB    $0D
         DB    $00
         DB    $0E
         DB    $00
         DB    $02
         DB    $00
         DB    $0E
         DB    $00
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $16
         DB    $1B
         DB    $1A
         DB    $19
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $16
         DB    $1B
         DB    $1A
         DB    $19
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $18
         DB    $17
         DB    $16
         DB    $15
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $1A
         DB    $19
         DB    $1A
         DB    $19
         DB    $18
         DB    $17
         DB    $18
         DB    $17
         DB    $16
         DB    $15
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $20
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $1C
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $20
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $1C
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $1A
         DB    $1B
         DB    $1C
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $20
         DB    $1F
         DB    $1E
         DB    $1F
         DB    $1E
         DB    $1D
         DB    $1C
         DB    $1D
         DB    $1C
         DB    $1B
         DB    $1A
         DB    $1B
         DB    $1C
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $20
         DB    $1F
         DB    $1D
         DB    $1A
         DB    $00
         DB    $0E
         DB    $00
         DB    $00
         DB    $00
         DB    $11
         DB    $00
         DB    $12
         DB    $00
         DB    $15
         DB    $00
         DB    $17
         DB    $00
         DB    $1A
         DB    $00
         DB    $FF
