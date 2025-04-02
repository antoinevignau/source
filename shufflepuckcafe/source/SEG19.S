*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg19.L
            lst   off

*-----------

            use   Seg19.E

*-----------

            use   4/Util.Macs

*-----------

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0000
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L190018     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L19003E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

