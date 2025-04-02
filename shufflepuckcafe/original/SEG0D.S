*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg0D.L
         lst   off

*-----------

         use   Seg0D.E
         use   Seg0D.X

*-----------

         use   4/Util.Macs

*-----------

L0D0000  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L02009B
         LDA   L020099
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         PEA   $0016
         PEA   $0006
         PEA   $0000
         JSL   L070000
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         LDX   L02009B
         LDA   L020099
         PHX
         PHA
         LDX   L020151
         LDA   L02014F
         PHX
         PHA
         PEA   $0021
         PEA   $0006
         LDA   L020087
         PHA
         JSL   L070000
         TAY
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D005E  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020045
         STA   L020049
         LDA   L020047
         STA   L02004B
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D007D  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E4
         TCS
         PEA   ^L03057D
         PEA   L03057D
         JSL   L1A0E02
         PLY
         PLY
         LDA   #$FFF3
         STA   $F0
L0D0099  LDA   $FD
         SEC
         SBC   #$0005
         BEQ   L0D00BA
         BVS   L0D00A6
         EOR   #$8000
L0D00A6  BPL   L0D00BA
         LDA   $FD
         SEC
         SBC   #$0005
         STA   $FD
         LDA   $F0
         CLC
         ADC   #$0014
         STA   $F0
         BRA   L0D0099
L0D00BA  LDA   $FD
         ASL
         ASL
         PHA
         LDA   $F0
         PLX
         STX   $F6
         CLC
         ADC   $F6
         STA   $F0
         LDA   #$0008
         CLC
         ADC   $FF
         STA   $EE
         PEA   $0000
         PEA   $0032
         PEA   $FFC4
         JSL   L1103A3
         PLY
         PLY
         PLY
         LDA   $FD
         CMP   #$0005
         BNE   L0D0129
         LDA   $F0
         SEC
         SBC   #$0002
         STA   $F0
         PEA   $000A
         PEA   $0000
         LDA   $EE
         CLC
         ADC   #$0001
         PHA
         PEI   $F0
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         PEA   $0002
         PEA   $0001
         LDA   $EE
         CLC
         ADC   #$0007
         SEC
         SBC   #$0001
         PHA
         LDA   $F0
         SEC
         SBC   #$0010
         PHA
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         BRA   L0D0152
L0D0129  PEA   $000A
         PEA   $0000
         PEI   $EE
         PEI   $F0
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         PEA   $0002
         PEA   $0001
         LDA   $EE
         CLC
         ADC   #$0007
         PHA
         PEI   $F0
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
L0D0152  PEA   $000A
         PEA   $0000
         PEA   $0032
         PEA   $FFC4
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0012
         TCS
         PLD
         RTL

L0D0172  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   $000B
         PEI   $FF
         JSL   L0D007D
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D0190  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   $0000
         PEI   $FF
         JSL   L0D007D
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D01AE  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L020045
         STZ   L020047
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D01C7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020047
         SEC
         SBC   #$000F
         BVS   L0D01DE
         EOR   #$8000
L0D01DE  BMI   L0D01EE
         LDA   L020045
         SEC
         SBC   #$000F
         BVS   L0D01EC
         EOR   #$8000
L0D01EC  BPL   L0D01F5
L0D01EE  LDA   #$0001
         BRA   L0D01F8
         BRA   L0D01F8
L0D01F5  LDA   #$0000
L0D01F8  TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L0D0202  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020047
         SEC
         SBC   #$000F
         BVS   L0D0219
         EOR   #$8000
L0D0219  BPL   L0D0222
         STZ   L020106
         JSL   L2605A0
L0D0222  LDA   L020045
         SEC
         SBC   #$000F
         BVS   L0D022E
         EOR   #$8000
L0D022E  BPL   L0D0237
         STZ   L020106
         JSL   L260536
L0D0237  LDA   L020106
         BEQ   L0D0240
         JSL   L170000
L0D0240  JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D024C  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020108
         CMP   #$0000
         BNE   L0D026D
         PEA   $041F
         PEA   $0000
         JSL   L1F0000
         PLY
         PLY
         BRA   L0D0279
L0D026D  PEA   $00C3
         PEA   $0000
         JSL   L1F0000
         PLY
         PLY
L0D0279  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D0281  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L1D03CA
         INC   L020047
         JSL   L0F1565
         JSL   L0F190A
         JSL   L1D03CA
         JSL   L0D024C
         LDA   L020047
         PHA
         JSL   L0D0172
         PLY
         JSL   L0D005E
         JSL   L0D0202
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D02BC  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L1D03CA
         INC   L020045
         JSL   L0F1598
         JSL   L0F1933
         JSL   L0F0000
         JSL   L0D024C
         LDA   L020045
         PHA
         JSL   L0D0190
         PLY
         JSL   L0D005E
         JSL   L0D0202
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D02F7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L020047
         BEQ   L0D030F
         LDA   #$000F
         STA   L020047
         BRA   L0D031A
L0D030F  LDA   L020045
         BEQ   L0D031A
         LDA   #$000F
         STA   L020045
L0D031A  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D0322  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00EE
         TCS
         LDA   #$0001
         STA   L020106
         LDA   #$FFF6
         STA   $F4
         LDA   #$0006
         STA   $F2
         PEA   $0000
         PEA   $0032
         PEA   $FFC4
         JSL   L1103A3
         PLY
         PLY
         PLY
         LDA   L020045
         BEQ   L0D0385
         PEA   $000A
         PEA   $0003
         LDA   $F2
         CLC
         ADC   #$0001
         PHA
         PEI   $F4
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         PEA   $0006
         PEA   $0002
         LDA   $F2
         CLC
         ADC   #$0001
         PHA
         LDA   $F4
         CLC
         ADC   #$003E
         PHA
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
L0D0385  LDA   L020047
         BEQ   L0D03DD
         LDA   L020047
         CMP   #$00FF
         BEQ   L0D03DD
         LDA   $F2
         CLC
         ADC   #$000B
         STA   $F2
         LDA   L020045
         BEQ   L0D03A6
         LDA   #$0005
         STA   $F0
         BRA   L0D03AB
L0D03A6  LDA   #$000A
         STA   $F0
L0D03AB  PEI   $F0
         PEA   $0003
         LDA   $F2
         CLC
         ADC   #$0001
         PHA
         PEI   $F4
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         PEA   $0006
         PEA   $0002
         LDA   $F2
         CLC
         ADC   #$0001
         PHA
         LDA   $F4
         CLC
         ADC   #$003E
         PHA
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
L0D03DD  PEA   $000A
         PEA   $0003
         PEA   $0032
         PEA   $FFC4
         JSL   L1103D4
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$000C
         TCS
         PLD
         RTL

L0D03F9  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   ^L03058B
         PEA   L03058B
         JSL   L1A0E02
         PLY
         PLY
         LDA   $F9
         STA   L020091
         LDA   $FB
         STA   L020093
         LDA   $FD
         LDX   #$0000
         TAY
         BPL   L0D0423
         DEX
L0D0423  STX   L02008B
         STA   L020089
         LDA   $FF
         LDX   #$0000
         TAY
         BPL   L0D0432
         DEX
L0D0432  STX   L02008F
         STA   L02008D
         PEA   $0000
         PEI   $FF
         PEI   $FD
         JSL   L11015C
         PLY
         PLY
         PLY
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0D0452  PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00EC
         TCS
         PEA   ^L030598
         PEA   L030598
         JSL   L1A0E02
         PLY
         PLY
         LDA   #$FFF3
         STA   $F0
L0D046E  LDA   $FD
         SEC
         SBC   #$0005
         BEQ   L0D048F
         BVS   L0D047B
         EOR   #$8000
L0D047B  BPL   L0D048F
         LDA   $FD
         SEC
         SBC   #$0005
         STA   $FD
         LDA   $F0
         CLC
         ADC   #$0014
         STA   $F0
         BRA   L0D046E
L0D048F  LDA   $FD
         ASL
         ASL
         PHA
         LDA   $F0
         PLX
         STX   $F6
         CLC
         ADC   $F6
         STA   $F0
         LDA   #$0008
         CLC
         ADC   $FF
         STA   $EE
         LDA   $FD
         CMP   #$0005
         BNE   L0D04DA
         LDA   $F0
         SEC
         SBC   #$0002
         STA   $F0
         LDA   $EE
         CLC
         ADC   #$0007
         SEC
         SBC   #$0002
         PHA
         LDA   $F0
         SEC
         SBC   #$0010
         PHA
         LDA   $EE
         CLC
         ADC   #$0001
         PHA
         PEI   $F0
         JSL   L0D03F9
         PLY
         PLY
         PLY
         PLY
         BRA   L0D04EF
L0D04DA  LDA   $EE
         CLC
         ADC   #$0007
         PHA
         PEI   $F0
         PEI   $EE
         PEI   $F0
         JSL   L0D03F9
         PLY
         PLY
         PLY
         PLY
L0D04EF  JSL   L1A0E95
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0D04FB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   #$0001
         STA   $F4
         BRA   L0D051A
L0D050D  PEA   $000B
         PEI   $F4
         JSL   L0D0452
         PLY
         PLY
         INC   $F4
L0D051A  LDA   $F4
         SEC
         SBC   L02004B
         BEQ   L0D050D
         BVS   L0D0527
         EOR   #$8000
L0D0527  BPL   L0D050D
         LDA   #$0001
         STA   $F4
         BRA   L0D053D
L0D0530  PEA   $0000
         PEI   $F4
         JSL   L0D0452
         PLY
         PLY
         INC   $F4
L0D053D  LDA   $F4
         SEC
         SBC   L020049
         BEQ   L0D0530
         BVS   L0D054A
         EOR   #$8000
L0D054A  BPL   L0D0530
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL
