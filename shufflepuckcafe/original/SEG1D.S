*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg1D.L
         lst   off

*-----------

         use   Seg1D.X

*-----------

         use   4/Qd.Macs
         use   4/Util.Macs

*-----------

L1D0000  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00C2
         TCS
         PEA   ^L03206C
         PEA   L03206C
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032B1C
         PEA   L032B1C
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032AD7
         PEA   L032AD7
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   L02004D
         SEC
         SBC   #$0000
         BEQ   L1D00CF
         BVS   L1D00A0
         EOR   #$8000
L1D00A0  BPL   L1D00CF
         PEA   ^L032ADF
         PEA   L032ADF
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L1D00CF  LDA   L02001D
         LDX   #$0000
         TAY
         BPL   L1D00D9
         DEX
L1D00D9  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A130B
         BVS   L1D00EA
         EOR   #$8000
L1D00EA  BMI   L1D00FF
         JSL   L120143
         JSL   L0803D9
         JSL   L0E03A4
         JSL   L200023
         BRL   L1D016F
L1D00FF  JSL   L0803D9
         LDA   L02018F
         LDX   #$0000
         TAY
         BPL   L1D010D
         DEX
L1D010D  PHX
         PHA
         LDX   L020165
         LDA   L020163
         JSL   L1A130B
         BEQ   L1D0125
         BVS   L1D0120
         EOR   #$8000
L1D0120  BPL   L1D0125
         BRL   L1D0163
L1D0125  SEC
         LDA   L020163
         SBC   #$0244
         BNE   L1D0136
         LDA   L020165
         SBC   #$0000
         BRA   L1D013E
L1D0136  LDA   L020165
         SBC   #$0000
         REP   #$02
L1D013E  BEQ   L1D0155
         BVS   L1D0145
         EOR   #$8000
L1D0145  BPL   L1D0155
         JSL   L120143
         JSL   L0E03A4
         JSL   L200023
         BRA   L1D0161
L1D0155  JSL   L0E03A4
         JSL   L120143
         JSL   L200023
L1D0161  BRA   L1D016F
L1D0163  JSL   L0E03A4
         JSL   L200023
         JSL   L120143
L1D016F  PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         PEA   ^L032064
         PEA   L032064
         PEA   ^L03206C
         PEA   L03206C
         JSL   L060415
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         PEA   ^L020199
         PEA   L020199
         PEA   ^L032B1C
         PEA   L032B1C
         JSL   L060415
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         PEA   ^L020025
         PEA   L020025
         PEA   ^L032AD7
         PEA   L032AD7
         JSL   L060415
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   L02004D
         SEC
         SBC   #$0000
         BNE   L1D01DE
         BRL   L1D022E
L1D01DE  BVS   L1D01E3
         EOR   #$8000
L1D01E3  BMI   L1D01E8
         BRL   L1D022E
L1D01E8  PEA   $0000
         TDC
         CLC
         ADC   #$00D4
         PHA
         PEA   ^L0305AC
         PEA   L0305AC
         PEA   ^L032ADF
         PEA   L032ADF
         JSL   L060415
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00D4
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L1D022E  PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E4
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   $0000
         TDC
         CLC
         ADC   #$00DC
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032AE7
         PEA   L032AE7
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   #L032064
         LDX   #^L032064
         PHX
         PHA
         PEA   ^L03206C
         PEA   L03206C
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         LDA   L020199
         STAL  L032B1C
         LDA   L02019B
         STAL  L032B1E
         LDA   L02019D
         STAL  L032B20
         LDA   L02019F
         STAL  L032B22
         LDA   L020025
         STAL  L032AD7
         LDA   L020027
         STAL  L032AD9
         LDA   L020029
         STAL  L032ADB
         LDA   L02002B
         STAL  L032ADD
         LDA   #L0305AC
         LDX   #^L0305AC
         PHX
         PHA
         PEA   ^L032ADF
         PEA   L032ADF
         PEA   $0008
         JSL   L1A1336
         PLA
         PLA
         PLA
         PLA
         PLX
         TSC
         CLC
         ADC   #$0038
         TCS
         PLD
         RTL

L1D0333  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032AEF
         PEA   L032AEF
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032AEF
         PEA   L032AEF
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1D0395  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032AE7
         PEA   L032AE7
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1D03CA  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032AD7
         PEA   L032AD7
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032B1C
         PEA   L032B1C
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032ADF
         PEA   L032ADF
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         JSL   L120143
         PEA   ^L032B1C
         PEA   L032B1C
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032ADF
         PEA   L032ADF
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L03206C
         PEA   L03206C
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         PEA   ^L032AD7
         PEA   L032AD7
         LDX   L0200A2
         LDA   L0200A0
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         JSL   L060214
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L1D04F0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L032AF7
         PEA   L032AF7
         JSL   L1A0E02
         PLY
         PLY
         _HideCursor
         BCS   L1D0513
         LDA   #$0000
L1D0513  STAL  L0201E7
         LDX   #$0000
         LDA   #$C034
         STA   $F6
         STX   $F8
         LDA   #$0000
         SEP   #$20
         STA   [$F6]
         REP   #$20
         PEA   $00BB
         LDX   L0200A2
         LDA   L0200A0
         CLC
         ADC   #$0820
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         LDX   L02014D
         LDA   L02014B
         CLC
         ADC   #$0020
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         CLC
         ADC   #$0820
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         JSL   L0901BD
         PLY
         PLY
         PLY
         PLY
         PLY
         _ShowCursor
         BCS   L1D0573
         LDA   #$0000
L1D0573  STAL  L0201E7
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
