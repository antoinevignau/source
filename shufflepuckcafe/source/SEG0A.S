*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg0A.L
            lst   off

*-----------

            use   Seg0A.E
            use   Seg0A.X

*-----------

            use   4/Util.Macs

*-----------

L0A0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            LSR
            DEC
            STA   $FF
            LDA   #$00A0
            SEC
            SBC   $FF
            DEC
            STA   $E6
            PHB
            PHK
            PLB
            PER   L0A0034+1
            PLA
            STA   $E8
            SEP   #$20
            LDA   $F7
            XBA
            LDA   $FB
            REP   #$20
            STA   ($E8)
            LDX   $F5
            LDY   $F9
L0A0032     LDA   $FF
L0A0034     MVN   $000000,$000000
            TYA
            CLC
            ADC   $E6
            TAY
            DEC   $FD
            BNE   L0A0032
            PLB
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L0A0049     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E0
            TCS
            LDA   $FD
            LSR
            DEC
            STA   $FD
            LDA   $FF
            LSR
            DEC
            SEC
            SBC   $FD
            STA   $E2
            LDA   #$00A0
            SEC
            SBC   $FD
            DEC
            STA   $E4
            PHB
            PHK
            PLB
            PER   L0A0086+1
            PLA
            STA   $E6
            SEP   #$20
            LDA   $F5
            XBA
            LDA   $F9
            REP   #$20
            STA   ($E6)
            LDX   $F3
            LDY   $F7
L0A0084     LDA   $FD
L0A0086     MVN   $000000,$000000
            TYA
            CLC
            ADC   $E4
            TAY
            TXA
            CLC
            ADC   $E2
            TAX
            DEC   $FB
            BNE   L0A0084
            PLB
            TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

L0A00A0     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00D6
            TCS
            LDX   $F5
            LDA   $F3
            AND   #$0000
            PHA
            TXA
            AND   #$FFFF
            TAX
            PLA
            STX   $DE
            STA   $DC
            LDX   $F9
            LDA   $F7
            AND   #$0000
            PHA
            TXA
            AND   #$FFFF
            TAX
            PLA
            STX   $DA
            STA   $D8
            LDA   $FD
            LSR
            DEC
            DEC
            STA   $FD
            LDA   $FF
            LSR
            DEC
            SEC
            SBC   $FD
            DEC
            STA   $E2
            LDA   #$00A0
            SEC
            SBC   $FD
            DEC
            DEC
            STA   $E4
            PHB
            PHK
            PLB
            PER   L0A011B+1
            PLA
            STA   $E6
            SEP   #$20
            LDA   $F5
            XBA
            LDA   $F9
            REP   #$20
            STA   ($E6)
            LDX   $F3
            LDY   $F7
L0A0102     SEP   #$20
            PHY
            TXY
            LDA   [$DC],Y
            AND   #$0F
            STA   $E0
            PLY
            LDA   [$D8],Y
            AND   #$F0
            ORA   $E0
            STA   [$D8],Y
            REP   #$20
            INX
            INY
            LDA   $FD
L0A011B     MVN   $000000,$000000
            TYA
            CLC
            ADC   $E4
            TAY
            TXA
            CLC
            ADC   $E2
            TAX
            DEC   $FB
            BNE   L0A0102
            PLB
            TSC
            CLC
            ADC   #$0016
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            LSR
            DEC
            STA   $FF
            LDA   #$00A0
            SEC
            SBC   $FF
            DEC
            STA   $E6
            PHB
            PHK
            PLB
            PER   L0A0169+1
            PLA
            STA   $E8
            SEP   #$20
            LDA   $F7
            XBA
            LDA   $FB
            REP   #$20
            STA   ($E8)
            LDX   $F5
            LDY   $F9
L0A0167     LDA   $FF
L0A0169     MVN   $000000,$000000
            TXA
            CLC
            ADC   $E6
            TAX
            DEC   $FD
            BNE   L0A0167
            PLB
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L0A017E     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            LSR
            DEC
            STA   $FF
            LDA   #$00A0
            SEC
            SBC   $FF
            DEC
            STA   $E6
            PHB
            PHK
            PLB
            PER   L0A01B2+1
            PLA
            STA   $E8
            SEP   #$20
            LDA   $F7
            XBA
            LDA   $FB
            REP   #$20
            STA   ($E8)
            LDX   $F5
            LDY   $F9
L0A01B0     LDA   $FF
L0A01B2     MVN   $000000,$000000
            TYA
            CLC
            ADC   $E6
            TAY
            TXA
            CLC
            ADC   $E6
            TAX
            DEC   $FD
            BNE   L0A01B0
            PLB
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L0A01CC     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            LDA   $FF
            LSR
            LSR
            DEC
            ASL
            STA   $FF
L0A01DF     LDY   $FF
L0A01E1     LDA   [$F9],Y
            TAX
            LDA   [$F5],Y
            JSL   L09019A
            STA   [$F9],Y
            DEY
            DEY
            BPL   L0A01E1
            LDA   $F9
            CLC
            ADC   #$00A0
            STA   $F9
            LDA   $F5
            ADC   $FF
            ADC   #$0002
            STA   $F5
            DEC   $FD
            BNE   L0A01DF
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

