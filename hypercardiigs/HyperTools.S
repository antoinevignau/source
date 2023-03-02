*
* HypercardGS
* segment: $09 HyperTools
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperTools.l
         lst   off

*---------------------------------------

         use   HyperTools.E
         use   HyperTools.X

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

L090000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         JSL   L079752
         LDA   L055137
         STA   $05
         JSL   L083CFB
         LDA   L055051
         BNE   L09001D
         BRL   L09013A
L09001D  PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0771D3
         PLA
         STA   $03
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0771D3
         PLA
         STA   $01
         PEA   $0001
         JSL   L07479E
         LDA   $03
         BEQ   L0900A5
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L0B86C4
         LDA   L055155
         BNE   L0900A5
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $0B
         ORA   $0D
         BEQ   L0900A5
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0010
         BCC   L090085
         INX
L090085  STA   $0F
         STX   $11
         LDA   #$2000
         AND   [$0F]
         BEQ   L090093
         LDA   #$0001
L090093  STA   L055151
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L0900A5  LDA   $01
         BEQ   L090106
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L0B8607
         LDA   L055155
         BNE   L090106
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BEQ   L090106
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         CLC
         ADC   #$0010
         BCC   L0900E6
         INX
L0900E6  STA   $0F
         STX   $11
         LDA   #$2000
         AND   [$0F]
         BEQ   L0900F4
         LDA   #$0001
L0900F4  STA   L05514F
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L090106  LDA   $01
         ORA   $03
         ORA   $05
         BEQ   L09013A
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         STZ   L055139
         LDA   $01
         BEQ   L090122
         STZ   L055135
L090122  LDA   $1A
         BEQ   L09013A
         LDA   L0550B9
         DEC
         BNE   L090132
         JSL   L1601B6
         BRA   L090136
L090132  JSL   L0A3163
L090136  JSL   L083E9E
L09013A  LDA   $16
         STA   $1A
         LDA   $15
         STA   $19
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L09014C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD2
         TCS
         TCD
         LDA   L055051
         BEQ   L09015F
         JSL   L0903A6
         BRA   L090199
L09015F  PHY
         PHY
         PHY
         PHY
         JSL   L07B114
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L079A19
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L090188
         PEA   $0001
         JSL   L0727E0
         BRA   L090199
L090188  PEI   $03
         PEI   $01
         PEA   $0000
         PEA   $0000
         PEA   $0003
         JSL   L0968AD
L090199  TSC
         CLC
         ADC   #$002E
         TCS
         PLD
         RTL

L0901A1  PHD
         TSC
         CLC
         ADC   #$FCC8
         TCS
         ADC   #$0249
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB7
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0020
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDB7
         PHA
         PEI   $F6
         PEI   $F4
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB7
         PHA
         JSL   L0B88AC
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L0901FF
         BRL   L09030C
L0901FF  LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         STA   $E3
         STX   $E5
L09020B  TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         JSL   L0712B0
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L09023F
         BRL   L090304
L09023F  LDA   #$00FF
         LDX   #$FED7
         AND   $00,X
         BNE   L09020B
         PHY
         PHY
         LDY   #$0002
         LDA   [$E7],Y
         PHA
         LDA   [$E7]
         PHA
         JSL   L071C98
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEI   $E9
         PEI   $E7
         PEI   $E1
         PEI   $DF
         LDA   #$00FF
         LDX   #$FFD7
         AND   $00,X
         JSL   L150488
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L09027E
         INX
L09027E  PHX
         PHA
         JSL   L078A05
         PLA
         LSR
         BCS   L09028A
         BRA   L090304
L09028A  LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         PEI   $E1
         PEI   $DF
         JSL   L150F53
         STA   $D7
         STX   $D9
         LDX   $D9
         LDA   $D7
         BNE   L0902A5
         DEX
L0902A5  DEC
         STA   $EB
         STX   $ED
         LDA   #$00FF
         AND   [$EB]
         CMP   #$000D
         BEQ   L0902C8
         SEP   #$20
         LDA   #$0D
         STA   [$D7]
         REP   #$20
         LDA   $D7
         LDX   $D9
         INC
         BNE   L0902C4
         INX
L0902C4  STA   $D7
         STX   $D9
L0902C8  PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         JSL   L071F3F
         PLA
         STA   $DB
         PLX
         STX   $DD
         TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L070669
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB7
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L0B8C17
L090304  PEI   $E9
         PEI   $E7
         JSL   L07185A
L09030C  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0342
         TCS
         RTL

L09031E  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $16
         DEC
         PHA
         PEA   $0006
         JSL   L150318
         PLX
         PLX
         STA   $07
         LDA   $16
         DEC
         PHA
         PEA   $0006
         JSL   L1500F5
         PLX
         PLX
         STA   $05
         LDA   $12
         LDX   $14
         STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         STA   $09
         STX   $0B
         LDA   $05
         PEA   $0019
         JSL   L150BEE
         PLA
         STA   [$09]
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L09036B
         INX
L09036B  STA   $09
         STX   $0B
         LDA   $07
         PEA   $0050
         JSL   L150BEE
         PLA
         STA   [$09]
         LDA   #$0019
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDY   #$0002
         LDA   #$0050
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   $10
         STA   $16
         LDA   $0F
         STA   $15
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L0903A6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05504F
         BEQ   L0903BC
         PEA   $0031
         JSL   L0727E0
         BRA   L0903C3
L0903BC  PEA   $0030
         JSL   L0727E0
L0903C3  PLY
         PLY
         PLD
         RTL

L0903C7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05524B
         BEQ   L0903D8
         STZ   $0A
         BRA   L0903EE
L0903D8
*         PHY
*         PEA   $0000
*         PEA   $C025
*         JSL   L071A89
*         PLA
         ldal  $c025	; AV 202208
         AND   #$0004
         BEQ   L0903EC
         LDA   #$0001
L0903EC  STA   $0A
L0903EE  PLY
         PLY
         PLD
         RTL

L0903F2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFBA
         TCS
         TCD
         LDA   L055027
         LDX   L055029
         CMP   L05513F
         BNE   L090408
         CPX   L055141
L090408  BEQ   L09040D
         BRL   L090499
L09040D  LDA   L055039
         LDX   L05503B
         CMP   L05513B
         BNE   L09041B
         CPX   L05513D
L09041B  BEQ   L09041F
         BRA   L090499
L09041F  TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L085F5A
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L150300
         PHY
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCS   L090499
         LDA   L055153
         BEQ   L09047D
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L07CD77
         PLA
         STA   $01
         BRA   L090499
L09047D  PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L07CD77
         PLA
         STA   $01
L090499  TSC
         CLC
         ADC   #$0046
         TCS
         PLD
         RTL

L0904A1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B9
         BNE   L0904B4
         JSL   L14092D
         BRA   L0904B8
L0904B4  JSL   L1601C4
L0904B8  PLY
         PLY
         PLD
         RTL

L0904BC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         BEQ   L0904CB
         STZ   L0551ED
L0904CB  LDA   #$02BC
         CMP   L0551ED
         BNE   L0904DF
         LDA   L0550E9
         LDX   L0550EB
         STA   $01
         STX   $03
         BRA   L090509
L0904DF  LDA   #$0258
         CMP   L0551ED
         BNE   L0904F3
         LDA   L0550E5
         LDX   L0550E7
         STA   $01
         STX   $03
         BRA   L090509
L0904F3  LDA   #$044C
         CMP   L0551ED
         BNE   L090507
         LDA   L0550DD
         LDX   L0550DF
         STA   $01
         STX   $03
         BRA   L090509
L090507  BRA   L09052F
L090509  LDAL  L0523CE
         PHA
         LDA   #$0006
         CLC
         ADCL  L0523CC
         PHA
         PEI   $03
         PEI   $01
         JSL   L151029
         PEI   $03
         PEI   $01
         JSL   L15102F
         PEI   $03
         PEI   $01
         JSL   L1511C8
L09052F  LDA   $0C
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

L090541  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDX   #$0000
         LDA   $10
         BEQ   L090552
         BPL   L090553
L090552  INX
L090553  TXA
         PHA
         LDA   $10
         SEC
         SBC   #$0021
         BVS   L090560
         EOR   #$8000
L090560  BMI   L090567
         LDA   #$0000
         BRA   L09056A
L090567  LDA   #$0001
L09056A  ORA   $01,S
         PLX
         LSR
         BCC   L090573
         BRL   L090623
L090573  LDA   L0550B5
         CMP   $10
         BNE   L09057C
         STZ   $0E
L09057C  LDA   $10
         STA   L0550B5
         LDA   $10
         SEC
         SBC   #$0010
         BEQ   L090590
         BVS   L09058E
         EOR   #$8000
L09058E  BMI   L0905B5
L090590  PHY
         LDA   $10
         DEC
         PHA
         JSL   L081A92
         PLA
         STA   $01
         STZ   $03
L09059E  LDA   $03
         ASL
         TAX
         LDA   $01
         STAL  L052D12,X
         LDA   #$000F
         CMP   $03
         BEQ   L0905B3
         INC   $03
         BRA   L09059E
L0905B3  BRA   L0905DD
L0905B5  PEA   ^L052D12
         PEA   L052D12
         LDA   L0550B5
         SEC
         SBC   #$0010
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L053C9D
         LDX   #^L053C9D
         BCC   L0905D4
         INX
L0905D4  PHX
         PHA
         PEA   $0020
         JSL   L0313BE
L0905DD  LDA   L0550CD
         LDX   L0550CF
         CLC
         ADC   #$00CE
         BCC   L0905EA
         INX
L0905EA  STA   $05
         STX   $07
         LDA   #$0020
         AND   [$05]
         BEQ   L0905F8
         LDA   #$0001
L0905F8  AND   $0E
         BEQ   L090612
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L151131
         PEA   ^L0531E1
         PEA   L0531E1
         JSL   L0854D9
L090612  LDA   $0E
         BEQ   L090623
         LDA   L0550B9
         DEC
         BNE   L090623
         PEA   $0001
         JSL   L1601D2
L090623  LDA   $0C
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

L090635  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         SEC
         SBC   #$0001
         BVS   L090648
         EOR   #$8000
L090648  BPL   L09064F
         LDA   #$0000
         BRA   L090652
L09064F  LDA   #$0001
L090652  PHA
         LDA   $0A
         SEC
         SBC   #$0012
         BEQ   L090662
         BVS   L090660
         EOR   #$8000
L090660  BMI   L090667
L090662  LDA   #$0000
         BRA   L09066A
L090667  LDA   #$0001
L09066A  ORA   $01,S
         PLX
         LSR
         BCC   L090672
         BRA   L090686
L090672  LDA   L0550B9
         DEC
         BNE   L090680
         PEI   $0A
         JSL   L0A02BC
         BRA   L090686
L090680  PEI   $0A
         JSL   L0A213D
L090686  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L090696  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         JSL   L150801
         PEI   $24
         PEI   $22
         PEI   $20
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L072B17
         LDA   $11
         SEC
         SBC   $0D
         DEC
         DEC
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   $09
         LDA   $0F
         SEC
         SBC   $0B
         DEC
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   $07
         PHY
         LDA   $15
         SEC
         SBC   $0D
         PHA
         PEI   $09
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L071A1B
         PLA
         STA   $03
         PHY
         LDA   $13
         SEC
         SBC   $0B
         PHA
         PEI   $07
         JSL   L1500F5
         PLX
         PLX
         PHA
         PEA   $0000
         PEA   $0003
         JSL   L071A1B
         PLA
         STA   $05
         LDA   $05
         ASL
         ASL
         CLC
         ADC   $03
         STA   $01
         PEI   $01
         PEI   $24
         PEI   $22
         PEI   $20
         JSL   L073B05
         PEI   $24
         PEI   $22
         PEI   $20
         JSL   L070834
         LDA   $01
         STA   $26
         LDA   $1E
         STA   $24
         LDA   $1D
         STA   $23
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L090752  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         PEA   ^L052D6E
         PEA   L052D6E
         JSL   L150BE8
         LDAL  L052D70
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $15
         LDAL  L052D6E
         PHA
         PEA   $000C
         JSL   L1500F5
         PLX
         PLX
         STA   $13
         LDA   $13
         DEC
         DEC
         BNE   L09079E
         LDA   $15
         SEC
         SBC   #$0001
         BEQ   L09079E
         BVS   L090797
         EOR   #$8000
L090797  BPL   L09079E
         LDA   $15
         DEC
         STA   $15
L09079E  LDA   #$0259
         CLC
         ADC   $15
         PHA
         LDA   $13
         ASL
         ASL
         STA   $17
         PLA
         CLC
         ADC   $17
         STA   $11
         LDA   $13
         DEC
         DEC
         BNE   L0907C2
         LDA   $15
         DEC
         DEC
         BNE   L0907C2
         LDA   #$0003
         STA   $15
L0907C2  LDA   $13
         PEA   $000C
         JSL   L150BEE
         PLA
         STA   $09
         LDA   $15
         PEA   $001C
         JSL   L150BEE
         PLA
         STA   $0B
         LDA   #$000C
         CLC
         ADC   $09
         DEC
         STA   $0D
         LDA   #$001C
         CLC
         ADC   $0B
         DEC
         DEC
         STA   $0F
         LDA   $13
         DEC
         DEC
         BNE   L090800
         LDA   $15
         DEC
         BNE   L090800
         LDA   #$001C
         CLC
         ADC   $0F
         STA   $0F
L090800  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150383
         LDA   #$0001
         STA   $07
L090812  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         LSR
         BCC   L09085E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         STA   $05
         LDA   $07
         CMP   $05
         BEQ   L090858
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150383
L090858  LDA   $05
         STA   $07
         BRA   L090812
L09085E  LDA   $07
         BEQ   L090878
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150383
         PEA   $0258
         PEI   $11
         JSL   L09971B
L090878  LDA   L0550E5
         LDX   L0550E7
         PHX
         PHA
         JSL   L1511C8
         LDA   L0550E5
         LDX   L0550E7
         PHX
         PHA
         JSL   L09B242
         TSC
         CLC
         ADC   #$001A
         TCS
         PLD
         RTL

L090898  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L151131
         PEA   ^L052D6E
         PEA   L052D6E
         JSL   L150BE8
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L1511C8
         LDAL  L052D6E
         PHA
         PEA   $000A
         JSL   L1500F5
         PLX
         PLX
         CLC
         ADC   #$044D
         PHA
         LDAL  L052D70
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         ASL
         ASL
         ASL
         STA   $03
         PLA
         CLC
         ADC   $03
         STA   $01
         PEA   $044C
         PEI   $01
         JSL   L09971B
L0908F7  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         LSR
         BCC   L090905
         BRA   L0908F7
L090905  LDA   L055229
         SEC
         SBC   #$0001
         BEQ   L090919
         BVS   L090913
         EOR   #$8000
L090913  BPL   L090919
         JSL   L1601E0
L090919  PLY
         PLY
         PLY
         PLD
         RTL

L09091E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDA   L05511F
         BEQ   L09092E
         STZ   L05511F
L09092E  LDAL  L05328D
         BNE   L090937
         BRL   L090A5F
L090937  LDA   L0550F3
         BEQ   L090949
         PEA   ^L0408FB
         PEA   L0408FB
         JSL   L07010A
         BRL   L090A5F
L090949  LDA   L055129
         LDX   L05512B
         STA   $0B
         STX   $0D
         LDAL  L05328D
         STA   $09
         LDA   $09
         STA   $07
         LDA   L055027
         LDX   L055029
         CMP   $0B
         BNE   L090969
         CPX   $0D
L090969  BNE   L090973
         LDA   $07
         EOR   #$FFFF
         INC
         STA   $07
L090973  PEA   ^L053291
         PEA   L053291
         JSL   L086CDB
         JSL   L0879C5
         PEA   ^L05328B
         PEA   L05328B
         PEA   $0000
         PEA   $002A
         JSL   L071EC5
         STZ   L055129
         STZ   L05512B
         STZ   L055125
         STZ   L055127
         LDA   L05511D
         BEQ   L0909A5
         STZ   L05511D
L0909A5  PHY
         PHY
         PEA   $0001
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         PEA   $0000
         PEA   $FFFF
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150B22
         PLA
         STA   $03
         PLX
         STX   $05
         LDA   #$0001
         STA   L0550F1
         LDAL  L05565D
         BEQ   L0909F8
         PEA   $002C
         JSL   L0727E0
         LDA   L0550F5
         LDX   L0550F7
         STA   $0F
         STX   $11
         SEP   #$20
         LDA   #$00
         STA   [$0F]
         REP   #$20
L0909F8  LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L15106B
         STZ   L055121
         STZ   L055123
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEI   $07
         LDA   L0550F5
         LDX   L0550F7
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L07D80F
         PLA
         BEQ   L090A3C
         PEA   $002C
         JSL   L0727E0
L090A3C  LDA   $18
         AND   $01
         BEQ   L090A5F
         PEA   $0008
         PEI   $0D
         PEI   $0B
         PEI   $09
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0998E6
L090A5F  LDA   $16
         STA   $18
         LDA   $15
         STA   $17
         LDA   $13
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L090A71  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1516E7
         STZ   L0551F3
         JSL   L151466
         PLY
         PLY
         PLD
         RTL

L090A90  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05524B
         BEQ   L090AA4
         LDA   L055193
         STA   $0A
         BRA   L090ABA
L090AA4
*         PHY
*         PEA   $0000
*         PEA   $C025
*         JSL   L071A89
*         PLA
         ldal  $c025	; AV 202208
         AND   #$0080
         BEQ   L090AB8
         LDA   #$0001
L090AB8  STA   $0A
L090ABA  PLY
         PLY
         PLD
         RTL

L090ABE  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$001D
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BEQ   L090AE0
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L090AE0  LDY   #$000B
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BEQ   L090AFA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L090AFA  PEA   $0036
         JSL   L0727E0
         JSL   L150395
         PHD
         LDA   $0A
         TCD
         CLC
         ADC   #$0000
         TCS
         JMPL  L090F52

         LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L090B24  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $18
         PEI   $16
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L090BAB
         BEQ   L090BAB
         PHY
         PEI   $18
         PEI   $16
         JSL   L0718FA
         PLA
         STA   $03
         PHY
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         PEI   $12
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L0732FD
         PLA
         STA   $01
         LDA   $14
         BEQ   L090B7F
         PEI   $18
         PEI   $16
         JSL   L151053
         BRA   L090B9B
L090B7F  PEI   $18
         PEI   $16
         PEI   $03
         JSL   L0718DA
         LDY   #$001B
         LDA   [$0E],Y
         PHA
         DEY
         DEY
         LDA   [$0E],Y
         PHA
         PEA   $0000
         JSL   L074A5A
L090B9B  LDA   $01
         BNE   L090BAB
         PEA   $0005
         PEA   $0000
         PEI   $0E
         JSL   L090ABE
L090BAB  LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L090BBD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         JSL   L150395
         JSL   L15136D
         STZ   $0B
         STZ   $0D
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $1D
         PLX
         STX   $1F
         LDA   $1D
         ORA   $1F
         BNE   L090BF6
         PEA   $0002
         PEA   $0000
         PHD
         JSL   L090ABE
L090BF6  PHY
         PEI   $1F
         PEI   $1D
         JSL   L079558
         PLA
         LSR
         BCC   L090C0E
         PEA   $0003
         PEA   $0000
         PHD
         JSL   L090ABE
L090C0E  LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         CLC
         ADC   #$000C
         BCC   L090C1D
         INX
L090C1D  STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $19
         STX   $1B
         PHY
         PEI   $1F
         PEI   $1D
         JSL   L0718FA
         PLA
         STA   $17
         PHY
         LDY   #$0002
         LDA   [$1D],Y
         TAX
         LDA   [$1D]
         STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         PHX
         PHA
         PEA   $1604
         LDY   #$0002
         LDA   [$1D],Y
         PHA
         LDA   [$1D]
         PHA
         JSL   L0732FD
         PLA
         STA   $15
         PEI   $1F
         PEI   $1D
         PEI   $17
         JSL   L0718DA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         STZ   $1D
         STZ   $1F
         LDA   $15
         BNE   L090C8F
         PEA   $0004
         PEA   $0000
         PHD
         JSL   L090ABE
L090C8F  LDA   L055153
         EOR   #$0001
         AND   L055137
         STA   $13
         LDA   $13
         BEQ   L090CBC
         PHY
         PHY
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         JSL   L086D20
         PLA
         STA   $0F
         PLX
         STX   $11
         BRA   L090CCF
L090CBC  PHY
         PHY
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L077264
         PLA
         STA   $0F
         PLX
         STX   $11
L090CCF  PEI   $11
         PEI   $0F
         PEI   $13
         PEA   $1605
         PEA   $0000
         PHD
         JSL   L090B24
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $0B
         PLX
         STX   $0D
         LDA   $0B
         ORA   $0D
         BNE   L090D05
         PEA   $0006
         PEA   $0000
         PHD
         JSL   L090ABE
L090D05  PHY
         PEI   $0D
         PEI   $0B
         JSL   L07947E
         PLA
         LSR
         BCC   L090D1D
         PEA   $0007
         PEA   $0000
         PHD
         JSL   L090ABE
L090D1D  LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$000C
         BCC   L090D2C
         INX
L090D2C  STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $19
         STX   $1B
         PHY
         PEI   $0D
         PEI   $0B
         JSL   L0718FA
         PLA
         STA   $17
         PHY
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $21
         STX   $23
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         PHX
         PHA
         PEA   $1606
         LDY   #$0002
         LDA   [$0B],Y
         PHA
         LDA   [$0B]
         PHA
         JSL   L0732FD
         PLA
         STA   $15
         PEI   $0D
         PEI   $0B
         PEI   $17
         JSL   L0718DA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         STZ   $0B
         STZ   $0D
         LDA   $15
         BNE   L090D9E
         PEA   $0008
         PEA   $0000
         PHD
         JSL   L090ABE
L090D9E  LDA   L055153
         AND   L055137
         STA   $13
         LDA   $13
         BEQ   L090DE7
         LDA   L0550B9
         BNE   L090DCB
         PHY
         PHY
         PEA   $FFFF
         PEA   $FFFF
         LDA   L055109
         LDX   L05510B
         PHX
         PHA
         JSL   L086D20
         PLA
         STA   $0F
         PLX
         STX   $11
         BRA   L090DE5
L090DCB  PHY
         PHY
         PEA   $FFFF
         PEA   $FFFF
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         JSL   L086D20
         PLA
         STA   $0F
         PLX
         STX   $11
L090DE5  BRA   L090DFA
L090DE7  PHY
         PHY
         PEI   $1B
         PEI   $19
         PEA   $0000
         JSL   L077264
         PLA
         STA   $0F
         PLX
         STX   $11
L090DFA  PEI   $11
         PEI   $0F
         PEI   $13
         PEA   $1607
         PEA   $0000
         PHD
         JSL   L090B24
         LDA   #$0001
         STA   $09
L090E10  LDA   $09
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L090E22
         INX
L090E22  STA   $01
         STX   $03
         LDA   L055027
         LDX   L055029
         CMP   [$01]
         BNE   L090E36
         LDY   #$0002
         TXA
         CMP   [$01],Y
L090E36  BNE   L090E4C
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L090E4A
         CPX   L05503B
L090E4A  BEQ   L090E5A
L090E4C  LDA   #$0012
         CMP   $09
         BEQ   L090E57
         INC   $09
         BRA   L090E10
L090E57  BRL   L090F52
L090E5A  LDA   #$0001
         STA   L055133
         JSL   L096253
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L05231C
         PEA   L05231C
         JSL   L1506A7
         PEA   ^L053137
         PEA   L053137
         PHY
         PEA   $0230
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PHY
         PEA   $00AF
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         JSL   L1501AF
         PHY
         PHY
         PEA   ^L053137
         PEA   L053137
         JSL   L1502FA
         PLA
         STA   $05
         PLX
         STX   $07
         PEA   ^L053137
         PEA   L053137
         JSL   L150FF9
         PEA   ^L05231C
         PEA   L05231C
         PEA   ^L05312F
         PEA   L05312F
         PEA   ^L052324
         PEA   L052324
         PEA   ^L053137
         PEA   L053137
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         JSL   L151400
         LDX   #$0000
         LDAL  L05565D
         BNE   L090EE7
         INX
L090EE7  TXA
         STA   $15
         PEA   ^L053259
         PEA   L053259
         JSL   L150FF9
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         LDA   $15
         BNE   L090F0D
         PEA   $000A
         PEA   $0000
         PHD
         JSL   L090ABE
L090F0D  PEI   $07
         PEI   $05
         JSL   L150BB8
         PHY
         PHY
         PHY
         PEI   $07
         PEI   $05
         JSL   L151301
         PEA   $0001
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         JSL   L0732FD
         PLA
         STA   $15
         PEI   $07
         PEI   $05
         JSL   L1516B7
         PEI   $07
         PEI   $05
         JSL   L1502F4
         LDA   $15
         BNE   L090F52
         PEA   $000B
         PEA   $0000
         PHD
         JSL   L090ABE
L090F52  TSC
         CLC
         ADC   #$0024
         TCS
         PLD
         RTL

L090F5A  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEI   $0C
         PEI   $0A
         JSL   L0960E8
         PLA
         LSR
         BCC   L090F80
         LDA   L05519F
         LDX   L0551A1
         TAY
         BNE   L090F79
         DEX
L090F79  DEC
         STA   L05519F
         STX   L0551A1
L090F80  LDX   #$0000
         LDA   L05519F
         ORA   L0551A1
         BNE   L090F8C
         INX
L090F8C  TXA
         STA   $0E
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

L090FA0  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         LDA   $0E
         LDX   $10
         PEA   $0000
         PEA   $0023
         JSL   L150F53
         STA   $05
         STX   $07
         LDA   [$05]
         PHA
         PEI   $14
         PEI   $12
         PEI   $18
         PEI   $16
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         STA   $1A
         LDAL  L05565D
         BEQ   L091025
         LDA   $0E
         LDX   $10
         PEA   $0000
         PEA   $0023
         JSL   L150F53
         STA   $05
         STX   $07
         LDA   [$05]
         PHA
         JSL   L075A4F
         LDA   $0E
         LDX   $10
         PEA   $0000
         PEA   $0013
         JSL   L150F53
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         JSL   L075B09
L091025  LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L091037  ENT
         PHD
         TSC
         CLC
         ADC   #$FAD8
         TCS
         ADC   #$0437
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE9
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         LDX   #$FFE9
         STZ   $00,X
         PEA   $0000
         JSL   L07479E
L091062  STZ   L0551AF
         LDA   #$00FF
         LDX   #$FCE9
         AND   $00,X
         BNE   L09109F
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FBC9
         PHA
         PEA   $0017
         JSL   L073002
         PEA   ^L040914
         PEA   L040914
         PEA   $0001
         JSL   L093CCE
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L09109D
         BRL   L092535
L09109D  BRA   L0910C8
L09109F  LDA   #$0001
         LDX   #$FFE9
         STA   $00,X
         LDA   $F6
         STA   L0551AF
         JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FCE9
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $17
         PLX
         STX   $19
L0910C8  PEI   $19
         PEI   $17
         JSL   L0718BF
         LDA   #$3FFF
         STA   $21
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0005
         LDA   $21
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L075A86
         LDA   #$0047
         CMPL  L05565D
         BNE   L091143
         LDX   #$FFE9
         LDA   $00,X
         BEQ   L09110F
         BRL   L092535
L09110F  LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         JSL   L075B09
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0005
         LDA   $21
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L075A86
L091143  LDAL  L05565D
         BNE   L09115D
         PHY
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         PEA   $0000
         JSL   L075D3B
         PLA
         STA   $23
L09115D  LDAL  L05565D
         BEQ   L091177
         LDX   #$FFE9
         LDA   $00,X
         BEQ   L09116D
         BRL   L092535
L09116D  PEA   $0002
         JSL   L0727E0
         BRL   L091062
L091177  PEI   $19
         PEI   $17
         JSL   L07191C
         LDX   #$FFF9
         STZ   $00,X
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $E5
         STX   $E7
         LDA   #$0800
         ORA   $E5
         JSL   L150488
         STA   $E9
         STX   $EB
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $CD
         STX   $CF
         LDA   #$0900
         ORA   $CD
         JSL   L150488
         STA   $D1
         STX   $D3
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $B5
         STX   $B7
         LDA   #$0A00
         ORA   $B5
         JSL   L150488
         STA   $B9
         STX   $BB
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $9D
         STX   $9F
         LDA   #$0B00
         ORA   $9D
         JSL   L150488
         STA   $A1
         STX   $A3
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $6D
         STX   $6F
         LDA   #$0C00
         ORA   $6D
         JSL   L150488
         STA   $71
         STX   $73
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $59
         STX   $5B
         LDA   #$0D00
         ORA   $59
         JSL   L150488
         STA   $5D
         STX   $5F
         LDA   #$0080
         LDX   #$0000
         STA   $DD
         STX   $DF
         PHY
         PHY
         PEI   $DF
         PEI   $DD
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDAL  L05565D
         BEQ   L091268
         BRL   L0924DD
L091268  LDY   #$0002
         LDA   [$D9],Y
         PHA
         LDA   [$D9]
         PHA
         PEI   $DF
         PEI   $DD
         JSL   L071EC5
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         TXY
         LDX   #$FCE5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $DD
         LDX   $DF
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L0912B3
         INX
L0912B3  STA   $ED
         STX   $EF
         LDA   #$494C
         LDX   #$5453
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L0912D5
         INX
L0912D5  STA   $ED
         STX   $EF
         LDA   $E9
         LDX   $EB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L0912F5
         INX
L0912F5  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L091317
         INX
L091317  STA   $ED
         STX   $EF
         LDA   #$0800
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L091339
         INX
L091339  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L09135B
         INX
L09135B  STA   $ED
         STX   $EF
         LDA   #$0010
         STA   [$ED]
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001A
         BCC   L091374
         INX
L091374  STA   $ED
         STX   $EF
         LDA   #$0001
         STA   [$ED]
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001C
         BCC   L09138D
         INX
L09138D  STA   $ED
         STX   $EF
         LDA   #$0003
         STA   [$ED]
         LDX   #$FCE5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001E
         BCC   L0913A6
         INX
L0913A6  STA   $ED
         STX   $EF
         LDA   #$0004
         STA   [$ED]
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         CLC
         ADC   #$0028
         BCC   L0913BE
         INX
L0913BE  STA   $D5
         STX   $D7
         LDA   $D1
         LDX   $D3
         STA   [$D5]
         TXA
         LDY   #$0002
         STA   [$D5],Y
         LDA   #$0001
         LDY   #$0004
         STA   [$D5],Y
         LDA   #$0800
         LDX   #$0000
         STA   $C5
         STX   $C7
         PHY
         PHY
         PEI   $C7
         PEI   $C5
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $C1
         PLX
         STX   $C3
         LDAL  L05565D
         BEQ   L091406
         BRL   L0924DD
L091406  LDY   #$0002
         LDA   [$C1],Y
         PHA
         LDA   [$C1]
         PHA
         PEI   $C7
         PEI   $C5
         JSL   L071EC5
         LDY   #$0002
         LDA   [$C1],Y
         TAX
         LDA   [$C1]
         TXY
         LDX   #$FCE1
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCE1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $C5
         LDX   $C7
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L091451
         INX
L091451  STA   $ED
         STX   $EF
         LDA   #$4150
         LDX   #$4547
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L091473
         INX
L091473  STA   $ED
         STX   $EF
         LDA   $D1
         LDX   $D3
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCE1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L091493
         INX
L091493  STA   $ED
         STX   $EF
         LDA   $E9
         LDX   $EB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDY   #$0002
         LDA   [$C1],Y
         TAX
         LDA   [$C1]
         CLC
         ADC   #$0018
         BCC   L0914B2
         INX
L0914B2  STA   $BD
         STX   $BF
         LDA   $A1
         LDX   $A3
         STA   [$BD]
         TXA
         LDY   #$0002
         STA   [$BD],Y
         LDA   #$0002
         LDY   #$0004
         STA   [$BD],Y
         STZ   $8D
         STZ   $8F
         STZ   $89
         STZ   $8B
         STZ   $81
         STZ   $83
         STZ   $7D
         STZ   $7F
         LDA   #$0004
         STA   $03
         STZ   $05
         LDA   L0551AF
         BNE   L0914E9
         BRL   L091719
L0914E9  PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $A5
         PLX
         STX   $A7
         LDA   $A5
         ORA   $A7
         BNE   L09150A
         PEA   $7EBB
         JSL   L07272E
L09150A  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         CLC
         ADC   #$000C
         BCC   L091519
         INX
L091519  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $79
         STX   $7B
         LDA   $79
         ORA   $7B
         BNE   L091532
         BRL   L0915ED
L091532  PHY
         PHY
         PEI   $7B
         PEI   $79
         PEA   $0000
         JSL   L077264
         PLA
         STA   $75
         PLX
         STX   $77
         LDA   $75
         ORA   $77
         BNE   L09154E
         BRL   L0915ED
L09154E  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $81
         STX   $83
         PHY
         PHY
         PEI   $83
         PEI   $81
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $7D
         PLX
         STX   $7F
         LDAL  L05565D
         BNE   L0915E2
         LDY   #$0002
         LDA   [$75],Y
         PHA
         LDA   [$75]
         PHA
         LDY   #$0002
         LDA   [$7D],Y
         PHA
         LDA   [$7D]
         PHA
         PEI   $83
         PEI   $81
         JSL   L070597
         PHY
         JSL   L150705
         PLA
         AND   #$00FF
         JSL   L150488
         STA   $89
         STX   $8B
         LDA   $89
         LDX   $8B
         CLC
         ADC   #$0E00
         BCC   L0915BF
         INX
L0915BF  STA   $8D
         STX   $8F
         LDY   #$0002
         LDA   [$7D],Y
         TAX
         LDA   [$7D]
         CLC
         ADC   #$0008
         BCC   L0915D2
         INX
L0915D2  STA   $ED
         STX   $EF
         LDA   $8D
         LDX   $8F
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
L0915E2  PEI   $7B
         PEI   $79
         PEA   $0000
         JSL   L074A5A
L0915ED  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $AD
         STX   $AF
         PHY
         PHY
         PEI   $AF
         PEI   $AD
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $A9
         PLX
         STX   $AB
         LDAL  L05565D
         BEQ   L09163A
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         BRL   L0924DD
L09163A  LDY   #$0002
         LDA   [$A5],Y
         PHA
         LDA   [$A5]
         PHA
         LDY   #$0002
         LDA   [$A9],Y
         PHA
         LDA   [$A9]
         PHA
         PEI   $AF
         PEI   $AD
         JSL   L070597
         LDY   #$0002
         LDA   [$A9],Y
         TAX
         LDA   [$A9]
         TXY
         LDX   #$FCDD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCDD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L091675
         INX
L091675  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCDD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L091695
         INX
L091695  STA   $ED
         STX   $EF
         LDA   $8D
         LDX   $8F
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCDD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L0916B5
         INX
L0916B5  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCDD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L0916D7
         INX
L0916D7  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCDD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001C
         BCC   L0916F7
         INX
L0916F7  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         BRL   L091865
L091719  PHY
         PHY
         PEA   $0000
         PEA   $0038
         JSL   L07704E
         PLA
         STA   $AD
         PLX
         STX   $AF
         PHY
         PHY
         PEI   $AF
         PEI   $AD
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $A9
         PLX
         STX   $AB
         LDAL  L05565D
         BEQ   L091751
         BRL   L0924DD
L091751  LDY   #$0002
         LDA   [$A9],Y
         PHA
         LDA   [$A9]
         PHA
         PEI   $AF
         PEI   $AD
         JSL   L071EC5
         LDY   #$0002
         LDA   [$A9],Y
         TAX
         LDA   [$A9]
         TXY
         LDX   #$FCD9
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $AD
         LDX   $AF
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L09179C
         INX
L09179C  STA   $ED
         STX   $EF
         LDA   #$4B42
         LDX   #$4447
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L0917BE
         INX
L0917BE  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L0917DE
         INX
L0917DE  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L091800
         INX
L091800  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001C
         BCC   L091820
         INX
L091820  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDY   #$0002
         LDA   [$A9],Y
         TAX
         LDA   [$A9]
         CLC
         ADC   #$0032
         BCC   L09183F
         INX
L09183F  INC
         BNE   L091843
         INX
L091843  TXY
         LDX   #$FFFF
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFFF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $03
         LDX   $05
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
L091865  PHY
         PHY
         PEA   $0000
         PEA   $0038
         JSL   L07704E
         PLA
         STA   $95
         PLX
         STX   $97
         PHY
         PHY
         PEI   $97
         PEI   $95
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $91
         PLX
         STX   $93
         LDAL  L05565D
         BEQ   L09189D
         BRL   L0924DD
L09189D  LDY   #$0002
         LDA   [$91],Y
         PHA
         LDA   [$91]
         PHA
         PEI   $97
         PEI   $95
         JSL   L071EC5
         LDY   #$0002
         LDA   [$91],Y
         TAX
         LDA   [$91]
         TXY
         LDX   #$FCD5
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCD5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $95
         LDX   $97
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L0918E8
         INX
L0918E8  STA   $ED
         STX   $EF
         LDA   #$4143
         LDX   #$4452
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L09190A
         INX
L09190A  STA   $ED
         STX   $EF
         LDA   $A1
         LDX   $A3
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$001C
         BCC   L09192A
         INX
L09192A  STA   $ED
         STX   $EF
         LDA   $D1
         LDX   $D3
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD5
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L09194A
         INX
L09194A  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDY   #$0002
         LDA   [$91],Y
         TAX
         LDA   [$91]
         CLC
         ADC   #$0032
         BCC   L091969
         INX
L091969  INC
         BNE   L09196D
         INX
L09196D  TXY
         LDX   #$FFFF
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFFF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $03
         LDX   $05
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         PHY
         PHY
         PEA   $0000
         PEA   $04A0
         JSL   L07704E
         PLA
         STA   $51
         PLX
         STX   $53
         PHY
         PHY
         PEI   $53
         PEI   $51
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $4D
         PLX
         STX   $4F
         LDAL  L05565D
         BEQ   L0919C7
         BRL   L0924DD
L0919C7  PHY	; Load segment name HPrintMain
         PEA   ^L040915	; it is now already in memory!
         PEA   L040915
         JSL   L0946A2
         PLA
         LSR
         BCS   L0919D9
         BRL   L0924DD
L0919D9  PEI   $4F
         PEI   $4D
         PEA   $0000
         JSL   L1601EE
         PEA   ^L1601EE
         PEA   L1601EE
         JSL   L07187A
         LDY   #$0002
         LDA   [$4D],Y
         TAX
         LDA   [$4D]
         TXY
         LDX   #$FCD1
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $51
         LDX   $53
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L091A28
         INX
L091A28  STA   $ED
         STX   $EF
         LDA   #$5250
         LDX   #$544E
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCD1
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L091A4A
         INX
L091A4A  STA   $ED
         STX   $EF
         LDA   $5D
         LDX   $5F
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         PHY
         PHY
         PEA   $0000
         PEA   $01DE
         JSL   L07704E
         PLA
         STA   $65
         PLX
         STX   $67
         PHY
         PHY
         PEI   $67
         PEI   $65
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $61
         PLX
         STX   $63
         LDAL  L05565D
         BEQ   L091A92
         BRL   L0924DD
L091A92  LDY   #$0002
         LDA   [$61],Y
         PHA
         LDA   [$61]
         PHA
         PEI   $67
         PEI   $65
         JSL   L071EC5
         LDY   #$0002
         LDA   [$61],Y
         TAX
         LDA   [$61]
         TXY
         LDX   #$FCCD
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $65
         LDX   $67
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L091ADD
         INX
L091ADD  STA   $ED
         STX   $EF
         LDA   #$504D
         LDX   #$5452
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L091AFF
         INX
L091AFF  STA   $ED
         STX   $EF
         LDA   $71
         LDX   $73
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L091B1F
         INX
L091B1F  STA   $ED
         STX   $EF
         LDA   #$0002
         STA   [$ED]
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L091B38
         INX
L091B38  STA   $ED
         STX   $EF
         LDA   #$0001
         STA   [$ED]
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L091B51
         INX
L091B51  STA   $ED
         STX   $EF
         LDA   #$0001
         STA   [$ED]
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$009E
         BCC   L091B6A
         INX
L091B6A  CLC
         ADC   #$0002
         BCC   L091B71
         INX
L091B71  STA   $ED
         STX   $EF
         LDA   $5D
         LDX   $5F
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCCD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$009E
         BCC   L091B91
         INX
L091B91  STA   $ED
         STX   $EF
         LDA   #$8000
         STA   [$ED]
         LDA   #$0001
         LDX   #$0000
         STA   $0B
         STX   $0D
         STZ   $07
         STZ   $09
         LDA   L0551AF
         BEQ   L091BD8
         PHY
         PHY
         JSL   L076220
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BEQ   L091BD8
         PHY
         PHY
         LDY   #$0002
         LDA   [$07],Y
         PHA
         LDA   [$07]
         PHA
         JSL   L071C98
         PLA
         PLX
         INC
         BNE   L091BD4
         INX
L091BD4  STA   $0B
         STX   $0D
L091BD8  PHY
         PHY
         PEA   $FFFF
         PEA   $FE00
         LDA   $0B
         LDX   $0D
         CLC
         ADC   #$0803
         BCC   L091BEB
         INX
L091BEB  PHX
         PHA
         JSL   L15017E
         PLA
         STA   $49
         PLX
         STX   $4B
         PHY
         PHY
         PEI   $4B
         PEI   $49
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $0F
         PLX
         STX   $11
         LDAL  L05565D
         BEQ   L091C25
         PEI   $09
         PEI   $07
         JSL   L07185A
         BRL   L0924DD
L091C25  LDY   #$0002
         LDA   [$0F],Y
         PHA
         LDA   [$0F]
         PHA
         PEI   $4B
         PEI   $49
         JSL   L071EC5
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0600
         BCC   L091C45
         INX
L091C45  TXY
         LDX   #$FFFF
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFFF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $03
         LDX   $05
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDA   $07
         ORA   $09
         BEQ   L091CA8
         LDX   #$FFFF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L091C7D
         INX
L091C7D  TXY
         LDX   #$FFFB
         STA   $00,X
         TYA
         STA   $02,X
         LDY   #$0002
         LDA   [$07],Y
         PHA
         LDA   [$07]
         PHA
         LDX   #$FFFB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEI   $0D
         PEI   $0B
         JSL   L070597
         PEI   $09
         PEI   $07
         JSL   L07185A
L091CA8  LDA   $0F
         LDX   $11
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         TXY
         LDX   #$FCC9
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   $49
         LDX   $4B
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L091CEA
         INX
L091CEA  STA   $ED
         STX   $EF
         LDA   #$5453
         LDX   #$4B41
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L091D0C
         INX
L091D0C  STA   $ED
         STX   $EF
         LDA   #$FFFF
         TAX
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L091D2C
         INX
L091D2C  STA   $ED
         STX   $EF
         LDA   #$0005
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0014
         BCC   L091D4E
         INX
L091D4E  STA   $ED
         STX   $EF
         LDA   $49
         LDX   $4B
         CLC
         ADC   #$0200
         BCC   L091D5D
         INX
L091D5D  CLC
         ADC   #$0020
         BCC   L091D64
         INX
L091D64  PEI   $DF
         PEI   $DD
         JSL   L150F53
         PEI   $C7
         PEI   $C5
         JSL   L150F53
         PEI   $AF
         PEI   $AD
         JSL   L150F53
         PEI   $97
         PEI   $95
         JSL   L150F53
         PEI   $83
         PEI   $81
         JSL   L150F53
         PEI   $67
         PEI   $65
         JSL   L150F53
         PEI   $53
         PEI   $51
         JSL   L150F53
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0018
         BCC   L091DB4
         INX
L091DB4  PHX
         PHA
         LDX   #$FCC9
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $ED
         PLX
         STX   $EF
         STA   [$ED]
         TYA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0024
         BCC   L091DEF
         INX
L091DEF  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0028
         BCC   L091E11
         INX
L091E11  STA   $ED
         STX   $EF
         LDA   $B9
         LDX   $BB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$002C
         BCC   L091E31
         INX
L091E31  STA   $ED
         STX   $EF
         LDA   #$0001
         LDX   #$0000
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0030
         BCC   L091E53
         INX
L091E53  STA   $ED
         STX   $EF
         LDA   $A1
         LDX   $A3
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0034
         BCC   L091E73
         INX
L091E73  STA   $ED
         STX   $EF
         LDA   $E9
         LDX   $EB
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$003C
         BCC   L091E93
         INX
L091E93  STA   $ED
         STX   $EF
         LDA   $71
         LDX   $73
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0060
         BCC   L091EB3
         INX
L091EB3  PHX
         PHA
         PEA   ^L041CB3
         PEA   L041CB3
         PEA   $0020
         JSL   L0313BE
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0080
         BCC   L091ED2
         INX
L091ED2  STA   $ED
         STX   $EF
         LDA   L05501B
         LDX   L05501D
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0084
         BCC   L091EF4
         INX
L091EF4  STA   $ED
         STX   $EF
         LDA   L05501B
         LDX   L05501D
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0088
         BCC   L091F16
         INX
L091F16  STA   $ED
         STX   $EF
         LDA   L05501B
         LDX   L05501D
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$008C
         BCC   L091F38
         INX
L091F38  STA   $ED
         STX   $EF
         LDA   L05501B
         LDX   L05501D
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDA   L0551AF
         BEQ   L091F70
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0200
         BCC   L091F5F
         INX
L091F5F  PHX
         PHA
         PEA   ^L053C9D
         PEA   L053C9D
         PEA   $0200
         JSL   L0313BE
         BRA   L091F92
L091F70  PEA   ^L041AB3
         PEA   L041AB3
         LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0200
         BCC   L091F86
         INX
L091F86  PHX
         PHA
         PEA   $0000
         PEA   $0200
         JSL   L070597
L091F92  LDX   #$FCC9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000C
         BCC   L091FA2
         INX
L091FA2  STA   $ED
         STX   $EF
         PHY
         PHY
         LDY   #$0002
         LDA   [$45],Y
         PHA
         LDA   [$45]
         PHA
         PEA   $0000
         PEA   $0180
         JSL   L071E31
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L091FCA
         INX
L091FCA  STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         CLC
         ADC   #$0018
         BCC   L091FE1
         INX
L091FE1  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         CLC
         ADC   #$0200
         BCC   L091FF4
         INX
L091FF4  STA   $E1
         STX   $E3
         LDA   $E1
         LDX   $E3
         PEI   $DF
         PEI   $DD
         JSL   L150F53
         STA   $C9
         STX   $CB
         LDA   $C9
         LDX   $CB
         PEI   $C7
         PEI   $C5
         JSL   L150F53
         STA   $B1
         STX   $B3
         LDA   $B1
         LDX   $B3
         PEI   $AF
         PEI   $AD
         JSL   L150F53
         STA   $99
         STX   $9B
         LDA   $99
         LDX   $9B
         PEI   $97
         PEI   $95
         JSL   L150F53
         STA   $69
         STX   $6B
         LDA   $69
         LDX   $6B
         PEI   $67
         PEI   $65
         JSL   L150F53
         STA   $55
         STX   $57
         LDA   $55
         LDX   $57
         PEI   $53
         PEI   $51
         JSL   L150F53
         STA   $85
         STX   $87
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE9
         PHA
         PEA   $0000
         PEA   $0100
         JSL   L071ECE
         LDA   #$0200
         LDX   #$0000
         TXY
         LDX   #$FDE9
         STA   $00,X
         TYA
         STA   $02,X
         LDA   #$414D
         LDX   #$5453
         TXY
         LDX   #$FDED
         STA   $00,X
         TYA
         STA   $02,X
         LDA   #$FFFF
         TAX
         TXY
         LDX   #$FDF1
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $E7
         PEI   $E5
         PHY
         PHY
         LDA   $E1
         LDX   $E3
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE09
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $CF
         PEI   $CD
         PHY
         PHY
         LDA   $C9
         LDX   $CB
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE0D
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $B7
         PEI   $B5
         PHY
         PHY
         LDA   $B1
         LDX   $B3
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE11
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $9F
         PEI   $9D
         PHY
         PHY
         LDA   $99
         LDX   $9B
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE15
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $6F
         PEI   $6D
         PHY
         PHY
         LDA   $69
         LDX   $6B
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE19
         STA   $00,X
         TYA
         STA   $02,X
         PEI   $5B
         PEI   $59
         PHY
         PHY
         LDA   $55
         LDX   $57
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE1D
         STA   $00,X
         TYA
         STA   $02,X
         LDA   $8D
         ORA   $8F
         BEQ   L0921D7
         PEI   $8B
         PEI   $89
         PHY
         PHY
         LDA   $85
         LDX   $87
         PEA   $0000
         PEA   $0008
         JSL   L150D50
         PEA   $FFFF
         PEA   $FF00
         JSL   L15017E
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FE21
         STA   $00,X
         TYA
         STA   $02,X
L0921D7  TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0010
         JSL   L071ECE
         LDA   #$0020
         LDX   #$0000
         STA   $25
         STX   $27
         LDA   #$4154
         LDX   #$4C49
         STA   $29
         STX   $2B
         LDA   #$FFFF
         TAX
         STA   $2D
         STX   $2F
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         PEA   ^L040920
         PEA   L040920
         PEA   $0014
         JSL   L0313BE
         PEI   $23
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PHY
         PEI   $4B
         PEI   $49
         LDY   #$0002
         LDA   [$45],Y
         PHA
         LDA   [$45]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L092244
         BRL   L0924DD
L092244  PHY
         PEA   $0000
         PEA   $0200
         PEA   $0000
         TDC
         CLC
         ADC   #$FDE9
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L092262
         BRL   L0924DD
L092262  PHY
         PEI   $DF
         PEI   $DD
         LDY   #$0002
         LDA   [$D9],Y
         PHA
         LDA   [$D9]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L09227E
         BRL   L0924DD
L09227E  PHY
         PEI   $C7
         PEI   $C5
         LDY   #$0002
         LDA   [$C1],Y
         PHA
         LDA   [$C1]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L09229A
         BRL   L0924DD
L09229A  PHY
         PEI   $AF
         PEI   $AD
         LDY   #$0002
         LDA   [$A9],Y
         PHA
         LDA   [$A9]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L0922B6
         BRL   L0924DD
L0922B6  PHY
         PEI   $97
         PEI   $95
         LDY   #$0002
         LDA   [$91],Y
         PHA
         LDA   [$91]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L0922D2
         BRL   L0924DD
L0922D2  PHY
         PEI   $67
         PEI   $65
         LDY   #$0002
         LDA   [$61],Y
         PHA
         LDA   [$61]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L0922EE
         BRL   L0924DD
L0922EE  PHY
         PEI   $53
         PEI   $51
         LDY   #$0002
         LDA   [$4D],Y
         PHA
         LDA   [$4D]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L09230A
         BRL   L0924DD
L09230A  LDA   $7D
         ORA   $7F
         BEQ   L092338
         PHY
         PEI   $83
         PEI   $81
         LDY   #$0002
         LDA   [$7D],Y
         PHA
         LDA   [$7D]
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L09232C
         BRL   L0924DD
L09232C  PEI   $7F
         PEI   $7D
         JSL   L07185A
         STZ   $7D
         STZ   $7F
L092338  PHY
         PEA   $0000
         PEA   $0020
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L090FA0
         PLA
         BEQ   L092356
         BRL   L0924DD
L092356  PHY
         PHY
         PEI   $23
         JSL   L075BBA
         PLA
         STA   $1D
         PLX
         STX   $1F
         PEI   $1F
         PEI   $1D
         LDA   $21
         JSL   L150488
         JSL   L033477
         BVS   L092377
         EOR   #$8000
L092377  BMI   L092391
         PEI   $23
         LDA   $21
         JSL   L150488
         PHX
         PHA
         JSL   L075DD3
         PEI   $23
         PEI   $1F
         PEI   $1D
         JSL   L075DD3
L092391  LDA   L05503D
         BEQ   L092399
         LDA   #$0001
L092399  AND   L0551AF
         BNE   L0923A1
         BRL   L0924CF
L0923A1  PHY
         PHY
         PEA   $0000
         PEA   $4000
         LDA   L054FBD
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         LDX   #$FFEF
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDAL  L05565D
         BEQ   L0923CC
         BRL   L0924DD
L0923CC  PHY
         LDY   #$0002
         LDA   [$17],Y
         PHA
         LDA   [$17]
         PHA
         PEA   $0001
         JSL   L075D3B
         PLA
         LDX   #$FFF7
         STA   $00,X
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         LDX   #$FFF7
         LDA   $00,X
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         PLA
         STA   $1B
L092412  PHY
         PHY
         PEI   $1B
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         PEA   $0000
         PEA   $4000
         PEA   $0000
         JSL   L075D80
         LDX   #$FFEB
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDX   #$FFEB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L092494
         BEQ   L092494
         PHY
         PHY
         LDX   #$FFF7
         LDA   $00,X
         PHA
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PLA
         PLX
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDX   #$FFEB
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   $0000
         JSL   L075E55
         LDX   #$FFEB
         PLA
         STA   $00,X
         PLA
         STA   $02,X
L092494  LDA   #$004C
         CMPL  L05565D
         BEQ   L0924AC
         LDAL  L05565D
         PHA
         PEA   $0000
         PEA   $D902
         JSL   L0704CF
L0924AC  LDA   #$004C
         CMPL  L05565D
         BEQ   L0924B8
         BRL   L092412
L0924B8  LDX   #$FFF7
         LDA   $00,X
         PHA
         JSL   L075A4F
         LDX   #$FFEF
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L07185A
L0924CF  PEI   $23
         JSL   L075A4F
         LDA   #$0001
         LDX   #$FFF9
         STA   $00,X
L0924DD  PEI   $47
         PEI   $45
         PEI   $DB
         PEI   $D9
         JSL   L071825
         PEI   $C3
         PEI   $C1
         PEI   $AB
         PEI   $A9
         JSL   L071825
         PEI   $93
         PEI   $91
         PEI   $7F
         PEI   $7D
         JSL   L071825
         PEI   $63
         PEI   $61
         PEI   $4F
         PEI   $4D
         JSL   L071825
         LDX   #$FFF9
         LDA   $00,X
         BEQ   L09252E
         LDX   #$FFE9
         LDA   $00,X
         BNE   L09252C
         PEA   $0000
         PEA   $0001
         PEI   $19
         PEI   $17
         PEA   $0001
         JSL   L0968FC
L09252C  BRA   L092535
L09252E  PEA   $0002
         JSL   L0727E0
L092535  LDAL  L05565D
         STA   $FC
         PEI   $19
         PEI   $17
         JSL   L07185A
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0530
         TCS
         RTL

L092555  PHD
         TSC
         CLC
         ADC   #$FFE6
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $15
         LDA   #$000D
         CMP   [$20]
         BNE   L0925B0
         PEA   $0001
         PHY
         PEI   $26
         PEI   $24
         PEA   $000D
         JSL   L1511DA
         PLA
         STA   $17
         PLA
         SEC
         SBC   $17
         PHA
         PEI   $26
         PEI   $24
         PEA   $000D
         JSL   L1511D4
         PHY
         PEI   $26
         PEI   $24
         PEA   $000D
         JSL   L1511DA
         PLA
         CMP   #$0001
         BEQ   L0925A5
         LDA   #$0000
         BRA   L0925A8
L0925A5  LDA   #$0001
L0925A8  STA   L0551AF
         LDA   #$0000
         STA   [$20]
L0925B0  PEI   $15
         JSL   L071AA4
         LDA   $1E
         STA   $26
         LDA   $1D
         STA   $25
         LDA   $1B
         TCD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0925C8  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0E
         LDA   L055051
         BEQ   L0925E1
         JSL   L0903A6
         BRL   L092787
L0925E1  LDA   #$0001
         LDX   #$0000
         CMPL  L053AC9
         BNE   L0925F2
         TXA
         CMPL  L053ACB
L0925F2  BNE   L0925FE
         PEA   $0011
         JSL   L0727E0
         BRL   L092787
L0925FE  LDA   #$0000
         LDY   #$0013
         STA   [$0A],Y
         LDA   #$0015
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L092611
         INX
L092611  STA   $01
         STX   $03
         PHY
         PHY
         LDY   #$0027
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L0772AE
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0015
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BNE   L09263D
         BRL   L092787
L09263D  LDY   #$0017
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0010
         BCC   L09265A
         INX
L09265A  STA   $01
         STX   $03
         LDA   #$4000
         AND   [$01]
         BEQ   L092668
         LDA   #$0001
L092668  LDY   #$0013
         STA   [$0A],Y
         LDY   #$0027
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0000
         JSL   L074A90
         LDY   #$0013
         LDA   [$0A],Y
         BEQ   L092690
         PEA   $0012
         JSL   L0727E0
         BRL   L092787
L092690  LDA   #$0000
         LDY   #$0013
         STA   [$0A],Y
         LDA   #$0019
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0926A3
         INX
L0926A3  STA   $01
         STX   $03
         PHY
         PHY
         LDY   #$0023
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L07721A
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$0019
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BNE   L0926CF
         BRL   L092787
L0926CF  LDA   #$0011
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L0926DA
         INX
L0926DA  PHX
         PHA
         LDY   #$001B
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0014
         BCC   L0926F9
         INX
L0926F9  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BEQ   L09271F
         BVS   L092718
         EOR   #$8000
L092718  BPL   L09271F
         LDA   #$0000
         BRA   L092722
L09271F  LDA   #$0001
L092722  PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDY   #$0011
         LDA   [$0A],Y
         PHA
         LDY   #$001B
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0010
         BCC   L09274D
         INX
L09274D  STA   $01
         STX   $03
         LDA   #$4000
         AND   [$01]
         BEQ   L09275B
         LDA   #$0001
L09275B  AND   $01,S
         PLX
         LDY   #$0013
         STA   [$0A],Y
         LDY   #$0023
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0000
         JSL   L074A24
         LDY   #$0013
         LDA   [$0A],Y
         BEQ   L092785
         PEA   $0013
         JSL   L0727E0
         BRA   L092787
L092785  STZ   $0E
L092787  LDA   $08
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

L092798  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         JSL   L093A99
         LDA   L055027
         LDX   L055029
         STA   $25
         STX   $27
         LDA   L05501F
         LDX   L055021
         STA   $21
         STX   $23
         LDA   L055039
         LDX   L05503B
         STA   $1D
         STX   $1F
         PHY
         PHY
         JSL   L07B114
         PLA
         STA   L0551BF
         PLA
         STA   L0551C1
         LDA   L055039
         LDX   L05503B
         STA   L0551BB
         STX   L0551BD
         PHY
         PEA   $0000
         PHD
         JSL   L0925C8
         PLA
         LSR
         BCC   L0927EC
         BRL   L092AAB
L0927EC  LDA   $11
         BEQ   L0927F7
         LDA   #$0005
         STA   $05
         BRA   L0927FC
L0927F7  LDA   #$0006
         STA   $05
L0927FC  PEA   $0002
         PEI   $05
         JSL   L09694B
         LDA   $25
         LDX   $27
         CMP   L055027
         BNE   L092811
         CPX   L055029
L092811  BNE   L092816
         BRL   L092AAB
L092816  LDA   L0551BB
         LDX   L0551BD
         CMP   L055039
         BNE   L092824
         CPX   L05503B
L092824  BEQ   L092829
         BRL   L092AAB
L092829  PHY
         PEA   $0000
         PHD
         JSL   L0925C8
         PLA
         LSR
         BCC   L092839
         BRL   L092AAB
L092839  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551BF
         LDX   L0551C1
         PHX
         PHA
         JSL   L079F26
         PLA
         LSR
         BCS   L092857
         BRL   L092A63
L092857  STZ   L055023
         STZ   L055025
         LDA   $25
         LDX   $27
         STA   L0551CB
         STX   L0551CD
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         PEA   $0001
         JSL   L0B86C4
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TAY
         BNE   L092883
         DEX
L092883  DEC
         STAL  L053AC9

*

         TXA
         STAL  L053ACB
         LDAL  L053ACF
         TAX
         LDAL  L053ACD
         CMP   L0551CB
         BNE   L09289E
         CPX   L0551CD
L09289E  BNE   L0928C0
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
         STAL  L053ACD
         PLA
         STAL  L053ACF
L0928C0  LDA   #$0001
         STA   L05504D
         PHY
         PHY
         PEI   $23
         PEI   $21
         JSL   L07721A
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BNE   L0928E6
         PEA   $0014
         JSL   L0727E0
         BRL   L092A3C
L0928E6  LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         TAY
         BNE   L092900
         DEX
L092900  DEC
         LDY   #$0014
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDY   #$0016
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L092925
         EOR   #$8000
L092925  BPL   L09292C
         LDA   #$0000
         BRA   L09292F
L09292C  LDA   #$0001
L09292F  STA   $0F
         LDY   #$001E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $0B
         STX   $0D
         LDY   #$001A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $07
         STX   $09
         PEI   $23
         PEI   $21
         PEA   $0001
         JSL   L074A24
         LDA   $0F
         BNE   L09295F
         BRL   L092A3C
L09295F  LDA   $21
         LDX   $23
         STA   L0551C7
         STX   L0551C9
         LDA   L0551C7
         LDX   L0551C9
         PHX
         PHA
         PEA   $0001
         JSL   L0B8607
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         TAY
         BNE   L092985
         DEX
L092985  DEC
         STAL  L053AC1
         TXA
         STAL  L053AC3
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   L0551C3
         STX   L0551C5
         LDA   $21
         LDX   $23
         CMPL  L053AC5
         BNE   L0929AD
         TXA
         CMPL  L053AC7
L0929AD  BNE   L0929BC
         LDA   $07
         LDX   $09
         STAL  L053AC5
         TXA
         STAL  L053AC7
L0929BC  PHY
         PHY
         PEI   $0D
         PEI   $0B
         JSL   L07721A
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BEQ   L0929FC
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$0018
         BCC   L0929E1
         INX
L0929E1  STA   $29
         STX   $2B
         LDA   $07
         LDX   $09
         STA   [$29]
         TXA
         LDY   #$0002
         STA   [$29],Y
         PEI   $0D
         PEI   $0B
         PEA   $0001
         JSL   L074A24
L0929FC  PHY
         PHY
         PEI   $09
         PEI   $07
         JSL   L07721A
         PLA
         STA   $19
         PLX
         STX   $1B
         LDA   $19
         ORA   $1B
         BEQ   L092A3C
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$001C
         BCC   L092A21
         INX
L092A21  STA   $29
         STX   $2B
         LDA   $0B
         LDX   $0D
         STA   [$29]
         TXA
         LDY   #$0002
         STA   [$29],Y
         PEI   $09
         PEI   $07
         PEA   $0001
         JSL   L074A24
L092A3C  LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         JSL   L095009
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551BF
         LDX   L0551C1
         PHX
         PHA
         PEA   $0001
         JSL   L07E171
         BRA   L092A67
L092A63  JSL   L072314
L092A67  LDA   L05524D
         BNE   L092AAB
         LDA   L055039
         LDX   L05503B
         CMP   $1D
         BNE   L092A78
         CPX   $1F
L092A78  BEQ   L092A81
         PEA   $0001
         JSL   L0998B0
L092A81  LDA   L05501F
         LDX   L055021
         CMP   $21
         BNE   L092A8D
         CPX   $23
L092A8D  BEQ   L092A96
         PEA   $0002
         JSL   L0998B0
L092A96  LDA   L055027
         LDX   L055029
         CMP   $25
         BNE   L092AA2
         CPX   $27
L092AA2  BEQ   L092AAB
         PEA   $0003
         JSL   L0998B0
L092AAB  TSC
         CLC
         ADC   #$002C
         TCS
         PLD
         RTL

L092AB3  ENT
         PHD
         TSC
         CLC
         ADC   #$FEB6
         TCS
         ADC   #$0055
         TCD
         LDA   #$012D
         CMP   $FA
         BEQ   L092AC8
         BRL   L092DED
L092AC8  PHY
         PHY
         PEA   ^L040934
         PEA   L040934
         JSL   L0B88AC
         PLA
         STA   $BB
         PLX
         STX   $BD
         LDY   #$0002
         LDA   [$BB],Y
         PHA
         LDA   [$BB]
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         JSL   L071FF8
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         PEA   ^L04093D
         PEA   L04093D
         JSL   L1503DD
         PLA
         LSR
         BCC   L092B1A
         LDAL  L04093E+2
         TAX
         LDAL  L04093E
         TXY
         LDX   #$FFBB
         STA   $00,X
         TYA
         STA   $02,X
L092B1A  PEI   $BD
         PEI   $BB
         JSL   L07185A
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFAB
         PHA
         JSL   L15014A
         PEA   $0008
         JSL   L0313BE
         LDX   #$0000
         LDA   #$00FF
         AND   $CB
         CMP   #$0016
         BNE   L092B4D
         INX
L092B4D  PHX
         LDX   #$0000
         LDA   #$00FF
         AND   $CC
         DEC
         BNE   L092B5A
         INX
L092B5A  TXA
         AND   $01,S
         PLX
         STA   $CF
         PEA   ^L040942
         PEA   L040942
         PEA   ^L052526
         PEA   L052526
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBB
         PHA
         PEA   ^L040943
         PEA   L040943
         JSL   L073C22
         PHY
         PHY
         PEA   $1F40
         JSL   L072834
         PLA
         STA   $ED
         PLX
         STX   $EF
         PEI   $EF
         PEI   $ED
         JSL   L15102F
         PEI   $EF
         PEI   $ED
         JSL   L151131
         LDA   L054FB7
         LDX   L054FB9
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         CLC
         ADC   #$01F4
         BCC   L092BB7
         INX
L092BB7  STA   $DF
         STX   $E1
         LDA   #$0001
         STA   $DD
L092BC0  PHY
         PEA   $0000
         JSL   L0736C8
         PLA
         STA   $E3
         LDA   #$FFFE
         CMP   $E3
         BNE   L092C3E
         PEI   $EF
         PEI   $ED
         JSL   L1506B3
         PEI   $EF
         PEI   $ED
         JSL   L1517CD
         PEI   $EF
         PEI   $ED
         PEA   $0005
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         JSL   L072B17
         PHY
         PHY
         PEA   $8001
         PEA   $0000
         PEA   $03EE
         JSL   L15041C
         PLA
         STA   $D1
         PLX
         STX   $D3
         LDAL  L05565D
         BNE   L092C36
         LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         PHX
         PHA
         PEA   $F000
         PEI   $C1
         PEI   $BF
         JSL   L15047C
         PEA   $0002
         PEA   $8001
         PEA   $0000
         PEA   $03EE
         JSL   L1510BF
L092C36  PEI   $EF
         PEI   $ED
         JSL   L1506AD
L092C3E  LDA   L054FB7
         LDX   L054FB9
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         PHX
         PHA
         LDA   $DF
         LDX   $E1
         JSL   L033477
         BNE   L092C5F
         BRL   L092DC7
L092C5F  BVS   L092C64
         EOR   #$8000
L092C64  BMI   L092C69
         BRL   L092DC7
L092C69  LDA   $DD
         PEA   $000A
         JSL   L150BEE
         PLA
         LDX   #$FFB9
         STA   $00,X
         LDA   $DD
         PEA   $000A
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0009
         LDX   #$FFB7
         STA   $00,X
         LDX   #$FFB7
         LDA   $00,X
         LDX   #$FFB9
         SEC
         SBC   $00,X
         BVS   L092C9B
         EOR   #$8000
L092C9B  BPL   L092CD7
         LDX   #$FFB9
         LDA   $00,X
         STA   $DB
L092CA4  PHY
         PHY
         PEI   $EF
         PEI   $ED
         LDA   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDAL  L05565D
         BNE   L092CCA
         PEI   $D7
         PEI   $D5
         JSL   L150AFE
L092CCA  LDA   $DB
         LDX   #$FFB7
         CMP   $00,X
         BEQ   L092CD7
         INC   $DB
         BRA   L092CA4
L092CD7  LDA   $DD
         INC
         STA   $DD
         PEI   $DD
         PHY
         JSL   L09771E
         PLA
         ORA   $CF
         CLC
         ADC   #$0005
         STA   $F1
         PLA
         SEC
         SBC   $F1
         BEQ   L092CFE
         BVS   L092CF7
         EOR   #$8000
L092CF7  BPL   L092CFE
         LDA   #$0001
         STA   $DD
L092CFE  LDA   $DD
         PEA   $000A
         JSL   L150BEE
         PLA
         LDX   #$FFB5
         STA   $00,X
         LDA   $DD
         PEA   $000A
         JSL   L150BEE
         PLA
         CLC
         ADC   #$0009
         LDX   #$FFB3
         STA   $00,X
         LDX   #$FFB3
         LDA   $00,X
         LDX   #$FFB5
         SEC
         SBC   $00,X
         BVS   L092D30
         EOR   #$8000
L092D30  BPL   L092D6C
         LDX   #$FFB5
         LDA   $00,X
         STA   $DB
L092D39  PHY
         PHY
         PEI   $EF
         PEI   $ED
         LDA   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $D5
         PLX
         STX   $D7
         LDAL  L05565D
         BNE   L092D5F
         PEI   $D7
         PEI   $D5
         JSL   L150AF8
L092D5F  LDA   $DB
         LDX   #$FFB3
         CMP   $00,X
         BEQ   L092D6C
         INC   $DB
         BRA   L092D39
L092D6C  TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         LDA   #$0008
         CLC
         ADC   $ED
         LDX   $EF
         BCC   L092D80
         INX
L092D80  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         JSL   L1511B0
         LDA   L054FB7
         LDX   L054FB9
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         CLC
         ADC   #$0168
         BCC   L092DAF
         INX
L092DAF  STA   $DF
         STX   $E1
         LDA   $DD
         DEC
         BNE   L092DC7
         LDA   $DF
         LDX   $E1
         CLC
         ADC   #$0078
         BCC   L092DC3
         INX
L092DC3  STA   $DF
         STX   $E1
L092DC7  LDA   #$0005
         CMP   $E3
         BNE   L092DDB
         PHY
         JSL   L09771E
         PLA
         LSR
         BCC   L092DDB
         JSL   L070137
L092DDB  LDA   $E3
         DEC
         BEQ   L092DE3
         BRL   L092BC0
L092DE3  PEI   $EF
         PEI   $ED
         JSL   L072634
         BRA   L092DFE
L092DED  PEA   $0000
         JSL   L07479E
         PHY
         PEI   $FA
         JSL   L1505C8
         PLA
         STA   $D9
L092DFE  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$014E
         TCS
         RTL

L092E10  ENT
         PHD
         TSC
         CLC
         ADC   #$FFBC
         TCS
         TCD
         LDA   L055231
         ORA   L055233
         EOR   #$0001
         AND   L055217
         BNE   L092E29
         BRL   L092ED2
L092E29  LDA   $4A
         DEC
         TAX
         LDA   #$00FF
         ANDL  L04156F,X
         STA   $3F
         STZ   $3D
         LDA   L055233
         BEQ   L092E42
         LDA   #$0100
         STA   $3D
L092E42  LDA   L055231
         BEQ   L092E4E
         LDA   #$0800
         ORA   $3D
         STA   $3D
L092E4E  LDA   L05522F
         BEQ   L092E5A
         LDA   #$0200
         ORA   $3D
         STA   $3D
L092E5A  LDA   L0551F3
         BEQ   L092E9E
         LDA   $4A
         SEC
         SBC   #$0002
         BEQ   L092E6E
         BVS   L092E6C
         EOR   #$8000
L092E6C  BMI   L092E80
L092E6E  PEI   $3F
         PEI   $3D
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C40
         BRA   L092E9E
L092E80  STZ   $3B
         LDA   #$0004
         CMP   $4A
         BNE   L092E8E
         LDA   #$7FFF
         STA   $3B
L092E8E  PEI   $3B
         PEI   $3B
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1512D1
L092E9E  LDA   L05511F
         BEQ   L092ECF
         LDA   #$0003
         STA   $0D
         LDA   $3F
         JSL   L150488
         STA   $0F
         STX   $11
         LDA   $3D
         STA   $1B
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L151299
         JSL   L0879C5
L092ECF  BRL   L09301F
L092ED2  LDA   L055233
         BEQ   L092EDF
         LDA   #$0004
         CLC
         ADC   $4A
         STA   $4A
L092EDF  LDA   $4A
         SEC
         SBC   #$0001
         BPL   L092EEA
         BRL   L09301F
L092EEA  CMP   #$0008
         BMI   L092EF2
         BRL   L09301F
L092EF2  ASL
         TAX
         LDAL  L092EFA,X
         PHA
         RTS

L092EFA  DA    L092F0A-1
         DA    L092F17-1
         DA    L092F24-1
         DA    L092F2E-1
         DA    L092F38-1
         DA    L092F4E-1
         DA    L092F64-1
         DA    L092FCB-1

L092F0A  PEA   $0001
         PEA   $0000
         JSL   L09694B
         BRL   L09301F
L092F17  PEA   $0002
         PEA   $0000
         JSL   L09694B
         BRL   L09301F
L092F24  PEA   $0002
         JSL   L09685F
         BRL   L09301F
L092F2E  PEA   $0001
         JSL   L09685F
         BRL   L09301F
L092F38  PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         BRL   L09301F
L092F4E  PEA   $FFFF
         PEA   $FFFE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         BRL   L09301F
L092F64  LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L092F77
         INX
L092F77  STA   $05
         STX   $07
         PHY
         PHY
         LDY   #$0006
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L07899F
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L0968AD
         PEI   $0B
         PEI   $09
         JSL   L07185A
         LDA   L0551E5
         DEC
         STA   L0551E5
         LDA   L0551E5
         SEC
         SBC   #$0001
         BVS   L092FC1
         EOR   #$8000
L092FC1  BMI   L092FC9
         LDA   #$0014
         STA   L0551E5
L092FC9  BRA   L09301F
L092FCB  LDA   L0551E5
         INC
         STA   L0551E5
         LDA   L0551E5
         SEC
         SBC   #$0014
         BEQ   L092FE8
         BVS   L092FE0
         EOR   #$8000
L092FE0  BPL   L092FE8
         LDA   #$0001
         STA   L0551E5
L092FE8  LDA   L0551E5
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L052C1A
         LDX   #^L052C1A
         BCC   L092FFB
         INX
L092FFB  STA   $01
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
         BRA   L09301F
L09301F  LDA   $48
         STA   $4A
         LDA   $47
         STA   $49
         LDA   $45
         TCD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L093031  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         LDA   L055231
         AND   L055233
         BEQ   L093051
         PHY
         LDA   L055225
         PHA
         JSL   L09AB66
         PLA
         LSR
         BCC   L093051
         BRL   L0930E2
L093051  PHY
         PHY
         LDA   L055225
         PHA
         JSL   L096BE4
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $09
         STA   $0B
         LDA   $07
         STA   $0D
         LDA   #$FFFF
         CMP   $0B
         BNE   L093072
         BRA   L0930E2
L093072  LDA   $0B
         BNE   L09307C
         JSL   L072314
         BRA   L0930E2
L09307C  STZ   $01
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L09308B
         LDA   $0B
         STA   $01
L09308B  LDA   L054FB7
         LDX   L054FB9
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0003
         BCC   L0930A4
         INX
L0930A4  STA   $03
         STX   $05
         PEI   $0B
         PEI   $0D
         JSL   L09971B
         LDA   $01
         BEQ   L0930E2
L0930B4  LDA   L054FB7
         LDX   L054FB9
         STA   $0F
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         PHX
         PHA
         LDA   $03
         LDX   $05
         JSL   L033477
         BEQ   L0930B4
         BVS   L0930D7
         EOR   #$8000
L0930D7  BPL   L0930B4
         PEA   $0000
         PEI   $01
         JSL   L1505B0
L0930E2  TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L0930EA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0018
         PEA   $0000
         PHA
         JSL   L151412
         TDC
         CLC
         ADC   #$0014
         PEA   $0000
         PHA
         JSL   L151412
         LDA   L055215
         SEC
         SBC   #$0000
         BEQ   L093123
         BPL   L093131
L093123  STZ   $03
         LDA   $1A
         ASL
         STA   $1A
         LDA   $16
         ASL
         STA   $16
         BRA   L0931B0
L093131  PHY
         PHY
         PEI   $1A
         PEI   $18
         PEI   $16
         PEI   $14
         JSL   L07245A
         PLY
         PLA
         STA   $01
         LDA   $01
         PEA   $003C
         JSL   L150BEE
         LDA   L055215
         PHA
         JSL   L1500F5
         PLX
         PLX
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L093163
         EOR   #$8000
L093163  BMI   L09316A
         LDA   #$0001
         STA   $03
L09316A  LDA   $1A
         ASL
         STA   $1A
         LDA   $16
         ASL
         STA   $16
         PHY
         PHY
         LDA   $16
         SEC
         SBC   $1A
         PHA
         PEI   $03
         JSL   L15133D
         PLA
         STA   L055187
         PLA
         STA   L055189
         PHY
         PHY
         LDA   $14
         SEC
         SBC   $18
         PHA
         PEI   $03
         JSL   L15133D
         PLA
         STA   L055183
         PLA
         STA   L055185
         LDA   $1A
         STA   L055191
         STZ   L05518F
         LDA   $18
         STA   L05518D
         STZ   L05518B
L0931B0  PHY
         TDC
         CLC
         ADC   #$0018
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0014
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         STA   L055213
         LDA   $14
         LDX   $16
         STAL  L0523D4
         TXA
         STAL  L0523D6
         PHY
         PHY
         JSL   L15035F
         PLA
         STA   L05517F
         PLA
         STA   L055181
         LDA   L05517F
         LDX   L055181
         PHX
         PHA
         LDA   $03
         JSL   L150488
         JSL   L150F53
         STA   L05517B
         STX   L05517D
         STZ   L055177
         STZ   L055179
         STZ   L055173
         STZ   L055175
         LDA   $12
         STA   L055197
         LDA   $10
         STA   L055195
         LDA   $0E
         STA   L055193
         LDA   #$0001
         STAL  L0523D8
         LDA   #$0000
         STAL  L0523DA
         STAL  L0523DC
         PHY
         PHY
         JSL   L15035F
         PLA
         STAL  L0523DE
         PLA
         STAL  L0523E0
         LDA   $18
         LDX   $1A
         STAL  L0523E2
         TXA
         STAL  L0523E4
         LDA   #$0000
         STAL  L0523E6
         LDA   L055197
         BEQ   L09325B
         LDA   #$0200
         STAL  L0523E6
L09325B  LDA   L055195
         BEQ   L09326C
         LDA   #$0800
         CLC
         ADCL  L0523E6
         STAL  L0523E6
L09326C  LDA   L055193
         BEQ   L09327D
         LDA   #$0100
         CLC
         ADCL  L0523E6
         STAL  L0523E6
L09327D  PEA   ^L052D64
         PEA   L052D64
         PEA   ^L0523D8
         PEA   L0523D8
         PEA   $002E
         JSL   L0313BE
         LDA   #$0001
         STA   L055199
         LDA   #$0001
         STA   L05524B
         JSL   L0A2670
         STZ   L05524B
         STZ   L055199
         LDA   $0C
         STA   $1A
         LDA   $0B
         STA   $19
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L0932B8  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDX   #$0000
         LDA   #$025B
         CMP   $0A
         BNE   L0932CB
         INX
L0932CB  PHX
         LDX   #$0000
         LDA   #$025A
         CMP   $0A
         BNE   L0932D7
         INX
L0932D7  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0932E5
         PEA   $0001
         JSL   L090635
L0932E5  LDA   $0A
         SEC
         SBC   #$0259
         BPL   L0932F0
         BRL   L09339B
L0932F0  CMP   #$000B
         BMI   L0932F8
         BRL   L09339B
L0932F8  ASL
         TAX
         LDAL  L093300,X
         PHA
         RTS

L093300  DA    L093316-1
         DA    L09331F-1
         DA    L093328-1
         DA    L093331-1
         DA    L093337-1
         DA    L09334C-1
         DA    L093358-1
         DA    L093364-1
         DA    L093389-1
         DA    L093392-1
         DA    L093379-1

L093316  PEA   $0001
         JSL   L09685F
         BRA   L09339B
L09331F  PEA   $0000
         JSL   L098852
         BRA   L09339B
L093328  PEA   $0029
         JSL   L0998B0
         BRA   L09339B
L093331  JSL   L09A2DC
         BRA   L09339B
L093337  PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         BRA   L09339B
L09334C  PEA   $0001
         PEA   $0000
         JSL   L09694B
         BRA   L09339B
L093358  PEA   $0002
         PEA   $0000
         JSL   L09694B
         BRA   L09339B
L093364  PEA   $FFFF
         PEA   $FFFE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968FC
         BRA   L09339B
L093379  LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L099DFC
         BRA   L09339B
L093389  PEA   $0001
         JSL   L09A047
         BRA   L09339B
L093392  PEA   $0000
         JSL   L09A047
         BRA   L09339B
L09339B  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L0933AB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $68
         PEI   $66
         PEA   $005C
         JSL   L0313BE
         STZ   $6A
         LDA   L0550B9
         DEC
         BNE   L0933D5
         JSL   L1601FC
         BRA   L0933D9
L0933D5  JSL   L0A1625
L0933D9  JSL   L096253
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCC   L09340B
         LDA   L0550B9
         DEC
         BNE   L0933FE
         JSL   L16020A
         BRA   L093402
L0933FE  JSL   L0A15C0
L093402  JSL   L096253
         LDA   #$0001
         STA   $6A
L09340B  STZ   L0550BF
         LDA   $64
         STA   $68
         LDA   $63
         STA   $67
         LDA   $61
         TCD
         TSC
         CLC
         ADC   #$0066
         TCS
         RTL

L093420  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $14
         LDA   $12
         SEC
         SBC   #$0004
         PHA
         LDA   #$000C
         CLC
         ADC   $14
         PHA
         PEI   $12
         JSL   L15100B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15037D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   $14
         INC
         INC
         PHA
         LDA   $12
         SEC
         SBC   #$0007
         PHA
         LDA   #$000A
         CLC
         ADC   $14
         PHA
         PEI   $12
         JSL   L15100B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L15162D
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L093495  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0001
         STA   $0C
         LDA   #$0010
         CMP   $0A
         BEQ   L0934CE
         LDA   #$0044
         CMP   $0A
         BEQ   L0934CE
         LDA   #$0045
         CMP   $0A
         BEQ   L0934CE
         LDA   #$0046
         CMP   $0A
         BEQ   L0934CE
         LDA   #$0040
         CMP   $0A
         BEQ   L0934CE
         LDA   #$002F
         CMP   $0A
         BEQ   L0934CE
         STZ   $0C
L0934CE  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L0934DE  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $12
         PEI   $18
         PEI   $16
         LDA   $14
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         LDY   #$00D5
         STA   [$0E],Y
         LDAL  L05565D
         BEQ   L093515
         LDA   #$0001
L093515  STA   $1A
         LDA   $0C
         STA   $18
         LDA   $0B
         STA   $17
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L093529  ENT
         PHD
         TSC
         CLC
         ADC   #$F970
         TCS
         ADC   #$059D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FC7B
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
         JSL   L0875FA
         LDA   #$00FF
         LDX   #$FC7B
         AND   $00,X
         BNE   L093591
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FA77
         PHA
         PEA   $001E
         JSL   L073002
         PEA   ^L040944
         PEA   L040944
         PEA   $0000
         JSL   L093CCE
         PLA
         STA   $EB
         PLX
         STX   $ED
         BRA   L0935AD
L093591  JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FC7B
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $EB
         PLX
         STX   $ED
L0935AD  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   $EB
         ORA   $ED
         BNE   L0935CC
         BRL   L093854
L0935CC  PEA   ^L053259
         PEA   L053259
         JSL   L087BAE
         PEI   $ED
         PEI   $EB
         JSL   L0718BF
         LDY   #$0002
         LDA   [$EB],Y
         PHA
         LDA   [$EB]
         PHA
         JSL   L075B09
         LDY   #$0002
         LDA   [$EB],Y
         PHA
         LDA   [$EB]
         PHA
         PEA   $00C0
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L075A86
         LDA   #$0048
         CMPL  L05565D
         BNE   L093623
         PEA   $000C
         JSL   L0727E0
         BRL   L093854
L093623  LDA   #$0005
         STA   $9B
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $9F
         STX   $A1
         LDA   #$0003
         STA   $A3
         STZ   $A5
         STZ   $A7
         TDC
         CLC
         ADC   #$009B
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L09365A
         LDA   #$0001
L09365A  PHA
         LDX   #$0000
         LDA   #$0002
         AND   $A7
         BNE   L093666
         INX
L093666  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L093677
         PEA   $000D
         JSL   L0727E0
         BRL   L093854
L093677  LDA   $9D
         STA   $E9
         PEA   ^L041A84
         PEA   L041A84
         JSL   L085F5A
         PHY
         PEA   ^L041A75
         PEA   L041A75
         PEA   $0031
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L0934DE
         PLA
         LSR
         BCC   L0936A0
         BRL   L0937F3
L0936A0  LDA   #$0001
         STA   $E7
L0936A5  LDA   $E7
         ASL
         ASL
         CLC
         ADC   #$FD77
         TAX
         STX   $EF
         TDC
         CLC
         ADC   $EF
         LDX   #$0000
         TXY
         LDX   #$FB77
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FB77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $EF
         STX   $F1
         LDA   #$0000
         STA   [$EF]
         LDX   #$FB77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L0936E2
         INX
L0936E2  STA   $EF
         STX   $F1
         LDA   #$0080
         STA   [$EF]
         LDA   #$00C8
         CMP   $E7
         BEQ   L0936F6
         INC   $E7
         BRA   L0936A5
L0936F6  PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FD7B
         PHA
         PEA   $0320
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L0934DE
         PLA
         LSR
         BCC   L093714
         BRL   L0937F3
L093714  LDA   L0550FD
         LDX   L0550FF
         STA   $E3
         STX   $E5
         LDA   L055109
         LDX   L05510B
         STA   $DD
         STX   $DF
         LDA   #$0351
         LDX   #$0000
         STA   $D7
         STX   $D9
         LDA   #$0001
         STA   $E7
L093737  LDA   #$00A0
         STA   $E1
         PHY
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         PEI   $DF
         PEI   $DD
         PEA   $7D00
         JSL   L15142A
         PLA
         STA   $DB
         PHY
         PEI   $DF
         PEI   $DD
         PEI   $DB
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L0934DE
         PLA
         LSR
         BCC   L093775
         BRL   L0937F3
L093775  PEI   $D9
         PEI   $D7
         LDA   $DB
         JSL   L150488
         JSL   L150F53
         STA   $D7
         STX   $D9
         LDA   $E7
         ASL
         ASL
         CLC
         ADC   #$FD77
         TAX
         LDA   $DB
         STA   $00,X
         LDA   #$00C8
         CMP   $E7
         BEQ   L09379F
         INC   $E7
         BRA   L093737
L09379F  PEI   $E9
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         LDA   $D7
         LDX   $D9
         STAL  L041A75
         TXA
         STAL  L041A77
         PHY
         PEA   ^L041A75
         PEA   L041A75
         PEA   $0031
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L0934DE
         PLA
         LSR
         BCS   L0937F3
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FD7B
         PHA
         PEA   $0320
         PEI   $E9
         PEA   $0000
         PHD
         JSL   L0934DE
         PLA
         LSR
         BCS   L0937F3
         PEI   $E9
         JSL   L075A4F
         BRA   L093854
L0937F3  LDA   #$0048
         CMPL  L05565D
         BNE   L093805
         PEA   $000C
         JSL   L0727E0
         BRA   L093841
L093805  PEA   $0000
         TDC
         CLC
         ADC   #$FA77
         PHA
         PEA   $001B
         JSL   L072809
         PEA   $0000
         TDC
         CLC
         ADC   #$FA63
         PHA
         LDA   $D5
         JSL   L150488
         PHX
         PHA
         PEA   $0004
         JSL   L07334A
         PEA   $0000
         TDC
         CLC
         ADC   #$FB7B
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L07010A
L093841  PEI   $E9
         JSL   L075A4F
         LDY   #$0002
         LDA   [$EB],Y
         PHA
         LDA   [$EB]
         PHA
         JSL   L075B09
L093854  STZ   L055135
         PEA   ^L053117
         PEA   L053117
         JSL   L082712
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0696
         TCS
         RTL

L093873  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $18
         LDA   $16
         DEC
         ASL
         ASL
         TAX
         LDAL  L054AD4+2,X
         PHA
         LDAL  L054AD4,X
         PLX
         STA   $01
         STX   $03
L093891  LDA   [$01]
         BEQ   L0938D2
         PHY
         LDY   #$0004
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         PHX
         PHA
         LDY   #$0025
         LDA   [$0E],Y
         TAX
         DEY
         DEY
         LDA   [$0E],Y
         PHX
         PHA
         JSL   L071C56
         PLA
         LSR
         BCC   L0938C1
         LDA   [$01]
         STA   [$12]
         LDA   #$0001
         STA   $18
         BRA   L0938D2
L0938C1  LDA   $01
         LDX   $03
         CLC
         ADC   #$0006
         BCC   L0938CC
         INX
L0938CC  STA   $01
         STX   $03
         BRA   L093891
L0938D2  LDA   $0C
         STA   $16
         LDA   $0B
         STA   $15
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L0938E4  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $12
         STA   $01
         LDA   $14
         STA   $03
         LDA   $01
         LDX   $03
         STA   $16
         STX   $18
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L09390E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $3E
         PEI   $3C
         PEA   $0020
         JSL   L0313BE
         STZ   $40
         STZ   $42
         TDC
         CLC
         ADC   #$0003
         STA   $23
         STZ   $25
         STZ   $27
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L052576
         PEA   L052576
         JSL   L071C56
         PLA
         LSR
         BCC   L093958
         LDA   #$00FB
         STA   $27
         BRA   L0939B3
L093958  PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L052562
         PEA   L052562
         JSL   L071C56
         PLA
         LSR
         BCC   L093977
         LDA   #$00FC
         STA   $27
         BRA   L0939B3
L093977  PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L05253A
         PEA   L05253A
         JSL   L071C56
         PLA
         LSR
         BCC   L093996
         LDA   #$00FE
         STA   $27
         BRA   L0939B3
L093996  PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L05254E
         PEA   L05254E
         JSL   L071C56
         PLA
         LSR
         BCC   L0939B3
         LDA   #$00FD
         STA   $27
L0939B3  LDA   $27
         BEQ   L0939CF
         PHY
         PHY
         PEA   $01F4
         PEI   $27
         PEA   $0000
         PHD
         JSL   L0938E4
         PLA
         STA   $40
         PLX
         STX   $42
         BRL   L093A87
L0939CF  LDA   #$0001
         STA   $31
L0939D4  LDA   $31
         DEC
         ASL
         TAX
         LDAL  L0541A5,X
         STA   $2F
         PHY
         PHY
         PEI   $2F
         JSL   L1513FA
         PLA
         PLX
         STX   $33
         ORA   $33
         BEQ   L093A1D
         PHY
         PEI   $31
         TDC
         CLC
         ADC   #$002D
         PEA   $0000
         PHA
         PEA   $0000
         PHD
         JSL   L093873
         PLA
         LSR
         BCC   L093A1D
         PHY
         PHY
         PEI   $2F
         PEI   $2D
         PEA   $0000
         PHD
         JSL   L0938E4
         PLA
         STA   $40
         PLX
         STX   $42
         BRA   L093A87
L093A1D  LDA   #$000C
         CMP   $31
         BEQ   L093A28
         INC   $31
         BRA   L0939D4
L093A28  PHY
         JSL   L1503B3
         PLA
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L093A3B
         EOR   #$8000
L093A3B  BPL   L093A87
         LDA   #$0001
         STA   $2D
L093A42  PHY
         PHY
         PEI   $2D
         JSL   L1505BC
         PLA
         STA   $23
         PLX
         STX   $25
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $25
         PEI   $23
         JSL   L071C56
         PLA
         LSR
         BCC   L093A7D
         PHY
         PHY
         PEA   $012C
         PEI   $2D
         PEA   $0000
         PHD
         JSL   L0938E4
         PLA
         STA   $40
         PLX
         STX   $42
         BRA   L093A87
L093A7D  LDA   $2D
         CMP   $01
         BEQ   L093A87
         INC   $2D
         BRA   L093A42
L093A87  LDA   $3A
         STA   $3E
         LDA   $39
         STA   $3D
         LDA   $37
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L093A99  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDX   #$0000
         LDA   L0551CB
         ORA   L0551CD
         BNE   L093AAD
         INX
L093AAD  TXA
         ORA   L055051
         BEQ   L093AB6
         BRL   L093C0C
L093AB6  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         JSL   L07C5A6
         PLA
         PLX
         STX   $0D
         ORA   $0D
         BEQ   L093ADD
         PEA   $1538
         JSL   L07272E
L093ADD  PHY
         PHY
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L093AFA
         BRL   L093BF9
L093AFA  LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$000C
         BCC   L093B09
         INX
L093B09  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $01
         STX   $03
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         PHY
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         PEA   $4452
         PEA   $4143
         JSL   L0751BE
         PLA
         LSR
         BCS   L093B42
         BRL   L093BF9
L093B42  LDA   $01
         ORA   $03
         BEQ   L093B4B
         LDA   #$0001
L093B4B  BEQ   L093B68
         PHY
         PEI   $03
         PEI   $01
         PEA   $5041
         PEA   $4D42
         JSL   L0751BE
         PLA
         EOR   #$0001
         CMP   #$0000
         BEQ   L093B68
         BRL   L093BF9
L093B68  LDA   L0551C7
         ORA   L0551C9
         BNE   L093B73
         BRL   L093BF7
L093B73  PHY
         PHY
         LDA   L0551C7
         LDX   L0551C9
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L093BF9
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         CLC
         ADC   #$000C
         BCC   L093B9C
         INX
L093B9C  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $01
         STX   $03
         LDA   L0551C7
         LDX   L0551C9
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         PHY
         LDA   L0551C7
         LDX   L0551C9
         PHX
         PHA
         PEA   $4447
         PEA   $4B42
         JSL   L0751BE
         PLA
         LSR
         BCS   L093BD4
         BRA   L093BF9
L093BD4  LDA   $01
         ORA   $03
         BEQ   L093BDD
         LDA   #$0001
L093BDD  BEQ   L093BF7
         PHY
         PEI   $03
         PEI   $01
         PEA   $5041
         PEA   $4D42
         JSL   L0751BE
         PLA
         EOR   #$0001
         CMP   #$0000
         BNE   L093BF9
L093BF7  BRA   L093C00
L093BF9  PEA   $0014
         JSL   L0727E0
L093C00  STZ   L0551CB
         STZ   L0551CD
         STZ   L0551C7
         STZ   L0551C9
L093C0C  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L093C14  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         STZ   $12
         STZ   $14
         LDA   #$00FB
         CMP   $10
         BNE   L093C34
         LDA   #L052576
         LDX   #^L052576
         STA   $12
         STX   $14
         BRL   L093CBC
L093C34  LDA   #$00FC
         CMP   $10
         BNE   L093C47
         LDA   #L052562
         LDX   #^L052562
         STA   $12
         STX   $14
         BRA   L093CBC
L093C47  LDA   #$00FD
         CMP   $10
         BNE   L093C5A
         LDA   #L05254E
         LDX   #^L05254E
         STA   $12
         STX   $14
         BRA   L093CBC
L093C5A  LDA   #$00FE
         CMP   $10
         BNE   L093C6D
         LDA   #L05253A
         LDX   #^L05253A
         STA   $12
         STX   $14
         BRA   L093CBC
L093C6D  LDA   #$0001
         STA   $01
L093C72  LDA   $01
         DEC
         ASL
         ASL
         TAX
         LDAL  L054AD4+2,X
         PHA
         LDAL  L054AD4,X
         PLX
         STA   $03
         STX   $05
L093C86  LDA   [$03]
         BEQ   L093CB1
         LDA   $10
         CMP   [$03]
         BNE   L093CA0
         LDY   #$0004
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         STA   $12
         STX   $14
         BRA   L093CBC
L093CA0  LDA   $03
         LDX   $05
         CLC
         ADC   #$0006
         BCC   L093CAB
         INX
L093CAB  STA   $03
         STX   $05
         BRA   L093C86
L093CB1  LDA   #$000C
         CMP   $01
         BEQ   L093CBC
         INC   $01
         BRA   L093C72
L093CBC  LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L093CCE  ENT
         PHD
         TSC
         CLC
         ADC   #$FDD8
         TCS
         ADC   #$013B
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC5
         PHA
         PEI   $F6
         PEI   $F4
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         STZ   $FE
         PHY
         JSL   L095F79
         PLA
         LSR
         BCS   L093D11
         BRL   L093E6E
L093D11  PHY
         JSL   L0727BF
         PLA
         STA   $E7
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC5
         PHA
         JSL   L0735A8
         PLA
         STA   $E3
         PLX
         STX   $E5
         LDA   #$0003
         STA   $CD
         STZ   $CF
         STZ   $D1
         LDA   #$0003
         STA   $D3
         STZ   $D5
         STZ   $D7
         STZ   L0551AD
         LDA   $F2
         BEQ   L093DA1
         LDAL  L040B7D+2
         TAX
         LDAL  L040B7D
         CLC
         ADC   #$000C
         BCC   L093D57
         INX
L093D57  STA   $E9
         STX   $EB
         LDA   #$0000
         TAX
         STA   [$E9]
         TXA
         LDY   #$0002
         STA   [$E9],Y
         PEA   $00A1
         PEA   $001E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         PEA   $0001
         PEI   $E5
         PEI   $E3
         PEA   ^L040B57
         PEA   L040B57
         PEA   ^L092555
         PEA   L092555
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         JSL   L1504A5
         BRA   L093DC7
L093DA1  PEA   $00A1
         PEA   $001E
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC5
         PHA
         PEA   $0001
         PEI   $E5
         PEI   $E3
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         JSL   L15049F
L093DC7  JSL   L09AE88
         LDA   #$0001
         STA   L0551AD
         LDA   $C5
         BNE   L093DD7
         BRA   L093E54
L093DD7  LDAL  L05565D
         BNE   L093E54
         LDA   $D5
         LDX   $D7
         STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0002
         BCC   L093DF4
         INX
L093DF4  STA   $E9
         STX   $EB
         LDA   [$E9]
         INC
         INC
         STA   $E1
         PHY
         PHY
         LDA   $E1
         JSL   L150488
         PHX
         PHA
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDAL  L05565D
         BNE   L093E54
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0002
         BCC   L093E34
         INX
L093E34  PHX
         PHA
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         PHX
         PHA
         LDA   $E1
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $D9
         LDX   $DB
         STA   $FC
         STX   $FE
L093E54  PEI   $E5
         PEI   $E3
         JSL   L07185A
         PEI   $D7
         PEI   $D5
         PEI   $D1
         PEI   $CF
         JSL   L071825
         PEI   $E7
         JSL   L0724F7
L093E6E  LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$0234
         TCS
         RTL

L093E80  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         JSL   L096A7B
         LDA   #$0002
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L093E9B
         INX
L093E9B  STA   $01
         STX   $03
         PHY
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         LDAL  L05325B
         PHA
         LDAL  L05325F
         PHA
         JSL   L071A1B
         PLA
         STA   [$01]
         LDA   $0A
         LDX   $0C
         STA   $01
         STX   $03
         PHY
         LDA   [$0A]
         PHA
         LDAL  L053259
         PHA
         LDAL  L05325D
         PHA
         JSL   L071A1B
         PLA
         STA   [$01]
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

L093EE5  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $12
         JSL   L1516BD
         PLA
         STA   $01
         PLX
         STX   $03
         LDAL  L05565D
         BNE   L093F0D
         LDA   $12
         STA   L0551E9
         LDA   #$0001
         STA   $14
         BRA   L093F0F
L093F0D  STZ   $14
L093F0F  LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L093F21  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$000D
         TCD
         LDA   L0551E7
         PHA
         PHY
         JSL   L15104D
         PLA
         SEC
         SBC   $01,S
         STA   $01,S
         PLA
         BEQ   L093F44
         LDA   #$0001
         STA   L0551EB
L093F44  LDA   L0551EB
         BNE   L093F4C
         BRL   L0940DD
L093F4C  LDA   L05522F
         PHA
         PHY
         JSL   L099DCE
         PLA
         ORA   $01,S
         PLX
         LSR
         BCC   L093F6C
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
L093F6C  PHY
         PEA   $1602
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
         PHY
         PEA   $1603
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
         PHY
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
         PHY
         PEA   $1604
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
         PHY
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L093EE5
         PLA
         LSR
         BCS   L093FC2
         LDA   #$1601
         STA   L0551E9
L093FC2  LDA   L0551E9
         BNE   L093FE6
         PEA   ^L052CCE
         PEA   L052CCE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0008
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         BRA   L094031
L093FE6  LDA   L0551E9
         DEC
         BNE   L09400B
         PEA   ^L052CCE
         PEA   L052CCE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         PEA   $0009
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         BRA   L094031
L09400B  PEA   ^L052CCE
         PEA   L052CCE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF3
         PHA
         LDA   L0551E9
         SEC
         SBC   #$1601
         CLC
         ADC   #$000A
         PHA
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
L094031  LDAL  L040945
         SEP   #$20
         STAL  L052CBA
         REP   #$20
         LDA   L0551E9
         SEC
         SBC   #$0000
         BPL   L094049
         BRL   L0940D1
L094049  CMP   #$1605
         BMI   L094051
         BRL   L0940D1
L094051  SEC
         SBC   #$0000
         BEQ   L094068
         DEC
         BEQ   L09407D
         SEC
         SBC   #$1601
         BEQ   L0940A7
         DEC
         BEQ   L0940BC
         DEC
         BEQ   L094092
         BRA   L0940D1
L094068  PEA   ^L052CBA
         PEA   L052CBA
         PEA   ^L040946
         PEA   L040946
         PEA   $0005
         JSL   L0313BE
         BRA   L0940D1
L09407D  PEA   ^L052CBA
         PEA   L052CBA
         PEA   ^L04094B
         PEA   L04094B
         PEA   $0008
         JSL   L0313BE
         BRA   L0940D1
L094092  PEA   ^L052CBA
         PEA   L052CBA
         PEA   ^L040953
         PEA   L040953
         PEA   $0005
         JSL   L0313BE
         BRA   L0940D1
L0940A7  PEA   ^L052CBA
         PEA   L052CBA
         PEA   ^L040958
         PEA   L040958
         PEA   $0007
         JSL   L0313BE
         BRA   L0940D1
L0940BC  PEA   ^L052CBA
         PEA   L052CBA
         PEA   ^L04095F
         PEA   L04095F
         PEA   $0006
         JSL   L0313BE
         BRA   L0940D1
L0940D1  PHY
         JSL   L15104D
         PLA
         STA   L0551E7
         STZ   L0551EB
L0940DD  TSC
         CLC
         ADC   #$0104
         TCS
         PLD
         RTL

L0940E5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDA   L055023
         ORA   L055025
         BNE   L094114
         LDA   #$0001
         STA   [$01]
         LDA   L055027
         LDX   L055029
         LDY   #$0002
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         BRA   L094129
L094114  LDA   #$0002
         STA   [$01]
         LDA   L055023
         LDX   L055025
         LDY   #$0006
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
L094129  LDA   #$0006
         LDY   #$002C
         STA   [$01],Y
         LDA   L055039
         LDX   L05503B
         LDY   #$0058
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
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

L094153  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$000F
         TCD
         PHY
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150807
         PLA
         STA   $F1
         LDA   $F1
         SEC
         SBC   #$00FE
         BEQ   L094182
         BVS   L09417B
         EOR   #$8000
L09417B  BPL   L094182
         LDA   #$00FE
         STA   $F1
L094182  PHY
         PHY
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L151379
         PLA
         PLX
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF2
         PHA
         LDA   $F1
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $F1
         CLC
         ADC   #$FFF1
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$000D
         BNE   L0941CB
         LDA   $F1
         DEC
         STA   $F1
L0941CB  LDA   $F1
         LDX   #$FFF1
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $F1
         INC
         CLC
         ADC   #$FFF1
         TAX
         SEP   #$20
         LDA   #$00
         STA   $00,X
         REP   #$20
         PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFF1
         PHA
         PEA   $0100
         JSL   L0313BE
         TSC
         CLC
         ADC   #$0106
         TCS
         PLD
         RTL

L094202  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2C
         SEC
         SBC   #$0001
         BVS   L094215
         EOR   #$8000
L094215  BPL   L09421C
         LDA   #$0000
         BRA   L09421F
L09421C  LDA   #$0001
L09421F  PHA
         LDA   $2C
         SEC
         SBC   #$0018
         BEQ   L09422F
         BVS   L09422D
         EOR   #$8000
L09422D  BMI   L094234
L09422F  LDA   #$0000
         BRA   L094237
L094234  LDA   #$0001
L094237  ORA   $01,S
         PLX
         LSR
         BCC   L094240
         BRL   L0943C2
L094240  PHY
         PHY
         JSL   L150493
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDY   #$001A
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   $05
         STX   $07
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$0002
         BCC   L094275
         INX
L094275  STA   $01
         STX   $03
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L09428A
         INX
L09428A  STA   $1D
         STX   $1F
         LDA   [$1D]
         LDY   #$0002
         STA   [$01],Y
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   [$1D]
         STA   [$01]
         LDY   #$0002
         LDA   #$006E
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   #$0023
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDA   $09
         LDX   $0B
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
         LDA   $2C
         DEC
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         LDA   $2C
         DEC
         PHA
         PEA   $0004
         JSL   L150318
         PLX
         PLX
         STA   $13
         LDA   $11
         DEC
         DEC
         BNE   L0942FD
         LDA   $13
         DEC
         DEC
         BNE   L0942FD
         LDA   #$0003
         STA   $13
L0942FD  LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L09430E
         INX
L09430E  STA   $1D
         STX   $1F
         LDA   $13
         PEA   $001C
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $17
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   $11
         PEA   $000C
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $15
         LDA   #$001C
         CLC
         ADC   $17
         DEC
         DEC
         STA   $1B
         LDA   #$000C
         CLC
         ADC   $15
         DEC
         STA   $19
         LDA   $11
         DEC
         DEC
         BNE   L094364
         LDA   $13
         DEC
         BNE   L094364
         LDA   #$001C
         CLC
         ADC   $1B
         STA   $1B
L094364  LDA   $2A
         BEQ   L09439F
         JSL   L1510A1
         PEA   $8002
         JSL   L150BD6
         PEA   $0004
         PEA   $0002
         JSL   L151083
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151418
         BRA   L0943AC
L09439F  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150383
L0943AC  PEI   $0B
         PEI   $09
         JSL   L151669
         LDA   $05
         LDX   $07
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
L0943C2  LDA   $24
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

L0943D4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $1B
         LDA   $34
         BPL   L0943EB
         BRL   L094564
L0943EB  CMP   #$0006
         BMI   L0943F3
         BRL   L094564
L0943F3  ASL
         TAX
         LDAL  L0943FB,X
         PHA
         RTS

L0943FB  DA    L094407-1
         DA    L094437-1
         DA    L0944E0-1
         DA    L09450C-1
         DA    L094510-1
         DA    L09455A-1

L094407  PHY
         PHY
         JSL   L150493
         PLA
         STA   $17
         PLX
         STX   $19
         PEA   ^L0531E9
         PEA   L0531E9
         PEI   $19
         PEI   $17
         PEA   ^L0531F1
         PEA   L0531F1
         PEI   $2E
         PEI   $2C
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         BRL   L094564
L094437  STZ   $36
         LDA   $2A
         STA   $0D
         LDA   $28
         STA   $0B
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEI   $2E
         PEI   $2C
         JSL   L1512CB
         PLA
         LSR
         BCC   L0944CE
         LDA   $0B
         SEC
         SBC   [$2C]
         PHA
         PEA   $000C
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         LDA   $0D
         LDY   #$0002
         SEC
         SBC   [$2C],Y
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $13
         LDA   $11
         DEC
         DEC
         BNE   L094496
         LDA   $13
         SEC
         SBC   #$0001
         BEQ   L094496
         BVS   L09448F
         EOR   #$8000
L09448F  BPL   L094496
         LDA   $13
         DEC
         STA   $13
L094496  LDA   $13
         INC
         PHA
         LDA   $11
         ASL
         ASL
         STA   $1D
         PLA
         CLC
         ADC   $1D
         ORA   #$8000
         STA   $36
         LDA   L05516B
         BEQ   L0944CC
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L094202
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L094202
L0944CC  BRA   L0944DD
L0944CE  PEI   $2E
         PEI   $2C
         PEI   $0D
         PEI   $0B
         PEA   $0258
         JSL   L09A984
L0944DD  BRL   L094564
L0944E0  LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         BNE   L0944FB
         LDA   #$0072
         LDY   #$0002
         STA   [$01],Y
L0944FB  LDY   #$0004
         LDA   [$01],Y
         BNE   L09450A
         LDA   #$0025
         LDY   #$0004
         STA   [$01],Y
L09450A  BRA   L094564
L09450C  STZ   $36
         BRA   L094564
L094510  LDA   #$7FFF
         AND   $26
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         ORA   L055167
         PHA
         PEA   $0000
         PHD
         JSL   L094202
         LDX   #$0000
         LDA   $26
         BPL   L094533
         INX
L094533  TXA
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         STA   $1D
         PLA
         AND   $1D
         STA   L055167
         LDA   L055167
         BEQ   L094555
         LDA   #$7FFF
         AND   $26
         STA   L05516B
         BRA   L094564 ; was L094558
L094555  STZ   L05516B
         BRA   L094564
L09455A  LDA   #$0258
         CLC
         ADC   $26
         STA   $36
         BRA   L094564
L094564  PEI   $1B
         JSL   L071AA4
         LDA   $24
         STA   $34
         LDA   $23
         STA   $33
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0032
         TCS
         RTL

L09457C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L094593
         LDA   #$0001
         STA   L05522F
L094593  LDA   L05522F
         BNE   L09459B
         BRL   L094690
L09459B  LDA   L055171
         BNE   L0945A3
         BRL   L094683
L0945A3  LDA   L05516D
         AND   L05516F
         BNE   L0945AE
         BRL   L094668
L0945AE  LDY   #$0002
         LDA   [$0E],Y
         SEC
         SBCL  L0523D2
         BPL   L0945BE
         EOR   #$FFFF
         INC
L0945BE  STA   $01
         LDA   [$0E]
         SEC
         SBCL  L0523D0
         BPL   L0945CD
         EOR   #$FFFF
         INC
L0945CD  STA   $03
         LDA   $01
         SEC
         SBC   $03
         BEQ   L0945DD
         BVS   L0945DB
         EOR   #$8000
L0945DB  BMI   L0945E2
L0945DD  LDA   #$0000
         BRA   L0945E5
L0945E2  LDA   #$0001
L0945E5  PHA
         LDA   $01
         SEC
         SBC   #$0001
         BEQ   L0945F5
         BVS   L0945F3
         EOR   #$8000
L0945F3  BMI   L0945FA
L0945F5  LDA   #$0000
         BRA   L0945FD
L0945FA  LDA   #$0001
L0945FD  AND   $01,S
         PLX
         LSR
         BCC   L094606
         STZ   L05516D
L094606  LDA   $03
         SEC
         SBC   $01
         BEQ   L094614
         BVS   L094612
         EOR   #$8000
L094612  BMI   L094619
L094614  LDA   #$0000
         BRA   L09461C
L094619  LDA   #$0001
L09461C  PHA
         LDA   $03
         SEC
         SBC   #$0001
         BEQ   L09462C
         BVS   L09462A
         EOR   #$8000
L09462A  BMI   L094631
L09462C  LDA   #$0000
         BRA   L094634
L094631  LDA   #$0001
L094634  AND   $01,S
         PLX
         LSR
         BCC   L09463D
         STZ   L05516F
L09463D  LDX   #$0000
         LDA   $01
         CMP   $03
         BNE   L094647
         INX
L094647  PHX
         LDA   $01
         SEC
         SBC   #$0004
         BEQ   L094657
         BVS   L094655
         EOR   #$8000
L094655  BMI   L09465C
L094657  LDA   #$0000
         BRA   L09465F
L09465C  LDA   #$0001
L09465F  AND   $01,S
         PLX
         LSR
         BCC   L094668
         STZ   L05516D
L094668  LDA   L05516F
         BEQ   L094673
         LDAL  L0523D0
         STA   [$0E]
L094673  LDA   L05516D
         BEQ   L094681
         LDAL  L0523D2
         LDY   #$0002
         STA   [$0E],Y
L094681  BRA   L094690
L094683  LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDA   [$0E]
         PHA
         JSL   L094E90
L094690  LDA   $0C
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

L0946A2  ENT
         PHD
         TSC
         CLC
         ADC   #$FDDE
         TCS
         ADC   #$012F
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0014
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED1
         PHA
         LDA   L055265
         LDX   L055267
         PHX
         PHA
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00E5
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC7
         PHA
         LDA   L054FBF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE5
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD1
         PHA
         JSL   L03133B
         PEA   $000A
         JSL   L0313BE
         LDX   #$0000
         LDAL  L05565D
         BNE   L094723
         INX
L094723  TXA
         STA   $FC
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0228
         TCS
         RTL

L094738  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L15042E
         LDA   #$7FA6
         LDX   #$0000
         JSL   L033477
         BVS   L094755
         EOR   #$8000
L094755  BPL   L09475C
         LDA   #$0000
         BRA   L09475F
L09475C  LDA   #$0001
L09475F  STA   $0E
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

L094772  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   #$0001
         STA   $12
         PHY
         PEA   $0000
         PHD
         JSL   L094738
         PLA
         LSR
         BCC   L094818
         JSL   L151373
         JSL   L15059E
         PHY
         PEA   $0000
         PHD
         JSL   L094738
         PLA
         LSR
         BCC   L094818
         PEA   $0000
         JSL   L07479E
         JSL   L15059E
         PHY
         PEA   $0000
         PHD
         JSL   L094738
         PLA
         LSR
         BCC   L094818
L0947E1  PHY
         JSL   L0301E4
         PLA
         BNE   L0947E1
         JSL   L0B392B
         JSL   L15059E
         PHY
         PEA   $0000
         PHD
         JSL   L094738
         PLA
         LSR
         BCC   L094818
         PEA   $0000
         JSL   L15000C
         JSL   L15059E
         PHY
         PEA   $0000
         PHD
         JSL   L094738
         PLA
         EOR   #$0001
         STA   $12
L094818  LDA   $05
         ORA   $07
         BEQ   L09482D
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L09482D  LDA   $01
         ORA   $03
         BEQ   L094842
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L094842  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L09484A  PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         LDA   L054FB7
         LDX   L054FB9
         STA   $35
         STX   $37
         LDY   #$0002
         LDA   [$35],Y
         TAX
         LDA   [$35]
         PHX
         PHA
         LDY   #$0053
         LDA   [$3E],Y
         TAX
         DEY
         DEY
         LDA   [$3E],Y
         JSL   L033477
         BEQ   L09487D
         BVS   L09487B
         EOR   #$8000
L09487B  BMI   L094882
L09487D  LDA   #$0000
         BRA   L094885
L094882  LDA   #$0001
L094885  STA   $01
         PHY
         PHY
         JSL   L072E34
         LDA   #$0000
         LDX   #$0001
         JSL   L033477
         BVS   L09489C
         EOR   #$8000
L09489C  BPL   L0948A3
         LDA   #$0000
         BRA   L0948A6
L0948A3  LDA   #$0001
L0948A6  STA   $03
         PHY
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L151017
         PLA
         STA   $05
         LDA   $03
         ORA   $01
         ORA   $05
         STA   $42
         LDA   $3C
         STA   $40
         LDA   $3B
         STA   $3F
         LDA   $39
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L0948D6  ENT
         PHD
         TSC
         CLC
         ADC   #$FF5E
         TCS
         TCD
         LDA   L054FB7
         LDX   L054FB9
         STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$001E
         BCC   L0948F7
         INX
L0948F7  STA   $51
         STX   $53
         PEI   $53
         PEI   $51
         LDA   L055221
         LDX   L055223
         CLC
         ADC   #$00B4
         BCC   L09490C
         INX
L09490C  JSL   L033477
         BEQ   L09492A
         BVS   L094917
         EOR   #$8000
L094917  BPL   L09492A
         LDA   L055221
         LDX   L055223
         CLC
         ADC   #$00B4
         BCC   L094926
         INX
L094926  STA   $51
         STX   $53
L09492A  LDA   L055047
         BNE   L094932
         BRL   L094E88
L094932  STZ   L055215
         STZ   L0550BF
         STZ   L0551DD
         STZ   L0551DF
         STZ   L05524D
         STZ   L054FA7
         LDA   #$002C
         STA   L055277
         JSL   L0B392B
         LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L094961
         LDA   #$FFFF
         STA   L054FBB
         JSL   L09AED3
L094961  LDA   L0551FD
         BEQ   L09497B
         PHY
         PHY
         PEA   $C000
         PEA   $0000
         _HandleDiskInsert
         PLA
         STA   $4D
         PLX
         STX   $4F
L09497B  STZ   $97
         STZ   $99
         STZ   $8B
         STZ   $8D
         STZ   $87
         STZ   $89
         STZ   $83
         STZ   $85
         STZ   $77
         STZ   $79
         STZ   $6F
         STZ   $71
         STZ   $67
         STZ   $69
         STZ   $63
         STZ   $65
         STZ   $4B
         LDA   L0550FD
*         LDX   L0550FF
         CMPL  L053131
         BNE   L0949AE
*         TXA
         lda   L0550FF
         CMPL  L053133
L0949AE  BEQ   L0949B7
         PEA   $0D7C
         JSL   L07272E
L0949B7  LDA   L05512F
         BEQ   L094A05
         JSL   L083A3C
         LDA   L0550B5
         PHA
         PEA   $0001
         JSL   L090541
         LDA   L0550CD
         LDX   L0550CF
         CLC
         ADC   #$00CE
         BCC   L0949D8
         INX
L0949D8  STA   $9F
         STX   $A1
         LDA   #$0020
         AND   [$9F]
         BEQ   L094A05
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L151131
         PEA   ^L0531E1
         PEA   L0531E1
         JSL   L0854D9
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
L094A05  LDA   L0550B9
         BEQ   L094A0D
         BRL   L094E88
L094A0D  PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094A1D
         BRL   L094D71
L094A1D  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         JSL   L0772F8
         PLA
         STA   $97
*         PLX
*         STX   $99
*         LDA   $97
*         ORA   $99
         pla
         sta   $99
         ora   $97
         BNE   L094A3C
         BRL   L094D71
L094A3C  LDY   #$0002
         LDA   [$97],Y
*         TAX
         sta   $09
         LDA   [$97]
         STA   $07
*         STX   $09
         LDY   #$000E
         LDA   [$07],Y
         sta   $5d
*         TAX
         DEY
         DEY
         LDA   [$07],Y
         STA   $5B
*         STX   $5D
         PEI   $5D
         PEI   $5B
         LDA   #$7FFF
         LDX   #$0000
         JSL   L033477
         BEQ   L094A74
         BVS   L094A6B
         EOR   #$8000
L094A6B  BPL   L094A74
         LDA   #$0010
         STA   $5F
         BRA   L094A81
L094A74  PHY
         PEI   $5B
         PEA   $0010
         JSL   L072FD5
         PLA
         STA   $5F
L094A81  LDY   #$0016
         LDA   [$07],Y
         TAX
         DEY
         DEY
         LDA   [$07],Y
         CMPL  L053AC9
         BNE   L094A96
         TXA
         CMPL  L053ACB
L094A96  BEQ   L094AB1
         LDY   #$0016
         LDA   [$07],Y
         TAX
         DEY
         DEY
         LDA   [$07],Y
         STAL  L053AC9
         TXA
         STAL  L053ACB
         LDA   #$0001
         STA   L05504D
L094AB1  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $8B
         PLX
         STX   $8D
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $87
         PLX
         STX   $89
         LDA   $8B
         ORA   $8D
         BEQ   L094B0B
         PHY
         PHY
         LDY   #$0002
         LDA   [$8B],Y
         TAX
         LDA   [$8B]
         CLC
         ADC   #$000C
         BCC   L094AF0
         INX
L094AF0  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         PHX
         PHA
         PEA   $0000
         JSL   L077264
         PLA
         STA   $83
         PLX
         STX   $85
L094B0B  PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094B1B
         BRL   L094D71
L094B1B  PHY
         PHY
         JSL   L07B114
         PLA
         PLX
         INC
         BNE   L094B27
         INX
L094B27  STA   $7B
         STX   $7D
         PEI   $7D
         PEI   $7B
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         JSL   L033477
         BEQ   L094B4F
         BVS   L094B43
         EOR   #$8000
L094B43  BPL   L094B4F
         LDA   #$0001
         LDX   #$0000
         STA   $7B
         STX   $7D
L094B4F  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $7D
         PEI   $7B
         JSL   L07B8EA
         PLA
         STA   $7F
         PLX
         STX   $81
         STZ   $6B
         STZ   $6D
         LDA   L05501F
         LDX   L055021
         STA   $73
         STX   $75
         PHY
         PHY
         PEI   $81
         PEI   $7F
         JSL   L0772AE
         PLA
         STA   $77
         PLX
         STX   $79
         PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094B97
         BRL   L094D71
L094B97  LDA   $77
         ORA   $79
         BEQ   L094BDB
         LDY   #$0002
         LDA   [$77],Y
         TAX
         LDA   [$77]
         CLC
         ADC   #$000C
         BCC   L094BAC
         INX
L094BAC  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         STA   $6B
         STX   $6D
         LDY   #$0002
         LDA   [$77],Y
         TAX
         LDA   [$77]
         CLC
         ADC   #$0020
         BCC   L094BCB
         INX
L094BCB  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         STA   $73
         STX   $75
L094BDB  PHY
         PHY
         PEI   $6D
         PEI   $6B
         PEA   $0000
         JSL   L077264
         PLA
         STA   $67
         PLX
         STX   $69
         PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094BFE
         BRL   L094D71
L094BFE  LDA   L05501F
         LDX   L055021
         CMP   $73
         BNE   L094C0A
         CPX   $75
L094C0A  BEQ   L094C78
         STZ   $6B
         STZ   $6D
         PHY
         PHY
         PEI   $75
         PEI   $73
         JSL   L07721A
         PLA
         STA   $6F
         PLX
         STX   $71
         PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094C30
         BRL   L094D71
L094C30  LDA   $6F
         ORA   $71
         BEQ   L094C55
         LDY   #$0002
         LDA   [$6F],Y
         TAX
         LDA   [$6F]
         CLC
         ADC   #$000C
         BCC   L094C45
         INX
L094C45  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         STA   $6B
         STX   $6D
L094C55  PHY
         PHY
         PEI   $6D
         PEI   $6B
         PEA   $0000
         JSL   L077264
         PLA
         STA   $63
         PLX
         STX   $65
         PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCC   L094C78
         BRL   L094D71
L094C78  LDY   #$0002
         LDA   [$97],Y
         TAX
         LDA   [$97]
         CLC
         ADC   #$0028
         BCC   L094C87
         INX
L094C87  STA   $55
         STX   $57
         LDA   $5B
         STA   $05
         LDA   $05
         SEC
         SBC   #$0001
         BVS   L094C9A
         EOR   #$8000
L094C9A  BPL   L094CCC
         LDA   #$0001
         STA   $61
L094CA1  LDA   L055081
         LDX   L055083
         CMP   [$55]
         BNE   L094CB1
         LDY   #$0002
         TXA
         CMP   [$55],Y
L094CB1  BEQ   L094CD1
         LDA   $55
         LDX   $57
         CLC
         ADC   #$0006
         BCC   L094CBE
         INX
L094CBE  STA   $55
         STX   $57
         LDA   $61
         CMP   $05
         BEQ   L094CCC
         INC   $61
         BRA   L094CA1
L094CCC  LDA   #$0001
         STA   $61
L094CD1  LDA   $5F
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L094CE0
         EOR   #$8000
L094CE0  BMI   L094CE5
         BRL   L094D71
L094CE5  LDA   #$0001
         STA   $59
L094CEA  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   $61
         JSL   L150488
         PHX
         PHA
         JSL   L07A8A9
         PLA
         STA   $93
         PLX
         STX   $95
         PHY
         PHY
         PEI   $95
         PEI   $93
         JSL   L077A01
         PLA
         STA   $8F
         PLX
         STX   $91
         LDA   $8F
         ORA   $91
         BEQ   L094D36
         LDA   $4B
         INC
         STA   $4B
         LDA   $4B
         ASL
         ASL
         CLC
         ADC   #$0007
         TAX
         PEI   $95
         PEI   $93
         PLA
         STA   $00,X
         PLA
         STA   $02,X
L094D36  LDA   $61
         INC
         STA   $61
         LDA   $61
         JSL   L150488
         PHX
         PHA
         LDA   $5B
         LDX   $5D
         JSL   L033477
         BEQ   L094D59
         BVS   L094D52
         EOR   #$8000
L094D52  BPL   L094D59
         LDA   #$0001
         STA   $61
L094D59  PHY
         PEA   $0000
         PHD
         JSL   L09484A
         PLA
         LSR
         BCS   L094D71
         LDA   $59
         CMP   $03
         BEQ   L094D71
         INC   $59
         BRL   L094CEA
L094D71  LDA   $4B
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L094D80
         EOR   #$8000
L094D80  BPL   L094DA7
         LDA   #$0001
         STA   $59
L094D87  LDA   $59
         ASL
         ASL
         CLC
         ADC   #$0007
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEA   $0000
         JSL   L074E17
         LDA   $59
         CMP   $01
         BEQ   L094DA7
         INC   $59
         BRA   L094D87
L094DA7  LDA   $63
         ORA   $65
         BEQ   L094DD1
         LDY   #$0002
         LDA   [$6F],Y
         TAX
         LDA   [$6F]
         CLC
         ADC   #$000C
         BCC   L094DBC
         INX
L094DBC  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         PHX
         PHA
         PEA   $0000
         JSL   L074A5A
L094DD1  LDA   $67
         ORA   $69
         BEQ   L094DFB
         LDY   #$0002
         LDA   [$77],Y
         TAX
         LDA   [$77]
         CLC
         ADC   #$000C
         BCC   L094DE6
         INX
L094DE6  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         PHX
         PHA
         PEA   $0000
         JSL   L074A5A
L094DFB  LDA   $6F
         ORA   $71
         BEQ   L094E0C
         PEI   $75
         PEI   $73
         PEA   $0000
         JSL   L074A24
L094E0C  LDA   $77
         ORA   $79
         BEQ   L094E1D
         PEI   $81
         PEI   $7F
         PEA   $0000
         JSL   L074A90
L094E1D  LDA   $83
         ORA   $85
         BEQ   L094E47
         LDY   #$0002
         LDA   [$8B],Y
         TAX
         LDA   [$8B]
         CLC
         ADC   #$000C
         BCC   L094E32
         INX
L094E32  STA   $9F
         STX   $A1
         LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         PHX
         PHA
         PEA   $0000
         JSL   L074A5A
L094E47  LDA   $87
         ORA   $89
         BEQ   L094E5C
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L094E5C  LDA   $8B
         ORA   $8D
         BEQ   L094E71
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L094E71  LDA   $97
         ORA   $99
         BEQ   L094E88
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         JSL   L074AC6
L094E88  TSC
         CLC
         ADC   #$00A2
         TCS
         PLD
         RTL

L094E90  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05522F
         STA   L055171
         LDA   L055171
         BEQ   L094EBC
         LDA   #$0001
         STA   L05516F
         LDA   #$0001
         STA   L05516D
         LDA   $0A
         LDX   $0C
         STAL  L0523D0
         TXA
         STAL  L0523D2
L094EBC  LDA   $08
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

L094ECD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $10
         LDAL  L052D72
         AND   #$1000
         BEQ   L094EE7
         LDA   #$0001
         STA   $10
         BRA   L094F57
L094EE7  LDAL  L052D66
         AND   #$00FF
         STA   $03
         LDX   $03
         LDA   #$00FF
         ANDL  L041454,X
         STA   $01
         LDAL  L052D72
         AND   #$2000
         BEQ   L094F53
         LDA   #$0009
         CMP   $01
         BNE   L094F10
         LDA   #$000A
         STA   $01
L094F10  LDA   $03
         SEC
         SBC   #$0060
         BVS   L094F1B
         EOR   #$8000
L094F1B  BMI   L094F22
         LDA   #$0000
         BRA   L094F25
L094F22  LDA   #$0001
L094F25  PHA
         LDA   $03
         SEC
         SBC   #$007A
         BEQ   L094F3A
         BVS   L094F33
         EOR   #$8000
L094F33  BPL   L094F3A
         LDA   #$0000
         BRA   L094F3D
L094F3A  LDA   #$0001
L094F3D  AND   $01,S
         PLX
         LSR
         BCC   L094F53
         LDA   $03
         SEC
         SBC   #$0060
         TAX
         LDA   #$00FF
         ANDL  L041554,X
         STA   $01
L094F53  LDA   $01
         STA   $10
L094F57  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L094F69  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         LDX   $1A
         STA   $03
         STX   $05
         LDA   $16
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L094F88
         EOR   #$8000
L094F88  BPL   L094FF7
         LDA   #$0001
         STA   $07
L094F8F  LDY   #$000C
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         CMP   [$03]
         BNE   L094FA3
         LDY   #$0002
         TXA
         CMP   [$03],Y
L094FA3  BEQ   L094FAA
         LDA   #$0000
         BRA   L094FAD
L094FAA  LDA   #$0001
L094FAD  PHA
         LDY   #$0006
         LDA   [$03],Y
         TAX
         DEY
         DEY
         LDA   [$03],Y
         CMP   L055039
         BNE   L094FC0
         CPX   L05503B
L094FC0  BEQ   L094FC7
         LDA   #$0000
         BRA   L094FCA
L094FC7  LDA   #$0001
L094FCA  AND   $01,S
         PLX
         LSR
         BCC   L094FDE
         PEI   $05
         PEI   $03
         PEA   $0000
         PEA   $0008
         JSL   L071EC5
L094FDE  LDA   $03
         LDX   $05
         CLC
         ADC   #$0008
         BCC   L094FE9
         INX
L094FE9  STA   $03
         STX   $05
         LDA   $07
         CMP   $01
         BEQ   L094FF7
         INC   $07
         BRA   L094F8F
L094FF7  LDA   $10
         STA   $1A
         LDA   $0F
         STA   $19
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L095009  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L0525DA
         PEA   L0525DA
         PEA   $00C8
         PEA   $0000
         PHD
         JSL   L094F69
         PEA   ^L052C1A
         PEA   L052C1A
         PEA   $0014
         PEA   $0000
         PHD
         JSL   L094F69
         PEA   ^L05233C
         PEA   L05233C
         PEA   $0012
         PEA   $0000
         PHD
         JSL   L094F69
         JSL   L095257
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

L095059  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         LDA   $32
         BNE   L095068
         BRL   L095245
L095068  PHY
         PHY
         PEI   $3E
         PEI   $3C
         JSL   L0772AE
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   $23
         ORA   $25
         BNE   L095081
         BRL   L095245
L095081  PHY
         PHY
         PEI   $3A
         PEI   $38
         JSL   L07721A
         PLA
         STA   $1F
         PLX
         STX   $21
         LDA   $1F
         ORA   $21
         BNE   L09509A

*

         BRL   L09523B
L09509A  JSL   L096029
         PHY
         PEI   $25
         PEI   $23
         JSL   L0718FA
         PLA
         STA   $1D
         PHY
         PEI   $21
         PEI   $1F
         JSL   L0718FA
         PLA
         STA   $1B
         LDA   $34
         LDX   $36
         CMP   $3C
         BNE   L0950C0
         CPX   $3E
L0950C0  BEQ   L0950C7
         LDA   #$0000
         BRA   L0950CA
L0950C7  LDA   #$0001
L0950CA  STA   $19
         STZ   $09
         STZ   $07
         LDA   $19
         BEQ   L095100
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0032
         BCC   L0950E3
         INX
L0950E3  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         CLC
         ADC   #$0024
         BCC   L0950F6
         INX
L0950F6  STA   $27
         STX   $29
         LDA   [$27]
         STA   $13
         BRA   L09512A
L095100  LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         CLC
         ADC   #$0032
         BCC   L09510F
         INX
L09510F  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         CLC
         ADC   #$0024
         BCC   L095122
         INX
L095122  STA   $27
         STX   $29
         LDA   [$27]
         STA   $13
L09512A  LDA   $13
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L095139
         EOR   #$8000
L095139  BMI   L09513E
         BRL   L095219
L09513E  LDA   #$0001
         STA   $11
L095143  LDA   $15
         LDX   $17
         STA   $03
         STX   $05
         LDY   #$0004
         LDA   #$00F0
         AND   [$03],Y
         PHA
         PEA   $0004
         JSL   L1510EF
         PLA
         CMP   $32
         BEQ   L095163
         BRL   L0951FC
L095163  LDY   #$0002
         LDA   $30
         CMP   [$03],Y
         BNE   L09516F
         BRL   L0951FC
L09516F  LDX   #$0000
         LDY   #$000E
         LDA   #$000F
         AND   [$03],Y
         CMP   #$0000
         BEQ   L095180
         INX
L095180  PHX
         LDY   #$0010
         LDA   [$03],Y
         INY
         INY
         ORA   [$03],Y
         BEQ   L09518F
         LDA   #$0001
L09518F  ORA   $01,S
         PLX
         STA   $0D
         LDY   #$0002
         LDA   [$03],Y
         STA   $0F
         LDA   $19
         BEQ   L0951A7
         LDA   $0F
         EOR   #$FFFF
         INC
         STA   $0F
L0951A7  PHY
         PEI   $3A
         PEI   $38
         PEI   $3E
         PEI   $3C
         PEI   $0F
         JSL   L07A609
         PLA
         LSR
         BCC   L0951FC
         PHY
         PEI   $3A
         PEI   $38
         PEI   $3E
         PEI   $3C
         PEI   $0F
         PEA   $0000
         PEA   $0001
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L07D08A
         PLA
         LSR
         BCC   L0951FC
         PEI   $36
         PEI   $34
         LDY   #$0002
         LDA   [$03],Y
         PHA
         PEI   $0D
         JSL   L0876F4
         LDA   $0B
         ORA   $09
         STA   $09
         LDA   $19
         BNE   L0951FC
         LDA   $0B
         ORA   $07
         STA   $07
L0951FC  PEI   $17
         PEI   $15
         LDA   [$03]
         JSL   L150488
         JSL   L150F53
         STA   $15
         STX   $17
         LDA   $11
         CMP   $01
         BEQ   L095219
         INC   $11
         BRL   L095143
L095219  PEI   $21
         PEI   $1F
         PEI   $1B
         JSL   L0718DA
         PEI   $25
         PEI   $23
         PEI   $1D
         JSL   L0718DA
         JSL   L09AED3
         PEI   $3A
         PEI   $38
         PEI   $07
         JSL   L074A24
L09523B  PEI   $3E
         PEI   $3C
         PEI   $09
         JSL   L074A90
L095245  LDA   $2E
         STA   $3E
         LDA   $2D
         STA   $3D
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$003C
         TCS
         RTL

L095257  PHD
         TSC
         CLC
         ADC   #$FFDA
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $1F
         PLX
         STX   $21
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1506A1
         PEA   ^L05232C
         PEA   L05232C
         JSL   L1506A7
         LDA   #L05233C
         LDX   #^L05233C
         STA   $1B
         STX   $1D
         LDA   #$0001
         STA   $19
L09529B  LDA   [$1B]
         LDY   #$0002
         ORA   [$1B],Y
         BNE   L0952C0
         PEI   $19
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L09031E
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L15123D
L0952C0  LDA   $1B
         LDX   $1D
         CLC
         ADC   #$0008
         BCC   L0952CB
         INX
L0952CB  STA   $1B
         STX   $1D
         LDA   #$0012
         CMP   $19
         BEQ   L0952DA
         INC   $19
         BRA   L09529B
L0952DA  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1506A7
         PEI   $21
         PEI   $1F
         JSL   L151131
         TSC
         CLC
         ADC   #$0026
         TCS
         PLD
         RTL

L0952F7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B9
         DEC
         BNE   L09530B
         JSL   L160218
         BRA   L09530F
L09530B  JSL   L0A3283
L09530F  PLY
         PLY
         PLD
         RTL

L095313  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         LDX   $1A
         STA   $03
         STX   $05
         LDA   $16
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L095332
         EOR   #$8000
L095332  BPL   L09537B
         LDA   #$0001
         STA   $07
L095339  LDY   #$0006
         LDA   [$03],Y
         PHA
         DEY
         DEY
         LDA   [$03],Y
         PHA
         LDY   #$000C
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         JSL   L033477
         BNE   L095362
         PEI   $05
         PEI   $03
         PEA   $0000
         PEA   $0008
         JSL   L071EC5
L095362  LDA   $03
         LDX   $05
         CLC
         ADC   #$0008
         BCC   L09536D
         INX
L09536D  STA   $03
         STX   $05
         LDA   $07
         CMP   $01
         BEQ   L09537B
         INC   $07
         BRA   L095339
L09537B  LDA   $10
         STA   $1A
         LDA   $0F
         STA   $19
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L09538D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L0525DA
         PEA   L0525DA
         PEA   $00C8
         PEA   $0000
         PHD
         JSL   L095313
         PEA   ^L052C1A
         PEA   L052C1A
         PEA   $0014
         PEA   $0000
         PHD
         JSL   L095313
         PEA   ^L05233C
         PEA   L05233C
         PEA   $0012
         PEA   $0000
         PHD
         JSL   L095313
         JSL   L095257
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

L0953DD  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0551DF
         STA   $01
         LDA   #$0001
         STA   L0551DF
         PHY
         PEI   $0E
         PEI   $0C
         PEA   $0001
         JSL   L095416
         PLA
         STA   $10
         LDA   $01
         STA   L0551DF
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

L095416  ENT
         PHD
         TSC
         CLC
         ADC   #$FD7E
         TCS
         ADC   #$0191
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $005C
         JSL   L0313BE
         STZ   $FC
         STZ   L055257
         LDA   L055027
         LDX   L055029
         STA   $C3
         STX   $C5
         LDA   L055023
         LDX   L055025
         STA   $C7
         STX   $C9
         LDA   L055119
         LDX   L05511B
         STA   $BF
         STX   $C1
         LDA   L055151
         STA   $BD
         LDA   L05501F
         LDX   L055021
         STA   $B9
         STX   $BB
         LDA   L055115
         LDX   L055117
         STA   $B5
         STX   $B7
         LDA   L05514F
         STA   $B3
         LDA   L05501F
         LDX   L055021
         STA   $AF
         STX   $B1
         STZ   $E9
         STZ   $EB
         STZ   $97
         STZ   $99
         STZ   $87
         STZ   $89
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7F
         PHA
         JSL   L0982BA
         PHY
         PHY
         LDX   #$FFD7
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L07899F
         PLA
         STA   $8B
         PLX
         STX   $8D
         PHY
         PEI   $8D
         PEI   $8B
         JSL   L0988BB
         PLA
         EOR   #$0001
         STA   $D7
         LDA   $D7
         BEQ   L095500
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $87
         PLX
         STX   $89
         LDA   #$0001
         STA   L055249
         PHY
         PEI   $8D
         PEI   $8B
         JSL   L0971E9
         PLA
         LSR
         BCS   L0954F3
         BRL   L095F5B
L0954F3  LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $AF
         STX   $B1
L095500  STZ   L0551A7
         STZ   L0551A9
         LDA   #$0006
         LDX   #$FFAB
         CMP   $00,X
         BNE   L095513
         BRL   L095838
L095513  LDX   #$FFAB
         LDA   $00,X
         DEC
         BPL   L09551E
         BRL   L095838
L09551E  CMP   #$0004
         BMI   L095526
         BRL   L095838
L095526  SEC
         SBC   #$0000
         BEQ   L09553E
         DEC
         BEQ   L095553
         DEC
         BNE   L095535
         BRL   L095645
L095535  DEC
         BNE   L09553B
         BRL   L095766
L09553B  BRL   L095838
L09553E  LDX   #$FFAD
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   L0551A7
         STX   L0551A9
         BRL   L095838
         BRL   L095838
L095553  PHY
         PHY
         LDX   #$FFB1
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDAL  L053AC3
         PHA
         LDAL  L053AC1
         PHA
         JSL   L09603C
         PLA
         STA   $A3
         PLX
         STX   $A5
         PEI   $A5
         PEI   $A3
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         JSL   L033477
         BEQ   L09558F
         BVS   L09558A
         EOR   #$8000
L09558A  BPL   L09558F
         BRL   L095F0F
L09558F  LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   $AF
         STX   $B1
         LDX   $A5
         LDA   $A3
         BNE   L0955A3
         DEX
L0955A3  DEC
         TXY
         LDX   #$FF7B
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF7B
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L0955C5
         EOR   #$8000
L0955C5  BPL   L095635
         LDA   #$0001
         LDX   #$0000
         STA   $A7
         STX   $A9
L0955D1  PHY
         PHY
         PEI   $B1
         PEI   $AF
         JSL   L07721A
         PLA
         STA   $9F
         PLX
         STX   $A1
         LDA   $9F
         ORA   $A1
         BNE   L0955EA
         BRL   L095F0F
L0955EA  LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$0018
         BCC   L0955F9
         INX
L0955F9  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $AB
         STX   $AD
         PEI   $B1
         PEI   $AF
         PEA   $0000
         JSL   L074A24
         LDA   $AB
         LDX   $AD
         STA   $AF
         STX   $B1
         LDX   #$FF7B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $A7
         BNE   L09562B
         CPX   $A9
L09562B  BEQ   L095635
         INC   $A7
         BNE   L095633
         INC   $A9
L095633  BRA   L0955D1
L095635  LDA   $AF
         LDX   $B1
         STA   L0551A7
         STX   L0551A9
         BRL   L095838
         BRL   L095838
L095645  LDA   $D7
         BEQ   L09565B
         LDAL  L053AC7
         TAX
         LDAL  L053AC5
         STA   L0551A7
         STX   L0551A9
         BRL   L095838
L09565B  LDX   #$FFB5
         LDA   $00,X
         BNE   L095671
         LDA   L05501F
         LDX   L055021
         STA   L0551A7
         STX   L0551A9
         BRL   L095838
L095671  LDAL  L053AC3
         PHA
         LDAL  L053AC1
         PHA
         LDA   #$0002
         LDX   #$0000
         JSL   L033477
         BVS   L09568A
         EOR   #$8000
L09568A  BMI   L09568F
         BRL   L095F0F
L09568F  LDA   #$0006
         LDX   #$FF7F
         CMP   $00,X
         BNE   L0956B2
         LDA   #$FFFF
         TAX
         STA   L0551A7
         STX   L0551A9
         PHY
         PHY
         JSL   L07B114
         PLA
         STA   $97
         PLX
         STX   $99
         BRL   L095838
L0956B2  LDX   #$FFB5
         LDA   $00,X
         DEC
         DEC
         BNE   L09570B
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $9F
         PLX
         STX   $A1
         LDA   $9F
         ORA   $A1
         BNE   L0956D8
         BRL   L095F0F
L0956D8  LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$0018
         BCC   L0956E7
         INX
L0956E7  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   L0551A7
         STX   L0551A9
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         BRL   L095838
L09570B  LDX   #$FFB5
         LDA   $00,X
         DEC
         BNE   L095763
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $9F
         PLX
         STX   $A1
         LDA   $9F
         ORA   $A1
         BNE   L095730
         BRL   L095F0F
L095730  LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$001C
         BCC   L09573F
         INX
L09573F  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   L0551A7
         STX   L0551A9
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
         BRL   L095838
L095763  BRL   L095838
L095766  LDAL  L053AC3
         TAX
         LDAL  L053AC1
         TXY
         LDX   #$FF77
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF77
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L095790
         EOR   #$8000
L095790  BMI   L095795
         BRL   L095833
L095795  LDA   #$0001
         LDX   #$0000
         STA   $A7
         STX   $A9
L09579F  PHY
         PHY
         PEI   $B1
         PEI   $AF
         JSL   L07721A
         PLA
         STA   $9F
         PLX
         STX   $A1
         LDA   $9F
         ORA   $A1
         BNE   L0957B8
         BRL   L095F0F
L0957B8  LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$0018
         BCC   L0957C7
         INX
L0957C7  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $AB
         STX   $AD
         PEI   $B1
         PEI   $AF
         PEA   $0000
         JSL   L074A24
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE6F
         PHA
         PEI   $B1
         PEI   $AF
         JSL   L07AA4B
         JSL   L071C56
         PLA
         LSR
         BCC   L095811
         LDA   $AF
         LDX   $B1
         STA   L0551A7
         STX   L0551A9
         BRA   L095838
L095811  LDA   $AB
         LDX   $AD
         STA   $AF
         STX   $B1
         LDX   #$FF77
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $A7
         BNE   L095828
         CPX   $A9
L095828  BEQ   L095833
         INC   $A7
         BNE   L095830
         INC   $A9
L095830  BRL   L09579F
L095833  BRL   L095F0F
         BRA   L095838
L095838  STZ   L0551A3
         STZ   L0551A5
         STZ   L05507F
         LDA   #$0001
         LDX   #$0000
         STA   $9B
         STX   $9D
         LDA   L0551A7
         LDX   L0551A9
         PHX
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L0958AA
         BEQ   L0958AA
         PHY
         PHY
         LDA   L0551A7
         LDX   L0551A9
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $9F
         PLX
         STX   $A1
         LDA   $9F
         ORA   $A1
         BNE   L09587C
         BRL   L095F0F
L09587C  LDY   #$0002
         LDA   [$9F],Y
         TAX
         LDA   [$9F]
         CLC
         ADC   #$0014
         BCC   L09588B
         INX
L09588B  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $9B
         STX   $9D
         LDA   L0551A7
         LDX   L0551A9
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L0958AA  LDAL  L053ACF
         TAX
         LDAL  L053ACD
         STA   $E9
         STX   $EB
         LDA   #$0001
         LDX   #$0000
         STA   $E5
         STX   $E7
         LDA   #$0006
         LDX   #$FF7F
         CMP   $00,X
         BNE   L095933
         LDA   L05501F
         LDX   L055021
         CMP   L0551A7
         BNE   L0958D9
         CPX   L0551A9
L0958D9  BNE   L0958F2
         LDA   L055027
         LDX   L055029
         STA   $E9
         STX   $EB
         LDA   L055023
         LDX   L055025
         STA   $E5
         STX   $E7
         BRL   L095D8D
L0958F2  LDA   #$0003
         LDX   #$FF7F
         STA   $00,X
         LDA   #$0002
         LDX   #$FF89
         STA   $00,X
         LDA   #$0003
         LDX   #$FFAB
         CMP   $00,X
         BEQ   L095911
         LDA   #$0000
         BRA   L095914
L095911  LDA   #$0001
L095914  PHA
         LDX   #$FFB5
         LDA   $00,X
         DEC
         BEQ   L095922
         LDA   #$0000
         BRA   L095925
L095922  LDA   #$0001
L095925  AND   $01,S
         PLX
         LSR
         BCC   L095933
         LDA   #$0001
         LDX   #$FF89
         STA   $00,X
L095933  LDX   #$FF7F
         LDA   $00,X
         DEC
         BPL   L09593E
         BRL   L095D70
L09593E  CMP   #$0005
         BMI   L095946
         BRL   L095D70
L095946  SEC
         SBC   #$0000
         BEQ   L095964
         DEC
         BEQ   L095990
         DEC
         BNE   L095955
         BRL   L095A20
L095955  DEC
         BNE   L09595B
         BRL   L095BF0
L09595B  DEC
         BNE   L095961
         BRL   L095CAF
L095961  BRL   L095D70
L095964  LDX   #$FF81
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $E9
         STX   $EB
         STZ   $E5
         STZ   $E7
         PHY
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L0960E8
         PLA
         LSR
         BCS   L09598A
         BRL   L095F0F
L09598A  BRL   L095D8D
         BRL   L095D70
L095990  LDA   L0551A7
         ORA   L0551A9
         BNE   L0959BA
         PHY
         PHY
         LDX   #$FF85
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L09603C
         PLA
         STA   $E5
         PLX
         STX   $E7
         BRL   L095D73
L0959BA  PHY
         PHY
         LDX   #$FF85
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         PEI   $9D
         PEI   $9B
         JSL   L09603C
         PLA
         STA   L05519F
         PLA
         STA   L0551A1
         LDA   L05519F
         LDX   L0551A1
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L0959EC
         EOR   #$8000
L0959EC  BMI   L0959F1
         BRL   L095F0F
L0959F1  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $99
         PEI   $97
         PEA   $0000
         PEA   $0000
         PEA   ^L090F5A
         PEA   L090F5A
         PEA   $0000
         JSL   L07C7B5
         PLA
         STA   $E5
         PLX
         STX   $E7
         BRL   L095D73
         BRL   L095D70
L095A20  LDA   $D7
         BEQ   L095A27
         BRL   L095D8D
L095A27  LDX   #$FF89
         LDA   $00,X
         SEC
         SBC   #$0000
         BPL   L095A35
         BRL   L095BED
L095A35  CMP   #$0003
         BMI   L095A3D
         BRL   L095BED
L095A3D  SEC
         SBC   #$0000
         BEQ   L095A4F
         DEC
         BNE   L095A49
         BRL   L095B2D
L095A49  DEC
         BEQ   L095A7E
         BRL   L095BED
L095A4F  LDA   L055027
         LDX   L055029
         STA   $E9
         STX   $EB
         LDA   L055023
         LDX   L055025
         STA   $E5
         STX   $E7
         PHY
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L0960E8
         PLA
         LSR
         BCS   L095A78
         BRL   L095F0F
L095A78  BRL   L095D8D
         BRL   L095BED
L095A7E  PHY
         PHY
         JSL   L07B114
         PLA
         PLX
         INC
         BNE   L095A8A
         INX
L095A8A  STA   $E5
         STX   $E7
         PEI   $E7
         PEI   $E5
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         JSL   L033477
         BEQ   L095AB2
         BVS   L095AA6
         EOR   #$8000
L095AA6  BPL   L095AB2
         LDA   #$0001
         LDX   #$0000
         STA   $E5
         STX   $E7
L095AB2  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L07B8EA
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L0960E8
         PLA
         LSR
         BCC   L095AE1
         BRL   L095D8D
L095AE1  STZ   L0551A3
         STZ   L0551A5
         LDA   #$0001
         LDX   #$0000
         STA   L05519F
         STX   L0551A1
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PHY
         PHY
         JSL   L07B114
         PEA   $0000
         PEA   $0000
         PEA   ^L090F5A
         PEA   L090F5A
         PEA   $0000
         JSL   L07C7B5
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L095B27
         BRL   L095F0F
L095B27  BRL   L095D73
         BRL   L095BED
L095B2D  PHY
         PHY
         JSL   L07B114
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         TXY
         LDX   #$FF73
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF73
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L095B63
         EOR   #$8000
L095B63  BMI   L095B68
         BRL   L095BE8
L095B68  LDA   #$0001
         LDX   #$0000
         STA   $93
         STX   $95
L095B72  LDX   $E7
         LDA   $E5
         BNE   L095B79
         DEX
L095B79  DEC
         STA   $E5
         STX   $E7
         PEI   $E7
         PEI   $E5
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L095B91
         EOR   #$8000
L095B91  BMI   L095BA0
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   $E5
         STX   $E7
L095BA0  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L07B8EA
         PLA
         STA   $E9
         PLX
         STX   $EB
         PHY
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         JSL   L0960E8
         PLA
         LSR
         BCC   L095BCF
         BRL   L095D8D
L095BCF  LDX   #$FF73
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CMP   $93
         BNE   L095BDE
         CPX   $95
L095BDE  BEQ   L095BE8
         INC   $93
         BNE   L095BE6
         INC   $95
L095BE6  BRA   L095B72
L095BE8  BRL   L095F0F
         BRA   L095BED
L095BED  BRL   L095D70
L095BF0  LDA   $D7
         BEQ   L095BFA
         STZ   $97
         STZ   $99
         BRA   L095C06
L095BFA  PHY
         PHY
         JSL   L07B114
         PLA
         STA   $97
         PLX
         STX   $99
L095C06  PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L07A852
         PLA
         LSR
         BCS   L095C25
         BRL   L095F0F
L095C25  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         LDA   #$0001
         LDX   #$0007
         STA   $00,X
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF8B
         PHA
         JSL   L071F3F
         PLA
         STA   $8F
         PLX
         STX   $91
         PEI   $91
         PEI   $8F
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         LDX   #$FFF9
         LDA   $00,X
         PHA
         LDX   #$FFF7
         LDA   $00,X
         PHA
         JSL   L078D85
         TDC
         CLC
         ADC   #$FF8B
         STA   L05519B
         STZ   L05519D
         PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $99
         PEI   $97
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L09618C
         PEA   L09618C
         PEA   $0000
         JSL   L07C7B5
         PLA
         STA   $E5
         PLX
         STX   $E7
         BRL   L095D73
         BRL   L095D70
L095CAF  LDA   L0551A7
         ORA   L0551A9
         BEQ   L095CBA
         BRL   L095F0F
L095CBA  LDX   #$FF89
         LDA   $00,X
         DEC
         DEC
         BNE   L095CCA
         LDA   #$0001
         STA   $CB
         BRA   L095CF0
L095CCA  LDX   #$FF89
         LDA   $00,X
         DEC
         BNE   L095CD9
         LDA   #$FFFF
         STA   $CB
         BRA   L095CF0
L095CD9  LDA   L055027
         LDX   L055029
         STA   $E9
         STX   $EB
         LDA   L055023
         LDX   L055025
         STA   $E5
         STX   $E7
         BRL   L095D8D
L095CF0  LDA   L0551E3
         STA   $CD
L095CF5  LDA   $CB
         CLC
         ADC   $CD
         STA   $CD
         LDA   $CD
         SEC
         SBC   #$0001
         BVS   L095D07
         EOR   #$8000
L095D07  BMI   L095D0E
         LDA   #$00C8
         STA   $CD
L095D0E  LDA   $CD
         SEC
         SBC   #$00C8
         BEQ   L095D22
         BVS   L095D1B
         EOR   #$8000
L095D1B  BPL   L095D22
         LDA   #$0001
         STA   $CD
L095D22  LDA   $CD
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L0525DA,X
         ORAL  L0525DC,X
         BEQ   L095D36
         LDA   #$0001
L095D36  PHA
         LDX   #$0000
         LDA   L0551E3
         CMP   $CD
         BNE   L095D42
         INX
L095D42  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L095CF5
         LDA   L0551DF
         BNE   L095D53
         LDA   $CD
         STA   L0551E3
L095D53  LDA   $CD
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L0525DC,X
         PHA
         LDAL  L0525DA,X
         PLX
         STA   $E9
         STX   $EB
         STZ   $E5
         STZ   $E7
         BRA   L095D8D
         BRA   L095D70
L095D70  BRL   L095F0F
L095D73  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L07B8EA
         PLA
         STA   $E9
         PLX
         STX   $EB
L095D8D  LDA   $E9
         ORA   $EB
         BNE   L095D96
         BRL   L095F0F
L095D96  PEI   $E7
         PEI   $E5
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L095DA7
         BRL   L095F0F
L095DA7  PEI   $E7
         PEI   $E5
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         JSL   L033477
         BEQ   L095DC4
         BVS   L095DBF
         EOR   #$8000
L095DBF  BPL   L095DC4
         BRL   L095F0F
L095DC4  PHY
         PHY
         PEI   $EB
         PEI   $E9
         JSL   L0772AE
         PLA
         PLX
         STX   $ED
         ORA   $ED
         BNE   L095DD9
         BRL   L095F0F
L095DD9  PEI   $EB
         PEI   $E9
         PEA   $0000
         JSL   L074A90
         PEI   $EB
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $F6
         JSL   L0999E3
         LDA   L0551DF
         BEQ   L095DFA
         BRL   L095ED3
L095DFA  LDA   L0551E1
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L0525DC,X
         PHA
         LDAL  L0525DA,X
         PLX
         CMP   L055027
         BNE   L095E14
         CPX   L055029
L095E14  BNE   L095E1B
         LDA   #$0000
         BRA   L095E1E
L095E1B  LDA   #$0001
L095E1E  PHA
         LDA   L0551E1
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0525DA
         LDX   #^L0525DA
         BCC   L095E32
         INX
L095E32  CLC
         ADC   #$0004
         BCC   L095E39
         INX
L095E39  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         CMP   L055039
         BNE   L095E4D
         CPX   L05503B
L095E4D  BNE   L095E54
         LDA   #$0000
         BRA   L095E57
L095E54  LDA   #$0001
L095E57  ORA   $01,S
         PLX
         LSR
         BCC   L095ED3
         LDA   L0551E1
         INC
         STA   L0551E1
         LDA   L0551E1
         SEC
         SBC   #$00C8
         BEQ   L095E7A
         BVS   L095E72
         EOR   #$8000
L095E72  BPL   L095E7A
         LDA   #$0001
         STA   L0551E1
L095E7A  LDA   L0551E1
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0525DA
         LDX   #^L0525DA
         BCC   L095E8D
         INX
L095E8D  TXY
         LDX   #$FF6F
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF6F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $ED
         STX   $EF
         LDA   L055027
         LDX   L055029
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
         LDX   #$FF6F
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L095EC1
         INX
L095EC1  STA   $ED
         STX   $EF
         LDA   L055039
         LDX   L05503B
         STA   [$ED]
         TXA
         LDY   #$0002
         STA   [$ED],Y
L095ED3  LDA   #$0005
         LDX   #$FF7F
         CMP   $00,X
         BNE   L095EE2
         LDA   #$0000
         BRA   L095EE5
L095EE2  LDA   #$0001
L095EE5  PHA
         LDA   L0551DF
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L095EF8
         LDA   L0551E1
         STA   L0551E3
L095EF8  LDA   $D7
         BEQ   L095F08
         LDA   L0551F9
         PHA
         JSL   L099CDB
         JSL   L09999B
L095F08  LDA   #$0001
         STA   $FC
         BRA   L095F5B
L095F0F  LDA   $D7
         BEQ   L095F1F
         PHY
         PEI   $89
         PEI   $87
         JSL   L0971E9
         PLA
         STA   $CF
L095F1F  LDA   $C3
         LDX   $C5
         STA   L055027
         STX   L055029
         LDA   $C7
         LDX   $C9
         STA   L055023
         STX   L055025
         LDA   $BF
         LDX   $C1
         STA   L055119
         STX   L05511B
         LDA   $BD
         STA   L055151
         LDA   $B9
         LDX   $BB
         STA   L05501F
         STX   L055021
         LDA   $B5
         LDX   $B7
         STA   L055115
         STX   L055117
         LDA   $B3
         STA   L05514F
L095F5B  PEI   $8D
         PEI   $8B
         PEI   $89
         PEI   $87
         JSL   L071825
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$028A
         TCS
         RTL

L095F79  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         PEA   $0017
         PEA   $0000
         JSL   L151337
         LDAL  L05565D
         BNE   L095F9F
         LDA   L0551B7
         PHA
         LDA   L0551AB
         PHA
         JSL   L1502E2
L095F9F  LDAL  L05565D
         BEQ   L095FAB
         JSL   L072314
         BRA   L095FB0
L095FAB  LDA   #$0001
         STA   $0A
L095FB0  PLY
         PLY
         PLD
         RTL

L095FB4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDA   L0551B9
         BEQ   L095FCA
         LDA   #$0001
         STA   $0A
         BRA   L096025
L095FCA  LDA   L0550B9
         DEC
         BNE   L095FD9
         PEA   $0040
         JSL   L0727E0
         BRA   L096025
L095FD9  PEA   $0022
         PEA   $0000
         JSL   L151337
         LDAL  L05565D
         BNE   L09600B
         LDA   L0551B7
         PHA
         LDA   L0551B5
         PHA
         JSL   L150665
         LDAL  L05565D
         BEQ   L09600B
         JSL   L15059E
         LDA   L0551B7
         PHA
         LDA   L0551B5
         PHA
         JSL   L150665
L09600B  LDAL  L05565D
         BEQ   L09601A
         PEA   $0041
         JSL   L0727E0
         BRA   L096025
L09601A  LDA   #$0001
         STA   L0551B9
         LDA   #$0001
         STA   $0A
L096025  PLY
         PLY
         PLD
         RTL

L096029  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L054FBB
         DEC
         STA   L054FBB
         PLY
         PLY
         PLD
         RTL

L09603C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PEI   $10
         PEI   $0E
         LDA   #$0000
         TAX
         JSL   L033477
         BEQ   L096054
         BPL   L09605A
L096054  STZ   $16
         STZ   $18
         BRA   L0960D6
L09605A  LDA   $12
         LDX   $14
         STA   $16
         STX   $18
         PEI   $14
         PEI   $12
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0960D6
         STZ   $16
         STZ   $18
         LDA   #$FFFE
         CMP   $12
         BNE   L096083
         LDA   $0E
         LDX   $10
         STA   $16
         STX   $18
L096083  LDA   #$FFFD
         CMP   $12
         BNE   L0960A4
         PEI   $10
         PEI   $0E
         PEA   $0000
         PEA   $0002
         JSL   L150290
         PLY
         PLY
         PLY
         PLY
         INC
         BNE   L0960A0
         INX
L0960A0  STA   $16
         STX   $18
L0960A4  LDA   #$FFFC
         CMP   $12
         BNE   L0960D6
         PHY
         JSL   L150705
         PLA
         STA   $01
         PHY
         JSL   L150705
         PLA
         AND   #$7FFF
         STA   $03
         PEI   $03
         PEI   $01
         PEI   $10
         PEI   $0E
         JSL   L1503B9
         PLY
         PLY
         PLY
         PLY
         INC
         BNE   L0960D2
         INX
L0960D2  STA   $16
         STX   $18
L0960D6  LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0960E8  PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         LDA   #$0001
         STA   $01
         LDA   L0551A7
         ORA   L0551A9
         BEQ   L096176
         LDA   L0551A3
         ORA   L0551A5
         BEQ   L09611B
         LDA   L05507F
         BNE   L09610C
         BRA   L09611B
L09610C  LDY   #$0004
         LDA   #$0002
         AND   [$10],Y
         CMP   #$0000
         BNE   L09611B
         BRA   L096132
L09611B  PHY
         PHY
         LDY   #$0002
         LDA   [$10],Y
         PHA
         LDA   [$10]
         PHA
         JSL   L0745B2
         PLA
         STA   L0551A3
         PLA
         STA   L0551A5
L096132  LDA   #$FFFF
         TAX
         CMP   L0551A7
         BNE   L09613E
         CPX   L0551A9
L09613E  BNE   L09615C
         LDA   L05501F
         LDX   L055021
         CMP   L0551A3
         BNE   L09614E
         CPX   L0551A5
L09614E  BNE   L096155
         LDA   #$0000
         BRA   L096158
L096155  LDA   #$0001
L096158  STA   $01
         BRA   L096176
L09615C  LDA   L0551A7
         LDX   L0551A9
         CMP   L0551A3
         BNE   L09616A
         CPX   L0551A5
L09616A  BEQ   L096171
         LDA   #$0000
         BRA   L096174
L096171  LDA   #$0001
L096174  STA   $01
L096176  LDA   $01
         STA   $14
         LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L09618C  PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0011
         TCD
         STZ   $FC
         STZ   L05507F
         PHY
         LDA   L05519B
         LDX   L05519D
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         LDY   #$0002
         LDA   [$F8],Y
         PHA
         LDA   [$F8]
         PHA
         JSL   L07AA4B
         JSL   L071C56
         PLA
         LSR
         BCC   L0961D5
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L0960E8
         PLA
         LSR
         BCC   L0961D5
         LDA   #$0001
         STA   $FC
L0961D5  LDA   $F6
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

L0961E7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0C
         LDA   L05521B
         STA   $01
         LDX   #$0000
         LDA   L0550B9
         DEC
         BNE   L096200
         INX
L096200  TXA
         AND   L055219
         BEQ   L096208
         STZ   $01
L096208  LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L096215
         INX
L096215  STA   $03
         STX   $05
         LDA   #$0020
         AND   [$03]
         BEQ   L096223
         LDA   #$0001
L096223  ORA   $01
         BEQ   L09624E
         LDA   #$0001
         STA   $0C
         LDA   L0551F3
         BNE   L09624E
         PEA   ^L053251
         PEA   L053251
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L151651
         JSL   L09B1FE
         JSL   L097700
L09624E  PLY
         PLY
         PLY
         PLD
         RTL

L096253  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC8
         TCS
         TCD
         LDA   L0551DD
         ORA   L0551DF
         PHA
         LDA   L054FBB
         PHA
         LDX   #$0000
         PLA
         BPL   L09626D
         INX
L09626D  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L096277
         BRL   L096471
L096277  STZ   $33
         LDA   #$0001
         STA   $31
L09627E  LDA   $31
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L096290
         INX
L096290  STA   $05
         STX   $07
         LDA   L055027
         LDX   L055029
         CMP   [$05]
         BNE   L0962A4
         LDY   #$0002
         TXA
         CMP   [$05],Y
L0962A4  BNE   L0962BA
         LDY   #$0006
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         CMP   L055039
         BNE   L0962B8
         CPX   L05503B
L0962B8  BEQ   L0962D8
L0962BA  LDA   [$05]
         LDY   #$0002
         ORA   [$05],Y
         BNE   L0962CB
         LDA   $33
         BNE   L0962CB
         LDA   $31
         STA   $33
L0962CB  LDA   #$0012
         CMP   $31
         BEQ   L0962D6
         INC   $31
         BRA   L09627E
L0962D6  STZ   $31
L0962D8  LDX   #$0000
         LDA   $31
         BNE   L0962E0
         INX
L0962E0  TXA
         AND   L055157
         ORA   L055133
         BNE   L0962EC
         BRL   L09646B
L0962EC  LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L0520C4
         PEA   L0520C4
         JSL   L081F1E
         LDA   $31
         BEQ   L096305
         BRL   L096400
L096305  LDA   $33
         BEQ   L09630C
         BRL   L0963FC
L09630C  PEA   ^L05236C
         PEA   L05236C
         PEA   ^L05233C
         PEA   L05233C
         PEA   $0000
         PEA   $0060
         JSL   L1511CE
         PEA   ^L05239C
         PEA   L05239C
         PEA   $0000
         PEA   $0030
         JSL   L071EC5
         LDAL  L052332
         PHA
         LDAL  L052338
         SEC
         SBC   #$0019
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L09634D
         DEX
L09634D  STA   $25
         STX   $27
         LDAL  L052330
         TAX
         LDAL  L05232E
         STA   $29
         STX   $2B
         PEI   $2B
         PEI   $29
         LDAL  L052332
         PEA   $0019
         JSL   L150BEE
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L096377
         DEX
L096377  JSL   L150F53
         STA   $2D
         STX   $2F
         PEI   $2F
         PEI   $2D
         PEI   $2B
         PEI   $29
         PEI   $27
         PEI   $25
         JSL   L1511CE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $19
         PLX
         STX   $1B
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1506A1
         PEA   ^L05232C
         PEA   L05232C
         JSL   L1506A7
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0032
         PEA   $01E0
         PEA   $004B
         JSL   L15100B
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L15123D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1506A7
         PEI   $1B
         PEI   $19
         JSL   L151131
         LDA   #$000D
         STA   $33
L0963FC  LDA   $33
         STA   $31
L096400  PEI   $31
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L09031E
         PEA   ^L05231C
         PEA   L05231C
         PEA   ^L05232C
         PEA   L05232C
         PEA   ^L052324
         PEA   L052324
         TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $31
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L096449
         INX
L096449  STA   $01
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
L09646B  STZ   L055157
         STZ   L055133
L096471  TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L096479  ENT
         PHD
         TSC
         CLC
         ADC   #$FF7A
         TCS
         TCD
         LDA   L05524D
         BEQ   L096495
         PHY
         PEI   $90
         PEI   $8E
         JSL   L0933AB
         PLA
         STA   $92
         BRL   L09684D
L096495  STZ   $5D
         STZ   $5F
         STZ   $92
         LDA   L0550B9
         DEC
         BNE   L0964A7
         JSL   L1601FC
         BRA   L0964AB
L0964A7  JSL   L0A1625
L0964AB  JSL   L096253
         LDA   L0551DF
         STA   $67
         LDA   #$0001
         STA   $69
         LDA   #$0001
         STA   $6B
         PEI   $90
         PEI   $8E
         JSL   L0982BA
         PHY
         PHY
         LDY   #$005A
         LDA   [$8E],Y
         PHA
         DEY
         DEY
         LDA   [$8E],Y
         PHA
         JSL   L07899F
         PLA
         STA   $5D
         PLX
         STX   $5F
         PHY
         PEI   $5F
         PEI   $5D
         JSL   L0988BB
         PLA
         EOR   #$0001
         STA   $6D
         STZ   $61
         LDA   $6D
         BEQ   L09651B
         LDX   #$0000
         LDA   #$0005
         CMP   L054FA1
         BNE   L0964FE
         INX
L0964FE  TXA
         BNE   L096510
         LDX   #$0000
         LDA   #$0004
         CMP   L054FA1
         BNE   L09650D
         INX
L09650D  TXA
         BEQ   L096518
L096510  PHY
         JSL   L073CDF
         PLA
         STA   $61
L096518  BRL   L09673E
L09651B  LDY   #$002C
         LDA   #$0006
         CMP   [$8E],Y
         BEQ   L096528
         BRL   L096600
L096528  LDA   [$8E]
         DEC
         BNE   L09653E
         LDY   #$0004
         LDA   [$8E],Y
         TAX
         DEY
         DEY
         LDA   [$8E],Y
         STA   $7B
         STX   $7D
         BRL   L0966D0
L09653E  LDA   [$8E]
         DEC
         DEC
         BNE   L096568
         PHY
         PHY
         LDY   #$0008
         LDA   [$8E],Y
         PHA
         DEY
         DEY
         LDA   [$8E],Y
         PHA
         LDAL  L053ACB
         PHA
         LDAL  L053AC9
         PHA
         JSL   L09603C
         PLA
         STA   $77
         PLX
         STX   $79
         BRL   L096699
L096568  LDA   #$0003
         CMP   [$8E]
         BEQ   L096572
         BRL   L096600
L096572  LDY   #$000A
         LDA   [$8E],Y
         DEC
         DEC
         BNE   L0965B2
         PHY
         PHY
         JSL   L07B114
         PLA
         PLX
         INC
         BNE   L096587
         INX
L096587  STA   $77
         STX   $79
         PEI   $79
         PEI   $77
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         JSL   L033477
         BEQ   L0965AF
         BVS   L0965A3
         EOR   #$8000
L0965A3  BPL   L0965AF
         LDA   #$0001
         LDX   #$0000
         STA   $77
         STX   $79
L0965AF  BRL   L096699
L0965B2  LDY   #$000A
         LDA   [$8E],Y
         DEC
         BNE   L0965F2
         PHY
         PHY
         JSL   L07B114
         PLA
         PLX
         SEC
         SBC   #$0001
         BCS   L0965C9
         DEX
L0965C9  STA   $77
         STX   $79
         PEI   $79
         PEI   $77
         LDA   #$0001
         LDX   #$0000
         JSL   L033477
         BVS   L0965E0
         EOR   #$8000
L0965E0  BMI   L0965EF
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         STA   $77
         STX   $79
L0965EF  BRL   L096699
L0965F2  LDY   #$000A
         LDA   [$8E],Y
         BNE   L096600
         STZ   $69
         STZ   $6B
         BRL   L09673E
L096600  LDA   L055027
         LDX   L055029
         STA   $73
         STX   $75
         LDA   L05501F
         LDX   L055021
         STA   $6F
         STX   $71
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0940E5
         LDA   #$0001
         STA   L0551DF
         PHY
         PEI   $90
         PEI   $8E
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCS   L09663A
         BRL   L09683D
L09663A  LDA   $6F
         LDX   $71
         CMP   L05501F
         BNE   L096646
         CPX   L055021
L096646  BNE   L09664D
         LDA   #$0000
         BRA   L096650
L09664D  LDA   #$0001
L096650  STA   $6B
         LDA   $73
         LDX   $75
         CMP   L055027
         BNE   L09665E
         CPX   L055029
L09665E  BNE   L096665
         LDA   #$0000
         BRA   L096668
L096665  LDA   #$0001
L096668  STA   $69
         LDA   #$0005
         CMP   [$8E]
         BEQ   L096679
         PEI   $90
         PEI   $8E
         JSL   L0940E5
L096679  PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCS   L096691
         BRL   L09683D
L096691  LDA   $67
         STA   L0551DF
         BRL   L09673E
L096699  LDA   #$0001
         LDX   #$0000
         CMP   $77
         BNE   L0966A5
         CPX   $79
L0966A5  BNE   L0966B6
         LDAL  L053ACF
         TAX
         LDAL  L053ACD
         STA   $7B
         STX   $7D
         BRA   L0966D0
L0966B6  PHY
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $79
         PEI   $77
         JSL   L07B8EA
         PLA
         STA   $7B
         PLX
         STX   $7D
L0966D0  PHY
         PHY
         PEI   $7D
         PEI   $7B
         JSL   L0772AE
         PLA
         STA   $7F
         PLX
         STX   $81
         LDA   $7F
         ORA   $81
         BNE   L0966EC
         STZ   $69
         STZ   $6B
         BRA   L09673E
L0966EC  LDA   L055027
         LDX   L055029
         CMP   $7B
         BNE   L0966F8
         CPX   $7D
L0966F8  BNE   L0966FF
         LDA   #$0000
         BRA   L096702
L0966FF  LDA   #$0001
L096702  STA   $69
         LDY   #$0002
         LDA   [$7F],Y
         TAX
         LDA   [$7F]
         CLC
         ADC   #$0020
         BCC   L096713
         INX
L096713  STA   $83
         STX   $85
         LDA   L05501F
         LDX   L055021
         CMP   [$83]
         BNE   L096727
         LDY   #$0002
         TXA
         CMP   [$83],Y
L096727  BNE   L09672E
         LDA   #$0000
         BRA   L096731
L09672E  LDA   #$0001
L096731  STA   $6B
         PEI   $7D
         PEI   $7B
         PEA   $0000
         JSL   L074A90
L09673E  LDA   $69
         BEQ   L096749
         PEA   $0007
         JSL   L0998B0
L096749  LDA   $6B
         BEQ   L096754
         PEA   $0006
         JSL   L0998B0
L096754  LDA   $6D
         BEQ   L09675F
         PEA   $0005
         JSL   L0998B0
L09675F  JSL   L0952F7
         STZ   $63
         LDA   #$0004
         CMP   $8C
         BNE   L096775
         PEA   $000E
         JSL   L0998B0
         BRA   L09679C
L096775  LDA   $8C
         SEC
         SBC   #$0005
         BVS   L096780
         EOR   #$8000
L096780  BPL   L09679C
         LDA   #$0001
         STA   $63
         PEA   $0010
         JSL   L0998B0
         LDA   #$0005
         CMP   $8C
         BNE   L09679C
         PEA   $000F
         JSL   L0998B0
L09679C  PHY
         PEI   $90
         PEI   $8E
         PEA   $0000
         JSL   L095416
         PLA
         LSR
         BCC   L0967CC
         LDA   #$0001
         STA   $92
         LDA   L055153
         AND   $69
         BEQ   L0967BC
         JSL   L09A544
L0967BC  LDA   L0550B9
         DEC
         BNE   L0967C8
         JSL   L16020A
         BRA   L0967CC
L0967C8  JSL   L0A15C0
L0967CC  LDA   $8C
         BMI   L09680A
         BEQ   L09680A
         LDA   $8C
         SEC
         SBC   #$0003
         BEQ   L0967E1
         BVS   L0967DF
         EOR   #$8000
L0967DF  BMI   L09680A
L0967E1  LDA   $8C
         DEC
         BNE   L0967ED
         PEA   $0009
         JSL   L0998B0
L0967ED  LDA   $8C
         SEC
         SBC   #$0002
         BEQ   L0967FC
         BVS   L0967FA
         EOR   #$8000
L0967FA  BMI   L096803
L0967FC  PEA   $000A
         JSL   L0998B0
L096803  PEA   $000B
         JSL   L0998B0
L09680A  LDA   $63
         BNE   L09682F
         LDA   $6D
         BEQ   L096819
         PEA   $0001
         JSL   L0998B0
L096819  LDA   $6B
         BEQ   L096824
         PEA   $0002
         JSL   L0998B0
L096824  LDA   $69
         BEQ   L09682F
         PEA   $0003
         JSL   L0998B0
L09682F  JSL   L096253
         LDA   $61
         BEQ   L09683D
         PEI   $61
         JSL   L0724F7
L09683D  LDA   $67
         STA   L0551DF
         STZ   L0550BF
         PEI   $5F
         PEI   $5D
         JSL   L07185A
L09684D  LDA   $8A
         STA   $90
         LDA   $89
         STA   $8F
         LDA   $87
         TCD
         TSC
         CLC
         ADC   #$008E
         TCS
         RTL

L09685F  PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0005
         STA   $03
         LDA   $68
         STA   $0D
         LDA   #$0006
         STA   $2F
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         JSL   L078841
         PLA
         STA   $5B
         PLX
         STX   $5D
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L096479
         PLA
         STA   $01
         LDA   $66
         STA   $68
         LDA   $65
         STA   $67
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$0066
         TCS
         RTL

L0968AD  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0001
         STA   $03
         LDA   $6E
         LDX   $70
         STA   $05
         STX   $07
         LDA   #$0006
         STA   $2F
         PHY
         PHY
         PEI   $6C
         PEI   $6A
         JSL   L078841
         PLA
         STA   $5B
         PLX
         STX   $5D
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $68
         JSL   L096479
         PLA
         STA   $01
         LDA   $66
         STA   $70
         LDA   $65
         STA   $6F
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$006E
         TCS
         RTL

L0968FC  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0002
         STA   $03
         LDA   $6E
         LDX   $70
         STA   $09
         STX   $0B
         LDA   #$0006
         STA   $2F
         PHY
         PHY
         PEI   $6C
         PEI   $6A
         JSL   L078841
         PLA
         STA   $5B
         PLX
         STX   $5D
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $68
         JSL   L096479
         PLA
         STA   $01
         LDA   $66
         STA   $70
         LDA   $65
         STA   $6F
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$006E
         TCS
         RTL

L09694B  PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0003
         STA   $03
         LDA   $6A
         STA   $0D
         LDA   #$0006
         STA   $2F
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         JSL   L078841
         PLA
         STA   $5B
         PLX
         STX   $5D
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $68
         JSL   L096479
         PLA
         STA   $01
         LDA   $66
         STA   $6A
         LDA   $65
         STA   $69
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$0068
         TCS
         RTL

L096998  ENT
         PHD
         TSC
         CLC
         ADC   #$FEDE
         TCS
         ADC   #$002B
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $F1
         LDA   L055145
         BNE   L0969B3
         BRL   L096A6D
L0969B3  LDA   L055153
         ORA   L055051
         BNE   L0969BE
         BRL   L096A6D
L0969BE  PHY
         PHY
         JSL   L150493
         PLA
         STA   $ED
         PLX
         STX   $EF
         PHY
         PHY
         JSL   L151293
         JSL   L151131
         PEA   ^L053259
         PEA   L053259
         JSL   L150FF9
         PHY
         PHY
         JSL   L1503AD
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDY   #$0002
         LDA   [$E7],Y
         TAX
         LDA   [$E7]
         CLC
         ADC   #$0008
         BCC   L0969F9
         INX
L0969F9  CLC
         ADC   #$0004
         BCC   L096A00
         INX
L096A00  STA   $F3
         STX   $F5
         LDA   [$F3]
         DEC
         DEC
         DEC
         STA   $EB
         LDA   L055051
         BEQ   L096A19
         PEA   $0260
         PEI   $EB
         JSL   L093420
L096A19  LDA   L055153
         BEQ   L096A65
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L1516A5
         PHY
         JSL   L1512E9
         PLA
         STA   $D5
         PEA   $0208
         PEI   $EB
         JSL   L1510C5
         PEA   $0002
         JSL   L1512E3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD5
         PHA
         PEA   $0025
         JSL   L073002
         JSL   L150592
         PEI   $D9
         PEI   $D7
         JSL   L1510C5
         PEI   $D5
         JSL   L1512E3
L096A65  PEI   $EF
         PEI   $ED
         JSL   L151131
L096A6D  PEI   $F1
         JSL   L071AA4
         TSC
         CLC
         ADC   #$0122
         TCS
         PLD
         RTL

L096A7B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L055199
         BNE   L096A8B
         BRL   L096B86
L096A8B  LDA   L055177
         LDX   L055179
         PHX
         PHA
         LDA   #$0003
         LDX   #$0000
         JSL   L033477
         BVS   L096AA2
         EOR   #$8000
L096AA2  BMI   L096AC8
         LDAL  L0523E4
         TAX
         LDAL  L0523E2
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
         LDA   L055177
         LDX   L055179
         INC
         BNE   L096ABF
         INX
L096ABF  STA   L055177
         STX   L055179
         BRL   L096B7C
L096AC8  LDA   L054FB7
         LDX   L054FB9
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         PEI   $07
         PEI   $05
         LDA   L05517B
         LDX   L05517D
         JSL   L033477
         BVS   L096AF1
         EOR   #$8000
L096AF1  BPL   L096B16
         LDAL  L0523D6
         TAX
         LDAL  L0523D4
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
         LDA   L055173
         LDX   L055175
         INC
         BNE   L096B0E
         INX
L096B0E  STA   L055173
         STX   L055175
         BRA   L096B7C
L096B16  LDA   L05517F
         LDX   L055181
         PHX
         PHA
         LDA   $05
         LDX   $07
         JSL   L033477
         BVS   L096B2B
         EOR   #$8000
L096B2B  BMI   L096B6F
         LDA   L05518F
         LDX   L055191
         PHX
         PHA
         LDA   L055187
         LDX   L055189
         JSL   L150F53
         STA   L05518F
         STX   L055191
         LDA   L05518B
         LDX   L05518D
         PHX
         PHA
         LDA   L055183
         LDX   L055185
         JSL   L150F53
         STA   L05518B
         STX   L05518D
         LDA   L05517F
         LDX   L055181
         INC
         BNE   L096B67
         INX
L096B67  STA   L05517F
         STX   L055181
         BRA   L096B16
L096B6F  LDA   L055191
         LDY   #$0002
         STA   [$12],Y
         LDA   L05518D
         STA   [$12]
L096B7C  PEI   $14
         PEI   $12
         JSL   L150BE8
         BRA   L096B9F
L096B86  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150801
         LDA   $01
         LDX   $03
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
L096B9F  LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L096BB1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   L05524B
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         PHY
         PEI   $12
         PEI   $03
         PEI   $01
         JSL   L150070
         PLA
         STA   $14
         LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L096BE4  PHD
         TSC
         CLC
         ADC   #$FFC0
         TCS
         TCD
         STZ   $48
         STZ   $4A
         PHY
         PHY
         JSL   L150B8E
         PLA
         STA   $39
         PLX
         STX   $3B
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $01
         STX   $03
         LDY   #$0010
         LDA   #$00FF
         AND   [$01],Y
         STA   $37
         LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L096C2B
         LDY   #$0010
         LDA   #$0080
         ORA   $37
         PHA
         PLA
         SEP   #$20
         STA   [$01],Y
         REP   #$20
L096C2B  LDA   #$0003
         STA   $05
         PHY
         PEI   $46
         JSL   L071498
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L096C41
         DEX
L096C41  STA   $07
         STX   $09
         LDA   L05522F
         BEQ   L096C51
         LDA   #$0300
         STA   $13
         BRA   L096C56
L096C51  LDA   #$0100
         STA   $13
L096C56  TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L15129F
         LDA   $15
         LDX   $17
         STA   $33
         STX   $35
         LDA   $05
         BNE   L096C8F
         PHY
         PHY
         PEA   $FFFF
         PEA   $0000
         LDA   $33
         JSL   L150488
         PHX
         PHA
         JSL   L150241
         PLA
         STA   $33
         PLX
         STX   $35
L096C8F  LDA   $33
         LDX   $35
         STA   $48
         STX   $4A
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         CLC
         ADC   #$0010
         BCC   L096CA6
         INX
L096CA6  STA   $3D
         STX   $3F
         LDA   $37
         SEP   #$20
         STA   [$3D]
         REP   #$20
         LDA   $44
         STA   $46
         LDA   $43
         STA   $45
         LDA   $41
         TCD
         TSC
         CLC
         ADC   #$0044
         TCS
         RTL

L096CC4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055199
         BEQ   L096D03
         LDA   L055173
         LDX   L055175
         PHX
         PHA
         LDA   #$0005
         LDX   #$0000
         JSL   L033477
         BVS   L096CE8
         EOR   #$8000
L096CE8  BPL   L096CEF
         LDA   #$0000
         BRA   L096CF2
L096CEF  LDA   #$0001
L096CF2  PHA
         PHY
         JSL   L07005C
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         STA   $0A
         BRA   L096D0E
L096D03  PHY
         PEA   $0000
         JSL   L15164B
         PLA
         STA   $0A
L096D0E  PLY
         PLY
         PLD
         RTL

L096D12  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$0002
         LDA   [$0A],Y
         TAX
         LDA   [$0A]
         CLC
         ADC   #$0076
         BCC   L096D29
         INX
L096D29  STA   $01
         STX   $03
         LDA   [$01]
         BEQ   L096D3B
         PEI   $0C
         PEI   $0A
         JSL   L1516E1
         BRA   L096D3B
L096D3B  LDA   $08
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

L096D4C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$0002
         LDA   [$0A],Y
         TAX
         LDA   [$0A]
         CLC
         ADC   #$0076
         BCC   L096D63
         INX
L096D63  STA   $01
         STX   $03
         LDA   [$01]
         BNE   L096D75
         PEI   $0C
         PEI   $0A
         JSL   L1516DB
         BRA   L096D75
L096D75  LDA   $08
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

L096D86  PHD
         TSC
         CLC
         ADC   #$FDDA
         TCS
         ADC   #$0135
         TCD
         LDA   $FA
         BEQ   L096D9F
         LDY   #$00D9
         LDA   [$F6],Y
         PHA
         JSL   L075A4F
L096D9F  LDA   L055281
         BNE   L096DA7
         BRL   L096E5C
L096DA7  LDX   #$0000
         LDY   #$00DB
         LDA   #$004E
         CMP   [$F6],Y
         BNE   L096DB5
         INX
L096DB5  PHX
         LDX   #$0000
         LDY   #$00DB
         LDA   #$0050
         CMP   [$F6],Y
         BNE   L096DC4
         INX
L096DC4  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L096DD2
         LDA   #$001C
         STA   $EB
         BRA   L096DD7
L096DD2  LDA   #$001B
         STA   $EB
L096DD7  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FECB
         PHA
         LDY   #$00E9
         LDA   [$F6],Y
         PHA
         DEY
         DEY
         LDA   [$F6],Y
         PHA
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFB7
         PHA
         LDY   #$00DB
         LDA   [$F6],Y
         JSL   L150488
         PHX
         PHA
         PEA   $0000
         JSL   L07334A
         PEA   $0014
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FECB
         PHA
         PEI   $EB
         JSL   L072809
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   ^L040967
         PEA   L040967
         JSL   L073C22
         PEA   $001A
         JSL   L0727E0
L096E5C  LDA   #$0001
         STA   L055257
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$022E
         TCS
         RTL

L096E74  PHD
         TSC
         CLC
         ADC   #$FFC2
         TCS
         TCD
         LDA   #$000A
         STA   $01
         LDY   #$00E1
         LDA   [$44],Y
         TAX
         DEY
         DEY
         LDA   [$44],Y
         STA   $3B
         STX   $3D
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         STA   $05
         STX   $07
         LDA   $48
         STA   $09
         STZ   $0B
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         LDY   #$00DB
         STA   [$44],Y
         LDA   $03
         LDY   #$00D9
         STA   [$44],Y
         LDA   $0F
         LDY   #$00D5
         STA   [$44],Y
         LDA   $11
         LDX   $13
         LDY   #$00D1
         STA   [$44],Y
         INY
         INY
         TXA
         STA   [$44],Y
         PHY
         PHY
         PEA   $0001
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         _ConvSeconds
         STAL  L05565D
         PLA
         STA   L055251
         PLA
         STA   L055253
         LDA   $42
         STA   $48
         LDA   $41
         STA   $47
         LDA   $3F
         TCD
         TSC
         CLC
         ADC   #$0046
         TCS
         RTL

L096F13  PHD
         TSC
         CLC
         ADC   #$FEB2
         TCS
         ADC   #$005B
         TCD
         STZ   $FC
         PEA   $0000
         LDY   #$00ED
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L077086
         LDY   #$00E1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L07185A
         LDA   #$00DF
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L096F4C
         INX
L096F4C  STA   $EF
         STX   $F1
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA5
         PHA
         LDY   #$00E9
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L072CD4
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   [$EF]
         PLA
         LDY   #$0002
         STA   [$EF],Y
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   #$00DD
         CLC
         ADC   $F8
         LDX   $FA
         BCC   L096FA1
         INX
L096FA1  STA   $EF
         STX   $F1
         PHY
         LDY   #$00E1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         PEI   $ED
         PEI   $EB
         JSL   L071330
         PLA
         STA   [$EF]
         PEI   $ED
         PEI   $EB
         JSL   L07185A
         LDY   #$00DD
         LDA   [$F8],Y
         BEQ   L096FD3
         LDA   #$0001
         STA   $FC
         BRL   L0970F9
L096FD3  LDY   #$00E1
         LDA   [$F8],Y
         PHA
         DEY
         DEY
         LDA   [$F8],Y
         PHA
         JSL   L0718BF
         LDA   #$0002
         STA   $A5
         LDY   #$00E1
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $A7
         STX   $A9
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BEQ   L09701E
         BRL   L0970F9
L09701E  LDA   #$0003
         LDY   #$00BD
         STA   [$F8],Y
         LDY   #$00BD
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L096E74
         PHY
         LDY   #$00DB
         LDA   [$F8],Y
         PHA
         JSL   L093495
         PLA
         LSR
         BCC   L097047
         BRL   L0970F9
L097047  LDY   #$00DB
         LDA   #$004E
         CMP   [$F8],Y
         BNE   L097068
         LDA   #$0001
         LDY   #$00BD
         STA   [$F8],Y
         LDY   #$00BD
         LDA   [$F8],Y
         PHA
         PEA   $0000
         PEI   $F8
         JSL   L096E74
L097068  LDY   #$00DB
         LDA   [$F8],Y
         BEQ   L097088
         PEA   $0000
         PEA   $0000
         PEI   $F8
         JSL   L096D86
         PHD
         LDA   $F8
         TCD
         CLC
         ADC   #$F6A2
         TCS
         JMPL  L0976CE

L097088  LDX   #$0000
         LDY   #$00D5
         LDA   #$0055
         CMP   [$F8],Y
         BNE   L097096
         INX
L097096  PHX
         LDY   #$00D3
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CMP   #$0001
         BNE   L0970A9
         CPX   #$0000
L0970A9  BEQ   L0970B0
         LDA   #$0000
         BRA   L0970B3
L0970B0  LDA   #$0001
L0970B3  AND   $01,S
         PLX
         LSR
         BCC   L0970EF
         LDA   #$0004
         STA   $D9
         LDA   #$000D
         STA   $DB
         LDA   #$0001
         STA   $DD
         LDY   #$00D9
         LDA   [$F8],Y
         STA   $DF
         LDA   #$8000
         STA   $E1
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         PEA   $2033
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0001
         STA   $FC
         BRA   L0970F9
L0970EF  LDY   #$00D9
         LDA   [$F8],Y
         PHA
         JSL   L075A4F
L0970F9  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0154
         TCS
         RTL

L09710B  PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0001
         STA   $6C
         LDY   #$00BD
         LDA   [$68],Y
         DEC
         BNE   L097123
         BRL   L0971D7
L097123  LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L0718BF
         LDA   #$0002
         STA   $55
         LDA   L05503F
         LDX   L055041
         STA   $5F
         STX   $61
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         STA   $57
         STX   $59
         TDC
         CLC
         ADC   #$0055
         PEA   $0000
         PHA
         PEA   $2020
         JSL   GSOS2
         STAL  L05565D
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L07191C
         LDA   #$0003
         STA   $13
         LDA   $5B
         STA   $15
         TDC
         CLC
         ADC   #$0031
         STA   $17
         STZ   $19
         LDA   #$0024
         STA   $31
         TDC
         CLC
         ADC   #$0013
         PEA   $0000
         PHA
         PEA   $202C
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0040
         AND   $1B
         BEQ   L0971D7
         LDA   #$0005
         STA   $01
         LDA   $15
         STA   $03
         STZ   $05
         TDC
         CLC
         ADC   #$005D
         STA   $07
         STZ   $09
         LDA   #$0002
         LDX   #$0000
         STA   $0B
         STX   $0D
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $202D
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0004
         AND   $5D
         BNE   L0971D7
         STZ   $6C
L0971D7  LDA   $66
         STA   $6A
         LDA   $65
         STA   $69
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$0068
         TCS
         RTL

L0971E9  ENT
         PHD
         TSC
         CLC
         ADC   #$F5B0
         TCS
         ADC   #$095D
         TCD
         STZ   $FC
         STZ   L055257
         STZ   L055259
         STZ   $EB
         STZ   $ED
         STZ   $E7
         STZ   $E9
         STZ   $E3
         STZ   $E5
         STZ   $C3
         STZ   $C5
         STZ   $DF
         STZ   $E1
         JSL   L09999B
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L0988BB
         PLA
         LSR
         BCC   L097224
         BRL   L0976C9
L097224  PHY
         PHY
         PEI   $FA
         PEI   $F8
         JSL   L070525
         PLA
         STA   $E7
         PLX
         STX   $E9
         PHY
         PEI   $FA
         PEI   $F8
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L071330
         PLA
         LSR
         BCC   L09728C
         PEI   $E9
         PEI   $E7
         JSL   L07185A
         PHY
         PHY
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $E7
         PLX
         STX   $E9
         PHY
         PHY
         LDA   L055031
         LDX   L055033
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $EB
         PLX
         STX   $ED
         PHY
         PEA   $0000
         PHD
         JSL   L096F13
         PLA
         LSR
         BCC   L097289
         BRL   L097463
L097289  BRL   L0976CE
L09728C  PEI   $ED
         PEI   $EB
         JSL   L07185A
         PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L070525
         PLA
         STA   $EB
         PLX
         STX   $ED
         PHY
         PEA   $0000
         PHD
         JSL   L096F13
         PLA
         LSR
         BCC   L0972B8
         BRL   L097463
L0972B8  PHY
         PHY
         PEA   ^L040968
         PEA   L040968
         JSL   L0B88AC
         PLA
         STA   $C3
         PLX
         STX   $C5
         PEI   $C5
         PEI   $C3
         JSL   L0718BF
         LDY   #$0002
         LDA   [$C3],Y
         TAX
         LDA   [$C3]
         STA   $BF
         STX   $C1
         TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F9A3
         PHA
         JSL   L0712B0
L0972F4  LDA   #$00FF
         LDX   #$F9A3
         AND   $00,X
         BEQ   L097352
         PEI   $ED
         PEI   $EB
         JSL   L07185A
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$F9A3
         PHA
         JSL   L0735A8
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PHY
         PEA   $0000
         PHD
         JSL   L096F13
         PLA
         LSR
         BCC   L09733A
         BRL   L097463
L09733A  TDC
         CLC
         ADC   #$00BF
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F9A3
         PHA
         JSL   L0712B0
         BRA   L0972F4
L097352  PEI   $ED
         PEI   $EB
         JSL   L07185A
         LDA   L055265
         LDX   L055267
         PHX
         PHA
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L07869F
         PEI   $E5
         PEI   $E3
         JSL   L07185A
         STZ   $E3
         STZ   $E5
         PHY
         PEA   $0000
         PHD
         JSL   L096F13
         PLA
         LSR
         BCC   L097394
         BRL   L097463
L097394  LDA   L055255
         BEQ   L09739C
         BRL   L0976CE
L09739C  PEI   $ED
         PEI   $EB
         JSL   L07185A
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L07869F
         PEA   $0000
         TDC
         CLC
         ADC   #$F9A3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$F6A3
         PHA
         PEI   $E5
         PEI   $E3
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PEI   $ED
         PEI   $EB
         PEI   $E5
         PEI   $E3
         JSL   L071825
         STZ   $EB
         STZ   $ED
         PHY
         PEA   $0006
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$F9A3
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCS   L09741F
         LDA   #$0001
         STA   L055257
         BRL   L0976CE
L09741F  PEI   $E9
         PEI   $E7
         JSL   L07185A
         PEI   $E5
         PEI   $E3
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         JSL   L07869F
         PEI   $E5
         PEI   $E3
         JSL   L07185A
         STZ   $E3
         STZ   $E5
         PHY
         PEA   $0000
         PHD
         JSL   L096F13
         PLA
         LSR
         BCS   L097463
         LDA   #$0001
         STA   L055259
         BRL   L0976CE
L097463  LDA   $DD
         BEQ   L09746A
         BRL   L0976C9
L09746A  PEA   ^L053C9D
         PEA   L053C9D
         PEA   $0000
         TDC
         CLC
         ADC   #$F7A3
         PHA
         PEA   $0000
         PEA   $0200
         JSL   L070597
         LDA   L055155
         STA   $B1
         LDA   #$0001
         STA   L055155
         PEA   $0000
         PEA   $0001
         JSL   L090000
         LDA   $B1
         STA   L055155
         JSL   L093A99
         PEA   $0000
         JSL   L07479E
         LDA   L05500F
         ORA   L055011
         BEQ   L0974B7
         PEA   $4D16
         JSL   L07272E
L0974B7  PHY
         PHY
         PEI   $E1
         PEI   $DF
         JSL   L078841
         PLA
         STA   $B3
         PLX
         STX   $B5
         LDA   L05502B
         LDX   L05502D
         CMP   $B3
         BNE   L0974D3
         CPX   $B5
L0974D3  BNE   L0974DC
         LDA   L05502F
         STA   $CF
         BRA   L097537
L0974DC  PEI   $E1
         PEI   $DF
         JSL   L0718BF
         PHY
         PEI   $BD
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$DF],Y
         PHA
         LDA   [$DF]
         PHA
         JSL   L150B64
         PLA
         STA   $CF
         LDAL  L05565D
         STA   $DB
         LDA   $DB
         BEQ   L097537
         LDX   #$0000
         LDA   #$004C
         CMP   $DB
         BEQ   L097512
         INX
L097512  PHX
         LDX   #$0000
         LDA   #$0063
         CMP   $DB
         BEQ   L09751E
         INX
L09751E  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L097535
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L096D86
         BRL   L0976CE
         BRA   L097537
L097535  STZ   $CF
L097537  PHY
         PEI   $D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FAA3
         PHA
         JSL   L076CDB
         PLA
         LSR
         BCS   L09755E
         PEI   $D9
         JSL   L075A4F
         LDA   $CF
         BEQ   L09755B
         PEI   $CF
         JSL   L150B5E
L09755B  BRL   L0976CE
L09755E  JSL   L074D35
         LDA   $D9
         STA   L055047
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L071825
         PEI   $E1
         PEI   $DF
         PEA   ^L05503F
         PEA   L05503F
         PEA   ^L055043
         PEA   L055043
         JSL   L07869F
         PEA   ^L053A9D
         PEA   L053A9D
         PEA   $0000
         TDC
         CLC
         ADC   #$FAA3
         PHA
         PEA   $0600
         JSL   L0313BE
         LDA   $CF
         STA   L05503D
         LDA   $B3
         LDX   $B5
         STA   L055039
         STX   L05503B
         LDA   L055251
         LDX   L055253
         PHX
         PHA
         JSL   L0781CF
         PHY
         PEA   $0000
         PHD
         JSL   L09710B
         PLA
         STA   L05504F
         LDA   L055051
         STA   $BB
         LDA   #$8000
         ANDL  L053AE9
         BEQ   L0975DE
         LDA   #$0001
L0975DE  ORA   L05504F
         STA   L055051
         LDA   $BB
         CMP   L055051
         BEQ   L0975EF
         JSL   L087268
L0975EF  LDA   L05503D
         BNE   L0975FC
         STZ   L05525F
         STZ   L05525D
         BRA   L097644
L0975FC  PHY
         JSL   L150B6A
         PLA
         STA   $B9
         LDA   L05503D
         PHA
         JSL   L150B70
         PHY
         PEA   $0001
         JSL   L1506E1
         PLA
         STA   $B7
         PHY
         PHY
         PEA   $801E
         JSL   L150BAC
         PLA
         PLX
         STA   L05525F
         PHY
         PHY
         PEA   $801F
         JSL   L150BAC
         PLA
         PLX
         STA   L05525D
         PHY
         PEA   $FFFF
         JSL   L1506E1
         PLA
         STA   $B7
         PEI   $B9
         JSL   L150B70
L097644  LDA   L05502B
         LDX   L05502D
         CMP   L055039
         BNE   L097652
         CPX   L05503B
L097652  BNE   L097666
         LDA   L05503D
         STA   L05502F
         LDA   L05525F
         STA   L055275
         LDA   L05525D
         STA   L055273
L097666  PHY
         PEA   ^L053C9D
         PEA   L053C9D
         PEA   $0000
         TDC
         CLC
         ADC   #$F7A3
         PHA
         PEA   $0200
         JSL   L070A10
         PLA
         LSR
         BCS   L097692
         LDA   L0550B5
         PHA
         PEA   $0000
         JSL   L090541
         LDA   #$0001
         STA   L05512F
L097692  STZ   L055135
         STZ   L055139
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   #$0001
         STA   L055133
         STZ   L055027
         STZ   L055029
         STZ   L05501F
         STZ   L055021
         STZ   L055023
         STZ   L055025
         STZ   L055005
         STZ   L055007
         STZ   L055081
         STZ   L055083
         STZ   L055243
L0976C9  LDA   #$0001
         STA   $FC
L0976CE  PEI   $E1
         PEI   $DF
         PEI   $E5
         PEI   $E3
         JSL   L071825
         PEI   $E9
         PEI   $E7
         PEI   $ED
         PEI   $EB
         JSL   L071825
         PEI   $C5
         PEI   $C3
         JSL   L07185A
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0A56
         TCS
         RTL

L097700  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1516D5
         LDA   #$0001
         STA   L0551F3
         PLY
         PLY
         PLD
         RTL

L09771E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05524B
         BEQ   L097732
         LDA   L055195
         STA   $0A
         BRA   L097748
L097732
*         PHY
*         PEA   $0000
*         PEA   $C025
*         JSL   L071A89
*         PLA
         ldal  $c025	; AV 202208
         AND   #$0040
         BEQ   L097746
         LDA   #$0001
L097746  STA   $0A
L097748  PLY
         PLY
         PLD
         RTL

L09774C  PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         STZ   $26
         LDY   #$00BF
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $05
         STX   $07
         LDY   #$00B3
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CMP   [$05]
         BNE   L09779C
         LDY   #$0002
         TXA
         CMP   [$05],Y
L09779C  BEQ   L0977A1
         BRL   L097985
L0977A1  LDY   #$0010
         LDA   [$05],Y
         LDY   #$0010
         CMP   [$01],Y
         BEQ   L0977B0
         BRL   L097985
L0977B0  LDY   #$0012
         LDA   [$05],Y
         LDY   #$0012
         CMP   [$01],Y
         BEQ   L0977BF
         BRL   L097985
L0977BF  LDY   #$0024
         LDA   [$05],Y
         LDY   #$0024
         CMP   [$01],Y
         BEQ   L0977CE
         BRL   L097985
L0977CE  LDY   #$002A
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         LDY   #$002A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L0977EC
         BRL   L097985
L0977EC  LDY   #$002C
         LDA   [$05],Y
         LDY   #$002C
         CMP   [$01],Y
         BEQ   L0977FB
         BRL   L097985
L0977FB  LDY   #$0030
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         JSL   L033477
         BEQ   L097819
         BRL   L097985
L097819  LDA   $01
         LDX   $03
         CLC
         ADC   #$0032
         BCC   L097824
         INX
L097824  STA   $15
         STX   $17
         LDA   $05
         LDX   $07
         CLC
         ADC   #$0032
         BCC   L097833
         INX
L097833  STA   $11
         STX   $13
         PHY
         PHY
         LDY   #$00B3
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         JSL   L07DF0D
         PLA
         PLX
         SEC
         SBC   #$0032
         BCS   L097851
         DEX
L097851  STA   $0D
         STX   $0F
         PHY
         PEI   $17
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0D
         JSL   L070A10
         PLA
         LSR
         BCS   L09786B
         BRL   L097985
L09786B  LDY   #$00B3
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$000C
         BCC   L097888
         INX
L097888  STA   $19
         STX   $1B
         LDA   [$19]
         LDY   #$0002
         ORA   [$19],Y
         BNE   L0978CC
         LDY   #$00BF
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y

*

         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$000C
         BCC   L0978B2
         INX
L0978B2  STA   $19
         STX   $1B
         LDA   [$19]
         LDY   #$0002
         ORA   [$19],Y
         BEQ   L0978C4
         LDA   #$0000
         BRA   L0978C7
L0978C4  LDA   #$0001
L0978C7  STA   $26
         BRL   L097985
L0978CC  PHY
         PHY
         LDY   #$000E
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         PEA   $0000
         JSL   L077264
         PLA
         STA   $09
         PLX
         STX   $0B
         LDA   $09
         ORA   $0B
         BNE   L0978EF
         BRL   L097985
L0978EF  LDY   #$00A7
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$000C
         BCC   L09790C
         INX
L09790C  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$000C
         BCC   L09791F
         INX
L09791F  STA   $11
         STX   $13
         PHY
         PHY
         LDY   #$00A7
         LDA   [$22],Y
         PHA
         DEY
         DEY
         LDA   [$22],Y
         PHA
         JSL   L07DF0D
         PLA
         PLX
         SEC
         SBC   #$000C
         BCS   L09793D
         DEX
L09793D  STA   $0D
         STX   $0F
         PHY
         PEI   $17
         PEI   $15
         PEI   $13
         PEI   $11
         PEI   $0D
         JSL   L070A10
         PLA
         STA   $26
         LDY   #$00BF
         LDA   [$22],Y
         TAX
         DEY
         DEY
         LDA   [$22],Y
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         CLC
         ADC   #$000C
         BCC   L097970
         INX
L097970  STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         PEA   $0000
         JSL   L074A5A
L097985  LDA   $20
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

L097997  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0010
         JSL   L0727E0
         PHD
         LDA   $0A
         TCD
         CLC
         ADC   #$0000
         TCS
         JMPL  L0981D6

         LDA   $08
         STA   $0E
         LDA   $07
         STA   $0D
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0979C5  ENT
         PHD
         TSC
         CLC
         ADC   #$FF20
         TCS
         TCD
         LDA   L055051
         BEQ   L0979D9
         JSL   L0903A6
         BRL   L0981FB
L0979D9  LDA   #$0001
         STA   L055003
         STZ   $97
         STZ   $C9
         STZ   $CB
         STZ   $BD
         STZ   $BF
         PHY
         PHY
         PEA   $1604
         JSL   L150B1C
         PLA
         STA   $A1
         PLX
         STX   $A3
         LDAL  L05565D
         BEQ   L097A01
         LDA   #$0001
L097A01  PHA
         LDX   #$0000
         LDA   $A3
         BMI   L097A0D
         ORA   $A1
         BNE   L097A0E
L097A0D  INX
L097A0E  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L097A20
         PEA   $000A
         PEA   $0000
         PHD
         JSL   L097997
L097A20  PHY
         PHY
         PEA   $1604
         JSL   L1516BD
         PLA
         STA   $C5
         PLX
         STX   $C7
         LDAL  L05565D
         BEQ   L097A38
         LDA   #$0001
L097A38  PHA
         LDX   #$0000
         LDA   $C5
         ORA   $C7
         BNE   L097A43
         INX
L097A43  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L097A55
         PEA   $0014
         PEA   $0000
         PHD
         JSL   L097997
L097A55  PHY
         PEI   $C7
         PEI   $C5
         JSL   L079558
         PLA
         LSR
         BCC   L097A6D
         PEA   $001E
         PEA   $0000
         PHD
         JSL   L097997
L097A6D  PHY
         PHY
         PEI   $A3
         PEI   $A1
         PEA   $4452
         PEA   $4143
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         CLC
         ADC   #$0008
         BCC   L097A88
         INX
L097A88  STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         PHX
         PHA
         JSL   L07502A
         PLA
         STA   $CD
         PLX
         STX   $CF
         LDA   $CD
         ORA   $CF
         BNE   L097AB1
         PEA   $0028
         PEA   $0000
         PHD
         JSL   L097997
L097AB1  PHY
         PHY
         PEI   $CF
         PEI   $CD
         JSL   L0772AE
         PLA
         STA   $C9
         PLX
         STX   $CB
         LDA   $C9
         ORA   $CB
         BNE   L097AD2
         PEA   $0032
         PEA   $0000
         PHD
         JSL   L097997
L097AD2  PHY
         PHY
         PEA   $1606
         JSL   L150B1C
         PLA
         STA   $9D
         PLX
         STX   $9F
         LDAL  L05565D
         BEQ   L097AEA
         LDA   #$0001
L097AEA  PHA
         LDX   #$0000
         LDA   $9D
         ORA   $9F
         BNE   L097AF5
         INX
L097AF5  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L097B07
         PEA   $003C
         PEA   $0000
         PHD
         JSL   L097997
L097B07  PHY
         PHY
         PEA   $1606
         JSL   L1516BD
         PLA
         STA   $B1
         PLX
         STX   $B3
         LDAL  L05565D
         BEQ   L097B1F
         LDA   #$0001
L097B1F  PHA
         LDX   #$0000
         LDA   $B1
         ORA   $B3
         BNE   L097B2A
         INX
L097B2A  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L097B3C
         PEA   $0046
         PEA   $0000
         PHD
         JSL   L097997
L097B3C  PHY
         PEI   $B3
         PEI   $B1
         JSL   L07947E
         PLA
         LSR
         BCC   L097B54
         PEA   $0050
         PEA   $0000
         PHD
         JSL   L097997
L097B54  PHY
         PHY
         PEA   $1607
         JSL   L150B1C
         PLA
         STA   $99
         PLX
         STX   $9B
         LDX   #$0000
         LDAL  L05565D
         BNE   L097B6D
         INX
L097B6D  PHX
         LDX   #$0000
         LDA   $9B
         BMI   L097B7A
         ORA   $99
         BEQ   L097B7A
         INX
L097B7A  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L097BE8
         PHY
         PHY
         PEA   $1607
         JSL   L1516BD
         PLA
         STA   $A5
         PLX
         STX   $A7
         LDAL  L05565D
         BEQ   L097B99
         LDA   #$0001
L097B99  PHA
         LDX   #$0000
         LDA   $A5
         ORA   $A7
         BNE   L097BA4
         INX
L097BA4  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L097BB6
         PEA   $005A
         PEA   $0000
         PHD
         JSL   L097997
L097BB6  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         CLC
         ADC   #$0004
         BCC   L097BC5
         INX
L097BC5  STA   $DD
         STX   $DF
         LDA   #$4D42
         LDX   #$5041
         CMP   [$DD]
         BNE   L097BD9
         LDY   #$0002
         TXA
         CMP   [$DD],Y
L097BD9  BEQ   L097BE6
         PEA   $005F
         PEA   $0000
         PHD
         JSL   L097997
L097BE6  BRA   L097BEC
L097BE8  STZ   $99
         STZ   $9B
L097BEC  LDA   L05501F
         LDX   L055021
         STA   $D9
         STX   $DB
         STZ   $C1
         STZ   $C3
L097BFA  PHY
         PHY
         PEI   $DB
         PEI   $D9
         JSL   L07721A
         PLA
         STA   $BD
         PLX
         STX   $BF
         LDA   $BD
         ORA   $BF
         BNE   L097C1B
         PEA   $0064
         PEA   $0000
         PHD
         JSL   L097997
L097C1B  PHY
         PEA   $0000
         PHD
         JSL   L09774C
         PLA
         LSR
         BCC   L097C30
         LDA   $D9
         LDX   $DB
         STA   $C1
         STX   $C3
L097C30  LDY   #$0002
         LDA   [$BD],Y
         TAX
         LDA   [$BD]
         CLC
         ADC   #$0018
         BCC   L097C3F
         INX
L097C3F  STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         STA   $D5
         STX   $D7
         PEI   $DB
         PEI   $D9
         PEA   $0000
         JSL   L074A24
         STZ   $BD
         STZ   $BF
         LDA   $D5
         LDX   $D7
         STA   $D9
         STX   $DB
         LDA   $C1
         ORA   $C3
         BEQ   L097C6F
         LDA   #$0001
L097C6F  PHA
         LDA   L05501F
         LDX   L055021
         CMP   $D9
         BNE   L097C7C
         CPX   $DB
L097C7C  BEQ   L097C83
         LDA   #$0000
         BRA   L097C86
L097C83  LDA   #$0001
L097C86  ORA   $01,S
         PLX
         LSR
         BCS   L097C8F
         BRL   L097BFA
L097C8F  LDA   $C1
         ORA   $C3
         BEQ   L097C98
         BRL   L097F17
L097C98  PHY
         PHY
         PEI   $9F
         PEI   $9D
         PEA   $4447
         PEA   $4B42
         LDY   #$0002
         LDA   [$B1],Y
         TAX
         LDA   [$B1]
         CLC
         ADC   #$0008
         BCC   L097CB3
         INX
L097CB3  STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         PHX
         PHA
         JSL   L07502A
         PLA
         STA   $C1
         PLX
         STX   $C3
         LDA   $C1
         ORA   $C3
         BNE   L097CDC
         PEA   $006E
         PEA   $0000
         PHD
         JSL   L097997
L097CDC  PHY
         PHY
         PEI   $C3
         PEI   $C1
         JSL   L07721A
         PLA
         STA   $BD
         PLX
         STX   $BF
         LDA   $BD
         ORA   $BF
         BNE   L097CFD
         PEA   $0078
         PEA   $0000
         PHD
         JSL   L097997
L097CFD  STZ   $AD
         STZ   $AF
         PEI   $9B
         PEI   $99
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L097D12
         BRL   L097DA6
L097D12  BNE   L097D17
         BRL   L097DA6
L097D17  PHY
         PHY
         PEI   $9B
         PEI   $99
         PEA   $5041
         PEA   $4D42
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $AD
         PLX
         STX   $AF
         LDA   $AD
         ORA   $AF
         BNE   L097D44
         PEA   $0082
         PEA   $0000
         PHD
         JSL   L097997
L097D44  PHY
         PHY
         PEI   $AF
         PEI   $AD
         PEA   $0000
         JSL   L077264
         PLA
         STA   $A9
         PLX
         STX   $AB
         LDA   $A9
         ORA   $AB
         BNE   L097D68
         PEA   $008C
         PEA   $0000
         PHD
         JSL   L097997
L097D68  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         CLC
         ADC   #$000C
         BCC   L097D77
         INX
L097D77  PHX
         PHA
         LDY   #$0002
         LDA   [$A9],Y
         TAX
         LDA   [$A9]
         CLC
         ADC   #$000C
         BCC   L097D88
         INX
L097D88  PHX
         PHA
         LDA   $99
         LDX   $9B
         SEC
         SBC   #$000C
         BCS   L097D95
         DEX
L097D95  PHX
         PHA
         JSL   L070597
         PEI   $AF
         PEI   $AD
         PEA   $0001
         JSL   L074A5A
L097DA6  LDA   L05501F
         LDX   L055021
         STA   $D1
         STX   $D3
         PHY
         PHY
         PEI   $D3
         PEI   $D1
         JSL   L07721A
         PLA
         STA   $B5
         PLX
         STX   $B7
         LDA   $B5
         ORA   $B7
         BNE   L097DD1
         PEA   $0096
         PEA   $0000
         PHD
         JSL   L097997
L097DD1  LDY   #$0002
         LDA   [$B5],Y
         TAX
         LDA   [$B5]
         CLC
         ADC   #$0018
         BCC   L097DE0
         INX
L097DE0  STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         STA   $D5
         STX   $D7
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L07721A
         PLA
         STA   $B9
         PLX
         STX   $BB
         LDA   $B9
         ORA   $BB
         BNE   L097E1C
         PEI   $D3
         PEI   $D1
         PEA   $0000
         JSL   L074A24
         PEA   $00A0
         PEA   $0000
         PHD
         JSL   L097997
L097E1C  LDY   #$0002
         LDA   [$B5],Y
         TAX
         LDA   [$B5]
         CLC
         ADC   #$0018
         BCC   L097E2B
         INX
L097E2B  STA   $DD
         STX   $DF
         LDA   $C1
         LDX   $C3
         STA   [$DD]
         TXA
         LDY   #$0002
         STA   [$DD],Y
         LDY   #$0002
         LDA   [$B9],Y
         TAX
         LDA   [$B9]
         CLC
         ADC   #$001C
         BCC   L097E4A
         INX
L097E4A  STA   $DD
         STX   $DF
         LDA   $C1
         LDX   $C3
         STA   [$DD]
         TXA
         LDY   #$0002
         STA   [$DD],Y
         PEI   $D3
         PEI   $D1
         PEA   $0001
         JSL   L074A24
         PEI   $D7
         PEI   $D5
         PEA   $0001
         JSL   L074A24
         LDAL  L053AC3
         TAX
         LDAL  L053AC1
         INC
         BNE   L097E7D
         INX
L097E7D  STAL  L053AC1
         TXA
         STAL  L053AC3
         LDA   #$0001
         STA   L05504D
         LDA   #$0001
         STA   $97
         LDY   #$0002
         LDA   [$B1],Y
         TAX
         LDA   [$B1]
         CLC
         ADC   #$0010
         BCC   L097EA0
         INX
L097EA0  PHX
         PHA
         LDY   #$0002
         LDA   [$BD],Y
         TAX
         LDA   [$BD]
         CLC
         ADC   #$0010
         BCC   L097EB1
         INX
L097EB1  PHX
         PHA
         LDA   $9D
         LDX   $9F
         SEC
         SBC   #$0010
         BCS   L097EBE
         DEX
L097EBE  PHX
         PHA
         JSL   L070597
         LDY   #$0002
         LDA   [$BD],Y
         TAX
         LDA   [$BD]
         STA   $09
         STX   $0B
         LDA   $AD
         LDX   $AF
         LDY   #$000C
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         LDA   #$0000
         TAX
         LDY   #$0014
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         LDA   $D5
         LDX   $D7
         LDY   #$0018
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         LDA   $D1
         LDX   $D3
         LDY   #$001C
         STA   [$09],Y
         INY
         INY
         TXA
         STA   [$09],Y
         PEI   $C3
         PEI   $C1
         PEA   $0001
         JSL   L074A24
         STZ   $BD
         STZ   $BF
L097F17  STZ   $AD
         STZ   $AF
         PHY
         PHY
         PEA   $1605
         JSL   L150B1C
         PLA
         STA   $99
         PLX
         STX   $9B
         LDX   #$0000
         LDAL  L05565D
         BNE   L097F34
         INX
L097F34  PHX
         LDX   #$0000
         LDA   $9B
         BMI   L097F41
         ORA   $99
         BEQ   L097F41
         INX
L097F41  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L097F4B
         BRL   L09802A
L097F4B  PHY
         PHY
         PEA   $1605
         JSL   L1516BD
         PLA
         STA   $A5
         PLX
         STX   $A7
         LDAL  L05565D
         BEQ   L097F6B
         PEA   $00AA
         PEA   $0000
         PHD
         JSL   L097997
L097F6B  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         CLC
         ADC   #$0004
         BCC   L097F7A
         INX
L097F7A  STA   $DD
         STX   $DF
         LDA   #$4D42
         LDX   #$5041
         CMP   [$DD]
         BNE   L097F8E
         LDY   #$0002
         TXA
         CMP   [$DD],Y
L097F8E  BEQ   L097F9B
         PEA   $00B4
         PEA   $0000
         PHD
         JSL   L097997
L097F9B  PHY
         PHY
         PEI   $9B
         PEI   $99
         PEA   $5041
         PEA   $4D42
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $AD
         PLX
         STX   $AF
         LDA   $AD
         ORA   $AF
         BNE   L097FC8
         PEA   $00BE
         PEA   $0000
         PHD
         JSL   L097997
L097FC8  PHY
         PHY
         PEI   $AF
         PEI   $AD
         PEA   $0000
         JSL   L077264
         PLA
         STA   $A9
         PLX
         STX   $AB
         LDA   $A9
         ORA   $AB
         BNE   L097FEC
         PEA   $00C8
         PEA   $0000
         PHD
         JSL   L097997
L097FEC  LDY   #$0002
         LDA   [$A5],Y
         TAX
         LDA   [$A5]
         CLC
         ADC   #$000C
         BCC   L097FFB
         INX
L097FFB  PHX
         PHA
         LDY   #$0002
         LDA   [$A9],Y
         TAX
         LDA   [$A9]
         CLC
         ADC   #$000C
         BCC   L09800C
         INX
L09800C  PHX
         PHA
         LDA   $99
         LDX   $9B
         SEC
         SBC   #$000C
         BCS   L098019
         DEX
L098019  PHX
         PHA
         JSL   L070597
         PEI   $AF
         PEI   $AD
         PEA   $0001
         JSL   L074A5A
L09802A  TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         LDA   $CD
         LDX   $CF
         STA   $0F
         STX   $11
         PHY
         PHY
         JSL   L07B114
         PLA
         STA   $93
         PLX
         STX   $95
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $95
         PEI   $93
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L09807C
         PEA   $00D2
         PEA   $0000
         PHD
         JSL   L097997
L09807C  LDA   $93
         LDX   $95
         INC
         BNE   L098084
         INX
L098084  STA   $93
         STX   $95
         LDY   #$0002
         LDA   [$C5],Y
         TAX
         LDA   [$C5]
         CLC
         ADC   #$0010
         BCC   L098097
         INX
L098097  PHX
         PHA
         LDY   #$0002
         LDA   [$C9],Y
         TAX
         LDA   [$C9]
         CLC
         ADC   #$0010
         BCC   L0980A8
         INX
L0980A8  PHX
         PHA
         LDA   $A1
         LDX   $A3
         SEC
         SBC   #$0010
         BCS   L0980B5
         DEX
L0980B5  PHX
         PHA
         JSL   L070597
         LDY   #$0002
         LDA   [$C9],Y
         TAX
         LDA   [$C9]
         STA   $05
         STX   $07
         LDA   $AD
         LDX   $AF
         LDY   #$000C
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   $C1
         LDX   $C3
         LDY   #$0020
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0000
         TAX
         LDY   #$0014
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   #$0000
         TAX
         LDY   #$0018
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         LDA   L055005
         LDX   L055007
         LDY   #$001C
         STA   [$05],Y
         INY
         INY
         TXA
         STA   [$05],Y
         PEI   $CF
         PEI   $CD
         PEA   $0001
         JSL   L074A90
         STZ   $C9
         STZ   $CB
         STZ   L055003
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         INC
         BNE   L09812E
         INX
L09812E  STAL  L053AC9
         TXA
         STAL  L053ACB
         LDA   #$0001
         STA   L05504D
         PHY
         PHY
         PEI   $C3
         PEI   $C1
         JSL   L07721A
         PLA
         STA   $BD
         PLX
         STX   $BF
         LDA   $BD
         ORA   $BF
         BEQ   L098186
         LDY   #$0002
         LDA   [$BD],Y
         TAX
         LDA   [$BD]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         INC
         BNE   L09816D
         INX
L09816D  LDY   #$0014
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         PEI   $C3
         PEI   $C1
         PEA   $0001
         JSL   L074A24
         STZ   $BD
         STZ   $BF
L098186  LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         PEI   $95
         PEI   $93
         PEA   $0001
         JSL   L07E171
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   $93
         LDX   $95
         INC
         BNE   L0981AD
         INX
L0981AD  PHX
         PHA
         PEA   $0001
         JSL   L07E171
         LDA   $97
         BEQ   L0981C1
         LDA   #$0002
         STA   $0D
         BRA   L0981C6
L0981C1  LDA   #$0003
         STA   $0D
L0981C6  PEI   $CF
         PEI   $CD
         PEA   $0000
         PEA   $0000
         PEI   $0D
         JSL   L0968AD
L0981D6  LDA   $BD
         ORA   $BF
         BEQ   L0981E7
         PEI   $C3
         PEI   $C1
         PEA   $0001
         JSL   L074A24
L0981E7  LDA   $C9
         ORA   $CB
         BEQ   L0981F8
         PEI   $CF
         PEI   $CD
         PEA   $0001
         JSL   L074A90
L0981F8  STZ   L055003
L0981FB  TSC
         CLC
         ADC   #$00E0
         TCS
         PLD
         RTL

L098203  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   $18
         LDX   $1A
         STA   $03
         STX   $05
         LDA   $16
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L098222
         EOR   #$8000
L098222  BPL   L09826D
         LDA   #$0001
         STA   $07
L098229  LDY   #$0006
         LDA   [$03],Y
         PHA
         DEY
         DEY
         LDA   [$03],Y
         PHA
         LDY   #$000C
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         JSL   L033477
         BNE   L098254
         LDA   L055039
         LDX   L05503B
         LDY   #$0004
         STA   [$03],Y
         INY
         INY
         TXA
         STA   [$03],Y
L098254  LDA   $03
         LDX   $05
         CLC
         ADC   #$0008
         BCC   L09825F
         INX
L09825F  STA   $03
         STX   $05
         LDA   $07
         CMP   $01
         BEQ   L09826D
         INC   $07
         BRA   L098229
L09826D  LDA   $10
         STA   $1A
         LDA   $0F
         STA   $19
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L09827F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L0525DA
         PEA   L0525DA
         PEA   $00C8
         PEA   $0000
         PHD
         JSL   L098203
         PEA   ^L05233C
         PEA   L05233C
         PEA   $0012
         PEA   $0000
         PHD
         JSL   L098203
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

L0982BA  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0005
         CMP   [$0E]
         BEQ   L0982CC
         BRL   L098376
L0982CC  LDY   #$000A
         LDA   [$0E],Y
         DEC
         DEC
         BNE   L0982DC
         LDA   #$0001
         STA   $03
         BRA   L0982EE
L0982DC  LDY   #$000A
         LDA   [$0E],Y
         DEC
         BNE   L0982EB
         LDA   #$FFFF
         STA   $03
         BRA   L0982EE
L0982EB  BRL   L098376
L0982EE  LDA   L0551E3
         STA   $01
L0982F3  LDA   $03
         CLC
         ADC   $01
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L098305
         EOR   #$8000
L098305  BMI   L09830C
         LDA   #$00C8
         STA   $01
L09830C  LDA   $01
         SEC
         SBC   #$00C8
         BEQ   L098320
         BVS   L098319
         EOR   #$8000
L098319  BPL   L098320
         LDA   #$0001
         STA   $01
L098320  LDA   $01
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L0525DA,X
         ORAL  L0525DC,X
         BEQ   L098334
         LDA   #$0001
L098334  PHA
         LDX   #$0000
         LDA   L0551E3
         CMP   $01
         BNE   L098340
         INX
L098340  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0982F3
         LDA   $01
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L0525DA
         LDX   #^L0525DA
         BCC   L098359
         INX
L098359  CLC
         ADC   #$0004
         BCC   L098360
         INX
L098360  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         LDY   #$0058
         STA   [$0E],Y
         INY
         INY
         TXA
         STA   [$0E],Y
L098376  LDA   $0C
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

L098388  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2C
         SEC
         SBC   #$0001
         BVS   L09839B
         EOR   #$8000
L09839B  BPL   L0983A2
         LDA   #$0000
         BRA   L0983A5
L0983A2  LDA   #$0001
L0983A5  PHA
         LDA   $2C
         SEC
         SBC   #$0020
         BEQ   L0983B5
         BVS   L0983B3
         EOR   #$8000
L0983B3  BMI   L0983BA
L0983B5  LDA   #$0000
         BRA   L0983BD
L0983BA  LDA   #$0001
L0983BD  ORA   $01,S
         PLX
         LSR
         BCC   L0983C6
         BRL   L09857D
L0983C6  PHY
         PHY
         JSL   L150493
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDY   #$001A
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   $05
         STX   $07
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$0002
         BCC   L0983FB
         INX
L0983FB  STA   $01
         STX   $03
         LDY   #$002C
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L098410
         INX
L098410  STA   $1D
         STX   $1F
         LDA   [$1D]
         LDY   #$0002
         STA   [$01],Y
         LDY   #$002C
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   [$1D]
         STA   [$01]
         LDY   #$0002
         LDA   #$006F
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   #$004F
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDA   $09
         LDX   $0B
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
         LDA   $2C
         DEC
         PHA
         PEA   $0008
         JSL   L150318
         PLX
         PLX
         STA   $11
         LDA   $2C
         DEC
         PHA
         PEA   $0008
         JSL   L1500F5
         PLX
         PLX
         STA   $13
         LDY   #$002C
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L098483
         INX
L098483  STA   $1D
         STX   $1F
         LDA   $13
         PEA   $001C
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $17
         LDY   #$002C
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   $11
         PEA   $000A
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $15
         LDA   #$001C
         CLC
         ADC   $17
         DEC
         DEC
         STA   $1B
         LDA   #$000A
         CLC
         ADC   $15
         DEC
         STA   $19
         LDA   $2A
         BEQ   L098501
         JSL   L1510A1
         PEA   $8002
         JSL   L150BD6
         PEA   $0004
         PEA   $0002
         JSL   L151083
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151418
         BRA   L098567
L098501  JSL   L1510A1
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $FFFA
         PEA   $FFFD
         JSL   L151005
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $0000
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $FFFF
         JSL   L081DD8
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151418
L098567  PEI   $0B
         PEI   $09
         JSL   L151669
         LDA   $05
         LDX   $07
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
L09857D  LDA   $24
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

L09858F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $19
         LDA   $32
         BPL   L0985A6
         BRL   L098724
L0985A6  CMP   #$0006
         BMI   L0985AE
         BRL   L098724
L0985AE  ASL
         TAX
         LDAL  L0985B6,X
         PHA
         RTS

L0985B6  DA    L0985C2-1
         DA    L098610-1
         DA    L0986A0-1
         DA    L0986CC-1
         DA    L0986D0-1
         DA    L09871A-1

L0985C2  LDA   L05512F
         BEQ   L0985CB
         JSL   L083A3C
L0985CB  PHY
         PHY
         JSL   L150493
         PLA
         STA   $15
         PLX
         STX   $17
         PEA   ^L0531D9
         PEA   L0531D9
         PEI   $17
         PEI   $15
         PEA   ^L0531E1
         PEA   L0531E1
         PEI   $2C
         PEI   $2A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0550B5
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L098388
         STZ   L055165
         STZ   L05516B
         BRL   L098724
L098610  STZ   $34
         LDA   $28
         STA   $0B
         LDA   $26
         STA   $09
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $2C
         PEI   $2A
         JSL   L1512CB
         PLA
         LSR
         BCC   L09868E
         LDA   $09
         SEC
         SBC   [$2A]
         PHA
         PEA   $000A
         JSL   L1500F5
         PLX
         PLX
         STA   $0F
         LDA   $0B
         LDY   #$0002
         SEC
         SBC   [$2A],Y
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         LDA   $0F
         INC
         PHA
         LDA   $11
         ASL
         ASL
         ASL
         STA   $1B
         PLA
         CLC
         ADC   $1B
         ORA   #$8000
         STA   $34
         LDA   L05516B
         BEQ   L09868C
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L098388
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L098388
L09868C  BRA   L09869D
L09868E  PEI   $2C
         PEI   $2A
         PEI   $0B
         PEI   $09
         PEA   $044C
         JSL   L09A984
L09869D  BRL   L098724
L0986A0  LDY   #$0002
         LDA   [$2E],Y
         TAX
         LDA   [$2E]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         BNE   L0986BB
         LDA   #$0073
         LDY   #$0002
         STA   [$01],Y
L0986BB  LDY   #$0004
         LDA   [$01],Y
         BNE   L0986CA
         LDA   #$0051
         LDY   #$0004
         STA   [$01],Y
L0986CA  BRA   L098724
L0986CC  STZ   $34
         BRA   L098724
L0986D0  LDA   #$7FFF
         AND   $24
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         ORA   L055165
         PHA
         PEA   $0000
         PHD
         JSL   L098388
         LDX   #$0000
         LDA   $24
         BPL   L0986F3
         INX
L0986F3  TXA
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         STA   $1B
         PLA
         AND   $1B
         STA   L055165
         LDA   L055165
         BEQ   L098715
         LDA   #$7FFF
         AND   $24
         STA   L05516B
         BRA   L098724	; WAS L098718
L098715  STZ   L05516B
         BRA   L098724
L09871A  LDA   #$044C
         CLC
         ADC   $24
         STA   $34
         BRA   L098724
L098724  PEI   $19
         JSL   L071AA4
         LDA   $22
         STA   $32
         LDA   $21
         STA   $31
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L09873C  ENT
         PHD
         TSC
         CLC
         ADC   #$FDF0
         TCS
         ADC   #$011D
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         JSL   L090A71
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE3
         PHA
         JSL   L094153
         JSL   L150434
         PLA
         LSR
         BCC   L0987E1
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE3
         PHA
         JSL   L071F3F
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         LDX   $E9
         STA   $E3
         STX   $E5
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L071B83
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $E3
         LDA   $E7
         LDX   $E9
         JSL   L1512A5
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L151651
         JSL   L09B1FE
L0987E1  LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L0987EE
         INX
L0987EE  STA   $EF
         STX   $F1
         LDA   #$0020
         AND   [$EF]
         BNE   L098805
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09A5A7
L098805  STZ   L0551F1
         PEI   $ED
         PEI   $EB
         JSL   L151131
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0216
         TCS
         RTL

L098822  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         PEA   $000F
         LDA   L05515D
         LDX   L05515F
         PHX
         PHA
         JSL   L1510E3
         PEA   $0000
         PEA   $0006
         LDA   L054FAD
         LDX   L054FAF
         PHX
         PHA
         JSL   L1510E3
         PLY
         PLY
         PLD
         RTL

L098852  ENT
         PHD
         TSC
         CLC
         ADC   #$FF9E
         TCS
         TCD
         LDA   #$0002
         STA   $01
         LDA   L055279
         LDX   L05527B
         STA   $07
         STX   $09
         LDA   #$0006
         STA   $2D
         LDA   L05502B
         LDX   L05502D
         STA   $59
         STX   $5B
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $68
         JSL   L096479
         PLA
         LSR
         BCS   L0988A9
         LDA   #$0001
         LDX   #$0000
         STA   $07
         STX   $09
         PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $68
         JSL   L096479
         PLA
         STA   $5D
L0988A9  LDA   $66
         STA   $68
         LDA   $65
         STA   $67
         LDA   $63
         TCD
         TSC
         CLC
         ADC   #$0066
         TCS
         RTL

L0988BB  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE0
         TCS
         ADC   #$002D
         TCD
         LDA   #$0001
         STA   $FC
         LDA   $F8
         ORA   $FA
         BNE   L0988D4
         BRL   L098A65
L0988D4  PHY
         PEI   $FA
         PEI   $F8
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L071330
         PLA
         LSR
         BCC   L098922
         PHY
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         LDA   L055035
         LDX   L055037
         PHX
         PHA
         JSL   L071330
         PLA
         BEQ   L09891D
         PHA
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055031
         LDX   L055033
         PHX
         PHA
         JSL   L071330
         PLA
         STA   $EF
         PLA
         AND   $EF
L09891D  STA   $FC
         BRL   L098A65
L098922  STZ   $EB
         STZ   $ED
         STZ   $DB
         STZ   $DD
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L07869F
         PHY
         PEI   $E1
         PEI   $DF
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L071330
         PLA
         LSR
         BCS   L09895C
         BRL   L098A43
L09895C  LDA   $E3
         ORA   $E5
         BNE   L098965
         BRL   L098A45
L098965  PHY
         PHY
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072B9F
         PLA
         STA   $DB
         PLX
         STX   $DD
         PHY
         PEI   $FA
         PEI   $F8
         PEI   $DD
         PEI   $DB
         JSL   L071330
         PLA
         LSR
         BCC   L098995
         BRL   L098A45
L098995  PHY
         PHY
         PEA   ^L04096F
         PEA   L04096F
         JSL   L0B88AC
         PLA
         STA   $EB
         PLX
         STX   $ED
         PEI   $ED
         PEI   $EB
         JSL   L0718BF
         LDY   #$0002
         LDA   [$EB],Y
         TAX
         LDA   [$EB]
         STA   $E7
         STX   $E9
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         JSL   L0712B0
L0989D1  LDA   #$00FF
         LDX   #$FFD3
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L098A43
         BEQ   L098A43
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         JSL   L0735A8
         PLA
         STA   $D3
         PLX
         STX   $D5
         PHY
         PHY
         PEI   $D5
         PEI   $D3
         PEI   $FA
         PEI   $F8
         JSL   L072B9F
         PLA
         STA   $D7
         PLX
         STX   $D9
         PEI   $D5
         PEI   $D3
         JSL   L07185A
         PHY
         PEI   $D9
         PEI   $D7
         PEI   $DD
         PEI   $DB
         JSL   L071330
         PLA
         LSR
         BCS   L098A45
         PEI   $D9
         PEI   $D7
         JSL   L07185A
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD3
         PHA
         JSL   L0712B0
         BRA   L0989D1
L098A43  STZ   $FC
L098A45  PEI   $ED
         PEI   $EB
         PEI   $DD
         PEI   $DB
         JSL   L071825
         PEI   $E5
         PEI   $E3
         PEI   $E1
         PEI   $DF
         JSL   L071825
         PEI   $D9
         PEI   $D7
         JSL   L07185A
L098A65  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0126
         TCS
         RTL

L098A77  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDX   #$0000
         LDA   $24
         BNE   L098A87
         INX
L098A87  PHX
         LDX   #$0000
         LDA   #$004C
         CMP   $24
         BNE   L098A93
         INX
L098A93  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L098A9D
         BRL   L098B1F
L098A9D  PEI   $22
         JSL   L075A4F
         LDY   #$00EB
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         JSL   L075B09
         LDY   #$00D3
         LDA   [$1E],Y
         BEQ   L098B0B
         LDA   #$0048
         CMP   $24
         BNE   L098AD6
         PEA   $000C
         JSL   L0727E0
         BRA   L098B0B
L098AD6  PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   $24
         JSL   L150488
         PHX
         PHA
         PEA   $0002
         JSL   L07334A
         PEA   ^L040976
         PEA   L040976
         PEA   ^L040977
         PEA   L040977
         PEA   ^L040978
         PEA   L040978
         JSL   L073C22
         PEA   $0045
         JSL   L0727E0
L098B0B  LDA   $24
         LDY   #$00FC
         STA   [$1E],Y
         PHD
         LDA   $1E
         TCD
         CLC
         ADC   #$FA4E
         TCS
         JMPL  L099152

L098B1F  LDA   $1C
         STA   $24
         LDA   $1B
         STA   $23
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L098B31  ENT
         PHD
         TSC
         CLC
         ADC   #$F95E
         TCS
         ADC   #$05B1
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEI   $FA
         PEI   $F8
         PEA   $0100
         JSL   L0313BE
         STZ   $FC
         LDA   #$0001
         STA   $D3
         LDA   L054FA1
         STA   $BD
         STZ   $CB
         STZ   $CD
L098B60  STZ   $D5
         LDA   #$00FF
         LDX   #$FF4F
         AND   $00,X
         BNE   L098BDF
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4F
         PHA
         PEA   $0018
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FC4F
         PHA
         PEA   $0023
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FB4F
         PHA
         LDA   L055043
         LDX   L055045
         PHX
         PHA
         JSL   L072CD4
         PEA   $0000
         TDC
         CLC
         ADC   #$FA4F
         PHA
         PEA   $0024
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0000
         JSL   L093CCE
         PLA
         STA   $E9
         PLX
         STX   $EB
         JSL   L09AFB1
         LDA   $E9
         ORA   $EB
         BNE   L098BDD
         BRL   L099152
L098BDD  BRA   L098BFF
L098BDF  JSL   L09999B
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $E9
         PLX
         STX   $EB
         LDA   $F6
         STA   $D3
L098BFF  LDA   $E9
         ORA   $EB
         BNE   L098C18
         LDA   $D3
         BEQ   L098C10
         PEA   $000D
         JSL   L0727E0
L098C10  LDA   #$0040
         STA   $FC
         BRL   L099152
L098C18  PEI   $EB
         PEI   $E9
         JSL   L0718BF
         JSL   L0903F2
         PEA   $0001
         PEA   $0001
         JSL   L090000
         PHY
         PHY
         LDA   L055047
         PHA
         JSL   L075B7B
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   L05503D
         BEQ   L098C5A
         PHY
         PHY
         PHY
         LDA   L05503D
         PHA
         JSL   L151065
         JSL   L075B7B
         PLA
         STA   $E1
         PLX
         STX   $E3
         BRA   L098C5E
L098C5A  STZ   $E1
         STZ   $E3
L098C5E  PHY
         PHY
         PEI   $EB
         PEI   $E9
         JSL   L0752E6
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDAL  L05565D
         BEQ   L098C88
         LDA   $D3
         BEQ   L098C7F
         PEA   $000D
         JSL   L0727E0
L098C7F  LDAL  L05565D
         STA   $FC
         BRL   L098D09
L098C88  TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0034
         JSL   L071EC5
         LDA   #$000B
         STA   $89
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $8B
         STX   $8D
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L098CDE
         LDA   $DD
         LDX   $DF
         PEI   $AF
         PEI   $AD
         JSL   L150F53
         PEI   $B7
         PEI   $B5
         JSL   L150F53
         STA   $DD
         STX   $DF
L098CDE  PEI   $DF
         PEI   $DD
         LDA   $E5
         LDX   $E7
         PEI   $E3
         PEI   $E1
         JSL   L150F53
         JSL   L033477
         BVS   L098CF7
         EOR   #$8000
L098CF7  BMI   L098D1E
         LDA   $D3
         BEQ   L098D04
         PEA   $000C
         JSL   L0727E0
L098D04  LDA   #$0048
         STA   $FC
L098D09  PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $C9
         JSL   L09AFB1
         BRL   L098E56
L098D1E  LDY   #$0002
         LDA   [$E9],Y
         PHA
         LDA   [$E9]
         PHA
         JSL   L075B09
         LDY   #$0002
         LDA   [$E9],Y
         PHA
         LDA   [$E9]
         PHA
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0005
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEI   $E1
         JSL   L075A86
         LDA   #$0048
         CMPL  L05565D
         BNE   L098D7A
         LDA   $D3
         BEQ   L098D60
         PEA   $000C
         JSL   L0727E0
L098D60  PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $C9
         JSL   L09AFB1
         LDA   #$0048
         STA   $FC
         BRL   L098E56
L098D7A  LDAL  L05565D
         BEQ   L098D83
         BRL   L098E2F
L098D83  LDA   #$0005
         STA   $4F
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $53
         STX   $55
         STZ   $57
         STZ   $59
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDA   $51
         STA   $DB
         LDX   #$0000
         LDAL  L05565D
         BNE   L098DBA
         INX
L098DBA  PHX
         LDA   #$0002
         AND   $5B
         BEQ   L098DC5
         LDA   #$0001
L098DC5  AND   $01,S
         PLX
         LSR
         BCC   L098E2F
         LDA   #$0005
         STA   $4F
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $53
         STX   $55
         STZ   $57
         LDA   #$0001
         STA   $59
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $2010
         JSL   GSOS2
         STAL  L05565D
         LDA   $51
         STA   $D9
         LDX   #$0000
         LDAL  L05565D
         BNE   L098E05
         INX
L098E05  PHX
         LDA   #$0002
         AND   $5B
         BEQ   L098E10
         LDA   #$0001
L098E10  AND   $01,S
         PLX
         LSR
         BCC   L098E1D
         LDA   #$0001
         STA   $D5
         BRA   L098E2F
L098E1D  LDAL  L05565D
         BNE   L098E29
         PEI   $D9
         JSL   L075A4F
L098E29  PEI   $DB
         JSL   L075A4F
L098E2F  LDA   $D5
         BNE   L098E56
         LDA   $D3
         BEQ   L098E3E
         PEA   $000D
         JSL   L0727E0
L098E3E  LDAL  L05565D
         STA   $FC
         PHY
         PEA   $FFFF
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $C9
         JSL   L09AFB1
L098E56  LDA   $D5
         EOR   #$0001
         PHA
         LDA   $D3
         EOR   #$0001
         ORA   $F6
         AND   $01,S
         PLX
         LSR
         BCC   L098E6C
         BRL   L099152
L098E6C  LDA   $D5
         BNE   L098E73
         BRL   L098B60
L098E73  JSL   L072328
         PEA   $0000
         JSL   L07479E
         LDA   $E5
         LDX   $E7
         STA   $CF
         STX   $D1
         PEI   $E3
         PEI   $E1
         LDA   $CF
         LDX   $D1
         JSL   L033477
         BEQ   L098EA3
         BVS   L098E99
         EOR   #$8000
L098E99  BPL   L098EA3
         LDA   $E1
         LDX   $E3
         STA   $CF
         STX   $D1
L098EA3  PHY
         PHY
         JSL   L15042E
         LDA   $CF
         LDX   $D1
         CLC
         ADC   #$4000
         BCC   L098EB4
         INX
L098EB4  JSL   L033477
         BVS   L098EBD
         EOR   #$8000
L098EBD  BMI   L098ECA
         JSL   L15059E
         PEA   $0000
         JSL   L15000C
L098ECA  PHY
         PHY
         JSL   L15042E
         LDA   $CF
         LDX   $D1
         CLC
         ADC   #$4000
         BCC   L098EDB
         INX
L098EDB  JSL   L033477
         BVS   L098EE4
         EOR   #$8000
L098EE4  BMI   L098EF9
         PHY
         PHY
         JSL   L15042E
         PLA
         PLX
         SEC
         SBC   #$4000
         BCS   L098EF5
         DEX
L098EF5  STA   $CF
         STX   $D1
L098EF9  PEI   $D1
         PEI   $CF
         LDA   #$0400
         LDX   #$0000
         JSL   L033477
         BVS   L098F0C
         EOR   #$8000
L098F0C  BMI   L098F18
         PEA   $0035
         JSL   L0727E0
         BRL   L099152
L098F18  PHY
         PHY
         PEI   $D1
         PEI   $CF
         PEA   $FFFF
         PEA   $FC00
         JSL   L15017E
         PLA
         STA   $CF
         PLX
         STX   $D1
         PHY
         PHY
         PEI   $D1
         PEI   $CF
         LDA   L054FBD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDAL  L05565D
         BEQ   L098F58
         PEA   $0DA0
         JSL   L07272E
L098F58  LDA   L055047
         PHA
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PEI   $DB
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         STZ   $C1
         STZ   $C3
L098F76  JSL   L072328
         PHY
         PHY
         LDA   L055047
         PHA
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         PEI   $D1
         PEI   $CF
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $C5
         PLX
         STX   $C7
         JSL   L072328
         PHY
         PHY
         PEI   $DB
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         PEI   $C7
         PEI   $C5
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $C5
         PLX
         STX   $C7
         LDA   $C1
         LDX   $C3
         PEI   $C7
         PEI   $C5
         JSL   L150F53
         STA   $C1
         STX   $C3
         LDAL  L05565D
         BEQ   L098FD5
         LDA   #$0001
L098FD5  PHA
         LDA   $E5
         LDX   $E7
         CMP   $C1
         BNE   L098FE0
         CPX   $C3
L098FE0  BEQ   L098FE7
         LDA   #$0000
         BRA   L098FEA
L098FE7  LDA   #$0001
L098FEA  ORA   $01,S
         PLX
         LSR
         BCC   L098F76
         LDAL  L05565D
         PHA
         PEI   $DB
         PEA   $0000
         PHD
         JSL   L098A77
         PEI   $DB
         PEI   $E7
         PEI   $E5
         JSL   L075DD3
         PEI   $DB
         JSL   L075A4F
         LDA   L05503D
         BNE   L099017
         BRL   L0990C6
L099017  PHY
         LDA   L05503D
         PHA
         JSL   L151065
         PLA
         STA   $D7
         PEI   $D7
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         PEI   $D9
         PEA   $0000
         PEA   $0000
         JSL   L075E14
         STZ   $C1
         STZ   $C3
L09903F  JSL   L072328
         PHY
         PHY
         PEI   $D7
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         PEI   $D1
         PEI   $CF
         PEA   $0000
         JSL   L075D80
         PLA
         STA   $C5
         PLX
         STX   $C7
         JSL   L072328
         PHY
         PHY
         PEI   $D9
         LDY   #$0002
         LDA   [$CB],Y
         PHA
         LDA   [$CB]
         PHA
         PEI   $C7
         PEI   $C5
         PEA   $0000
         JSL   L075E55
         PLA
         STA   $C5
         PLX
         STX   $C7
         LDA   $C1
         LDX   $C3
         PEI   $C7
         PEI   $C5
         JSL   L150F53
         STA   $C1
         STX   $C3
         LDAL  L05565D
         BEQ   L09909C
         LDA   #$0001
L09909C  PHA
         LDA   $E1
         LDX   $E3
         CMP   $C1
         BNE   L0990A7
         CPX   $C3
L0990A7  BEQ   L0990AE
         LDA   #$0000
         BRA   L0990B1
L0990AE  LDA   #$0001
L0990B1  ORA   $01,S
         PLX
         LSR
         BCC   L09903F
         LDAL  L05565D
         PHA
         PEI   $D9
         PEA   $0000
         PHD
         JSL   L098A77
L0990C6  PEI   $D9
         PEI   $E3
         PEI   $E1
         JSL   L075DD3
         PEI   $D9
         JSL   L075A4F
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         LDA   #$0007
         STA   $89
         LDA   L055043
         LDX   L055045
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         STA   $8B
         STX   $8D
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0005
         STA   $89
         LDY   #$0002
         LDA   [$E9],Y
         TAX
         LDA   [$E9]
         STA   $8B
         STX   $8D
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDA   #$0007
         STA   $89
         TDC
         CLC
         ADC   #$0089
         PEA   $0000
         PHA
         PEA   $2005
         JSL   GSOS2
         STAL  L05565D
L099152  PEI   $CD
         PEI   $CB
         PEI   $EB
         PEI   $E9
         JSL   L071825
         PEI   $BD
         JSL   L0724F7
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$06AA
         TCS
         RTL

L099176  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0007
         JSL   L0998B0
         PEA   $0006
         JSL   L0998B0
         PEA   $0005
         JSL   L0998B0
         PEI   $0A
         JSL   L0998B0
         LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L0991A9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0551F3
         BEQ   L0991F0
         LDA   L055111
         LDX   L055113
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $01
         STX   $03
         LDX   #$0000
         LDY   #$0020
         LDA   [$01],Y
         CMP   $12
         BNE   L0991D9
         INX
L0991D9  PHX
         LDX   #$0000
         LDY   #$0022
         LDA   [$01],Y
         CMP   $0E
         BNE   L0991E7
         INX
L0991E7  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0991F0
         BRA   L099231
L0991F0  LDA   L0551F3
         BNE   L0991F9
         JSL   L0952F7
L0991F9  LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L099206
         INX
L099206  STA   $05
         STX   $07
         LDA   #$0020
         AND   [$05]
         BNE   L09921D
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09A5A7
L09921D  PEI   $12
         PEI   $0E
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1512D1
         JSL   L097700
L099231  LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L099243  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD0
         TCS
         TCD
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L099257
         EOR   #$8000
L099257  BMI   L09925C
         BRL   L09933B
L09925C  LDA   L055027
         LDX   L055029
         CMP   $38
         BNE   L099268
         CPX   $3A
L099268  BEQ   L09926F
         LDA   #$0000
         BRA   L099272
L09926F  LDA   #$0001
L099272  PHA
         LDA   L05501F
         LDX   L055021
         CMP   $38
         BNE   L09927F
         CPX   $3A
L09927F  BEQ   L099286
         LDA   #$0000
         BRA   L099289
L099286  LDA   #$0001
L099289  ORA   $01,S
         PLX
         PHA
         PHY
         PEI   $3A
         PEI   $38
         PEI   $36
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         STA   $2D
         PLA
         AND   $2D
         PHA
         LDX   #$0000
         LDA   $07
         BMI   L0992B0
         INX
L0992B0  TXA
         AND   $01,S
         PLX
         LSR
         BCS   L0992BA
         BRL   L09933B
L0992BA  LDA   #$0002
         STA   $01
         LDA   #$000F
         AND   $07
         DEC
         DEC
         BNE   L0992CD
         LDA   #$0003
         STA   $01
L0992CD  LDA   L0550BB
         CMP   $01
         BEQ   L0992DA
         PEI   $01
         JSL   L090635
L0992DA  PEA   ^L052D32
         PEA   L052D32
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $002A
         JSL   L0313BE
         LDA   $38
         LDX   $3A
         STA   L0551F5
         STX   L0551F7
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L052D38
         PEA   L052D38
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E14
         JSL   L085DC0
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L053259
         PEA   L053259
         PEA   $0008
         JSL   L0313BE
L09933B  LDA   $34
         STA   $3A
         LDA   $33
         STA   $39
         LDA   $31
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L09934D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFB8
         TCS
         TCD
         LDA   L055027
         LDX   L055029
         CMP   $58
         BNE   L099361
         CPX   $5A
L099361  BEQ   L099368
         LDA   #$0000
         BRA   L09936B
L099368  LDA   #$0001
L09936B  PHA
         LDA   L05501F
         LDX   L055021
         CMP   $58
         BNE   L099378
         CPX   $5A
L099378  BEQ   L09937F
         LDA   #$0000
         BRA   L099382
L09937F  LDA   #$0001
L099382  ORA   $01,S
         PLX
         LSR
         BCS   L09938B
         BRL   L09950C
L09938B  PHY
         PEI   $5A
         PEI   $58
         PEI   $56
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L0993A6
         BRL   L09950C
L0993A6  LDA   $19
         BPL   L0993AD
         BRL   L09950C
L0993AD  JSL   L090A71
         LDA   L0550BB
         DEC
         BEQ   L0993BE
         PEA   $0001
         JSL   L090635
L0993BE  PHY
         JSL   L095FB4
         PLA
         LSR
         BCS   L0993CA
         BRL   L099505
L0993CA  LDA   L055129
         LDX   L05512B
         STA   $41
         STX   $43
         LDAL  L05328D
         STA   $3F
         PEI   $5A
         PEI   $58
         PEI   $56
         PEA   $0001
         JSL   L1412EE
         PEI   $54
         PEI   $52
         PEI   $50
         PEI   $4E
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150006
         JSL   L0879C5
         LDA   $41
         LDX   $43
         CMP   $58
         BNE   L099409
         CPX   $5A
L099409  BNE   L099410
         LDA   #$0000
         BRA   L099413
L099410  LDA   #$0001
L099413  PHA
         LDX   #$0000
         LDA   $3F
         CMP   $56
         BEQ   L09941E
         INX
L09941E  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L09944B
         LDA   #$0001
         STA   L05511D
         PEA   ^L053291
         PEA   L053291
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L0808E0
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L085216
L09944B  LDA   L055121
         LDX   L055123
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $09
         STX   $0B
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L09946C
         INX
L09946C  STA   $45
         STX   $47
         LDY   #$0010
         LDA   #$00FF
         AND   [$09],Y
         AND   #$007F
         SEP   #$20
         STA   [$45]
         REP   #$20
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150BCA
         LDA   L055121
         LDX   L055123
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $05
         STX   $07
         LDY   #$0092
         LDA   [$05],Y
         INY
         INY
         ORA   [$05],Y
         BEQ   L099503
         LDY   #$0094
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   $45
         STX   $47
         LDY   #$0002
         LDA   [$45],Y
         TAX
         LDA   [$45]
         STA   $01
         STX   $03
         LDA   #$0010
         CLC
         ADC   $01
         LDX   $03
         BCC   L0994DF
         INX
L0994DF  STA   $45
         STX   $47
         LDY   #$0010
         LDA   #$00FF
         AND   [$01],Y
         AND   #$007F
         SEP   #$20
         STA   [$45]
         REP   #$20
         LDY   #$0094
         LDA   [$05],Y
         PHA
         DEY
         DEY
         LDA   [$05],Y
         PHA
         JSL   L151041
L099503  BRA   L09950C
L099505  PEA   $0041
         JSL   L0727E0
L09950C  LDA   $4C
         STA   $5A
         LDA   $4B
         STA   $59
         LDA   $49
         TCD
         TSC
         CLC
         ADC   #$0058
         TCS
         RTL

L09951E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   #$0001
         STA   $40
         LDAL  L052D72
         AND   #$1000
         BEQ   L099574
         PEA   ^L052406
         PEA   L052406
         PEA   ^L040979
         PEA   L040979
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   L055225
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $001F
         JSL   L0313BE
         JSL   L0B8B50
         BRL   L099713
L099574  LDA   L055227
         SEC
         SBC   #$003D
         BVS   L099580
         EOR   #$8000
L099580  BMI   L099587
         LDA   #$0000
         BRA   L09958A
L099587  LDA   #$0001
L09958A  PHA
         LDA   L055227
         SEC
         SBC   #$004B
         BEQ   L0995A0
         BVS   L099599
         EOR   #$8000
L099599  BPL   L0995A0
         LDA   #$0000
         BRA   L0995A3
L0995A0  LDA   #$0001
L0995A3  AND   $01,S
         PLX
         LSR
         BCC   L0995EE
         PEA   ^L052406
         PEA   L052406
         PEA   ^L040985
         PEA   L040985
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDA   L055227
         INC
         SEC
         SBC   #$003D
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0020
         JSL   L0313BE
         JSL   L0B8B50
         BRL   L099713
L0995EE  LDA   #$0035
         CMP   L055227
         BNE   L099603
         PEA   $0004
         PEA   $025B
         JSL   L09971B
         BRL   L099713
L099603  LDA   #$0036
         CMP   L055227
         BNE   L099618
         PEA   $0004
         PEA   $025A
         JSL   L09971B
         BRL   L099713
L099618  LDA   #$0037
         CMP   L055227
         BNE   L09962D
         PEA   $0004
         PEA   $0260
         JSL   L09971B
         BRL   L099713
L09962D  LDA   #$0009
         CMP   L055227
         BNE   L099683
         LDA   L05511F
         BEQ   L099679
         LDA   L055245
         STA   L05523F
         PEA   ^L052406
         PEA   L052406
         PEA   ^L040992
         PEA   L040992
         PEA   $000E
         JSL   L0313BE
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0B8B91
         STZ   L05523F
         BRA   L099680
L099679  PEA   $0021
         JSL   L0998B0
L099680  BRL   L099713
L099683  LDA   #$000A
         CMP   L055227
         BNE   L0996CF
         LDA   L05511F
         BEQ   L0996C6
         PEA   ^L052406
         PEA   L052406
         PEA   ^L0409A0
         PEA   L0409A0
         PEA   $000D
         JSL   L0313BE
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
         PHA
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L0B8B91
         BRA   L0996CD
L0996C6  PEA   $0023
         JSL   L0998B0
L0996CD  BRA   L099713
L0996CF  STZ   $35
         LDA   #$0005
         CMP   L055227
         BNE   L0996DE
         LDA   #$0025
         STA   $35
L0996DE  LDA   #$0006
         CMP   L055227
         BNE   L0996EB
         LDA   #$0026
         STA   $35
L0996EB  LDA   #$0007
         CMP   L055227
         BNE   L0996F8
         LDA   #$0027
         STA   $35
L0996F8  LDA   #$0008
         CMP   L055227
         BNE   L099705
         LDA   #$0028
         STA   $35
L099705  LDA   $35
         BEQ   L099711
         PEI   $35
         JSL   L0998B0
         BRA   L099713
L099711  STZ   $40
L099713  TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L09971B  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE4
         TCS
         ADC   #$0029
         TCD
         LDX   #$0000
         LDA   $FA
         BNE   L09972E
         INX
L09972E  PHX
         LDX   #$0000
         LDA   $F8
         BNE   L099737
         INX
L099737  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L099741
         BRL   L09989E
L099741  LDA   #$02BC
         CMP   $FA
         BNE   L099787
         PEA   ^L052406
         PEA   L052406
         PEA   ^L0409AD
         PEA   L0409AD
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         LDA   $F8
         SEC
         SBC   #$02BC
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0020
         JSL   L0313BE
         BRL   L09988E
L099787  LDA   #$044C
         CMP   $FA
         BNE   L0997CD
         PEA   ^L052406
         PEA   L052406
         PEA   ^L0409BA
         PEA   L0409BA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         LDA   $F8
         SEC
         SBC   #$044C
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0023
         JSL   L0313BE
         BRL   L09988E
L0997CD  LDX   #$0000
         LDA   #$01F4
         CMP   $FA
         BNE   L0997D8
         INX
L0997D8  PHX
         LDX   #$0000
         LDA   #$0514
         CMP   $FA
         BNE   L0997E4
         INX
L0997E4  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0997EF
         JSL   L0904A1
L0997EF  LDX   #$0000
         LDA   #$012C
         CMP   $FA
         BNE   L0997FA
         INX
L0997FA  PHX
         LDX   #$0000
         LDA   #$012D
         CMP   $F8
         BNE   L099806
         INX
L099806  TXA
         AND   $01,S
         PLX
         PHA
         LDA   $FA
         SEC
         SBC   #$012C
         BEQ   L09981A
         BVS   L099818
         EOR   #$8000
L099818  BMI   L09981F
L09981A  LDA   #$0000
         BRA   L099822
L09981F  LDA   #$0001
L099822  PHA
         LDA   $FA
         SEC
         SBC   #$0578
         BEQ   L099837
         BVS   L099830
         EOR   #$8000
L099830  BPL   L099837
         LDA   #$0000
         BRA   L09983A
L099837  LDA   #$0001
L09983A  AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L099853
         PHY
         PHY
         PEI   $F8
         JSL   L093C14
         PLA
         STA   $EB
         PLX
         STX   $ED
         BRA   L099861
L099853  PHY
         PHY
         PEI   $F8
         JSL   L1505BC
         PLA
         STA   $EB
         PLX
         STX   $ED
L099861  PEA   ^L052406
         PEA   L052406
         PEA   ^L0409CA
         PEA   L0409CA
         PEI   $ED
         PEI   $EB
         PEA   ^L0409D3
         PEA   L0409D3
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L09988E  LDA   L05524B
         EOR   #$0001
         STA   L055241
         JSL   L0B8B50
         STZ   L055241
L09989E  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$0122
         TCS
         RTL

L0998B0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L052406
         PEA   L052406
         PHY
         PHY
         LDA   #$01F4
         CLC
         ADC   $0A
         PHA
         JSL   L0711EB
         PEA   $0100
         JSL   L0313BE
         JSL   L0B8B50
         LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         RTL

L0998E6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L052406
         PEA   L052406
         PHY
         PHY
         LDA   #$01F4
         CLC
         ADC   $18
         PHA
         JSL   L0711EB
         PEA   $0100
         JSL   L0313BE
         PEI   $16
         PEI   $14
         PEI   $12
         PEI   $10
         PEI   $0E
         PEI   $0C
         PEI   $0A
         JSL   L0B8B91
         LDA   $08
         STA   $18
         LDA   $07
         STA   $17
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L09992C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L05504F
         BEQ   L09993B
         BRA   L099989
L09993B  LDA   #$8000
         ANDL  L053AE9
         BEQ   L099947
         LDA   #$0001
L099947  STA   $03
         LDA   $0E
         CMP   $03
         BEQ   L099960
         LDA   #$8000
         EORL  L053AE9
         STAL  L053AE9
         LDA   #$0001
         STA   L05504D
L099960  LDA   $0E
         ORA   L05504F
         STA   $01
         LDA   L055051
         CMP   $01
         BEQ   L099989
         JSL   L0952F7
         PEA   $0001
         PEA   $0001
         JSL   L090000
         JSL   L077AA5
         LDA   $01
         STA   L055051
         JSL   L087268
L099989  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L09999B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PEA   $0005
         LDA   L055261
         LDX   L055263
         PHX
         PHA
         JSL   L077086
         PEA   $0006
         LDA   L055031
         LDX   L055033
         PHX
         PHA
         JSL   L077086
         PEA   $0007
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PLY
         PLY
         PLD
         RTL

L0999E3  PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         LDA   $2A
         ORA   $2C
         BNE   L0999F8
         PEA   $340D
         JSL   L07272E
L0999F8  LDA   L055027
         LDX   L055029
         CMP   $2A
         BNE   L099A04
         CPX   $2C
L099A04  BNE   L099A09
         BRL   L099B89
L099A09  PEI   $28
         PEI   $26
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L099A1E
         PEA   $340E
         JSL   L07272E
L099A1E  PEI   $28
         PEI   $26
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         JSL   L033477
         BEQ   L099A3F
         BVS   L099A36
         EOR   #$8000
L099A36  BPL   L099A3F
         PEA   $340F
         JSL   L07272E
L099A3F  LDA   L055027
         LDX   L055029
         STA   $0F
         STX   $11
         LDA   L05501F
         LDX   L055021
         STA   $0B
         STX   $0D
         LDA   $0F
         LDX   $11
         CMP   $2A
         BNE   L099A5D
         CPX   $2C
L099A5D  BNE   L099A64
         LDA   #$0000
         BRA   L099A67
L099A64  LDA   #$0001
L099A67  PHA
         LDA   $24
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L099AA4
         LDA   L055155
         STA   $09
         LDA   #$0001
         STA   L055155
         PEA   $0000
         PEA   $0001
         JSL   L090000
         LDA   $09
         STA   L055155
         JSL   L086C29
         STZ   L055139
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         LDA   #$0001
         STA   L055157
L099AA4  PHY
         PHY
         PEI   $2C
         PEI   $2A
         JSL   L0772AE
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BEQ   L099B1A
         LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         STA   $05
         STX   $07
         LDA   $2A
         LDX   $2C
         STA   L055027
         STX   L055029
         LDA   $26
         LDX   $28
         STA   L055023
         STX   L055025
         LDY   #$0022
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   L05501F
         STX   L055021
         LDY   #$000E
         LDA   [$05],Y
         TAX
         DEY
         DEY
         LDA   [$05],Y
         STA   L055119
         STX   L05511B
         LDX   #$0000
         LDY   #$0010
         LDA   #$2000
         AND   [$05],Y
         CMP   #$0000
         BEQ   L099B0B
         INX
L099B0B  TXA
         STA   L055151
         PEI   $2C
         PEI   $2A
         PEA   $0000
         JSL   L074A90
L099B1A  LDA   $0B
         LDX   $0D
         CMP   L05501F
         BNE   L099B26
         CPX   L055021
L099B26  BEQ   L099B89
         PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $13
         PLX
         STX   $15
         LDA   $13
         ORA   $15
         BEQ   L099B82
         LDY   #$0002
         LDA   [$13],Y
         TAX
         LDA   [$13]
         STA   $01
         STX   $03
         LDY   #$000E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   L055115
         STX   L055117
         LDX   #$0000
         LDY   #$0010
         LDA   #$2000
         AND   [$01],Y
         CMP   #$0000
         BEQ   L099B6F
         INX
L099B6F  TXA
         STA   L05514F
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L099B82  LDA   $24
         BNE   L099B89
         STZ   L055135
L099B89  LDA   $22
         STA   $2C
         LDA   $21
         STA   $2B
         LDA   $1F
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L099B9B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L099BAF
         EOR   #$8000
L099BAF  BPL   L099BB6
         LDA   #$0000
         BRA   L099BB9
L099BB6  LDA   #$0001
L099BB9  PHA
         LDA   $12
         SEC
         SBC   #$0001
         BEQ   L099BC9
         BVS   L099BC7
         EOR   #$8000
L099BC7  BMI   L099BCE
L099BC9  LDA   #$0000
         BRA   L099BD1
L099BCE  LDA   #$0001
L099BD1  AND   $01,S
         PLX
         PHA
         LDX   #$0000
         LDA   #$0003
         CMP   L0551FB
         BNE   L099BE1
         INX
L099BE1  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   $12
         BNE   L099BED
         INX
L099BED  PHX
         LDX   #$0000
         LDA   $12
         DEC
         DEC
         BNE   L099BF8
         INX
L099BF8  TXA
         ORA   $01,S
         PLX
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L099C0F
         PEA   $0024
         JSL   L0727E0
         BRL   L099CC9
L099C0F  STZ   $03
         LDA   $12
         SEC
         SBC   #$0003
         BEQ   L099C25
         BVS   L099C1E
         EOR   #$8000
L099C1E  BPL   L099C25
         LDA   #$0001
         STA   $03
L099C25  PHY
         PHY
         JSL   L150493
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L151131
         LDA   L0550BB
         CMP   $12
         BEQ   L099C51
         JSL   L086B8B
         LDA   $12
         STA   L0550BB
         JSL   L086B8B
L099C51  LDA   L0550B9
         CMP   $03
         BEQ   L099C86
         PHY
         JSL   L073CDF
         PLA
         STA   $01
         LDA   L0550B9
         BNE   L099C69
         JSL   L0A1A5F
L099C69  LDA   L0550B9
         DEC
         BNE   L099C73
         JSL   L0A0024
L099C73  LDA   $03
         BNE   L099C7D
         JSL   L0A3E17
         BRA   L099C86
L099C7D  LDA   $03
         DEC
         BNE   L099C86
         JSL   L0A0100
L099C86  LDA   L0550B9
         DEC
         BNE   L099CBB
         LDA   L0550BB
         PHA
         PEA   ^L0409D5
         PEA   L0409D5
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFFD
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $0003
         JSL   L0313BE
         PEA   $0003
         JSL   L1511F2
         PLA
         STA   L0551EF
         JSL   L160226
L099CBB  LDA   #$0001
         STA   L054F9F
         PEI   $07
         PEI   $05
         JSL   L151131
L099CC9  LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L099CDB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF6
         TCS
         TCD
         PHY
         PEI   $10
         PEA   $0001
         PEA   $0005
         JSL   L071A1B
         PLA
         STA   L0551F9
         PHY
         LDA   L0551F9
         PHA
         LDAL  L053AE5
         PHA
         JSL   L072FD5
         PLA
         STA   $01
         LDA   L0551FB
         CMP   $01
         BNE   L099D0F
         BRL   L099DBC
L099D0F  LDA   #$0001
         STA   $03
         LDA   #$0003
         CMP   L0551FB
         BNE   L099D21
         LDA   #$0002
         STA   $03
L099D21  LDA   L0551FB
         SEC
         SBC   #$0003
         BEQ   L099D36
         BVS   L099D2F
         EOR   #$8000
L099D2F  BPL   L099D36
         LDA   #$0003
         STA   $03
L099D36  LDA   $01
         STA   L0551FB
         LDA   #$0001
         STA   $05
         LDA   #$0003
         CMP   L0551FB
         BNE   L099D4D
         LDA   #$0002
         STA   $05
L099D4D  LDA   L0551FB
         SEC
         SBC   #$0003
         BEQ   L099D62
         BVS   L099D5B
         EOR   #$8000
L099D5B  BPL   L099D62
         LDA   #$0003
         STA   $05
L099D62  LDA   $03
         CMP   $05
         BEQ   L099D6C
         JSL   L09B058
L099D6C  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L099D78
         EOR   #$8000
L099D78  BPL   L099D7F
         LDA   #$0000
         BRA   L099D82
L099D7F  LDA   #$0001
L099D82  PHA
         LDX   #$0000
         LDA   #$0003
         CMP   L0551FB
         BNE   L099D8F
         INX
L099D8F  PHX
         LDX   #$0000
         LDA   #$0003
         CMP   L0550BB
         BNE   L099D9C
         INX
L099D9C  PHX
         LDX   #$0000
         LDA   L0550BB
         DEC
         DEC
         BNE   L099DA8
         INX
L099DA8  TXA
         ORA   $01,S
         PLX
         AND   $01,S
         PLX
         ORA   $01,S
         PLX
         LSR
         BCC   L099DBC
         PEA   $0001
         JSL   L090635
L099DBC  LDA   $0E
         STA   $10
         LDA   $0D
         STA   $0F
         LDA   $0B
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L099DCE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L05524B
         BEQ   L099DE2
         LDA   L055197
         STA   $0A
         BRA   L099DF8
L099DE2
*         PHY
*         PEA   $0000
*         PEA   $C025
*         JSL   L071A89
*         PLA
         ldal  $c025	; AV 202208
         AND   #$0001
         BEQ   L099DF6
         LDA   #$0001
L099DF6  STA   $0A
L099DF8  PLY
         PLY
         PLD
         RTL

L099DFC  ENT
         PHD
         TSC
         CLC
         ADC   #$FF6C
         TCS
         TCD
         LDA   L0551DF
         STA   $8F
         LDA   #$0001
         STA   L0551DF
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L0940E5
         LDA   #$0003
         STA   $2F
         LDA   #$0002
         STA   $39
L099E26  LDA   $9A
         ORA   $9C
         BEQ   L099E2F
         LDA   #$0001
L099E2F  PHA
         PHY
         JSL   L07005C
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         PHA
         PHY
         PEA   $0002
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151017
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L099E7B
         PHY
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L0933AB
         PLA
         STA   $8D
         JSL   L151307
         LDX   $9C
         LDA   $9A
         BNE   L099E74
         DEX
L099E74  DEC
         STA   $9A
         STX   $9C
         BRA   L099E26
L099E7B  PHY
         PEA   $0006
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $8B
         LDA   $8F
         STA   L0551DF
         JSL   L096253
         LDA   $98
         STA   $9C
         LDA   $97
         STA   $9B
         LDA   $95
         TCD
         TSC
         CLC
         ADC   #$009A
         TCS
         RTL

L099EA4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PHY
         PEI   $18
         PEI   $16
         JSL   L07721A
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L099EC5
         BRL   L099F65
L099EC5  STZ   $05
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $01
         STX   $03
         LDX   #$0000
         LDY   #$0010
         LDA   #$2000
         AND   [$01],Y
         CMP   #$0000
         BEQ   L099EE4
         INX
L099EE4  TXA
         CMP   $14
         BNE   L099EEE
         LDA   #$2000
         STA   $05
L099EEE  LDY   #$0010
         LDA   [$01],Y
         EOR   $05
         LDY   #$0010
         STA   [$01],Y
         PEI   $18
         PEI   $16
         LDA   $05
         BEQ   L099F05
         LDA   #$0001
L099F05  PHA
         JSL   L074A24
         LDA   L05501F
         LDX   L055021
         CMP   $16
         BNE   L099F16
         CPX   $18
L099F16  BNE   L099F65
         LDA   $14
         EOR   #$0001
         STA   L05514F
         LDA   $05
         BEQ   L099F27
         LDA   #$0001
L099F27  PHA
         LDA   L055115
         ORA   L055117
         BEQ   L099F33
         LDA   #$0001
L099F33  ORA   L055137
         AND   $01,S
         PLX
         LSR
         BCC   L099F65
         JSL   L096029
         LDA   L055135
         BEQ   L099F57
         PEA   ^L053117
         PEA   L053117
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         BRA   L099F61
L099F57  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
L099F61  JSL   L09AED3
L099F65  LDA   $12
         STA   $18
         LDA   $11
         STA   $17
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L099F77  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PHY
         PEI   $18
         PEI   $16
         JSL   L0772AE
         PLA
         STA   $07
         PLX
         STX   $09
         LDA   $07
         ORA   $09
         BNE   L099F98
         BRL   L09A035
L099F98  STZ   $05
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $01
         STX   $03
         LDX   #$0000
         LDY   #$0010
         LDA   #$2000
         AND   [$01],Y
         CMP   #$0000
         BEQ   L099FB7
         INX
L099FB7  TXA
         CMP   $14
         BNE   L099FC1
         LDA   #$2000
         STA   $05
L099FC1  LDY   #$0010
         LDA   [$01],Y
         EOR   $05
         LDY   #$0010
         STA   [$01],Y
         PEI   $18
         PEI   $16
         LDA   $05
         BEQ   L099FD8
         LDA   #$0001
L099FD8  PHA
         JSL   L074A90
         LDA   L055027
         LDX   L055029
         CMP   $16
         BNE   L099FE9
         CPX   $18
L099FE9  BNE   L09A035
         LDA   $14
         EOR   #$0001
         STA   L055151
         LDA   $05
         BEQ   L09A035
         LDA   L055153
         BNE   L09A035
         LDA   L055119
         ORA   L05511B
         BEQ   L09A007
         LDA   #$0001
L09A007  ORA   L055137
         BEQ   L09A035
         JSL   L096029
         LDA   L055139
         BEQ   L09A027
         PEA   ^L05310F
         PEA   L05310F
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         BRA   L09A031
L09A027  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
L09A031  JSL   L09AED3
L09A035  LDA   $12
         STA   $18
         LDA   $11
         STA   $17
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L09A047  PHD
         TSC
         CLC
         ADC   #$FCFA
         TCS
         ADC   #$0211
         TCD
         JSL   L0952F7
         LDA   $FA
         BNE   L09A05D
         BRL   L09A12E
L09A05D  LDA   L0550C5
         LDX   L0550C7
         CLC
         ADC   #$00CE
         BCC   L09A06A
         INX
L09A06A  STA   $F1
         STX   $F3
         LDA   #$0020
         AND   [$F1]
         BEQ   L09A078
         LDA   #$0001
L09A078  EOR   #$0001
         STA   $EF
         LDA   L05522F
         BEQ   L09A0A4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDEF
         PHA
         PEA   $001F
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
         BRA   L09A0C4
L09A0A4  PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDEF
         PHA
         PEA   $001B
         JSL   L073002
         PEA   $0100
         JSL   L0313BE
L09A0C4  PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         PEA   ^L0538E9
         PEA   L0538E9
         PEA   $0000
         TDC
         CLC
         ADC   #$FDEF
         PHA
         PEA   $0021
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FEEF
         PHA
         PEA   $0003

*

         JSL   L1509CE
         JSL   L09873C
         LDA   #$00FF
         LDX   #$FFEF
         AND   $00,X
         PHA
         LDA   #$00FF
         LDX   #$FFEF
         AND   $00,X
         PHA
         LDA   #$00FF
         ANDL  L0538E9
         STA   $F1
         PLA
         CLC
         ADC   $F1
         PHA
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L1512D1
         JSL   L097700
         LDA   $EF
         STA   L0551F1
         BRA   L09A166
L09A12E  JSL   L090A71
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09A5A7
         LDA   L055111
         LDX   L055113
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         CLC
         ADC   #$0004
         BCC   L09A157
         INX
L09A157  STA   $F1
         STX   $F3
         LDA   [$F1]
         BNE   L09A163
         JSL   L097700
L09A163  STZ   L0551F1
L09A166  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$030A
         TCS
         RTL

L09A178  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PEA   ^L05232C
         PEA   L05232C
         LDY   #$007D
         LDA   [$12],Y
         TAX
         DEY
         DEY
         LDA   [$12],Y
         PHX
         PHA
         PEA   ^L052334
         PEA   L052334
         LDA   #$0069
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A1A3
         INX
L09A1A3  PHX
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDY   #$0075
         LDA   [$12],Y
         DEC
         PHA
         PEA   $0006
         JSL   L1500F5
         PLX
         PLX
         STA   $05
         LDY   #$0075
         LDA   [$12],Y
         DEC
         PHA
         PEA   $0006
         JSL   L150318
         PLX
         PLX
         STA   $07
         LDA   #$0061
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A1E1
         INX
L09A1E1  STA   $01
         STX   $03
         LDA   $01
         LDX   $03
         STA   $09
         STX   $0B
         LDA   $05
         PEA   $0019
         JSL   L150BEE
         LDY   #$0069
         PLA
         CLC
         ADC   [$12],Y
         STA   [$09]
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L09A20A
         INX
L09A20A  PHX
         PHA
         LDA   $07
         PEA   $0050
         JSL   L150BEE
         LDA   #$0069
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A220
         INX
L09A220  CLC
         ADC   #$0002
         BCC   L09A227
         INX
L09A227  STA   $09
         STX   $0B
         PLA
         CLC
         ADC   [$09]
         PLX
         STX   $09
         PLX
         STX   $0B
         STA   [$09]
         LDA   #$0019
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDY   #$0002
         LDA   #$0050
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         JSL   L1510A1
         LDA   #$0061
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A25F
         INX
L09A25F  PHX
         PHA
         PEA   $FFFA
         PEA   $FFFD
         JSL   L151005
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $0000
         JSL   L081DD8
         LDA   #$0061
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A287
         INX
L09A287  PHX
         PHA
         JSL   L151418
         LDA   #$0061
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A298
         INX
L09A298  PHX
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L151005
         PEA   $0004
         PEA   $0002
         JSL   L151083
         PEA   $FFFF
         JSL   L081DD8
         LDA   #$0061
         CLC
         ADC   $12
         LDX   $14
         BCC   L09A2C0
         INX
L09A2C0  PHX
         PHA
         JSL   L151418
         JSL   L1510A1
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L09A2DC  PHD
         TSC
         CLC
         ADC   #$FF7E
         TCS
         TCD
         JSL   L096253
         PHY
         JSL   L0727BF
         PLA
         STA   $79
         PHY
         PHY
         PEA   $1B58
         JSL   L072834
         PLA
         STA   $7B
         PLX
         STX   $7D
         PEI   $7D
         PEI   $7B
         JSL   L151131
         PEI   $7D
         PEI   $7B
         JSL   L15102F
         PEI   $7D
         PEI   $7B
         PEA   $0003
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L072B17
         LDA   #$0001
         STA   $75
L09A328  LDA   $75
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L09A33A
         INX
L09A33A  STA   $01
         STX   $03
         LDA   L055027
         LDX   L055029
         CMP   [$01]
         BNE   L09A34E
         LDY   #$0002
         TXA
         CMP   [$01],Y
L09A34E  BEQ   L09A355
         LDA   #$0000
         BRA   L09A358
L09A355  LDA   #$0001
L09A358  PHA
         LDY   #$0006
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         CMP   L055039
         BNE   L09A36B
         CPX   L05503B
L09A36B  BEQ   L09A372
         LDA   #$0000
         BRA   L09A375
L09A372  LDA   #$0001
L09A375  AND   $01,S
         PLX
         LSR
         BCS   L09A386
         LDA   #$0012
         CMP   $75
         BEQ   L09A386
         INC   $75
         BRA   L09A328
L09A386  PEA   $0000
         PHD
         JSL   L09A178
         LDA   #$0001
         STA   $05
         LDA   $75
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L05233E,X
         PHA
         LDAL  L05233C,X
         PLX
         STA   $07
         STX   $09
         LDA   #$0006
         STA   $31
         LDA   $75
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L09A3BF
         INX
L09A3BF  CLC
         ADC   #$0004
         BCC   L09A3C6
         INX
L09A3C6  STA   $7F
         STX   $81
         LDY   #$0002
         LDA   [$7F],Y
         TAX
         LDA   [$7F]
         STA   $5D
         STX   $5F
L09A3D6  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $77
         LDA   #$0003
         CMP   $77
         BEQ   L09A3EB
         BRL   L09A4E7
L09A3EB  LDAL  L0540BB
         DEC
         DEC
         BNE   L09A417
         PEA   $0001
         PEI   $7D
         PEI   $7B
         PEA   $0001
         JSL   L072E7C
         PEA   $0000
         PEI   $7D
         PEI   $7B
         PEA   $0001
         JSL   L072E7C
         LDA   #$0001
         STA   $77
         BRL   L09A4E7
L09A417  PEA   ^L0540A9
         PEA   L0540A9
         JSL   L150BE8
         LDAL  L0540AB
         SEC
         SBC   $6B
         PHA
         PEA   $0050
         JSL   L1500F5
         PLX
         PLX
         STA   $71
         PHY
         PEI   $71
         PEA   $0000
         PEA   $0005
         JSL   L071A1B
         PLA
         STA   $71
         LDAL  L0540A9
         SEC
         SBC   $69
         PHA
         PEA   $0019
         JSL   L1500F5
         PLX
         PLX
         STA   $73
         PHY
         PEI   $73
         PEA   $0000
         PEA   $0002
         JSL   L071A1B
         PLA
         STA   $73
         LDA   $71
         INC
         PHA
         LDA   $73
         PEA   $0006
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $75
         LDA   $75
         DEC
         ASL
         ASL
         ASL
         TAX
         LDAL  L05233E,X
         PHA
         LDAL  L05233C,X
         PLX
         STA   $07
         STX   $09
         LDA   $75
         DEC
         ASL
         ASL
         ASL
         TAX
         TXA
         CLC
         ADC   #L05233C
         LDX   #^L05233C
         BCC   L09A4A2
         INX
L09A4A2  CLC
         ADC   #$0004
         BCC   L09A4A9
         INX
L09A4A9  STA   $7F
         STX   $81
         LDY   #$0002
         LDA   [$7F],Y
         TAX
         LDA   [$7F]
         STA   $5D
         STX   $5F
         LDA   $07
         ORA   $09
         BEQ   L09A4E7
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L15123D
         PEA   $0000
         PHD
         JSL   L09A178
L09A4E7  LDX   #$0000
         LDA   $77
         DEC
         BNE   L09A4F0
         INX
L09A4F0  PHX
         LDX   #$0000
         LDA   $77
         DEC
         DEC
         BNE   L09A4FB
         INX
L09A4FB  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L09A505
         BRL   L09A3D6
L09A505  PEI   $7D
         PEI   $7B
         JSL   L072634
         PEI   $79
         JSL   L0724F7
         JSL   L09AFB1
         LDA   $77
         DEC
         DEC
         BEQ   L09A53C
         LDA   $07
         ORA   $09
         BEQ   L09A53C
         PHY
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L096479
         PLA
         LSR
         BCS   L09A53C
         JSL   L072314
L09A53C  TSC
         CLC
         ADC   #$0082
         TCS
         PLD
         RTL

L09A544  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B9
         DEC
         BNE   L09A558
         JSL   L0A0F21
         BRA   L09A55C
L09A558  JSL   L140E96
L09A55C  PLY
         PLY
         PLD
         RTL

L09A560  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0550B7
         EOR   #$0001
         STA   L0550B7
         JSL   L087A30
         LDA   L0550D5
         LDX   L0550D7
         CLC
         ADC   #$00CE
         BCC   L09A582
         INX
L09A582  STA   $01
         STX   $03
         LDA   #$0020
         AND   [$01]
         BEQ   L09A5A3
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L151131
         PEA   ^L053201
         PEA   L053201
         JSL   L0855E6
L09A5A3  PLY
         PLY
         PLD
         RTL

L09A5A7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         LDY   #$00CE
         LDA   #$0020
         AND   [$01],Y
         CMP   #$0000
         BEQ   L09A5E4
         LDA   L0550E1
         LDX   L0550E3
         CMP   $0E
         BNE   L09A5D0
         CPX   $10
L09A5D0  BNE   L09A5D6
         JSL   L090A71
L09A5D6  PEI   $10
         PEI   $0E
         JSL   L0732B7
         JSL   L09AFB1
         BRA   L09A612
L09A5E4  PEI   $10
         PEI   $0E
         JSL   L15102F
         LDA   L0550ED
         LDX   L0550EF
         CMP   $0E
         BNE   L09A5F8
         CPX   $10
L09A5F8  BEQ   L09A602
         PEI   $10
         PEI   $0E
         JSL   L1511C8
L09A602  PEI   $10
         PEI   $0E
         JSL   L151131
         PEI   $10
         PEI   $0E
         JSL   L0A3183
L09A612  LDA   $0C
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

L09A624  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2C
         SEC
         SBC   #$0001
         BVS   L09A637
         EOR   #$8000
L09A637  BPL   L09A63E
         LDA   #$0000
         BRA   L09A641
L09A63E  LDA   #$0001
L09A641  PHA
         LDA   $2C
         SEC
         SBC   #$0018
         BEQ   L09A651
         BVS   L09A64F
         EOR   #$8000
L09A64F  BMI   L09A656
L09A651  LDA   #$0000
         BRA   L09A659
L09A656  LDA   #$0001
L09A659  ORA   $01,S
         PLX
         LSR
         BCC   L09A662
         BRL   L09A7C9
L09A662  PHY
         PHY
         JSL   L150493
         PLA
         STA   $0D
         PLX
         STX   $0F
         LDY   #$001A
         LDA   [$0D],Y
         TAX
         DEY
         DEY
         LDA   [$0D],Y
         STA   $05
         STX   $07
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $09
         PLX
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         CLC
         ADC   #$0002
         BCC   L09A697
         INX
L09A697  STA   $01
         STX   $03
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L09A6AC
         INX
L09A6AC  STA   $1D
         STX   $1F
         LDA   [$1D]
         LDY   #$0002
         STA   [$01],Y
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   [$1D]
         STA   [$01]
         LDY   #$0002
         LDA   #$0052
         CLC
         ADC   [$01],Y
         LDY   #$0006
         STA   [$01],Y
         LDA   #$0048
         CLC
         ADC   [$01]
         LDY   #$0004
         STA   [$01],Y
         LDA   $09
         LDX   $0B
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
         LDA   $2C
         DEC
         PHA
         PEA   $0003
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         LDA   $2C
         DEC
         PHA
         PEA   $0003
         JSL   L150318
         PLX
         PLX
         STA   $13
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         CLC
         ADC   #$0002
         BCC   L09A71F
         INX
L09A71F  STA   $1D
         STX   $1F
         LDA   $13
         PEA   $001C
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $17
         LDY   #$002E
         LDA   [$26],Y
         TAX
         DEY
         DEY
         LDA   [$26],Y
         STA   $1D
         STX   $1F
         LDA   $11
         PEA   $000C
         JSL   L150BEE
         PLA
         CLC
         ADC   [$1D]
         STA   $15
         LDA   $11
         BEQ   L09A758
         LDA   $15
         INC
         STA   $15
L09A758  LDA   #$001C
         CLC
         ADC   $17
         DEC
         DEC
         STA   $1B
         LDA   #$000C
         CLC
         ADC   $15
         DEC
         STA   $19
         LDA   $2A
         BEQ   L09A7A6
         JSL   L1510A1
         PEA   $8002
         JSL   L150BD6
         PEA   $0004
         PEA   $0002
         JSL   L151083
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $FFFF
         JSL   L151005
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L151418
         BRA   L09A7B3
L09A7A6  TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L150383
L09A7B3  PEI   $0B
         PEI   $09
         JSL   L151669
         LDA   $05
         LDX   $07
         LDY   #$0018
         STA   [$0D],Y
         INY
         INY
         TXA
         STA   [$0D],Y
L09A7C9  LDA   $24
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

L09A7DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $1B
         LDA   $34
         BPL   L09A7F2
         BRL   L09A96C
L09A7F2  CMP   #$0006
         BMI   L09A7FA
         BRL   L09A96C
L09A7FA  ASL
         TAX
         LDAL  L09A802,X
         PHA
         RTS

L09A802  DA    L09A80E-1
         DA    L09A853-1
         DA    L09A8E8-1
         DA    L09A914-1
         DA    L09A918-1
         DA    L09A962-1

L09A80E  PHY
         PHY
         JSL   L150493
         PLA
         STA   $17
         PLX
         STX   $19
         PEA   ^L0531F9
         PEA   L0531F9
         PEI   $19
         PEI   $17
         PEA   ^L053201
         PEA   L053201
         PEI   $2E
         PEI   $2C
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   L0550BB
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L09A624
         STZ   L055169
         STZ   L05516B
         BRL   L09A96C
L09A853  STZ   $36
         LDA   $2A
         STA   $0D
         LDA   $28
         STA   $0B
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEI   $2E
         PEI   $2C
         JSL   L1512CB
         PLA
         LSR
         BCC   L09A8D6
         LDA   $0B
         SEC
         SBC   [$2C]
         DEC
         DEC
         PHA
         PEA   $000C
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         LDA   $0D
         LDY   #$0002
         SEC
         SBC   [$2C],Y
         PHA
         PEA   $001C
         JSL   L1500F5
         PLX
         PLX
         STA   $13
         LDA   $13
         INC
         PHA
         LDA   $11
         PEA   $0003
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         ORA   #$8000
         STA   $36
         LDA   L05516B
         BEQ   L09A8D4
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L09A624
         LDA   L05516B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L09A624
L09A8D4  BRA   L09A8E5
L09A8D6  PEI   $2E
         PEI   $2C
         PEI   $0D
         PEI   $0B
         PEA   $02BC
         JSL   L09A984
L09A8E5  BRL   L09A96C
L09A8E8  LDY   #$0002
         LDA   [$30],Y
         TAX
         LDA   [$30]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         BNE   L09A903
         LDA   #$0056
         LDY   #$0002
         STA   [$01],Y
L09A903  LDY   #$0004
         LDA   [$01],Y
         BNE   L09A912
         LDA   #$004A
         LDY   #$0004
         STA   [$01],Y
L09A912  BRA   L09A96C
L09A914  STZ   $36
         BRA   L09A96C
L09A918  LDA   #$7FFF
         AND   $26
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         ORA   L055169
         PHA
         PEA   $0000
         PHD
         JSL   L09A624
         LDX   #$0000
         LDA   $26
         BPL   L09A93B
         INX
L09A93B  TXA
         PHA
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         STA   $1D
         PLA
         AND   $1D
         STA   L055169
         LDA   L055169
         BEQ   L09A95D
         LDA   #$7FFF
         AND   $26
         STA   L05516B
         BRA   L09A96C	; WAS L09A960
L09A95D  STZ   L05516B
         BRA   L09A96C
L09A962  LDA   #$02BC
         CLC
         ADC   $26
         STA   $36
         BRA   L09A96C
L09A96C  PEI   $1B
         JSL   L071AA4
         LDA   $24
         STA   $34
         LDA   $23
         STA   $33
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$0032
         TCS
         RTL

L09A984  PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $38
         PEI   $36
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         PEA   $FFEC
         PEA   $FFF6
         JSL   L151005
         STZ   L0551ED
         LDA   $32
         SEC
         SBC   #$0014
         BEQ   L09A9DE
         BVS   L09A9DC
         EOR   #$8000
L09A9DC  BMI   L09A9E3
L09A9DE  LDA   #$0000
         BRA   L09A9E6
L09A9E3  LDA   #$0001
L09A9E6  PHA
         PHY
         TDC
         CLC
         ADC   #$0032
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$001F
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L09AA0B
         BRL   L09AB54
L09AA0B  LDA   $30
         STA   L0551ED
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $17
         PLX
         STX   $19
         LDY   #$001A
         LDA   [$17],Y
         TAX
         DEY
         DEY
         LDA   [$17],Y
         STA   $13
         STX   $15
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $0F
         PLX
         STX   $11
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         CLC
         ADC   #$0002
         BCC   L09AA45
         INX
L09AA45  STA   $01
         STX   $03
         LDA   #$0000
         LDY   #$0002
         STA   [$01],Y
         LDA   #$000F
         STA   [$01]
         LDA   #$0280
         LDY   #$0006
         STA   [$01],Y
         LDA   #$00C8
         LDY   #$0004
         STA   [$01],Y
         LDA   $0F
         LDX   $11
         LDY   #$0018
         STA   [$17],Y
         INY
         INY
         TXA
         STA   [$17],Y
         LDA   $09
         SEC
         SBC   $05
         STA   $1D
         LDA   $0B
         SEC
         SBC   $07
         STA   $1B
         PHY
         PEI   $32
         PHY
         PEI   $1D
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $27
         PLA
         SEC
         SBC   $27
         SEC
         SBC   #$0006
         PHA
         PEA   $000F
         JSL   L072FA6
         PLA
         STA   $05
         PHY
         PEI   $34
         PHY
         PEI   $1B
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $27
         PLA
         SEC
         SBC   $27
         DEC
         DEC
         PHA
         PEA   $0000
         JSL   L072FA6
         PLA
         STA   $07
         LDA   $1D
         CLC
         ADC   $05
         CLC
         ADC   #$0008
         STA   $09
         LDA   $1B
         CLC
         ADC   $07
         CLC
         ADC   #$0004
         STA   $0B
         JSL   L1510A1
         PEA   $8002
         JSL   L150BD6
         PEA   $0002
         PEA   $0001
         JSL   L151083
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L151418
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         STA   $0D
         PEA   $0002
         JSL   L0706CF
         PHY
         PEA   $0000
         JSL   L150580
         PLA
         STA   $0D
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L151418
         JSL   L1510A1
         PEI   $11
         PEI   $0F
         JSL   L151669
         LDA   $13
         LDX   $15
         LDY   #$0018
         STA   [$17],Y
         INY
         INY
         TXA
         STA   [$17],Y
         LDA   #$FFFE
         AND   $07
         INC
         INC
         STAL  L0523CE
         LDA   $05
         INC
         STAL  L0523CC
L09AB54  LDA   $2E
         STA   $38
         LDA   $2D
         STA   $37
         LDA   $2B
         TCD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L09AB66  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $0E
         STZ   $01
L09AB72  LDX   $01
         LDA   #$00FF
         ANDL  L041573,X
         CMP   $0C
         BNE   L09ABB9
         LDA   L0551FB
         SEC
         SBC   #$0005
         BVS   L09AB8B
         EOR   #$8000
L09AB8B  BMI   L09AB96
         PEA   $0024
         JSL   L0727E0
         BRA   L09ABB2
L09AB96  LDA   L0550B9
         DEC
         BNE   L09ABA5
         PEA   $0040
         JSL   L0727E0
         BRA   L09ABB2
L09ABA5  LDA   $01
         LSR
         LSR
         CLC
         ADC   #$002A
         PHA
         JSL   L0998B0
L09ABB2  LDA   #$0001
         STA   $0E
         BRA   L09ABC4
L09ABB9  LDA   #$000B
         CMP   $01
         BEQ   L09ABC4
         INC   $01
         BRA   L09AB72
L09ABC4  LDA   $0A
         STA   $0C
         LDA   $09
         STA   $0B
         LDA   $07
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L09ABD5  ENT
         PHD
         TSC
         CLC
         ADC   #$FF5C
         TCS
         TCD
         LDA   L0551CB
         ORA   L0551CD
         BEQ   L09ABE8
         LDA   #$0001
L09ABE8  STA   $AA
         LDX   #$0000
         LDA   L0551CB
         ORA   L0551CD
         BNE   L09ABF6
         INX
L09ABF6  PHX
         LDA   L0551BB
         LDX   L0551BD
         CMP   L055039
         BNE   L09AC05
         CPX   L05503B
L09AC05  BNE   L09AC0C
         LDA   #$0000
         BRA   L09AC0F
L09AC0C  LDA   #$0001
L09AC0F  ORA   $01,S
         PLX
         LSR
         BCC   L09AC18
         BRL   L09AE62
L09AC18  PHY
         PHY
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $95
         PLX
         STX   $97
         LDA   $95
         ORA   $97
         BNE   L09AC35
         BRL   L09AE62
L09AC35  LDY   #$0002
         LDA   [$95],Y
         TAX
         LDA   [$95]
         CLC
         ADC   #$0020
         BCC   L09AC44
         INX
L09AC44  STA   $A1
         STX   $A3
         LDY   #$0002
         LDA   [$A1],Y
         TAX
         LDA   [$A1]
         STA   $9D
         STX   $9F
         LDA   L0551CB
         LDX   L0551CD
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0084
         JSL   L071EC5
         LDA   L0551CB
         LDX   L0551CD
         STA   $05
         STX   $07
         PHY
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551BF
         LDX   L0551C1
         TAY
         BNE   L09AC95
         DEX
L09AC95  DEC
         PHX
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07B2EC
         PLA
         LSR
         BCS   L09ACAC
         BRL   L09AE62
L09ACAC  LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551BF
         LDX   L0551C1
         PHX
         PHA
         PEA   $0001
         JSL   L07E171
         LDAL  L053AD3
         PHA
         LDAL  L053AD1
         PHA
         LDA   L0551BF
         LDX   L0551C1
         INC
         BNE   L09ACD9
         INX
L09ACD9  PHX
         PHA
         PEA   $0001
         JSL   L07E171
         LDAL  L053ACB
         TAX
         LDAL  L053AC9
         INC
         BNE   L09ACEF
         INX
L09ACEF  STAL  L053AC9
         TXA
         STAL  L053ACB
         LDA   #$0001
         LDX   #$0000
         CMP   L0551BF
         BNE   L09AD06
         CPX   L0551C1
L09AD06  BNE   L09AD17
         LDA   L0551CB
         LDX   L0551CD
         STAL  L053ACD
         TXA
         STAL  L053ACF
L09AD17  LDA   #$0001
         STA   L05504D
         PHY
         PHY
         PEI   $9F
         PEI   $9D
         JSL   L07721A
         PLA
         STA   $99
         PLX
         STX   $9B
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         STA   $01
         STX   $03
         LDY   #$0016
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         INC
         BNE   L09AD47
         INX
L09AD47  LDY   #$0014
         STA   [$01],Y
         INY
         INY
         TXA
         STA   [$01],Y
         LDY   #$001E
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $91
         STX   $93
         LDY   #$001A
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $8D
         STX   $8F
         PEI   $9F
         PEI   $9D
         PEA   $0001
         JSL   L074A24
         LDA   L0551C7
         ORA   L0551C9
         BNE   L09AD83
         BRL   L09AE41
L09AD83  LDA   L0551C7
         LDX   L0551C9
         CMP   $9D
         BNE   L09AD8F
         CPX   $9F
L09AD8F  BEQ   L09AD98
         PEA   $7327
         JSL   L07272E
L09AD98  LDAL  L053AC3
         TAX
         LDAL  L053AC1
         INC
         BNE   L09ADA5
         INX
L09ADA5  STAL  L053AC1
         TXA
         STAL  L053AC3
         LDA   L0551C3
         LDX   L0551C5
         STAL  L053AC5
         TXA
         STAL  L053AC7
         PHY
         PHY
         PEI   $93
         PEI   $91
         JSL   L07721A
         PLA
         STA   $99
         PLX
         STX   $9B
         LDA   $99
         ORA   $9B
         BEQ   L09ADFF
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$0018
         BCC   L09ADE2
         INX
L09ADE2  STA   $A1
         STX   $A3
         LDA   L0551C7
         LDX   L0551C9
         STA   [$A1]
         TXA
         LDY   #$0002
         STA   [$A1],Y
         PEI   $93
         PEI   $91
         PEA   $0001
         JSL   L074A24
L09ADFF  PHY
         PHY
         PEI   $8F
         PEI   $8D
         JSL   L07721A
         PLA
         STA   $99
         PLX
         STX   $9B
         LDA   $99
         ORA   $9B
         BEQ   L09AE41
         LDY   #$0002
         LDA   [$99],Y
         TAX
         LDA   [$99]
         CLC
         ADC   #$001C
         BCC   L09AE24
         INX
L09AE24  STA   $A1
         STX   $A3
         LDA   L0551C7
         LDX   L0551C9
         STA   [$A1]
         TXA
         LDY   #$0002
         STA   [$A1],Y
         PEI   $8F
         PEI   $8D
         PEA   $0001
         JSL   L074A24
L09AE41  LDA   L0551CB
         LDX   L0551CD
         STA   $89
         STX   $8B
         STZ   L0551CB
         STZ   L0551CD
         PEI   $8B
         PEI   $89
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L0968AD
L09AE62  STZ   L0551CB
         STZ   L0551CD
         STZ   L0551BF
         STZ   L0551C1
         STZ   L0551BB
         STZ   L0551BD
         STZ   L0551C7
         STZ   L0551C9
         STZ   L0551C3
         STZ   L0551C5
         TSC
         CLC
         ADC   #$00A4
         TCS
         PLD
         RTL

L09AE88  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L151454
         PEA   $0017
         JSL   L151331
         PLY
         PLY
         PLD
         RTL

L09AE9F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0551B9
         BNE   L09AEAE
         BRA   L09AECE
L09AEAE  PEA   $0000
         JSL   L09091E
         JSL   L1506ED
         PEA   $0022
         JSL   L151331
         PEA   $4022
         JSL   L15000C
         JSL   L15059E
         STZ   L0551B9
L09AECE  PLY
         PLY
         PLY
         PLD
         RTL

L09AED3  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L09AEE7
         BRL   L09AFA9
L09AEE7  LDX   #$0000
         LDA   #$FFFF
         CMP   L054FBB
         BNE   L09AEF3
         INX
L09AEF3  PHX
         LDX   #$0000
         LDA   L0550B9
         BNE   L09AEFD
         INX
L09AEFD  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L09AF0B
         PEA   $0001
         JSL   L09091E
L09AF0B  LDA   L054FBB
         INC
         STA   L054FBB
         LDA   L054FBB
         BEQ   L09AF1A
         BRL   L09AFA9
L09AF1A  LDA   L0550B9
         DEC
         BNE   L09AF41
         LDA   #$0001
         STAL  L0552BF
         LDA   #$0001
         STAL  L0552C1
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   $0000
         JSL   L1601A8
         BRA   L09AF60
L09AF41  LDA   L0550BD
         BNE   L09AF4E
         LDA   L0550BF
         STA   $09
         STZ   L0550BF
L09AF4E  JSL   L0A1625
         JSL   L0A15C0
         LDA   L0550BD
         BNE   L09AF60
         LDA   $09
         STA   L0550BF
L09AF60  JSL   L083E9E
         LDA   L055143
         BEQ   L09AF6D
         JSL   L087268
L09AF6D  LDA   L055131
         BEQ   L09AF8B
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L151131
         PEA   ^L053201
         PEA   L053201
         JSL   L0855E6
         STZ   L055131
L09AF8B  LDA   L05512D
         BEQ   L09AFA9
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L151131
         PEA   ^L0531E1
         PEA   L0531E1
         JSL   L0854D9
         STZ   L05512D
L09AFA9  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L09AFB1  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L09B242
         LDA   L0550E5
         LDX   L0550E7
         PHX
         PHA
         JSL   L09B242
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L09B242
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L09B242
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L09B242
         LDA   L0551B1
         ORA   L0551B3
         BNE   L09AFFF
         BRA   L09B050
L09AFFF  LDA   L0551B1
         LDX   L0551B3
         STA   $01
         STX   $03
L09B009  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0004
         BCC   L09B030
         INX
L09B030  STA   $09
         STX   $0B
         LDY   #$0002
         LDA   [$09],Y
         TAX
         LDA   [$09]
         PHX
         PHA
         JSL   L09B242
         LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         LDA   $01
         ORA   $03
         BNE   L09B009
L09B050  TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L09B058  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   #$0002
         STA   $03
L09B065  LDA   $03
         DEC
         ASL
         TAX
         LDAL  L0541A5,X
         PHA
         JSL   L1512C5
         LDA   #$000C
         CMP   $03
         BEQ   L09B07E
         INC   $03
         BRA   L09B065
L09B07E  LDA   L0551FB
         SEC
         SBC   #$0003
         BVS   L09B08A
         EOR   #$8000
L09B08A  BMI   L09B10A
         LDAL  L052D08
         PHA
         LDAL  L052D06
         PHA
         PEA   $012C
         JSL   L150671
         LDAL  L052D0C
         PHA
         LDAL  L052D0A
         PHA
         PEA   $04B0
         JSL   L150671
         LDAL  L052CF0
         PHA
         LDAL  L052CEE
         PHA
         PEA   $0514
         JSL   L150671
         LDA   L0550D5
         LDX   L0550D7
         CLC
         ADC   #$00CE
         BCC   L09B0CC
         INX
L09B0CC  STA   $05
         STX   $07
         LDA   #$0020
         AND   [$05]
         BEQ   L09B0E3
         LDA   L0550E9
         LDX   L0550EB
         PHX
         PHA
         JSL   L09A5A7
L09B0E3  LDA   L0550CD
         LDX   L0550CF
         CLC
         ADC   #$00CE
         BCC   L09B0F0
         INX
L09B0F0  STA   $05
         STX   $07
         LDA   #$0020
         AND   [$05]
         BEQ   L09B107
         LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L09A5A7
L09B107  BRL   L09B1EC
L09B10A  LDA   L0550B9
         DEC
         BNE   L09B189
         LDAL  L052D10
         PHA
         LDAL  L052D0E
         PHA
         PEA   $012C
         JSL   L150671
         LDAL  L052CEC
         PHA
         LDAL  L052CEA
         PHA
         PEA   $0578
         JSL   L150671
         LDAL  L052CF0
         PHA
         LDAL  L052CEE
         PHA
         PEA   $01F4
         JSL   L150671
         LDAL  L052CF4
         PHA
         LDAL  L052CF2
         PHA
         PEA   $0258
         JSL   L150671
         LDAL  L052CFC
         PHA
         LDAL  L052CFA
         PHA
         PEA   $02BC
         JSL   L150671
         LDAL  L052D00
         PHA
         LDAL  L052CFE
         PHA
         PEA   $0384
         JSL   L150671
         LDAL  L052D04
         PHA
         LDAL  L052D02
         PHA
         PEA   $03E8
         JSL   L150671
         BRA   L09B1EC
L09B189  LDAL  L052CE8
         PHA
         LDAL  L052CE6
         PHA
         PEA   $012C
         JSL   L150671
         LDAL  L052CEC
         PHA
         LDAL  L052CEA
         PHA
         PEA   $0190
         JSL   L150671
         LDAL  L052CF0
         PHA
         LDAL  L052CEE
         PHA
         PEA   $01F4
         JSL   L150671
         LDAL  L052CF4
         PHA
         LDAL  L052CF2
         PHA
         PEA   $0258
         JSL   L150671
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L09B1D9
         EOR   #$8000
L09B1D9  BPL   L09B1EC
         LDAL  L052CF8
         PHA
         LDAL  L052CF6
         PHA
         PEA   $02BC
         JSL   L150671
L09B1EC  PHY
         JSL   L1503A7
         PLA
         STA   $01
         JSL   L087268
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L09B1FE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   L0550E1
         LDX   L0550E3
         PHX
         PHA
         JSL   L151131
         PEA   ^L053249
         PEA   L053249
         JSL   L15123D
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150BD0
         PEI   $03
         PEI   $01
         JSL   L151131
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L09B242  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$00CE
         LDA   #$0020
         AND   [$0A],Y
         CMP   #$0000
         BEQ   L09B283
         PEI   $0C
         PEI   $0A
         JSL   L1506B3
         PHY
         LDY   #$001E
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         JSL   L1516AB
         PLA
         LSR
         BCS   L09B27B
         PEI   $0C
         PEI   $0A
         JSL   L0A3183
L09B27B  PEI   $0C
         PEI   $0A
         JSL   L1506AD
L09B283  LDA   $08
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

L09B294  ENT
         PHD
         TSC
         CLC
         ADC   #$FCB0
         TCS
         ADC   #$0269
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEI   $F2
         PEI   $F0
         PEA   $0100
         JSL   L0313BE
         LDA   L054FA1
         STA   $E1
         LDA   #$0000
         TAX
         STA   [$EC]
         TXA
         LDY   #$0002
         STA   [$EC],Y
         STZ   $FC
         PHY
         JSL   L095F79
         PLA
         LSR
         BCS   L09B2D2
         BRL   L09B4B3
L09B2D2  LDA   #$0001
         AND   $FA
         BNE   L09B2FE
         LDA   #$0001
         STA   $97
         LDA   #$E000
         AND   $FA
         LDX   #$0099
         STA   $00,X
         LDA   $F8
         LDX   #$009B
         STA   $00,X
         LDA   $F4
         LDX   $F6
         TXY
         LDX   #$009D
         STA   $00,X
         TYA
         STA   $02,X
         BRA   L09B321
L09B2FE  LDA   #$0002
         STA   $97
         LDA   #$8000
         LDX   #$0099
         STA   $00,X
         LDA   $F8
         LDX   #$009B
         STA   $00,X
         LDA   #$8000
         LDX   #$00A1
         STA   $00,X
         LDA   $F4
         LDX   #$00A3
         STA   $00,X
L09B321  LDA   #$0002
         AND   $FA
         BEQ   L09B367
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FD97
         PHA
         PEA   $0022
         JSL   L073002
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEA   ^L0409D9
         PEA   L0409D9
         PEA   $0000
         TDC
         CLC
         ADC   #$FE97
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L09B367  LDA   #$0003
         STA   $C9
         LDA   #$0003
         STA   $CF
         STZ   L0551AD
         PEA   $0079
         PEA   $001E
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$FF97
         PHA
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0097
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         JSL   L151639
         JSL   L09AE88
         LDA   #$0001
         STA   L0551AD
         LDA   $C1
         BNE   L09B3B3
         BRL   L09B4AD
L09B3B3  LDA   #$0001
         STA   $FC
         PHY
         PHY
         PEA   ^L0409DB
         PEA   L0409DB
         PEA   $0001
         JSL   L0730BE
         PLA
         STA   $D9
         PLX
         STX   $DB
         PEI   $D3
         PEI   $D1
         JSL   L07185A
         LDA   $CB
         LDX   $CD
         STA   $DD
         STX   $DF
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0002
         BCC   L09B3EC
         INX
L09B3EC  PHX
         PHA
         LDY   #$0002
         LDA   [$DD],Y
         PHA
         LDA   [$DD]
         PHA
         LDY   #$0002
         LDA   [$DD],Y
         TAX
         LDA   [$DD]
         CLC
         ADC   #$0002
         BCC   L09B406
         INX
L09B406  STA   $E3
         STX   $E5
         LDA   [$E3]
         INC
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L1511CE
         LDA   $DD
         LDX   $DF
         STA   $D5
         STX   $D7
         LDA   $EC
         LDX   $EE
         STA   $E3
         STX   $E5
         PHY
         PHY
         PEI   $DB
         PEI   $D9
         PEI   $D7
         PEI   $D5
         JSL   L072B9F
         PLA
         STA   [$E3]
         PLA
         LDY   #$0002
         STA   [$E3],Y
         LDA   #$0004
         AND   $FA
         BEQ   L09B449
         LDA   #$0001
L09B449  AND   L055281
         BEQ   L09B4A1
         LDA   #$0055
         CMP   $F8
         BNE   L09B465
         PEA   ^L0409DE
         PEA   L0409DE
         PEI   $DB
         PEI   $D9
         JSL   L0901A1
         BRA   L09B4A1
L09B465  LDX   #$0000
         LDA   #$00B3
         CMP   $F8
         BNE   L09B470
         INX
L09B470  PHX
         LDX   #$0000
         LDA   #$00FF
         CMP   $F8
         BNE   L09B47C
         INX
L09B47C  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L09B493
         PEA   ^L0409E5
         PEA   L0409E5
         PEI   $DB
         PEI   $D9
         JSL   L0901A1
         BRA   L09B4A1
L09B493  PEA   ^L0409F2
         PEA   L0409F2
         PEI   $DB
         PEI   $D9
         JSL   L0901A1
L09B4A1  PEI   $DB
         PEI   $D9
         PEI   $D7
         PEI   $D5
         JSL   L071825
L09B4AD  PEI   $E1
         JSL   L0724F7
L09B4B3  LDA   $EA
         STA   $FA
         LDA   $E9
         STA   $F9
         LDA   $E7
         TCD
         TSC
         CLC
         ADC   #$0362
         TCS
         RTL

