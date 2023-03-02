*
* HypercardGS
* segment: $25 HPrintMix
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintMix.l
         lst   off

*---------------------------------------

         use   HPrintMix.X

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

L250000  ENT
         DW    $0016
L250002  DW    $0A00
L250004  DW    $0016
L250006  DW    $0C00

L250008  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEA
         TCS
         TCD
         STZ   $20
         STZ   $0D
         STZ   $0F
         PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCS   L25002B
         BRL   L250128
L25002B  PEA   $0003
         JSL   L160A4C
         PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BNE   L250047
         BRL   L250128
L250047  PHY
         PEI   $07
         PEI   $05
         JSL   L0718A4
         PLA
         STA   $11
         PEI   $07
         PEI   $05
         JSL   L0718BF
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         BEQ   L2500B0
         LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L250079
         INX
L250079  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L250088
         DEX
L250088  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L2500A0
         INX
L2500A0  STA   $13
         STX   $15
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $0D
         STX   $0F
L2500B0  PEI   $07
         PEI   $05
         PEI   $11
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         PEA   $0000
         JSL   L074B81
         LDA   $0D
         ORA   $0F
         BEQ   L250128
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BEQ   L250128
         PEI   $1E
         PEI   $1C
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$000C
         BCC   L250109
         INX
L250109  PHX
         PHA
         PEA   $0014
         JSL   L0313BE
         PEI   $0F
         PEI   $0D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L074B81
         LDA   #$0001
         STA   $20
L250128  LDA   $1A
         STA   $1E
         LDA   $19
         STA   $1D
         LDA   $17
         TCD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L25013A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         STZ   $30
         LDA   L055243
         EOR   #$0001
         AND   L055051
         BEQ   L250152
         BRL   L2502FF
L250152  STZ   $19
         STZ   $1B
         PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCS   L25016B
         BRL   L2502FF
L25016B  PEA   $0003
         JSL   L160A4C
         PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $11
         PLX
         STX   $13
         LDA   $11
         ORA   $13
         BNE   L250187
         BRL   L2502FF
L250187  PHY
         PEI   $13
         PEI   $11
         JSL   L0718A4
         PLA
         STA   $21
         PEI   $13
         PEI   $11
         JSL   L0718BF
         STZ   $23
         LDY   #$0002
         LDA   [$11],Y
         TAX
         LDA   [$11]
         STA   $0D
         STX   $0F
         LDA   $0D
         LDX   $0F
         STA   $09
         STX   $0B
         LDY   #$000E
         LDA   [$09],Y
         BEQ   L2501FA
         LDA   #$009E
         CLC
         ADC   $09
         LDX   $0B
         BCC   L2501C3
         INX
L2501C3  PHX
         PHA
         LDY   #$000E
         LDA   [$09],Y
         JSL   L150488
         TAY
         BNE   L2501D2
         DEX
L2501D2  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L2501EA
         INX
L2501EA  STA   $25
         STX   $27
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $19
         STX   $1B
L2501FA  LDA   $19
         ORA   $1B
         BNE   L250203
         BRL   L250299
L250203  PHY
         PHY
         PEI   $1B
         PEI   $19
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         ORA   $17
         BEQ   L250299
         PHY
         PEI   $17
         PEI   $15
         JSL   L0718A4
         PLA
         STA   $1F
         PEI   $17
         PEI   $15
         JSL   L0718BF
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $05
         STX   $07
         LDY   #$0020
         LDA   [$05],Y
         STA   $1D
         LDA   $2E
         BEQ   L250259
         LDA   #$4000
         ORA   $1D
         LDY   #$0020
         STA   [$05],Y
         BRA   L250263
L250259  LDA   #$BFFF
         AND   $1D
         LDY   #$0020
         STA   [$05],Y
L250263  LDX   #$0000
         LDY   #$0020
         LDA   [$05],Y
         CMP   $1D
         BEQ   L250270
         INX
L250270  TXA
         STA   $23
         PEI   $17
         PEI   $15
         PEI   $1F
         JSL   L0718DA
         PEI   $1B
         PEI   $19
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         AND   $23
         PHA
         JSL   L074B81
         LDA   #$0001
         STA   $30
L250299  LDA   $23
         BEQ   L2502D8
         LDA   $0D
         LDX   $0F
         STA   $01
         STX   $03
         LDA   #$009E
         CLC
         ADC   $01
         LDX   $03
         BCC   L2502B0
         INX
L2502B0  PHX
         PHA
         LDY   #$000E
         LDA   [$01],Y
         JSL   L150488
         TAY
         BNE   L2502BF
         DEX
L2502BF  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $25
         STX   $27
         LDA   $1D
         STA   [$25]
L2502D8  PEI   $13
         PEI   $11
         PEI   $21
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   $23
         PHA
         JSL   L074B81
L2502FF  LDA   $2C
         STA   $2E
         LDA   $2B
         STA   $2D
         LDA   $29
         TCD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L250311  ENT
         PHD
         TSC
         CLC
         ADC   #$FC4C
         TCS
         ADC   #$02CB
         TCD
         PHY
         PHY
         JSL   L150695
         PLA
         STA   $A9
         PLX
         STX   $AB
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $C1
         PLX
         STX   $C3
         PEI   $EE
         PHY
         JSL   L160AA0
         PLA
         STA   $E5
         PLA
         AND   $E5
         STA   $E3
         LDA   L055327
         LDX   L055329
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         TXY
         LDX   #$FD4D
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0050
         BCC   L25036E
         INX
L25036E  CLC
         ADC   #$0008
         BCC   L250375
         INX
L250375  STA   $E5
         STX   $E7
         LDA   #L160ACA
         LDX   #^L160ACA
         STA   [$E5]
         TXA
         LDY   #$0002
         STA   [$E5],Y
         STZ   L055341
         STZ   L055343
         LDA   $E3
         BNE   L250394
         BRL   L250429
L250394  LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0050
         BCC   L2503A4
         INX
L2503A4  CLC
         ADC   #$0006
         BCC   L2503AB
         INX
L2503AB  PHX
         PHA
         LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0050
         BCC   L2503BD
         INX
L2503BD  CLC
         ADC   #$0006
         BCC   L2503C4
         INX
L2503C4  STA   $E5
         STX   $E7
         LDA   #$00FF
         AND   [$E5]
         AND   #$FF00
         PHA
         PLA
         PLX
         STX   $E5
         PLX
         STX   $E7
         SEP   #$20
         STA   [$E5]
         REP   #$20
         LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L2503EE
         INX
L2503EE  STA   $E5
         STX   $E7
         LDA   [$E5]
         STA   $D7
         LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L250406
         INX
L250406  PHX
         PHA
         LDX   #$FD4D
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L250418
         INX
L250418  STA   $E5
         STX   $E7
         LDA   #$000A
         ORA   [$E5]
         PLX
         STX   $E5
         PLX
         STX   $E7
         STA   [$E5]
L250429  PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0001
         JSL   L160AAE
         PLA
         STA   $D5
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         PHY
         PHY
         PEA   $0837
         JSL   L0711EB
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         JSL   L160AD8
         TDC
         CLC
         ADC   #$0065
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF51
         PHA
         JSL   L160A84
         LDA   L055327
         LDX   L055329
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         TXY
         LDX   #$FD49
         STA   $00,X
         TYA
         STA   $02,X
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         LDX   #$FD49
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L2504B5
         INX
L2504B5  CLC
         ADC   #$0006
         BCC   L2504BC
         INX
L2504BC  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
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
         PEA   $0008
         JSL   L0313BE
         LDA   $EE
         BEQ   L2504F1
         LDAL  L250006
         TAX
         LDAL  L250004
         STA   $A1
         STX   $A3
         BRA   L2504FE
L2504F1  LDAL  L053253
         TAX
         LDAL  L053251
         STA   $A1
         STX   $A3
L2504FE  PHY
         TDC
         CLC
         ADC   #$00A1
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L160A92
         PLA
         CLC
         ADC   $AD
         STA   $D3
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF51
         PHA
         JSL   L15063B
         PLA
         CLC
         ADC   #$0014
         STA   $CD
         PHY
         PEI   $F6
         PEI   $F4
         JSL   L15063B
         PLA
         STA   $CF
         PHY
         LDA   $BB
         SEC
         SBC   $CF
         PHA
         LDA   $CD
         CLC
         ADC   $B7
         PHA
         JSL   L072FA6
         PLA
         STA   $CD
         LDA   $EE
         BEQ   L25055D
         LDAL  L250002
         TAX
         LDAL  250000
         STA   $A5
         STX   $A7
         BRA   L250569
L25055D  LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STA   $A5
         STX   $A7
L250569  PHY
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L160A92
         PLA
         STA   $E1
         LDA   $E1
         ASL
         STA   $DD
         LDA   $DD
         CLC
         ADC   $D3
         STA   $AD
         LDA   $B1
         SEC
         SBC   $DD
         STA   $B1
         PEI   $B1
         LDA   $B1
         SEC
         SBC   $AD
         PHA
         PEI   $E1
         JSL   L150318
         PLX
         PLX
         STA   $E5
         PLA
         SEC
         SBC   $E5
         STA   $B1
         LDA   $B1
         SEC
         SBC   $AD
         PHA
         PEI   $E1
         JSL   L1500F5
         PLX
         PLX
         STA   $DB
         LDA   $E1
         CLC
         ADC   $B1
         STA   $D1
         LDA   #$0001
         STA   $D9
         STZ   $C5
         STZ   $C7
         PEA   $0000
         JSL   L1609F8
         PEA   $0000
         TDC
         CLC
         ADC   #$FE51
         PHA
         JSL   L160AE6
         LDA   #$0000
         STAL  L0551AD
         PHY
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L151287
         PLA
         STA   $BD
         PLX
         STX   $BF
         JSL   L160AF4
         PHY
         JSL   L160A06
         PLA
         BEQ   L25060C
         BRL   L2507E4
L25060C  PEI   $BF
         PEI   $BD
         PEA   $0000
         PEA   $0000
         JSL   L1511A4
         JSL   L160AF4
         PHY
         JSL   L160A06
         PLA
         BEQ   L250629
         BRL   L25079C
L250629  PEI   $A3
         PEI   $A1
         JSL   L1609CE
         PEI   $B7
         PEI   $D3
         JSL   L1510C5
         LDA   $F4
         ORA   $F6
         BEQ   L250669
         PEA   $0000
         TDC
         CLC
         ADC   #$FF51
         PHA
         JSL   L150592
         LDA   #$00FF
         AND   [$F4]
         SEC
         SBC   #$0000
         BMI   L250669
         BEQ   L250669
         PEI   $CD
         PEI   $D3
         JSL   L1510C5
         PEI   $F6
         PEI   $F4
         JSL   L150592
L250669  PEI   $A7
         PEI   $A5
         JSL   L1609CE
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L0718A4
         PLA
         STA   $DF
         PEI   $FA
         PEI   $F8
         JSL   L0718BF
         LDY   #$001A
         LDA   [$BD],Y
         TAX
         DEY
         DEY
         LDA   [$BD],Y
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$0002
         BCC   L2506A2
         INX
L2506A2  PHX
         PHA
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         LDY   #$0002
         LDA   [$F8],Y
         PHA
         LDA   [$F8]
         PHA
         TDC
         CLC
         ADC   #$00AD
         PEA   $0000
         PHA
         PEA   $0000
         PEI   $E1
         PEI   $C5
         JSL   L08090C
         PLA
         STA   $DD
         PEI   $FA
         PEI   $F8
         PEI   $DF
         JSL   L0718DA
         PEI   $C7
         PEI   $C5
         LDA   $DB
         JSL   L150488
         JSL   L150F53
         STA   $C5
         STX   $C7
         PEI   $C7
         PEI   $C5
         LDA   $DD
         JSL   L150488
         JSL   L033477
         BVS   L250704
         EOR   #$8000
L250704  BPL   L25070B
         LDA   #$0000
         BRA   L25070E
L25070B  LDA   #$0001
L25070E  PHA
         LDA   $D9
         SEC
         SBC   #$0001
         BEQ   L25071E
         BVS   L25071C
         EOR   #$8000
L25071C  BMI   L250723
L25071E  LDA   #$0000
         BRA   L250726
L250723  LDA   #$0001
L250726  ORA   $01,S
         PLX
         LSR
         BCC   L25079C
         PEI   $A3
         PEI   $A1
         JSL   L1609CE
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         PHY
         PHY
         PEA   $0839
         JSL   L0711EB
         PEA   $0000
         TDC
         CLC
         ADC   #$FD35
         PHA
         LDA   $D9
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FD51
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PHY
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         JSL   L15063B
         PLA
         STA   $CF
         LDA   $BB
         SEC
         SBC   $CF
         PHA
         PEI   $D1
         JSL   L1510C5
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         JSL   L150592
L25079C  PEI   $BF
         PEI   $BD
         JSL   L15149C
         JSL   L160AF4
         LDA   $D9
         INC
         STA   $D9
         PEI   $C7
         PEI   $C5
         LDA   $DD
         JSL   L150488
         JSL   L033477
         BVS   L2507C0
         EOR   #$8000
L2507C0  BMI   L2507C7
         LDA   #$0000
         BRA   L2507CA
L2507C7  LDA   #$0001
L2507CA  PHA
         PHY
         JSL   L160A06
         PLA
         BNE   L2507D8
         LDA   #$0000
         BRA   L2507DB
L2507D8  LDA   #$0001
L2507DB  ORA   $01,S
         PLX
         LSR
         BCS   L2507E4
         BRL   L25060C
L2507E4  PEI   $BF
         PEI   $BD
         JSL   L1513E8
         JSL   L160AF4
         LDA   L055327
         LDX   L055329
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$0050
         BCC   L250809
         INX
L250809  CLC
         ADC   #$0006
         BCC   L250810
         INX
L250810  STA   $E5
         STX   $E7
         LDA   #$00FF
         AND   [$E5]
         AND   #$00FF
         CMP   #$0080
         BNE   L250880
         PHY
         JSL   L160A06
         PLA
         BNE   L250880
         PHY
         PHY
         JSL   L15042E
         LDA   #$2800
         LDX   #$0000
         JSL   L033477
         BEQ   L250842
         BVS   L250840
         EOR   #$8000
L250840  BMI   L250846
L250842  JSL   L15059E
L250846  PHY
         PHY
         JSL   L15042E
         LDA   #$2800
         LDX   #$0000
         JSL   L033477
         BEQ   L250879
         BVS   L25085D
         EOR   #$8000
L25085D  BPL   L250879
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505CE
         BRA   L250880
L250879  PEA   $1309
         JSL   L1609F8
L250880  LDA   #$0001
         STAL  L0551AD
         LDA   $E3
         BEQ   L2508AC
         LDA   L055327
         LDX   L055329
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         CLC
         ADC   #$0018
         BCC   L2508A4
         INX
L2508A4  STA   $E5
         STX   $E7
         LDA   $D7
         STA   [$E5]
L2508AC  LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEI   $D5
         JSL   L160B10
         PEI   $C3
         PEI   $C1
         JSL   L151131
         PEI   $AB
         PEI   $A9
         JSL   L1609CE
         PHY
         JSL   L160A06
         PLA
         BEQ   L2508D7
         LDA   #$0000
         BRA   L2508DA
L2508D7  LDA   #$0001
L2508DA  STA   $FC
         LDA   $EC
         STA   $FA
         LDA   $EB
         STA   $F9
         LDA   $E9
         TCD
         TSC
         CLC
         ADC   #$03C4
         TCS
         RTL

L2508EE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $01
         PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCC   L25091A
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L151059
         PLA
         STA   $01
L25091A  LDA   $01
         STA   $0C
         LDA   $01
         ORA   L055337
         STA   L055337
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L160B80
         PLY
         PLY
         PLY
         PLD
         RTL

L250938  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         STZ   $2A
         STZ   $19
         LDA   L055243
         EOR   #$0001
         AND   L055051
         BEQ   L250952
         BRL   L250AB2
L250952  PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L250967
         BRL   L250AB2
L250967  PHY
         PEI   $0B
         PEI   $09
         JSL   L0718A4
         PLA
         STA   $17
         PEI   $0B
         PEI   $09
         JSL   L0718BF
         STZ   $1B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         STA   $15
         PHY
         LDY   #$0010
         LDA   [$01],Y
         PHA
         PEA   $0020
         JSL   L072FD5
         PLA
         STA   $13
         LDA   #$0001
         STA   $11
L2509A6  LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$009E
         BCC   L2509B5
         INX
L2509B5  PHX
         PHA
         LDA   $11
         JSL   L150488
         TAY
         BNE   L2509C1
         DEX
L2509C1  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L2509D9
         INX
L2509D9  STA   $1D
         STX   $1F
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $0D
         STX   $0F
         PHY
         PHY
         PEI   $0F
         PEI   $0D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L250A69
         PHY
         PEI   $28
         PEI   $26
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L250A1C
         INX
L250A1C  PHX
         PHA
         JSL   L071C56
         PLA
         STA   $19
         PEI   $0F
         PEI   $0D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L074B81
         PEI   $0F
         PEI   $0D
         JSL   L077B28
         LDA   $19
         BEQ   L250A69
         LDA   $15
         CMP   $11
         BEQ   L250A64
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$000E
         BCC   L250A57
         INX
L250A57  STA   $1D
         STX   $1F
         LDA   $11
         STA   [$1D]
         LDA   #$0001
         STA   $1B
L250A64  LDA   #$0001
         STA   $2A
L250A69  LDA   $11
         INC
         STA   $11
         LDA   $11
         SEC
         SBC   $13
         BEQ   L250A7C
         BVS   L250A7A
         EOR   #$8000
L250A7A  BMI   L250A81
L250A7C  LDA   #$0000
         BRA   L250A84
L250A81  LDA   #$0001
L250A84  ORA   $19
         BNE   L250A8B
         BRL   L2509A6
L250A8B  PEI   $0B
         PEI   $09
         PEI   $17
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   $1B
         PHA
         JSL   L074B81
L250AB2  LDA   $24
         STA   $28
         LDA   $23
         STA   $27
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

