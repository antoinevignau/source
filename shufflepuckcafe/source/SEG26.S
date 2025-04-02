*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg26.L
            lst   off

*-----------

            use   Seg26.X

*-----------

            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L260000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L03333F
            PEA   L03333F
            JSL   L1A0E02
            PLY
            PLY
            PEA   ^L03334D
            PEA   L03334D
            JSL   L040152
            PLY
            PLY
            STA   $F4
            TAY
            BEQ   L260060
            PEA   $02C8
            LDA   #L033077
            LDX   #^L033077
            TAY
            TSC
            SEC
            SBC   #$0020
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0020
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            JSL   L0400A9
            TAY
            TSC
            CLC
            ADC   #$0024
            TCS
            TYA
            PEI   $F4
            JSL   L0401AE
            PLY
L260060     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L26006C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L033355
            PEA   L033355
            JSL   L1A0E02
            PLY
            PLY
            PEA   ^L033366
            PEA   L033366
            JSL   L040187
            PLY
            PLY
            STA   $F4
            PEA   $02C8
            LDA   #L033077
            LDX   #^L033077
            TAY
            TSC
            SEC
            SBC   #$0020
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0020
            JSL   L1A1336
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            JSL   L0400CE
            TAY
            TSC
            CLC
            ADC   #$0024
            TCS
            TYA
            PEI   $F4
            JSL   L0401AE
            PLY
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L2600D5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            STZ   $F4
            BRA   L26011A
L2600E4     LDA   $F4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   L020047
            BVS   L260107
            EOR   #$8000
L260107     BMI   L260116
            LDA   $F4
            SEC
            SBC   #$0014
            BVS   L260114
            EOR   #$8000
L260114     BPL   L260118
L260116     BRA   L260127
L260118     INC   $F4
L26011A     LDA   $F4
            SEC
            SBC   #$0014
            BVS   L260125
            EOR   #$8000
L260125     BPL   L2600E4
L260127     LDA   $F4
            SEC
            SBC   #$0014
            BVS   L260132
            EOR   #$8000
L260132     BPL   L260137
            BRL   L26020D
L260137     LDA   #$0013
            STA   $F2
            BRL   L2601B7
L26013F     PEA   $0020
            LDA   $F2
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033097
            LDX   #^L033097
            JSL   L1A0EFF
            LDA   $F2
            SEC
            SBC   #$0001
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033097
            LDX   #^L033097
            JSL   L1A0EFF
            JSL   L0901F9
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $F2
            SEC
            SBC   #$0001
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDA   $F2
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            STA   [$F6]
            DEC   $F2
L2601B7     LDA   $F2
            SEC
            SBC   $F4
            BEQ   L2601C8
            BVS   L2601C3
            EOR   #$8000
L2601C3     BPL   L2601C8
            BRL   L26013F
L2601C8     LDA   $F4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   L020047
            STA   [$F6]
            PEA   $0020
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033097
            LDX   #^L033097
            JSL   L1A0EFF
            PEA   ^L033077
            PEA   L033077
            JSL   L0901F9
            PLY
            PLY
            PLY
            PLY
            PLY
L26020D     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L260215     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRL   L2602D3
L260225     LDA   $F4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$000F
            BVS   L260248
            EOR   #$8000
L260248     BPL   L26024D
            BRL   L2602D1
L26024D     PEA   $000A
            LDA   $F4
            PHA
            LDA   #$000D
            SEC
            JSL   L1A109A
            LDA   #$0044
            PLX
            STX   $FA
            CLC
            ADC   $FA
            PHA
            _MoveTo
* BCS L260271
* LDA #$0000
*L260271 STAL L0201E7
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033097
            LDX   #^L033097
            JSL   L1A0EFF
            _DrawString
* BCS L260297
* LDA #$0000
*L260297 STAL L0201E7
            PEA   ^L03336E
            PEA   L03336E
            _DrawString
* BCS L2602AD
* LDA #$0000
*L2602AD STAL L0201E7
            LDA   $F4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            JSL   L04064E
            PLY
L2602D1     INC   $F4
L2602D3     LDA   $F4
            SEC
            SBC   #$000A
            BVS   L2602DE
            EOR   #$8000
L2602DE     BMI   L2602E3
            BRL   L260225
L2602E3     STZ   $F4
            BRL   L2603A2
L2602E8     LDA   $F4
            CLC
            ADC   #$000A
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$000F
            BVS   L26030F
            EOR   #$8000
L26030F     BPL   L260314
            BRL   L2603A0
L260314     PEA   $00A7
            LDA   $F4
            PHA
            LDA   #$000D
            SEC
            JSL   L1A109A
            LDA   #$0044
            PLX
            STX   $FA
            CLC
            ADC   $FA
            PHA
            _MoveTo
* BCS L260338
* LDA #$0000
*L260338 STAL L0201E7
            LDA   $F4
            CLC
            ADC   #$000A
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033097
            LDX   #^L033097
            JSL   L1A0EFF
            _DrawString
* BCS L260362
* LDA #$0000
*L260362 STAL L0201E7
            PEA   ^L033373
            PEA   L033373
            _DrawString
* BCS L260378
* LDA #$0000
*L260378 STAL L0201E7
            LDA   $F4
            CLC
            ADC   #$000A
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033317
            LDX   #^L033317
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            JSL   L04064E
            PLY
L2603A0     INC   $F4
L2603A2     LDA   $F4
            SEC
            SBC   #$000A
            BVS   L2603AD
            EOR   #$8000
L2603AD     BMI   L2603B2
            BRL   L2602E8
L2603B2     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L2603BA     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            PEA   $004B
            PEA   $002D
            _MoveTo
* BCS L2603D7
* LDA #$0000
*L2603D7 STAL L0201E7
            PEA   $000F
            _SetForeColor
* BCS L2603EA
* LDA #$0000
*L2603EA STAL L0201E7
            PEA   $0000
            _SetBackColor
* BCS L2603FD
* LDA #$0000
*L2603FD STAL L0201E7
            PEA   ^L033077
            PEA   L033077
            JSL   L240303
            PLY
            PLY
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L260415     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0001
            STA   L0201E1
            JSL   L210761
            JSL   L2500A9
            JSL   L1C0667
            JSL   L1C0351
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L26043E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L033378
            PEA   L033378
            JSL   L1A0E02
            PLY
            PLY
            LDA   L0201E1
            BEQ   L260461
            JSL   L1C03B6
            STZ   L0201E1
L260461     JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L26046D     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            STZ   $F0
L26047A     JSL   L0F15F0
            TAY
            BEQ   L26048B
            JSL   L0F11B0
            JSL   L1D0395
            BRA   L26047A
L26048B     PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L240ED4
            PLY
            PLY
L26049A     LDA   [$F2]
            AND   #$00FF
            BEQ   L2604D8
            LDX   $F4
            LDA   $F2
            INC   $F2
            BNE   L2604AB
            INC   $F4
L2604AB     STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDA   $F0
            INC   $F0
            CLC
            ADC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDA   #L033077
            LDX   #^L033077
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRA   L26049A
L2604D8     LDA   $F0
            SEP   #$20
            STAL  L033077
            REP   #$20
            LDX   L0200A2
            LDA   L0200A0
            PHX
            PHA
            _SetPort
* BCS L2604F6
* LDA #$0000
*L2604F6 STAL L0201E7
            JSL   L2600D5
            JSL   L26006C
            LDX   L0200A2
            LDA   L0200A0
            PHX
            PHA
            _SetPort
* BCS L260516
* LDA #$0000
*L260516 STAL L0201E7
            JSL   L140206
            JSL   L040311
            JSL   L1003C0
            JSL   L0D02F7
            JSL   L130040
            TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

L260536     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0201E1
            BEQ   L260569
            LDA   L020087
            SEC
            SBC   #$0008
            BVS   L260552
            EOR   #$8000
L260552     BMI   L260565
            JSL   L0F15CB
            INC   L020087
            JSL   L100000
            JSL   L130027
            BRA   L260569
L260565     JSL   L26046D
L260569     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L260571     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L033385
            PEA   L033385
            JSL   L1A0E02
            PLY
            PLY
            JSL   L1003D9
            JSL   L0D02F7
            JSL   L130040
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L2605A0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0201E1
            BEQ   L2605B4
            JSL   L260571
L2605B4     TSC
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
            PEA   ^L0333AF
            PEA   L0333AF
            PEA   ^L033397
            PEA   L033397
            JSL   L040033
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

L2605E3     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L0333C3
            PEA   L0333C3
            PEA   $0004
            JSL   L050000
            PLY
            PLY
            PLY
            PEA   ^L0333C7
            PEA   L0333C7
            JSL   L040187
            PLY
            PLY
            STA   $F4
            LDA   $F4
            CMP   #$FFFF
            BNE   L260632
            PEA   ^L0333D2
            PEA   L0333D2
            JSL   L240DF3
            PLY
            PLY
            _ShowCursor
* BCS L26062B
* LDA #$0000
*L26062B STAL L0201E7
            BRL   L260672
L260632     PEA   $0002
            PEA   ^L020045
            PEA   L020045
            PEI   $F4
            JSL   L0400CE
            PLY
            PLY
            PLY
            PLY
            PEA   $0002
            PEA   ^L020047
            PEA   L020047
            PEI   $F4
            JSL   L0400CE
            PLY
            PLY
            PLY
            PLY
            PEA   $0002
            PEA   ^L020087
            PEA   L020087
            PEI   $F4
            JSL   L0400CE
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            JSL   L0401AE
            PLY
L260672     PEA   ^L0333E5
            PEA   L0333E5
            PEA   $0004
            JSL   L050000
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L26068A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   ^L0333E9
            PEA   L0333E9
            PEA   $0004
            JSL   L050000
            PLY
            PLY
            PLY
            PEA   ^L0333ED
            PEA   L0333ED
            JSL   L040152
            PLY
            PLY
            STA   $F4
            TAY
            BNE   L2606B9
            BRL   L260709
L2606B9     JSL   L260415
            PEA   $0002
            PEA   ^L020045
            PEA   L020045
            PEI   $F4
            JSL   L0400A9
            PLY
            PLY
            PLY
            PLY
            PEA   $0002
            PEA   ^L020047
            PEA   L020047
            PEI   $F4
            JSL   L0400A9
            PLY
            PLY
            PLY
            PLY
            STZ   L020045
            STZ   L020047
            PEA   $0002
            PEA   ^L020087
            PEA   L020087
            PEI   $F4
            JSL   L0400A9
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            JSL   L0401AE
            PLY
            JSL   L100000
            BRA   L260725
L260709     PEA   ^L0333F8
            PEA   L0333F8
            JSL   L240DF3
            PLY
            PLY
            _ShowCursor
* BCS L260721
* LDA #$0000
*L260721 STAL L0201E7
L260725     PEA   ^L03340B
            PEA   L03340B
            PEA   $0004
            JSL   L050000
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

