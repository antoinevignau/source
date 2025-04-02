*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg06.L
            lst   off

*-----------

            use   Seg06.E
            use   Seg06.X

*-----------

            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L060000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            PEA   $0000
            PEA   ^L030285
            PEA   L030285
            _GetColorTable
* BCS L060020
* LDA #$0000
*L060020 STAL L0201E7
            STZ   $F4
            BRL   L0600D9
L060029     STZ   $F2
            BRL   L0600A3
L06002E     LDA   $F2
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030285
            LDX   #^L030285
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            STA   $EA
            LDA   $EA
            AND   #$000F
            STA   $F0
            LDA   $EA
            AND   #$00F0
            STA   $EE
            LDA   $EA
            AND   #$0F00
            STA   $EC
            LDA   $F0
            BEQ   L060065
            DEC   $F0
L060065     LDA   $EE
            BEQ   L060071
            LDA   $EE
            SEC
            SBC   #$0010
            STA   $EE
L060071     LDA   $EC
            BEQ   L06007D
            LDA   $EC
            SEC
            SBC   #$0100
            STA   $EC
L06007D     LDA   $F0
            CLC
            ADC   $EE
            CLC
            ADC   $EC
            PHA
            LDA   $F2
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030285
            LDX   #^L030285
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            STA   [$F6]
            INC   $F2
L0600A3     LDA   $F2
            CMP   #$0010
            BNE   L06002E
            PEA   $0002
            JSL   L180073
            PLY
            STZ   $F2
            BRA   L0600D0
L0600B6     PEI   $F2
            PEA   ^L030285
            PEA   L030285
            _SetColorTable
* BCS L0600CA
* LDA #$0000
*L0600CA STAL L0201E7
            INC   $F2
L0600D0     LDA   $F2
            CMP   #$0010
            BNE   L0600B6
            INC   $F4
L0600D9     LDA   $F4
            CMP   #$0010
            BEQ   L0600E3
            BRL   L060029
L0600E3     TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L0600EB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00DC
            TCS
            PEA   $0000
            PEA   ^L030285
            PEA   L030285
            _GetColorTable
* BCS L06010B
* LDA #$0000
*L06010B STAL L0201E7
            STZ   $F0
            BRL   L060202
L060114     STZ   $EE
            BRL   L0601C9
L060119     LDA   $EE
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030285
            LDX   #^L030285
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            STA   $E6
            LDA   $E6
            AND   #$000F
            STA   $EC
            LDA   $E6
            AND   #$00F0
            STA   $EA
            LDA   $E6
            AND   #$0F00
            STA   $E8
            LDA   $EE
            LDX   #$0000
            STX   $F6
            ASL
            ROL   $F6
            LDX   $F6
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            STA   $DE
            LDA   $DE
            AND   #$000F
            STA   $E4
            LDA   $DE
            AND   #$00F0
            STA   $E2
            LDA   $DE
            AND   #$0F00
            STA   $E0
            LDA   $EC
            CMP   $E4
            BCS   L060187
            INC   $EC
L060187     LDA   $EA
            CMP   $E2
            BCS   L060195
            LDA   $EA
            CLC
            ADC   #$0010
            STA   $EA
L060195     LDA   $E8
            CMP   $E0
            BCS   L0601A3
            LDA   $E8
            CLC
            ADC   #$0100
            STA   $E8
L0601A3     LDA   $EC
            CLC
            ADC   $EA
            CLC
            ADC   $E8
            PHA
            LDA   $EE
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L030285
            LDX   #^L030285
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            STA   [$F2]
            INC   $EE
L0601C9     LDA   $EE
            CMP   #$0010
            BEQ   L0601D3
            BRL   L060119
L0601D3     PEA   $0002
            JSL   L180073
            PLY
            STZ   $EE
            BRA   L0601F9
L0601DF     PEI   $EE
            PEA   ^L030285
            PEA   L030285
            _SetColorTable
* BCS L0601F3
* LDA #$0000
*L0601F3 STAL L0201E7
            INC   $EE
L0601F9     LDA   $EE
            CMP   #$0010
            BNE   L0601DF
            INC   $F0
L060202     LDA   $F0
            CMP   #$0010
            BEQ   L06020C
            BRL   L060114
L06020C     TSC
            CLC
            ADC   #$001A
            TCS
            PLD
            RTL

L060214     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00DA
            TCS
            LDY   #$0002
            LDA   [$FD],Y
            STA   $E2
            LDY   #$0006
            LDA   [$FD],Y
            STA   $DE
            LDA   [$FD]
            STA   $E0
            LDY   #$0004
            LDA   [$FD],Y
            STA   $DC
            LDA   $DC
            SEC
            SBC   #$00C8
            BEQ   L06024C
            BVS   L060245
            EOR   #$8000
L060245     BPL   L06024C
            LDA   #$00C8
            STA   $DC
L06024C     LDA   $E2
            SEC
            SBC   #$0000
            BVS   L060257
            EOR   #$8000
L060257     BMI   L06025B
            STZ   $E2
L06025B     LDA   $DE
            SEC
            SBC   #$013F
            BEQ   L06026F
            BVS   L060268
            EOR   #$8000
L060268     BPL   L06026F
            LDA   #$013F
            STA   $DE
L06026F     LDA   $E0
            LDX   #$0000
            TAY
            BPL   L060278
            DEX
L060278     STX   $EE
            ASL
            ROL   $EE
            LDX   $EE
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            PHA
            LDA   #$0001
            PHA
            LDA   $E2
            SEC
            JSL   L1A184A
            PLA
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $E8
            LDA   $DC
            SEC
            SBC   $E0
            STA   $E6
            LDA   $DE
            SEC
            SBC   $E2
            STA   $E4
            LDA   $E4
            SEC
            SBC   #$0000
            BEQ   L060304
            BVS   L0602C3
            EOR   #$8000
L0602C3     BPL   L060304
            LDA   $E6
            SEC
            SBC   #$0000
            BEQ   L060304
            BVS   L0602D2
            EOR   #$8000
L0602D2     BPL   L060304
            PEI   $E4
            PEI   $E6
            LDA   $E8
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            LDA   $E8
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L1A0EFF
            JSL   L0A017E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L060310
L060304     PEA   ^L03015F
            PEA   L03015F
            JSL   L1A0DAA
            PLY
            PLY
L060310     TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L060318     ENT
            PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00DE
            TCS
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEA   ^L03016E
            PEA   L03016E
            JSL   L1A0DAA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            SEC
            SBC   #$00C8
            BEQ   L060351
            BVS   L06034A
            EOR   #$8000
L06034A     BPL   L060351
            LDA   #$00C8
            STA   $FF
L060351     LDA   $F9
            SEC
            SBC   #$0000
            BVS   L06035C
            EOR   #$8000
L06035C     BMI   L060360
            STZ   $F9
L060360     LDA   $FD
            SEC
            SBC   #$0140
            BEQ   L060374
            BVS   L06036D
            EOR   #$8000
L06036D     BPL   L060374
            LDA   #$0140
            STA   $FD
L060374     LDA   $FB
            LDX   #$0000
            TAY
            BPL   L06037D
            DEX
L06037D     STX   $EA
            ASL
            ROL   $EA
            LDX   $EA
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   [$E6]
            PHA
            LDA   #$0001
            PHA
            LDA   $F9
            SEC
            JSL   L1A184A
            PLA
            PLX
            STX   $EA
            CLC
            ADC   $EA
            STA   $E4
            LDA   $FF
            SEC
            SBC   $FB
            STA   $E2
            LDA   $FD
            SEC
            SBC   $F9
            STA   $E0
            LDA   $E0
            CMP   #$0000
            BEQ   L0603FD
            BCC   L0603FD
            LDA   $E2
            CMP   #$0000
            BEQ   L0603FD
            BCC   L0603FD
            PEI   $E0
            PEI   $E2
            LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L1A0EFF
            LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F3
            LDA   $F1
            JSL   L1A0EFF
            JSL   L0A017E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L060409
L0603FD     PEA   ^L030190
            PEA   L030190
            JSL   L1A0DAA
            PLY
            PLY
L060409     JSL   L1A0E95
            TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

L060415     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            LDA   [$F5]
            CMP   [$F9]
            BMI   L060428
            LDA   [$F9]
L060428     STA   [$FD]
            LDY   #$0002
            LDA   [$F5],Y
            CMP   [$F9],Y
            BMI   L060435
            LDA   [$F9],Y
L060435     STA   [$FD],Y
            LDY   #$0004
            LDA   [$F5],Y
            CMP   [$F9],Y
            BPL   L060442
            LDA   [$F9],Y
L060442     INC
            INC
            STA   [$FD],Y
            LDY   #$0006
            LDA   [$F5],Y
            CMP   [$F9],Y
            BPL   L060451
            LDA   [$F9],Y
L060451     INC
            INC
            STA   [$FD],Y
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

