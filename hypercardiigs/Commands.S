*
* HypercardGS
* segment: $11 Commands
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Commands.l
         lst   off

*---------------------------------------

         use   Commands.E
         use   Commands.X

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

L110000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         JSL   L03198D
         PLA
         LSR
         BCC   L11003A
         JSL   L100D91
         BRA   L110041
L11003A  PEA   $000B
         JSL   L0B0B7A
L110041  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         TSC
         CLC
         ADC   #$0058
         TCS
         PLD
         RTL

L110059  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0E05E8
         JSL   L092E10
         PLY
         PLY
         PLD
         RTL

L11006E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   L05535F
         BNE   L11007D
         BRA   L1100CA
L11007D  PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L110092
         PHY
         JSL   L0E05E8
         PLA
         STA   $03
         BRA   L11009B
L110092  LDA   #$0001
         STA   $03
         JSL   L0E0000
L11009B  LDA   $03
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1100AA
         EOR   #$8000
L1100AA  BPL   L1100CA
         LDA   #$0001
         STA   $05
L1100B1  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L1100BC
         BRA   L1100CA
L1100BC  JSL   L072314
         LDA   $05
         CMP   $01
         BEQ   L1100CA
         INC   $05
         BRA   L1100B1
L1100CA  PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1100D1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0E05E8
         JSL   L090635
         PLY
         PLY
         PLD
         RTL

L1100E6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L110111
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $000D
         JSL   L0E0656
         BRA   L110124
L110111  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
L110124  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L121E9A
         PEI   $09
         PEI   $07
         PEI   $09
         PEI   $07
         PEI   $01
         PEI   $03
         PEI   $05
         JSL   L0930EA
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L110161  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0E0000
         PLY
         PLY
         PLD
         RTL

L110171  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         JSL   L0E06AC
         TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L110191  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0011
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         JSL   L0319D4
         PLA
         LSR
         BCC   L1101F7
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $000A
         PEA   $0011
         JSL   L0E07C5
         JSL   L100802
         BRA   L1101FE
L1101F7  PEA   $000B
         JSL   L0B0B7A
L1101FE  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         TSC
         CLC
         ADC   #$0062
         TCS
         PLD
         RTL

L110216  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$0015
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0E06AC
         JSL   L0904A1
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L09390E
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   $EF
         ORA   $F1
         BNE   L11025F
         PEA   $000D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         JSL   L0B0841
         BRA   L11027F
L11025F  LDA   $F1
         STA   $EB
         LDA   $EF
         STA   $ED
         LDA   L0550B9
         DEC
         BNE   L110277
         PEI   $EB
         PEI   $ED
         JSL   L0A0414
         BRA   L11027F
L110277  PEI   $EB
         PEI   $ED
         JSL   L0A2CE3
L11027F  TSC
         CLC
         ADC   #$010C
         TCS
         PLD
         RTL

L110287  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L1102B2
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $000D
         JSL   L0E0656
         BRA   L1102C5
L1102B2  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L071EC5
L1102C5  TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L121E9A
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L121E9A
         PEI   $09
         PEI   $07
         PEI   $0D
         PEI   $0B
         PEI   $01
         PEI   $03
         PEI   $05
         JSL   L0930EA
         TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L110325  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0001
         JSL   L09091E
         PLY
         PLY
         PLD
         RTL

L110338  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         PEA   ^L052406
         PEA   L052406
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         JSL   L094153
         PEA   $0100
         JSL   L0313BE
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L11036F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         JSL   L0952F7
         LDA   #L051BE6
         LDX   #^L051BE6
         STA   L0553B9
         STX   L0553BB
         JSL   L0B1910
         PEA   $0000
         PHD
         JSL   L110338
         PHY
         PHY
         PEA   ^L052406
         PEA   L052406
         JSL   L071F3F
         PLA
         STA   $17
         PLX
         STX   $19
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B6E8B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0B2AF9
         STZ   L0553A5
         LDA   L05539D
         DEC
         STA   L05539D
         JSL   L0B1BD6
         LDA   #$0001
         STA   L0553A3
         PHY
         PEA   $0000
         JSL   L0B7A9C
         PLA
         STA   $1B
         STZ   L0553A3
         LDA   L05539D
         INC
         STA   L05539D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0B0F05
         LDA   $1B
         BEQ   L110414
         PEA   ^L050FE8
         PEA   L050FE8
         PEA   $0002
         JSL   L0E0184
         BRA   L11041B
L110414  STZ   L0553A5
         JSL   L0B8B50
L11041B  JSL   L0B1BD6
         LDA   L0551F1
         BEQ   L11044B
         LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L110431
         INX
L110431  STA   $1D
         STX   $1F
         LDA   #$0020
         AND   [$1D]
         BEQ   L110448
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09A5A7
L110448  STZ   L0551F1
L11044B  TSC
         CLC
         ADC   #$0020
         TCS
         PLD
         RTL

L110453  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$000F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         JSL   L0E06AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         JSL   L093529
         TSC
         CLC
         ADC   #$0106
         TCS
         PLD
         RTL

L110480  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0003
         PHY
         JSL   L0E05E8
         PLA
         CLC
         ADC   #$00F9
         PHA
         JSL   L09971B
         PLY
         PLY
         PLD
         RTL

L11049E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0E0074
         PLY
         PLY
         PLD
         RTL

L1104AE  ENT
         PHD
         TSC
         CLC
         ADC   #$FE9C
         TCS
         ADC   #$006D
         TCD
         STZ   $EF
         STZ   $F1
         LDA   #$0006
         STA   $BF
         LDA   L055039
         LDX   L05503B
         STA   $EB
         STX   $ED
         PHY
         JSL   L0314F6
         PLA
         DEC
         BPL   L1104D8
         BRL   L110583
L1104D8  CMP   #$0004
         BMI   L1104E0
         BRL   L110583
L1104E0  SEC
         SBC   #$0000
         BEQ   L1104F2
         DEC
         BEQ   L110543
         DEC
         BEQ   L110559
         DEC
         BEQ   L11056B
         BRL   L110583
L1104F2  LDA   #$0002
         STA   $93
         LDA   #$0001
         LDX   #$0000
         STA   $99
         STX   $9B
         PEA   $0000
         TDC
         CLC
         ADC   #$FF93
         PHA
         JSL   L0E06AC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF93
         PHA
         JSL   L0735A8
         PLA
         STA   $EF
         PLX
         STX   $F1
         PHY
         PHY
         PEI   $F1
         PEI   $EF
         JSL   L078841
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEI   $F1
         PEI   $EF
         JSL   L07185A
         LDA   #$0001
         STA   L055415
         BRA   L110583
L110543  LDA   #$0002
         STA   $93
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $99
         PLX
         STX   $9B
         STZ   L055415
         BRA   L110583
L110559  LDA   #$0003
         STA   $93
         PHY
         JSL   L0E05E8
         PLA
         STA   $9D
         STZ   L055415
         BRA   L110583
L11056B  TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E0656
         BRA   L110583
L110583  LDA   L05502B
         LDX   L05502D
         CMP   $EB
         BNE   L11058F
         CPX   $ED
L11058F  BEQ   L110596
         LDA   #$0000
         BRA   L110599
L110596  LDA   #$0001
L110599  AND   L055415
         BEQ   L1105A7
         PEA   $0000
         JSL   L098852
         BRA   L1105E4
L1105A7  PHY
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L096479
         PLA
         LSR
         BCC   L1105BE
         BRA   L1105E4
L1105BE  LDA   L055257
         BEQ   L1105CF
         PEA   ^L040355
         PEA   L040355
         JSL   L0B2D94
         BRA   L1105E4
L1105CF  LDA   L055259
         BEQ   L1105DD
         PEA   $0001
         JSL   L122130
         BRA   L1105E4
L1105DD  PEA   $0002
         JSL   L122130
L1105E4  TSC
         CLC
         ADC   #$0164
         TCS
         PLD
         RTL

L1105EC  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF8
         TCS
         ADC   #$0011
         TCD
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0BE6
         JSL   L072809
         JSL   L0735A8
         PLA
         STA   $EF
         PLX
         STX   $F1
         PEA   $0000
         PEA   $0001
         PEI   $F1
         PEI   $EF
         PEA   $0000
         JSL   L0968FC
         PEI   $F1
         PEI   $EF
         JSL   L07185A
         TSC
         CLC
         ADC   #$0108
         TCS
         PLD
         RTL

L110634  ENT
         PHD
         TSC
         CLC
         ADC   #$FF80
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         SEC
         SBC   #$0001
         BPL   L11064B
         BRL   L1107A4
L11064B  CMP   #$0006
         BMI   L110653
         BRL   L1107A4
L110653  ASL
         TAX
         LDAL  L11065B,X
         PHA
         RTS

L11065B  DA    L110667-1
         DA    L11067C-1
         DA    L1106AF-1
         DA    L11072E-1
         DA    L110776-1
         DA    L11078D-1

L110667  STZ   L055145
         JSL   L151484
         JSL   L09AFB1
         JSL   L0E0000
*         BRL   L1107A4
         BRL   L1107A4
L11067C  PHY
         PHY
         JSL   L0E061D
         PLA
         STA   $73
         PLX
         STX   $75
         LDA   $73
         ORA   $75
         BNE   L110697
         PEA   $0084
         JSL   L0B0B7A
         BRA   L1106AC
L110697  LDY   #$00CE
         LDA   #$0020
         AND   [$73],Y
         CMP   #$0000
         BEQ   L1106AC
         PEI   $75
         PEI   $73
         JSL   L09A5A7
L1106AC  BRL   L1107A4
L1106AF  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L0D0F6E
         PLA
         STA   $7B
         LDA   $03
         LDX   $05
         STA   $77
         STX   $79
         PHY
         PEI   $79
         PEI   $77
         PEI   $7B
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCC   L11072A
         LDA   #$8000
         AND   $35
         BNE   L11072A
         LDA   #$8000
         ORA   $35
         STA   $35
         PHY
         PEI   $79
         PEI   $77
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L07D585
         PLA
         LSR
         BCC   L11072A
         PEI   $79
         PEI   $77
         PEI   $7B
         PEA   $0000
         JSL   L0876F4
L11072A  BRA   L1107A4
*L11072C  BRA   L1107A4
L11072E  TDC
         CLC
         ADC   #$005B
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         LDA   $5B
         DEC
         DEC
         BNE   L110757
         PEI   $67
         PEI   $65
         PEA   $0000
         JSL   L099F77
         BRA   L110772
L110757  LDA   #$0003
         CMP   $5B
         BNE   L11076B
         PEI   $63
         PEI   $61
         PEA   $0000
         JSL   L099EA4
         BRA   L110772
L11076B  PEA   $0067
         JSL   L0B0B7A
L110772  BRA   L1107A4
*L110774  BRA   L1107A4
L110776  LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L099F77
         JSL   L0E0000
         BRA   L1107A4
*L11078B  BRA   L1107A4
L11078D  LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L099EA4
         JSL   L0E0000
         BRA   L1107A4
         BRA   L1107A4
L1107A4  TSC
         CLC
         ADC   #$0080
         TCS
         PLD
         RTL

L1107AC  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$000F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         JSL   L0E06AC
         LDA   L0550BB
         STA   $F1
         PEA   $0004
         JSL   L090635
         LDA   L0550B9
         DEC
         BNE   L1107F6
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         JSL   L160288
         PLA
         LSR
         BCC   L1107EE
         JSL   L1602F8
         BRA   L1107F4
L1107EE  PEI   $F1
         JSL   L090635
L1107F4  BRA   L1107FC
L1107F6  PEI   $F1
         JSL   L090635
L1107FC  TSC
         CLC
         ADC   #$0106
         TCS
         PLD
         RTL

L110804  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L11081D
         JSL   L096029
         BRA   L11083B
L11081D  PHY
         JSL   L16072E
         PLA
         LSR
         BCC   L11083B
         PHY
         PEA   $0001
         JSL   L16073C
         PLA
         STA   $01
*         PEA   ^L16073C
*         PEA   L16073C
*         JSL   L07187A
L11083B  JSL   L0E0000
         PLY
         PLY
         PLY
         PLD
         RTL

L110844  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         PEA   $0001
         JSL   L0B3145
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0E0BFC
         PHY
         JSL   L03198D
         PLA
         LSR
         BCC   L110881
         JSL   L100DA4
         BRA   L110888
L110881  PEA   $000B
         JSL   L0B0B7A
L110888  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L0E0184
         TSC
         CLC
         ADC   #$0058
         TCS
         PLD
         RTL

L1108A0  ENT
         PHD
         TSC
         CLC
         ADC   #$FDB0
         TCS
         ADC   #$0159
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L1108C3
         JSL   L0B8C8B
         JSL   L0E0000
         BRL   L110FF4
         BRA   L1108CD
L1108C3  LDA   #$0018
         LDX   #$0000
         STA   $CD
         STX   $CF
L1108CD  LDA   #$0004
         STA   $E1
         STZ   $E3
         STZ   $DD
         LDA   #$00FF
         STA   $D7
         LDA   #$0078
         STA   $E5
         LDA   #$0001
         STA   $D5
         LDA   #$0001
         STA   $EF
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L110936
         STZ   $EF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA7
         PHA
         JSL   L0E06AC
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L110936
         PHY
         JSL   L0E05E8
         PLA
         STA   $E5
         LDA   $E5
         BEQ   L11091D
         BPL   L110922
L11091D  LDA   #$0078
         STA   $E5
L110922  LDA   $E5
         SEC
         SBC   #$03E7
         BEQ   L110936
         BVS   L11092F
         EOR   #$8000
L11092F  BPL   L110936
         LDA   #$03E7
         STA   $E5
L110936  PEA   ^L05088E
         PEA   L05088E
         JSL   L0E06AC
         LDA   L05535F
         EOR   #$0001
         CMP   #$0000
         BNE   L110960
         PHY
         PEA   $001E
         JSL   L151681
         PLA
         BEQ   L11095B
         LDA   #$0000
         BRA   L11095E
L11095B  LDA   #$0001
L11095E  BEQ   L110963
L110960  BRL   L110FF4
L110963  LDA   #$0001
         STA   $DB
         PHY
         PHY
         PEA   $8024
         PEA   ^L05088E
         PEA   L05088E
         JSL   L072EAE
         PLA
         STA   $D1
         PLX
         STX   $D3
         LDA   $D1
         ORA   $D3
         BNE   L1109D7
         LDA   L0551FD
         BNE   L11098B
         BRL   L110FF4
L11098B  PEA   $0004
         PEA   $8000
         PEA   $0000
         PEA   $0000
         PEA   ^L05088E
         PEA   L05088E
         TDC
         CLC
         ADC   #$00B1
         PEA   $0000
         PHA
         _SendRequest
         STAL  L05565D
         LDAL  L05565D
         BEQ   L1109BA
         BRL   L110FF4
L1109BA  LDA   $B3
         LDX   $B5
         STA   $D1
         STX   $D3
         LDA   #$8000
         AND   $B7
         BNE   L1109D0
         LDA   #$0003
         STA   $DB
         BRA   L1109D5
L1109D0  LDA   #$0002
         STA   $DB
L1109D5  BRA   L1109EC
L1109D7  TDC
         CLC
         ADC   #$00AB
         PEA   $0000
         PHA
         PEI   $D3
         PEI   $D1
         JSL   L1502EE
         LDA   $AD
         STA   $E9
L1109EC  PHY
         JSL   L07005C
         PLA
         LSR
         BCC   L110A1F
         LDA   $DB
         DEC
         BNE   L110A0E
         PEA   $0003
         PEA   $8024
         LDA   $E9
         JSL   L150488
         PHX
         PHA
         JSL   L1510BF
         BRA   L110A1C
L110A0E  LDA   $DB
         DEC
         DEC
         BNE   L110A1C
         PEI   $D3
         PEI   $D1
         JSL   L07185A
L110A1C  BRL   L110FF4
L110A1F  PHY
         JSL   L0301E4
         PLA
         BNE   L1109EC
         JSL   L0B392B
         LDA   $D1
         LDX   $D3
         STA   L055359
         STX   L05535B
         LDA   L055359
         LDX   L05535B
         PHX
         PHA
         JSL   L0718BF
         LDA   $E9
         JSL   L150488
         STA   L055355
         STX   L055357
         LDA   $EF
         BNE   L110A54
         BRL   L110B03
L110A54  PHY
         PHY
         PEA   $0000
         PEA   $0010
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05534F
         PLA
         STA   L055351
         LDA   L05534F
         ORA   L055351
         BNE   L110A77
         BRL   L110FF4
L110A77  PHY
         PHY
         PEA   $0000
         PEA   $0100
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05534B
         PLA
         STA   L05534D
         LDA   L05534B
         ORA   L05534D
         BNE   L110A9A
         BRL   L110FF4
L110A9A  LDA   L05534F
         LDX   L055351
         PHX
         PHA
         JSL   L0718BF
         LDA   L05534B
         LDX   L05534D
         PHX
         PHA
         JSL   L0718BF
         PEI   $E3
         LDA   $E1
         INC
         PEA   $000C
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $D9
         LDA   $D9
         XBA
         AND   #$FF00
         ORA   $D7
         STA   $A7
         LDA   $DD
         XBA
         AND   #$FF00
         ORA   $CD
         STA   $A9
         LDA   L05534B
         LDX   L05534D
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $F3
         STX   $F5
         LDA   $A7
         LDX   $A9
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         LDA   #$0002
         STA   $D5
         BRL   L110F4A
L110B03  PHY
         PHY
         PEA   $0000
         PEA   $0010
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05534F
         PLA
         STA   L055351
         LDA   L05534F
         ORA   L055351
         BNE   L110B26
         BRL   L110FF4
L110B26  PHY
         PHY
         PEA   $0000
         PEA   $0100
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05534B
         PLA
         STA   L05534D
         LDA   L05534B
         ORA   L05534D
         BNE   L110B49
         BRL   L110FF4
L110B49  LDA   L05534F
         LDX   L055351
         PHX
         PHA
         JSL   L0718BF
         LDA   L05534B
         LDX   L05534D
         PHX
         PHA
         JSL   L0718BF
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA7
         PHA
         JSL   L071F3F
         PLA
         STA   $BD
         PLX
         STX   $BF
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA7
         PHA
         JSL   L0B0361
L110B8C  LDA   #$00FF
         LDX   #$FEA7
         AND   $00,X
         BNE   L110B99
         BRL   L110F4A
L110B99  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA7
         PHA
         JSL   L071F3F
         PLA
         STA   $B9
         PLX
         STX   $BB
         STZ   $DF
         STZ   $ED
         LDA   #$00FF
         AND   [$B9]
         SEC
         SBC   #$0030
         BVS   L110BC0
         EOR   #$8000
L110BC0  BMI   L110BC7
         LDA   #$0000
         BRA   L110BCA
L110BC7  LDA   #$0001
L110BCA  PHA
         LDA   #$00FF
         AND   [$B9]
         SEC
         SBC   #$0039
         BEQ   L110BE2
         BVS   L110BDB
         EOR   #$8000
L110BDB  BPL   L110BE2
         LDA   #$0000
         BRA   L110BE5
L110BE2  LDA   #$0001
L110BE5  AND   $01,S
         PLX
         STA   $F1
         STZ   $E7
         STZ   $C9
         STZ   $CB
L110BF0  LDX   #$0000
         LDA   #$00FF
         AND   [$B9]
         CMP   #$0020
         BEQ   L110BFE
         INX
L110BFE  PHX
         LDA   #$00FF
         AND   [$B9]
         BEQ   L110C09
         LDA   #$0001
L110C09  AND   $01,S
         PLX
         LSR
         BCS   L110C12
         BRL   L110E58
L110C12  PHY
         LDA   #$00FF
         AND   [$B9]
         PHA
         JSL   L071498
         PLA
         STA   $EB
         LDA   $DF
         INC
         STA   $DF
         LDA   $EB
         SEC
         SBC   #$0030
         BVS   L110C30
         EOR   #$8000
L110C30  BMI   L110C37
         LDA   #$0000
         BRA   L110C3A
L110C37  LDA   #$0001
L110C3A  AND   $F1
         PHA
         LDA   $EB
         SEC
         SBC   #$0039
         BEQ   L110C51
         BVS   L110C4A
         EOR   #$8000
L110C4A  BPL   L110C51
         LDA   #$0000
         BRA   L110C54
L110C51  LDA   #$0001
L110C54  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   $C9
         ORA   $CB
         BNE   L110C62
         INX
L110C62  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L110C7F
         LDA   $E7
         PEA   $000A
         JSL   L150BEE
         PLA
         CLC
         ADC   $EB
         SEC
         SBC   #$0030
         STA   $E7
         BRL   L110E49
L110C7F  LDA   $EB
         SEC
         SBC   #$0023
         BPL   L110C8A
         BRL   L110E49
L110C8A  CMP   #$0056
         BMI   L110C92
         BRL   L110E49
L110C92  SEC
         SBC   #$0000
         BNE   L110C9B
         BRL   L110D6E
L110C9B  SEC
         SBC   #$000B
         BNE   L110CA4
         BRL   L110E27
L110CA4  DEC
         DEC
         BNE   L110CAB
         BRL   L110D7E
L110CAB  DEC
         BNE   L110CB1
         BRL   L110D83
L110CB1  DEC
         BNE   L110CB7
         BRL   L110D8B
L110CB7  DEC
         BNE   L110CBD
         BRL   L110D93
L110CBD  DEC
         BNE   L110CC3
         BRL   L110DC3
L110CC3  DEC
         BNE   L110CC9
         BRL   L110DCA
L110CC9  DEC
         BNE   L110CCF
         BRL   L110DD1
L110CCF  DEC
         BNE   L110CD5
         BRL   L110DD8
L110CD5  SEC
         SBC   #$002A
         BEQ   L110D1C
         DEC
         BEQ   L110D24
         DEC
         BEQ   L110D38
         DEC
         BEQ   L110D3D
         DEC
         BEQ   L110D45
         DEC
         BEQ   L110D5E
         DEC
         BEQ   L110D66
         DEC
         BNE   L110CF3
         BRL   L110DEB
L110CF3  SEC
         SBC   #$0009
         BNE   L110CFC
         BRL   L110DF7
L110CFC  DEC
         BEQ   L110D76
         DEC
         BNE   L110D05
         BRL   L110E03
L110D05  DEC
         BNE   L110D0B
         BRL   L110E0F
L110D0B  DEC
         DEC
         DEC
         BNE   L110D13
         BRL   L110DDF
L110D13  DEC
         BNE   L110D19
         BRL   L110E1B
L110D19  BRL   L110E49
L110D1C  LDA   #$0009
         STA   $E3
         BRL   L110E49
L110D24  LDA   $DF
         DEC
         BNE   L110D30
         LDA   #$000B
         STA   $E3
         BRA   L110D35
L110D30  LDA   $E3
         DEC
         STA   $E3
L110D35  BRL   L110E49
L110D38  STZ   $E3
         BRL   L110E49
L110D3D  LDA   #$0002
         STA   $E3
         BRL   L110E49
L110D45  LDA   $DF
         DEC
         BNE   L110D51
         LDA   #$0004
         STA   $E3
         BRA   L110D5B
L110D51  LDA   #$000C
         LDX   #$0000
         STA   $C9
         STX   $CB
L110D5B  BRL   L110E49
L110D5E  LDA   #$0005
         STA   $E3
         BRL   L110E49
L110D66  LDA   #$0007
         STA   $E3
         BRL   L110E49
L110D6E  LDA   $E3
         INC
         STA   $E3
         BRL   L110E49
L110D76  LDA   #$0001
         STA   $ED
         BRL   L110E49
L110D7E  STZ   $E1
         BRL   L110E49
L110D83  LDA   #$0001
         STA   $E1
         BRL   L110E49
L110D8B  LDA   #$0002
         STA   $E1
         BRL   L110E49
L110D93  LDA   $C9
         ORA   $CB
         BEQ   L110DBB
         LDA   $C9
         LDX   $CB
         PEA   $0000
         PEA   $0002
         JSL   L150D50
         PEA   $0000
         PEA   $0003
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $C9
         STX   $CB
         BRA   L110DC0
L110DBB  LDA   #$0003
         STA   $E1
L110DC0  BRL   L110E49
L110DC3  LDA   #$0004
         STA   $E1
         BRA   L110E49
L110DCA  LDA   #$0005
         STA   $E1
         BRA   L110E49
L110DD1  LDA   #$0006
         STA   $E1
         BRA   L110E49
L110DD8  LDA   #$0007
         STA   $E1
         BRA   L110E49
L110DDF  LDA   #$0060
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110DEB  LDA   #$0030
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110DF7  LDA   #$0018
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110E03  LDA   #$0006
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110E0F  LDA   #$0003
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110E1B  LDA   #$0001
         LDX   #$0000
         STA   $C9
         STX   $CB
         BRA   L110E49
L110E27  LDA   $C9
         LDX   $CB
         PEA   $0000
         PEA   $0003
         JSL   L150D50
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         STA   $C9
         STX   $CB
         BRA   L110E49
L110E49  LDA   $B9
         LDX   $BB
         INC
         BNE   L110E51
         INX
L110E51  STA   $B9
         STX   $BB
         BRL   L110BF0
L110E58  LDA   $F1
         BEQ   L110E83
         PEI   $E7
         PEA   $000C
         JSL   L1500F5
         PLX
         PLX
         DEC
         STA   $E1
         PEI   $E7
         PEA   $000C
         JSL   L150318
         PLX
         PLX
         STA   $E3
         LDA   $E3
         BPL   L110E83
         LDA   #$000C
         CLC
         ADC   $E3
         STA   $E3
L110E83  LDA   $C9
         ORA   $CB
         BEQ   L110E91
         LDA   $C9
         LDX   $CB
         STA   $CD
         STX   $CF
L110E91  LDA   $CD
         LDX   $CF
         STA   $C5
         STX   $C7
         LDA   $ED
         BEQ   L110EBD
         PEI   $E3
         LDA   $E1
         INC
         PEA   $000C
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $D9
         LDA   $D9
         XBA
         AND   #$FF00
         ORA   #$0000
         STA   $A7
         BRA   L110EDA
L110EBD  PEI   $E3
         LDA   $E1
         INC
         PEA   $000C
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $D9
         LDA   $D9
         XBA
         AND   #$FF00
         ORA   $D7
         STA   $A7
L110EDA  LDA   $DD
         XBA
         AND   #$FF00
         ORA   $C5
         STA   $A9
         LDA   L05534B
         LDX   L05534D
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   $D5
         JSL   L150488
         TAY
         BNE   L110F02
         DEX
L110F02  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $F3
         STX   $F5
         LDA   $A7
         LDX   $A9
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEA7
         PHA
         JSL   L0B0361
         LDA   $D5
         INC
         STA   $D5
         LDA   #$0040
         CMP   $D5
         BEQ   L110F4A
         BRL   L110B8C
L110F4A  STZ   $A7
         STZ   $A9
         LDA   L05534B
         LDX   L05534D
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   $D5
         JSL   L150488
         TAY
         BNE   L110F6C
         DEX
L110F6C  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0002
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $F3
         STX   $F5
         LDA   $A7
         LDX   $A9
         STA   [$F3]
         TXA
         LDY   #$0002
         STA   [$F3],Y
         LDA   L05534F
         LDX   L055351
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         STA   $C1
         STX   $C3
         LDA   L055359
         LDX   L05535B
         STA   [$C1]
         TXA
         LDY   #$0002
         STA   [$C1],Y
         LDA   $E5
         LDY   #$0004
         STA   [$C1],Y
         LDA   #$0001
         LDY   #$0006
         STA   [$C1],Y
         LDA   L05534B
         LDX   L05534D
         LDY   #$0008
         STA   [$C1],Y
         INY
         INY
         TXA
         STA   [$C1],Y
         LDA   #$0000
         TAX
         LDY   #$000C
         STA   [$C1],Y
         INY
         INY
         TXA
         STA   [$C1],Y
         LDA   $DB
         STA   L05535D
         PEA   $0001
         LDA   L05534F
         LDX   L055351
         PHX
         PHA
         JSL   L03022C
L110FF4  TSC
         CLC
         ADC   #$0250
         TCS
         PLD
         RTL

L110FFC  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$00E7
         CLC
         ADC   $0E
         LDX   $10
         BCC   L11100F
         INX
L11100F  PHX
         PHA
         LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L111024
         INX
L111024  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L111040
         INX
L111040  STA   $01
         STX   $03
         LDA   #$0000
         TAX
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0000
         TAX
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   L0551E5
         DEC
         STA   L0551E5
         LDA   L0551E5
         SEC
         SBC   #$0001
         BVS   L111071
         EOR   #$8000
L111071  BMI   L111079
         LDA   #$0014
         STA   L0551E5
L111079  LDA   $0C
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

L11108B  ENT
         PHD
         TSC
         CLC
         ADC   #$FD84
         TCS
         ADC   #$0185
         TCD
         PEA   $0000
         PHD
         JSL   L110FFC
         STZ   $8F
         STZ   $91
         LDX   #$0000
         LDA   $EB
         ORA   $ED
         BNE   L1110AC
         INX
L1110AC  PHX
         LDX   #$0000
         LDA   $E7
         ORA   $E9
         BNE   L1110B7
         INX
L1110B7  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1110D2
         LDA   L05502B
         LDX   L05502D
         STA   $EB
         STX   $ED
         LDA   L05527D
         LDX   L05527F
         STA   $E7
         STX   $E9
L1110D2  PHY
         PHY
         PEI   $ED
         PEI   $EB
         JSL   L07899F
         PLA
         STA   $8F
         PLX
         STX   $91
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0001
         BNE   L111115
         LDA   L0551E5
         STA   $EF
         PEI   $E9
         PEI   $E7
         PEI   $91
         PEI   $8F
         PEA   $0000
         JSL   L0968AD
L111101  LDA   $EF
         CMP   L0551E5
         BEQ   L111112
         PEA   $0000
         PHD
         JSL   L110FFC
         BRA   L111101
L111112  BRL   L1111A9
L111115  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L111138
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         BRA   L11114A
L111138  LDA   #$0001
         STA   $93
         LDA   #$0001
         STA   $B5
         PHY
         JSL   L0E05E8
         PLA
         STA   $B7
L11114A  PHY
         JSL   L0E05E8
         PLA
         STA   $F1
         PEA   ^L040363
         PEA   L040363
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L0715D9
         PEA   ^L04036C
         PEA   L04036C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE7B
         PHA
         PEI   $91
         PEI   $8F
         JSL   L072CD4
         PEA   ^L040378
         PEA   L040378
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8F
         PHA
         PEA   $0005
         JSL   L1509CE
         JSL   L0E0F0F
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEI   $F1
         JSL   L0E0184
L1111A9  JSL   L0E0000
         PEI   $91
         PEI   $8F
         JSL   L07185A
         TSC
         CLC
         ADC   #$027C
         TCS
         PLD
         RTL

L1111BD  ENT
         PHD
         TSC
         CLC
         ADC   #$FF34
         TCS
         TCD
         LDA   L0551E5
         INC
         STA   L0551E5
         LDA   L0551E5
         SEC
         SBC   #$0014
         BEQ   L1111E2
         BVS   L1111DA
         EOR   #$8000
L1111DA  BPL   L1111E2
         LDA   #$0001
         STA   L0551E5
L1111E2  TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $005C
         PEA   $0002
         JSL   L0E0656
         LDX   #$0000
         LDA   #$0003
         CMP   $0D
         BNE   L111203
         INX
L111203  PHX
         LDX   #$0000
         LDA   $17
         BNE   L11120C
         INX
L11120C  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L11124B
         LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L111226
         INX
L111226  STA   $09
         STX   $0B
         LDA   L055027
         LDX   L055029
         STA   [$09]
         TXA
         LDY   #$0002
         STA   [$09],Y
         LDA   L055039
         LDX   L05503B
         LDY   #$0004
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         BRL   L111381
L11124B  LDX   #$0000
         LDA   #$0005
         CMP   $0D
         BNE   L111256
         INX
L111256  PHX
         LDX   #$0000
         LDA   $17
         DEC
         BNE   L111260
         INX
L111260  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L11126A
         BRL   L11131D
L11126A  LDA   L0551E1
         STA   $C7
L11126F  LDA   $C7
         DEC
         STA   $C7
         LDA   $C7
         SEC
         SBC   #$0001
         BVS   L11127F
         EOR   #$8000
L11127F  BMI   L111286
         LDA   #$00C8
         STA   $C7
L111286  LDA   $C7
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L0525DA,X
         ORAL  L0525DC,X
         BEQ   L11129A
         LDA   #$0001
L11129A  PHA
         LDX   #$0000
         LDA   L0551E1
         CMP   $C7
         BNE   L1112A6
         INX
L1112A6  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L11126F
         LDA   L0551E1
         CMP   $C7
         BEQ   L1112E6
         LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L1112C7
         INX
L1112C7  PHX
         PHA
         LDA   $C7
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0525DA
         LDX   #^L0525DA
         BCC   L1112DB
         INX
L1112DB  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         BRA   L11131B
L1112E6  LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L1112F9
         INX
L1112F9  STA   $05
         STX   $07
         LDA   L05502B
         LDX   L05502D
         LDY   #$0004
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   L05527D
         LDX   L05527F
         STA   [$05]
         TXA
         LDY   #$0002
         STA   [$05],Y
L11131B  BRA   L111381
L11131D  TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L0940E5
         PHY
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $C5
         LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L11134E
         INX
L11134E  STA   $01
         STX   $03
         LDA   L055027
         LDX   L055029
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   L055039
         LDX   L05503B
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         PHY
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $C5
L111381  TSC
         CLC
         ADC   #$00CC
         TCS
         PLD
         RTL

L111389  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA6
         TCS
         TCD
         PHY
         JSL   L0314F6
         PLA
         CMP   #$0004
         BNE   L1113B4
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0054
         PEA   $0007
         JSL   L0E0656
         BRA   L1113E9
L1113B4  PHY
         JSL   L0314F6
         PLA
         CMP   #$0005
         BNE   L1113D3
         LDA   #$0001
         STA   $01
         LDA   #$0001
         STA   $23
         PHY
         JSL   L0E05E8
         PLA
         STA   $25
         BRA   L1113E9
L1113D3  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L050FE8
         PEA   L050FE8
         PEA   $0054
         JSL   L0313BE
L1113E9  PHY
         JSL   L0314F6
         PLA
         CMP   #$0003
         BNE   L11140A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0022
         PEA   $0004
         JSL   L0E0656
L11140A  PHY
         JSL   L0314F6
         PLA
         CMP   #$0002
         BNE   L11141F
         PHY
         JSL   L0E05E8
         PLA
         STA   $55
         BRA   L111424
L11141F  LDA   #$0002
         STA   $55
L111424  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $55
         JSL   L0E0184
         TSC
         CLC
         ADC   #$005A
         TCS
         PLD
         RTL

