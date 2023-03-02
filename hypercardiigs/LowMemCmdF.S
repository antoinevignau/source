*
* HypercardGS
* segment: $0C LowMemCmdF
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   LowMemCmdF.l
         lst   off

*---------------------------------------

         use   LowMemCmdF.E
         use   LowMemCmdF.X

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

L0C0000  PHD
         TSC
         CLC
         ADC   #$FFB6
         TCS
         TCD
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $60
         PEI   $5E
         PEA   $002A
         JSL   L0313BE
         STZ   $43
         STZ   $3B
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEI   $58
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L083B58
         LDA   $1D
         STA   $2D
         LDA   $21
         SEP   #$20
         STA   $2F
         REP   #$20
         LDA   $1F
         SEP   #$20
         STA   $30
         REP   #$20
         PEI   $2F
         PEI   $2D
         JSL   L087547
         LDA   $37
         SEC
         SBC   $33
         STA   $3D
         LDA   #$000F
         AND   $11
         CMP   #$0007
         BNE   L0C006D
         LDA   $3D
         SEC
         SBC   #$001A
         STA   $3D
L0C006D  LDA   #$0000
         STA   [$50]
         LDA   $56
         DEC
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L0C0082
         EOR   #$8000
L0C0082  BPL   L0C00DD
         LDA   #$0001
         STA   $45
L0C0089  PEI   $5C
         PEI   $5A
         PEI   $3D
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         JSL   L081B04
         LDA   $41
         CLC
         ADC   $43
         STA   $43
         PEI   $5C
         PEI   $5A
         LDA   $41
         JSL   L150488
         JSL   L150F53
         STA   $5A
         STX   $5C
         LDA   #$00FF
         AND   [$5A]
         BNE   L0C00D3
         LDA   $43
         STA   $62
         LDA   $56
         SEC
         SBC   $45
         STA   [$50]
         BRL   L0C01EB
L0C00D3  LDA   $45
         CMP   $01
         BEQ   L0C00DD
         INC   $45
         BRA   L0C0089
L0C00DD  PEI   $5C
         PEI   $5A
         PEI   $3D
         TDC
         CLC
         ADC   #$0041
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$003F
         PEA   $0000
         PHA
         JSL   L081B04
L0C00F9  LDA   $41
         CLC
         ADC   $43
         DEC
         TAY
         LDA   #$00FF
         AND   [$5A],Y
         CMP   #$0020
         BNE   L0C0111
         LDA   $41
         DEC
         STA   $41
         BRA   L0C00F9
L0C0111  LDX   #$0000
         LDA   #$FFFF
         CMP   $1B
         BNE   L0C011C
         INX
L0C011C  PHX
         LDX   #$0000
         LDA   $1B
         DEC
         BNE   L0C0126
         INX
L0C0126  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0C014D
         LDA   $3D
         SEC
         SBC   $3F
         STA   $3F
         LDA   $1B
         DEC
         BNE   L0C0146
         PEI   $3F
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         STA   $3F
L0C0146  LDA   $54
         SEC
         SBC   $3F
         STA   $54
L0C014D  LDA   $54
         BPL   L0C0155
         STZ   $54
         BRA   L0C0167
L0C0155  LDA   $54
         SEC
         SBC   $3D
         BEQ   L0C0167
         BVS   L0C0161
         EOR   #$8000
L0C0161  BPL   L0C0167
         LDA   $3D
         STA   $54
L0C0167  STZ   $39
L0C0169  LDX   #$0000
         LDA   #$00FF
         AND   [$5A]
         BNE   L0C0174
         INX
L0C0174  PHX
         LDX   #$0000
         LDA   #$00FF
         AND   [$5A]
         CMP   #$000D
         BNE   L0C0183
         INX
L0C0183  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0C0195
         LDA   $39
         BNE   L0C0193
         LDA   $43
         INC
         STA   $43
L0C0193  BRA   L0C01E7
L0C0195  PEI   $3B
         PHY
         LDA   #$00FF
         AND   [$5A]
         PHA
         JSL   L151089
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $3B
         LDA   $43
         INC
         STA   $43
         LDA   $5A
         LDX   $5C
         INC
         BNE   L0C01B6
         INX
L0C01B6  STA   $5A
         STX   $5C
         LDA   $39
         INC
         STA   $39
         LDA   $3B
         SEC
         SBC   $54
         BEQ   L0C01CD
         BVS   L0C01CB
         EOR   #$8000
L0C01CB  BMI   L0C01D2
L0C01CD  LDA   #$0000
         BRA   L0C01D5
L0C01D2  LDA   #$0001
L0C01D5  PHA
         LDX   #$0000
         LDA   $41
         CMP   $39
         BNE   L0C01E0
         INX
L0C01E0  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0C0169
L0C01E7  LDA   $43
         STA   $62
L0C01EB  LDA   $4E
         STA   $60
         LDA   $4D
         STA   $5F
         LDA   $4B
         TCD
         TSC
         CLC
         ADC   #$005E
         TCS
         RTL

L0C01FD  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0011
         TCD
         LDAL  L040664
         SEP   #$20
         STA   [$FC]
         REP   #$20
         LDA   L0551FF
         BNE   L0C021A
         BRL   L0C05FD
L0C021A  LDA   L055027
         LDX   L055029
         CMP   L055201
         BNE   L0C0228
         CPX   L055203
L0C0228  BNE   L0C0242
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L040665
         PEA   L040665
         PEA   $0005
         JSL   L0313BE
         BRA   L0C026D
L0C0242  LDA   L05501F
         LDX   L055021
         CMP   L055201
         BNE   L0C0250
         CPX   L055203
L0C0250  BNE   L0C026A
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L04066A
         PEA   L04066A
         PEA   $0006
         JSL   L0313BE
         BRA   L0C026D
L0C026A  BRL   L0C05FD
L0C026D  PHY
         LDA   L055201
         LDX   L055203
         PHX
         PHA
         LDA   L0551FF
         PHA
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L07ABAE
         PLA
         LSR
         BCS   L0C028E
         BRL   L0C05FD
L0C028E  LDA   #$2000
         AND   $77
         BEQ   L0C02A1
         LDA   #$0004
         STA   $EB
         LDA   #$000A
         STA   $E9
         BRA   L0C02AB
L0C02A1  LDA   #$0001
         STA   $EB
         LDA   #$0004
         STA   $E9
L0C02AB  TDC
         CLC
         ADC   #$006F
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         JSL   L0808E0
         PHY
         PHY
         LDAL  L052D5E
         PHA
         LDAL  L052D5C
         PHA
         TDC
         CLC
         ADC   #$00C7
         PEA   $0000
         PHA
         JSL   L1505B6
         PLA
         STAL  L052D5C
         PLA
         STAL  L052D5E
         LDA   $E9
         CLC
         ADC   $C9
         STA   $F1
         LDAL  L052D5E
         SEC
         SBC   $F1
         STA   $EF
         LDA   $EB
         CLC
         ADC   $C7
         STA   $F1
         LDAL  L052D5C
         SEC
         SBC   $F1
         STA   $ED
         LDA   $ED
         BPL   L0C030A
         STZ   $ED
L0C030A  LDA   $EF
         BPL   L0C0310
         STZ   $EF
L0C0310  PHY
         PHY
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         JSL   L07721A
         PLA
         STA   $D3
         PLX
         STX   $D5
         PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $CF
         PLX
         STX   $D1
         LDA   $6B
         STA   $E3
         LDA   L05501F
         LDX   L055021
         CMP   L055201
         BNE   L0C034A
         CPX   L055203
L0C034A  BEQ   L0C0351
         LDA   #$0000
         BRA   L0C0354
L0C0351  LDA   #$0001
L0C0354  STA   $DB
         LDA   $DB
         BNE   L0C0362
         LDA   $E3
         EOR   #$FFFF
         INC
         STA   $E3
L0C0362  PHY
         PHY
         PEI   $D5
         PEI   $D3
         PEI   $D1
         PEI   $CF
         PEI   $E3
         LDA   #$4000
         AND   $6D
         BEQ   L0C0378
         LDA   #$0001
L0C0378  AND   $DB
         PHA
         JSL   L07B038
         PLA
         STA   $D7
         PLX
         STX   $D9
         PEI   $ED
         PEI   $89
         JSL   L1500F5
         PLX
         PLX
         INC
         PHA
         PHY
         PEI   $E3
         JSL   L086029
         PLA
         CLC
         ADC   $01,S
         PLX
         STA   $E5
         LDX   #$0000
         LDA   $D7
         ORA   $D9
         BNE   L0C03A9
         INX
L0C03A9  PHX
         LDX   #$0000
         LDA   #$00FF
         AND   [$D7]
         BNE   L0C03B5
         INX
L0C03B5  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L0C0418
         LDA   $FA
         DEC
         DEC
         BEQ   L0C03DA
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   ^L040670
         PEA   L040670
         PEA   $000C
         JSL   L0313BE
         BRA   L0C0415
L0C03DA  TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   ^L04067C
         PEA   L04067C
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         LDA   $E5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0019
         JSL   L0313BE
L0C0415  BRL   L0C056D
L0C0418  PHY
         TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         PEI   $D9
         PEI   $D7
         PEI   $DB
         PEI   $E5
         PEI   $EF
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         JSL   L0C0000
         PLA
         STA   $E7
         LDA   $FA
         DEC
         DEC
         BNE   L0C049E
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   ^L040682
         PEA   L040682
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         PHY
         PHY
         PEI   $D9
         PEI   $D7
         PEI   $D9
         PEI   $D7
         LDA   $E7
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         JSL   L0B0C30
         LDA   $DD
         JSL   L150488
         JSL   L150F53
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0019
         JSL   L0313BE
         BRL   L0C056D
L0C049E  PHY
         PEI   $D9
         PEI   $D7
         LDA   $E7
         DEC
         PHA
         JSL   L0790EC
         PLA
         LSR
         BCC   L0C04B9
         LDA   $E7
         STA   $E1
         LDA   $E7
         STA   $DF
         BRA   L0C0517
L0C04B9  LDA   $E7
         STA   $E1
L0C04BD  LDA   $E1
         DEC
         STA   $E1
         LDX   #$0000
         LDA   $E1
         BNE   L0C04CA
         INX
L0C04CA  PHX
         PHY
         PEI   $D9
         PEI   $D7
         LDA   $E1
         DEC
         PHA
         JSL   L0790EC
         PLA
         ORA   $01,S
         PLX
         LSR
         BCC   L0C04BD
         LDA   $E1
         INC
         STA   $E1
         LDA   $E7
         STA   $DF
L0C04E8  LDA   $DF
         INC
         STA   $DF
         PHY
         PEI   $D9
         PEI   $D7
         LDA   $DF
         DEC
         PHA
         JSL   L0790EC
         PLA
         BNE   L0C0512
         LDX   #$0000
         LDA   $DF
         DEC
         TAY
         LDA   #$00FF
         AND   [$D7],Y
         CMP   #$0000
         BNE   L0C050F
         INX
L0C050F  TXA
         BEQ   L0C04E8
L0C0512  LDA   $DF
         DEC
         STA   $DF
L0C0517  TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   ^L040688
         PEA   L040688
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         LDA   $E1
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04068E
         PEA   L04068E
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEF
         PHA
         LDA   $DF
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0020
         JSL   L0313BE
L0C056D  LDA   $D3
         ORA   $D5
         BEQ   L0C0582
         LDA   L05501F
         LDX   L055021
         PHX
         PHA
         PEA   $0000
         JSL   L074A24
L0C0582  LDA   $CF
         ORA   $D1
         BEQ   L0C0597
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L0C0597  PEI   $FE
         PEI   $FC
         TDC
         CLC
         ADC   #$0093
         PEA   $0000
         PHA
         PEA   ^L040693
         PEA   L040693
         TDC
         CLC
         ADC   #$00B3
         PEA   $0000
         PHA
         PEA   ^L040698
         PEA   L040698
         PEA   $0000
         TDC
         CLC
         ADC   #$0003
         PHA
         PHY
         LDA   L055201
         LDX   L055203
         PHX
         PHA
         LDA   L0551FF
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0C05E0
         DEX
L0C05E0  PHX
         PHA
         JSL   L07346C
         TDC
         CLC
         ADC   #$0017
         PEA   $0000
         PHA
         PEA   $0005
         JSL   L1509CE
         PEA   $0051
         JSL   L0313BE
L0C05FD  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$010A
         TCS
         RTL

L0C060F  ENT
         PHD
         TSC
         CLC
         ADC   #$FDBA
         TCS
         ADC   #$0151
         TCD
         LDAL  L0406A0
         SEP   #$20
         STA   [$FC]
         REP   #$20
         LDA   L055027
         LDX   L055029
         CMP   L0550AF
         BNE   L0C0632
         CPX   L0550B1
L0C0632  BNE   L0C064C
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   ^L0406A1
         PEA   L0406A1
         PEA   $0005
         JSL   L0313BE
         BRA   L0C0677
L0C064C  LDA   L05501F
         LDX   L055021
         CMP   L0550AF
         BNE   L0C065A
         CPX   L0550B1
L0C065A  BNE   L0C0674
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   ^L0406A6
         PEA   L0406A6
         PEA   $0006
         JSL   L0313BE
         BRA   L0C0677
L0C0674  BRL   L0C086F
L0C0677  PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   ^L0406AC
         PEA   L0406AC
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC3
         PHA
         LDA   L0550B3
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $FA
         DEC
         BNE   L0C0729
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   ^L0406B4
         PEA   L0406B4
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC3
         PHA
         LDA   L0550AD
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L0406BA
         PEA   L0406BA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEAF
         PHA
         LDA   L0550AB
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L0406BF
         PEA   L0406BF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         PEA   $0006
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0C0729  LDA   $FA
         DEC
         DEC
         BEQ   L0C0732
         BRL   L0C085B
L0C0732  LDA   #$0001
         LDX   #$0000
         STA   $ED
         STX   $EF
         PHY
         LDA   L0550AF
         LDX   L0550B1
         PHX
         PHA
         LDA   L0550B3
         PHA
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $EB
         LDA   L055027
         LDX   L055029
         CMP   L0550AF
         BNE   L0C0761
         CPX   L0550B1
L0C0761  BNE   L0C076B
         LDA   $EB
         EOR   #$FFFF
         INC
         STA   $EB
L0C076B  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L0C0788
         BRL   L0C0815
L0C0788  PHY
         PHY
         PEA   $0000
         PEA   $0000
         PEI   $E7
         PEI   $E5
         PEI   $EB
         PEA   $0000
         JSL   L07B038
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   $DD
         ORA   $DF
         BEQ   L0C0806
         PEI   $DF
         PEI   $DD
         LDA   L0550AD
         JSL   L150488
         JSL   L150F53
         STA   $D9
         STX   $DB
         LDA   #$00FF
         AND   [$D9]
         STA   $D7
         SEP   #$20
         LDA   #$00
         STA   [$D9]
         REP   #$20
L0C07CB  TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   #$00FF
         AND   [$DD]
         BEQ   L0C07F7
         LDA   $ED
         LDX   $EF
         INC
         BNE   L0C07E7
         INX
L0C07E7  STA   $ED
         STX   $EF
         LDA   $DD
         LDX   $DF
         INC
         BNE   L0C07F3
         INX
L0C07F3  STA   $DD
         STX   $DF
L0C07F7  LDA   #$00FF
         AND   [$DD]
         BNE   L0C07CB
         LDA   $D7
         SEP   #$20
         STA   [$D9]
         REP   #$20
L0C0806  LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
L0C0815  PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   ^L0406C4
         PEA   L0406C4
         PEA   $0000
         TDC
         CLC
         ADC   #$FEC3
         PHA
         PEI   $EF
         PEI   $ED
         JSL   L0715D9
         PEA   ^L0406CA
         PEA   L0406CA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FED7
         PHA
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0C085B  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFD7
         PHA
         PEA   $0100
         JSL   L0313BE
L0C086F  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$024A
         TCS
         RTL

L0C0881  ENT
         PHD
         TSC
         CLC
         ADC   #$FEE2
         TCS
         ADC   #$0027
         TCD
         LDA   L0550B3
         BNE   L0C0894
         BRL   L0C09A1
L0C0894  PHY
         LDA   L0550AF
         LDX   L0550B1
         PHX
         PHA
         LDA   L0550B3
         PHA
         PEA   $0002
         JSL   L07AC17
         PLA
         STA   $DF
         LDA   $DF
         STA   $DD
         LDA   L055027
         LDX   L055029
         CMP   L0550AF
         BNE   L0C08BD
         CPX   L0550B1
L0C08BD  BNE   L0C08C7
         LDA   $DD
         EOR   #$FFFF
         INC
         STA   $DD
L0C08C7  LDA   L0550AB
         SEC
         SBC   L0550AD
         STA   $E9
         LDA   $E9
         BPL   L0C08D7
         BRL   L0C09A1
L0C08D7  BNE   L0C08DC
         BRL   L0C09A1
L0C08DC  PHY
         PHY
         LDA   $E9
         INC
         JSL   L150488
         PHX
         PHA
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDA   $EF
         ORA   $F1
         BNE   L0C08FE
         BRL   L0C09A1
L0C08FE  PHY
         PHY
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         JSL   L0772AE
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDA   $D9
         ORA   $DB
         BNE   L0C091B
         BRL   L0C09A1
L0C091B  PHY
         PHY
         PEA   $0000
         PEA   $0000
         PEI   $DB
         PEI   $D9
         PEI   $DD
         PEA   $0000
         JSL   L07B038
         PLA
         STA   $E5
         PLX
         STX   $E7
         LDA   $E5
         ORA   $E7
         BNE   L0C0943
         PEA   $2F50
         JSL   L07272E
L0C0943  PEI   $E7
         PEI   $E5
         LDA   L0550AD
         JSL   L150488
         JSL   L150F53
         STA   $E5
         STX   $E7
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $E1
         STX   $E3
         PEI   $E7
         PEI   $E5
         PEI   $E3
         PEI   $E1
         LDA   $E9
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEI   $E3
         PEI   $E1
         LDA   $E9
         JSL   L150488
         JSL   L150F53
         STA   $E1
         STX   $E3
         SEP   #$20
         LDA   #$00
         STA   [$E1]
         REP   #$20
         LDA   L055027
         LDX   L055029
         PHX
         PHA
         PEA   $0000
         JSL   L074A90
         BRA   L0C09CB
L0C09A1  PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $EF
         PLX
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         STA   $F3
         STX   $F5
         SEP   #$20
         LDA   #$00
         STA   [$F3]
         REP   #$20
L0C09CB  LDA   $EF
         LDX   $F1
         STA   $FC
         STX   $FE
         TSC
         CLC
         ADC   #$011E
         TCS
         PLD
         RTL

L0C09DB  ENT
         PHD
         TSC
         CLC
         ADC   #$FDAA
         TCS
         ADC   #$0161
         TCD
         LDAL  L0406CF
         SEP   #$20
         STA   [$FC]
         REP   #$20
         LDA   L0551F3
         BEQ   L0C0A65
         LDA   L055111
         LDX   L055113
         STA   $D3
         STX   $D5
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406D0
         PEA   L0406D0
         PEA   $000C
         JSL   L0313BE
         LDY   #$0002
         LDA   [$D3],Y
         TAX
         LDA   [$D3]
         TXY
         LDX   #$FEC7
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEC7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L0C0A36
         INX
L0C0A36  STA   $F1
         STX   $F3
         LDA   [$F1]
         JSL   L150488
         STA   $E7
         STX   $E9
         LDX   #$FEC7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0022
         BCC   L0C0A54
         INX
L0C0A54  STA   $F1
         STX   $F3
         LDA   [$F1]
         JSL   L150488
         STA   $E3
         STX   $E5
         BRL   L0C0B35
L0C0A65  LDA   L05511F
         BNE   L0C0A6D
         BRL   L0C0B32
L0C0A6D  LDA   L055121
         LDX   L055123
         STA   $EB
         STX   $ED
         LDA   L055027
         LDX   L055029
         CMP   L055129
         BNE   L0C0A85
         CPX   L05512B
L0C0A85  BNE   L0C0A9F
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406DC
         PEA   L0406DC
         PEA   $0005
         JSL   L0313BE
         BRA   L0C0AB5
L0C0A9F  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406E1
         PEA   L0406E1
         PEA   $0006
         JSL   L0313BE
L0C0AB5  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406E7
         PEA   L0406E7
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB3
         PHA
         PHY
         LDA   L055129
         LDX   L05512B
         PHX
         PHA
         LDAL  L05328D
         PHA
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L0C0AF5
         DEX
L0C0AF5  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FECB
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00E7
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$00E3
         PEA   $0000
         PHA
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150000
         BRA   L0C0B35
L0C0B32  BRL   L0C0CD7
L0C0B35  LDA   $FA
         DEC
         BNE   L0C0B9D
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406EF
         PEA   L0406EF
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB3
         PHA
         LDA   $E7
         LDX   $E9
         INC
         BNE   L0C0B5A
         INX
L0C0B5A  PHX
         PHA
         JSL   L07346C
         PEA   ^L0406F5
         PEA   L0406F5
         PEA   $0000
         TDC
         CLC
         ADC   #$FE9F
         PHA
         PEI   $E5
         PEI   $E3
         JSL   L07346C
         PEA   ^L0406FA
         PEA   L0406FA
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
         PEA   $0006
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0C0B9D  LDA   $FA
         DEC
         DEC
         BEQ   L0C0BA6
         BRL   L0C0CC3
L0C0BA6  LDA   #$0001
         LDX   #$0000
         STA   $DF
         STX   $E1
         LDA   L0551F3
         BEQ   L0C0BDB
         LDY   #$0002
         LDA   [$D3],Y
         TAX
         LDA   [$D3]
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         STA   $F1
         STX   $F3
         LDY   #$0002
         LDA   [$F1],Y
         TAX
         LDA   [$F1]
         STA   $DB
         STX   $DD
         BRA   L0C0C16
L0C0BDB  PHY
         PHY
         PEA   $0019
         TDC
         CLC
         ADC   #$00CF
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150B22
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDY   #$0002
         LDA   [$CF],Y
         TAX
         LDA   [$CF]
         STA   $DB
         STX   $DD
L0C0C16  LDA   $DB
         LDX   $DD
         PEI   $E9
         PEI   $E7
         JSL   L150F53
         STA   $D7
         STX   $D9
         LDA   #$00FF
         AND   [$D7]
         STA   $EF
         SEP   #$20
         LDA   #$00
         STA   [$D7]
         REP   #$20
L0C0C35  TDC
         CLC
         ADC   #$00DB
         PEA   $0000
         PHA
         JSL   L071B83
         LDA   #$00FF
         AND   [$DB]
         BEQ   L0C0C61
         LDA   $DB
         LDX   $DD
         INC
         BNE   L0C0C51
         INX
L0C0C51  STA   $DB
         STX   $DD
         LDA   $DF
         LDX   $E1
         INC
         BNE   L0C0C5D
         INX
L0C0C5D  STA   $DF
         STX   $E1
L0C0C61  LDA   #$00FF
         AND   [$DB]
         BNE   L0C0C35
         LDA   $EF
         SEP   #$20
         STA   [$D7]
         REP   #$20
         LDA   L05511F
         BEQ   L0C0C7D
         PEI   $D1
         PEI   $CF
         JSL   L07185A
L0C0C7D  PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   ^L0406FF
         PEA   L0406FF
         PEA   $0000
         TDC
         CLC
         ADC   #$FEB3
         PHA
         PEI   $E1
         PEI   $DF
         JSL   L07346C
         PEA   ^L040705
         PEA   L040705
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
         PEA   $0004
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0C0CC3  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFCB
         PHA
         PEA   $0100
         JSL   L0313BE
L0C0CD7  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$025A
         TCS
         RTL

L0C0CE9  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE4
         TCS
         TCD
         LDA   L0551F3
         BNE   L0C0CF9
         BRL   L0C0DCE
L0C0CF9  LDA   L055111
         LDX   L055113
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         STA   $05
         STX   $07
         LDY   #$0022
         LDA   [$05],Y
         LDY   #$0020
         SEC
         SBC   [$05],Y
         JSL   L150488
         STA   $11
         STX   $13
         PEI   $13
         PEI   $11
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L0C0D33
         BRL   L0C0E08
L0C0D33  BNE   L0C0D38
         BRL   L0C0E08
L0C0D38  PHY
         PHY
         LDA   $11
         LDX   $13
         INC
         BNE   L0C0D42
         INX
L0C0D42  PHX
         PHA
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $15
         PLX
         STX   $17
         LDA   $15
         ORA   $17
         BNE   L0C0D5B
         BRL   L0C0E08
L0C0D5B  LDA   L055111
         LDX   L055113
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
         STA   $19
         STX   $1B
         LDY   #$0002
         LDA   [$19],Y
         TAX
         LDA   [$19]
         PHX
         PHA
         LDY   #$0020
         LDA   [$01],Y
         JSL   L150488
         JSL   L150F53
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $09
         STX   $0B
         PEI   $0F
         PEI   $0D
         PEI   $0B
         PEI   $09
         PEI   $13
         PEI   $11
         JSL   L070597
         LDA   $09
         LDX   $0B
         PEI   $13
         PEI   $11
         JSL   L150F53
         STA   $09
         STX   $0B
         SEP   #$20
         LDA   #$00
         STA   [$09]
         REP   #$20
         BRA   L0C0E32
L0C0DCE  LDA   L05511F
         BEQ   L0C0E08
         PHY
         PHY
         PEA   $0039
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L055121
         LDX   L055123
         PHX
         PHA
         JSL   L150B22
         PLA
         STA   $11
         PLX
         STX   $13
         LDAL  L05565D
         BEQ   L0C0E32
L0C0E08  PHY
         PHY
         PEA   $0000
         PEA   $0001
         LDA   L055019
         PHA
         JSL   L0B249C
         PLA
         STA   $15
         PLX
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $19
         STX   $1B
         SEP   #$20
         LDA   #$00
         STA   [$19]
         REP   #$20
L0C0E32  LDA   $15
         LDX   $17
         STA   $22
         STX   $24
         TSC
         CLC
         ADC   #$001C
         TCS
         PLD
         RTL

L0C0E42  PHD
         TSC
         CLC
         ADC   #$FDB2
         TCS
         ADC   #$0161
         TCD
         STZ   $FC
         STZ   $FE
         LDA   $F6
         BEQ   L0C0E69
         PHY
         PHY
         PEA   ^L04071E
         PEA   L04071E
         JSL   L0B88AC
         PLA
         STA   $E5
         PLX
         STX   $E7
         BRA   L0C0E7B
L0C0E69  PHY
         PHY
         PEA   ^L04072B
         PEA   L04072B
         JSL   L0B88AC
         PLA
         STA   $E5
         PLX
         STX   $E7
L0C0E7B  PEI   $E7
         PEI   $E5
         JSL   L0718BF
         LDY   #$0002
         LDA   [$E5],Y
         TAX
         LDA   [$E5]
         STA   $E1
         STX   $E3
         JSL   L09999B
L0C0E93  PHY
         PHY
         PEI   $FA
         PEI   $F8
         PEA   $0000
         JSL   L0730BE
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDA   #$0003
         STA   $9F
         LDY   #$0002
         LDA   [$D9],Y
         TAX
         LDA   [$D9]
         STA   $A1
         STX   $A3
         TDC
         CLC
         ADC   #$009F
         PEA   $0000
         PHA
         PEA   $2006
         JSL   GSOS2
         STAL  L05565D
         LDAL  L05565D
         BNE   L0C0F19
         LDA   $F6
         BEQ   L0C0F0E
         LDX   #$0000
         LDA   #$00B3
         CMP   $A7
         BEQ   L0C0EE0
         INX
L0C0EE0  PHX
         LDX   #$0000
         LDA   #$00FF
         CMP   $A7
         BEQ   L0C0EEC
         INX
L0C0EEC  TXA
         AND   $01,S
         PLX
         LSR
         BCC   L0C0F0E
         PEA   $004D
         PEA   $0000
         TDC
         CLC
         ADC   #$FE9F
         PHA
         PEI   $DB
         PEI   $D9
         JSL   L072CD4
         JSL   L0B0841
         BRL   L0C0FCD
L0C0F0E  LDA   $D9
         LDX   $DB
         STA   $FC
         STX   $FE
         BRL   L0C0FCD
L0C0F19  PEI   $DB
         PEI   $D9
         JSL   L07185A
         TDC
         CLC
         ADC   #$00E1
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9F
         PHA
         JSL   L0712B0
         LDA   #$00FF
         LDX   #$FF9F
         AND   $00,X
         BEQ   L0C0F78
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF9F
         PHA
         JSL   L0735A8
         PLA
         STA   $DD
         PLX
         STX   $DF
         PEA   $0000
         LDA   L05503F
         LDX   L055041
         PHX
         PHA
         JSL   L077086
         PEA   $0000
         PEI   $DF
         PEI   $DD
         JSL   L077086
         PEI   $DF
         PEI   $DD
         JSL   L07185A
L0C0F78  LDA   #$00FF
         LDX   #$FF9F
         AND   $00,X
         BEQ   L0C0F85
         BRL   L0C0E93
L0C0F85  LDA   $F6
         BEQ   L0C0F9A
         LDA   #$0007
         STA   $D7
         LDA   #$00B3
         STA   $D5
         LDA   #$00FF
         STA   $D3
         BRA   L0C0FA3
L0C0F9A  LDA   #$C006
         STA   $D7
         STZ   $D5
         STZ   $D3
L0C0FA3  PHY
         PEI   $D7
         PEI   $D5
         LDA   $D3
         JSL   L150488
         PHX
         PHA
         PEI   $FA
         PEI   $F8
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCC   L0C0FCD
         LDA   $D9
         LDX   $DB
         STA   $FC
         STX   $FE
L0C0FCD  PEI   $E7
         PEI   $E5
         JSL   L07185A
         LDA   $F0
         STA   $FA
         LDA   $EF
         STA   $F9
         LDA   $ED
         TCD
         TSC
         CLC
         ADC   #$025A
         TCS
         RTL

L0C0FE7  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PEI   $18
         PEI   $16
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L07869F
         PEA   $0000
         PEI   $03
         PEI   $01
         JSL   L077086
         PEI   $03
         PEI   $01
         PEI   $07
         PEI   $05
         JSL   L071825
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

L0C1032  ENT
         PHD
         TSC
         CLC
         ADC   #$FD80
         TCS
         ADC   #$018B
         TCD
         LDA   L0550B9
         DEC
         BNE   L0C1049
         JSL   L1601FC
         BRA   L0C104D
L0C1049  JSL   L0A1625
L0C104D  PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         JSL   L0E06AC
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L0C0E42
         PLA
         STA   $EB
         PLX
         STX   $ED
         LDA   $EB
         ORA   $ED
         BNE   L0C1089
         PEA   ^L040735
         PEA   L040735
         JSL   L0B2D94
         BRL   L0C1351
L0C1089  STZ   $E7
         STZ   $E9
         PHY
         JSL   L0314F6
         PLA
         BNE   L0C109B
         JSL   L0E0000
         BRA   L0C10E3
L0C109B  PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         JSL   L0E06AC
         JSL   L0E0000
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0000
         PEA   $0000
         PHD
         JSL   L0C0E42
         PLA
         STA   $E7
         PLX
         STX   $E9
         LDA   $E7
         ORA   $E9
         BNE   L0C10E3
         PEA   ^L040749
         PEA   L040749
         JSL   L0B2D94
         PEI   $ED
         PEI   $EB
         JSL   L07185A
         BRL   L0C1351
L0C10E3  LDA   L055027
         LDX   L055029
         STA   $DB
         STX   $DD
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
         STA   $DF
         PLX
         STX   $E1
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE75
         PHA
         PEI   $E1
         PEI   $DF
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PEI   $E1
         PEI   $DF
         JSL   L07185A
         JSL   L0A129A
         PEA   $001D
         JSL   L099176
         LDA   #$0002
         STA   $7B
         LDA   #$0001
         LDX   #$0000
         STA   $81
         STX   $83
         LDA   #$0006
         STA   $A7
         LDA   L05502B
         LDX   L05502D
         STA   $D3
         STX   $D5
         PHY
         TDC
         CLC
         ADC   #$007B
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCC   L0C119B
         LDA   L055051
         BNE   L0C119B
         LDA   $DB
         LDX   $DD
         STAL  L053B99
         TXA
         STAL  L053B9B
         PEA   ^L053B9D
         PEA   L053B9D
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0100
         JSL   L0313BE
         LDA   #$0001
         STA   L05504D
L0C119B  PEA   $0000
         PEA   $0001
         JSL   L090000
         JSL   L093A99
         JSL   L074D35
         LDA   $E7
         ORA   $E9
         BNE   L0C11B6
         BRL   L0C12F7
L0C11B6  PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE75
         PHA
         PEI   $E9
         PEI   $E7
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FF7B
         AND   $00,X
         LDX   #$FF79
         STA   $00,X
         LDX   #$FF79
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L0C11F2
         EOR   #$8000
L0C11F2  BPL   L0C1226
         LDA   #$0001
         STA   $EF
L0C11F9  LDA   $EF
         CLC
         ADC   #$FF7B
         TAX
         LDA   #$00FF
         AND   $00,X
         CMP   #$003A
         BNE   L0C1219
         LDA   $EF
         CLC
         ADC   #$FF7B
         TAX
         SEP   #$20
         LDA   #$2F
         STA   $00,X
         REP   #$20
L0C1219  LDA   $EF
         LDX   #$FF79
         CMP   $00,X
         BEQ   L0C1226
         INC   $EF
         BRA   L0C11F9
L0C1226  LDA   #$00FF
         LDX   #$FF7B
         AND   $00,X
         INC
         CLC
         ADC   #$FF7B
         TAX
         SEP   #$20
         LDA   #$00
         STA   $00,X
         REP   #$20
         PEI   $E9
         PEI   $E7
         JSL   L07185A
         PHY
         PHY
         PEA   $0000
         PEA   $0108
         LDA   L054FBD
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         JSL   L1513F4
         PLA
         STA   $D7
         PLX
         STX   $D9
         LDAL  L05565D
         BEQ   L0C126C
         BRL   L0C12F7
L0C126C  LDY   #$0002
         LDA   [$D7],Y
         TAX
         LDA   [$D7]
         TXY
         LDX   #$FF75
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $F1
         STX   $F3
         LDA   #$0000
         TAX
         STA   [$F1]
         TXA
         LDY   #$0002
         STA   [$F1],Y
         LDX   #$FF75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0004
         BCC   L0C12A6
         INX
L0C12A6  STA   $F1
         STX   $F3
         LDA   #$0001
         STA   [$F1]
         LDX   #$FF75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L0C12BF
         INX
L0C12BF  STA   $F1
         STX   $F3
         LDA   $FA
         STA   [$F1]
         LDX   #$FF75
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0008
         BCC   L0C12D7
         INX
L0C12D7  PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF7B
         PHA
         PEA   $0100
         JSL   L0313BE
         PEA   $0001
         PEA   $0001
         PEI   $D9
         PEI   $D7
         JSL   L150F3B
L0C12F7  PEI   $ED
         PEI   $EB
         PEA   $0000
         PHD
         JSL   L0C0FE7
         PEA   ^L050C32
         PEA   L050C32
         PEA   $0000
         TDC
         CLC
         ADC   #$FE75
         PHA
         PEI   $ED
         PEI   $EB
         JSL   L072CD4
         PEA   $0100
         JSL   L0313BE
         PEI   $ED
         PEI   $EB
         JSL   L07185A
         JSL   L0A3FE2
         LDA   #$8000
         STAL  L055453
         LDA   #L050C32
         STAL  L055455
         LDA   #^L050C32
         STAL  L055457
         PEA   $0000
         JSL   L033335
         TAY
         CLC
         TSC
         ADC   #$0002
         TCS
         TYA
L0C1351  LDA   $F8
         STA   $FA
         LDA   $F7
         STA   $F9
         LDA   $F5
         TCD
         TSC
         CLC
         ADC   #$0284
         TCS
         RTL

