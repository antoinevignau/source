*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg07.L
            lst   off

*-----------

            use   Seg07.E
            use   Seg07.X

*-----------

            use   4/Qd.Macs
            use   4/Util.Macs

*-----------

L070000     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00D0
            TCS
            LDA   $F3
            AND   #$8000
            STA   $E0
            LDA   $F3
            AND   #$4000
            TAY
            BEQ   L07001F
            LDA   #$0000
            BRA   L070022
L07001F     LDA   #$0001
L070022     STA   $DE
            LDA   $F3
            AND   #$3FFF
            STA   $F3
            LDA   $F3
            LDX   #$0000
            STX   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            LDX   $EC
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E8
            STX   $EA
            LDY   #$0002
            LDA   [$E8],Y
            TAX
            LDA   [$E8]
            STX   $D4
            STA   $D2
            LDX   $FF
            LDA   $FD
            CLC
            ADC   $D2
            PHA
            TXA
            ADC   $D4
            TAX
            PLA
            STX   $DC
            STA   $DA
            LDX   $DC
            LDA   $DA
            INC   $DA
            BNE   L070071
            INC   $DC
L070071     STA   $E8
            STX   $EA
            LDA   [$E8]
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            STA   $E4
            LDX   $DC
            LDA   $DA
            INC   $DA
            BNE   L07008A
            INC   $DC
L07008A     STA   $E8
            STX   $EA
            LDA   [$E8]
            AND   #$00FF
            STA   $E6
            LDX   $FF
            LDA   $FD
            AND   #$0000
            PHA
            TXA
            AND   #$8000
            TAX
            PLA
            STX   $E8
            ORA   $E8
            BEQ   L0700D9
            LDA   $E4
            PHA
            LDA   $E6
            CLC
            JSL   L1A109A
            PLA
            LSR
            CLC
            ADC   #$0001
            PHA
            LDX   L02001B
            LDA   L020019
            PHX
            PHA
            PEI   $DC
            PEI   $DA
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   L02001B
            LDA   L020019
            STX   $DC
            STA   $DA
L0700D9     LDA   $F7
            SEC
            SBC   $E6
            STA   $E2
            LDA   $E2
            LDX   #$0000
            STX   $EC
            ASL
            ROL   $EC
            LDX   $EC
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E8
            STX   $EA
            LDA   [$E8]
            LDX   #$0000
            TAY
            BPL   L070107
            DEX
L070107     PHX
            PHA
            LDA   #$0001
            PHA
            LDA   $F5
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L07011C
            DEX
L07011C     PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            PLA
            PLX
            JSL   L1A0EFF
            PLA
            PLX
            STX   $D8
            STA   $D6
            LDA   $F7
            SEC
            SBC   L02000D
            BEQ   L07014C
            BVS   L07013F
            EOR   #$8000
L07013F     BPL   L07014C
            LDA   $E6
            CLC
            ADC   L02000D
            SEC
            SBC   $F7
            STA   $E6
L07014C     LDA   $DE
            BEQ   L07016A
            PEI   $E4
            PEI   $E6
            PEI   $D8
            PEI   $D6
            PEI   $DC
            PEI   $DA
            JSL   L0A01CC
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L070182
L07016A     PEI   $E4
            PEI   $E6
            PEI   $D8
            PEI   $D6
            PEI   $DC
            PEI   $DA
            JSL   L0A0000
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L070182     TSC
            CLC
            ADC   #$001C
            TCS
            PLD
            RTL

L07018A     ENT
            PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00C4
            TCS
            LDA   $F5
            BNE   L0701BA
            LDA   $F7
            BNE   L0701BA
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F3
            PEI   $F1
            PEI   $EF
            JSL   L070000
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRL   L0705BA
L0701BA     LDA   $EF
            AND   #$3FFF
            STA   $EF
            LDA   $EF
            LDX   #$0000
            STX   $E8
            ASL
            ROL   $E8
            ASL
            ROL   $E8
            LDX   $E8
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDY   #$0002
            LDA   [$E4],Y
            TAX
            LDA   [$E4]
            STX   $C8
            STA   $C6
            LDX   $FF
            LDA   $FD
            CLC
            ADC   $C6
            PHA
            TXA
            ADC   $C8
            TAX
            PLA
            STX   $D0
            STA   $CE
            LDX   $D0
            LDA   $CE
            INC   $CE
            BNE   L070207
            INC   $D0
L070207     STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            STA   $E0
            LDX   $D0
            LDA   $CE
            INC   $CE
            BNE   L070220
            INC   $D0
L070220     STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            STA   $E2
            LDA   $F5
            CMP   $E0
            BEQ   L070237
            BCC   L070237
            LDA   $E0
            STA   $F5
L070237     LDA   $F7
            CMP   $E2
            BEQ   L070243
            BCC   L070243
            LDA   $E2
            STA   $F7
L070243     LDX   $FF
            LDA   $FD
            AND   #$0000
            PHA
            TXA
            AND   #$8000
            TAX
            PLA
            STX   $E4
            ORA   $E4
            BEQ   L070287
            LDA   $E0
            PHA
            LDA   $E2
            CLC
            JSL   L1A109A
            PLA
            LSR
            CLC
            ADC   #$0001
            PHA
            LDX   L02001B
            LDA   L020019
            PHX
            PHA
            PEI   $D0
            PEI   $CE
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   L02001B
            LDA   L020019
            STX   $D0
            STA   $CE
L070287     LDA   $F3
            SEC
            SBC   $F7
            STA   $DE
            LDA   $DE
            LDX   #$0000
            STX   $E8
            ASL
            ROL   $E8
            LDX   $E8
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDA   [$E4]
            LDX   #$0000
            TAY
            BPL   L0702B5
            DEX
L0702B5     PHX
            PHA
            LDA   #$0001
            PHA
            LDA   $F1
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L0702CA
            DEX
L0702CA     PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            PLA
            PLX
            JSL   L1A0EFF
            PLA
            PLX
            STX   $CC
            STA   $CA
            LDA   $F3
            CMP   L020075
            BNE   L0702EA
            BRL   L07057C
L0702EA     BCS   L0702EF
            BRL   L07057C
L0702EF     LDA   $F3
            SEC
            SBC   L020075
            STA   $DC
            LDA   $F7
            CLC
            ADC   L020075
            SEC
            SBC   $F3
            STA   $F7
            LDA   $F7
            SEC
            SBC   #$0000
            BNE   L07030D
            BRL   L07047E
L07030D     BVS   L070312
            EOR   #$8000
L070312     BMI   L070317
            BRL   L07047E
L070317     LDA   $E0
            LSR
            PHA
            LDA   $F7
            CLC
            JSL   L1A109A
            PLA
            STA   $D4
            LDA   L020075
            LDX   #$0000
            STX   $E8
            ASL
            ROL   $E8
            LDX   $E8
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDA   [$E4]
            PHA
            LDA   #$0001
            PHA
            LDA   $F1
            SEC
            JSL   L1A184A
            PLA
            PLX
            STX   $E8
            CLC
            ADC   $E8
            STA   $D2
            LDA   $F1
            AND   #$0001
            TAY
            BNE   L070366
            BRL   L0703F2
L070366     PEI   $E0
            PEI   $F5
            PEI   $F7
            PEI   $CC
            PEI   $CA
            PEI   $D0
            PEI   $CE
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $DC
            LDA   $D2
            LDX   #$0000
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            LDA   $D4
            LDX   #$0000
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L1A0EFF
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $DC
            LDA   $D2
            LDX   #$0000
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
            JSL   L1A0EFF
            LDA   $D4
            LDX   #$0000
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L1A0EFF
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRL   L07047B
L0703F2     PEI   $E0
            PEI   $F5
            PEI   $F7
            PEI   $CC
            PEI   $CA
            PEI   $D0
            PEI   $CE
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $DC
            LDA   $D2
            LDX   #$0000
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            LDA   $D4
            LDX   #$0000
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L1A0EFF
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $DC
            LDA   $D2
            LDX   #$0000
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
            JSL   L1A0EFF
            LDA   $D4
            LDX   #$0000
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L1A0EFF
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L07047B     BRL   L07057A
L07047E     LDA   $F7
            CLC
            ADC   $F3
            SEC
            SBC   L020075
            STA   $F7
            LDA   $DE
            LDX   #$0000
            STX   $E8
            ASL
            ROL   $E8
            LDX   $E8
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDA   [$E4]
            PHA
            LDA   #$0001
            PHA
            LDA   $F1
            SEC
            JSL   L1A184A
            PLA
            PLX
            STX   $E8
            CLC
            ADC   $E8
            STA   $D2
            LDA   $F1
            AND   #$0001
            TAY
            BEQ   L070521
            PEI   $E0
            PEI   $F5
            PEI   $F7
            LDA   $D2
            LDX   #$0000
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            PEI   $D0
            PEI   $CE
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $F7
            LDA   $D2
            LDX   #$0000
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
            JSL   L1A0EFF
            PEI   $D0
            PEI   $CE
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRA   L07057A
L070521     PEI   $E0
            PEI   $F5
            PEI   $F7
            LDA   $D2
            LDX   #$0000
            PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            PEI   $D0
            PEI   $CE
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEI   $E0
            PEI   $F5
            PEI   $F7
            LDA   $D2
            LDX   #$0000
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
            JSL   L1A0EFF
            PEI   $D0
            PEI   $CE
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L07057A     BRA   L0705BA
L07057C     LDA   $F1
            AND   #$0001
            TAY
            BEQ   L0705A0
            PEI   $E0
            PEI   $F5
            PEI   $F7
            PEI   $CC
            PEI   $CA
            PEI   $D0
            PEI   $CE
            JSL   L0A00A0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRA   L0705BA
L0705A0     PEI   $E0
            PEI   $F5
            PEI   $F7
            PEI   $CC
            PEI   $CA
            PEI   $D0
            PEI   $CE
            JSL   L0A0049
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L0705BA     TAY
            TSC
            CLC
            ADC   #$0024
            TCS
            TYA
            PLD
            RTL

L0705C4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            STA   L02000F
            LDA   $FF
            STA   L02000D
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0705E1     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            PEI   $FF
            _SetSolidPenPat
* BCS L0705FA
* LDA #$0000
*L0705FA STAL L0201E7
            PEI   $F7
            PEI   $F9
            _MoveTo
* BCS L07060E
* LDA #$0000
*L07060E STAL L0201E7
            PEI   $FB
            PEI   $FD
            _LineTo
* BCS L070622
* LDA #$0000
*L070622 STAL L0201E7
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00E5
            TCD
            ADC   #$00D2
            TCS
            LDA   $EF
            LSR
            PHA
            LDA   $F1
            LDX   #$0000
            STX   $E4
            ASL
            ROL   $E4
            LDX   $E4
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E0
            STX   $E2
            LDA   [$E0]
            PLX
            STX   $E4
            CLC
            ADC   $E4
            STA   $D6
            LDA   $F7
            LSR
            PHA
            LDA   $F9
            LDX   #$0000
            STX   $E4
            ASL
            ROL   $E4
            LDX   $E4
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E0
            STX   $E2
            LDA   [$E0]
            PLX
            STX   $E4
            CLC
            ADC   $E4
            STA   $D4
            LDA   $D6
            LDX   #$0000
            PHX
            PHA
            LDX   $ED
            LDA   $EB
            JSL   L1A0EFF
            PLA
            PLX
            STX   $DE
            STA   $DC
            LDA   $D4
            LDX   #$0000
            PHX
            PHA
            LDX   $F5
            LDA   $F3
            JSL   L1A0EFF
            PLA
            PLX
            STX   $DA
            STA   $D8
            PEI   $FD
            PEI   $FB
            PEI   $DA
            PEI   $D8
            PEI   $DE
            PEI   $DC
            JSL   L0A017E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L0706DB     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E6
            TCS
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            PHA
            LDA   $FF
            PLX
            STX   $EC
            ORA   $EC
            PHA
            LDA   $FD
            SEC
            SBC   $F9
            CLC
            ADC   #$0001
            PHA
            LDA   #$0001
            PHA
            LDA   $FB
            SEC
            SBC   $F7
            SEC
            JSL   L1A184A
            LDA   #$0001
            PHA
            LDA   $F7
            CLC
            ADC   #$0001
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L070724
            DEX
L070724     PHX
            PHA
            LDA   $F9
            LDX   #$0000
            TAY
            BPL   L07072F
            DEX
L07072F     STX   $EC
            ASL
            ROL   $EC
            LDX   $EC
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $E8
            STX   $EA
            LDA   [$E8]
            LDX   #$0000
            TAY
            BPL   L070751
            DEX
L070751     PHX
            PHA
            LDX   $F5
            LDA   $F3
            JSL   L1A0EFF
            PLA
            PLX
            JSL   L1A0EFF
            JSL   L09022B
            PLY
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

L070772     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            LDX   L020151
            LDA   L02014F
            PHX
            PHA
            JSL   L0706DB
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0707A3     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E0
            TCS
            LDA   #$0001
            PHA
            LDA   $F9
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L0707C1
            DEX
L0707C1     PHX
            PHA
            LDA   $FB
            LDX   #$0000
            TAY
            BPL   L0707CC
            DEX
L0707CC     STX   $F2
            ASL
            ROL   $F2
            LDX   $F2
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            LDX   #$0000
            TAY
            BPL   L0707EE
            DEX
L0707EE     PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            PLA
            PLX
            JSL   L1A0EFF
            PLA
            PLX
            STX   $EC
            STA   $EA
            LDA   $F9
            AND   #$0001
            STA   $E4
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            STA   $E2
            LDA   $E4
            BEQ   L070826
            LDA   [$EA]
            AND   #$FFF0
            ORA   $FF
            STA   [$EA]
            INC   $F9
            INC   $EA
L070826     LDA   #$0001
            PHA
            LDA   $FD
            SEC
            SBC   $F9
            SEC
            JSL   L1A184A
            PLA
            SEC
            SBC   #$0001
            STA   $E8
            LDA   $FF
            ORA   $E2
            STA   $FF
            LDY   $E8
            LDA   $FF
            SEP   #$20
L070847     STA   [$EA],Y
            DEY
            BPL   L070847
            REP   #$20
            LDA   $FD
            AND   #$0001
            BEQ   L070861
            LDY   $E8
            INY
            LDA   [$EA],Y
            AND   #$FF0F
            ORA   $E2
            STA   [$EA],Y
L070861     TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L070869     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E2
            TCS
            LDA   $F9
            AND   #$0001
            STA   $E6
            LDA   #$0001
            PHA
            LDA   $F9
            SEC
            JSL   L1A184A
            PLA
            LDX   #$0000
            TAY
            BPL   L07088E
            DEX
L07088E     PHX
            PHA
            LDA   $FB
            LDX   #$0000
            TAY
            BPL   L070899
            DEX
L070899     STX   $F2
            ASL
            ROL   $F2
            LDX   $F2
            PHX
            PHA
            LDA   #L0303EB
            LDX   #^L0303EB
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            LDX   #$0000
            TAY
            BPL   L0708BB
            DEX
L0708BB     PHX
            PHA
            LDX   L020151
            LDA   L02014F
            JSL   L1A0EFF
            PLA
            PLX
            JSL   L1A0EFF
            PLA
            PLX
            STX   $EC
            STA   $EA
            LDA   $FD
            SEC
            SBC   $FB
            SEC
            SBC   #$0001
            ASL
            STA   $E8
            LDA   $E6
            BNE   L0708EB
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            STA   $FF
L0708EB     LDA   $E6
            LDX   #$0000
            PHX
            PHA
            LDA   #L03019F
            LDX   #^L03019F
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            AND   #$00FF
            STA   $E4
            LDX   $E8
L07090B     LDAL  L0303EB,X
            TAY
            SEP   #$20
            LDA   [$EA],Y
            AND   $E4
            ORA   $FF
            STA   [$EA],Y
            REP   #$20
            DEX
            DEX
            BPL   L07090B
            TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

