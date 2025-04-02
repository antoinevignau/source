*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg25.L
         lst   off

*-----------

         use   Seg25.X

*-----------

         use   4/Util.Macs

*-----------

L250000  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EA
         TCS
         LDA   [$F9]
         STA   $EC
         LDA   [$FD]
         STA   [$F9]
         LDA   $EC
         STA   [$FD]
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L25001F  PHD
         TSC
         SEC
         SBC   #$00F3
         TCD
         ADC   #$00EC
         TCS
         PEA   $00C8
         PEA   $0000
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0006
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEA   ^L032ECB
         PEA   L032ECB
         PEA   $00C8
         PEA   $0000
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0004
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEA   ^L032EBA
         PEA   L032EBA
         PEA   $0064
         PEA   $0000
         LDX   $FF
         LDA   $FD
         CLC
         ADC   #$0002
         PHA
         TXA
         ADC   #$0000
         TAX
         PLA
         PHX
         PHA
         PEA   ^L032EA9
         PEA   L032EA9
         PEA   $0064
         PEA   $0000
         PEI   $FF
         PEI   $FD
         PEA   ^L032E97
         PEA   L032E97
         PEI   $FB
         PEI   $F9
         JSL   L240F96
         TAY
         TSC
         CLC
         ADC   #$0034
         TCS
         TYA
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2500A9  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         STZ   L02004D
         STZ   L02004F
         STZ   L0201DD
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2500C5  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0001
         STA   L02004D
         LDA   #$0019
         STA   L02004F
         LDA   #$0019
         STA   L0201DD
         LDA   #$0005
         STA   L020051
         JSL   L0E0305
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2500F4  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0001
         STA   L02004D
         LDA   #$0032
         STA   L02004F
         LDA   #$0032
         STA   L0201DD
         LDA   #$0005
         STA   L020051
         JSL   L0E0305
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L250123  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   #$0001
         STA   L02004D
         LDA   #$004B
         STA   L02004F
         LDA   #$004B
         STA   L0201DD
         LDA   #$0005
         STA   L020051
         JSL   L0E0305
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L250152  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   #$0005
         STA   $F4
         LDA   L020051
         CMP   #$0005
         BEQ   L25016D
         BRL   L2501AF
L25016D  LDA   L02004F
         CMP   #$0000
         BNE   L25017C
         LDA   #$0001
         STA   $F4
         BRA   L2501AF
L25017C  LDA   L02004F
         CMP   #$0019
         BNE   L25018B
         LDA   #$0002
         STA   $F4
         BRA   L2501AF
L25018B  LDA   L02004F
         CMP   #$0032
         BNE   L25019A
         LDA   #$0003
         STA   $F4
         BRA   L2501AF
L25019A  LDA   L02004F
         CMP   #$004B
         BNE   L2501AF
         LDA   L020051
         CMP   #$0005
         BNE   L2501AF
         LDA   #$0004
         STA   $F4
L2501AF  LDA   $F4
         TAY
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         PLD
         RTL

L2501BB  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $000A
         PEA   $0001
         PEA   ^L020051
         PEA   L020051
         PEA   ^L032EEB
         PEA   L032EEB
         PEA   $004B
         PEA   $0000
         PEA   ^L0201DD
         PEA   L0201DD
         PEA   ^L032EE4
         PEA   L032EE4
         PEA   ^L032EDB
         PEA   L032EDB
         JSL   L240CD7
         TAY
         TSC
         CLC
         ADC   #$001C
         TCS
         TYA
         TAY
         BNE   L250202
         BRL   L250245
L250202  LDA   L0201DD
         SEC
         SBC   #$0000
         BEQ   L250228
         BVS   L250210
         EOR   #$8000
L250210  BPL   L250228
         LDA   L0201DD
         SEC
         SBC   #$0008
         BVS   L25021E
         EOR   #$8000
L25021E  BMI   L250228
         LDA   #$0008
         STA   L02004F
         BRA   L25022E
L250228  LDA   L0201DD
         STA   L02004F
L25022E  LDA   L02004F
         CMP   #$0000
         BNE   L25023B
         STZ   L02004D
         BRA   L250245
L25023B  LDA   #$0001
         STA   L02004D
         JSL   L0E0305
L250245  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L25024D  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDA   L02018B
         ASL
         STA   L0201DF
         PEA   $0005
         LDA   L0201DF
         PHA
         JSL   L1B03D3
         PLY
         PLY
         STA   L0201DF
         PEA   $0064
         PEA   $0005
         PEA   ^L0201DF
         PEA   L0201DF
         PEA   ^L032EF4
         PEA   L032EF4
         JSL   L240C01
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         LDA   L0201DF
         PHA
         LDA   #$0005
         SEC
         JSL   L1A109A
         PLA
         STA   L02018B
         LDA   #$0002
         PHA
         LDA   L02018B
         SEC
         JSL   L1A0F19
         PLY
         STA   L02018B
         JSL   L21013B
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2502B9  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L02017B
         PEA   L02017B
         PEA   ^L032F01
         PEA   L032F01
         JSL   L25001F
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2502E0  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L020183
         PEA   L020183
         PEA   ^L032F14
         PEA   L032F14
         JSL   L25001F
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L250307  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   L0200B8
         ASL
         STA   $F4
         PEA   $0005
         PEI   $F4
         JSL   L1B03D3
         PLY
         PLY
         STA   $F4
         PEA   $0028
         PEA   $000A
         PEA   $0000
         TDC
         CLC
         ADC   #$00F4
         PHA
         PEA   ^L032F29
         PEA   L032F29
         JSL   L240C01
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         TAY
         BEQ   L25036C
         LDA   $F4
         PHA
         LDA   #$0005
         SEC
         JSL   L1A109A
         PLA
         STA   L0200B8
         LDA   #$0002
         PHA
         LDA   L0200B8
         SEC
         JSL   L1A0F19
         PLY
         STA   L0200B8
         JSL   L190018
L25036C  TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L250374  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L0200A8
         PEA   L0200A8
         PEA   ^L032F36
         PEA   L032F36
         JSL   L25001F
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L25039B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F2
         TCS
         LDA   #$0096
         SEC
         SBC   L0200C4
         STA   $F4
         PEA   $0064
         PEA   $0000
         PEA   ^L0200C6
         PEA   L0200C6
         PEA   ^L032F86
         PEA   L032F86
         PEA   $0096
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$00F4
         PHA
         PEA   ^L032F73
         PEA   L032F73
         PEA   $0064
         PEA   $0000
         PEA   ^L0200BA
         PEA   L0200BA
         PEA   ^L032F60
         PEA   L032F60
         PEA   $00FA
         PEA   $0000
         PEA   ^L0200C0
         PEA   L0200C0
         PEA   ^L032F4D
         PEA   L032F4D
         PEA   ^L032F47
         PEA   L032F47
         JSL   L240F96
         TAY
         TSC
         CLC
         ADC   #$0034
         TCS
         TYA
         LDA   L0200C0
         EOR   #$FFFF
         INC
         STA   L0200BC
         LDA   L0200BA
         STA   L0200BE
         LDA   #$0096
         CLC
         ADC   $F4
         STA   L0200C8
         LDA   #$0096
         SEC
         SBC   $F4
         STA   L0200C4
         LDA   L0200C6
         STA   L0200C2
         TSC
         CLC
         ADC   #$0008
         TCS
         PLD
         RTL

L25043C  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $012C
         PEA   $0000
         PEA   ^L0200E8
         PEA   L0200E8
         PEA   ^L032FE0
         PEA   L032FE0
         PEA   $012C
         PEA   $0000
         PEA   ^L0200E4
         PEA   L0200E4
         PEA   ^L032FCB
         PEA   L032FCB
         PEA   $012C
         PEA   $FED4
         PEA   ^L0200E6
         PEA   L0200E6
         PEA   ^L032FB6
         PEA   L032FB6
         PEA   $012C
         PEA   $FED4
         PEA   ^L0200E2
         PEA   L0200E2
         PEA   ^L032FA1
         PEA   L032FA1
         PEA   ^L032F99
         PEA   L032F99
         JSL   L240F96
         TAY
         TSC
         CLC
         ADC   #$0034
         TCS
         TYA
         TAY
         BNE   L2504A7
         BRL   L2504EF
L2504A7  LDA   L0200E2
         SEC
         SBC   L0200E6
         BEQ   L2504CB
         BVS   L2504B5
         EOR   #$8000
L2504B5  BPL   L2504CB
         PEA   ^L0200E6
         PEA   L0200E6
         PEA   ^L0200E2
         PEA   L0200E2
         JSL   L250000
         PLY
         PLY
         PLY
         PLY
L2504CB  LDA   L0200E4
         SEC
         SBC   L0200E8
         BEQ   L2504EF
         BVS   L2504D9
         EOR   #$8000
L2504D9  BPL   L2504EF
         PEA   ^L0200E8
         PEA   L0200E8
         PEA   ^L0200E4
         PEA   L0200E4
         JSL   L250000
         PLY
         PLY
         PLY
         PLY
L2504EF  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2504F7  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $012C
         PEA   $0000
         PEA   ^L0200DE
         PEA   L0200DE
         PEA   ^L03303B
         PEA   L03303B
         PEA   $012C
         PEA   $0000
         PEA   ^L0200E0
         PEA   L0200E0
         PEA   ^L033026
         PEA   L033026
         PEA   $012C
         PEA   $FED4
         PEA   ^L0200DA
         PEA   L0200DA
         PEA   ^L033011
         PEA   L033011
         PEA   $012C
         PEA   $FED4
         PEA   ^L0200DC
         PEA   L0200DC
         PEA   ^L032FFC
         PEA   L032FFC
         PEA   ^L032FF5
         PEA   L032FF5
         JSL   L240F96
         TAY
         TSC
         CLC
         ADC   #$0034
         TCS
         TYA
         TAY
         BNE   L250562
         BRL   L2505AA
L250562  LDA   L0200DC
         SEC
         SBC   L0200DA
         BEQ   L250586
         BVS   L250570
         EOR   #$8000
L250570  BPL   L250586
         PEA   ^L0200DA
         PEA   L0200DA
         PEA   ^L0200DC
         PEA   L0200DC
         JSL   L250000
         PLY
         PLY
         PLY
         PLY
L250586  LDA   L0200E0
         SEC
         SBC   L0200DE
         BEQ   L2505AA
         BVS   L250594
         EOR   #$8000
L250594  BPL   L2505AA
         PEA   ^L0200E0
         PEA   L0200E0
         PEA   ^L0200E0
         PEA   L0200E0
         JSL   L250000
         PLY
         PLY
         PLY
         PLY
L2505AA  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L2505B2  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   $00C8
         PEA   $0001
         PEA   ^L0200EA
         PEA   L0200EA
         PEA   ^L033065
         PEA   L033065
         PEA   $00C8
         PEA   $0001
         PEA   ^L0200D2
         PEA   L0200D2
         PEA   ^L033057
         PEA   L033057
         PEA   ^L033050
         PEA   L033050
         JSL   L240CD7
         TAY
         TSC
         CLC
         ADC   #$001C
         TCS
         TYA
         LDA   L0200D2
         STA   L0200D4
         LDA   L0200D2
         STA   L0200D6
         LDA   L0200D2
         STA   L0200D8
         LDA   L0200EA
         STA   L0200EC
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL
