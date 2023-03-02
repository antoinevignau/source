
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         REL

         PHB
         PHD
         TSC
         SEC
         SBC   #$000C
         TCD
         TCS
         STZ   $1D
         STZ   $1F
         PHB
         PHK
         PLB
         LDA   $1B
         CMP   #$0000
         BEQ   L001A
         JMP   L00F4

L001A    LDY   #$0002
         LDA   [$13]
         STA   $01
         LDA   [$13],Y
         STA   $03
         LDY   #$0010
         LDA   [$01],Y
         AND   #$0080
         BEQ   L0032
         JMP   L010C

L0032    LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$000C
         LDA   [$01],Y
         DEC
         PHA
         _MoveTo
         PEA   $0000
         PEA   $0000
         PEA   $8006
         LDY   #$0020
         LDA   [$01],Y
         TAX
         LDY   #$0022
         LDA   [$01],Y
         PHA
         PHX
         _LoadResource
         PLX
         STX   $09
         PLA
         STA   $0B
         PHA
         PHX
         _HLock
         LDY   #$0002
         LDA   [$09]
         TAX
         LDA   [$09],Y
         PHA
         PHX
         _DrawString
         LDX   $09
         LDA   $0B
         PHA
         PHX
         _HUnlock
         PEA   $0002
         PEA   $8006
         LDY   #$0020
         LDA   [$01],Y
         TAX
         LDY   #$0022
         LDA   [$01],Y
         PHA
         PHX
         _ReleaseResource
         LDY   #$0011
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$00FF
         BNE   L010C
         LDA   #$3333
         LDX   #$CCCC
         JSR   L0121
         PEA   $8001
         _SetPenMode
         CLC
         LDA   $01
         ADC   #$0008
         TAX
         LDA   $03
         ADC   #$0000
         PHA
         PHX
         _PaintRect
         PEA   $0000
         _SetPenMode
         LDA   #$0000
         LDX   #$0000
         JSR   L0121
         BRA   L010C
L00F4    CMP   #$0005
         BEQ   L010A
         CMP   #$0006
         BEQ   L010A
         CMP   #$000C
         BNE   L010C
         LDA   #$0028
         STA   $1D
         BRA   L010C
L010A    INC   $1D
L010C    PLB
         LDA   $11
         STA   $1B
         LDA   $0F
         STA   $19
         LDX   $0D
         TDC
         CLC
         ADC   #$0018
         TCS
         TXA
         TCD
         PLB
         RTL

L0121    STX   $07
         STA   $05
         LDY   #$0020
L0128    DEY
         DEY
         LDA   $05
         STA   L014B,Y
         DEY
         DEY
         LDA   $07
         STA   L014B,Y
         CPY   #$0000
         BNE   L0128
         LDA   #^L014B
         PHA
         LDA   #L014B
         PHA
         _SetPenPat
         RTS

L014B    DS    $20
