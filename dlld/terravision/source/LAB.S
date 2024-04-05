
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L0D0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDAL  L0371B8
            BEQ   L0D001D
            LDA   #$0000
            STAL  L0371B8
            LDA   #$0001
            BRA   L0D0020
L0D001D     LDA   #$0000
L0D0020     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0D002A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            STZ   $F2
            STZ   $F4
            BRL   L0D0186
L0D003C     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            BNE   L0D0066
            BRL   L0D0184
L0D0066     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0008
            LDA   [$F6],Y
            TAX
            LDY   #$0006
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            TAX
            LDY   #$000A
            LDA   [$F6],Y
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DE8
            TAX
            LDAL  L031DE6
            STX   $F0
            STA   $EE
            LDY   #$000C
            LDA   [$EE],Y
            PHA
            LDY   #$000A
            LDA   [$EE],Y
            PHA
            PEA   $0000
            PEA   $0000
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            JSL   L013C06
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STX   $EC
            STA   $EA
            LDA   $F2
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0371C6
            LDX   #^L0371C6
            JSL   L012E77
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
            LDA   #L0371BE
            LDX   #^L0371BE
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            PEI   $EC
            PEI   $EA
            PEI   $F0
            PEI   $EE
            JSL   L0132E0
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PHX
            PHA
            PEI   $EC
            PEI   $EA
            _FindHandle
            BCS   L0D016E
            LDA   #$0000
L0D016E     STAL  L020002
            _DisposeHandle
            BCS   L0D017E
            LDA   #$0000
L0D017E     STAL  L020002
            INC   $F2
L0D0184     INC   $F4
L0D0186     LDA   $F4
            CMP   #$0004
            BCS   L0D0190
            BRL   L0D003C
L0D0190     TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L0D0198     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            STZ   L0200E0
            STZ   L0200E2
            STZ   L0200DA
            STZ   $F4
            BRL   L0D033F
L0D01B1     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            BNE   L0D01DB
            BRL   L0D033D
L0D01DB     LDX   L0200E2
            LDA   L0200E0
            STX   $F6
            ORA   $F6
            BNE   L0D021B
            LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            TAX
            LDY   #$000E
            LDA   [$F6],Y
            STX   L0200E2
            STA   L0200E0
L0D021B     LDA   L0200DA
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0371C6
            LDX   #^L0371C6
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            STA   $EC
            LDA   L0200DA
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0371BE
            LDX   #^L0371BE
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$000C
            STA   $EE
            LDA   #$0000
            STA   $F2
            STA   $F0
            PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            PEA   ^L0371D6
            PEA   L0371D6
            PEA   $0001
            LDA   L0200DA
            CMP   #$0000
            BNE   L0D028C
            LDA   #$0001
            BRA   L0D028F
L0D028C     LDA   #$0000
L0D028F     PHA
            PEA   $0000
            PEA   $0000
            PEA   $0400
            PEA   $0000
            LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            PHX
            PHA
            PEA   ^L0371CE
            PEA   L0371CE
            _NewControl
            BCS   L0D02DE
            LDA   #$0000
L0D02DE     STAL  L020002
            LDA   $F4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0376A2
            LDX   #^L0376A2
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F6],Y
            PLA
            STA   [$F6]
            LDA   $F4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0376A2
            LDX   #^L0376A2
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            _DrawOneCtl
            BCS   L0D0336
            LDA   #$0000
L0D0336     STAL  L020002
            INC   L0200DA
L0D033D     INC   $F4
L0D033F     LDA   $F4
            CMP   #$0004
            BCS   L0D0349
            BRL   L0D01B1
L0D0349     TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L0D0351     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            STZ   $F0
            BRL   L0D03BE
L0D0361     LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            TAX
            LDY   #$0002
            LDA   [$F2],Y
            JSL   L013333
            BNE   L0D03BC
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            BRA   L0D03CB
L0D03BC     INC   $F0
L0D03BE     LDA   $F0
            CMP   #$0004
            BCC   L0D0361
            LDX   #$0000
            LDA   #$0000
L0D03CB     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0D03D5     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E8
            TCS
            STZ   $EE
            BRL   L0D048E
L0D03E5     LDA   $EE
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0376A2
            LDX   #^L0376A2
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F0
            STX   $F2
            LDY   #$0012
            LDA   [$F0],Y
            CMP   #$0001
            BNE   L0D048C
            LDA   $EE
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0376A2
            LDX   #^L0376A2
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$0012
            STA   [$F0],Y
            LDA   $EE
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0376A2
            LDX   #^L0376A2
            JSL   L012E77
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
            _DrawOneCtl
            BCS   L0D0488
            LDA   #$0000
L0D0488     STAL  L020002
L0D048C     INC   $EE
L0D048E     LDA   $EE
            CMP   L0200DA
            BCS   L0D0498
            BRL   L0D03E5
L0D0498     LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDA   #$0001
            LDY   #$0012
            STA   [$F0],Y
            PEI   $FD
            PEI   $FB
            _DrawOneCtl
            BCS   L0D04BC
            LDA   #$0000
L0D04BC     STAL  L020002
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDY   #$0022
            LDA   [$F0],Y
            TAX
            LDY   #$0020
            LDA   [$F0],Y
            PHX
            PHA
            JSL   L0D0351
            PLY
            PLY
            STX   $EC
            STA   $EA
            LDX   $EC
            LDA   $EA
            STX   $F0
            ORA   $F0
            BNE   L0D04FB
            PEA   ^L0371D7
            PEA   L0371D7
            JSL   L050256
            PLY
            PLY
            BRA   L0D050C
L0D04FB     LDY   #$0010
            LDA   [$EA],Y
            TAX
            LDY   #$000E
            LDA   [$EA],Y
            STX   L0200E2
            STA   L0200E0
L0D050C     TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            LDA   $02,S
            STA   $08,S
            LDA   $01,S
            STA   $07,S
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L0D0522     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDAL  L036F18
            CMP   #$0003
            BNE   L0D055A
            LDAL  L036F34
            CMP   #$0003
            BNE   L0D055A
            LDAL  L036FA4
            CMP   #$0003
            BNE   L0D055A
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            STA   $F6
            STX   $F8
            LDA   #$0001
            STA   [$F6]
L0D055A     LDAL  L036F18
            CMP   #$0003
            BNE   L0D058A
            LDAL  L036F6C
            CMP   #$0003
            BNE   L0D058A
            LDAL  L036F50
            CMP   #$0003
            BNE   L0D058A
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0012
            STA   [$F6],Y
L0D058A     LDAL  L036F50
            CMP   #$0003
            BNE   L0D05BA
            LDAL  L036FA4
            CMP   #$0003
            BNE   L0D05BA
            LDAL  L036F88
            CMP   #$0003
            BNE   L0D05BA
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0024
            STA   [$F6],Y
L0D05BA     LDAL  L036F34
            CMP   #$0003
            BNE   L0D05EA
            LDAL  L036FC0
            CMP   #$0003
            BNE   L0D05EA
            LDAL  L036F88
            CMP   #$0003
            BNE   L0D05EA
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0036
            STA   [$F6],Y
L0D05EA     LDA   #$0000
            STA   $F4
            LDA   #$0000
            STA   $F2
            BRA   L0D0624
L0D05F6     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   #$0001
            BNE   L0D0622
            INC   $F2
L0D0622     INC   $F4
L0D0624     LDA   $F4
            CMP   #$0004
            BCC   L0D05F6
            LDA   $F2
            TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L0D0637     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRL   L0D06A3
L0D0647     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   #$0001
            BNE   L0D06A1
            LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L0371BC
            TAX
            LDAL  L0371BA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            TAX
            LDY   #$000E
            LDA   [$F6],Y
            BRA   L0D06B0
L0D06A1     INC   $F4
L0D06A3     LDA   $F4
            CMP   #$0004
            BCC   L0D0647
            LDX   #$0000
            LDA   #$0000
L0D06B0     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0D06BA     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$FFB2
            TCS
            LDA   #$0007
            STA   $C6
            LDA   #L0370E9
            LDX   #^L0370E9
            STA   $F2
            STX   $F4
            LDA   #$0080
            SEP   #$20
            LDY   #$0004
            STA   [$F2],Y
            REP   #$20
            LDA   #$0001
            STA   $F0
            PEI   $F0
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L013F1E
            PLY
            PLY
            PLY
            LDA   #L03720F
            LDX   #^L03720F
            STX   $5E
            STA   $5C
            LDA   #L037229
            LDX   #^L037229
            STX   $4E
            STA   $4C
            LDA   #L03722D
            LDX   #^L03722D
            STX   $52
            STA   $50
            LDA   #L037233
            LDX   #^L037233
            STX   $56
            STA   $54
            LDA   #L0370E9
            LDX   #^L0370E9
            STX   $DC
            STA   $DA
            LDA   #L0370E9
            LDX   #^L0370E9
            STX   $26
            STA   $24
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            STX   $A8
            STA   $A6
L0D0740     LDA   #$0001
            BNE   L0D0748
            BRL   L0D0973
L0D0748     PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0022
            PHA
            JSL   L01493B
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            LDA   $EE
            CMP   #$0002
            BNE   L0D07BB
            LDA   $F0
            BEQ   L0D07AE
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDA   #L0370E9
            LDX   #^L0370E9
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
L0D07AE     JSL   L014C78
            LDA   #$FFFF
            BRL   L0D0973
            BRL   L0D094B
L0D07BB     LDA   $F0
            STA   $CC
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDA   #L0370E9
            LDX   #^L0370E9
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
            TXY
            LDX   #$FFBC
            STY   $02,X
            STA   $00,X
            TYX
            LDA   $EE
            CMP   #$0000
            BEQ   L0D0808
            BRL   L0D08F0
L0D0808     LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            LDX   #$FFB4
            STA   $00,X
            JSL   L014C78
L0D0827     LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            LDX   #$FFB4
            CMP   $00,X
            BEQ   L0D0847
            BRL   L0D08EE
L0D0847     LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L0D085E
            LDA   #$0000
L0D085E     STAL  L020002
            LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFB6
            PHA
            JSL   L080498
            PLY
            PLY
            PLY
            PLY
            LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0008
            LDA   [$F2],Y
            TAX
            LDY   #$0006
            LDA   [$F2],Y
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$FFB6
            PHA
            LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            PHA
            JSL   L0A0F31
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   #$FFB4
            STA   $00,X
            BRL   L0D0827
L0D08EE     BRA   L0D094B
L0D08F0     LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $0009
            CLC
            JSL   L013048
            LDA   #L0370E9
            LDX   #^L0370E9
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
            JSL   L014C78
            LDX   #$FFBE
            LDA   $00,X
            TAX
            PHX
            LDX   #$FFBC
            LDA   $00,X
            PLX
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            BRA   L0D0973
L0D094B     LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L0D0962
            LDA   #$0000
L0D0962     STAL  L020002
            PEI   $FF
            PEI   $FD
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D0740
L0D0973     TAY
            TSC
            CLC
            ADC   #$0144
            TCS
            TYA
            PLD
            RTL

L0D097D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00DE
            TCS
            PEA   $0000
            JSL   L01335E
            PLY
            PEA   $000F
            _SetForeColor
            BCS   L0D099F
            LDA   #$0000
L0D099F     STAL  L020002
            PEA   $0001
            _SetBackColor
            BCS   L0D09B2
            LDA   #$0000
L0D09B2     STAL  L020002
            PEA   $0044
            PEA   $0018
            _MoveTo
            BCS   L0D09C8
            LDA   #$0000
L0D09C8     STAL  L020002
            LDY   #$0006
            LDA   [$F9],Y
            TAX
            LDY   #$0004
            LDA   [$F9],Y
            PHX
            PHA
            _DrawCString
            BCS   L0D09E5
            LDA   #$0000
L0D09E5     STAL  L020002
            STZ   $EC
            BRL   L0D0AE4
L0D09EE     LDA   $EC
            LDX   #$0000
            PEA   $0000
            PEA   $000C
            CLC
            JSL   L013048
            LDY   #$000E
            LDA   [$F9],Y
            TAX
            LDY   #$000C
            LDA   [$F9],Y
            JSL   L012E77
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDY   #$0002
            LDA   [$E8],Y
            CMP   #$0001
            BEQ   L0D0A20
            BRL   L0D0AE2
L0D0A20     LDA   #$0001
            STAL  L031DD8
            LDA   [$E8]
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L03700F
            LDX   #^L03700F
            JSL   L012E77
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDAL  L031DE8
            TAX
            LDAL  L031DE6
            STX   $E6
            STA   $E4
            LDY   #$000C
            LDA   [$E4],Y
            PHA
            LDY   #$000A
            LDA   [$E4],Y
            PHA
            PEA   $0000
            PEA   $0000
            LDX   $E6
            LDA   $E4
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            JSL   L013C06
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STX   $E2
            STA   $E0
            LDA   $EC
            PHA
            LDA   #$0014
            CLC
            JSL   L013003
            LDA   #$0028
            PLX
            STX   $F2
            CLC
            ADC   $F2
            PHA
            PEA   $0030
            PEI   $E2
            PEI   $E0
            PEI   $E6
            PEI   $E4
            JSL   L012AB8
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PHX
            PHA
            PEI   $E2
            PEI   $E0
            _FindHandle
            BCS   L0D0ACE
            LDA   #$0000
L0D0ACE     STAL  L020002
            _DisposeHandle
            BCS   L0D0ADE
            LDA   #$0000
L0D0ADE     STAL  L020002
L0D0AE2     INC   $EC
L0D0AE4     LDY   #$0002
            LDA   [$F9],Y
            CMP   $EC
            BEQ   L0D0AF2
            BCC   L0D0AF2
            BRL   L0D09EE
L0D0AF2     TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L0D0AFA     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L0D0B18
            LDA   #$0000
L0D0B18     STAL  L020002
            PLA
            PHX
            PHA
            PEA   ^L037332
            PEA   L037332
            _GetNewModalDialog
            BCS   L0D0B31
            LDA   #$0000
L0D0B31     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDY   #$0006
            LDA   [$FD],Y
            TAX
            LDY   #$0004
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L0140CE
            PLY
            PLY
            TAY
            BEQ   L0D0B5E
            LDY   #$0006
            LDA   [$FD],Y
            TAX
            LDY   #$0004
            LDA   [$FD],Y
            BRA   L0D0B64
L0D0B5E     LDA   #L037368
            LDX   #^L037368
L0D0B64     PHX
            PHA
            PEA   ^L0376B2
            PEA   L0376B2
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0376B2
            PEA   L0376B2
            JSL   L013A1F
            PLY
            PLY
            PEI   $F0
            PEI   $EE
            PEA   $0003
            PEA   ^L0376B2
            PEA   L0376B2
            _SetIText
            BCS   L0D0B99
            LDA   #$0000
L0D0B99     STAL  L020002
            PEA   ^L03736A
            PEA   L03736A
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L013A1F
            PLY
            PLY
            PEI   $F0
            PEI   $EE
            PEA   $0005
            PEA   ^L0376C2
            PEA   L0376C2
            _SetIText
            BCS   L0D0BD6
            LDA   #$0000
L0D0BD6     STAL  L020002
L0D0BDA     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L0D0BED
            LDA   #$0000
L0D0BED     STAL  L020002
            PLA
            STA   $EC
            LDA   $EC
            CMP   #$0003
            BEQ   L0D0BFE
            BRL   L0D0C54
L0D0BFE     PEA   ^L03736C
            PEA   L03736C
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L013A1F
            PLY
            PLY
            PEI   $F0
            PEI   $EE
            PEA   $0005
            PEA   ^L0376C2
            PEA   L0376C2
            _SetIText
            BCS   L0D0C37
            LDA   #$0000
L0D0C37     STAL  L020002
            PEI   $F0
            PEI   $EE
            PEA   $0003
            _DisableDItem
            BCS   L0D0C4E
            LDA   #$0000
L0D0C4E     STAL  L020002
            BRA   L0D0BDA
L0D0C54     LDA   $EC
            CMP   #$0002
            BNE   L0D0C72
            PEI   $F0
            PEI   $EE
            _CloseDialog
            BCS   L0D0C6B
            LDA   #$0000
L0D0C6B     STAL  L020002
            BRL   L0D0D38
L0D0C72     PEI   $F0
            PEI   $EE
            PEA   $0003
            PEA   ^L0376B2
            PEA   L0376B2
            _GetIText
            BCS   L0D0C8B
            LDA   #$0000
L0D0C8B     STAL  L020002
            PEA   ^L0376B2
            PEA   L0376B2
            JSL   L013A8B
            PLY
            PLY
            PEA   ^L0376B2
            PEA   L0376B2
            JSL   L0140CE
            PLY
            PLY
            TAY
            BEQ   L0D0CAD
            BRL   L0D0D04
L0D0CAD     PEA   ^L03736E
            PEA   L03736E
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0376C2
            PEA   L0376C2
            JSL   L013A1F
            PLY
            PLY
            PEI   $F0
            PEI   $EE
            PEA   $0005
            PEA   ^L0376C2
            PEA   L0376C2
            _SetIText
            BCS   L0D0CE6
            LDA   #$0000
L0D0CE6     STAL  L020002
            PEI   $F0
            PEI   $EE
            PEA   $0003
            _EnableDItem
            BCS   L0D0CFD
            LDA   #$0000
L0D0CFD     STAL  L020002
            BRL   L0D0BDA
L0D0D04     PEA   ^L0376B2
            PEA   L0376B2
            LDY   #$0006
            LDA   [$FD],Y
            TAX
            LDY   #$0004
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            LDA   #$0001
            STA   [$FD]
            PEI   $F0
            PEI   $EE
            _CloseDialog
            BCS   L0D0D34
            LDA   #$0000
L0D0D34     STAL  L020002
L0D0D38     TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L0D0D42     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0005
            PHA
            PHA
            _Random
            BCS   L0D0D5E
            LDA   #$0000
L0D0D5E     STAL  L020002
            PLA
            CLC
            JSL   L012E82
            PLA
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0373CA
            LDX   #^L0373CA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0D0D98     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0002
            PHA
            PHA
            _Random
            BCS   L0D0DB4
            LDA   #$0000
L0D0DB4     STAL  L020002
            PLA
            CLC
            JSL   L012E82
            PLA
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0373FA
            LDX   #^L0373FA
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0D0DEE     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D2
            TCS
            STZ   $D4
            BRL   L0D10CA
L0D0DFE     PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   #$0000
            BNE   L0D0E6C
            LDA   $D4
            PHA
            LDA   #$001C
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$000C
            CLC
            ADC   $F6
            BCC   L0D0E6A
            INX
L0D0E6A     BRA   L0D0E98
L0D0E6C     LDA   $D4
            PHA
            LDA   #$001C
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$0014
            CLC
            ADC   $F6
            BCC   L0D0E98
            INX
L0D0E98     PHX
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0080
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0138ED
            PEA   L0138ED
            LDA   $D4
            PHA
            LDA   #$001C
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            TAX
            LDY   #$0008
            LDA   [$F6],Y
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            _NewControl
            BCS   L0D0EF2
            LDA   #$0000
L0D0EF2     STAL  L020002
            PLA
            PLX
            PHA
            TXA
            STAL  L031DFA
            PLA
            STAL  L031DF8
            PHX
            PHA
            _ShowControl
            BCS   L0D0F11
            LDA   #$0000
L0D0F11     STAL  L020002
            LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   [$F6]
            BRL   L0D10BB
L0D0F46     LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            TAX
            LDY   #$0004
            LDA   [$F6],Y
            PHX
            PHA
            PEA   ^L0374F1
            PEA   L0374F1
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
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
            ADC   #$00D6
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D10C8
L0D0FA0     LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            TAX
            LDY   #$0004
            LDA   [$F6],Y
            PHX
            PHA
            PEA   ^L0374F7
            PEA   L0374F7
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
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
            ADC   #$00D6
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D10C8
L0D0FFA     LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            TAX
            LDY   #$0004
            LDA   [$F6],Y
            PHX
            PHA
            PEA   ^L0374FD
            PEA   L0374FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
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
            ADC   #$00D6
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D10C8
L0D1054     LDA   $D4
            LDX   #$0000
            PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDA   #L03742D
            LDX   #^L03742D
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            TAX
            LDY   #$0004
            LDA   [$F6],Y
            PHX
            PHA
            PEA   ^L037503
            PEA   L037503
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
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
            ADC   #$00D6
            PHA
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D10C8
L0D10AE     BRL   L0D10C8
L0D10B1     DA    L0D0F46
            DA    L0D0FA0
            DA    L0D0FFA
            DA    L0D1054
            DA    L0D10AE
L0D10BB     CMP   #$0004
            BCC   L0D10C3
            LDA   #$0004
L0D10C3     ASL
            TAX
            JMP   (L0D10B1,X)

L0D10C8     INC   $D4
L0D10CA     LDA   $D4
            CMP   #$0007
            BCS   L0D10D4
            BRL   L0D0DFE
L0D10D4     TSC
            CLC
            ADC   #$0028
            TCS
            PLD
            RTL

L0D10DC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDX   $FF
            LDA   $FD
            SEC
            SBC   #$0036
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037509
            LDX   #^L037509
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STX   L0200D4
            STA   L0200D2
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDA   [$F2]
            CMP   #$0000
            BNE   L0D1177
            LDX   $FF
            LDA   $FD
            SEC
            SBC   #$0036
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L03756B
            LDX   #^L03756B
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
            LDX   L0200D4
            LDA   L0200D2
            PHX
            PHA
            JSL   L0D0AFA
            PLY
            PLY
            LDA   #$0028
            BRA   L0D117A
            BRA   L0D117A
L0D1177     LDA   #$0029
L0D117A     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0D1184     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0029
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0D1267
L0D119C     LDX   #$0000
            LDA   #$0035
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            JSL   L013333
            BNE   L0D11B5
            BRL   L0D1209
L0D11B5     BCS   L0D11BA
            BRL   L0D1209
L0D11BA     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0D11F6
L0D11C5     PEA   ^L037587
            PEA   L037587
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D1207
L0D11D4     LDA   #$0028
            STA   $F0
            BRL   L0D1207
L0D11DC     PEA   ^L037593
            PEA   L037593
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D1207
L0D11EB     BRL   L0D1207
L0D11EE     DA    L0D11C5
            DA    L0D11D4
            DA    L0D11DC
            DA    L0D11EB
L0D11F6     SEC
            SBC   #$0032
            CMP   #$0003
            BCC   L0D1202
            LDA   #$0003
L0D1202     ASL
            TAX
            JMP   (L0D11EE,X)

L0D1207     BRA   L0D1250
L0D1209     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            SEC
            SBC   #$0035
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            LDX   #$0000
            PEA   $0000
            PEA   $000C
            CLC
            JSL   L013048
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$000E
            LDA   [$F2],Y
            TAX
            LDY   #$000C
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STX   L0200D8
            STA   L0200D6
            LDA   #$002A
            STA   $F0
L0D1250     BRL   L0D1272
L0D1253     PEA   $0029
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0D1272
            BRA   L0D1272
L0D1267     CMP   #$0103
            BNE   L0D126F
            BRL   L0D119C
L0D126F     JMP   L0D1253

L0D1272     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0D127E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00DE
            TCS
            LDA   #$002A
            STA   $F0
            LDY   #$0004
            LDA   [$FD],Y
            BRL   L0D15BD
L0D1296     LDX   #$0000
            LDA   #$0036
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            JSL   L013333
            BNE   L0D12AF
            BRL   L0D1408
L0D12AF     BCS   L0D12B4
            BRL   L0D1408
L0D12B4     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            BRL   L0D13F4
L0D12BF     LDX   L0200D8
            LDA   L0200D6
            STA   $F2
            STX   $F4
            LDY   #$0006
            LDA   [$F2],Y
            TAX
            LDY   #$0004
            LDA   [$F2],Y
            PHX
            PHA
            JSL   L0D06BA
            PLY
            PLY
            STA   $EC
            LDA   $EC
            SEC
            SBC   #$FFFF
            BNE   L0D12E9
            BRL   L0D13BE
L0D12E9     BVS   L0D12EE
            EOR   #$8000
L0D12EE     BMI   L0D12F3
            BRL   L0D13BE
L0D12F3     LDX   L0200D8
            LDA   L0200D6
            STA   $F2
            STX   $F4
            LDA   [$F2]
            CMP   $EC
            BEQ   L0D1306
            BRL   L0D13BA
L0D1306     LDX   L0200D8
            LDA   L0200D6
            STA   $F2
            STX   $F4
            LDA   #$0001
            LDY   #$0002
            STA   [$F2],Y
            STZ   $EE
            BRA   L0D1359
L0D131C     LDA   $EE
            LDX   #$0000
            PEA   $0000
            PEA   $000C
            CLC
            JSL   L013048
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$000E
            LDA   [$F2],Y
            TAX
            LDY   #$000C
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            CMP   #$0000
            BNE   L0D1357
            BRA   L0D136E
L0D1357     INC   $EE
L0D1359     LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            CMP   $EE
            BEQ   L0D136E
            BCS   L0D131C
L0D136E     LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            CMP   $EE
            BEQ   L0D1398
            BCC   L0D1398
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDA   #$0002
            STA   [$F2]
            JSL   L0D0D42
            BRA   L0D13B3
L0D1398     LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDA   #$0003
            STA   [$F2]
            PEA   ^L0375A1
            PEA   L0375A1
            JSL   L0133D4
            PLY
            PLY
L0D13B3     LDA   #$0029
            STA   $F0
            BRA   L0D13BE
L0D13BA     JSL   L0D0D98
L0D13BE     BRL   L0D1405
L0D13C1     PEA   ^L0375AD
            PEA   L0375AD
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D1405
L0D13D0     LDA   #$0028
            STA   $F0
            BRL   L0D1405
L0D13D8     PEA   ^L0375B9
            PEA   L0375B9
            JSL   L0133D4
            PLY
            PLY
            BRL   L0D1405
L0D13E7     BRL   L0D1405
L0D13EA     DA    L0D12BF
            DA    L0D13C1
            DA    L0D13D0
            DA    L0D13D8
            DA    L0D13E7
L0D13F4     SEC
            SBC   #$0032
            CMP   #$0004
            BCC   L0D1400
            LDA   #$0004
L0D1400     ASL
            TAX
            JMP   (L0D13EA,X)

L0D1405     BRL   L0D15A6
L0D1408     LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            LDA   #$0036
            JSL   L012E77
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            JSL   L013333
            BEQ   L0D1480
            BCC   L0D1480
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            SEC
            SBC   #$0036
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            LDX   #$0000
            PEA   $0000
            PEA   $000C
            CLC
            JSL   L013048
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$000E
            LDA   [$F2],Y
            TAX
            LDY   #$000C
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STX   L0200D8
            STA   L0200D6
            LDA   #$002A
            STA   $F0
            BRL   L0D15A6
L0D1480     LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   L0200D4
            LDA   L0200D2
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            PHA
            LDA   #$0036
            PLX
            STX   $F6
            CLC
            ADC   $F6
            LDX   #$0000
            SEC
            JSL   L013B17
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            LDX   #$0000
            SEC
            JSL   L013B17
            LDX   L0200D8
            LDA   L0200D6
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            JSL   L012FF8
            PLA
            PLX
            STX   $E2
            STA   $E0
            LDA   [$E0]
            BRL   L0D154A
L0D14EB     LDA   #L0375C7
            LDX   #^L0375C7
            STX   $EA
            STA   $E8
            LDA   #L033C86
            LDX   #^L033C86
            STX   $E6
            STA   $E4
            BRL   L0D1558
L0D1502     LDA   #L0375D2
            LDX   #^L0375D2
            STX   $EA
            STA   $E8
            LDA   #L0338EB
            LDX   #^L0338EB
            STX   $E6
            STA   $E4
            BRL   L0D1558
L0D1519     LDA   #L0375DA
            LDX   #^L0375DA
            STX   $EA
            STA   $E8
            LDA   #L033B90
            LDX   #^L033B90
            STX   $E6
            STA   $E4
            BRL   L0D1558
L0D1530     PEA   ^L0375F1
            PEA   L0375F1
            JSL   L050256
            PLY
            PLY
            BRL   L0D1558
            BRL   L0D1558
L0D1542     DA    L0D14EB
            DA    L0D1502
            DA    L0D1519
            DA    L0D1530
L0D154A     DEC
            CMP   #$0003
            BCC   L0D1553
            LDA   #$0003
L0D1553     ASL
            TAX
            JMP   (L0D1542,X)

L0D1558     LDY   #$0002
            LDA   [$E0],Y
            PHA
            LDA   [$E0]
            PHA
            PEA   ^L03760D
            PEA   L03760D
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            LDY   #$0002
            LDA   [$E0],Y
            PHA
            LDX   L0200D8
            LDA   L0200D6
            STA   $F2
            STX   $F4
            LDY   #$0006
            LDA   [$F2],Y
            TAX
            LDY   #$0004
            LDA   [$F2],Y
            PHX
            PHA
            PEA   $0020
            PEA   $0020
            PEI   $E6
            PEI   $E4
            PEI   $EA
            PEI   $E8
            JSL   L0B0000
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
L0D15A6     BRL   L0D15C8
L0D15A9     PEA   $0029
            PEI   $FF
            PEI   $FD
            JSL   L0A0082
            PLY
            PLY
            PLY
            STA   $F0
            BRA   L0D15C8
            BRA   L0D15C8
L0D15BD     CMP   #$0103
            BNE   L0D15C5
            BRL   L0D1296
L0D15C5     JMP   L0D15A9

L0D15C8     LDA   $F0
            TAY
            TSC
            CLC
            ADC   #$0018
            TCS
            TYA
            PLD
            RTL


