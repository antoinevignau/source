
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L050000     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   #$0000
            LDA   #$C20D
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            PHA
            LDA   #$C200
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   $F4
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $00C2
            PEA   $0020
            PEI   $F4
            _FWEntry
            PLA
            PLA
            STA   L020002
            PLA
            PLA
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L050053     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            LDX   #$0000
            LDA   #$C20F
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   #$C200
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F2
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $FF
            PEA   $00C2
            PEA   $0020
            PEI   $F2
            _FWEntry
            PLA
            PLA
            STA   L020002
            PLA
            PLA
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L0500A5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   #$0000
            LDA   #$C20E
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            PHA
            LDA   #$C200
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   $F4
            LDA   #$0000
            BEQ   L0500D5
            LDA   #$0000
            BRA   L0500FA
L0500D5     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $00C2
            PEA   $0020
            PEI   $F4
            _FWEntry
            PLA
            PLA
            STA   L020002
            PLA
            PLX
L0500FA     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L050104     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   #$0000
            LDA   #$C210
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            PHA
            LDA   #$C200
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   $F4
            LDA   #$0000
            BEQ   L050134
            LDA   #$0000
            BRA   L050166
L050134     PHP
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $00C2
            PEA   $0020
            PEI   $F4
            _FWEntry
            PLA
            PLA
            STA   L020002
            PLA
            PLP
            PLP
            BCC   L050162
            LDA   #$0001
            BRA   L050165
L050162     LDA   #$0000
L050165     PLP
L050166     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L050170     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0001
            JSL   L050053
            PLY
L050183     LDA   [$FD]
            AND   #$00FF
            BEQ   L0501A5
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L050194
            INC   $FF
L050194     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            JSL   L050053
            PLY
            BRA   L050183
L0501A5     TSC
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
            JSL   L050000
            PEA   ^L030130
            PEA   L030130
            JSL   L050170
            PLY
            PLY
            PEA   ^L030133
            PEA   L030133
            JSL   L050170
            PLY
            PLY
            PEA   ^L030136
            PEA   L030136
            JSL   L050170
            PLY
            PLY
            PEA   ^L030139
            PEA   L030139
            JSL   L050170
            PLY
            PLY
            PEA   ^L03013C
            PEA   L03013C
            JSL   L050170
            PLY
            PLY
            PEA   ^L03013F
            PEA   L03013F
            JSL   L050170
            PLY
            PLY
            PEA   ^L030142
            PEA   L030142
            JSL   L050170
            PLY
            PLY
            PEA   ^L030145
            PEA   L030145
            JSL   L050170
            PLY
            PLY
            PEA   ^L030148
            PEA   L030148
            JSL   L050170
            PLY
            PLY
            PEA   ^L03014B
            PEA   L03014B
            JSL   L050170
            PLY
            PLY
            PEA   ^L03014E
            PEA   L03014E
            JSL   L050170
            PLY
            PLY
L050240     JSL   L050104
            TAY
            BEQ   L05024D
            JSL   L0500A5
            BRA   L050240
L05024D     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL
            RTL

L050256     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L050269     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   L020038
            PHA
            INC
            STA   L020038
            PLA
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030165
            LDX   #^L030165
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDX   $FF
            LDA   $FD
            LDY   #$0002
            PHA
            TXA
            STA   [$F2],Y
            PLA
            STA   [$F2]
            PEI   $FF
            PEI   $FD
            PEA   ^L030150
            PEA   L030150
            JSL   L050256
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

L0502BC     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020038
            DEC
            STA   L020038
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030165
            LDX   #^L030165
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            PEA   ^L030159
            PEA   L030159
            JSL   L050256
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

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L030162
            PEA   L030162
            JSL   L050256
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL


