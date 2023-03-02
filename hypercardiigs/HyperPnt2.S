*
* HypercardGS
* segment: $1C HyperPnt2
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperPnt2.l
         lst   off

*---------------------------------------

         use   HyperPnt2.E
         use   HyperPnt2.X

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

L1C0000  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD8
         TCS
         TCD
         LDA   L0552B9
         EOR   #$0001
         STA   L0552B9
         LDA   L054FBB
         PHA
         LDX   #$0000
         PLA
         BPL   L1C001C
         INX
L1C001C  TXA
         PHA
         LDA   L055153
         AND   L05514F
         ORA   $01,S
         PLX
         PHA
         LDA   L055153
         EOR   #$0001
         AND   L055151
         ORA   $01,S
         PLX
         LSR
         BCC   L1C003A
         BRL   L1C0140
L1C003A  LDAL  L051DBC
         STA   $0B
         LDA   $0B
         INC
         INC
         STA   $0F
         LDAL  L051DBA
         SEC
         SBCL  L051DB2
         STA   $09
         LDAL  L051DB4
         CLC
         ADCL  L051DBA
         STA   $0D
         PHY
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCS   L1C0080
         BRL   L1C0140
L1C0080  PHY
         PHY
         JSL   L150493
         PLA
         STA   $21
         PLX
         STX   $23
         LDA   L0552FF
         BNE   L1C0094
         BRL   L1C011F
L1C0094  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   ^L05312F
         PEA   L05312F
         PEA   $0010
         JSL   L0313BE
         PEA   ^L051D46
         PEA   L051D46
         JSL   L1506A7
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
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDAL  L051D60
         EOR   #$FFFF
         INC
         PHA
         LDAL  L051D5E
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150383
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1C2CB9
         BRA   L1C0138
L1C011F  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L150383
L1C0138  PEI   $23
         PEI   $21
         JSL   L151131
L1C0140  TSC
         CLC
         ADC   #$0028
         TCS
         PLD
         RTL

L1C0148  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCC   L1C01BA
         LDA   L0552AF
         BEQ   L1C0188
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         BRA   L1C01A6
L1C0188  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L150383
L1C01A6  PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         JSL   L160870
L1C01BA  PLY
         PLY
         PLD
         RTL

L1C01BE  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1510A1
         LDA   L055303
         ASL
         PHA
         LDA   L055303
         PHA
         JSL   L151083
         LDA   L055231
         BEQ   L1C01E6
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
L1C01E6  PLY
         PLY
         PLD
         RTL

L1C01EA  ENT
	PHD
         TSC
         CLC
         ADC   #$FFCA
         TCS
         TCD
         PEI   $42
         PEI   $40
         PEI   $3E
         PEI   $3C
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L071937
         LDA   L055303
         SEC
         SBC   L055301
         STA   $01
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         LDA   $01
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   $01
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $2F
         PLX
         STX   $31
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEI   $42
         PEI   $40
         JSL   L1C07FC
         PEI   $3E
         PEI   $3C
         JSL   L1C03FE
         PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   ^L053179
         PEA   L053179
         PEA   $0020
         JSL   L0313BE
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         PEI   $42
         PEI   $40
         JSL   L1C07FC
         PEI   $3E
         PEI   $3C
         JSL   L1C03FE
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L151198
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0001
         JSL   L1601A8
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEI   $31
         PEI   $2F
         JSL   L151131
         LDA   $3A
         STA   $42
         LDA   $39
         STA   $41
         LDA   $37
         TCD
         TSC
         CLC
         ADC   #$0040
         TCS
         RTL

L1C02F4  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L055315
         LDX   L055317
         PHX
         PHA
         JSL   L07185A
         STZ   L055315
         STZ   L055317
         LDA   L0552BB
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L1C031E
         EOR   #$8000
L1C031E  BPL   L1C0343
         LDA   #$0001
         STA   $03
L1C0325  LDA   $03
         DEC
         ASL
         ASL
         TAX
         LDAL  L051DC0,X
         PHA
         LDAL  L051DBE,X
         PHA
         JSL   L07185A
         LDA   $03
         CMP   $01
         BEQ   L1C0343
         INC   $03
         BRA   L1C0325
L1C0343  STZ   L0552BB
         STZ   L055319
         JSL   L160234
         JSL   L16087E
         PEA   $0000
         JSL   L1601A8
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L1C035E  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         JSL   L0836B6
         LDA   L0552A3
         BEQ   L1C03CD
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         JSL   L0836B6
         BRA   L1C03EA
L1C03CD  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0003
         JSL   L08382C
L1C03EA  PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L081E53
         PLY
         PLY
         PLD
         RTL

L1C03FE  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055301
         ASL
         STA   $01
         LDA   $0C
         SEC
         SBC   $01
         PHA
         LDA   $0A
         SEC
         SBC   L055301
         PHA
         JSL   L1505DA
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

L1C042E  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PLY
         PLY
         PLD
         RTL

L1C043A  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         STZ   $1A
         LDA   #$4010
         STA   $01
         LDA   $0C
         BEQ   L1C0452
         LDA   #$4000
         STA   $01
L1C0452  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $03
         STX   $05
         LDA   [$03]
         LDY   #$0002
         ORA   [$03],Y
         BNE   L1C04BC
         PEA   $0000
         PEA   $7D00
         LDA   L0552FD
         PHA
         PEI   $01
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L151406
         LDA   #$0201
         CMPL  L05565D
         BNE   L1C04B2
         JSL   L151373
         PEA   $0000
         PEA   $7D00
         LDA   L0552FD
         PHA
         PEI   $01
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L151406
L1C04B2  LDAL  L05565D
         BEQ   L1C04BA
         BRA   L1C0538
L1C04BA  BRA   L1C04CC
L1C04BC  PEA   $0000
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L150D44
L1C04CC  PHY
         JSL   L094772
         PLA
         LSR
         BCS   L1C04E7
         PEA   $0002
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         JSL   L150D44
         BRA   L1C0538
L1C04E7  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $03
         STX   $05
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
         LDA   #$0080
         STA   [$0E]
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
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
         BCC   L1C052D
         INX
L1C052D  PHX
         PHA
         JSL   L082712
         LDA   #$0001
         STA   $1A
L1C0538  LDA   $0A
         STA   $18
         LDA   $09
         STA   $17
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L1C054A	ENT
         PHD
         TSC
         CLC
         ADC   #$FFD6
         TCS
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         LDA   L055303
         STA   $25
         PEA   $0001
         JSL   L0A1225
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L1C1ACF
         LDA   $21
         LDX   $23
         STA   $19
         STX   $1B
         JSL   L1C0F31
         JSL   L160376
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L08273B
         PEA   $0000
         JSL   L16088C
         JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   $0002
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L08273B
         LDA   #$FFFF
         STA   $17
         LDA   #$0001
         STA   $13
L1C05CF  TDC
         CLC
         ADC   #$001D
         PEA   $0000
         PHA
         JSL   L1C1ACF
         LDA   $1D
         LDX   $1F
         CMP   $19
         BNE   L1C05E6
         CPX   $1B
L1C05E6  BNE   L1C05ED
         LDA   #$0000
         BRA   L1C05F0
L1C05ED  LDA   #$0001
L1C05F0  STA   $11
         LDA   L05524B
         BNE   L1C062B
         LDA   L054FB7
         LDX   L054FB9
         STA   $27
         STX   $29
         LDA   #$0007
         AND   [$27]
         STA   $15
         LDA   $17
         CMP   $15
         BEQ   L1C062B
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L082570
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         LDA   $15
         STA   $17
         LDA   #$0001
         STA   $11
L1C062B  LDA   $11
         ORA   $13
         BEQ   L1C06AC
         PEI   $23
         PEI   $21
         PEI   $1F
         PEI   $1D
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L071937
         LDA   $0F
         INC
         INC
         STA   $0F
         LDA   $0D
         INC
         STA   $0D
         LDA   L05524B
         BNE   L1C06AC
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L081E5F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1C1407
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
L1C06AC  PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $1D
         LDX   $1F
         STA   $19
         STX   $1B
         STZ   $13
         PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1C06DA
         BRL   L1C05CF
L1C06DA  PHY
         JSL   L090A90
         PHY
         JSL   L09771E
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1C0727
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1C1407
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L082766
         PHY
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         EOR   #$0001
         STA   L0552B1
         BRA   L1C0761
L1C0727  LDA   $0D
         DEC
         STA   $27
         LDA   $09
         SEC
         SBC   $27
         BVS   L1C0736
         EOR   #$8000
L1C0736  BPL   L1C073D
         LDA   #$0000
         BRA   L1C0740
L1C073D  LDA   #$0001
L1C0740  PHA
         LDA   $0F
         DEC
         DEC
         STA   $27
         LDA   $0B
         SEC
         SBC   $27
         BVS   L1C0751
         EOR   #$8000
L1C0751  BPL   L1C0758
         LDA   #$0000
         BRA   L1C075B
L1C0758  LDA   #$0001
L1C075B  AND   $01,S
         PLX
         STA   L0552B1
L1C0761  LDA   L0552B1
         BEQ   L1C07B3
         STZ   L0552A9
         JSL   L1C3EDC
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1C2911
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051D06
         PEA   L051D06
         JSL   L1517EB
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         JSL   L1C1967
         LDA   #$0004
         STA   L0552A7
         BRA   L1C07BB
L1C07B3  LDA   L0552A7
         PHA
         JSL   L0A02BC
L1C07BB  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEI   $25
         JSL   L0A1225
         JSL   L1510A1
         LDA   L0552B1
         BEQ   L1C07F4
         JSL   L16089A
         JSL   L1C035E
         PHY
         JSL   L09771E
         PHY
         JSL   L090A90
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCC   L1C07F4
         JSL   L1C26E1
L1C07F4  TSC
         CLC
         ADC   #$002A
         TCS
         PLD
         RTL

L1C07FC  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055301
         ASL
         STA   $01
         LDA   $0C
         SEC
         SBC   $01
         PHA
         LDA   $0A
         SEC
         SBC   L055301
         PHA
         JSL   L1510C5
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

L1C082C  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDAL  L051ED8
         STA   $09
         LDAL  L051EDC
         SEP   #$20
         STA   $0B
         REP   #$20
         LDAL  L051EDA
         SEP   #$20
         STA   $0C
         REP   #$20
         PEI   $0B
         PEI   $09
         PEA   $0000
         JSL   L151663
         PEA   ^L051DB2
         PEA   L051DB2
         JSL   L150178
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L1C086B  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCC   L1C08ED
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L0552AF
         BEQ   L1C08BB
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         JSL   L0836B6
         BRA   L1C08CF
L1C08BB  PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15123D
L1C08CF  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         JSL   L160870
L1C08ED  PLY
         PLY
         PLD
         RTL

L1C08F1  ENT
         PHD
         TSC
         CLC
         ADC   #$FDC2
         TCS
         ADC   #$0147
         TCD
         LDA   L055051
         EOR   #$0001
         STA   $F1
         LDA   L055243
         ORA   $F1
         STA   $EF
         LDA   L054FB5
         EOR   #$0001
         ORA   $EF
         ORA   L0551F3
         STA   $ED
         JSL   L093F21
         PEA   ^L05259E
         PEA   L05259E
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0007
         JSL   L073002
         PEA   ^L052CCE
         PEA   L052CCE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05254E
         PEA   L05254E
         PEA   ^L0407F0
         PEA   L0407F0
         PEA   ^L052CBA
         PEA   L052CBA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05259E
         PEA   L05259E
         PEA   $00FD
         JSL   L15039B
         PEI   $ED
         PEA   $00FD
         JSL   L073077
         STZ   $E9
         LDAL  L0407F7
         SEP   #$20
         STA   $D1
         REP   #$20
         LDAL  L0407F8
         SEP   #$20
         STA   $BD
         REP   #$20
         LDA   L054FB5
         BNE   L1C09AC
         BRL   L1C0A87
L1C09AC  STZ   $E9
         LDA   L0551F3
         BEQ   L1C0A08
         LDA   L055111
         LDX   L055113
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         TXY
         LDX   #$FFB9
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FFB9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L1C09DE
         INX
L1C09DE  STA   $F3
         STX   $F5
         LDA   [$F3]
         PHA
         LDX   #$FFB9
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0022
         BCC   L1C09F5
         INX
L1C09F5  STA   $F3
         STX   $F5
         PLA
         CMP   [$F3]
         BNE   L1C0A03
         LDA   #$0000
         BRA   L1C0A06
L1C0A03  LDA   #$0001
L1C0A06  STA   $E9
L1C0A08  LDA   $E9
         BEQ   L1C0A49
         LDA   #$0001
         STA   $EB
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0008
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   ^L0407F9
         PEA   L0407F9
         PEA   $0005
         JSL   L0313BE
         BRA   L1C0A87
L1C0A49  LDA   L0552AB
         ORA   L0552B1
         BEQ   L1C0A87
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0009
         JSL   L073002
         PEA   $0014
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         PEA   ^L0407FE
         PEA   L0407FE
         PEA   $0008
         JSL   L0313BE
L1C0A87  LDA   L0552B1
         ORA   $E9
         ORA   L0552AB
         PHA
         LDA   L054FB5
         EOR   #$0001
         ORA   $01,S
         PLX
         STA   $EB
         PEA   ^L0525C6
         PEA   L0525C6
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0004
         JSL   L073002
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L052576
         PEA   L052576
         PEA   ^L040806
         PEA   L040806
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A5
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L0525B2
         PEA   L0525B2
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0005
         JSL   L073002
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L052562
         PEA   L052562
         PEA   ^L04080B
         PEA   L04080B
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05258A
         PEA   L05258A
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB9
         PHA
         PEA   $0006
         JSL   L073002
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBD
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L05253A
         PEA   L05253A
         PEA   ^L040811
         PEA   L040811
         TDC
         CLC
         ADC   #$00BD
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00A3
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         PEA   ^L0525C6
         PEA   L0525C6
         PEA   $00FB
         JSL   L15039B
         PEA   ^L0525B2
         PEA   L0525B2
         PEA   $00FC
         JSL   L15039B
         PEA   ^L05258A
         PEA   L05258A
         PEA   $00FE
         JSL   L15039B
         LDA   L05528F
         ORA   L0552AB
         ORA   L0552C5
         STA   $E7
         LDA   $ED
         AND   $EB
         PHA
         PEA   $00FB
         JSL   L073077
         PEI   $EB
         PEA   $00FC
         JSL   L073077
         LDA   $ED
         AND   $EB
         PHA
         PEA   $00FE
         JSL   L073077
         PEI   $E7
         PEA   $00FA
         JSL   L073077
         PEI   $F1
         PEA   $01FC
         JSL   L073077
         PEI   $F1
         PEA   $01FD
         JSL   L073077
         PEI   $F1
         PEA   $01FE
         JSL   L073077
         PEI   $EF
         PEA   $0201
         JSL   L073077
         LDA   L055153
         PHA
         PEA   $0202
         JSL   L15167B
         LDA   #$0388
         STA   $E5
L1C0C51  LDA   $EF
         AND   $EB
         PHA
         PEI   $E5
         JSL   L073077
         LDA   #$038F
         CMP   $E5
         BEQ   L1C0C67
         INC   $E5
         BRA   L1C0C51
L1C0C67  LDA   $EF
         AND   $EB
         PHA
         PEA   $0391
         JSL   L073077
         LDA   $EF
         AND   $EB
         PHA
         PEA   $0392
         JSL   L073077
         PEI   $F1
         PEA   $0394
         JSL   L073077
         PEI   $EF
         PEA   $0395
         JSL   L073077
         LDA   L055313
         PHA
         PEA   $03E9
         JSL   L15167B
         LDA   L0552FF
         PHA
         PEA   $03EA
         JSL   L15167B
         LDA   L055219
         PHA
         PEA   $03EB
         JSL   L15167B
         LDA   L0550B5
         SEC
         SBC   #$0010
         BEQ   L1C0CC2
         BVS   L1C0CC0
         EOR   #$8000
L1C0CC0  BMI   L1C0CC7
L1C0CC2  LDA   #$0000
         BRA   L1C0CCA
L1C0CC7  LDA   #$0001
L1C0CCA  AND   $F1
         PHA
         PEA   $03EF
         JSL   L073077
         PEI   $EF
         PEA   $03F0
         JSL   L073077
         LDA   L0550B7
         PHA
         PEA   $03F3
         JSL   L15167B
         LDA   L05530B
         PHA
         PEA   $03F4
         JSL   L15167B
         LDA   L055311
         PHA
         PEA   $03F5
         JSL   L15167B
         LDA   L055311
         EOR   #$0001
         PHA
         PEA   $03F6
         JSL   L073077
         LDA   L055309
         PHA
         PEA   $03F6
         JSL   L15167B
         PEI   $EF
         PEA   $057D
         JSL   L073077
         PEA   $0000
         PEA   $0000
         PEA   $01F4
         JSL   L1505D4
         TSC
         CLC
         ADC   #$023E
         TCS
         PLD
         RTL

L1C0D35  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0551F3
         BEQ   L1C0DB1
         LDA   L055111
         LDX   L055113
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0020
         BCC   L1C0D5B
         INX
L1C0D5B  STA   $01
         STX   $03
         LDA   [$01]
         PHA
         LDA   L055111
         LDX   L055113
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0022
         BCC   L1C0D7B
         INX
L1C0D7B  STA   $01
         STX   $03
         PLA
         CMP   [$01]
         BEQ   L1C0D92
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L15058C
         BRA   L1C0DAF
L1C0D92  PEA   ^L053251
         PEA   L053251
         PEA   $0000
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L151651
         JSL   L09B1FE
         JSL   L097700
L1C0DAF  BRA   L1C0DF1
L1C0DB1  PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCC   L1C0DF1
         JSL   L1C3F07
         JSL   L160870
         JSL   L16087E
         LDX   #$0000
         LDA   #$0005
         CMP   L0550BB
         BNE   L1C0DD5
         INX
L1C0DD5  PHX
         LDX   #$0000
         LDA   #$0004
         CMP   L0550BB
         BNE   L1C0DE2
         INX
L1C0DE2  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L1C0DF1
         LDA   L0552A7
         PHA
         JSL   L0A02BC
L1C0DF1  PLY
         PLY
         PLD
         RTL

L1C0DF5  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$02BC
         CLC
         ADC   $0A
         STA   $0A
         LDA   $0C
         SEC
         SBC   #$0004
         BPL   L1C0E10
         BRL   L1C0EC4
L1C0E10  CMP   #$000F
         BMI   L1C0E18
         BRL   L1C0EC4
L1C0E18  ASL
         TAX
         LDAL  L1C0E20,X
         PHA
         RTS

L1C0E20  DA    L1C0E3E-1
         DA    L1C0E47-1
         DA    L1C0E50-1
         DA    L1C0E59-1
         DA    L1C0E61-1
         DA    L1C0E81-1
         DA    L1C0EC4-1
         DA    L1C0EBE-1
         DA    L1C0EBE-1
         DA    L1C0E87-1
         DA    L1C0EBE-1
         DA    L1C0EBE-1
         DA    L1C0E95-1
         DA    L1C0EB6-1
         DA    L1C0EBE-1

L1C0E3E  JSL   L1C2513
         BRL   L1C0EDA
         BRA   L1C0EC4
L1C0E47  JSL   L1C26E1
         BRL   L1C0EDA
         BRA   L1C0EC4
L1C0E50  JSL   L1C3162
         BRL   L1C0EDA
         BRA   L1C0EC4
L1C0E59  JSL   L1603BC
         BRA   L1C0EDA
         BRA   L1C0EC4
L1C0E61  LDA   L055051
         AND   L055245
         EOR   #$0001
         CMP   #$0000
         BNE   L1C0E77
         PHY
         JSL   L1C19FB
         PLA
         BEQ   L1C0E7F
L1C0E77  JSL   L1C2513
         JSL   L1C0D35
L1C0E7F  BRA   L1C0EC4
L1C0E81  JSL   L1603AE
         BRA   L1C0EC4
L1C0E87  LDA   L0550DD
         LDX   L0550DF
         PHX
         PHA
         JSL   L09A5A7
         BRA   L1C0EC4
L1C0E95  PHY
         PEA   ^L051EBE
         PEA   L051EBE
         PEA   $0001
         JSL   L1602CE
         PLA
         LSR
         BCC   L1C0EB2
         JSL   L1C082C
         PEA   $0001
         JSL   L1C3B67
L1C0EB2  BRA   L1C0EDA
         BRA   L1C0EC4
L1C0EB6  JSL   L1603D8
         BRA   L1C0EDA
         BRA   L1C0EC4
L1C0EBE  JSL   L09A560
         BRA   L1C0EC4
L1C0EC4  LDA   $0A
         SEC
         SBC   #$02C0
         BVS   L1C0ECF
         EOR   #$8000
L1C0ECF  BPL   L1C0EDA
         PEA   $02BC
         PEI   $0A
         JSL   L09971B
L1C0EDA  LDA   $08
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

L1C0EEB  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         PEA   $0000
         JSL   L16088C
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L1C1407
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1C0F31  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L090A71
         JSL   L1C02F4
         PLY
         PLY
         PLD
         RTL

L1C0F45  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   L0551F3
         BEQ   L1C0FC4
         LDA   L055111
         LDX   L055113
         STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0020
         BCC   L1C0F6B
         INX
L1C0F6B  STA   $37
         STX   $39
         LDA   [$37]
         PHA
         LDA   L055111
         LDX   L055113
         STA   $37
         STX   $39
         LDY   #$0002
         LDA   [$37],Y
         TAX
         LDA   [$37]
         CLC
         ADC   #$0022
         BCC   L1C0F8B
         INX
L1C0F8B  STA   $37
         STX   $39
         PLA
         CMP   [$37]
         BNE   L1C0F97
         BRL   L1C116D
L1C0F97  LDA   $40
         BEQ   L1C0FA9
         LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L150C34
         BRA   L1C0FB5
L1C0FA9  LDA   L055111
         LDX   L055113
         PHX
         PHA
         JSL   L15019D
L1C0FB5  JSL   L150395
         JSL   L15136D
         JSL   L150723
         BRL   L1C116D
L1C0FC4  LDA   L0552AB
         BEQ   L1C0FCD
         JSL   L1C2622
L1C0FCD  LDA   L0552B1
         BNE   L1C0FDC
         PEA   $0004
         JSL   L0727E0
         BRL   L1C116D
L1C0FDC  JSL   L1605B4
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L08295E
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L082766
         PHY
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L081A64
         PHY
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         JSL   L081A64
         PLA
         STA   $37
         PLA
         AND   $37
         BEQ   L1C1052
         PEA   $001F
         JSL   L0727E0
         BRL   L1C116D
L1C1052  JSL   L093A99
         JSL   L090A71
         LDA   L055051
         AND   L055245
         AND   $40
         BEQ   L1C106B
         JSL   L0903A6
         BRL   L1C116D
L1C106B  PHY
         JSL   L1C19FB
         PLA
         LSR
         BCC   L1C1077
         BRL   L1C116D
L1C1077  JSL   L150395
         JSL   L15136D
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PHY
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1502FA
         PLA
         STA   $23
         PLX
         STX   $25
         LDA   L0552AF
         BEQ   L1C10BA
         PEA   $3039
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L150556
L1C10BA  PEA   ^L053259
         PEA   L053259
         JSL   L150FF9
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         JSL   L151400
         PEI   $25
         PEI   $23
         JSL   L0718BF
         PHY
         PHY
         PHY
         PEI   $25
         PEI   $23
         JSL   L151301
         PEA   $0001
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         JSL   L0732FD
         PLA
         STA   $21
         PEI   $25
         PEI   $23
         JSL   L07191C
         PEI   $25
         PEI   $23
         JSL   L1502F4
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         LDA   $21
         BEQ   L1C1158
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L085F5A
         PHY
         PEA   $0000
         PEA   $0020
         PEA   $8002
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L0732FD
         PLA
         STA   $21
L1C1158  LDA   $21
         BEQ   L1C1166
         LDA   $40
         BEQ   L1C1164
         JSL   L1C0D35
L1C1164  BRA   L1C116D
L1C1166  PEA   $0020
         JSL   L0727E0
L1C116D  LDA   $3E
         STA   $40
         LDA   $3D
         STA   $3F
         LDA   $3B
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L1C117F  PHD
         TSC
         CLC
         ADC   #$FFDC
         TCS
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150300
         PEA   $0000
         PEA   ^L051D72
         PEA   L051D72
         JSL   L150306
         PEA   ^L051D72
         PEA   L051D72
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0020
         JSL   L0313BE
         LDA   $28
         STA   $2C
         LDA   $27
         STA   $2B
         LDA   $25
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1C11CC  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         PHY
         JSL   L09ABD5
         PLA
         LSR
         BCC   L1C11E0
         BRL   L1C137A
L1C11E0  LDA   L0552C5
         BNE   L1C11E8
         BRL   L1C1343
L1C11E8  LDA   L055315
         ORA   L055317
         BEQ   L1C11F3
         LDA   #$0001
L1C11F3  ORA   L055319
         BEQ   L1C11FC
         JSL   L1C0F31
L1C11FC  PHY
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L081A64
         PLA
         LSR
         BCS   L1C1245
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552CD
         LDX   L0552CF
         PHX
         PHA
         PEA   ^L0532B5
         PEA   L0532B5
         PEA   $FFFB
         JSL   L08382C
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L0552D1
         LDX   L0552D3
         PHX
         PHA
         PEA   ^L0532B5
         PEA   L0532B5
         PEA   $FFFB
         JSL   L08382C
L1C1245  PEA   ^L055137
         PEA   L055137
         PEA   ^L055289
         PEA   L055289
         JSL   L1C2DA6
         PEA   ^L0552AB
         PEA   L0552AB
         PEA   ^L05528F
         PEA   L05528F
         JSL   L1C2DA6
         PEA   ^L0552AF
         PEA   L0552AF
         PEA   ^L055293
         PEA   L055293
         JSL   L1C2DA6
         PEA   ^L0552A1
         PEA   L0552A1
         PEA   ^L05528B
         PEA   L05528B
         JSL   L1C2DA6
         PEA   ^L0552A3
         PEA   L0552A3
         PEA   ^L05528D
         PEA   L05528D
         JSL   L1C2DA6
         PEA   ^L0552B1
         PEA   L0552B1
         PEA   ^L055295
         PEA   L055295
         JSL   L1C2DA6
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051D96
         PEA   L051D96
         JSL   L0A0000
         PEA   ^L0552A9
         PEA   L0552A9
         PEA   ^L055291
         PEA   L055291
         JSL   L1C2DCC
         PEA   ^L051D9E
         PEA   L051D9E
         PEA   ^L051D92
         PEA   L051D92
         JSL   L1C2DF2
         PEA   $0000
         PHD
         JSL   L1C117F
         LDA   L05529F
         AND   L0552B1
         BEQ   L1C1330
         JSL   L1C3EDC
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L15123D
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   L0552AF
         BEQ   L1C1330
         STZ   L0552AF
         JSL   L1C26E1
L1C1330  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   $0000
         JSL   L1601A8
         BRA   L1C137A
L1C1343  LDA   L05528F
         ORA   L0552AB
         BEQ   L1C137A
         PEA   ^L0552AB
         PEA   L0552AB
         PEA   ^L05528F
         PEA   L05528F
         JSL   L1C2DA6
         PEA   $0000
         PHD
         JSL   L1C117F
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0000
         JSL   L1601A8
L1C137A  TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L1C1382	ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         LDA   L0552FF
         BEQ   L1C13AA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L082712
         BRA   L1C13EB
L1C13AA  PEA   ^L0532BD
         PEA   L0532BD
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L1C13BD
         INX
L1C13BD  STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         STA   $0B
         STX   $0D
         LDY   #$0002
         LDA   [$0B],Y
         TAX
         LDA   [$0B]
         CLC
         ADC   #$0002
         BCC   L1C13DC
         INX
L1C13DC  PHX
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L081E5F
L1C13EB  PEA   $0000
         JSL   L16088C
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L1C1407
         TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1C1407  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $16
         PEI   $14
         PEA   $0008
         JSL   L0313BE
         LDA   L0552FF
         BEQ   L1C1466
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051D46
         PEA   L051D46
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   ^L051D4E
         PEA   L051D4E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1C2CB9
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
         BRA   L1C1473
L1C1466  TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L087BAE
L1C1473  LDA   $12
         STA   $16
         LDA   $11
         STA   $15
         LDA   $0F
         TCD
         TSC
         CLC
         ADC   #$0014
         TCS
         RTL

L1C1485	ENT
         PHD
         TSC
         CLC
         ADC   #$FFB4
         TCS
         TCD
         LDA   L0552AB
         ORA   L0552B1
         BEQ   L1C14AF
         PHA
         LDA   L055105
         LDX   L055107
         CMP   $52
         BNE   L1C14A2
         CPX   $54
L1C14A2  BEQ   L1C14A9
         LDA   #$0000
         BRA   L1C14AC
L1C14A9  LDA   #$0001
L1C14AC  AND   $01,S
         PLX
L1C14AF  STA   $43
         LDA   L0552AB
         ORA   L0552B1
         BEQ   L1C14D3
         PHA
         LDA   L055101
         LDX   L055103
         CMP   $52
         BNE   L1C14C6
         CPX   $54
L1C14C6  BEQ   L1C14CD
         LDA   #$0000
         BRA   L1C14D0
L1C14CD  LDA   #$0001
L1C14D0  AND   $01,S
         PLX
L1C14D3  STA   $41
         LDA   $52
         BEQ   L1C14DC
         LDA   #$0001
L1C14DC  ORA   $41
         ORA   $43
         ORA   L0552FF
         BNE   L1C14E8
         BRL   L1C1617
L1C14E8  PEI   $54
         PEI   $52
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0000
         JSL   L08382C
         TDC
         CLC
         ADC   #$002F
         STA   $37
         STZ   $39
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         PEI   $39
         PEI   $37
         JSL   L081E5F
         LDA   L0552FF
         BEQ   L1C1534
         PEI   $39
         PEI   $37
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1C1534  LDA   $41
         BEQ   L1C159E
         LDA   L0552A9
         DEC
         BEQ   L1C1567
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $39
         PEI   $37
         PEA   $0001
         JSL   L0836B6
L1C1567  LDA   L0552A9
         BEQ   L1C159E
         LDA   L0552E5
         LDX   L0552E7
         STA   $45
         STX   $47
         LDA   L0552A9
         DEC
         DEC
         BNE   L1C1587
         LDA   L0552C9
         LDX   L0552CB
         STA   $45
         STX   $47
L1C1587  PEI   $47
         PEI   $45
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $39
         PEI   $37
         PEA   $0003
         JSL   L08382C
L1C159E  LDA   $43
         BEQ   L1C15F9
         LDA   L0552A9
         DEC
         DEC
         BEQ   L1C15D2
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $39
         PEI   $37
         PEA   $0001
         JSL   L0836B6
L1C15D2  LDA   L0552A9
         DEC
         BEQ   L1C15F9
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053239
         PEA   L053239
         PEI   $39
         PEI   $37
         PEI   $39
         PEI   $37
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
L1C15F9  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         LDA   L0550FD
         LDX   L0550FF
         STA   $52
         STX   $54
L1C1617  LDA   L0552FF
         BEQ   L1C164D
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051D46
         PEA   L051D46
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   ^L051D4E
         PEA   L051D4E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051D5E
         PEA   L051D5E
         JSL   L1C2CB9
         BRA   L1C165B
L1C164D  PEI   $54
         PEI   $52
         PEA   ^L053259
         PEA   L053259
         JSL   L083985
L1C165B  PHY
         JSL   L0727BF
         PLA
         STA   $3D
         PEA   $0000
         JSL   L16088C
L1C166A  PHY
         PEA   $000A
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150070
         PHY
         JSL   L09771E
         PLA
         EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCC   L1C166A
         PHY
         PEA   $0020
         PEA   $0000
         JSL   L150B28
         PLA
         STA   $3B
         PEA   ^L05311F
         PEA   L05311F
         JSL   L082712
         PEA   ^L053259
         PEA   L053259
         JSL   L1C1407
         PEI   $3D
         JSL   L0724F7
         LDA   $50
         STA   $54
         LDA   $4F
         STA   $53
         LDA   $4D
         TCD
         TSC
         CLC
         ADC   #$0052
         TCS
         RTL

L1C16C4	ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         LDA   L0552C3
         BEQ   L1C16D4
         BRL   L1C175A
L1C16D4  LDA   L0552FF
         BEQ   L1C16F1
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
         BRA   L1C16FE
L1C16F1  TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L082712
L1C16FE  PEA   $0000
         JSL   L16088C
         LDA   L055153
         BEQ   L1C1719
         PEA   $0000
         PEA   $0002
         PEA   $0000
         JSL   L084F9B
         BRA   L1C1729
L1C1719  PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         JSL   L081517
L1C1729  TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L1C1407
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   $0000
         JSL   L16088C
L1C175A  PHY
         PEA   $0028
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150070
         PLA
         LSR
         BCC   L1C1782
         PHY
         LDA   $03
         AND   #$00FF
         PHA
         JSL   L09AB66
         PLA
         LSR
         BCS   L1C1782
         JSL   L072314
L1C1782  PHY
         JSL   L09771E
         PHY
         JSL   L090A90
         PLA
         STA   $37
         PLA
         AND   $37
         EOR   #$0001
         BEQ   L1C175A
         LDA   L0552C3
         BNE   L1C17C9
         PEA   ^L053127
         PEA   L053127
         PEA   ^L05311F
         PEA   L05311F
         JSL   L081E53
         PEA   ^L05311F
         PEA   L05311F
         JSL   L1C1407
         PEA   ^L05311F
         PEA   L05311F
         PEA   ^L053127
         PEA   L053127
         PEA   $0008
         JSL   L0313BE
L1C17C9  TSC
         CLC
         ADC   #$003A
         TCS
         PLD
         RTL

L1C17D1	ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   L055303
         STA   $17
         PEA   $0001
         JSL   L0A1225
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         JSL   L1C1ACF
         JSL   L1608A8
         PHY
         TDC
         CLC
         ADC   #$000B
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L1512CB
         PLA
         LSR
         BCC   L1C1858
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   $0008
         JSL   L0313BE
         PEA   ^L0532BD
         PEA   L0532BD
         PEI   $0D
         PEI   $0B
         LDA   $0D
         INC
         INC
         PHA
         LDA   $0B
         INC
         PHA
         JSL   L15100B
         PEA   $0000
         JSL   L16088C
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
L1C1858  JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PHY
         LDA   #$FFFE
         AND   $0D
         PHA
         PEI   $0B
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         JSL   L1608B6
         PLA
         STA   $01
         LDA   L0550B5
         SEC
         SBC   #$0010
         BEQ   L1C18AD
         BVS   L1C188C
         EOR   #$8000
L1C188C  BPL   L1C18AD
         LDA   #$000F
         CMP   $01
         BNE   L1C18A1
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         BRA   L1C18AB
L1C18A1  PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
L1C18AB  BRA   L1C18CB
L1C18AD  LDA   L0550B5
         DEC
         CMP   $01
         BNE   L1C18C1
         PEA   ^L051D06
         PEA   L051D06
         JSL   L151198
         BRA   L1C18CB
L1C18C1  PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
L1C18CB  PEI   $0D
         PEI   $0B
         PEI   $0D
         PEI   $0B
         JSL   L1C01EA
         PEI   $0D
         PEI   $0B
         JSL   L094E90
         LDA   $0B
         LDX   $0D
         STA   $03
         STX   $05
L1C18E7  TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L1C1ACF
         TDC
         CLC
         ADC   #$0007
         PEA   $0000
         PHA
         JSL   L09457C
         LDA   $09
         EOR   $05
         PHA
         LDA   $07
         EOR   $03
         ORA   $01,S
         PLX
         CMP   #$0000
         BEQ   L1C1926
         PEI   $05
         PEI   $03
         PEI   $09
         PEI   $07
         JSL   L1C01EA
         LDA   $07
         LDX   $09
         STA   $03
         STX   $05
L1C1926  PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BEQ   L1C18E7
         JSL   L1510A1
         PEI   $17
         JSL   L0A1225
         JSL   L1608C4
         TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L1C1947  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCC   L1C1963
         JSL   L1C1967
         JSL   L160870
L1C1963  PLY
         PLY
         PLD
         RTL

L1C1967  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L1C3F07
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $FFFE
         JSL   L0836B6
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0003
         JSL   L08382C
         PEA   ^L053209
         PEA   L053209
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         JSL   L16089A
         PLY
         PLY
         PLD
         RTL

L1C19FB  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         LDA   L05524B
         BEQ   L1C1A0C
         BRA   L1C1A6C
L1C1A0C  LDA   L055241
         EOR   #$0001
         AND   L05523D
         BEQ   L1C1A19
         BRA   L1C1A6C
L1C1A19  LDA   L055153
         EOR   #$0001
         AND   L055151
         BEQ   L1C1A44
         LDA   #$0001
         STA   $0A
         PHY
         PEA   $002D
         JSL   L0726F9
         PLA
         LSR
         BCC   L1C1A44
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0001
         JSL   L099F77
L1C1A44  LDA   L055153
         AND   L05514F
         BEQ   L1C1A6C
         LDA   #$0001
         STA   $0A
         PHY
         PEA   $002E
         JSL   L0726F9
         PLA
         LSR
         BCC   L1C1A6C
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0001
         JSL   L099EA4
L1C1A6C  PLY
         PLY
         PLD
         RTL

L1C1A70  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$0002
         CLC
         ADC   $0E
         LDX   $10
         BCC   L1C1A83
         INX
L1C1A83  STA   $01
         STX   $03
         PHY
         LDY   #$0002
         LDA   [$0E],Y
         PHA
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         LDY   #$0006
         LDA   [$0A],Y
         PHA
         JSL   L071A1B
         PLA
         STA   [$01]
         LDA   $0E
         LDX   $10
         STA   $01
         STX   $03
         PHY
         LDA   [$0E]
         PHA
         LDA   [$0A]
         PHA
         LDY   #$0004
         LDA   [$0A],Y
         PHA
         JSL   L071A1B
         PLA
         STA   [$01]
         LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         LDA   $05
         TCD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L1C1ACF  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEI   $0C
         PEI   $0A
         JSL   L1608D2
         PEI   $0C
         PEI   $0A
         PEA   ^L051DA2
         PEA   L051DA2
         JSL   L1C1A70
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

L1C1AFE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         BEQ   L1C1B14
         PEA   ^L051DBA
         PEA   L051DBA
         JSL   L1608D2
L1C1B14  JSL   L1C0F31
         JSL   L160376
         JSL   L1C082C
         LDAL  L051DBC
         TAX
         LDAL  L051DBA
         STAL  L051E0E
         TXA
         STAL  L051E10
         LDA   $0A
         BEQ   L1C1B3D
         LDAL  L051E10
         STA   L0552BD
L1C1B3D  LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L1C1B4A
         JSL   L151472
L1C1B4A  JSL   L1C3F07
         LDA   #$0001
         STA   L055319
         STZ   L0552A9
         LDA   #$0001
         STA   L0552AB
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

L1C1B6D	ENT
         PHD
         TSC
         CLC
         ADC   #$FFAA
         TCS
         TCD
         LDA   L055303
         SEC
         SBC   L055301
         STA   $45
         LDA   #$0001
         STA   $43
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L08273B
L1C1B8D  TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         JSL   L1608D2
         PEI   $62
         PEI   $60
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $0002
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003B
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0037
         PEA   $0000
         PHA
         JSL   L1608E0
         LDA   $4D
         EOR   $51
         PHA
         LDA   $4B
         EOR   $4F
         ORA   $01,S
         PLX
         CMP   #$0000
         BNE   L1C1BDF
         LDA   #$0000
         BRA   L1C1BE2
L1C1BDF  LDA   #$0001
L1C1BE2  ORA   $43
         BNE   L1C1BE9
         BRL   L1C1C95
L1C1BE9  PEA   $0001
         JSL   L16088C
         PEA   ^L0532BD
         PEA   L0532BD
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         PEI   $62
         PEI   $60
         PEI   $51
         PEI   $4F
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         JSL   L071937
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         LDA   $45
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   $45
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         JSL   L1C01BE
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEI   $62
         PEI   $60
         JSL   L1C07FC
         PEI   $51
         PEI   $4F
         JSL   L1C03FE
         PEA   ^L053127
         PEA   L053127
         TDC
         CLC
         ADC   #$002F
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E5F
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L1C1407
         LDA   $4F
         LDX   $51
         STA   $4B
         STX   $4D
         STZ   $43
L1C1C95  STZ   $01
         STZ   $47
         PHY
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L096BB1
         PLA
         LSR
         BCC   L1C1CBA
         LDA   #$0003
         CMP   $01
         BNE   L1C1CBA
         LDA   #$0001
         STA   $47
L1C1CBA  LDX   #$0000
         LDA   $01
         DEC
         DEC
         BNE   L1C1CC4
         INX
L1C1CC4  TXA
         ORA   $47
         BNE   L1C1CCC
         BRL   L1C1B8D
L1C1CCC  PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         JSL   L1C01BE
         LDA   $01
         DEC
         DEC
         BNE   L1C1CF7
         LDA   $07
         LDX   $09
         STA   L05522B
         STX   L05522D
         LDA   $0B
         LDX   $0D
         STAL  L052D60
         TXA
         STAL  L052D62
L1C1CF7  LDA   $4F
         LDX   $51
         STA   [$5C]
         TXA
         LDY   #$0002
         STA   [$5C],Y
         LDA   $47
         BEQ   L1C1D13
         LDA   $60
         LDX   $62
         STA   [$5C]
         TXA
         LDY   #$0002
         STA   [$5C],Y
L1C1D13  LDA   $47
         STA   $64
         LDA   $5A
         STA   $62
         LDA   $59
         STA   $61
         LDA   $57
         TCD
         TSC
         CLC
         ADC   #$0060
         TCS
         RTL

L1C1D29	ENT
         PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L1608EE
         PHY
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         JSL   L1512CB
         PLA
         LSR
         BCS   L1C1D59
         BRL   L1C1EA6
L1C1D59  PHY
         JSL   L073CDF
         PLA
         STA   $27
         JSL   L1608A8
         LDA   #$0001
         STA   $01
         PHY
         LDA   #$FFFE
         AND   $25
         PHA
         PEI   $23
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         JSL   L1608B6
         PLA
         LDX   #$0003
         STA   $00,X
         JSL   L1C3F07
         PEA   ^L053209
         PEA   L053209
         PEA   ^L053259
         PEA   L053259
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L053259
         PEA   L053259
         PEI   $25
         PEI   $23
         PEA   $1001
         PEA   ^L051D06
         PEA   L051D06
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151657
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053259
         PEA   L053259
         PEA   ^L053259
         PEA   L053259
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L082712
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L082766
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         LSR
         BCS   L1C1E51
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L15037D
         JSL   L1510A1
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
L1C1E51  PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         PEA   $0001
         JSL   L1601A8
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         PEI   $27
         JSL   L0724F7
         LDA   L054FB7
         LDX   L054FB9
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         STA   L05522B
         STX   L05522D
         LDA   #$0001
         STA   L055249
         JSL   L1608C4
L1C1EA6  TSC
         CLC
         ADC   #$002C
         TCS
         PLD
         RTL

L1C1EAE  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   L0552B1
         BNE   L1C1EBF
         JSL   L1C2513
L1C1EBF  PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCS   L1C1ECE
         BRL   L1C1F62
L1C1ECE  PHY
         PHY
         JSL   L1608FC
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L083523
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $8001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L150B3A
         PLA
         STA   $01
         JSL   L160870
         JSL   L1C0F31
         LDA   L0552A7
         PHA
         JSL   L0A02BC
L1C1F62  PLY
         PLY
         PLY
         PLD
         RTL

L1C1F67  ENT
         PHD
         TSC
         CLC
         ADC   #$FFC6
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCS   L1C1F7E
         BRL   L1C23E4
L1C1F7E  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDAL  L051D9E
         SEC
         SBCL  L051DAA
         ASL
         STA   $37
         LDAL  L051DA0
         SEC
         SBC   $37
         STA   $1B
         LDAL  L051DAE
         SEC
         SBCL  L051D9E
         ASL
         CLC
         ADCL  L051DA0
         STA   $1F
         LDAL  L051D9E
         PHA
         PHY
         LDAL  L051DB0
         SEC
         SBCL  L051DA0
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $37
         PLA
         SEC
         SBC   $37
         STA   $19
         LDAL  L051D9E
         PHA
         PHY
         LDAL  L051DA0
         SEC
         SBCL  L051DAC
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $1D
         STZ   $33
         LDAL  L05325B
         SEC
         SBC   $1B
         STA   $31
         LDA   $31
         BMI   L1C2001
         BEQ   L1C2001
         LDA   $31
         STA   $33
L1C2001  LDAL  L05325F
         SEC
         SBC   $1F
         STA   $31
         LDA   $31
         BPL   L1C2015
         LDA   $31
         CLC
         ADC   $33
         STA   $33
L1C2015  STZ   $35
         LDAL  L053259
         SEC
         SBC   $19
         STA   $31
         LDA   $31
         BMI   L1C202A
         BEQ   L1C202A
         LDA   $31
         STA   $35
L1C202A  LDAL  L05325D
         SEC
         SBC   $1D
         STA   $31
         LDA   $31
         BPL   L1C203E
         LDA   $31
         CLC
         ADC   $35
         STA   $35
L1C203E  TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEI   $33
         PEI   $35
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $2F
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L16042C
         LDA   $35
         CLC
         ADCL  L051D9E
         STA   $37
         LDA   $1D
         SEC
         SBC   $37
         ASL
         STA   $37
         LDAL  L051DA0
         SEC
         SBC   $37
         STA   $13
         LDA   $35
         CLC
         ADCL  L051D9E
         SEC
         SBC   $19
         ASL
         CLC
         ADCL  L051DA0
         STA   $17
         LDAL  L051D9E
         PHA
         PHY
         LDA   $33
         CLC
         ADCL  L051DA0
         SEC
         SBC   $1B
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $37
         PLA
         SEC
         SBC   $37
         STA   $11
         LDAL  L051D9E
         PHA
         PHY
         LDA   $33
         CLC
         ADCL  L051DA0
         STA   $37
         LDA   $1F
         SEC
         SBC   $37
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $15
         LDA   $17
         SEC
         SBC   $13
         STA   $2D
         LDA   $15
         SEC
         SBC   $11
         STA   $2B
         LDA   #$000F
         CLC
         ADC   $2D
         LSR
         LSR
         AND   #$FFFC
         STA   $29
         LDA   $1F
         SEC
         SBC   $1B
         STA   $27
         LDA   $1D
         SEC
         SBC   $19
         STA   $25
         STZ   $01
         STZ   $03
         LDA   $2B
         STA   $05
         LDA   $2D
         STA   $07
         STZ   $09
         STZ   $0B
         LDA   $25
         STA   $0D
         LDA   $27
         STA   $0F
         LDA   $40
         BNE   L1C214C
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         LDA   $2D
         EOR   #$FFFF
         INC
         AND   #$000F
         LSR
         PHA
         JSL   L1501AF
L1C214C  LDA   L0552AF
         BNE   L1C2154
         BRL   L1C21F7
L1C2154  PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051E32
         PEA   L051E32
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $40
         BEQ   L1C219D
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L16090A
         BRA   L1C21B5
L1C219D  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L160918
L1C21B5  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051E32
         PEA   L051E32
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         BRA   L1C222D
L1C21F7  LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L085B3C
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L15123D
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
L1C222D  LDA   #$0001
         STA   L05529F
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L051EA2
         PEA   L051EA2
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $40
         BEQ   L1C227C
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L16090A
         BRA   L1C2294
L1C227C  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L160918
L1C2294  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051EA2
         PEA   L051EA2
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051E92
         PEA   L051E92
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $40
         BEQ   L1C231D
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L16090A
         BRA   L1C2335
L1C231D  LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEI   $2B
         PEI   $29
         JSL   L160918
L1C2335  LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051E92
         PEA   L051E92
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L053127
         PEA   L053127
         JSL   L082712
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L051E1A
         PEA   L051E1A
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDAL  L051DA0
         TAX
         LDAL  L051D9E
         STA   $21
         STX   $23
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L1C2911
         PHY
         LDAL  L051DA0
         PHA
         LDAL  L051D9E
         PHA
         PEI   $23
         PEI   $21
         PEA   $0002
         JSL   L071984
         PLA
         LSR
         BCC   L1C23E0
         LDA   $21
         LDX   $23
         STAL  L051D9E
         TXA
         STAL  L051DA0
L1C23E0  JSL   L160870
L1C23E4  LDA   $3E
         STA   $40
         LDA   $3D
         STA   $3F
         LDA   $3B
         TCD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L1C23F6	ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDAL  L051D70
         TAX
         LDAL  L051D6E
         STA   $05
         STX   $07
         LDA   $05
         LDX   $07
         STA   $01
         STX   $03
         LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$000D
         PEA   $0000
         PHA
         JSL   L096A7B
         PEI   $0F
         PEI   $0D
         JSL   L094E90
         PEA   $0000
         JSL   L16088C
L1C243B  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L096A7B
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L09457C
         PEI   $07
         LDA   $0B
         SEC
         SBC   $0F
         PHA
         PEA   $0004
         JSL   L1500F5
         PLX
         PLX
         STA   $11
         PLA
         SEC
         SBC   $11
         AND   #$FFFC
         STAL  L051D70
         PEI   $05
         PHY
         LDA   $09
         SEC
         SBC   $0D
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $11
         PLA
         SEC
         SBC   $11
         STAL  L051D6E
         PEA   ^L051D6E
         PEA   L051D6E
         PEA   ^L051D66
         PEA   L051D66
         JSL   L1C1A70
         PHY
         PEA   ^L051D6E
         PEA   L051D6E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B2E
         PLA
         LSR
         BCS   L1C24FD
         LDAL  L051D70
         SEC
         SBC   #$0028
         STAL  L051D60
         LDAL  L051D6E
         SEC
         SBC   #$000C
         STAL  L051D5E
         LDA   #$0050
         CLC
         ADCL  L051D60
         STAL  L051D64
         LDA   #$0019
         CLC
         ADCL  L051D5E
         STAL  L051D62
         PEA   ^L051D5E
         PEA   L051D5E
         JSL   L1C1407
         LDAL  L051D70
         TAX
         LDAL  L051D6E
         STA   $01
         STX   $03
L1C24FD  PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         BNE   L1C250B
         BRL   L1C243B
L1C250B  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L1C2513  ENT
	PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         JSL   L090A71
         JSL   L1C0F31
         JSL   L160376
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552FF
         BEQ   L1C254F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1C254F  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1C2911
         LDA   #$0001
         STA   L0552B1
         STZ   L0552AF
         STZ   L0552A9
         STZ   L0552AB
         STZ   L05528F
         JSL   L16089A
         JSL   L1C3F07
         LDA   #$0001
         STA   L05529F
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053259
         PEA   L053259
         JSL   L085B3C
         PEA   ^L051E12
         PEA   L051E12
         JSL   L082712
         PHY
         PEA   ^L05310F
         PEA   L05310F
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCC   L1C25FC
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
         LDA   L055101
         LDX   L055103
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0000
         JSL   L08382C
L1C25FC  PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L05310F
         PEA   L05310F
         PEA   $0008
         JSL   L0313BE
         JSL   L1C035E
         PEA   $0004
         JSL   L099B9B
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L1C2622  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         JSL   L090A71
         LDA   L055315
         ORA   L055317
         BEQ   L1C2639
         LDA   #$0001
L1C2639  ORA   L055319
         BEQ   L1C264F
         LDA   L0552AB
         STA   $01
         STZ   L0552AB
         JSL   L1C02F4
         LDA   $01
         STA   L0552AB
L1C264F  LDA   L0552AB
         BNE   L1C2657
         BRL   L1C26DC
L1C2657  LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   $0000
         JSL   L08382C
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L081A64
         PLA
         LSR
         BCS   L1C26D3
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L16042C
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         LDA   #$0001
         STA   L0552AF
         LDA   #$0001
         STA   L0552B1
         STZ   L0552A9
         PEA   $0005
         JSL   L099B9B
L1C26D3  STZ   L0552A1
         STZ   L0552AB
         STZ   L05528F
L1C26DC  PLY
         PLY
         PLY
         PLD
         RTL

L1C26E1  ENT
	PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         JSL   L090A71
         LDA   L0552AB
         BEQ   L1C26F9
         JSL   L1C2622
         BRL   L1C286F
L1C26F9  LDA   L055315
         ORA   L055317
         BEQ   L1C2704
         LDA   #$0001
L1C2704  ORA   L055319
         BEQ   L1C270D
         JSL   L1C0F31
L1C270D  LDA   L0552B1
         STA   $2F
         LDA   L0552B1
         BNE   L1C271B
         JSL   L1C2513
L1C271B  PHY
         PEA   $0001
         JSL   L160862
         PLA
         LSR
         BCS   L1C272A
         BRL   L1C286F
L1C272A  PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   #$0001
         STA   L05529F
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   #$FFF0
         AND   $29
         STA   $29
         LDA   #$000F
         CLC
         ADC   $2D
         AND   #$FFF0
         STA   $2D
         LDA   #$0001
         STA   $01
         LDA   L0552AF
         BEQ   L1C2783
         LDX   #$0003
         STZ   $00,X
         LDA   #L051E32
         LDX   #^L051E32
         STA   $23
         STX   $25
         BRA   L1C2795
L1C2783  LDA   #$000F
         LDX   #$0003
         STA   $00,X
         LDA   #L051E92
         LDX   #^L051E92
         STA   $23
         STX   $25
L1C2795  PEI   $25
         PEI   $23
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         PEA   ^L051E32
         PEA   L051E32
         TDC
         CLC
         ADC   #$0027
         PEA   $0000
         PHA
         PEA   $2001
         PEA   $FFFF
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L151627
         STZ   L0552B1
         STZ   L0552AF
         STZ   L0552A9
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L08295E
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L081A64
         PLA
         LSR
         BCS   L1C286B
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E32
         PEA   L051E32
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $8001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   #$0001
         STA   L0552B1
         LDA   #$0001
         STA   L0552AF
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         PEA   $0005
         JSL   L099B9B
L1C286B  JSL   L160870
L1C286F  TSC
         CLC
         ADC   #$0034
         TCS
         PLD
         RTL

L1C2877  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PEA   ^L051DA2
         PEA   L051DA2
         JSL   L082712
         LDA   L0552FF
         BEQ   L1C28A1
         PEA   ^L051DA2
         PEA   L051DA2
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1C28A1  LDAL  L051DA8
         DEC
         DEC
         STAL  L051DA8
         LDAL  L051DA6
         DEC
         STAL  L051DA6
         LDA   L0551EF
         AND   L055313
         BEQ   L1C2900
         PHY
         LDA   #$000F
         CLC
         ADCL  L051DA4
         PHA
         JSL   L160926
         PLA
         STAL  L051DA4
         PHY
         LDA   #$0007
         CLC
         ADCL  L051DA2
         PHA
         JSL   L160934
         PLA
         STAL  L051DA2
         PHY
         LDAL  L051DA8
         PHA
         JSL   L160926
         PLA
         STAL  L051DA8
         PHY
         LDAL  L051DA6
         PHA
         JSL   L160934
         PLA
         STAL  L051DA6
L1C2900  LDA   $0A
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

L1C2911  ENT
	PHD
         TSC
         CLC
         ADC   #$FFEE
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552FF
         BEQ   L1C2941
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1C2941  PHY
         PEI   $1A
         PEI   $18
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L150B3A
         PLA
         STA   $09
         PHY
         LDAL  L051DB0
         CLC
         ADCL  L051DAC
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         AND   #$FFFE
         STA   $0D
         PHY
         LDAL  L051DAE
         CLC
         ADCL  L051DAA
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $0B
         LDA   $0B
         LDX   $0D
         STAL  L051D9E
         TXA
         STAL  L051DA0
         LDA   L0552FF
         BNE   L1C29A8
         LDA   $0B
         LDX   $0D
         STAL  L051D6E
         TXA
         STAL  L051D70
L1C29A8  LDA   $16
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

L1C29BA	ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L1C29CE
         BRL   L1C2CB1
L1C29CE  LDA   L055153
         AND   L05514F
         BEQ   L1C29D9
         BRL   L1C2CB1
L1C29D9  LDA   L055153
         EOR   #$0001
         AND   L055151
         BEQ   L1C29E7
         BRL   L1C2CB1
L1C29E7  PHY
         PHY
         JSL   L150493
         PLA
         STA   $15
         PLX
         STX   $17
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L082570
         LDA   L0552AF
         BNE   L1C2A05
         BRL   L1C2B73
L1C2A05  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         JSL   L1510A1
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         LDA   L0552B3
         BNE   L1C2A87
         LDAL  L051DAA
         STA   $01
         LDAL  L051DAE
         STA   $05
         LDAL  L051DAC
         AND   #$FFF0
         STA   $03
         LDA   #$000F
         CLC
         ADCL  L051DB0
         AND   #$FFF0
         STA   $07
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0062
         JSL   L08382C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         LDA   #$0001
         STA   L0552B3
L1C2A87  LDA   L0552FF
         BNE   L1C2A8F
         BRL   L1C2B2D
L1C2A8F  PEA   ^L051D46
         PEA   L051D46
         JSL   L1506A7
         PEA   $0002
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDAL  L051D60
         EOR   #$FFFF
         INC
         PHA
         LDAL  L051D5E
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051D46
         PEA   L051D46
         PEA   ^L051DAA
         PEA   L051DAA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $8003
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L15037D
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2CB9
         BRA   L1C2B70
L1C2B2D  PEA   ^L051DAA
         PEA   L051DAA
         JSL   L081D73
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         LDA   L0550F9
         LDX   L0550FB
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L1C2B5A
         INX
L1C2B5A  STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         JSL   L160942
         JSL   L081DC7
L1C2B70  BRL   L1C2CA5
L1C2B73  LDA   L0552FF
         BNE   L1C2B7B
         BRL   L1C2C25
L1C2B7B  PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051D46
         PEA   L051D46
         JSL   L1506A7
         JSL   L1510A1
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDAL  L051D60
         EOR   #$FFFF
         INC
         PHA
         LDAL  L051D5E
         EOR   #$FFFF
         INC
         PHA
         JSL   L1501AF
         PEA   $0002
         PEA   $0001
         JSL   L151083
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L151418
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2CB9
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051D46
         PEA   L051D46
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   ^L051D4E
         PEA   L051D4E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         BRL   L1C2CA5
L1C2C25  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         JSL   L1510A1
         PEA   ^L054F6B
         PEA   L054F6B
         JSL   L151198
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$00A0
         BCC   L1C2C4C
         INX
L1C2C4C  STA   $19
         STX   $1B
         LDA   [$19]
         STA   $11
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$00A0
         BCC   L1C2C61
         INX
L1C2C61  STA   $19
         STX   $1B
         LDA   #$8000
         ORA   $11
         STA   [$19]
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L151418
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$00A0
         BCC   L1C2C8D
         INX
L1C2C8D  STA   $19
         STX   $1B
         LDA   $11
         STA   [$19]
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
L1C2CA5  JSL   L1510A1
         PEI   $17
         PEI   $15
         JSL   L151131
L1C2CB1  TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L1C2CB9  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $18
         PEI   $16
         PEA   $0008
         JSL   L0313BE
         LDA   L054FBB
         SEC
         SBC   #$0000
         BPL   L1C2CE1
         BRL   L1C2D94
L1C2CE1  PHY
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         LSR
         BCS   L1C2D05
         BRL   L1C2D94
L1C2D05  PHY
         PHY
         JSL   L150493
         PLA
         STA   $09
         PLX
         STX   $0B
         PEA   ^L053259
         PEA   L053259
         JSL   L081D73
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   L055285
         PHA
         LDA   L0550ED
         LDX   L0550EF
         CLC
         ADC   #$001C
         BCC   L1C2D35
         INX
L1C2D35  STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         JSL   L160950
         JSL   L081DC7
         LDA   L0550C9
         LDX   L0550CB
         CLC
         ADC   #$00CE
         BCC   L1C2D58
         INX
L1C2D58  STA   $0D
         STX   $0F
         LDA   #$0020
         AND   [$0D]
         BEQ   L1C2D8C
         LDA   L0550D9
         LDX   L0550DB
         PHX
         PHA
         JSL   L151131
         PEA   ^L051D46
         PEA   L051D46
         PEA   ^L051D4E
         PEA   L051D4E
         LDAL  L051D58
         PHA
         LDAL  L051D56
         PHA
         PEA   $0000
         JSL   L15025A
L1C2D8C  PEI   $0B
         PEI   $09
         JSL   L151131
L1C2D94  LDA   $14
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

L1C2DA6  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   [$10]
         STA   $01
         LDA   [$0C]
         STA   [$10]
         LDA   $01
         STA   [$0C]
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1C2DCC  PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         LDA   [$10]
         STA   $01
         LDA   [$0C]
         STA   [$10]
         LDA   $01
         STA   [$0C]
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         LDA   $07
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L1C2DF2  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDY   #$0002
         LDA   [$12],Y
         TAX
         LDA   [$12]
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$0E],Y
         TAX
         LDA   [$0E]
         STA   [$12]
         TXA
         LDY   #$0002
         STA   [$12],Y
         LDA   $01
         LDX   $03
         STA   [$0E]
         TXA
         LDY   #$0002
         STA   [$0E],Y
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

L1C2E34  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDA   L0552FF
         BEQ   L1C2E7A
         LDA   #$0008
         CMP   L0550BB
         BEQ   L1C2E59
         LDA   $20
         SEC
         SBC   #$0008
         STA   $20
         LDA   $1E
         SEC
         SBC   #$0004
         STA   $1E
L1C2E59  TDC
         CLC
         ADC   #$001E
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         PEA   ^L051D5E
         PEA   L051D5E
         JSL   L150F41
         LDA   $20
         INC
         AND   #$FFFE
         STA   $20
L1C2E7A  LDA   L0552B1
         PHA
         PHY
         TDC
         CLC
         ADC   #$001E
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1512CB
         PLA
         STA   $15
         PLA
         AND   $15
         STA   L0552AD
         LDA   L0552AF
         BNE   L1C2EA3
         BRL   L1C2F29
L1C2EA3  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $FFFC
         PEA   $FFFE
         JSL   L151005
         PHY
         TDC
         CLC
         ADC   #$001E
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1512CB
         PLA
         LSR
         BCS   L1C2EE9
         BRA   L1C2F29
L1C2EE9  LDA   #$FFFE
         STA   $11
L1C2EEE  LDA   #$FFFE
         STA   $13
L1C2EF3  PHY
         LDA   $11
         ASL
         CLC
         ADC   $20
         PHA
         LDA   $13
         CLC
         ADC   $1E
         PHA
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         JSL   L1608B6
         PLA
         BNE   L1C2F29
         LDA   #$0002
         CMP   $13
         BEQ   L1C2F1B
         INC   $13
         BRA   L1C2EF3
L1C2F1B  LDA   #$0002
         CMP   $11
         BEQ   L1C2F26
         INC   $11
         BRA   L1C2EEE
L1C2F26  STZ   L0552AD
L1C2F29  LDA   L055239
         EOR   #$0001
         AND   L0552AD
         BEQ   L1C2F77
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L082712
         LDA   L0552FF
         BEQ   L1C2F5C
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051D5E
         PEA   L051D5E
         PEA   $0008
         JSL   L0313BE
L1C2F5C  PHY
         PEA   ^L051DAA
         PEA   L051DAA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         EOR   #$0001
         STA   L0552AD
L1C2F77  LDA   $1C
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

L1C2F89  ENT
         PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         LDA   L0552A1
         BEQ   L1C2F9A
         JSL   L160376
L1C2F9A  LDA   #$0001
         STA   L055137
         LDA   #$0001
         STA   L055133
         LDA   L0552BB
         BNE   L1C2FFC
         PHY
         PHY
         PEA   $0000
         PEA   $0066
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $07
         PLX
         STX   $09
         LDAL  L05565D
         BEQ   L1C2FD3
         BRL   L1C315A
L1C2FD3  LDA   $07
         LDX   $09
         STAL  L051DBE
         TXA
         STAL  L051DC0
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $11
         STX   $13
         LDAL  L040821
         SEP   #$20
         STA   [$11]
         REP   #$20
         LDA   #$0001
         STA   L0552BB
L1C2FFC  LDA   #$000D
         CMP   L055225
         BNE   L1C306C
         LDA   #$0014
         CMP   L0552BB
         BNE   L1C300F
         BRL   L1C315A
L1C300F  PHY
         PHY
         PEA   $0000
         PEA   $0066
         LDA   L0552FD
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $07
         PLX
         STX   $09
         LDAL  L05565D
         BEQ   L1C3037
         BRL   L1C315A
L1C3037  LDA   L0552BB
         INC
         STA   L0552BB
         LDA   L0552BB
         DEC
         ASL
         ASL
         TAX
         PEI   $09
         PEI   $07
         PLA
         STAL  L051DBE,X
         PLA
         STAL  L051DC0,X
         LDY   #$0002
         LDA   [$07],Y
         TAX
         LDA   [$07]
         STA   $11
         STX   $13
         LDAL  L040822
         SEP   #$20
         STA   [$11]
         REP   #$20
         BRL   L1C3146
L1C306C  LDA   #$007F
         CMP   L055225
         BNE   L1C30D3
         LDA   L0552BB
         DEC
         ASL
         ASL
         TAX
         LDAL  L051DC0,X
         PHA
         LDAL  L051DBE,X
         PLX
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $11
         STX   $13
         LDA   #$00FF
         AND   [$11]
         STA   $0B
         LDA   $0B
         BNE   L1C30BC
         LDA   L0552BB
         SEC
         SBC   #$0000
         BMI   L1C30BA
         BEQ   L1C30BA
         PEI   $0F
         PEI   $0D
         JSL   L07185A
         LDA   L0552BB
         DEC
         STA   L0552BB
L1C30BA  BRA   L1C30D1
L1C30BC  LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $11
         STX   $13
         LDA   $0B
         DEC
         SEP   #$20
         STA   [$11]
         REP   #$20
L1C30D1  BRA   L1C3146
L1C30D3  LDA   L055225
         SEC
         SBC   #$0020
         BVS   L1C30DF
         EOR   #$8000
L1C30DF  BPL   L1C3146
         LDA   L0552BB
         DEC
         ASL
         ASL
         TAX
         LDAL  L051DC0,X
         PHA
         LDAL  L051DBE,X
         PLX
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $11
         STX   $13
         LDA   #$00FF
         AND   [$11]
         STA   $0B
         LDA   $0B
         SEC
         SBC   #$0064
         BVS   L1C3114
         EOR   #$8000
L1C3114  BMI   L1C3146
         LDA   $0B
         INC
         STA   $0B
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $11
         STX   $13
         LDA   $0B
         SEP   #$20
         STA   [$11]
         REP   #$20
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         STA   $11
         STX   $13
         LDY   $0B
         LDA   L055225
         SEP   #$20
         STA   [$11],Y
         REP   #$20
L1C3146  LDA   L054FBB
         SEC
         SBC   #$0000
         BMI   L1C3153
         JSL   L151472
L1C3153  PEA   $0000
         JSL   L1C3B67
L1C315A  TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L1C3162  ENT
	PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDA   L0552FF
         EOR   #$0001
         STA   L0552FF
         LDA   L0552FF
         BNE   L1C317B
         BRL   L1C328F
L1C317B  LDA   L0552B1
         BEQ   L1C31AE
         PHY
         LDAL  L051DB0
         CLC
         ADCL  L051DAC
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STAL  L051D70
         PHY
         LDAL  L051DAE
         CLC
         ADCL  L051DAA
         PHA
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STAL  L051D6E
L1C31AE  PEA   ^L051D6E
         PEA   L051D6E
         PEA   ^L051D66
         PEA   L051D66
         JSL   L1C1A70
         LDAL  L051D70
         SEC
         SBC   #$0028
         AND   #$FFFC
         STAL  L051D60
         LDAL  L051D6E
         SEC
         SBC   #$000C
         STAL  L051D5E
         LDA   #$0050
         CLC
         ADCL  L051D60
         STAL  L051D64
         LDA   #$0019
         CLC
         ADCL  L051D5E
         STAL  L051D62
         LDA   L0552B1
         BEQ   L1C3239
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051D5E
         PEA   L051D5E
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L150B3A
         PLA
         STA   $0B
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L1C3239
         JSL   L1C0F31
         JSL   L160376
         STZ   L055295
         STZ   L055293
L1C3239  LDA   L0550ED
         LDX   L0550EF
         PHX
         PHA
         JSL   L151131
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0007
         PEA   $0280
         PEA   $0008
         JSL   L15100B
L1C325E  TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         JSL   L15123D
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         JSL   L1501AF
         LDA   $03
         SEC
         SBC   #$00C8
         BEQ   L1C325E
         BVS   L1C328B
         EOR   #$8000
L1C328B  BPL   L1C325E
         BRA   L1C329B
L1C328F  LDA   L0550D9
         LDX   L0550DB
         PHX
         PHA
         JSL   L0732B7
L1C329B  PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   $0000
         JSL   L1601A8
         LDA   L0552FF
         BEQ   L1C32C9
         LDA   L0550D9
         LDX   L0550DB
         PHX
         PHA
         JSL   L1512BF
         LDA   L0550D9
         LDX   L0550DB
         PHX
         PHA
         JSL   L15102F
L1C32C9  LDA   #$0001
         STA   L055247
         TSC
         CLC
         ADC   #$0010
         TCS
         PLD
         RTL

L1C32D7  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L055313
         EOR   #$0001
         STA   L055313
         LDA   #$0001
         STA   L054F9F
         PEA   $0001
         JSL   L1C3B67
         PLY
         PLY
         PLD
         RTL

L1C32F9  PHD
         TSC
         CLC
         ADC   #$FFEC
         TCS
         TCD
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$0001
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L1C3315
         INX
L1C3315  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L1501AF
         PEI   $22
         PEI   $20
         PEI   $22
         PEI   $20
         LDA   #$0001
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L1C335D
         INX
L1C335D  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $1E
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $0B
         STA   $03
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         LDY   #$0009
         LDA   [$1A],Y
         ASL
         PHA
         PEA   $0000
         JSL   L1501AF
         PEI   $22
         PEI   $20
         PEI   $22
         PEI   $20
         LDA   #$0001
         CLC
         ADC   $1A
         LDX   $1C
         BCC   L1C33A2
         INX
L1C33A2  PHX
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $1E
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $0F
         STA   $07
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $FFFF
         JSL   L1501AF
         PEI   $22
         PEI   $20
         PEI   $22
         PEI   $20
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
         PEI   $1E
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0000
         LDY   #$0009
         LDA   [$1A],Y
         PHA
         JSL   L1501AF
         PEI   $22
         PEI   $20
         PEI   $22
         PEI   $20
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
         PEI   $1E
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         LDA   $18
         STA   $22
         LDA   $17
         STA   $21
         LDA   $15
         TCD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L1C345D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF2
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCS   L1C3474
         BRL   L1C35C7
L1C3474  LDA   #$0002
         STA   $09
         PHY
         JSL   L099DCE
         PLA
         LSR
         BCC   L1C3487
         LDA   #$0003
         STA   $09
L1C3487  LDAL  L051DAC
         DEC
         DEC
         STAL  L051DAC
         LDAL  L051DAA
         DEC
         STAL  L051DAA
         LDA   $09
         ASL
         CLC
         ADCL  L051DB0
         DEC
         DEC
         STAL  L051DB0
         LDA   $09
         CLC
         ADCL  L051DAE
         DEC
         STAL  L051DAE
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   $03
         INC
         INC
         STA   $03
         LDA   $01
         INC
         STA   $01
         LDA   $09
         ASL
         STA   $0B
         LDA   $07
         SEC
         SBC   $0B
         INC
         INC
         STA   $07
         LDA   $05
         SEC
         SBC   $09
         INC
         STA   $05
         PEA   ^L051E32
         PEA   L051E32
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L1C32F9
         LDA   #$0001
         STA   L05529F
         PEA   ^L051E12
         PEA   L051E12
         LDA   $09
         ASL
         ASL
         EOR   #$FFFF
         INC
         PHA
         LDA   $09
         ASL
         EOR   #$FFFF
         INC
         PHA
         JSL   L151005
         PEA   ^L051EA2
         PEA   L051EA2
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L1C32F9
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E92
         PEA   L051E92
         PEA   $8003
         PEA   $0000
         PHD
         JSL   L1C32F9
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051E92
         PEA   L051E92
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0001
         PEA   $0000
         PEA   $0000
         JSL   L1505E6
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $FFFC
         PEA   $FFFE
         JSL   L151005
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         JSL   L160870
L1C35C7  TSC
         CLC
         ADC   #$000E
         TCS
         PLD
         RTL

L1C35CF  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PEA   $0000
         JSL   L160862
         PLA
         LSR
         BCC   L1C363F
         PHY
         JSL   L09771E
         PLA
         LSR
         BCC   L1C360B
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0003
         JSL   L08382C
         BRA   L1C3625
L1C360B  PEA   ^L051DAA
         PEA   L051DAA
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         JSL   L1606B0
L1C3625  PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532B5
         PEA   L0532B5
         JSL   L081E53
         LDA   #$0002
         STA   L0552A9
         JSL   L160870
L1C363F  PLY
         PLY
         PLD
         RTL

L1C3643  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PEI   $1C
         PEI   $1A
         JSL   L1C07FC
         PEI   $18
         PEI   $16
         JSL   L1C03FE
         PEI   $1C
         PEI   $1A
         PEI   $18
         PEI   $16
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L071937
         LDA   $07
         INC
         INC
         STA   $07
         LDA   $05
         INC
         STA   $05
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$00CF
         CLC
         ADC   $12
         LDX   $14
         BCC   L1C368F
         INX
L1C368F  PHX
         PHA
         JSL   L081E53
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   ^L053127
         PEA   L053127
         JSL   L081E53
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1C1407
         LDA   $10
         STA   $1C
         LDA   $0F
         STA   $1B
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L1C36C7	ENT
         PHD
         TSC
         CLC
         ADC   #$EFEC
         TCS
         ADC   #$0F1D
         TCD
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         LDA   L055303
         STA   $E1
         PEA   $0001
         JSL   L0A1225
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         JSL   L1C1ACF
         JSL   L1C0F31
         JSL   L160376
         LDA   L055233
         BNE   L1C370F
         BRL   L1C3849
L1C370F  TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         JSL   L1608EE
         PHY
         TDC
         CLC
         ADC   #$00EF
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         JSL   L1512CB
         PLA
         LSR
         BCS   L1C3737
         BRL   L1C3846
L1C3737  PHY
         JSL   L073CDF
         PLA
         STA   $D7
         LDA   #$0001
         STA   $85
         PHY
         LDA   #$FFFE
         AND   $F1
         PHA
         PEI   $EF
         LDA   L055105
         LDX   L055107
         PHX
         PHA
         JSL   L1608B6
         PLA
         LDX   #$0087
         STA   $00,X
         JSL   L1C3EDC
         TDC
         CLC
         ADC   #$00B7
         PEA   $0000
         PHA
         PEA   ^L053239
         PEA   L053239
         PEA   $0010
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00A7
         PEA   $0000
         PHA
         PEA   ^L053239
         PEA   L053239
         PEA   $0010
         JSL   L0313BE
         LDA   L055105
         LDX   L055107
         STA   $B9
         STX   $BB
         LDA   L0552C9
         LDX   L0552CB
         STA   $A9
         STX   $AB
         TDC
         CLC
         ADC   #$00B7
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         TDC
         CLC
         ADC   #$00A7
         PEA   $0000
         PHA
         PEA   ^L053259
         PEA   L053259
         PEI   $F1
         PEI   $EF
         PEA   $1001
         PEA   $FFFF
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L151657
         PEA   ^L051E12
         PEA   L051E12
         JSL   L082712
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   ^L051E12
         PEA   L051E12
         JSL   L08295E
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051E12
         PEA   L051E12
         PEA   $0008
         JSL   L0313BE
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L081A64
         PLA
         LSR
         BCS   L1C3840
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L16042C
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         JSL   L1C1967
         LDA   #$0001
         STA   L0552B1
         LDA   #$0001
         STA   L0552AF
         STZ   L0552A9
L1C3840  PEI   $D7
         JSL   L0724F7
L1C3846  BRL   L1C3B4A
L1C3849  JSL   L1510A1
         PEA   $0002
         PEA   $0001
         JSL   L151083
         PEI   $ED
         PEI   $EB
         PEI   $ED
         PEI   $EB
         PEA   $0000
         PHD
         JSL   L1C3643
         LDA   $EB
         LDX   $ED
         STA   $E7
         STX   $E9
         LDA   #$0001
         STA   $DF
L1C3874  TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         JSL   L1C1ACF
         LDA   $E5
         SEC
         SBC   $E9
         BPL   L1C388C
         EOR   #$FFFF
         INC
L1C388C  PHA
         LDA   $E3
         SEC
         SBC   $E7
         BPL   L1C3898
         EOR   #$FFFF
         INC
L1C3898  ASL
         STA   $F3
         PLA
         CLC
         ADC   $F3
         SEC
         SBC   #$0002
         BEQ   L1C38DC
         BVS   L1C38AA
         EOR   #$8000
L1C38AA  BPL   L1C38DC
         PEI   $E9
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEA   $0000
         PHD
         JSL   L1C3643
         LDA   $DF
         ASL
         ASL
         CLC
         ADC   #$F0E1
         TAX
         PEI   $E5
         PEI   $E3
         PLA
         STA   $00,X
         PLA
         STA   $02,X
         LDA   $DF
         INC
         STA   $DF
         LDA   $E3
         LDX   $E5
         STA   $E7
         STX   $E9
L1C38DC  LDX   #$0000
         LDA   #$03E8
         CMP   $DF
         BNE   L1C38E7
         INX
L1C38E7  PHX
         PHY
         JSL   L096CC4
         PLA
         EOR   #$0001
         ORA   $01,S
         PLX
         LSR
         BCS   L1C38FA
         BRL   L1C3874
L1C38FA  PEI   $E9
         PEI   $E7
         PEI   $ED
         PEI   $EB
         PEA   $0000
         PHD
         JSL   L1C3643
         JSL   L150659
         PEI   $ED
         PEI   $EB
         JSL   L1C07FC
         LDA   $DF
         DEC
         LDX   #$F0E3
         STA   $00,X
         LDX   #$F0E3
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L1C392C
         EOR   #$8000
L1C392C  BPL   L1C3953
         LDA   #$0001
         STA   $DD
L1C3933  LDA   $DD
         ASL
         ASL
         CLC
         ADC   #$F0E1
         TAX
         LDA   $02,X
         PHA
         LDA   $00,X
         PHA
         JSL   L1C03FE
         LDA   $DD
         LDX   #$F0E3
         CMP   $00,X
         BEQ   L1C3953
         INC   $DD
         BRA   L1C3933
L1C3953  PEI   $ED
         PEI   $EB
         JSL   L1C03FE
         PHY
         PHY
         JSL   L150BB2
         PLA
         STA   $D9
         PLX
         STX   $DB
         PEI   $DB
         PEI   $D9
         JSL   L15166F
         PEI   $E1
         JSL   L0A1225
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0000
         JSL   L1601A8
         PEA   ^L051DAA
         PEA   L051DAA
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         CLC
         ADC   #$0002
         BCC   L1C39A4
         INX
L1C39A4  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         PHY
         PEI   $DB
         PEI   $D9
         JSL   L1516AB
         PLA
         LSR
         BCC   L1C39C5
         LDA   L0552A7
         PHA
         JSL   L0A02BC
         BRL   L1C3B42
L1C39C5  JSL   L1C3EDC
         PHY
         JSL   L09771E
         PLA
         LSR
         BCC   L1C3A2B
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         PEA   ^L051E32
         PEA   L051E32
         JSL   L1506A7
         PEI   $DB
         PEI   $D9
         JSL   L150641
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STA   L0552AF
         LDA   #$0001
         STA   L0552B1
         STZ   L0552A9
         JSL   L1C1967
         BRL   L1C3B42
L1C3A2B  PHY
         JSL   L073CDF
         PLA
         STA   $D7
         LDA   L0550FD
         LDX   L0550FF
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L053127
         PEA   L053127
         JSL   L085B3C
         PEA   ^L053127
         PEA   L053127
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L082712
         PEA   ^L053209
         PEA   L053209
         PEA   ^L053239
         PEA   L053239
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0000
         PEI   $DB
         PEI   $D9
         JSL   L1505E6
         LDA   #$0001
         STA   $85
         LDA   #$000F
         LDX   #$0087
         STA   $00,X
         LDAL  L051DAA
         STA   $C7
         LDAL  L051DAE
         STA   $CB
         LDA   #$FFF0
         ANDL  L051DAC
         STA   $C9
         LDA   #$000F
         CLC
         ADCL  L051DB0
         AND   #$FFF0
         STA   $CD
         PEA   ^L053239
         PEA   L053239
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   ^L051E32
         PEA   L051E32
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         PEA   $1001
         PEA   $FFFF
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0085
         PEA   $0000
         PHA
         JSL   L151627
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L08295E
         PHY
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L081A64
         PLA
         LSR
         BCS   L1C3B3C
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L1C2911
         LDA   #$0001
         STA   L0552B1
         LDA   #$0001
         STA   L0552AF
         STZ   L0552A9
         PEA   ^L051E12
         PEA   L051E12
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   $0008
         JSL   L0313BE
         JSL   L1C1967
L1C3B3C  PEI   $D7
         JSL   L0724F7
L1C3B42  PEI   $DB
         PEI   $D9
         JSL   L151669
L1C3B4A  LDA   #$0005
         STA   L0552A7
         JSL   L16089A
         JSL   L1C035E
         PEA   $0000
         JSL   L1601A8
         TSC
         CLC
         ADC   #$1014
         TCS
         PLD
         RTL

L1C3B67  ENT
	PHD
         TSC
         CLC
         ADC   #$FFCC
         TCS
         TCD
         LDA   L0550B9
         DEC
         BEQ   L1C3B78
         BRL   L1C3ECA
L1C3B78  PHY
         PHY
         JSL   L150493
         PLA
         STA   $0D
         PLX
         STX   $0F
         PEA   ^L05312F
         PEA   L05312F
         JSL   L151131
         LDA   L055315
         ORA   L055317
         BEQ   L1C3BBA
         PEA   ^L051DAA
         PEA   L051DAA
         JSL   L160472
         PEA   ^L051DAA
         PEA   L051DAA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         PEA   $0001
         JSL   L1601A8
         BRL   L1C3E9F
L1C3BBA  LDA   L055319
         EOR   #$0001
         PHA
         LDA   L0552BB
         SEC
         SBC   #$0001
         BVS   L1C3BCD
         EOR   #$8000
L1C3BCD  BPL   L1C3BD4
         LDA   #$0000
         BRA   L1C3BD7
L1C3BD4  LDA   #$0001
L1C3BD7  ORA   $01,S
         PLX
         LSR
         BCC   L1C3BE0
         BRL   L1C3E9F
L1C3BE0  LDAL  L051ED8
         STA   $07
         LDAL  L051EDC
         SEP   #$20
         STA   $09
         REP   #$20
         LDAL  L051EDA
         SEP   #$20
         STA   $0A
         REP   #$20
         PEI   $09
         PEI   $07
         PEA   $0000
         JSL   L151663
         LDAL  L051EDC
         PHA
         JSL   L1512E3
         PEA   $0000
         JSL   L1516ED
         PEA   $0000
         JSL   L1511E6
         PEA   $FFFF
         JSL   L1511E0
         PHY
         PEA   ^L052D12
         PEA   L052D12
         PEA   ^L051D26
         PEA   L051D26
         PEA   $0020
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $05
         LDA   $05
         BEQ   L1C3C52
         PEA   ^L052D12
         PEA   L052D12
         JSL   L151198
         PEA   $0001
         JSL   L150BD6
L1C3C52  LDAL  L051EDE
         STA   $25
         LDA   L055313
         BEQ   L1C3C6C
         PHY
         LDA   #$0007
         CLC
         ADC   $25
         PHA
         JSL   L160934
         PLA
         STA   $25
L1C3C6C  LDA   L0552BB
         STA   $2D
         LDA   $3A
         BEQ   L1C3C8E
         LDA   #$0001
         STA   $2D
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
         JSL   L1C3F07
L1C3C8E  LDAL  L051E0E
         PHA
         LDA   $2D
         DEC
         PEI   $25
         JSL   L150BEE
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $29
         LDA   $2D
         STA   $03
         LDA   L0552BB
         STA   $01
         LDA   $01
         SEC
         SBC   $03
         BVS   L1C3CB6
         EOR   #$8000
L1C3CB6  BMI   L1C3CBB
         BRL   L1C3E5A
L1C3CBB  LDA   $03
         STA   $2F
L1C3CBF  LDA   $3A
         BNE   L1C3D29
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0000
         LDA   $29
         SEC
         SBCL  L051DB2
         PHA
         PEA   $0280
         LDAL  L051DB4
         CLC
         ADC   $29
         PHA
         JSL   L15100B
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L085B3C
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   $FFFF
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L085B3C
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
L1C3D29  LDA   $2F
         DEC
         ASL
         ASL
         TAX
         LDAL  L051DC0,X
         PHA
         LDAL  L051DBE,X
         PLX
         STA   $21
         STX   $23
         PEI   $23
         PEI   $21
         JSL   L0718BF
         PHY
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         PHX
         PHA
         JSL   L15063B
         PLA
         STA   $27
         LDA   #$0002
         ANDL  L051EDC
         BEQ   L1C3D68
         LDA   #$000A
         CLC
         ADC   $27
         STA   $27
L1C3D68  LDA   L0552BD
         STA   $2B
         LDA   $2F
         DEC
         BNE   L1C3D78
         LDAL  L051E10
         STA   $2B
L1C3D78  LDA   #$FFFF
         CMPL  L051ED6
         BNE   L1C3D88
         LDA   $2B
         SEC
         SBC   $27
         STA   $2B
L1C3D88  LDAL  L051ED6
         DEC
         BNE   L1C3DA4
         PEI   $2B
         PHY
         PEI   $27
         PLA
         CMP   #$8000
         ROR
         STA   $01,S
         PLA
         STA   $31
         PLA
         SEC
         SBC   $31
         STA   $2B
L1C3DA4  LDA   $2B
         DEC
         DEC
         STA   $1B
         LDA   $27
         CLC
         ADC   $2B
         INC
         INC
         STA   $1F
         LDA   $29
         SEC
         SBCL  L051DB2
         STA   $19
         LDAL  L051DB4
         CLC
         ADC   $29
         STA   $1D
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $31
         STX   $33
         LDA   #$00FF
         AND   [$31]
         BEQ   L1C3E40
         PEA   ^L051EA2
         PEA   L051EA2
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L15123D
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L081E53
         PEA   ^L051E92
         PEA   L051E92
         JSL   L1506A7
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L15123D
         PEI   $2B
         PEI   $29
         JSL   L1510C5
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         PHX
         PHA
         JSL   L150592
         LDA   $05
         BEQ   L1C3E40
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         JSL   L15037D
L1C3E40  PEI   $23
         PEI   $21
         JSL   L07191C
         LDA   $25
         CLC
         ADC   $29
         STA   $29
         LDA   $2F
         CMP   $01
         BEQ   L1C3E5A
         INC   $2F
         BRL   L1C3CBF
L1C3E5A  LDA   $1F
         DEC
         DEC
         STAL  L051DBC
         LDA   $29
         SEC
         SBC   $25
         STAL  L051DBA
         LDA   $3A
         BEQ   L1C3E7F
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   ^L0532BD
         PEA   L0532BD
         JSL   L081E53
L1C3E7F  PEA   $0001
         JSL   L1601A8
         PEA   ^L0532BD
         PEA   L0532BD
         PEA   ^L051E1A
         PEA   L051E1A
         PEA   $0008
         JSL   L0313BE
         LDA   #$0001
         STA   L0552AB
L1C3E9F  JSL   L08765D
         PEA   ^L053239
         PEA   L053239
         JSL   L1506A7
         JSL   L1510A1
         PEI   $0F
         PEI   $0D
         JSL   L151131
         PEI   $09
         PEI   $07
         PEA   $0010
         JSL   L150BC4
         STZ   L0552B5
         STZ   L0552B7
L1C3ECA  LDA   $38
         STA   $3A
         LDA   $37
         STA   $39
         LDA   $35
         TCD
         TSC
         CLC
         ADC   #$0038
         TCS
         RTL

L1C3EDC  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0552C9
         LDX   L0552CB
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E12
         PEA   L051E12
         JSL   L085B3C
         PEA   ^L051E12
         PEA   L051E12
         JSL   L08273B
         PLY
         PLY
         PLD
         RTL

L1C3F07  ENT
	PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0552E5
         LDX   L0552E7
         PHX
         PHA
         PEA   $0000
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L085B3C
         LDA   L0552E1
         LDX   L0552E3
         PHX
         PHA
         PEA   $FFFF
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L085B3C
         PEA   ^L051E1A
         PEA   L051E1A
         JSL   L08273B
         PLY
         PLY
         PLD
         RTL

