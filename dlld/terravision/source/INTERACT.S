
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L080000     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            CLC
            ADC   #$0010
            LDX   $FF
            BCC   L080016
            INX
L080016     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L080020     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L020046
            LDA   L020044
            STX   $F6
            ORA   $F6
            BNE   L08003A
            BRL   L0800B8
L08003A     LDX   #$0000
            LDA   #$0032
            PHX
            PHA
            LDX   L020046
            LDA   L020044
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDY   #$0022
            LDA   [$F6],Y
            TAX
            LDY   #$0020
            LDA   [$F6],Y
            JSL   L013333
            BEQ   L080070
            BVS   L08006E
            EOR   #$8000
L08006E     BMI   L0800B8
L080070     LDX   L020046
            LDA   L020044
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$0008
            CLC
            ADC   $F6
            BCC   L080091
            INX
L080091     STX   L020070
            STA   L02006E
            PEA   $0000
            LDX   L020046
            LDA   L020044
            PHX
            PHA
            _HiliteControl
            BCS   L0800AE
            LDA   #$0000
L0800AE     STAL  L020002
            STZ   L020044
            STZ   L020046
L0800B8     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0800C0     ENT
            PHD
            TSC
            SEC
            SBC   #$00DF
            TCD
            ADC   #$008C
            TCS
            STZ   $D8
            STZ   $D6
            LDA   #$0103
            LDY   #$0004
            STA   [$E5],Y
            LDX   #$FFFF
            LDA   #$FFFF
            LDY   #$0002
            PHA
            TXA
            STA   [$E5],Y
            PLA
            STA   [$E5]
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L0800FA
            LDA   #$0000
L0800FA     STAL  L020002
            PLA
            PHX
            PHA
            _GetDblTime
            BCS   L08010D
            LDA   #$0000
L08010D     STAL  L020002
            PLA
            PLX
            STX   $CA
            STA   $C8
            STZ   $C0
            STZ   $C2
            STZ   $A0
            STZ   $A2
            LDX   #$0000
            LDA   #$0F7D
            STX   $BE
            STA   $BC
            LDA   L020050
            STA   $9E
L08012E     LDA   $D8
            BEQ   L080135
            BRL   L08048E
L080135     LDX   $EF
            LDA   $ED
            STX   $DA
            ORA   $DA
            BEQ   L080165
            LDA   $ED
            LDX   $EF
            JSL   L014572
            TAY
            BEQ   L080165
            LDA   #$0103
            LDY   #$0004
            STA   [$E5],Y
            LDX   #$0000
            LDA   #$000D
            LDY   #$0002
            PHA
            TXA
            STA   [$E5],Y
            PLA
            STA   [$E5]
            BRL   L08048E
L080165     PHA
            PEA   $FFFF
            PEA   $0000
            TDC
            CLC
            ADC   #$00A8
            PHA
            _TaskMaster
            BCS   L08017E
            LDA   #$0000
L08017E     STAL  L020002
            PLA
            STA   $D0
            LDA   $D0
            CMP   #$0000
            BNE   L0801D1
            SEC
            LDA   $B8
            SBC   #$0000
            BNE   L08019B
            LDA   $BA
            SBC   #$0000
            BRA   L0801A2
L08019B     LDA   $BA
            SBC   #$0000
            REP   #$02
L0801A2     BEQ   L0801D1
            LDX   $BA
            LDA   $B8
            STA   $9A
            LDX   #$0000
            LDA   #$0010
            PHX
            PHA
            LDX   $BA
            LDA   $B8
            CLC
            JSL   L013B83
            PLA
            PLX
            STA   $9C
            LDA   $9A
            CMP   $9E
            BNE   L0801D1
            LDA   $9C
            CMP   #$0001
            BNE   L0801D1
            LDA   #$0001
            STA   $D6
L0801D1     LDA   $D6
            BEQ   L0801DF
            LDA   $D0
            CMP   #$0008
            BEQ   L0801DF
            BRL   L08012E
L0801DF     LDX   $FB
            LDA   $F9
            STX   $DA
            ORA   $DA
            BEQ   L08022F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00A8
            PHA
            _IsDialogEvent
            BCS   L0801FF
            LDA   #$0000
L0801FF     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00A8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0096
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0092
            PHA
            _DialogSelect
            BCS   L08022A
            LDA   #$0000
L08022A     STAL  L020002
            PLA
L08022F     LDA   $D0
            BRL   L080463
L080234     PEA   $0000
            TDC
            CLC
            ADC   #$00A8
            PHA
            JSL   L080000
            PLY
            PLY
            STX   $CE
            STA   $CC
            LDA   [$CC]
            LDY   #$0004
            STA   [$E5],Y
            PEA   $0000
            LDY   #$0002
            LDA   [$CC],Y
            PHA
            _HiliteMenu
            BCS   L080263
            LDA   #$0000
L080263     STAL  L020002
            LDA   #$0001
            STA   $D8
            BRL   L080483
L08026F     PHX
            PHA
            _GetTick
            BCS   L08027D
            LDA   #$0000
L08027D     STAL  L020002
            PLA
            PLX
            STX   $C6
            STA   $C4
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00A4
            PHA
            PEI   $B4
            PEI   $B2
            PEI   $EB
            PEI   $E9
            _FindControl
            BCS   L0802A5
            LDA   #$0000
L0802A5     STAL  L020002
            PLA
            STA   $D4
            LDA   $D4
            BRL   L0803A9
L0802B1     LDY   #$0002
            LDA   [$A4],Y
            TAX
            LDA   [$A4]
            STA   $DA
            STX   $DC
            LDY   #$0022
            LDA   [$DA],Y
            TAX
            LDY   #$0020
            LDA   [$DA],Y
            LDY   #$0002
            PHA
            TXA
            STA   [$E5],Y
            PLA
            STA   [$E5]
            LDX   $FF
            LDA   $FD
            STX   $DA
            ORA   $DA
            BEQ   L0802F8
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDY   #$0002
            LDA   [$E5],Y
            TAX
            LDA   [$E5]
            JSL   L013333
            BCS   L0802F8
            LDA   #$0001
            STA   $D8
            BRL   L08012E
L0802F8     LDA   $A0
            CMP   $A4
            BNE   L080329
            LDA   $A2
            CMP   $A6
            BNE   L080329
            LDX   $CA
            LDA   $C8
            PHX
            PHA
            LDX   $C6
            LDA   $C4
            SEC
            SBC   $C0
            PHA
            TXA
            SBC   $C2
            TAX
            PLA
            JSL   L013333
            BEQ   L080329
            BCC   L080329
            LDA   #$0001
            STA   $D8
            BRL   L08012E
            BRA   L080369
L080329     JSL   L080020
            LDY   #$0002
            LDA   [$A4],Y
            TAX
            LDA   [$A4]
            STA   $DA
            STX   $DC
            LDX   $DC
            LDA   #$0008
            CLC
            ADC   $DA
            BCC   L080344
            INX
L080344     STX   L020070
            STA   L02006E
            PEA   $0002
            LDX   $A6
            LDA   $A4
            STX   L020046
            STA   L020044
            PHX
            PHA
            _HiliteControl
            BCS   L080365
            LDA   #$0000
L080365     STAL  L020002
L080369     LDX   $A6
            LDA   $A4
            STX   $A2
            STA   $A0
            BRL   L0803B8
L080374     PHA
            PEI   $B4
            PEI   $B2
            PEI   $F3
            PEI   $F1
            PEI   $A6
            PEI   $A4
            _TrackControl
            BCS   L08038D
            LDA   #$0000
L08038D     STAL  L020002
            PLA
            STA   $D2
            BRL   L0803B8
L080397     JSL   L080020
            BRL   L0803B8
            BRL   L0803B8
L0803A1     DA    L0802B1
            DA    L080397
            DA    L080374
            STA   [$03],Y
L0803A9     DEC
            DEC
            CMP   #$0003
            BCC   L0803B3
            LDA   #$0003
L0803B3     ASL
            TAX
            JMP   (L0803A1,X)

L0803B8     BRL   L080483
L0803BB     LDX   $F7
            LDA   $F5
            STX   $DA
            ORA   $DA
            BEQ   L08043C
            LDA   $AA
            CMP   #$000D
            BNE   L08043C
            LDA   $AC
            CMP   #$0000
            BNE   L08043C
            LDA   #$0103
            LDY   #$0004
            STA   [$E5],Y
            LDX   #$0000
            LDA   #$000D
            LDY   #$0002
            PHA
            TXA
            STA   [$E5],Y
            PLA
            STA   [$E5]
            PEI   $F7
            PEI   $F5
            JSL   L012A2D
            PLY
            PLY
            STX   $90
            STA   $8E
            STX   $DA
            ORA   $DA
            BEQ   L080437
            JSL   L080020
            LDY   #$0002
            LDA   [$8E],Y
            TAX
            LDA   [$8E]
            STA   $DA
            STX   $DC
            LDX   $DC
            LDA   #$0008
            CLC
            ADC   $DA
            BCC   L08041A
            INX
L08041A     STX   L020070
            STA   L02006E
            PEA   $0002
            PEI   $90
            PEI   $8E
            _HiliteControl
            BCS   L080433
            LDA   #$0000
L080433     STAL  L020002
L080437     LDA   #$0001
            STA   $D8
L08043C     BRL   L080483
L08043F     LDA   $9A
            CMP   $9E
            BEQ   L08045C
            LDA   $D6
            BEQ   L08045C
            STZ   $D6
            LDA   $9E
            STA   $9A
            LDA   #$0001
            STA   $D8
            LDA   #$0192
            LDY   #$0004
            STA   [$E5],Y
L08045C     BRL   L080483
L08045F     BRA   L080483
            BRA   L080483
L080463     CMP   #$0003
            BNE   L08046B
            BRL   L0803BB
L08046B     CMP   #$0008
            BEQ   L08043F
            CMP   #$0011
            BNE   L080478
            BRL   L080234
L080478     CMP   #$0013
            BNE   L080480
            BRL   L08026F
L080480     JMP   L08045F

L080483     LDX   $C6
            LDA   $C4
            STX   $C2
            STA   $C0
            BRL   L08012E
L08048E     TAY
            TSC
            CLC
            ADC   #$0052
            TCS
            TYA
            PLD
            RTL

L080498     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L0800C0
            TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0804DD     ENT
            PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00E0
            TCS
            PEA   $0000
            PEA   $0000
            PEI   $FB
            PEI   $F9
            PEI   $FF
            PEI   $FD
            PEA   $0000
            PEA   $0000
            PEI   $F7
            PEI   $F5
            PEI   $F3
            PEI   $F1
            PEI   $EF
            PEI   $ED
            JSL   L0800C0
            TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL


