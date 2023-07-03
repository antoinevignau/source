*
* HypercardGS
* segment: $17 SegInit
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   SegInit.l
         lst   off

*---------------------------------------

         use   SegInit.E
         use   SegInit.X

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

L170000  ENT
         PHD
         TSC
         TCD
         PHB
         PHB
         PLA
         STA   L054F91
         TDC
         TCS
         PLD
         RTL

L17000D  PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   #$0200
         ORA   L054FBF
         STA   L054FBD
         PHY
         PHY
         PEA   $0005
         JSL   L151325
         PLA
         STA   L054FB7
         PLA
         STA   L054FB9
         STZ   L054FBB
         LDA   #$0001
         STA   L054F9F
         LDA   #$0004
         STA   L054FA1
         STZ   L054F99
         STZ   L054FB3
         STZ   L054F8B
         JSL   L170000
         PHY
         PHY
         PEA   $0000
         PEA   $0006
         JSL   L1510E9
         PLA
         STA   L054FAD
         PLA
         STA   L054FAF
         LDA   L054FAD
         LDX   L054FAF
         CLC
         ADC   #$0004
         BCC   L17006C
         INX
L17006C  CLC
         ADC   #$004C
         BCC   L170073
         INX
L170073  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         INC
         BNE   L170083
         INX
L170083  STA   L054F8D
         STX   L054F8F
         PHY
         PHY
         LDA   L054FAD
         LDX   L054FAF
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         LDA   L054FBD
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDA   L054FAD
         LDX   L054FAF
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         JSL   L071EC5
         LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         LDA   L054FAD
         LDX   L054FAF
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   L054FAD
         LDX   L054FAF
         CLC
         ADC   #$0004
         BCC   L17011D
         INX
L17011D  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L17013E
         INX
L17013E  CLC
         ADC   #$004C
         BCC   L170145
         INX
L170145  STA   $0B
         STX   $0D
         LDA   #L071A47
         LDX   #^L071A47
         TAY
         BNE   L170153
         DEX
L170153  DEC
         STA   [$0B]
         TXA
         LDY   #$0002
         STA   [$0B],Y
         PEA   $0000
         PEA   $0006
         PEI   $07
         PEI   $05
         JSL   L1510E3
         LDAL  L040A84
         SEP   #$20
         STAL  L05409D
         REP   #$20
         STZ   $09
L170178  LDA   $09
         ASL
         ASL
         TAX
         PEA   ^L05409D
         PEA   L05409D
         PLA
         STAL  L0540CD,X
         PLA
         STAL  L0540CF,X
         LDA   #$0009
         CMP   $09
         BEQ   L170198
         INC   $09
         BRA   L170178
L170198  STZ   L054FA3
         STZ   L054FA5
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1701A6  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   #$0700
         ORA   L054FBF
         STA   L055019
         LDA   #$0300
         ORA   L054FBF
         STA   L055017
         PHY
         PHY
         JSL   L1503A1
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   #$007F
         STA   L05500B
         PEI   $17
         PEI   $15
         LDA   #$0D40
         LDX   #$0003
         JSL   L033477
         BEQ   L1701EF
         BVS   L1701E7
         EOR   #$8000
L1701E7  BPL   L1701EF
         LDA   #$00FF
         STA   L05500B
L1701EF  PEI   $17
         PEI   $15
         LDA   #$1A80
         LDX   #$0006
         JSL   L033477
         BEQ   L17020C
         BVS   L170204
         EOR   #$8000
L170204  BPL   L17020C
         LDA   #$01FF
         STA   L05500B
L17020C  LDA   L05500B
         ASL
         CLC
         ADC   L05500B
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   L055009
         LDA   L05500B
         INC
         JSL   L150488
         STA   $11
         STX   $13
         LDA   $11
         LDX   $13
         PEA   $0000
         PEA   $000E
         JSL   L150D50
         PLA
         STA   $0D
         PLX
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         LDA   L055017
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   L054FED
         STX   L054FEF
         LDA   L054FED
         LDX   L054FEF
         PEI   $0F
         PEI   $0D
         JSL   L150F53
         STA   L054FF1
         STX   L054FF3
         LDA   L054FED
         LDX   L054FEF
         PHX
         PHA
         PEI   $0F
         PEI   $0D
         JSL   L071EC5
         LDA   L054FED
         LDX   L054FEF
         STA   L054FE9
         STX   L054FEB
         LDA   L054FED
         LDX   L054FEF
         STA   L054FE5
         STX   L054FE7
         LDA   L054FED
         LDX   L054FEF
         STA   L054FC9
         STX   L054FCB
         LDA   L054FED
         LDX   L054FEF
         STA   L054FD1
         STX   L054FD3
         LDA   L054FED
         LDX   L054FEF
         STA   L054FC5
         STX   L054FC7
         LDA   L054FED
         LDX   L054FEF
         STA   L054FD9
         STX   L054FDB
         LDA   L054FED
         LDX   L054FEF
         STA   L054FE1
         STX   L054FE3
         LDA   L054FED
         LDX   L054FEF
         STA   L054FDD
         STX   L054FDF
         LDA   L054FED
         LDX   L054FEF
         STA   L054FD5
         STX   L054FD7
         LDA   L054FED
         LDX   L054FEF
         STA   L054FCD
         STX   L054FCF
         STZ   L055005
         STZ   L055007
         STZ   L05500D
         STZ   L055013
         STZ   L055015
         STZ   L05500F
         STZ   L055011
         PEA   ^L0539E9
         PEA   L0539E9
         PEA   $0000
         PEA   $00B4
         JSL   L071EC5
         LDA   #$0001
         STA   L054FC1
         PHY
         PHY
         PEA   $0000
         PEA   $0004
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L054FFF
         PLA
         STA   L055001
         LDA   L054FFF
         LDX   L055001
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $19
         STX   $1B
         LDA   #$0001
         LDX   #$0000
         STA   [$19]
         TXA
         LDY   #$0002
         STA   [$19],Y
         PHY
         PHY
         PEA   $0000
         PEA   $0004
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L054FFB
         PLA
         STA   L054FFD
         LDA   L054FFB
         LDX   L054FFD
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $19
         STX   $1B
         LDA   #$0001
         LDX   #$0000
         STA   [$19]
         TXA
         LDY   #$0002
         STA   [$19],Y
         STZ   L055047
         STZ   L05503D
         PHY
         PHY
         PEA   ^L040A73
         PEA   L040A73
         JSL   L0735A8
         PLA
         STA   L055043
         PLA
         STA   L055045
         PHY
         PHY
         PEA   ^L040A74
         PEA   L040A74
         JSL   L0735A8
         PLA
         STA   L05503F
         PLA
         STA   L055041
         STZ   L055039
         STZ   L05503B
         STZ   L055049
         STZ   L05504B
         STZ   L055027
         STZ   L055029
         STZ   L05501F
         STZ   L055021
         STZ   L055023
         STZ   L055025
         STZ   L05504F
         STZ   L055051
         STZ   L054FF7
         STZ   L054FF5
         STZ   L054FF9
         STZ   L055003
         LDA   #$0003
         STA   $01
         LDA   #$0001
         STA   $03
         LDA   #$0001
         STA   $05
         STZ   $07
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2033
         JSL   GSOS2
         STAL  L05565D
         STZ   L054FC3
         PEA   ^L074266
         PEA   L074266
         JSL   L15134F
         TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L170455  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   L05508B
         STZ   L055057
         STZ   L055081
         STZ   L055083
         LDAL  L040A30
         SEP   #$20
         STAL  L0538E9
         REP   #$20
         STZ   L055077
         LDA   #$0001
         STA   L055075
         STZ   L055079
         PEA   $0003
         JSL   L0792D7
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L17048E  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0080
         STA   [$0E]
         LDA   $12
         LDX   $14
         LDY   #$0002
         STA   [$0E],Y
         INY
         INY
         TXA
         STA   [$0E],Y
         LDA   #$00A0
         LDY   #$0006
         STA   [$0E],Y
         LDA   #$0008
         CLC
         ADC   $0E
         LDX   $10
         BCC   L1704BC
         INX
L1704BC  PHX
         PHA
         JSL   L082712
         LDA   $08
         STA   $14
         LDA   $07
         STA   $13
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L1704D4  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   $1A
         LDX   $1C
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   $09
         STX   $0B
         LDY   #$0006
         LDA   [$03],Y
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L170502
         EOR   #$8000
L170502  BPL   L170531
         LDA   #$0001
         STA   $07
L170509  LDA   L0550FB
         SEP   #$20
         STA   [$09]
         REP   #$20
         PEI   $0B
         PEI   $09
         LDY   #$0004
         LDA   [$03],Y
         JSL   L150488
         JSL   L150F53
         STA   $09
         STX   $0B
         LDA   $07
         CMP   $01
         BEQ   L170531
         INC   $07
         BRA   L170509
L170531  LDA   $14
         STA   $1C
         LDA   $13
         STA   $1B
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L170543  PHD
         TSC
         CLC
         ADC   #$FF6E
         TCS
         TCD
         LDA   #$0600
         ORA   L054FBF
         STA   L0550A5
         PHY
         PHY
         PHY
         PEA   $0000
         PEA   $0004
         JSL   L1517E5
         JSL   L1510CB
         PLA
         STA   L05510F
         PEA   ^L053259
         PEA   L053259
         JSL   L082712
         PEA   ^L053251
         PEA   L053251
         JSL   L08273B
         PEA   ^L052E97
         PEA   L052E97
         PEA   $0000
         PEA   $0000
         PEA   $0010
         PEA   $0007
         JSL   L15100B
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0024
         JSL   L071EC5
         LDA   #$4000
         STA   $0F
         LDA   #$0014
         STA   $1F
         LDA   #$001B
         STA   $1D
         LDA   #$0066
         STA   $23
         LDA   #$0063
         STA   $21
         LDA   #L086734
         LDX   #^L086734
         STA   $0B
         STX   $0D
         LDA   #$FFFF
         TAX
         STA   $25
         STX   $27
         PHY
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550E9
         PLA
         STA   L0550EB
         LDA   L0550E9
         LDX   L0550EB
         STA   L0550D5
         STX   L0550D7
         LDA   #$0014
         STA   $1F
         LDA   #$0071
         STA   $1D
         LDA   #$0082
         STA   $23
         LDA   #$0094
         STA   $21
         PHY
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550E5
         PLA
         STA   L0550E7
         LDA   L0550E5
         LDX   L0550E7
         STA   L0550D1
         STX   L0550D3
         LDA   #$01FC
         STA   $1F
         LDA   #$0045
         STA   $1D
         LDA   #$026B
         STA   $23
         LDA   #$0094
         STA   $21
         PHY
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550DD
         PLA
         STA   L0550DF
         LDA   L0550DD
         LDX   L0550DF
         STA   L0550CD
         STX   L0550CF
         LDA   #$021A
         STA   $1F
         LDA   #$001B
         STA   $1D
         LDA   #$026A
         STA   $23
         LDA   #$0034
         STA   $21
         PHY
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550D9
         PLA
         STA   L0550DB
         LDA   L0550D9
         LDX   L0550DB
         STA   L0550C9
         STX   L0550CB
         LDA   #$0014
         STA   $1F
         LDA   #$026C
         STA   $23
         LDA   #$00B5
         STA   $1D
         LDA   #$00C5
         STA   $21
         PHY
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550E1
         PLA
         STA   L0550E3
         LDA   L0550E1
         LDX   L0550E3
         STA   L0550C5
         STX   L0550C7
         PEA   ^L053249
         PEA   L053249
         PEA   $0000
         PEA   $0001
         PEA   $0258
         PEA   $000D
         JSL   L15100B
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   ^L053249
         PEA   L053249
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         PEA   $000C
         PEA   $0001
         JSL   L151005
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         PHY
         PHY
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$007F
         PEA   $0000
         PHA
         PEA   $00FA
         JSL   L150D38
         PLA
         STA   L055111
         PLA
         STA   L055113
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $004E
         JSL   L071EC5
         LDA   #$004E
         STA   $2D
         LDA   #$0008
         STA   $2F
         STZ   $35
         STZ   $37
         TDC
         CLC
         ADC   #$006B
         PEA   $0000
         PHA
         JSL   L082712
         LDA   #$FFFF
         TAX
         STA   $73
         STX   $75
         PHY
         PHY
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         JSL   L15027E
         PLA
         STA   L0550ED
         PLA
         STA   L0550EF
         LDA   L0550ED
         LDX   L0550EF
         STA   L0550C1
         STX   L0550C3
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$0002
         BCC   L1707D0
         INX
L1707D0  STA   $8F
         STX   $91
         LDY   #$0002
         LDA   [$8F],Y
         TAX
         LDA   [$8F]
         STA   L0550F9
         STX   L0550FB
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L053239
         PEA   L053239
         PEA   $0000
         PHD
         JSL   L17048E
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         PEA   ^L053229
         PEA   L053229
         PEA   $0000
         PHD
         JSL   L17048E
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   ^L053219
         PEA   L053219
         PEA   $0000
         PHD
         JSL   L17048E
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEA   ^L053209
         PEA   L053209
         PEA   $0000
         PHD
         JSL   L17048E
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151424
         LDA   #$8000
         ORAL  L0531CF
         STAL  L0531CF
         PHY
         JSL   L15028A
         PLA
         ORA   #$0004
         PHA
         JSL   L150284
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         STZ   L055119
         STZ   L05511B
         STZ   L055115
         STZ   L055117
         STZ   L055151
         STZ   L05514F
         STZ   L055135
         STZ   L055139
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053117
         PEA   L053117
         JSL   L082712
         PEA   ^L05310F
         PEA   L05310F
         JSL   L082712
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
         STZ   L055153
         LDA   #$0001
         STA   L055149
         LDA   #$0080
         STAL  L0531F9
         LDA   #$FFF8
         AND   #$001C
         STAL  L0531FF
         PHY
         PHY
         LDAL  L0531FF
         PEA   $0048
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1708E2
         DEX
L1708E2  PHX
         PHA
         LDA   L0550A5
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $8F
         STX   $91
         LDY   #$0002
         LDA   [$8F],Y
         TAX
         LDA   [$8F]
         STAL  L0531FB
         TXA
         STAL  L0531FD
         LDA   #$0000
         STAL  L053203
         LDA   #$0000
         STAL  L053201
         LDA   #$0052
         STAL  L053207
         LDA   #$0048
         STAL  L053205
         JSL   L087A30
         STZ   L055131
         LDA   #$0080
         STAL  L0531D9
         LDA   #$FFF8
         AND   #$0023
         STAL  L0531DF
         PHY
         PHY
         LDAL  L0531DF
         PEA   $004F
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L170957
         DEX
L170957  PHX
         PHA
         LDA   L0550A5
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $8F
         STX   $91
         LDY   #$0002
         LDA   [$8F],Y
         TAX
         LDA   [$8F]
         STAL  L0531DB
         TXA
         STAL  L0531DD
         LDA   #$0000
         STAL  L0531E3
         LDA   #$0000
         STAL  L0531E1
         LDA   #$006F
         STAL  L0531E7
         LDA   #$004F
         STAL  L0531E5
         LDA   #$0001
         STA   L0550B5
         JSL   L083A3C
         LDA   #$0080
         STAL  L0531E9
         LDA   #$FFF8
         AND   #$0023
         STAL  L0531EF
         PHY
         PHY
         LDAL  L0531EF
         PEA   $0023
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L1709CF
         DEX
L1709CF  PHX
         PHA
         LDA   L0550A5
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $8F
         STX   $91
         LDY   #$0002
         LDA   [$8F],Y
         TAX
         LDA   [$8F]
         STAL  L0531EB
         TXA
         STAL  L0531ED
         LDA   #$0000
         STAL  L0531F3
         LDA   #$0000
         STAL  L0531F1
         LDA   #$006E
         STAL  L0531F7
         LDA   #$0023
         STAL  L0531F5
         JSL   L087898
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   #$FFFF
         STAL  L052E93
         STAL  L052E95
         PEA   $0000
         PEA   $0000
         JSL   L087547
         PEA   ^L0808C8
         PEA   L0808C8
         PEA   $0000
         PHD
         JSL   L1704D4
         PEA   ^L0808D0
         PEA   L0808D0
         PEA   $0000
         PHD
         JSL   L1704D4
         PEA   ^L0808D8
         PEA   L0808D8
         PEA   $0000
         PHD
         JSL   L1704D4
         PEA   ^L08322D
         PEA   L08322D
         PEA   $0000
         PHD
         JSL   L1704D4
         PEA   ^L083235
         PEA   L083235
         PEA   $0000
         PHD
         JSL   L1704D4
         PEA   ^L08323D
         PEA   L08323D
         PEA   $0000
         PHD
         JSL   L1704D4
         TSC
         CLC
         ADC   #$0092
         TCS
         PLD
         RTL

L170A94  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   #$0001
         STA   $0F
L170AA1  LDA   $0F
         DEC
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052CE2
         LDX   #^L052CE2
         BCC   L170AB2
         INX
L170AB2  STA   $11
         STX   $13
         PHY
         PHY
         LDA   $0F
         DEC
         ASL
         ASL
         TAX
         LDAL  L0541BD+2,X
         PHA
         LDAL  L0541BD,X
         PHA
         JSL   L1517DF
         PLA
         STA   [$11]
         PLA
         LDY   #$0002
         STA   [$11],Y
         LDA   #$000C
         CMP   $0F
         BEQ   L170AE0
         INC   $0F
         BRA   L170AA1
L170AE0  LDAL  L052CF4
         TAX
         LDAL  L052CF2
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $09
         STX   $0B
         LDA   #$0000
         LDY   #$0002
         STA   [$09],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$09],Y
         LDA   #L09A7DB
         LDX   #^L09A7DB
         LDY   #$0006
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         LDY   #$000A
         LDA   #$0110
         ORA   [$09],Y
         AND   #$FFF7
         LDY   #$000A
         STA   [$09],Y
         LDAL  L052CF0
         TAX
         LDAL  L052CEE
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $05
         STX   $07
         LDA   #$0000
         LDY   #$0002
         STA   [$05],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$05],Y
         LDA   #$0000
         TAX
         LDY   #$0006
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDY   #$000A
         LDA   #$0100
         ORA   [$05],Y
         LDY   #$000A
         STA   [$05],Y
         LDAL  L052D04
         TAX
         LDAL  L052D02
         STA   $11
         STX   $13
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $01
         STX   $03
         LDA   #$0000
         LDY   #$0002
         STA   [$01],Y
         LDA   #$0000
         LDY   #$0004
         STA   [$01],Y
         LDA   #L09858F
         LDX   #^L09858F
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDY   #$000A
         LDA   #$0110
         ORA   [$01],Y
         AND   #$FFF7
         LDY   #$000A
         STA   [$01],Y
         LDAL  L052CF0
         PHA
         LDAL  L052CEE
         PHA
         PEA   $0000
         JSL   L150671
         LDAL  L052D0C
         PHA
         LDAL  L052D0A
         PHA
         PEA   $0000
         JSL   L150671
         LDAL  L052D08
         PHA
         LDAL  L052D06
         PHA
         PEA   $0000
         JSL   L150671
         LDAL  L052CE4
         PHA
         LDAL  L052CE2
         PHA
         PEA   $0000
         JSL   L150671
         LDA   #$0001
         STA   L055145
         STZ   L055051
         PEA   $012C
         JSL   L151095
         PHY
         JSL   L1503A7
         PLA
         STA   $0D
         JSL   L087268
         LDA   $18
         STA   $1C
         LDA   $17
         STA   $1B
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L170C28  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0002
         STA   L0551F9
         LDA   #$0002
         STA   L0551FB
         STZ   L05521B
         STZ   L055217
         PHY
         PHY
         PEA   $0000
         PEA   $000F
         JSL   L1510E9
         PLA
         STA   L05515D
         PLA
         STA   L05515F
         LDA   L05515D
         LDX   L05515F
         CLC
         ADC   #$0004
         BCC   L170C63
         INX
L170C63  CLC
         ADC   #$00A4
         BCC   L170C6A
         INX
L170C6A  STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         INC
         BNE   L170C7A
         INX
L170C7A  STA   L055161
         STX   L055163
         PHY
         PHY
         LDA   L05515D
         LDX   L05515F
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         LDA   L054FBD
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   L055159
         STX   L05515B
         LDA   L055159
         LDX   L05515B
         PHX
         PHA
         LDA   L05515D
         LDX   L05515F
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         PEA   $0000
         PEA   $0004
         JSL   L150D50
         JSL   L071EC5
         LDA   L055159
         LDX   L05515B
         STA   $01
         STX   $03
         LDA   L05515D
         LDX   L05515F
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   [$01]
         TXA
         LDY   #$0002
         STA   [$01],Y
         LDA   L05515D
         LDX   L05515F
         CLC
         ADC   #$0004
         BCC   L170D1C
         INX
L170D1C  STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         LDY   #$0004
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L170D3D
         INX
L170D3D  CLC
         ADC   #$00A4
         BCC   L170D44
         INX
L170D44  STA   $07
         STX   $09
         LDA   #L0709F6
         LDX   #^L0709F6
         TAY
         BNE   L170D52
         DEX
L170D52  DEC
         STA   [$07]
         TXA
         LDY   #$0002
         STA   [$07],Y
         PEA   $0000
         PEA   $000F
         LDA   L055159
         LDX   L05515B
         PHX
         PHA
         JSL   L1510E3
         PEA   $0000
         PHD
         JSL   L170A94
         LDA   #$0001
         STA   L0551E5
         LDA   #$0001
         STA   L0551E3
         LDA   #$0001
         STA   L0551E1
         PEA   ^L0525DA
         PEA   L0525DA
         PEA   $0000
         PEA   $0640
         JSL   L071EC5
         PEA   ^L05233C
         PEA   L05233C
         PEA   $0000
         PEA   $0090
         JSL   L071EC5
         STZ   L0551DF
         STZ   L05524D
         STZ   L0551DD
         LDA   #$0080
         STAL  L05232C
         PHY
         PHY
         PEA   $0000
         PEA   $2328
         LDA   L054FBD
         PHA
         PEA   $4010
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STAL  L05232E
         TXA
         STAL  L052330
         LDAL  L05565D
         BEQ   L170DF4
         PEA   $2312
         JSL   L07272E
L170DF4  LDA   #$0078
         STAL  L052332
         LDA   #$0000
         STAL  L052336
         LDA   #$0000
         STAL  L052334
         LDA   #$01E0
         STAL  L05233A
         LDA   #$004B
         STAL  L052338
         LDA   #$0001
         STA   $05
L170E1C  LDAL  L052330
         PHA
         LDAL  L05232E
         PHA
         LDA   $05
         JSL   L150488
         TAY
         BNE   L170E30
         DEX
L170E30  DEC
         PHX
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L151137
         PLA
         PLX
         JSL   L150F53
         STA   $07
         STX   $09
         LDA   #$FFFF
         STA   [$07]
         LDA   #$1194
         CMP   $05
         BEQ   L170E57
         INC   $05
         BRA   L170E1C
L170E57  LDA   #$0001
         STA   L055133
         LDA   #$0080
         STAL  L05231C
         LDA   #L0520C4
         STAL  L05231E
         LDA   #^L0520C4
         STAL  L052320
         LDA   #$0018
         STAL  L052322
         LDA   #$0000
         STAL  L052324
         LDA   #$0000
         STAL  L052326
         LDA   #$0019
         STAL  L052328
         LDA   #$0050
         STAL  L05232A
         STZ   L05522B
         STZ   L05522D
         LDA   #$0000
         STAL  L052D62
         LDA   #$0000
         STAL  L052D60
         LDA   #$0001
         STA   L055229
         STZ   L055249
         STZ   L055247
         STZ   L054FB1
         STZ   L05524F
         LDA   #$0001
         STA   L054FB5
         STZ   L0551ED
         STZ   L0551F1
         LDA   #$0001
         STA   L0551AD
         STZ   L055257
         STZ   L055259
         STZ   L055255
         STZ   L055155
         STZ   L05524B
         STZ   L055245
         STZ   L055243
         STZ   L05523D
         STZ   L055241
         STZ   L05523F
         STZ   L055215
         STZ   L055199
         STZ   L055235
         STZ   L055237
         STZ   L055239
         STZ   L05523B
         STZ   L055211
         STZ   L055209
         STZ   L05520D
         STZ   L05520B
         STZ   L0551F3
         LDA   #$0001
         STA   L0550BB
         STZ   L0550B9
         STZ   L0551EF
         LDA   #$0001
         STA   L0551EB
         LDA   #$FFFF
         STA   L0551E7
         LDA   #$1601
         STA   L0551E9
         LDAL  L040965
         SEP   #$20
         STAL  L052CCE
         REP   #$20
         LDAL  L040966
         SEP   #$20
         STAL  L052CBA
         REP   #$20
         STZ   L0551CB
         STZ   L0551CD
         STZ   L0551BF
         STZ   L0551C1
         STZ   L0551BB
         STZ   L0551BD
         STZ   L0551C7
         STZ   L0551C9
         STZ   L0551C3
         STZ   L0551C5
         PEA   ^L05328B
         PEA   L05328B
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055129
         STZ   L05512B
         PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L0551B7
         PHA
         PEA   $4005
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $07
         STX   $09
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   L0551B5
         PHY
         JSL   L095FB4
         PLA
         STA   L0551B9
         LDA   #$0100
         CLC
         ADC   L0551B5
         STA   L0551AB
         PLY
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L170FBA  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0500
         ORA   L054FBF
         STA   L0552FD
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0552F9
         PLA
         STA   L0552FB
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0552F5
         PLA
         STA   L0552F7
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0552F1
         PLA
         STA   L0552F3
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0552ED
         PLA
         STA   L0552EF
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   L0552E9
         PLA
         STA   L0552EB
         STZ   L0552C7
         STZ   L055137
         STZ   L055289
         STZ   L0551F1
         STZ   L055319
         STZ   L0552BB
         STZ   L0552B9
         STZ   L055315
         STZ   L055317
         LDA   #$0000
         STAL  L051ED6
         LDA   #$FFFE
         STAL  L051ED8
         LDA   #$0008
         STAL  L051EDA
         LDA   #$0000
         STAL  L051EDC
         LDA   #$0009
         STAL  L051EDE
         STZ   L0552FF
         LDA   #$0064
         STAL  L051D6E
         LDA   #$0140
         STAL  L051D70
         LDA   #$0028
         CLC
         ADCL  L05325B
         STAL  L051D68
         LDA   #$000C
         CLC
         ADCL  L053259
         STAL  L051D66
         LDAL  L05325F
         SEC
         SBC   #$0028
         STAL  L051D6C
         LDAL  L05325D
         SEC
         SBC   #$000D
         STAL  L051D6A
         LDA   #$0118
         STAL  L051D60
         LDA   #$0058
         STAL  L051D5E
         LDA   #$0168
         STAL  L051D64
         LDA   #$0071
         STAL  L051D62
         LDA   #$0000
         STAL  L051D58
         LDA   #$0000
         STAL  L051D56
         LDA   #$0050
         STAL  L051D5C
         LDA   #$0019
         STAL  L051D5A
         LDA   #$0080
         STAL  L051D46
         LDA   #$0018
         STAL  L051D4C
         LDA   #$0000
         STAL  L051D4E
         LDA   #$0000
         STAL  L051D50
         LDA   #$0019
         STAL  L051D52
         LDA   #$0050
         STAL  L051D54
         STZ   L0552B3
         STZ   L0552B1
         STZ   L0552A9
         STZ   L0552AF
         STZ   L0552AB
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L08273B
         STZ   L0552AD
         STZ   L055313
         STZ   L0550B7
         STZ   L055311
         LDA   #$0001
         STA   L05530F
         STZ   L05530B
         STZ   L055309
         LDA   #$0004
         STA   L055307
         LDA   #$0001
         STA   L055303
         STZ   L055301
         PEA   ^L051DA2
         PEA   L051DA2
         PEA   $0000
         PEA   $0000
         PEA   $027F
         PEA   $00C7
         JSL   L15100B
         LDA   #$0001
         STAL  L051EB2
         LDA   #$0002
         STAL  L051EB4
         LDA   #$0003
         STAL  L051EB6
         LDA   #$0004
         STAL  L051EB8
         LDA   #$0006
         STAL  L051EBA
         LDA   #$0008
         STAL  L051EBC
         LDA   #$0007
         STA   L055305
         LDA   #$FFFF
         STA   L055283
         PLY
         PLY
         PLD
         RTL

L1711E1  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L055327
         STZ   L055329
         PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L0551B7
         PHA
         PEA   $4005
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   L055347
         STZ   L055345
         PLY
         PLY
         PLD
         RTL

L171220  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   L05540F
         STZ   L055411
         PLY
         PLY
         PLY
         PLD
         RTL

L171233  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   L055383
         STZ   L05537F
         STZ   L055381
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L171255  PHD
         TSC
         CLC
         ADC   #$FEEE
         TCS
         ADC   #$001F
         TCD
         LDA   #$0001
         STA   L05538F
         STZ   L05539B
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L0553A7
         PLA
         STA   L0553A9
         LDA   L0553A7
         LDX   L0553A9
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EF
         STX   $F1
         SEP   #$20
         LDA   #$00
         STA   [$EF]
         REP   #$20
         STZ   L0553B5
         STZ   L0553B7
         STZ   L055399
         PHY
         PHY
         PEA   $0000
         PEA   $0200
         LDA   L0553DB
         PHA
         JSL   L0B249C
         PLA
         STA   L0553C5
         PLA
         STA   L0553C7
         LDAL  L05565D
         BEQ   L1712CD
         PEA   $1A53
         JSL   L07272E
L1712CD  LDA   #$0020
         STA   L0553C1
         STZ   L0553C3
         LDA   L0553C5
         LDX   L0553C7
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $0000
         PEA   $0200
         JSL   L071EC5
         LDA   #$0003
         STA   L0553B3
         JSL   L0B1910
         LDA   #L051BE6
         LDX   #^L051BE6
         STA   L0553B9
         STX   L0553BB
         PEA   ^L051054
         PEA   L051054
         JSL   L0B0D0A
         PEA   ^L05103C
         PEA   L05103C
         PEA   ^L051054
         PEA   L051054
         PEA   $0018
         JSL   L0313BE
         PEA   ^L051C38
         PEA   L051C38
         JSL   L0B199C
         LDA   #L051C38
         LDX   #^L051C38
         STA   L0553BD
         STX   L0553BF
         STZ   L055387
         STZ   L055385
         LDA   #$0001
         STAL  L050FE8
         LDA   #$0002
         STAL  L05100A
         STZ   L05537B
         STZ   L05537D
         PEA   ^L040505
         PEA   L040505
         JSL   L0B2C0A
         LDA   #$0001
         STA   L05539D
         STZ   L054FA9
         STZ   L054FAB
         PHY
         PHY
         PEA   $0000
         PEA   $0002
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   L05539F
         PLA
         STA   L0553A1
         LDA   L05539F
         LDX   L0553A1
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $EF
         STX   $F1
         LDA   #$0000
         STA   [$EF]
         STZ   L0550B3
         STZ   L0550AF
         STZ   L0550B1
         STZ   L0550AD
         STZ   L0550AB
         PEA   ^L0530A7
         PEA   L0530A7
         PEA   ^L053251
         PEA   L053251
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STAL  L0510BC
         LDA   #$FFFF
         STAL  L0510BE
         STAL  L0510C0
         LDA   #$FFFF
         STAL  L0510C2
         STAL  L0510C4
         LDA   #$FFFF
         STAL  L0510C6
         STAL  L0510C8
         LDA   #$FFFF
         STAL  L0510CA
         STAL  L0510CC
         LDA   #$FFFF
         STAL  L0510CE
         STAL  L0510D0
         LDA   #$FFFF
         STAL  L0510D2
         STAL  L0510D4
         LDA   #$FFFF
         STAL  L0510D6
         STAL  L0510D8
         LDA   #$FFFF
         STAL  L0510DA
         STAL  L0510DC
         STZ   $EB
         STZ   $ED
         STZ   L055371
         STZ   L05536F
         STZ   L055391
         SEP   #$20
         LDA   #$01
         STAL  L032E6A
*         REP   #$20
*         SEP   #$20
         LDA   #$0D
         STAL  L032E6A+1
         REP   #$20
         LDA   #$0002
         STAL  L050BF2
         LDA   #$0000
         STAL  L050BF4
         LDA   #$0000
         STAL  L050BF6
         LDA   #$0000
         STAL  L050BF8
         LDA   #$0005
         STAL  L050BFA
         LDA   #$0007
         STAL  L050BFC
         LDA   #$0005
         STAL  L050C02
         LDA   #$0013
         STAL  L050C04
         LDA   #$0005
         STAL  L050C0A
         LDA   #$000B
         STAL  L050C0C
         LDA   #$0005
         STAL  L050C12
         LDA   #$000C
         STAL  L050C14
         LDA   #$0005
         STAL  L050C1A
         LDA   #$000D
         STAL  L050C1C
         LDA   #$0005
         STAL  L050C22
         LDA   #$000E
         STAL  L050C24
         PEA   ^L050C2A
         PEA   L050C2A
         PEA   ^L050BF2
         PEA   L050BF2
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STAL  L050C2C
         LDA   #$0000
         STAL  L050BEA
         SEP   #$20
         LDA   #$01
         STAL  L050D32
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE1
         PHA
         PEA   $0060
         JSL   L0B127A
         LDA   #$0001
         LDX   #$0000
         JSL   L150F53
         STA   $EF
         STX   $F1
         LDA   #$00FF
         AND   [$EF]
         SEP   #$20
         STAL  L050D33
         REP   #$20
         PHY
         PHY
         PEA   $801E
         LDA   L05526D
         PHA
         LDA   L055271
         PHA
         PEA   $0000
         JSL   L0B4FF1
         PLA
         STA   L055373
         PLA
         STA   L055375
         PHY
         PHY
         PEA   $801F
         LDA   L055269
         PHA
         LDA   L055271
         PHA
         PEA   $0000
         JSL   L0B4FF1
         PLA
         STA   L055377
         PLA
         STA   L055379
         STZ   L055389
         STZ   L05538B
         STZ   L05538D
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0118
         TCS
         RTL

L17155B  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         JSL   L03018B
         LDA   #$0001
         STA   L05535F
         LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L17157F  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0E
         LDA   L055271
         BNE   L171591
         BRL   L171614
L171591  LDA   L055271
         PHA
         JSL   L150B70
         PHY
         PHY
         PEA   $8102
         PEA   $0000
         PEA   $0001
         JSL   L15041C
         PLA
         STA   L0553C9
         PLA
         STA   L0553CB
         LDAL  L05565D
         BNE   L171614
         PHY
         PHY
         PEA   $8102
         PEA   $0000
         PEA   $0002
         JSL   L15041C
         PLA
         STA   L0553D5
         PLA
         STA   L0553D7
         LDAL  L05565D
         BNE   L171614
         PHY
         PHY
         PEA   $8102
         PEA   $0000
         PEA   $0003
         JSL   L15041C
         PLA
         STA   L0553D1
         PLA
         STA   L0553D3
         LDAL  L05565D
         BNE   L171614
         PHY
         PHY
         PEA   $8102
         PEA   $0000
         PEA   $0004
         JSL   L15041C
         PLA
         STA   L0553CD
         PLA
         STA   L0553CF
         LDAL  L05565D
         BNE   L171614
         LDA   #$0001
         STA   $0E
         BRA   L171614
L171614  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L171625  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         PHY
         JSL   L1515C2
         PEA   $801E
         PEA   $0001
         JSL   L1515C8
         PHY
         PHY
         JSL   L1515C2
         PEA   $801F
         PEA   $0001
         JSL   L1515C8
         LDA   #L0B4B47
         LDX   #^L0B4B47
         STA   $09
         STX   $0B
         LDA   #$0220
         LDX   #$00E1
         STA   $05
         STX   $07
         LDA   $05
         LDX   $07
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0B
         PEI   $09
         PEA   $0008
         JSL   L1502B4
         PLA
         STA   [$0D]
         PLA
         LDY   #$0002
         STA   [$0D],Y
         LDA   #$0220
         LDX   #$00E1
         STA   $01
         STX   $03
         SEP   #$20
         LDA   #$5C
         STA   [$01]
         REP   #$20
         STZ   L055205
         LDA   $14
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

L1716A6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PHY
         PHY
         PHY
         TSC
         STA   $01,S
         LDA   #$0000
         STA   $03,S
         JSL   L150586
         PLA
         STA   L05536B
         PLA
         STA   L05536D
         LDAL  L05565D
         BEQ   L1716D3
         PEA   $1579
         JSL   L07272E
L1716D3  LDA   L05536B
         LDX   L05536D
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   L055367
         STX   L055369
         LDA   #$0800
         ORA   L054FBF
         STA   L0553DD
         LDA   #$0900
         ORA   L054FBF
         STA   L0553DB
         LDA   #$0A00
         ORA   L054FBF
         STA   L0553D9
         PEA   $0000
         PHD
         JSL   L171255
         PHY
         PEA   $0000
         PHD
         JSL   L17157F
         PLA
         LSR
         BCS   L171722
         PEA   $1AB6
         JSL   L07272E
L171722  PEA   $0000
         PHD
         JSL   L171625
         PEA   $0000
         PHD
         JSL   L17155B
         PEA   $0000
         PHD
         JSL   L171233
         PLY
         PLY
         PLY
         PLD
         RTL

L17173F  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L050060
         PEA   L050060
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055447
         STZ   L055449
         STZ   L055443
         STZ   L055445
         STZ   L05543F
         STZ   L055441
         STZ   L05543B
         STZ   L05543D
         PEA   ^L052D32
         PEA   L052D32
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L0551F5
         STZ   L0551F7
         PEA   ^L050008
         PEA   L050008
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055427
         STZ   L055429
         PEA   ^L050036
         PEA   L050036
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055437
         STZ   L055439
         STZ   L055433
         STZ   L055435
         STZ   L05542F
         STZ   L055431
         STZ   L05542B
         STZ   L05542D
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PLY
         PLY
         PLD
         RTL

L1717D3  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $16
         ORA   $18
         BEQ   L17184F
         LDA   [$16]
         LDY   #$0002
         ORA   [$16],Y
         BEQ   L17184F
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $03
         STX   $05
         LDA   [$03]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L171805
         EOR   #$8000
L171805  BPL   L17184F
         LDA   #$0001
         STA   $07
L17180C  LDA   #$0002
         CLC
         ADC   $03
         LDX   $05
         BCC   L171817
         INX
L171817  STA   $09
         STX   $0B
         LDA   $07
         DEC
         TAY
         LDA   #$00FF
         AND   [$09],Y
         CMP   #$002F
         BNE   L171845
         LDA   #$0002
         CLC
         ADC   $03
         LDX   $05
         BCC   L171834
         INX
L171834  STA   $09
         STX   $0B
         LDA   $07
         DEC
         TAY
         LDA   #$003A
         SEP   #$20
         STA   [$09],Y
         REP   #$20
L171845  LDA   $07
         CMP   $01
         BEQ   L17184F
         INC   $07
         BRA   L17180C
L17184F  LDA   $10
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

L171861  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $01
         STZ   L054FB1
         LDA   $0A
         STA   $0E
         LDA   $09
         STA   $0D
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L17188C  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         LDY   #$00E1
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $01
         PLX
         STX   $03
         PHY
         PEI   $03
         PEI   $01
         JSL   L0971E9
         PLA
         STA   $12
         PEI   $03
         PEI   $01
         JSL   L07185A
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

L1718D9  ENT
         PHD
         TSC
         CLC
         ADC   #$FE5E
         TCS
         ADC   #$00AB
         TCD
         JSL   L17000D
         PHY
         PHY
         PEA   $0000
         PEA   $0400
         LDA   L054FBF
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         STA   $F3
         STX   $F5
         LDA   #$03E8
         STA   [$F3]
         LDA   #$0001
         STA   $69
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         STA   $6B
         STX   $6D
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         PEA   $2027
         JSL   GSOS2
         STAL  L05565D
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         CLC
         ADC   #$0002
         BCC   L17194C
         INX
L17194C  STA   $65
         STX   $67
         LDY   #$0002
         LDA   [$DB],Y
         TAX
         LDA   [$DB]
         STA   $F3
         STX   $F5
         LDA   [$65]
         INC
         INC
         STA   [$F3]
         LDA   #$2F31
         STA   [$65]
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF55
         PHA
         PEI   $DD
         PEI   $DB
         JSL   L072CD4
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   L055265
         PLA
         STA   L055267
         PEI   $DD
         PEI   $DB
         JSL   L07185A
         LDA   #$0001
         STAL  L050032
         PEA   ^L050032
         PEA   L050032
         PEA   $200F      ; GetSysPrefs
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0001
         STA   $55
         LDA   #$4000
         ORAL  L050034
         STA   $57
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $200C
         JSL   GSOS2
         STAL  L05565D
         LDA   L055271
         PHA
         JSL   L150B70
         PHY
         PHY
         PEA   $801E
         JSL   L150BAC
         PLA
         STA   L05526D
         PLA
         STA   L05526F
         PHY
         PHY
         PEA   $801F
         JSL   L150BAC
         PLA
         STA   L055269
         PLA
         STA   L05526B
         STZ   $FC
         STZ   L055281
         STZ   L05502F
         PHY
         PHY
         JSL   L15035F
         JSL   L151460
         LDA   #$8003
         LDX   #$0110
         STA   L05501B
         STX   L05501D
         LDAL  L040243+2
*         TAX
         stal  L052528
         LDAL  L040243
         STAL  L052526
*         TXA
*         STAL  L052528
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF55
         PHA
         PEA   $0001
         JSL   L073002
         JSL   L0735A8
         PLA
         STA   L055035
         PLA
         STA   L055037
         STZ   $DF
         STZ   $E1
         STZ   $E3
         STZ   $E5
         JSL   L1701A6
         JSL   L170455
         JSL   L170543
         JSL   L170C28
         JSL   L1711E1
         JSL   L170FBA
         JSL   L0B8B39
         JSL   L17173F
         PHY
         JSL   L150BA6
         PLA
         AND   #$7FFF
         SEC
         SBC   #$0306	; System 5 is 0, System 6 is not
         STA   L0551FD
         LDA   #$FFFF
         CMP   L0551FD
         BNE   L171A86
         STZ   L0551FD
L171A86  LDA   L0551FD
         SEC
         SBC   #$0000
         BPL   L171A99
         PEA   $0048
         JSL   L0727E0
         BRL   L171FC0
L171A99  PHY
         JSL   L095FB4
         PLA
         LSR
         BCC   L171ABD
         JSL   L15059E
         PHY
         PHY
         JSL   L15042E
         LDA   #$7D00
         LDX   #$0000
         JSL   L033477
         BVS   L171ABB
         EOR   #$8000
L171ABB  BMI   L171AC7
L171ABD  PEA   $0035
         JSL   L0727E0
         BRL   L171FC0
L171AC7  PHY
         PHY
         PEA   ^L040247
         PEA   L040247
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   L055261
         PLA
         STA   L055263
         STZ   $EF
         STZ   $F1
         STZ   $EB
         STZ   $ED
         STZ   $D7
         PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $D3
         PLX
         STX   $D5
         LDAL  L05565D
         BEQ   L171B10
         BRL   L171B9E
L171B10  PEA   $0002
         PEA   $0001
         PEI   $D5
         PEI   $D3
         JSL   L150F3B
         LDAL  L05565D
         BNE   L171B9E
         PHY
         PHY
         LDY   #$0002
         LDA   [$D3],Y
         TAX
         LDA   [$D3]
         CLC
         ADC   #$0008
         BCC   L171B35
         INX
L171B35  PHX
         PHA
         JSL   L0735A8
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDY   #$0002
         LDA   [$D3],Y
         TAX
         LDA   [$D3]
         CLC
         ADC   #$0006
         BCC   L171B50
         INX
L171B50  STA   $F3
         STX   $F5
         LDA   [$F3]
         STA   $D7
         PEA   $0003
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L150F3B
         PEI   $E9
         PEI   $E7
         PEA   $0000
         PHD
         JSL   L1717D3
         PEI   $E9
         PEI   $E7
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L07869F
         PEI   $D5
         PEI   $D3
         JSL   L07185A
         PEI   $E9
         PEI   $E7
         JSL   L07185A
L171B9E  LDA   #$0001
         STA   L055255
         PHY
         PHY
         PEA   ^L04024A
         PEA   L04024A
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCC   L171BC9
         BRL   L171D34
L171BC9  LDA   $EB
         ORA   $ED
         BEQ   L171BF7
         PEI   $E1
         PEI   $DF
         JSL   L07185A
         PHY
         PHY
         PEI   $ED
         PEI   $EB
         JSL   L070525
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCC   L171BF7
         BRL   L171D34
L171BF7  PEI   $E1
         PEI   $DF
         JSL   L07185A
         PHY
         PHY
         PEA   ^L040254
         PEA   L040254
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCC   L171C24
         BRL   L171D34
L171C24  PEI   $E1
         PEI   $DF
         JSL   L07185A
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF55
         PHA
         PEA   $0002
         JSL   L073002
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCC   L171C5B
         BRL   L171D34
L171C5B  PEI   $E1
         PEI   $DF
         JSL   L07185A
         PHY
         PHY
         PEA   ^L040257
         PEA   L040257
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCC   L171C88
         BRL   L171D34
L171C88  PEI   $E1
         PEI   $DF
         PEI   $E5
         PEI   $E3
         JSL   L071825
         STZ   $DF
         STZ   $E1
         STZ   $E3
         STZ   $E5
         PHY
         PEA   $0006
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FF55
         PHA
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L072CD4
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         STA   $D9
         LDA   $D9
         BEQ   L171D20
         PEI   $E9
         PEI   $E7
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L07869F
         PEI   $E9
         PEI   $E7
         JSL   L07185A
         PHY
         PEI   $E5
         PEI   $E3
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L071330
         PLA
         LSR
         BCC   L171D1E
         LDA   #$0001
         STA   L055281
         PHY
         PEA   $0000
         PHD
         JSL   L17188C
         PLA
         LSR
         BCS   L171D34
         BRA   L171D20
L171D1E  STZ   $D9
L171D20  LDA   $D9
         EOR   #$0001
         BNE   L171D2A
         BRL   L171C88
L171D2A  PEA   $000A
         JSL   L0727E0
         BRL   L171FC0
L171D34  STZ   L055255
         LDA   #$0001
         STA   L055281
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         PEA   $0001
         JSL   L07B8EA
         PLA
         STA   L05527D
         PLA
         STA   L05527F
         LDA   #$0001
         LDX   #$0000
         STA   L055279
         STX   L05527B
         STZ   L0551CF
         STZ   L0551D1
         STZ   L0551D3
         STZ   L0551D5
         LDAL  L04025A
         SEP   #$20
         STAL  L052506
         REP   #$20
         LDA   #$002C
         STA   L055277
         STZ   L055201
         STZ   L055203
         STZ   L0551FF
         STZ   L0551B1
         STZ   L0551B3
         STZ   L0551DB
         PHY
         PHY
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L070525
         PLA
         STA   L055035
         PLA
         STA   L055037
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L070525
         PLA
         STA   L055031
         PLA
         STA   L055033
         LDA   L055039
         LDX   L05503B
         STA   L05502B
         STX   L05502D
         LDA   L05503D
         STA   L05502F
         LDA   L05525F
         STA   L055275
         LDA   L05525D
         STA   L055273
         LDA   #$0002
         STA   $75
         LDA   #$0001
         LDX   #$0000
         STA   $7B
         STX   $7D
         LDA   #$0006
         STA   $A1
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         JSL   L078841
         PLA
         STA   $CD
         PLX
         STX   $CF
         LDAL  L053B99
         ORAL  L053B9B
         BEQ   L171E14
         LDA   #$0001
L171E14  STA   $D1
         LDA   $D1
         BEQ   L171E83
         STZ   $D7
         LDA   #$0001
         STA   $75
         LDAL  L053B9B
         TAX
         LDAL  L053B99
         STA   $77
         STX   $79
         LDA   #$0000
         STAL  L053B99
         STAL  L053B9B
         LDA   #$0001
         STA   L05504D
         JSL   L078CA4
         PHY
         PHY
         PEA   ^L053B9D
         PEA   L053B9D
         JSL   L0735A8
         PLA
         STA   $E7
         PLX
         STX   $E9
         PEI   $ED
         PEI   $EB
         PEI   $F1
         PEI   $EF
         JSL   L071825
         PEI   $E9
         PEI   $E7
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L07869F
         PEI   $E9
         PEI   $E7
         JSL   L07185A
L171E83  LDA   $EF
         ORA   $F1
         BEQ   L171EC6
         PHY
         PEI   $F1
         PEI   $EF
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L071330
         PLA
         LSR
         BCS   L171EC6
         PHY
         PHY
         PEI   $ED
         PEI   $EB
         PEI   $F1
         PEI   $EF
         JSL   L072B9F
         PLA
         STA   $E7
         PLX
         STX   $E9
         PHY
         PEI   $E9
         PEI   $E7
         JSL   L0971E9
         PLA
         STA   $73
         PEI   $E9
         PEI   $E7
         JSL   L07185A
L171EC6  PHY
         TDC
         CLC
         ADC   #$0075
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCS   L171F0C
         LDA   #$0002
         STA   $75
         LDA   #$0001
         LDX   #$0000
         STA   $7B
         STX   $7D
         LDA   L05502B
         LDX   L05502D
         STA   $CD
         STX   $CF
         PHY
         TDC
         CLC
         ADC   #$0075
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCS   L171F0C
         BRL   L171FC0
L171F0C  JSL   L09999B
         STZ   L055135
         STZ   L055139
         PEA   ^L053259
         PEA   L053259
         JSL   L085216
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L15102F
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         JSL   L083E9E
         PEA   ^L053259
         PEA   L053259
         JSL   L087BAE
         PEA   ^L053259
         PEA   L053259
         JSL   L1511B0
         LDA   $D7
         DEC
         BNE   L171F6E
         PHY
         PEA   $00C2
         PEA   $0000
         PEA   $0000
         JSL   L1604F0
         PLA
         STA   $71
         LDA   #$0001
         STA   L05524F
         BRA   L171FBB
L171F6E  PEA   $0000
         PHD
         JSL   L171861
         LDA   #$001A
         STA   $63
         LDA   $D1
         BEQ   L171F84
         LDA   #$001B
         STA   $63
L171F84  PEI   $63
         JSL   L0998B0
         PEA   $0000
         PHD
         JSL   L171861
         PEA   $0001
         JSL   L0998B0
         PEA   $0000
         PHD
         JSL   L171861
         PEA   $0002
         JSL   L0998B0
         PEA   $0000
         PHD
         JSL   L171861
         PEA   $0003
         JSL   L0998B0
         JSL   L096253
L171FBB  LDA   #$0001
         STA   $FC
L171FC0  PEI   $E1
         PEI   $DF
         PEI   $E5
         PEI   $E3
         JSL   L071825
         PEI   $ED
         PEI   $EB
         PEI   $F1
         PEI   $EF
         JSL   L071825
         PHY
         JSL   L0727BF
         PLA
         STA   $61
         TSC
         CLC
         ADC   #$01A2
         TCS
         PLD
         RTL

