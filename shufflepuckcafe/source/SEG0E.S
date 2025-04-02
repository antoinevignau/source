*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg0E.L
            lst   off

*-----------

            use   Seg0E.E
            use   Seg0E.X

*-----------

            use   4/Util.Macs

*-----------

L0E0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L020053
            STZ   L020055
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0E0019     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L020053
            CLC
            ADC   L020055
            STA   L020053
            LDA   L020053
            CLC
            ADC   L02004F
            SEC
            SBC   #$00FA
            BEQ   L0E0056
            BVS   L0E0040
            EOR   #$8000
L0E0040     BPL   L0E0056
            LDA   L020055
            EOR   #$FFFF
            INC
            STA   L020055
            LDA   #$00FA
            SEC
            SBC   L02004F
            STA   L020053
L0E0056     LDA   L020053
            SEC
            SBC   L02004F
            SEC
            SBC   #$FF06
            BVS   L0E0066
            EOR   #$8000
L0E0066     BMI   L0E007C
            LDA   L020055
            EOR   #$FFFF
            INC
            STA   L020055
            LDA   #$FF06
            CLC
            ADC   L02004F
            STA   L020053
L0E007C     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0E0084     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   L020053
            CLC
            ADC   L02004F
            LDX   #$0000
            TAY
            BPL   L0E009D
            DEX
L0E009D     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            SEC
            SBC   #$0018
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            JSL   L1A130B
            BNE   L0E00B9
            BRL   L0E01FE
L0E00B9     BVS   L0E00BE
            EOR   #$8000
L0E00BE     BMI   L0E00C3
            BRL   L0E01FE
L0E00C3     LDA   L020053
            SEC
            SBC   L02004F
            LDX   #$0000
            TAY
            BPL   L0E00D1
            DEX
L0E00D1     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            CLC
            ADC   #$0018
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            JSL   L1A130B
            BVS   L0E00ED
            EOR   #$8000
L0E00ED     BPL   L0E00F2
            BRL   L0E01FE
L0E00F2     JSL   L210269
            JSL   L230B60
            LDX   L02016D
            LDA   L02016B
            JSL   L1A0F0A
            STX   L02016D
            STA   L02016B
            LDA   L020051
            PHA
            LDA   L020055
            SEC
            JSL   L1A109A
            PLA
            STA   $F4
            LDA   L020051
            LDX   #$0000
            TAY
            BPL   L0E0123
            DEX
L0E0123     PHX
            PHA
            LDX   L020169
            LDA   L020167
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STA   L020055
            LDA   $F4
            LDX   #$0000
            TAY
            BPL   L0E013E
            DEX
L0E013E     STX   L020169
            STA   L020167
            LDA   L020055
            CMP   #$0000
            BEQ   L0E014F
            BRL   L0E01C2
L0E014F     LDA   L020167
            CMP   #$0000
            BEQ   L0E015A
            BRL   L0E01C2
L0E015A     LDA   L020169
            CMP   #$0000
            BEQ   L0E0165
            BRL   L0E01C2
L0E0165     LDA   L020051
            PHA
            PEA   $0028
            PEA   $000F
            JSL   L1B0242
            PLY
            PLY
            SEC
            JSL   L1A0F19
            PLY
            STA   L020055
            PEA   $0028
            PEA   $000F
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L0E0191
            DEX
L0E0191     STX   L020169
            STA   L020167
            PEA   $0001
            PEA   $0000
            JSL   L1B0242
            PLY
            PLY
            TAY
            BEQ   L0E01B2
            LDA   L020055
            EOR   #$FFFF
            INC
            STA   L020055
            BRA   L0E01C2
L0E01B2     LDX   L020169
            LDA   L020167
            JSL   L1A0F0A
            STX   L020169
            STA   L020167
L0E01C2     SEC
            LDA   L02016B
            SBC   #$0000
            BNE   L0E01D3
            LDA   L02016D
            SBC   #$0000
            BRA   L0E01DB
L0E01D3     LDA   L02016D
            SBC   #$0000
            REP   #$02
L0E01DB     BEQ   L0E01F2
            BVS   L0E01E2
            EOR   #$8000
L0E01E2     BPL   L0E01F2
            LDX   #$0000
            LDA   #$0248
            STX   L020165
            STA   L020163
            BRA   L0E01FE
L0E01F2     LDX   #$0000
            LDA   #$0240
            STX   L020165
            STA   L020163
L0E01FE     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L0E0206     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L02004D
            BNE   L0E0219
            BRL   L0E02FB
L0E0219     SEC
            LDA   L02016B
            SBC   #$0000
            BNE   L0E022A
            LDA   L02016D
            SBC   #$0000
            BRA   L0E0232
L0E022A     LDA   L02016D
            SBC   #$0000
            REP   #$02
L0E0232     BNE   L0E0237
            BRL   L0E028E
L0E0237     BVS   L0E023C
            EOR   #$8000
L0E023C     BMI   L0E0241
            BRL   L0E028E
L0E0241     SEC
            LDA   L020163
            SBC   #$0244
            BNE   L0E0252
            LDA   L020165
            SBC   #$0000
            BRA   L0E025A
L0E0252     LDA   L020165
            SBC   #$0000
            REP   #$02
L0E025A     BVS   L0E025F
            EOR   #$8000
L0E025F     BPL   L0E028B
            LDX   #$0000
            LDA   #$0244
            PHX
            PHA
            LDX   L020165
            LDA   L020163
            SEC
            SBC   L02016B
            PHA
            TXA
            SBC   L02016D
            TAX
            PLA
            JSL   L1A130B
            BEQ   L0E028B
            BVS   L0E0285
            EOR   #$8000
L0E0285     BPL   L0E028B
            JSL   L0E0084
L0E028B     BRL   L0E02FB
L0E028E     SEC
            LDA   L02016B
            SBC   #$0000
            BNE   L0E029F
            LDA   L02016D
            SBC   #$0000
            BRA   L0E02A7
L0E029F     LDA   L02016D
            SBC   #$0000
            REP   #$02
L0E02A7     BVS   L0E02AC
            EOR   #$8000
L0E02AC     BPL   L0E02B1
            BRL   L0E02FB
L0E02B1     SEC
            LDA   L020163
            SBC   #$0244
            BNE   L0E02C2
            LDA   L020165
            SBC   #$0000
            BRA   L0E02CA
L0E02C2     LDA   L020165
            SBC   #$0000
            REP   #$02
L0E02CA     BEQ   L0E02D3
            BVS   L0E02D1
            EOR   #$8000
L0E02D1     BMI   L0E02FB
L0E02D3     LDX   #$0000
            LDA   #$0244
            PHX
            PHA
            LDX   L020165
            LDA   L020163
            SEC
            SBC   L02016B
            PHA
            TXA
            SBC   L02016D
            TAX
            PLA
            JSL   L1A130B
            BVS   L0E02F5
            EOR   #$8000
L0E02F5     BMI   L0E02FB
            JSL   L0E0084
L0E02FB     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0E0305     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PEA   $0244
            LDA   L02004F
            EOR   #$FFFF
            INC
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L2701EE
            PLY
            PLY
            PLY
            PLY
            LDA   $F2
            STAL  L0305A4
            LDA   $F4
            STAL  L0305A6
            PEA   $0244
            LDA   L02004F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L270168
            PLY
            PLY
            PLY
            PLY
            LDA   $F2
            STAL  L0305A8
            LDA   $F4
            STAL  L0305AA
            LDAL  L0305A8
            SEC
            SBC   #$0001
            STAL  L0305A8
            LDAL  L0305AA
            CLC
            ADC   #$0001
            STAL  L0305AA
            LDAL  L0305A8
            SEC
            SBCL  L0305A4
            STAL  L0305A8
            LDA   #$0000
            STAL  L0305A4
            LDAL  L0305AA
            SEC
            SBCL  L0305A6
            STAL  L0305AA
            LDA   #$0000
            STAL  L0305A6
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L0E03A4     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            LDA   L02004D
            BNE   L0E03B7
            BRL   L0E051A
L0E03B7     PEA   $0244
            LDA   L020053
            SEC
            SBC   L02004F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L2701EE
            PLY
            PLY
            PLY
            PLY
            LDAL  L0305A4
            CLC
            ADC   $F2
            CLC
            ADC   #$0001
            STAL  L0305AC
            LDAL  L0305A8
            CLC
            ADC   $F2
            CLC
            ADC   #$0001
            STAL  L0305B0
            LDAL  L0305A6
            CLC
            ADC   $F4
            CLC
            ADC   #$0001
            STAL  L0305AE
            LDAL  L0305AA
            CLC
            ADC   $F4
            CLC
            ADC   #$0001
            STAL  L0305B2
            LDAL  L0305AE
            CLC
            ADC   #$0001
            STA   $F0
            LDAL  L0305B2
            SEC
            SBC   #$0002
            STA   $EC
            LDAL  L0305AC
            CLC
            ADC   #$0001
            STA   $EE
            LDAL  L0305B0
            SEC
            SBC   #$0001
            STA   $EA
            PEA   $000C
            PEI   $EA
            PEI   $EC
            PEI   $EE
            PEI   $F0
            JSL   L070772
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EC
            PEI   $EE
            PEI   $F0
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EA
            PEI   $EE
            PEI   $EC
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EC
            PEI   $EA
            PEI   $F0
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000F
            PEI   $EA
            PEI   $EE
            PEI   $F0
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            DEC   $EE
            PEA   $000E
            PEI   $EC
            PEI   $EE
            PEI   $F0
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            DEC   $EE
            INC   $F0
            DEC   $EC
            LDA   $EE
            CLC
            ADC   #$0003
            STA   $EE
            DEC   $EA
            PEA   $000B
            PEI   $EC
            PEI   $EE
            PEI   $F0
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $EA
            PEI   $EE
            PEI   $EC
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $EC
            PEI   $EA
            PEI   $F0
            JSL   L0707A3
            PLY
            PLY
            PLY
            PLY
            PEA   $000B
            PEI   $EA
            PEI   $EE
            PEI   $F0
            JSL   L070869
            PLY
            PLY
            PLY
            PLY
            LDAL  L0305AE
            SEC
            SBC   #$0001
            STAL  L0305AE
            LDAL  L0305B2
            CLC
            ADC   #$0001
            STAL  L0305B2
            LDAL  L0305AC
            SEC
            SBC   #$0002
            STAL  L0305AC
L0E051A     TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L02004D
            BEQ   L0E0561
            LDA   L020053
            SEC
            SBC   L02004F
            SEC
            SBC   #$0018
            BVS   L0E0544
            EOR   #$8000
L0E0544     BMI   L0E0561
            LDA   L020053
            CLC
            ADC   L02004F
            SEC
            SBC   #$FFE8
            BEQ   L0E0561
            BVS   L0E0558
            EOR   #$8000
L0E0558     BPL   L0E0561
            LDA   #$0001
            BRA   L0E0564
            BRA   L0E0564
L0E0561     LDA   #$0000
L0E0564     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

