*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg12.L
            lst   off

*-----------

            use   Seg12.E
            use   Seg12.X

*-----------

            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L120000     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDX   L020165
            LDA   L020163
            PHA
            PEA   $012C
            PEA   $0030
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L270052
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   #$0001
            PHA
            PEA   $0030
            JSL   L13015A
            PLY
            SEC
            SBC   $F2
            SEC
            JSL   L1A184A
            PLA
            STA   $F4
            PEA   $000C
            PEA   $0001
            PEI   $F4
            JSL   L1B00C4
            PLY
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L12005A     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            DEC   $FF
            LDX   L020165
            LDA   L020163
            PHA
            PEA   $0123
            LDX   L020161
            LDA   L02015F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L2700D2
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $FF
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L032074
            LDX   #^L032074
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            PHA
            LDA   $F2
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F2
            LDA   $FF
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L03208C
            LDX   #^L03208C
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            SEC
            SBC   #$0002
            PHA
            LDA   $F0
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F0
            LDA   $F2
            STAL  L032066
            LDA   $F0
            SEC
            SBC   #$0001
            STAL  L032064
            LDA   $FF
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L032074
            LDX   #^L032074
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            ASL
            PHA
            LDA   $F2
            PLX
            STX   $F8
            CLC
            ADC   $F8
            CLC
            ADC   #$0002
            STAL  L03206A
            LDA   $FF
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L03208C
            LDX   #^L03208C
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            PHA
            LDA   $F0
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STAL  L032068
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L120143     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            JSL   L120000
            STA   $F4
            PEI   $F4
            JSL   L12005A
            PLY
            LDAL  L032068
            SEC
            SBC   #$00C8
            BVS   L120168
            EOR   #$8000
L120168     BMI   L120197
            LDX   L020118
            LDA   L020116
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            PHX
            PHA
            LDAL  L032068
            PHA
            LDAL  L032066
            PHA
            LDA   $F4
            CLC
            ADC   #$0002
            PHA
            JSL   L070000
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L120197     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L12019F     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L032064
            PEA   L032064
            PEA   ^L03206C
            PEA   L03206C
            JSL   L060415
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $FFFC
            PEA   $FFFC
            _InsetRect
* BCS L1201E6
* LDA #$0000
*L1201E6 STAL L0201E7
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDX   L0200A2
            LDA   L0200A0
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            PHX
            PHA
            JSL   L060214
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L032064
            LDX   #^L032064
            PHX
            PHA
            PEA   ^L03206C
            PEA   L03206C
            PEA   $0008
            JSL   L1A1336
            PLA
            PLA
            PLA
            PLA
            PLX
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L120231     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDAL  L03206E
            CMP   #$0005
            BNE   L120248
            BRL   L1202B4
L120248     LDA   #L03206C
            LDX   #^L03206C
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0008
            JSL   L1A1336
            PLA
            PLA
            PLA
            PLA
            PLX
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $FFFC
            PEA   $FFFC
            _InsetRect
* BCS L120280
* LDA #$0000
*L120280 STAL L0201E7
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDX   L020151
            LDA   L02014F
            PHX
            PHA
            LDX   L02014D
            LDA   L02014B
            CLC
            ADC   #$0020
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            JSL   L060214
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L1202B4     TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

