
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

            REL

L070000     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$0092
            TCS
            LDA   $FF
            BRL   L0700AC
L070010     PEA   ^L030CA8
            PEA   L030CA8
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L030CC1
            PEA   L030CC1
            PEA   $0000
            TDC
            CLC
            ADC   #$00B4
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L030CDE
            PEA   L030CDE
            PEA   $0000
            TDC
            CLC
            ADC   #$0094
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            BRL   L0700BA
L070058     PEA   ^L030CEE
            PEA   L030CEE
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L030D07
            PEA   L030D07
            PEA   $0000
            TDC
            CLC
            ADC   #$00B4
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L030D25
            PEA   L030D25
            PEA   $0000
            TDC
            CLC
            ADC   #$0094
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            BRL   L0700BA
L0700A0     BRL   L0700BA
            BRL   L0700BA
L0700A6     DA    L070010
            DA    L070058
            DA    L0700A0
L0700AC     DEC
            CMP   #$0002
            BCC   L0700B5
            LDA   #$0002
L0700B5     ASL
            TAX
            JMP   (L0700A6,X)

L0700BA     PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L013A1F
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00B4
            PHA
            JSL   L013A1F
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$0094
            PHA
            JSL   L013A1F
            PLY
            PLY
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            TXA
            STAL  L030C4C
            PLA
            STAL  L030C4A
            LDX   #$0000
            TDC
            CLC
            ADC   #$00B4
            PHA
            TXA
            STAL  L030C64
            PLA
            STAL  L030C62
            LDX   #$0000
            TDC
            CLC
            ADC   #$0094
            PHA
            TXA
            STAL  L030C7C
            PLA
            STAL  L030C7A
L070120     PHA
            PEA   ^L030C86
            PEA   L030C86
            PEA   $0000
            PEA   $0000
            _NoteAlert
            BCS   L070139
            LDA   #$0000
L070139     STAL  L020002
            PLA
            CMP   #$0001
            BEQ   L070145
            BRA   L070120
L070145     JSL   L014C78
            TSC
            CLC
            ADC   #$0066
            TCS
            PLD
            RTL

L070151     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            BRL   L07018B
L070161     LDA   #$0001
            BRL   L0702C6
L070167     LDA   L020040
            SEC
            SBC   L02003E
            BRL   L0702C6
L070171     JSL   L015B49
            SEC
            SBC   L02003E
            CLC
            ADC   #$0001
            BRL   L0702C6
L070180     BRL   L070199
L070183     DA    L070161
            DA    L070167
            DA    L070171
            DA    L070180
L07018B     DEC
            CMP   #$0003
            BCC   L070194
            LDA   #$0003
L070194     ASL
            TAX
            JMP   (L070183,X)

L070199     PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            _GetDItemValue
            BCS   L0701AC
            LDA   #$0000
L0701AC     STAL  L020002
            PLA
            STA   $EA
            LDX   #$0000
            STX   $E8
            STA   $E6
            LDA   $FF
            BRL   L0702B3
L0701BF     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EC
            CMP   #$0001
            BCS   L0701D1
            LDA   #$0001
            BRA   L0701D3
L0701D1     LDA   $EC
L0701D3     STA   $EA
            PHA
            LDA   L02003E
            PLX
            STX   $F2
            CLC
            ADC   $F2
            PHA
            JSL   L0148CF
            PLY
            BRL   L0702C4
L0701E8     LDA   $EA
            CLC
            ADC   #$0001
            STA   $EC
            CMP   L020042
            BEQ   L0701FC
            BCC   L0701FC
            LDA   L020042
            BRA   L0701FE
L0701FC     LDA   $EC
L0701FE     STA   $EA
            PHA
            LDA   L02003E
            PLX
            STX   $F2
            CLC
            ADC   $F2
            PHA
            JSL   L0148CF
            PLY
            BRL   L0702C4
L070213     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            SEC
            SBC   #$0032
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            JSL   L013333
            BEQ   L07023E
            BVS   L070235
            EOR   #$8000
L070235     BPL   L07023E
            LDA   #$0001
            STA   $EA
            BRA   L070246
L07023E     LDA   $EA
            SEC
            SBC   #$0032
            STA   $EA
L070246     LDA   L02003E
            CLC
            ADC   $EA
            PHA
            JSL   L0148CF
            PLY
            BRL   L0702C4
L070255     LDA   L020042
            LDX   #$0000
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0032
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            JSL   L013333
            BVS   L070275
            EOR   #$8000
L070275     BMI   L07027E
            LDA   L020042
            STA   $EA
            BRA   L070286
L07027E     LDA   $EA
            CLC
            ADC   #$0032
            STA   $EA
L070286     LDA   L02003E
            CLC
            ADC   $EA
            PHA
            JSL   L0148CF
            PLY
            BRL   L0702C4
L070295     LDA   L02003E
            CLC
            ADC   $EA
            PHA
            JSL   L0148CF
            PLY
            BRL   L0702C4
L0702A4     BRL   L0702C4
L0702A7     DA    L0701BF
            DA    L0701E8
            DA    L070213
            DA    L070255
            DA    L070295
            DA    L0702A4
L0702B3     SEC
            SBC   #$0004
            CMP   #$0005
            BCC   L0702BF
            LDA   #$0005
L0702BF     ASL
            TAX
            JMP   (L0702A7,X)

L0702C4     LDA   $EA
L0702C6     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            LDA   $02,S
            STA   $0A,S
            LDA   $01,S
            STA   $09,S
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            STA   $04,S
            RTL

L0702E0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRA   L07031D
L0702EF     PEA   $0056
            PEA   $0000
            LDA   $F4
            LDX   #$0000
            TAY
            BPL   L0702FE
            DEX
L0702FE     PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013EB9
            PLY
            PLY
            PLY
            PLY
            INC   $F4
L07031D     LDA   $F4
            SEC
            SBC   #$0012
            BVS   L070328
            EOR   #$8000
L070328     BPL   L0702EF
            PEA   $0056
            PEA   $0000
            PEA   ^L031AFF
            PEA   L031AFF
            JSL   L013EB9
            PLY
            PLY
            PLY
            PLY
            STZ   L02003A
            STZ   L02003C
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L07034C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0056
            PEA   ^L031AFF
            PEA   L031AFF
            LDA   L02003A
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0056
            PEA   $0000
            PEA   ^L031AFF
            PEA   L031AFF
            JSL   L013EB9
            PLY
            PLY
            PLY
            PLY
            INC   L02003A
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0703A5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L02003A
            CMP   #$0012
            BCC   L070421
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L0703CB
            LDA   #$0000
L0703CB     STAL  L020002
            PLA
            PHX
            PHA
            PEA   ^L030DB2
            PEA   L030DB2
            _GetNewModalDialog
            BCS   L0703E4
            LDA   #$0000
L0703E4     STAL  L020002
            PLA
            PLX
            STX   $F4
            STA   $F2
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L070401
            LDA   #$0000
L070401     STAL  L020002
            PLA
            PEI   $F4
            PEI   $F2
            _CloseDialog
            BCS   L070416
            LDA   #$0000
L070416     STAL  L020002
            LDA   #$0001
            BRA   L070424
            BRA   L070424
L070421     LDA   #$0000
L070424     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L07042E     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            STZ   $F0
            BRA   L070470
L07043D     PEI   $FF
            PEI   $FD
            LDA   $F0
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L014120
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L07046E
            LDA   #$0001
            BRA   L07047A
L07046E     INC   $F0
L070470     LDA   $F0
            CMP   L02003A
            BCC   L07043D
            LDA   #$0000
L07047A     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L070484     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L0704A2
            LDA   #$0000
L0704A2     STAL  L020002
            PLA
            PHX
            PHA
            PEA   ^L030F2A
            PEA   L030F2A
            _GetNewModalDialog
            BCS   L0704BB
            LDA   #$0000
L0704BB     STAL  L020002
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L0704D0
            EOR   #$8000
L0704D0     BPL   L0704F1
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            BRA   L0704F7
L0704F1     LDA   #L030FB0
            LDX   #^L030FB0
L0704F7     PHX
            PHA
            PEA   ^L031B55
            PEA   L031B55
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L031B55
            PEA   L031B55
            JSL   L013A1F
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            PEA   $0003
            PEA   ^L031B55
            PEA   L031B55
            _SetIText
            BCS   L07052C
            LDA   #$0000
L07052C     STAL  L020002
            PEA   ^L030FB2
            PEA   L030FB2
            PEA   ^L031B65
            PEA   L031B65
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L031B65
            PEA   L031B65
            JSL   L013A1F
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            PEA   $0005
            PEA   ^L031B65
            PEA   L031B65
            _SetIText
            BCS   L070569
            LDA   #$0000
L070569     STAL  L020002
L07056D     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L070580
            LDA   #$0000
L070580     STAL  L020002
            PLA
            STA   $EE
            LDA   $EE
            CMP   #$0003
            BEQ   L070591
            BRL   L0705E7
L070591     PEA   ^L030FB4
            PEA   L030FB4
            PEA   ^L031B65
            PEA   L031B65
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   ^L031B65
            PEA   L031B65
            JSL   L013A1F
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            PEA   $0005
            PEA   ^L031B65
            PEA   L031B65
            _SetIText
            BCS   L0705CA
            LDA   #$0000
L0705CA     STAL  L020002
            PEI   $F2
            PEI   $F0
            PEA   $0003
            _DisableDItem
            BCS   L0705E1
            LDA   #$0000
L0705E1     STAL  L020002
            BRA   L07056D
L0705E7     LDA   $EE
            CMP   #$0002
            BNE   L070608
            PEI   $F2
            PEI   $F0
            _CloseDialog
            BCS   L0705FE
            LDA   #$0000
L0705FE     STAL  L020002
            LDA   #$0000
            BRL   L070754
L070608     PEI   $F2
            PEI   $F0
            PEA   $0003
            PEA   ^L031B55
            PEA   L031B55
            _GetIText
            BCS   L070621
            LDA   #$0000
L070621     STAL  L020002
            PEA   ^L031B55
            PEA   L031B55
            JSL   L013A8B
            PLY
            PLY
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L07063C
            EOR   #$8000
L07063C     BPL   L070686
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PEA   ^L031B55
            PEA   L031B55
            JSL   L014120
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L070686
            PEI   $F2
            PEI   $F0
            _CloseDialog
            BCS   L07067C
            LDA   #$0000
L07067C     STAL  L020002
            LDA   #$0001
            BRL   L070754
L070686     STZ   $EC
            PEA   ^L031B55
            PEA   L031B55
            JSL   L0140CE
            PLY
            PLY
            TAY
            BEQ   L07069C
            LDA   #$0000
            BRA   L07069F
L07069C     LDA   #$0001
L07069F     STA   $EC
            TAY
            BEQ   L0706BA
            PEA   ^L030FB6
            PEA   L030FB6
            PEA   ^L031B65
            PEA   L031B65
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            BRA   L0706DF
L0706BA     PEA   ^L031B55
            PEA   L031B55
            JSL   L07042E
            PLY
            PLY
            STA   $EC
            TAY
            BEQ   L0706DF
            PEA   ^L030FCB
            PEA   L030FCB
            PEA   ^L031B65
            PEA   L031B65
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
L0706DF     LDA   $EC
            BEQ   L070726
            PEA   ^L031B65
            PEA   L031B65
            JSL   L013A1F
            PLY
            PLY
            PEI   $F2
            PEI   $F0
            PEA   $0005
            PEA   ^L031B65
            PEA   L031B65
            _SetIText
            BCS   L070708
            LDA   #$0000
L070708     STAL  L020002
            PEI   $F2
            PEI   $F0
            PEA   $0003
            _EnableDItem
            BCS   L07071F
            LDA   #$0000
L07071F     STAL  L020002
            BRL   L07056D
L070726     PEI   $F2
            PEI   $F0
            _CloseDialog
            BCS   L070736
            LDA   #$0000
L070736     STAL  L020002
            PEA   ^L031B55
            PEA   L031B55
            PEA   ^L031AFF
            PEA   L031AFF
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            LDA   #$0001
            STA   L02003C
L070754     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L07075E     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            PEI   $FF
            PEA   ^L030FE5
            PEA   L030FE5
            PEI   $FD
            PEI   $FB
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $FD
            PEI   $FB
            JSL   L013A1F
            PLY
            PLY
            PEI   $F7
            PEI   $F5
            PEI   $F9
            PEI   $FD
            PEI   $FB
            _SetIText
            BCS   L07079E
            LDA   #$0000
L07079E     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0707AA     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E6
            TCS
            PEI   $F5
            PEI   $F3
            PEI   $F7
            PEI   $FB
            PEI   $F9
            _GetIText
            BCS   L0707CB
            LDA   #$0000
L0707CB     STAL  L020002
            PEI   $FB
            PEI   $F9
            JSL   L013A8B
            PLY
            PLY
            PEI   $FB
            PEI   $F9
            JSL   L013150
            PLY
            PLY
            STA   [$FD]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0707ED     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   [$F9]
            CMP   $FD
            BCS   L070807
            LDA   $FD
            STA   [$F9]
            LDA   #$0001
            BRA   L07081B
L070807     LDA   [$F9]
            CMP   $FF
            BEQ   L070818
            BCC   L070818
            LDA   $FF
            STA   [$F9]
            LDA   #$0001
            BRA   L07081B
L070818     LDA   #$0000
L07081B     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L070825     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E4
            TCS
            STZ   $E8
            PEA   $0001
            JSL   L015A6C
            PLY
            LDAL  L031DF2
            SEC
            SBC   #$0001
            STA   L02003E
            STA   $F0
            INC   $F0
            LDAL  L031DF4
            STA   L020040
            STA   $EE
            LDA   L020040
            SEC
            SBC   L02003E
            CLC
            ADC   #$0001
            STA   L020042
            LDA   #L070151
            LDX   #^L070151
            PHX
            PHA
            LDA   #L031097
            LDX   #^L031097
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$000E
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$000C
            STA   [$F6],Y
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L070894
            LDA   #$0000
L070894     STAL  L020002
            PLA
            PHX
            PHA
            PEA   ^L0310DF
            PEA   L0310DF
            _GetNewModalDialog
            BCS   L0708AD
            LDA   #$0000
L0708AD     STAL  L020002
            PLA
            PLX
            STX   $F4
            STA   $F2
            PEI   $F0
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEI   $EE
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0708ED     LDA   $E8
            BEQ   L0708F4
            BRL   L070BF7
L0708F4     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L070907
            LDA   #$0000
L070907     STAL  L020002
            PLA
            STA   $EC
            LDA   $EC
            BRL   L070BE6
L070913     PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STZ   $E6
            LDA   L020040
            PHA
            LDA   L02003E
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0707ED
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L070999
            PEI   $F0
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            STA   $E6
L070999     LDA   L020040
            PHA
            LDA   L02003E
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0707ED
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L0709D9
            PEI   $EE
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            STA   $E6
L0709D9     LDA   $E6
            BEQ   L0709E0
            BRL   L070BF4
L0709E0     LDA   #$0001
            STA   $E8
            BRL   L070BF4
L0709E8     JSL   L015B49
            PHA
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L070BF4
L070A09     JSL   L015B49
            PHA
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L070BF4
L070A2A     PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   L020040
            PHA
            LDA   L02003E
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0707ED
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L070AA9
            PEI   $F0
            PEA   ^L031BA5
            PEA   L031BA5
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L070AA9     LDA   L020040
            PHA
            LDA   L02003E
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0707ED
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L070AE4
            PEI   $EE
            PEA   ^L031BAB
            PEA   L031BAB
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L07075E
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L070AE4     PEI   $F0
            JSL   L0148CF
            PLY
            LDA   $F0
            CMP   $EE
            BNE   L070AF4
            BRL   L070B9E
L070AF4     PEI   $F4
            PEI   $F2
            PEA   $0007
            _HideDItem
            BCS   L070B07
            LDA   #$0000
L070B07     STAL  L020002
            LDA   #$0001
            STA   $EA
            BRA   L070B3F
L070B12     PEA   $00FF
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            PEI   $EA
            _GetControlDItem
            BCS   L070B29
            LDA   #$0000
L070B29     STAL  L020002
            _HiliteControl
            BCS   L070B39
            LDA   #$0000
L070B39     STAL  L020002
            INC   $EA
L070B3F     LDA   $EA
            CMP   #$0007
            BCC   L070B12
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $003C
            PEI   $EE
            PEA   $0000
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            STA   $EA
            BRA   L070B97
L070B6A     PEA   $0000
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            PEI   $EA
            _GetControlDItem
            BCS   L070B81
            LDA   #$0000
L070B81     STAL  L020002
            _HiliteControl
            BCS   L070B91
            LDA   #$0000
L070B91     STAL  L020002
            INC   $EA
L070B97     LDA   $EA
            CMP   #$0007
            BCC   L070B6A
L070B9E     JSL   L015B49
            SEC
            SBC   L02003E
            PHA
            PEI   $F4
            PEI   $F2
            PEA   $0007
            _SetDItemValue
            BCS   L070BBA
            LDA   #$0000
L070BBA     STAL  L020002
            PEI   $F4
            PEI   $F2
            PEA   $0007
            _ShowDItem
            BCS   L070BD1
            LDA   #$0000
L070BD1     STAL  L020002
L070BD5     BRL   L070BF4
L070BD8     DA    L070913
            DA    L0709E0
            DA    L0709E8
            DA    L070A09
            DA    L0709E0
            DA    L070A2A
            DA    L070BD5
L070BE6     DEC
            CMP   #$0006
            BCC   L070BEF
            LDA   #$0006
L070BEF     ASL
            TAX
            JMP   (L070BD8,X)

L070BF4     BRL   L0708ED
L070BF7     PEA   $0000
            JSL   L015A6C
            PLY
            PEI   $F4
            PEI   $F2
            _CloseDialog
            BCS   L070C0F
            LDA   #$0000
L070C0F     STAL  L020002
            LDA   $EC
            BRL   L070C60
L070C18     LDA   $F0
            STAL  L031B0F
            LDA   $EE
            STAL  L031B11
            LDAL  L031DF0
            STAL  L031B13
            LDA   #$0001
            BRL   L070C6E
L070C32     LDA   #$0000
            BRL   L070C6E
L070C38     JSL   L015B49
            STAL  L031B11
            STAL  L031B0F
            LDA   #$0000
            STAL  L031B13
            LDA   #$0001
            BRL   L070C6E
L070C51     BRL   L070C6E
L070C54     DA    L070C18
            DA    L070C32
            DA    L070C51
            DA    L070C51
            DA    L070C38
            DA    L070C51
L070C60     DEC
            CMP   #$0005
            BCC   L070C69
            LDA   #$0005
L070C69     ASL
            TAX
            JMP   (L070C54,X)

L070C6E     TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            PLD
            RTL

L070C78     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            JSL   L0703A5
            TAY
            BEQ   L070C8D
            BRL   L070CD1
L070C8D     LDA   $FF
            BNE   L070CB9
            PEA   $FFFF
            JSL   L070484
            PLY
            TAY
            BEQ   L070CB7
            LDAL  L031DF2
            STAL  L031B11
            STAL  L031B0F
            LDA   #$0000
            STAL  L031B13
            JSL   L07034C
            BRA   L070CD1
            BRA   L070CB9
L070CB7     BRA   L070CD1
L070CB9     JSL   L070825
            TAY
            BNE   L070CC2
            BRA   L070CD1
L070CC2     PEA   $FFFF
            JSL   L070484
            PLY
            TAY
            BEQ   L070CD1
            JSL   L07034C
L070CD1     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L070CDB     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0000
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            PEA   $0000
            _ClearScreen
            BCS   L070D01
            LDA   #$0000
L070D01     STAL  L020002
            PEA   $0006
            PEA   $0003
            PEA   $0001
            JSL   L015D04
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L070D1D     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            _ShowCursor
            BCS   L070D34
            LDA   #$0000
L070D34     STAL  L020002
            PEA   $000F
            _SetBackColor
            BCS   L070D47
            LDA   #$0000
L070D47     STAL  L020002
            PEA   $0000
            _SetForeColor
            BCS   L070D5A
            LDA   #$0000
L070D5A     STAL  L020002
            PEA   $000F
            _SetSolidBackPat
            BCS   L070D6D
            LDA   #$0000
L070D6D     STAL  L020002
            PEA   $0000
            _SetSolidPenPat
            BCS   L070D80
            LDA   #$0000
L070D80     STAL  L020002
            PEA   $0000
            JSL   L01335E
            PLY
            PEA   ^L031165
            PEA   L031165
            JSL   L0133D4
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L070DA0     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   $0042
            PEA   $006E
            _MoveTo
            BCS   L070DBD
            LDA   #$0000
L070DBD     STAL  L020002
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            CLC
            ADC   #$0016
            BCC   L070DED
            INX
L070DED     PHX
            PHA
            _DrawCString
            BCS   L070DFB
            LDA   #$0000
L070DFB     STAL  L020002
            PEA   $0042
            PEA   $007C
            _MoveTo
            BCS   L070E11
            LDA   #$0000
L070E11     STAL  L020002
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            CLC
            ADC   #$0036
            BCC   L070E41
            INX
L070E41     PHX
            PHA
            _DrawCString
            BCS   L070E4F
            LDA   #$0000
L070E4F     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L070E5B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E4
            TCS
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L070E79
            LDA   #$0000
L070E79     STAL  L020002
            PLA
L070E7E     PHA
            PEA   $0004
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            _GetNextEvent
            BCS   L070E97
            LDA   #$0000
L070E97     STAL  L020002
            PLA
            CMP   #$0000
            BNE   L070EA3
            BRA   L070E7E
L070EA3     PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L070EB6
            LDA   #$0000
L070EB6     STAL  L020002
            PLA
            TSC
            CLC
            ADC   #$0016
            TCS
            PLD
            RTL

L070EC3     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0010
            LDA   [$F4],Y
            PHA
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            PLX
            STX   $F4
            CMP   $F4
            BEQ   L070F64
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $003C
            LDA   $FF
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            PHA
            PEA   $0000
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L070F64     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L070F6C     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   #$0001
            STA   $F0
            STZ   $EE
            BRL   L0710CB
L070F81     LDA   $EE
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0010
            LDA   [$F2],Y
            CMP   #$0000
            BNE   L070FAF
            BRL   L07109E
L070FAF     LDA   $F0
            CMP   #$0002
            BEQ   L070FB9
            BRL   L071028
L070FB9     JSL   L070CDB
            LDA   $EE
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0010
            LDA   [$F2],Y
            PHA
            JSL   L0148CF
            PLY
            LDA   $EE
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0014
            LDA   [$F2],Y
            PHA
            JSL   L01310E
            PLY
            PEA   $0006
            PEA   $0003
            PEA   $0000
            JSL   L015D04
            PLY
            PLY
            PLY
            BRL   L071090
L071028     LDA   $EE
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0010
            LDA   [$F2],Y
            PHA
            JSL   L0148CF
            PLY
            LDA   $EE
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0014
            LDA   [$F2],Y
            PHA
            JSL   L01310E
            PLY
            PEA   $0006
            PEA   $0003
            PEA   $0000
            JSL   L015D04
            PLY
            PLY
            PLY
L071090     PEI   $EE
            JSL   L070EC3
            PLY
            LDA   #$0002
            STA   $F0
            BRA   L0710C5
L07109E     JSL   L070D1D
            PEI   $EE
            JSL   L070DA0
            PLY
            LDA   $F0
            CMP   #$0002
            BNE   L0710C0
            PEA   $0006
            PEA   $0003
            PEA   $0001
            JSL   L015D04
            PLY
            PLY
            PLY
L0710C0     LDA   #$0001
            STA   $F0
L0710C5     JSL   L070E5B
            INC   $EE
L0710CB     LDA   $EE
            CMP   L02003A
            BCS   L0710D5
            BRL   L070F81
L0710D5     LDA   $F0
            CMP   #$0002
            BNE   L0710E3
            LDA   #$0001
            STA   [$FD]
            BRA   L0710E8
L0710E3     LDA   #$0000
            STA   [$FD]
L0710E8     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L0710F2     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   $FD
            CMP   $FF
            BNE   L071108
            LDA   $FF
            BRL   L0711EA
L071108     LDA   $FF
            CMP   $FD
            BEQ   L071115
            BCC   L071115
            LDA   #$0001
            BRA   L071118
L071115     LDA   #$FFFF
L071118     STA   $EE
            PEA   $0056
            LDA   $FD
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PEA   ^L031AFF
            PEA   L031AFF
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $FD
            STA   $F0
            BRL   L0711B6
L07114D     PEA   $0056
            LDA   $EE
            LDX   #$0000
            TAY
            BPL   L071159
            DEX
L071159     PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   $F0
            LDX   #$0000
            TAY
            BPL   L07116D
            DEX
L07116D     PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            LDA   $F0
            LDX   #$0000
            TAY
            BPL   L071191
            DEX
L071191     PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            CLC
            ADC   $EE
            STA   $F0
L0711B6     LDA   $F0
            CMP   $FF
            BNE   L07114D
            PEA   $0056
            PEA   ^L031AFF
            PEA   L031AFF
            LDA   $FF
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $FF
L0711EA     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L0711F4     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            PHX
            PHA
            PEA   ^L03121F
            PEA   L03121F
            _GetNewModalDialog
            BCS   L071213
            LDA   #$0000
L071213     STAL  L020002
            PLA
            PLX
            STX   $F2
            STA   $F0
L07121D     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L071230
            LDA   #$0000
L071230     STAL  L020002
            PLA
            STA   $EE
            LDA   $EE
            CMP   #$0002
            BNE   L071255
            PEI   $F2
            PEI   $F0
            _CloseDialog
            BCS   L07124E
            LDA   #$0000
L07124E     STAL  L020002
            BRL   L0712B7
L071255     STZ   $EC
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            PEA   ^L031B15
            PEA   L031B15
            PEA   $0008
            PEI   $F2
            PEI   $F0
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   $EC
            CMP   #$0001
            BCS   L071282
            BRA   L07121D
L071282     LDA   $EC
            CMP   L02003A
            BEQ   L071290
            BCC   L071290
            LDA   L02003A
            STA   $EC
L071290     PEI   $F2
            PEI   $F0
            _CloseDialog
            BCS   L0712A0
            LDA   #$0000
L0712A0     STAL  L020002
            LDA   #$0001
            STA   L02003C
            DEC   $EC
            LDA   $EC
            PHA
            PEI   $FF
            JSL   L0710F2
            PLY
            PLY
L0712B7     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L0712C1     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            CMP   #$0013
            BCS   L071324
            LDA   #$0009
            PHA
            LDA   $FF
            CLC
            JSL   L012E82
            LDA   #$0011
            CLC
            JSL   L013003
            LDA   #$0029
            PLX
            STX   $F4
            CLC
            ADC   $F4
            STA   [$FB]
            LDA   $FF
            CMP   #$0009
            BCS   L0712FD
            LDA   #$0017
            BRA   L071300
L0712FD     LDA   #$008D
L071300     LDY   #$0002
            STA   [$FB],Y
            LDA   [$FB]
            CLC
            ADC   #$000D
            LDY   #$0004
            STA   [$FB],Y
            LDY   #$0002
            LDA   [$FB],Y
            CLC
            ADC   #$005F
            LDY   #$0006
            STA   [$FB],Y
            BRL   L0713AF
            BRL   L0713AF
L071324     LDA   $FF
            CMP   #$001B
            BCS   L07136A
            LDA   $FF
            SEC
            SBC   #$0013
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L0312A5
            LDX   #^L0312A5
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            STA   [$FB]
            LDA   #$00F5
            LDY   #$0002
            STA   [$FB],Y
            LDA   [$FB]
            CLC
            ADC   #$000A
            LDY   #$0004
            STA   [$FB],Y
            LDA   #$0102
            LDY   #$0006
            STA   [$FB],Y
            BRA   L0713AF
            BRA   L0713AF
L07136A     LDA   $FF
            CMP   #$001B
            BNE   L071392
            LDA   #$00AE
            STA   [$FB]
            LDA   #$011A
            LDY   #$0002
            STA   [$FB],Y
            LDA   #$00BE
            LDY   #$0004
            STA   [$FB],Y
            LDA   #$0133
            LDY   #$0006
            STA   [$FB],Y
            BRA   L0713AF
            BRA   L0713AF
L071392     LDA   #$00AE
            STA   [$FB]
            LDA   #$00FC
            LDY   #$0002
            STA   [$FB],Y
            LDA   #$00BE
            LDY   #$0004
            STA   [$FB],Y
            LDA   #$0115
            LDY   #$0006
            STA   [$FB],Y
L0713AF     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0713B9     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E4
            TCS
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L0713DB
            LDA   #$0000
L0713DB     STAL  L020002
            LDA   #$0013
            STA   $F2
            BRL   L07148A
L0713E7     LDA   $FF
            CMP   #$FFFF
            BNE   L07140D
            LDA   $F2
            CMP   #$0017
            BEQ   L07140D
            LDA   $F2
            CMP   #$001B
            BEQ   L07140D
            LDA   $F2
            CMP   #$0019
            BEQ   L07140D
            LDA   $F2
            CMP   #$001C
            BEQ   L07140D
            BRL   L071488
L07140D     PEI   $F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
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
            ADC   #$00E6
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0080
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0138ED
            PEA   L0138ED
            LDA   $F2
            LDX   #$0000
            TAY
            BPL   L071456
            DEX
L071456     PHX
            PHA
            PEA   $0000
            PEA   $0000
            _NewControl
            BCS   L07146A
            LDA   #$0000
L07146A     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
            PEI   $F0
            PEI   $EE
            _ShowControl
            BCS   L071484
            LDA   #$0000
L071484     STAL  L020002
L071488     INC   $F2
L07148A     LDA   $F2
            SEC
            SBC   #$001C
            BNE   L071495
            BRL   L0713E7
L071495     BVS   L07149A
            EOR   #$8000
L07149A     BMI   L07149F
            BRL   L0713E7
L07149F     STZ   $F2
            BRL   L0715C2
L0714A4     PEI   $F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
            LDA   $E8
            CLC
            ADC   #$0001
            PHA
            LDA   $E6
            CLC
            ADC   #$000A
            PHA
            _MoveTo
            BCS   L0714D0
            LDA   #$0000
L0714D0     STAL  L020002
            PEA   $0000
            _SetForeColor
            BCS   L0714E3
            LDA   #$0000
L0714E3     STAL  L020002
            PEA   $000F
            _SetBackColor
            BCS   L0714F6
            LDA   #$0000
L0714F6     STAL  L020002
            PEA   $0000
            _SetSolidPenPat
            BCS   L071509
            LDA   #$0000
L071509     STAL  L020002
            LDA   $F2
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            _DrawCString
            BCS   L071534
            LDA   #$0000
L071534     STAL  L020002
            LDA   $F2
            CMP   $FF
            BNE   L071557
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            _InvertRect
            BCS   L071553
            LDA   #$0000
L071553     STAL  L020002
L071557     PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0080
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0138ED
            PEA   L0138ED
            LDA   $F2
            LDX   #$0000
            TAY
            BPL   L07158E
            DEX
L07158E     PHX
            PHA
            PEA   $0000
            PEA   $0000
            _NewControl
            BCS   L0715A2
            LDA   #$0000
L0715A2     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
            PEI   $F0
            PEI   $EE
            _ShowControl
            BCS   L0715BC
            LDA   #$0000
L0715BC     STAL  L020002
            INC   $F2
L0715C2     LDA   $F2
            CMP   L02003A
            BCS   L0715CC
            BRL   L0714A4
L0715CC     TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L0715D4     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00C4
            TCS
            STZ   $F0
            STZ   $F2
            LDX   #$FFFF
            LDA   #$FFFF
            STX   $EE
            STA   $EC
            STZ   $E6
            LDX   #$0000
            LDA   #$0F77
            STX   $E4
            STA   $E2
L0715F9     LDA   $E6
            BEQ   L071600
            BRL   L0717E6
L071600     PHA
            PEA   $FFFF
            PEA   $0000
            TDC
            CLC
            ADC   #$00CE
            PHA
            _TaskMaster
            BCS   L071619
            LDA   #$0000
L071619     STAL  L020002
            PLA
            BRL   L0717D8
L071621     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEI   $DA
            PEI   $D8
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _FindControl
            BCS   L071646
            LDA   #$0000
L071646     STAL  L020002
            PLA
            STA   $EA
            LDA   $EA
            CMP   #$0000
            BNE   L071657
            BRL   L0717D1
L071657     LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F4
            STX   $F6
            LDY   #$0022
            LDA   [$F4],Y
            TAX
            LDY   #$0020
            LDA   [$F4],Y
            STA   $E8
            LDA   $E8
            CMP   #$001C
            BNE   L0716CA
            PEI   $E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _InvertRect
            BCS   L07169E
            LDA   #$0000
L07169E     STAL  L020002
            PEA   $0000
            PEA   $000C
            JSL   L013212
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _InvertRect
            BCS   L0716C3
            LDA   #$0000
L0716C3     STAL  L020002
            BRL   L0717CC
L0716CA     LDA   $E8
            CMP   #$0013
            BCC   L0716D8
            LDA   $E8
            CMP   #$001B
            BNE   L071740
L0716D8     LDA   $FF
            SEC
            SBC   #$FFFF
            BEQ   L071712
            BVS   L0716E5
            EOR   #$8000
L0716E5     BPL   L071712
            PEI   $FF
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _InvertRect
            BCS   L07170E
            LDA   #$0000
L07170E     STAL  L020002
L071712     PEI   $E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _InvertRect
            BCS   L071739
            LDA   #$0000
L071739     STAL  L020002
            BRL   L0717CC
L071740     PEI   $E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0712C1
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0001
            _SetPenSize
            BCS   L071764
            LDA   #$0000
L071764     STAL  L020002
            PEA   $0006
            _SetSolidPenPat
            BCS   L071777
            LDA   #$0000
L071777     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _PaintRect
            BCS   L071790
            LDA   #$0000
L071790     STAL  L020002
            PEA   $0000
            PEA   $000C
            JSL   L013212
            PLY
            PLY
            PEA   $0004
            _SetSolidPenPat
            BCS   L0717AF
            LDA   #$0000
L0717AF     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _PaintRect
            BCS   L0717C8
            LDA   #$0000
L0717C8     STAL  L020002
L0717CC     LDA   #$0001
            STA   $E6
L0717D1     BRL   L0717E3
L0717D4     BRA   L0717E3
            BRA   L0717E3
L0717D8     CMP   #$0013
            BNE   L0717E0
            BRL   L071621
L0717E0     JMP   L0717D4

L0717E3     BRL   L0715F9
L0717E6     LDA   $E8
            TAY
            TSC
            CLC
            ADC   #$0034
            TCS
            TYA
            PLD
            RTL

L0717F2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            PHX
            PHA
            PEA   ^L03137D
            PEA   L03137D
            _GetNewModalDialog
            BCS   L071811
            LDA   #$0000
L071811     STAL  L020002
            PLA
            PLX
            STX   $F4
            STA   $F2
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            BCS   L07182E
            LDA   #$0000
L07182E     STAL  L020002
            PLA
            STA   $F0
            LDA   $F0
            CMP   #$0002
            BNE   L071856
            PEI   $F4
            PEI   $F2
            _CloseDialog
            BCS   L07184C
            LDA   #$0000
L07184C     STAL  L020002
            LDA   #$0000
            BRL   L0718E4
L071856     PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L031B15
            PEA   L031B15
            PEA   $0008
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L031B35
            PEA   L031B35
            PEA   $0009
            PEI   $F4
            PEI   $F2
            JSL   L0707AA
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   #$0000
            STAL  L031B11
            STAL  L031B0F
            PEA   $FFFF
            JSL   L070484
            PLY
            TAY
            BEQ   L0718CD
            JSL   L07034C
            PEI   $F4
            PEI   $F2
            _CloseDialog
            BCS   L0718C4
            LDA   #$0000
L0718C4     STAL  L020002
            LDA   #$0001
            BRA   L0718E4
L0718CD     PEI   $F4
            PEI   $F2
            _CloseDialog
            BCS   L0718DD
            LDA   #$0000
L0718DD     STAL  L020002
            LDA   #$0000
L0718E4     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L0718EE     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00DE
            TCS
            LDA   L02003A
            CMP   #$0000
            BEQ   L071908
            BCC   L071908
            LDA   #$0000
            BRA   L07190B
L071908     LDA   #$FFFF
L07190B     STA   $F0
            STZ   $EE
            STZ   $EC
            STZ   $EA
            STZ   $E8
            PEA   $0000
            JSL   L01335E
            PLY
            PEA   ^L031403
            PEA   L031403
            JSL   L0133D4
            PLY
            PLY
            LDA   $F0
            CMP   #$FFFF
            BEQ   L071933
            BRL   L071A00
L071933     PEA   $0001
            _SetSolidPenPat
            BCS   L071942
            LDA   #$0000
L071942     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $009B
            PEA   $0138
            PEA   $00A9
            _SetRect
            BCS   L071967
            LDA   #$0000
L071967     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071980
            LDA   #$0000
L071980     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $007C
            PEA   $0138
            PEA   $008B
            _SetRect
            BCS   L0719A5
            LDA   #$0000
L0719A5     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L0719BE
            LDA   #$0000
L0719BE     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $0026
            PEA   $012E
            PEA   $0062
            _SetRect
            BCS   L0719E3
            LDA   #$0000
L0719E3     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L0719FC
            LDA   #$0000
L0719FC     STAL  L020002
L071A00     PEI   $F0
            JSL   L0713B9
            PLY
L071A07     LDA   $EE
            BEQ   L071A0E
            BRL   L071EC8
L071A0E     LDA   $EC
            BNE   L071A15
            BRL   L071B27
L071A15     STZ   $EC
            PEA   ^L03140D
            PEA   L03140D
            JSL   L0133D4
            PLY
            PLY
            LDA   $F0
            CMP   #$FFFF
            BEQ   L071A2D
            BRL   L071AFA
L071A2D     PEA   $0001
            _SetSolidPenPat
            BCS   L071A3C
            LDA   #$0000
L071A3C     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $009B
            PEA   $0138
            PEA   $00A9
            _SetRect
            BCS   L071A61
            LDA   #$0000
L071A61     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071A7A
            LDA   #$0000
L071A7A     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $007C
            PEA   $0138
            PEA   $008B
            _SetRect
            BCS   L071A9F
            LDA   #$0000
L071A9F     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071AB8
            LDA   #$0000
L071AB8     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $0026
            PEA   $012E
            PEA   $0062
            _SetRect
            BCS   L071ADD
            LDA   #$0000
L071ADD     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071AF6
            LDA   #$0000
L071AF6     STAL  L020002
L071AFA     PEI   $F0
            JSL   L0713B9
            PLY
            LDA   $EA
            BEQ   L071B27
            STZ   $EA
            _DrawMenuBar
            BCS   L071B13
            LDA   #$0000
L071B13     STAL  L020002
            PEA   $0006
            PEA   $0003
            PEA   $0001
            JSL   L015D04
            PLY
            PLY
            PLY
L071B27     PEI   $F0
            JSL   L0715D4
            PLY
            STA   $F4
            LDA   $F4
            CMP   #$0013
            BCS   L071B4A
            LDA   $F0
            CMP   #$FFFF
            BNE   L071B43
            LDA   #$0001
            STA   $EC
L071B43     LDA   $F4
            STA   $F0
            BRL   L071A07
L071B4A     LDA   #$0001
            STA   $EC
            LDA   $F4
            BRL   L071EB4
L071B54     LDA   $F0
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L071B91
            JSL   L070D1D
            PEI   $F0
            JSL   L070DA0
            PLY
            JSL   L070E5B
            BRL   L071C09
L071B91     LDA   $F0
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            PHA
            JSL   L0148CF
            PLY
            LDA   $F0
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0014
            LDA   [$F6],Y
            PHA
            JSL   L01310E
            PLY
            PEA   $0006
            PEA   $0003
            PEA   $0000
            JSL   L015D04
            PLY
            PLY
            PLY
            PEI   $F0
            JSL   L070EC3
            PLY
            JSL   L070E5B
            LDA   #$0001
            STA   $EA
L071C09     BRL   L071EC5
L071C0C     PEI   $F0
            JSL   L0711F4
            PLY
            STA   $F0
            BRL   L071EC5
L071C18     PEI   $F0
            JSL   L070484
            PLY
            TAY
            BEQ   L071C4B
            PEA   ^L031AFF
            PEA   L031AFF
            LDA   $F0
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
L071C4B     BRL   L071EC5
L071C4E     LDA   #$0001
            STA   L02003C
            PEA   $0056
            PEA   $0000
            LDA   L02003A
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013EB9
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            STA   $F2
            BRA   L071CD4
L071C83     PEA   $0056
            LDA   $F2
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            PLA
            PLX
            CLC
            ADC   #$0056
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $F2
            LDX   #$0000
            PEA   $0000
            PEA   $0056
            CLC
            JSL   L013048
            LDA   #L0314F3
            LDX   #^L0314F3
            JSL   L012E77
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            INC   $F2
L071CD4     LDA   $F2
            CMP   L02003A
            BCC   L071C83
            DEC   L02003A
            LDA   L02003A
            CMP   #$0000
            BEQ   L071CED
            BCC   L071CED
            LDA   #$0000
            BRA   L071CF0
L071CED     LDA   #$FFFF
L071CF0     STA   $F0
            BRL   L071EC5
L071CF5     JSL   L0703A5
            TAY
            BNE   L071D0C
            JSL   L0717F2
            TAY
            BEQ   L071D0C
            LDA   L02003A
            SEC
            SBC   #$0001
            STA   $F0
L071D0C     BRL   L071EC5
L071D0F     PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L070F6C
            PLY
            PLY
            BRL   L071EC5
L071D21     PEA   $0002
            JSL   L070000
            PLY
            JSL   L0720DC
            TAY
            BEQ   L071D33
            BRL   L071E24
L071D33     STZ   $EC
            PEA   ^L031417
            PEA   L031417
            JSL   L0133D4
            PLY
            PLY
            PEA   $0001
            _SetSolidPenPat
            BCS   L071D50
            LDA   #$0000
L071D50     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $009B
            PEA   $0138
            PEA   $00A9
            _SetRect
            BCS   L071D75
            LDA   #$0000
L071D75     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071D8E
            LDA   #$0000
L071D8E     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $007C
            PEA   $0138
            PEA   $008B
            _SetRect
            BCS   L071DB3
            LDA   #$0000
L071DB3     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071DCC
            LDA   #$0000
L071DCC     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00F1
            PEA   $0026
            PEA   $012E
            PEA   $0062
            _SetRect
            BCS   L071DF1
            LDA   #$0000
L071DF1     STAL  L020002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _PaintRect
            BCS   L071E0A
            LDA   #$0000
L071E0A     STAL  L020002
            LDA   L02003A
            CMP   #$0000
            BEQ   L071E1D
            BCC   L071E1D
            LDA   #$0000
            BRA   L071E20
L071E1D     LDA   #$FFFF
L071E20     STA   $F0
            BRA   L071E26
L071E24     STZ   $F0
L071E26     BRL   L071EC5
L071E29     PEA   $0001
            JSL   L070000
            PLY
            JSL   L071ED8
            BRL   L071EC5
L071E38     LDA   $E8
            BEQ   L071E3F
            BRL   L071E86
L071E3F     JSL   L0A08CC
            BRL   L071E77
L071E46     LDA   #$0001
            STA   $E8
            BRL   L071E84
L071E4E     PEA   ^L031421
            PEA   L031421
            JSL   L0133D4
            PLY
            PLY
            BRL   L071E84
L071E5D     PEA   ^L031431
            PEA   L031431
            JSL   L0133D4
            PLY
            PLY
            BRL   L071E84
L071E6C     BRL   L071E84
L071E6F     DA    L071E46
            DA    L071E4E
            DA    L071E5D
            DA    L071E6C
L071E77     CMP   #$0003
            BCC   L071E7F
            LDA   #$0003
L071E7F     ASL
            TAX
            JMP   (L071E6F,X)

L071E84     BRA   L071E38
L071E86     STZ   $E8
            PEA   $0000
            JSL   L01335E
            PLY
            BRL   L071EC5
L071E93     LDA   #$0001
            STA   $EE
            BRL   L071EC5
L071E9B     BRL   L071EC5
L071E9E     DA    L071B54
            DA    L071C0C
            DA    L071C18
            DA    L071C4E
            DA    L071CF5
            DA    L071D0F
            DA    L071D21
            DA    L071E29
            DA    L071E93
            DA    L071E38
            DA    L071E9B
L071EB4     SEC
            SBC   #$0013
            CMP   #$000A
            BCC   L071EC0
            LDA   #$000A
L071EC0     ASL
            TAX
            JMP   (L071E9E,X)

L071EC5     BRL   L071A07
L071EC8     PEA   $0001
            JSL   L01335E
            PLY
            TSC
            CLC
            ADC   #$001C
            TCS
            PLD
            RTL

L071ED8     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$0029
            TCS
            PEA   $0017
            PEA   $0101
            _LoadOneTool
            BCS   L071EF5
            LDA   #$0000
L071EF5     STAL  L020002
            LDA   L02004A
            PHA
            LDX   L02004E
            LDA   L02004C
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            CLC
            ADC   #$0800
            PHA
            TXA
            ADC   #$0000
            TAX
            _SFStartUp
            BCS   L071F25
            LDA   #$0000
L071F25     STAL  L020002
            PEA   $0023
            PEA   $0032
            PEA   ^L03143E
            PEA   L03143E
            PEA   ^L03144F
            PEA   L03144F
            PEA   $000F
            PEA   $0000
            TDC
            CLC
            ADC   #$002B
            PHA
            _SFPutFile
            BCS   L071F53
            LDA   #$0000
L071F53     STAL  L020002
            _SFShutDown
            BCS   L071F63
            LDA   #$0000
L071F63     STAL  L020002
            PEA   $0017
            _UnloadOneTool
            BCS   L071F76
            LDA   #$0000
L071F76     STAL  L020002
            LDA   $2B
            BNE   L071F81
            BRL   L072049
L071F81     LDX   #$0000
            TDC
            CLC
            ADC   #$0031
            STX   $EE
            STA   $EC
            PEA   $0010
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L014421
            LDA   L020002
            STA   $F4
            CMP   #$0046
            BNE   L07200D
            LDX   #$0000
            TDC
            CLC
            ADC   #$0031
            STX   $D2
            STA   $D0
            LDA   #$00C3
            STA   $D4
            LDA   #$0005
            STA   $D6
            LDX   #$0000
            LDA   #$0000
            STX   $DA
            STA   $D8
            LDA   #$0001
            STA   $DC
            LDA   #$0000
            STA   $DE
            LDA   #$0000
            STA   $E0
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L014421
            LDA   L020002
            STA   $F4
            TAY
            BEQ   L071FF1
            BRL   L072049
L071FF1     PEA   $0010
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L014421
            LDA   L020002
            STA   $F4
            TAY
            BEQ   L07200B
            BRA   L072049
L07200B     BRA   L07201C
L07200D     LDA   $F4
            BEQ   L072015
            BRA   L072049
            BRA   L07201C
L072015     PEI   $EA
            JSL   L0722AE
            PLY
L07201C     LDA   $EA
            STA   $C2
            PEA   $0014
            PEA   $0000
            TDC
            CLC
            ADC   #$00C2
            PHA
            JSL   L014421
            LDA   L020002
            STA   $F4
            TAY
            BEQ   L07203A
            BRA   L072049
L07203A     PEA   $0000
            TDC
            CLC
            ADC   #$0031
            PHA
            JSL   L072053
            PLY
            PLY
L072049     TAY
            TSC
            CLC
            ADC   #$00D1
            TCS
            TYA
            PLD
            RTL

L072053     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D6
            TCS
            LDX   $FF
            LDA   $FD
            STX   $EC
            STA   $EA
            PEA   $0010
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L014421
            LDA   L020002
            STA   $D8
            TAY
            BEQ   L072080
            BRA   L0720D2
L072080     LDA   $E8
            STA   $DA
            LDA   #L0314F3
            LDX   #^L0314F3
            STX   $DE
            STA   $DC
            LDA   L02003A
            PHA
            LDA   #$0056
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            STX   $E2
            STA   $E0
            PEA   $0013
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            JSL   L014421
            LDA   L020002
            STA   $D8
            TAY
            BEQ   L0720BC
            BRA   L0720D2
L0720BC     PEA   $0014
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            JSL   L014421
            LDA   #$0001
            STA   L02003C
L0720D2     TAY
            TSC
            CLC
            ADC   #$0020
            TCS
            TYA
            PLD
            RTL

L0720DC     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$0037
            TCS
            LDA   L02003C
            AND   L02003A
            TAY
            BEQ   L072143
            STZ   $3B
L0720F2     LDA   $3B
            BNE   L072130
            PHA
            PEA   ^L0314BB
            PEA   L0314BB
            PEA   $0000
            PEA   $0000
            _CautionAlert
            BCS   L07210F
            LDA   #$0000
L07210F     STAL  L020002
            PLA
            STA   $39
            LDA   $39
            CMP   #$0001
            BEQ   L072129
            LDA   $39
            CMP   #$0002
            BEQ   L072129
            LDA   #$0000
            BRA   L07212C
L072129     LDA   #$0001
L07212C     STA   $3B
            BRA   L0720F2
L072130     LDA   $39
            CMP   #$0001
            BNE   L072143
            PEA   $0001
            JSL   L070000
            PLY
            JSL   L071ED8
L072143     PEA   $0017
            PEA   $0101
            _LoadOneTool
            BCS   L072155
            LDA   #$0000
L072155     STAL  L020002
            LDA   L02004A
            PHA
            LDX   L02004E
            LDA   L02004C
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            CLC
            ADC   #$0800
            PHA
            TXA
            ADC   #$0000
            TAX
            _SFStartUp
            BCS   L072185
            LDA   #$0000
L072185     STAL  L020002
            PEA   $0023
            PEA   $0032
            PEA   ^L0314DD
            PEA   L0314DD
            PEA   $0000
            PEA   $0000
            PEA   ^L0314F0
            PEA   L0314F0
            PEA   $0000
            TDC
            CLC
            ADC   #$005F
            PHA
            _SFGetFile
            BCS   L0721B6
            LDA   #$0000
L0721B6     STAL  L020002
            _SFShutDown
            BCS   L0721C6
            LDA   #$0000
L0721C6     STAL  L020002
            PEA   $0017
            _UnloadOneTool
            BCS   L0721D9
            LDA   #$0000
L0721D9     STAL  L020002
            LDA   $5F
            CMP   #$0000
            BNE   L0721EA
            LDA   #$0000
            BRL   L0722A4
L0721EA     PEA   $0000
            TDC
            CLC
            ADC   #$0065
            PHA
            JSL   L013A8B
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$004F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0055
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0065
            PHA
            JSL   L010921
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $3F
            LDA   $3F
            BEQ   L07222C
            LDA   #$0000
            BRL   L0722A4
L07222C     PEI   $53
            PEI   $51
            PEA   ^L0314F3
            PEA   L0314F3
            PEI   $55
            PEA   $0000
            TDC
            CLC
            ADC   #$0041
            PHA
            JSL   L010AB3
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STA   $3F
            LDA   $3F
            BEQ   L072267
            LDA   $55
            STA   $41
            PEA   $0014
            PEA   $0000
            TDC
            CLC
            ADC   #$0041
            PHA
            JSL   L014421
L072267     LDX   #$0000
            LDA   #$0056
            PHX
            PHA
            LDX   $53
            LDA   $51
            SEC
            JSL   L012F07
            PLY
            PLY
            STA   L02003A
            LDA   $55
            STA   $41
            PEA   $0014
            PEA   $0000
            TDC
            CLC
            ADC   #$0041
            PHA
            JSL   L014421
            LDA   L020002
            STA   $3F
            TAY
            BEQ   L07229E
            LDA   #$0000
            BRA   L0722A4
L07229E     STZ   L02003C
            LDA   #$0001
L0722A4     TAY
            TSC
            CLC
            ADC   #$00C3
            TCS
            TYA
            PLD
            RTL

L0722AE     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            LDA   $FF
            STA   $EC
            LDX   #$0000
            LDA   #$0000
            STX   $F0
            STA   $EE
            PEA   $0018
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L014421
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL


