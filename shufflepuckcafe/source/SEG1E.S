*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg1E.L
            lst   off

*-----------

            use   Seg1E.X

*-----------

            use   4/Util.Macs

*-----------

L1E0000     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   #$0002
            PHA
            LDX   L02015D
            LDA   L02015B
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            JSL   L1A0F19
            PLY
            PHA
            LDA   $FD
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $FD
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   L020087
            CMP   #$0001
            BEQ   L1E0052
            LDA   L020087
            CMP   #$0004
            BNE   L1E0093
L1E0052     LDA   [$FD]
            SEC
            SBC   #$0005
            STA   [$FD]
            LDY   #$0004
            LDA   [$FD],Y
            CLC
            ADC   #$0003
            LDY   #$0004
            STA   [$FD],Y
            LDA   #$0002
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDY   #$0006
            LDA   [$FD],Y
            PLX
            STX   $F6
            CLC
            ADC   $F6
            SEC
            JSL   L1A0F19
            PLY
            STA   $F0
            LDA   [$FD]
            STA   $EE
            PEI   $EE
            PEI   $F0
            JSL   L1E0000
            PLY
            PLY
L1E0093     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

