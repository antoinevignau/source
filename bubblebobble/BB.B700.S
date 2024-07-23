
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         TYP   BIN

         ORG   $00B700
         MX    %11
LB700    LDA   #$00
         STA   $F1
         LDA   #$14
         STA   $F2
LB708    LDA   #$00
         STA   $F0
LB70C    LDA   $F0
         STA   $0A05
         LDA   $F2
         STA   $0A04
         LDA   #$00
         STA   $0A08
         LDA   #$98
         CLC
         ADC   $F1
         STA   $0A09
         JSR   LB73E
         INC   $F1
         LDA   $F1
         CMP   #$06
         BEQ   LB73B
         INC   $F0
         LDA   $F0
         CMP   #$10
         BNE   LB70C
         INC   $F2
         JMP   LB708
LB73B    JMP   $9800

LB73E    LDA   #$01
         STA   $0A00
         STA   $0A02
         STA   $0A0C
         STA   $0A10
         STA   $0B01
         LDA   #$60
         STA   $0A01
         STA   $0A0F
         LDA   #$00
         STA   $0A03
         STA   $0A0B
         STA   $0A0E
         STA   $0B00
         STA   $0A06
         LDA   #$0B
         STA   $0A07
         LDA   #$D8
         STA   $0B02
         LDA   #$EF
         STA   $0B03
         LDY   #$00
         LDA   #$0A
         JSR   LB7B5
         LDA   #$00
         STA   $48
         RTS

LB783    STA   $B6FF
         STA   LB7ED
         JSR   LB793
         RTS

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

LB793    LDA   LB7E4+1
         LDY   LB7E4
         JSR   LB7B5
         LDY   LB7ED
         DEY
         BPL   LB7A9
         LDY   #$0F
         NOP
         NOP
         DEC   LB7EC
LB7A9    STY   LB7ED
         DEC   LB7F0+1
         DEC   LB7E1
         BNE   LB793
         RTS

LB7B5    PHP
         SEI
         JSR   $BD00
         BCS   LB7BF
         PLP
         CLC
         RTS

LB7BF    PLP
         SEC
         RTS

         LDA   $B5BC
         STA   LB7F0+1
         LDA   #$00
         STA   LB7F0
         LDA   $B5F9
         EOR   #$FF
         STA   LB7EB
         RTS

         LDA   #$00
         TAY
LB7D9    STA   ($42),Y
         INY
         BNE   LB7D9
         RTS

         DB    $00
         DB    $1B
LB7E1    DB    $00
         DB    $0A
         DB    $1B
LB7E4    DA    $B7E8
         DA    $B600
LB7E8    DB    $01
         DB    $60
         DB    $01
LB7EB    DB    $FF
LB7EC    DB    $03
LB7ED    DB    $0E
         DA    $B7FB
LB7F0    DA    $9600
         DB    $00
         DB    $01
         DB    $01
         DB    $07
         DB    $FE
         DB    $60
         DB    $01
         DB    $00
         DB    $00
LB7FB    DB    $00
         DB    $01
         DB    $EF
         DB    $EC
         DB    $00
