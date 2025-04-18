*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

         mx    %00

         rel
         dsk   Seg08.L
         lst   off

*-----------

         use   Seg08.E
         use   Seg08.X

*-----------

         use   4/Util.Macs

*-----------

L080000  PHD
         TSC
         SEC
         SBC   #$00EF
         TCD
         ADC   #$00E8
         TCS
         SEC
         LDA   L02016B
         SBC   #$0000
         BNE   L08001C
         LDA   L02016D
         SBC   #$0000
         BRA   L080024
L08001C  LDA   L02016D
         SBC   #$0000
         REP   #$02
L080024  BNE   L080029
         BRL   L080094
L080029  BVS   L08002E
         EOR   #$8000
L08002E  BMI   L080033
         BRL   L080094
L080033  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDA   [$FD]
         LDX   #$0000
         TAY
         BPL   L080044
         DEX
L080044  PHX
         PHA
         LDX   L020169
         LDA   L020167
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   L020169
         STA   L020167
         LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0002
         LDA   [$FD],Y
         LDX   #$0000
         TAY
         BPL   L080074
         DEX
L080074  PHX
         PHA
         LDX   L02016D
         LDA   L02016B
         JSL   L1A0F0A
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   L02016D
         STA   L02016B
L080094  LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0004
         LDA   [$FD],Y
         LDX   #$0000
         TAY
         BPL   L0800A8
         DEX
L0800A8  PHX
         PHA
         LDX   $F7
         LDA   $F5
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   $F7
         STA   $F5
         LDX   #$0000
         LDA   #$0007
         PHX
         PHA
         LDY   #$0006
         LDA   [$FD],Y
         LDX   #$0000
         TAY
         BPL   L0800D4
         DEX
L0800D4  PHX
         PHA
         LDX   $FB
         LDA   $F9
         SEC
         JSL   L1A10DF
         PLA
         PLX
         SEC
         JSL   L1A186E
         PLA
         PLX
         STX   $FB
         STA   $F9
         LDX   L020169
         LDA   L020167
         CLC
         ADC   $F5
         PHA
         TXA
         ADC   $F7
         TAX
         PLA
         STX   L020169
         STA   L020167
         LDX   L02016D
         LDA   L02016B
         CLC
         ADC   $F9
         PHA
         TXA
         ADC   $FB
         TAX
         PLA
         STX   L02016D
         STA   L02016B
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L08011E  PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         JSL   L210269
         LDA   L0200EE
         SEC
         SBC   #$0001
         BEQ   L080169
         BVS   L08013B
         EOR   #$8000
L08013B  BPL   L080169
         PEA   ^L0200A8
         PEA   L0200A8
         LDA   L020023
         LDX   #$0000
         TAY
         BPL   L08014D
         DEX
L08014D  PHX
         PHA
         LDA   L020021
         LDX   #$0000
         TAY
         BPL   L080159
         DEX
L080159  PHX
         PHA
         JSL   L080000
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         BRA   L080187
L080169  PEA   ^L0200A8
         PEA   L0200A8
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L080000
         TAY
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
L080187  SEC
         LDA   L02016B
         SBC   #$FFFB
         BNE   L080198
         LDA   L02016D
         SBC   #$FFFF
         BRA   L0801A0
L080198  LDA   L02016D
         SBC   #$FFFF
         REP   #$02
L0801A0  BEQ   L0801B5
         BVS   L0801A7
         EOR   #$8000
L0801A7  BPL   L0801B5
         LDX   #$FFFF
         LDA   #$FFFB
         STX   L02016D
         STA   L02016B
L0801B5  LDA   L02001D
         SEC
         SBC   #$0004
         LDX   #$0000
         TAY
         BPL   L0801C3
         DEX
L0801C3  STX   L020165
         STA   L020163
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0801D1  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         LDX   L020165
         LDA   L020163
         SEC
         SBC   L02016B
         PHA
         TXA
         SBC   L02016D
         TAX
         PLA
         PHX
         PHA
         LDA   L02001D
         SEC
         SBC   L020023
         LDX   #$0000
         TAY
         BPL   L0801FD
         DEX
L0801FD  JSL   L1A130B
         BVS   L080206
         EOR   #$8000
L080206  BPL   L08020B
         BRL   L0802CE
L08020B  LDX   L020165
         LDA   L020163
         PHX
         PHA
         LDA   L02001D
         LDX   #$0000
         TAY
         BPL   L08021D
         DEX
L08021D  JSL   L1A130B
         BVS   L080226
         EOR   #$8000
L080226  BMI   L08022B
         BRL   L0802CE
L08022B  LDX   L020161
         LDA   L02015F
         SEC
         SBC   L020167
         PHA
         TXA
         SBC   L020169
         TAX
         PLA
         PHX
         PHA
         LDX   L020161
         LDA   L02015F
         PHX
         PHA
         JSL   L1B0170
         PLY
         PLY
         PLY
         PLY
         CLC
         ADC   #$0018
         PHA
         LDA   L02001F
         SEC
         SBC   L020021
         PHA
         LDA   L02001F
         PHA
         JSL   L1B0070
         PLY
         PLY
         SEC
         SBC   L0200B8
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BVS   L080274
         EOR   #$8000
L080274  BPL   L080279
         BRL   L0802CE
L080279  LDX   L020161
         LDA   L02015F
         SEC
         SBC   L020167
         PHA
         TXA
         SBC   L020169
         TAX
         PLA
         PHX
         PHA
         LDX   L020161
         LDA   L02015F
         PHX
         PHA
         JSL   L1B0135
         PLY
         PLY
         PLY
         PLY
         SEC
         SBC   #$0018
         PHA
         LDA   L02001F
         SEC
         SBC   L020021
         PHA
         LDA   L02001F
         PHA
         JSL   L1B0099
         PLY
         PLY
         CLC
         ADC   L0200B8
         PLX
         STX   $F6
         SEC
         SBC   $F6
         BEQ   L0802CE
         BVS   L0802C4
         EOR   #$8000
L0802C4  BPL   L0802CE
         JSL   L08011E
         JSL   L230BD3
L0802CE  TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0802D6  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F0
         TCS
         LDA   L02001F
         STA   $F4
         LDA   L02001D
         STA   $F2
         LDA   L02001F
         CLC
         ADC   L020021
         STA   L02001F
         LDA   L02001D
         CLC
         ADC   L020023
         STA   L02001D
         LDA   #$00FA
         SEC
         SBC   L0200B8
         PHA
         LDA   #$FF06
         CLC
         ADC   L0200B8
         PHA
         LDA   L02001F
         PHA
         JSL   L1B00C4
         PLY
         PLY
         PLY
         STA   L02001F
         PEA   $0578
         PEA   $041F
         LDA   L02001D
         PHA
         JSL   L1B00C4
         PLY
         PLY
         PLY
         STA   L02001D
         LDA   L02001F
         SEC
         SBC   $F4
         STA   L020021
         LDA   L02001D
         SEC
         SBC   $F2
         STA   L020023
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L08034B  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E6
         TCS
         LDA   L02001F
         SEC
         SBC   L0200B8
         SEC
         SBC   #$0002
         STA   $EC
         LDA   #$0104
         STA   $EA
         LDA   L02001D
         STA   $E8
         PEI   $E8
         PEI   $EA
         PEI   $EC
         PEA   ^L020025
         PEA   L020025
         JSL   L2700D2
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   L02001F
         CLC
         ADC   L0200B8
         CLC
         ADC   #$0001
         STA   $EC
         LDA   #$012C
         STA   $EA
         LDA   L02001D
         STA   $E8
         PEI   $E8
         PEI   $EA
         PEI   $EC
         PEA   ^L020029
         PEA   L020029
         JSL   L2700D2
         PLY
         PLY
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL

L0803B6  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00F4
         TCS
         PEA   ^L0302A5
         PEA   L0302A5
         JSL   L1A0E02
         PLY
         PLY
         JSL   L1A0E95
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0803D9  ENT
         PHD
         TSC
         SEC
         SBC   #$00FB
         TCD
         ADC   #$00E6
         TCS
         LDA   L020027
         CLC
         ADC   #$0001
         STA   $EE
         LDA   L02002B
         SEC
         SBC   #$0002
         STA   $EA
         LDA   L020025
         CLC
         ADC   #$0001
         STA   $EC
         LDA   L020029
         SEC
         SBC   #$0001
         STA   $E8
         PEA   $000C
         PEI   $E8
         PEI   $EA
         PEI   $EC
         PEI   $EE
         JSL   L070772
         PLY
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         PEI   $EA
         PEI   $EC
         PEI   $EE
         JSL   L0707A3
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         PEI   $E8
         PEI   $EC
         PEI   $EA
         JSL   L070869
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         PEI   $EA
         PEI   $E8
         PEI   $EE
         JSL   L0707A3
         PLY
         PLY
         PLY
         PLY
         PEA   $000F
         PEI   $E8
         PEI   $EC
         PEI   $EE
         JSL   L070869
         PLY
         PLY
         PLY
         PLY
         DEC   $EC
         PEA   $000E
         PEI   $EA
         PEI   $EC
         PEI   $EE
         JSL   L0707A3
         PLY
         PLY
         PLY
         PLY
         DEC   $EC
         INC   $EE
         DEC   $EA
         LDA   $EC
         CLC
         ADC   #$0003
         STA   $EC
         DEC   $E8
         PEA   $000B
         PEI   $EA
         PEI   $EC
         PEI   $EE
         JSL   L0707A3
         PLY
         PLY
         PLY
         PLY
         PEA   $000B
         PEI   $E8
         PEI   $EC
         PEI   $EA
         JSL   L070869
         PLY
         PLY
         PLY
         PLY
         PEA   $000B
         PEI   $EA
         PEI   $E8
         PEI   $EE
         JSL   L0707A3
         PLY
         PLY
         PLY
         PLY
         PEA   $000B
         PEI   $E8
         PEI   $EC
         PEI   $EE
         JSL   L070869
         PLY
         PLY
         PLY
         PLY
         LDA   L020027
         SEC
         SBC   #$0001
         STA   L020027
         LDA   L02002B
         CLC
         ADC   #$0001
         STA   L02002B
         LDA   L020025
         SEC
         SBC   #$0002
         STA   L020025
         TSC
         CLC
         ADC   #$0014
         TCS
         PLD
         RTL
