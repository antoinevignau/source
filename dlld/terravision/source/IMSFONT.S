
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L0C0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EB
            TCS
            LDA   $FF
            SEC
            SBC   #$0001
            STA   $FF
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            SEP   #$20
            STA   $EF
            REP   #$20
            LDA   $FF
            STA   $ED
            BRA   L0C00BB
L0C003D     LDA   $ED
            LDX   #$0000
            TAY
            BPL   L0C0046
            DEX
L0C0046     PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            PHA
            LDA   #$0004
            PHA
            LDA   $ED
            LDX   #$0000
            TAY
            BPL   L0C0078
            DEX
L0C0078     PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            SEC
            JSL   L013B5F
            PLA
            PLX
            STX   $F4
            ORA   $F4
            PHA
            LDA   $ED
            LDX   #$0000
            TAY
            BPL   L0C00A2
            DEX
L0C00A2     PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            DEC   $ED
L0C00BB     LDA   $ED
            SEC
            SBC   #$0000
            BEQ   L0C00CD
            BVS   L0C00C8
            EOR   #$8000
L0C00C8     BPL   L0C00CD
            BRL   L0C003D
L0C00CD     LDA   $EF
            AND   #$00FF
            PHA
            LDA   #$0004
            PHA
            LDA   [$FB]
            AND   #$00FF
            SEC
            JSL   L013B5F
            PLA
            PLX
            STX   $F4
            ORA   $F4
            SEP   #$20
            STA   [$FB]
            REP   #$20
            TSC
            CLC
            ADC   #$0009
            TCS
            PLD
            RTL

L0C00F5     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00D4
            TCS
            LDA   $FB
            BRL   L0C0128
L0C0105     LDA   #$0012
            STA   $EA
            LDA   #$FFDF
            STA   $DE
            BRL   L0C0136
L0C0112     LDA   #$000C
            STA   $EA
            LDA   #$003E
            STA   $DE
            BRL   L0C0136
L0C011F     BRL   L0C0136
L0C0122     DA    L0C0105
            DA    L0C0112
            DA    L0C011F
L0C0128     DEC
            CMP   #$0002
            BCC   L0C0131
            LDA   #$0002
L0C0131     ASL
            TAX
            JMP   (L0C0122,X)

L0C0136     LDA   $FD
            STA   $D8
            LDA   $FF
            STA   $D6
            LDA   $FF
            CLC
            ADC   $EA
            STA   $DA
            LDA   $FD
            STA   $E8
            PEI   $F9
            PEI   $F7
            JSL   L0140CE
            PLY
            PLY
            STA   $E6
            STZ   $E4
            BRL   L0C028D
L0C015A     LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            CLC
            ADC   $DE
            STA   $E0
            LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0C019B
            BRL   L0C01D0
L0C019B     LDA   $FB
            BRL   L0C01BF
L0C01A0     LDA   $E8
            CLC
            ADC   #$0006
            STA   $E8
            BRL   L0C01CD
L0C01AB     LDA   $E8
            CLC
            ADC   #$0004
            STA   $E8
            BRL   L0C01CD
L0C01B6     BRL   L0C01CD
L0C01B9     DA    L0C01A0
            DA    L0C01AB
            DA    L0C01B6
L0C01BF     DEC
            CMP   #$0002
            BCC   L0C01C8
            LDA   #$0002
L0C01C8     ASL
            TAX
            JMP   (L0C01B9,X)

L0C01CD     BRL   L0C028B
L0C01D0     LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDY   #$0001
            LDA   [$EC],Y
            AND   #$00FF
            CMP   #$006A
            BEQ   L0C01F5
            BRL   L0C023E
L0C01F5     LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            BRL   L0C0220
L0C0212     LDA   #$0001
            STA   $E2
            BRL   L0C023C
L0C021A     STZ   $E2
            BRA   L0C023C
            BRA   L0C023C
L0C0220     CMP   #$0067
            BEQ   L0C0212
            CMP   #$006A
            BEQ   L0C0212
            CMP   #$0070
            BEQ   L0C0212
            CMP   #$0071
            BEQ   L0C0212
            CMP   #$0079
            BEQ   L0C0212
            JMP   L0C021A

L0C023C     BRA   L0C0260
L0C023E     LDA   $E0
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDY   #$0001
            LDA   [$EC],Y
            AND   #$00FF
            STA   $E2
L0C0260     LDA   $E0
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            CLC
            ADC   $E2
            PHA
            LDA   $E8
            PLX
            STX   $F0
            CLC
            ADC   $F0
            STA   $E8
L0C028B     INC   $E4
L0C028D     LDA   $E4
            CMP   $E6
            BCS   L0C0296
            BRL   L0C015A
L0C0296     LDA   $E8
            STA   $DC
            PEA   $000E
            _SetSolidPenPat
            BCS   L0C02A9
            LDA   #$0000
L0C02A9     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _PaintRect
            BCS   L0C02C2
            LDA   #$0000
L0C02C2     STAL  L020002
            TSC
            CLC
            ADC   #$001C
            TCS
            PLD
            RTL

L0C02CE     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00D0
            TCS
            LDA   $FF
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $FF
            REP   #$20
            LDA   $F9
            BRL   L0C0319
L0C02EC     LDA   #$0012
            STA   $E8
            LDA   #$00B4
            STA   $E6
            LDA   #$FFDF
            STA   $D2
            BRL   L0C0327
L0C02FE     LDA   #$000C
            STA   $E8
            LDA   #$00BA
            STA   $E6
            LDA   #$003E
            STA   $D2
            BRL   L0C0327
L0C0310     BRL   L0C0327
L0C0313     DA    L0C02EC
            DA    L0C02FE
            DA    L0C0310
L0C0319     DEC
            CMP   #$0002
            BCC   L0C0322
            LDA   #$0002
L0C0322     ASL
            TAX
            JMP   (L0C0313,X)

L0C0327     LDA   $FD
            CMP   #$000C
            BEQ   L0C0336
            BCC   L0C0336
            LDA   $FD
            CMP   $E6
            BCC   L0C0345
L0C0336     PEA   ^L0364D7
            PEA   L0364D7
            JSL   L050256
            PLY
            PLY
            BRL   L0C0617
L0C0345     LDA   $FB
            STA   $E4
            PEI   $F7
            PEI   $F5
            JSL   L0140CE
            PLY
            PLY
            STA   $E2
            STZ   $E0
            BRL   L0C060E
L0C035A     LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CLC
            ADC   $D2
            STA   $D4
            LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0C039B
            BRL   L0C03D0
L0C039B     LDA   $F9
            BRL   L0C03BF
L0C03A0     LDA   $E4
            CLC
            ADC   #$0006
            STA   $E4
            BRL   L0C03CD
L0C03AB     LDA   $E4
            CLC
            ADC   #$0004
            STA   $E4
            BRL   L0C03CD
L0C03B6     BRL   L0C03CD
L0C03B9     DA    L0C03A0
            DA    L0C03AB
            DA    L0C03B6
L0C03BF     DEC
            CMP   #$0002
            BCC   L0C03C8
            LDA   #$0002
L0C03C8     ASL
            TAX
            JMP   (L0C03B9,X)

L0C03CD     BRL   L0C060C
L0C03D0     LDA   $D4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0000
            BNE   L0C041D
            LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            PHA
            PEA   ^L03650B
            PEA   L03650B
            JSL   L050256
            PLY
            PLY
            PLY
            BRL   L0C060C
L0C041D     LDA   #$0002
            PHA
            LDA   $D4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            SEC
            JSL   L012E82
            PLY
            CLC
            ADC   #$0001
            STA   $DE
            LDA   $DE
            PHA
            LDA   $E8
            CLC
            JSL   L013003
            PLA
            STA   $DC
            LDA   $D4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            PHA
            LDA   $E4
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $DA
            PEI   $DC
            LDA   $D4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0361DF
            LDX   #^L0361DF
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            PHX
            PHA
            PEA   ^L036578
            PEA   L036578
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   #$0002
            PHA
            LDA   $E4
            CLC
            JSL   L012E82
            PLA
            TAY
            BEQ   L0C04D1
            PEI   $DC
            PEA   ^L036578
            PEA   L036578
            JSL   L0C0000
            PLY
            PLY
            PLY
L0C04D1     LDA   $FF
            AND   #$00FF
            CMP   #$000F
            BEQ   L0C04F9
            LDA   $FF
            AND   #$00FF
            PHA
            LDA   #$000F
            AND   #$00FF
            PHA
            PEI   $DC
            PEA   ^L036578
            PEA   L036578
            JSL   L013D40
            PLY
            PLY
            PLY
            PLY
            PLY
L0C04F9     LDA   #$0002
            PHA
            LDA   $E4
            CLC
            JSL   L012E82
            PLA
            TAY
            BEQ   L0C0510
            LDA   $E4
            SEC
            SBC   #$0001
            BRA   L0C0512
L0C0510     LDA   $E4
L0C0512     STA   $D8
            LDA   $DA
            CMP   #$013F
            BEQ   L0C051D
            BCS   L0C0545
L0C051D     PEI   $DE
            PEI   $DC
            PEA   $000E
            PEA   $0020
            PEI   $FD
            PEI   $D8
            PEA   $00E1
            PEA   $2000
            PEA   ^L036578
            PEA   L036578
            JSL   L014D17
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            BRA   L0C0551
L0C0545     PEA   ^L036542
            PEA   L036542
            JSL   L050256
            PLY
            PLY
L0C0551     LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDY   #$0001
            LDA   [$EA],Y
            AND   #$00FF
            CMP   #$006A
            BEQ   L0C0576
            BRL   L0C05BF
L0C0576     LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            BRL   L0C05A1
L0C0593     LDA   #$0001
            STA   $D6
            BRL   L0C05BD
L0C059B     STZ   $D6
            BRA   L0C05BD
            BRA   L0C05BD
L0C05A1     CMP   #$0067
            BEQ   L0C0593
            CMP   #$006A
            BEQ   L0C0593
            CMP   #$0070
            BEQ   L0C0593
            CMP   #$0071
            BEQ   L0C0593
            CMP   #$0079
            BEQ   L0C0593
            JMP   L0C059B

L0C05BD     BRA   L0C05E1
L0C05BF     LDA   $D4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDY   #$0001
            LDA   [$EA],Y
            AND   #$00FF
            STA   $D6
L0C05E1     LDA   $D4
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033F26
            LDX   #^L033F26
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CLC
            ADC   $D6
            PHA
            LDA   $E4
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $E4
L0C060C     INC   $E0
L0C060E     LDA   $E0
            CMP   $E2
            BCS   L0C0617
            BRL   L0C035A
L0C0617     TAY
            TSC
            CLC
            ADC   #$001E
            TCS
            TYA
            PLD
            RTL


