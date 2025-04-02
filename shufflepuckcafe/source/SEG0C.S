*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg0C.L
            lst   off

*-----------

            use   Seg0C.E

*-----------

            use   4/Util.Macs

*-----------

L0C0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   $FD
            XBA
            STA   $F0
            LDA   $FF
            XBA
            STA   $EE
            LDX   $F0
            LDA   $EE
            TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L0C0023     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            XBA
            STA   $FF
            LDA   $FF
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$0080
            BCS   L0C0057
            LDA   $FF
            BRA   L0C005C
            BRA   L0C005C
L0C0057     LDA   #$0F00
            ORA   $FF
L0C005C     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

