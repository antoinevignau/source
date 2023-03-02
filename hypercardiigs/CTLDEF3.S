
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

         REL

         PHB
         PHD
         TSC
         SEC
         SBC   #$0010
         TCD
         TCS
         STZ   $21
         STZ   $23
         PHB
         PHK
         PLB
         LDY   #$0002
         LDA   [$17]
         STA   $01
         LDA   [$17],Y
         STA   $03
         LDA   $1F
         CMP   #$0000
         BEQ   L0064
         CMP   #$0002
         BEQ   L0072
         CMP   #$0008
         BEQ   L004D
         CMP   #$0003
         BEQ   L0050
         CMP   #$0009
         BEQ   L0053
         CMP   #$0005
         BEQ   L0056
         CMP   #$0006
         BEQ   L0056
         CMP   #$000A
         BEQ   L0059
         CMP   #$000C
         BEQ   L005C
         JMP   L01C9
L004D    JMP   L0124
L0050    JMP   L01A1
L0053    JMP   L01BF
L0056    JMP   L01C7
L0059    JMP   L01AF

L005C    LDA   #$0028
         STA   $21
         JMP   L01C9

L0064    LDA   $1B
         JSR   L01DE
         LDA   #$000F
         STA   L0445
         JMP   L01C9

L0072    LDY   #$0010
         LDA   [$01],Y
         LDY   #$0000
         AND   #$0001
         CMP   #$0000
         BEQ   L0085
         LDY   #$0010
L0085    TYA
         CLC
         ADC   #$000E
         TAY
         LDX   #$000E
L008E    LDA   L0447,Y
         STA   L0431,X
         DEY
         DEY
         DEX
         DEX
         BPL   L008E
         LDA   #^L0431
         PHA
         LDA   #L0431
         PHA
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         _OffsetRect
         LDA   #^L0439
         PHA
         LDA   #L0439
         PHA
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         _OffsetRect
         LDA   $1B
         STA   L0441
         LDA   $1D
         STA   L0443
         PEA   $0000
         LDA   #^L0441
         PHA
         LDA   #L0441
         PHA
         LDA   #^L0431
         PHA
         LDA   #L0431
         PHA
         _PtInRect
         PLA
         BEQ   L00FF
         LDA   #$0028
         STA   $21
         JMP   L01C9

L00FF    PEA   $0000
         LDA   #^L0441
         PHA
         LDA   #L0441
         PHA
         LDA   #^L0439
         PHA
         LDA   #L0439
         PHA
         _PtInRect
         PLA
         BEQ   L0121
         LDA   #$0029
         STA   $21
L0121    JMP   L01C9

L0124    LDA   $1B
         CMP   #$0028
         BEQ   L0130
         CMP   #$0029
         BEQ   L0157
L0130    LDY   #$001E
         LDA   [$01],Y
         STA   $09
         LDY   #$0012
         LDA   [$01],Y
         CMP   $09
         BMI   L0142
         BRA   L017F
L0142    INC
         STA   [$01],Y
         CMP   $09
         BMI   L014B
         BRA   L017F
L014B    INC
         STA   [$01],Y
         LDA   #$0028
         JSR   L01DE
         JMP   L017F

L0157    LDY   #$001C
         LDA   [$01],Y
         STA   $09
         LDY   #$0012
         LDA   [$01],Y
         CMP   $09
         BEQ   L017F
         BPL   L016B
         BRA   L017F
L016B    DEC
         STA   [$01],Y
         CMP   $09
         BEQ   L017F
         BPL   L0176
         BRA   L017F
L0176    DEC
         STA   [$01],Y
         LDA   #$0029
         JSR   L01DE
L017F    JSR   L037B
         CLC
         ADC   L0445
         STA   $09
L0188    JSR   L037B
         CMP   $09
         BMI   L0188
         LDA   L0445
         BEQ   L019E
         DEC
         BEQ   L019B
         DEC
         BEQ   L019B
         DEC
L019B    STA   L0445
L019E    JMP   L01C9

L01A1    LDY   #$0018
         LDA   #$FFFF
         STA   [$01],Y
         INY
         INY
         STA   [$01],Y
         BRA   L01C9
L01AF    LDA   $1B
         LDY   #$001C
         STA   [$01],Y
         LDA   $1D
         LDY   #$001E
         STA   [$01],Y
         BRA   L01C9
L01BF    LDA   #$0001
         JSR   L01DE
         BRA   L01C9
L01C7    INC   $21
L01C9    PLB
         LDA   $15
         STA   $1F
         LDA   $13
         STA   $1D
         LDX   $11
         TDC
         CLC
         ADC   #$001C
         TCS
         TXA
         TCD
         PLB
         RTL

L01DE    STA   $09
         LDY   #$0010
         LDA   [$01],Y
         TAX
         AND   #$0080
         BEQ   L01EC
         RTS

L01EC    TXA
         AND   #$0001
         STA   $0B
         LDY   #$0011
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$0028
         BEQ   L0209
         CMP   #$0029
         BEQ   L0209
         CMP   #$00FF
         BNE   L0211
L0209    LDA   $0B
         CLC
         ADC   #$0004
         STA   $0B
L0211    LDA   $09
         CMP   #$0000
         BEQ   L021D
         CMP   #$0029
         BNE   L0221
L021D    CLC
         JSR   L038B
L0221    LDA   $09
         CMP   #$0000
         BEQ   L022D
         CMP   #$0028
         BNE   L0231
L022D    SEC
         JSR   L038B
L0231    LDY   #$0020
         LDA   [$01],Y
         AND   #$0006
         TAX
         PHX
         LDY   #$0010
         LDA   [$01],Y
         AND   #$0001
         CMP   #$0001
         BEQ   L025E
         TXA
         LDX   #$1388
         CMP   #$0004
         BNE   L0254
         LDX   #$0C35
L0254    CMP   #$0006
         BNE   L0272
         LDX   #$30D4
         BRA   L0272
L025E    TXA
         LDX   #$2710
         CMP   #$0004
         BNE   L026A
         LDX   #$1B58
L026A    CMP   #$0006
         BNE   L0272
         LDX   #$6B6C
L0272    PEA   $0000
         PEA   $0000
         PHX
         PEA   $2710
         _FixRatio
         PLX
         PLA
         STX   $0D
         STA   $0F
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDY   #$0012
         LDA   [$01],Y
         PHA
         _Long2Fix
         PLX
         PLY
         PEA   $0000
         PEA   $0000
         PHY
         PHX
         LDA   $0F
         PHA
         LDA   $0D
         PHA
         _FixMul
         PLA
         STA   $0D
         PLA
         STA   $0F
         PLA
         CMP   #$0004
         BEQ   L02C7
         CMP   #$0002
         BNE   L02CC
L02C7    JSR   L03DD
         BRA   L02E6
L02CC    CLC
         LDA   $0F
         ADC   #$03E8
         STA   $0F
         JSR   L03DD
         SEP   #$20
         LDA   L0411+2
         STA   L0411+1
         LDA   #$2E
         STA   L0411+2
         REP   #$20
L02E6    LDY   #$000A
         LDA   [$01],Y
         CLC
         ADC   #$002A
         PHA
         STA   L0433
         LDY   #$0008
         LDA   [$01],Y
         INC
         STA   L0431
         CLC
         ADC   #$0009
         PHA
         STA   L0435
         LDY   #$000E
         LDA   [$01],Y
         STA   L0437
         LDA   #^L0431
         PHA
         LDA   #L0431
         PHA
         _EraseRect
         _MoveTo
         LDA   #^L0411
         PHA
         LDA   #L0411
         PHA
         _DrawString
         LDY   #$0011
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   L033F
         RTS

L033F    LDA   #$3333
         LDX   #$CCCC
         JSR   L03B3
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
         JSR   L03B3
         RTS

L037B    PEA   $0000
         PEA   $0000
         _GetTick
         PLA
         PLX
         RTS

L038B    LDA   $0B
         BCC   L0391
         INC
         INC
L0391    ASL
         TAY
         LDA   L0467,Y
         TAX
         LDA   #^L0467
         PHA
         PHX
         PEA   $F000
         LDY   #$000A
         LDA   [$01],Y
         PHA
         LDY   #$0008
         LDA   [$01],Y
         PHA
         _DrawIcon
         RTS

L03B3    STX   $07
         STA   $05
         LDY   #$0020
L03BA    DEY
         DEY
         LDA   $05
         STA   L0411,Y
         DEY
         DEY
         LDA   $07
         STA   L0411,Y
         CPY   #$0000
         BNE   L03BA
         LDA   #^L0411
         PHA
         LDA   #L0411
         PHA
         _SetPenPat
         RTS

L03DD    PEA   $0000
         LDA   $0F
         PHA
         LDA   $0D
         PHA
         _FixRound
         PLA
         PEA   $0000
         PHA
         LDA   #^L0411
         PHA
         LDA   #L0411
         PHA
         PEA   $0005
         PEA   $0000
         _Long2Dec
         SEP   #$20
         LDA   #$04
         STA   L0411
         REP   #$20
         RTS

L0411    DS    $20
L0431    DW    $0000
L0433    DW    $0000
L0435    DW    $0000
L0437    DW    $0000
L0439    DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L0441    DW    $0000
L0443    DW    $0000
L0445    DW    $0000
L0447    DW    $0000
         DW    $000D
         DW    $000B
         DW    $0017
         DW    $0000
         DW    $0000
         DW    $000B
         DW    $000D
         DW    $0007
         DW    $0000
         DW    $000C
         DW    $0017
         DW    $0001
         DW    $0000
         DW    $0007
         DW    $0017
L0467    DA    L062F
         DA    L0477
         DA    L06DF
         DA    L0517
         DA    L0687
         DA    L04C7
         DA    L075F
         DA    L05A3
L0477    DW    $0080      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFC3FFFFF
         HEX   FFFFC3C3FFFF
         HEX   FFFC3FFC3FFF
         HEX   FFC0000003FF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000003C00000
         HEX   00003FFC0000
         HEX   0003FFFFC000
         HEX   003FFFFFFC00
L04C7    DW    $0080      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFC3FFFFF
         HEX   FFFFC003FFFF
         HEX   FFFC00003FFF
         HEX   FFC0000003FF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000003C00000
         HEX   00003FFC0000
         HEX   0003FFFFC000
         HEX   003FFFFFFC00
L0517    DW    $0080      ; Icon type
         DW    $0042      ; Icon size
         DW    $000B      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFC0000003FF
         HEX   FFFC3FFC3FFF
         HEX   FFFFC3C3FFFF
         HEX   FFFFFC3FFFFF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   003FFFFFFC00
         HEX   0003FFFFC000
         HEX   00003FFC0000
         HEX   000003C00000
L05A3    DW    $0080      ; Icon type
         DW    $0042      ; Icon size
         DW    $000B      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFC0000003FF
         HEX   FFFC00003FFF
         HEX   FFFFC003FFFF
         HEX   FFFFFC3FFFFF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   003FFFFFFC00
         HEX   0003FFFFC000
         HEX   00003FFC0000
         HEX   000003C00000
L062F    DW    $0080      ; Icon type
         DW    $0028      ; Icon size
         DW    $000A      ; Icon height
         DW    $0008      ; Icon width
         HEX   FFFFFFFF   ; Icon image
         HEX   FFFFFFFF
         HEX   FFFFFFFF
         HEX   FFFFC3FF
         HEX   FFFC03FF
         HEX   FFC3C3FF
         HEX   FC3FC3FF
         HEX   FFC3C3FF
         HEX   FFFC03FF
         HEX   FFFFC3FF
         HEX   00000000   ; Icon mask
         HEX   00000000
         HEX   00000000
         HEX   00003C00
         HEX   0003FC00
         HEX   003FFC00
         HEX   03FFFC00
         HEX   003FFC00
         HEX   0003FC00
         HEX   00003C00
L0687    DW    $0080      ; Icon type
         DW    $0028      ; Icon size
         DW    $000A      ; Icon height
         DW    $0008      ; Icon width
         HEX   FFFFFFFF   ; Icon image
         HEX   FFFFFFFF
         HEX   FFFFFFFF
         HEX   FFFFC3FF
         HEX   FFFC03FF
         HEX   FFC003FF
         HEX   FC0003FF
         HEX   FFC003FF
         HEX   FFFC03FF
         HEX   FFFFC3FF
         HEX   00000000   ; Icon mask
         HEX   00000000
         HEX   00000000
         HEX   00003C00
         HEX   0003FC00
         HEX   003FFC00
         HEX   03FFFC00
         HEX   003FFC00
         HEX   0003FC00
         HEX   00003C00
L06DF    DW    $0080      ; Icon type
         DW    $003C      ; Icon size
         DW    $000A      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFC3FFFF
         HEX   FFFFFFC03FFF
         HEX   FFFFFFC3C3FF
         HEX   FFFFFFC3FC3F
         HEX   FFFFFFC3C3FF
         HEX   FFFFFFC03FFF
         HEX   FFFFFFC3FFFF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000000000000
         HEX   0000003C0000
         HEX   0000003FC000
         HEX   0000003FFC00
         HEX   0000003FFFC0
         HEX   0000003FFC00
         HEX   0000003FC000
         HEX   0000003C0000
L075F    DW    $0080      ; Icon type
         DW    $003C      ; Icon size
         DW    $000A      ; Icon height
         DW    $000C      ; Icon width
         HEX   FFFFFFFFFFFF ; Icon image
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFC3FFFF
         HEX   FFFFFFC03FFF
         HEX   FFFFFFC003FF
         HEX   FFFFFFC0003F
         HEX   FFFFFFC003FF
         HEX   FFFFFFC03FFF
         HEX   FFFFFFC3FFFF
         HEX   000000000000 ; Icon mask
         HEX   000000000000
         HEX   000000000000
         HEX   0000003C0000
         HEX   0000003FC000
         HEX   0000003FFC00
         HEX   0000003FFFC0
         HEX   0000003FFC00
         HEX   0000003FC000
         HEX   0000003C0000
