*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg20.L
            lst   off

*-----------

            use   Seg20.X

*-----------

            use   4/Util.Macs

*-----------

L200000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L032B0B
            PEA   L032B0B
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

L200023     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDA   L02019B
            CLC
            ADC   #$0001
            STA   $F4
            LDA   L02019F
            SEC
            SBC   #$0002
            STA   $F2
            LDA   L020199
            CLC
            ADC   #$0001
            STA   $F0
            LDA   L02019D
            SEC
            SBC   #$0001
            STA   $EE
            PEA   $000C
            PEI   $EE
            PEI   $F2
            PEI   $F0
            PEI   $F4
            JSL   L070772
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $F2
            PEI   $F0
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EE
            PEI   $F0
            PEI   $F2
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $F2
            PEI   $EE
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EE
            PEI   $F0
            PEI   $F4
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            DEC   $F0
            PEA   $000E
            PEI   $F2
            PEI   $F0
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            DEC   $F0
            INC   $F4
            DEC   $F2
            PEA   $000E
            PEI   $F2
            PEI   $F0
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000E
            LDA   $F2
            SEC
            SBC   #$0001
            PHA
            LDA   $F0
            SEC
            SBC   #$0001
            PHA
            LDA   $F4
            CLC
            ADC   #$0001
            PHA
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            CLC
            ADC   #$0003
            STA   $F0
            DEC   $EE
            PEA   $000B
            PEI   $F2
            PEI   $F0
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $EE
            PEI   $F0
            PEI   $F2
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $F2
            PEI   $EE
            PEI   $F4
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $EE
            PEI   $F0
            PEI   $F4
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            LDA   L02019B
            SEC
            SBC   #$0001
            STA   L02019B
            LDA   L02019F
            CLC
            ADC   #$0001
            STA   L02019F
            LDA   L020199
            SEC
            SBC   #$0002
            STA   L020199
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

