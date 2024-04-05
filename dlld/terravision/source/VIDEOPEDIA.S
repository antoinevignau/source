
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L060000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$FF7E
            TCS
            LDA   #L030909
            LDX   #^L030909
            STX   $F0
            STA   $EE
            STZ   $E4
            LDA   $FD
            AND   #$00FF
            CMP   #$0020
            BNE   L060052
            LDX   $F0
            LDA   $EE
            STX   $EC
            STA   $EA
L060029     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            JSL   L013333
            BEQ   L06004F
            LDA   $EA
            CLC
            ADC   #$0009
            STA   $EA
            BCC   L06004B
            INC   $EC
L06004B     INC   $E4
            BRA   L060029
L06004F     BRL   L060175
L060052     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L060096
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            BRA   L0600AF
L060096     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0061
            CLC
            ADC   #$0041
L0600AF     PHA
            LDA   $FD
            AND   #$00FF
            PLX
            STX   $F2
            SEC
            SBC   $F2
            BEQ   L0600D3
            BVS   L0600C2
            EOR   #$8000
L0600C2     BPL   L0600D3
            LDA   $EE
            CLC
            ADC   #$0009
            STA   $EE
            BCC   L0600D0
            INC   $F0
L0600D0     BRL   L060052
L0600D3     LDX   $F0
            LDA   $EE
            STX   $EC
            STA   $EA
L0600DB     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            JSL   L013333
            BNE   L0600F4
            BRL   L060175
L0600F4     LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L060138
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            BRA   L060151
L060138     LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0061
            CLC
            ADC   #$0041
L060151     PHA
            LDA   $FF
            AND   #$00FF
            PLX
            STX   $F2
            SEC
            SBC   $F2
            BVS   L060162
            EOR   #$8000
L060162     BPL   L060175
            LDA   $EA
            CLC
            ADC   #$0009
            STA   $EA
            BCC   L060170
            INC   $EC
L060170     INC   $E4
            BRL   L0600DB
L060175     PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$0018
            PHA
            JSL   L013F1E
            PLY
            PLY
            PLY
            LDA   $E4
            STA   $BC
            LDA   $FD
            AND   #$00FF
            CMP   #$0020
            BNE   L0601AF
            PEA   ^L030BF4
            PEA   L030BF4
            PEA   $0000
            TDC
            CLC
            ADC   #$FFC0
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            BRA   L0601D6
L0601AF     LDA   $FF
            AND   #$00FF
            PHA
            LDA   $FD
            AND   #$00FF
            PHA
            PEA   ^L030C05
            PEA   L030C05
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
L0601D6     PEA   $0000
            TDC
            CLC
            ADC   #$FFC0
            PHA
            JSL   L013A1F
            PLY
            PLY
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$EE],Y
            REP   #$20
            LDA   #$0001
            STA   $E8
            LDX   $F0
            LDA   $EE
            STX   $D2
            STA   $D0
            LDX   $F0
            LDA   $EE
            STX   $1C
            STA   $1A
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $9E
            STA   $9C
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFC0
            STX   $54
            STA   $52
L06021F     LDA   #$0001
            BNE   L060227
            BRL   L060351
L060227     PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0018
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $E8
            LDA   $E6
            CMP   #$0002
            BNE   L060291
            LDA   $E8
            BEQ   L06028B
            LDA   $E8
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
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
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            AND   #$00FF
            EOR   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
L06028B     BRL   L060351
            BRL   L06034E
L060291     LDA   $E8
            STA   $C2
            LDA   $E6
            CMP   #$0000
            BNE   L0602DE
            JSL   L014C78
            LDA   $E8
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
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
            STA   $F2
            STX   $F4
            LDY   #$0007
            LDA   [$F2],Y
            TAX
            LDY   #$0005
            LDA   [$F2],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRA   L060342
L0602DE     LDA   $E8
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
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
            STA   $F2
            STX   $F4
            LDY   #$0007
            LDA   [$F2],Y
            TAX
            LDY   #$0005
            LDA   [$F2],Y
            PHX
            PHA
            PEA   ^L030C19
            PEA   L030C19
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
            JSL   L014C78
            PEA   $0000
            TDC
            CLC
            ADC   #$FF80
            PHA
            JSL   L0133D4
            PLY
            PLY
L060342     PEA   ^L030C1D
            PEA   L030C1D
            JSL   L0133D4
            PLY
            PLY
L06034E     BRL   L06021F
L060351     TAY
            TSC
            CLC
            ADC   #$0178
            TCS
            TYA
            PLD
            RTL


