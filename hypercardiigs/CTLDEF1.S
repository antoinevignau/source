
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         REL

         PHB
         PHD
         PHY
         PHY
         TSC
         TCD
         STZ   $15
         STZ   $17
         PHB
         PHK
         PLB
         LDY   #$0002
         LDA   [$0B]
         STA   $01
         LDA   [$0B],Y
         STA   $03
         LDA   $13
         CMP   #$0000
         BNE   L0069
         LDY   #$0010
         LDA   [$01],Y
         TAX
         AND   #$0080
         BNE   L0067
         TXA
         AND   #$0003
         BEQ   L0067
         LDX   #$0000
         CMP   #$0002
         BEQ   L003B
         LDX   #$3333
L003B    TXA
         JSR   L00D2
         PEA   $0002
         PEA   $0001
         _SetPenSize
         CLC
         LDA   $01
         ADC   #$0008
         TAX
         LDA   $03
         ADC   #$0000
         PHA
         PHX
         _FrameRect
         LDA   #$0000
         JSR   L00D2
L0067    BRA   L00BD
L0069    CMP   #$0002
         BNE   L00A5
         STZ   $15
         LDY   #$0011
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   L00BD
         PHY
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         LDA   $01
         LDX   $03
         CLC
         ADC   #$0008
         BCC   L0092
         INX
L0092    PHX
         PHA
         _PtInRect
         PLA
         BEQ   L00BD
         LDA   #$0020
         STA   $15
         BRA   L00BD
L00A5    CMP   #$0005
         BEQ   L00BB
         CMP   #$0006
         BEQ   L00BB
         CMP   #$000C
         BNE   L00BD
         LDA   #$0028
         STA   $15
         BRA   L00BD
L00BB    INC   $15
L00BD    PLB
         LDA   $09
         STA   $13
         LDA   $07
         STA   $11
         LDX   $05
         TDC
         CLC
         ADC   #$0010
         TCS
         TXA
         TCD
         PLB
         RTL

L00D2    LDY   #$001E
L00D5    STA   L00EC,Y
         DEY
         DEY
         BPL   L00D5
         LDA   #^L00EC
         PHA
         LDA   #L00EC
         PHA
         _SetPenPat
         RTS

L00EC    DS    $20
