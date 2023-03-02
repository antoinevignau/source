*
* HypercardGS
* segment: $21 HPrintHF
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintHF.l
         lst   off

*---------------------------------------

         use   HPrintHF.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L210000  ENT
         DW    $0000
         DW    $044C
         DW    $0000
         ADRL  L21001A
         ADRL  L21001E
         ADRL  L21002C
         ADRL  L21003A
         ADRL  L210048
L21001A  DW    $0000
         DW    $0000
L21001E  DW    $0000
         DW    $0009
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L210056
L21002C  DW    $0000
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L21005E
L21003A  DW    $0000
         DW    $0008
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L210066
L210048  DW    $0000
         DW    $0015
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L210076
L210056  STR   09'  Date'
L21005E  STR   0D'  Time'
L210066  STR   08'   Page Number'
L210076  STR   15' Stack Name'

L210083  DB    $0B
         DB    $00
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $3F
         DB    $FF
         DB    $F9
         DB    $38
         DB    $00
         DB    $39
         DB    $39
         DB    $FF
         DB    $39
         DB    $39
         DB    $FF
         DB    $19
         DB    $39
         DB    $FF
         DB    $19
         DB    $38
         DB    $00
         DB    $19
         DB    $3C
         DB    $AA
         DB    $99
         DB    $3C
         DB    $00
         DB    $19
         DB    $3F
         DB    $FF
         DB    $F9
         DB    $00
         DB    $00
         DB    $01
	 
L2100A8  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         JSL   L093F21
         LDA   L0551E9
         STA   $05
         PHY
         PHY
         PEA   $8001
         JSL   L1516BD
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BNE   L2100D3
         LDA   #$8001
         STA   $05
L2100D3  LDA   $05
         DEC
         BNE   L210106
         PHY
         PHY
         PEA   $0001
         JSL   L1516BD
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0002
         BCC   L2100F7
         INX
L2100F7  PHX
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCS   L210106
         LDA   #$FFFF
         STA   $05
L210106  LDA   $05
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L210111  PHD
         TSC
         CLC
         ADC   #$FDF2
         TCS
         ADC   #$011D
         TCD
         PEI   $F8
         PEI   $F6
         JSL   L15058C
         TDC
         CLC
         ADC   #$00FA
         PEA   $0000
         PHA
         PEA   $0001
         PEI   $F8
         PEI   $F6
         JSL   L15168D
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         TXY
         LDX   #$FFE5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L210159
         INX
L210159  STA   $ED
         STX   $EF
         LDA   [$ED]
         STA   $E9
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         PHY
         PHY
         PEI   $F8
         PEI   $F6
         JSL   L151379
         PHY
         PEI   $F8
         PEI   $F6
         JSL   L150807
         JSL   L160B1E
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FFE9
         AND   $00,X
         LDX   #$FFE3
         STA   $00,X
         LDX   #$FFE3
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L2101AC
         EOR   #$8000
L2101AC  BPL   L2101FD
         LDA   #$0001
         STA   $EB
L2101B3  LDA   $E9
         CMP   $EB
         BNE   L2101BB
         BRA   L2101F0
L2101BB  LDA   $EB
         CLC
         ADC   #$FFE9
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   $FA
         BNE   L2101F0
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE9
         PHA
         PEI   $EB
         PEA   $0001
         JSL   L150A64
         LDA   $EB
         SEC
         SBC   $E9
         BVS   L2101E7
         EOR   #$8000
L2101E7  BMI   L2101EE
         LDA   $E9
         DEC
         STA   $E9
L2101EE  BRA   L2101FD
L2101F0  LDA   $EB
         LDX   #$FFE3
         CMP   $00,X
         BEQ   L2101FD
         INC   $EB
         BRA   L2101B3
L2101FD  PEA   $0000
         TDC
         CLC
         ADC   #$FFEA
         PHA
         LDA   #$00FF
         LDX   #$FFE9
         AND   $00,X
         PHA
         PEI   $F8
         PEI   $F6
         JSL   L151651
         PEI   $E9
         PEI   $E9
         PEI   $F8
         PEI   $F6
         JSL   L1512D1
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         CLC
         ADC   #$0010
         BCC   L210232
         INX
L210232  PHX
         PHA
         JSL   L150B34
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0216
         TCS
         RTL

L21024A  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PEI   $18
         PEI   $16
         PEI   $14
         PEI   $12
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L071937
         LDA   $05
         INC
         STA   $05
         LDA   $07
         INC
         INC
         STA   $07
         PEI   $1C
         PEI   $1A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $10
         STA   $18
         LDA   $0F
         STA   $17
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L210298  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2C
         LDX   $2E
         STA   $19
         STX   $1B
         LDY   #$0004
         LDA   [$26],Y
         SEC
         SBC   $2C
         STA   $2C
         PEA   $0002
         JSL   L150BD6
         PEA   $3333
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEI   $28
         PEI   $26
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
L21030D  LDA   $26
         LDX   $28
         STA   $05
         STX   $07
         PHY
         LDA   $2C
         CLC
         ADC   $19
         PHA
         LDA   #$0009
         CLC
         ADC   [$05]
         PHA
         LDA   [$05]
         CLC
         ADC   $2A
         PHA
         JSL   L071A1B
         PLA
         STA   $19
         LDA   $26
         LDX   $28
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         DEC
         DEC
         PHA
         LDA   [$01]
         DEC
         PHA
         LDY   #$0006
         LDA   [$01],Y
         INC
         INC
         PHA
         LDA   $19
         INC
         PHA
         JSL   L15100B
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L2103AB
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L2103AB  TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L2103C9
         BRL   L21030D
L2103C9  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $0000
         JSL   L150BD6
         PEA   $0000
         JSL   L081DD8
         PHY
         PEI   $28
         PEI   $26
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         EOR   #$0001
         STA   $30
         PEI   $28
         PEI   $26
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $24
         STA   $2E
         LDA   $23
         STA   $2D
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L210435  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEA   $0000
         PEI   $0E
         JSL   L21114A
         PEA   $0000
         PEI   $0E
         JSL   L210BD3
         LDY   #$00ED
         LDA   [$0E],Y
         BNE   L210495
         PHY
         PHY
         LDY   #$00D7
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         PEA   $0006
         JSL   L160B2C
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         JSL   L1516D5
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0010
         BCC   L210487
         INX
L210487  PHX
         PHA
         JSL   L150B34
         LDA   #$0001
         LDY   #$00ED
         STA   [$0E],Y
L210495  LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L2104A7  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   $10
         SEC
         SBC   #$0043
         BPL   L2104BA
         BRL   L2105BD
L2104BA  CMP   #$003D
         BMI   L2104C2
         BRL   L2105BD
L2104C2  SEC
         SBC   #$0000
         BEQ   L2104EB
         SEC
         SBC   #$0013
         BEQ   L21053F
         DEC
         DEC
         BEQ   L2104EB
         SEC
         SBC   #$000B
         BEQ   L2104EB
         SEC
         SBC   #$0013
         BEQ   L21053F
         DEC
         DEC
         BEQ   L2104EB
         SEC
         SBC   #$0007
         BEQ   L2104EB
         BRL   L2105BD
L2104EB  LDY   #$00ED
         LDA   [$0C],Y
         BEQ   L210511
         PEI   $10
         PHY
         PHY
         LDY   #$00D7
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0006
         JSL   L160B2C
         PEA   $0001
         JSL   L160B3A
         BRA   L210534
L210511  LDA   #$00EF
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L21051C
         INX
L21051C  STA   $03
         STX   $05
         PHY
         PEI   $10
         PEA   $0000
         PEI   $0C
         JSL   L211320
         LDY   #$00EF
         PLA
         ORA   [$0C],Y
         STA   [$03]
L210534  PEA   $0000
         PEI   $0C
         JSL   L2105CF
         BRA   L2105BD
L21053F  PHY
         JSL   L2100A8
         PLA
         STA   $01
         LDA   $01
         BNE   L210572
         PEA   $0000
         PEI   $0C
         JSL   L210435
         PEA   $0056
         PHY
         PHY
         LDY   #$00D7
         LDA   [$0C],Y
         PHA
         DEY
         DEY
         LDA   [$0C],Y
         PHA
         PEA   $0006
         JSL   L160B2C
         PEA   $0001
         JSL   L160B3A
L210572  LDX   #$0000
         LDA   $01
         DEC
         BNE   L21057B
         INX
L21057B  PHX
         LDX   #$0000
         LDA   #$8001
         CMP   $01
         BNE   L210587
         INX
L210587  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L2105BB
         PEA   $0000
         PEI   $0C
         JSL   L21062D
         LDA   #$00EF
         CLC
         ADC   $0C
         LDX   $0E
         BCC   L2105A2
         INX
L2105A2  STA   $03
         STX   $05
         PHY
         PEA   $0056
         PEA   $0000
         PEI   $0C
         JSL   L211320
         LDY   #$00EF
         PLA
         ORA   [$0C],Y
         STA   [$03]
L2105BB  BRA   L2105BD
L2105BD  LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L2105CF  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L2100A8
         PLA
         STA   $01
         LDA   #$00FF
         STA   $03
         LDA   L055051
         BNE   L210607
         LDX   #$0000
         LDA   $01
         DEC
         BNE   L2105F2
         INX
L2105F2  PHX
         LDX   #$0000
         LDA   #$8001
         CMP   $01
         BNE   L2105FE
         INX
L2105FE  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L210607
         STZ   $03
L210607  PEI   $03
         LDY   #$00D7
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         PEA   $0003
         JSL   L072E7C
         LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L21062D  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$00ED
         LDA   [$0E],Y
         BEQ   L21067B
         PHY
         PHY
         LDY   #$00D7
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         PEA   $0006
         JSL   L160B2C
         PLA
         STA   $01
         PLX
         STX   $03
         PEI   $03
         PEI   $01
         JSL   L1516E7
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0010
         BCC   L21066D
         INX
L21066D  PHX
         PHA
         JSL   L150B34
         LDA   #$0000
         LDY   #$00ED
         STA   [$0E],Y
L21067B  LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L21068D  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDA   #$008D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2106A0
         INX
L2106A0  PHX
         PHA
         JSL   L15123D
         LDA   #$009D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2106B1
         INX
L2106B1  STA   $09
         STX   $0B
         LDA   #$008D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2106C0
         INX
L2106C0  PHX
         PHA
         LDY   #$0006
         LDA   [$09],Y
         SEC
         SBC   #$0015
         PHA
         LDY   #$0004
         LDA   [$09],Y
         SEC
         SBC   #$000A
         PHA
         LDY   #$0006
         LDA   [$09],Y
         PHA
         LDY   #$0004
         LDA   [$09],Y
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   #$009D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2106FA
         INX
L2106FA  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L151418
         LDA   #$009D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L21072E
         INX
L21072E  STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$05],Y
         DEC
         DEC
         PHA
         LDY   #$0004
         LDA   [$05],Y
         INC
         PHA
         LDY   #$0006
         LDA   [$05],Y
         INC
         INC
         PHA
         LDA   #$0032
         CLC
         ADC   [$05]
         INC
         INC
         PHA
         JSL   L15100B
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L15123D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEI   $1E
         JSL   L21102C
         PEA   $0000
         PEI   $1E
         JSL   L211221
         LDA   #$008D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L21078F
         INX
L21078F  PHX
         PHA
         JSL   L15123D
         LDA   #$008D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2107A0
         INX
L2107A0  STA   $01
         STX   $03
         PEA   ^L210083
         PEA   L210083
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L087218
         LDA   $1C
         STA   $20
         LDA   $1B
         STA   $1F
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L2107C9  PHD
         TSC
         CLC
         ADC   #$FFA2
         TCS
         TCD
         STZ   $68
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $4F
         PLX
         STX   $51
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $4B
         PLX
         STX   $4D
         JSL   L150659
         LDA   #$009D
         CLC
         ADC   $64
         LDX   $66
         BCC   L2107FA
         INX
L2107FA  PHX
         PHA
         JSL   L151418
         LDA   #$008D
         CLC
         ADC   $64
         LDX   $66
         BCC   L21080B
         INX
L21080B  PHX
         PHA
         JSL   L151418
         PEI   $4D
         PEI   $4B
         JSL   L15166F
         PEI   $4D
         PEI   $4B
         JSL   L1516C9
         PHY
         LDA   #$00B5
         CLC
         ADC   $64
         LDX   $66
         BCC   L21082D
         INX
L21082D  PHX
         PHA
         LDA   #$0095
         CLC
         ADC   $64
         LDX   $66
         BCC   L21083A
         INX
L21083A  PHX
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L210866
         PEA   $0004
         JSL   L0724F7
         PHY
         LDY   #$00B7
         LDA   [$64],Y
         PHA
         DEY
         DEY
         LDA   [$64],Y
         PHA
         PEA   $0000
         PEI   $64
         JSL   L2118BB
         PLA
         STA   $68
         BRL   L210BB1
L210866  PEA   $0000
         PEI   $64
         JSL   L21114A
         PEA   $0000
         PEI   $64
         JSL   L210BD3
         PEA   $0002
         JSL   L150BD6
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         PEA   $0002
         PEA   $0001
         JSL   L151083
         LDY   #$00B7
         LDA   [$64],Y
         TAX
         DEY
         DEY
         LDA   [$64],Y
         STA   $43
         STX   $45
         LDA   $43
         LDX   $45
         STA   $47
         STX   $49
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L08273B
L2108B6  LDA   $49
         BPL   L2108BC
         STZ   $49
L2108BC  LDA   $47
         BPL   L2108C2
         STZ   $47
L2108C2  LDA   #$FFFE
         AND   $49
         STA   $49
         PHY
         PHY
         PEI   $49
         PEI   $47
         LDA   #$009D
         CLC
         ADC   $64
         LDX   $66
         BCC   L2108DA
         INX
L2108DA  PHX
         PHA
         JSL   L1505B6
         PLA
         STA   $47
         PLX
         STX   $49
         PHY
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L21097B
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDY   #$00B7
         LDA   [$64],Y
         PHA
         DEY
         DEY
         LDA   [$64],Y
         PHA
         PEI   $49
         PEI   $47
         JSL   L21024A
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDY   #$00B7
         LDA   [$64],Y
         PHA
         DEY
         DEY
         LDA   [$64],Y
         PHA
         PEI   $45
         PEI   $43
         JSL   L21024A
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         JSL   L151418
         LDA   $47
         LDX   $49
         STA   $43
         STX   $45
L21097B  TDC
         CLC
         ADC   #$0047
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L210999
         BRL   L2108B6
L210999  PEA   $0000
         JSL   L081DD8
         PEA   $0000
         JSL   L150BD6
         LDA   $39
         SEC
         SBC   $35
         SEC
         SBC   #$0002
         BEQ   L2109B9
         BVS   L2109B7
         EOR   #$8000
L2109B7  BMI   L2109BE
L2109B9  LDA   #$0000
         BRA   L2109C1
L2109BE  LDA   #$0001
L2109C1  PHA
         LDA   $37
         SEC
         SBC   $33
         SEC
         SBC   #$0001
         BEQ   L2109D4
         BVS   L2109D2
         EOR   #$8000
L2109D2  BMI   L2109D9
L2109D4  LDA   #$0000
         BRA   L2109DC
L2109D9  LDA   #$0001
L2109DC  AND   $01,S
         PLX
         STA   $57
         LDA   $57
         BNE   L2109E8
         BRL   L210B9F
L2109E8  LDA   #$0095
         CLC
         ADC   $64
         LDX   $66
         BCC   L2109F3
         INX
L2109F3  PHX
         PHA
         TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         LDY   #$00EB
         STA   [$64],Y
         LDY   #$00D7
         LDA   [$64],Y
         TAX
         DEY
         DEY
         LDA   [$64],Y
         CLC
         ADC   #$0010
         BCC   L210A1E
         INX
L210A1E  STA   $0D
         STX   $0F
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDY   #$0006
         LDA   [$0D],Y
         PHA
         LDY   #$0004
         LDA   [$0D],Y
         PHA
         JSL   L15100B
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $27
         PLX
         STX   $29
         JSL   L150659
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $29
         PEI   $27
         JSL   L15166F
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         LDA   #$0095
         CLC
         ADC   $64
         LDX   $66
         BCC   L210A7A
         INX
L210A7A  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$009D
         CLC
         ADC   $64
         LDX   $66
         BCC   L210A8E
         INX
L210A8E  STA   $09
         STX   $0B
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$09],Y
         EOR   #$FFFF
         INC
         PHA
         LDA   [$09]
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $31
         SEC
         SBC   $2D
         PHA
         LDA   $2F
         SEC
         SBC   $2B
         PHA
         JSL   L15100B
         LDY   #$00FA
         LDA   [$64],Y
         BEQ   L210AEE
         LDA   L05532F
         LDX   L055331
         STA   $5B
         STX   $5D
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         STA   $53
         STX   $55
         BRA   L210B04
L210AEE  LDA   L05532B
         LDX   L05532D
         STA   $5B
         STX   $5D
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         STA   $53
         STX   $55
L210B04  LDA   $53
         LDX   $55
         STA   $11
         STX   $13
         LDA   $53
         LDX   $55
         STA   $15
         STX   $17
         TDC
         CLC
         ADC   #$002B
         STA   $19
         STZ   $1B
         TDC
         CLC
         ADC   #$003B
         STA   $1D
         STZ   $1F
         STZ   $21
         LDA   $27
         LDX   $29
         STA   $23
         STX   $25
         PEI   $55
         PEI   $53
         JSL   L151131
         LDA   #$00B9
         CLC
         ADC   $64
         LDX   $66
         BCC   L210B43
         INX
L210B43  STA   $5B
         STX   $5D
         PHY
         PHY
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         JSL   L1502FA
         PLA
         STA   [$5B]
         PLA
         LDY   #$0002
         STA   [$5B],Y
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L150476
         JSL   L151400
         PEI   $29
         PEI   $27
         JSL   L151669
         TDC
         CLC
         ADC   #$002B
         PEA   $0000
         PHA
         JSL   L15123D
         LDY   #$00D7
         LDA   [$64],Y
         PHA
         DEY
         DEY
         LDA   [$64],Y
         PHA
         JSL   L151131
         PEA   $0000
         PEI   $64
         JSL   L21062D
         BRA   L210BB1
L210B9F  TDC
         CLC
         ADC   #$0033
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $64
         JSL   L21102C
L210BB1  PEI   $51
         PEI   $4F
         JSL   L1516C9
         PEI   $4D
         PEI   $4B
         JSL   L151669
         LDA   $62
         STA   $66
         LDA   $61
         STA   $65
         LDA   $5F
         TCD
         TSC
         CLC
         ADC   #$0064
         TCS
         RTL

L210BD3  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDY   #$00EB
         LDA   [$16],Y
         BNE   L210BE5
         BRL   L210CA6
L210BE5  LDA   #$0000
         LDY   #$00EB
         STA   [$16],Y
         PHY
         LDA   #$0095
         CLC
         ADC   $16
         LDX   $18
         BCC   L210BF9
         INX
L210BF9  PHX
         PHA
         LDA   #$009D
         CLC
         ADC   $16
         LDX   $18
         BCC   L210C06
         INX
L210C06  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L210C2B
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $16
         JSL   L21102C
L210C2B  PHY
         LDA   #$0095
         CLC
         ADC   $16
         LDX   $18
         BCC   L210C37
         INX
L210C37  PHX
         PHA
         LDA   #$008D
         CLC
         ADC   $16
         LDX   $18
         BCC   L210C44
         INX
L210C44  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L210C86
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         LDA   #$008D
         CLC
         ADC   $16
         LDX   $18
         BCC   L210C6F
         INX
L210C6F  STA   $01
         STX   $03
         PEA   ^L210083
         PEA   L210083
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L087218
L210C86  LDA   #$0095
         CLC
         ADC   $16
         LDX   $18
         BCC   L210C91
         INX
L210C91  PHX
         PHA
         JSL   L08273B
         LDY   #$00BB
         LDA   [$16],Y
         PHA
         DEY
         DEY
         LDA   [$16],Y
         PHA
         JSL   L1502F4
L210CA6  LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L210CB8  PHD
         TSC
         CLC
         ADC   #$FF76
         TCS
         TCD
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEI   $A4
         PEI   $A2
         PEA   $0020
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $9C
         PEI   $9A
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $98
         PEI   $96
         PEA   $0008
         JSL   L0313BE
         PHY
         JSL   L150BDC
         PLA
         STA   $81
         TDC
         CLC
         ADC   #$007D
         PEA   $0000
         PHA
         JSL   L15107D
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L15119E
         PEA   $0002
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151198
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0059
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         LDA   #$0095
         CLC
         ADC   $90
         LDX   $92
         BCC   L210D85
         INX
L210D85  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $9E
         LDX   $A0
         STA   $79
         STX   $7B
         LDA   $9E
         LDX   $A0
         STA   $71
         STX   $73
         LDA   $A0
         SEC
         SBC   $5B
         STA   $A0
         LDA   $9E
         SEC
         SBC   $59
         STA   $9E
         LDA   $0F
         SEC
         SBC   $0B
         STA   $85
         LDA   $0D
         SEC
         SBC   $09
         STA   $83
         LDA   $07
         SEC
         SBC   $03
         STA   $87
         LDA   $85
         SEC
         SBC   $87
         STA   $85
         LDA   $05
         SEC
         SBC   $01
         STA   $87
         LDA   $83
         SEC
         SBC   $87
         STA   $83
         PHY
         PEA   $0000
         PEI   $85
         JSL   L072FA6
         PLA
         STA   $85
         PHY
         PEA   $0000
         PEI   $83
         JSL   L072FA6
         PLA
         STA   $83
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $85
         EOR   #$FFFF
         INC
         PHA
         LDA   $83
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
L210E0B  PHY
         PEA   $0000
         PEI   $73
         JSL   L072FA6
         PLA
         STA   $73
         PHY
         PEA   $0000
         PEI   $71
         JSL   L072FA6
         PLA
         STA   $71
         PHY
         PHY
         PEI   $73
         PEI   $71
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1505B6
         PLA
         STA   $71
         PLX
         STX   $73
         LDA   $73
         SEC
         SBC   $7B
         STA   $85
         LDA   $85
         BMI   L210E5D
         BEQ   L210E5D
         PHY
         PEI   $85
         LDA   $07
         SEC
         SBC   $0F
         PHA
         JSL   L072FD5
         PLA
         STA   $85
         BRA   L210E6D
L210E5D  PHY
         PEI   $85
         LDA   $03
         SEC
         SBC   $0B
         PHA
         JSL   L072FA6
         PLA
         STA   $85
L210E6D  LDA   $94
         BEQ   L210E85
         PEI   $85
         PEI   $85
         PEI   $94
         JSL   L150318
         PLX
         PLX
         STA   $87
         PLA
         SEC
         SBC   $87
         STA   $85
L210E85  LDA   $71
         SEC
         SBC   $79
         STA   $83
         LDA   $83
         BMI   L210EA4
         BEQ   L210EA4
         PHY
         PEI   $83
         LDA   $05
         SEC
         SBC   $0D
         PHA
         JSL   L072FD5
         PLA
         STA   $83
         BRA   L210EB4
L210EA4  PHY
         PEI   $83
         LDA   $01
         SEC
         SBC   $09
         PHA
         JSL   L072FA6
         PLA
         STA   $83
L210EB4  LDA   $94
         BEQ   L210ED6
         PEI   $83
         PEI   $83
         PEI   $94
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L150318
         PLX
         PLX
         STA   $87
         PLA
         SEC
         SBC   $87
         STA   $83
L210ED6  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $85
         PEI   $83
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCC   L210F05
         BRL   L210FBE
L210F05  TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L1512D7
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $90
         JSL   L21102C
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $6B
         SEC
         SBC   $5B
         STA   $77
         LDA   $69
         SEC
         SBC   $59
         STA   $75
         LDA   #$0095
         CLC
         ADC   $90
         LDX   $92
         BCC   L210F68
         INX
L210F68  PHX
         PHA
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0095
         CLC
         ADC   $90
         LDX   $92
         BCC   L210F85
         INX
L210F85  PHX
         PHA
         PEI   $77
         PEI   $75
         JSL   L1501AF
         PEA   $0000
         PEI   $90
         JSL   L211221
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0079
         PEA   $0000
         PHA
         LDA   $A0
         CLC
         ADC   $6B
         PHA
         LDA   $9E
         CLC
         ADC   $69
         PHA
         JSL   L151355
L210FBE  TDC
         CLC
         ADC   #$0071
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L210FDC
         BRL   L210E0B
L210FDC  LDA   $6B
         SEC
         SBC   $5B
         STA   $77
         LDA   $69
         SEC
         SBC   $59
         STA   $75
         LDA   $75
         LDX   $77
         STA   $A6
         STX   $A8
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $81
         JSL   L150BD6
         PEI   $7F
         PEI   $7D
         JSL   L151083
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L151198
         LDA   $8E
         STA   $A4
         LDA   $8D
         STA   $A3
         LDA   $8B
         TCD
         TSC
         CLC
         ADC   #$00A2
         TCS
         RTL

L21102C  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2A
         ORA   $2C
         BNE   L211059
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   #$009D
         CLC
         ADC   $26
         LDX   $28
         BCC   L21104E
         INX
L21104E  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L21106D
L211059  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEI   $2C
         PEI   $2A
         PEA   $0008
         JSL   L0313BE
L21106D  PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L1500E3
         PLA
         LSR
         BCS   L211082
         BRL   L211138
L211082  PHY
         PHY
         JSL   L150493
         PLA
         STA   $19
         PLX
         STX   $1B
         LDY   #$00D7
         LDA   [$26],Y
         PHA
         DEY
         DEY
         LDA   [$26],Y
         PHA
         JSL   L151131
         LDY   #$00FA
         LDA   [$26],Y
         BEQ   L2110BC
         LDA   L05532F
         LDX   L055331
         STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $15
         STX   $17
         BRA   L2110D2
L2110BC  LDA   L05532B
         LDX   L05532D
         STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $15
         STX   $17
L2110D2  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$009D
         CLC
         ADC   $26
         LDX   $28
         BCC   L2110F6
         INX
L2110F6  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         EOR   #$FFFF
         INC
         PHA
         LDA   [$01]
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         PEI   $17
         PEI   $15
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEI   $07
         PEI   $05
         PEA   $0000
         JSL   L15025A
         PEI   $1B
         PEI   $19
         JSL   L151131
L211138  LDA   $24
         STA   $2C
         LDA   $23
         STA   $2B
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L21114A  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDY   #$00EB
         LDA   [$1E],Y
         BNE   L21115C
         BRL   L21120F
L21115C  LDY   #$00FA
         LDA   [$1E],Y
         BEQ   L21117B
         LDA   L05532F
         LDX   L055331
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $05
         STX   $07
         BRA   L211191
L21117B  LDA   L05532B
         LDX   L05532D
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $05
         STX   $07
L211191  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   #$0095
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2111A5
         INX
L2111A5  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$009D
         CLC
         ADC   $1E
         LDX   $20
         BCC   L2111B9
         INX
L2111B9  STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$01],Y
         EOR   #$FFFF
         INC
         PHA
         LDA   [$01]
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $09
         PLX
         STX   $0B
         PEI   $07
         PEI   $05
         JSL   L151131
         LDY   #$00BB
         LDA   [$1E],Y
         PHA
         DEY
         DEY
         LDA   [$1E],Y
         PHA
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L150683
         PEI   $0B
         PEI   $09
         JSL   L151131
L21120F  LDA   $1C
         STA   $20
         LDA   $1B
         STA   $1F
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L211221  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDY   #$00EB
         LDA   [$22],Y
         BNE   L211233
         BRL   L21130E
L211233  PHY
         PHY
         JSL   L150493
         PLA
         STA   $15
         PLX
         STX   $17
         LDY   #$00D7
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         JSL   L151131
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $11
         PLX
         STX   $13
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $0D
         PLX
         STX   $0F
         PEI   $0F
         PEI   $0D
         JSL   L1516C9
         LDA   #$009D
         CLC
         ADC   $22
         LDX   $24
         BCC   L211279
         INX
L211279  PHX
         PHA
         JSL   L150FF9
         LDY   #$00BB
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         LDA   #$0095
         CLC
         ADC   $22
         LDX   $24
         BCC   L211295
         INX
L211295  PHX
         PHA
         JSL   L150683
         PHY
         LDA   #$0095
         CLC
         ADC   $22
         LDX   $24
         BCC   L2112A7
         INX
L2112A7  PHX
         PHA
         LDA   #$008D
         CLC
         ADC   $22
         LDX   $24
         BCC   L2112B4
         INX
L2112B4  PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L2112F6
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         LDA   #$008D
         CLC
         ADC   $22
         LDX   $24
         BCC   L2112DF
         INX
L2112DF  STA   $01
         STX   $03
         PEA   ^L210083
         PEA   L210083
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L087218
L2112F6  PEI   $13
         PEI   $11
         JSL   L1516C9
         PEI   $0F
         PEI   $0D
         JSL   L151669
         PEI   $17
         PEI   $15
         JSL   L151131
L21130E  LDA   $20
         STA   $24
         LDA   $1F
         STA   $23
         LDA   $1D
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L211320  PHD
         TSC
         CLC
         ADC   #$FEB6
         TCS
         ADC   #$0059
         TCD
         STZ   $FC
         LDA   $FA
         SEC
         SBC   #$0043
         BPL   L211338
         BRL   L2118A9
L211338  CMP   #$003D
         BMI   L211340
         BRL   L2118A9
L211340  SEC
         SBC   #$0000
         BEQ   L211372
         SEC
         SBC   #$0013
         BNE   L21134F
         BRL   L2113EA
L21134F  DEC
         DEC
         BEQ   L211372
         SEC
         SBC   #$000B
         BEQ   L211372
         SEC
         SBC   #$0013
         BNE   L211362
         BRL   L2113EA
L211362  DEC
         DEC
         BEQ   L211372
         SEC
         SBC   #$0007
         BNE   L21136F
         BRL   L211899
L21136F  BRL   L2118A9
L211372  LDY   #$00EB
         LDA   [$F6],Y
         BEQ   L2113E7
         JSL   L150395
         PHY
         PHY
         LDY   #$00BB
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L151301
         PLA
         STA   $E5
         PLX
         STX   $E7
         PHY
         PEI   $E7
         PEI   $E5
         PEA   $0001
         LDY   #$00BB
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         JSL   L0732FD
         PLA
         STA   $EB
         LDX   #$0000
         LDA   #$0058
         CMP   $FA
         BNE   L2113C6
         INX
L2113C6  PHX
         LDX   #$0000
         LDA   #$0078
         CMP   $FA
         BNE   L2113D2
         INX
L2113D2  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L2113E7
         LDA   #$0001
         STA   $FC
         PEA   $0000
         PEI   $F6
         JSL   L210BD3
L2113E7  BRL   L2118A9
L2113EA  LDA   #$0001
         STA   $FC
         PEA   $0000
         PEI   $F6
         JSL   L21114A
         PEA   $0000
         PEI   $F6
         JSL   L210BD3
         PHY
         JSL   L2100A8
         PLA
         CMP   #$0001
         BNE   L21145B
         LDA   #$00B9
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L211417
         INX
L211417  STA   $ED
         STX   $EF
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $07D0
         JSL   L160A30
         PLA
         STA   [$ED]
         PLA
         LDY   #$0002
         STA   [$ED],Y
         LDY   #$00B9
         LDA   [$F6],Y
         INY
         INY
         ORA   [$F6],Y
         BEQ   L211455
         LDY   #$00BB
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         PEA   $0001
         JSL   L15064D
         BRA   L211458
L211455  BRL   L211897
L211458  BRL   L2115DD
L21145B  PHY
         PHY
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $07DC
         JSL   L160A30
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   $DD
         ORA   $DF
         BNE   L21147C
         BRL   L211897
L21147C  PEI   $DF
         PEI   $DD
         PEA   $8001
         JSL   L15064D
         LDAL  L05565D
         BEQ   L211498
         PEI   $DF
         PEI   $DD
         JSL   L07185A
         BRL   L211897
L211498  PEI   $DF
         PEI   $DD
         JSL   L0718BF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         TXY
         LDX   #$FFB7
         STA   $00,X
         TYA
         STA   $02,X
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #$FFB7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L2114D0
         INX
L2114D0  STA   $ED
         STX   $EF
         LDA   [$ED]
         ASL
         PHA
         LDX   #$FFB7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L2114E8
         INX
L2114E8  STA   $ED
         STX   $EF
         LDA   [$ED]
         PHA
         JSL   L15100B
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $D9
         PLX
         STX   $DB
         JSL   L150659
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $DB
         PEI   $D9
         JSL   L15166F
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $E1
         PLX
         STX   $E3
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         JSL   L15123D
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         PHX
         PHA
         PEA   $F000
         PEI   $D3
         PEI   $D1
         JSL   L15047C
         LDA   #L053239
         LDX   #^L053239
         STA   $BB
         STX   $BD
         LDA   #L053239
         LDX   #^L053239
         STA   $BF
         STX   $C1
         TDC
         CLC
         ADC   #$00D1
         STA   $C3
         STZ   $C5
         TDC
         CLC
         ADC   #$00D1
         STA   $C7
         STZ   $C9
         STZ   $CB
         LDA   $D9
         LDX   $DB
         STA   $CD
         STX   $CF
         LDA   #$00B9
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L21158B
         INX
L21158B  STA   $ED
         STX   $EF
         PHY
         PHY
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         JSL   L1502FA
         PLA
         STA   [$ED]
         PLA
         LDY   #$0002
         STA   [$ED],Y
         TDC
         CLC
         ADC   #$00BB
         PEA   $0000
         PHA
         JSL   L150476
         JSL   L151400
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         JSL   L085216
         PEI   $DB
         PEI   $D9
         JSL   L151669
         PEI   $E3
         PEI   $E1
         JSL   L151131
         PEI   $DF
         PEI   $DD
         JSL   L07185A
L2115DD  LDY   #$00BB
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         CLC
         ADC   #$0002
         BCC   L2115FA
         INX
L2115FA  TXY
         LDX   #$FFB3
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFB3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L211613
         INX
L211613  STA   $ED
         STX   $EF
         LDA   [$ED]
         PHA
         LDX   #$FFB3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L21162A
         INX
L21162A  STA   $ED
         STX   $EF
         PLA
         SEC
         SBC   [$ED]
         STA   $E9
         LDY   #$00BB
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $ED
         STX   $EF
         LDA   [$ED]
         BNE   L211676
         LDA   $E9
         ASL
         STA   $E9
         LDY   #$00BB
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $ED
         STX   $EF
         LDA   #$0080
         STA   [$ED]
L211676  LDA   #$0095
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L211681
         INX
L211681  TXY
         LDX   #$FFAF
         STA   $00,X
         TYA
         STA   $02,X
         LDA   $E9
         SEC
         SBC   #$0240
         BVS   L211695
         EOR   #$8000
L211695  BMI   L2116BF
         LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2116A7
         INX
L2116A7  STA   $ED
         STX   $EF
         LDA   #$0240
         SEC
         SBC   $E9
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   [$ED]
         BRA   L2116D8
L2116BF  LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2116CF
         INX
L2116CF  STA   $ED
         STX   $EF
         LDA   #$0000
         STA   [$ED]
L2116D8  LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2116E8
         INX
L2116E8  PHX
         PHA
         LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2116FA
         INX
L2116FA  STA   $ED
         STX   $EF
         LDA   [$ED]
         PHA
         LDA   #$009D
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L21170C
         INX
L21170C  CLC
         ADC   #$0002
         BCC   L211713
         INX
L211713  STA   $ED
         STX   $EF
         PLA
         CLC
         ADC   [$ED]
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L211733
         INX
L211733  PHX
         PHA
         LDX   #$FFAF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211745
         INX
L211745  STA   $ED
         STX   $EF
         LDA   $E9
         CLC
         ADC   [$ED]
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         LDA   #$0095
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L211761
         INX
L211761  PHX
         PHA
         LDA   #$0095
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L21176E
         INX
L21176E  CLC
         ADC   #$0002
         BCC   L211775
         INX
L211775  STA   $ED
         STX   $EF
         LDA   #$0001
         AND   [$ED]
         EOR   #$FFFF
         INC
         PHA
         PEA   $0000
         JSL   L1501AF
         LDY   #$00BB
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         CLC
         ADC   #$0002
         BCC   L2117A7
         INX
L2117A7  TXY
         LDX   #$FFAB
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFAB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L2117C0
         INX
L2117C0  STA   $ED
         STX   $EF
         LDA   [$ED]
         PHA
         LDX   #$FFAB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         PLA
         SEC
         SBC   [$ED]
         STA   $E9
         LDA   #$0095
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L2117E7
         INX
L2117E7  TXY
         LDX   #$FFA7
         STA   $00,X
         TYA
         STA   $02,X
         LDA   $E9
         SEC
         SBC   #$0032
         BVS   L2117FB
         EOR   #$8000
L2117FB  BMI   L21181E
         LDX   #$FFA7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   #$0032
         SEC
         SBC   $E9
         PHA
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   [$ED]
         BRA   L211830
L21181E  LDX   #$FFA7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   #$0000
         STA   [$ED]
L211830  LDX   #$FFA7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDX   #$FFA7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDY   #$009D
         LDA   [$F6],Y
         CLC
         ADC   [$ED]
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         LDX   #$FFA7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L211868
         INX
L211868  PHX
         PHA
         LDX   #$FFA7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDA   $E9
         CLC
         ADC   [$ED]
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         LDA   #$0001
         LDY   #$00EB
         STA   [$F6],Y
         PEA   $0000
         PEI   $F6
         JSL   L211221
L211897  BRA   L2118A9
L211899  LDA   #$0001
         STA   $FC
         PEA   $0000
         PEI   $F6
         JSL   L210BD3
         BRA   L2118A9
L2118A9  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0152
         TCS
         RTL

L2118BB  PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         STZ   $20
         LDA   #$0800
         ANDL  L0540AD
         SEC
         SBC   #$0000
         BMI   L2118E2
         BEQ   L2118E2
         PEA   $0000
         PEI   $18
         JSL   L21114A
         LDA   #$0001
         STA   $20
L2118E2  LDA   #$0200
         ANDL  L0540AD
         BNE   L2118F2
         LDA   #$0002
         STA   $0D
         BRA   L2118F4
L2118F2  STZ   $0D
L2118F4  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$009D
         CLC
         ADC   $18
         LDX   $1A
         BCC   L211908
         INX
L211908  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0032
         CLC
         ADC   $01
         STA   $05
         PHY
         PHY
         PEA   ^L054F6B
         PEA   L054F6B
         PEI   $1E
         PEI   $1C
         LDA   #$0095
         CLC
         ADC   $18
         LDX   $1A
         BCC   L211930
         INX
L211930  PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $0D
         PEA   $0000
         PEI   $18
         JSL   L210CB8
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $0B
         BEQ   L211953
         LDA   #$0001
L211953  PHA
         LDA   $09
         BEQ   L21195B
         LDA   #$0001
L21195B  ORA   $01,S
         PLX
         STA   $20
         LDA   $16
         STA   $1E
         LDA   $15
         STA   $1D
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L211972  ENT
         PHD
         TSC
         CLC
         ADC   #$FDB3
         TCS
         ADC   #$0158
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   $FA
         BEQ   L21199E
         LDA   #L051F22
         LDX   #^L051F22
         STA   $D1
         STX   $D3
         LDA   #$4010
         STA   $E5
         BRA   L2119AD
L21199E  LDA   #L051FF3
         LDX   #^L051FF3
         STA   $D1
         STX   $D3
         LDA   #$4074
         STA   $E5
L2119AD  PHY
         PHY
         PEI   $E5
         JSL   L072834
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDA   $D5
         LDX   $D7
         TXY
         LDX   #$FEB8
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEB8
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$00A0
         BCC   L2119D8
         INX
L2119D8  PHX
         PHA
         LDX   #$FEB8
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$00A0
         BCC   L2119EA
         INX
L2119EA  STA   $F1
         STX   $F3
         LDA   #$8000
         ORA   [$F1]
         PLX
         STX   $F1
         PLX
         STX   $F3
         STA   [$F1]
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBC
         PHA
         PEI   $D3
         PEI   $D1
         PEA   $00D1
         JSL   L0313BE
         PHY
         PHY
         PEA   $0000
         PEA   ^L210000
         PEA   L210000
         JSL   L1502E8
         PLA
         STA   $BD
         PLX
         STX   $BF
         LDA   $D1
         LDX   $D3
         TXY
         LDX   #$FEB4
         STA   $00,X
         TYA
         STA   $02,X
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0007
         JSL   L073032
         LDX   #$FEB0
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         PHY
         LDX   #$FEB4
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L211A58
         INX
L211A58  PHX
         PHA
         PEA   $0001
         JSL   L160A92
         PLA
         STA   $E1
         PEI   $D7
         PEI   $D5
         PEA   $0006
         LDX   #$FEB4
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L211A7B
         INX
L211A7B  PHX
         PHA
         JSL   L073A7B
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         LDX   #$FEB0
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211A9A
         INX
L211A9A  STA   $F1
         STX   $F3
         LDA   [$F1]
         PHA
         LDX   #$FEB0
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F1
         STX   $F3
         LDA   [$F1]
         PHA
         LDX   #$FEB0
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211AC3
         INX
L211AC3  STA   $F1
         STX   $F3
         LDA   #$0240
         CLC
         ADC   [$F1]
         PHA
         LDX   #$FEB0
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F1
         STX   $F3
         LDA   [$F1]
         PHA
         LDX   #$FEB4
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211AF0
         INX
L211AF0  STA   $F1
         STX   $F3
         PLA
         CLC
         ADC   [$F1]
         PHA
         JSL   L15100B
         LDX   #$FEB4
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L211B0D
         INX
L211B0D  STA   $F1
         STX   $F3
         LDA   #$00FF
         AND   [$F1]
         SEC
         SBC   #$0000
         BMI   L211B25
         BEQ   L211B25
         LDA   $A1
         SEC
         SBC   $E1
         STA   $A1
L211B25  LDX   #$FEB4
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $F1
         STX   $F3
         LDA   [$F1]
         STA   $E3
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         JSL   L08273B
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         JSL   L08273B
         STZ   $EB
         LDA   #$0001
         STA   $ED
         STZ   $EF
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0006
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $0000
         PHD
         JSL   L2105CF
         PEI   $E3
         PEI   $D7
         PEI   $D5
         PEA   $0005
         JSL   L073B05
         PEI   $D7
         PEI   $D5
         JSL   L15102F
         PEI   $D7
         PEI   $D5
         JSL   L1511C8
         PEI   $D7
         PEI   $D5
         JSL   L151131
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PHY
         JSL   L0727BF
         PLA
         STA   $D9
L211BCA  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $E7
         LDAL  L0540AB
         TAX
         LDAL  L0540A9
         STA   $B5
         STX   $B7
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         JSL   L150BE8
         LDA   #$FFFD
         CMP   $E7
         BEQ   L211BF9
         BRL   L211CC5
L211BF9  LDA   #$007F
         ANDL  L0540A1
         STA   $E5
         LDA   $E5
         SEC
         SBC   #$0009
         BPL   L211C0D
         BRL   L211C9F
L211C0D  CMP   #$0077
         BMI   L211C15
         BRL   L211C9F
L211C15  SEC
         SBC   #$0000
         BEQ   L211C66
         DEC
         BEQ   L211C9D
         DEC
         BEQ   L211C9D
         SEC
         SBC   #$000D
         BEQ   L211C47
         SEC
         SBC   #$002B
         BEQ   L211C70
         SEC
         SBC   #$0015
         BEQ   L211C70
         SEC
         SBC   #$000B
         BEQ   L211C70
         SEC
         SBC   #$0015
         BEQ   L211C70
         SEC
         SBC   #$0007
         BEQ   L211C47
         BRA   L211C9F
L211C47  LDA   $ED
         BEQ   L211C59
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L072354
         PLA
         STA   $E7
         BRA   L211C64
L211C59  PEA   $007F
         PEA   $0000
         PHD
         JSL   L2104A7
L211C64  BRA   L211CC5
L211C66  PEA   $0000
         PHD
         JSL   L210435
         BRA   L211CC5
L211C70  LDA   #$0100
         ANDL  L0540AD
         BEQ   L211C8B
         LDA   $ED
         ORA   $EB
         BEQ   L211C89
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L2104A7
L211C89  BRA   L211C9B
L211C8B  LDA   $ED
         BEQ   L211C9B
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L072354
         PLA
         STA   $E7
L211C9B  BRA   L211CC5
L211C9D  BRA   L211CC5
L211C9F  PHY
         PEI   $D7
         PEI   $D5
         JSL   L072354
         PLA
         STA   $E7
         LDA   #$0100
         ANDL  L0540AD
         BEQ   L211CB7
         LDA   #$0001
L211CB7  AND   $ED
         BEQ   L211CC5
         PEI   $E5
         PEA   $0000
         PHD
         JSL   L2104A7
L211CC5  LDA   #$FFFE
         CMP   $E7
         BNE   L211CD1
         LDA   #$0063
         STA   $E7
L211CD1  LDA   $E7
         BPL   L211CD8
         BRL   L212119
L211CD8  CMP   #$0064
         BMI   L211CE0
         BRL   L212119
L211CE0  SEC
         SBC   #$0000
         BEQ   L211D19
         DEC
         BNE   L211CEC
         BRL   L211E73
L211CEC  DEC
         BNE   L211CF2
         BRL   L211F89
L211CF2  DEC
         BNE   L211CF8
         BRL   L211FBE
L211CF8  DEC
         BNE   L211CFE
         BRL   L212041
L211CFE  DEC
         BNE   L211D04
         BRL   L211F9B
L211D04  DEC
         BNE   L211D0A
         BRL   L211FB3
L211D0A  DEC
         BNE   L211D10
         BRL   L211FCC
L211D10  SEC
         SBC   #$005C
         BEQ   L211D19
         BRL   L212119
L211D19  LDA   $E7
         BEQ   L211D49
         PEI   $D7
         PEI   $D5
         JSL   L1506B3
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         PEI   $D7
         PEI   $D5
         JSL   L1517CD
         PEA   $0000
         PHD
         JSL   L21068D
         PEI   $D7
         PEI   $D5
         JSL   L1506AD
L211D49  LDA   #$0004
         STA   $DF
         PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L1512CB
         PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         PHA
         LDA   L055051
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L211DB2
         PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L211DB0
         LDA   #$0009
         STA   $DF
L211DB0  BRA   L211DD3
L211DB2  PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         AND   $ED
         BEQ   L211DD3
         LDA   #$0008
         STA   $DF
L211DD3  PEI   $DF
         JSL   L0724F7
         LDA   $EB
         BEQ   L211E5B
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L082570
         PHY
         PHY
         JSL   L1516CF
         PLA
         STA   $CD
         PLX
         STX   $CF
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $C9
         PLX
         STX   $CB
         JSL   L150659
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $CB
         PEI   $C9
         JSL   L15166F
         PEI   $CB
         PEI   $C9
         JSL   L1516C9
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         TDC
         CLC
         ADC   #$0095
         PEA   $0000
         PHA
         JSL   L151418
         PEA   $0000
         JSL   L081DD8
         PEI   $CF
         PEI   $CD
         JSL   L1516C9
         PEI   $CB
         PEI   $C9
         JSL   L151669
L211E5B  LDA   $ED
         BEQ   L211E70
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0006
         JSL   L160B2C
         JSL   L150076
L211E70  BRL   L212119
L211E73  LDA   #$0800
         ANDL  L0540AD
         BEQ   L211E88
         LDA   #$0001
         STA   L05533F
         LDA   #$0001
         STA   L05533D
L211E88  PEI   $D7
         PEI   $D5
         PEA   $0006
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBC
         PHA
         JSL   L071169
         LDA   $D1
         LDX   $D3
         TXY
         LDX   #$FEAC
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211EB9
         INX
L211EB9  STA   $F1
         STX   $F3
         LDA   $A1
         SEC
         SBC   $9D
         STA   [$F1]
         LDA   #$00FF
         LDX   #$FEBC
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L211F07
         BEQ   L211F07
         LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211EE4
         INX
L211EE4  PHX
         PHA
         LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L211EF6
         INX
L211EF6  STA   $F1
         STX   $F3
         LDA   $E1
         CLC
         ADC   [$F1]
         PLX
         STX   $F1
         PLX
         STX   $F3
         STA   [$F1]
L211F07  LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L211F17
         INX
L211F17  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEBC
         PHA
         PEA   $00C1
         JSL   L0313BE
         LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L211F39
         INX
L211F39  STA   $F1
         STX   $F3
         LDA   $FA
         STA   [$F1]
         LDX   #$FEAC
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $F1
         STX   $F3
         LDA   $E3
         STA   [$F1]
         PEA   $0000
         PHD
         JSL   L21114A
         LDA   $EF
         ORA   L055333
         STA   L055333
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBC
         PHA
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $00D1
         JSL   L070A10
         PLA
         LSR
         BCS   L211F86
         LDA   #$0001
         STA   L055335
L211F86  BRL   L212119
L211F89  LDA   #$0800
         ANDL  L0540AD
         BEQ   L211F98
         LDA   #$0001
         STA   L05533F
L211F98  BRL   L212119
L211F9B  LDA   #$0001
         SEC
         SBC   $E3
         STA   $E3
         PEI   $E3
         PEI   $D7
         PEI   $D5
         PEA   $0005
         JSL   L073B05
         BRL   L212119
L211FB3  PEA   $0000
         PHD
         JSL   L210435
         BRL   L212119
L211FBE  PEA   $0056
         PEA   $0000
         PHD
         JSL   L2104A7
         BRL   L212119
L211FCC  PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$008D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCC   L21200A
         PHY
         PEI   $B7
         PEI   $B5
         PEA   $0032
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L210298
         PLA
         LSR
         BCC   L212008
         PEA   $0000
         PHD
         JSL   L21068D
L212008  BRA   L21203E
L21200A  LDA   L055051
         EOR   #$0001
         PHA
         PHY
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$009D
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $F1
         PLA
         AND   $F1
         BEQ   L21203E
         PHY
         PEA   $0000
         PHD
         JSL   L2107C9
         PLA
         ORA   $EF
         STA   $EF
L21203E  BRL   L212119
L212041  PEA   $0001
         PEI   $D7
         PEI   $D5
         PEA   $0004
         JSL   L072E7C
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0004
         JSL   L073032
         LDX   #$FEA8
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDX   #$FEA8
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L212075
         INX
L212075  STA   $F1
         STX   $F3
         LDA   [$F1]
         STA   $B5
         LDX   #$FEA8
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L21208D
         INX
L21208D  STA   $F1
         STX   $F3
         LDA   [$F1]
         STA   $B7
         TDC
         CLC
         ADC   #$00B5
         PEA   $0000
         PHA
         JSL   L151412
         PHY
         PHY
         JSL   L151293
         JSL   L151131
         PHY
         PHY
         JSL   L1517D9
         PLA
         STA   $C1
         PLX
         STX   $C3
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         PHY
         PEA   $0001
         PEI   $B7
         PEI   $B5
         PEA   $0000
         PEI   $BF
         PEI   $BD
         JSL   L150389
         PLA
         STA   $E5
         PEI   $C3
         PEI   $C1
         JSL   L150D20
         PEI   $D7
         PEI   $D5
         JSL   L151131
         LDA   $E5
         BEQ   L212109
         PEA   $0000
         PHD
         JSL   L210435
         PEI   $E5
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         PEA   $0006
         JSL   L160B2C
         JSL   L210111
L212109  PEA   $0000
         PEI   $D7
         PEI   $D5
         PEA   $0004
         JSL   L072E7C
         BRA   L212119
L212119  LDX   #$0000
         LDA   $E7
         DEC
         BNE   L212122
         INX
L212122  PHX
         LDX   #$0000
         LDA   $E7
         DEC
         DEC
         BNE   L21212D
         INX
L21212D  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L212137
         BRL   L211BCA
L212137  PEI   $D9
         JSL   L0724F7
         PEA   $0000
         PHD
         JSL   L210BD3
         PEI   $BF
         PEI   $BD
         JSL   L07185A
         PEI   $D7
         PEI   $D5
         JSL   L072634
         PEI   $DD
         PEI   $DB
         JSL   L151131
         JSL   L09AFB1
         LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0251
         TCS
         RTL

