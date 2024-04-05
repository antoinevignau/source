
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

GSOS        EQU   $E100A8

            REL

            PHA
            SEP   #$20
            LDA   #^L020004
            PHA
            PLB
            REP   #$20
            PLA
            STA   L020004
            STX   L020014
            STY   L020012
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            PHA
            _MMStartUp
            BCS   L01002B
            LDA   #$0000
L01002B     STAL  L020002
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $0100
            LDA   L020004
            PHA
            PEA   $C011
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L010051
            LDA   #$0000
L010051     STAL  L020002
            PLA
            PLX
            STX   L020018
            STA   L020016
            STX   $F6
            ORA   $F6
            BNE   L01007C
            PEA   ^L030000
            PEA   L030000
            _WriteCString
            BCS   L010075
            LDA   #$0000
L010075     STAL  L020002
            BRL   L01014A
L01007C     LDX   L020018
            LDA   L020016
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F4
            PEI   $F4
            _SANEStartUp
            LDX   L020014
            LDA   L020012
            PHX
            PHA
            JSL   L0123B2
            PLY
            PLY
            PEA   $0000
            JSL   L0141A6
            PLY
            LDA   #L0E0000
            LDX   #^L0E0000
            STX   $F2
            STA   $F0
            PEA   ^L030020
            PEA   L030020
            JSL   L013F01
            PLY
            PLY
            TAY
            BNE   L0100E1
            LDX   L02000A
            LDA   L020008
            PHX
            PHA
            LDA   L020006
            PHA
            JSL   L01047C
            PLY
            PLY
            PLY
            PHA
            JSL   L01436F
            PLY
L0100E1     LDA   L020004
            ORA   #$0F00
            PHA
            _DisposeAll
            BCS   L0100F4
            LDA   #$0000
L0100F4     STAL  L020002
            SEC
            LDA   L02000E
            SBC   #$0000
            BNE   L010109
            LDA   L020010
            SBC   #$0000
            BRA   L010111
L010109     LDA   L020010
            SBC   #$0000
            REP   #$02
L010111     BEQ   L010121
            LDX   L020010
            LDA   L02000E
            PHX
            PHA
            JSL   L013A1F
            PLY
            PLY
L010121     LDX   L020010
            LDA   L02000E
            PHA
            TXA
            STAL  L03002A
            PLA
            STAL  L030028
            LDA   L020000
            STAL  L03002C
            LDA   L02000C
            PHA
            PEA   ^L030028
            PEA   L030028
            JSL   L0133BB
            PLY
            PLY
            PLY
L01014A     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L010154     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D2
            TCS
            JSL   initCommPort	; init comm port
            PEA   $0001
            JSL   sendLDKeyLock	; lock front panel and RCU
            PLY
            PEA   $0000		; AuDio control OFF
            JSL   sendLDAudioControl
            PLY
            PEA   $0001		; video control ON
            JSL   sendLDVideoControl
            PLY
            PEA   $0000		; char display OFF
            JSL   sendLDCharDisplay
            PLY
            JSL   startLD	; SA - START
            STA   $F4
            CMP   #$0000
            BNE   L010191
            BRL   L0101E2
L010191     PEI   $F4
            PEA   ^L031C39
            PEA   L031C39
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   ^L031C52
            PEA   L031C52
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L0128FE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $F2
            LDA   $F2
            BEQ   L0101DB
            STZ   $F4
            BRA   L0101E0
L0101DB     LDA   #$0001
            STA   $F4
L0101E0     BRA   L0101E7
L0101E2     LDA   #$0002
            STA   $F4
L0101E7     LDA   $F4
            TAY
            TSC
            CLC
            ADC   #$0028
            TCS
            TYA
            PLD
            RTL

L0101F3     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000		; video off
            JSL   sendLDVideoControl
            PLY
            JSL   sendLDReject	; RJ - Reject Mode
            JSL   sendLDOpenDoor	; OP - DOOR OPEN
            PEA   $0000
            JSL   sendLDKeyLock
            PLY
            JSL   releaseCommPort
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L010222     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00DA
            TCS
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            PEA   $0000
            PEA   $0000
            PEA   ^L031C65
            PEA   L031C65
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $F0
            STA   $EE
            STX   $F6
            ORA   $F6
            BNE   L010279
            PEA   ^L031C70
            PEA   L031C70
            JSL   L050256
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L010472
L010279     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEA   $0000
            PEA   $0000
            PEA   ^L031C8F
            PEA   L031C8F
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $EC
            STA   $EA
            STX   $F6
            ORA   $F6
            BNE   L0102C5
            PEA   ^L031C9A
            PEA   L031C9A
            JSL   L050256
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L010472
L0102C5     PHX
            PHA
            PEA   ^L031BEB
            PEA   L031BEB
            _NewWindow
            BCS   L0102D9
            LDA   #$0000
L0102D9     STAL  L020002
            PLA
            PLX
            STX   $F4
            STA   $F2
            PEI   $F4
            PEI   $F2
            _SelectWindow
            BCS   L0102F3
            LDA   #$0000
L0102F3     STAL  L020002
            PEI   $F4
            PEI   $F2
            _ShowWindow
            BCS   L010307
            LDA   #$0000
L010307     STAL  L020002
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E0
            STA   $DE
            LDX   $E8
            LDA   $E6
            SEC
            SBC   #$001F
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            PEA   $74E0
            LDX   $E8
            LDA   $E6
            PHA
            LDX   L0200F4
            LDA   L0200F2
            PHX
            PHA
            PEI   $E0
            PEI   $DE
            JSL   L013C06
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BNE   L010378
            PEA   ^L031CBD
            PEA   L031CBD
            JSL   L050256
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L010472
L010378     PEA   $0000
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            PHX
            PHA
            _SetColorTable
            BCS   L010391
            LDA   #$0000
L010391     STAL  L020002
            PEA   $0000
            PEA   $000B
            PEA   $0002
            JSL   L012C5A
            PLY
            PLY
            PLY
            PEA   $BBBB
            _ClearScreen
            BCS   L0103B4
            LDA   #$0000
L0103B4     STAL  L020002
            LDX   L0200F4
            LDA   L0200F2
            PHX
            PHA
            LDX   L0200F4
            LDA   L0200F2
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $74E0
            _BlockMove
            BCS   L0103E5
            LDA   #$0000
L0103E5     STAL  L020002
            LDX   L0200F4
            LDA   L0200F2
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $00E1
            PEA   $2820
            PEA   $0000
            PEA   $74E0
            _BlockMove
            BCS   L010414
            LDA   #$0000
L010414     STAL  L020002
            PEI   $F0
            PEI   $EE
            _DisposeHandle
            BCS   L010428
            LDA   #$0000
L010428     STAL  L020002
            LDA   L020002
            STA   $DC
            TAY
            BEQ   L010443
            PEI   $DC
            PEA   ^L031CDB
            PEA   L031CDB
            JSL   L050256
            PLY
            PLY
            PLY
L010443     PEI   $EC
            PEI   $EA
            _DisposeHandle
            BCS   L010453
            LDA   #$0000
L010453     STAL  L020002
            LDA   L020002
            STA   $DC
            TAY
            BEQ   L01046E
            PEI   $DC
            PEA   ^L031D10
            PEA   L031D10
            JSL   L050256
            PLY
            PLY
            PLY
L01046E     LDX   $F4
            LDA   $F2
L010472     TAY
            TSC
            CLC
            ADC   #$0020
            TCS
            TYA
            PLD
            RTL

L01047C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            STZ   $F0
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L013F01
            PLY
            PLY
            CMP   #$0017
            BNE   L01049D
            BRL   L0108B2
L01049D     JSL   L015BA2
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $F5
            REP   #$20
            JSL   L012312
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $F4
            REP   #$20
            JSL   L01232F
            PHX
            PHA
            PEA   $0000
            PEA   $7D00
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L0104E2
            LDA   #$0000
L0104E2     STAL  L020002
            PLA
            PLX
            STX   L0200F0
            STA   L0200EE
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L010505
            PEI   $EE
            PEA   ^L031D45
            PEA   L031D45
            JSL   L050256
            PLY
            PLY
            PLY
L010505     LDX   L0200F0
            LDA   L0200EE
            PHX
            PHA
            _HLock
            BCS   L010519
            LDA   #$0000
L010519     STAL  L020002
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L010534
            PEI   $EE
            PEA   ^L031D77
            PEA   L031D77
            JSL   L050256
            PLY
            PLY
            PLY
L010534     LDX   L0200F0
            LDA   L0200EE
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STX   L0200F4
            STA   L0200F2
            LDA   #$0000
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            LDA   #$0000
            AND   #$00FF
            PHA
            JSL   L012388
            PLY
            _HideCursor
            BCS   L010570
            LDA   #$0000
L010570     STAL  L020002
            JSL   L040000
            PEA   $0000
            PEA   $0000
            JSL   L012C5A
            PLY
            PLY
            JSL   L010222
            PHA
            TXA
            STAL  L031DDC
            PLA
            STAL  L031DDA
            JSL   L012807
            PEA   $0032
            PEA   $0001
            _VDInControl
            BCS   L0105A9
            LDA   #$0000
L0105A9     STAL  L020002
            PEA   $0001
            _VDInSetStd
            BCS   L0105BC
            LDA   #$0000
L0105BC     STAL  L020002
            PEA   $0064
            PEA   $0001
            _VDKeyControl
            BCS   L0105D2
            LDA   #$0000
L0105D2     STAL  L020002
            PEA   $0010
            PEA   $0001
            _VDKeyControl
            BCS   L0105E8
            LDA   #$0000
L0105E8     STAL  L020002
            PHA
            PEA   $0008
            _VDGetFeatures
            BCS   L0105FC
            LDA   #$0000
L0105FC     STAL  L020002
            PLA
            STA   $EC
            LDA   #$0010
            SEC
            SBC   $EC
            PHA
            LDA   #$000D
            CLC
            JSL   L013B07
            LDA   #$0010
            SEC
            SBC   $EC
            PHA
            LDA   #$0002
            CLC
            JSL   L013B07
            LDA   #$0010
            SEC
            SBC   $EC
            PHA
            LDA   #$000D
            CLC
            JSL   L013B07
            _VDKeySetKCol
            BCS   L01063C
            LDA   #$0000
L01063C     STAL  L020002
            PEA   $0000
            _VDKeySetKDiss
            BCS   L01064F
            LDA   #$0000
L01064F     STAL  L020002
            LDA   #$0001
            STAL  L031DD2
            PEA   $0000
            _VDKeySetNKDiss
            BCS   L010669
            LDA   #$0000
L010669     STAL  L020002
            LDA   #$0001
            STAL  L031DD4
            LDA   #$0001
            STAL  L031DE0
            LDA   #$0000
            STAL  L031DD6
            LDX   #$0000
            LDA   #$0000
            PHA
            TXA
            STAL  L031DEC
            PLA
            STAL  L031DEA
            LDA   #$0000
            STAL  L031DEE
            LDA   #$0000
            STAL  L031DD8
            JSL   L012E00
L0106A5     LDA   $F0
            BEQ   L0106AC
            BRL   L010705
L0106AC     JSL   L010154	; init comm port and laserdisc player
            STA   $F2
            LDA   $F2
            CMP   #$0001
            BNE   L0106F7
            LDA   $F5
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            LDA   $F4
            AND   #$00FF
            PHA
            JSL   L012388
            PLY
            PEA   $0000
            PEA   $0000
            _SetMenuBar
            BCS   L0106E1
            LDA   #$0000
L0106E1     STAL  L020002
            JSL   L012BFB
            JSL   L015931
            JSL   releaseCommPort
            JSL   L01326A
            BRA   L010703
L0106F7     LDA   $F2
            CMP   #$0002
            BNE   L010703
            LDA   #$0001
            STA   $F0
L010703     BRA   L0106A5
L010705     LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _SetPort
            BCS   L01071C
            LDA   #$0000
L01071C     STAL  L020002
            PEA   $0001
            JSL   L01335E
            PLY
            JSL   L0702E0
            PHA
            _TLVersion
            BCS   L010739
            LDA   #$0000
L010739     STAL  L020002
            PLA
            STA   L020050
            LDA   L020050
            CMP   #$0208
            BEQ   L010753
            BCC   L010753
            LDA   #$001A
            STA   L020050
            BRA   L010759
L010753     LDA   #$0011
            STA   L020050
L010759     JSL   L010D24
            TAY
            BEQ   L010763
            BRL   L0107C6
L010763     LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   ^L031DB2
            PEA   L031DB2
            PEA   ^L031DA5
            PEA   L031DA5
            JSL   L0128FE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            JSL   L0101F3
            LDA   $F5
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            LDA   $F4
            AND   #$00FF
            PHA
            JSL   L012388
            PLY
            PEA   $0000
            PEA   $0000
            _SetMenuBar
            BCS   L0107B2
            LDA   #$0000
L0107B2     STAL  L020002
            JSL   L012BFB
            JSL   L015931
            JSL   releaseCommPort
            JSL   L01326A
L0107C6     PEA   ^L031DC4
            PEA   L031DC4
            JSL   L0133D4
            PLY
            PLY
            _InitCursor
            BCS   L0107DE
            LDA   #$0000
L0107DE     STAL  L020002
            LDA   #$0000
            AND   #$00FF
            PHA
            PEA   $0001
            JSL   L012C5A
            PLY
            PLY
            _DrawMenuBar
            BCS   L0107FE
            LDA   #$0000
L0107FE     STAL  L020002
            JSL   L090072
            _WaitCursor
            BCS   L010812
            LDA   #$0000
L010812     STAL  L020002
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _HideWindow
            BCS   L01082D
            LDA   #$0000
L01082D     STAL  L020002
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _CloseWindow
            BCS   L010848
            LDA   #$0000
L010848     STAL  L020002
            LDA   $F5
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            LDA   $F4
            AND   #$00FF
            PHA
            JSL   L012388
            PLY
            PEA   $0000
            PEA   $0000
            _SetMenuBar
            BCS   L010874
            LDA   #$0000
L010874     STAL  L020002
            PEA   $0000
            _VDKeySetKDiss
            BCS   L010887
            LDA   #$0000
L010887     STAL  L020002
            PEA   $0000
            _VDKeySetNKDiss
            BCS   L01089A
            LDA   #$0000
L01089A     STAL  L020002
            JSL   L0101F3
            _InitCursor
            BCS   L0108AE
            LDA   #$0000
L0108AE     STAL  L020002
L0108B2     JSL   L012BFB
            JSL   L015931
            JSL   L01326A
            TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L0108C6     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L011459
            PEA   L011459
            _DelHeartBeat
            BCS   L0108E3
            LDA   #$0000
L0108E3     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0108EF     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D6
            TCS
            LDA   L0200CC
            STA   $D8
            LDX   #$0000
            LDA   #$0000
            STX   $DC
            STA   $DA
            PEA   $0016
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L014421
            TSC
            CLC
            ADC   #$0024
            TCS
            PLD
            RTL

L010921     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$005C
            TCS
            LDA   #$0001
            STA   $5E
            LDX   #$0000
            TDC
            CLC
            ADC   #$0068
            STX   $62
            STA   $60
            PEA   $000A
            PEA   $0000
            TDC
            CLC
            ADC   #$005E
            PHA
            JSL   L014421
            LDA   L020002
            STA   $66
            TAY
            BEQ   L01095A
            LDA   $66
            BRL   L010AA9
L01095A     PEI   $F7
            PEI   $F5
            PEA   $0000
            TDC
            CLC
            ADC   #$00A9
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00A9
            PHA
            JSL   L013A1F
            PLY
            PLY
            LDX   #$0000
            TDC
            CLC
            ADC   #$00A9
            LDY   #$0004
            PHA
            TXA
            STA   [$F9],Y
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDA   L020048
            BNE   L0109BA
            PEA   ^L033DF2
            PEA   L033DF2
            PEI   $F7
            PEI   $F5
            JSL   L014120
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L0109BA
            JSL   L0108EF
            LDA   L0200CC
            STA   [$F9]
            BRA   L0109C5
L0109BA     PEA   $0010
            PEI   $FB
            PEI   $F9
            JSL   L014421
L0109C5     LDA   L020002
            STA   $66
            CMP   #$0045
            BEQ   L0109D2
            BRL   L010A5E
L0109D2     _InitCursor
            BCS   L0109DE
            LDA   #$0000
L0109DE     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L033DFD
            PEA   L033DFD
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PEA   ^L033E0B
            PEA   L033E0B
            PEA   ^L033E0E
            PEA   L033E0E
            _TLMountVolume
            BCS   L010A10
            LDA   #$0000
L010A10     STAL  L020002
            PLA
            STA   $64
            _HideCursor
            BCS   L010A23
            LDA   #$0000
L010A23     STAL  L020002
            _ShowCursor
            BCS   L010A33
            LDA   #$0000
L010A33     STAL  L020002
            LDA   $64
            CMP   #$0001
            BNE   L010A4B
            PEA   $0010
            PEI   $FB
            PEI   $F9
            JSL   L014421
            BRA   L010A5B
L010A4B     PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L010A5B     BRL   L0109C5
L010A5E     LDA   $66
            BEQ   L010A67
            LDA   $66
            BRL   L010AA9
L010A67     LDA   [$F9]
            STA   [$FD]
            PEA   $0019
            PEI   $FF
            PEI   $FD
            JSL   L014421
            LDA   L020002
            STA   $66
            TAY
            BEQ   L010A82
            LDA   $66
            BRA   L010AA9
L010A82     LDA   L020048
            BEQ   L010AA6
            PEA   ^L033E15
            PEA   L033E15
            PEI   $F7
            PEI   $F5
            JSL   L014120
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L010AA6
            LDA   [$F9]
            STA   L0200CC
            STZ   L020048
L010AA6     LDA   #$0000
L010AA9     TAY
            TSC
            CLC
            ADC   #$0092
            TCS
            TYA
            PLD
            RTL

L010AB3     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E4
            TCS
            LDA   $F7
            STA   [$F3]
            LDX   $FB
            LDA   $F9
            LDY   #$0004
            PHA
            TXA
            STA   [$F3],Y
            PLA
            LDY   #$0002
            STA   [$F3],Y
            LDX   $FF
            LDA   $FD
            LDY   #$0008
            PHA
            TXA
            STA   [$F3],Y
            PLA
            LDY   #$0006
            STA   [$F3],Y
            PEA   $0012
            PEI   $F5
            PEI   $F3
            JSL   L014421
            LDA   L020002
            STA   $E6
            TAY
            BEQ   L010AFB
            LDA   $E6
            BRA   L010B21
L010AFB     LDY   #$000C
            LDA   [$F3],Y
            TAX
            LDY   #$000A
            LDA   [$F3],Y
            PHX
            PHA
            LDY   #$0008
            LDA   [$F3],Y
            TAX
            LDY   #$0006
            LDA   [$F3],Y
            JSL   L013333
            BEQ   L010B1E
            LDA   #$0001
            BRA   L010B21
L010B1E     LDA   #$0000
L010B21     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L010B2B     PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00AE
            TCS
            SEC
            LDA   $F9
            SBC   $FD
            BNE   L010B43
            LDA   $FB
            SBC   $FF
            BRA   L010B49
L010B43     LDA   $FB
            SBC   $FF
            REP   #$02
L010B49     BEQ   L010B56
            BCC   L010B56
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010B56     PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEI   $EF
            PEI   $ED
            JSL   L010921
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $C2
            LDA   $C2
            BEQ   L010B87
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010B87     LDA   $F9
            CMP   $FD
            BNE   L010BAB
            LDA   $FB
            CMP   $FF
            BNE   L010BAB
            LDA   $F9
            CMP   #$0000
            BNE   L010BAB
            LDA   $FB
            CMP   #$0000
            BNE   L010BAB
            LDX   $D6
            LDA   $D4
            STX   $B8
            STA   $B6
            BRA   L010BBC
L010BAB     LDX   $FF
            LDA   $FD
            SEC
            SBC   $F9
            PHA
            TXA
            SBC   $FB
            TAX
            PLA
            STX   $B8
            STA   $B6
L010BBC     LDX   $F7
            LDA   $F5
            STX   $E2
            ORA   $E2
            BEQ   L010BD4
            LDX   $D6
            LDA   $D4
            LDY   #$0002
            PHA
            TXA
            STA   [$F5],Y
            PLA
            STA   [$F5]
L010BD4     LDX   $F3
            LDA   $F1
            STX   $E2
            ORA   $E2
            BEQ   L010BE8
            LDX   $F3
            LDA   $F1
            STX   $BC
            STA   $BA
            BRA   L010C53
L010BE8     PHX
            PHA
            PEI   $B8
            PEI   $B6
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L010C07
            LDA   #$0000
L010C07     STAL  L020002
            PLA
            PLX
            STX   $C0
            STA   $BE
            LDA   L020002
            STA   $C2
            TAY
            BEQ   L010C22
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010C22     PEI   $C0
            PEI   $BE
            _HLock
            BCS   L010C32
            LDA   #$0000
L010C32     STAL  L020002
            LDA   L020002
            STA   $C2
            TAY
            BEQ   L010C47
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010C47     LDY   #$0002
            LDA   [$BE],Y
            TAX
            LDA   [$BE]
            STX   $BC
            STA   $BA
L010C53     SEC
            LDA   $F9
            SBC   #$0000
            BNE   L010C62
            LDA   $FB
            SBC   #$0000
            BRA   L010C69
L010C62     LDA   $FB
            SBC   #$0000
            REP   #$02
L010C69     BEQ   L010C98
            LDA   $D8
            STA   $B0
            LDX   $FB
            LDA   $F9
            STX   $B4
            STA   $B2
            PEA   $0016
            PEA   $0000
            TDC
            CLC
            ADC   #$00B0
            PHA
            JSL   L014421
            LDA   L020002
            STA   $C2
            TAY
            BEQ   L010C98
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010C98     LDX   $B8
            LDA   $B6
            PHX
            PHA
            PEI   $BC
            PEI   $BA
            LDA   $D8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00C4
            PHA
            JSL   L010AB3
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STA   $C2
            LDA   $C2
            BEQ   L010CC9
            LDX   #$0000
            LDA   #$0000
            BRL   L010D1A
L010CC9     PEA   ^L033E20
            PEA   L033E20
            PEI   $EF
            PEI   $ED
            JSL   L014120
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BEQ   L010CF4
            LDA   $D8
            STA   $C4
            PEA   $0014
            PEA   $0000
            TDC
            CLC
            ADC   #$00C4
            PHA
            JSL   L014421
L010CF4     LDA   L020002
            STA   $C2
            TAY
            BEQ   L010D04
            LDX   #$0000
            LDA   #$0000
            BRA   L010D1A
L010D04     LDX   $F3
            LDA   $F1
            STX   $E2
            ORA   $E2
            BNE   L010D16
            LDX   $C0
            LDA   $BE
            BRA   L010D1A
            BRA   L010D1A
L010D16     LDX   $BC
            LDA   $BA
L010D1A     TAY
            TSC
            CLC
            ADC   #$0038
            TCS
            TYA
            PLD
            RTL

L010D24     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D4
            TCS
            PEA   ^L033E2B
            PEA   L033E2B
            JSL   L050269
            PLY
            PLY
            LDA   #$00D8
            STA   L0200CE
            PEA   ^L011459
            PEA   L011459
            _SetHeartBeat
            BCS   L010D53
            LDA   #$0000
L010D53     STAL  L020002
            STZ   $F0
            BRL   L011368
L010D5C     LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            BNE   L010D84
            BRL   L011254
L010D84     LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0014
            LDA   [$F6],Y
            TAX
            LDY   #$0012
            LDA   [$F6],Y
            STX   $E8
            STA   $E6
            PEA   $0000
            PEA   $0011
            PEA   $0000
            PEA   $0000
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            STX   $F6
            ORA   $F6
            BNE   L010E42
            LDA   #$0000
            BRL   L01144F
L010E42     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$0007
            LDA   [$F6],Y
            BEQ   L010E5A
            LDA   #$0005
            BRA   L010E5D
L010E5A     LDA   #$0007
L010E5D     PHA
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$0005
            LDA   [$F6],Y
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            STX   $EC
            STA   $EA
            PEI   $F4
            PEI   $F2
            _HUnlock
            BCS   L010E8C
            LDA   #$0000
L010E8C     STAL  L020002
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            _SetHandleSize
            BCS   L010EB1
            LDA   #$0000
L010EB1     STAL  L020002
            PEI   $F4
            PEI   $F2
            _HLock
            BCS   L010EC5
            LDA   #$0000
L010EC5     STAL  L020002
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$000B
            LDA   [$F6],Y
            TAX
            LDY   #$0009
            LDA   [$F6],Y
            CLC
            ADC   $EA
            PHA
            TXA
            ADC   $EC
            TAX
            PLA
            PHX
            PHA
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$000B
            LDA   [$F6],Y
            TAX
            LDY   #$0009
            LDA   [$F6],Y
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $E0
            STA   $DE
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STX   $DC
            STA   $DA
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$000B
            LDA   [$F6],Y
            TAX
            LDY   #$0009
            LDA   [$F6],Y
            CLC
            ADC   $EA
            PHA
            TXA
            ADC   $EC
            TAX
            PLA
            STX   $D8
            STA   $D6
            LDX   $DC
            LDA   $DA
            SEC
            SBC   $D6
            PHA
            TXA
            SBC   $D8
            TAX
            PLA
            STX   $DC
            STA   $DA
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDX   $DC
            LDA   $DA
            CLC
            JSL   L012F07
            PLY
            PLY
            PHA
            LDA   #$0001
            PLX
            STX   $FA
            CLC
            ADC   $FA
            LDY   #$0004
            STA   [$E6],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$E6],Y
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L011017
            LDA   #$0000
L011017     STAL  L020002
            PLA
            PLX
            STX   $E4
            STA   $E2
            PEI   $E4
            PEI   $E2
            _HLock
            BCS   L011031
            LDA   #$0000
L011031     STAL  L020002
            LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            LDY   #$0008
            PHA
            TXA
            STA   [$E6],Y
            PLA
            LDY   #$0006
            STA   [$E6],Y
            LDY   #$0008
            LDA   [$E6],Y
            TAX
            LDY   #$0006
            LDA   [$E6],Y
            STA   $F6
            STX   $F8
            LDX   #$0000
            LDA   #$0011
            LDY   #$0002
            PHA
            TXA
            STA   [$F6],Y
            PLA
            STA   [$F6]
            LDY   #$0004
            LDA   [$E6],Y
            SEC
            SBC   #$0001
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$000B
            LDA   [$F6],Y
            TAX
            LDY   #$0009
            LDA   [$F6],Y
            CLC
            ADC   $EA
            PHA
            TXA
            ADC   $EC
            TAX
            PLA
            JSL   L012E77
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDY   #$000B
            LDA   [$F6],Y
            TAX
            LDY   #$0009
            LDA   [$F6],Y
            CLC
            ADC   $EA
            PHA
            TXA
            ADC   $EC
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            LDY   #$0008
            LDA   [$E6],Y
            TAX
            LDY   #$0006
            LDA   [$E6],Y
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $E0
            STA   $DE
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            LDY   #$0002
            PHA
            TXA
            STA   [$E6],Y
            PLA
            STA   [$E6]
            LDA   #$FFFF
            LDY   #$000A
            STA   [$E6],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$000E
            PHA
            TXA
            STA   [$E6],Y
            PLA
            LDY   #$000C
            STA   [$E6],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0012
            PHA
            TXA
            STA   [$E6],Y
            PLA
            LDY   #$0010
            STA   [$E6],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0016
            PHA
            TXA
            STA   [$E6],Y
            PLA
            LDY   #$0014
            STA   [$E6],Y
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            ORA   #$0080
            SEP   #$20
            STA   [$F6]
            REP   #$20
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            STA   $F6
            STX   $F8
            LDX   $F4
            LDA   $F2
            LDY   #$0002
            PHA
            TXA
            STA   [$F6],Y
            PLA
            STA   [$F6]
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            LDX   $E8
            LDA   $E6
            PHX
            PHA
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$000F
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$000D
            STA   [$F6],Y
            BRL   L011366
L011254     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            STX   $F6
            ORA   $F6
            BNE   L0112E2
            LDA   #$0000
            BRL   L01144F
L0112E2     LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
            STA   $F6
            STX   $F8
            LDX   $F4
            LDA   $F2
            LDY   #$0002
            PHA
            TXA
            STA   [$F6],Y
            PLA
            STA   [$F6]
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            LDA   $F0
            PHA
            LDA   #$0016
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L033D50
            LDX   #^L033D50
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
L011366     INC   $F0
L011368     LDA   $F0
            CMP   #$0007
            BCS   L011372
            BRL   L010D5C
L011372     LDX   #$0000
            LDA   #$001C
            PHX
            PHA
            LDA   #L033DD4
            LDX   #^L033DD4
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            TAX
            LDY   #$000E
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            CLC
            JSL   L012F07
            PLY
            PLY
            STAL  L031DDE
            JSL   L015AD2
            LDX   L02007E
            LDA   L02007C
            STA   $F6
            STX   $F8
            LDY   #$000F
            LDA   [$F6],Y
            TAX
            LDY   #$000D
            LDA   [$F6],Y
            PHX
            PHA
            LDX   L02007E
            LDA   L02007C
            JSL   L012E77
            PLA
            PLX
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   L02007E
            LDA   L02007C
            STA   $F6
            STX   $F8
            LDY   #$000F
            LDA   [$F6],Y
            TAX
            LDY   #$000D
            LDA   [$F6],Y
            PHX
            PHA
            LDX   L02007E
            LDA   L02007C
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            JSL   L015862
            PLY
            PLY
            PLY
            PEA   ^L033E35
            PEA   L033E35
            JSL   L0133D4
            PLY
            PLY
            LDA   L020076
            SEC
            SBC   #$00D8
            BEQ   L011427
            BVS   L011425
            EOR   #$8000
L011425     BMI   L011448
L011427     JSL   L0108C6
            LDA   #$00D8
            STAL  L033DF0
            PEA   ^L033DEA
            PEA   L033DEA
            _PaintRect
            BCS   L011444
            LDA   #$0000
L011444     STAL  L020002
L011448     JSL   L0502BC
            LDA   #$0001
L01144F     TAY
            TSC
            CLC
            ADC   #$0026
            TCS
            TYA
            PLD
            RTL

L011459     ADRL  $00000000
L01145D     DW    $000A
            DW    $A55A
            PHD
            PHP
            REP   #$30
            JSL   L01146C
            PLP
            PLD
            RTL

L01146C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PHB
            LDA   #^L020002
            PHA
            PLB
            PLA
            PEA   $0001
            PEA   $0001
            _SetPenSize
            BCS   L011490
            LDA   #$0000
L011490     STAL  L020002
            PEA   $0001
            _SetSolidPenPat
            BCS   L0114A3
            LDA   #$0000
L0114A3     STAL  L020002
            LDA   L020076
            STAL  L033DF0
            LDA   L020076
            CLC
            ADC   #$0001
            STA   L020076
            LDAL  L033DF0
            SEC
            SBC   #$00D8
            BVS   L0114C5
            EOR   #$8000
L0114C5     BPL   L0114D4
            LDA   #$00D8
            STAL  L033DF0
            JSL   L0108C6
            BRA   L011512
L0114D4     LDA   L020076
            SEC
            SBC   L0200CE
            BEQ   L0114E4
            BVS   L0114E2
            EOR   #$8000
L0114E2     BMI   L0114FC
L0114E4     PEA   ^L033DEA
            PEA   L033DEA
            _PaintRect
            BCS   L0114F6
            LDA   #$0000
L0114F6     STAL  L020002
            BRA   L011502
L0114FC     LDA   L0200CE
            STA   L020076
L011502     LDA   #$0014
            SEP   #$20
            STAL  L01145D
            REP   #$20
            LDA   $04,S
            PHA
            PLB
            PLB
L011512     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L01151A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0011
            STA   $EE
            LDA   #$00EE
            STA   $F0
            LDA   #$0000
            STA   $F4
            STA   $F2
            STZ   $EC
            BRL   L0115F9
L01153B     PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEA   ^L033E5F
            PEA   L033E5F
            PEA   $0001
            LDA   $EC
            CMP   L0200D0
            BNE   L011566
            LDA   #$0001
            BRA   L011569
L011566     LDA   #$0000
L011569     PHA
            PEA   $0000
            PEA   $0000
            PEA   $0400
            PEA   $0000
            LDA   #$000D
            SEC
            SBC   $EC
            LDX   #$0000
            PHX
            PHA
            PEA   ^L033E57
            PEA   L033E57
            _NewControl
            BCS   L011593
            LDA   #$0000
L011593     STAL  L020002
            LDA   $EC
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033E92
            LDX   #^L033E92
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
            LDA   $EC
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033E92
            LDX   #^L033E92
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
            BCS   L0115EB
            LDA   #$0000
L0115EB     STAL  L020002
            LDA   $EE
            CLC
            ADC   #$000B
            STA   $EE
            INC   $EC
L0115F9     LDA   $EC
            CMP   #$000D
            BCS   L011603
            BRL   L01153B
L011603     TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L01160B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$000D
            SEC
            SBC   L0200D0
            PHA
            PEA   ^L033E60
            PEA   L033E60
            PEA   ^L033EC6
            PEA   L033EC6
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   ^L033EC6
            PEA   L033EC6
            JSL   L0133D4
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L011647     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            LDA   L0200D0
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033E92
            LDX   #^L033E92
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
            LDA   L0200D0
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L033E92
            LDX   #^L033E92
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
            BCS   L0116BC
            LDA   #$0000
L0116BC     STAL  L020002
            LDY   #$0002
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
            BCS   L0116E4
            LDA   #$0000
L0116E4     STAL  L020002
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
            PHA
            LDA   #$000D
            PLX
            STX   $F4
            SEC
            SBC   $F4
            STA   L0200D0
            _WaitCursor
            BCS   L011718
            LDA   #$0000
L011718     STAL  L020002
            PEA   ^L033E6D
            PEA   L033E6D
            JSL   L0133D4
            PLY
            PLY
            JSL   L01160B
            PEA   ^L033E77
            PEA   L033E77
            JSL   L0133D4
            PLY
            PLY
            _InitCursor
            BCS   L011744
            LDA   #$0000
L011744     STAL  L020002
            TSC
            CLC
            ADC   #$0008
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

L01175E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$000D
            SEC
            SBC   L0200D0
            PHA
            PEA   ^L033E83
            PEA   L033E83
            PEA   ^L033EE6
            PEA   L033EE6
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   ^L033EE6
            PEA   L033EE6
            JSL   L0133D4
            PLY
            PLY
            LDA   #$0000
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01179F     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$000D
            SEC
            SBC   L0200D0
            PHA
            PEA   ^L033E8A
            PEA   L033E8A
            PEA   ^L033F06
            PEA   L033F06
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   ^L033F06
            PEA   L033F06
            JSL   L0133D4
            PLY
            PLY
            LDA   #$0000
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0117E0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0200DC
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0117F6     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   #L03778B
            LDX   #^L03778B
            STX   $F0
            STA   $EE
L01180B     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STX   $F2
            ORA   $F2
            BEQ   L011844
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDY   #$0008
            LDA   [$EE],Y
            TAX
            LDY   #$0006
            LDA   [$EE],Y
            JSL   L013333
            BNE   L011836
            LDX   $F0
            LDA   $EE
            BRA   L01184A
L011836     LDA   $EE
            CLC
            ADC   #$000A
            STA   $EE
            BCC   L011842
            INC   $F0
L011842     BRA   L01180B
L011844     LDX   #$0000
            LDA   #$0000
L01184A     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L011854     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200DC
            BRL   L0118E4
L011865     PEA   ^L037853
            PEA   L037853
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L011874     PEA   ^L03785F
            PEA   L03785F
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L011883     PEA   ^L03786B
            PEA   L03786B
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L011892     PEA   ^L037877
            PEA   L037877
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L0118A1     PEA   ^L037883
            PEA   L037883
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L0118B0     PEA   ^L03788F
            PEA   L03788F
            JSL   L0133D4
            PLY
            PLY
            BRL   L0118F1
L0118BF     BRL   L0118F1
L0118C2     DA    L011865
            DA    L011865
            DA    L011865
            DA    L011865
            DA    L011865
            DA    L011865
            DA    L011865
            DA    L011874
            DA    L011883
            DA    L011883
            DA    L011892
            DA    L011892
            DA    L011892
            DA    L0118A1
            DA    L0118A1
            DA    L0118B0
            DA    L0118BF
L0118E4     CMP   #$0010
            BCC   L0118EC
            LDA   #$0010
L0118EC     ASL
            TAX
            JMP   (L0118C2,X)

L0118F1     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0118F9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0117F6
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDY   #$0004
            LDA   [$EE],Y
            CMP   L0200DC
            BNE   L011921
            INC   L0200DC
            BRA   L011925
L011921     JSL   L011854
L011925     LDA   L0200DC
            CMP   #$000F
            BEQ   L011942
            BCC   L011942
            PEA   ^L03789B
            PEA   L03789B
            JSL   L0133D4
            PLY
            PLY
            LDA   #$0031
            BRA   L011945
            BRA   L011945
L011942     LDA   #$0030
L011945     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L01194F     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0200DC
            CMP   #$000F
            BEQ   L011969
            BCC   L011969
            LDA   #$0001
            BRA   L01196C
L011969     LDA   #$0000
L01196C     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L011976     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDA   #L03778B
            LDX   #^L03778B
            STX   $F4
            STA   $F2
            _WaitCursor
            BCS   L011997
            LDA   #$0000
L011997     STAL  L020002
L01199B     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STX   $F6
            ORA   $F6
            BNE   L0119AC
            BRL   L011A21
L0119AC     LDY   #$0004
            LDA   [$F2],Y
            CMP   L0200DC
            BCS   L0119F8
            LDY   #$0008
            LDA   [$F2],Y
            TAX
            LDY   #$0006
            LDA   [$F2],Y
            STX   $F6
            ORA   $F6
            BEQ   L0119F8
            LDY   #$0008
            LDA   [$F2],Y
            TAX
            LDY   #$0006
            LDA   [$F2],Y
            PHX
            PHA
            JSL   L012A2D
            PLY
            PLY
            STX   $F0
            STA   $EE
            STX   $F6
            ORA   $F6
            BEQ   L0119F8
            PEI   $F0
            PEI   $EE
            _DisposeControl
            BCS   L0119F4
            LDA   #$0000
L0119F4     STAL  L020002
L0119F8     LDY   #$0004
            LDA   [$F2],Y
            CMP   L0200DC
            BCC   L011A12
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            JSL   L0133D4
            PLY
            PLY
L011A12     LDA   $F2
            CLC
            ADC   #$000A
            STA   $F2
            BCC   L011A1E
            INC   $F4
L011A1E     BRL   L01199B
L011A21     _InitCursor
            BCS   L011A2D
            LDA   #$0000
L011A2D     STAL  L020002
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L011A39     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRL   L011AC6
L011A49     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            CMP   #$0001
            BNE   L011AC4
            LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
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
            JSL   L0133D4
            PLY
            PLY
L011AC4     INC   $F4
L011AC6     LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   $F4
            BEQ   L011ADB
            BCC   L011ADB
            BRL   L011A49
L011ADB     LDA   #L037A96
            LDX   #^L037A96
            PHX
            PHA
            LDX   L0200E2
            LDA   L0200E0
            JSL   L013333
            BEQ   L011AF2
            BRL   L011B92
L011AF2     LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0036
            LDA   [$F6],Y
            PHA
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            PLX
            STX   $F6
            CMP   $F6
            BEQ   L011B42
            PEA   ^L037C86
            PEA   L037C86
            JSL   L0133D4
            PLY
            PLY
L011B42     LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0044
            LDA   [$F6],Y
            PHA
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0060
            LDA   [$F6],Y
            PLX
            STX   $F6
            CMP   $F6
            BEQ   L011B92
            PEA   ^L037C8E
            PEA   L037C8E
            JSL   L0133D4
            PLY
            PLY
L011B92     LDA   #L037BA1
            LDX   #^L037BA1
            PHX
            PHA
            LDX   L0200E2
            LDA   L0200E0
            JSL   L013333
            BNE   L011BF6
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0028
            LDA   [$F6],Y
            PHA
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$0036
            LDA   [$F6],Y
            PLX
            STX   $F6
            CMP   $F6
            BEQ   L011BF6
            PEA   ^L037C96
            PEA   L037C96
            JSL   L0133D4
            PLY
            PLY
L011BF6     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L011BFE     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   #$0000
            LDA   #$0000
            STX   L0200EA
            STA   L0200E8
            STX   L0200E6
            STA   L0200E4
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L011C23     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRA   L011C72
L011C32     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L011C70
            LDA   #$0000
            BRA   L011C87
L011C70     INC   $F4
L011C72     LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   $F4
            BEQ   L011C84
            BCS   L011C32
L011C84     LDA   #$0001
L011C87     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L011C91     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDX   $FF
            LDA   $FD
            STX   L0200E6
            STA   L0200E4
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L011CAE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDX   $FF
            LDA   $FD
            STX   L0200EA
            STA   L0200E8
            SEC
            LDA   L0200E4
            SBC   L0200E8
            BNE   L011CD4
            LDA   L0200E6
            SBC   L0200EA
            BRA   L011CDC
L011CD4     LDA   L0200E6
            SBC   L0200EA
            REP   #$02
L011CDC     BEQ   L011D00
            BCC   L011D00
            LDX   L0200E6
            LDA   L0200E4
            STX   $EE
            STA   $EC
            LDX   L0200EA
            LDA   L0200E8
            STX   L0200E6
            STA   L0200E4
            LDX   $EE
            LDA   $EC
            STX   L0200EA
            STA   L0200E8
L011D00     STZ   $F0
            BRL   L011DCE
L011D05     LDX   L0200E6
            LDA   L0200E4
            PHX
            PHA
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            TAX
            LDY   #$0002
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L013333
            BEQ   L011D4D
            BRL   L011DCC
L011D4D     LDX   L0200EA
            LDA   L0200E8
            PHX
            PHA
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            TAX
            LDY   #$0002
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0006
            LDA   [$F2],Y
            TAX
            LDY   #$0004
            LDA   [$F2],Y
            JSL   L013333
            BNE   L011DCC
            LDA   $F0
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            TAX
            LDY   #$0002
            LDA   [$F2],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   #$0001
            LDY   #$000C
            STA   [$F2],Y
L011DCC     INC   $F0
L011DCE     LDX   L0200E2
            LDA   L0200E0
            STA   $F2
            STX   $F4
            LDA   [$F2]
            CMP   $F0
            BEQ   L011DE3
            BCC   L011DE3
            BRL   L011D05
L011DE3     TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

L011DEB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDX   L0200E6
            LDA   L0200E4
            STX   $F2
            ORA   $F2
            BNE   L011E09
            LDA   #$0035
            BRA   L011E0C
            BRA   L011E0C
L011E09     LDA   #$0036
L011E0C     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L011E16     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E4
            TCS
            LDX   L0200E2
            LDA   L0200E0
            STA   $F2
            STX   $F4
            LDY   #$0008
            LDA   [$F2],Y
            TAX
            LDY   #$0006
            LDA   [$F2],Y
            STX   $F0
            STA   $EE
            LDX   $FF
            LDA   $FD
            SEC
            SBC   #$0035
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $EC
            LDA   $EC
            LDX   #$0000
            PEA   $0000
            PEA   $0006
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            STA   $EA
            LDA   $EC
            LDX   #$0000
            PEA   $0000
            PEA   $0006
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STA   $E8
            LDA   $EC
            LDX   #$0000
            PEA   $0000
            PEA   $0006
            CLC
            JSL   L013048
            LDX   $F0
            LDA   $EE
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0004
            LDA   [$F2],Y
            STA   $E6
            PEI   $E6
            PEI   $E8
            LDA   #$0002
            PHA
            LDA   $E8
            CLC
            JSL   L012E82
            PLA
            TAY
            BEQ   L011EF2
            LDA   $EA
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$000E
            LDA   [$F2],Y
            TAX
            LDY   #$000C
            LDA   [$F2],Y
            BRA   L011F18
L011EF2     LDA   $EA
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
L011F18     PHX
            PHA
            LDA   $EA
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0006
            LDA   [$F2],Y
            TAX
            LDY   #$0004
            LDA   [$F2],Y
            PHX
            PHA
            JSL   L012AB8
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

L011F56     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E8
            TCS
            PHX
            PHA
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L011F83
            LDA   #$0000
L011F83     STAL  L020002
            PLA
            PLX
            STX   $EE
            STA   $EC
            LDA   L020002
            STA   $EA
            TAY
            BEQ   L011F9D
            LDX   #$0000
            LDA   #$0000
            BRA   L012001
L011F9D     PEI   $EE
            PEI   $EC
            _HLock
            BCS   L011FAD
            LDA   #$0000
L011FAD     STAL  L020002
            LDA   L020002
            STA   $EA
            TAY
            BEQ   L011FC1
            LDX   #$0000
            LDA   #$0000
            BRA   L012001
L011FC1     PEI   $FD
            PEI   $FB
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            PHX
            PHA
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            _BlockMove
            BCS   L011FE2
            LDA   #$0000
L011FE2     STAL  L020002
            PEI   $FF
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            PHX
            PHA
            JSL   L0C0000
            PLY
            PLY
            PLY
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
L012001     TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L01200B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   L0200DE
            BEQ   L01201E
            BRL   L0121ED
L01201E     STZ   $F4
            BRL   L0121DD
L012023     LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDAL  L031DE8
            TAX
            LDAL  L031DE6
            LDY   #$0006
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0004
            STA   [$F6],Y
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            PHX
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0008
            STA   [$F6],Y
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            JSL   L011F56
            PLY
            PLY
            PLY
            PHX
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
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
            INC   $F4
L0121DD     LDA   $F4
            CMP   #$0005
            BCS   L0121E7
            BRL   L012023
L0121E7     LDA   #$0001
            STA   L0200DE
L0121ED     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L0121F5     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRL   L01229B
L012205     PHX
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
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
            _FindHandle
            BCS   L01223B
            LDA   #$0000
L01223B     STAL  L020002
            _DisposeHandle
            BCS   L01224B
            LDA   #$0000
L01224B     STAL  L020002
            PHX
            PHA
            LDA   $F4
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037CC0
            LDX   #^L037CC0
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$000E
            LDA   [$F6],Y
            TAX
            LDY   #$000C
            LDA   [$F6],Y
            PHX
            PHA
            _FindHandle
            BCS   L012285
            LDA   #$0000
L012285     STAL  L020002
            _DisposeHandle
            BCS   L012295
            LDA   #$0000
L012295     STAL  L020002
            INC   $F4
L01229B     LDA   $F4
            CMP   #$0005
            BCS   L0122A5
            BRL   L012205
L0122A5     STZ   L0200DE
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L0122B0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRA   L0122F8
L0122BF     LDA   $F4
            LDX   #$0000
            PEA   $0000
            PEA   $000E
            CLC
            JSL   L013048
            LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            TAX
            LDY   #$0002
            LDA   [$F6],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$000C
            STA   [$F6],Y
            INC   $F4
L0122F8     LDX   L0200E2
            LDA   L0200E0
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   $F4
            BEQ   L01230A
            BCS   L0122BF
L01230A     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L012312     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDAL  $01C022
            STA   $F4
            LDA   $F4
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L01232F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            _TLStartUp
            BCS   L012346
            LDA   #$0000
L012346     STAL  L020002
            JSL   L012825
            PHA
            _MMStartUp
            BCS   L01235B
            LDA   #$0000
L01235B     STAL  L020002
            PLA
            STA   L02004A
            LDA   L02004A
            ORA   #$0100
            STA   L02004A
            _MTStartUp
            BCS   L012378
            LDA   #$0000
L012378     STAL  L020002
            JSL   L015130
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012388     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            AND   #$00FF
            AND   #$000F
            STA   $F2
            LDAL  $01C022
            AND   #$FFF0
            ORA   $F2
            STAL  $01C022
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L0123B2     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00DF
            TCS
            STZ   $EF
            STZ   L020006
            LDA   $FD
            CMP   #$0000
            BNE   L0123D9
            LDA   $FF
            CMP   #$0000
            BNE   L0123D9
            LDA   #$0001
            STA   L0200F8
            BRL   L0127FD
L0123D9     LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0008
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E9
            STA   $E7
            LDA   [$E7]
            SEP   #$20
            STA   $F1
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   [$E7]
            REP   #$20
            PEA   $0001
            PEA   ^L037F63
            PEA   L037F63
            PEI   $FF
            PEI   $FD
            JSL   L012B09
            PLY
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L012427
            LDA   #$0001
            STA   L0200F8
            LDA   $F1
            SEP   #$20
            STA   [$E7]
            REP   #$20
            BRL   L0127FD
L012427     STZ   L0200F8
            LDA   $F1
            SEP   #$20
            STA   [$E7]
            REP   #$20
            PHX
            PHA
            PEA   $0000
            PEA   $0100
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L012456
            LDA   #$0000
L012456     STAL  L020002
            PLA
            PLX
            STX   $ED
            STA   $EB
            LDA   L020002
            BEQ   L01246D
            PEA   $FFFF
            JSL   L01326A
            PLY
L01246D     LDA   #$0100
            STA   $E1
L012472     LDA   [$E7]
            AND   #$00FF
            CMP   #$0000
            BNE   L01247F
            BRL   L0126DD
L01247F     INC   L020006
            LDA   [$E7]
            AND   #$00FF
            CMP   #$0022
            BEQ   L01248F
            BRL   L0125B6
L01248F     INC   $E7
            BNE   L012495
            INC   $E9
L012495     LDA   [$E7]
            AND   #$00FF
            CMP   #$0000
            BNE   L0124A2
            BRL   L0125B3
L0124A2     LDA   [$E7]
            AND   #$00FF
            CMP   #$0022
            BEQ   L0124AF
            BRL   L01253B
L0124AF     INC   $E7
            BNE   L0124B5
            INC   $E9
L0124B5     LDA   [$E7]
            AND   #$00FF
            CMP   #$0022
            BNE   L012536
            LDA   $EF
            CMP   $E1
            BNE   L0124FD
            LDA   $E1
            CLC
            ADC   #$0100
            LDX   #$0000
            TAY
            BPL   L0124D2
            DEX
L0124D2     PHX
            PHA
            PEI   $ED
            PEI   $EB
            _SetHandleSize
            BCS   L0124E4
            LDA   #$0000
L0124E4     STAL  L020002
            LDA   L020002
            BEQ   L0124F5
            PEA   $FFFF
            JSL   L01326A
            PLY
L0124F5     LDA   $E1
            CLC
            ADC   #$0100
            STA   $E1
L0124FD     LDX   $E9
            LDA   $E7
            INC   $E7
            BNE   L012507
            INC   $E9
L012507     STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDA   $EF
            INC   $EF
            LDX   #$0000
            TAY
            BPL   L012519
            DEX
L012519     PHX
            PHA
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            BRA   L012539
L012536     BRL   L0125B3
L012539     BRA   L0125B0
L01253B     LDA   $EF
            CMP   $E1
            BNE   L012579
            LDA   $E1
            CLC
            ADC   #$0100
            LDX   #$0000
            TAY
            BPL   L01254E
            DEX
L01254E     PHX
            PHA
            PEI   $ED
            PEI   $EB
            _SetHandleSize
            BCS   L012560
            LDA   #$0000
L012560     STAL  L020002
            LDA   L020002
            BEQ   L012571
            PEA   $FFFF
            JSL   L01326A
            PLY
L012571     LDA   $E1
            CLC
            ADC   #$0100
            STA   $E1
L012579     LDX   $E9
            LDA   $E7
            INC   $E7
            BNE   L012583
            INC   $E9
L012583     STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDA   $EF
            INC   $EF
            LDX   #$0000
            TAY
            BPL   L012595
            DEX
L012595     PHX
            PHA
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
L0125B0     BRL   L012495
L0125B3     BRL   L012658
L0125B6     LDA   [$E7]
            SEP   #$20
            STA   $F1
            REP   #$20
            AND   #$00FF
            CMP   #$0020
            BNE   L0125C9
            BRL   L012658
L0125C9     LDA   $F1
            AND   #$00FF
            CMP   #$0000
            BNE   L0125D6
            BRL   L012658
L0125D6     LDA   $F1
            AND   #$00FF
            CMP   #$0009
            BEQ   L012658
            LDA   $EF
            CMP   $E1
            BNE   L01261E
            LDA   $E1
            CLC
            ADC   #$0100
            LDX   #$0000
            TAY
            BPL   L0125F3
            DEX
L0125F3     PHX
            PHA
            PEI   $ED
            PEI   $EB
            _SetHandleSize
            BCS   L012605
            LDA   #$0000
L012605     STAL  L020002
            LDA   L020002
            BEQ   L012616
            PEA   $FFFF
            JSL   L01326A
            PLY
L012616     LDA   $E1
            CLC
            ADC   #$0100
            STA   $E1
L01261E     LDX   $E9
            LDA   $E7
            INC   $E7
            BNE   L012628
            INC   $E9
L012628     STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDA   $EF
            INC   $EF
            LDX   #$0000
            TAY
            BPL   L01263A
            DEX
L01263A     PHX
            PHA
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            BRL   L0125B6
L012658     LDA   $EF
            CMP   $E1
            BNE   L012696
            LDA   $E1
            CLC
            ADC   #$0100
            LDX   #$0000
            TAY
            BPL   L01266B
            DEX
L01266B     PHX
            PHA
            PEI   $ED
            PEI   $EB
            _SetHandleSize
            BCS   L01267D
            LDA   #$0000
L01267D     STAL  L020002
            LDA   L020002
            BEQ   L01268E
            PEA   $FFFF
            JSL   L01326A
            PLY
L01268E     LDA   $E1
            CLC
            ADC   #$0100
            STA   $E1
L012696     LDA   $EF
            INC   $EF
            LDX   #$0000
            TAY
            BPL   L0126A1
            DEX
L0126A1     PHX
            PHA
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   #$0000
            SEP   #$20
            STA   [$F2]
            REP   #$20
L0126BE     LDA   [$E7]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0126D2
            LDA   [$E7]
            AND   #$00FF
            CMP   #$0009
            BNE   L0126DA
L0126D2     INC   $E7
            BNE   L0126D8
            INC   $E9
L0126D8     BRA   L0126BE
L0126DA     BRL   L012472
L0126DD     LDA   $EF
            LDX   #$0000
            TAY
            BPL   L0126E6
            DEX
L0126E6     PHX
            PHA
            PEI   $ED
            PEI   $EB
            _SetHandleSize
            BCS   L0126F8
            LDA   #$0000
L0126F8     STAL  L020002
            PEI   $ED
            PEI   $EB
            _HLock
            BCS   L01270C
            LDA   #$0000
L01270C     STAL  L020002
            LDA   L020006
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L01271E
            DEX
L01271E     STX   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            LDX   $F6
            PHX
            PHA
            JSL   L014878
            PLY
            PLY
            STX   L02000A
            STA   L020008
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            PHX
            PHA
            LDX   L02000A
            LDA   L020008
            STA   $F2
            STX   $F4
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F2],Y
            PLA
            STA   [$F2]
            LDA   #$0001
            STA   $EF
            LDY   #$0002
            LDA   [$EB],Y
            TAX
            LDA   [$EB]
            STX   $E5
            STA   $E3
            BRA   L0127BA
L012769     LDA   [$E3]
            AND   #$00FF
            BNE   L0127B4
            LDX   $E5
            LDA   $E3
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $EF
            INC   $EF
            LDX   #$0000
            TAY
            BPL   L01278C
            DEX
L01278C     STX   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            LDX   $F6
            PHX
            PHA
            LDX   L02000A
            LDA   L020008
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F2],Y
            PLA
            STA   [$F2]
L0127B4     INC   $E3
            BNE   L0127BA
            INC   $E5
L0127BA     LDA   $EF
            SEC
            SBC   L020006
            BVS   L0127C5
            EOR   #$8000
L0127C5     BPL   L012769
            LDA   L020006
            LDX   #$0000
            TAY
            BPL   L0127D1
            DEX
L0127D1     STX   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            LDX   $F6
            PHX
            PHA
            LDX   L02000A
            LDA   L020008
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDX   #$0000
            LDA   #$0000
            LDY   #$0002
            PHA
            TXA
            STA   [$F2],Y
            PLA
            STA   [$F2]
L0127FD     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L012807     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDAL  $01C02D
            AND   #$FF80
            STAL  $01C02D
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012825     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            PEA   $0028
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L014421
            PEA   ^L031BB1
            PEA   L031BB1
            _LoadTools
            BCS   L012852
            LDA   #$0000
L012852     STAL  L020002
L012856     LDA   L020002
            STA   L0200F6
            CMP   #$0045
            BEQ   L012864
            BRL   L0128D5
L012864     PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L03812F
            PEA   L03812F
            PEI   $F2
            PEI   $F0
            PEA   ^L03813D
            PEA   L03813D
            PEA   ^L038140
            PEA   L038140
            _TLMountVolume
            BCS   L01288D
            LDA   #$0000
L01288D     STAL  L020002
            PLA
            STA   $F4
            LDA   $F4
            CMP   #$0001
            BNE   L0128B3
            PEA   ^L031BB1
            PEA   L031BB1
            _LoadTools
            BCS   L0128AD
            LDA   #$0000
L0128AD     STAL  L020002
            BRA   L0128D3
L0128B3     _TLShutDown
            BCS   L0128BF
            LDA   #$0000
L0128BF     STAL  L020002
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0128D3     BRA   L012856
L0128D5     TSC
            CLC
            ADC   #$000C
            TCS
            PLD
            RTL

sendLDOpenDoor
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L03809D	; OP - DOOR OPEN
            PEA   L03809D
            JSL   sendLDCommand
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

L0128FE     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$0092
            TCS
            STZ   $E4
            PEI   $F7
            PEI   $F5
            PEA   $0000
            TDC
            CLC
            ADC   #$00BC
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEI   $FB
            PEI   $F9
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
            PEA   $0000
            TDC
            CLC
            ADC   #$00BC
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
            LDA   #L037DBB
            LDX   #^L037DBB
            PHA
            TXA
            STAL  L037D5B
            PLA
            STAL  L037D59
            LDX   #$0000
            TDC
            CLC
            ADC   #$00BC
            PHA
            TXA
            STAL  L037D73
            PLA
            STAL  L037D71
            LDX   #$0000
            TDC
            CLC
            ADC   #$0094
            PHA
            TXA
            STAL  L037D8B
            PLA
            STAL  L037D89
            _InitCursor
            BCS   L012996
            LDA   #$0000
L012996     STAL  L020002
L01299A     LDA   $E4
            BEQ   L0129A1
            BRL   L012A11
L0129A1     PHA
            PEA   ^L037D95
            PEA   L037D95
            PEA   $0000
            PEA   $0000
            _StopAlert
            BCS   L0129BA
            LDA   #$0000
L0129BA     STAL  L020002
            PLA
            STA   $E8
            LDA   $E8
            CMP   #$0002
            BNE   L0129E9
            JSL   L014C78
            PEI   $FF
            PEI   $FD
            _DrawControls
            BCS   L0129DC
            LDA   #$0000
L0129DC     STAL  L020002
            LDA   #$0001
            STA   $E4
            STA   $E6
            BRA   L012A0F
L0129E9     LDA   $E8
            CMP   #$0001
            BNE   L012A0F
            JSL   L014C78
            PEI   $FF
            PEI   $FD
            _DrawControls
            BCS   L012A04
            LDA   #$0000
L012A04     STAL  L020002
            STZ   $E6
            LDA   #$0001
            STA   $E4
L012A0F     BRA   L01299A
L012A11     _HideCursor
            BCS   L012A1D
            LDA   #$0000
L012A1D     STAL  L020002
            LDA   $E6
            TAY
            TSC
            CLC
            ADC   #$005C
            TCS
            TYA
            PLD
            RTL

L012A2D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _GetWControls
            BCS   L012A51
            LDA   #$0000
L012A51     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
L012A5B     LDX   $F0
            LDA   $EE
            STX   $F2
            ORA   $F2
            BEQ   L012AA8
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $F2
            STX   $F4
            LDY   #$0022
            LDA   [$F2],Y
            TAX
            LDY   #$0020
            LDA   [$F2],Y
            JSL   L013333
            BNE   L012A8E
            LDX   $F0
            LDA   $EE
            BRA   L012AAE
L012A8E     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STX   $F0
            STA   $EE
            BRA   L012A5B
L012AA8     LDX   #$0000
            LDA   #$0000
L012AAE     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L012AB8     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            LDY   #$0004
            LDA   [$F5],Y
            PHA
            LDY   #$000C
            LDA   [$F5],Y
            PHA
            LDY   #$0008
            LDA   [$F5],Y
            AND   #$00FF
            AND   #$000F
            PHA
            LDY   #$0008
            LDA   [$F5],Y
            AND   #$00FF
            AND   #$00F0
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $00E1
            PEA   $2000
            PEI   $FB
            PEI   $F9
            JSL   L014D17
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012B09     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            BRL   L012BDA
L012B17     LDA   [$F7]
            AND   #$00FF
            PHA
            LDA   [$FB]
            AND   #$00FF
            PLX
            STX   $EC
            CMP   $EC
            BNE   L012B2F
            LDA   #$0001
            BRL   L012BB4
L012B2F     LDA   $FF
            BEQ   L012B38
            LDA   #$0000
            BRA   L012BB4
L012B38     LDA   [$F7]
            AND   #$00FF
            SEC
            SBC   #$0061
            BVS   L012B46
            EOR   #$8000
L012B46     BPL   L012B5A
            LDA   [$F7]
            AND   #$00FF
            SEC
            SBC   #$007A
            BEQ   L012B61
            BVS   L012B58
            EOR   #$8000
L012B58     BPL   L012B61
L012B5A     LDA   [$F7]
            AND   #$00FF
            BRA   L012B6E
L012B61     LDA   [$F7]
            AND   #$00FF
            CLC
            ADC   #$0041
            SEC
            SBC   #$0061
L012B6E     PHA
            LDA   [$FB]
            AND   #$00FF
            SEC
            SBC   #$0061
            BVS   L012B7D
            EOR   #$8000
L012B7D     BPL   L012B91
            LDA   [$FB]
            AND   #$00FF
            SEC
            SBC   #$007A
            BEQ   L012B98
            BVS   L012B8F
            EOR   #$8000
L012B8F     BPL   L012B98
L012B91     LDA   [$FB]
            AND   #$00FF
            BRA   L012BA5
L012B98     LDA   [$FB]
            AND   #$00FF
            CLC
            ADC   #$0041
            SEC
            SBC   #$0061
L012BA5     PLX
            STX   $EC
            CMP   $EC
            BEQ   L012BB1
            LDA   #$0000
            BRA   L012BB4
L012BB1     LDA   #$0001
L012BB4     TAY
            BNE   L012BBC
            LDA   #$0000
            BRA   L012BF1
L012BBC     LDX   $F9
            LDA   $F7
            INC   $F7
            BNE   L012BC6
            INC   $F9
L012BC6     STA   $EC
            STX   $EE
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L012BD4
            INC   $FD
L012BD4     STA   $EC
            STX   $EE
            LDA   [$EC]
L012BDA     LDA   [$F7]
            AND   #$00FF
            BEQ   L012BE4
            BRL   L012B17
L012BE4     LDA   [$FB]
            AND   #$00FF
            BEQ   L012BEE
            BRL   L012B17
L012BEE     LDA   #$0001
L012BF1     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L012BFB     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHA
            PEA   $0034
            _VDInStatus
            BCS   L012C16
            LDA   #$0000
L012C16     STAL  L020002
            PLA
            CMP   #$0000
            BNE   L012C52
            PEA   $0032
            PEA   $0001
            _VDInControl
            BCS   L012C32
            LDA   #$0000
L012C32     STAL  L020002
L012C36     PHA
            PEA   $0034
            _VDInStatus
            BCS   L012C46
            LDA   #$0000
L012C46     STAL  L020002
            PLA
            CMP   #$0001
            BEQ   L012C52
            BRA   L012C36
L012C52     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012C5A     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00AE
            TCS
            LDA   $FD
            BRL   L012D80
L012C6A     STZ   $B0
            BRA   L012C9D
L012C6E     LDA   $B0
            CLC
            ADC   #$0001
            PHA
            LDA   $B0
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L038343
            LDX   #^L038343
            JSL   L012E77
            _GetColorTable
            BCS   L012C97
            LDA   #$0000
L012C97     STAL  L020002
            INC   $B0
L012C9D     LDA   $B0
            CMP   #$0006
            BCC   L012C6E
            BRL   L012D8D
L012CA7     PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00B2
            PHA
            _GetColorTable
            BCS   L012CBF
            LDA   #$0000
L012CBF     STAL  L020002
            STZ   $B0
            BRA   L012D03
L012CC7     LDA   $FF
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00B2
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDA   $B0
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D2
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            STA   [$F2]
            INC   $B0
L012D03     LDA   $B0
            CMP   #$0010
            BCC   L012CC7
            LDA   #$0001
            STA   $B0
            BRA   L012D2E
L012D11     PEI   $B0
            PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            _SetColorTable
            BCS   L012D28
            LDA   #$0000
L012D28     STAL  L020002
            INC   $B0
L012D2E     LDA   $B0
            CMP   #$0007
            BCC   L012D11
            BRL   L012D8D
L012D38     STZ   $B0
            BRA   L012D6B
L012D3C     LDA   $B0
            CLC
            ADC   #$0001
            PHA
            LDA   $B0
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L038343
            LDX   #^L038343
            JSL   L012E77
            _SetColorTable
            BCS   L012D65
            LDA   #$0000
L012D65     STAL  L020002
            INC   $B0
L012D6B     LDA   $B0
            CMP   #$0006
            BCC   L012D3C
            BRL   L012D8D
L012D75     BRL   L012D8D
L012D78     DA    L012C6A
            DA    L012D38
            DA    L012CA7
            DA    L012D75
L012D80     CMP   #$0003
            BCC   L012D88
            LDA   #$0003
L012D88     ASL
            TAX
            JMP   (L012D78,X)

L012D8D     TSC
            CLC
            ADC   #$0048
            TCS
            PLD
            RTL

L012D95     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDX   L020086
            LDA   L020084
            STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EE
            STA   $EC
            STZ   $F0
            BRA   L012DED
L012DC1     LDY   #$0007
            LDA   [$EC],Y
            AND   #$00FF
            AND   #$FFFE
            SEP   #$20
            LDY   #$0007
            STA   [$EC],Y
            REP   #$20
            INC   $F0
            LDA   $F0
            LDX   $EE
            LDA   $EC
            CLC
            ADC   #$0008
            STA   $EC
            PHA
            LDA   $EE
            BCC   L012DE9
            INC
L012DE9     TAX
            STA   $EE
            PLA
L012DED     LDY   #$0005
            LDA   [$F2],Y
            CMP   $F0
            BEQ   L012DF8
            BCS   L012DC1
L012DF8     TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L012E00     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHA
            PEA   $0034
            _VDInStatus
            BCS   L012E1B
            LDA   #$0000
L012E1B     STAL  L020002
            PLA
            CMP   #$0001
            BNE   L012E3B
            PEA   $0032
            PEA   $0000
            _VDInControl
            BCS   L012E37
            LDA   #$0000
L012E37     STAL  L020002
L012E3B     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012E43     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            STZ   L020044
            STZ   L020046
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L012E6B
            LDA   #$0000
L012E6B     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L012E77     ENT
            CLC
            ADC   $04,S
            STA   $04,S
            TXA
            ADC   $06,S
            STA   $06,S
            RTL

L012E82     ENT
            PHD
            PHA
            PEA   $0001
            TSC
            TCD
            LDA   $0A
            BEQ   L012EF7
            LDX   #$0000
            BCC   L012EAD
            BIT   #$8000
            BEQ   L012E9E
            EOR   #$FFFF
            INC
            STA   $0A
            INX
L012E9E     LDA   $03
            BIT   #$8000
            BEQ   L012EAD
            EOR   #$FFFF
            INC
            STA   $03
            INX
            INX
L012EAD     LDY   #$0000
            BRA   L012EB4
L012EB2     ASL   $01
L012EB4     ASL   $0A
            BCC   L012EB2
            ROR   $0A
L012EBA     LDA   $03
            CMP   $0A
            BCC   L012ECB
            LDA   $03
            SEC
            SBC   $0A
            STA   $03
            TYA
            ORA   $01
            TAY
L012ECB     LSR   $0A
            LSR   $01
            BCC   L012EBA
            LDA   $03
            STA   $0A
            TYA
            CPX   #$0000
            BEQ   L012EF3
            CPX   #$0003
            BEQ   L012EE9
            EOR   #$FFFF
            INC
            CPX   #$0001
            BEQ   L012EF3
L012EE9     TAY
            LDA   $0A
            EOR   #$FFFF
            INC
            STA   $0A
            TYA
L012EF3     PLY
            PLY
            PLD
            RTL

L012EF7     PEA   $0004
            PEA   $0000
            PEA   $0000
            _SysFailMgr
L012F07     ENT
            PHD
            PHX
            PHA
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            TSC
            TCD
            LDA   $12
            ORA   $14
            BNE   L012F24
            LDX   #$0000
            BRL   L012FE8
L012F24     LDX   #$0000
            BCC   L012F5C
            LDA   $14
            BIT   #$8000
            BEQ   L012F42
            EOR   #$FFFF
            STA   $14
            LDA   $12
            EOR   #$FFFF
            INC
            BNE   L012F3F
            INC   $14
L012F3F     STA   $12
            INX
L012F42     LDA   $0B
            BIT   #$8000
            BEQ   L012F5C
            EOR   #$FFFF
            STA   $0B
            LDA   $09
            EOR   #$FFFF
            INC
            BNE   L012F58
            INC   $0B
L012F58     STA   $09
            INX
            INX
L012F5C     BRA   L012F62
L012F5E     ASL   $05
            ROL   $07
L012F62     ASL   $12
            ROL   $14
            BCC   L012F5E
            ROR   $14
            ROR   $12
L012F6C     LDA   $0B
            CMP   $14
            BEQ   L012F76
            BCC   L012F95
            BRA   L012F7C
L012F76     LDA   $09
            CMP   $12
            BCC   L012F95
L012F7C     LDA   $09
            SEC
            SBC   $12
            STA   $09
            LDA   $0B
            SBC   $14
            STA   $0B
            LDA   $01
            ORA   $05
            STA   $01
            LDA   $03
            ORA   $07
            STA   $03
L012F95     LSR   $14
            ROR   $12
            LSR   $07
            ROR   $05
            BCC   L012F6C
            CPX   #$0000
            BEQ   L012FD4
            CPX   #$0003
            BEQ   L012FC1
            LDA   $01
            EOR   #$FFFF
            STA   $01
            LDA   $03
            EOR   #$FFFF
            INC   $01
            BNE   L012FBA
            INC
L012FBA     STA   $03
            CPX   #$0001
            BEQ   L012FD4
L012FC1     LDA   $09
            EOR   #$FFFF
            STA   $09
            LDA   $0B
            EOR   #$FFFF
            INC   $09
            BNE   L012FD2
            INC
L012FD2     STA   $0B
L012FD4     LDA   $09
            STA   $12
            LDA   $0B
            STA   $14
            LDA   $01
            LDX   $03
            PLY
            PLY
            PLY
            PLY
            PLY
            PLY
            PLD
            RTL

L012FE8     PEA   $0004
            PEA   $0000
            PEA   $0000
            _SysFailMgr
L012FF8     ENT
            SEC
            SBC   $04,S
            STA   $04,S
            TXA
            SBC   $06,S
            STA   $06,S
            RTL

L013003     ENT
            PHD
            PHA
            TSC
            TCD
            LDX   #$0000
            BCC   L013028
            LDA   $08
            BIT   #$8000
            BEQ   L01301A
            EOR   #$FFFF
            INC
            STA   $08
            INX
L01301A     LDA   $01
            BIT   #$8000
            BEQ   L013028
            EOR   #$FFFF
            INC
            STA   $01
            DEX
L013028     LDA   #$0000
            BRA   L013036
L01302D     LSR   $01
            BCC   L013034
            CLC
            ADC   $08
L013034     ASL   $08
L013036     LDY   $01
            BNE   L01302D
            CPX   #$0000
            BEQ   L013043
            EOR   #$FFFF
            INC
L013043     STA   $08
            PLY
            PLD
            RTL

L013048     ENT
            PHD
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            TSC
            TCD
            LDX   #$0000
            BCC   L01308A
            LDA   $10
            BIT   #$8000
            BEQ   L013071
            EOR   #$FFFF
            STA   $10
            LDA   $0E
            EOR   #$FFFF
            INC
            BNE   L01306E
            INC   $10
L01306E     STA   $0E
            INX
L013071     LDA   $07
            BIT   #$8000
            BEQ   L01308A
            EOR   #$FFFF
            STA   $07
            LDA   $05
            EOR   #$FFFF
            INC
            BNE   L013087
            INC   $07
L013087     STA   $05
            DEX
L01308A     BRA   L0130A3
L01308C     LSR   $07
            ROR   $05
            BCC   L01309F
            LDA   $01
            CLC
            ADC   $0E
            STA   $01
            LDA   $03
            ADC   $10
            STA   $03
L01309F     ASL   $0E
            ROL   $10
L0130A3     LDA   $05
            ORA   $07
            BNE   L01308C
            CPX   #$0000
            BEQ   L0130C1
            LDA   $01
            EOR   #$FFFF
            STA   $01
            LDA   $03
            EOR   #$FFFF
            INC   $01
            BNE   L0130BF
            INC
L0130BF     STA   $03
L0130C1     LDA   $01
            STA   $0E
            LDA   $03
            STA   $10
            PLY
            PLY
            PLY
            PLY
            PLD
            RTL

sendLDCommand
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            JSL   checkSerialInputReady
            STA   $EE
            CMP   #$0000
            BEQ   L0130E9
            LDA   $EE
            BRA   L013104
L0130E9     PEI   $FF
            PEI   $FD
            JSL   sendCRString
            PLY
            PLY
            STA   $F0
            CMP   #$0000
            BEQ   L013100
            LDA   $F0
            BRA   L013104
            BRA   L013104
L013100     JSL   receiveLDAnswer	; check answer
L013104     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

sendLDAudioControl
            ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00D2
            TCS
            LDA   $FF
            AND   #$0003
            PHA
            PEA   ^L0380B9	; %u AD
            PEA   L0380B9
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0026
            TCS
            TYA
            PLD
            RTL

L013150     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            STZ   $EE
            STZ   $F0
            STZ   $EC
L013161     LDA   [$FD]
            AND   #$00FF
            BRL   L013176
L013169     BRL   L01318C
L01316C     INC   $EC
L01316E     INC   $FD
            BNE   L013174
            INC   $FF
L013174     BRA   L01318A
L013176     CMP   #$0009
            BEQ   L013169
            CMP   #$0020
            BEQ   L013169
            CMP   #$002B
            BEQ   L01316E
            CMP   #$002D
            BEQ   L01316C
L01318A     BRA   L013194
L01318C     INC   $FD
            BNE   L013192
            INC   $FF
L013192     BRA   L013161
L013194     LDA   [$FD]
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0131A2
            EOR   #$8000
L0131A2     BPL   L0131F6
            LDA   [$FD]
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L0131B6
            BVS   L0131B4
            EOR   #$8000
L0131B4     BMI   L0131F6
L0131B6     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0131C0
            INC   $FF
L0131C0     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            PEA   $0000
            PEA   $000A
            CLC
            JSL   L013048
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            SEC
            SBC   #$0030
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            BRA   L013194
L0131F6     LDA   $EC
            BEQ   L013204
            LDX   $F0
            LDA   $EE
            JSL   L016CB7
            BRA   L013208
L013204     LDX   $F0
            LDA   $EE
L013208     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L013212     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PHX
            PHA
            _TickCount
            BCS   L01322B
            LDA   #$0000
L01322B     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
L013235     LDX   $FF
            LDA   $FD
            PHX
            PHA
            PHX
            PHA
            _TickCount
            BCS   L013249
            LDA   #$0000
L013249     STAL  L020002
            PLA
            PLX
            SEC
            SBC   $EE
            PHA
            TXA
            SBC   $F0
            TAX
            PLA
            JSL   L013333
            BEQ   L013262
            BCC   L013262
            BRA   L013235
L013262     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L01326A     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            AND   #$FFFF
            PHA
            JSL   L01436F
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

sendCRString
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
L013293     LDA   [$FD]
            AND   #$00FF
            BEQ   L0132C0
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0132A4
            INC   $FF
L0132A4     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            JSL   sendSerialCharacter
            PLY
            STA   $F0
            CMP   #$0000
            BEQ   L0132BE
            LDA   $F0
            BRA   L0132D6
L0132BE     BRA   L013293
L0132C0     PEA   $000D
            JSL   sendSerialCharacter
            PLY
            STA   $F0
            CMP   #$0000
            BEQ   L0132D3
            LDA   $F0
            BRA   L0132D6
L0132D3     LDA   #$0000
L0132D6     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L0132E0     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            LDY   #$0004
            LDA   [$F5],Y
            PHA
            LDY   #$000C
            LDA   [$F5],Y
            PHA
            LDY   #$0008
            LDA   [$F5],Y
            AND   #$00FF
            AND   #$000F
            PHA
            LDY   #$0008
            LDA   [$F5],Y
            AND   #$00FF
            AND   #$00F0
            PHA
            PEI   $FF
            PEI   $FD
            LDX   L0200F4
            LDA   L0200F2
            PHX
            PHA
            PEI   $FB
            PEI   $F9
            JSL   L014D17
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L013333     ENT
            PHX
            PHA
            LDA   $08,S
            TAX
            LDA   $0A,S
            TAY
            LDA   $06,S
            STA   $0A,S
            LDA   $04,S
            STA   $08,S
            TXA
            SEC
            SBC   $01,S
            BNE   L01334E
            TYA
            SBC   $03,S
            BRA   L013353
L01334E     TYA
            SBC   $03,S
            REP   #$02
L013353     PHP
            LDA   $00,S
            STA   $08,S
            PLY
            PLY
            PLY
            PLY
            PLP
            RTL

L01335E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L037DF9
            LDX   #^L037DF9
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L016E99
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            _InstallFont
            BCS   L0133AF
            LDA   #$0000
L0133AF     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L0133BB     LDA   $04,S
            STAL  L0133CF
            LDA   $06,S
            STAL  L0133CF+2
            LDA   $08,S
            JSL   GSOS
            DW    $0029
L0133CF     ADRL  $00000000
            RTL

L0133D4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00B4
            TCS
            PEI   $FF
            PEI   $FD
            PEA   ^L0380F6
            PEA   L0380F6
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            LDAL  L031DEC
            TAX
            LDAL  L031DEA
            STX   $F2
            ORA   $F2
            BEQ   L013426
            LDAL  L031DEC
            TAX
            LDAL  L031DEA
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            JSL   L014572
            LDX   #$0000
            LDA   #$0000
            PHA
            TXA
            STAL  L031DEC
            PLA
            STAL  L031DEA
L013426     LDA   #$0000
            STAL  L031DFC
            LDAL  L031DD8
            BEQ   L01343C
            LDA   #$0000
            STAL  L031DD8
            BRA   L013444
L01343C     PEA   $0000
            JSL   sendLDStill
            PLY
L013444     LDAL  L031DD6
            BEQ   L013475
            LDA   #$0000
            STAL  L031DD6
            PEA   $0006
            PEA   $0002
            PEA   $0000
            JSL   L015D04
            PLY
            PLY
            PLY
            PEA   $0000
            JSL   L015CDA
            PLY
            PEA   $0000
            PEA   $0000
            JSL   L0168DF
            PLY
            PLY
L013475     PEA   ^L013D1B
            PEA   L013D1B
            PEA   $001C
            LDAL  L031DDE
            PHA
            LDX   L02008E
            LDA   L02008C
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L016912
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            STA   $F0
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L031DE4
            PLA
            STAL  L031DE2
            LDA   $F0
            CMP   #$FFFF
            BNE   L0134FE
            PEI   $FF
            PEI   $FD
            PEA   ^L038103
            PEA   L038103
            PEA   $0000
            TDC
            CLC
            ADC   #$00CA
            PHA
            JSL   L01508C
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00CA
            PHA
            PEA   ^L038106
            PEA   L038106
            JSL   L016A37
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0000
            BRL   L013616
L0134FE     LDA   $F0
            LDX   #$0000
            TAY
            BPL   L013507
            DEX
L013507     PEA   $0000
            PEA   $001C
            CLC
            JSL   L013048
            LDX   L02008E
            LDA   L02008C
            JSL   L012E77
            PLA
            PLX
            STX   $EE
            STA   $EC
            LDY   #$0016
            LDA   [$EC],Y
            TAX
            LDY   #$0014
            LDA   [$EC],Y
            PHX
            PHA
            LDX   L02008A
            LDA   L020088
            JSL   L012E77
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   $E6
            LDA   $E4
            STX   $EA
            STA   $E8
            STZ   $E2
            BRL   L013605
L01354C     LDA   [$E8]
            PHA
            JSL   L0169CC
            PLY
            STX   $E0
            STA   $DE
            STX   $F2
            ORA   $F2
            BNE   L0135A4
            LDA   [$E8]
            PHA
            PEA   ^L038117
            PEA   L038117
            PEA   $0000
            TDC
            CLC
            ADC   #$00B6
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
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
            ADC   #$00B6
            PHA
            PEA   ^L03811A
            PEA   L03811A
            JSL   L016A37
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0000
            BRA   L013616
L0135A4     LDX   $E6
            LDA   $E4
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDY   #$0004
            LDA   [$DE],Y
            TAX
            LDY   #$0002
            LDA   [$DE],Y
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            JSL   L014572
            PLY
            PLY
            LDAL  L031DFC
            BEQ   L0135D9
            LDA   #$0001
            BRA   L013616
L0135D9     LDY   #$0002
            LDA   [$E8],Y
            PHA
            LDA   #$0006
            PLX
            STX   $F6
            CLC
            ADC   $F6
            LDX   #$0000
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L012E77
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   $E6
            LDA   $E4
            STX   $EA
            STA   $E8
            INC   $E2
L013605     LDY   #$001A
            LDA   [$EC],Y
            CMP   $E2
            BEQ   L013613
            BCC   L013613
            BRL   L01354C
L013613     LDA   #$0001
L013616     TAY
            TSC
            CLC
            ADC   #$0042
            TCS
            TYA
            PLD
            RTL

L013620     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00D2
            TCS
            LDA   $F5
            STA   $E8
            LDA   $E8
            BEQ   L01366A
            PEI   $E8
            PEA   ^L0380CB	; %uSE
            PEA   L0380CB
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            CMP   #$0000
            BEQ   L013668
            LDA   $E4
            BRL   L01388C
L013668     BRA   L013670
L01366A     JSL   L015B49
            STA   $E8
L013670     LDX   $FF
            LDA   $FD
            STX   $EA
            ORA   $EA
            BEQ   L013682
            LDA   $FD
            LDX   $FF
            JSL   L014572
L013682     LDA   $E8
            CMP   $F7
            BNE   L01368E
            LDA   #$0000
            BRL   L01388C
L01368E     LDA   $E8
            CMP   $F7
            BCS   L0136AD
            LDA   $F9
            CMP   #$003C
            BNE   L0136AD
            LDA   $FB
            BEQ   L0136A6
            LDA   #$0001
            STA   $E6
            BRA   L0136AB
L0136A6     LDA   #$0002
            STA   $E6
L0136AB     BRA   L0136BD
L0136AD     LDA   $FB
            BEQ   L0136B8
            LDA   #$0003
            STA   $E6
            BRA   L0136BD
L0136B8     LDA   #$0004
            STA   $E6
L0136BD     LDA   $E6
            BRL   L01383D
L0136C2     STZ   L020100
            PEI   $F7
            PEA   ^L0380D0	; %u PL
            PEA   L0380D0
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L01384B
L0136E2     PEI   $F7
            PEA   ^L0380D5	; %u SM
            PEA   L0380D5
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            CMP   #$0000
            BEQ   L013717
            LDA   $E4
            BRL   L01388C
L013717     PEA   ^L0380DA	; PL
            PEA   L0380DA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            BRL   L01384B
L013731     STZ   L020100
            PEI   $F9
            PEA   ^L0380DD	; %u SP
            PEA   L0380DD
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            CMP   #$0000
            BEQ   L013769
            LDA   $E4
            BRL   L01388C
L013769     LDA   $E8
            CMP   $F7
            BEQ   L013771
            BCS   L013776
L013771     LDA   #$0046
            BRA   L013779
L013776     LDA   #$0052
L013779     PHA
            PEI   $F7
            PEA   ^L0380E2	; %uM%c
            PEA   L0380E2
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L01384B
L01379A     PEI   $F9
            PEA   ^L0380E8	; %uSP
            PEA   L0380E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            CMP   #$0000
            BEQ   L0137CF
            LDA   $E4
            BRL   L01388C
L0137CF     PEI   $F7
            PEA   ^L0380ED
            PEA   L0380ED
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            CMP   #$0000
            BEQ   L013804
            LDA   $E4
            BRL   L01388C
L013804     LDA   $E8
            CMP   $F7
            BEQ   L01380C
            BCS   L013811
L01380C     LDA   #$0046
            BRA   L013814
L013811     LDA   #$0052
L013814     PHA
            PEA   ^L0380F2
            PEA   L0380F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L01384B
L013830     BRL   L01384B
L013833     DA    L0136C2
            DA    L0136E2
            DA    L013731
            DA    L01379A
            DA    L013830
            MX    %00
L01383D     DEC
            CMP   #$0004
            BCC   L013846
            LDA   #$0004
L013846     ASL
            TAX
            JMP   (L013833,X)

L01384B     LDA   $FB
            BEQ   L01385F
            _WaitCursor
            BCS   L01385B
            LDA   #$0000
L01385B     STAL  L020002
L01385F     PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $E4
            LDA   $FB
            BEQ   L013884
            _InitCursor
            BCS   L013880
            LDA   #$0000
L013880     STAL  L020002
L013884     LDA   #$0001
            STA   L020100
            LDA   $E4
L01388C     TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            PLD
            RTL

receiveLDAnswer
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D2
            TCS
            LDA   #$0000
            SEP   #$20
            STA   $D6
            REP   #$20
L0138AA     PEA   ^L038064	; R
            PEA   L038064
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   L014120	; copy string
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L0138E0
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   receiveString
            PLY
            PLY
            STA   $D4
            CMP   #$0000
            BEQ   L0138DE
            LDA   $D4
            BRA   L0138E3
L0138DE     BRA   L0138AA
L0138E0     LDA   #$0000
L0138E3     TAY
            TSC
            CLC
            ADC   #$0028
            TCS
            TYA
            PLD
            RTL

L0138ED     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E2
            TCS
            STZ   $E8
            STZ   $EA
            LDA   $FF
            BRL   L0139DC
L013901     SEC
            LDA   $FB
            SBC   #$0000
            BNE   L013910
            LDA   $FD
            SBC   #$0000
            BRA   L013917
L013910     LDA   $FD
            SBC   #$0000
            REP   #$02
L013917     BEQ   L013931
            LDX   L020070
            LDA   L02006E
            PHX
            PHA
            _InvertRect
            BCS   L01392D
            LDA   #$0000
L01392D     STAL  L020002
L013931     BRL   L0139FE
L013934     LDX   #$0000
            LDA   #$0010
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            SEC
            JSL   L013B83
            PLA
            PLX
            AND   #$FFFF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $E6
            LDX   $FD
            LDA   $FB
            STA   $E4
            LDY   #$0002
            LDA   [$F7],Y
            TAX
            LDA   [$F7]
            STA   $EC
            STX   $EE
            LDY   #$0008
            LDA   [$EC],Y
            CMP   $E4
            BEQ   L013970
            BCS   L0139BB
L013970     LDY   #$0002
            LDA   [$F7],Y
            TAX
            LDA   [$F7]
            STA   $EC
            STX   $EE
            LDY   #$000A
            LDA   [$EC],Y
            CMP   $E6
            BEQ   L013987
            BCS   L0139BB
L013987     LDY   #$0002
            LDA   [$F7],Y
            TAX
            LDA   [$F7]
            STA   $EC
            STX   $EE
            LDY   #$000C
            LDA   [$EC],Y
            CMP   $E4
            BCC   L0139BB
            LDY   #$0002
            LDA   [$F7],Y
            TAX
            LDA   [$F7]
            STA   $EC
            STX   $EE
            LDY   #$000E
            LDA   [$EC],Y
            CMP   $E6
            BCC   L0139BB
            LDX   #$0000
            LDA   #$0002
            STX   $EA
            STA   $E8
L0139BB     BRL   L0139FE
L0139BE     LDX   #$0000
            LDA   #$0001
            STX   $EA
            STA   $E8
            BRL   L0139FE
L0139CB     LDX   #$0000
            LDA   #$0028
            STX   $EA
            STA   $E8
            BRL   L0139FE
L0139D8     BRA   L0139FE
            BRA   L0139FE
L0139DC     CMP   #$0000
            BNE   L0139E4
            BRL   L013901
L0139E4     CMP   #$0002
            BNE   L0139EC
            BRL   L013934
L0139EC     CMP   #$0005
            BEQ   L0139BE
            CMP   #$0007
            BEQ   L0139BE
            CMP   #$000C
            BEQ   L0139CB
            JMP   L0139D8

L0139FE     LDX   $EA
            LDA   $E8
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            LDA   $02,S
            STA   $0C,S
            LDA   $01,S
            STA   $0B,S
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            STA   $04,S
            TXA
            STA   $06,S
            RTL

L013A1F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E6
            TCS
            LDX   $FF
            LDA   $FD
            STX   $EA
            STA   $E8
            LDX   $FF
            LDA   $FD
            STX   $F2
            ORA   $F2
            BEQ   L013A7D
L013A3C     LDA   [$FD]
            AND   #$00FF
            STA   $EC
            LDA   $EE
            PHA
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L013A50
            INC   $FF
L013A50     STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDA   $EC
            STA   $EE
            LDA   $EC
            BNE   L013A3C
            LDX   $EA
            LDA   $E8
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L012FF8
            PLA
            PLX
            SEC
            SBC   #$0001
            SEP   #$20
            STA   [$E8]
            REP   #$20
L013A7D     LDX   $EA
            LDA   $E8
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L013A8B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E6
            TCS
            LDX   $FF
            LDA   $FD
            STX   $EA
            STA   $E8
            LDX   $FF
            LDA   $FD
            STX   $F2
            ORA   $F2
            BEQ   L013AF9
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L013AB2
            INC   $FF
L013AB2     STX   $EE
            STA   $EC
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            STA   $F0
            BRA   L013AE9
L013AC3     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L013ACD
            INC   $FF
L013ACD     STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDX   $EE
            LDA   $EC
            INC   $EC
            BNE   L013ADE
            INC   $EE
L013ADE     STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
L013AE9     LDA   $F0
            DEC   $F0
            TAY
            BNE   L013AC3
            LDA   #$0000
            SEP   #$20
            STA   [$EC]
            REP   #$20
L013AF9     LDX   $EA
            LDA   $E8
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L013B07     TAY
            LDA   $04,S
            TAX
            BEQ   L013B13
            TYA
L013B0E     ASL
            DEX
            BNE   L013B0E
            TAY
L013B13     TYA
            STA   $04,S
            RTL

L013B17     ENT
            PHD
            PHX
            PHA
            TSC
            TCD
            LDX   $0A
            LDA   $0C
            BEQ   L013B25
            LDX   #$0021
L013B25     TXY
            BEQ   L013B32
            LDA   $01
L013B2A     ASL
            ROL   $03
            DEX
            BNE   L013B2A
            STA   $01
L013B32     LDA   $01
            STA   $0A
            LDA   $03
            STA   $0C
            PLY
            PLY
            PLD
            RTL

sendLDReject
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L03809A	; RJ
            PEA   L03809A
            JSL   sendLDCommand
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

L013B5F     ENT
            BCC   L013B73
            TAY
            LDA   $04,S
            TAX
            BEQ   L013B7F
            TYA
            BEQ   L013B80
            BPL   L013B7A
L013B6C     SEC
            ROR
            DEX
            BNE   L013B6C
            BRA   L013B80
L013B73     TAY
            LDA   $04,S
            TAX
            BEQ   L013B7F
            TYA
L013B7A     LSR
            DEX
            BNE   L013B7A
            TAY
L013B7F     TYA
L013B80     STA   $04,S
            RTL

L013B83     ENT
            BCC   L013BA5
            PHD
            PHX
            PHA
            TSC
            TCD
            LDX   $0A
            LDA   $0C
            BEQ   L013B93
            LDX   #$0021
L013B93     TXY
            BEQ   L013BC0
            LDA   $03
            BPL   L013BB6
L013B9A     SEC
            ROR
            ROR   $01
            DEX
            BNE   L013B9A
            STA   $03
            BRA   L013BC0
L013BA5     PHD
            PHX
            PHA
            TSC
            TCD
            LDX   $0A
            LDA   $0C
            BEQ   L013BB3
            LDX   #$0021
L013BB3     TXY
            BEQ   L013BC0
L013BB6     LDA   $03
L013BB8     LSR
            ROR   $01
            DEX
            BNE   L013BB8
            STA   $03
L013BC0     LDA   $03
            STA   $0C
            LDA   $01
            STA   $0A
            PLY
            PLY
            PLD
            RTL

checkSerialInputReady
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F3
            TCS
L013BD7     JSL   getSerialInputStatus	; serial: is input ready?
            TAY
            BEQ   L013BF9	; 0, no, not ready

            PEA   $0000		; if ready, read a character
            TDC
            CLC
            ADC   #$00F5
            PHA
            JSL   llSerialRead	; 0: char read, 2: error encountered
            PLY
            PLY
            CMP   #$0002
            BNE   L013BF7
            LDA   #$0002
            BRA   L013BFC
L013BF7     BRA   L013BD7

L013BF9     LDA   #$0000
L013BFC     TAY
            TSC
            CLC
            ADC   #$0007
            TCS
            TYA
            PLD
            RTL

L013C06     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00D2
            TCS
            LDA   $FF
            STA   $D6
            LDX   $FB
            LDA   $F9
            STX   $EA
            ORA   $EA
            BNE   L013C92
            PHX
            PHA
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L013C41
            LDA   #$0000
L013C41     STAL  L020002
            PLA
            PLX
            STX   $E8
            STA   $E6
            LDA   L020002
            STA   $D4
            TAY
            BEQ   L013C5C
            LDX   #$0000
            LDA   #$0000
            BRL   L013CDE
L013C5C     PEI   $E8
            PEI   $E6
            _HLock
            BCS   L013C6C
            LDA   #$0000
L013C6C     STAL  L020002
            LDA   L020002
            STA   $D4
            TAY
            BEQ   L013C80
            LDX   #$0000
            LDA   #$0000
            BRA   L013CDE
L013C80     LDY   #$0002
            LDA   [$E6],Y
            TAX
            LDA   [$E6]
            STX   $E0
            STA   $DE
            STX   $DC
            STA   $DA
            BRA   L013C9E
L013C92     LDX   $FB
            LDA   $F9
            STX   $E0
            STA   $DE
            STX   $DC
            STA   $DA
L013C9E     PHA
            PEI   $F7
            PEI   $F5
            PEI   $FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _UnPackBytes
            BCS   L013CC3
            LDA   #$0000
L013CC3     STAL  L020002
            PLA
            STA   $D8
            LDA   L020002
            STA   $D4
            TAY
            BEQ   L013CDA
            LDX   #$0000
            LDA   #$0000
            BRA   L013CDE
L013CDA     LDX   $E0
            LDA   $DE
L013CDE     TAY
            TSC
            CLC
            ADC   #$001C
            TCS
            TYA
            PLD
            RTL

sendLDVideoControl
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            BEQ   L013D05
            PEA   ^L0380BE	; 1VD
            PEA   L0380BE
            JSL   sendLDCommand
            PLY
            PLY
            BRA   L013D11
L013D05     PEA   ^L0380C2	; 0VD
            PEA   L0380C2
            JSL   sendLDCommand
            PLY
            PLY
L013D11     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L013D1B     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L014120
            PLY
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

L013D40     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E8
            TCS
            STZ   $EA
            BRL   L013E50
L013D50     LDA   $EA
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
            AND   #$00F0
            PHA
            LDA   $FD
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            PLX
            STX   $EC
            CMP   $EC
            BNE   L013DD0
            LDA   $EA
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
            AND   #$000F
            SEP   #$20
            STA   [$EC]
            REP   #$20
            LDA   $FF
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            PHA
            LDA   $EA
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
            PLX
            STX   $F0
            ORA   $F0
            SEP   #$20
            STA   [$EC]
            REP   #$20
L013DD0     LDA   $EA
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
            AND   #$000F
            PHA
            LDA   $FD
            AND   #$00FF
            AND   #$000F
            PLX
            STX   $EC
            CMP   $EC
            BNE   L013E4E
            LDA   $EA
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
            AND   #$00F0
            SEP   #$20
            STA   [$EC]
            REP   #$20
            LDA   $FF
            AND   #$00FF
            AND   #$000F
            PHA
            LDA   $EA
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
            PLX
            STX   $F0
            ORA   $F0
            SEP   #$20
            STA   [$EC]
            REP   #$20
L013E4E     INC   $EA
L013E50     LDA   $EA
            CMP   $FB
            BCS   L013E59
            BRL   L013D50
L013E59     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L013E61     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E6
            TCS
            LDX   $F9
            LDA   $F7
            STX   $EA
            STA   $E8
L013E74     DEC   $FF
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L013E81
            EOR   #$8000
L013E81     BPL   L013EAB
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L013E8D
            INC   $FD
L013E8D     STA   $EC
            STX   $EE
            LDA   [$EC]
            PHA
            LDX   $F9
            LDA   $F7
            INC   $F7
            BNE   L013E9E
            INC   $F9
L013E9E     STA   $EC
            STX   $EE
            PLA
            SEP   #$20
            STA   [$EC]
            REP   #$20
            BRA   L013E74
L013EAB     LDX   $EA
            LDA   $E8
            TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L013EB9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
L013ECC     DEC   $FF
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L013ED9
            EOR   #$8000
L013ED9     BPL   L013EF3
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L013EE5
            INC   $FB
L013EE5     STA   $EE
            STX   $F0
            LDA   $FD
            SEP   #$20
            STA   [$EE]
            REP   #$20
            BRA   L013ECC
L013EF3     LDX   $EC
            LDA   $EA
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L013F01     PHD
            TSC
            TCD
            STA   [$06]
            LDA   $01,S
            LDY   #$0002
            STA   [$06],Y
            LDA   $02,S
            INY
            INY
            STA   [$06],Y
            LDA   $04,S
            INY
            INY
            STA   [$06],Y
            PLD
            LDA   #$0000
            RTL

L013F1E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L01457A
            PLY
            PLY
            PLY
            LDA   #L038050
            LDX   #^L038050
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L013F49
            INX
L013F49     STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0004
            STA   [$F0],Y
            LDA   #L038055
            LDX   #^L038055
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L013F6F
            INX
L013F6F     STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0008
            STA   [$F0],Y
            LDA   #L03805D
            LDX   #^L03805D
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L013F95
            INX
L013F95     STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$000E
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$000C
            STA   [$F0],Y
            LDA   #$0009
            LDY   #$00B6
            STA   [$FB],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L013FBB
            INX
L013FBB     STA   $F0
            STX   $F2
            LDA   #$0055
            LDY   #$0008
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L013FD2
            INX
L013FD2     STA   $F0
            STX   $F2
            LDA   #$0014
            LDY   #$000A
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L013FE9
            INX
L013FE9     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$000C
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014000
            INX
L014000     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$000E
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014017
            INX
L014017     STA   $F0
            STX   $F2
            LDA   #$0055
            LDY   #$0010
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L01402E
            INX
L01402E     STA   $F0
            STX   $F2
            LDA   #$005A
            LDY   #$0012
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014045
            INX
L014045     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$0014
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L01405C
            INX
L01405C     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$0016
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014073
            INX
L014073     STA   $F0
            STX   $F2
            LDA   #$0055
            LDY   #$0018
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L01408A
            INX
L01408A     STA   $F0
            STX   $F2
            LDA   #$00B9
            LDY   #$001A
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0140A1
            INX
L0140A1     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$001C
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0140B8
            INX
L0140B8     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$001E
            STA   [$F0],Y
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0140CE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
L0140EC     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0140F6
            INC   $FF
L0140F6     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$0000
            BEQ   L014106
            BRA   L0140EC
L014106     LDX   $F0
            LDA   $EE
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L012FF8
            PLA
            PLX
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L014120     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $F9
            CMP   $FD
            BNE   L01413C
            LDA   $FB
            CMP   $FF
            BNE   L01413C
            LDA   #$0000
            BRA   L01419C
L01413C     LDA   [$F9]
            AND   #$00FF
            PHA
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L01414C
            INC   $FF
L01414C     STA   $EE
            STX   $F0
            LDA   [$EE]
            AND   #$00FF
            PLX
            STX   $EE
            CMP   $EE
            BNE   L01417B
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L014166
            INC   $FB
L014166     STA   $EE
            STX   $F0
            LDA   [$EE]
            AND   #$00FF
            CMP   #$0000
            BNE   L014179
            LDA   #$0000
            BRA   L01419C
L014179     BRA   L01413C
L01417B     LDA   $FD
            BNE   L014181
            DEC   $FF
L014181     DEC   $FD
            LDX   $FF
            LDA   $FD
            STA   $EE
            STX   $F0
            LDA   [$EE]
            AND   #$00FF
            PHA
            LDA   [$F9]
            AND   #$00FF
            PLX
            STX   $F2
            SEC
            SBC   $F2
L01419C     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0141A6     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$FFEA
            TCS
            LDA   #L016EF3
            LDX   #^L016EF3
            PHX
            PHA
            LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            STA   [$F4]
            LDA   L0200F8
            BNE   L0141DA
            BRL   L01432C
L0141DA     LDX   #$0000
            TDC
            CLC
            ADC   #$FFEC
            PHA
            TXA
            STAL  L0382FF
            PLA
            STAL  L0382FD
            PEA   $0027
            PEA   ^L0382FD
            PEA   L0382FD
            JSL   L014421
            LDAL  L0382FF
            TAX
            LDAL  L0382FD
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            STA   $F0
            STA   $EE
L014210     LDA   $F0
            LDX   #$0000
            TAY
            BPL   L014219
            DEX
L014219     PHX
            PHA
            LDAL  L0382FF
            TAX
            LDAL  L0382FD
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            CMP   #$002F
            BEQ   L01424B
            LDA   $F0
            SEC
            SBC   #$0000
            BEQ   L01424B
            BVS   L014245
            EOR   #$8000
L014245     BPL   L01424B
            DEC   $F0
            BRA   L014210
L01424B     LDA   $EE
            SEC
            SBC   $F0
            STA   $EC
            SEP   #$20
            STAL  L037FA0
            REP   #$20
            BRA   L0142AE
L01425C     LDA   $EE
            DEC   $EE
            LDX   #$0000
            TAY
            BPL   L014267
            DEX
L014267     PHX
            PHA
            LDAL  L0382FF
            TAX
            LDAL  L0382FD
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            PHA
            LDA   $EC
            LDX   #$0000
            TAY
            BPL   L014288
            DEX
L014288     PHX
            PHA
            LDA   #L037FA1
            LDX   #^L037FA1
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
            STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            DEC   $EC
L0142AE     LDA   $EC
            SEC
            SBC   #$0000
            BEQ   L0142BD
            BVS   L0142BB
            EOR   #$8000
L0142BB     BMI   L01425C
L0142BD     LDA   #L037FA0
            LDX   #^L037FA0
            PHX
            PHA
            LDAL  L037F39
            TAX
            LDAL  L037F37
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            STA   [$F4]
            LDA   $FF
            BNE   L0142FF
            LDAL  L037F39
            TAX
            LDAL  L037F37
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            JSL   L013A8B
            PLY
            PLY
L0142FF     LDA   #$0001
            STA   L020006
            LDAL  L037F39
            TAX
            LDAL  L037F37
            STX   L02000A
            STA   L020008
            PEA   $007F
            PEA   $0000
            _SetInGlobals
            BCS   L014326
            LDA   #$0000
L014326     STAL  L020002
            BRA   L014344
L01432C     LDA   L020006
            STAL  L037F35
            LDX   L02000A
            LDA   L020008
            PHA
            TXA
            STAL  L037F39
            PLA
            STAL  L037F37
L014344     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

startLD     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L03808F	; SA START
            PEA   L03808F
            JSL   sendLDCommand
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

L01436F     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F4
            STX   $F6
            LDX   $F6
            LDA   #$0024
            CLC
            ADC   $F4
            BCC   L014392
            INX
L014392     STX   $F2
            STA   $F0
            BRA   L0143D1
L014398     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            JSL   L013333
            BEQ   L0143C5
            PEI   $FF
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            JSL   L014572
            PLY
L0143C5     LDA   $F0
            SEC
            SBC   #$0004
            STA   $F0
            BCS   L0143D1
            DEC   $F2
L0143D1     SEC
            LDA   $F0
            SBCL  L037F45
            BNE   L0143E2
            LDA   $F2
            SBCL  L037F47
            BRA   L0143EA
L0143E2     LDA   $F2
            SBCL  L037F47
            REP   #$02
L0143EA     BEQ   L0143F3
            BVS   L0143F1
            EOR   #$8000
L0143F1     BMI   L014398
L0143F3     LDA   $FF
            STA   L02000C
            LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            JSL   L014572
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L014421     ENT
            PHB
            PLA
            XBA
            STAL  L01445C
            PLA
            STAL  L01445C+1
            PLA
            STAL  L014442
            PLA
            STAL  L014442+2
            PLA
            STAL  L014440
            JSL   GSOS
L014440     DW    $0000
L014442     ADRL  $00000000
            BCS   L01444B
            LDA   #$0000
L01444B     STAL  L020002
            LDAL  L01445C+1
            PHA
            PHB
            LDAL  L01445C
            STA   $01,S
            RTL

L01445C     ADR   $000000

initCommPort
            PHD		; INIT COMM PORT
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            JSL   resetCommPort
            STA   $F4
            CMP   #$0000
            BEQ   L01447A
            LDA   $F4
            BRL   L01451A
L01447A     PEA   ^L038066	; ED - DON'T ECHO OUTPUT
            PEA   L038066
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038069	; BE - INPUT BUFFERING ON
            PEA   L038069
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L03806C	; 12B - SET BAUD RATE 4800BPS
            PEA   L03806C
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038070	; 0D - DATA/STOP BITS 8/1
            PEA   L038070
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038073	; 0P - PARITY: NONE
            PEA   L038073
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038076	; 0N - LINE LENGTH: 0
            PEA   L038076
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038079	; AD - DO NOT IMPLEMENT BASIC TABS
            PEA   L038079
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L03807C	; CD - DISABLE LINE FORMATTING
            PEA   L03807C
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L03807F	; XD - IGNORE XOFF
            PEA   L03807F
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038082	; FD - DISABLE KEYBOARD INPUT
            PEA   L038082
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038085	; LD - DO NOT ADD LINE FEEDS AFTER CR
            PEA   L038085
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L038088	; ME - MASK LINE FEED IN
            PEA   L038088
            JSL   sendSerialString
            PLY
            PLY
            PEA   ^L03808B	; Z - SUPPRESS CONTROL CHARACTERS
            PEA   L03808B
            JSL   sendSerialString
            PLY
            PLY
            JSL   checkSerialInputReady
L01451A     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L014524     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
L014537     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L014541
            INC   $FF
L014541     STA   $EE
            STX   $F0
            LDA   [$EE]
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L014552
            INC   $FB
L014552     STA   $EE
            STX   $F0
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
            AND   #$00FF
            BEQ   L014564
            BRA   L014537
L014564     LDX   $EC
            LDA   $EA
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L014572     ENT
            SEP   #$10
            PHX
            REP   #$10
            DEC
            PHA
            RTL

L01457A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0000
            STA   [$FB]
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014595
            INX
L014595     STA   $F0
            STX   $F2
            LDA   #$0055
            LDY   #$0008
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0145AC
            INX
L0145AC     STA   $F0
            STX   $F2
            LDA   #$0020
            LDY   #$000A
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0145C3
            INX
L0145C3     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$000C
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0145DA
            INX
L0145DA     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$000E
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L0145F1
            INX
L0145F1     STA   $F0
            STX   $F2
            LDA   #$0055
            LDY   #$0010
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014608
            INX
L014608     STA   $F0
            STX   $F2
            LDA   #$0098
            LDY   #$0012
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L01461F
            INX
L01461F     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$0014
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0006
            LDX   $FD
            BCC   L014636
            INX
L014636     STA   $F0
            STX   $F2
            LDA   #$0000
            LDY   #$0016
            STA   [$F0],Y
            LDA   #L038044
            LDX   #^L038044
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L014655
            INX
L014655     STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0004
            STA   [$F0],Y
            LDA   #L038049
            LDX   #^L038049
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L01467B
            INX
L01467B     STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0008
            STA   [$F0],Y
            LDA   $FB
            CLC
            ADC   #$0026
            LDX   $FD
            BCC   L014699
            INX
L014699     STA   $F0
            STX   $F2
            LDX   #$0000
            LDA   #$0000
            LDY   #$000E
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$000C
            STA   [$F0],Y
            LDA   #$004E
            LDY   #$0036
            STA   [$FB],Y
            LDA   #$8024
            LDY   #$0038
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0040
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$003E
            STA   [$FB],Y
            LDA   #$0000
            LDY   #$0048
            STA   [$FB],Y
            LDY   #$0046
            STA   [$FB],Y
            LDY   #$0044
            STA   [$FB],Y
            LDY   #$0042
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$004C
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$004A
            STA   [$FB],Y
            LDA   #$0000
            LDY   #$0050
            STA   [$FB],Y
            LDY   #$004E
            STA   [$FB],Y
            LDA   #$00C8
            LDY   #$0052
            STA   [$FB],Y
            LDA   #$0140
            LDY   #$0054
            STA   [$FB],Y
            LDA   #$00C8
            LDY   #$0056
            STA   [$FB],Y
            LDA   #$0140
            LDY   #$0058
            STA   [$FB],Y
            LDA   #$0000
            LDY   #$0060
            STA   [$FB],Y
            LDY   #$005E
            STA   [$FB],Y
            LDY   #$005C
            STA   [$FB],Y
            LDY   #$005A
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0064
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$0062
            STA   [$FB],Y
            LDA   #$0000
            LDY   #$0066
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$006A
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$0068
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$006E
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$006C
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0072
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$0070
            STA   [$FB],Y
            LDA   #$0032
            LDY   #$0074
            STA   [$FB],Y
            LDA   #$0014
            LDY   #$0076
            STA   [$FB],Y
            LDA   #$00A0
            LDY   #$0078
            STA   [$FB],Y
            LDA   #$012C
            LDY   #$007A
            STA   [$FB],Y
            LDX   #$FFFF
            LDA   #$FFFF
            LDY   #$007E
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$007C
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0082
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$0080
            STA   [$FB],Y
            LDA   #$000D
            LDY   #$009C
            STA   [$FB],Y
            LDA   #$0011
            LDY   #$009E
            STA   [$FB],Y
            LDA   #$004B
            LDY   #$00A0
            STA   [$FB],Y
            LDA   #$00E5
            LDY   #$00A2
            STA   [$FB],Y
            LDA   #$0006
            LDY   #$00A6
            STA   [$FB],Y
            LDA   #$0003
            LDY   #$00A8
            STA   [$FB],Y
            LDA   $FF
            LDY   #$00AA
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$00AE
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$00AC
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$00B2
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$00B0
            STA   [$FB],Y
            LDA   #$000A
            LDY   #$00B4
            STA   [$FB],Y
            LDA   #$0005
            LDY   #$00B6
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$00BE
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$00BC
            STA   [$FB],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$00C2
            PHA
            TXA
            STA   [$FB],Y
            PLA
            LDY   #$00C0
            STA   [$FB],Y
            TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L014878     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L0148A5
            LDA   #$0000
L0148A5     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
            STX   $F2
            ORA   $F2
            BEQ   L0148BF
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            BRA   L0148C5
L0148BF     LDX   #$0000
            LDA   #$0000
L0148C5     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

sendLDStill
            ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00B0
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0148FA
            PEA   ^L038092	; STill
            PEA   L038092
            JSL   sendLDCommand
            PLY
            PLY
            STA   $F2
            CMP   #$0000
            BEQ   L0148F8
            LDA   $F2
            BRA   L014931
L0148F8     BRA   L01492E
L0148FA     PEI   $FF
            PEA   ^L038095
            PEA   L038095
            PEA   $0000
            TDC
            CLC
            ADC   #$00B2
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00B2
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            STA   $F2
            CMP   #$0000
            BEQ   L01492E
            LDA   $F2
            BRA   L014931
L01492E     LDA   #$0000
L014931     TAY
            TSC
            CLC
            ADC   #$0048
            TCS
            TYA
            PLD
            RTL

L01493B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E0
            TCS
            PEA   $0001
            JSL   L01335E
            PLY
            LDY   #$0004
            LDA   [$F9],Y
            TAX
            LDY   #$0002
            LDA   [$F9],Y
            STX   $E4
            STA   $E2
            PHA
            LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            PHX
            PHA
            _CStringWidth
            BCS   L014974
            LDA   #$0000
L014974     STAL  L020002
            PLA
            STA   $E8
            LDA   #$0001
            STA   $EC
            BRA   L0149DA
L014982     LDY   #$00B6
            LDA   [$F9],Y
            PHA
            LDA   $EC
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDY   #$0004
            LDA   [$F9],Y
            TAX
            LDY   #$0002
            LDA   [$F9],Y
            JSL   L012E77
            PLA
            PLX
            STX   $E4
            STA   $E2
            PHA
            LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            PHX
            PHA
            _CStringWidth
            BCS   L0149C1
            LDA   #$0000
L0149C1     STAL  L020002
            PLA
            STA   $E6
            SEC
            SBC   $E8
            BEQ   L0149D8
            BVS   L0149D2
            EOR   #$8000
L0149D2     BPL   L0149D8
            LDA   $E6
            STA   $E8
L0149D8     INC   $EC
L0149DA     LDY   #$00A4
            LDA   [$F9],Y
            CMP   $EC
            BEQ   L0149E5
            BCS   L014982
L0149E5     LDA   $E8
            CLC
            ADC   #$0024
            STA   $E8
            LDY   #$0076
            LDA   [$F9],Y
            PHA
            LDY   #$007A
            LDA   [$F9],Y
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $E6
            SEC
            SBC   $E8
            BVS   L014A08
            EOR   #$8000
L014A08     BMI   L014A15
            LDA   #$0000
            STA   [$FD]
            LDA   #$0000
            BRL   L014C6E
L014A15     LDA   #$0002
            PHA
            LDA   $E6
            SEC
            SBC   $E8
            SEC
            JSL   L012E82
            PLY
            LDY   #$009E
            STA   [$F9],Y
            LDY   #$009E
            LDA   [$F9],Y
            CLC
            ADC   $E8
            SEC
            SBC   #$0010
            LDY   #$00A2
            STA   [$F9],Y
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$0036
            TAX
            LDA   $FB
            BCC   L014A48
            INC
L014A48     PHA
            PHX
            _NewWindow
            BCS   L014A56
            LDA   #$0000
L014A56     STAL  L020002
            PLA
            PLX
            LDY   #$008A
            PHA
            TXA
            STA   [$F9],Y
            PLA
            LDY   #$0088
            STA   [$F9],Y
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _SetPort
            BCS   L014A82
            LDA   #$0000
L014A82     STAL  L020002
            LDA   #$0001
            STA   $EC
L014A8B     LDA   $EC
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$0026
            LDX   $FB
            BCC   L014A9F
            INX
L014A9F     JSL   L012E77
            PLA
            PLX
            STA   $EE
            STX   $F0
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STX   $EE
            ORA   $EE
            BNE   L014ABA
            BRL   L014B76
L014ABA     LDA   $EC
            CMP   #$0004
            BCC   L014AC4
            BRL   L014B76
L014AC4     PHX
            PHA
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            LDA   $EC
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$0006
            LDX   $FB
            BCC   L014AE8
            INX
L014AE8     JSL   L012E77
            LDA   $EC
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$0026
            LDX   $FB
            BCC   L014B00
            INX
L014B00     JSL   L012E77
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
            PEA   $0003
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   $EC
            SEC
            SBC   #$0001
            LDX   #$0000
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            _NewControl
            BCS   L014B43
            LDA   #$0000
L014B43     STAL  L020002
            LDA   $EC
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$008C
            LDX   $FB
            BCC   L014B5B
            INX
L014B5B     JSL   L012E77
            PLA
            PLX
            STA   $EE
            STX   $F0
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$EE],Y
            PLA
            STA   [$EE]
            INC   $EC
            BRL   L014A8B
L014B76     LDA   $F9
            CLC
            ADC   #$009C
            LDX   $FB
            BCC   L014B81
            INX
L014B81     LDY   #$00C6
            PHA
            TXA
            STA   [$F9],Y
            PLA
            LDY   #$00C4
            STA   [$F9],Y
            PHX
            PHA
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            LDY   #$00C6
            LDA   [$F9],Y
            TAX
            LDY   #$00C4
            LDA   [$F9],Y
            PHX
            PHA
            _CreateList
            BCS   L014BB6
            LDA   #$0000
L014BB6     STAL  L020002
            PLA
            PLX
            LDY   #$00CA
            PHA
            TXA
            STA   [$F9],Y
            PLA
            LDY   #$00C8
            STA   [$F9],Y
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _BeginUpdate
            BCS   L014BE2
            LDA   #$0000
L014BE2     STAL  L020002
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _DrawControls
            BCS   L014BFF
            LDA   #$0000
L014BFF     STAL  L020002
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _EndUpdate
            BCS   L014C1C
            LDA   #$0000
L014C1C     STAL  L020002
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L017112
            PLY
            PLY
            PLY
            PLY
            STA   $EA
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _CloseWindow
            BCS   L014C4B
            LDA   #$0000
L014C4B     STAL  L020002
            LDY   #$0086
            LDA   [$F9],Y
            TAX
            LDY   #$0084
            LDA   [$F9],Y
            PHX
            PHA
            _SetPort
            BCS   L014C68
            LDA   #$0000
L014C68     STAL  L020002
            LDA   $EA
L014C6E     TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PLD
            RTL

L014C78     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000
            PEA   $00E1
            PEA   $2000
            LDX   L0200F4
            LDA   L0200F2
            PHX
            PHA
            JSL   L015EAC
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

llSerialRead
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E4
            TCS
            LDX   #$0000
            LDA   #$C10E	; READ
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDA   #$C100
            PLX
            STX   $F6
            CLC
            ADC   $F6
            STA   $E6
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $00C2
            PEA   $0020
            PEI   $E6
            _FWEntry
            PLA
            STA   $EA
            PLA
            STA   $EC
            PLA
            STA   $E8
            STA   $EE
            PLA
            STA   $F0
            LDA   $EC	; X holds the error code
            BEQ   L014D02
            LDA   #$0002
            BRA   L014D0D
            BRA   L014D0D
L014D02     LDA   $E8	; A holds the character
            SEP   #$20
            STA   [$FD]
            REP   #$20
            LDA   #$0000
L014D0D     TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PLD
            RTL

L014D17     ENT
            PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00CD
            TCS
            LDA   $FF
            PHA
            LDA   $FD
            CLC
            JSL   L012E82
            PLY
            STA   $E0
            LDA   #$00A0
            SEC
            SBC   $FF
            STA   $DA
            LDA   $FB
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            PHA
            LDA   $FB
            AND   #$00FF
            AND   #$000F
            PLX
            STX   $E6
            ORA   $E6
            SEP   #$20
            STA   $D9
            REP   #$20
            LDA   $FB
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $D8
            REP   #$20
            LDA   $FB
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            SEP   #$20
            STA   $D7
            REP   #$20
            LDX   $EF
            LDA   $ED
            STX   $D5
            STA   $D3
            LDA   #$0002
            PHA
            LDA   $F5
            CLC
            JSL   L012E82
            PLY
            LDX   #$0000
            PHX
            PHA
            LDA   $F7
            PHA
            LDA   #$00A0
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $F3
            LDA   $F1
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STX   $D1
            STA   $CF
            LDX   $F3
            LDA   $F1
            CLC
            ADC   #$7D00
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDA   $FD
            LDX   #$0000
            PHX
            PHA
            LDX   $D1
            LDA   $CF
            JSL   L012E77
            PLA
            PLX
            JSL   L013333
            BVS   L014DDA
            EOR   #$8000
L014DDA     BMI   L014DDF
            BRL   L015050
L014DDF     LDA   L0200EC
            BEQ   L014DF4
            _HideCursor
            BCS   L014DF0
            LDA   #$0000
L014DF0     STAL  L020002
L014DF4     LDA   $F9
            AND   #$00FF
            CMP   #$0030
            BNE   L014E33
            LDA   $FD
            CMP   #$74E0
            BNE   L014E33
            PEI   $D5
            PEI   $D3
            LDX   $F3
            LDA   $F1
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $74E0
            _BlockMove
            BCS   L014E2C
            LDA   #$0000
L014E2C     STAL  L020002
            BRL   L01503B
L014E33     LDA   $F9
            AND   #$00FF
            CMP   #$0030
            BNE   L014E93
            STZ   $DE
L014E3F     LDA   $DE
            CMP   $E0
            BCS   L014E90
            PEI   $D5
            PEI   $D3
            PEI   $D1
            PEI   $CF
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            _BlockMove
            BCS   L014E60
            LDA   #$0000
L014E60     STAL  L020002
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            LDX   $D5
            LDA   $D3
            JSL   L012E77
            PLA
            PLX
            STX   $D5
            STA   $D3
            LDX   $D1
            LDA   $CF
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $D1
            STA   $CF
            INC   $DE
            BRA   L014E3F
L014E90     BRL   L01503B
L014E93     LDA   $F9
            AND   #$00FF
            CMP   #$0010
            BEQ   L014EA0
            BRL   L014F6A
L014EA0     STZ   $DE
L014EA2     LDA   $DE
            CMP   $E0
            BCC   L014EAB
            BRL   L014F67
L014EAB     STZ   $DC
L014EAD     LDA   $DC
            CMP   $FF
            BCC   L014EB6
            BRL   L014F4B
L014EB6     LDA   [$D3]
            AND   #$00FF
            PHA
            LDA   $D9
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014ED2
            LDA   [$D3]
            SEP   #$20
            STA   [$CF]
            REP   #$20
            BRA   L014F30
L014ED2     LDA   [$D3]
            AND   #$00FF
            AND   #$000F
            PHA
            LDA   $D8
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014F02
            LDA   $D8
            AND   #$00FF
            PHA
            LDA   [$CF]
            AND   #$00FF
            AND   #$00F0
            PLX
            STX   $E6
            ORA   $E6
            SEP   #$20
            STA   [$CF]
            REP   #$20
            BRA   L014F30
L014F02     LDA   [$D3]
            AND   #$00FF
            AND   #$00F0
            PHA
            LDA   $D7
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014F30
            LDA   $D7
            AND   #$00FF
            PHA
            LDA   [$CF]
            AND   #$00FF
            AND   #$000F
            PLX
            STX   $E6
            ORA   $E6
            SEP   #$20
            STA   [$CF]
            REP   #$20
L014F30     INC   $D3
            BNE   L014F36
            INC   $D5
L014F36     LDX   $D5
            LDA   $D3
            INC   $CF
            BNE   L014F40
            INC   $D1
L014F40     LDX   $D1
            LDA   $CF
            INC   $DC
            LDA   $DC
            BRL   L014EAD
L014F4B     LDA   $DA
            LDX   #$0000
            PHX
            PHA
            LDX   $D1
            LDA   $CF
            JSL   L012E77
            PLA
            PLX
            STX   $D1
            STA   $CF
            INC   $DE
            LDA   $DE
            BRL   L014EA2
L014F67     BRL   L01503B
L014F6A     STZ   $DE
L014F6C     LDA   $DE
            CMP   $E0
            BCC   L014F75
            BRL   L01503B
L014F75     STZ   $DC
L014F77     LDA   $DC
            CMP   $FF
            BCC   L014F80
            BRL   L01501F
L014F80     LDA   [$D3]
            AND   #$00FF
            PHA
            LDA   $D9
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014F96
            BRA   L015004
            BRA   L015004
L014F96     LDA   [$D3]
            AND   #$00FF
            AND   #$000F
            PHA
            LDA   $D8
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014FC9
            LDA   [$D3]
            AND   #$00FF
            AND   #$00F0
            PHA
            LDA   [$CF]
            AND   #$00FF
            AND   #$000F
            PLX
            STX   $E6
            ORA   $E6
            SEP   #$20
            STA   [$CF]
            REP   #$20
            BRA   L015004
L014FC9     LDA   [$D3]
            AND   #$00FF
            AND   #$00F0
            PHA
            LDA   $D7
            AND   #$00FF
            PLX
            STX   $E2
            CMP   $E2
            BNE   L014FFC
            LDA   [$D3]
            AND   #$00FF
            AND   #$000F
            PHA
            LDA   [$CF]
            AND   #$00FF
            AND   #$00F0
            PLX
            STX   $E6
            ORA   $E6
            SEP   #$20
            STA   [$CF]
            REP   #$20
            BRA   L015004
L014FFC     LDA   [$D3]
            SEP   #$20
            STA   [$CF]
            REP   #$20
L015004     INC   $D3
            BNE   L01500A
            INC   $D5
L01500A     LDX   $D5
            LDA   $D3
            INC   $CF
            BNE   L015014
            INC   $D1
L015014     LDX   $D1
            LDA   $CF
            INC   $DC
            LDA   $DC
            BRL   L014F77
L01501F     LDA   $DA
            LDX   #$0000
            PHX
            PHA
            LDX   $D1
            LDA   $CF
            JSL   L012E77
            PLA
            PLX
            STX   $D1
            STA   $CF
            INC   $DE
            LDA   $DE
            BRL   L014F6C
L01503B     LDA   L0200EC
            BEQ   L015050
            _ShowCursor
            BCS   L01504C
            LDA   #$0000
L01504C     STAL  L020002
L015050     TAY
            TSC
            CLC
            ADC   #$0019
            TCS
            TYA
            PLD
            RTL

L01505A     TSC
            TCD
            LDA   [$04]
            TAX
            LDA   $04,S
            TAY
            LDA   $06,S
            TCD
            LDA   $08,S
            TXS
            PHA
            PHD
            PHY
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            INY
            INY
            LDA   [$01],Y
            STA   $08,S
            INY
            INY
            LDA   [$01],Y
            STA   $0A,S
            PLA
            PLA
            PLA
            PLY
            CMP   #$0000
            BNE   L015089
            INC
L015089     PHX
            PLD
            RTL

L01508C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00D0
            TCS
            LDA   #$7FFF
            STA   $D6
            LDX   $F9
            LDA   $F7
            STX   $DA
            STA   $D8
            STX   $DE
            STA   $DC
            LDA   #$0002
            STA   $E6
            LDA   #$0014
            STA   $E8
            LDX   #$0000
            TDC
            CLC
            ADC   #$00FF
            STX   $D4
            STA   $D2
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $D4
            PEI   $D2
            PEI   $FD
            PEI   $FB
            JSL   L017B10
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $EA
            LDA   #$0000
            SEP   #$20
            STA   [$D8]
            REP   #$20
            LDA   $EA
            TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

releaseCommPort
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            JSL   resetCommPort
            STA   $F4
            CMP   #$0000
            BEQ   L01510C
            LDA   $F4
            BRA   L015126
L01510C     PEA   ^L03808D	; R
            PEA   L03808D
            JSL   sendSerialString
            PLY
            PLY
            STA   $F4
            CMP   #$0000
            BEQ   L015123
            LDA   $F4
            BRA   L015126
L015123     LDA   #$0000
L015126     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L015130     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHX
            PHA
            PEA   $0000
            PEA   $0700
            LDA   L02004A
            PHA
            PEA   $C001
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01515C
            LDA   #$0000
L01515C     STAL  L020002
            PLA
            PLX
            STX   L02004E
            STA   L02004C
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015174
            BRL   L0151C4
L015174     _SysBeep
            BCS   L015180
            LDA   #$0000
L015180     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038147
            PEA   L038147
            PEA   ^L038156
            PEA   L038156
            PEA   ^L038164
            PEA   L038164
            PEA   ^L038167
            PEA   L038167
            _TLMountVolume
            BCS   L0151AF
            LDA   #$0000
L0151AF     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0151C4     LDX   L02004E
            LDA   L02004C
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHA
            PEA   $0000
            PEA   $00A0
            LDA   L02004A
            PHA
            _QDStartUp
            BCS   L0151ED
            LDA   #$0000
L0151ED     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L0151FD
            BRL   L01524D
L0151FD     _SysBeep
            BCS   L015209
            LDA   #$0000
L015209     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038168
            PEA   L038168
            PEA   ^L038176
            PEA   L038176
            PEA   ^L038180
            PEA   L038180
            PEA   ^L038183
            PEA   L038183
            _TLMountVolume
            BCS   L015238
            LDA   #$0000
L015238     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L01524D     _QDAuxStartUp
            BCS   L015259
            LDA   #$0000
L015259     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015269
            BRL   L0152B9
L015269     _SysBeep
            BCS   L015275
            LDA   #$0000
L015275     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038184
            PEA   L038184
            PEA   ^L038192
            PEA   L038192
            PEA   ^L0381A0
            PEA   L0381A0
            PEA   ^L0381A3
            PEA   L0381A3
            _TLMountVolume
            BCS   L0152A4
            LDA   #$0000
L0152A4     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0152B9     LDX   L02004E
            LDA   L02004C
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            CLC
            ADC   #$0300
            PHA
            TXA
            ADC   #$0000
            TAX
            PEA   $0014
            PEA   $0000
            PEA   $0140
            PEA   $0000
            PEA   $00C8
            LDA   L02004A
            PHA
            _EMStartUp
            BCS   L0152F4
            LDA   #$0000
L0152F4     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015304
            BRL   L015354
L015304     _SysBeep
            BCS   L015310
            LDA   #$0000
L015310     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0381A4
            PEA   L0381A4
            PEA   ^L0381B2
            PEA   L0381B2
            PEA   ^L0381C0
            PEA   L0381C0
            PEA   ^L0381C3
            PEA   L0381C3
            _TLMountVolume
            BCS   L01533F
            LDA   #$0000
L01533F     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L015354     LDA   L02004A
            PHA
            _WindStartUp
            BCS   L015364
            LDA   #$0000
L015364     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015374
            BRL   L0153C4
L015374     _SysBeep
            BCS   L015380
            LDA   #$0000
L015380     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0381C4
            PEA   L0381C4
            PEA   ^L0381D2
            PEA   L0381D2
            PEA   ^L0381E1
            PEA   L0381E1
            PEA   ^L0381E4
            PEA   L0381E4
            _TLMountVolume
            BCS   L0153AF
            LDA   #$0000
L0153AF     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0153C4     PEA   $0000
            PEA   $0000
            _RefreshDesktop
            BCS   L0153D6
            LDA   #$0000
L0153D6     STAL  L020002
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
            ADC   #$0400
            PHA
            TXA
            ADC   #$0000
            TAX
            _CtlStartUp
            BCS   L015406
            LDA   #$0000
L015406     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015416
            BRL   L015466
L015416     _SysBeep
            BCS   L015422
            LDA   #$0000
L015422     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0381E5
            PEA   L0381E5
            PEA   ^L0381F3
            PEA   L0381F3
            PEA   ^L038203
            PEA   L038203
            PEA   ^L038206
            PEA   L038206
            _TLMountVolume
            BCS   L015451
            LDA   #$0000
L015451     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L015466     LDA   L02004A
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
            ADC   #$0500
            PHA
            TXA
            ADC   #$0000
            TAX
            _MenuStartUp
            BCS   L015492
            LDA   #$0000
L015492     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L0154A2
            BRL   L0154F2
L0154A2     _SysBeep
            BCS   L0154AE
            LDA   #$0000
L0154AE     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038207
            PEA   L038207
            PEA   ^L038215
            PEA   L038215
            PEA   ^L038222
            PEA   L038222
            PEA   ^L038225
            PEA   L038225
            _TLMountVolume
            BCS   L0154DD
            LDA   #$0000
L0154DD     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0154F2     LDA   L02004A
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
            ADC   #$0600
            PHA
            TXA
            ADC   #$0000
            TAX
            _LEStartUp
            BCS   L01551E
            LDA   #$0000
L01551E     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L01552E
            BRL   L01557E
L01552E     _SysBeep
            BCS   L01553A
            LDA   #$0000
L01553A     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038226
            PEA   L038226
            PEA   ^L038234
            PEA   L038234
            PEA   ^L03823E
            PEA   L03823E
            PEA   ^L038241
            PEA   L038241
            _TLMountVolume
            BCS   L015569
            LDA   #$0000
L015569     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L01557E     LDA   L02004A
            PHA
            _DialogStartUp
            BCS   L01558E
            LDA   #$0000
L01558E     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L01559E
            BRL   L0155EE
L01559E     _SysBeep
            BCS   L0155AA
            LDA   #$0000
L0155AA     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038242
            PEA   L038242
            PEA   ^L038250
            PEA   L038250
            PEA   ^L03825F
            PEA   L03825F
            PEA   ^L038262
            PEA   L038262
            _TLMountVolume
            BCS   L0155D9
            LDA   #$0000
L0155D9     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0155EE     _ListStartUp
            BCS   L0155FA
            LDA   #$0000
L0155FA     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L01560A
            BRL   L01565A
L01560A     _SysBeep
            BCS   L015616
            LDA   #$0000
L015616     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038263
            PEA   L038263
            PEA   ^L038271
            PEA   L038271
            PEA   ^L03827E
            PEA   L03827E
            PEA   ^L038281
            PEA   L038281
            _TLMountVolume
            BCS   L015645
            LDA   #$0000
L015645     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L01565A     LDA   L02004A
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
            ADC   #$0700
            PHA
            TXA
            ADC   #$0000
            TAX
            _FMStartUp
            BCS   L015686
            LDA   #$0000
L015686     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015696
            BRL   L0156E6
L015696     _SysBeep
            BCS   L0156A2
            LDA   #$0000
L0156A2     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L038282
            PEA   L038282
            PEA   ^L038290
            PEA   L038290
            PEA   ^L03829D
            PEA   L03829D
            PEA   ^L0382A0
            PEA   L0382A0
            _TLMountVolume
            BCS   L0156D1
            LDA   #$0000
L0156D1     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0156E6     _VDStartUp
            BCS   L0156F2
            LDA   #$0000
L0156F2     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L015702
            BRL   L015752
L015702     _SysBeep
            BCS   L01570E
            LDA   #$0000
L01570E     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0382A1
            PEA   L0382A1
            PEA   ^L0382AF
            PEA   L0382AF
            PEA   ^L0382BB
            PEA   L0382BB
            PEA   ^L0382BE
            PEA   L0382BE
            _TLMountVolume
            BCS   L01573D
            LDA   #$0000
L01573D     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L015752     LDA   L02004A
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
            BCS   L01577E
            LDA   #$0000
L01577E     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L01578E
            BRL   L0157DE
L01578E     _SysBeep
            BCS   L01579A
            LDA   #$0000
L01579A     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0382BF
            PEA   L0382BF
            PEA   ^L0382CD
            PEA   L0382CD
            PEA   ^L0382DA
            PEA   L0382DA
            PEA   ^L0382DD
            PEA   L0382DD
            _TLMountVolume
            BCS   L0157C9
            LDA   #$0000
L0157C9     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L0157DE     _DeskStartUp
            BCS   L0157EA
            LDA   #$0000
L0157EA     STAL  L020002
            LDA   L020002
            STA   L0200F6
            TAY
            BNE   L0157FA
            BRL   L01584A
L0157FA     _SysBeep
            BCS   L015806
            LDA   #$0000
L015806     STAL  L020002
            PHA
            PEA   $0014
            PEA   $001E
            PEA   ^L0382DE
            PEA   L0382DE
            PEA   ^L0382EC
            PEA   L0382EC
            PEA   ^L0382F9
            PEA   L0382F9
            PEA   ^L0382FC
            PEA   L0382FC
            _TLMountVolume
            BCS   L015835
            LDA   #$0000
L015835     STAL  L020002
            PLA
            PEA   $0017
            PEA   ^L031DCA
            PEA   L031DCA
            JSL   L01505A
            PLY
            PLY
            PLY
L01584A     _ShowCursor
            BCS   L015856
            LDA   #$0000
L015856     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L015862     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            PHX
            PHA
            LDA   $FB
            PHA
            LDA   #$0005
            SEC
            JSL   L013003
            PLA
            LDX   #$0000
            TAY
            BPL   L015882
            DEX
L015882     PHX
            PHA
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01589D
            LDA   #$0000
L01589D     STAL  L020002
            PLA
            PLX
            STX   L0200FC
            STA   L0200FA
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L0158C6
            PEI   $EE
            PEA   ^L037FB0
            PEA   L037FB0
            JSL   L050256
            PLY
            PLY
            PLY
            LDA   #$0000
            BRL   L015927
L0158C6     LDX   L0200FC
            LDA   L0200FA
            PHX
            PHA
            _HLock
            BCS   L0158DA
            LDA   #$0000
L0158DA     STAL  L020002
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L0158FA
            PEI   $EE
            PEA   ^L037FDD
            PEA   L037FDD
            JSL   L050256
            PLY
            PLY
            PLY
            LDA   #$0000
            BRA   L015927
L0158FA     STZ   L0200FE
            PEA   $0000
            TDC
            CLC
            ADC   #$00FD
            PHA
            JSL   L015BBF
            PLY
            PLY
            LDX   L0200FC
            LDA   L0200FA
            PHX
            PHA
            _HUnlock
            BCS   L015920
            LDA   #$0000
L015920     STAL  L020002
            LDA   #$0001
L015927     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L015931     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            _GrafOff
            BCS   L015948
            LDA   #$0000
L015948     STAL  L020002
            _VDShutDown
            BCS   L015958
            LDA   #$0000
L015958     STAL  L020002
            _FMShutDown
            BCS   L015968
            LDA   #$0000
L015968     STAL  L020002
            _ListShutDown
            BCS   L015978
            LDA   #$0000
L015978     STAL  L020002
            _DialogShutDown
            BCS   L015988
            LDA   #$0000
L015988     STAL  L020002
            _LEShutDown
            BCS   L015998
            LDA   #$0000
L015998     STAL  L020002
            _MenuShutDown
            BCS   L0159A8
            LDA   #$0000
L0159A8     STAL  L020002
            _CtlShutDown
            BCS   L0159B8
            LDA   #$0000
L0159B8     STAL  L020002
            _WindShutDown
            BCS   L0159C8
            LDA   #$0000
L0159C8     STAL  L020002
            _EMShutDown
            BCS   L0159D8
            LDA   #$0000
L0159D8     STAL  L020002
            _QDShutDown
            BCS   L0159E8
            LDA   #$0000
L0159E8     STAL  L020002
            _QDAuxShutDown
            BCS   L0159F8
            LDA   #$0000
L0159F8     STAL  L020002
            _SFShutDown
            BCS   L015A08
            LDA   #$0000
L015A08     STAL  L020002
            _DeskShutDown
            BCS   L015A18
            LDA   #$0000
L015A18     STAL  L020002
            _MTShutDown
            BCS   L015A28
            LDA   #$0000
L015A28     STAL  L020002
            LDA   L02004A
            PHA
            _DisposeAll
            BCS   L015A3C
            LDA   #$0000
L015A3C     STAL  L020002
            LDA   L02004A
            PHA
            _MMShutDown
            BCS   L015A50
            LDA   #$0000
L015A50     STAL  L020002
            _TLShutDown
            BCS   L015A60
            LDA   #$0000
L015A60     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

sendLDCharDisplay
            ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            BEQ   L015A89
            PEA   ^L0380A6	; 1DS Character display on
            PEA   L0380A6
            JSL   sendLDCommand
            PLY
            PLY
            BRA   L015A95
L015A89     PEA   ^L0380AA	; 0DS Character dispaly off
            PEA   L0380AA
            JSL   sendLDCommand
            PLY
            PLY
L015A95     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

sendLDKeyLock
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            BEQ   L015ABC
            PEA   ^L0380AE	; 1KL
            PEA   L0380AE
            JSL   sendLDCommand
            PLY
            PLY
            BRA   L015AC8
L015ABC     PEA   ^L0380B2	; 0KL
            PEA   L0380B2
            JSL   sendLDCommand
            PLY
            PLY
L015AC8     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L015AD2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            LDX   L020092
            LDA   L020090
            STX   $F4
            STA   $F2
            LDX   #$0000
            LDA   #$0020
            PHX
            PHA
            LDX   L0200C2
            LDA   L0200C0
            CLC
            JSL   L012F07
            PLY
            PLY
            STX   $EC
            STA   $EA
            STZ   $EE
            STZ   $F0
            BRA   L015B2C
L015B06     LDA   #$0D2D
            LDY   #$001C
            STA   [$F2],Y
            INC   $EE
            BNE   L015B14
            INC   $F0
L015B14     LDX   $F0
            LDA   $EE
            LDX   $F4
            LDA   $F2
            CLC
            ADC   #$0020
            STA   $F2
            PHA
            LDA   $F4
            BCC   L015B28
            INC
L015B28     TAX
            STA   $F4
            PLA
L015B2C     SEC
            LDA   $EE
            SBC   $EA
            BNE   L015B39
            LDA   $F0
            SBC   $EC
            BRA   L015B3F
L015B39     LDA   $F0
            SBC   $EC
            REP   #$02
L015B3F     BCC   L015B06
            TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L015B49     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E2
            TCS
            PEA   ^L0380B6
            PEA   L0380B6
            JSL   L017084
            PLY
            PLY
            STA   $F4
            CMP   #$0000
            BEQ   L015B6C
            LDA   #$0000
            BRA   L015B98
L015B6C     PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   receiveString
            PLY
            PLY
            STA   $F4
            CMP   #$0000
            BEQ   L015B89
            LDA   #$0000
            BRA   L015B98
            BRA   L015B98
L015B89     PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L013150
            PLY
            PLY
L015B98     TAY
            TSC
            CLC
            ADC   #$0018
            TCS
            TYA
            PLD
            RTL

L015BA2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDAL  $01C034
            STA   $F4
            LDA   $F4
            TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L015BBF     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDA   L0200FE
            STA   $EC
            LDX   #$0000
            TAY
            BPL   L015BD6
            DEX
L015BD6     PEA   $0000
            PEA   $0005
            CLC
            JSL   L013048
            LDX   L0200FC
            LDA   L0200FA
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L012E77
            PLA
            PLX
            STX   $F0
            STA   $EE
            INC   L0200FE
            PEA   $0005
            PEA   $0000
            PEI   $F0
            PEI   $EE
            JSL   L013EB9
            PLY
            PLY
            PLY
            PLY
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$0080
            BNE   L015C70
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$FD]
            LDY   #$0002
            LDA   [$FD],Y
            BCC   L015C40
            INC
L015C40     LDY   #$0002
            STA   [$FD],Y
            PLA
            PLX
            LDA   #$0080
            SEP   #$20
            STA   [$EE]
            REP   #$20
            PEI   $FF
            PEI   $FD
            JSL   L015BBF
            PLY
            PLY
            LDY   #$0001
            STA   [$EE],Y
            PEI   $FF
            PEI   $FD
            JSL   L015BBF
            PLY
            PLY
            LDY   #$0003
            STA   [$EE],Y
            BRA   L015CCE
L015C70     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$000D
            BNE   L015C8B
            LDA   #$000A
            BRA   L015C9C
L015C8B     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
L015C9C     SEP   #$20
            STA   [$EE]
            REP   #$20
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$FD]
            LDY   #$0002
            LDA   [$FD],Y
            BCC   L015CBA
            INC
L015CBA     LDY   #$0002
            STA   [$FD],Y
            PLA
            PLX
            LDA   #$FFFF
            LDY   #$0003
            STA   [$EE],Y
            LDY   #$0001
            STA   [$EE],Y
L015CCE     LDA   $EC
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L015CDA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            AND   #$00FF
            AND   #$000F
            STA   $F2
            LDAL  $01C034
            AND   #$FFF0
            ORA   $F2
            STAL  $01C034
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L015D04     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E6
            TCS
            LDA   #$0001
            STA   $E8
            LDA   $FD
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L015D39
            LDAL  L031DD2
            CMP   $FB
            BEQ   L015D2B
            STZ   $E8
            BRA   L015D39
L015D2B     LDA   $FD
            AND   #$00FF
            EOR   #$0001
            SEP   #$20
            STA   $FD
            REP   #$20
L015D39     LDA   $FD
            AND   #$00FF
            AND   #$0002
            TAY
            BEQ   L015D5E
            LDAL  L031DD4
            CMP   $FB
            BEQ   L015D50
            STZ   $E8
            BRA   L015D5E
L015D50     LDA   $FD
            AND   #$00FF
            EOR   #$0002
            SEP   #$20
            STA   $FD
            REP   #$20
L015D5E     LDA   $E8
            BEQ   L015D65
            BRL   L015EA2
L015D65     LDA   $FB
            CMP   #$0000
            BNE   L015D70
            JSL   L012BFB
L015D70     LDA   $FB
            CMP   #$0000
            BNE   L015D7B
            STZ   $EC
            BRA   L015D80
L015D7B     LDA   #$FFFF
            STA   $EC
L015D80     LDA   $FF
            BNE   L015D89
            LDA   #$0006
            STA   $FF
L015D89     LDA   $FF
            CMP   #$0014
            BEQ   L015D97
            BCC   L015D97
            LDA   #$0014
            STA   $FF
L015D97     LDA   $FF
            PHA
            LDA   #$FFFF
            CLC
            JSL   L012E82
            PLY
            STA   $EA
            STZ   $EE
            BRA   L015E19
L015DA9     LDA   $FD
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L015DC6
            PEI   $EC
            _VDKeySetKDiss
            BCS   L015DC2
            LDA   #$0000
L015DC2     STAL  L020002
L015DC6     LDA   $FD
            AND   #$00FF
            AND   #$0002
            TAY
            BEQ   L015DE3
            PEI   $EC
            _VDKeySetNKDiss
            BCS   L015DDF
            LDA   #$0000
L015DDF     STAL  L020002
L015DE3     LDA   $FB
            CMP   #$0000
            BNE   L015DEE
            LDA   $EA
            BRA   L015DF4
L015DEE     LDA   $EA
            EOR   #$FFFF
            INC
L015DF4     PHA
            LDA   $EC
            PLX
            STX   $F4
            CLC
            ADC   $F4
            STA   $EC
            LDA   $FF
            SEC
            SBC   #$0001
            CMP   $EE
            BEQ   L015E17
            BCC   L015E17
            PEA   $0000
            PEA   $0002
            JSL   L013212
            PLY
            PLY
L015E17     INC   $EE
L015E19     LDA   $EE
            CMP   $FF
            BCC   L015DA9
            LDA   $FB
            CMP   #$0000
            BNE   L015E2B
            LDA   #$FFFF
            BRA   L015E2E
L015E2B     LDA   #$0000
L015E2E     STA   $EC
            LDA   $FD
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L015E4D
            PEI   $EC
            _VDKeySetKDiss
            BCS   L015E49
            LDA   #$0000
L015E49     STAL  L020002
L015E4D     LDA   $FD
            AND   #$00FF
            AND   #$0002
            TAY
            BEQ   L015E6A
            PEI   $EC
            _VDKeySetNKDiss
            BCS   L015E66
            LDA   #$0000
L015E66     STAL  L020002
L015E6A     LDA   $FD
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L015E7B
            LDA   $FB
            STAL  L031DD2
L015E7B     LDA   $FD
            AND   #$00FF
            AND   #$0002
            TAY
            BEQ   L015E8C
            LDA   $FB
            STAL  L031DD4
L015E8C     LDAL  L031DD4
            CMP   #$0001
            BNE   L015EA2
            LDAL  L031DD2
            CMP   #$0001
            BNE   L015EA2
            JSL   L012E00
L015EA2     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L015EAC     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$FF5E
            TCS
            LDA   L0200EC
            BEQ   L015ECC
            _HideCursor
            BCS   L015EC8
            LDA   #$0000
L015EC8     STAL  L020002
L015ECC     LDA   $FF
            AND   #$00FF
            BRL   L0168B5
L015ED4     LDA   #$008C
            STA   $D6
            LDA   #$0057
            STA   $D8
            LDA   #$0028
            STA   $DA
            LDA   #$0017
            STA   $DC
            LDA   #$0001
            STA   $E4
            BRA   L015F2E
L015EEF     PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $D6
            SEC
            SBC   #$000A
            STA   $D6
            LDA   $D8
            SEC
            SBC   #$0005
            STA   $D8
            LDA   $DA
            CLC
            ADC   #$0014
            STA   $DA
            LDA   $DC
            CLC
            ADC   #$000C
            STA   $DC
            INC   $E4
L015F2E     LDA   $E4
            CMP   #$000C
            BEQ   L015EEF
            BCC   L015EEF
            LDA   #$0000
            STA   $D6
            LDA   #$000D
            STA   $D8
            LDA   #$0140
            STA   $DA
            LDA   #$00BB
            STA   $DC
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L0168C2
L015F6B     LDA   #$0000
            STA   $D6
            LDA   #$00C7
            STA   $E0
            LDA   #$00A0
            STA   $D2
            STA   $DA
            STA   $CE
            LDA   #$0001
            STA   $D4
            STA   $DC
            LDA   #$000D
            STA   $E4
            BRA   L015FD2
L015F8C     LDA   $E0
            DEC   $E0
            STA   $D8
            LDA   $E4
            STA   $D0
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00CE
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            INC   $E4
L015FD2     LDA   $E4
            CMP   #$00C7
            BEQ   L015F8C
            BCC   L015F8C
            BRL   L0168C2
L015FDE     LDA   #$0001
            STA   $DC
            LDA   #$0140
            STA   $DA
            LDA   #$0000
            STA   $D6
            LDA   #$000D
            STA   $E4
            BRA   L016035
L015FF4     LDA   $E4
            STA   $E0
            LDA   #$0001
            STA   $E2
            BRA   L01602A
L015FFF     LDA   $E0
            STA   $D8
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $E0
            CLC
            ADC   #$001F
            STA   $E0
            INC   $E2
L01602A     LDA   $E2
            CMP   #$0006
            BEQ   L015FFF
            BCC   L015FFF
            INC   $E4
L016035     LDA   $E4
            CMP   #$002B
            BEQ   L015FF4
            BCC   L015FF4
            LDA   #$00C7
            STA   $D8
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L0168C2
L016063     LDA   #$000D
            STA   $E0
            STZ   $DE
            STZ   $E4
            BRL   L0160F7
L01606F     STZ   $E2
            BRA   L0160E2
L016073     LDA   $E2
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $E4
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0026
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   $DE
            LDY   #$0002
            STA   [$EC],Y
            LDA   $E2
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $E4
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0026
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   $E0
            STA   [$EC]
            LDA   $DE
            CLC
            ADC   #$0028
            STA   $DE
            INC   $E2
L0160E2     LDA   $E2
            CMP   #$0007
            BEQ   L016073
            BCC   L016073
            LDA   $E0
            CLC
            ADC   #$0025
            STA   $E0
            STZ   $DE
            INC   $E4
L0160F7     LDA   $E4
            CMP   #$0004
            BNE   L016101
            BRL   L01606F
L016101     BCS   L016106
            BRL   L01606F
L016106     LDX   #$0000
            TDC
            CLC
            ADC   #$FF60
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0003
            LDX   #$FF60
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF64
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0007
            LDX   #$FF64
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF68
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0005
            LDX   #$FF68
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF6C
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0001
            LDX   #$FF6C
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF70
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0005
            LDX   #$FF70
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF74
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0002
            LDX   #$FF74
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF78
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0006
            LDX   #$FF78
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF7C
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0007
            LDX   #$FF7C
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0003
            LDX   #$FF80
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF84
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0001
            LDX   #$FF84
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF88
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0004
            LDX   #$FF88
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF8C
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0000
            LDX   #$FF8C
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF90
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0003
            LDX   #$FF90
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF94
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0007
            LDX   #$FF94
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF98
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0006
            LDX   #$FF98
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF9C
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0002
            LDX   #$FF9C
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFA0
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0001
            LDX   #$FFA0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFA4
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0005
            LDX   #$FFA4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFA8
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0000
            LDX   #$FFA8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFAC
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0000
            LDX   #$FFAC
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFB0
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0004
            LDX   #$FFB0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFB4
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0002
            LDX   #$FFB4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFB8
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0006
            LDX   #$FFB8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFBC
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0001
            LDX   #$FFBC
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFC0
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0006
            LDX   #$FFC0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFC4
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0002
            LDX   #$FFC4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFC8
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0007
            LDX   #$FFC8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFCC
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0000
            LDX   #$FFCC
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFD0
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0006
            LDX   #$FFD0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFD4
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0004
            LDX   #$FFD4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFD8
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0000
            LDX   #$FFD8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFDC
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0005
            LDX   #$FFDC
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFE0
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0003
            LDX   #$FFE0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFE4
            STA   $EC
            STX   $EE
            LDA   #$0002
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0005
            LDX   #$FFE4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFE8
            STA   $EC
            STX   $EE
            LDA   #$0003
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0007
            LDX   #$FFE8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFEC
            STA   $EC
            STX   $EE
            LDA   #$0004
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0002
            LDX   #$FFEC
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFF0
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0004
            LDX   #$FFF0
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFF4
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0004
            LDX   #$FFF4
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFF8
            STA   $EC
            STX   $EE
            LDA   #$0001
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0003
            LDX   #$FFF8
            STA   $00,X
            LDX   #$0000
            TDC
            CLC
            ADC   #$FFFC
            STA   $EC
            STX   $EE
            LDA   #$0000
            LDY   #$0002
            STA   [$EC],Y
            LDA   #$0001
            LDX   #$FFFC
            STA   $00,X
            LDA   #$0028
            STA   $DA
            LDA   #$0026
            STA   $DC
            STZ   $E4
            BRL   L01666B
L016575     LDA   $E4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF60
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $E4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF60
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0026
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STA   $D6
            LDA   $E4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF60
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $E4
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF60
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            ASL
            ASL
            ASL
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0026
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   [$EC]
            STA   $D8
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            INC   $E4
L01666B     LDA   $E4
            CMP   #$0027
            BNE   L016675
            BRL   L016575
L016675     BCS   L01667A
            BRL   L016575
L01667A     LDA   #$0000
            STA   $D6
            LDA   #$000D
            STA   $D8
            LDA   #$0140
            STA   $DA
            LDA   #$0002
            STA   $DC
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   $F9
            LDA   $F7
            CLC
            ADC   #$7C60
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            CLC
            ADC   #$7C60
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $00A0
            _BlockMove
            BCS   L0166DF
            LDA   #$0000
L0166DF     STAL  L020002
            BRL   L0168C2
L0166E6     PHP
            PHA
            PHY
            REP   #$20
            LDY   #$0820
L0166EE     LDA   [$F7],Y
            STA   [$FB],Y
            INY
            INY
            CPY   #$7D00
            BNE   L0166EE
            PLY
            PLA
            PLP
            BRL   L0168C2
L0166FF     PHP
            PHA
            PHX
            PHY
            REP   #$20
            LDA   #$0820
            STA   $EA
L01670A     LDX   #$000D
            LDA   #$0000
            CLC
            ADC   $EA
            TAY
L016714     LDA   [$F7],Y
            STA   [$FB],Y
            TYA
            CLC
            ADC   #$00A0
            TAY
            INX
            CPX   #$00C8
            BNE   L016714
            LDY   $EA
            INY
            INY
            STY   $EA
            CPY   #$08C0
            BNE   L01670A
            PLY
            PLX
            PLA
            PLP
            BRL   L0168C2
L016736     PHP
            PHA
            PHX
            PHY
            REP   #$20
            LDA   #$08BE
            STA   $EA
L016741     LDX   #$000D
            LDA   #$0000
            CLC
            ADC   $EA
            TAY
L01674B     LDA   [$F7],Y
            STA   [$FB],Y
            TYA
            CLC
            ADC   #$00A0
            TAY
            INX
            CPX   #$00C8
            BNE   L01674B
            LDY   $EA
            DEY
            DEY
            STY   $EA
            CPY   #$0820
            BPL   L016741
            PLY
            PLX
            PLA
            PLP
            BRL   L0168C2
L01676D     PHP
            PHA
            PHX
            PHY
            REP   #$20
            LDA   #$0014
            STA   $E8
            LDA   #$0000
            STA   $E6
            LDA   #$0820
            STA   $EA
L016782     LDX   #$000D
            LDA   #$0000
            CLC
            ADC   $EA
            TAY
L01678C     SEP   #$20
            LDA   [$F7],Y
            STA   [$FB],Y
            REP   #$20
            TYA
            CLC
            ADC   #$00A0
            TAY
            INX
            CPX   #$00C8
            BNE   L01678C
            LDA   $EA
            CLC
            ADC   $E8
            STA   $EA
            CMP   #$08C0
            BMI   L016782
            LDY   $E6
            INY
            STY   $E6
            LDA   #$0820
            CLC
            ADC   $E6
            STA   $EA
            CPY   $E8
            BNE   L016782
            PLY
            PLX
            PLA
            PLP
            BRL   L0168C2
L0167C4     LDA   #$7C60
            STA   $E2
            LDA   #$0820
            STA   $E0
            LDA   #$0001
            STA   $E4
            BRA   L01684F
L0167D5     LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PEA   $0000
            PEA   $00A0
            _BlockMove
            BCS   L016805
            LDA   #$0000
L016805     STAL  L020002
            LDA   $E2
            LDX   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            LDA   $E2
            LDX   #$0000
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PEA   $0000
            PEA   $00A0
            _BlockMove
            BCS   L016839
            LDA   #$0000
L016839     STAL  L020002
            LDA   $E2
            SEC
            SBC   #$00A0
            STA   $E2
            LDA   $E0
            CLC
            ADC   #$00A0
            STA   $E0
            INC   $E4
L01684F     LDA   $E4
            CMP   #$005E
            BNE   L016859
            BRL   L0167D5
L016859     BCS   L01685E
            BRL   L0167D5
L01685E     BRL   L0168C2
L016861     LDX   $F9
            LDA   $F7
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            PEA   $74E0
            _BlockMove
            BCS   L016895
            LDA   #$0000
L016895     STAL  L020002
            BRL   L0168C2
            BRL   L0168C2
L01689F     DA    L016861
            DA    L01676D
            DA    L015ED4
            DA    L015F6B
            DA    L015FDE
            DA    L0166FF
            DA    L016063
            DA    L016736
            DA    L0167C4
            DA    L0166E6
            DA    L016861
L0168B5     CMP   #$000A
            BCC   L0168BD
            LDA   #$000A
L0168BD     ASL
            TAX
            JMP   (L01689F,X)

L0168C2     LDA   L0200EC
            BEQ   L0168D7
            _ShowCursor
            BCS   L0168D3
            LDA   #$0000
L0168D3     STAL  L020002
L0168D7     TSC
            CLC
            ADC   #$0192
            TCS
            PLD
            RTL

L0168DF     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   #$0000
            AND   #$00FF
            PHA
            PEA   $0001
            JSL   L012C5A
            PLY
            PLY
            _DrawMenuBar
            BCS   L016906
            LDA   #$0000
L016906     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L016912     PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00D8
            TCS
            LDA   #$FFFF
            STA   $E2
            STZ   $DE
L016924     LDA   #$0001
            BNE   L01692C
            BRL   L0169A5
L01692C     LDA   #$0002
            PHA
            LDA   $F9
            CLC
            ADC   $DE
            CLC
            JSL   L012E82
            PLY
            STA   $E4
            LDA   $E4
            CMP   $E2
            BNE   L016948
            LDA   #$FFFF
            BRA   L0169A5
L016948     LDA   $E4
            PHA
            LDA   $FB
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STX   $DC
            STA   $DA
            PEI   $DC
            PEI   $DA
            PEI   $F3
            PEI   $F1
            LDA   $FD
            LDX   $FF
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            STA   $E0
            CMP   #$0000
            BNE   L016987
            LDA   $E4
            BRA   L0169A5
            BRA   L0169A2
L016987     LDA   $E0
            SEC
            SBC   #$0000
            BVS   L016992
            EOR   #$8000
L016992     BMI   L01699C
            LDA   $E4
            STA   $E2
            STA   $F9
            BRA   L0169A2
L01699C     LDA   $E4
            STA   $E2
            STA   $DE
L0169A2     BRL   L016924
L0169A5     TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PLD
            RTL

getSerialInputStatus
            PHD		; serial: is input ready?
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0001
            JSL   llSerialStatus	; Do you have input ready?
            PLY		; 0: no, not ready
            TAY		; 1: yes, ready
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L0169CC     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   #L038578
            LDX   #^L038578
            STX   $F2
            STA   $F0
L0169E1     LDY   #$0004
            LDA   [$F0],Y
            TAX
            LDY   #$0002
            LDA   [$F0],Y
            STX   $F4
            ORA   $F4
            BEQ   L016A27
            LDA   [$F0]
            CMP   $FF
            BNE   L016A19
            LDY   #$0008
            LDA   [$F0],Y
            TAX
            LDY   #$0006
            LDA   [$F0],Y
            PHX
            PHA
            PEA   ^L038708
            PEA   L038708
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            LDX   $F2
            LDA   $F0
            BRA   L016A2D
L016A19     LDA   $F0
            CLC
            ADC   #$000A
            STA   $F0
            BCC   L016A25
            INC   $F2
L016A25     BRA   L0169E1
L016A27     LDX   #$0000
            LDA   #$0000
L016A2D     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L016A37     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$0092
            TCS
            STZ   $E4
            PEI   $F7
            PEI   $F5
            PEA   $0000
            TDC
            CLC
            ADC   #$00BC
            PHA
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            PEI   $FB
            PEI   $F9
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
            PEA   $0000
            TDC
            CLC
            ADC   #$00BC
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
            LDA   #L037DCD
            LDX   #^L037DCD
            PHA
            TXA
            STAL  L037D5B
            PLA
            STAL  L037D59
            LDX   #$0000
            TDC
            CLC
            ADC   #$00BC
            PHA
            TXA
            STAL  L037D73
            PLA
            STAL  L037D71
            LDX   #$0000
            TDC
            CLC
            ADC   #$0094
            PHA
            TXA
            STAL  L037D8B
            PLA
            STAL  L037D89
L016AC3     LDA   $E4
            BEQ   L016ACA
            BRL   L016B3A
L016ACA     PHA
            PEA   ^L037D95
            PEA   L037D95
            PEA   $0000
            PEA   $0000
            _CautionAlert
            BCS   L016AE3
            LDA   #$0000
L016AE3     STAL  L020002
            PLA
            STA   $E8
            LDA   $E8
            CMP   #$0001
            BNE   L016B12
            JSL   L014C78
            PEI   $FF
            PEI   $FD
            _DrawControls
            BCS   L016B05
            LDA   #$0000
L016B05     STAL  L020002
            LDA   #$0001
            STA   $E4
            STA   $E6
            BRA   L016B38
L016B12     LDA   $E8
            CMP   #$0002
            BNE   L016B38
            JSL   L014C78
            PEI   $FF
            PEI   $FD
            _DrawControls
            BCS   L016B2D
            LDA   #$0000
L016B2D     STAL  L020002
            STZ   $E6
            LDA   #$0001
            STA   $E4
L016B38     BRA   L016AC3
L016B3A     LDA   $E6
            TAY
            TSC
            CLC
            ADC   #$005C
            TCS
            TYA
            PLD
            RTL

L016B46     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            BEQ   L016B70
            LDA   #$0001	; char display on
            BRA   L016B73
L016B70     LDA   #$0000	; char display off
L016B73     PHA
            JSL   sendLDCharDisplay
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L016B81     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            PHA
            LDX   L020082
            LDA   L020080
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            STX   $EC
            STA   $EA
            PEI   $EC
            PEI   $EA
            JSL   L016F2D
            PLY
            PLY
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

receiveString
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EB
            TCS
            LDX   $FF
            LDA   $FD
            STX   $EF
            STA   $ED
            SEP   #$20
            STZ   $F1
            REP   #$20
L016BE0     LDA   $F1
            AND   #$00FF
            CMP   #$000D
            BEQ   L016C38
            JSL   checkInputReady	; ready to read a character?
            CMP   #$0001
            BNE   L016BFD
            LDA   L020100
            BEQ   L016BFD
            LDA   #$0001
            BRA   L016C44
L016BFD     PEA   $0000
            TDC
            CLC
            ADC   #$00F1
            PHA
            JSL   llSerialRead	; 0: char read, 2: error encountered
            PLY
            PLY
            CMP   #$0002
            BNE   L016C16
            LDA   #$0002
            BRA   L016C44
L016C16     LDA   $F1
            AND   #$00FF
            CMP   #$000D
            BEQ   L016C36
            LDX   $EF
            LDA   $ED
            INC   $ED
            BNE   L016C2A
            INC   $EF
L016C2A     STA   $F2
            STX   $F4
            LDA   $F1
            SEP   #$20
            STA   [$F2]
            REP   #$20
L016C36     BRA   L016BE0
L016C38     LDA   #$0000
            SEP   #$20
            STA   [$ED]
            REP   #$20
            LDA   #$0000
L016C44     TAY
            TSC
            CLC
            ADC   #$000B
            TCS
            TYA
            PLD
            RTL

checkInputReady
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PHX
            PHA
            _TickCount
            BCS   L016C67
            LDA   #$0000
L016C67     STAL  L020002
            PLA
            PLX
            STX   $F4
            STA   $F2
L016C71     JSL   getSerialInputStatus	; serial: is input ready?
            TAY
            BNE   L016CAA	; yes, it is

            LDX   #$0000	; WAIT 1200 / 60 = 20 SECONDS
            LDA   #$04B0
            PHX
            PHA
            PHX
            PHA
            _TickCount
            BCS   L016C8E
            LDA   #$0000
L016C8E     STAL  L020002
            PLA
            PLX
            SEC
            SBC   $F2
            PHA
            TXA
            SBC   $F4
            TAX
            PLA
            JSL   L013333	; 32-bit subtraction
            BCS   L016CA8
            LDA   #$0001
            BRA   L016CAD
L016CA8     BRA   L016C71

L016CAA     LDA   #$0000
L016CAD     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L016CB7     PHA
            TXA
            EOR   #$FFFF
            TAX
            PLA
            EOR   #$FFFF
            INC
            BNE   L016CC5
            INX
L016CC5     RTL

L016CC6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            _ClearScreen
            BCS   L016CE0
            LDA   #$0000
L016CE0     STAL  L020002
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

sendSerialString
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   L020102	; value is 1
            AND   #$00FF
            PHA
            JSL   sendSerialCharacter
            PLY
            STA   $F0
            CMP   #$0000
            BEQ   L016D1E
            LDA   $F0
            BRA   L016D36
L016D1E     PEI   $FF
            PEI   $FD
            JSL   sendCRString
            PLY
            PLY
            STA   $F0
            CMP   #$0000
            BEQ   L016D33
            LDA   $F0
            BRA   L016D36
L016D33     LDA   #$0000
L016D36     TAY
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            PLD
            RTL

L016D40     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E3
            TCS
            LDA   #$000F
            SEP   #$20
            STA   $E5
            REP   #$20
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STX   $E8
            STA   $E6
L016D6B     LDA   [$E6]
            AND   #$00FF
            BEQ   L016D7A
            INC   $E6
            BNE   L016D78
            INC   $E8
L016D78     BRA   L016D6B
L016D7A     INC   $E6
            BNE   L016D80
            INC   $E8
L016D80     LDX   $E8
            LDA   $E6
            STX   $F0
            STA   $EE
            LDY   #$0002
            LDA   [$FD],Y
            BEQ   L016DAD
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0006
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            LDY   #$0001
            LDA   [$E6],Y
            SEP   #$20
            STA   $E5
            REP   #$20
L016DAD     LDA   $E5
            AND   #$00FF
            PHA
            LDY   #$0004
            LDA   [$EE],Y
            PHA
            LDY   #$0002
            LDA   [$EE],Y
            PHA
            LDA   [$EE]
            PHA
            PEI   $EC
            PEI   $EA
            JSL   L0C02CE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0013
            TCS
            PLD
            RTL

sendSerialCharacter
            PHD	; Send command
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E2
            TCS
            PHX
            PHA
            _TickCount
            BCS   L016DF3
            LDA   #$0000
L016DF3     STAL  L020002
            PLA
            PLX
            STX   $E8
            STA   $E6
L016DFD     JSL   getSerialOutputStatus	; is serial ready for output?
            TAY
            BNE   L016E36	; Yes, ready
	
            LDX   #$0000	; WAIT 20 SECONDS
            LDA   #$04B0
            PHX
            PHA
            PHX
            PHA
            _TickCount
            BCS   L016E1A
            LDA   #$0000
L016E1A     STAL  L020002
            PLA
            PLX
            SEC
            SBC   $E6
            PHA
            TXA
            SBC   $E8
            TAX
            PLA
            JSL   L013333
            BCS   L016E34
            LDA   #$0001
            BRA   L016E8F
L016E34     BRA   L016DFD

L016E36     LDA   $FF		; the character
            AND   #$00FF
            STA   $EA
            LDX   #$0000
            LDA   #$C10F	; WRITE
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   #$C100
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $E4
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $EA
            PEA   $00C2
            PEA   $0020
            PEI   $E4
            _FWEntry
            PLA
            STA   $EC
            PLA
            STA   $EE
            PLA
            STA   $F0
            PLA
            STA   $F2
            LDA   $EE
            BEQ   L016E8C
            LDA   #$0002
            BRA   L016E8F
            BRA   L016E8F
L016E8C     LDA   #$0000
L016E8F     TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            PLD
            RTL

L016E99     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E6
            TCS
            LDX   $FB
            LDA   $F9
            STX   $EA
            STA   $E8
L016EAC     LDA   $F7
            CMP   #$0001
            BEQ   L016ED7
            BCC   L016ED7
            LDA   [$FD]
            STA   [$F9]
            LDA   $F9
            CLC
            ADC   #$0002
            STA   $F9
            BCC   L016EC5
            INC   $FB
L016EC5     LDA   $FD
            CLC
            ADC   #$0002
            STA   $FD
            BCC   L016ED1
            INC   $FF
L016ED1     DEC   $F7
            DEC   $F7
            BRA   L016EAC
L016ED7     LDA   $F7
            BEQ   L016EE3
            SEP   #$20
            LDA   [$FD]
            STA   [$F9]
            REP   #$20
L016EE3     LDX   $EA
            LDA   $E8
            STX   $FF
            STA   $FD
            TDC
            CLC
            ADC   #$00F1
            TCS
            PLD
            RTL

L016EF3     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PEA   $0001
            PEA   ^L030020
            PEA   L030020
            JSL   L01505A
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L016F16     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            JSL   L070E5B
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L016F2D     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E2
            TCS
            LDX   $FF
            LDA   $FD
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STZ   $E8
            BRL   L016FED
L016F58     PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            LDA   $E8
            LDX   #$0000
            PEA   $0000
            PEA   $000A
            CLC
            JSL   L013048
            LDX   $EC
            LDA   $EA
            JSL   L012E77
            PEA   $0000
            PEA   $0000
            PEA   $0080
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0138ED
            PEA   L0138ED
            LDA   $E8
            LDX   #$0000
            PEA   $0000
            PEA   $000A
            CLC
            JSL   L013048
            LDX   $EC
            LDA   $EA
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDY   #$0008
            LDA   [$F2],Y
            LDX   #$0000
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            _NewControl
            BCS   L016FCF
            LDA   #$0000
L016FCF     STAL  L020002
            PLA
            PLX
            STX   $E6
            STA   $E4
            PHX
            PHA
            _ShowControl
            BCS   L016FE7
            LDA   #$0000
L016FE7     STAL  L020002
            INC   $E8
L016FED     LDA   [$EE]
            AND   #$00FF
            CMP   $E8
            BEQ   L016FFB
            BCC   L016FFB
            BRL   L016F58
L016FFB     LDX   $E6
            LDA   $E4
            PHA
            TXA
            STAL  L031DFA
            PLA
            STAL  L031DF8
            TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

resetCommPort
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0001
            SEP   #$20
            STA   L020102
            REP   #$20
            LDX   #$0000
            LDA   #$C10D	; INIT
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            PHA
            LDA   #$C100
            PLX
            STX   $FA
            CLC
            ADC   $FA
            STA   $EC
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $00C2
            PEA   $0020
            PEI   $EC
            _FWEntry
            PLA
            STA   $EE
            PLA
            STA   $F0
            PLA
            STA   $F2
            PLA
            STA   $F4
            LDA   $F0
            BEQ   L017077
            LDA   #$0002
            BRA   L01707A
            BRA   L01707A
L017077     LDA   #$0000
L01707A     TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            PLD
            RTL

L017084     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            JSL   checkSerialInputReady
            STA   $EE
            CMP   #$0000
            BEQ   L01709E
            LDA   $EE
            BRA   L0170AA
L01709E     PEI   $FF
            PEI   $FD
            JSL   sendCRString
            PLY
            PLY
            STA   $F0
L0170AA     TAY
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            PLD
            RTL

L0170B4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            PEA   ^L038CA9
            PEA   L038CA9
            _SetColorTable
            BCS   L0170D4
            LDA   #$0000
L0170D4     STAL  L020002
            PEA   $000E
            PEA   $0002
            JSL   L012C5A
            PLY
            PLY
            LDA   #$0003
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            PEA   $EEEE
            _ClearScreen
            BCS   L0170FF
            LDA   #$0000
L0170FF     STAL  L020002
            LDA   #$0001
            STAL  L031DD6
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L017112     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00AE
            TCS
            STZ   $D0
            STZ   $CC
            STZ   $C0
            STZ   $C2
            STZ   $B4
            STZ   $B6
            PHX
            PHA
            _GetDblTime
            BCS   L017137
            LDA   #$0000
L017137     STAL  L020002
            PLA
            PLX
            STX   $BE
            STA   $BC
            LDX   #$0000
            LDA   #$0F77
            STX   $EC
            STA   $EA
L01714B     LDA   $CC
            BEQ   L017152
            BRL   L017315
L017152     PHA
            PEA   $FFFF
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _TaskMaster
            BCS   L01716B
            LDA   #$0000
L01716B     STAL  L020002
            PLA
            STA   $CE
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L013333
            BEQ   L01718B
            BRA   L01714B
L01718B     LDA   $CE
            BRL   L0172F3
L017190     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00C8
            PHA
            PEI   $E2
            PEI   $E0
            LDY   #$008A
            LDA   [$F9],Y
            TAX
            LDY   #$0088
            LDA   [$F9],Y
            PHX
            PHA
            _FindControl
            BCS   L0171B7
            LDA   #$0000
L0171B7     STAL  L020002
            PLA
            STA   $D4
            LDA   $D4
            BNE   L0171C5
            BRL   L0172EC
L0171C5     PHA
            PEI   $E2
            PEI   $E0
            PEA   $FFFF
            PEA   $FFFF
            PEI   $CA
            PEI   $C8
            _TrackControl
            BCS   L0171E0
            LDA   #$0000
L0171E0     STAL  L020002
            PLA
            STA   $D2
            PHX
            PHA
            _GetTick
            BCS   L0171F5
            LDA   #$0000
L0171F5     STAL  L020002
            PLA
            PLX
            STX   $C6
            STA   $C4
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            LDY   #$00C6
            LDA   [$F9],Y
            TAX
            LDY   #$00C4
            LDA   [$F9],Y
            PHX
            PHA
            _NextMember
            BCS   L017220
            LDA   #$0000
L017220     STAL  L020002
            PLA
            PLX
            STX   $BA
            STA   $B8
            LDA   $D2
            CMP   $D0
            BNE   L01726C
            LDA   $D2
            CMP   #$0081
            BEQ   L01726C
            BCC   L01726C
            LDA   $B8
            CMP   $B4
            BNE   L01726C
            LDA   $BA
            CMP   $B6
            BNE   L01726C
            LDX   $BE
            LDA   $BC
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
            BEQ   L01726C
            BCC   L01726C
            LDA   [$F9]
            STA   [$FD]
            LDA   #$0001
            STA   $CC
            BRL   L0172FE
L01726C     LDA   $D2
            BRL   L0172DF
L017271     BRL   L0172EC
L017274     LDY   #$0002
            LDA   [$C8],Y
            TAX
            LDA   [$C8]
            STA   $EE
            STX   $F0
            LDY   #$0022
            LDA   [$EE],Y
            TAX
            LDY   #$0020
            LDA   [$EE],Y
            STA   [$FD]
            PEA   $0002
            LDA   [$FD]
            CLC
            ADC   #$0001
            ASL
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   $F9
            CLC
            ADC   #$008C
            LDX   $FB
            BCC   L0172A8
            INX
L0172A8     JSL   L012E77
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
            _HiliteControl
            BCS   L0172C8
            LDA   #$0000
L0172C8     STAL  L020002
            LDA   #$0001
            STA   $CC
            BRL   L0172EC
L0172D4     BRL   L0172EC
L0172D7     DA    L017271
            DA    L0172D4
            DA    L017274
            DA    L0172D4
L0172DF     CMP   #$0003
            BCC   L0172E7
            LDA   #$0003
L0172E7     ASL
            TAX
            JMP   (L0172D7,X)

L0172EC     BRL   L0172FE
L0172EF     BRA   L0172FE
            BRA   L0172FE
L0172F3     CMP   #$0013
            BNE   L0172FB
            BRL   L017190
L0172FB     JMP   L0172EF

L0172FE     LDA   $D2
            STA   $D0
            LDX   $C6
            LDA   $C4
            STX   $C2
            STA   $C0
            LDX   $BA
            LDA   $B8
            STX   $B6
            STA   $B4
            BRL   L01714B
L017315     STZ   $CE
            BRA   L017359
L017319     LDY   #$00B6
            LDA   [$F9],Y
            PHA
            LDA   $CE
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDY   #$0004
            LDA   [$F9],Y
            TAX
            LDY   #$0002
            LDA   [$F9],Y
            JSL   L012E77
            PLA
            PLX
            STX   $B2
            STA   $B0
            LDY   #$0004
            LDA   [$B0],Y
            AND   #$00FF
            AND   #$0080
            TAY
            BEQ   L017357
            LDA   $CE
            CLC
            ADC   #$0001
            BRA   L017376
L017357     INC   $CE
L017359     LDY   #$00C6
            LDA   [$F9],Y
            TAX
            LDY   #$00C4
            LDA   [$F9],Y
            STA   $EE
            STX   $F0
            LDY   #$0008
            LDA   [$EE],Y
            CMP   $CE
            BEQ   L017373
            BCS   L017319
L017373     LDA   #$0000
L017376     TAY
            TSC
            CLC
            ADC   #$0044
            TCS
            TYA
            PLD
            RTL

L017380     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E6
            TCS
            LDA   #$0006
            STA   $E8
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            LDY   #$0002
            LDA   [$FD],Y
            BEQ   L0173C4
            LDY   #$0001
            LDA   [$EA],Y
            STA   $E8
L0173C4     PEI   $E8
            LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            PHA
            LDA   [$EE]
            AND   #$00FF
            PHA
            JSL   L015D04
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L0173E4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            LDY   #$0002
            LDA   [$FD],Y
            BNE   L01741F
            BRL   L017457
L01741F     LDA   [$EA]
            AND   #$00FF
            BRL   L017448
L017427     JSL   L015B49
            STAL  L031DF6
            BRL   L017455
L017432     LDAL  L031DF6
            PHA
            JSL   sendLDStill
            PLY
            BRL   L017455
L01743F     BRL   L017455
L017442     DA    L017427
            DA    L017432
            DA    L01743F
L017448     CMP   #$0002
            BCC   L017450
            LDA   #$0002
L017450     ASL
            TAX
            JMP   (L017442,X)

L017455     BRA   L01745F
L017457     LDA   [$EE]
            PHA
            JSL   sendLDStill
            PLY
L01745F     TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L017467     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            PHX
            PHA
            JSL   L013212
            PLY
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L01749D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$009F
            TCS
            STZ   $EC
            LDA   #$000F
            SEP   #$20
            STA   $E5
            REP   #$20
            STZ   $D7
            STZ   $D5
            STZ   $D3
            STZ   $D1
            STZ   $CF
            LDA   #$0001
            STA   $CD
            LDA   #$0001
            STA   $CB
            STZ   $C9
            STZ   $C5
            STZ   $C7
            STZ   $C1
            STZ   $C3
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            PHA
            LDX   L020086
            LDA   L020084
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            STX   $E3
            STA   $E1
            PEA   $0008
            PEI   $E3
            PEI   $E1
            PEA   $0000
            TDC
            CLC
            ADC   #$00D9
            PHA
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            STZ   L020111
            STZ   $EC
            BRL   L01784A
L01752E     LDA   [$E6]
            AND   #$00FF
            BRL   L01783B
L017536     LDA   [$E6]
            AND   #$00FF
            CMP   #$0008
            BNE   L017545
            LDA   #$0003
            BRA   L017548
L017545     LDA   #$0001
L017548     PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDY   #$0003
            LDA   [$E6],Y
            PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0001
            STA   [$F2],Y
            LDY   #$0001
            LDA   [$E6],Y
            PHA
            LDX   L02007A
            LDA   L020078
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            PHX
            PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            PLX
            LDY   #$0005
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0003
            STA   [$F2],Y
            INC   L020111
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0005
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L017848
L017601     LDA   [$E6]
            AND   #$00FF
            CMP   #$0007
            BNE   L017610
            LDA   #$0004
            BRA   L017613
L017610     LDA   #$0002
L017613     PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDY   #$0001
            LDA   [$E6],Y
            PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0001
            STA   [$F2],Y
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDX   #$0000
            LDA   #$0000
            LDY   #$0005
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0003
            STA   [$F2],Y
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            LDA   $E5
            AND   #$00FF
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0192D8
            PLY
            PLY
            PLY
            PHX
            PHA
            LDA   L020111
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            PLX
            LDY   #$0009
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0007
            STA   [$F2],Y
            INC   L020111
            BRL   L017848
L017702     LDY   #$0001
            LDA   [$E6],Y
            STA   $DD
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L017848
L01771F     LDA   $DF
            AND   #$00FF
            EOR   #$0003
            SEP   #$20
            STA   $DF
            REP   #$20
            LDY   #$0002
            LDA   [$E6],Y
            AND   #$00FF
            PHA
            LDY   #$0001
            LDA   [$E6],Y
            AND   #$00FF
            PLX
            STX   $F6
            CLC
            ADC   $F6
            PHA
            LDA   $DF
            AND   #$00FF
            PLX
            STX   $F6
            ORA   $F6
            SEP   #$20
            STA   $DF
            REP   #$20
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L017848
L01776B     LDA   $DF
            AND   #$00FF
            EOR   #$0004
            SEP   #$20
            STA   $DF
            REP   #$20
            INC   $E6
            BNE   L01777F
            INC   $E8
L01777F     BRL   L017848
L017782     LDA   $DF
            AND   #$00FF
            ORA   #$0004
            SEP   #$20
            STA   $DF
            REP   #$20
            INC   $E6
            BNE   L017796
            INC   $E8
L017796     BRL   L017848
L017799     LDA   #$0001
            STA   $D7
            INC   $E6
            BNE   L0177A4
            INC   $E8
L0177A4     BRL   L017848
L0177A7     LDA   #$0001
            STA   $D3
            INC   $E6
            BNE   L0177B2
            INC   $E8
L0177B2     BRL   L017848
L0177B5     STZ   $CD
            INC   $E6
            BNE   L0177BD
            INC   $E8
L0177BD     BRL   L017848
L0177C0     STZ   $CB
            INC   $E6
            BNE   L0177C8
            INC   $E8
L0177C8     BRL   L017848
L0177CB     LDA   #$0001
            STA   $C9
            INC   $E6
            BNE   L0177D6
            INC   $E8
L0177D6     BRL   L017848
L0177D9     LDA   #$0001
            STA   $D1
            INC   $E6
            BNE   L0177E4
            INC   $E8
L0177E4     BRL   L017848
L0177E7     LDA   #$0001
            STA   $CF
            INC   $E6
            BNE   L0177F2
            INC   $E8
L0177F2     BRL   L017848
L0177F5     LDY   #$0001
            LDA   [$E6],Y
            SEP   #$20
            STA   $E5
            REP   #$20
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L017848
L017816     BRL   L017848
L017819     DA    L01771F
            DA    L0177D9
            DA    L0177E7
            DA    L0177C0
            DA    L0177B5
            DA    L01776B
            DA    L0177A7
            DA    L017601
            DA    L017536
            DA    L0177F5
            DA    L017702
            DA    L017601
            DA    L017536
            DA    L0177CB
            DA    L017799
            DA    L017782
            DA    L017816
L01783B     CMP   #$0010
            BCC   L017843
            LDA   #$0010
L017843     ASL
            TAX
            JMP   (L017819,X)

L017848     INC   $EC
L01784A     LDY   #$0002
            LDA   [$FD],Y
            CMP   $EC
            BEQ   L017858
            BCC   L017858
            BRL   L01752E
L017858     LDA   L020111
            BEQ   L017861
            JSL   L01A928
L017861     LDA   $D3
            BEQ   L017895
            LDY   #$0007
            LDA   [$E1],Y
            AND   #$00FF
            AND   #$0001
            TAY
            BNE   L01787C
            LDAL  L031DE0
            CMP   #$0000
            BNE   L017881
L01787C     BRL   L017AC8
            BRA   L017895
L017881     LDY   #$0007
            LDA   [$E1],Y
            AND   #$00FF
            ORA   #$0001
            SEP   #$20
            LDY   #$0007
            STA   [$E1],Y
            REP   #$20
L017895     LDA   $DF
            AND   #$00FF
            STAL  L031DF0
            LDA   $D9
            STAL  L031DF2
            LDA   $C9
            BEQ   L0178AE
            LDA   $D9
            STA   $DB
            BRA   L0178B0
L0178AE     LDA   $DB
L0178B0     STAL  L031DF4
            LDA   $DF
            AND   #$00FF
            PHA
            JSL   sendLDAudioControl
            PLY
            LDA   $DF
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L0178D2
            LDA   #L01A6F9
            LDX   #^L01A6F9
            BRA   L0178D8
L0178D2     LDX   #$0000
            LDA   #$0000
L0178D8     PHX
            PHA
            PEI   $D7
            PEI   $DD
            PEI   $DB
            PEI   $D9
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $EA
            LDA   $C9
            BEQ   L0178F7
            BRL   L017ABF
L0178F7     LDA   $D7
            BEQ   L0178FE
            BRL   L017ABF
L0178FE     LDA   $DF
            AND   #$00FF
            AND   #$0004
            TAY
            BNE   L01790C
            BRL   L017ABF
L01790C     LDA   $CD
            BNE   L017917
            LDA   $CB
            BNE   L017917
            BRL   L017ABF
L017917     LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L01792E
            LDA   #$0000
L01792E     STAL  L020002
            PEA   $0001
            JSL   L01335E
            PLY
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00A1
            PHA
            _GetColorTable
            BCS   L017952
            LDA   #$0000
L017952     STAL  L020002
            LDA   $CD
            BEQ   L017969
            PEA   $0000
            TDC
            CLC
            ADC   #$00C5
            PHA
            JSL   L018E08
            PLY
            PLY
L017969     LDA   $CB
            BEQ   L017982
            LDAL  L031DEE
            BEQ   L017982
            PEA   $0000
            TDC
            CLC
            ADC   #$00C1
            PHA
            JSL   L01AB00
            PLY
            PLY
L017982     LDAL  L031DD6
            BNE   L0179CC
            PEA   $0000
            PEA   ^L038CA9
            PEA   L038CA9
            _SetColorTable
            BCS   L01799D
            LDA   #$0000
L01799D     STAL  L020002
            PEA   $000E
            PEA   $0002
            JSL   L012C5A
            PLY
            PLY
            LDA   #$0003
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            PEA   $EEEE
            _ClearScreen
            BCS   L0179C8
            LDA   #$0000
L0179C8     STAL  L020002
L0179CC     LDX   $C7
            LDA   $C5
            STX   $F2
            ORA   $F2
            BEQ   L0179EA
            PEI   $C7
            PEI   $C5
            _DrawOneCtl
            BCS   L0179E6
            LDA   #$0000
L0179E6     STAL  L020002
L0179EA     LDX   $C3
            LDA   $C1
            STX   $F2
            ORA   $F2
            BEQ   L017A08
            PEI   $C3
            PEI   $C1
            _DrawOneCtl
            BCS   L017A04
            LDA   #$0000
L017A04     STAL  L020002
L017A08     PEA   $0006
            PEA   $0002
            PEA   $0001
            JSL   L015D04
            PLY
            PLY
            PLY
            PEI   $CF
            PEI   $D1
            PEI   $C3
            PEI   $C1
            PEI   $C7
            PEI   $C5
            LDA   $D9
            CMP   $DB
            BEQ   L017A34
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D9
            BRA   L017A3A
L017A34     LDX   #$0000
            LDA   #$0000
L017A3A     PHX
            PHA
            JSL   L019A71
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            PEA   $0006
            PEA   $0002
            PEA   $0000
            JSL   L015D04
            PLY
            PLY
            PLY
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _KillControls
            BCS   L017A6F
            LDA   #$0000
L017A6F     STAL  L020002
            PEA   $0001
            JSL   L01335E
            PLY
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00A1
            PHA
            _SetColorTable
            BCS   L017A93
            LDA   #$0000
L017A93     STAL  L020002
            LDA   #$0000
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            PEA   $0000
            PEA   $0001
            JSL   L012C5A
            PLY
            PLY
            _DrawMenuBar
            BCS   L017ABB
            LDA   #$0000
L017ABB     STAL  L020002
L017ABF     LDA   L020111
            BEQ   L017AC8
            JSL   L01A830
L017AC8     TAY
            TSC
            CLC
            ADC   #$0057
            TCS
            TYA
            PLD
            RTL

L017AD2     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            CMP   #$0001
            BNE   L017AFF
            LDA   #$0001	; scan reverse
            BRA   L017B02
L017AFF     LDA   #$0000	; scan forward
L017B02     PHA
            JSL   sendLDSCAN
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L017B10     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$004A
            TCS
            STZ   $E8
L017B1D     LDX   $F7
            LDA   $F5
            STX   $E6
            STA   $E4
            BRA   L017B2D
L017B27     INC   $F5
            BNE   L017B2D
            INC   $F7
L017B2D     LDA   [$F5]
            AND   #$00FF
            STA   $DA
            CMP   #$0000
            BEQ   L017B40
            LDA   $DA
            CMP   #$0025
            BNE   L017B27
L017B40     LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012FF8
            PLA
            PLX
            STA   $50
            TAY
            BNE   L017B58
            BRL   L017C20
L017B58     LDA   $E8
            CLC
            ADC   $50
            STA   $E8
            LDA   $50
            CMP   #$0001
            BNE   L017BC1
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L017B74
            EOR   #$8000
L017B74     BPL   L017BAE
            LDA   [$E4]
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L017B97
            INC
L017B97     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L017BBF
L017BAE     PEI   $FF
            PEI   $FD
            LDA   [$E4]
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L017BBF     BRA   L017C20
L017BC1     LDY   #$0012
            LDA   [$FD],Y
            CMP   #$0014
            BNE   L017C07
            LDA   $50
            LDX   #$0000
            TAY
            BPL   L017BD4
            DEX
L017BD4     PHX
            PHA
            PEI   $50
            PEI   $E6
            PEI   $E4
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L012E77
            PLA
            PLX
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            BRA   L017C20
L017C07     PEI   $FF
            PEI   $FD
            PEI   $50
            PEA   $0001
            PEI   $E6
            PEI   $E4
            JSL   L01ACA1
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L017C20     LDA   $DA
            CMP   #$0000
            BNE   L017C3C
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0020
            TAY
            BEQ   L017C37
            LDA   #$FFFF
            BRA   L017C39
L017C37     LDA   $E8
L017C39     BRL   L018DE3
L017C3C     LDA   #$0000
            STA   $CA
            STA   $CC
            STA   $CE
            STA   $D0
            STA   $D2
L017C49     INC   $F5
            BNE   L017C4F
            INC   $F7
L017C4F     LDX   $F7
            LDA   $F5
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            STA   $DA
            BRL   L017C76
L017C61     INC   $D2
            BRL   L017C8C
L017C66     INC   $D0
            BRL   L017C8C
L017C6B     INC   $CE
            BRL   L017C8C
L017C70     INC   $CC
            BRA   L017C8C
            BRA   L017C8A
L017C76     CMP   #$0020
            BEQ   L017C6B
            CMP   #$0023
            BEQ   L017C70
            CMP   #$002B
            BEQ   L017C61
            CMP   #$002D
            BEQ   L017C66
L017C8A     BRA   L017C8E
L017C8C     BRA   L017C49
L017C8E     LDA   $DA
            CMP   #$002A
            BNE   L017CDA
            LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFE
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDA   [$EA]
            STA   $DE
            LDA   $DE
            SEC
            SBC   #$0000
            BVS   L017CC6
            EOR   #$8000
L017CC6     BMI   L017CD2
            LDA   $DE
            EOR   #$FFFF
            INC
            STA   $DE
            INC   $D0
L017CD2     INC   $F5
            BNE   L017CD8
            INC   $F7
L017CD8     BRA   L017D33
L017CDA     LDA   $DA
            CMP   #$0030
            BNE   L017CE3
            INC   $CA
L017CE3     STZ   $DE
            BRA   L017D08
L017CE7     LDA   $DA
            SEC
            SBC   #$0030
            PHA
            LDA   $DE
            PHA
            LDA   #$000A
            SEC
            JSL   L013003
            PLA
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $DE
            INC   $F5
            BNE   L017D08
            INC   $F7
L017D08     LDA   [$F5]
            AND   #$00FF
            STA   $DA
            LDX   #$0000
            TAY
            BPL   L017D16
            DEX
L017D16     PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            AND   #$0004
            TAY
            BNE   L017CE7
L017D33     LDA   [$F5]
            AND   #$00FF
            CMP   #$002E
            BEQ   L017D45
            LDA   #$FFFF
            STA   $DC
            BRL   L017DDB
L017D45     INC   $F5
            BNE   L017D4B
            INC   $F7
L017D4B     LDX   $F7
            LDA   $F5
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CMP   #$002A
            BNE   L017D8B
            LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFE
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDA   [$EA]
            STA   $DC
            INC   $F5
            BNE   L017D89
            INC   $F7
L017D89     BRA   L017DDB
L017D8B     STZ   $DC
            BRA   L017DB0
L017D8F     LDA   $DA
            SEC
            SBC   #$0030
            PHA
            LDA   $DC
            PHA
            LDA   #$000A
            SEC
            JSL   L013003
            PLA
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $DC
            INC   $F5
            BNE   L017DB0
            INC   $F7
L017DB0     LDA   [$F5]
            AND   #$00FF
            STA   $DA
            LDX   #$0000
            TAY
            BPL   L017DBE
            DEX
L017DBE     PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            AND   #$0004
            TAY
            BNE   L017D8F
L017DDB     STZ   $D4
            LDA   [$F5]
            AND   #$00FF
            BRL   L017DFC
L017DE5     INC   $D4
L017DE7     INC   $F5
            BNE   L017DED
            INC   $F7
L017DED     BRL   L017E0D
L017DF0     DA    L017DE7
            DA    L017DED
            DA    L017DED
            DA    L017DED
            DA    L017DE5
            DA    L017DED
L017DFC     SEC
            SBC   #$0068
            CMP   #$0005
            BCC   L017E08
            LDA   #$0005
L017E08     ASL
            TAX
            JMP   (L017DF0,X)

L017E0D     LDA   #L0387C6
            LDX   #^L0387C6
            STX   $77
            STA   $75
            LDA   #$0000
            SEP   #$20
            STA   $70
            REP   #$20
            LDX   #$0000
            TDC
            CLC
            ADC   #$0070
            STX   $73
            STA   $71
            LDA   #$0000
            STA   $D6
            STA   $D8
            LDX   $F7
            LDA   $F5
            INC   $F5
            BNE   L017E3D
            INC   $F7
L017E3D     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            STA   $DA
            BRL   L0189A4
L017E4B     LDA   #$0005
            STA   $4E
            BRL   L017E60
L017E53     LDA   #$0004
            STA   $4E
            BRL   L017E60
L017E5B     LDA   #$0008
            STA   $4E
L017E60     LDA   $DC
            SEC
            SBC   #$0000
            BVS   L017E6B
            EOR   #$8000
L017E6B     BMI   L017E8B
            LDA   $CA
            BEQ   L017E86
            LDA   $DE
            SEC
            SBC   #$0000
            BEQ   L017E86
            BVS   L017E7E
            EOR   #$8000
L017E7E     BPL   L017E86
            LDA   $DE
            STA   $DC
            BRA   L017E8B
L017E86     LDA   #$0001
            STA   $DC
L017E8B     LDA   $D4
            BEQ   L017EBF
            LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFC
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STX   $68
            STA   $66
            BRA   L017F22
L017EBF     LDA   $DA
            CMP   #$0064
            BNE   L017EF7
            LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFE
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDA   [$EA]
            LDX   #$0000
            TAY
            BPL   L017EF1
            DEX
L017EF1     STX   $68
            STA   $66
            BRA   L017F22
L017EF7     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFE
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDA   [$EA]
            LDX   #$0000
            STX   $68
            STA   $66
L017F22     LDA   $DA
            CMP   #$0064
            BEQ   L017F2C
            BRL   L017F97
L017F2C     SEC
            LDA   $66
            SBC   #$0000
            BNE   L017F3B
            LDA   $68
            SBC   #$0000
            BRA   L017F42
L017F3B     LDA   $68
            SBC   #$0000
            REP   #$02
L017F42     BVS   L017F47
            EOR   #$8000
L017F47     BMI   L017F79
            LDA   #L0387C7
            LDX   #^L0387C7
            STX   $77
            STA   $75
            SEC
            LDA   $66
            SBC   #$0000
            BNE   L017F62
            LDA   $68
            SBC   #$8000
            BRA   L017F69
L017F62     LDA   $68
            SBC   #$8000
            REP   #$02
L017F69     BEQ   L017F77
            LDX   $68
            LDA   $66
            JSL   L016CB7
            STX   $68
            STA   $66
L017F77     BRA   L017F97
L017F79     LDA   $D2
            BEQ   L017F89
            LDA   #L0387C9
            LDX   #^L0387C9
            STX   $77
            STA   $75
            BRA   L017F97
L017F89     LDA   $CE
            BEQ   L017F97
            LDA   #L0387CB
            LDX   #^L0387CB
            STX   $77
            STA   $75
L017F97     LDA   $DA
            CMP   #$0058
            BNE   L017FA6
            LDA   #L0387CD
            LDX   #^L0387CD
            BRA   L017FAC
L017FA6     LDA   #L0387DE
            LDX   #^L0387DE
L017FAC     STX   $56
            STA   $54
            LDX   #$0000
            TDC
            CLC
            ADC   #$0084
            STX   $E6
            STA   $E4
            STX   $E2
            STA   $E0
L017FC0     SEC
            LDA   $66
            SBC   #$0000
            BNE   L017FCF
            LDA   $68
            SBC   #$0000
            BRA   L017FD6
L017FCF     LDA   $68
            SBC   #$0000
            REP   #$02
L017FD6     BNE   L017FDB
            BRL   L01807D
L017FDB     LDX   $68
            LDA   $66
            AND   #$0001
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $4C
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $68
            LDA   $66
            SEC
            JSL   L013B83
            PLA
            PLX
            AND   #$FFFF
            PHA
            TXA
            AND   #$7FFF
            TAX
            PLA
            STX   $68
            STA   $66
            LDA   $4C
            LDX   #$0000
            TAY
            BPL   L018015
            DEX
L018015     PHX
            PHA
            LDA   $4E
            LDX   #$0000
            TAY
            BPL   L018020
            DEX
L018020     PHX
            PHA
            LDX   $68
            LDA   $66
            SEC
            JSL   L012F07
            PLA
            PLX
            STX   $EE
            ASL
            ROL   $EE
            LDX   $EE
            JSL   L012E77
            LDX   $56
            LDA   $54
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            PHA
            LDA   $E4
            BNE   L01804F
            DEC   $E6
L01804F     DEC   $E4
            LDX   $E6
            LDA   $E4
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   $4E
            LDX   #$0000
            TAY
            BPL   L018069
            DEX
L018069     PHX
            PHA
            LDX   $68
            LDA   $66
            SEC
            JSL   L012F07
            PLY
            PLY
            STX   $68
            STA   $66
            BRL   L017FC0
L01807D     LDX   $E2
            LDA   $E0
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L012FF8
            PLA
            PLX
            CLC
            ADC   $DC
            STA   $D8
            LDA   $CC
            BNE   L018099
            BRL   L0180F5
L018099     SEC
            LDA   $E4
            SBC   $E0
            BNE   L0180A6
            LDA   $E6
            SBC   $E2
            BRA   L0180AC
L0180A6     LDA   $E6
            SBC   $E2
            REP   #$02
L0180AC     BNE   L0180B1
            BRL   L0180F5
L0180B1     LDA   $DA
            BRL   L0180E6
L0180B6     LDA   $D8
            SEC
            SBC   #$0001
            BVS   L0180C1
            EOR   #$8000
L0180C1     BMI   L0180C8
            LDA   #$0001
            STA   $D8
L0180C8     BRL   L0180F5
L0180CB     LDA   #L0387EF
            LDX   #^L0387EF
            STX   $77
            STA   $75
            BRL   L0180F5
L0180D8     LDA   #L0387F2
            LDX   #^L0387F2
            STX   $77
            STA   $75
            BRA   L0180F5
            BRA   L0180F5
L0180E6     CMP   #$0058
            BEQ   L0180D8
            CMP   #$006F
            BEQ   L0180B6
            CMP   #$0078
            BEQ   L0180CB
L0180F5     BRL   L0189B7
L0180F8     LDA   $DC
            SEC
            SBC   #$0000
            BVS   L018103
            EOR   #$8000
L018103     BMI   L01810A
            LDA   #$0006
            STA   $DC
L01810A     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$000A
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFF6
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0008
            LDA   [$EA],Y
            PHA
            LDY   #$0006
            LDA   [$EA],Y
            PHA
            LDY   #$0004
            LDA   [$EA],Y
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            LDA   [$EA]
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005C
            PHA
            JSL   L01AAA6
            PLY
            PLY
            PLY
            PLY
            PLY
L018159     PEA   $0000
            TDC
            CLC
            ADC   #$0058
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005A
            PHA
            LDA   $DC
            CLC
            ADC   #$0001
            SEC
            SBC   #$0013
            BVS   L01817A
            EOR   #$8000
L01817A     BMI   L018184
            LDA   $DC
            CLC
            ADC   #$0001
            BRA   L018187
L018184     LDA   #$0013
L018187     PHA
            PEI   $64
            PEI   $62
            PEI   $60
            PEI   $5E
            PEI   $5C
            JSL   L01A7C0
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $E6
            STA   $E4
L0181A2     LDA   $58
            BEQ   L0181B2
            LDA   #L0387F5
            LDX   #^L0387F5
            STX   $77
            STA   $75
            BRA   L0181D0
L0181B2     LDA   $D2
            BEQ   L0181C2
            LDA   #L0387F7
            LDX   #^L0387F7
            STX   $77
            STA   $75
            BRA   L0181D0
L0181C2     LDA   $CE
            BEQ   L0181D0
            LDA   #L0387F9
            LDX   #^L0387F9
            STX   $77
            STA   $75
L0181D0     LDX   #$0000
            TDC
            CLC
            ADC   #$0079
            STX   $E2
            STA   $E0
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0049
            BEQ   L0181F0
            LDA   [$E4]
            AND   #$00FF
            CMP   #$004E
            BNE   L0181F3
L0181F0     BRL   L018396
L0181F3     LDA   [$E4]
            AND   #$00FF
            CMP   #$0000
            BEQ   L018212
            LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L018207
            INC   $E6
L018207     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            BRA   L018215
L018212     LDA   #$0030
L018215     PHA
            LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L018220
            INC   $E2
L018220     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   $DC
            CMP   #$0000
            BNE   L018236
            LDA   $CC
            BEQ   L01824D
L018236     LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L018240
            INC   $E2
L018240     STA   $EA
            STX   $EC
            LDA   #$002E
            SEP   #$20
            STA   [$EA]
            REP   #$20
L01824D     LDA   $DC
            STA   $D6
            BRA   L01827B
L018253     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L01825D
            INC   $E6
L01825D     STA   $EA
            STX   $EC
            LDA   [$EA]
            PHA
            LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L01826E
            INC   $E2
L01826E     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            DEC   $D6
L01827B     LDA   $D6
            SEC
            SBC   #$0000
            BEQ   L018294
            BVS   L018288
            EOR   #$8000
L018288     BPL   L018294
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0000
            BNE   L018253
L018294     LDX   #$0000
            TDC
            CLC
            ADC   #$0079
            STX   $E6
            STA   $E4
            LDA   $5A
            SEC
            SBC   #$0001
            STA   $50
            LDA   $50
            SEC
            SBC   #$0000
            BVS   L0182B3
            EOR   #$8000
L0182B3     BMI   L0182BD
            LDA   $50
            EOR   #$FFFF
            INC
            STA   $50
L0182BD     LDA   #$000A
            PHA
            LDA   $50
            SEC
            JSL   L012E82
            PLA
            CLC
            ADC   #$0030
            PHA
            LDA   $71
            BNE   L0182D4
            DEC   $73
L0182D4     DEC   $71
            LDX   $73
            LDA   $71
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   #$000A
            PHA
            LDA   $50
            SEC
            JSL   L012E82
            PLY
            STA   $50
            LDA   $50
            CMP   #$0000
            BNE   L0182BD
            LDX   #$0000
            TDC
            CLC
            ADC   #$0070
            SEC
            SBC   #$0002
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $73
            LDA   $71
            JSL   L013333
            BVS   L01831C
            EOR   #$8000
L01831C     BPL   L0182BD
            LDA   $5A
            SEC
            SBC   #$0000
            BEQ   L018332
            BVS   L01832B
            EOR   #$8000
L01832B     BPL   L018332
            LDA   #$002B
            BRA   L018335
L018332     LDA   #$002D
L018335     PHA
            LDA   $71
            BNE   L01833C
            DEC   $73
L01833C     DEC   $71
            LDX   $73
            LDA   $71
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   $DA
            LDX   #$0000
            TAY
            BPL   L018356
            DEX
L018356     PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            AND   #$0001
            TAY
            BEQ   L018378
            LDA   #$0045
            BRA   L01837B
L018378     LDA   #$0065
L01837B     PHA
            LDA   $71
            BNE   L018382
            DEC   $73
L018382     DEC   $71
            LDX   $73
            LDA   $71
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            BRL   L0189B7
L018396     LDA   [$E4]
            AND   #$00FF
            CMP   #$0049
            BNE   L0183B5
            PEA   ^L0387FB
            PEA   L0387FB
            PEI   $E2
            PEI   $E0
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            BRL   L01844B
L0183B5     PEA   ^L0387FF
            PEA   L0387FF
            PEI   $E2
            PEI   $E0
            JSL   L014524
            PLY
            PLY
            PLY
            PLY
            LDY   #$0004
            LDA   [$E4],Y
            AND   #$00FF
            PHA
            JSL   L01AC30
            PLY
            PHA
            LDY   #$0003
            LDA   [$E4],Y
            AND   #$00FF
            PHA
            JSL   L01AC30
            PLY
            PHA
            LDA   #$0010
            SEC
            JSL   L013003
            PLA
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $50
            LDA   #$0006
            STA   $52
            BRA   L01843E
L0183FD     LDA   #$000A
            PHA
            LDA   $50
            SEC
            JSL   L012E82
            PLA
            CLC
            ADC   #$0030
            PHA
            LDA   $52
            DEC   $52
            LDX   #$0000
            TAY
            BPL   L018419
            DEX
L018419     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   #$000A
            PHA
            LDA   $50
            SEC
            JSL   L012E82
            PLY
            STA   $50
L01843E     LDA   $52
            SEC
            SBC   #$0004
            BVS   L018449
            EOR   #$8000
L018449     BMI   L0183FD
L01844B     LDX   $E2
            LDA   $E0
            STX   $E6
            STA   $E4
            PEI   $E6
            PEI   $E4
            JSL   L0140CE
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L018464
            DEX
L018464     PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
            BRL   L0189B7
L018477     LDA   $DC
            SEC
            SBC   #$0000
            BVS   L018482
            EOR   #$8000
L018482     BMI   L018489
            LDA   #$0006
            STA   $DC
L018489     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$000A
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFF6
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0008
            LDA   [$EA],Y
            PHA
            LDY   #$0006
            LDA   [$EA],Y
            PHA
            LDY   #$0004
            LDA   [$EA],Y
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            LDA   [$EA]
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005C
            PHA
            JSL   L01AAA6
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$0058
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005A
            PHA
            PEI   $DC
            PEI   $64
            PEI   $62
            PEI   $60
            PEI   $5E
            PEI   $5C
            JSL   L01A7F8
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $E6
            STA   $E4
L018506     LDA   $58
            BEQ   L018516
            LDA   #L038808
            LDX   #^L038808
            STX   $77
            STA   $75
            BRA   L018534
L018516     LDA   $D2
            BEQ   L018526
            LDA   #L03880A
            LDX   #^L03880A
            STX   $77
            STA   $75
            BRA   L018534
L018526     LDA   $CE
            BEQ   L018534
            LDA   #L03880C
            LDX   #^L03880C
            STX   $77
            STA   $75
L018534     LDX   #$0000
            TDC
            CLC
            ADC   #$0079
            STX   $E2
            STA   $E0
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0049
            BEQ   L018554
            LDA   [$E4]
            AND   #$00FF
            CMP   #$004E
            BNE   L018557
L018554     BRL   L018396
L018557     LDA   $DC
            SEC
            SBC   #$0000
            BEQ   L018566
            BVS   L018564
            EOR   #$8000
L018564     BMI   L01856A
L018566     LDA   $CC
            BEQ   L018572
L01856A     LDA   #$0001
            CLC
            ADC   $DC
            BRA   L018575
L018572     LDA   #$0000
L018575     PHA
            LDA   [$75]
            AND   #$00FF
            CMP   #$0000
            BNE   L018585
            LDA   #$0000
            BRA   L018588
L018585     LDA   #$0001
L018588     CLC
            ADC   $5A
            PLX
            STX   $EE
            CLC
            ADC   $EE
            SEC
            SBC   #$0050
            BEQ   L0185A6
            BVS   L01859C
            EOR   #$8000
L01859C     BPL   L0185A6
            LDA   #$0012
            STA   $DC
            BRL   L018159
L0185A6     LDA   $5A
            STA   $50
L0185AA     LDA   $50
            SEC
            SBC   #$0000
            BEQ   L0185C3
            BVS   L0185B7
            EOR   #$8000
L0185B7     BPL   L0185C3
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0000
            BNE   L0185C8
L0185C3     LDA   #$0030
            BRA   L0185DB
L0185C8     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0185D2
            INC   $E6
L0185D2     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
L0185DB     PHA
            LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L0185E6
            INC   $E2
L0185E6     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            DEC   $50
            LDA   $50
            SEC
            SBC   #$0000
            BEQ   L018602
            BVS   L018600
            EOR   #$8000
L018600     BMI   L0185AA
L018602     LDA   $CC
            BNE   L018615
            LDA   $DC
            SEC
            SBC   #$0000
            BEQ   L01862C
            BVS   L018613
            EOR   #$8000
L018613     BPL   L01862C
L018615     LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L01861F
            INC   $E2
L01861F     STA   $EA
            STX   $EC
            LDA   #$002E
            SEP   #$20
            STA   [$EA]
            REP   #$20
L01862C     LDA   $DC
            STA   $50
L018630     DEC   $50
            LDA   $50
            SEC
            SBC   #$0000
            BVS   L01863D
            EOR   #$8000
L01863D     BPL   L01868A
            INC   $5A
            LDA   $5A
            SEC
            SBC   #$0000
            BEQ   L01865A
            BVS   L01864E
            EOR   #$8000
L01864E     BPL   L01865A
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0000
            BNE   L01865F
L01865A     LDA   #$0030
            BRA   L018672
L01865F     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L018669
            INC   $E6
L018669     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
L018672     PHA
            LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L01867D
            INC   $E2
L01867D     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            BRA   L018630
L01868A     LDX   #$0000
            TDC
            CLC
            ADC   #$0079
            STX   $E6
            STA   $E4
            BRL   L0189B7
L018699     LDA   $DC
            SEC
            SBC   #$0000
            BVS   L0186A4
            EOR   #$8000
L0186A4     BMI   L0186AD
            LDA   #$0006
            STA   $DC
            BRA   L0186B9
L0186AD     LDA   $DC
            CMP   #$0000
            BNE   L0186B9
            LDA   #$0001
            STA   $DC
L0186B9     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$000A
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFF6
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0008
            LDA   [$EA],Y
            PHA
            LDY   #$0006
            LDA   [$EA],Y
            PHA
            LDY   #$0004
            LDA   [$EA],Y
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            LDA   [$EA]
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005C
            PHA
            JSL   L01AAA6
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$0058
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$005A
            PHA
            LDA   $DC
            SEC
            SBC   #$0013
            BVS   L018725
            EOR   #$8000
L018725     BMI   L01872B
            LDA   $DC
            BRA   L01872E
L01872B     LDA   #$0013
L01872E     PHA
            PEI   $64
            PEI   $62
            PEI   $60
            PEI   $5E
            PEI   $5C
            JSL   L01A7C0
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            STX   $E6
            STA   $E4
            LDA   $DC
            STA   $52
            LDA   $CC
            BNE   L0187A5
            PEI   $E6
            PEI   $E4
            JSL   L0140CE
            PLY
            PLY
            STA   $50
            LDA   $50
            SEC
            SBC   $52
            BVS   L018767
            EOR   #$8000
L018767     BMI   L01876D
            LDA   $50
            STA   $52
L01876D     LDA   $52
            SEC
            SBC   #$0001
            BVS   L018778
            EOR   #$8000
L018778     BPL   L0187A5
            LDA   $52
            SEC
            SBC   #$0001
            LDX   #$0000
            TAY
            BPL   L018787
            DEX
L018787     PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L012E77
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0030
            BNE   L0187A5
            DEC   $52
            BRA   L01876D
L0187A5     LDA   $5A
            SEC
            SBC   #$FFFD
            BVS   L0187B0
            EOR   #$8000
L0187B0     BPL   L0187C0
            LDA   $5A
            SEC
            SBC   $DC
            BEQ   L0187CB
            BVS   L0187BE
            EOR   #$8000
L0187BE     BPL   L0187CB
L0187C0     LDA   $52
            SEC
            SBC   #$0001
            STA   $DC
            BRL   L0181A2
L0187CB     LDA   $52
            SEC
            SBC   $5A
            STA   $DC
            BRL   L018506
L0187D5     LDA   $DA
            SEP   #$20
            STA   $79
            REP   #$20
            BRL   L01880A
L0187E0     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFE
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDA   [$EA]
            SEP   #$20
            STA   $79
            REP   #$20
L01880A     LDX   #$0000
            TDC
            CLC
            ADC   #$0079
            STX   $E6
            STA   $E4
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E2
            STA   $E0
            BRL   L0189B7
L018828     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFC
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STX   $E6
            STA   $E4
            STX   $E2
            STA   $E0
            LDA   $DC
            SEC
            SBC   #$0000
            BVS   L018865
            EOR   #$8000
L018865     BMI   L01888A
            PEI   $E6
            PEI   $E4
            JSL   L0140CE
            PLY
            PLY
            LDX   #$0000
            TAY
            BPL   L018878
            DEX
L018878     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
            BRA   L0188BB
L01888A     LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L018894
            INC   $E2
L018894     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0188B3
            DEC   $DC
            LDA   $DC
            SEC
            SBC   #$0000
            BVS   L0188AF
            EOR   #$8000
L0188AF     BPL   L0188B3
            BRA   L01888A
L0188B3     LDA   $E0
            BNE   L0188B9
            DEC   $E2
L0188B9     DEC   $E0
L0188BB     BRL   L0189B7
L0188BE     LDX   $FB
            LDA   $F9
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $FB
            STA   $F9
            CLC
            ADC   #$FFFC
            PHA
            TXA
            ADC   #$FFFF
            TAX
            PLA
            STA   $EA
            STX   $EC
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STX   $E6
            STA   $E4
            STX   $E2
            STA   $E0
            LDA   $DC
            SEC
            SBC   #$0000
            BVS   L0188FB
            EOR   #$8000
L0188FB     BPL   L01890C
            LDA   [$E4]
            AND   #$00FF
            SEC
            SBC   $DC
            BVS   L01890A
            EOR   #$8000
L01890A     BMI   L01892E
L01890C     LDA   [$E4]
            AND   #$00FF
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L01891C
            DEX
L01891C     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
            BRA   L01894B
L01892E     LDA   $DC
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L01893B
            DEX
L01893B     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
L01894B     LDX   $E6
            LDA   $E4
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E6
            STA   $E4
            BRL   L0189B7
L018961     LDA   #$FFFF
            BRL   L018DE3
            BRL   L0189B7
L01896A     DA    L018961
            DA    L0180F8
            DA    L018699
            DA    L017E5B
            DA    L0187E0
            DA    L017E4B
            DA    L0180F8
            DA    L018477
            DA    L018699
            DA    L017E53
            DA    L0188BE
            DA    L018828
            DA    L017E4B
            DA    L017E5B
            DA    L0187D5
L018988     DW    $0000
            DW    $0045
            DW    $0047
            DW    $0058
            DW    $0063
            DW    $0064
            DW    $0065
            DW    $0066
            DW    $0067
            DW    $006F
            DW    $0070
            DW    $0073
            DW    $0075
            DW    $0078
L0189A4     TAX
            PEA   ^L018988
            PEA   L018988
            LDA   #$001A
            JSL   L01ABAC
            PLA
            PLA
            JMP   (L01896A,X)

L0189B7     LDA   $D8
            SEC
            SBC   #$0000
            BVS   L0189C2
            EOR   #$8000
L0189C2     BMI   L0189C6
            STZ   $D8
L0189C6     LDA   $D6
            SEC
            SBC   #$0000
            BVS   L0189D1
            EOR   #$8000
L0189D1     BMI   L0189D5
            STZ   $D6
L0189D5     LDX   $73
            LDA   $71
            PHX
            PHA
            LDA   [$75]
            AND   #$00FF
            CMP   #$0000
            BNE   L0189EA
            LDA   #$0000
            BRA   L0189FF
L0189EA     LDY   #$0001
            LDA   [$75],Y
            AND   #$00FF
            CMP   #$0000
            BNE   L0189FC
            LDA   #$0001
            BRA   L0189FF
L0189FC     LDA   #$0002
L0189FF     PHA
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012FF8
            PLA
            PLX
            STA   $50
            CLC
            ADC   $D8
            CLC
            ADC   $D6
            PLX
            STX   $EE
            CLC
            ADC   $EE
            LDX   #$0000
            TAY
            BPL   L018A25
            DEX
L018A25     PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0070
            JSL   L012E77
            PLA
            PLX
            JSL   L012FF8
            PLA
            PLX
            STA   $52
            LDA   $DE
            SEC
            SBC   $52
            BEQ   L018A4F
            BVS   L018A49
            EOR   #$8000
L018A49     BPL   L018A4F
            LDA   $DE
            BRA   L018A51
L018A4F     LDA   $52
L018A51     PHA
            LDA   $E8
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STA   $E8
            LDA   $D0
            BNE   L018AC9
L018A60     DEC   $DE
            LDA   $DE
            SEC
            SBC   $52
            BVS   L018A6C
            EOR   #$8000
L018A6C     BPL   L018AC9
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018A7C
            EOR   #$8000
L018A7C     BPL   L018AB5
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018A9C
            INC
L018A9C     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   #$0020
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018AC7
L018AB5     PEI   $FF
            PEI   $FD
            LDA   #$0020
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018AC7     BRA   L018A60
L018AC9     LDA   [$75]
            AND   #$00FF
            CMP   #$0000
            BEQ   L018B4B
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018AE1
            EOR   #$8000
L018AE1     BPL   L018B29
            LDX   $77
            LDA   $75
            INC   $75
            BNE   L018AED
            INC   $77
L018AED     STA   $EA
            STX   $EC
            LDA   [$EA]
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018B12
            INC
L018B12     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018B48
L018B29     PEI   $FF
            PEI   $FD
            LDX   $77
            LDA   $75
            INC   $75
            BNE   L018B37
            INC   $77
L018B37     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018B48     BRL   L018AC9
L018B4B     DEC   $D8
            LDA   $D8
            SEC
            SBC   #$0000
            BVS   L018B58
            EOR   #$8000
L018B58     BPL   L018BB5
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018B68
            EOR   #$8000
L018B68     BPL   L018BA1
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018B88
            INC
L018B88     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   #$0030
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018BB3
L018BA1     PEI   $FF
            PEI   $FD
            LDA   #$0030
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018BB3     BRA   L018B4B
L018BB5     LDA   $50
            SEC
            SBC   #$0000
            BNE   L018BC0
            BRL   L018C8B
L018BC0     BVS   L018BC5
            EOR   #$8000
L018BC5     BMI   L018BCA
            BRL   L018C8B
L018BCA     LDA   $50
            CMP   #$0001
            BNE   L018C2C
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018BDF
            EOR   #$8000
L018BDF     BPL   L018C19
            LDA   [$E4]
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018C02
            INC
L018C02     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018C2A
L018C19     PEI   $FF
            PEI   $FD
            LDA   [$E4]
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018C2A     BRA   L018C8B
L018C2C     LDY   #$0012
            LDA   [$FD],Y
            CMP   #$0014
            BNE   L018C72
            LDA   $50
            LDX   #$0000
            TAY
            BPL   L018C3F
            DEX
L018C3F     PHX
            PHA
            PEI   $50
            PEI   $E6
            PEI   $E4
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            JSL   L012E77
            PLA
            PLX
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            BRA   L018C8B
L018C72     PEI   $FF
            PEI   $FD
            PEI   $50
            PEA   $0001
            PEI   $E6
            PEI   $E4
            JSL   L01ACA1
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L018C8B     DEC   $D6
            LDA   $D6
            SEC
            SBC   #$0000
            BVS   L018C98
            EOR   #$8000
L018C98     BPL   L018CF5
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018CA8
            EOR   #$8000
L018CA8     BPL   L018CE1
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018CC8
            INC
L018CC8     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   #$0030
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018CF3
L018CE1     PEI   $FF
            PEI   $FD
            LDA   #$0030
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018CF3     BRA   L018C8B
L018CF5     LDA   [$71]
            AND   #$00FF
            CMP   #$0000
            BEQ   L018D77
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018D0D
            EOR   #$8000
L018D0D     BPL   L018D55
            LDX   $73
            LDA   $71
            INC   $71
            BNE   L018D19
            INC   $73
L018D19     STA   $EA
            STX   $EC
            LDA   [$EA]
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018D3E
            INC
L018D3E     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018D74
L018D55     PEI   $FF
            PEI   $FD
            LDX   $73
            LDA   $71
            INC   $71
            BNE   L018D63
            INC   $73
L018D63     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018D74     BRL   L018CF5
L018D77     DEC   $DE
            LDA   $DE
            SEC
            SBC   $52
            BVS   L018D83
            EOR   #$8000
L018D83     BPL   L018DE0
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L018D93
            EOR   #$8000
L018D93     BPL   L018DCC
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L018DB3
            INC
L018DB3     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $EA
            STX   $EC
            LDA   #$0020
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            BRA   L018DDE
L018DCC     PEI   $FF
            PEI   $FD
            LDA   #$0020
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L018DDE     BRA   L018D77
L018DE0     BRL   L017B1D
L018DE3     TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L018DED     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            JSL   sendLDStill
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L018E08     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   ^L03896F
            PEA   L03896F
            PEA   ^L038977
            PEA   L038977
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   ^L038965
            PEA   L038965
            _NewControl
            BCS   L018E56
            LDA   #$0000
L018E56     STAL  L020002
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            STA   [$FD]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L018E6E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            PHA
            JSL   L01ABF2
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L018E9C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            PHA
            LDA   [$EE]
            AND   #$00FF
            PLX
            STX   $F6
            CLC
            ADC   $F6
            PHA
            JSL   sendLDAudioControl
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L018EDC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            BEQ   L018F06
            LDA   #$0001	; on (normal)
            BRA   L018F09
L018F06     LDA   #$0000	; off
L018F09     PHA		; send video control
            JSL   sendLDVideoControl
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L018F17     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00C6
            TCS
            LDX   $FD
            LDA   $FB
            STX   $EE
            STA   $EC
            LDA   [$EC]
            AND   #$00FF
            AND   #$0080
            TAY
            BEQ   L018F4A
            LDX   $FD
            LDA   $FB
            CLC
            ADC   #$0011
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRA   L018F65
L018F4A     LDY   #$000B
            LDA   [$EC],Y
            TAX
            LDY   #$0009
            LDA   [$EC],Y
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L012E77
            PLA
            PLX
            STX   $E8
            STA   $E6
L018F65     LDY   #$0007
            LDA   [$EC],Y
            BEQ   L018F71
            LDA   #$0005
            BRA   L018F74
L018F71     LDA   #$0007
L018F74     STA   $EA
            PEA   ^L01B1DB
            PEA   L01B1DB
            PEI   $EA
            LDY   #$0005
            LDA   [$EC],Y
            PHA
            PEI   $E8
            PEI   $E6
            PEA   $0000
            TDC
            CLC
            ADC   #$00FF
            PHA
            JSL   L016912
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            STA   $E4
            LDA   $E4
            CMP   #$FFFF
            BNE   L018FB1
            LDX   #$0000
            LDA   #$0000
            BRL   L0192CE
            BRA   L018FCF
L018FB1     LDA   $EA
            PHA
            LDA   $E4
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L012E77
            PLA
            PLX
            STX   $E8
            STA   $E6
L018FCF     LDY   #$0007
            LDA   [$EC],Y
            BEQ   L019000
            LDX   $E8
            LDA   $E6
            STX   $D2
            STA   $D0
            LDY   #$0003
            LDA   [$D0],Y
            PHA
            LDY   #$0007
            LDA   [$EC],Y
            CLC
            JSL   L013003
            LDA   #$0011
            PLX
            STX   $F4
            CLC
            ADC   $F4
            LDX   #$0000
            STX   $E2
            STA   $E0
            BRA   L01900F
L019000     LDY   #$0005
            LDA   [$E6],Y
            TAX
            LDY   #$0003
            LDA   [$E6],Y
            STX   $E2
            STA   $E0
L01900F     LDA   [$EC]
            AND   #$00FF
            AND   #$0080
            TAY
            BNE   L01902A
            LDX   $FD
            LDA   $FB
            CLC
            ADC   $E0
            PHA
            TXA
            ADC   $E2
            TAX
            PLA
            BRL   L0192CE
L01902A     PHX
            PHA
            _GetCursorAdr
            BCS   L019038
            LDA   #$0000
L019038     STAL  L020002
            PLA
            PLX
            STX   $D6
            STA   $D4
            _WaitCursor
            BCS   L01904E
            LDA   #$0000
L01904E     STAL  L020002
            LDY   #$000F
            LDA   [$EC],Y
            TAX
            LDY   #$000D
            LDA   [$EC],Y
            STX   $DE
            STA   $DC
            STZ   $DA
            BRA   L0190C2
L019065     LDA   $DA
            CLC
            ADC   #$0001
            PHA
            LDY   #$0004
            LDA   [$DC],Y
            PLX
            STX   $F0
            CMP   $F0
            BEQ   L0190BE
            BCC   L0190BE
            LDA   $DA
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L019087
            DEX
L019087     STX   $F4
            ASL
            ROL   $F4
            ASL
            ROL   $F4
            LDX   $F4
            PHX
            PHA
            LDY   #$0008
            LDA   [$DC],Y
            TAX
            LDY   #$0006
            LDA   [$DC],Y
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
            LDX   $E2
            LDA   $E0
            JSL   L013333
            BEQ   L0190C0
            BCC   L0190C0
L0190BE     BRA   L0190CD
L0190C0     INC   $DA
L0190C2     LDY   #$0004
            LDA   [$DC],Y
            CMP   $DA
            BEQ   L0190CD
            BCS   L019065
L0190CD     LDY   #$000A
            LDA   [$DC],Y
            CMP   $DA
            BNE   L0190D9
            BRL   L01926A
L0190D9     PEI   $DA
            PEI   $E2
            PEI   $E0
            PEA   ^L03871A
            PEA   L03871A
            JSL   L050256
            PLY
            PLY
            PLY
            PLY
            PLY
            LDY   #$000A
            LDA   [$DC],Y
            PHA
            PEA   ^L038748
            PEA   L038748
            JSL   L050256
            PLY
            PLY
            PLY
            LDY   #$000A
            LDA   [$DC],Y
            CMP   #$FFFF
            BEQ   L01913F
            LDY   #$000E
            LDA   [$DC],Y
            TAX
            LDY   #$000C
            LDA   [$DC],Y
            PHX
            PHA
            _DisposeHandle
            BCS   L019124
            LDA   #$0000
L019124     STAL  L020002
            LDA   L020002
            STA   $D8
            TAY
            BEQ   L01913F
            PEI   $D8
            PEA   ^L03877A
            PEA   L03877A
            JSL   L050256
            PLY
            PLY
            PLY
L01913F     LDA   $DA
            LDX   #$0000
            TAY
            BPL   L019148
            DEX
L019148     STX   $F4
            ASL
            ROL   $F4
            ASL
            ROL   $F4
            LDX   $F4
            PHX
            PHA
            LDY   #$0008
            LDA   [$DC],Y
            TAX
            LDY   #$0006
            LDA   [$DC],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STX   $CE
            STA   $CC
            LDA   $DA
            CLC
            ADC   #$0001
            PHA
            LDY   #$0004
            LDA   [$DC],Y
            PLX
            STX   $F0
            CMP   $F0
            BEQ   L01918A
            BCS   L019197
L01918A     LDY   #$000B
            LDA   [$EC],Y
            TAX
            LDY   #$0009
            LDA   [$EC],Y
            BRA   L0191CD
L019197     LDA   $DA
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L0191A4
            DEX
L0191A4     STX   $F4
            ASL
            ROL   $F4
            ASL
            ROL   $F4
            LDX   $F4
            PHX
            PHA
            LDY   #$0008
            LDA   [$DC],Y
            TAX
            LDY   #$0006
            LDA   [$DC],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
L0191CD     STX   $CA
            STA   $C8
            PEI   $CA
            PEI   $C8
            PEI   $CE
            PEI   $CC
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            PHX
            PHA
            JSL   L010B2B
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            LDY   #$000E
            PHA
            TXA
            STA   [$DC],Y
            PLA
            LDY   #$000C
            STA   [$DC],Y
            LDY   #$000E
            LDA   [$DC],Y
            TAX
            LDY   #$000C
            LDA   [$DC],Y
            STX   $F0
            ORA   $F0
            BNE   L019225
            PEA   ^L0387AA
            PEA   L0387AA
            JSL   L050256
            PLY
            PLY
L019225     LDY   #$000E
            LDA   [$DC],Y
            TAX
            LDY   #$000C
            LDA   [$DC],Y
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            LDY   #$0012
            PHA
            TXA
            STA   [$DC],Y
            PLA
            LDY   #$0010
            STA   [$DC],Y
            LDX   $CA
            LDA   $C8
            SEC
            SBC   $CC
            PHA
            TXA
            SBC   $CE
            TAX
            PLA
            LDY   #$0016
            PHA
            TXA
            STA   [$DC],Y
            PLA
            LDY   #$0014
            STA   [$DC],Y
            LDA   $DA
            LDY   #$000A
            STA   [$DC],Y
L01926A     PEI   $D6
            PEI   $D4
            _SetCursor
            BCS   L01927A
            LDA   #$0000
L01927A     STAL  L020002
            LDY   #$000A
            LDA   [$DC],Y
            LDX   #$0000
            TAY
            BPL   L01928A
            DEX
L01928A     STX   $F4
            ASL
            ROL   $F4
            ASL
            ROL   $F4
            LDX   $F4
            PHX
            PHA
            LDY   #$0008
            LDA   [$DC],Y
            TAX
            LDY   #$0006
            LDA   [$DC],Y
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
            LDX   $E2
            LDA   $E0
            JSL   L012FF8
            LDY   #$0012
            LDA   [$DC],Y
            TAX
            LDY   #$0010
            LDA   [$DC],Y
            JSL   L012E77
            PLA
            PLX
L0192CE     TAY
            TSC
            CLC
            ADC   #$002E
            TCS
            TYA
            PLD
            RTL

L0192D8     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E4
            TCS
            PHX
            PHA
            PEA   $0000
            PEA   $000B
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L019304
            LDA   #$0000
L019304     STAL  L020002
            PLA
            PLX
            STX   $EC
            STA   $EA
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L01932B
            PEA   ^L038991
            PEA   L038991
            JSL   L050256
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L01946A
L01932B     PEI   $EC
            PEI   $EA
            _HLock
            BCS   L01933B
            LDA   #$0000
L01933B     STAL  L020002
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L01935C
            PEA   ^L0389B8
            PEA   L0389B8
            JSL   L050256
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L01946A
L01935C     LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STX   $E8
            STA   $E6
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            LDY   #$0002
            PHA
            TXA
            STA   [$E6],Y
            PLA
            STA   [$E6]
L01937A     LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            BEQ   L0193AD
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            CLC
            ADC   #$0001
            STA   [$FB]
            PHA
            LDY   #$0002
            LDA   [$FB],Y
            BCC   L0193A4
            INC
L0193A4     TAX
            LDY   #$0002
            STA   [$FB],Y
            PLA
            BRA   L01937A
L0193AD     LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            CLC
            ADC   #$0001
            STA   [$FB]
            PHA
            LDY   #$0002
            LDA   [$FB],Y
            BCC   L0193C4
            INC
L0193C4     TAX
            LDY   #$0002
            STA   [$FB],Y
            PLA
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDA   [$F0]
            LDY   #$0004
            STA   [$E6],Y
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            PHA
            TXA
            STA   [$FB],Y
            PLA
            STA   [$FB]
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDA   [$F0]
            LDY   #$0006
            STA   [$E6],Y
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            PHA
            TXA
            STA   [$FB],Y
            PLA
            STA   [$FB]
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            STA   $F0
            STX   $F2
            LDA   [$F0]
            LDY   #$0008
            STA   [$E6],Y
            LDY   #$0002
            LDA   [$FB],Y
            TAX
            LDA   [$FB]
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            LDY   #$0002
            PHA
            TXA
            STA   [$FB],Y
            PLA
            STA   [$FB]
            LDA   $FF
            SEP   #$20
            LDY   #$000A
            STA   [$E6],Y
            REP   #$20
            LDX   $E8
            LDA   $E6
L01946A     TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            PLD
            RTL

llSerialStatus
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E6
            TCS
            LDX   #$0000
            LDA   #$C110	; STATUS
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   #$C100
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $EA
            PHP
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   $FF
            PHA
            PEA   $00C2
            PEA   $0020
            PEI   $EA
            _FWEntry
            PLA
            STA   $EC
            PLA
            STA   $EE
            PLA
            STA   $F0
            PLP
            PLP
            BCS   L0194CD
            LDA   #$0000	; carry clear: return 0 => not ready
            STA   $E8
            BRA   L0194D2
L0194CD     LDA   #$0001	; carry set: return 1 => yes, ready
            STA   $E8
L0194D2     PLP
            LDA   $EE
            BEQ   L0194DE
            LDA   #$0002
            BRA   L0194E0
            BRA   L0194E0
L0194DE     LDA   $E8
L0194E0     TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PLD
            RTL

L0194EA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E0
            TCS
            STZ   $E8
            LDA   #$003C
            STA   $E6
            STZ   $E4
            STZ   $E2
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STZ   $E8
            BRL   L019586
L01952B     LDA   [$EA]
            AND   #$00FF
            BRL   L019577
L019533     LDY   #$0001
            LDA   [$EA],Y
            STA   $E6
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L019584
L019550     LDA   #$0001
            STA   $E4
            INC   $EA
            BNE   L01955B
            INC   $EC
L01955B     BRL   L019584
L01955E     LDA   #$0001
            STA   $E2
            INC   $EA
            BNE   L019569
            INC   $EC
L019569     BRL   L019584
L01956C     BRL   L019584
L01956F     DA    L019533
            DA    L01955E
            DA    L019550
            DA    L01956C
L019577     CMP   #$0003
            BCC   L01957F
            LDA   #$0003
L01957F     ASL
            TAX
            JMP   (L01956F,X)

L019584     INC   $E8
L019586     LDY   #$0002
            LDA   [$FD],Y
            CMP   $E8
            BEQ   L019591
            BCS   L01952B
L019591     LDA   $E2
            BEQ   L01959D
            LDA   #L01A6F9
            LDX   #^L01A6F9
            BRA   L0195A3
L01959D     LDX   #$0000
            LDA   #$0000
L0195A3     PHX
            PHA
            PEI   $E4
            PEI   $E6
            LDY   #$0002
            LDA   [$EE],Y
            PHA
            LDA   [$EE]
            PHA
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0016
            TCS
            PLD
            RTL

L0195C6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDY   #$0004
            LDA   [$EE],Y
            AND   #$00FF
            PHA
            LDY   #$0002
            LDA   [$EE],Y
            PHA
            LDA   [$EE]
            PHA
            JSL   L01B84D
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L019605     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D0
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STZ   $D4
            STZ   $D2
            LDA   [$EE]
            PHA
            LDX   L02007A
            LDA   L020078
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            STX   $E8
            STA   $E6
            PEA   $000E
            PEI   $E8
            PEI   $E6
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            STZ   $D6
            BRL   L019845
L01966E     LDA   [$EA]
            AND   #$00FF
            BRL   L019836
L019676     LDA   #$0001
            STA   $D4
            LDY   #$0001
            LDA   [$EA],Y
            STA   $D8
            LDY   #$0003
            LDA   [$EA],Y
            STA   $DA
            LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L01969E
            LDX   #$00E1
            LDA   #$2000
            BRA   L0196B9
L01969E     LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L0196B3
            LDX   L0200F4
            LDA   L0200F2
            BRA   L0196B9
L0196B3     LDX   #$0000
            LDA   #$0000
L0196B9     PHX
            PHA
            PEI   $D2
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L01B660
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0005
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L019843
L0196F9     LDA   #$0001
            STA   $D4
            LDY   #$0001
            LDA   [$EA],Y
            PHA
            LDA   $D8
            PLX
            STX   $F6
            CLC
            ADC   $F6
            STA   $D8
            LDY   #$0003
            LDA   [$EA],Y
            PHA
            LDA   $DA
            PLX
            STX   $F6
            CLC
            ADC   $F6
            STA   $DA
            LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L019733
            LDX   #$00E1
            LDA   #$2000
            BRA   L01974E
L019733     LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L019748
            LDX   L0200F4
            LDA   L0200F2
            BRA   L01974E
L019748     LDX   #$0000
            LDA   #$0000
L01974E     PHX
            PHA
            PEI   $D2
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L01B660
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0005
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L019843
L01978E     LDA   $E0
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $E0
            REP   #$20
            LDA   $E0
            AND   #$00FF
            ORA   #$0010
            SEP   #$20
            STA   $E0
            REP   #$20
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L019843
L0197C0     LDA   $E0
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $E0
            REP   #$20
            LDA   $E0
            AND   #$00FF
            ORA   #$0020
            SEP   #$20
            STA   $E0
            REP   #$20
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L019843
L0197F2     LDA   $E0
            AND   #$00FF
            AND   #$000F
            SEP   #$20
            STA   $E0
            REP   #$20
            LDA   $E0
            AND   #$00FF
            ORA   #$0030
            SEP   #$20
            STA   $E0
            REP   #$20
            INC   $EA
            BNE   L019814
            INC   $EC
L019814     BRL   L019843
L019817     LDA   #$0001
            STA   $D2
            INC   $EA
            BNE   L019822
            INC   $EC
L019822     BRL   L019843
L019825     BRL   L019843
L019828     DA    L019676
            DA    L019817
            DA    L0197F2
            DA    L01978E
            DA    L0197C0
            DA    L0196F9
            DA    L019825
L019836     CMP   #$0006
            BCC   L01983E
            LDA   #$0006
L01983E     ASL
            TAX
            JMP   (L019828,X)

L019843     INC   $D6
L019845     LDY   #$0002
            LDA   [$FD],Y
            CMP   $D6
            BEQ   L019853
            BCC   L019853
            BRL   L01966E
L019853     LDA   $D4
            BNE   L0198B1
            LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L01986C
            LDX   #$00E1
            LDA   #$2000
            BRA   L019887
L01986C     LDY   #$0002
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L019881
            LDX   L0200F4
            LDA   L0200F2
            BRA   L019887
L019881     LDX   #$0000
            LDA   #$0000
L019887     PHX
            PHA
            PEI   $D2
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$000E
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L01B660
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L0198B1     TSC
            CLC
            ADC   #$0026
            TCS
            PLD
            RTL

L0198B9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E6
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STZ   $E8
            LDY   #$0002
            LDA   [$FD],Y
            BEQ   L019902
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0000
            BNE   L019902
            LDA   #$0001
            STA   $E8
L019902     PEI   $E8
            LDA   [$EE]
            PHA
            JSL   L01B9FD
            PLY
            PLY
            TSC
            CLC
            ADC   #$0010
            TCS
            PLD
            RTL

L019915     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            PHA
            JSL   L01335E
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L019946     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D8
            TCS
            LDA   #$0001
            STA   $EA
            LDA   #$003C
            STA   $DE
            LDA   #$0023
            STA   $E0
            LDA   #$00A0
            STA   $E2
            LDA   #$00FA
            STA   $E4
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EE
            STA   $EC
            LDX   $EE
            LDA   $EC
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            LDA   [$EC]
            PHA
            LDX   L02007E
            LDA   L02007C
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            STX   $DC
            STA   $DA
            STZ   $F0
            BRL   L019A27
L0199AB     LDA   [$E6]
            AND   #$00FF
            BRL   L019A18
L0199B3     LDY   #$0001
            LDA   [$E6],Y
            AND   #$00FF
            BEQ   L0199C2
            LDA   #$0001
            BRA   L0199C5
L0199C2     LDA   #$0000
L0199C5     STA   $EA
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L019A25
L0199DD     LDY   #$0001
            LDA   [$E6],Y
            STA   $DE
            LDY   #$0003
            LDA   [$E6],Y
            STA   $E0
            LDY   #$0005
            LDA   [$E6],Y
            STA   $E2
            LDY   #$0007
            LDA   [$E6],Y
            STA   $E4
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$0009
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            BRL   L019A25
L019A0F     BRL   L019A25
L019A12     DA    L0199B3
            DA    L0199DD
            DA    L019A0F
L019A18     CMP   #$0002
            BCC   L019A20
            LDA   #$0002
L019A20     ASL
            TAX
            JMP   (L019A12,X)

L019A25     INC   $F0
L019A27     LDY   #$0002
            LDA   [$FD],Y
            CMP   $F0
            BEQ   L019A35
            BCC   L019A35
            BRL   L0199AB
L019A35     PEI   $EA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00DE
            TAY
            TSC
            SEC
            SBC   #$0008
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0008
            JSL   L016E99
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $DC
            PEI   $DA
            JSL   L01A646
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            TSC
            CLC
            ADC   #$001E
            TCS
            PLD
            RTL

L019A71     PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00AE
            TCS
            STZ   $E4
            PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            BCS   L019A91
            LDA   #$0000
L019A91     STAL  L020002
            PLA
            STZ   $C0
L019A98     LDA   $E4
            BEQ   L019A9F
            BRL   L019D3F
L019A9F     LDX   $F3
            LDA   $F1
            STX   $E6
            ORA   $E6
            BNE   L019AAC
            BRL   L019BCB
L019AAC     JSL   L015B49
            STX   $DE
            STA   $DC
            LDA   $FD
            BNE   L019ABB
            BRL   L019B48
L019ABB     LDA   $DC
            CMP   #$FFFF
            BNE   L019AD0
            LDA   $DE
            CMP   #$FFFF
            BNE   L019AD0
            LDA   #$0001
            STA   $E4
            BRA   L019B45
L019AD0     LDY   #$0002
            LDA   [$F1],Y
            LDX   #$0000
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L013333
            BEQ   L019AEB
            BVS   L019AE9
            EOR   #$8000
L019AE9     BMI   L019B0E
L019AEB     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $003C
            LDA   [$F1]
            PHA
            LDY   #$0002
            LDA   [$F1],Y
            PHA
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L019B45
L019B0E     LDA   [$F1]
            LDX   #$0000
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L013333
            BVS   L019B22
            EOR   #$8000
L019B22     BPL   L019B45
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $003C
            LDY   #$0002
            LDA   [$F1],Y
            PHA
            LDA   [$F1]
            PHA
            JSL   L013620
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L019B45     BRL   L019BCB
L019B48     SEC
            LDA   $DC
            SBC   #$FFFF
            BNE   L019B57
            LDA   $DE
            SBC   #$FFFF
            BRA   L019B5E
L019B57     LDA   $DE
            SBC   #$FFFF
            REP   #$02
L019B5E     BEQ   L019B7B
            LDY   #$0002
            LDA   [$F1],Y
            LDX   #$0000
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L013333
            BEQ   L019B7B
            BVS   L019B79
            EOR   #$8000
L019B79     BMI   L019B80
L019B7B     LDA   #$0001
            STA   $E4
L019B80     LDA   L020111
            BEQ   L019BCB
L019B85     LDX   $DE
            LDA   $DC
            PHA
            LDA   $C0
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDY   #$0001
            LDA   [$E6],Y
            PLX
            STX   $E6
            CMP   $E6
            BEQ   L019BB9
            BCS   L019BCB
L019BB9     LDA   $C0
            CMP   L020111
            BCS   L019BCB
            PEI   $C0
            JSL   L01B456
            PLY
            INC   $C0
            BRA   L019B85
L019BCB     PHA
            PEA   $000A
            PEA   $0000
            TDC
            CLC
            ADC   #$00B0
            PHA
            _GetNextEvent
            BCS   L019BE4
            LDA   #$0000
L019BE4     STAL  L020002
            PLA
            TAY
            BNE   L019BEF
            BRL   L019D3C
L019BEF     LDA   $B0
            BRL   L019D2E
L019BF4     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEI   $BC
            PEI   $BA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            _FindControl
            BCS   L019C19
            LDA   #$0000
L019C19     STAL  L020002
            PLA
            STA   $C2
            LDX   $F7
            LDA   $F5
            STX   $E6
            ORA   $E6
            BNE   L019C34
            LDX   $FB
            LDA   $F9
            STX   $E6
            ORA   $E6
            BEQ   L019C4F
L019C34     LDA   $C2
            CMP   #$0002
            BNE   L019C4F
            LDX   $F3
            LDA   $F1
            STX   $E6
            ORA   $E6
            BEQ   L019C4D
            PEA   $0000
            JSL   sendLDStill
            PLY
L019C4D     BRA   L019C52
L019C4F     BRL   L019D3C
L019C52     LDX   $FB
            LDA   $F9
            STX   $E6
            ORA   $E6
            BEQ   L019CB7
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDY   #$0002
            LDA   [$E0],Y
            TAX
            LDA   [$E0]
            STA   $E6
            STX   $E8
            LDY   #$0022
            LDA   [$E6],Y
            TAX
            LDY   #$0020
            LDA   [$E6],Y
            JSL   L013333
            BNE   L019CB7
            PEA   $0002
            PEI   $FB
            PEI   $F9
            _HiliteControl
            BCS   L019C94
            LDA   #$0000
L019C94     STAL  L020002
            LDX   $F3
            LDA   $F1
            STX   $E6
            ORA   $E6
            BEQ   L019CA7
            LDA   #$0001
            BRA   L019CAA
L019CA7     LDA   #$0000
L019CAA     PHA
            JSL   L070C78
            PLY
            LDA   #$0001
            STA   $E4
            BRA   L019CE8
L019CB7     LDX   $F7
            LDA   $F5
            STX   $E6
            ORA   $E6
            BEQ   L019CE8
            PEA   $0002
            PEI   $F7
            PEI   $F5
            _HiliteControl
            BCS   L019CD4
            LDA   #$0000
L019CD4     STAL  L020002
            LDA   $FF
            BEQ   L019CE3
            LDA   #$0001
            STAL  L031DFC
L019CE3     LDA   #$0001
            STA   $E4
L019CE8     BRL   L019D3C
L019CEB     LDA   $B2
            CMP   #$000D
            BNE   L019D1D
            LDA   $B4
            CMP   #$0000
            BNE   L019D1D
            PEA   $0002
            PEI   $F7
            PEI   $F5
            _HiliteControl
            BCS   L019D0C
            LDA   #$0000
L019D0C     STAL  L020002
            PEA   $0000
            JSL   sendLDStill
            PLY
            LDA   #$0001
            STA   $E4
L019D1D     BRL   L019D3C
L019D20     BRL   L019D3C
            BRL   L019D3C
L019D26     DA    L019BF4
            DA    L019D20
            DA    L019CEB
            DA    L019D20
L019D2E     DEC
            CMP   #$0003
            BCC   L019D37
            LDA   #$0003
L019D37     ASL
            TAX
            JMP   (L019D26,X)

L019D3C     BRL   L019A98
L019D3F     TSC
            CLC
            ADC   #$003C
            TCS
            PLD
            RTL

L019D47     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            PHA
            _SetSolidPenPat
            BCS   L019D77
            LDA   #$0000
L019D77     STAL  L020002
            LDY   #$0003
            LDA   [$EE],Y
            PHA
            LDY   #$0001
            LDA   [$EE],Y
            PHA
            _MoveTo
            BCS   L019D93
            LDA   #$0000
L019D93     STAL  L020002
            LDY   #$0007
            LDA   [$EE],Y
            PHA
            LDY   #$0005
            LDA   [$EE],Y
            PHA
            _LineTo
            BCS   L019DAF
            LDA   #$0000
L019DAF     STAL  L020002
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L019DBB     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00DC
            TCS
            LDA   #$0002
            PHA
            LDA   [$FD]
            CLC
            JSL   L012E82
            PLY
            LDX   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDA   #$00A0
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STX   $E8
            STA   $E6
            LDA   #$0002
            PHA
            LDA   [$FD]
            CLC
            JSL   L012E82
            PLY
            LDX   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDA   #$00A0
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STX   $E4
            STA   $E2
            LDA   #$0002
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            CLC
            JSL   L012E82
            PLY
            STA   $E0
            STZ   $DE
            BRA   L019E94
L019E4D     PEI   $E8
            PEI   $E6
            PEI   $E4
            PEI   $E2
            LDA   $E0
            LDX   #$0000
            PHX
            PHA
            _BlockMove
            BCS   L019E68
            LDA   #$0000
L019E68     STAL  L020002
            LDX   $E8
            LDA   $E6
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            LDX   $E4
            LDA   $E2
            CLC
            ADC   #$00A0
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E4
            STA   $E2
            INC   $DE
L019E94     LDY   #$0006
            LDA   [$FD],Y
            CMP   $DE
            BEQ   L019E9F
            BCS   L019E4D
L019E9F     TSC
            CLC
            ADC   #$0012
            TCS
            PLD
            RTL

L019EA7     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$0004
            LDA   [$FD],Y
            AND   #$00FF
            PHA
            PEA   $0002
            JSL   L012C5A
            PLY
            PLY
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L019ECC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            PHA
            JSL   L015CDA
            PLY
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L019EFD     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E0
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0009
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            LDA   [$E6]
            AND   #$00FF
            CMP   #$0000
            BNE   L019F81
            LDY   #$0001
            LDA   [$E6],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L019F60
            LDX   #$00E1
            LDA   #$2000
            BRA   L019F7B
L019F60     LDY   #$0001
            LDA   [$E6],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L019F75
            LDX   L0200F4
            LDA   L0200F2
            BRA   L019F7B
L019F75     LDX   #$0000
            LDA   #$0000
L019F7B     STX   $E4
            STA   $E2
            BRA   L019F8B
L019F81     LDX   #$00E1
            LDA   #$2000
            STX   $E4
            STA   $E2
L019F8B     LDA   [$EE]
            AND   #$00FF
            PHA
            PEI   $EC
            PEI   $EA
            PEI   $E4
            PEI   $E2
            JSL   L01BD93
            PLY
            PLY
            PLY
            PLY
            PLY
            TSC
            CLC
            ADC   #$0016
            TCS
            PLD
            RTL

L019FAA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            PHA
            LDX   L02007A
            LDA   L020078
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            STX   $EC
            STA   $EA
            PEA   $0000
            LDY   #$0006
            LDA   [$EA],Y
            LDX   #$0000
            STX   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            ASL
            ROL   $F6
            LDX   $F6
            PHX
            PHA
            LDX   L020092
            LDA   L020090
            JSL   L012E77
            _SetColorTable
            BCS   L01A014
            LDA   #$0000
L01A014     STAL  L020002
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L01A020     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            BRL   L01A0DF
L01A046     LDY   #$0001
            LDA   [$EE],Y
            PHA
            LDX   L02007A
            LDA   L020078
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            PHA
            TXA
            STAL  L031DE8
            PLA
            STAL  L031DE6
            BRL   L01A0EC
L01A069     LDY   #$0001
            LDA   [$EE],Y
            PHA
            LDX   L02007E
            LDA   L02007C
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            PHA
            TXA
            STAL  L031DE8
            PLA
            STAL  L031DE6
            BRL   L01A0EC
L01A08C     LDY   #$0001
            LDA   [$EE],Y
            PHA
            LDX   L020086
            LDA   L020084
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            PHA
            TXA
            STAL  L031DE8
            PLA
            STAL  L031DE6
            BRL   L01A0EC
L01A0AF     LDY   #$0001
            LDA   [$EE],Y
            PHA
            LDX   L020082
            LDA   L020080
            PHX
            PHA
            JSL   L018F17
            PLY
            PLY
            PLY
            PHA
            TXA
            STAL  L031DE8
            PLA
            STAL  L031DE6
            BRL   L01A0EC
L01A0D2     BRL   L01A0EC
L01A0D5     DA    L01A0AF
            DA    L01A046
            DA    L01A069
            DA    L01A08C
            DA    L01A0D2
L01A0DF     CMP   #$0004
            BCC   L01A0E7
            LDA   #$0004
L01A0E7     ASL
            TAX
            JMP   (L01A0D5,X)

L01A0EC     TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L01A0F4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            JSL   L012BFB
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A10B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            _HideCursor
            BCS   L01A122
            LDA   #$0000
L01A122     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A12E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E0
            TCS
            STZ   $EE
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E8
            STA   $E6
            STX   $E4
            STA   $E2
L01A165     LDA   [$E2]
            AND   #$00FF
            BEQ   L01A174
            INC   $E2
            BNE   L01A172
            INC   $E4
L01A172     BRA   L01A165
L01A174     INC   $E2
            BNE   L01A17A
            INC   $E4
L01A17A     STZ   $F0
            BRL   L01A21F
L01A17F     LDA   [$E2]
            AND   #$00FF
            BRL   L01A210
L01A187     LDY   #$0001
            LDA   [$E2],Y
            AND   #$00FF
            PHA
            _SetForeColor
            BCS   L01A19C
            LDA   #$0000
L01A19C     STAL  L020002
            LDX   $E4
            LDA   $E2
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E4
            STA   $E2
            BRL   L01A21D
L01A1B6     LDY   #$0001
            LDA   [$E2],Y
            AND   #$00FF
            PHA
            _SetBackColor
            BCS   L01A1CB
            LDA   #$0000
L01A1CB     STAL  L020002
            LDX   $E4
            LDA   $E2
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E4
            STA   $E2
            BRL   L01A21D
L01A1E5     LDY   #$0001
            LDA   [$E2],Y
            AND   #$00FF
            STA   $EE
            LDX   $E4
            LDA   $E2
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $E4
            STA   $E2
            BRL   L01A21D
L01A205     BRL   L01A21D
L01A208     DA    L01A1B6
            DA    L01A1E5
            DA    L01A187
            DA    L01A205
L01A210     CMP   #$0003
            BCC   L01A218
            LDA   #$0003
L01A218     ASL
            TAX
            JMP   (L01A208,X)

L01A21D     INC   $F0
L01A21F     LDY   #$0002
            LDA   [$FD],Y
            CMP   $F0
            BEQ   L01A22D
            BCC   L01A22D
            BRL   L01A17F
L01A22D     PEI   $EE
            JSL   L01335E
            PLY
            LDA   [$EA]
            PHA
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            _MoveTo
            BCS   L01A249
            LDA   #$0000
L01A249     STAL  L020002
            PEI   $E8
            PEI   $E6
            _DrawCString
            BCS   L01A25D
            LDA   #$0000
L01A25D     STAL  L020002
            TSC
            CLC
            ADC   #$0016
            TCS
            PLD
            RTL

L01A269     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00DB
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            SEP   #$20
            STZ   $E7
            REP   #$20
            STZ   $E5
            STZ   $E8
            BRL   L01A325
L01A2A7     LDA   [$EA]
            AND   #$00FF
            BRL   L01A316
L01A2AF     LDY   #$0001
            LDA   [$EA],Y
            SEP   #$20
            STA   $E7
            REP   #$20
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L01A323
L01A2D0     LDA   #$0001
            STA   $E5
            LDY   #$0001
            LDA   [$EA],Y
            STA   $DD
            LDY   #$0003
            LDA   [$EA],Y
            STA   $DF
            LDY   #$0005
            LDA   [$EA],Y
            SEC
            SBC   $DD
            STA   $E1
            LDY   #$0007
            LDA   [$EA],Y
            SEC
            SBC   $DF
            STA   $E3
            LDX   $EC
            LDA   $EA
            CLC
            ADC   #$0009
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L01A323
L01A30D     BRL   L01A323
L01A310     DA    L01A2D0
            DA    L01A2AF
            DA    L01A30D
L01A316     CMP   #$0002
            BCC   L01A31E
            LDA   #$0002
L01A31E     ASL
            TAX
            JMP   (L01A310,X)

L01A323     INC   $E8
L01A325     LDY   #$0002
            LDA   [$FD],Y
            CMP   $E8
            BEQ   L01A333
            BCC   L01A333
            BRL   L01A2A7
L01A333     LDA   $E5
            BNE   L01A33A
            BRL   L01A3B0
L01A33A     PEA   $0000
            TDC
            CLC
            ADC   #$00DD
            PHA
            LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L01A358
            LDX   #$00E1
            LDA   #$2000
            BRA   L01A373
L01A358     LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L01A36D
            LDX   L0200F4
            LDA   L0200F2
            BRA   L01A373
L01A36D     LDX   #$0000
            LDA   #$0000
L01A373     PHX
            PHA
            LDA   [$EE]
            AND   #$00FF
            CMP   #$0002
            BNE   L01A387
            LDX   #$00E1
            LDA   #$2000
            BRA   L01A39F
L01A387     LDA   [$EE]
            AND   #$00FF
            CMP   #$0001
            BNE   L01A399
            LDX   L0200F4
            LDA   L0200F2
            BRA   L01A39F
L01A399     LDX   #$0000
            LDA   #$0000
L01A39F     PHX
            PHA
            JSL   L019DBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L01A41D
L01A3B0     LDA   $E7
            AND   #$00FF
            PHA
            LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0002
            BNE   L01A3CB
            LDX   #$00E1
            LDA   #$2000
            BRA   L01A3E6
L01A3CB     LDY   #$0001
            LDA   [$EE],Y
            AND   #$00FF
            CMP   #$0001
            BNE   L01A3E0
            LDX   L0200F4
            LDA   L0200F2
            BRA   L01A3E6
L01A3E0     LDX   #$0000
            LDA   #$0000
L01A3E6     PHX
            PHA
            LDA   [$EE]
            AND   #$00FF
            CMP   #$0002
            BNE   L01A3FA
            LDX   #$00E1
            LDA   #$2000
            BRA   L01A412
L01A3FA     LDA   [$EE]
            AND   #$00FF
            CMP   #$0001
            BNE   L01A40C
            LDX   L0200F4
            LDA   L0200F2
            BRA   L01A412
L01A40C     LDX   #$0000
            LDA   #$0000
L01A412     PHX
            PHA
            JSL   L015EAC
            PLY
            PLY
            PLY
            PLY
            PLY
L01A41D     TSC
            CLC
            ADC   #$001B
            TCS
            PLD
            RTL

L01A425     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            _InitCursor
            BCS   L01A43C
            LDA   #$0000
L01A43C     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A448     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            _WaitCursor
            BCS   L01A45F
            LDA   #$0000
L01A45F     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A46B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            _ShowCursor
            BCS   L01A482
            LDA   #$0000
L01A482     STAL  L020002
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A48E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            PEA   $0001
            PEA   $0001
            _SetPenSize
            BCS   L01A4BE
            LDA   #$0000
L01A4BE     STAL  L020002
            LDA   [$EE]
            AND   #$00FF
            PHA
            _SetSolidPenPat
            BCS   L01A4D4
            LDA   #$0000
L01A4D4     STAL  L020002
            PEA   ^L038CC9
            PEA   L038CC9
            _PaintRect
            BCS   L01A4EA
            LDA   #$0000
L01A4EA     STAL  L020002
            TSC
            CLC
            ADC   #$000A
            TCS
            PLD
            RTL

L01A4F6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            JSL   L012E00
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01A50D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D4
            TCS
            STZ   $DA
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            CLC
            ADC   #$0008
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            STX   $E8
            STA   $E6
L01A544     LDX   $E8
            LDA   $E6
            INC   $E6
            BNE   L01A54E
            INC   $E8
L01A54E     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            BEQ   L01A55B
            BRA   L01A544
L01A55B     INC   $E6
            BNE   L01A561
            INC   $E8
L01A561     LDX   $E8
            LDA   $E6
            STX   $E4
            STA   $E2
            LDX   $E4
            LDA   $E2
            CLC
            ADC   #$0008
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $DE
            STA   $DC
            STZ   $E0
            BRL   L01A5AC
L01A581     LDA   [$DC]
            AND   #$00FF
            BRL   L01A5A5
L01A589     LDA   #$0001
            STA   $DA
            LDX   $DE
            LDA   $DC
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $DE
            STA   $DC
            BRA   L01A5AA
            BRA   L01A5AA
L01A5A5     CMP   #$0000
            BEQ   L01A589
L01A5AA     INC   $E0
L01A5AC     LDY   #$0002
            LDA   [$FD],Y
            CMP   $E0
            BEQ   L01A5B7
            BCS   L01A581
L01A5B7     PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            PEI   $EC
            PEI   $EA
            LDY   #$0002
            LDA   [$E2],Y
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0138ED
            PEA   L0138ED
            LDY   #$0006
            LDA   [$E2],Y
            TAX
            LDY   #$0004
            LDA   [$E2],Y
            PHX
            PHA
            LDA   $DA
            BEQ   L01A5FF
            LDA   #L038CD1
            LDX   #^L038CD1
            BRA   L01A605
L01A5FF     LDX   #$0000
            LDA   #$0000
L01A605     PHX
            PHA
            _NewControl
            BCS   L01A613
            LDA   #$0000
L01A613     STAL  L020002
            PLA
            PLX
            STX   $D8
            STA   $D6
            PHX
            PHA
            _ShowControl
            BCS   L01A62B
            LDA   #$0000
L01A62B     STAL  L020002
            LDX   $D8
            LDA   $D6
            PHA
            TXA
            STAL  L031DFA
            PLA
            STAL  L031DF8
            TSC
            CLC
            ADC   #$0022
            TCS
            PLD
            RTL

L01A646     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00D8
            TCS
            PEI   $F5
            PEI   $F3
            JSL   L01BE7C
            PLY
            PLY
            STX   $E2
            STA   $E0
            LDY   #$0002
            LDA   [$E0],Y
            TAX
            LDA   [$E0]
            STX   $DE
            STA   $DC
            PEI   $FF
            PEA   $000F
            PEA   $0000
            PEI   $DE
            PEI   $DC
            PEA   $0000
            TDC
            CLC
            ADC   #$00F7
            PHA
            JSL   L01BAD3
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STX   $E6
            STA   $E4
            LDA   $FF
            BEQ   L01A6CC
            PEI   $E6
            PEI   $E4
            JSL   L01A71C
            PLY
            PLY
            PEI   $E2
            PEI   $E0
            _DisposeHandle
            BCS   L01A6AE
            LDA   #$0000
L01A6AE     STAL  L020002
            LDA   L020002
            STA   $DA
            TAY
            BEQ   L01A6C9
            PEI   $DA
            PEA   ^L037E09
            PEA   L037E09
            JSL   L050256
            PLY
            PLY
            PLY
L01A6C9     BRL   L01A6F1
L01A6CC     LDX   $E2
            LDA   $E0
            STX   L02010B
            STA   L020109
            LDX   $E6
            LDA   $E4
            STX   L02010F
            STA   L02010D
            LDA   #L01BF3E
            LDX   #^L01BF3E
            PHA
            TXA
            STAL  L031DEC
            PLA
            STAL  L031DEA
L01A6F1     TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L01A6F9     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0006
            PEA   $0003
            PEA   $0000
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

L01A71C     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D4
            TCS
            STZ   $D8
            LDX   #$0000
            LDA   #$0904
            STX   $F0
            STA   $EE
L01A733     LDA   $D8
            BEQ   L01A73A
            BRL   L01A79B
L01A73A     PHA
            PEA   $FEFF
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            _TaskMaster
            BCS   L01A753
            LDA   #$0000
L01A753     STAL  L020002
            PLA
            STA   $D6
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L013333
            BEQ   L01A76C
            BRA   L01A733
L01A76C     LDA   $D6
            BRL   L01A791
L01A771     PEI   $FF
            PEI   $FD
            _CloseWindow
            BCS   L01A781
            LDA   #$0000
L01A781     STAL  L020002
            LDA   #$0001
            STA   $D8
            BRL   L01A799
L01A78D     BRA   L01A799
            BRA   L01A799
L01A791     CMP   #$0016
            BEQ   L01A771
            JMP   L01A78D

L01A799     BRA   L01A733
L01A79B     TSC
            CLC
            ADC   #$0022
            TCS
            PLD
            RTL

getSerialOutputStatus
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000
            JSL   llSerialStatus	; Are you ready to accept output?
            PLY		; 1, yes
            TAY		. 0: no
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01A7C0     PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00E0
            TCS
            PEA   $0000
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            PEI   $F3
            PEI   $F1
            PEI   $EF
            PEI   $ED
            JSL   L01C2E5
            TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            TAY
            TDC
            CLC
            ADC   #$00E7
            TCS
            TYA
            PLD
            RTL

L01A7F8     PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00E0
            TCS
            PEA   $0001
            PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            PEI   $F3
            PEI   $F1
            PEI   $EF
            PEI   $ED
            JSL   L01C2E5
            TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            TAY
            TDC
            CLC
            ADC   #$00E7
            TCS
            TYA
            PLD
            RTL

L01A830     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            STZ   $F4
            STZ   $F4
            BRL   L01A916
L01A842     LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            BRL   L01A906
L01A86B     PHX
            PHA
            LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0009
            LDA   [$F6],Y
            TAX
            LDY   #$0007
            LDA   [$F6],Y
            PHX
            PHA
            _FindHandle
            BCS   L01A8A7
            LDA   #$0000
L01A8A7     STAL  L020002
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L01A8C8
            PEI   $EE
            PEA   ^L038912
            PEA   L038912
            JSL   L050256
            PLY
            PLY
            PLY
L01A8C8     PEI   $F2
            PEI   $F0
            _DisposeHandle
            BCS   L01A8D8
            LDA   #$0000
L01A8D8     STAL  L020002
            LDA   L020002
            STA   $EE
            TAY
            BEQ   L01A8F3
            PEI   $EE
            PEA   ^L03893A
            PEA   L03893A
            JSL   L050256
            PLY
            PLY
            PLY
L01A8F3     BRL   L01A914
L01A8F6     BRL   L01A914
L01A8F9     BRL   L01A914
L01A8FC     DA    L01A8F6
            DA    L01A86B
            DA    L01A86B
            DA    L01A86B
            DA    L01A8F9
L01A906     DEC
            CMP   #$0004
            BCC   L01A90F
            LDA   #$0004
L01A90F     ASL
            TAX
            JMP   (L01A8FC,X)

L01A914     INC   $F4
L01A916     LDA   $F4
            CMP   L020111
            BCS   L01A920
            BRL   L01A842
L01A920     TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L01A928     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            STZ   $F4
            BRL   L01AA75
L01A93A     LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            BRL   L01AA65
L01A963     LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0005
            LDA   [$F6],Y
            TAX
            LDY   #$0003
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            PHA
            LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0005
            LDA   [$F6],Y
            TAX
            LDY   #$0003
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0005
            LDA   [$F6],Y
            TAX
            LDY   #$0003
            LDA   [$F6],Y
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
            PHX
            PHA
            LDA   $F4
            PHA
            LDA   #$000B
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$0009
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0007
            STA   [$F6],Y
            BRL   L01AA73
L01AA4F     BRL   L01AA73
L01AA52     BRL   L01AA73
L01AA55     BRL   L01AA73
L01AA58     BRL   L01AA73
L01AA5B     DA    L01AA4F
            DA    L01AA55
            DA    L01A963
            DA    L01AA52
            DA    L01AA58
L01AA65     DEC
            CMP   #$0004
            BCC   L01AA6E
            LDA   #$0004
L01AA6E     ASL
            TAX
            JMP   (L01AA5B,X)

L01AA73     INC   $F4
L01AA75     LDA   $F4
            CMP   L020111
            BCS   L01AA7F
            BRL   L01A93A
L01AA7F     PEA   ^L01B7E3
            PEA   L01B7E3
            PEA   $000B
            LDA   L020111
            PHA
            PEA   ^L0389E9
            PEA   L0389E9
            JSL   L01AB66
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L01AAA6     TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            LDA   $0A,S
            PHA
            LDA   $0A,S
            PHA
            PEA   $0010
            _SANEFP816
            LDA   $02,S
            STA   $06,S
            LDA   $00,S
            STA   $04,S
            PLY
            PLY
            RTL

sendLDSCAN
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L01AAEA
            PEA   ^L0380A0	; Scan Forward
            PEA   L0380A0
            JSL   sendLDCommand
            PLY
            PLY
            BRA   L01AAF6
L01AAEA     PEA   ^L0380A3	; Scan Reverse
            PEA   L0380A3
            JSL   sendLDCommand
            PLY
            PLY
L01AAF6     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01AB00     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PHX
            PHA
            LDAL  L031DDC
            TAX
            LDAL  L031DDA
            PHX
            PHA
            PEA   ^L038984
            PEA   L038984
            PEA   ^L03898C
            PEA   L03898C
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   ^L03897A
            PEA   L03897A
            _NewControl
            BCS   L01AB4E
            LDA   #$0000
L01AB4E     STAL  L020002
            PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            STA   [$FD]
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01AB66     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E8
            TCS
            LDX   $FF
            LDA   $FD
            STX   L020107
            STA   L020105
            LDA   $FB
            STA   L020103
            LDA   $FB
            PHA
            LDA   $F9
            CLC
            JSL   L013003
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PEI   $F7
            PEI   $F5
            JSL   L01BF91
            PLY
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L01ABAC     TAY
            PHB
            LDA   $06,S
            PHA
            PLB
            PLB
            PHY
            PHY
            PEA   $0000
            TXA
            CMP   ($0B,S),Y
            BEQ   L01ABEC
            LDY   #$0000
            CMP   ($0B,S),Y
            BEQ   L01ABEC
            BRA   L01ABC9
L01ABC6     TYA
            STA   $03,S
L01ABC9     LDA   $03,S
            CMP   $01,S
            BEQ   L01ABE7
            CLC
            ADC   $01,S
            LSR
            AND   #$00FE
            CMP   $01,S
            BEQ   L01ABE7
            TAY
            TXA
            CMP   ($0B,S),Y
            BEQ   L01ABEC
            BCC   L01ABC6
            TYA
            STA   $01,S
            BRA   L01ABC9
L01ABE7     LDA   $05,S
            INC
            INC
            TAY
L01ABEC     TYX
            PLA
            PLA
            PLA
            PLB
            RTL

L01ABF2     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E2
            TCS
            PEI   $FF
            PEA   ^L0380C6
            PEA   L0380C6
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L01508C
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   sendLDCommand
            PLY
            PLY
            TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            PLD
            RTL

L01AC30     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            AND   #$0080
            TAY
            BEQ   L01AC94
            LDA   $FF
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L01AC72
            BVS   L01AC70
            EOR   #$8000
L01AC70     BMI   L01AC7D
L01AC72     LDA   $FF
            AND   #$00FF
            SEC
            SBC   #$0030
            BRA   L01AC90
L01AC7D     LDA   $FF
            AND   #$00FF
            PHA
            JSL   L01B219
            PLY
            SEC
            SBC   #$0061
            CLC
            ADC   #$000A
L01AC90     BRA   L01AC97
            BRA   L01AC97
L01AC94     LDA   #$FFFF
L01AC97     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L01ACA1     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00DC
            TCS
            LDA   $F9
            SEC
            SBC   #$0000
            BNE   L01ACB7
            BRL   L01AD35
L01ACB7     BVS   L01ACBC
            EOR   #$8000
L01ACBC     BPL   L01AD35
            LDA   $FB
            SEC
            SBC   #$0000
            BEQ   L01AD35
            BVS   L01ACCB
            EOR   #$8000
L01ACCB     BPL   L01AD35
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0012
            CMP   #$0002
            BNE   L01AD23
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01AD23
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BNE   L01AD2F
            LDA   [$FD]
            CMP   #$0000
            BNE   L01AD2F
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0044
            TAY
            BNE   L01AD2F
L01AD23     PEI   $FF
            PEI   $FD
            JSL   L01B0F6
            PLY
            PLY
            BRA   L01AD32
L01AD2F     LDA   #$0000
L01AD32     TAY
            BEQ   L01AD3B
L01AD35     LDA   #$0000
            BRL   L01AF0E
L01AD3B     LDA   $F9
            PHA
            LDA   $FB
            SEC
            JSL   L013003
            PLA
            STA   $E8
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0044
            TAY
            BNE   L01AD56
            BRL   L01ADDB
L01AD56     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0004
            TAY
            BEQ   L01AD79
            PEI   $E8
            PEI   $F7
            PEI   $F5
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01C6F7
            PLY
            PLY
            PLY
            PLY
            STA   $E6
            BRA   L01ADAB
L01AD79     STZ   $E6
            BRA   L01ADA5
L01AD7D     PEI   $FF
            PEI   $FD
            LDX   $F7
            LDA   $F5
            INC   $F5
            BNE   L01AD8B
            INC   $F7
L01AD8B     STA   $EA
            STX   $EC
            LDA   [$EA]
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
            CMP   #$FFFF
            BNE   L01ADA3
            BRA   L01ADAB
L01ADA3     INC   $E6
L01ADA5     LDA   $E6
            CMP   $E8
            BCC   L01AD7D
L01ADAB     LDA   $E6
            SEC
            SBC   #$0000
            BVS   L01ADB6
            EOR   #$8000
L01ADB6     BMI   L01ADC0
            LDA   #$0000
            BRL   L01AF0E
            BRA   L01ADDB
L01ADC0     LDA   $E6
            CMP   $E8
            BNE   L01ADCD
            LDA   $FB
            BRL   L01AF0E
            BRA   L01ADDB
L01ADCD     LDA   $F9
            PHA
            LDA   $E6
            SEC
            JSL   L012E82
            PLY
            BRL   L01AF0E
L01ADDB     LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            STX   $E0
            STA   $DE
L01ADEA     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            STX   $E4
            STA   $E2
            PHX
            PHA
            LDX   $E0
            LDA   $DE
            JSL   L012FF8
            PLA
            PLX
            STA   $E6
            SEC
            SBC   #$0000
            BEQ   L01AE14
            BVS   L01AE12
            EOR   #$8000
L01AE12     BMI   L01AE43
L01AE14     PEI   $FF
            PEI   $FD
            JSL   L01B913
            PLY
            PLY
            CMP   #$FFFF
            BNE   L01AE41
            LDA   $F9
            PHA
            LDA   $E8
            CLC
            ADC   $F9
            SEC
            SBC   #$0001
            CLC
            JSL   L012E82
            PLY
            PHA
            LDA   $FB
            PLX
            STX   $EE
            SEC
            SBC   $EE
            BRL   L01AF0E
L01AE41     BRA   L01ADEA
L01AE43     LDA   $E6
            CMP   $E8
            BEQ   L01AE4F
            BCC   L01AE4F
            LDA   $E8
            BRA   L01AE51
L01AE4F     LDA   $E6
L01AE51     STA   $E6
            PEI   $E6
            PEI   $F7
            PEI   $F5
            PEI   $E4
            PEI   $E2
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   [$FD]
            SEC
            SBC   $E6
            STA   [$FD]
            LDA   $E6
            LDX   #$0000
            TAY
            BPL   L01AE76
            DEX
L01AE76     PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            JSL   L012FF8
            PLA
            PLX
            PHA
            LDA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01AEC0
            EOR   #$8000
L01AEC0     BMI   L01AEC7
            LDA   #$0000
            BRA   L01AEC9
L01AEC7     LDA   [$FD]
L01AEC9     PLX
            STX   $EA
            SEC
            SBC   $EA
            BEQ   L01AEE2
            BVS   L01AED6
            EOR   #$8000
L01AED6     BPL   L01AEE2
            PEI   $FF
            PEI   $FD
            JSL   L01B8A7
            PLY
            PLY
L01AEE2     LDA   $E8
            SEC
            SBC   $E6
            STA   $E8
            CMP   #$0000
            BNE   L01AEF2
            LDA   $FB
            BRA   L01AF0E
L01AEF2     LDA   $E6
            LDX   #$0000
            TAY
            BPL   L01AEFB
            DEX
L01AEFB     PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L012E77
            PLA
            PLX
            STX   $F7
            STA   $F5
            BRL   L01ADEA
L01AF0E     TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L01AF18     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00ED
            TCS
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0052
            CMP   #$0042
            BEQ   L01AF33
            BRL   L01AFB8
L01AF33     LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01AF58
            BVS   L01AF56
            EOR   #$8000
L01AF56     BMI   L01AF5B
L01AF58     BRL   L01B007
L01AF5B     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L01AF79
            INC
L01AF79     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   $FB
            SEP   #$20
            STA   [$F0]
            REP   #$20
            AND   #$00FF
            CMP   #$000A
            BEQ   L01AF9C
            LDA   $FB
            AND   #$00FF
            BRL   L01B0EC
L01AF9C     PEI   $FF
            PEI   $FD
            JSL   L01B913
            PLY
            PLY
            CMP   #$FFFF
            BNE   L01AFB0
            LDA   #$FFFF
            BRA   L01AFB5
L01AFB0     LDA   $FB
            AND   #$00FF
L01AFB5     BRL   L01B0EC
L01AFB8     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0016
            CMP   #$0006
            BNE   L01B007
            LDA   $FB
            SEP   #$20
            STA   $EF
            REP   #$20
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00EF
            PHA
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01C6F7
            PLY
            PLY
            PLY
            PLY
            CMP   #$0001
            BNE   L01AFF4
            LDA   $FB
            AND   #$00FF
            BRL   L01B0EC
L01AFF4     LDY   #$0010
            LDA   [$FD],Y
            ORA   #$0020
            LDY   #$0010
            STA   [$FD],Y
            LDA   #$FFFF
            BRL   L01B0EC
L01B007     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0012
            CMP   #$0002
            BNE   L01B05D
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01B05D
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BNE   L01B069
            LDA   [$FD]
            CMP   #$0000
            BNE   L01B069
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0044
            TAY
            BNE   L01B069
L01B05D     PEI   $FF
            PEI   $FD
            JSL   L01B0F6
            PLY
            PLY
            BRA   L01B06C
L01B069     LDA   #$0000
L01B06C     TAY
            BEQ   L01B074
            LDA   #$FFFF
            BRA   L01B0EC
L01B074     PEI   $FF
            PEI   $FD
            JSL   L01B913
            PLY
            PLY
            LDA   [$FD]
            DEC
            STA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01B08C
            EOR   #$8000
L01B08C     BPL   L01B0C6
            LDA   $FB
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            BCC   L01B0AF
            INC
L01B0AF     LDY   #$0004
            STA   [$FD],Y
            PLA
            PLX
            STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            AND   #$00FF
            BRA   L01B0D7
L01B0C6     PEI   $FF
            PEI   $FD
            LDA   $FB
            AND   #$00FF
            PHA
            JSL   L01AF18
            PLY
            PLY
            PLY
L01B0D7     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0020
            TAY
            BEQ   L01B0E7
            LDA   #$FFFF
            BRA   L01B0EC
L01B0E7     LDA   $FB
            AND   #$00FF
L01B0EC     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L01B0F6     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0012
            CMP   #$0002
            BEQ   L01B12F
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0082
            TAY
            BNE   L01B11F
            LDA   #$FFFF
            BRL   L01B1D1
L01B11F     LDY   #$0010
            LDA   [$FD],Y
            AND   #$FFEF
            ORA   #$0002
            LDY   #$0010
            STA   [$FD],Y
L01B12F     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BNE   L01B152
            PEI   $FF
            PEI   $FD
            JSL   L01B254
            PLY
            PLY
L01B152     LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BNE   L01B1CE
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0044
            TAY
            BNE   L01B1CE
            LDY   #$000E
            LDA   [$FD],Y
            STA   [$FD]
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            JSL   L012FF8
            PLA
            PLX
            PHA
            LDA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01B1AC
            EOR   #$8000
L01B1AC     BMI   L01B1B3
            LDA   #$0000
            BRA   L01B1B5
L01B1B3     LDA   [$FD]
L01B1B5     PLX
            STX   $F2
            SEC
            SBC   $F2
            BEQ   L01B1CE
            BVS   L01B1C2
            EOR   #$8000
L01B1C2     BPL   L01B1CE
            PEI   $FF
            PEI   $FD
            JSL   L01B8A7
            PLY
            PLY
L01B1CE     LDA   #$0000
L01B1D1     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01B1DB     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   [$F9]
            PHA
            LDA   [$FD]
            PLX
            STX   $EE
            CMP   $EE
            BCS   L01B1F9
            LDA   #$0001
            BRA   L01B20F
            BRA   L01B20F
L01B1F9     LDA   [$F9]
            PHA
            LDA   [$FD]
            PLX
            STX   $EE
            CMP   $EE
            BNE   L01B20C
            LDA   #$0000
            BRA   L01B20F
            BRA   L01B20F
L01B20C     LDA   #$FFFF
L01B20F     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01B219     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$0041
            BVS   L01B22F
            EOR   #$8000
L01B22F     BPL   L01B248
            LDA   $FF
            SEC
            SBC   #$005A
            BEQ   L01B240
            BVS   L01B23E
            EOR   #$8000
L01B23E     BMI   L01B248
L01B240     LDA   $FF
            SEC
            SBC   #$FFE0
            STA   $FF
L01B248     LDA   $FF
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L01B254     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDA   L020123
            STA   $F0
            LDA   L020002
            STA   $EE
            LDA   L020125
            BEQ   L01B27D
            STZ   L020125
            PEA   ^L01B60C
            PEA   L01B60C
            JSL   L01C958
            PLY
            PLY
L01B27D     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0004
            TAY
            BEQ   L01B2A6
            LDA   #$0000
            LDY   #$000E
            STA   [$FD],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0006
            STA   [$FD],Y
            BRL   L01B3D7
L01B2A6     LDY   #$000E
            LDA   [$FD],Y
            CMP   #$0000
            BNE   L01B30E
            LDX   #$0000
            LDA   #$0000
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0006
            STA   [$FD],Y
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0040
            TAY
            BEQ   L01B2D8
            LDA   #$0064
            LDY   #$000E
            STA   [$FD],Y
            BRA   L01B30E
L01B2D8     PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            PEA   $6603
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01C4F2
            PLY
            PLY
            PLY
            PLY
            SEC
            SBC   #$0000
            BVS   L01B2FB
            EOR   #$8000
L01B2FB     BPL   L01B306
            LDA   $EC
            LDY   #$000E
            STA   [$FD],Y
            BRA   L01B30E
L01B306     LDA   #$0400
            LDY   #$000E
            STA   [$FD],Y
L01B30E     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01B32A
            BRL   L01B3D7
L01B32A     LDY   #$000E
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            JSL   L014878
            PLY
            PLY
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0006
            STA   [$FD],Y
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BNE   L01B3A2
            LDY   #$000E
            LDA   [$FD],Y
            CMP   #$0064
            BEQ   L01B3A2
            BCC   L01B3A2
            LDY   #$000E
            LDA   [$FD],Y
            CMP   #$0400
            BEQ   L01B37D
            BCC   L01B37D
            LDA   #$0400
            BRA   L01B380
L01B37D     LDA   #$0064
L01B380     LDY   #$000E
            STA   [$FD],Y
            LDY   #$000E
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            JSL   L014878
            PLY
            PLY
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0006
            STA   [$FD],Y
L01B3A2     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01B3CA
            LDY   #$0010
            LDA   [$FD],Y
            ORA   #$0008
            LDY   #$0010
            STA   [$FD],Y
            BRA   L01B3D7
L01B3CA     LDY   #$0010
            LDA   [$FD],Y
            ORA   #$0004
            LDY   #$0010
            STA   [$FD],Y
L01B3D7     LDY   #$000E
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            LDY   #$000C
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000A
            STA   [$FD],Y
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            PEA   $0000
            PEA   $6602
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01C4F2
            PLY
            PLY
            PLY
            SEC
            SBC   #$0000
            BVS   L01B433
            EOR   #$8000
L01B433     BPL   L01B442
            LDY   #$0010
            LDA   [$FD],Y
            ORA   #$0100
            LDY   #$0010
            STA   [$FD],Y
L01B442     LDA   $F0
            STA   L020123
            LDA   $EE
            STA   L020002
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01B456     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00DA
            TCS
            LDA   $FF
            LDX   #$0000
            PEA   $0000
            PEA   $000B
            CLC
            JSL   L013048
            LDA   #L0389E9
            LDX   #^L0389E9
            JSL   L012E77
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDY   #$0005
            LDA   [$F0],Y
            TAX
            LDY   #$0003
            LDA   [$F0],Y
            STX   $EE
            STA   $EC
            LDY   #$0009
            LDA   [$F0],Y
            TAX
            LDY   #$0007
            LDA   [$F0],Y
            STX   $EA
            STA   $E8
            LDA   [$F0]
            AND   #$00FF
            BRL   L01B5F6
L01B4A7     PEA   $0000
            LDY   #$0006
            LDA   [$EC],Y
            LDX   #$0000
            STX   $F8
            ASL
            ROL   $F8
            ASL
            ROL   $F8
            ASL
            ROL   $F8
            ASL
            ROL   $F8
            ASL
            ROL   $F8
            LDX   $F8
            PHX
            PHA
            LDX   L020092
            LDA   L020090
            JSL   L012E77
            _SetColorTable
            BCS   L01B4DD
            LDA   #$0000
L01B4DD     STAL  L020002
            LDY   #$0004
            LDA   [$EC],Y
            PHA
            LDY   #$000C
            LDA   [$EC],Y
            PHA
            LDY   #$0008
            LDA   [$EC],Y
            AND   #$00FF
            AND   #$000F
            PHA
            LDY   #$0008
            LDA   [$EC],Y
            AND   #$00FF
            AND   #$00F0
            PHA
            LDY   #$0002
            LDA   [$EC],Y
            PHA
            LDA   [$EC]
            PHA
            PEA   $00E1
            PEA   $2000
            PEI   $EA
            PEI   $E8
            JSL   L014D17
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            BRL   L01B604
L01B527     LDY   #$0002
            LDA   [$EC],Y
            STA   $E0
            LDA   [$EC]
            STA   $E2
            LDY   #$0004
            LDA   [$EC],Y
            PHA
            LDY   #$000C
            LDA   [$EC],Y
            CLC
            JSL   L012E82
            PLY
            PHA
            LDA   $E0
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $E4
            LDY   #$0004
            LDA   [$EC],Y
            ASL
            PHA
            LDA   $E2
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $E6
            PEA   $000E
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $00E1
            PEA   $2000
            JSL   L01BD93
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L01B604
L01B57D     LDX   $EA
            LDA   $E8
            STX   $DE
            STA   $DC
            LDY   #$000A
            LDA   [$DC],Y
            AND   #$00FF
            PHA
            LDY   #$0008
            LDA   [$DC],Y
            PHA
            LDY   #$0006
            LDA   [$DC],Y
            PHA
            LDY   #$0004
            LDA   [$DC],Y
            PHA
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            PHX
            PHA
            JSL   L0C02CE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRL   L01B604
L01B5B9     LDX   $EA
            LDA   $E8
            STX   $DE
            STA   $DC
            LDY   #$0008
            LDA   [$DC],Y
            PHA
            LDY   #$0006
            LDA   [$DC],Y
            PHA
            LDY   #$0004
            LDA   [$DC],Y
            PHA
            LDY   #$0002
            LDA   [$DC],Y
            TAX
            LDA   [$DC]
            PHX
            PHA
            JSL   L0C00F5
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L01B604
L01B5E9     BRL   L01B604
L01B5EC     DA    L01B527
            DA    L01B5B9
            DA    L01B4A7
            DA    L01B57D
            DA    L01B5E9
L01B5F6     DEC
            CMP   #$0004
            BCC   L01B5FF
            LDA   #$0004
L01B5FF     ASL
            TAX
            JMP   (L01B5EC,X)

L01B604     TSC
            CLC
            ADC   #$001E
            TCS
            PLD
            RTL

L01B60C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   #L038CF2
            LDX   #^L038CF2
            STX   $F4
            STA   $F2
            BRA   L01B639
L01B623     PEI   $F4
            PEI   $F2
            JSL   L01C7D9
            PLY
            PLY
            LDA   $F2
            CLC
            ADC   #$0014
            STA   $F2
            BCC   L01B639
            INC   $F4
L01B639     SEC
            LDA   $F2
            SBC   L020113
            BNE   L01B648
            LDA   $F4
            SBC   L020115
            BRA   L01B64F
L01B648     LDA   $F4
            SBC   L020115
            REP   #$02
L01B64F     BVS   L01B654
            EOR   #$8000
L01B654     BPL   L01B623
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L01B660     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E0
            TCS
            LDY   #$000C
            LDA   [$F3],Y
            CMP   #$74E0
            BEQ   L01B678
            BRL   L01B6FD
L01B678     LDY   #$0008
            LDA   [$F3],Y
            AND   #$00FF
            AND   #$00F0
            CMP   #$0030
            BNE   L01B6FD
            LDA   $FB
            CMP   #$0000
            BNE   L01B6C9
            PEA   $0000
            LDY   #$0006
            LDA   [$F3],Y
            LDX   #$0000
            STX   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            LDX   $EC
            PHX
            PHA
            LDX   L020092
            LDA   L020090
            JSL   L012E77
            _SetColorTable
            BCS   L01B6C5
            LDA   #$0000
L01B6C5     STAL  L020002
L01B6C9     LDY   #$000C
            LDA   [$F3],Y
            PHA
            LDY   #$000A
            LDA   [$F3],Y
            PHA
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0820
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEI   $F9
            PEI   $F7
            JSL   L013C06
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STX   $E8
            ORA   $E8
            BRL   L01B7D9
L01B6FD     LDY   #$000C
            LDA   [$F3],Y
            PHA
            LDY   #$000A
            LDA   [$F3],Y
            PHA
            PEA   $0000
            PEA   $0000
            PEI   $F9
            PEI   $F7
            JSL   L013C06
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STX   $E6
            STA   $E4
            LDX   $E6
            LDA   $E4
            STX   $E8
            ORA   $E8
            LDA   $FB
            CMP   #$0000
            BNE   L01B76C
            PEA   $0000
            LDY   #$0006
            LDA   [$F3],Y
            LDX   #$0000
            STX   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            ASL
            ROL   $EC
            LDX   $EC
            PHX
            PHA
            LDX   L020092
            LDA   L020090
            JSL   L012E77
            _SetColorTable
            BCS   L01B768
            LDA   #$0000
L01B768     STAL  L020002
L01B76C     LDY   #$0004
            LDA   [$F3],Y
            PHA
            LDY   #$000C
            LDA   [$F3],Y
            PHA
            LDY   #$0008
            LDA   [$F3],Y
            AND   #$00FF
            AND   #$000F
            PHA
            LDY   #$0008
            LDA   [$F3],Y
            AND   #$00FF
            AND   #$00F0
            PHA
            LDY   #$0002
            LDA   [$F3],Y
            PHA
            LDA   [$F3]
            PHA
            PEI   $FF
            PEI   $FD
            PEI   $E6
            PEI   $E4
            JSL   L014D17
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            PHX
            PHA
            PEI   $E6
            PEI   $E4
            _FindHandle
            BCS   L01B7BF
            LDA   #$0000
L01B7BF     STAL  L020002
            _DisposeHandle
            BCS   L01B7CF
            LDA   #$0000
L01B7CF     STAL  L020002
            LDA   L020002
            STA   $E2
            TAY
L01B7D9     TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L01B7E3     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E4
            TCS
            LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
            LDX   $FF
            LDA   $FD
            STX   $E8
            STA   $E6
            LDY   #$0001
            LDA   [$EA],Y
            PHA
            LDY   #$0001
            LDA   [$E6],Y
            PLX
            STX   $EE
            CMP   $EE
            BEQ   L01B819
            BCC   L01B819
            LDA   #$FFFF
            BRA   L01B843
            BRA   L01B843
L01B819     LDY   #$0001
            LDA   [$EA],Y
            PHA
            LDY   #$0001
            LDA   [$E6],Y
            PLX
            STX   $EE
            CMP   $EE
            BNE   L01B840
            LDA   [$E6]
            AND   #$00FF
            PHA
            LDA   [$EA]
            AND   #$00FF
            PLX
            STX   $F2
            SEC
            SBC   $F2
            BRA   L01B843
            BRA   L01B843
L01B840     LDA   #$0001
L01B843     TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PLD
            RTL

L01B84D     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E6
            TCS
            LDA   $FF
            AND   #$00FF
            PHA
            _SetSolidPenPat
            BCS   L01B86A
            LDA   #$0000
L01B86A     STAL  L020002
            LDA   $FB
            STA   $EA
            LDA   $FD
            STA   $E8
            LDA   $FB
            CLC
            ADC   #$0005
            STA   $EE
            LDA   $FD
            CLC
            ADC   #$0003
            STA   $EC
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            _PaintRect
            BCS   L01B89B
            LDA   #$0000
L01B89B     STAL  L020002
            TSC
            CLC
            ADC   #$000E
            TCS
            PLD
            RTL

L01B8A7     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            JSL   L012FF8
            PLA
            PLX
            STA   $F0
            SEC
            SBC   #$0000
            BVS   L01B8DB
            EOR   #$8000
L01B8DB     BMI   L01B8F7
            LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            BRA   L01B909
L01B8F7     LDA   [$FD]
            SEC
            SBC   $F0
            BEQ   L01B909
            BVS   L01B903
            EOR   #$8000
L01B903     BPL   L01B909
            LDA   $F0
            STA   [$FD]
L01B909     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01B913     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            STX   $F0
            STA   $EE
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L012FF8
            PLA
            PLX
            STA   $EC
            LDX   $F0
            LDA   $EE
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0044
            TAY
            BEQ   L01B963
            LDA   #$0000
            BRA   L01B968
L01B963     LDY   #$000E
            LDA   [$FD],Y
L01B968     STA   [$FD]
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            TAX
            LDY   #$000A
            LDA   [$FD],Y
            JSL   L012FF8
            PLA
            PLX
            PHA
            LDA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01B994
            EOR   #$8000
L01B994     BMI   L01B99B
            LDA   #$0000
            BRA   L01B99D
L01B99B     LDA   [$FD]
L01B99D     PLX
            STX   $F2
            SEC
            SBC   $F2
            BEQ   L01B9B6
            BVS   L01B9AA
            EOR   #$8000
L01B9AA     BPL   L01B9B6
            PEI   $FF
            PEI   $FD
            JSL   L01B8A7
            PLY
            PLY
L01B9B6     LDA   $EC
            SEC
            SBC   #$0000
            BEQ   L01B9F0
            BVS   L01B9C3
            EOR   #$8000
L01B9C3     BPL   L01B9F0
            LDA   $EC
            PHA
            PEI   $F0
            PEI   $EE
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01C6F7
            PLY
            PLY
            PLY
            PLY
            CMP   $EC
            BEQ   L01B9F0
            LDY   #$0010
            LDA   [$FD],Y
            ORA   #$0020
            LDY   #$0010
            STA   [$FD],Y
            LDA   #$FFFF
            BRA   L01B9F3
L01B9F0     LDA   #$0000
L01B9F3     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01B9FD     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00C6
            TCS
            JSL   L015B49
            STA   $F0
            LDA   #$0001
            STA   $EC
            LDA   $FF
            BEQ   L01BA33
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            _GetColorTable
            BCS   L01BA2F
            LDA   #$0000
L01BA2F     STAL  L020002
L01BA33     LDA   #$0001
            BNE   L01BA3B
            BRL   L01BAC9
L01BA3B     LDA   $FF
            BEQ   L01BA4E
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L01CAE8
            PLY
            PLY
L01BA4E     JSL   L015B49
            STA   $EE
            LDA   $FF
            BEQ   L01BA74
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            _SetColorTable
            BCS   L01BA70
            LDA   #$0000
L01BA70     STAL  L020002
L01BA74     PEI   $EE
            PEI   $FD
            PEI   $F0
            JSL   L01CAAA
            PLY
            PLY
            PLY
            TAY
            BEQ   L01BA89
            LDA   #$0001
            BRA   L01BAC9
L01BA89     LDA   $EC
            BEQ   L01BAC6
            JSL   L015B49
            STA   $CA
            STZ   $EC
            LDA   $CA
            CMP   $EE
            BNE   L01BAA0
            LDA   #$0000
            BRA   L01BAC9
L01BAA0     LDA   $CA
            CMP   $EE
            BCS   L01BAB3
            LDA   $FD
            CMP   $EE
            BEQ   L01BAB3
            BCC   L01BAB3
            LDA   #$0000
            BRA   L01BAC9
L01BAB3     LDA   $CA
            CMP   $EE
            BEQ   L01BAC6
            BCC   L01BAC6
            LDA   $FD
            CMP   $EE
            BCS   L01BAC6
            LDA   #$0000
            BRA   L01BAC9
L01BAC6     BRL   L01BA33
L01BAC9     TAY
            TSC
            CLC
            ADC   #$0030
            TCS
            TYA
            PLD
            RTL

L01BAD3     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00CA
            TCS
            _WaitCursor
            BCS   L01BAEA
            LDA   #$0000
L01BAEA     STAL  L020002
            LDA   #$0003
            STA   $CE
            LDA   #$0000
            SEP   #$20
            STA   $D0
            REP   #$20
            LDA   #$000A
            SEP   #$20
            STA   $D1
            REP   #$20
            PHX
            PHA
            _FMGetSysFID
            BCS   L01BB13
            LDA   #$0000
L01BB13     STAL  L020002
            PLA
            PLX
            STX   $D4
            STA   $D2
            LDX   #$0000
            TDC
            CLC
            ADC   #$00CE
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L016E99
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            _InstallFont
            BCS   L01BB4E
            LDA   #$0000
L01BB4E     STAL  L020002
            LDX   #$0000
            TDC
            CLC
            ADC   #$00CE
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L016E99
            PLY
            PLY
            PLY
            PLY
            PLY
            _FMSetSysFont
            BCS   L01BB80
            LDA   #$0000
L01BB80     STAL  L020002
            _LoadSysFont
            BCS   L01BB90
            LDA   #$0000
L01BB90     STAL  L020002
            LDA   $CE
            STAL  L038F13
            LDA   $D0
            AND   #$00FF
            STAL  L038F16
            LDA   $D1
            SEP   #$20
            STAL  L038F15
            REP   #$20
            LDA   #$0000
            STAL  L038F18
            LDA   $FF
            BEQ   L01BBC1
            LDA   #$D020
            STAL  L038EA8
            BRA   L01BBC8
L01BBC1     LDA   #$1020
            STAL  L038EA8
L01BBC8     LDA   [$F3]
            STAL  L038EB2
            STAL  L038EE4
            LDY   #$0004
            LDA   [$F3],Y
            STAL  L038EB6
            STAL  L038EE8
            LDY   #$0002
            LDA   [$F3],Y
            STAL  L038EB4
            STAL  L038EE6
            LDY   #$0006
            LDA   [$F3],Y
            STAL  L038EB8
            STAL  L038EEA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _GetFontInfo
            BCS   L01BC0E
            LDA   #$0000
L01BC0E     STAL  L020002
            LDA   $D6
            CLC
            ADC   $D8
            CLC
            ADC   $DC
            STA   L020121
            LDA   L020121
            CLC
            ADC   #$0001
            STAL  L038ECA
            LDA   #$0002
            PHA
            LDAL  L038EE8
            SEC
            SBCL  L038EE4
            SEC
            JSL   L012E82
            PLY
            STAL  L038ECE
            STZ   $DE
            LDX   $F9
            LDA   $F7
            STX   $E2
            STA   $E0
L01BC49     LDA   [$E0]
            AND   #$00FF
            BEQ   L01BC6C
            LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L01BC5A
            INC   $E2
L01BC5A     STA   $E8
            STX   $EA
            LDA   [$E8]
            AND   #$00FF
            CMP   #$000A
            BNE   L01BC6A
            INC   $DE
L01BC6A     BRA   L01BC49
L01BC6C     LDA   L020121
            PHA
            LDA   $DE
            CLC
            JSL   L013003
            PLA
            CLC
            ADC   #$0002
            STAL  L038EC2
            LDX   $F9
            LDA   $F7
            STX   L02011B
            STA   L020119
            LDA   #L01CB51
            LDX   #^L01CB51
            PHA
            TXA
            STAL  L038EE2
            PLA
            STAL  L038EE0
            PHX
            PHA
            PEA   ^L038EA6
            PEA   L038EA6
            _NewWindow
            BCS   L01BCAF
            LDA   #$0000
L01BCAF     STAL  L020002
            PLA
            PLX
            STX   $E6
            STA   $E4
            STX   L02011F
            STA   L02011D
            LDA   L020002
            STA   $CC
            TAY
            BEQ   L01BCD6
            PEI   $CC
            PEA   ^L038EF4
            PEA   L038EF4
            JSL   L050256
            PLY
            PLY
            PLY
L01BCD6     PEI   $FD
            _SetBackColor
            BCS   L01BCE4
            LDA   #$0000
L01BCE4     STAL  L020002
            PEI   $FB
            _SetForeColor
            BCS   L01BCF6
            LDA   #$0000
L01BCF6     STAL  L020002
            PEI   $E6
            PEI   $E4
            _SelectWindow
            BCS   L01BD0A
            LDA   #$0000
L01BD0A     STAL  L020002
            PEI   $E6
            PEI   $E4
            _BeginUpdate
            BCS   L01BD1E
            LDA   #$0000
L01BD1E     STAL  L020002
            JSL   L01CB51
            PEI   $E6
            PEI   $E4
            _EndUpdate
            BCS   L01BD36
            LDA   #$0000
L01BD36     STAL  L020002
            _InitCursor
            BCS   L01BD46
            LDA   #$0000
L01BD46     STAL  L020002
            PEI   $D4
            PEI   $D2
            PEA   $0000
            _InstallFont
            BCS   L01BD5D
            LDA   #$0000
L01BD5D     STAL  L020002
            PEI   $D4
            PEI   $D2
            _FMSetSysFont
            BCS   L01BD71
            LDA   #$0000
L01BD71     STAL  L020002
            _LoadSysFont
            BCS   L01BD81
            LDA   #$0000
L01BD81     STAL  L020002
            LDX   $E6
            LDA   $E4
            TAY
            TSC
            CLC
            ADC   #$0022
            TCS
            TYA
            PLD
            RTL

L01BD93     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00DC
            TCS
            LDA   #$0002
            PHA
            LDY   #$0002
            LDA   [$FB],Y
            SEC
            JSL   L012E82
            PLY
            LDX   #$0000
            TAY
            BPL   L01BDB4
            DEX
L01BDB4     PHX
            PHA
            LDA   [$FB]
            PHA
            LDA   #$00A0
            SEC
            JSL   L013003
            PLA
            LDX   #$0000
            TAY
            BPL   L01BDC9
            DEX
L01BDC9     PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L012E77
            PLA
            PLX
            JSL   L012E77
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDA   [$FB]
            PHA
            LDY   #$0004
            LDA   [$FB],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $E6
            LDA   #$0002
            PHA
            LDY   #$0002
            LDA   [$FB],Y
            PHA
            LDY   #$0006
            LDA   [$FB],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            SEC
            JSL   L012E82
            PLY
            STA   $E4
            LDA   #$00A0
            SEC
            SBC   $E4
            STA   $DE
            LDA   $FF
            AND   #$00FF
            ASL
            ASL
            ASL
            ASL
            PHA
            LDA   $FF
            AND   #$00FF
            AND   #$000F
            PLX
            STX   $F0
            ORA   $F0
            SEP   #$20
            STA   $FF
            REP   #$20
            STZ   $E2
            BRA   L01BE6E
L01BE35     STZ   $E0
            BRA   L01BE51
L01BE39     LDX   $EA
            LDA   $E8
            INC   $E8
            BNE   L01BE43
            INC   $EA
L01BE43     STA   $EC
            STX   $EE
            LDA   $FF
            SEP   #$20
            STA   [$EC]
            REP   #$20
            INC   $E0
L01BE51     LDA   $E0
            CMP   $E4
            BCC   L01BE39
            LDA   $DE
            LDX   #$0000
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L012E77
            PLA
            PLX
            STX   $EA
            STA   $E8
            INC   $E2
L01BE6E     LDA   $E2
            CMP   $E6
            BCC   L01BE35
            TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L01BE7C     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            PHX
            PHA
            LDA   [$FD]
            CLC
            ADC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDA   L02004A
            PHA
            PEA   $0008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01BEAD
            LDA   #$0000
L01BEAD     STAL  L020002
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   L020002
            STA   $EC
            TAY
            BEQ   L01BED6
            PEI   $EC
            PEA   ^L038006
            PEA   L038006
            JSL   L050256
            PLY
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRA   L01BF34
L01BED6     PEI   $F0
            PEI   $EE
            _HLock
            BCS   L01BEE6
            LDA   #$0000
L01BEE6     STAL  L020002
            LDA   L020002
            STA   $EC
            TAY
            BEQ   L01BF09
            PEI   $EC
            PEA   ^L038027
            PEA   L038027
            JSL   L050256
            PLY
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRA   L01BF34
L01BF09     LDA   [$FD]
            PHA
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0003
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            JSL   L01C3BA
            PLY
            PLY
            PLY
            PLY
            PLY
            LDX   $F0
            LDA   $EE
L01BF34     TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PLD
            RTL

L01BF3E     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L037DE1
            PEA   L037DE1
            JSL   L050269
            PLY
            PLY
            LDX   L02010B
            LDA   L020109
            PHX
            PHA
            _DisposeHandle
            BCS   L01BF69
            LDA   #$0000
L01BF69     STAL  L020002
            LDX   L02010F
            LDA   L02010D
            PHX
            PHA
            _CloseWindow
            BCS   L01BF81
            LDA   #$0000
L01BF81     STAL  L020002
            JSL   L0502BC
            TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01BF91     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00D6
            TCS
            LDA   L020103
            STA   $E4
L01BFA1     LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L012FF8
            PLA
            PLX
            STA   $D8
            PHA
            LDA   $E4
            PLX
            STX   $EE
            CMP   $EE
            BCC   L01BFC0
            BRL   L01C2DB
L01BFC0     LDA   $E4
            PHA
            LDA   #$0002
            SEC
            JSL   L013003
            LDA   $D8
            CLC
            JSL   L012E82
            PLY
            PHA
            LDA   $E4
            CLC
            JSL   L013003
            PLA
            STA   $D8
            LDA   $D8
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
            STX   $DE
            STA   $DC
            LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C008
            DEX
L01C008     PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L012FF8
            PLA
            PLX
            STX   $E8
            STA   $E6
L01C018     LDA   #$0001
            BNE   L01C020
            BRL   L01C2DB
L01C020     SEC
            LDA   $EA
            SBC   $E0
            BNE   L01C02D
            LDA   $EC
            SBC   $E2
            BRA   L01C033
L01C02D     LDA   $EC
            SBC   $E2
            REP   #$02
L01C033     BVS   L01C038
            EOR   #$8000
L01C038     BPL   L01C03D
            BRL   L01C0B4
L01C03D     PEI   $E2
            PEI   $E0
            PEI   $EC
            PEI   $EA
            LDX   L020107
            LDA   L020105
            STA   $EE
            STX   $F0
            LDA   $EE
            LDX   $F0
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            STA   $DA
            CMP   #$0000
            BNE   L01C08B
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C06B
            DEX
L01C06B     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012FF8
            PLA
            PLX
            STX   $E2
            STA   $E0
            PHX
            PHA
            PEI   $EC
            PEI   $EA
            JSL   L01C693
            PLY
            PLY
            PLY
            PLY
            BRA   L01C018
L01C08B     LDA   $DA
            SEC
            SBC   #$0000
            BVS   L01C096
            EOR   #$8000
L01C096     BMI   L01C0B4
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C0A1
            DEX
L01C0A1     PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L012E77
            PLA
            PLX
            STX   $EC
            STA   $EA
            BRL   L01C018
L01C0B4     SEC
            LDA   $E6
            SBC   $DC
            BNE   L01C0C1
            LDA   $E8
            SBC   $DE
            BRA   L01C0C7
L01C0C1     LDA   $E8
            SBC   $DE
            REP   #$02
L01C0C7     BNE   L01C0CC
            BRL   L01C1F5
L01C0CC     BVS   L01C0D1
            EOR   #$8000
L01C0D1     BMI   L01C0D6
            BRL   L01C1F5
L01C0D6     PEI   $E8
            PEI   $E6
            PEI   $DE
            PEI   $DC
            LDX   L020107
            LDA   L020105
            STA   $EE
            STX   $F0
            LDA   $EE
            LDX   $F0
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            STA   $DA
            CMP   #$0000
            BNE   L01C124
            PEI   $E8
            PEI   $E6
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C108
            DEX
L01C108     PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L012E77
            PLA
            PLX
            STX   $DE
            STA   $DC
            PHX
            PHA
            JSL   L01C693
            PLY
            PLY
            PLY
            PLY
            BRA   L01C0B4
L01C124     LDA   $DA
            SEC
            SBC   #$0000
            BNE   L01C12F
            BRL   L01C1D9
L01C12F     BVS   L01C134
            EOR   #$8000
L01C134     BMI   L01C139
            BRL   L01C1D9
L01C139     LDA   $EA
            CMP   $E0
            BNE   L01C194
            LDA   $EC
            CMP   $E2
            BNE   L01C194
            PEI   $E8
            PEI   $E6
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C152
            DEX
L01C152     PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L012E77
            PLA
            PLX
            STX   $DE
            STA   $DC
            PHX
            PHA
            PEI   $EC
            PEI   $EA
            JSL   L01C9EE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C17D
            DEX
L01C17D     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012E77
            PLA
            PLX
            STX   $E2
            STA   $E0
            STX   $EC
            STA   $EA
            BRL   L01C0B4
L01C194     PEI   $E8
            PEI   $E6
            PEI   $EC
            PEI   $EA
            JSL   L01C693
            PLY
            PLY
            PLY
            PLY
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C1AD
            DEX
L01C1AD     PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L012FF8
            PLA
            PLX
            STX   $E8
            STA   $E6
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C1C6
            DEX
L01C1C6     PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L012E77
            PLA
            PLX
            STX   $EC
            STA   $EA
            BRL   L01C018
L01C1D9     LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C1E2
            DEX
L01C1E2     PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L012FF8
            PLA
            PLX
            STX   $E8
            STA   $E6
            BRL   L01C0B4
L01C1F5     LDA   $EA
            CMP   $E0
            BEQ   L01C1FE
            BRL   L01C28C
L01C1FE     LDA   $EC
            CMP   $E2
            BEQ   L01C207
            BRL   L01C28C
L01C207     LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012FF8
            PLA
            PLX
            PHA
            LDX   $DE
            LDA   $DC
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L012FF8
            PLA
            PLX
            PLX
            STX   $EE
            SEC
            SBC   $EE
            BEQ   L01C237
            BVS   L01C235
            EOR   #$8000
L01C235     BMI   L01C260
L01C237     PEI   $FF
            PEI   $FD
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C244
            DEX
L01C244     PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L012E77
            JSL   L01BF91
            PLY
            PLY
            PLY
            PLY
            LDX   $E2
            LDA   $E0
            STX   $FF
            STA   $FD
            BRA   L01C289
L01C260     PEI   $E2
            PEI   $E0
            PEI   $FB
            PEI   $F9
            JSL   L01BF91
            PLY
            PLY
            PLY
            PLY
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C279
            DEX
L01C279     PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L012E77
            PLA
            PLX
            STX   $FB
            STA   $F9
L01C289     BRL   L01BFA1
L01C28C     PEI   $EC
            PEI   $EA
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C299
            DEX
L01C299     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L012FF8
            PLA
            PLX
            STX   $E2
            STA   $E0
            PHX
            PHA
            PEI   $E8
            PEI   $E6
            JSL   L01C9EE
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L01C2C4
            DEX
L01C2C4     PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L012FF8
            PLA
            PLX
            STX   $DE
            STA   $DC
            STX   $E8
            STA   $E6
            BRL   L01C018
L01C2DB     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L01C2E5     PHD
            TSC
            SEC
            SBC   #$00E5
            TCD
            ADC   #$00DA
            TCS
            LDA   $FF
            STA   $DC
            LDA   $F5
            STA   $DE
            PEA   ^L038F48
            PEA   L038F48
            PEI   $F3
            PEI   $F1
            PEI   $EF
            PEI   $ED
            PEI   $EB
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L01CA73
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            LDAL  L038F4D
            AND   #$00FF
            BRL   L01C368
L01C327     BRL   L01C37F
L01C32A     PEA   $0000
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEA   $0013
            PEI   $F3
            PEI   $F1
            PEI   $EF
            PEI   $ED
            PEI   $EB
            JSL   L01C2E5
            TAY
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            BRL   L01C3B0
L01C351     LDA   #$0000
            STAL  L038F4A
L01C358     LDAL  L038F4C
            AND   #$00FF
            CLC
            ADCL  L038F4A
            STA   [$F7]
            BRA   L01C37F
L01C368     CMP   #$0030
            BEQ   L01C351
            CMP   #$003F
            BEQ   L01C32A
            CMP   #$0049
            BEQ   L01C327
            CMP   #$004E
            BEQ   L01C327
            JMP   L01C358

L01C37F     LDAL  L038F48
            STA   [$FB]
            LDAL  L038F4C
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L038F4D
            LDX   #^L038F4D
            JSL   L012E77
            PLA
            PLX
            STA   $E0
            STX   $E2
            LDA   #$0000
            SEP   #$20
            STA   [$E0]
            REP   #$20
            LDA   #L038F4D
            LDX   #^L038F4D
L01C3B0     TAY
            TDC
            CLC
            ADC   #$00E5
            TCS
            TYA
            PLD
            RTL

L01C3BA     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00DC
            TCS
            STZ   $E8
            LDX   $FD
            LDA   $FB
            STX   $E0
            STA   $DE
            LDX   L0200FC
            LDA   L0200FA
            PHX
            PHA
            _HLock
            BCS   L01C3E3
            LDA   #$0000
L01C3E3     STAL  L020002
            STZ   $EA
            BRL   L01C4BA
L01C3EC     LDX   L0200FC
            LDA   L0200FA
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STX   $E6
            STA   $E4
            LDA   #$0001
            STA   $E2
L01C407     LDA   $E2
            BNE   L01C40E
            BRL   L01C4B8
L01C40E     LDA   $E8
            CMP   #$0008
            BNE   L01C41D
            INC   $F7
            BNE   L01C41B
            INC   $F9
L01C41B     STZ   $E8
L01C41D     LDA   $E8
            PHA
            LDA   [$F7]
            AND   #$00FF
            SEC
            JSL   L013B07
            PLA
            AND   #$0080
            TAY
            BEQ   L01C466
            LDY   #$0003
            LDA   [$E4],Y
            LDX   #$0000
            TAY
            BPL   L01C43D
            DEX
L01C43D     PEA   $0000
            PEA   $0005
            CLC
            JSL   L013048
            LDX   L0200FC
            LDA   L0200FA
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            JSL   L012E77
            PLA
            PLX
            STX   $E6
            STA   $E4
            BRA   L01C499
L01C466     LDY   #$0001
            LDA   [$E4],Y
            LDX   #$0000
            TAY
            BPL   L01C472
            DEX
L01C472     PEA   $0000
            PEA   $0005
            CLC
            JSL   L013048
            LDX   L0200FC
            LDA   L0200FA
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            JSL   L012E77
            PLA
            PLX
            STX   $E6
            STA   $E4
L01C499     INC   $E8
            LDA   [$E4]
            AND   #$00FF
            CMP   #$0080
            BEQ   L01C4B5
            LDA   [$E4]
            SEP   #$20
            STA   [$DE]
            REP   #$20
            INC   $DE
            BNE   L01C4B3
            INC   $E0
L01C4B3     STZ   $E2
L01C4B5     BRL   L01C407
L01C4B8     INC   $EA
L01C4BA     LDA   $EA
            SEC
            SBC   $FF
            BVS   L01C4C4
            EOR   #$8000
L01C4C4     BMI   L01C4C9
            BRL   L01C3EC
L01C4C9     LDA   #$0000
            SEP   #$20
            STA   [$DE]
            REP   #$20
            LDX   L0200FC
            LDA   L0200FA
            PHX
            PHA
            _HUnlock
            BCS   L01C4E6
            LDA   #$0000
L01C4E6     STAL  L020002
            TSC
            CLC
            ADC   #$0014
            TCS
            PLD
            RTL

L01C4F2     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00DE
            TCS
            LDA   $F9
            SEC
            SBC   #$0000
            BVS   L01C508
            EOR   #$8000
L01C508     BMI   L01C51C
            PEA   $0000
            PEA   $0016
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRL   L01C689
L01C51C     PEA   $0000
            TDC
            CLC
            ADC   #$00F9
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $EC
            STA   $EA
            LDA   $EA
            CMP   #$0000
            BNE   L01C543
            LDA   $EC
            CMP   #$0000
            BNE   L01C543
            LDA   #$FFFF
            BRL   L01C689
L01C543     LDA   $FB
            BRL   L01C67E
L01C548     PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $EC
            PEI   $EA
            LDY   #$0006
            LDA   [$EA],Y
            TAX
            LDY   #$0004
            LDA   [$EA],Y
            STA   $EE
            STX   $F0
            LDY   #$0016
            LDA   [$EE],Y
            TAX
            LDY   #$0014
            LDA   [$EE],Y
            STA   $EE
            STX   $F0
            LDA   $EE
            LDX   $F0
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   $E2
            LDA   $E2
            CMP   #$0000
            BNE   L01C58C
            LDA   #$0000
            BRL   L01C689
L01C58C     LDY   #$0002
            LDA   [$EA],Y
            PHA
            PEI   $E2
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRL   L01C689
L01C5A0     LDX   $FF
            LDA   $FD
            SEC
            SBC   #$0000
            BVS   L01C5AD
            EOR   #$8000
L01C5AD     BMI   L01C5C1
            PEA   $0000
            PEA   $0009
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRL   L01C689
L01C5C1     LDX   $FF
            LDA   $FD
            PHA
            LDA   #$FFFF
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $E4
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $E8
            STA   $E6
            LDA   $E6
            CMP   #$0000
            BNE   L01C5F8
            LDA   $E8
            CMP   #$0000
            BNE   L01C5F8
            LDA   #$FFFF
            BRL   L01C689
L01C5F8     PEA   $0000
            TDC
            CLC
            ADC   #$00F9
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $EC
            STA   $EA
            LDA   $EA
            LDX   $EC
            PHX
            PHA
            LDA   $E8
            PHA
            LDA   $E6
            PHA
            PEA   $0012
            JSL   L016E99
            PLA
            PLA
            PLA
            PLA
            PLX
            PEA   $0000
            PEA   $6601
            PEI   $EC
            PEI   $EA
            LDY   #$0006
            LDA   [$EA],Y
            TAX
            LDY   #$0004
            LDA   [$EA],Y
            STA   $EE
            STX   $F0
            LDY   #$0016
            LDA   [$EE],Y
            TAX
            LDY   #$0014
            LDA   [$EE],Y
            STA   $EE
            STX   $F0
            LDA   $EE
            LDX   $F0
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            STA   $E2
            LDA   $E2
            CMP   #$0000
            BEQ   L01C678
            LDA   #$0000
            STA   [$E6]
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            PEI   $E2
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRA   L01C689
L01C678     LDA   $E4
            BRA   L01C689
            BRA   L01C689
L01C67E     CMP   #$6601
            BNE   L01C686
            BRL   L01C5A0
L01C686     JMP   L01C548

L01C689     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L01C693     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E1
            TCS
            LDA   L020103
            STA   $E3
            LDX   $FB
            LDA   $F9
            STX   $EC
            STA   $EA
            LDX   $FF
            LDA   $FD
            STX   $E8
            STA   $E6
L01C6B3     LDA   [$EA]
            SEP   #$20
            STA   $E5
            REP   #$20
            LDA   [$E6]
            PHA
            LDX   $EC
            LDA   $EA
            INC   $EA
            BNE   L01C6C8
            INC   $EC
L01C6C8     STA   $EE
            STX   $F0
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
            LDX   $E8
            LDA   $E6
            INC   $E6
            BNE   L01C6DD
            INC   $E8
L01C6DD     STA   $EE
            STX   $F0
            LDA   $E5
            SEP   #$20
            STA   [$EE]
            REP   #$20
            DEC   $E3
            LDA   $E3
            BNE   L01C6B3
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L01C6F7     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E6
            TCS
            LDA   $F9
            SEC
            SBC   #$0000
            BVS   L01C70D
            EOR   #$8000
L01C70D     BMI   L01C721
            PEA   $0000
            PEA   $0016
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRL   L01C7CF
L01C721     PEA   $0000
            TDC
            CLC
            ADC   #$00F9
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $EC
            STA   $EA
            LDA   $EA
            CMP   #$0000
            BNE   L01C748
            LDA   $EC
            CMP   #$0000
            BNE   L01C748
            LDA   #$FFFF
            BRL   L01C7CF
L01C748     LDA   [$EA]
            AND   #$0002
            TAY
            BNE   L01C761
            PEA   $0000
            PEA   $0009
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRA   L01C7CF
L01C761     LDA   $FF
            LDY   #$000C
            STA   [$EA],Y
            LDX   $FD
            LDA   $FB
            LDY   #$0010
            PHA
            TXA
            STA   [$EA],Y
            PLA
            LDY   #$000E
            STA   [$EA],Y
            PEI   $EC
            PEI   $EA
            LDY   #$0006
            LDA   [$EA],Y
            TAX
            LDY   #$0004
            LDA   [$EA],Y
            STA   $EE
            STX   $F0
            LDY   #$0012
            LDA   [$EE],Y
            TAX
            LDY   #$0010
            LDA   [$EE],Y
            STA   $EE
            STX   $F0
            LDA   $EE
            LDX   $F0
            JSL   L014572
            PLY
            PLY
            STA   $E8
            LDA   $E8
            CMP   #$0000
            BEQ   L01C7C1
            LDY   #$0002
            LDA   [$EA],Y
            PHA
            PEI   $E8
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRA   L01C7CF
L01C7C1     LDY   #$000C
            LDA   [$EA],Y
            PHA
            LDA   $FF
            PLX
            STX   $F2
            SEC
            SBC   $F2
L01C7CF     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L01C7D9     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$FFFF
            STA   $F0
            LDA   $FD
            CMP   #$0000
            BNE   L01C7FD
            LDA   $FF
            CMP   #$0000
            BNE   L01C7FD
            LDA   #$FFFF
            BRL   L01C8B3
L01C7FD     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0083
            TAY
            BEQ   L01C83F
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0004
            TAY
            BEQ   L01C818
            LDA   #$0000
            BRA   L01C822
L01C818     PEI   $FF
            PEI   $FD
            JSL   L01C8BD
            PLY
            PLY
L01C822     STA   $F0
            LDY   #$0012
            LDA   [$FD],Y
            PHA
            JSL   L01E259
            PLY
            SEC
            SBC   #$0000
            BVS   L01C838
            EOR   #$8000
L01C838     BMI   L01C83F
            LDA   #$FFFF
            STA   $F0
L01C83F     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0008
            TAY
            BEQ   L01C88C
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            _FindHandle
            BCS   L01C865
            LDA   #$0000
L01C865     STAL  L020002
            _DisposeHandle
            BCS   L01C875
            LDA   #$0000
L01C875     STAL  L020002
            LDX   #$0000
            LDA   #$0000
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0006
            STA   [$FD],Y
L01C88C     LDA   #$0000
            LDY   #$0010
            STA   [$FD],Y
            LDA   #$0000
            STA   [$FD]
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDA   $F0
L01C8B3     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01C8BD     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0002
            TAY
            BNE   L01C8DD
            LDA   #$0000
            STA   [$FD]
            LDA   #$0000
            BRA   L01C94E
L01C8DD     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0004
            TAY
            BNE   L01C93B
            LDY   #$0010
            LDA   [$FD],Y
            AND   #$0002
            TAY
            BEQ   L01C93B
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L013333
            BEQ   L01C93B
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            JSL   L013333
            BVS   L01C92D
            EOR   #$8000
L01C92D     BMI   L01C93B
            PEI   $FF
            PEI   $FD
            JSL   L01B913
            PLY
            PLY
            BRA   L01C8DD
L01C93B     LDY   #$0010
            LDA   [$FD],Y
            AND   #$0020
            TAY
            BEQ   L01C94B
            LDA   #$FFFF
            BRA   L01C94E
L01C94B     LDA   #$0000
L01C94E     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01C958     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F2
            STX   $F4
            LDX   $F4
            LDA   #$0010
            CLC
            ADC   $F2
            BCC   L01C97B
            INX
L01C97B     STX   $F0
            STA   $EE
            BRA   L01C9B6
L01C981     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            JSL   L013333
            BNE   L01C9AA
            LDX   $FF
            LDA   $FD
            LDY   #$0002
            PHA
            TXA
            STA   [$EE],Y
            PLA
            STA   [$EE]
            LDA   #$0000
            BRA   L01C9E4
L01C9AA     LDA   $EE
            CLC
            ADC   #$0004
            STA   $EE
            BCC   L01C9B6
            INC   $F0
L01C9B6     LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F2
            STX   $F4
            LDX   $F4
            LDA   #$0028
            CLC
            ADC   $F2
            BCC   L01C9CE
            INX
L01C9CE     PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L013333
            BEQ   L01C9E1
            BVS   L01C9DF
            EOR   #$8000
L01C9DF     BMI   L01C981
L01C9E1     LDA   #$0001
L01C9E4     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01C9EE     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00D8
            TCS
            LDA   L020103
            STA   $DA
            LDX   $F7
            LDA   $F5
            STX   $E8
            STA   $E6
            LDX   $FB
            LDA   $F9
            STX   $E4
            STA   $E2
            LDX   $FF
            LDA   $FD
            STX   $E0
            STA   $DE
L01CA16     LDA   [$E6]
            AND   #$00FF
            STA   $DC
            LDA   [$DE]
            PHA
            LDX   $E8
            LDA   $E6
            INC   $E6
            BNE   L01CA2A
            INC   $E8
L01CA2A     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   [$E2]
            PHA
            LDX   $E0
            LDA   $DE
            INC   $DE
            BNE   L01CA42
            INC   $E0
L01CA42     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            LDA   $DC
            PHA
            LDX   $E4
            LDA   $E2
            INC   $E2
            BNE   L01CA5A
            INC   $E4
L01CA5A     STA   $EA
            STX   $EC
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            DEC   $DA
            LDA   $DA
            BNE   L01CA16
            TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L01CA73     PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00E2
            TCS
            PEI   $F1
            PEI   $EF
            PEA   $0000
            TDC
            CLC
            ADC   #$00F3
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $000B
            _SANEFP816
            BCS   L01CA9E
            LDA   #$0000
L01CA9E     STAL  L020002
            TDC
            CLC
            ADC   #$00E9
            TCS
            PLD
            RTL

L01CAAA     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FB
            CMP   $FD
            BEQ   L01CABD
            BCS   L01CACA
L01CABD     LDA   $FD
            CMP   $FF
            BEQ   L01CAC5
            BCS   L01CACA
L01CAC5     LDA   #$0001
            BRA   L01CADE
L01CACA     LDA   $FB
            CMP   $FD
            BCC   L01CADB
            LDA   $FD
            CMP   $FF
            BCC   L01CADB
            LDA   #$0001
            BRA   L01CADE
L01CADB     LDA   #$0000
L01CADE     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01CAE8     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   [$FD]
            STA   $F0
            PEA   $000E
            LDX   $FF
            LDA   $FD
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L013E61
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            LDY   #$000E
            STA   [$FD],Y
            TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L01CB27     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L01CB3D
            LDA   $FD
            BRA   L01CB44
L01CB3D     PEI   $FF
            JSL   L01D80F
            PLY
L01CB44     STA   L020123
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01CB51     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$FF4B
            TCS
            LDX   #$FF6B
            STZ   $00,X
            PHX
            PHA
            LDX   L02011F
            LDA   L02011D
            PHX
            PHA
            _GetContentOrigin
            BCS   L01CB77
            LDA   #$0000
L01CB77     STAL  L020002
            PLA
            PLX
            TXY
            LDX   #$FF67
            STY   $02,X
            STA   $00,X
            TYX
            LDA   L020121
            PHA
            LDX   #$FF69
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF67
            LDA   $00,X
            PLX
            CLC
            JSL   L012E82
            PLY
            LDX   #$FF71
            STA   $00,X
            PHX
            PHA
            LDX   L02011F
            LDA   L02011D
            PHX
            PHA
            _GetZoomRect
            BCS   L01CBB8
            LDA   #$0000
L01CBB8     STAL  L020002
            PLA
            PLX
            TXY
            LDX   #$FF63
            STY   $02,X
            STA   $00,X
            TYX
            LDA   L020121
            PHA
            LDX   #$FF65
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF63
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF65
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF63
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            PLX
            STX   $FA
            SEC
            SBC   $FA
            CLC
            JSL   L012E82
            PLY
            CLC
            ADC   #$0001
            LDX   #$FF6D
            STA   $00,X
            LDX   L02011B
            LDA   L020119
            TXY
            LDX   #$FF78
            STY   $02,X
            STA   $00,X
            TYX
            LDX   #$FF6F
            STZ   $00,X
L01CC1E     LDX   #$FF6F
            LDA   $00,X
            LDX   #$FF71
            CMP   $00,X
            BCS   L01CC66
L01CC2A     LDX   #$FF7A
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF78
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FF78
            STA   $00,X
            LDX   #$FF7A
            LDA   $00,X
            BCC   L01CC48
            INC
L01CC48     LDX   #$FF7A
            STA   $00,X
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            CMP   #$000A
            BEQ   L01CC5F
            BRA   L01CC2A
L01CC5F     LDX   #$FF6F
            INC   $00,X
            BRA   L01CC1E
L01CC66     LDX   #$FF61
            STZ   $00,X
L01CC6B     LDX   #$FF61
            LDA   $00,X
            BEQ   L01CC75
            BRL   L01D78A
L01CC75     LDX   #$FF71
            LDA   $00,X
            CLC
            LDX   #$FF6D
            ADC   $00,X
            LDX   #$FF6F
            CMP   $00,X
            BCS   L01CC91
            LDA   #$0001
            LDX   #$FF61
            STA   $00,X
            BRA   L01CC6B
L01CC91     LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            TXY
            LDX   #$FF7C
            STY   $02,X
            STA   $00,X
            TYX
            LDX   #$FF6B
            STZ   $00,X
            LDX   #$FF53
            STZ   $00,X
L01CCAC     LDX   #$FF7A
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF78
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            BEQ   L01CD23
            LDX   #$FF7A
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF78
            LDA   $00,X
            PHA
            CLC
            ADC   #$0001
            LDX   #$FF78
            STA   $00,X
            LDX   #$FF7A
            LDA   $00,X
            BCC   L01CCE2
            INC
L01CCE2     LDX   #$FF7A
            STA   $00,X
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF7E
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF7C
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            AND   #$00FF
            CMP   #$000A
            BEQ   L01CD23
            LDX   #$FF7C
            INC   $00,X
            BNE   L01CD1C
            LDX   #$FF7E
            INC   $00,X
L01CD1C     LDX   #$FF6B
            INC   $00,X
            BRA   L01CCAC
L01CD23     LDX   #$FF7E
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF7C
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $000A
            LDX   #$FF6F
            LDA   $00,X
            PHA
            INC
            LDX   #$FF6F
            STA   $00,X
            PLA
            CLC
            ADC   #$0001
            PHA
            LDA   L020121
            CLC
            JSL   L013003
            _MoveTo
            BCS   L01CD66
            LDA   #$0000
L01CD66     STAL  L020002
            LDA   #$0000
            LDX   #$FF5F
            STA   $00,X
            LDX   #$FF55
            STA   $00,X
            LDX   #$FF57
            STA   $00,X
L01CD7C     LDX   #$FF5F
            LDA   $00,X
            SEC
            SBC   #$007F
            BEQ   L01CD91
            BVS   L01CD8C
            EOR   #$8000
L01CD8C     BPL   L01CD91
            BRL   L01D764
L01CD91     LDX   #$FF6B
            LDA   $00,X
            CMP   #$0000
            BNE   L01CD9E
            BRL   L01D764
L01CD9E     BCS   L01CDA3
            BRL   L01D764
L01CDA3     LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            BRL   L01D741
L01CDC7     LDX   #$FF57
            LDA   $00,X
            SEC
            SBC   #$0000
            BNE   L01CDD5
            BRL   L01CE7D
L01CDD5     BVS   L01CDDA
            EOR   #$8000
L01CDDA     BMI   L01CDDF
            BRL   L01CE7D
L01CDDF     LDX   #$FF5F
            LDA   $00,X
            SEC
            LDX   #$FF57
            SBC   $00,X
            LDX   #$FF55
            STA   $00,X
            LDX   #$FF5B
            STZ   $00,X
            BRA   L01CE45
L01CDF6     LDX   #$FF55
            LDA   $00,X
            PHA
            INC
            LDX   #$FF55
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5B
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0076
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            LDX   #$FF5B
            INC   $00,X
L01CE45     LDX   #$FF5B
            LDA   $00,X
            SEC
            LDX   #$FF57
            SBC   $00,X
            BEQ   L01CDF6
            BVS   L01CE57
            EOR   #$8000
L01CE57     BPL   L01CDF6
            PEA   $0000
            TDC
            CLC
            ADC   #$0076
            PHA
            LDX   #$FF57
            LDA   $00,X
            PHA
            _DrawText
            BCS   L01CE74
            LDA   #$0000
L01CE74     STAL  L020002
            LDX   #$FF57
            STZ   $00,X
L01CE7D     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEP   #$20
            LDX   #$FF77
            STA   $00,X
            REP   #$20
            LDX   #$FF77
            LDA   $00,X
            AND   #$00FF
            BRL   L01D4BF
L01CEB5     LDAL  L038F16
            CLC
            ADC   #$0001
            SEC
            SBC   #$0008
            BVS   L01CEC6
            EOR   #$8000
L01CEC6     BMI   L01CEE3
            LDAL  L038F16
            CLC
            ADC   #$0001
            STAL  L038F16
            LDA   #$0001
            STAL  L038F18
            PEA   $0001
            JSL   L01DB8F
            PLY
L01CEE3     BRL   L01D4D2
L01CEE6     LDX   #$FF5D
            STZ   $00,X
L01CEEB     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L01CF7F
            LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5D
            LDA   $00,X
            PHA
            INC
            LDX   #$FF5D
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRL   L01CEEB
L01CF7F     LDX   #$FF5D
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            JSL   L01DEEF
            PLY
            PLY
            SEP   #$20
            STAL  L038F15
            REP   #$20
            PEA   ^L038F13
            PEA   L038F13
            JSL   L01D792
            PLY
            PLY
            BRL   L01D4D2
L01CFCA     LDX   #$FF5D
            STZ   $00,X
L01CFCF     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L01D063
            LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5D
            LDA   $00,X
            PHA
            INC
            LDX   #$FF5D
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRL   L01CFCF
L01D063     LDX   #$FF5D
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            JSL   L01DEEF
            PLY
            PLY
            LDX   #$FF5B
            STA   $00,X
            LDX   #$FF5D
            STZ   $00,X
L01D0A1     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L01D135
            LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5D
            LDA   $00,X
            PHA
            INC
            LDX   #$FF5D
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRL   L01D0A1
L01D135     LDX   #$FF5D
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            JSL   L01DEEF
            PLY
            PLY
            LDX   #$FF59
            STA   $00,X
            LDX   #$FF5B
            LDA   $00,X
            PHA
            LDX   #$FF59
            LDA   $00,X
            PHA
            _MoveTo
            BCS   L01D186
            LDA   #$0000
L01D186     STAL  L020002
            BRL   L01D4D2
L01D18D     LDX   #$FF5D
            STZ   $00,X
L01D192     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L01D226
            LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5D
            LDA   $00,X
            PHA
            INC
            LDX   #$FF5D
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRL   L01D192
L01D226     LDX   #$FF5D
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            JSL   L01DEEF
            PLY
            PLY
            STAL  L038F13
            LDA   #$000A
            SEP   #$20
            STAL  L038F15
            REP   #$20
            LDA   #$0000
            STAL  L038F16
            PEA   ^L038F13
            PEA   L038F13
            JSL   L01D792
            PLY
            PLY
            BRL   L01D4D2
L01D27F     LDX   #$FF5D
            STZ   $00,X
L01D284     LDX   #$FF5F
            LDA   $00,X
            INC
            LDX   #$FF5F
            STA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDA   #L037E33
            LDX   #^L037E33
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            AND   #$0004
            TAY
            BEQ   L01D318
            LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5D
            LDA   $00,X
            PHA
            INC
            LDX   #$FF5D
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            BRL   L01D284
L01D318     LDX   #$FF5D
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF73
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$FF73
            PHA
            JSL   L01DEEF
            PLY
            PLY
            LDX   #$FF5D
            STA   $00,X
            LDX   #$FF5D
            LDA   $00,X
            PHA
            _SetForeColor
            BCS   L01D363
            LDA   #$0000
L01D363     STAL  L020002
            BRL   L01D4D2
L01D36A     LDAL  L038F16
            CLC
            ADC   #$0002
            SEC
            SBC   #$0008
            BVS   L01D37B
            EOR   #$8000
L01D37B     BMI   L01D398
            LDAL  L038F16
            CLC
            ADC   #$0002
            STAL  L038F16
            LDA   #$0001
            STAL  L038F18
            PEA   $0002
            JSL   L01DB8F
            PLY
L01D398     BRL   L01D4D2
L01D39B     PEA   $0000
            TDC
            CLC
            ADC   #$FF4D
            PHA
            _GetPen
            BCS   L01D3B0
            LDA   #$0000
L01D3B0     STAL  L020002
            LDX   #$FF4F
            LDA   $00,X
            PHA
            LDX   #$FF4D
            LDA   $00,X
            CLC
            ADC   #$0003
            PHA
            _MoveTo
            BCS   L01D3D0
            LDA   #$0000
L01D3D0     STAL  L020002
            PEA   $0064
            JSL   L01DB8F
            PLY
            LDX   #$FF5F
            INC   $00,X
            BRL   L01D4D2
L01D3E4     PEA   $0000
            TDC
            CLC
            ADC   #$FF4D
            PHA
            _GetPen
            BCS   L01D3F9
            LDA   #$0000
L01D3F9     STAL  L020002
            LDX   #$FF4F
            LDA   $00,X
            PHA
            LDX   #$FF4D
            LDA   $00,X
            SEC
            SBC   #$0004
            PHA
            _MoveTo
            BCS   L01D419
            LDA   #$0000
L01D419     STAL  L020002
            PEA   $0065
            JSL   L01DB8F
            PLY
            LDX   #$FF5F
            INC   $00,X
            BRL   L01D4D2
L01D42D     LDAL  L038F16
            CLC
            ADC   #$0004
            SEC
            SBC   #$0008
            BVS   L01D43E
            EOR   #$8000
L01D43E     BMI   L01D45B
            LDAL  L038F16
            CLC
            ADC   #$0004
            STAL  L038F16
            LDA   #$0001
            STAL  L038F18
            PEA   $0004
            JSL   L01DB8F
            PLY
L01D45B     BRL   L01D4D2
L01D45E     LDX   #$FF57
            INC   $00,X
            BRL   L01D4D2
L01D466     BRL   L01D4D2
L01D469     DA    L01CEB5
            DA    L01CEE6
            DA    L01CFCA
            DA    L01D18D
            DA    L01D27F
            DA    L01D36A
            DA    L01D3E4
            DA    L01D39B
            DA    L01D42D
            DA    L01D45E
            DA    L01CEB5
            DA    L01CEE6
            DA    L01CFCA
            DA    L01D18D
            DA    L01D27F
            DA    L01D36A
            DA    L01D3E4
            DA    L01D39B
            DA    L01D42D
            DA    L01D45E
            DA    L01D45E
            DA    L01D466
L01D495     DW    $0042
            DW    $0043
            DW    $0044
            DW    $0046
            DW    $0048
            DW    $0049
            DW    $0050
            DW    $0053
            DW    $0055
            DW    $0060
            DW    $0062
            DW    $0063
            DW    $0064
            DW    $0066
            DW    $0068
            DW    $0069
            DW    $0070
            DW    $0073
            DW    $0075
            DW    $007B
            DW    $007D
L01D4BF     TAX
            PEA   ^L01D495
            PEA   L01D495
            LDA   #$0028
            JSL   L01ABAC
            PLA
            PLA
            JMP   (L01D469,X)

L01D4D2     BRL   L01D75C
L01D4D5     LDAL  L038F18
            BEQ   L01D4EE
            PEA   ^L038F13
            PEA   L038F13
            JSL   L01D792
            PLY
            PLY
            LDA   #$0000
            STAL  L038F18
L01D4EE     BRL   L01D75C
L01D4F1     LDX   #$FF5F
            LDA   $00,X
            SEC
            LDX   #$FF57
            SBC   $00,X
            LDX   #$FF55
            STA   $00,X
            LDX   #$FF5B
            STZ   $00,X
            BRA   L01D557
L01D508     LDX   #$FF55
            LDA   $00,X
            PHA
            INC
            LDX   #$FF55
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5B
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0076
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            LDX   #$FF5B
            INC   $00,X
L01D557     LDX   #$FF57
            LDA   $00,X
            SEC
            SBC   #$0001
            SEC
            LDX   #$FF5B
            SBC   $00,X
            BVS   L01D56B
            EOR   #$8000
L01D56B     BMI   L01D508
            PEA   $0000
            TDC
            CLC
            ADC   #$0076
            PHA
            LDX   #$FF57
            LDA   $00,X
            PHA
            _DrawText
            BCS   L01D588
            LDA   #$0000
L01D588     STAL  L020002
            LDX   #$FF57
            STZ   $00,X
            JSL   L01DB47
            LDX   #$FF51
            STA   $00,X
            LDX   #$FF51
            LDA   $00,X
            BRL   L01D640
L01D5A2     PEA   $0000
            TDC
            CLC
            ADC   #$FF4D
            PHA
            _GetPen
            BCS   L01D5B7
            LDA   #$0000
L01D5B7     STAL  L020002
            LDX   #$FF4F
            LDA   $00,X
            PHA
            LDX   #$FF4D
            LDA   $00,X
            SEC
            SBC   #$0003
            PHA
            _MoveTo
            BCS   L01D5D7
            LDA   #$0000
L01D5D7     STAL  L020002
            BRL   L01D651
L01D5DE     PEA   $0000
            TDC
            CLC
            ADC   #$FF4D
            PHA
            _GetPen
            BCS   L01D5F3
            LDA   #$0000
L01D5F3     STAL  L020002
            LDX   #$FF4F
            LDA   $00,X
            PHA
            LDX   #$FF4D
            LDA   $00,X
            CLC
            ADC   #$0004
            PHA
            _MoveTo
            BCS   L01D613
            LDA   #$0000
L01D613     STAL  L020002
            BRL   L01D651
L01D61A     LDAL  L038F16
            SEC
            LDX   #$FF51
            SBC   $00,X
            STAL  L038F16
            PEA   ^L038F13
            PEA   L038F13
            JSL   L01D792
            PLY
            PLY
            BRL   L01D651
            BRL   L01D651
L01D63A     DA    L01D5A2
            DA    L01D5DE
            DA    L01D61A
L01D640     SEC
            SBC   #$0064
            CMP   #$0002
            BCC   L01D64C
            LDA   #$0002
L01D64C     ASL
            TAX
            JMP   (L01D63A,X)

L01D651     BRL   L01D75C
L01D654     LDX   #$FF5F
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            CMP   #$0000
            BEQ   L01D67D
            BRL   L01D738
L01D67D     LDX   #$FF57
            LDA   $00,X
            SEC
            SBC   #$0000
            BNE   L01D68B
            BRL   L01D72E
L01D68B     BVS   L01D690
            EOR   #$8000
L01D690     BMI   L01D695
            BRL   L01D72E
L01D695     LDX   #$FF5F
            LDA   $00,X
            SEC
            LDX   #$FF57
            SBC   $00,X
            LDX   #$FF55
            STA   $00,X
            LDX   #$FF5B
            STZ   $00,X
            BRA   L01D6FB
L01D6AC     LDX   #$FF55
            LDA   $00,X
            PHA
            INC
            LDX   #$FF55
            STA   $00,X
            PLA
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$FF80
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   #$FF5B
            LDA   $00,X
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$0076
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            PLA
            SEP   #$20
            STA   [$F6]
            REP   #$20
            LDX   #$FF5B
            INC   $00,X
L01D6FB     LDX   #$FF5B
            LDA   $00,X
            SEC
            LDX   #$FF57
            SBC   $00,X
            BEQ   L01D6AC
            BVS   L01D70D
            EOR   #$8000
L01D70D     BPL   L01D6AC
            PEA   $0000
            TDC
            CLC
            ADC   #$0076
            PHA
            LDX   #$FF57
            LDA   $00,X
            PHA
            _DrawText
            BCS   L01D72A
            LDA   #$0000
L01D72A     STAL  L020002
L01D72E     LDA   #$0080
            LDX   #$FF5F
            STA   $00,X
            BRA   L01D73D
L01D738     LDX   #$FF57
            INC   $00,X
L01D73D     BRA   L01D75C
            BRA   L01D75C
L01D741     CMP   #$0060
            BNE   L01D749
            BRL   L01CDC7
L01D749     CMP   #$007B
            BNE   L01D751
            BRL   L01D4D5
L01D751     CMP   #$007D
            BNE   L01D759
            BRL   L01D4F1
L01D759     JMP   L01D654

L01D75C     LDX   #$FF5F
            INC   $00,X
            BRL   L01CD7C
L01D764     LDX   #$FF7A
            LDA   $00,X
            TAX
            PHX
            LDX   #$FF78
            LDA   $00,X
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            CMP   #$0000
            BNE   L01D787
            LDA   #$0001
            LDX   #$FF61
            STA   $00,X
L01D787     BRL   L01CC6B
L01D78A     TSC
            CLC
            ADC   #$01AF
            TCS
            PLD
            RTL

L01D792     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   [$FD]
            STAL  L038F44
            LDY   #$0003
            LDA   [$FD],Y
            SEP   #$20
            STAL  L038F46
            REP   #$20
            LDY   #$0002
            LDA   [$FD],Y
            SEP   #$20
            STAL  L038F47
            REP   #$20
            LDA   #L038F44
            LDX   #^L038F44
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L016E99
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            _InstallFont
            BCS   L01D7EC
            LDA   #$0000
L01D7EC     STAL  L020002
            LDA   L020002
            STA   $F0
            TAY
            BEQ   L01D807
            PEI   $F0
            PEA   ^L038E82
            PEA   L038E82
            JSL   L050256
            PLY
            PLY
            PLY
L01D807     TSC
            CLC
            ADC   #$0008
            TCS
            PLD
            RTL

L01D80F     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            STZ   $F2
            LDA   $FF
            BRL   L01D905
L01D821     BRL   L01D918
L01D824     LDA   #$0014
            STA   $F2
            BRL   L01D918
L01D82C     LDA   #$000E
            STA   $F2
            BRL   L01D918
L01D834     LDA   #$001C
            STA   $F2
            BRL   L01D918
L01D83C     LDA   #$0011
            STA   $F2
            BRL   L01D918
L01D844     LDA   #$0006
            STA   $F2
            BRL   L01D918
L01D84C     LDA   #$0006
            STA   $F2
            BRL   L01D918
L01D854     LDA   #$0010
            STA   $F2
            BRL   L01D918
L01D85C     LDA   #$0002
            STA   $F2
            BRL   L01D918
L01D864     LDA   #$0009
            STA   $F2
            BRL   L01D918
L01D86C     LDA   #$0005
            STA   $F2
            BRL   L01D918
L01D874     LDA   #$0017
            STA   $F2
            BRL   L01D918
L01D87C     LDA   #$000C
            STA   $F2
            BRL   L01D918
L01D884     LDA   #$001A
            STA   $F2
            BRL   L01D918
L01D88C     LDA   #$0016
            STA   $F2
            BRL   L01D918
L01D894     LDA   #$000D
            STA   $F2
            BRL   L01D918
L01D89C     LDA   #$001E
            STA   $F2
            BRL   L01D918
            BRL   L01D918
L01D8A7     DA    L01D821
            DA    L01D86C
            DA    L01D89C
            DA    L01D82C
            DA    L01D874
            DA    L01D864
            DA    L01D85C
            DA    L01D84C
            DA    L01D85C
            DA    L01D83C
            DA    L01D834
            DA    L01D834
            DA    L01D824
            DA    L01D844
            DA    L01D84C
            DA    L01D894
            DA    L01D884
            DA    L01D824
            DA    L01D88C
            DA    L01D87C
            DA    L01D854
            DA    L01D84C
            DA    L01D84C
            DA    L01D821
L01D8D7     DW    $0000
            DW    $0027
            DW    $002B
            DW    $0040
            DW    $0042
            DW    $0043
            DW    $0044
            DW    $0045
            DW    $0046
            DW    $0047
            DW    $0048
            DW    $0049
            DW    $004B
            DW    $004C
            DW    $004D
            DW    $004E
            DW    $0050
            DW    $0052
            DW    $0053
            DW    $0054
            DW    $0057
            DW    $0058
            DW    $005A
L01D905     TAX
            PEA   ^L01D8D7
            PEA   L01D8D7
            LDA   #$002C
            JSL   L01ABAC
            PLA
            PLA
            JMP   (L01D8A7,X)

L01D918     LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L01D924     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E6
            TCS
            LDAL  L037F49
            CMP   #$0000
            BNE   L01D93C
            JSL   L01DBD5
L01D93C     LDA   #$0012
            PHA
            LDAL  L037F49
            SEC
            JSL   L012E82
            PLY
            SEC
            SBC   #$0001
            STA   $F0
            LDA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01D95B
            EOR   #$8000
L01D95B     BPL   L01D961
            LDA   [$FD]
            BRA   L01D96D
L01D961     LDA   [$FD]
            PHA
            LDA   #$FFFF
            PLX
            STX   $F6
            SEC
            SBC   $F6
L01D96D     SEC
            SBC   $F0
            BEQ   L01D98E
            BVS   L01D977
            EOR   #$8000
L01D977     BPL   L01D98E
            PEA   $0000
            PEA   $0016
            JSL   L01CB27
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L01DB3D
L01D98E     LDA   [$FD]
            SEC
            SBC   #$0000
            BVS   L01D999
            EOR   #$8000
L01D999     BPL   L01D9DC
            LDA   [$FD]
            LDX   #$0000
            TAY
            BPL   L01D9A4
            DEX
L01D9A4     PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            JSL   L012E77
            PLA
            PLX
            STX   $EE
            STA   $EC
            LDA   [$EC]
            CMP   #$0000
            BNE   L01D9D9
            PEA   $0000
            PEA   $0009
            JSL   L01CB27
            PLY
            PLY
            STZ   $EC
            STZ   $EE
L01D9D9     BRL   L01DB39
L01D9DC     LDA   [$FD]
            PHA
            LDA   #$FFFF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            LDX   #$0000
            TAY
            BPL   L01D9EF
            DEX
L01D9EF     PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            JSL   L012E77
            PLA
            PLX
            STX   $EE
            STA   $EC
            BRA   L01DA24
L01DA0F     LDA   [$EC]
            CMP   #$0000
            BNE   L01DA18
            BRA   L01DA54
L01DA18     LDA   $EC
            CLC
            ADC   #$0012
            STA   $EC
            BCC   L01DA24
            INC   $EE
L01DA24     LDA   $F0
            LDX   #$0000
            TAY
            BPL   L01DA2D
            DEX
L01DA2D     PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            JSL   L012E77
            LDX   $EE
            LDA   $EC
            JSL   L013333
            BVS   L01DA52
            EOR   #$8000
L01DA52     BMI   L01DA0F
L01DA54     LDA   $F0
            LDX   #$0000
            TAY
            BPL   L01DA5D
            DEX
L01DA5D     PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            JSL   L012E77
            LDX   $EE
            LDA   $EC
            JSL   L013333
            BVS   L01DA82
            EOR   #$8000
L01DA82     BPL   L01DA87
            BRL   L01DB13
L01DA87     LDAL  L037F49
            CLC
            ADC   #$00B4
            LDX   #$0000
            TAY
            BPL   L01DA96
            DEX
L01DA96     PHX
            PHA
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            PHX
            PHA
            JSL   L01E05C
            PLY
            PLY
            PLY
            PLY
            STX   $EA
            STA   $E8
            LDA   $E8
            CMP   #$0000
            BNE   L01DAD2
            LDA   $EA
            CMP   #$0000
            BNE   L01DAD2
            PEA   $0000
            PEA   $0018
            JSL   L01CB27
            PLY
            PLY
            LDX   #$0000
            LDA   #$0000
            BRL   L01DB3D
L01DAD2     LDA   $F0
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L01DADF
            DEX
L01DADF     PEA   $0000
            PEA   $0012
            CLC
            JSL   L013048
            LDX   $EA
            LDA   $E8
            JSL   L012E77
            PLA
            PLX
            STX   $EE
            STA   $EC
            LDAL  L037F49
            CLC
            ADC   #$00B4
            STAL  L037F49
            LDX   $EA
            LDA   $E8
            PHA
            TXA
            STAL  L037F4D
            PLA
            STAL  L037F4B
L01DB13     LDX   #$0000
            LDA   #$0012
            PHX
            PHA
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L012FF8
            PLA
            PLX
            SEC
            JSL   L012F07
            PLY
            PLY
            STA   [$FD]
L01DB39     LDX   $EE
            LDA   $EC
L01DB3D     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01DB47     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            DEC   L020117
            LDA   L020117
            SEC
            SBC   #$0000
            BVS   L01DB61
            EOR   #$8000
L01DB61     BPL   L01DB82
            LDA   L020117
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L038F1A
            LDX   #^L038F1A
            JSL   L012E77
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            BRA   L01DB85
            BRA   L01DB85
L01DB82     LDA   #$0000
L01DB85     TAY
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            PLD
            RTL

L01DB8F     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   L020117
            SEC
            SBC   #$0014
            BEQ   L01DBAA
            BVS   L01DBA8
            EOR   #$8000
L01DBA8     BMI   L01DBCD
L01DBAA     LDA   L020117
            PHA
            INC
            STA   L020117
            PLA
            ASL
            LDX   #$0000
            PHX
            PHA
            LDA   #L038F1A
            LDX   #^L038F1A
            JSL   L012E77
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   $FF
            STA   [$F4]
L01DBCD     TSC
            CLC
            ADC   #$0006
            TCS
            PLD
            RTL

L01DBD5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDA   #$00B4
            STAL  L037F49
            PEA   $0000
            PEA   $00B4
            PEA   $0000
            PEA   $0000
            JSL   L01E05C
            PLY
            PLY
            PLY
            PLY
            PHA
            TXA
            STAL  L037F4D
            PLA
            STAL  L037F4B
            SEC
            LDAL  L037F53
            SBC   #$0000
            BNE   L01DC19
            LDAL  L037F55
            SBC   #$0000
            BRA   L01DC22
L01DC19     LDAL  L037F55
            SBC   #$0000
            REP   #$02
L01DC22     BNE   L01DC27
            BRL   L01DCE4
L01DC27     LDAL  L037F55
            TAX
            LDAL  L037F53
            STA   $F6
            STX   $F8
            LDY   #$001A
            LDA   [$F6],Y
            TAX
            LDY   #$0018
            LDA   [$F6],Y
            PHX
            PHA
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            PHX
            PHA
            PEA   $0000
            PEA   $0036
            _BlockMove
            BCS   L01DC5E
            LDA   #$0000
L01DC5E     STAL  L020002
            LDAL  L037F4D
            TAX
            LDAL  L037F4B
            STX   $F4
            STA   $F2
            BRA   L01DCB8
L01DC71     LDA   [$F2]
            CMP   #$0000
            BEQ   L01DCAC
            PEA   $0000
            PEA   $6601
            PEI   $F4
            PEI   $F2
            LDY   #$0006
            LDA   [$F2],Y
            TAX
            LDY   #$0004
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0016
            LDA   [$F6],Y
            TAX
            LDY   #$0014
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
L01DCAC     LDA   $F2
            CLC
            ADC   #$0012
            STA   $F2
            BCC   L01DCB8
            INC   $F4
L01DCB8     LDAL  L037F4D
            TAX
            LDAL  L037F4B
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$0024
            CLC
            ADC   $F6
            BCC   L01DCD0
            INX
L01DCD0     PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L013333
            BVS   L01DCDF
            EOR   #$8000
L01DCDF     BMI   L01DC71
            BRL   L01DEC1
L01DCE4     PEA   $0000
            PEA   ^L038F6A
            PEA   L038F6A
            JSL   L01DF99
            PLY
            PLY
            PLY
            STA   $F0
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $F4
            STA   $F2
            PHX
            PHA
            PEA   $0000
            PEA   $0004
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01DD2D
            LDA   #$0000
L01DD2D     STAL  L020002
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0008
            STA   [$F2],Y
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0000
            STA   [$F6]
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0002
            STA   [$F6],Y
            PEA   $0001
            PEA   ^L038F73
            PEA   L038F73
            JSL   L01DF99
            PLY
            PLY
            PLY
            STA   $F0
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $F4
            STA   $F2
            PHX
            PHA
            PEA   $0000
            PEA   $0004
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01DDCC
            LDA   #$0000
L01DDCC     STAL  L020002
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0008
            STA   [$F2],Y
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0000
            STA   [$F6]
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0002
            STA   [$F6],Y
            PEA   $0001
            PEA   ^L038F7C
            PEA   L038F7C
            JSL   L01DF99
            PLY
            PLY
            PLY
            STA   $F0
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $F4
            STA   $F2
            PHX
            PHA
            PEA   $0000
            PEA   $0004
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01DE6B
            LDA   #$0000
L01DE6B     STAL  L020002
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F2],Y
            PLA
            LDY   #$0008
            STA   [$F2],Y
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0000
            STA   [$F6]
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STA   $F6
            STX   $F8
            LDA   #$0002
            LDY   #$0002
            STA   [$F6],Y
L01DEC1     LDA   #L01E4D4
            LDX   #^L01E4D4
            PHX
            PHA
            LDAL  L037F47
            TAX
            LDAL  L037F45
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0008
            STA   [$F6],Y
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L01DEEF     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            STZ   $F0
            STZ   $EE
L01DEFE     LDA   [$FD]
            AND   #$00FF
            BRL   L01DF13
L01DF06     BRL   L01DF29
L01DF09     INC   $EE
L01DF0B     INC   $FD
            BNE   L01DF11
            INC   $FF
L01DF11     BRA   L01DF27
L01DF13     CMP   #$0009
            BEQ   L01DF06
            CMP   #$0020
            BEQ   L01DF06
            CMP   #$002B
            BEQ   L01DF0B
            CMP   #$002D
            BEQ   L01DF09
L01DF27     BRA   L01DF31
L01DF29     INC   $FD
            BNE   L01DF2F
            INC   $FF
L01DF2F     BRA   L01DEFE
L01DF31     LDA   [$FD]
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L01DF3F
            EOR   #$8000
L01DF3F     BPL   L01DF81
            LDA   [$FD]
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L01DF53
            BVS   L01DF51
            EOR   #$8000
L01DF51     BMI   L01DF81
L01DF53     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L01DF5D
            INC   $FF
L01DF5D     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDA   $F0
            PHA
            LDA   #$000A
            SEC
            JSL   L013003
            PLA
            PLX
            STX   $F6
            CLC
            ADC   $F6
            SEC
            SBC   #$0030
            STA   $F0
            BRA   L01DF31
L01DF81     LDA   $EE
            BEQ   L01DF8D
            LDA   $F0
            EOR   #$FFFF
            INC
            BRA   L01DF8F
L01DF8D     LDA   $F0
L01DF8F     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01DF99     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            LDA   #$FFFF
            STA   $E6
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $EA
            STA   $E8
            LDA   $E8
            CMP   #$0000
            BNE   L01DFD0
            LDA   $EA
            CMP   #$0000
            BNE   L01DFD0
            LDA   #$FFFF
            BRL   L01E052
L01DFD0     LDA   $FF
            CLC
            ADC   #$0001
            STA   [$E8]
            LDA   #$0000
            LDY   #$0002
            STA   [$E8],Y
            LDX   #$0000
            LDA   #$0000
            LDY   #$0006
            PHA
            TXA
            STA   [$E8],Y
            PLA
            LDY   #$0004
            STA   [$E8],Y
            PEI   $EA
            PEI   $E8
            PEA   $6400
            PEI   $FD
            PEI   $FB
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L01E302
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STA   $E4
            LDA   $E4
            CMP   #$0000
            BEQ   L01E026
            LDA   #$0000
            STA   [$E8]
            LDA   #$FFFF
            BRA   L01E052
L01E026     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0006
            LDA   [$E8],Y
            TAX
            LDY   #$0004
            LDA   [$E8],Y
            JSL   L013333
            BNE   L01E050
            LDX   $EE
            LDA   $EC
            LDY   #$0006
            PHA
            TXA
            STA   [$E8],Y
            PLA
            LDY   #$0004
            STA   [$E8],Y
L01E050     LDA   $E6
L01E052     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L01E05C     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00DC
            TCS
            STZ   $EA
            STZ   $EC
            STZ   $E6
            STZ   $E8
            SEC
            LDA   $F9
            SBC   #$0000
            BNE   L01E07E
            LDA   $FB
            SBC   #$0000
            BRA   L01E085
L01E07E     LDA   $FB
            SBC   #$0000
            REP   #$02
L01E085     BNE   L01E08A
            BRL   L01E11D
L01E08A     PHX
            PHA
            PEI   $FB
            PEI   $F9
            _FindHandle
            BCS   L01E09C
            LDA   #$0000
L01E09C     STAL  L020002
            PLA
            PLX
            STX   $EC
            STA   $EA
            PHX
            PHA
            PEI   $EC
            PEI   $EA
            _GetHandleSize
            BCS   L01E0B8
            LDA   #$0000
L01E0B8     STAL  L020002
            PLA
            PLX
            STX   $E8
            STA   $E6
            SEC
            LDA   $FD
            SBC   $E6
            BNE   L01E0CF
            LDA   $FF
            SBC   $E8
            BRA   L01E0D5
L01E0CF     LDA   $FF
            SBC   $E8
            REP   #$02
L01E0D5     BVS   L01E0DA
            EOR   #$8000
L01E0DA     BMI   L01E109
            PEI   $EC
            PEI   $EA
            PEI   $FF
            PEI   $FD
            _SetHandleSize
            BCS   L01E0F0
            LDA   #$0000
L01E0F0     STAL  L020002
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            AND   #$FFFF
            PHA
            TXA
            AND   #$00FF
            TAX
            PLA
            BRL   L01E24F
L01E109     PEI   $EC
            PEI   $EA
            _HUnlock
            BCS   L01E119
            LDA   #$0000
L01E119     STAL  L020002
L01E11D     PHX
            PHA
            PEI   $FF
            PEI   $FD
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01E13F
            LDA   #$0000
L01E13F     STAL  L020002
            PLA
            PLX
            STX   $E4
            STA   $E2
            LDA   L020002
            BEQ   L01E183
            SEC
            LDA   $EA
            SBC   #$0000
            BNE   L01E15D
            LDA   $EC
            SBC   #$0000
            BRA   L01E164
L01E15D     LDA   $EC
            SBC   #$0000
            REP   #$02
L01E164     BEQ   L01E17A
            PEI   $EC
            PEI   $EA
            _HLock
            BCS   L01E176
            LDA   #$0000
L01E176     STAL  L020002
L01E17A     LDX   #$0000
            LDA   #$0000
            BRL   L01E24F
L01E183     PEI   $E4
            PEI   $E2
            _HLock
            BCS   L01E193
            LDA   #$0000
L01E193     STAL  L020002
            SEC
            LDA   $F9
            SBC   #$0000
            BNE   L01E1A6
            LDA   $FB
            SBC   #$0000
            BRA   L01E1AD
L01E1A6     LDA   $FB
            SBC   #$0000
            REP   #$02
L01E1AD     BEQ   L01E1EB
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            PHX
            PHA
            LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            PHX
            PHA
            PEI   $E8
            PEI   $E6
            _BlockMove
            BCS   L01E1D3
            LDA   #$0000
L01E1D3     STAL  L020002
            PEI   $EC
            PEI   $EA
            _DisposeHandle
            BCS   L01E1E7
            LDA   #$0000
L01E1E7     STAL  L020002
L01E1EB     LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            CLC
            ADC   $E6
            PHA
            TXA
            ADC   $E8
            TAX
            PLA
            STX   $E0
            STA   $DE
L01E200     LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            CLC
            ADC   $FD
            PHA
            TXA
            ADC   $FF
            TAX
            PLA
            PHX
            PHA
            LDX   $E0
            LDA   $DE
            JSL   L013333
            BEQ   L01E23D
            BVS   L01E222
            EOR   #$8000
L01E222     BPL   L01E23D
            LDX   $E0
            LDA   $DE
            INC   $DE
            BNE   L01E22E
            INC   $E0
L01E22E     STA   $EE
            STX   $F0
            LDA   #$0000
            SEP   #$20
            STA   [$EE]
            REP   #$20
            BRA   L01E200
L01E23D     LDY   #$0002
            LDA   [$E2],Y
            TAX
            LDA   [$E2]
            AND   #$FFFF
            PHA
            TXA
            AND   #$00FF
            TAX
            PLA
L01E24F     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L01E259     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L01E26F
            EOR   #$8000
L01E26F     BMI   L01E282
            PEA   $0000
            PEA   $0016
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRA   L01E2F8
L01E282     PEA   $0000
            TDC
            CLC
            ADC   #$00FF
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $F2
            STA   $F0
            LDA   $F0
            CMP   #$0000
            BNE   L01E2A8
            LDA   $F2
            CMP   #$0000
            BNE   L01E2A8
            LDA   #$FFFF
            BRA   L01E2F8
L01E2A8     PEI   $F2
            PEI   $F0
            LDY   #$0006
            LDA   [$F0],Y
            TAX
            LDY   #$0004
            LDA   [$F0],Y
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            JSL   L014572
            PLY
            PLY
            STA   $EE
            LDA   #$0000
            STA   [$F0]
            LDA   $EE
            CMP   #$0000
            BEQ   L01E2F5
            LDY   #$0002
            LDA   [$F0],Y
            PHA
            PEI   $EE
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRA   L01E2F8
L01E2F5     LDA   #$0000
L01E2F8     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L01E302     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00DE
            TCS
            LDA   [$F7]
            AND   #$00FF
            CMP   #$0000
            BEQ   L01E31C
            LDA   #$0000
            BRA   L01E31F
L01E31C     LDA   #$0001
L01E31F     PHA
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F9
            LDA   $F7
            JSL   L013333
            BEQ   L01E337
            LDA   #$0000
            BRA   L01E33A
L01E337     LDA   #$0001
L01E33A     PLX
            STX   $EC
            ORA   $EC
            TAY
            BEQ   L01E354
            PEA   $0000
            PEA   $0016
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
            BRL   L01E4CA
L01E354     LDAL  L037F4F
            CMP   #$0000
            BNE   L01E377
            LDAL  L037F51
            CMP   #$0000
            BNE   L01E377
            LDA   #L038F85
            LDX   #^L038F85
            PHA
            TXA
            STAL  L037F51
            PLA
            STAL  L037F4F
L01E377     LDAL  L037F51
            TAX
            LDAL  L037F4F
            STX   $E2
            STA   $E0
            BRA   L01E3AD
L01E386     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0006
            LDA   [$E0],Y
            TAX
            LDY   #$0004
            LDA   [$E0],Y
            JSL   L013333
            BNE   L01E3A1
            BRA   L01E3D8
L01E3A1     LDA   $E0
            CLC
            ADC   #$0018
            STA   $E0
            BCC   L01E3AD
            INC   $E2
L01E3AD     LDAL  L037F51
            TAX
            LDAL  L037F4F
            STA   $E8
            STX   $EA
            LDX   $EA
            LDA   #$0078
            CLC
            ADC   $E8
            BCC   L01E3C5
            INX
L01E3C5     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L013333
            BEQ   L01E3D8
            BVS   L01E3D6
            EOR   #$8000
L01E3D6     BMI   L01E386
L01E3D8     LDA   #$4006
            STA   $E6
L01E3DD     LDAL  L037F51
            TAX
            LDAL  L037F4F
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            SEC
            SBC   #$0018
            STA   $E0
            PHA
            LDA   $E2
            SBC   #$0000
            TAX
            STA   $E2
            PLA
            JSL   L013333
            BEQ   L01E409
            BVS   L01E407
            EOR   #$8000
L01E407     BMI   L01E442
L01E409     PEI   $FF
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            LDY   #$0006
            LDA   [$E0],Y
            TAX
            LDY   #$0004
            LDA   [$E0],Y
            STA   $E8
            STX   $EA
            LDA   $E8
            LDX   $EA
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   $E6
            LDA   $E6
            SEC
            SBC   #$0000
            BVS   L01E43C
            EOR   #$8000
L01E43C     BPL   L01E440
            BRA   L01E442
L01E440     BRA   L01E3DD
L01E442     SEC
            LDA   $F3
            SBC   #$0000
            BNE   L01E451
            LDA   $F5
            SBC   #$0000
            BRA   L01E458
L01E451     LDA   $F5
            SBC   #$0000
            REP   #$02
L01E458     BEQ   L01E488
            SEC
            LDA   $E0
            SBCL  L037F4F
            BNE   L01E46B
            LDA   $E2
            SBCL  L037F51
            BRA   L01E473
L01E46B     LDA   $E2
            SBCL  L037F51
            REP   #$02
L01E473     BVS   L01E478
            EOR   #$8000
L01E478     BPL   L01E488
            LDX   $E2
            LDA   $E0
            LDY   #$0002
            PHA
            TXA
            STA   [$F3],Y
            PLA
            STA   [$F3]
L01E488     LDA   $E6
            AND   #$4000
            CMP   #$0000
            BNE   L01E496
            LDA   $E6
            BRA   L01E4CA
L01E496     LDA   $E6
            STA   $E4
            LDA   $E4
            AND   #$8000
            TAY
            BEQ   L01E4B4
            LDA   $E4
            AND   #$BFFF
            STA   $E4
            LDA   $E4
            AND   #$7FFF
            STA   $E4
            STZ   $E6
            BRA   L01E4BD
L01E4B4     LDA   $E6
            AND   #$BFFF
            STA   $E6
            STZ   $E4
L01E4BD     PEI   $E4
            PEI   $E6
            JSL   L01CB27
            PLY
            PLY
            LDA   #$FFFF
L01E4CA     TAY
            TDC
            CLC
            ADC   #$00ED
            TCS
            TYA
            PLD
            RTL

L01E4D4     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0012
            PHA
            LDAL  L037F49
            SEC
            JSL   L012E82
            PLY
            SEC
            SBC   #$0001
            STA   $F0
            STZ   $F2
            BRA   L01E500
L01E4F7     PEI   $F2
            JSL   L01E259
            PLY
            INC   $F2
L01E500     LDA   $F2
            SEC
            SBC   $F0
            BEQ   L01E4F7
            BVS   L01E50C
            EOR   #$8000
L01E50C     BPL   L01E4F7
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L01E518     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L01E530     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01E548     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDA   [$F2]
            DEC
            STA   [$F2]
            SEC
            SBC   #$0000
            BEQ   L01E583
            BVS   L01E57E
            EOR   #$8000
L01E57E     BPL   L01E583
            BRL   L01E5EB
L01E583     LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STAL  L038329
            PEA   $0014
            PEA   ^L038329
            PEA   L038329
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01E5C4
            LDA   L020002
            LDY   #$0002
            STA   [$FD],Y
L01E5C4     LDA   L020002
            STA   $F0
            LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            PHX
            PHA
            _DisposeHandle
            BCS   L01E5E2
            LDA   #$0000
L01E5E2     STAL  L020002
            LDA   $F0
            STA   L020002
L01E5EB     LDA   L020002
            CMP   #$0000
            BNE   L01E5F8
            LDA   #$0000
            BRA   L01E5FB
L01E5F8     LDA   #$0009
L01E5FB     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01E605     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E6
            TCS
            LDA   $FB
            BRL   L01E972
L01E615     LDA   #$0000
            LDY   #$0002
            STA   [$F7],Y
            LDA   #$0016
            BRL   L01E9A3
L01E623     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STA   $EA
            LDA   $EA
            STAL  L03833D
            PEA   $0019
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01E666
            LDA   #$001D
            BRL   L01E9A3
L01E666     LDA   $EA
            STAL  L038337
            LDA   [$FD]
            BRL   L01E70F
L01E671     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            TXA
            STAL  L03833B
            PLA
            STAL  L038339
            BRL   L01E71C
L01E68A     PEA   $0017
            PEA   ^L038337
            PEA   L038337
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01E6A2
            BRL   L01E71C
L01E6A2     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDAL  L03833B
            TAX
            LDAL  L038339
            JSL   L012E77
            PLA
            PLX
            PHA
            TXA
            STAL  L03833B
            PLA
            STAL  L038339
            BRL   L01E71C
L01E6CC     LDY   #$0004
            LDA   [$FD],Y
            TAX
            LDY   #$0002
            LDA   [$FD],Y
            PHX
            PHA
            LDAL  L038341
            TAX
            LDAL  L03833F
            JSL   L012E77
            PLA
            PLX
            PHA
            TXA
            STAL  L03833B
            PLA
            STAL  L038339
            BRL   L01E71C
L01E6F6     LDA   #$0000
            LDY   #$0002
            STA   [$F7],Y
            LDA   #$0016
            BRL   L01E9A3
            BRL   L01E71C
L01E707     DA    L01E671
            DA    L01E68A
            DA    L01E6CC
            DA    L01E6F6
L01E70F     CMP   #$0003
            BCC   L01E717
            LDA   #$0003
L01E717     ASL
            TAX
            JMP   (L01E707,X)

L01E71C     LDA   L020002
            CMP   #$0000
            BEQ   L01E72E
            LDA   [$FD]
            CMP   #$0000
            BEQ   L01E72E
            BRL   L01E7C0
L01E72E     SEC
            LDAL  L038339
            SBCL  L03833F
            BNE   L01E743
            LDAL  L03833B
            SBCL  L038341
            BRA   L01E74D
L01E743     LDAL  L03833B
            SBCL  L038341
            REP   #$02
L01E74D     BNE   L01E752
            BRL   L01E7B3
L01E752     BVS   L01E757
            EOR   #$8000
L01E757     BMI   L01E75C
            BRL   L01E7B3
L01E75C     LDA   [$FD]
            CMP   #$0002
            BEQ   L01E784
            LDA   $EA
            STAL  L03833D
            PEA   $0019
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01E784
            LDA   #$001D
            BRL   L01E9A3
L01E784     LDAL  L03833B
            TAX
            LDAL  L038339
            PHA
            TXA
            STAL  L038341
            PLA
            STAL  L03833F
            PEA   $0018
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01E7B3
            LDA   #$001D
            BRL   L01E9A3
L01E7B3     PEA   $0016
            PEA   ^L038337
            PEA   L038337
            JSL   L014421
L01E7C0     LDA   L020002
            CMP   #$0000
            BEQ   L01E7D6
            LDA   L020002
            LDY   #$0002
            STA   [$F7],Y
            LDA   #$001D
            BRL   L01E9A3
L01E7D6     LDAL  L03833B
            TAX
            LDAL  L038339
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            BRL   L01E983
L01E7EF     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDA   [$EC]
            INC
            STA   [$EC]
            BRL   L01E983
L01E812     LDA   #$0000
            LDY   #$0002
            STA   [$F7],Y
            LDA   #$0016
            BRL   L01E9A3
L01E820     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STA   [$FD]
            BRL   L01E983
L01E845     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STAL  L03833D
            PEA   $0019
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDAL  L038341
            TAX
            LDAL  L03833F
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            STA   [$FD]
            BRL   L01E983
L01E88C     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STAL  L03833D
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L038341
            PLA
            STAL  L03833F
            PEA   $0018
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            BRL   L01E983
L01E8CF     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STAL  L038337
            PEA   $0017
            PEA   ^L038337
            PEA   L038337
            JSL   L014421
            LDAL  L03833B
            TAX
            LDAL  L038339
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            STA   [$FD]
            BRL   L01E983
L01E916     LDY   #$000A
            LDA   [$F7],Y
            TAX
            LDY   #$0008
            LDA   [$F7],Y
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            TAX
            LDA   [$EC]
            STA   $EC
            STX   $EE
            LDY   #$0002
            LDA   [$EC],Y
            STAL  L038337
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L03833B
            PLA
            STAL  L038339
            PEA   $0016
            PEA   ^L038337
            PEA   L038337
            JSL   L014421
            BRL   L01E983
            BRL   L01E983
L01E95C     DA    L01E623
            DA    L01E7EF
            DA    L01E615
            DA    L01E812
            DA    L01E615
            DA    L01E820
            DA    L01E88C
            DA    L01E845
            DA    L01E916
            DA    L01E8CF
            DA    L01E615
L01E972     SEC
            SBC   #$6600
            CMP   #$000A
            BCC   L01E97E
            LDA   #$000A
L01E97E     ASL
            TAX
            JMP   (L01E95C,X)

L01E983     LDA   L020002
            CMP   #$0000
            BEQ   L01E993
            LDA   L020002
            LDY   #$0002
            STA   [$F7],Y
L01E993     LDA   L020002
            CMP   #$0000
            BNE   L01E9A0
            LDA   #$0000
            BRA   L01E9A3
L01E9A0     LDA   #$0016
L01E9A3     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01E9AD     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            CMP   #$0002
            BNE   L01EA4E
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            PHX
            PHA
            PEA   $0000
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            _ErrWriteBlock
            BCS   L01E9FF
            LDA   #$0000
L01E9FF     STAL  L020002
            LDY   #$000C
            LDA   [$FD],Y
            SEC
            SBC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$000A
            BNE   L01EA4C
            PEA   ^L039006
            PEA   L039006
            PEA   $0000
            PEA   $0001
            _ErrWriteBlock
            BCS   L01EA48
            LDA   #$0000
L01EA48     STAL  L020002
L01EA4C     BRA   L01EABD
L01EA4E     LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            PHX
            PHA
            PEA   $0000
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            _TextWriteBlock
            BCS   L01EA70
            LDA   #$0000
L01EA70     STAL  L020002
            LDY   #$000C
            LDA   [$FD],Y
            SEC
            SBC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$000A
            BNE   L01EABD
            PEA   ^L039008
            PEA   L039008
            PEA   $0000
            PEA   $0001
            _TextWriteBlock
            BCS   L01EAB9
            LDA   #$0000
L01EAB9     STAL  L020002
L01EABD     LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000E
            STA   [$FD],Y
            LDA   #$0000
            LDY   #$000C
            STA   [$FD],Y
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01EAFA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01EB12     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDA   [$FD]
            AND   #$0008
            TAY
            BNE   L01EB28
            BRL   L01EBBF
L01EB28     LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STAL  L03833D
            PEA   $0019
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01EB64
            BRL   L01EBBF
L01EB64     LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STAL  L038337
            LDAL  L038341
            TAX
            LDAL  L03833F
            PHA
            TXA
            STAL  L03833B
            PLA
            STAL  L038339
            PEA   $0016
            PEA   ^L038337
            PEA   L038337
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01EBBF
            LDA   L020002
            LDY   #$0002
            STA   [$FD],Y
            LDA   #$001D
            BRL   L01ECCA
L01EBBF     LDA   [$FD]
            AND   #$0020
            TAY
            BNE   L01EC0F
            LDY   #$000C
            LDA   [$FD],Y
            STA   $F0
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            STX   $EE
            STA   $EC
            BRA   L01EC00
L01EBDF     LDA   [$EC]
            AND   #$00FF
            CMP   #$000A
            BNE   L01EBF2
            LDA   #$000D
            SEP   #$20
            STA   [$EC]
            REP   #$20
L01EBF2     LDA   $F0
            DEC   $F0
            LDX   $EE
            LDA   $EC
            INC   $EC
            BNE   L01EC00
            INC   $EE
L01EC00     LDA   $F0
            SEC
            SBC   #$0000
            BEQ   L01EC0F
            BVS   L01EC0D
            EOR   #$8000
L01EC0D     BMI   L01EBDF
L01EC0F     LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STAL  L038329
            LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            PHA
            TXA
            STAL  L038331
            PLA
            STAL  L03832F
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            PHA
            TXA
            STAL  L03832D
            PLA
            STAL  L03832B
            PEA   $0013
            PEA   ^L038329
            PEA   L038329
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BNE   L01ECB2
            LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            SEC
            SBCL  L038333
            PHA
            TXA
            SBCL  L038335
            TAX
            PLA
            LDY   #$000C
            STA   [$FD],Y
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            CLC
            ADCL  L038333
            PHA
            TXA
            ADCL  L038335
            TAX
            PLA
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000E
            STA   [$FD],Y
            BRA   L01ECBA
L01ECB2     LDA   L020002
            LDY   #$0002
            STA   [$FD],Y
L01ECBA     LDA   L020002
            CMP   #$0000
            BNE   L01ECC7
            LDA   #$0000
            BRA   L01ECCA
L01ECC7     LDA   #$0005
L01ECCA     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01ECD4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            LDA   $FB
            BRL   L01ED17
L01ECE4     LDA   #$0000
            STA   [$FD]
            LDX   #$0000
            LDA   #$0000
            LDY   #$0004
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDA   #$0000
            BRL   L01ED28
L01ED02     LDA   #$0000
            BRL   L01ED28
L01ED08     LDA   #$0016
            BRL   L01ED28
            BRL   L01ED28
L01ED11     DA    L01ECE4
            DA    L01ED02
            DA    L01ED08
L01ED17     SEC
            SBC   #$6600
            CMP   #$0002
            BCC   L01ED23
            LDA   #$0002
L01ED23     ASL
            TAX
            JMP   (L01ED11,X)

L01ED28     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01ED32     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            JSL   L012E77
            PLA
            PLX
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000E
            STA   [$FD],Y
            LDA   #$0000
            LDY   #$000C
            STA   [$FD],Y
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01ED7A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            PEA   $0001
            PEA   $0000
            PEA   ^L038FFD
            PEA   L038FFD
            PEI   $F9
            PEI   $F7
            JSL   L012B09
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BNE   L01EDAA
            LDA   #$FFFF
            BRL   L01EDC4
L01EDAA     LDA   $FB
            BRL   L01EDBC
L01EDAF     LDA   #$4016
            BRL   L01EDC4
L01EDB5     LDA   #$0000
            BRA   L01EDC4
            BRA   L01EDC4
L01EDBC     CMP   #$6400
            BEQ   L01EDB5
            JMP   L01EDAF

L01EDC4     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01EDCE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EA
            TCS
            SEC
            LDA   $F7
            SBC   #$0000
            BNE   L01EDE8
            LDA   $F9
            SBC   #$0000
            BRA   L01EDEF
L01EDE8     LDA   $F9
            SBC   #$0000
            REP   #$02
L01EDEF     BEQ   L01EDFB
            LDA   [$F7]
            AND   #$00FF
            CMP   #$0000
            BNE   L01EE01
L01EDFB     LDA   #$4016
            BRL   L01EF4A
L01EE01     LDA   $FB
            BRL   L01EF17
L01EE06     LDA   #$4016
            BRL   L01EF4A
L01EE0C     PEI   $F9
            PEI   $F7
            PEI   $FF
            PEI   $FD
            JSL   L01F304
            PLY
            PLY
            PLY
            PLY
            BRL   L01EF4A
L01EE1F     PEI   $F9
            PEI   $F7
            JSL   L013A1F
            PLY
            PLY
            LDX   $F9
            LDA   $F7
            PHA
            TXA
            STAL  L0382FF
            PLA
            STAL  L0382FD
            PEA   $0002
            PEA   ^L0382FD
            PEA   L0382FD
            JSL   L014421
            PEI   $F9
            PEI   $F7
            JSL   L013A8B
            PLY
            PLY
            BRL   L01EF28
L01EE52     PEI   $F9
            PEI   $F7
            JSL   L013A1F
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            JSL   L013A1F
            PLY
            PLY
            LDX   $F9
            LDA   $F7
            PHA
            TXA
            STAL  L0382FF
            PLA
            STAL  L0382FD
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L038303
            PLA
            STAL  L038301
            PEA   $0004
            PEA   ^L0382FD
            PEA   L0382FD
            JSL   L014421
            PEI   $F9
            PEI   $F7
            JSL   L013A8B
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            JSL   L013A8B
            PLY
            PLY
            BRL   L01EF28
L01EEA8     PEI   $F9
            PEI   $F7
            JSL   L013A1F
            PLY
            PLY
            LDX   $F9
            LDA   $F7
            PHA
            TXA
            STAL  L038307
            PLA
            STAL  L038305
            PEA   $0006
            PEA   ^L038305
            PEA   L038305
            JSL   L014421
            LDA   $FB
            CMP   #$6403
            BNE   L01EEDF
            LDX   $FF
            LDA   $FD
            STAL  L03830B
            BRA   L01EEEE
L01EEDF     LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L03830F
            PLA
            STAL  L03830D
L01EEEE     PEA   $0005
            PEA   ^L038305
            PEA   L038305
            JSL   L014421
            PEI   $F9
            PEI   $F7
            JSL   L013A8B
            PLY
            PLY
            BRL   L01EF28
            BRL   L01EF28
L01EF0B     DA    L01EE0C
            DA    L01EE1F
            DA    L01EE52
            DA    L01EEA8
            DA    L01EEA8
            DA    L01EE06
L01EF17     SEC
            SBC   #$6400
            CMP   #$0005
            BCC   L01EF23
            LDA   #$0005
L01EF23     ASL
            TAX
            JMP   (L01EF0B,X)

L01EF28     LDA   L020002
            CMP   #$0000
            BNE   L01EF35
            LDA   #$0000
            BRA   L01EF4A
L01EF35     LDA   L020002
            PHA
            LDA   #$8000
            PLX
            STX   $F0
            ORA   $F0
            PHA
            LDA   #$4000
            PLX
            STX   $F0
            ORA   $F0
L01EF4A     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01EF54     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E4
            TCS
            PEA   $0001
            PEA   $0000
            PEA   ^L03910A
            PEA   L03910A
            PEI   $F9
            PEI   $F7
            JSL   L012B09
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L01EF84
            LDA   #$0000
            BRL   L01F0C4
L01EF84     PEA   $0001
            PEA   $0000
            PEA   ^L039110
            PEA   L039110
            PEI   $F9
            PEI   $F7
            JSL   L012B09
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L01EFA8
            STZ   $EA
            BRL   L01EFFA
L01EFA8     PEA   $0001
            PEA   $0000
            PEA   ^L039117
            PEA   L039117
            PEI   $F9
            PEI   $F7
            JSL   L012B09
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L01EFCE
            LDA   #$0001
            STA   $EA
            BRA   L01EFFA
L01EFCE     PEA   $0001
            PEA   $0000
            PEA   ^L03911F
            PEA   L03911F
            PEI   $F9
            PEI   $F7
            JSL   L012B09
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BEQ   L01EFF4
            LDA   #$0002
            STA   $EA
            BRA   L01EFFA
L01EFF4     LDA   #$FFFF
            BRL   L01F0C4
L01EFFA     LDA   $FB
            CMP   #$6400
            BEQ   L01F007
            LDA   #$4016
            BRL   L01F0C4
L01F007     LDA   [$FD]
            AND   #$0500
            CMP   #$0500
            BNE   L01F017
            LDA   #$4011
            BRL   L01F0C4
L01F017     PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L01D924
            PLY
            PLY
            STX   $E8
            STA   $E6
            LDA   $E6
            CMP   #$0000
            BNE   L01F03E
            LDA   $E8
            CMP   #$0000
            BNE   L01F03E
            LDA   #$4009
            BRL   L01F0C4
L01F03E     LDA   [$FD]
            PHA
            LDA   [$E6]
            PLX
            STX   $F0
            AND   $F0
            AND   #$0003
            PHA
            LDA   [$FD]
            AND   #$0003
            PLX
            STX   $EC
            CMP   $EC
            BEQ   L01F05D
            LDA   #$400D
            BRA   L01F0C4
L01F05D     PEA   $0000
            PEA   $6601
            PEI   $E8
            PEI   $E6
            LDY   #$0006
            LDA   [$E6],Y
            TAX
            LDY   #$0004
            LDA   [$E6],Y
            STA   $EC
            STX   $EE
            LDY   #$0016
            LDA   [$EC],Y
            TAX
            LDY   #$0014
            LDA   [$EC],Y
            STA   $EC
            STX   $EE
            LDA   $EC
            LDX   $EE
            JSL   L014572
            PLY
            PLY
            PLY
            PLY
            LDY   #$0006
            LDA   [$E6],Y
            TAX
            LDY   #$0004
            LDA   [$E6],Y
            LDY   #$0006
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0004
            STA   [$FD],Y
            LDY   #$000A
            LDA   [$E6],Y
            TAX
            LDY   #$0008
            LDA   [$E6],Y
            LDY   #$000A
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$0008
            STA   [$FD],Y
            LDA   #$0000
L01F0C4     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L01F0CE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   L020127
            SEC
            SBC   #$0000
            BEQ   L01F0E9
            BVS   L01F0E7
            EOR   #$8000
L01F0E7     BMI   L01F108
L01F0E9     PEA   $0100
            PEA   ^L03900A
            PEA   L03900A
            JSL   L01F57E
            PLY
            PLY
            PLY
            STA   L020127
            LDA   #L03900A
            LDX   #^L03900A
            STX   L02012B
            STA   L020129
L01F108     LDY   #$000C
            LDA   [$FD],Y
            CMP   #$0000
            BNE   L01F115
            BRL   L01F1AD
L01F115     BCS   L01F11A
            BRL   L01F1AD
L01F11A     LDA   L020127
            SEC
            SBC   #$0000
            BNE   L01F126
            BRL   L01F1AD
L01F126     BVS   L01F12B
            EOR   #$8000
L01F12B     BMI   L01F130
            BRL   L01F1AD
L01F130     LDX   L02012B
            LDA   L020129
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$0000
            BNE   L01F147
            BRL   L01F1AD
L01F147     LDX   L02012B
            LDA   L020129
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   L020129
            LDA   L02012B
            BCC   L01F15C
            INC
L01F15C     STA   L02012B
            PLA
            PLX
            STA   $F2
            STX   $F4
            LDA   [$F2]
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            PHX
            PHA
            CLC
            ADC   #$0001
            LDY   #$000E
            STA   [$FD],Y
            LDY   #$0010
            LDA   [$FD],Y
            BCC   L01F186
            INC
L01F186     LDY   #$0010
            STA   [$FD],Y
            PLA
            PLX
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDY   #$000C
            LDA   [$FD],Y
            DEC
            LDY   #$000C
            STA   [$FD],Y
            LDA   L020127
            DEC
            STA   L020127
            BRL   L01F108
L01F1AD     LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01F1BA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            LDY   #$000A
            LDA   [$FD],Y
            TAX
            LDY   #$0008
            LDA   [$FD],Y
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            STAL  L038329
            LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            PHA
            TXA
            STAL  L038331
            PLA
            STAL  L03832F
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            PHA
            TXA
            STAL  L03832D
            PLA
            STAL  L03832B
            PEA   $0012
            PEA   ^L038329
            PEA   L038329
            JSL   L014421
            LDA   [$FD]
            AND   #$0020
            TAY
            BNE   L01F273
            LDAL  L038335
            TAX
            LDAL  L038333
            STA   $EE
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            STX   $EC
            STA   $EA
            BRA   L01F264
L01F243     LDA   [$EA]
            AND   #$00FF
            CMP   #$000D
            BNE   L01F256
            LDA   #$000A
            SEP   #$20
            STA   [$EA]
            REP   #$20
L01F256     LDA   $EE
            DEC   $EE
            LDX   $EC
            LDA   $EA
            INC   $EA
            BNE   L01F264
            INC   $EC
L01F264     LDA   $EE
            SEC
            SBC   #$0000
            BEQ   L01F273
            BVS   L01F271
            EOR   #$8000
L01F271     BMI   L01F243
L01F273     LDA   L020002
            CMP   #$004C
            BNE   L01F27F
            STZ   $F0
            BRA   L01F284
L01F27F     LDA   L020002
            STA   $F0
L01F284     LDA   $F0
            CMP   #$0000
            BNE   L01F2CC
            LDY   #$000C
            LDA   [$FD],Y
            LDX   #$0000
            SEC
            SBCL  L038333
            PHA
            TXA
            SBCL  L038335
            TAX
            PLA
            LDY   #$000C
            STA   [$FD],Y
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            CLC
            ADCL  L038333
            PHA
            TXA
            ADCL  L038335
            TAX
            PLA
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000E
            STA   [$FD],Y
            BRA   L01F2D3
L01F2CC     LDA   $F0
            LDY   #$0002
            STA   [$FD],Y
L01F2D3     LDA   $F0
            CMP   #$0000
            BNE   L01F2DF
            LDA   #$0000
            BRA   L01F2E2
L01F2DF     LDA   #$0005
L01F2E2     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01F2EC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L01F304     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E6
            TCS
            STZ   $EA
            PEI   $FF
            PEI   $FD
            JSL   L013A1F
            PLY
            PLY
            LDA   [$F9]
            STA   $EC
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L038307
            PLA
            STAL  L038305
            PEA   $0006
            PEA   ^L038305
            PEA   L038305
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01F346
            BRL   L01F3FC
L01F346     LDA   $EC
            AND   #$0500
            CMP   #$0500
            BNE   L01F358
            LDA   #$0011
            STA   $EA
            BRL   L01F3F9
L01F358     LDA   $EC
            AND   #$0001
            TAY
            BEQ   L01F36A
            LDAL  L038309
            AND   #$0001
            TAY
            BEQ   L01F37C
L01F36A     LDA   $EC
            AND   #$0002
            TAY
            BEQ   L01F384
            LDAL  L038309
            AND   #$0002
            TAY
            BNE   L01F384
L01F37C     LDA   #$000D
            STA   $EA
            BRL   L01F3F9
L01F384     LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L038323
            PLA
            STAL  L038321
            PEA   $0010
            PEA   ^L03831F
            PEA   L03831F
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01F3AB
            BRL   L01F3F9
L01F3AB     LDA   $EC
            AND   #$0200
            TAY
            BNE   L01F3B6
            BRL   L01F3F9
L01F3B6     LDX   #$0000
            LDA   #$0000
            PHA
            TXA
            STAL  L038341
            PLA
            STAL  L03833F
            LDAL  L03831F
            STAL  L03833D
            PEA   $0018
            PEA   ^L03833D
            PEA   L03833D
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01F3F9
            LDAL  L03831F
            STAL  L038329
            PEA   $0014
            PEA   ^L038329
            PEA   L038329
            JSL   L014421
L01F3F9     BRL   L01F4A2
L01F3FC     LDA   L020002
            CMP   #$0046
            BEQ   L01F407
            BRL   L01F4A2
L01F407     LDA   $EC
            AND   #$0100
            TAY
            BNE   L01F412
            BRL   L01F4A2
L01F412     LDAL  L038309
            ORA   #$00C3
            STAL  L038309
            LDA   $EC
            AND   #$0020
            TAY
            BEQ   L01F42E
            LDA   #$0000
            STAL  L03830B
            BRA   L01F435
L01F42E     LDA   #$0004
            STAL  L03830B
L01F435     LDA   #$0000
            STAL  L038315
            STAL  L038313
            PEA   $0001
            PEA   ^L038305
            PEA   L038305
            JSL   L014421
            LDA   L020002
            CMP   #$0000
            BEQ   L01F458
            BRL   L01F4A2
L01F458     LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L038323
            PLA
            STAL  L038321
            PEA   $0010
            PEA   ^L03831F
            PEA   L03831F
            JSL   L014421
            LDA   L020002
            STA   $E8
            LDA   L020002
            CMP   #$0000
            BEQ   L01F4A2
            LDX   $FF
            LDA   $FD
            PHA
            TXA
            STAL  L0382FF
            PLA
            STAL  L0382FD
            PEA   $0002
            PEA   ^L0382FD
            PEA   L0382FD
            JSL   L014421
            LDA   $E8
            STA   L020002
L01F4A2     PEI   $FF
            PEI   $FD
            JSL   L013A8B
            PLY
            PLY
            LDA   L020002
            CMP   #$0000
            BEQ   L01F4CC
            LDA   L020002
            PHA
            LDA   #$8000
            PLX
            STX   $F2
            ORA   $F2
            STA   $EA
            LDA   L020002
            LDY   #$0002
            STA   [$F9],Y
            BRA   L01F4DB
L01F4CC     LDA   $EA
            CMP   #$0000
            BEQ   L01F4DB
            LDA   #$0000
            LDY   #$0002
            STA   [$F9],Y
L01F4DB     LDA   $EA
            CMP   #$0000
            BNE   L01F55D
            PHX
            PHA
            PEA   $0000
            PEA   $000E
            LDA   L020004
            ORA   #$0F00
            PHA
            PEA   $8300
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L01F506
            LDA   #$0000
L01F506     STAL  L020002
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F9],Y
            PLA
            LDY   #$0008
            STA   [$F9],Y
            LDY   #$000A
            LDA   [$F9],Y
            TAX
            LDY   #$0008
            LDA   [$F9],Y
            STA   $EE
            STX   $F0
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $EE
            STX   $F0
            LDAL  L03831F
            LDY   #$0002
            STA   [$EE],Y
            LDY   #$000A
            LDA   [$F9],Y
            TAX
            LDY   #$0008
            LDA   [$F9],Y
            STA   $EE
            STX   $F0
            LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STA   $EE
            STX   $F0
            LDA   #$0001
            STA   [$EE]
L01F55D     LDA   $EA
            CMP   #$0000
            BNE   L01F569
            LDA   #$0000
            BRA   L01F574
L01F569     LDA   $EA
            PHA
            LDA   #$4000
            PLX
            STX   $F2
            ORA   $F2
L01F574     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L01F57E     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EB
            TCS
            STZ   $EE
L01F58B     LDA   $EE
            SEC
            SBC   $FF
            BVS   L01F595
            EOR   #$8000
L01F595     BPL   L01F59A
            BRL   L01F6E1
L01F59A     PHA
            PEA   $0001
            _ReadChar
            BCS   L01F5AA
            LDA   #$0000
L01F5AA     STAL  L020002
            PLA
            SEP   #$20
            STA   $ED
            REP   #$20
            PHA
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L01F5C0
            INC   $FD
L01F5C0     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            INC   $EE
            LDA   $ED
            AND   #$00FF
            CMP   #$000D
            BNE   L01F609
            LDX   $FD
            LDA   $FB
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STA   $F0
            STX   $F2
            LDA   #$000A
            SEP   #$20
            STA   [$F0]
            REP   #$20
            PEA   $000A
            _WriteChar
            BCS   L01F602
            LDA   #$0000
L01F602     STAL  L020002
            BRL   L01F6E1
L01F609     LDA   $ED
            AND   #$00FF
            CMP   #$0000
            BNE   L01F63C
            PEA   $000D
            _WriteChar
            BCS   L01F622
            LDA   #$0000
L01F622     STAL  L020002
            PEA   $000A
            _WriteChar
            BCS   L01F635
            LDA   #$0000
L01F635     STAL  L020002
            BRL   L01F6E1
L01F63C     LDA   $ED
            AND   #$00FF
            CMP   #$007F
            BEQ   L01F649
            BRL   L01F6DE
L01F649     LDA   $FB
            BNE   L01F64F
            DEC   $FD
L01F64F     DEC   $FB
            DEC   $EE
            PEA   $0008
            _WriteChar
            BCS   L01F662
            LDA   #$0000
L01F662     STAL  L020002
            PEA   $0020
            _WriteChar
            BCS   L01F675
            LDA   #$0000
L01F675     STAL  L020002
            PEA   $0008
            _WriteChar
            BCS   L01F688
            LDA   #$0000
L01F688     STAL  L020002
            LDA   $EE
            SEC
            SBC   #$0000
            BEQ   L01F6DE
            BVS   L01F699
            EOR   #$8000
L01F699     BPL   L01F6DE
            LDA   $FB
            BNE   L01F6A1
            DEC   $FD
L01F6A1     DEC   $FB
            DEC   $EE
            PEA   $0008
            _WriteChar
            BCS   L01F6B4
            LDA   #$0000
L01F6B4     STAL  L020002
            PEA   $0020
            _WriteChar
            BCS   L01F6C7
            LDA   #$0000
L01F6C7     STAL  L020002
            PEA   $0008
            _WriteChar
            BCS   L01F6DA
            LDA   #$0000
L01F6DA     STAL  L020002
L01F6DE     BRL   L01F58B
L01F6E1     LDA   $EE
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL


