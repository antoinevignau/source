*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg27.L
            lst   off

*-----------

            use   Seg27.X

*-----------

            use   4/Util.Macs

*-----------

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$0002
            LDA   [$FD],Y
            CLC
            ADC   #$00A0
            LDY   #$0002
            STA   [$FD],Y
            LDA   [$FD]
            CLC
            ADC   #$0011
            STA   [$FD]
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
            ADC   #$00F0
            TCS
            LDY   #$0002
            LDA   [$FD],Y
            SEC
            SBC   #$00A0
            LDY   #$0002
            STA   [$FD],Y
            LDA   [$FD]
            SEC
            SBC   #$0011
            STA   [$FD]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L270052     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L270066
            DEX
L270066     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FB
            LDX   #$0000
            TAY
            BPL   L27007C
            DEX
L27007C     PEA   $0000
            PEA   $0168
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            LDY   #$0002
            STA   [$F7],Y
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L27009E
            DEX
L27009E     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L2700B4
            DEX
L2700B4     PEA   $0000
            PEA   $0153
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STA   [$F7]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L2700D2     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L2700E6
            DEX
L2700E6     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FB
            LDX   #$0000
            TAY
            BPL   L2700FC
            DEX
L2700FC     PEA   $0000
            PEA   $0168
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            STA   [$F7],Y
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L270129
            DEX
L270129     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L27013F
            DEX
L27013F     PEA   $0000
            PEA   $0153
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STA   [$F7]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L270168     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L27017C
            DEX
L27017C     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L270192
            DEX
L270192     PEA   $0000
            PEA   $0168
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L2701BF
            DEX
L2701BF     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   #$0001
            LDA   #$8D44
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STA   [$F9]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L2701EE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L270202
            DEX
L270202     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L270218
            DEX
L270218     PEA   $0000
            PEA   $0168
            CLC
            JSL   L1A10DF
            PLA
            PLX
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L270245
            DEX
L270245     CLC
            ADC   #$0240
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   #$0001
            LDA   #$584C
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STA   [$F9]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

