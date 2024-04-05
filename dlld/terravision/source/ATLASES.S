
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L0B0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$FF7E
            TCS
            STZ   $D6
            PEA   ^L033CC5
            PEA   L033CC5
            JSL   L050256
            PLY
            PLY
            LDX   $F5
            LDA   $F3
            STX   $E2
            STA   $E0
            LDA   $F7
            AND   #$00FF
            CMP   #$0020
            BNE   L0B0074
            LDX   $E2
            LDA   $E0
            STX   $DE
            STA   $DC
L0B0033     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            JSL   L013333
            BEQ   L0B0071
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            PHX
            PHA
            PEA   ^L033CDD
            PEA   L033CDD
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            LDA   $DC
            CLC
            ADC   #$0009
            STA   $DC
            BCC   L0B006D
            INC   $DE
L0B006D     INC   $D6
            BRA   L0B0033
L0B0071     BRL   L0B0197
L0B0074     LDY   #$0002
            LDA   [$E0],Y
            TAX
            LDA   [$E0]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L0B00B8
            LDY   #$0002
            LDA   [$E0],Y
            TAX
            LDA   [$E0]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            BRA   L0B00D1
L0B00B8     LDY   #$0002
            LDA   [$E0],Y
            TAX
            LDA   [$E0]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            SEC
            SBC   #$0061
            CLC
            ADC   #$0041
L0B00D1     PHA
            LDA   $F7
            AND   #$00FF
            PLX
            STX   $E4
            SEC
            SBC   $E4
            BEQ   L0B00F5
            BVS   L0B00E4
            EOR   #$8000
L0B00E4     BPL   L0B00F5
            LDA   $E0
            CLC
            ADC   #$0009
            STA   $E0
            BCC   L0B00F2
            INC   $E2
L0B00F2     BRL   L0B0074
L0B00F5     LDX   $E2
            LDA   $E0
            STX   $DE
            STA   $DC
L0B00FD     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            JSL   L013333
            BNE   L0B0116
            BRL   L0B0197
L0B0116     LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L0B015A
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            BRA   L0B0173
L0B015A     LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            STA   $E4
            STX   $E6
            LDA   [$E4]
            AND   #$00FF
            SEC
            SBC   #$0061
            CLC
            ADC   #$0041
L0B0173     PHA
            LDA   $F9
            AND   #$00FF
            PLX
            STX   $E4
            SEC
            SBC   $E4
            BVS   L0B0184
            EOR   #$8000
L0B0184     BPL   L0B0197
            LDA   $DC
            CLC
            ADC   #$0009
            STA   $DC
            BCC   L0B0192
            INC   $DE
L0B0192     INC   $D6
            BRL   L0B00FD
L0B0197     LDA   $D6
            STA   $AE
            LDA   $FF
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0009
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $E4
            STX   $E6
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$E4],Y
            REP   #$20
            LDA   $FF
            STA   $DA
            PEI   $DA
            PEA   $0000
            TDC
            CLC
            ADC   #$000A
            PHA
            JSL   L013F1E
            PLY
            PLY
            PLY
            LDA   $F7
            AND   #$00FF
            CMP   #$0020
            BNE   L0B0211
            PEI   $F1
            PEI   $EF
            PEA   ^L033CE4
            PEA   L033CE4
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC0
            PHA
            JSL   L01508C
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L0B023C
L0B0211     LDA   $F9
            AND   #$00FF
            PHA
            LDA   $F7
            AND   #$00FF
            PHA
            PEI   $F1
            PEI   $EF
            PEA   ^L033CED
            PEA   L033CED
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC0
            PHA
            JSL   L01508C
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
L0B023C     PEA   $0000
            TDC
            CLC
            ADC   #$FFC0
            PHA
            JSL   L013A1F
            PLY
            PLY
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFC0
            STX   $46
            STA   $44
            LDX   $E2
            LDA   $E0
            STX   $C4
            STA   $C2
            LDX   $E2
            LDA   $E0
            STX   $0E
            STA   $0C
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $90
            STA   $8E
L0B0274     LDA   #$0001
            BNE   L0B027C
            BRL   L0B03A4
L0B027C     PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$000A
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $DA
            LDA   $D8
            CMP   #$0002
            BNE   L0B02E6
            LDA   $DA
            BEQ   L0B02E0
            LDA   $DA
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0009
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $E4
            STX   $E6
            LDY   #$0004
            LDA   [$E4],Y
            AND   #$00FF
            EOR   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$E4],Y
            REP   #$20
L0B02E0     BRL   L0B03A4
            BRL   L0B03A1
L0B02E6     LDA   $DA
            STA   $B4
            LDA   $D8
            CMP   #$0000
            BNE   L0B0333
            JSL   L014C78
            LDA   $DA
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0009
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $E4
            STX   $E6
            LDY   #$0007
            LDA   [$E4],Y
            TAX
            LDY   #$0005
            LDA   [$E4],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRA   L0B0397
L0B0333     JSL   L014C78
            LDA   $DA
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0009
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $E4
            STX   $E6
            LDY   #$0007
            LDA   [$E4],Y
            TAX
            LDY   #$0005
            LDA   [$E4],Y
            PHX
            PHA
            PEA   ^L033CF9
            PEA   L033CF9
            PEA   $0000
            TDC
            CLC
            ADC   #$FF80
            PHA
            JSL   L01508C
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$FF80
            PHA
            JSL   L0133D4
            PLY
            PLY
L0B0397     PEI   $FD
            PEI   $FB
            JSL   L0133D4
            PLY
            PLY
L0B03A1     BRL   L0B0274
L0B03A4     TAY
            TSC
            CLC
            ADC   #$016A
            TCS
            TYA
            PLD
            RTL


