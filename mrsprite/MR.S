*
* Mr Sprite
*
* (c) 1994, Once Product
* (s) 2025, Brutal Deluxe Software
*

	lst	off
	rel
	typ	S16
	dsk	MrSprite

	mx	%00
	xc
	xc

*----------------------------------- Macros

theY	=	$6f
theX	=	$71
theBUTTON	=	$73

GSOS	=	$e100a8

*---------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Scrap.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/TextEdit.Macs
	use	4/Util.Macs
	use	4/Window.Macs

*----------------------------------- Macros

            BRL   L0033
            DW    $7771
*            STR   'Mister Sprite 2.0 - (c) Once product - Nov 93'
            STR   'Mister Sprite 2.1 - (c) Once product & Brutal Deluxe Software - Aug 2025'
L0033       PHB
            PHD
            PHK
            PLB
            TDC
            STA   L2044
            SEP   #$20
            LDAL  $E1C034
            PHA
            AND   #$F0
            STAL  $E1C034
            PLA
            AND   #$0F
            STA   L206E
            REP   #$20
            _TLStartUp
            PEA   $0000
            _MMStartUp
            PLA
            STA   L2046
            ORA   #$0100
            STA   L2048
            PHA
            _GetCurResourceApp
            PLA
            STA   L2484
            PHA
            PHA
            LDA   L2048
            PHA
            PEA   $0000
            PEA   ^L2434
            PEA   L2434
            _StartUpTools
            PLA
            STA   L204E
            PLA
            STA   L2050
            _WaitCursor
            STZ   $33
            STZ   $35
            STZ   $37
            STZ   $39
            STZ   $01
            STZ   $03
            STZ   $05
            STZ   $79
            _CompactMem
            JSR   L1D79
            JSR   L1B8C
            JSR   L130C
            PHA
            _QDVersion
            PLA
            AND   #$0FFF
            CMP   #$0307
            BCS   L00D0
            BRL   L1C70
L00D0       PHA
            PHA
            _GetWMgrPort
            _SetPort
            PEA   $0000
            PEA   $0000
            _RefreshDesktop
            PHA
            PHA
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            _NewMenuBar2
            _SetSysBar
            PEA   $0000
            PEA   $0000
            _SetMenuBar
            PEA   $0001
            _FixAppleMenu
            PHA
            _FixMenuBar
            PLA
            _DrawMenuBar
            PEA   $00FA
            _DisableMItem
            PEA   $00FB
            _EnableMItem
            PEA   $00FC
            _EnableMItem
            PEA   $00FD
            _EnableMItem
            PEA   $00FE
            _DisableMItem
            PEA   $0102
            _EnableMItem
            PEA   $0103
            _EnableMItem
            PEA   $0104
            _DisableMItem
            PEA   $0105
            _DisableMItem
            PEA   $0106
            _DisableMItem
            PEA   $00FF
            _DisableMItem
            JSR   L1A17
            JSR   L064A
            _InitCursor
L01AE       BRL   L01C1
            DW    $7771
            STR   'MainEventLoop'
L01C1       PHA
            PHA
            _FrontWindow
            PLX
            PLY
            BNE   L01D1
            TXA
            BEQ   L01EA
L01D1       PHA
            PHY
            PHX
            _GetSysWFlag
            PLA
            BNE   L01F4
            PEA   $00FF
            _EnableMItem
            BRA   L01F4
L01EA       PEA   $00FF
            _DisableMItem
L01F4       LDA   #$7FFF
            STA   L241A
            LDA   #$001F
            STA   L241A+2
            PHA
            PEA   $0FFF
            PEA   ^L2406
            PEA   L2406
            _TaskMaster
            PLA
            BEQ   L01F4
            LDX   L0225
L0217       DEX
            DEX
            BMI   L01F4
            CMP   L0227,X
            BNE   L0217
            JSR   (L0237,X)
            BRA   L01AE
L0225       DW    $0010
L0227       DW    $0003
            DW    $0005
            DW    $0006
            DW    $0008
            DW    $0011
            DW    $0016
            DW    $0019
            DW    $0021
L0237       DA    L0247
            DA    L0247
            DA    L0273
            DA    L0274
            DA    L0275
            DA    L0354
            DA    L0275
            DA    L03C0
L0247       LDA   L2414
            BIT   #$0100
            BEQ   L0271
            LDA   L2408
            AND   #$007F
            CMP   #$0020
            BNE   L0271
            _HideCursor
            JSR   L12B1
            JSR   L1B64
            JSR   L12D9
            _ShowCursor
L0271       CLC
            RTS
L0273       RTS
L0274       RTS

L0275       _InitCursor
            LDA   L2416+2
            STA   L2404
            LDA   L2416
            SEC
            SBC   #$00FA
            ASL
            TAX
            JSR   (L029D,X)
            PEA   $0000
            LDA   L2404
            PHA
            _HiliteMenu
            RTS

L029D       DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L0354
            DA    L0465
            DA    L02EB
            DA    L064A
            DA    L0C57
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L0AD7
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L02EF
            DA    L181E
L02EB       PLA
            BRL   L02F1
L02EF       CLC
            RTS

L02F1       PEA   $0000
            LDA   L2050
            PHA
            LDA   L204E
            PHA
            _ShutDownTools
            LDA   L2484
            PHA
            _SetCurResourceApp
            JSL   GSOS
            DW    $2009       ; SetPrefix
            ADRL  L1E57
            LDA   L2048
            PHA
            _DisposeAll
            LDA   L2046
            PHA
            _MMShutDown
            _TLShutDown
            SEP   #$20
            LDAL  $E1C034
            AND   #$F0
            ORA   L206E
            STAL  $E1C034
            REP   #$20
            PLD
            PLB
            JSL   GSOS
            DW    $2029       ; Quit
            ADRL  L0352
L0352       DW    $0000       ; Parms for Quit
L0354       PHA
            PHA
            _FrontWindow
            JSL   L03F9
            CMP   #$FFFF
            BEQ   L03A2
            LDX   #$0000
            LDY   #$0003
L036C       CMP   L03B4,X
            BEQ   L037A
            INX
            INX
            INX
            INX
            DEY
            BNE   L036C
            BRA   L03A2
L037A       JSR   (L03B6,X)
            PHA
            PHA
            _FrontWindow
            JSL   L03F9
            CMP   #$FFFF
            BEQ   L03A3
            PHA
            PHA
            _FrontWindow
            _SetPort
            LDA   #$0000
L03A2       RTS

L03A3       PHA
            PHA
            _GetWMgrPort
            _SetPort
            RTS

L03B4       ASC   "Ma"
L03B6       DA    L0944
            ASC   "??"
            DA    L0BC5
            ASC   "Vi"
            DA    L1949
L03C0       LDA   L242C
            LDX   L03D3
L03C6       DEX
            DEX
            BMI   L03D2
            CMP   L03D5,X
            BNE   L03C6
            JMP   (L03E7,X)
L03D2       RTS

L03D3       DW    $0012
L03D5       DW    $0001
            DW    $0002
            DW    $0003
            DW    $0004
            DW    $0005
            DW    $0008
            DW    $0009
            DW    $000A
            DW    $0016
L03E7       DA    L1713
            DA    L1526
            DA    L13BF
            DA    L0F38
            DA    L104C
            DA    L09C7
            DA    L0994
            DA    L0954
            DA    L0BD9
L03F9       TSC
            SEC
            SBC   #$0012
            TCS
            PHD
            TCD
            LDA   #$FFFF
            STA   $07
            STZ   $09
            STZ   $0B
            STZ   $0D
            LDA   $16
            ORA   $18
            BNE   L0415
            BRL   L0452
L0415       LDA   $16
            LDX   $18
            PHA
            PHX
            PHA
            _GetSysWFlag
            PLA
            BNE   L0452
            LDA   $16
            LDX   $18
            PHA
            PHA
            PHX
            PHA
            _GetWRefCon
            PLA
            PLX
            STA   $0F
            STX   $11
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STA   $01
            STX   $03
            LDY   #$0006
            LDA   [$01],Y
            STA   $07
L0452       LDA   $14
            STA   $18
            LDA   $13
            STA   $17
            LDY   $07
            PLD
            TSC
            CLC
            ADC   #$0016
            TCS
            TYA
            RTL

L0465       PHA
            PHA
            _GetPort
            _WaitCursor
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF9
            PEA   $800E
            _NewWindow2
            BCC   L04A9
            PLA
            PLA
            BRL   L0505
L04A9       LDA   $01,S
            STA   L2554
            LDA   $03,S
            STA   L2556
            _SetPort
            LDX   L2554
            LDY   L2556
            JSR   L1A69
            LDA   L2556
            PHA
            LDA   L2554
            PHA
            _DrawControls
            _InitCursor
            LDA   #$0006
            STA   L241A
            LDA   #$0013
            STA   L241A+2
L04E5       PHA
            PEA   $0FFF
            PEA   ^L2406
            PEA   L2406
            _TaskMaster
            PLA
            CMP   #$0002
            BNE   L04E5
            LDX   L2554
            LDY   L2556
            JSR   L1A9F
L0505       _InitCursor
            _SetPort
            RTS

L0514       PHA
            PHA
            PHA
            PHA
            _GetMouseClamp
            PLA
            STA   L205C	; yMax
            PLA
            STA   L205A	; yMin
            PLA
            STA   L2058	; xMax
            PLA
            STA   L2056	; xMin
            PHA
            _GetMasterSCB
            PLA
            STA   L2672
            PHA
            PHA
            _GetPort
            PLA
            STA   L265E
            PLA
            STA   L265E+2
            PEA   ^L2662
            PEA   L2662
            _GetPortLoc
            PEA   ^L2674
            PEA   L2674
            _GetPortRect
            PEA   ^L267C
            PEA   L267C
            _GetBackPat
            PEA   ^L258C
            PEA   L258C
            _OpenPort
            PEA   ^L263E
            PEA   L263E
            _SetPortLoc
            PEA   ^L2636
            PEA   L2636
            _SetPortRect
            PEA   ^L258C
            PEA   L258C
            _SetPort
            PEA   $0000
            _SetMasterSCB
            PEA   $0000
            _SetSolidBackPat
            PEA   $000F
            _SetSolidPenPat
            PEA   $0002
            _SetPenMode
            PEA   $0001
            PEA   $0001
            _SetPenSize
            RTS

L05DD       LDA   L2056	; xMin
            PHA
            LDA   L2058	; xMax
            PHA
            LDA   L205A	; yMin
            PHA
            LDA   L205C	; yMax
            PHA
            _ClampMouse
            LDA   L265E+2
            PHA
            LDA   L265E
            PHA
            _SetPort
            PEA   ^L2662
            PEA   L2662
            _SetPortLoc
            PEA   ^L2674
            PEA   L2674
            _SetPortRect
            PEA   ^L267C
            PEA   L267C
            _SetBackPat
            LDA   L2672
            PHA
            _SetMasterSCB
            _PenNormal
            PEA   ^L258C
            PEA   L258C
            _ClosePort
            RTS

L064A       LDA   L2558
            ORA   L2558+2
            BEQ   L0671
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SelectWindow
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SetPort
            RTS

L0671       _WaitCursor
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   ^L2568
            PEA   L2568
            PEA   ^L0758
            PEA   L0758
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FFA
            PEA   $800E
            _NewWindow2
            BCC   L06AC
            PLA
            PLA
            BRL   L0750
L06AC       LDA   $01,S
            STA   L2558
            LDA   $03,S
            STA   L2558+2
            _SetPort
            PEA   ^L08A6
            PEA   L08A6
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SetInfoDraw
            LDX   $01
            LDA   L2492,X
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $000A
            _GetCtlHandleFromID
            _SetCtlValue
            LDX   $05
            LDA   L249E,X
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            _SetCtlValue
            LDX   $03
            LDA   L24A2,X
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0008
            _GetCtlHandleFromID
            _SetCtlValue
            STZ   L2052
            JSR   L0A6B
            JSR   L0A65
            LDX   L2558
            LDY   L2558+2
            JSR   L1A69
L0750       _InitCursor
            RTS

L0758       PHD
            PHB
            PHK
            PLB
            LDA   L2044
            TCD
            PHA
            PHA
            _GetPort
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SetPort
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _DrawControls
            JSR   L079D
            JSR   L0A71
            JSR   L0A93
            JSR   L0AB5
            _SetPort
            PLB
            PLD
            RTL

L079D       PHA
            PHA
            _GetPort
            PHA
            _GetFontFlags
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SetPort
            PEA   $0006
            _SetFontFlags
            SEC
            LDA   $39
            SBC   $35
            INC
            STA   $3B
            SEC
            LDA   $37
            SBC   $33
            INC
            STA   $3D
            LDA   $35
            PHA
            PEA   ^L26F6+3
            PEA   L26F6+3
            PEA   $0003
            PEA   $0000
            _Int2Dec
            LDA   $33
            PHA
            PEA   ^L26FC+3
            PEA   L26FC+3
            PEA   $0003
            PEA   $0000
            _Int2Dec
            LDA   $3B
            PHA
            PEA   ^L2702+3
            PEA   L2702+3
            PEA   $0003
            PEA   $0000
            _Int2Dec
            LDA   $3D
            PHA
            PEA   ^L2708+3
            PEA   L2708+3
            PEA   $0003
            PEA   $0000
            _Int2Dec
            PEA   $006A
            PEA   $0024
            _MoveTo
            PEA   ^L26F6
            PEA   L26F6
            _DrawString
            PEA   $006A
            PEA   $0038
            _MoveTo
            PEA   ^L26FC
            PEA   L26FC
            _DrawString
            PEA   $006A
            PEA   $0044
            _MoveTo
            PEA   ^L2702
            PEA   L2702
            _DrawString
            PEA   $006A
            PEA   $004C
            _MoveTo
            PEA   ^L2708
            PEA   L2708
            _DrawString
            _SetFontFlags
            _SetPort
            RTS

L08A6       PHD
            TSC
            TCD
            LDA   [$0E]
            STAL  L26AC
            LDY   #$0002
            LDA   [$0E],Y
            STAL  L26AE
            LDY   #$0004
            LDA   [$0E],Y
            STAL  L26B0
            LDY   #$0006
            LDA   [$0E],Y
            STAL  L26B2
            PEA   ^L26AC
            PEA   L26AC
            _EraseRect
            LDAL  L2052
            BEQ   L0932
            PHA
            PEA   ^L270E+$E
            PEA   L270E+$E
            PEA   $0005
            PEA   $0000
            _Int2Dec
            PEA   $0005
            _SetForeColor
            PHA
            PEA   ^L270E
            PEA   L270E
            _CStringWidth
            SEC
            LDAL  L26B2
            SBC   #$000A
            SBC   $01,S
            STA   $01,S
            CLC
            LDAL  L26AC
            ADC   #$0009
            PHA
            _MoveTo
            PEA   ^L270E
            PEA   L270E
            _DrawCString
L0932       PLY
            LDA   $02,S
            STA   $0E,S
            LDA   $00,S
            STA   $0C,S
            PLA
            PLA
            PLA
            PLA
            PLA
            PLA
            TYA
            TCD
            RTL

L0944       LDX   L2558
            LDY   L2558+2
            JSR   L1A9F
            STZ   L2558
            STZ   L2558+2
            RTS

L0954       PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $000A
            _GetCtlHandleFromID
            _GetCtlValue
            PLA
            LDX   #$000A
L0977       CMP   L2492,X
            BEQ   L0980
            DEX
            DEX
            BNE   L0977
L0980       LDY   #$0000
            CMP   #$010F
            BNE   L098B
            LDY   #$00FF
L098B       STY   $79
            CPX   $01
            STX   $01
            BNE   L09FA
            RTS

L0994       PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            _GetCtlValue
            PLA
            LDX   #$0002
L09B7       CMP   L249E,X
            BEQ   L09C0
            DEX
            DEX
            BNE   L09B7
L09C0       CPX   $05
            STX   $05
            BNE   L09FA
            RTS

L09C7       PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0008
            _GetCtlHandleFromID
            _GetCtlValue
            PLA
            LDX   #$0004
L09EA       CMP   L24A2,X
            BEQ   L09F3
            DEX
            DEX
            BNE   L09EA
L09F3       CPX   $03
            STX   $03
            BNE   L09FA
            RTS

L09FA       PHA
            PHA
            _GetPort
            PHA
            _GetFontFlags
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _SetPort
            PEA   $0006
            _SetFontFlags
            STZ   L2052
            JSR   L0A6B
            JSR   L0A65
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _DrawInfoBar
            JSR   L0A71
            JSR   L0A93
            JSR   L0AB5
            _SetFontFlags
            _SetPort
            RTS

L0A54       LDX   $03
            LDA   L0A5C,X
            STA   $7B
            RTS

L0A5C       DW    $0000
            DW    $00FF
            DW    $00FF
L0A62       STZ   $7D
            RTS

L0A65       LDA   #$00FF
            STA   $7B
            RTS

L0A6B       LDA   #$00FF
            STA   $7D
            RTS

L0A71       LDA   $79
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            _HiliteControl
            RTS

L0A93       LDA   $7B
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0002
            _GetCtlHandleFromID
            _HiliteControl
            RTS

L0AB5       LDA   $7D
            PHA
            PHA
            PHA
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0001
            _GetCtlHandleFromID
            _HiliteControl
            RTS

L0AD7       LDA   L255C
            ORA   L255C+2
            BEQ   L0AFE
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            _SelectWindow
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            _SetPort
            RTS

L0AFE       _WaitCursor
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   ^L2574
            PEA   L2574
            PEA   ^L0B90
            PEA   L0B90
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF7
            PEA   $800E
            _NewWindow2
            BCC   L0B38
            PLA
            PLA
            BRA   L0B88
L0B38       LDA   $01,S
            STA   L255C
            LDA   $03,S
            STA   L255C+2
            _SetPort
            STZ   $07
            LDA   L2558
            ORA   L2558+2
            BEQ   L0B7C
            LDX   $01
            LDA   L24A8,X
            STA   $07
            LDA   L24C2,X
            PHA
            PHA
            PHA
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            PEA   $0000
            PEA   $0016
            _GetCtlHandleFromID
            _SetCtlValue
L0B7C       JSR   L0C19
            LDX   L255C
            LDY   L255C+2
            JSR   L1A69
L0B88       _InitCursor
            RTS

L0B90       PHD
            PHB
            PHK
            PLB
            PHA
            PHA
            _GetPort
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            _SetPort
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            _DrawControls
            _SetPort
            PLB
            PLD
            RTL

L0BC5       LDX   L255C
            LDY   L255C+2
            JSR   L1A9F
            STZ   L255C
            STZ   L255C+2
            LDA   #$0000
            CLC
            RTS

L0BD9       PHA
            PHA
            PHA
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            PEA   $0000
            PEA   $0016
            _GetCtlHandleFromID
            _GetCtlValue
            PLA
            LDX   #$0000
            LDY   #$0000
L0BFF       CMP   L24B4,X
            BEQ   L0C0F
            INX
            INX
            INY
            CPY   #$0010
            BCC   L0BFF
            LDY   #$0000
L0C0F       CPY   $07
            BEQ   L0C18
            STY   $07
            JSR   L0C19
L0C18       RTS

L0C19       LDA   $07
            ASL
            ASL
            TAX
            PEA   $000D
            LDA   L2516,X
            PHA
            LDA   L2514,X
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHA
            PHA
            LDA   L255C+2
            PHA
            LDA   L255C
            PHA
            PEA   $0000
            PEA   $0015
            _GetCtlHandleFromID
            _TESetText
            RTS

L0C57       BRL   L0C6A
            DW    $7771
            STR   'Charger Image'
L0C6A       JSR   L1CCC
            LDA   L1E3B
            BNE   L0C73
            RTS

L0C73       _WaitCursor
            LDA   L1E3D
            CMP   #$00C1
            BEQ   L0C8F
            CMP   #$00C0
            BEQ   L0CE2
            _InitCursor
            RTS

L0C8F       LDA   L1E3F
            CMP   #$0001
            BEQ   L0CDA
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L1E0B
            BCS   L0CCE
            LDA   L1E0D
            STA   L1E19
            STA   L1E39
            LDA   #$8000
            STA   L1E1F
            LDA   #$0000
            STA   L1E1F+2
            LDA   #L38DE
            STA   L1E1B
            LDA   #^L38DE
            STA   L1E1B+2
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L1E17
L0CCE       PHP
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1E37
            PLP
L0CDA       _InitCursor
            RTS

L0CE2       STZ   $2F
            STZ   $31
            JSL   GSOS
            DW    $2006       ; GetFileInfo
            ADRL  L1DD7
            BCS   L0D33
            LDA   L1DFB
            STA   L1E1F
            LDA   L1DFB+2
            STA   L1E1F+2
            JSR   L1C20
            BCS   L0D33
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L1E0B
            BCS   L0D22
            LDA   L1E0D
            STA   L1E19
            STA   L1E39
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L1E17
L0D22       PHP
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1E37
            PLP
            BCS   L0D33
            JSR   L0D4E
L0D33       LDA   $2F
            ORA   $31
            BEQ   L0D46
            LDA   $31
            PHA
            LDA   $2F
            PHA
            _DisposeHandle
L0D46       _InitCursor
            RTS

L0D4E       BRL   L0D5F
            DW    $7771
            STR   'UnPackBytes'
L0D5F       LDA   L1E1B
            STA   $23
            LDA   L1E1B+2
            STA   $25
            LDA   L1E3F
            BEQ   L0D82
            CMP   #$0001
            BEQ   L0DA9
            CMP   #$0002
            BEQ   L0DB7
            CMP   #$8000
            BNE   L0D80
            BRL   L0E11
L0D80       SEC
            RTS

L0D82       LDA   #$0001
            LDX   #$0000
            LDY   #$7E00
            JSR   L0E5D
            LDA   #$7D00
            LDX   #$0222
            LDY   #$0000
            JSR   L0E38
            LDA   #$0000
            LDY   #$00C6
L0DA0       STA   LB5DE,Y
            DEY
            DEY
            BPL   L0DA0
            CLC
            RTS

L0DA9       LDA   #$8000
            LDX   #$0000
            LDY   #$0000
            JSR   L0E38
            CLC
            RTS

L0DB7       LDY   #$0009
            LDA   [$23],Y
            STA   L2072
            LDY   #$000D
            LDA   [$23],Y
            STA   L0F2E
            INY
            INY
            STY   L0F32
            ASL
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   L0F32
            TAY
            LDA   [$23],Y
            STA   L0F30
            INY
            INY
            STY   L0F34
            ASL
            ASL
            CLC
            ADC   L0F34
            STA   L0F36
            LDA   #$8000
            LDX   L0F36
            LDY   #$0000
            JSR   L0E38
            LDA   L0F30
            LDX   L0F34
            LDY   #$7D00
            JSR   L0EAD
            LDA   L0F2E
            BEQ   L0E0F
            LDX   L0F32
            LDY   #$7E00
            JSR   L0E5D
L0E0F       CLC
            RTS

L0E11       LDA   #$7D00
            LDX   #$0222
            LDY   #$0000
            JSR   L0E38
            LDA   #$8080
            LDY   #$00C6
L0E23       STA   LB5DE,Y
            DEY
            DEY
            BPL   L0E23
            LDY   #$001E
L0E2D       LDA   L26B4,Y
            STA   LB6DE,Y
            DEY
            DEY
            BPL   L0E2D
            RTS

L0E38       JSR   L0E85
            PHA
            LDA   L0F24
            PHA
            LDA   L0F22
            PHA
            LDA   L1E1F
            PHA
            PEA   ^L0F26
            PEA   L0F26
            PEA   ^L0F2A
            PEA   L0F2A
            _UnPackBytes
            PLA
            RTS

L0E5D       ASL
            ASL
            ASL
            ASL
            ASL
            JSR   L0E85
            LDA   L0F24
            PHA
            LDA   L0F22
            PHA
            LDA   L0F28
            PHA
            LDA   L0F26
            PHA
            LDA   L0F2C
            PHA
            LDA   L0F2A
            PHA
            _BlockMove
            RTS

L0E85       STA   L0F2A
            STZ   L0F2C
            CLC
            TXA
            CLC
            ADC   $23
            STA   L0F22
            LDA   #$0000
            ADC   $25
            STA   L0F24
            CLC
            TYA
            ADC   #L38DE
            STA   L0F26
            LDA   #$0000
            ADC   #^L38DE
            STA   L0F28
            RTS

L0EAD       LDA   #$00C8
            STA   L0F2A
            LDA   #$0000
            STA   L0F2C
            LDA   #L2074
            STA   L0F22
            LDA   #^L2074
            STA   L0F24
            TYA
            CLC
            ADC   #L38DE
            STA   L0F26
            LDA   #$0000
            ADC   #^L38DE
            STA   L0F28
            TXY
            LDX   #$0000
            SEP   #$20
L0EDC       INY
            INY
            LDA   [$23],Y
            AND   #$AF
            STA   L2074,X
            INY
            INY
            INX
            CPX   #$00C8
            BCS   L0F00
            CPX   L0F30
            BCC   L0EDC
            LDA   L2072
            AND   #$AF
L0EF7       STA   L2074,X
            INX
            CPX   #$00C8
            BCC   L0EF7
L0F00       REP   #$20
            LDA   L0F24
            PHA
            LDA   L0F22
            PHA
            LDA   L0F28
            PHA
            LDA   L0F26
            PHA
            LDA   L0F2C
            PHA
            LDA   L0F2A
            PHA
            _BlockMove
            RTS

L0F22       DB    $00
            DB    $00
L0F24       DB    $00
            DB    $00
L0F26       DB    $00
            DB    $00
L0F28       DB    $00
            DB    $00
L0F2A       DB    $00
            DB    $00
L0F2C       DB    $00
            DB    $00
L0F2E       DB    $00
            DB    $00
L0F30       DB    $00
            DB    $00
L0F32       DB    $00
            DB    $00
L0F34       DB    $00
            DB    $00
L0F36       DB    $00
            DB    $00
L0F38       BRL   L0F49
            DW    $7771
            STR   'Voir Sprite'
L0F49       _HideCursor
            LDA   #$0008
            STA   $69
            LDA   #L38DE
            STA   L2650
            LDA   #^L38DE
            STA   L2650+2
            JSR   L0514
            JSR   L12B1
L0F67       JSR   L0F82
            JSR   L1360
            JSR   GetMouseStatusAndPosition
            LDA   theBUTTON
            BEQ   L0F67
            JSR   L05DD
            JSR   L12D9
            _ShowCursor
            RTS

L0F82       PHA
            PHA
            PEA   $0002
            _GetAddress
            PLA
            STA   $6B
            PLA
            STA   $6D
            LDA   $69
            ASL
            ASL
            ASL
            TAY
            LDX   #$0000
L0F9D       LDA   L0FE4,Y
            PHY
            AND   #$00FF
            ASL
            ASL
            TAY
            LDA   [$6B],Y
            STA   L102C,X
            INX
            INX
            INY
            INY
            LDA   [$6B],Y
            STA   L102C,X
            INX
            INX
            PLY
            INY
            CPX   #$0020
            BCC   L0F9D
            PEA   ^L102C
            PEA   L102C
            _SetPenPat
            PEA   ^L269C
            PEA   L269C
            _FrameRect
            INC   $69
            LDA   $69
            CMP   #$0008
            BCC   L0FE3
            STZ   $69
L0FE3       RTS

L0FE4       DB    $42
            DB    $84
            DB    $09
            DB    $12
            DB    $24
            DB    $48
            DB    $90
            DB    $21
            DB    $21
            DB    $42
            DB    $84
            DB    $09
            DB    $12
            DB    $24
            DB    $48
            DB    $90
            DB    $90
            DB    $21
            DB    $42
            DB    $84
            DB    $09
            DB    $12
            DB    $24
            DB    $48
            DB    $48
            DB    $90
            DB    $21
            DB    $42
            DB    $84
            DB    $09
            DB    $12
            DB    $24
            DB    $24
            DB    $48
            DB    $90
            DB    $21
            DB    $42
            DB    $84
            DB    $09
            DB    $12
            DB    $12
            DB    $24
            DB    $48
            DB    $90
            DB    $21
            DB    $42
            DB    $84
            DB    $09
            DB    $09
            DB    $12
            DB    $24
            DB    $48
            DB    $90
            DB    $21
            DB    $42
            DB    $84
            DB    $84
            DB    $09
            DB    $12
            DB    $24
            DB    $48
            DB    $90
            DB    $21
            DB    $42
            DB    $7C
            DB    $F8
            DB    $F1
            DB    $E3
            DB    $C7
            DB    $8F
            DB    $1F
            DB    $3E
L102C       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L104C       BRL   L105E
            DW    $7771
            STR   'Definir Bloc'
L105E       _HideCursor
            STZ   $33
            STZ   $35
            STZ   $37
            STZ   $39
            LDA   #L38DE
            STA   L2650
            LDA   #^L38DE
            STA   L2650+2
            JSR   L0514
            JSR   L12B1
            JSR   GetMouseStatusAndPosition
*            LSR   theX	; x-coord
            JSR   PrintCursorPosition
            JSR   L1148
            JSR   L1167
L108D       JSR   GetMouseStatusAndPosition
*            LSR   theX
            JSR   L110D
            LDA   theBUTTON
            BEQ   L108D
            JSR   L114C
            JSR   L116B
            LDA   theX
            STA   $35
            STA   L269E
            LDA   theY
            STA   $33
            STA   L269C
            LDA   $35	; xMin
            PHA
            PEA   $027F	; xMax
            LDA   $33	; yMin
            PHA
            PEA   $00C7	; yMax
            _ClampMouse
            JSR   L11C5
L10C3       JSR   GetMouseStatusAndPosition
*            LSR   theX
            JSR   L1186
            LDA   theBUTTON
            BNE   L10C3
            PEA   ^L269C
            PEA   L269C
            _FrameRect
            PEA   ^L269C
            PEA   L269C
            _InvertRect
L10E9       JSR   GetMouseStatusAndPosition
*            LSR   theX
            LDA   theBUTTON
            BEQ   L10E9
            PEA   ^L269C
            PEA   L269C
            _InvertRect
            JSR   L05DD
            JSR   L12D9
            _ShowCursor
            RTS

L110D       LDA   theY
            CMP   $33
            BNE   L111A
            LDA   theX
            CMP   $35
            BNE   L111A
            RTS

L111A       JSR   L114C
            JSR   L116B
            PEA   ^L264E
            PEA   L264E
            PEA   ^L26A4
            PEA   L26A4
            LDA   L26A6
            PHA
            LDA   L26A4
            PHA
            PEA   $0000
            _PPToPort
            JSR   PrintCursorPosition
            JSR   L1148
            JSR   L1167
            RTS

L1148       LDA   theY
            STA   $33
L114C       PEA   $0000
            LDA   $33
            PHA
            _MoveTo
            PEA   $013F
            LDA   $33
            PHA
            _LineTo
            RTS

L1167       LDA   theX
            STA   $35
L116B       LDA   $35
            PHA
            PEA   $0000
            _MoveTo
            LDA   $35
            PHA
            PEA   $00C7
            _LineTo
            RTS

L1186       LDX   theX
            LDY   theY
            CPX   $39
            BNE   L1193
            CPY   $37
            BNE   L1193
            RTS

L1193       STX   $39
            STY   $37
            PEA   ^L269C
            PEA   L269C
            _FrameRect
            PEA   ^L264E
            PEA   L264E
            PEA   ^L26A4
            PEA   L26A4
            LDA   L26A6
            PHA
            LDA   L26A4
            PHA
            PEA   $0000
            _PPToPort
            JSR   PrintCursorPosition
L11C5       LDX   theX
            LDY   theY
            INX
            STX   L26A2
            INY
            STY   L26A0
            PEA   ^L269C
            PEA   L269C
            _FrameRect
            RTS

PrintCursorPosition
            LDA   theX	; X-coord
            PHA
            PEA   ^L26E6+3
            PEA   L26E6+3
            PEA   $0003
            PEA   $0000
            _Int2Dec
            LDA   theY	; Y-coord
            PHA
            PEA   ^L26E6+$B
            PEA   L26E6+$B
            PEA   $0003
            PEA   $0000
            _Int2Dec
            PHA
            PEA   ^L26E6
            PEA   L26E6
            _CStringWidth
            PLA
            STA   L26AA
            STZ   L26A6
            LDA   theX
            CMP   #$00A0
            BCS   L1237
            SEC
            LDA   #$0140
            SBC   L26AA
            STA   L26A6
            LDA   #$0140
            STA   L26AA
L1237       LDA   L26A6
            PHA
            PEA   $0009
            _MoveTo
            PEA   ^L26E6
            PEA   L26E6
            _DrawCString
            RTS

L1253       TSC
            PHD
            TCD
            LDA   [$07]
            STA   [$03]
            INC   $07
            INC   $07
            INC   $03
            AND   #$00FF
            DEC
            TAX
            LDY   #$0000
            SEP   #$20
L126A       LDA   [$07],Y
            STA   [$03],Y
            INY
            DEX
            BPL   L126A
            LDA   #$00
            STA   [$03],Y
            REP   #$20
            PLD
            LDA   $01,S
            STA   $09,S
            PLA
            PLA
            PLA
            PLA
            RTS

L1282       TSC
            PHD
            TCD
            LDA   [$07]
            AND   #$00FF
            STA   [$03]
            INC   $07
            INC   $03
            INC   $03
            DEC
            TAX
            LDY   #$0000
            SEP   #$20
L1299       LDA   [$07],Y
            STA   [$03],Y
            INY
            DEX
            BPL   L1299
            LDA   #$00
            STA   [$03],Y
            REP   #$20
            PLD
            LDA   $01,S
            STA   $09,S
            PLA
            PLA
            PLA
            PLA
            RTS

L12B1       _GrafOff
            PEA   ^L38DE
            PEA   L38DE
            PEA   $00E1
            PEA   $2000
            PEA   $0000
            PEA   $8000
            _BlockMove
            _GrafOn
            RTS

L12D9       PEA   $0000
            _ClearScreen
            JSR   L1326
            PEA   $0000
            PEA   $0000
            _RefreshDesktop
            _DrawMenuBar
            PEA   $0000
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L130C       PEA   $00E1
            PEA   $9D00
            PEA   ^L213C
            PEA   L213C
            PEA   $0000
            PEA   $02C8
            _BlockMove
            RTS

L1326       PEA   ^L213C
            PEA   L213C
            PEA   $00E1
            PEA   $9D00
            PEA   $0000
            PEA   $02C8
            _BlockMove
            RTS

L1340       LDY   #$7D00
L1343       LDA   L38DE,Y
            STA   [$1F],Y
            INY
            INY
            CPY   #$8000
            BCC   L1343
            RTS

L1350       PHA
            PEA   $FFFF
            PEA   $0000
            _FlushEvents
            PLA
            RTS

L1360       PHA
            PEA   $0000
            PEA   $0020
            _WaitUntil
            PLA
            RTS

L1370       SEP   #$20
L1372       LDAL  $E1C019
            BPL   L1372
L1378       LDAL  $E1C019
            BMI   L1378
            REP   #$20
            RTS

L1381       SEP   #$20
            LDAL  $E1C034
            AND   #$F0
            ORA   #$0D
            STAL  $E1C034
            REP   #$20
            RTS

L1392       SEP   #$20
            LDAL  $E1C034
            AND   #$F0
            STAL  $E1C034
            REP   #$20
            RTS

L13A1       SEP   #$20
            LDAL  $E1C035
            STA   L2070
            AND   #$F7
            STAL  $E1C035
            REP   #$20
            RTS

L13B3       SEP   #$20
            LDA   L2070
            STAL  $E1C035
            REP   #$20
            RTS

L13BF       BRL   L13CD
            DW    $7771
            STR   'Creation'
L13CD       STZ   $77
            STZ   $59
            STZ   $63
            STZ   $65
            STZ   $67
            JSR   L147C
            BCS   L143D
            JSR   L28C5
            _HideCursor
            LDA   #$2000
            STA   $1F
            LDA   #$00E1
            STA   $21
            LDA   #L38DE
            STA   L2650
            LDA   #^L38DE
            STA   L2650+2
            JSR   L0514
            PEA   $0000
            _ClearScreen
            JSR   L1340
            LDX   $01
            JSR   (L1470,X)
            JSR   L05DD
            JSR   L12D9
            _ShowCursor
            LDA   $77
            BNE   L143E
            LDA   $59
            STA   L2052
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _DrawInfoBar
            JSR   L0A54
            JSR   L0A62
            CLC
L143D       RTS

L143E       PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0003
            _AlertWindow
            PLA
            STZ   L2052
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            _DrawInfoBar
            JSR   L0A65
            JSR   L0A6B
            SEC
            RTS

L1470       DA    L2762
            DA    L27D0
            DA    L27F1
            DA    L2AD1
            DA    L326A
            DA    L2E6A
L147C       LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0006
            PEA   ^L1E83
            PEA   L1E83
            _GetLETextByID
            PEA   ^L1E83
            PEA   L1E83
            PEA   ^L1EAD
            PEA   L1EAD
            JSR   L1282
            JSL   GSOS
            DW    $2007       ; JudgeName
            ADRL  L1DA7
            LDA   L1DB7
            AND   #$E000
            BEQ   L1516
            LDA   L1DAD
            STA   L1522
            LDA   L1DAD+2
            STA   L1524
            LDA   L1EAD
            XBA
            STA   L1EAD
            PHA
            PEA   $0005
            PEA   ^L151A
            PEA   L151A
            PEA   $0000
            PEA   $0004
            _AlertWindow
            LDA   L1EAD
            XBA
            STA   L1EAD
            PLA
            BEQ   L1518
            PEA   ^L1EAD
            PEA   L1EAD
            PEA   ^L1E83
            PEA   L1E83
            JSR   L1253
            LDA   L2558+2
            PHA
            LDA   L2558
            PHA
            PEA   $0000
            PEA   $0006
            PEA   ^L1E83
            PEA   L1E83
            _SetLETextByID
L1516       CLC
            RTS

L1518       SEC
            RTS

L151A       ADRL  L1E83
            ADRL  L1EAE
L1522       DB    $00
            DB    $00
L1524       DB    $00
            DB    $00
L1526       BRL   L1530
            DW    $7771
            STR   'Test'
L1530       LDA   L2052
            BEQ   L1567
            _HideCursor
            JSR   L1B05
            JSR   L0514
            PEA   $0000
            _ClearScreen
            JSR   L1340
            LDX   $01
            JSR   (L1568,X)
            JSR   L1392
            JSR   L05DD
            JSR   L12D9
            JSR   L1B12
            _ShowCursor
L1567       RTS

L1568       DA    L1574
            DA    L15A6
            DA    L15A8
            DA    L15DA
            DA    L160E
            DA    L1646
L1574       LDA   #$2000
            STA   $5F
            LDA   #$00E1
            STA   $61
            JSR   L167E
L1581       JSR   L16E9
            JSR   L1370
            JSR   L1381
            LDA   $29
            PHA
            LDA   $27
            PHA
            LDA   $61
            PHA
            LDA   $5F
            PHA
            JSL   L2780
            JSR   L1392
            LDA   theBUTTON
            BEQ   L1581
            LDA   #$0000
            CLC
            RTS

L15A6       BRA   L1574
L15A8       LDA   #$2000
            STA   $5F
            LDA   #$00E1
            STA   $61
            JSR   L167E
L15B5       JSR   L16E9
            JSR   L1370
            JSR   L1381
            LDA   $29
            PHA
            LDA   $27
            PHA
            LDA   $61
            PHA
            LDA   $5F
            PHA
            JSL   L281B
            JSR   L1392
            LDA   theBUTTON
            BEQ   L15B5
            LDA   #$0000
            CLC
            RTS

L15DA       LDA   #$2000
            STA   $5F
            LDA   #$00E1
            STA   $61
            LDA   $28
            STA   L15FE+2
            LDA   $27
            STA   L15FE+1
            JSR   L167E
L15F1       JSR   L16E9
            JSR   L1370
            JSR   L1381
            LDY   $5F
            LDA   $61
L15FE       JSL   L15FE
            JSR   L1392
            LDA   theBUTTON
            BEQ   L15F1
            LDA   #$0000
            CLC
            RTS

L160E       LDA   #$2000
            STA   $5F
            LDA   #$00E1
            STA   $61
            LDA   $28
            STA   L1633+2
            LDA   $27
            STA   L1633+1
            JSR   L13A1
            JSR   L167E
L1628       JSR   L16E9
            JSR   L1370
            JSR   L1381
            LDY   $5F
L1633       JSL   L1633
            JSR   L1392
            LDA   theBUTTON
            BEQ   L1628
            JSR   L13B3
            LDA   #$0000
            CLC
            RTS

L1646       LDA   #$2000
            STA   $5F
            LDA   #$00E1
            STA   $61
            JSR   L167E
L1653       JSR   L16E9
            JSR   L1370
            JSR   L1381
            LDA   $29
            PHA
            LDA   $27
            PHA
            LDA   $61
            PHA
            LDA   $5F
            PHA
            LDA   theX
            AND   #$0001
            PHA
            JSL   L3163
            JSR   L1392
            LDA   theBUTTON
            BEQ   L1653
            LDA   #$0000
            CLC
            RTS

L167E       LDY   #$0004
            LDA   [$27],Y
            STA   L205E
            SEC
            LDA   #$0140
            SBC   L205E
            STA   L2060
            LDY   #$0002
            LDA   [$27],Y
            LSR
            STA   L2062
            LDA   #$0000
            ROL
            EOR   #$0001
            LSR
            LDA   #$00C8
            SBC   L2062
            STA   L2064
            LDA   L205E
            PHA
            LDA   L2060
            PHA
            LDA   L2062
            PHA
            LDA   L2064
            PHA
            _ClampMouse
            SEC
            LDA   L2060
            SBC   L205E
            LSR
            ADC   L205E
            TAX
            SEC
            LDA   L2064
            SBC   L2062
            LSR
            ADC   L2062
            TAY
            LDA   #$0000
            PHA
            PHA
            PHX
            PHY
            PHA
            _FakeMouse
            RTS

L16E9       JSR   GetMouseStatusAndPosition
            SEC
            LDA   theX
            SBC   L205E
            LSR
            PHA
            SEC
            LDA   theY
            SBC   L2062
            PHA
            PHA
            PHA
            PEA   $00A0
            _Multiply
            PLA
            PLX
            CLC
            ADC   $01,S
            ADC   #$2000
            STA   $5F
            PLA
            RTS

L1713       BRL   L1726
            DW    $7771
            STR   'Sauver sprite'
L1726       JSR   L1D50
            LDA   L1E3B
            BNE   L172F
            RTS

L172F       PHA
            PHA
            _GetPort
            _WaitCursor
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF8
            PEA   $800E
            _NewWindow2
            BCC   L1773
            PLA
            PLA
            BRL   L1809
L1773       LDA   $01,S
            STA   L2564
            LDA   $03,S
            STA   L2566
            _SetPort
            LDA   L2566
            PHA
            LDA   L2564
            PHA
            _DrawControls
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L1DB9
            BCC   L17A4
            CMP   #$0046
            BNE   L17FA
L17A4       LDX   $03
            LDA   L1818,X
            STA   L1DC7
            STZ   L1DC9
            STZ   L1DC9+2
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L1DBF
            BCS   L17FA
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L1E0B
            BCS   L17FA
            LDA   L1E0D
            STA   L1E29
            STA   L1E39
            LDA   $27
            STA   L1E2B
            LDA   $29
            STA   L1E2B+2
            LDA   L2052
            STA   L1E2F
            STZ   L1E2F+2
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L1E27
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1E37
L17FA       LDA   L2566
            PHA
            LDA   L2564
            PHA
            _CloseWindow
L1809       _InitCursor
            _SetPort
            RTS

L1818       DW    $0006
            DW    $0004
            DW    $00B0
L181E       BRL   L182F
            DW    $7771
            STR   'Voir source'
L182F       LDA   L2560
            ORA   L2562
            BEQ   L1856
            LDA   L2562
            PHA
            LDA   L2560
            PHA
            _SelectWindow
            LDA   L2562
            PHA
            LDA   L2560
            PHA
            _SetPort
            RTS

L1856       JSR   L1D0A
            LDA   L1E3B
            BNE   L185F
            RTS

L185F       _WaitCursor
            JSR   L19EF
            STZ   $2B
            STZ   $2D
            JSR   L1959
            BCS   L18C2
            PHA
            PHA
            PEA   ^L1E6F
            PEA   L1E6F
            PEA   ^L2580
            PEA   L2580
            PEA   ^L18DD
            PEA   L18DD
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF6
            PEA   $800E
            _NewWindow2
            BCC   L18A5
            PLA
            PLA
            BRA   L18C2
L18A5       LDA   $01,S
            STA   L2560
            LDA   $03,S
            STA   L2562
            _SetPort
            JSR   L1912
            LDX   L2560
            LDY   L2562
            JSR   L1A69
L18C2       LDA   $2B
            ORA   $2D
            BEQ   L18D5
            LDA   $2D
            PHA
            LDA   $2B
            PHA
            _DisposeHandle
L18D5       _InitCursor
            RTS

L18DD       PHD
            PHB
            PHK
            PLB
            PHA
            PHA
            _GetPort
            LDA   L2562
            PHA
            LDA   L2560
            PHA
            _SetPort
            LDA   L2562
            PHA
            LDA   L2560
            PHA
            _DrawControls
            _SetPort
            PLB
            PLD
            RTL

L1912       PEA   $000D
            LDA   $2D
            PHA
            LDA   $2B
            PHA
            LDA   $02
            PHA
            LDA   $00
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHA
            PHA
            LDA   L2562
            PHA
            LDA   L2560
            PHA
            PEA   $0000
            PEA   $0017
            _GetCtlHandleFromID
            _TESetText
            RTS

L1949       LDX   L2560
            LDY   L2562
            JSR   L1A9F
            STZ   L2560
            STZ   L2562
            RTS

L1959       BRL   L196D
            DW    $7771
            STR   'Charger source'
L196D       JSL   GSOS
            DW    $2006       ; GetFileInfo
            ADRL  L1DD7
            BCS   L19C3
            LDA   L1DFB
            STA   L1E1F
            LDA   L1DFB+2
            STA   L1E1F+2
            JSR   L1BD1
            BCS   L19C3
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L1E0B
            BCS   L19A9
            LDA   L1E0D
            STA   L1E19
            STA   L1E39
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L1E17
L19A9       PHP
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1E37
            PLP
            BCS   L19C3
            LDA   L1E3D
            CMP   #$0004
            BNE   L19C2
            JSR   L19C4
L19C2       CLC
L19C3       RTS

L19C4       LDA   L1E1B
            STA   $09
            LDA   L1E1B+2
            STA   $0B
            LDX   L1E1F
            LDY   L1E1F+2
            SEP   #$20
L19D6       LDA   [$09]
            AND   #$7F
            STA   [$09]
            INC   $09
            BNE   L19E6
            INC   $0A
            BNE   L19E6
            INC   $0B
L19E6       DEX
            BNE   L19D6
            DEY
            BPL   L19D6
            REP   #$20
            RTS

L19EF       LDA   L1EDF
            AND   #$000F
            TAX
            LDY   #$0001
            SEP   #$20
            LDA   #$20
            STA   L1E6F,Y
L1A00       INY
            LDA   L1EDF,Y
            STA   L1E6F,Y
            DEX
            BNE   L1A00
            INY
            LDA   #$20
            STA   L1E6F,Y
            TYA
            STA   L1E6F
            REP   #$20
            RTS

L1A17       LDA   #$0000
L1A1A       STA   $09
            ASL
            ASL
            TAX
            STX   $0B
            PHA
            PHA
            PEA   $8016
            LDA   L24D4+2,X
            PHA
            LDA   L24D4,X
            PHA
            _LoadResource
            LDX   $0B
            PLA
            STA   $0D
            STA   L2514,X
            PLA
            STA   $0F
            STA   L2516,X
            LDY   #$0004
            LDA   [$0D],Y
            ORA   #$C000
            STA   [$0D],Y
            PEA   $8016
            LDA   L24D4+2,X
            PHA
            LDA   L24D4,X
            PHA
            _DetachResource
            LDA   $09
            INC
            CMP   #$0010
            BCC   L1A1A
            CLC
            RTS

L1A69       BRL   L1A79
            DW    $7771
            STR   'ShowWindow'
L1A79       PHY
            PHX
            JSR   L1AD6
            PEA   $8000
            PEA   $0000
            PEA   ^L26D4
            PEA   L26D4
            PEA   ^L26DE
            PEA   L26DE
            _WhooshRect
            _ShowWindow
            RTS

L1A9F       BRL   L1AB0
            DW    $7771
            STR   'CloseWindow'
L1AB0       PHY
            PHX
            JSR   L1AD6
            _CloseWindow
            PEA   $0000
            PEA   $0000
            PEA   ^L26D4
            PEA   L26D4
            PEA   ^L26DE
            PEA   L26DE
            _WhooshRect
            RTS

L1AD6       BRL   L1AE6
            DW    $7771
            STR   'SetBigRect'
L1AE6       PHA
            PHA
            PHY
            PHX
            _GetStructRgn
            PEA   ^L26DC
            PEA   L26DC
            PEA   $0000
            PEA   $000A
            _HandToPtr
            RTS

L1B05       LDA   L2410
            STA   L2068
            LDA   L2412
            STA   L2066
            RTS

L1B12       PEA   $0000
            PEA   $0000
            LDA   L2066
            PHA
            LDA   L2068
            PHA
            PEA   $0000
            _FakeMouse
            RTS

GetMouseStatusAndPosition
            STZ   theBUTTON
            PHA
            PHA
            PHA
            _ReadMouse
            PLA
            BPL   L1B3C
            DEC   theBUTTON
L1B3C       PLA
            STA   theY
            PLA
            STA   theX
            RTS

L1B43       PEA   $0000
            PEA   $0000
            _Button
            PLA
            BEQ   L1B43
L1B53       PEA   $0000
            PEA   $0000
            _Button
            PLA
            BNE   L1B53
            RTS

L1B64       PHA
            PEA   $0028
            PEA   ^L2406
            PEA   L2406
            _GetNextEvent
            PLA
            BEQ   L1B64
            LDA   L2408
            AND   #$007F
            CMP   #$0020
            BNE   L1B64
            LDA   L2414
            BIT   #$0100
            BEQ   L1B64
            RTS

L1B8C       BRL   L1B9E
            DW    $7771
            STR   'Alloc sprite'
L1B9E       PHA
            PHA
            PEA   $0001
            PEA   $0000
            LDA   L2048
            PHA
            PEA   $C010
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   $09
            PLA
            STA   $0B
            BCC   L1BC5
            BRL   L1C92
L1BC5       LDY   #$0002
            LDA   [$09]
            STA   $27
            LDA   [$09],Y
            STA   $29
            RTS

L1BD1       BRL   L1BE3
            DW    $7771
            STR   'Alloc source'
L1BE3       SEC
            LDA   L1E1F
            ORA   L1E1F+2
            BEQ   L1C1F
            PHA
            PHA
            LDA   L1E1F+2
            PHA
            LDA   L1E1F
            PHA
            LDA   L2048
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLY
            BCS   L1C1F
            STX   $2B
            STY   $2D
            LDY   #$0002
            LDA   [$2B]
            STA   L1E1B
            LDA   [$2B],Y
            STA   L1E1B+2
L1C1F       RTS

L1C20       BRL   L1C33
            DW    $7771
            STR   'Alloc picture'
L1C33       SEC
            LDA   L1E1F
            ORA   L1E1F+2
            BEQ   L1C6F
            PHA
            PHA
            LDA   L1E1F+2
            PHA
            LDA   L1E1F
            PHA
            LDA   L2048
            PHA
            PEA   $C004
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLY
            BCS   L1C6F
            STX   $2F
            STY   $31
            LDY   #$0002
            LDA   [$2F]
            STA   L1E1B
            LDA   [$2F],Y
            STA   L1E1B+2
L1C6F       RTS

L1C70       _InitCursor
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            _AlertWindow
            PLA
            BRL   L02F1
L1C92       _InitCursor
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            _AlertWindow
            PLA
            BRL   L02F1
            PHA
            TAX
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHX
            _ErrorWindow
            PLA
            PLA
            SEC
            RTS

L1CCC       JSR   L1350
            PEA   $0078
            PEA   $001E
            PEA   $0000
            PEA   ^L2728
            PEA   L2728
            PEA   $0000
            PEA   $0000
            PEA   ^L1CF8
            PEA   L1CF8
            PEA   ^L1E3B
            PEA   L1E3B
            _SFGetFile2
            RTS

L1CF8       DB    $02
            DB    $00
            DB    $00
            DB    $80
            DB    $C0
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $C1
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1D0A       JSR   L1350
            PEA   $0078
            PEA   $001E
            PEA   $0000
            PEA   ^L274B
            PEA   L274B
            PEA   $0000
            PEA   $0000
            PEA   ^L1D36
            PEA   L1D36
            PEA   ^L1E3B
            PEA   L1E3B
            _SFGetFile2
            RTS

L1D36       DB    $03
            DB    $00
            DB    $00
            DB    $80
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $00
            DB    $45
            DB    $54
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $B0
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1D50       JSR   L1350
            PEA   $008C
            PEA   $001E
            PEA   $0000
            PEA   ^L2740
            PEA   L2740
            PEA   $0000
            PEA   ^L1EAD
            PEA   L1EAD
            PEA   ^L1E3B
            PEA   L1E3B
            _SFPutFile2
            RTS

L1D79       BRL   L1D88
            DW    $7771
            STR   'SetPrefix'
L1D88       JSL   GSOS
            DW    $200A       ; GetPrefix
            ADRL  L1E4F
            JSL   GSOS
            DW    $200A       ; GetPrefix
            ADRL  L1E5F
            JSL   GSOS
            DW    $2009       ; SetPrefix
            ADRL  L1E67
            RTS

L1DA7       DW    $0006       ; Parms for JudgeName
            DW    $0001       ;  file system
            DW    $0000       ;  name type
L1DAD       ADRL  $00000000   ;  syntax
            DW    $0000       ;  max len
            ADRL  L1EAB       ;  name buffer
L1DB7       DW    $0000       ;  flags
L1DB9       DW    $0001       ; Parms for Destroy
            ADRL  L1EFF       ;  file name
L1DBF       DW    $0005       ; Parms for Create
            ADRL  L1EFF       ;  file name
            DW    $00E3       ;  access
L1DC7       DW    $0000       ;  file type
L1DC9       ADRL  $00000000   ;  aux type
            DW    $0001       ;  storage
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1DD7       DW    $000C       ; Parms for GetFileInfo
            ADRL  L1EFF       ;  file name
            DW    $0000       ;  access
            DW    $0000       ;  file type
            ADRL  $00000000   ;  aux type
            DW    $0000       ;  storage
            DS    8           ;  creation date
            DS    8           ;  modification date
            ADRL  $00000000   ;  option list
L1DFB       ADRL  $00000000   ;  end of file
            ADRL  $00000000   ;  blocks used
            ADRL  $00000000   ;  resource eof
            ADRL  $00000000   ;  resource blocks
L1E0B       DW    $0004       ; Parms for Open
L1E0D       DW    $0000       ;  ref num
            ADRL  L1EFF       ;  path name
            DW    $0000       ;  req access
            DW    $0000       ;  res num
L1E17       DW    $0004       ; Parms for Read
L1E19       DW    $0000       ;  ref num
L1E1B       ADRL  $00000000   ;  buffer ptr
L1E1F       ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
L1E27       DW    $0004       ; Parms for Write
L1E29       DW    $0000       ;  ref num
L1E2B       ADRL  $00000000   ;  buffer ptr
L1E2F       ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
L1E37       DW    $0001       ; Parms for Close
L1E39       DW    $0000       ;  ref num
L1E3B       DB    $00
            DB    $00
L1E3D       DB    $00
            DB    $00
L1E3F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ADRL  L1EDD
            DW    $0000
            ADRL  L1EFD
L1E4F       DW    $0002       ; Parms for GetPrefix
            DW    $0000       ;  prefix num
            ADRL  L1FFC       ;  prefix ptr
L1E57       DW    $0002       ; Parms for SetPrefix
            DW    $0000       ;  prefix num
            ADRL  L1FFE       ;  prefix ptr
L1E5F       DW    $0002       ; Parms for GetPrefix
            DW    $0009       ;  prefix num
            ADRL  L1EFD       ;  prefix ptr
L1E67       DW    $0002       ; Parms for SetPrefix
            DW    $0008       ;  prefix num
            ADRL  L1EFF       ;  prefix ptr
L1E6F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E83       DB    $00
L1E84       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1E98       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1EAB       DB    $32
            DB    $00
L1EAD       DB    $00
L1EAE       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1EDD       DB    $20
            DB    $00
L1EDF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1EFD       DB    $FF
            DB    $00
L1EFF       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1FFC       DB    $48
            DB    $00
L1FFE       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2044       DB    $00
            DB    $00
L2046       DB    $00
            DB    $00
L2048       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L204E       DB    $00
            DB    $00
L2050       DB    $00
            DB    $00
L2052       DB    $00
            DB    $00
            DB    $00
            DB    $00
L2056       DW    $0000
L2058       DW    $0000
L205A       DW    $0000
L205C       DW    $0000
L205E       DW    $0000
L2060       DW    $0000
L2062       DW    $0000
L2064       DW    $0000
L2066       DB    $00
            DB    $00
L2068       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L206E       DB    $00
            DB    $00
L2070       DB    $00
            DB    $00
L2072       DB    $00
            DB    $00
L2074       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L213C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2404       DB    $00
            DB    $00
L2406       DW    $0000       ; event code
L2408       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
L2410       DW    $0000       ; mouse location
L2412       DW    $0000
L2414       DW    $0000       ; modifiers
L2416       ADRL  $00000000   ; task data
L241A       ADRL  $00000000   ; task mask
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L242C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2434       DW    $0000
            DW    $C080
            DW    $0000
            ADRL  $00000000
            DW    $0011       ; number of tools
            DW    $0003       ; misc tool set
            DW    $0300
            DW    $0004       ; quickdraw II
            DW    $0301
            DW    $0005       ; desk manager
            DW    $0302
            DW    $0006       ; event manager
            DW    $0300
            DW    $000B       ; int math tool set
            DW    $0200
            DW    $000E       ; window manager
            DW    $0301
            DW    $000F       ; menu manager
            DW    $0301
            DW    $0010       ; control manager
            DW    $0301
            DW    $0012       ; quickdraw II aux
            DW    $0301
            DW    $0014       ; lineedit tool set
            DW    $0301
            DW    $0015       ; dialog manager
            DW    $0301
            DW    $0016       ; scrap manager
            DW    $0300
            DW    $0017       ; std file tool set
            DW    $0301
            DW    $001B       ; font manager
            DW    $0301
            DW    $001C       ; list manager
            DW    $0301
            DW    $001E
            DW    $0100
            DW    $0022
            DW    $0101
L2484       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2492       DW    $00F7
            DW    $010B
            DW    $010C
            DW    $010D
            DW    $010E
            DW    $010F
L249E       DW    $00F8
            DW    $010A
L24A2       DW    $00F9
            DW    $0108
            DW    $0109
L24A8       DW    $0007
            DW    $0008
            DW    $0009
            DW    $000A
            DW    $000B
            DW    $000C
L24B4       DW    $00F6
            DW    $0110
            DW    $0111
            DW    $0112
            DW    $0113
            DW    $0114
            DW    $0115
L24C2       DW    $0116
            DW    $0117
            DW    $0118
            DW    $0119
            DW    $011A
            DW    $011B
            DW    $011C
            DW    $011D
            DW    $011E
L24D4       ADRL  $00000005
            ADRL  $00000006
            ADRL  $00000007
            ADRL  $00000008
            ADRL  $00000009
            ADRL  $0000000A
            ADRL  $0000000B
            ADRL  $0000000C
            ADRL  $0000000D
            ADRL  $0000000E
            ADRL  $0000000F
            ADRL  $00000010
            ADRL  $00000011
            ADRL  $00000012
            ADRL  $00000013
            ADRL  $00000014
L2514       DB    $00
            DB    $00
L2516       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2554       DB    $00
            DB    $00
L2556       DB    $00
            DB    $00
L2558       ADRL  $00000000
L255C       ADRL  $00000000
L2560       DB    $00
            DB    $00
L2562       DB    $00
            DB    $00
L2564       DB    $00
            DB    $00
L2566       DB    $00
            DB    $00
L2568       ADRL  L256C
L256C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $CD
            DB    $E1
L2574       ADRL  L2578
L2578       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $BF
            DB    $BF
L2580       ADRL  L2584
L2584       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $D6
            DB    $E9
L258C       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
            DW    $0000
            DW    $0000
            DW    $00C8
            DW    $0140
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2636       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $C8
            DB    $00
            DB    $40
            DB    $01
L263E       DW    $0000       ; SCB byte
            ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L264E       DW    $0000       ; SCB byte
L2650       ADRL  $00E12000   ; Pointer to pixel image
            DW    $00A0       ; Width
            DW    $0000       ; Bounds rect
            DW    $0000
            DW    $00C8
            DW    $0140
L265E       ADRL  $00000000
L2662       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L2672       DW    $0000
L2674       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L267C       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L269C       DW    $0000
L269E       DW    $0000
L26A0       DW    $0000
L26A2       DW    $0000
L26A4       DW    $0002
L26A6       DW    $0000
            DW    $000A
L26AA       DW    $013F
L26AC       DW    $0000
L26AE       DW    $0000
L26B0       DW    $0000
L26B2       DW    $0000
L26B4       HEX   0000000FF000FF0F00000F00F00FFF0F
            HEX   0000000FF000FF0F00000F00F00FFF0F
L26D4       DW    $000E
            DW    $000E
            DW    $000F
            DW    $000F
L26DC       DW    $0000
L26DE       DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L26E6       ASC   ' X=000 / Y=000 '00
L26F6       STR   'X:123'
L26FC       STR   'Y:123'
L2702       STR   'W:123'
L2708       STR   'H:123'
L270E       ASC   'File length : 65536 bytes'00
L2728       STR   'Select picture to load:'
L2740       STR   'Save as...'
L274B       STR   'Select source to view:'
L2762       BRL   L276F
            DW    $7771
            STR   'BlkData'
L276F       JSR   L36D9
            LDA   #$AB01
            JSR   L290B
            JSR   L297F
            STZ   $75
            BRL   L2889
L2780       SEI
            TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            INC   $12
            INC   $12
            LDA   [$12]
            STA   $01
            INC   $12
            INC   $12
            LDA   [$12]
            STA   $03
            INC   $12
            INC   $12
            LDA   #$00A0
            SBC   $03
            STA   $05
            LSR   $03
            CLC
            LDY   #$0000
L27AA       LDX   $03
L27AC       LDA   [$12],Y
            STA   [$0E],Y
            INY
            INY
            DEX
            BNE   L27AC
            LDA   $05
            ADC   $0E
            STA   $0E
            DEC   $01
            BNE   L27AA
            PLD
            LDA   $0C,S
            STA   $14,S
            LDA   $0B,S
            STA   $13,S
            CLC
            TSC
            ADC   #$0012
            TCS
            CLI
            RTL

L27D0       BRL   L27DD
            DW    $7771
            STR   'BlkMask'
L27DD       JSR   L36D9
            LDA   #$AB02
            JSR   L290B
            JSR   L297F
            LDA   #$0001
            STA   $75
            BRL   L2889
L27F1       BRL   L2802
            DW    $7771
            STR   'BlkDataMask'
L2802       JSR   L36D9
            LDA   #$AB03
            JSR   L290B
            JSR   L297F
            STZ   $75
            JSR   L2889
            INC   $75
            JSR   L36D9
            BRL   L2889
L281B       SEI
            TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            INC   $12
            INC   $12
            LDA   [$12]
            STA   $01
            TAX
            INC   $12
            INC   $12
            LDA   [$12]
            STA   $03
            TAY
            INC   $12
            INC   $12
            LDA   #$00A0
            SBC   $03
            STA   $05
            LSR   $03
            PHA
            PHA
            PHX
            PHY
            _Multiply
            PLA
            PLY
            CLC
            ADC   $12
            STA   $07
            LDA   #$0000
            ADC   $14
            STA   $09
            LDY   #$0000
L285F       LDX   $03
L2861       LDA   [$0E],Y
            AND   [$07],Y
            ORA   [$12],Y
            STA   [$0E],Y
            INY
            INY
            DEX
            BNE   L2861
            LDA   $05
            ADC   $0E
            STA   $0E
            DEC   $01
            BNE   L285F
            PLD
            LDA   $0C,S
            STA   $14,S
            LDA   $0B,S
            STA   $13,S
            TSC
            CLC
            ADC   #$0012
            TCS
            CLI
            RTL

L2889       JSR   L3746
            LDA   $4D
            STA   $4F
            LDA   $47
L2892       PHA
            STZ   $7F
            LDX   $4B
            DEX
            LDY   $4F
L289A       LDA   [$1F],Y
            STA   $15
            LDA   $75
            BEQ   L28A7
            JSR   L3771
            STA   $15
L28A7       JSR   L2A53
            LDA   #$0000
            STA   [$1F],Y
            INY
            INY
            DEX
            DEX
            BPL   L289A
            JSR   L2AB1
            CLC
            LDA   #$00A0
            ADC   $4F
            STA   $4F
            PLA
            DEC
            BNE   L2892
            RTS

L28C5       PHX
            PHY
            SEP   #$20
            LDX   #$FFFF
            BRA   L28D9
L28CE       AND   #$7F
            CMP   #$2E
            BNE   L28D9
            LDA   #$DF
            STA   L1E98,X
L28D9       INX
            LDA   L1E84,X
            STA   L1E98,X
            BNE   L28CE
            REP   #$20
            LDX   $03
            JSR   (L28EC,X)
            PLY
            PLX
            RTS

L28EC       DA    L28F2	; asm
            DA    L28F3	; merlin
            DA    L28FF	; orca
L28F2       RTS

L28F3       LDY   #L1E98	; label
            JSR   L3801
            LDY   #L389C	; = *
            BRL   L3801

L28FF       LDY   #L1E98
            JSR   L381A
            LDY   #L38A2
            BRL   L381A

L290B       PHX
            PHY
            LDX   $03
            JSR   (L2915,X)
            PLY
            PLX
            RTS

L2915       DA    L291B
            DA    L2925
            DA    L293C
L291B       XBA
            STA   L2955
            LDY   #L2953
            BRL   L37E0
L2925       PHA
            PEA   ^L2957+5
            PEA   L2957+5
            PEA   $0004
            _Int2Hex
            LDY   #L2957
            BRL   L3801
L293C       PHA
            PEA   ^L296A+6
            PEA   L296A+6
            PEA   $0004
            _Int2Hex
            LDY   #L296A
            BRL   L381A
L2953       DW    $0002
L2955       DW    $0000
L2957       ASC   " Hex 0000 ;Ident."8D00
L296A       ASC   " dc h'0000' ;Ident."8D00
L297F       PHX
            PHY
            LDX   $03
            JSR   (L2989,X)
            PLY
            PLX
            RTS

L2989       DA    L298F
            DA    L299F
            DA    L29CB
L298F       LDA   $47
            STA   L29F9
            LDA   $4B
            STA   L29F9+2
            LDY   #L29F7
            BRL   L37E0
L299F       LDA   $47
            PHA
            PEA   ^L29FD+5
            PEA   L29FD+5
            PEA   $0004
            _Int2Hex
            LDA   $4B
            PHA
            PEA   ^L2A10+5
            PEA   L2A10+5
            PEA   $0004
            _Int2Hex
            LDY   #L29FD
            BRL   L3801
L29CB       LDA   $47
            PHA
            PEA   ^L2A24+8
            PEA   L2A24+8
            PEA   $0004
            _Int2Hex
            LDA   $4B
            PHA
            PEA   ^L2A3B+8
            PEA   L2A3B+8
            PEA   $0004
            _Int2Hex
            LDY   #L2A24
            BRL   L381A
L29F7       DW    $0004
L29F9       HEX   00000000
L29FD       ASC   " dw $0000 ;Hauteur"8D
L2A10       ASC   " dw $0000 ;Largeur"8D00
L2A24       ASC   " dc i2'$0000' ;Hauteur"8D
L2A3B       ASC   " dc i2'$0000' ;Largeur"8D00
L2A53       PHX
            PHY
            LDX   $03
            JSR   (L2A5D,X)
            PLY
            PLX
            RTS

L2A5D       DA    L2A63
            DA    L2A6E
            DA    L2A8C
L2A63       LDA   $15
            STA   L2AAF
            LDY   #L2AAD
            BRL   L37E0

L2A6E       LDX   $7F
            BNE   L2A77
            PHX
            JSR   L3798	; output hex 
            PLX
L2A77       CPX   #$0014
            BCC   L2A83
            JSR   L3792
            STZ   $7F
            BRA   L2A6E
L2A83       LDA   $15
            XBA
            JSR   L37A4
            INC   $7F
            RTS

L2A8C       LDX   $7F
            BNE   L2A95
            PHX
            JSR   L37B3
            PLX
L2A95       CPX   #$0028
            BCC   L2A83
            JSR   L37B9
            JSR   L37AD
            STZ   $7F
            BRA   L2A8C
            LDA   $15
            XBA
            JSR   L37C5
            INC   $7F
            RTS

L2AAD       DW    $0002
L2AAF       DW    $0000
L2AB1       PHX
            PHY
            LDX   $03
            JSR   (L2ABB,X)
            PLY
            PLX
            RTS

L2ABB       DA    L2AC1
            DA    L2AC2
            DA    L2AC8
L2AC1       RTS

L2AC2       JSR   L3792
            STZ   $7F
            RTS

L2AC8       JSR   L37B9
            JSR   L37AD
            STZ   $7F
            RTS

L2AD1       BRL   L2AE3
            DW    $7771
            STR   'LdaStaAbsAdr'
L2AE3       JSR   L36D9
            JSR   L2D78
            JSR   L297F
            JSR   L3746
            JSR   L2DEA
            JSR   L2AFD
            JSR   L2B44
            JSR   L2E33
            CLC
            RTS

L2AFD       LDA   $4D
            STA   $4F
            LDA   $47
            DEC
            STA   $49
            STZ   $51
L2B08       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L2B11       LDA   [$1F],Y
            BEQ   L2B26
            STA   $15
            JSR   L3771
            LDA   $19
            BEQ   L2B26
            JSR   L2BD5
            LDA   #$0000
            STA   [$1F],Y
L2B26       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L2B11
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            DEC   $49
            BPL   L2B08
            RTS

L2B44       LDA   $4D
            STA   $4F
            LDA   $47
            DEC
            STA   $49
            STZ   $51
L2B4F       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L2B58       LDA   [$1F],Y
            BEQ   L2B64
            STA   $15
            JSR   L2CB9
            JSR   L2B82
L2B64       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L2B58
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            DEC   $49
            BPL   L2B4F
            RTS

L2B82       PHX
            PHY
            LDA   $4F
            PHA
            LDA   $49
            PHA
            LDA   $53
            PHA
            LDA   $51
            PHA
            BRA   L2B9B
L2B92       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L2B9B       LDA   [$1F],Y
            CMP   $15
            BNE   L2BA9
            JSR   L2D18
            LDA   #$0000
            STA   [$1F],Y
L2BA9       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L2B9B
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            DEC   $49
            BPL   L2B92
            PLA
            STA   $51
            PLA
            STA   $53
            PLA
            STA   $49
            PLA
            STA   $4F
            PLY
            PLX
            RTS

L2BD5       PHX
            PHY
            LDX   $03
            JSR   (L2BDF,X)
            PLY
            PLX
            RTS

L2BDF       DA    L2BE5
            DA    L2BFD
            DA    L2C3C
L2BE5       LDA   $53
            STA   L2C7D+1
            STA   L2C86+1
            LDA   $19
            STA   L2C80+1
            LDA   $15
            STA   L2C83+1
            LDY   #L2C7B
            BRL   L37E0
L2BFD       LDA   $53
            PHA
            PEA   ^L2C89+6
            PEA   L2C89+6
            PEA   $0004
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L2C89+$C
            PEA   L2C89+$C
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L2C89+$12
            PEA   L2C89+$12
            PEA   $0004
            _Int2Hex
            LDY   #L2C89
            BRL   L3801
L2C3C       LDA   $53
            PHA
            PEA   ^L2CA1+6
            PEA   L2CA1+6
            PEA   $0004
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L2CA1+$C
            PEA   L2CA1+$C
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L2CA1+$12
            PEA   L2CA1+$12
            PEA   $0004
            _Int2Hex
            LDY   #L2CA1
            BRL   L381A
L2C7B       DW    $000C
L2C7D       LDA   |$0000,Y
L2C80       AND   #$0000
L2C83       ORA   #$0000
L2C86       STA   |$0000,Y
L2C89       ASC   " Mk4 $0000;$0000;$0000"8D00
L2CA1       ASC   " Mk4 $0000,$0000,$0000"8D00
L2CB9       PHX
            PHY
            LDX   $03
            JSR   (L2CC3,X)
            PLY
            PLX
            RTS

L2CC3       DA    L2CC9
            DA    L2CD4
            DA    L2CED
L2CC9       LDA   $15
            STA   L2D08+1
            LDY   #L2D06
            BRL   L37E0
L2CD4       LDA   $15
            PHA
            PEA   ^L2D0B+7
            PEA   L2D0B+7
            PEA   $0004
            _Int2Hex
            LDY   #L2D0B
            BRL   L3801
L2CED       LDA   $15
            PHA
            PEA   ^L2D0B+7
            PEA   L2D0B+7
            PEA   $0004
            _Int2Hex
            LDY   #L2D0B
            BRL   L381A
L2D06       DW    $0003
L2D08       LDA   #$0000
L2D0B       ASC   " Lda #$0000"8D00
L2D18       PHX
            PHY
            LDX   $03
            JSR   (L2D22,X)
            PLY
            PLX
            RTS

L2D22       DA    L2D28
            DA    L2D33
            DA    L2D4C
L2D28       LDA   $53
            STA   L2D67+1
            LDY   #L2D65
            BRL   L37E0
L2D33       LDA   $53
            PHA
            PEA   ^L2D6A+6
            PEA   L2D6A+6
            PEA   $0004
            _Int2Hex
            LDY   #L2D6A
            BRL   L3801
L2D4C       LDA   $53
            PHA
            PEA   ^L2D6A+6
            PEA   L2D6A+6
            PEA   $0004
            _Int2Hex
            LDY   #L2D6A
            BRL   L381A
L2D65       DW    $0003
L2D67       STA   |$0000,Y
L2D6A       ASC   " Sta $0000,Y"8D00
L2D78       PHX
            PHY
            LDX   $03
            JSR   (L2D82,X)
            PLY
            PLX
            RTS

L2D82       DA    L2D88
            DA    L2D8E
            DA    L2D94
L2D88       LDY   #L2D9A
            BRL   L37E0
L2D8E       LDY   #L2D9E
            BRL   L3801
L2D94       LDY   #L2DBE
            BRL   L381A
L2D9A       DW    $0002
            HEX   8004
L2D9E       ASC   " Mx %00"8D
            ASC   " Bra *+6 ;A=Bank Y=Adr"8D00
L2DBE       ASC   " Longa on"8D
            ASC   " Longi on"8D
            ASC   " Bra *+6 ;A=Bank Y=Adr"8D00
L2DEA       PHX
            PHY
            LDX   $03
            JSR   (L2DF4,X)
            PLY
            PLX
            RTS

L2DF4       DA    L2DFA
            DA    L2E00
            DA    L2E06
L2DFA       LDY   #L2E0C
            BRL   L37E0
L2E00       LDY   #L2E14
            BRL   L3801
L2E06       LDY   #L2E14
            BRL   L381A
L2E0C       DW    $0006
            SEI
            PHB
            XBA
            PHA
            PLB
            PLB
L2E14       ASC   " Sei"8D
            ASC   " Phb"8D
            ASC   " Xba"8D
            ASC   " Pha"8D
            ASC   " Plb"8D
            ASC   " Plb"8D00
L2E33       PHX
            PHY
            LDX   $03
            JSR   (L2E3D,X)
            PLY
            PLX
            RTS

L2E3D       DA    L2E43
            DA    L2E49
            DA    L2E4F
L2E43       LDY   #L2E55
            BRL   L37E0
L2E49       LDY   #L2E5A
            BRL   L3801
L2E4F       LDY   #L2E5A
            BRL   L381A
L2E55       DW    $0003
            PLB
            CLI
            RTL

L2E5A       ASC   " Plb"8D
            ASC   " Cli"8D
            ASC   " Rtl"8D00
L2E6A       BRL   L2E7B
            DW    $7771
            STR   'CmdDataList'
L2E7B       STZ   $55
            JSR   L36D9
            LDA   #$AC01
            JSR   L290B
            JSR   L297F
            JSR   L3746
            LDA   $59
            STA   L315F
            STZ   L3161
            JSR   L2F50
            JSR   L2EC3
            LDA   $59
            PHA
            LDA   L315F
            STA   $59
            JSR   L2F50
            PLA
            STA   $59
            STA   L315F
            STZ   L3161
            JSR   L2F50
            JSR   L2F0D
            LDA   $59
            PHA
            LDA   L315F
            STA   $59
            JSR   L2F50
            PLA
            STA   $59
            RTS

L2EC3       LDA   $4D
            STA   $4F
            LDA   $47
            DEC
            STA   $49
            STZ   $51
L2ECE       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L2ED7       LDA   [$1F],Y
            BEQ   L2EEF
            STA   $15
            JSR   L3771
            LDA   $19
            BEQ   L2EEF
            JSR   L2FDE
            INC   L3161
            LDA   #$0000
            STA   [$1F],Y
L2EEF       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L2ED7
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            DEC   $49
            BPL   L2ECE
            RTS

L2F0D       LDA   $4D
            STA   $4F
            LDA   $47
            DEC
            STA   $49
            STZ   $51
L2F18       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L2F21       LDA   [$1F],Y
            BEQ   L2F32
            STA   $15
            JSR   L30BB
            INC   L3161
            LDA   #$0000
            STA   [$1F],Y
L2F32       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L2F21
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            DEC   $49
            BPL   L2F18
            RTS

L2F50       PHX
            PHY
            LDX   $03
            JSR   (L2F5A,X)
            PLY
            PLX
            RTS
L2F5A       DA    L2F60
            DA    L2F6C
            DA    L2F86
L2F60       LDA   L3161
            STA   L2FA2
            LDY   #L2FA0
            BRL   L37E0
L2F6C       LDA   L3161
            PHA
            PEA   ^L2FA4+5
            PEA   L2FA4+5
            PEA   $0004
            _Int2Hex
            LDY   #L2FA4
            BRL   L3801
L2F86       LDA   L3161
            PHA
            PEA   ^L2FBF+8
            PEA   L2FBF+8
            PEA   $0004
            _Int2Hex
            LDY   #L2FBF
            BRL   L381A
L2FA0       DW    $0002
L2FA2       DW    $0000
L2FA4       ASC   " dw $0000 ;Nbr de Valeurs"8D00
L2FBF       ASC   " dc i2'$0000' ;Nbr de Valeurs"8D00
L2FDE       PHX
            PHY
            LDX   $03
            JSR   (L2FE8,X)
            PLY
            PLX
            RTS

L2FE8       DA    L2FEE
            DA    L3003
            DA    L3042
L2FEE       LDA   $53
            STA   L3083
            LDA   $19
            STA   L3083+2
            LDA   $15
            STA   L3083+4
            LDY   #L3081
            BRL   L37E0
L3003       LDA   $53
            PHA
            PEA   ^L3089+5
            PEA   L3089+5
            PEA   $0004
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L3089+$B
            PEA   L3089+$B
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L3089+$11
            PEA   L3089+$11
            PEA   $0004
            _Int2Hex
            LDY   #L3089
            BRL   L3801
L3042       LDA   $53
            PHA
            PEA   ^L30A0+8
            PEA   L30A0+8
            PEA   $0004
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L30A0+$E
            PEA   L30A0+$E
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L30A0+$14
            PEA   L30A0+$14
            PEA   $0004
            _Int2Hex
            LDY   #L30A0
            BRL   L381A
L3081       DW    $0006
L3083       HEX   000000000000
L3089       ASC   " dw $0000,$0000,$0000"8D00
L30A0       ASC   " dc i2'$0000,$0000,$0000'"8D00
L30BB       PHX
            PHY
            LDX   $03
            JSR   (L30C5,X)
            PLY
            PLX
            RTS

L30C5       DA    L30CB
            DA    L30DB
            DA    L3107
L30CB       LDA   $53
            STA   L3135
            LDA   $15
            STA   L3135+2
            LDY   #L3133
            BRL   L37E0
L30DB       LDA   $53
            PHA
            PEA   ^L3139+5
            PEA   L3139+5
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L3139+$B
            PEA   L3139+$B
            PEA   $0004
            _Int2Hex
            LDY   #L3139
            BRL   L3801
L3107       LDA   $53
            PHA
            PEA   ^L314A+8
            PEA   L314A+8
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L314A+$E
            PEA   L314A+$E
            PEA   $0004
            _Int2Hex
            LDY   #L314A
            BRL   L381A
L3133       DW    $0004
L3135       HEX   00000000
L3139       ASC   " dw $0000,$0000"8D00
L314A       ASC   " dc i2'$0000,$0000'"8D00
L315F       DW    $0000
L3161       DW    $0000
L3163       SEI
            PHA
            PHA
            PHA
            PHA
            TSC
            PHB
            PHD
            TCD
            LDA   $13
            PHA
            PLB
            PLB
            CLC
            LDA   #$0006
            ADC   $12
            STA   $12
            LDA   $0C
            BNE   L31BE
            LDA   ($12)
            INC   $12
            INC   $12
            TAX
            BEQ   L31A0
L3186       LDA   ($12)
            INC   $12
            INC   $12
            TAY
            LDA   [$0E],Y
            AND   ($12)
            INC   $12
            INC   $12
            ORA   ($12)
            INC   $12
            INC   $12
            STA   [$0E],Y
            DEX
            BNE   L3186
L31A0       LDA   ($12)
            BEQ   L31BB
            INC   $12
            INC   $12
            TAX
L31A9       LDA   ($12)
            INC   $12
            INC   $12
            TAY
            LDA   ($12)
            INC   $12
            INC   $12
            STA   [$0E],Y
            DEX
            BNE   L31A9
L31BB       BRL   L3258
L31BE       LDA   ($12)
            INC   $12
            INC   $12
            TAX
            BEQ   L3218
L31C7       LDA   ($12)
            INC   $12
            INC   $12
            TAY
            LDA   ($12)
            INC   $12
            INC   $12
            PHA
            XBA
            LSR
            LSR
            LSR
            LSR
            XBA
            ORA   #$00F0
            STA   $05
            PLA
            LSR
            LSR
            LSR
            LSR
            ORA   #$FF0F
            STA   $07
            LDA   ($12)
            INC   $12
            INC   $12
            PHA
            XBA
            LSR
            LSR
            LSR
            LSR
            XBA
            STA   $01
            PLA
            LSR
            LSR
            LSR
            LSR
            AND   #$00F0
            STA   $03
            LDA   [$0E],Y
            AND   $05
            ORA   $01
            STA   [$0E],Y
            INY
            INY
            LDA   [$0E],Y
            AND   $07
            ORA   $03
            STA   [$0E],Y
            DEX
            BNE   L31C7
L3218       LDA   ($12)
            BEQ   L3258
            INC   $12
            INC   $12
            TAX
L3221       LDA   ($12)
            INC   $12
            INC   $12
            TAY
            LDA   ($12)
            INC   $12
            INC   $12
            PHA
            XBA
            LSR
            LSR
            LSR
            LSR
            XBA
            STA   $01
            PLA
            LSR
            LSR
            LSR
            LSR
            AND   #$00F0
            STA   $03
            LDA   [$0E],Y
            AND   #$00F0
            ORA   $01
            STA   [$0E],Y
            INY
            INY
            LDA   [$0E],Y
            AND   #$FF0F
            ORA   $03
            STA   [$0E],Y
            DEX
            BNE   L3221
L3258       PLD
            PLB
            LDA   $0A,S
            STA   $14,S
            LDA   $09,S
            STA   $13,S
            TSC
            CLC
            ADC   #$0012
            TCS
            CLI
            RTL

L326A       BRL   L3279
            DW    $7771
            STR   'LdaStaDir'
L3279       JSR   L36D9
            JSR   L3597
            JSR   L297F
            JSR   L3746
            JSR   L35FB
            JSR   L3290
            JSR   L366F
            CLC
            RTS

L3290       LDA   $4D
            STA   $4F
            LDA   $47
            DEC
            STA   $49
            STZ   L38DA
            STZ   $17
            STZ   $51
            LDA   #$0001
            STA   L38D8
            LDA   $4B
            CMP   #$0061
            BCS   L32B3
            LDA   #$0002
            STA   L38D8
L32B3       LDA   $51
            STA   $53
            LDX   $4B
            DEX
            LDY   $4F
L32BC       LDA   [$1F],Y
            BEQ   L32CA
            STA   $15
            LDA   #$0000
            STA   [$1F],Y
            JSR   L32EB
L32CA       INC   $53
            INC   $53
            INY
            INY
            DEX
            DEX
            BPL   L32BC
            CLC
            LDA   $51
            ADC   #$00A0
            STA   $51
            LDA   $4F
            ADC   #$00A0
            STA   $4F
            INC   L38DA
            DEC   $49
            BPL   L32B3
            RTS

L32EB       LDA   L38DA
            BEQ   L32F8
            CMP   L38D8
            BCC   L32F8
            JSR   L3312
L32F8       JSR   L3771
            LDA   $19
            BEQ   L3304
            STZ   $17
            BRL   L33A7
L3304       LDA   $15
            CMP   $17
            BEQ   L330F
            STA   $17
            JSR   L34D9
L330F       BRL   L3538
L3312       PHX
            PHY
            PEA   $0000
            PEA   $0000
            LDA   L38DA
            PHA
            PEA   $00A0
            _Multiply
            PLA
            PLX
            STA   L38DC
            LDX   $03
            JSR   (L3343,X)
            SEC
            LDA   $53
            SBC   $51
            STA   $53
            STZ   $51
            STZ   L38DA
            STZ   $17
            PLY
            PLX
            RTS

L3343       DA    L3349
            DA    L3355
            DA    L336F
L3349       LDA   L38DC
            STA   L338C+1
            LDY   #L3389
            BRL   L37E0
L3355       LDA   L38DC
            PHA
            PEA   ^L3395+7
            PEA   L3395+7
            PEA   $0004
            _Int2Hex
            LDY   #L3390
            BRL   L3801
L336F       LDA   L38DC
            PHA
            PEA   ^L3395+7
            PEA   L3395+7
            PEA   $0004
            _Int2Hex
            LDY   #L3390
            BRL   L381A
L3389       DW    $0005
            TDC
L338C       ADC   #$00A0
            TCD
L3390       ASC   " Tdc"8D
L3395       ASC   " Adc #$0000"8D
            ASC   " Tcd"8D00
L33A7       PHX
            PHY
            LDX   $03
            JSR   (L33B1,X)
            PLY
            PLX
            RTS

L33B1       DA    L33B7
            DA    L33D3
            DA    L3425
L33B7       SEP   #$20
            LDA   $53
            STA   L3479+1
            STA   L3481+1
            REP   #$20
            LDA   $19
            STA   L347B+1
            LDA   $15
            STA   L347E+1
            LDY   #L3477
            BRL   L37E0
L33D3       LDA   $53
            PHA
            PEA   ^L3483+6
            PEA   L3483+6
            PEA   $0002
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L348C+7
            PEA   L348C+7
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L3498+7
            PEA   L3498+7
            PEA   $0004
            _Int2Hex
            LDA   $53
            PHA
            PEA   ^L34A4+6
            PEA   L34A4+6
            PEA   $0002
            _Int2Hex
            LDY   #L3483
            BRL   L3801
L3425       LDA   $53
            PHA
            PEA   ^L34AE+6
            PEA   L34AE+6
            PEA   $0002
            _Int2Hex
            LDA   $19
            PHA
            PEA   ^L34B7+7
            PEA   L34B7+7
            PEA   $0004
            _Int2Hex
            LDA   $15
            PHA
            PEA   ^L34C3+7
            PEA   L34C3+7
            PEA   $0004
            _Int2Hex
            LDA   $53
            PHA
            PEA   ^L34CF+6
            PEA   L34CF+6
            PEA   $0002
            _Int2Hex
            LDY   #L34AE
            BRL   L381A
L3477       DW    $000A
L3479       LDA   $00
L347B       AND   #$0000
L347E       ORA   #$0000
L3481       STA   $00
L3483       ASC   " Lda $00"8D
L348C       ASC   " And #$0000"8D
L3498       ASC   " Ora #$0000"8D
L34A4       ASC   " Sta $00"8D00
L34AE       ASC   " Lda $00"8D
L34B7       ASC   " And #$0000"8D
L34C3       ASC   " Ora #$0000"8D
L34CF       ASC   " Sta $00"8D00
L34D9       PHX
            PHY
            LDX   $03
            JSR   (L34E3,X)
            PLY
            PLX
            RTS

L34E3       DA    L34E9
            DA    L34F4
            DA    L350D
L34E9       LDA   $15
            STA   L3528+1
            LDY   #L3526
            BRL   L37E0
L34F4       LDA   $15
            PHA
            PEA   ^L352B+7
            PEA   L352B+7
            PEA   $0004
            _Int2Hex
            LDY   #L352B
            BRL   L3801
L350D       LDA   $15
            PHA
            PEA   ^L352B+7
            PEA   L352B+7
            PEA   $0004
            _Int2Hex
            LDY   #L352B
            BRL   L381A
L3526       DW    $0003
L3528       LDA   #$0000
L352B       ASC   " Lda #$0000"8D00
L3538       PHX
            PHY
            LDX   $03
            JSR   (L3542,X)
            PLY
            PLX
            RTS

L3542       DA    L3548
            DA    L3557
            DA    L3570
L3548       SEP   #$20
            LDA   $53
            STA   L358B+1
            REP   #$20
            LDY   #L3589
            BRL   L37E0
L3557       LDA   $53
            PHA
            PEA   ^L358D+6
            PEA   L358D+6
            PEA   $0002
            _Int2Hex
            LDY   #L358D
            BRL   L3801
L3570       LDA   $53
            PHA
            PEA   ^L358D+6
            PEA   L358D+6
            PEA   $0002
            _Int2Hex
            LDY   #L358D
            BRL   L381A
L3589       DW    $0002
L358B       STA   $00
L358D       ASC   " Sta $00"8D00
L3597       PHX
            PHY
            LDX   $03
            JSR   (L35A1,X)
            PLY
            PLX
            RTS

L35A1       DA    L35A7
            DA    L35AD
            DA    L35B3
L35A7       LDY   #L35B9
            BRL   L37E0
L35AD       LDY   #L35BD
            BRL   L3801
L35B3       LDY   #L35D6
            BRL   L381A
L35B9       DW    $0002
            HEX   8004
L35BD       ASC   " Mx %00"8D
            ASC   " Bra *+6 ;Y=Adr"8D00
L35D6       ASC   " Longa on"8D
            ASC   " Longi on"8D
            ASC   " Bra *+6 ;Y=Adr"8D00
L35FB       PHX
            PHY
            LDX   $03
            JSR   (L3605,X)
            PLY
            PLX
            RTS

L3605       DA    L360B
            DA    L3611
            DA    L3617
L360B       LDY   #L361D
            BRL   L37E0
L3611       LDY   #L362F
            BRL   L3801
L3617       LDY   #L362F
            BRL   L381A
L361D       DW    $0010
            SEI
            PHD
            TYA
            TCD
            LDAL  $E1C068
            ORA   #$0030
            STAL  $E1C068
            CLC
L362F       ASC   " Sei"8D
            ASC   " Phd"8D
            ASC   " Tya"8D
            ASC   " Tcd"8D
            ASC   " Lda >$E1C068"8D
            ASC   " Ora #$30"8D
            ASC   " Sta >$E1C068"8D
            ASC   " Clc"8D00
L366F       PHX
            PHY
            LDX   $03
            JSR   (L3679,X)
            PLY
            PLX
            RTS

L3679       DA    L367F
            DA    L3685
            DA    L368B
L367F       LDY   #L3691
            BRL   L37E0
L3685       LDY   #L36A1
            BRL   L3801
L368B       LDY   #L36A1
            BRL   L381A
L3691       DW    $000E
            LDAL  $E1C068
            AND   #$FFCF
            STAL  $E1C068
            PLD
            CLI
            RTL

L36A1       ASC   " Lda >$E1C068"8D
            ASC   " And #$FFCF"8D
            ASC   " Sta >$E1C068"8D
            ASC   " Pld"8D
            ASC   " Cli"8D
            ASC   " Rtl"8D00
L36D9       LDA   $33
            STA   $3F
            LDA   $35
            STA   $41
            LDA   $37
            STA   $43
            LDA   $39
            STA   $45
            SEC
            LDA   $43
            SBC   $3F
            INC
            STA   $47
            LDA   $79
            BNE   L36F9
            LDA   $05
            BNE   L3704
L36F9       LDA   $41
            LSR
            BCC   L370D
            DEC   $41
            DEC   $45
            BRA   L370D
L3704       LDA   $41
            LSR
            BCS   L370D
            INC   $41
            INC   $45
L370D       LDA   $41
            AND   #$FFFE
            STA   $4B
            LDA   $45
            ORA   #$0001
            SEC
            SBC   $4B
            INC
            LSR
            STA   $4B
            AND   #$0001
            CLC
            ADC   $4B
            STA   $4B
            PEA   ^L264E
            PEA   L264E
            PEA   ^L269C
            PEA   L269C
            LDA   $41
            PHA
            LDA   $3F
            PHA
            PEA   $0000
            _PPToPort
            CLC
            RTS

L3746       LDA   $41
            LSR
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $3F
            PHA
            PEA   $00A0
            _Multiply
            PLA
            PLX
            CLC
            ADC   $01,S
            STA   $01,S
            PLA
            STA   $4D
            RTS

            LDA   $4B
            LSR
            ADC   #$0000
            STA   $4B
            RTS

L3771       LDA   $15
            STA   $19
            LSR
            TSB   $19
            LSR
            TSB   $19
            LSR
            ORA   $19
            AND   #$1111
            STA   $19
            ASL
            ORA   $19
            ASL
            ORA   $19
            ASL
            ORA   $19
            EOR   #$FFFF
            STA   $19
            RTS

L3792       LDY   #L389A	; retour chariot
            BRL   L3801
L3798       LDY   #L38A9	; hex
            BRL   L3801
            LDY   #L38B8
            BRL   L3801
L37A4       JSR   L37CE
            LDY   #L38C7
            BRL   L3801
L37AD       LDY   #L389A
            BRL   L381A
L37B3       LDY   #L38AF
            BRL   L381A
L37B9       LDY   #L38B6
            BRL   L381A
            LDY   #L38AF
            BRL   L381A
L37C5       JSR   L37CE
            LDY   #L38C7
            BRL   L381A
L37CE       PHA
            PEA   ^L38C7
            PEA   L38C7
            PEA   $0004
            _Int2Hex
            RTS

L37E0       TYX
            LDA   |$0000,X
            BEQ   L3800
            INX
            INX
            LDY   $59
L37EA       PHA
            LDA   |$0000,X
            SEP   #$20
            STA   [$27],Y
            REP   #$20
            INX
            INY
            BNE   L37FA
            INC   $77
L37FA       PLA
            DEC
            BNE   L37EA
            STY   $59
L3800       RTS

L3801       SEP   #$20
            TYX
            LDY   $59
L3806       LDA   |$0000,X
            BEQ   L3815
            STA   [$27],Y
            INX
            INY
            BNE   L3806
            INC   $77
            BRA   L3806
L3815       STY   $59
            REP   #$20
            RTS

L381A       TYX
            LDY   $59
L381D       LDA   |$0000,X
            AND   #$007F
            BEQ   L3858
            CMP   #$000D
            BNE   L3832
            STZ   $63
            STZ   $65
            STZ   $67
            BRA   L384C
L3832       CMP   #$0020
            BNE   L383D
            JSR   L385B
            INX
            BRA   L381D
L383D       PHX
            CMP   #$002A
            BNE   L3849
            LDX   $63
            BNE   L3849
            INC   $67
L3849       PLX
            INC   $63
L384C       SEP   #$20
            STA   [$27],Y
            REP   #$20
            JSR   L388E
            INX
            BRA   L381D
L3858       STY   $59
            RTS

L385B       PHX
            LDA   $67
            BNE   L3877
            LDX   $65
            CPX   #$0006
            BCS   L3877
            INC   $65
            INC   $65
            LDA   L3894,X
            SEC
            SBC   $63
            BEQ   L3877
            BMI   L3877
            BRA   L387A
L3877       LDA   #$0001
L387A       TAX
            LDA   #$2020
L387E       SEP   #$20
            STA   [$27],Y
            REP   #$20
            JSR   L388E
            INC   $63
            DEX
            BNE   L387E
            PLX
            RTS

L388E       INY
            BNE   L3893
            INC   $77
L3893       RTS

L3894       DW    $000A
            DW    $0010
            DW    $0028
L389A       ASC   8D00
L389C       ASC   " = *"8D00
L38A2       ASC   " Anop"8D00
L38A9       ASC   " hex "00
L38AF       ASC   " dc h'"00
L38B6       ASC   "'"00
L38B8       ASC   " dw $"00
            ASC   " dc i2'$"00
L38C7       ASC   "0000"00
            ASC   " START"00
            ASC   " END"00
L38D8       DW    $0000
L38DA       DW    $0000
L38DC       DW    $0000

*-------------------------------

	put	pic.s
