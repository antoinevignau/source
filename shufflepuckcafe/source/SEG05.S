*
* Shufflepuck Cafe
*
* (c) Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

            mx    %00

            rel
            dsk   Seg05.L
            lst   off

*-----------

            use   Seg05.E
            use   Seg05.X

*-----------

            use   4/Util.Macs

*-----------

L050000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00D4
            TCS
            LDX   $FF
            LDA   $FD
            STX   $DA
            STA   $D8
            LDA   #L030245
            LDX   #^L030245
            STX   $DE
            STA   $DC
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L1A1909
            LDA   #L030245
            LDX   #^L030245
            STX   $EE
            STA   $EC
            LDA   $FB
            STA   $EA
            LDAL  L030245
            AND   #$00FF
            STA   $D6
            LDA   $D6
            CLC
            ADC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDA   #L030245
            LDX   #^L030245
            JSL   L1A0EFF
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   #$002F
            SEP   #$20
            STA   [$F0]
            REP   #$20
            LDA   $D6
            CLC
            ADC   #$0001
            SEP   #$20
            STAL  L030245
            REP   #$20
            PEA   $0009
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L1A1909
            TSC
            CLC
            ADC   #$0020
            TCS
            PLD
            RTL

L05008E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0001
            STA   $F0
            LDA   #L030205
            LDX   #^L030205
            STX   $F4
            STA   $F2
            PEA   $000A
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L1A1909
            LDA   #$0003
            STA   $F0
            PEA   $0009
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L1A1909
            TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            PEA   $0002
            PEA   $0000
            PEA   $0000
            PEI   $FF
            PEI   $FD
            JSL   L040118
            PLY
            PLY
            STA   $EC
            PHA
            JSL   L0400F3
            PLY
            PLY
            PLY
            PLY
            STX   $F0
            STA   $EE
            PEI   $EC
            JSL   L0401AE
            PLY
            LDX   $F0
            LDA   $EE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L050117     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E2
            TCS
            LDX   $FF
            LDA   $FD
            PHA
            PEI   $F5
            PEI   $F3
            PEA   ^L0300E9
            PEA   L0300E9
            JSL   L1A0DAA
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $F7
            CMP   #$FFFF
            BNE   L050144
            BRL   L050211
L050144     SEC
            LDA   $FD
            SBC   #$0000
            BNE   L050153
            LDA   $FF
            SBC   #$0000
            BRA   L05015A
L050153     LDA   $FF
            SBC   #$0000
            REP   #$02
L05015A     BNE   L05015F
            BRL   L05020A
L05015F     BVS   L050164
            EOR   #$8000
L050164     BMI   L050169
            BRL   L05020A
L050169     SEC
            LDA   $FD
            SBC   #$0200
            BNE   L050178
            LDA   $FF
            SBC   #$0000
            BRA   L05017F
L050178     LDA   $FF
            SBC   #$0000
            REP   #$02
L05017F     BEQ   L050194
            BVS   L050186
            EOR   #$8000
L050186     BPL   L050194
            LDA   #$0200
            LDX   #$0000
            TAY
            BPL   L050192
            DEX
L050192     BRA   L050198
L050194     LDX   $FF
            LDA   $FD
L050198     STA   $E4
            LDX   $FF
            LDA   $FD
            SEC
            SBC   #$0200
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $FF
            STA   $FD
            PEI   $E4
            PEA   ^L030105
            PEA   L030105
            JSL   L1A0DAA
            PLY
            PLY
            PLY
            PEI   $E4
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L0400A9
            PLY
            PLY
            PLY
            PLY
            STA   $E6
            LDA   $E6
            CMP   $E4
            BEQ   L0501F2
            PEA   ^L030110
            PEA   L030110
            JSL   L1A0DAA
            PLY
            PLY
            PEI   $F5
            PEI   $F3
            PEA   ^L030122
            PEA   L030122
            JSL   L040033
            PLY
            PLY
            PLY
            PLY
L0501F2     LDA   $E4
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            PLA
            PLX
            STX   $FB
            STA   $F9
            BRL   L050144
L05020A     PEI   $F7
            JSL   L0401AE
            PLY
L050211     JSL   L1A0E95
            LDA   $E6
            TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L050221     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E4
            TCS
            LDA   $FD
            CMP   #$FFFF
            BEQ   L050294
            LDA   $FD
            BEQ   L050294
            PEA   $0002
            PEA   $0000
            PEA   $0000
            PEI   $FD
            JSL   L0400F3
            PLY
            PLY
            PLY
            PLY
            STX   $EC
            STA   $EA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $FD
            JSL   L0400F3
            PLY
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $EC
            PEI   $EA
            JSL   L040440
            PLY
            PLY
            PLY
            STX   $E8
            STA   $E6
            PEI   $EC
            PEI   $EA
            PEI   $E8
            PEI   $E6
            PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L050117
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDX   $E8
            LDA   $E6
            BRA   L05029A
            BRA   L05029A
L050294     LDX   #$FFFF
            LDA   #$FFFF
L05029A     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L0502A4     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$FEF7
            TCS
            PEI   $FD
            PEI   $FB
            JSL   L040152
            PLY
            PLY
            STA   $E6
            TAY
            BEQ   L0502D4
            PEI   $FF
            PEI   $E6
            PEI   $FD
            PEI   $FB
            JSL   L050221
            PLY
            PLY
            PLY
            PLY
            BRL   L050483
            BRL   L050483
L0502D4     LDX   $FD
            LDA   $FB
            TXY
            LDX   #$FEFD
            STY   $02,X
            STA   $00,X
            TYX
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF01
            TXY
            LDX   #$FEF9
            STY   $02,X
            STA   $00,X
            TYX
L0502F2     LDX   #$FEFF
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEFD
            LDA   $00,X
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            BEQ   L050368
            LDX   #$FEFF
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEFD
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FEFD
            STA   $00,X
            LDX   #$FEFF
            LDA   $00,X
            BCC   L050328
            INC
L050328     LDX   #$FEFF
            STA   $00,X
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            PHA
            LDX   #$FEFB
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEF9
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FEF9
            STA   $00,X
            LDX   #$FEFB
            LDA   $00,X
            BCC   L050354
            INC
L050354     LDX   #$FEFB
            STA   $00,X
            PLA
            PLX
            STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            BRA   L0502F2
L050368     LDX   #$FEFB
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEF9
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FEF9
            STA   $00,X
            LDX   #$FEFB
            LDA   $00,X
            BCC   L050386
            INC
L050386     LDX   #$FEFB
            STA   $00,X
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   #$002E
            SEP   #$20
            STA   [$F0]
            REP   #$20
            LDX   #$FEFB
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEF9
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FEF9
            STA   $00,X
            LDX   #$FEFB
            LDA   $00,X
            BCC   L0503B8
            INC
L0503B8     LDX   #$FEFB
            STA   $00,X
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   #$0063
            SEP   #$20
            STA   [$F0]
            REP   #$20
            LDX   #$FEFB
            LDA   $00,X
            TAX
            PHX
            LDX   #$FEF9
            LDA   $00,X
            PLX
            STA   $F0
            STX   $F2
            LDA   #$0000
            SEP   #$20
            STA   [$F0]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF01
            PHA
            JSL   L040152
            PLY
            PLY
            STA   $E6
            TAY
            BNE   L0503FD
            BRL   L05047D
L0503FD     PEA   $0000
            PEI   $E6
            PEA   $0000
            TDC
            CLC
            ADC   #$FF01
            PHA
            JSL   L050221
            PLY
            PLY
            PLY
            PLY
            STX   $EA
            STA   $E8
            LDX   $EA
            LDA   $E8
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $E8
            LDA   $EA
            BCC   L050428
            INC
L050428     STA   $EA
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            PHX
            PHA
            JSL   L0C0000
            PLY
            PLY
            STX   $EE
            STA   $EC
            PEI   $FF
            PEI   $EE
            PEI   $EC
            JSL   L040440
            PLY
            PLY
            PLY
            STX   $E4
            STA   $E2
            LDX   $EE
            LDA   $EC
            PHA
            PEI   $E4
            PEI   $E2
            PEI   $EA
            PEI   $E8
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $EA
            PEI   $E8
            JSL   L040537
            PLY
            PLY
            LDX   $E4
            LDA   $E2
            BRA   L050483
            BRA   L050483
L05047D     LDX   #$FFFF
            LDA   #$FFFF
L050483     TAY
            TSC
            CLC
            ADC   #$01FD
            TCS
            TYA
            PLD
            RTL

L05048D     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EA
            TCS
            LDX   #$FFFF
            LDA   #$FFFF
            STX   $EE
            STA   $EC
L0504A2     LDA   $EC
            CMP   #$FFFF
            BEQ   L0504AC
            BRL   L050511
L0504AC     LDA   $EE
            CMP   #$FFFF
            BNE   L050511
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L0502A4
            PLY
            PLY
            PLY
            STX   $EE
            STA   $EC
            LDA   $EC
            CMP   #$FFFF
            BNE   L05050F
            LDA   $EE
            CMP   #$FFFF
            BNE   L05050F
            LDA   #$0034
            SEP   #$20
            STA   [$FB]
            REP   #$20
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L0502A4
            PLY
            PLY
            PLY
            STX   $EE
            STA   $EC
            LDA   #$0033
            SEP   #$20
            STA   [$FB]
            REP   #$20
            LDA   $EC
            CMP   #$FFFF
            BNE   L05050F
            LDA   $EE
            CMP   #$FFFF
            BNE   L05050F
            PEA   ^L03013A
            PEA   L03013A
            JSL   L240DF3
            PLY
            PLY
L05050F     BRA   L0504A2
L050511     LDX   $EE
            LDA   $EC
            TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L05051F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0010
            PEI   $FF
            PEI   $FD
            JSL   L05048D
            PLY
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L050542     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            PEI   $FF
            PEI   $FD
            JSL   L05048D
            PLY
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L050565     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEA   $00C8
            PEA   $00A0
            PEA   $00E1
            PEA   $2000
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

L05058F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            PEA   ^L030152
            PEA   L030152
            JSL   L1A0E02
            PLY
            PLY
            STZ   $EC
            BRA   L0505E0
L0505AA     LDA   $EC
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDA   [$EE]
            PHA
            LDA   $EC
            LDX   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L1A0EFF
            PLA
            PLX
            STA   $EE
            STX   $F0
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
            INC   $EC
L0505E0     LDA   $EC
            CMP   #$0020
            BNE   L0505AA
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0020
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0020
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            JSL   L0B0054
            PLY
            PLY
            PLY
            PLY
            JSL   L1A0E95
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

