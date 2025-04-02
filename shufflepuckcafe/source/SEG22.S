*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg22.L
            lst   off

*-----------

            use   Seg22.X

*-----------

            use   4/Event.Macs
            use   4/Util.Macs

*-----------

L220000     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   [$FD]
            LDX   #$0000
            TAY
            BPL   L220014
            DEX
L220014     STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            PEA   $0000
            PEA   $0052
            CLC
            JSL   L1A10DF
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDX   #$0000
            LDA   #$0064
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            STA   [$FD]
            TSC
            CLC
            ADC   #$000A
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
            PEI   $FF
            PEI   $FD
            JSL   L220000
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            JSL   L220000
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L220079     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   [$FD]
            LDX   #$0000
            TAY
            BPL   L22008D
            DEX
L22008D     STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            PEA   $0000
            PEA   $006B
            CLC
            JSL   L1A10DF
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDX   #$0000
            LDA   #$0064
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            STA   [$FD]
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L020087
            CMP   #$0004
            BEQ   L2200E1
            BRL   L2201E2
L2200E1     PEA   ^L0200D2
            PEA   L0200D2
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200D4
            PEA   L0200D4
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200D6
            PEA   L0200D6
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200D8
            PEA   L0200D8
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200BA
            PEA   L0200BA
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200BE
            PEA   L0200BE
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200C2
            PEA   L0200C2
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200C6
            PEA   L0200C6
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200BC
            PEA   L0200BC
            JSL   L220079
            PLY
            PLY
            PEA   ^L0200C0
            PEA   L0200C0
            JSL   L220079
            PLY
            PLY
            PEA   ^L0200EA
            PEA   L0200EA
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200EC
            PEA   L0200EC
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200AC
            PEA   L0200AC
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200AE
            PEA   L0200AE
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200A8
            PEA   L0200A8
            JSL   L220000
            PLY
            PLY
            PEA   ^L0200AA
            PEA   L0200AA
            JSL   L220000
            PLY
            PLY
            LDA   L0200CE
            LDX   #$0000
            TAY
            BPL   L2201AB
            DEX
L2201AB     STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            PEA   $0000
            PEA   $0069
            CLC
            JSL   L1A10DF
            PLA
            PLX
            STX   $F4
            STA   $F2
            LDX   #$0000
            LDA   #$0064
            PHX
            PHA
            LDX   $F4
            LDA   $F2
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            STA   L0200CE
L2201E2     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L2201EA     ENT
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

L2201FD     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   L020087
            CMP   #$0006
            BNE   L220229
            LDA   $F9
            STA   L0201A9
            LDA   $FB
            STA   L0201AB
            LDA   $FD
            STA   L0200AC
            LDA   $FD
            STA   L0200AC
            LDA   $FF
            STA   L0200AE
L220229     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L220231     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0201A9
            LDX   #$0000
            TAY
            BPL   L220246
            DEX
L220246     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200F6
            STA   L0200F4
            PEA   $0005
            LDA   L0201AB
            PHA
            JSL   L1B0099
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L22026E
            DEX
L22026E     PHX
            PHA
            LDX   L020165
            LDA   L020163
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200FA
            STA   L0200F8
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L22028A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L0200DA
            STA   $F4
            PEA   $000A
            PEA   $FFF6
            LDA   L020045
            SEC
            SBC   L020047
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            CLC
            ADC   #$000A
            PHA
            LDA   $F4
            SEC
            JSL   L1A109A
            PLA
            STA   $F4
            LDA   #$0014
            PHA
            LDA   $F4
            SEC
            JSL   L1A0F19
            PLY
            STA   $F4
            PEA   $0002
            PEA   $0000
            JSL   L1B0242
            PLY
            PLY
            CMP   #$0000
            BEQ   L2202E5
            LDA   $F4
            EOR   #$FFFF
            INC
            STA   $F4
L2202E5     LDA   L0200DE
            SEC
            SBC   L0200E0
            STA   $F2
            PEA   $000A
            PEA   $FFF6
            LDA   L020045
            SEC
            SBC   L020047
            PHA
            JSL   L1B00C4
            PLY
            PLY
            PLY
            CLC
            ADC   #$000A
            PHA
            LDA   $F2
            SEC
            JSL   L1A109A
            PLA
            STA   $F2
            LDA   #$0014
            PHA
            LDA   $F2
            SEC
            JSL   L1A0F19
            PLY
            STA   $F2
            LDA   $F2
            CLC
            ADC   L0200E0
            STA   $F2
            LDA   $F4
            LDX   #$0000
            TAY
            BPL   L220331
            DEX
L220331     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200F6
            STA   L0200F4
            LDA   $F2
            LDX   #$0000
            TAY
            BPL   L22034E
            DEX
L22034E     PHX
            PHA
            LDX   L020165
            LDA   L020163
            JSL   L1A0EFF
            PLA
            PLX
            STX   L0200FA
            STA   L0200F8
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L22036A     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            JSL   L1302A9
            JSL   L0E0019
            JSL   L160645
            JSL   L0802D6
            JSL   L08034B
            JSL   L21016B
            JSL   L0F11B0
            JSL   L1D0000
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L22039D     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0003
            PHA
            LDA   $FF
            SEC
            JSL   L1A0F19
            PLY
            STA   $FF
            PHX
            PHA
            _TickCount
* BCS L2203C4
* LDA #$0000
*L2203C4 STAL L0201E7
            PLA
            PLX
            STX   $F2
            STA   $F0
L2203CE     LDA   $FF
            LDX   #$0000
            PHX
            PHA
            PHX
            PHA
            _TickCount
* BCS L2203E3
* LDA #$0000
*L2203E3 STAL L0201E7
            PLA
            PLX
            SEC
            SBC   $F0
            PHA
            TXA
            SBC   $F2
            TAX
            PLA
            JSL   L1A130B
            BEQ   L220405
            BCC   L220405
            LDA   L020106
            BEQ   L220405
            JSL   L22036A
            BRA   L2203CE
L220405     TSC
            CLC
            ADC   #$000A
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
            PEA   $000A
            JSL   L22039D
            PLY
            PEA   $000A
            JSL   L22039D
            PLY
            PEA   $000A
            JSL   L22039D
            PLY
            PEA   $000A
            JSL   L22039D
            PLY
            PEA   $000A
            JSL   L22039D
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L220448     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   #$0032
            STA   $F4
            PEA   $0001
            PEA   $0000
            JSL   L1B0242
            PLY
            PLY
            STA   $F2
            PEI   $F2
            JSL   L2306E7
            PLY
L22046D     SEC
            LDA   L020163
            SBC   #$0244
            BNE   L22047E
            LDA   L020165
            SBC   #$0000
            BRA   L220486
L22047E     LDA   L020165
            SBC   #$0000
            REP   #$02
L220486     BEQ   L2204B7
            BVS   L22048D
            EOR   #$8000
L22048D     BPL   L2204B7
            LDA   L020106
            BEQ   L2204B7
            LDA   $F4
            LDX   #$0000
            TAY
            BPL   L22049D
            DEX
L22049D     PHX
            PHA
            LDX   L020165
            LDA   L020163
            JSL   L1A108F
            PLA
            PLX
            STX   L020165
            STA   L020163
            JSL   L22036A
            BRA   L22046D
L2204B7     LDA   #$000A
            STA   $F4
            PEA   $0001
            PEA   $0000
            JSL   L1B0242
            PLY
            PLY
            CMP   #$0000
            BNE   L2204D5
            LDA   $F4
            EOR   #$FFFF
            INC
            STA   $F4
L2204D5     LDX   L020161
            LDA   L02015F
            PHX
            PHA
            JSL   L1B002E
            PLY
            PLY
            SEC
            SBC   #$0064
            BVS   L2204EC
            EOR   #$8000
L2204EC     BMI   L220516
            LDA   L020106
            BEQ   L220516
            LDA   $F4
            LDX   #$0000
            TAY
            BPL   L2204FC
            DEX
L2204FC     PHX
            PHA
            LDX   L020161
            LDA   L02015F
            JSL   L1A0EFF
            PLA
            PLX
            STX   L020161
            STA   L02015F
            JSL   L22036A
            BRA   L2204D5
L220516     PEA   $FF6A
            PEA   $FF38
            JSL   L1B0242
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L220529
            DEX
L220529     STX   L02016D
            STA   L02016B
            LDA   $F2
            CMP   #$0000
            BNE   L22056C
            LDX   L02016D
            LDA   L02016B
            PEA   $0000
            PEA   $0007
            CLC
            JSL   L1A10DF
            PLA
            PLX
            STX   L020169
            STA   L020167
            LDX   #$0000
            LDA   #$0010
            PHX
            PHA
            LDX   L020169
            LDA   L020167
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   L020169
            STA   L020167
            BRA   L22058B
L22056C     LDX   #$0000
            LDA   #$0005
            PHX
            PHA
            LDX   L02016D
            LDA   L02016B
            JSL   L1A0F0A
            SEC
            JSL   L1A0F9E
            PLY
            PLY
            STX   L020169
            STA   L020167
L22058B     SEC
            LDA   L02015F
            SBC   #$0000
            BNE   L22059C
            LDA   L020161
            SBC   #$0000
            BRA   L2205A4
L22059C     LDA   L020161
            SBC   #$0000
            REP   #$02
L2205A4     BVS   L2205A9
            EOR   #$8000
L2205A9     BMI   L2205BB
            LDX   L020169
            LDA   L020167
            JSL   L1A0F0A
            STX   L020169
            STA   L020167
L2205BB     LDA   L020106
            BEQ   L2205C4
            JSL   L230BD3
L2205C4     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L2205CC     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            JSL   L230763
            PEA   $0005
            JSL   L22039D
            PLY
            PEA   $0005
            JSL   L22039D
            PLY
            PEA   $0005
            JSL   L22039D
            PLY
            PEA   $0005
            JSL   L22039D
            PLY
            PEA   $0005
            JSL   L22039D
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

