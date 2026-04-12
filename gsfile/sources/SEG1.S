*
* GSFile
*
* (c) 1997, SofWood Company
* (s) 2026, Brutal Deluxe Software
*

	mx	%00
	rel
	lst	off

*----------------------------------- Macros

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/DOS.16.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/SANE.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs

	use	SEG1.X.S
	
GSOS	=	$E100A8

*-----------------------------------

            BRA   L010005
            NOP
            NOP
            NOP
L010005     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            SEP   #$20
            LDA   #^L01015B
            PHA
            PLB
            REP   #$20
            STX   L01015F
            STY   L010161
            TSX
            STX   L01015B
            JSL   L0D12C0
            STA   L0F07C9
            PEA   $0000
            PEA   $0000
            PEA   $C011
            LDA   L0F07C9
            PHA
            PEA   $0000
            PEA   $0100
            JSL   L0D12E5
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $F2
            STX   $F4
            STX   $F8
            ORA   $F8
            BNE   L010061
            PEA   ^L010118
            PEA   L010118
            JSL   L0D131C
            PLY
            PLY
            BRL   L01010E
L010061     LDX   $F4
            LDA   $F2
            STA   $F6
            PHB
            PEA   $0000
            PLB
            PLB
            PEI   $F6
            _SANEStartUp
            PLB
            PEA   $0000
            PEA   $0000
            PEA   $C011
            LDA   L0F07C9
            PHA
            PEA   $0000
            PEA   $2000
            JSL   L0D12E5
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $F2
            STX   $F4
            STX   $F8
            ORA   $F8
            BNE   L0100AF
            PEA   ^L010138
            PEA   L010138
            JSL   L0D131C
            PLY
            PLY
            BRL   L01010E
L0100AF     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            AND   #$FFFF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            CLC
            ADC   #$2000
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STA   L01015D
            LDX   L01015D
            TXS
            LDX   L01015F
            PHX
            LDY   L010161
            PHY
            JSL   L0D1734
            PLY
            PLX
            PEA   ^L010153
            PEA   L010153
            JSL   L0D1B9C
            PLY
            PLY
            CMP   #$0000
            BNE   L010105
            LDX   L010151
            LDA   L01014F
            PHX
            PHA
            LDA   L01014D
            PHA
            JSL   L010163
            PLY
            PLY
            PLY
L010105     LDX   L01015B
            TXS
            PEA   $0000
            PLB
            PLB
L01010E     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L010118     ASC   'Can'27't allocate SANE direct page'00
L010138     ASC   'Can'27't allocate stack'00
L01014D     ENT
            DW    $0000
L01014F     ENT
            DW    $0000
L010151     ENT
            DW    $0000
L010153     ENT
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L01015B     DB    $00
            DB    $00
L01015D     DB    $00
            DB    $00
L01015F     DB    $00
            DB    $00
L010161     DB    $00
            DB    $00
L010163     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L030000
            JSL   L010251
            JSL   L011514
            JSL   L020000
            JSL   L011599
            JSL   L011E4D
            STZ   L0F0050
            STZ   L0F000E
            JSL   L0729A0
            LDA   #$0001
            STA   L0F0010
            PHA
            PEA   $FFBF
            PEA   $0040
            _FlushEvents
            STA   L0F0779
            PLA
            LDX   #$0000
            LDA   #$1BFF
            PHA
            TXA
            STAL  L0E0042+2
            PLA
            STAL  L0E0042
L0101B9     PHA
            PEA   $0140
            PEA   ^L0E002E
            PEA   L0E002E
            _TaskMaster
            STA   L0F0779
            PLA
            STA   L0F0020
            LDA   L0F0020
            BEQ   L0101DD
            JSL   L0104BF
            BRL   L010239
L0101DD     PHA
            PEA   $1000
            PEA   ^L0E002E
            PEA   L0E002E
            _TaskMaster
            STA   L0F0779
            PLA
            STA   L0F0020
            LDA   L0F0020
            BEQ   L010201
            JSL   L0104BF
            BRL   L010239
L010201     PHA
            PEA   $FFFF
            PEA   ^L0E002E
            PEA   L0E002E
            _TaskMaster
            STA   L0F0779
            PLA
            STA   L0F0020
            LDA   L0F0020
            BNE   L010230
            LDAL  L0E003A
            STA   L0F0022
            LDAL  L0E0038
            STA   L0F0024
            JSL   L0B1F05
L010230     LDA   L0F0020
            BEQ   L010201
            JSL   L0104BF
L010239     LDA   L0F0050
            BNE   L010241
            BRL   L0101B9
L010241     PEA   $0001
            JSL   L01040C
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L010251     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            _TLStartUp
            STA   L0F0779
            _MTStartUp
            STA   L0F0779
            PHA
            _MMStartUp
            STA   L0F0779
            PLA
            STA   L0F001E
            PHX
            PHA
            PEA   $0000
            PEA   $0800
            LDA   L0F001E
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            STA   L0F0779
            PLA
            PLX
            STX   L0F0054
            STA   L0F0052
            LDX   L0F0054
            LDA   L0F0052
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STX   L0F0058
            STA   L0F0056
            LDX   L0F0058
            LDA   L0F0056
            PHA
            PEA   $0080
            PEA   $00A0
            LDA   L0F001E
            PHA
            _QDStartUp
            STA   L0F0779
            LDX   #$0000
            LDA   #$0300
            PHX
            PHA
            LDX   L0F0058
            LDA   L0F0056
            JSL   L0D1573
            PLA
            PLX
            PHA
            PEA   $0014
            PEA   $0000
            PEA   $0280
            PEA   $0000
            PEA   $00C8
            LDA   L0F001E
            PHA
            _EMStartUp
            STA   L0F0779
            PEA   ^L0E0000
            PEA   L0E0000
            _LoadTools
            STA   L0F0779
            _QDAuxStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            LDX   #$0000
            LDA   #$0400
            PHX
            PHA
            LDX   L0F0058
            LDA   L0F0056
            JSL   L0D1573
            PLA
            PLX
            PHA
            _CtlStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            _WindStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            LDX   #$0000
            LDA   #$0500
            PHX
            PHA
            LDX   L0F0058
            LDA   L0F0056
            JSL   L0D1573
            PLA
            PLX
            PHA
            _MenuStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            LDX   #$0000
            LDA   #$0600
            PHX
            PHA
            LDX   L0F0058
            LDA   L0F0056
            JSL   L0D1573
            PLA
            PLX
            PHA
            _LEStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            _DialogStartUp
            STA   L0F0779
            LDA   L0F001E
            PHA
            LDX   #$0000
            LDA   #$0700
            PHX
            PHA
            LDX   L0F0058
            LDA   L0F0056
            JSL   L0D1573
            PLA
            PLX
            PHA
            _SFStartUp
            STA   L0F0779
            _TextStartUp
            STA   L0F0779
            _DeskStartUp
            STA   L0F0779
            PEA   $0000
            PEA   $0000
            PEA   $0001
            _SetOutputDevice
            STA   L0F0779
            PEA   $0000
            PEA   $0001
            _InitTextDev
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L01040C     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            _DeskShutDown
            STA   L0F0779
            _SFShutDown
            STA   L0F0779
            _DialogShutDown
            STA   L0F0779
            _LEShutDown
            STA   L0F0779
            _MenuShutDown
            STA   L0F0779
            _WindShutDown
            STA   L0F0779
            _CtlShutDown
            STA   L0F0779
            _QDAuxShutDown
            STA   L0F0779
            _EMShutDown
            STA   L0F0779
            _QDShutDown
            STA   L0F0779
            LDA   L0F001E
            PHA
            _DisposeAll
            STA   L0F0779
            LDA   L0F001E
            PHA
            _MMShutDown
            STA   L0F0779
            _MTShutDown
            STA   L0F0779
            _TLShutDown
            STA   L0F0779
            JSL   GSOS
            DW    $0029       ; Quit
            ADRL  L0E0026
            BRK   $F0
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0104BF     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F0020
            CMP   #$0002
            BEQ   L0104D4
            BRA   L0104DC
L0104D4     LDA   #$0000
            BRL   L0105F5
            BRA   L0104E3
L0104DC     CMP   #$0011
            BEQ   L0104E3
            BRA   L01050C
L0104E3     JSL   L01087F
            LDA   L0F0012
            CMP   #$0000
            BEQ   L010504
            PHA
            PEA   $000C
            PEA   $0000
            PEA   $0000
            _PostEvent
            STA   L0F0779
            PLA
L010504     LDA   #$0000
            BRL   L0105F5
            BRA   L010513
L01050C     CMP   #$0013
            BEQ   L010513
            BRA   L01053C
L010513     JSL   L0912F6
            LDA   L0F0012
            CMP   #$0000
            BEQ   L010534
            PHA
            PEA   $000C
            PEA   $0000
            PEA   $0000
            _PostEvent
            STA   L0F0779
            PLA
L010534     LDA   #$0000
            BRL   L0105F5
            BRA   L010548
L01053C     CMP   #$0005
            BEQ   L010548
            CMP   #$0003
            BEQ   L010548
            BRA   L010551
L010548     JSL   L07130C
            BRL   L0105E9
            BRA   L010559
L010551     CMP   #$0008
            BEQ   L010559
            BRL   L0105D7
L010559     LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            LDAL  L0E0030+2
            TAX
            LDAL  L0E0030
            JSL   L0D157E
            BEQ   L010573
            BRL   L0105D0
L010573     LDAL  L0E003C
            AND   #$0002
            TAY
            BEQ   L010597
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _DrawControls
            STA   L0F0779
            LDA   #$0001
            STA   L0F0014
            BRA   L0105D0
L010597     PHX
            PHA
            _FrontWindow
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            JSL   L0D157E
            BNE   L0105D0
            LDA   L0F0014
            CMP   #$0001
            BNE   L0105D0
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _DrawControls
            STA   L0F0779
            STZ   L0F0014
L0105D0     LDA   #$0000
            BRA   L0105F5
            BRA   L0105DE
L0105D7     CMP   #$000C
            BEQ   L0105DE
            BRA   L0105E7
L0105DE     BRA   L0105E9
L0105E0     LDA   #$0000
            BRA   L0105F5
            BRA   L0105E9
L0105E7     BRA   L0105E0
L0105E9     LDA   L0F0012
            CMP   #$0000
            BEQ   L0105F5
            JSL   L0105FF
L0105F5     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0105FF     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   L0F0012
            CMP   #$0000
            BEQ   L010626
            BRA   L01062B
L010626     BRL   L010787
            BRA   L010632
L01062B     CMP   #$0001
            BEQ   L010632
            BRA   L01063D
L010632     LDA   #$0002
            STA   L0F0012
            BRL   L010787
            BRA   L010644
L01063D     CMP   #$0002
            BEQ   L010644
            BRA   L01064F
L010644     LDA   L0F004C
            STA   L0F0012
            BRL   L010787
            BRA   L010656
L01064F     CMP   #$0003
            BEQ   L010656
            BRA   L010662
L010656     JSL   L07289D
            STZ   L0F0012
            BRL   L010787
            BRA   L01066A
L010662     CMP   #$0004
            BEQ   L01066A
            BRL   L0106CB
L01066A     LDA   L0F00D7
            PHA
            LDA   L0F00D9
            PHA
            LDA   L0F00DD
            PHA
            LDA   L0F00DB
            PHA
            LDA   L0F00D5
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            LDA   L0F00DF
            PHA
            JSL   L0807C7
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            LDA   L0F00DF
            CMP   #$0000
            BNE   L0106BE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0064
            STA   [$F8],Y
L0106BE     PEA   $0000
            JSL   L01078F
            PLY
            BRL   L010787
            BRA   L0106D2
L0106CB     CMP   #$0005
            BEQ   L0106D2
            BRA   L0106F9
L0106D2     LDA   L0F00D7
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L080A27
            PLY
            PLY
            PEA   $0001
            JSL   L01078F
            PLY
            BRL   L010787
            BRA   L010700
L0106F9     CMP   #$0008
            BEQ   L010700
            BRA   L01072A
L010700     JSL   L0A1250
            TAY
            BEQ   L010722
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L01071E
            JSL   L011077
            BRA   L010722
L01071E     JSL   L011281
L010722     STZ   L0F0012
            BRL   L010787
            BRA   L010731
L01072A     CMP   #$0009
            BEQ   L010731
            BRA   L01073D
L010731     JSL   L011077
            STZ   L0F0012
            BRL   L010787
            BRA   L010744
L01073D     CMP   #$000A
            BEQ   L010744
            BRA   L010750
L010744     JSL   L011281
            STZ   L0F0012
            BRL   L010787
            BRA   L010757
L010750     CMP   #$000B
            BEQ   L010757
            BRA   L010766
L010757     JSL   L0A1ED6
            JSL   L011281
            STZ   L0F0012
            BRA   L010787
            BRA   L01076D
L010766     CMP   #$000C
            BEQ   L01076D
            BRA   L01077C
L01076D     JSL   L0A227E
            JSL   L011281
            STZ   L0F0012
            BRA   L010787
            BRA   L010783
L01077C     CMP   #$000E
            BEQ   L010783
            BRA   L010787
L010783     JSL   L0A256E
L010787     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L01078F     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            JSL   L030FA2
            JSL   L090630
            JSL   L083651
            LDA   $FF
            CMP   #$0000
            BEQ   L0107B0
            BRL   L01086C
L0107B0     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$0001
            BNE   L0107C5
            BRL   L01086C
L0107C5     BVS   L0107CA
            EOR   #$8000
L0107CA     BMI   L0107CF
            BRL   L01086C
L0107CF     LDA   L0F00D5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L092547
            PLY
            PLY
            PLY
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0022
            LDA   [$F6],Y
            STA   $F4
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$0034
            BCC   L010812
            INX
L010812     PHX
            PHA
            JSL   L0C0736
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L010826
            JSL   L072D31
            BRL   L01086A
L010826     LDAL  L0E17C6
            SEC
            SBC   #$0005
            STAL  L0E17C6
            LDAL  L0E17C8
            SEC
            SBC   #$000E
            STAL  L0E17C8
            LDAL  L0E17CA
            CLC
            ADC   #$0005
            STAL  L0E17CA
            LDAL  L0E17CC
            CLC
            ADC   #$000E
            STAL  L0E17CC
            PEA   ^L0E17C6
            PEA   L0E17C6
            JSL   L073E52
            PLY
            PLY
            JSL   L072D31
            JSL   L073E73
L01086A     BRA   L010870
L01086C     JSL   L072D31
L010870     JSL   L091079
            STZ   L0F0012
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L01087F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   #$0000
            LDA   #$0100
            PHX
            PHA
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            PHX
            PHA
            LDX   #$0000
            LDA   #$FFFF
            SEC
            JSL   L0D15C0
            PLA
            PLX
            JSL   L0D157E
            BEQ   L0108E1
            BVS   L0108B5
            EOR   #$8000
L0108B5     BPL   L0108E1
            PEA   $0000
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            PHX
            PHA
            LDX   #$0000
            LDA   #$FFFF
            SEC
            JSL   L0D15C0
            PLY
            PLY
            PHX
            PHA
            _HiliteMenu
            STA   L0F0779
            BRL   L01106D
L0108E1     PEA   $0001
            JSL   L0B1E73
            PLY
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            PHX
            PHA
            LDX   #$0000
            LDA   #$FFFF
            SEC
            JSL   L0D15C0
            PLY
            PLY
            SEC
            SBC   #$0001
            CMP   #$0000
            BEQ   L01090D
            BRL   L010979
L01090D     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$0001
            CMP   #$0000
            BEQ   L01092B
            BRA   L010934
L01092B     JSL   L0C1488
            BRL   L010974
            BRA   L01093B
L010934     CMP   #$0001
            BEQ   L01093B
            BRA   L010943
L01093B     JSL   L0C1971
            BRA   L010974
            BRA   L01094A
L010943     CMP   #$0003
            BEQ   L01094A
            BRA   L010956
L01094A     PEA   $FFFF
            JSL   L06015C
            PLY
            BRA   L010974
            BRA   L01095D
L010956     CMP   #$0004
            BEQ   L01095D
            BRA   L010969
L01095D     PEA   $FFFF
            JSL   L0607AC
            PLY
            BRA   L010974
            BRA   L010970
L010969     CMP   #$0005
            BEQ   L010970
            BRA   L010974
L010970     JSL   L0618F6
L010974     BRL   L011046
            BRA   L010981
L010979     CMP   #$0001
            BEQ   L010981
            BRL   L010B23
L010981     LDX   #$0000
            LDA   #$0034
            PHX
            PHA
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            JSL   L0D157E
            BNE   L0109A9
            JSL   L0D0901
            BRL   L011046
L0109A9     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$0007
            CMP   #$0000
            BEQ   L0109C7
            BRA   L0109D4
L0109C7     PEA   $0069
            JSL   L040622
            PLY
            BRL   L010B1E
            BRA   L0109DB
L0109D4     CMP   #$0001
            BEQ   L0109DB
            BRA   L0109E8
L0109DB     PEA   $0002
            JSL   L0A1601
            PLY
            BRL   L010B1E
            BRA   L0109EF
L0109E8     CMP   #$0002
            BEQ   L0109EF
            BRA   L010A12
L0109EF     LDA   L0F0044
            CMP   #$0000
            BNE   L010A09
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   $0000
            JSL   L050000
            PLY
            PLY
            PLY
            BRA   L010A0D
L010A09     JSL   L0A0E6A
L010A0D     BRL   L010B1E
            BRA   L010A19
L010A12     CMP   #$0003
            BEQ   L010A19
            BRA   L010A2E
L010A19     PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   $0001
            JSL   L050000
            PLY
            PLY
            PLY
            BRL   L010B1E
            BRA   L010A35
L010A2E     CMP   #$0004
            BEQ   L010A35
            BRA   L010A3E
L010A35     JSL   L0A1668
            BRL   L010B1E
            BRA   L010A46
L010A3E     CMP   #$0005
            BEQ   L010A46
            BRL   L010A9E
L010A46     PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0004
            JSL   L040622
            PLY
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0012
            CMP   #$0008
            BNE   L010A99
            STZ   L0F0012
            JSL   L0A2684
L010A99     BRL   L010B1E
            BRA   L010AA5
L010A9E     CMP   #$0006
            BEQ   L010AA5
            BRA   L010AAE
L010AA5     JSL   L0D0455
            BRL   L010B1E
            BRA   L010AB5
L010AAE     CMP   #$0007
            BEQ   L010AB5
            BRA   L010AD1
L010AB5     PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   $0003
            JSL   L050000
            PLY
            PLY
            PLY
            TAY
            BEQ   L010ACC
            JSL   L0B24C9
L010ACC     BRL   L010B1E
            BRA   L010AD8
L010AD1     CMP   #$0008
            BEQ   L010AD8
            BRA   L010AE9
L010AD8     PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L05043F
            PLY
            PLY
            BRL   L010B1E
            BRA   L010AF0
L010AE9     CMP   #$0009
            BEQ   L010AF0
            BRA   L010B04
L010AF0     PEA   $0000
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0505E8
            PLY
            PLY
            PLY
            BRA   L010B1E
            BRA   L010B0B
L010B04     CMP   #$000A
            BEQ   L010B0B
            BRA   L010B13
L010B0B     JSL   L0C1FAA
            BRA   L010B1E
            BRA   L010B1A
L010B13     CMP   #$000B
            BEQ   L010B1A
            BRA   L010B1E
L010B1A     JSL   L0C1E32
L010B1E     BRL   L011046
            BRA   L010B2B
L010B23     CMP   #$0002
            BEQ   L010B2B
            BRL   L010C66
L010B2B     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$0013
            CMP   #$0000
            BEQ   L010B49
            BRA   L010B5B
L010B49     PEA   $0001
            LDA   L0F0070
            PHA
            JSL   L0B2164
            PLY
            PLY
            BRL   L010C61
            BRA   L010B62
L010B5B     CMP   #$0001
            BEQ   L010B62
            BRA   L010B74
L010B62     PEA   $0000
            LDA   L0F0070
            PHA
            JSL   L0B2164
            PLY
            PLY
            BRL   L010C61
            BRA   L010B7B
L010B74     CMP   #$0002
            BEQ   L010B7B
            BRA   L010B88
L010B7B     PEA   $0001
            JSL   L0B2275
            PLY
            BRL   L010C61
            BRA   L010B8F
L010B88     CMP   #$0003
            BEQ   L010B8F
            BRA   L010B9C
L010B8F     PEA   $0000
            JSL   L0B2275
            PLY
            BRL   L010C61
            BRA   L010BA3
L010B9C     CMP   #$0004
            BEQ   L010BA3
            BRA   L010BB0
L010BA3     PEA   $0000
            JSL   L0B20A6
            PLY
            BRL   L010C61
            BRA   L010BB7
L010BB0     CMP   #$0005
            BEQ   L010BB7
            BRA   L010BC4
L010BB7     PEA   $0001
            JSL   L0B20A6
            PLY
            BRL   L010C61
            BRA   L010BCB
L010BC4     CMP   #$0006
            BEQ   L010BCB
            BRA   L010BD8
L010BCB     PEA   $0002
            JSL   L0B20A6
            PLY
            BRL   L010C61
            BRA   L010BDF
L010BD8     CMP   #$0007
            BEQ   L010BDF
            BRA   L010BE8
L010BDF     JSL   L060000
            BRL   L010C61
            BRA   L010BF0
L010BE8     CMP   #$0008
            BEQ   L010BF0
            BRL   L010C3A
L010BF0     LDA   L0F0070
            CMP   #$FFFF
            BNE   L010C06
            PEA   $0004
            PEA   $0000
            JSL   L011393
            PLY
            PLY
            BRA   L010C36
L010C06     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            CMP   #$0000
            BNE   L010C25
            PEA   $0004
            PEA   $0001
            JSL   L011393
            PLY
            PLY
            BRA   L010C36
L010C25     JSL   L062286
            STA   $F6
            PEI   $F6
            PEA   $0004
            JSL   L0113E1
            PLY
            PLY
L010C36     BRA   L010C61
            BRA   L010C41
L010C3A     CMP   #$0009
            BEQ   L010C41
            BRA   L010C49
L010C41     JSL   L051393
            BRA   L010C61
            BRA   L010C50
L010C49     CMP   #$000A
            BEQ   L010C50
            BRA   L010C61
L010C50     JSL   L06254A
            STA   $F6
            PEI   $F6
            PEA   $0005
            JSL   L0113E1
            PLY
            PLY
L010C61     BRL   L011046
            BRA   L010C6E
L010C66     CMP   #$0003
            BEQ   L010C6E
            BRL   L010D18
L010C6E     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$001E
            CMP   #$0000
            BEQ   L010C8C
            BRA   L010C95
L010C8C     JSL   L0C0E02
            BRL   L010D13
            BRA   L010C9C
L010C95     CMP   #$0001
            BEQ   L010C9C
            BRA   L010CA5
L010C9C     JSL   L0C1ADF
            BRL   L010D13
            BRA   L010CAC
L010CA5     CMP   #$0002
            BEQ   L010CAC
            BRA   L010CDE
L010CAC     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0062
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$002E
            STA   [$F8],Y
            JSL   L030FA2
            LDA   #$000A
            STA   L0F0012
            BRA   L010D13
            BRA   L010CE5
L010CDE     CMP   #$0003
            BEQ   L010CE5
            BRA   L010D13
L010CE5     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0062
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$002E
            STA   [$F8],Y
            JSL   L030FA2
            LDA   #$000A
            STA   L0F0012
L010D13     BRL   L011046
            BRA   L010D20
L010D18     CMP   #$0004
            BEQ   L010D20
            BRL   L010DB4
L010D20     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$0022
            CMP   #$0000
            BEQ   L010D3E
            BRA   L010D4B
L010D3E     PEA   $0000
            JSL   L0A1690
            PLY
            BRL   L010DAF
            BRA   L010D52
L010D4B     CMP   #$0001
            BEQ   L010D52
            BRA   L010D5F
L010D52     PEA   $0001
            JSL   L0A1690
            PLY
            BRL   L010DAF
            BRA   L010D66
L010D5F     CMP   #$0002
            BEQ   L010D66
            BRA   L010D92
L010D66     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0066
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0070
            STA   [$F8],Y
            JSL   L030FA2
            BRA   L010DAF
            BRA   L010D99
L010D92     CMP   #$0003
            BEQ   L010D99
            BRA   L010DAF
L010D99     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0066
            STA   [$F8],Y
            JSL   L030FA2
L010DAF     BRL   L011046
            BRA   L010DBC
L010DB4     CMP   #$0005
            BEQ   L010DBC
            BRL   L010EFA
L010DBC     LDX   #$0000
            LDA   #$0003
            PHX
            PHA
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            JSL   L0D157E
            BNE   L010DE4
            JSL   L0C2078
            BRL   L011046
L010DE4     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$0026
            CMP   #$0000
            BEQ   L010E02
            BRA   L010E0B
L010E02     JSL   L011077
            BRL   L010EF5
            BRA   L010E12
L010E0B     CMP   #$0001
            BEQ   L010E12
            BRA   L010E1B
L010E12     JSL   L011281
            BRL   L010EF5
            BRA   L010E22
L010E1B     CMP   #$0002
            BEQ   L010E22
            BRA   L010E65
L010E22     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0068
            LDA   [$F8],Y
            CMP   #$0001
            BNE   L010E4A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0068
            STA   [$F8],Y
            BRA   L010E5C
L010E4A     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0068
            STA   [$F8],Y
L010E5C     JSL   L030FA2
            BRL   L010EF5
            BRA   L010E6C
L010E65     CMP   #$0003
            BEQ   L010E6C
            BRA   L010EB3
L010E6C     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006C
            LDA   [$F8],Y
            CMP   #$0001
            BNE   L010E94
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$006C
            STA   [$F8],Y
            BRA   L010EA6
L010E94     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006C
            STA   [$F8],Y
L010EA6     JSL   L030FA2
            JSL   L072D31
            BRL   L010EF5
            BRA   L010EBA
L010EB3     CMP   #$0004
            BEQ   L010EBA
            BRA   L010EF5
L010EBA     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006E
            LDA   [$F8],Y
            BEQ   L010EDF
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$006E
            STA   [$F8],Y
            BRA   L010EF1
L010EDF     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006E
            STA   [$F8],Y
L010EF1     JSL   L030FA2
L010EF5     BRL   L011046
            BRA   L010F02
L010EFA     CMP   #$0006
            BEQ   L010F02
            BRL   L010F62
L010F02     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$002B
            CMP   #$0000
            BEQ   L010F20
            BRA   L010F2C
L010F20     PEA   $0000
            JSL   L06280E
            PLY
            BRA   L010F5D
            BRA   L010F33
L010F2C     CMP   #$0001
            BEQ   L010F33
            BRA   L010F52
L010F33     PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   $0002
            JSL   L050000
            PLY
            PLY
            PLY
            TAY
            BEQ   L010F4E
            PEA   $0002
            JSL   L06280E
            PLY
L010F4E     BRA   L010F5D
            BRA   L010F59
L010F52     CMP   #$0002
            BEQ   L010F59
            BRA   L010F5D
L010F59     JSL   L0506E9
L010F5D     BRL   L011046
            BRA   L010F6A
L010F62     CMP   #$0007
            BEQ   L010F6A
            BRL   L011046
L010F6A     LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            SEC
            SBC   #$002E
            CMP   #$0000
            BEQ   L010F89
            BRL   L010FE9
L010F89     PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0072
            JSL   L040622
            PLY
            STZ   L0F0012
            LDA   L0F00E1
            CMP   #$0001
            BEQ   L010FC4
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4B4C
            PEA   L0E4B4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L010FC4     PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   L0F00E1
            CMP   #$0001
            BEQ   L010FE4
            JSL   L0C2A24
L010FE4     BRL   L011046
            BRA   L010FF0
L010FE9     CMP   #$0001
            BEQ   L010FF0
            BRA   L010FF9
L010FF0     JSL   L0C2F92
            BRL   L011046
            BRA   L011000
L010FF9     CMP   #$0002
            BEQ   L011000
            BRA   L011009
L011000     JSL   L0C2599
            BRL   L011046
            BRA   L011010
L011009     CMP   #$0003
            BEQ   L011010
            BRA   L011018
L011010     JSL   L0C2FB2
            BRA   L011046
            BRA   L01101F
L011018     CMP   #$0004
            BEQ   L01101F
            BRA   L01102F
L01101F     PEA   ^L0E4B4C
            PEA   L0E4B4C
            JSL   L05043F
            PLY
            PLY
            BRA   L011046
            BRA   L011036
L01102F     CMP   #$0005
            BEQ   L011036
            BRA   L011046
L011036     PEA   $0004
            PEA   ^L0E4B4C
            PEA   L0E4B4C
            JSL   L0505E8
            PLY
            PLY
            PLY
L011046     PEA   $0000
            LDAL  L0E003E+2
            TAX
            LDAL  L0E003E
            PHX
            PHA
            LDX   #$0000
            LDA   #$FFFF
            SEC
            JSL   L0D15C0
            PLY
            PLY
            PHX
            PHA
            _HiliteMenu
            STA   L0F0779
L01106D     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L011077     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            JSL   L030FA2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            STA   $F4
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0016
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$FFFF
            LDY   #$002E
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L0110CF
            BRL   L011147
L0110CF     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0008
            STA   [$F8],Y
            LDA   #L0856FC
            LDX   #^L0856FC
            PHA
            TXA
            STAL  L0E1848
            PLA
            STAL  L0E1846
            LDA   #L0852E3
            LDX   #^L0852E3
            PHA
            TXA
            STAL  L0E184C
            PLA
            STAL  L0E184A
            JSL   L0A0A02
            PEA   $0000
            PEA   $042A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$04E4
            BCC   L011122
            INX
L011122     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L011139
            INX
L011139     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L011147     JSL   L073EAC
            LDA   #$0004
            STA   $F6
            BRL   L01123C
L011153     LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E181E
            STA   $F8
            LDA   #^L0E181E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L01116C
            INC   $FA
L01116C     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _ShowControl
            STA   L0F0779
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E181E
            STA   $F8
            LDA   #^L0E181E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L011199
            INC   $FA
L011199     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0008
            BCC   L0111BC
            INX
L0111BC     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            LDA   $EE
            CLC
            ADC   #$0002
            STA   $EE
            LDA   $F2
            SEC
            SBC   #$0002
            STA   $F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            _FrameRect
            STA   L0F0779
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E181E
            STA   $F8
            LDA   #^L0E181E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L01120B
            INC   $FA
L01120B     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0008
            BCC   L01122E
            INX
L01122E     PHX
            PHA
            _ValidRect
            STA   L0F0779
            INC   $F6
L01123C     LDA   $F6
            SEC
            SBC   #$0008
            BVS   L011247
            EOR   #$8000
L011247     BMI   L01124C
            BRL   L011153
L01124C     PEA   $0001
            PEA   $0000
            JSL   L0B202D
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F4
            LDY   #$002E
            STA   [$F8],Y
            JSL   L0702F3
            PEA   $0000
            PEA   $0002
            JSL   L0B202D
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L011281     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L0112A0
            BRL   L011369
L0112A0     LDA   #$0004
            STA   $F6
            BRL   L01131F
L0112A8     LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E181E
            STA   $F8
            LDA   #^L0E181E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0112C1
            INC   $FA
L0112C1     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _HideControl
            STA   L0F0779
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E181E
            STA   $F8
            LDA   #^L0E181E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0112EE
            INC   $FA
L0112EE     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0008
            BCC   L011311
            INX
L011311     PHX
            PHA
            _ValidRect
            STA   L0F0779
            INC   $F6
L01131F     LDA   $F6
            SEC
            SBC   #$0008
            BVS   L01132A
            EOR   #$8000
L01132A     BMI   L01132F
            BRL   L0112A8
L01132F     LDA   #L090EEB
            LDX   #^L090EEB
            PHA
            TXA
            STAL  L0E1848
            PLA
            STAL  L0E1846
            LDA   #L09089C
            LDX   #^L09089C
            PHA
            TXA
            STAL  L0E184C
            PLA
            STAL  L0E184A
            PEA   $0001
            PEA   $0002
            JSL   L0B202D
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            JSL   L0B202D
            PLY
            PLY
L011369     JSL   L091079
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0008
            STA   [$F8],Y
            JSL   L030FA2
            JSL   L073F2B
            JSL   L072D31
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L011393     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            CMP   #$0000
            BNE   L0113C4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            PHA
            JSL   L0825EE
            PLY
            CMP   #$0000
            BEQ   L0113C4
            LDA   #$0000
            BRA   L0113D7
L0113C4     PEI   $FD
            JSL   L061D85
            PLY
            STA   $F2
            PEI   $F2
            PEI   $FF
            JSL   L0113E1
            PLY
            PLY
L0113D7     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0113E1     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$FFFF
            BEQ   L0113F5
            BRA   L0113FC
L0113F5     STZ   L0F0012
            BRA   L011414
            BRA   L011403
L0113FC     CMP   #$0000
            BEQ   L011403
            BRA   L011412
L011403     LDA   $FD
            STA   L0F0012
            BRA   L011414
L01140A     LDA   #$0003
            STA   L0F0012
            BRA   L011414
L011412     BRA   L01140A
L011414     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L01141C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            STA   L0F0008
            LDA   $FF
            PHA
            LDA   #$0A18
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E0086
            LDX   #^L0E0086
            BCC   L011444
            INX
L011444     STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            STA   $F4
            LDA   $F4
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E14B6
            LDX   #^L0E14B6
            BCC   L011473
            INX
L011473     STX   L0F0030
            STA   L0F002E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            STA   $F4
            LDA   $F4
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDA   #$0014
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0114AD
            INC   $F8
L0114AD     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0114B7
            INC   $F8
L0114B7     LDA   $F6
            LDX   $F8
            STX   L0F002C
            STA   L0F002A
            LDA   $FF
            CMP   #$0001
            BEQ   L01150C
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            PHA
            JSL   L081516
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            STA   $F4
            LDA   $F4
            PHA
            LDA   #$0150
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E1676
            LDX   #^L0E1676
            BCC   L011506
            INX
L011506     STX   L0F0038
            STA   L0F0036
L01150C     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L011514     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            PHX
            PHA
            PEA   ^L0E17D0
            PEA   L0E17D0
            _NewWindow
            STA   L0F0779
            PLA
            PLX
            STX   L0F0060
            STA   L0F005E
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            _GetPortRect
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            _ClipRect
            STA   L0F0779
            _ShowCursor
            STA   L0F0779
            LDA   #$0001
            STA   L0F0062
            PEA   $0001
            JSL   L0B1E73
            PLY
            JSL   L0B2007
            JSL   L060F38
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L011599     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0050
            STA   L0F004A
            PHX
            PHA
            _CompactMem
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            _MaxBlock
            STA   L0F0779
            PLA
            PLX
            STX   L0F0028
            STA   L0F0026
            PHX
            PHA
            _FreeMem
            STA   L0F0779
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$5000
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            SEC
            SBC   L0F0026
            PHA
            TXA
            SBC   L0F0028
            TAX
            PLA
            JSL   L0D157E
            BEQ   L011617
            BVS   L011600
            EOR   #$8000
L011600     BPL   L011617
            LDX   $F2
            LDA   $F0
            SEC
            SBC   #$5000
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   L0F0028
            STA   L0F0026
L011617     LDX   #$0000
            LDA   #$2000
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D157E
            BEQ   L011652
            BVS   L011630
            EOR   #$8000
L011630     BPL   L011652
            PEA   $0002
            PEA   $0003
            PEA   ^L0E48D0
            PEA   L0E48D0
            PEA   $0000
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0005
            JSL   L01040C
            PLY
L011652     PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDA   L0F001E
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STA   L0F0779
            PLA
            PLX
            STX   L0F005C
            STA   L0F005A
            LDA   L0F0779
            CMP   #$0000
            BEQ   L0116A3
            PEA   $0002
            PEA   $0003
            PEA   ^L0E48D0
            PEA   L0E48D0
            PEA   $0000
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0005
            JSL   L01040C
            PLY
L0116A3     LDX   L0F005C
            LDA   L0F005A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STX   L0F000C
            STA   L0F000A
            JSL   L080027
            PEA   ^L0E3AA9
            PEA   L0E3AA9
            JSL   L0800DE
            PLY
            PLY
            STA   $F6
            STZ   L0F0042
            PEA   $0002
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $F6
            PEA   $0000
            PEA   $0000
            JSL   L011721
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            STZ   $F4
            BRA   L011704
L0116F7     LDA   $F4
            ASL
            TAX
            LDA   #$FFFF
            STAL  L0E0046,X
            INC   $F4
L011704     LDA   $F4
            SEC
            SBC   #$0020
            BVS   L01170F
            EOR   #$8000
L01170F     BPL   L0116F7
            JSL   L030C8F
            JSL   L030FA2
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L011721     ENT
            PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00DC
            TCS
            LDA   $F3
            PHA
            LDA   #$0A18
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E0086
            LDX   #^L0E0086
            BCC   L011744
            INX
L011744     STX   L0F0034
            STA   L0F0032
            LDA   $F1
            CMP   #$0000
            BEQ   L011754
            BRL   L011852
L011754     PEI   $F5
            JSL   L011C24
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   $F7
            LDY   #$0004
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   $F9
            LDY   #$0006
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   $FB
            LDY   #$0A12
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   $FD
            LDY   #$0A14
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   $FF
            LDY   #$0A16
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$002F
            LDY   #$001A
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0021
            LDY   #$001E
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$024F
            LDY   #$001C
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$00B3
            LDY   #$0020
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0000
            LDY   #$002E
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0001
            LDY   #$0066
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0001
            LDY   #$0068
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0001
            LDY   #$006C
            STA   [$E8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDA   #$0001
            LDY   #$006E
            STA   [$E8],Y
L011852     LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$0020
            LDA   [$E8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001C
            LDA   [$E8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001E
            LDA   [$E8],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001A
            LDA   [$E8],Y
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            PEA   $0028
            PEA   $0000
            PEA   $0000
            PEA   $0047
            PEA   $0016
            JSL   L011FF5
            PLY
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $0000
            PEI   $F7
            JSL   L090000
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            LDA   $F1
            CMP   #$0002
            BNE   L0118F2
            LDA   #$0000
            BRL   L011C1A
L0118F2     LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001A
            LDA   [$E8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001C
            LDA   [$E8],Y
            PLX
            STX   $E8
            SEC
            SBC   $E8
            SEC
            SBC   #$0103
            PHA
            LDA   #$0005
            SEC
            JSL   L0D14B6
            PLY
            STA   $DE
            PEA   $001E
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$0020
            LDA   [$E8],Y
            PLX
            STX   $E8
            SEC
            SBC   $E8
            PHA
            PEI   $DE
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$001A
            LDA   [$E8],Y
            CLC
            ADC   $DE
            PHA
            PEI   $F9
            JSL   L011D1A
            PLY
            PLY
            PLY
            PLY
            PEA   $00B4
            PEA   $0029
            PEA   $0020
            PEA   $0013
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L08576A
            LDX   #^L08576A
            PHX
            PHA
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E183E
            STA   $E8
            LDA   #^L0E183E
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L0119A8
            INC   $EA
L0119A8     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            LDA   #L0852E3
            LDX   #^L0852E3
            PHX
            PHA
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E1842
            STA   $E8
            LDA   #^L0E1842
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L0119D6
            INC   $EA
L0119D6     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   ^L0E181E
            PEA   L0E181E
            PEA   $0003
            PEA   $0000
            PEA   $000A
            PEA   $03F2
            PEA   $0600
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _NewControl
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDA   $FB
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $E8
            LDA   #^L0E1822
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011A40
            INC   $EA
L011A40     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            PEA   $00B4
            PEA   $026B
            PEA   $0020
            PEA   $0255
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L090EEB
            LDX   #^L090EEB
            PHX
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E183E
            STA   $E8
            LDA   #^L0E183E
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011A8F
            INC   $EA
L011A8F     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            LDA   #L09089C
            LDX   #^L09089C
            PHX
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E1842
            STA   $E8
            LDA   #^L0E1842
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011ABD
            INC   $EA
L011ABD     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   ^L0E181F
            PEA   L0E181F
            PEA   $0003
            PEA   $0000
            PEA   $000A
            PEA   $03F2
            PEA   $0600
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _NewControl
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $E8
            LDA   #^L0E1822
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011B27
            INC   $EA
L011B27     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            PEA   $00C0
            PEA   $0251
            PEA   $00B5
            PEA   $002E
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L090F75
            LDX   #^L090F75
            PHX
            PHA
            LDA   $FF
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E183E
            STA   $E8
            LDA   #^L0E183E
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011B76
            INC   $EA
L011B76     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            LDA   #L09089C
            LDX   #^L09089C
            PHX
            PHA
            LDA   $FF
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E1842
            STA   $E8
            LDA   #^L0E1842
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011BA4
            INC   $EA
L011BA4     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   ^L0E1820
            PEA   L0E1820
            PEA   $001C
            PEA   $0000
            PEA   $000A
            PEA   $03F2
            PEA   $0600
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _NewControl
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDA   $FF
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $E8
            LDA   #^L0E1822
            STA   $EA
            PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L011C0E
            INC   $EA
L011C0E     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            STA   [$E8]
L011C1A     TAY
            TDC
            CLC
            ADC   #$00EB
            TCS
            TYA
            PLD
            RTL

L011C24     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $FF
            LDY   #$0002
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0008
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$000A
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$000C
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$000E
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0010
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0060
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0062
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0022
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$00BA
            CLC
            ADC   $F6
            BCC   L011CE5
            INX
L011CE5     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$0A10
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0A0E
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0064
            STA   [$F6],Y
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L011D1A     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $F9
            PHA
            LDA   #$0150
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E1676
            LDX   #^L0E1676
            BCC   L011D3D
            INX
L011D3D     STX   L0F0038
            STA   L0F0036
            STZ   $EE
            BRA   L011D7B
L011D47     LDA   $EE
            PHA
            LDA   #$000E
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0020
            CLC
            ADC   $F0
            STA   $F0
            BCC   L011D6A
            INC   $F2
L011D6A     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L011D74
            INC   $F2
L011D74     LDA   #$0001
            STA   [$F0]
            INC   $EE
L011D7B     LDA   $EE
            SEC
            SBC   #$0004
            BVS   L011D86
            EOR   #$8000
L011D86     BPL   L011D47
            PEA   $0008
            JSL   L011FF5
            PLY
            PHA
            LDA   $FF
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $FF
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$001E
            LDA   [$F0],Y
            PHA
            LDA   $FF
            PLX
            STX   $F0
            SEC
            SBC   $F0
            CLC
            ADC   #$0001
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            PLA
            STA   [$F0]
            PEA   $0008
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$001E
            LDA   [$F0],Y
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            PLA
            LDY   #$0002
            STA   [$F0],Y
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   [$F0]
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            PLA
            LDY   #$0004
            STA   [$F0],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L011E4D     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E6
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001C
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            SEC
            SBC   #$0103
            PHA
            LDA   #$0005
            SEC
            JSL   L0D14B6
            PLY
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            CLC
            ADC   $F6
            STA   $F4
            PEA   $001E
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F2
            STZ   $F0
            BRL   L011F69
L011EC6     LDA   $F4
            STA   $EA
            LDA   $F2
            STA   $E8
            LDA   $F4
            CLC
            ADC   #$0046
            STA   $EE
            PEA   $0016
            JSL   L011FF5
            PLY
            PHA
            LDA   $F2
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $EC
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E8
            PHX
            PHA
            LDA   #L0E1821
            LDX   #^L0E1821
            PHX
            PHA
            PEA   $0082
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _NewControl
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F8
            LDA   #^L0E182E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L011F4A
            INC   $FA
L011F4A     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F8],Y
            PLA
            STA   [$F8]
            LDA   #$0040
            CLC
            ADC   $F6
            PHA
            LDA   $F4
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F4
            INC   $F0
L011F69     LDA   $F0
            SEC
            SBC   #$0004
            BVS   L011F74
            EOR   #$8000
L011F74     BMI   L011F79
            BRL   L011EC6
L011F79     LDA   #L0E3AD5
            LDX   #^L0E3AD5
            PHX
            PHA
            LDAL  L0E1830
            TAX
            LDAL  L0E182E
            PHX
            PHA
            _SetCtlTitle
            STA   L0F0779
            LDA   #L0E3ADD
            LDX   #^L0E3ADD
            PHX
            PHA
            LDAL  L0E1834
            TAX
            LDAL  L0E1832
            PHX
            PHA
            _SetCtlTitle
            STA   L0F0779
            LDA   #L0E3AE5
            LDX   #^L0E3AE5
            PHX
            PHA
            LDAL  L0E1838
            TAX
            LDAL  L0E1836
            PHX
            PHA
            _SetCtlTitle
            STA   L0F0779
            LDA   #L0E3AC3
            LDX   #^L0E3AC3
            PHX
            PHA
            LDAL  L0E183C
            TAX
            LDAL  L0E183A
            PHX
            PHA
            _SetCtlTitle
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L011FF5     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L012016     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F0006
            BNE   L01202A
            JSL   L012035
L01202A     STZ   L0F0006
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L012035     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDA   L0F0064
            BNE   L01204B
            JSL   L0729A0
            BRA   L01204E
L01204B     STZ   L0F0064
L01204E     LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _DrawControls
            STA   L0F0779
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L012074
            BRL   L0120FC
L012074     STZ   $F6
            BRA   L0120EC
L012078     LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F8
            LDA   #^L0E182E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L012091
            INC   $FA
L012091     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0008
            BCC   L0120B4
            INX
L0120B4     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            CLC
            ADC   #$0002
            STA   $F0
            LDA   $F4
            SEC
            SBC   #$0002
            STA   $F4
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            _FrameRect
            STA   L0F0779
            INC   $F6
L0120EC     LDA   $F6
            SEC
            SBC   #$0004
            BVS   L0120F7
            EOR   #$8000
L0120F7     BMI   L0120FC
            BRL   L012078
L0120FC     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L012111
            JSL   L07289D
L012111     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL


