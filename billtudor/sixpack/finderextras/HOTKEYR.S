*
* HotKeys v2.1 - Resource code
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	EXE
	dsk	HotKeyR.l

*------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Menu.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------

            PHD
            TSC
            TCD
            PHB
            PHK
            PLB
            STX   L0C77
            LDA   $08
            PHA
            LDA   $06
            PHA
            PEA   ^L040C
            PEA   L040C
            PEA   $0000
            PEA   $012C
            _BlockMove
            LDA   #$00C8
            INC
            STA   L0408
            LDA   L040E
            STA   L040A
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
            PEA   $0002
            PEA   $0000
            PEA   $0064
            PEA   $800E
            _NewWindow2
            STA   L022B
            PLA
            STA   L0C6B
            PLA
            STA   L0C6B+2
            BCC   L0073
            LDA   L022B
            PLB
            PLD
            RTL

L0073       LDA   L040A
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            LDA   L0C77
            BNE   L00A4
            PLA
            PLY
            PHY
            PHA
            PHY
            PHA
            _EraseControl
L00A4       _SetCtlValue
            STZ   L0C6F
            STZ   L0C71
            STZ   L0C71+2
            LDA   L040A
            CMP   #$0147
            BEQ   L00C1
            CMP   #$0148
            BNE   L00CD
L00C1       LDA   #$0002
            STA   L0C75
            LDA   L040A
            JSR   L0538
L00CD       _InitCursor
            LDA   L0C77
            BNE   L00DC
            BRL   L03BE
L00DC       PEA   $0000
            PEA   $0000
            PEA   ^L0C79
            PEA   L0C79
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _DoModalWindow
            PLA
            PLX
            CMP   #$0000
            BEQ   L010E
            BRL   L01B0
L010E       LDA   L0C79
            CMP   #$0003
            BNE   L00DC
            LDA   L0C87
            AND   #$2900
            CMP   #$2000
            BNE   L00DC
            LDA   L0C7B
            AND   #$007F
            LDY   #$0030
            CMP   #$002C
            BNE   L013C
            PHA
            LDA   L0C87
            AND   #$0200
            BEQ   L013B
            PLA
            BRA   L0147
L013B       PLA
L013C       CMP   L0CA7,Y
            BEQ   L0147
            DEY
            DEY
            BPL   L013C
            BRA   L00DC
L0147       LDA   L0C87
            AND   #$0200
            STA   L0C6F
            TYA
            LSR
            ADC   #$00C8
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0065
            _GetCtlHandleFromID
            PLA
            PLY
            STA   L0C97
            STY   L0C99
            PHY
            PHA
            _SetCtlValue
            LDA   L0C6F
            BEQ   L018A
            LDA   #$0001
L018A       PHA
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006C
            _GetCtlHandleFromID
            _SetCtlValue
            BRL   L022D
L01B0       CMP   #$0258
            BNE   L01B8
            BRL   L03BE
L01B8       CMP   #$006D
            BNE   L01C0
            BRL   L0396
L01C0       CMP   #$0068
            BEQ   L01E1
            CMP   #$0065
            BEQ   L022D
            CMP   #$0066
            BNE   L01D2
            BRL   L02DF
L01D2       CMP   #$006C
            BNE   L01DA
            BRL   L0364
L01DA       CMP   #$0069
            BNE   L01E1
            DEC   $0A
L01E1       _WaitCursor
            LDA   L0C71
            ORA   L0C71+2
            BEQ   L020E
            LDA   L05F1+2
            PHA
            LDA   L05F1
            PHA
            _DisposeHandle
            LDA   L05F5+2
            PHA
            LDA   L05F5
            PHA
            _DisposeHandle
L020E       LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            _CloseWindow
            LDA   #L040C
            STA   $06
            LDA   #^L040C
            STA   $08
            PLB
            PLD
            CLC
            RTL

L022B       DW    $0000
L022D       PHA
            LDA   L0C99
            PHA
            LDA   L0C97
            PHA
            _GetCtlValue
            PLA
            STA   L0408
            SEC
            SBC   #$00C8
            LDX   L0C6F
            BEQ   L024E
            CLC
            ADC   #$0019
L024E       ASL
            TAY
            STY   L0C75
L0253       LDA   L040C,Y
            STA   L040A
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            _SetCtlValue
            LDA   L0C71
            ORA   L0C71+2
            BEQ   L02C6
            LDA   L0C71+2
            PHA
            LDA   L0C71
            PHA
            _EraseControl
            LDA   L0C71+2
            PHA
            LDA   L0C71
            PHA
            _DisposeControl
            LDA   L05F1+2
            PHA
            LDA   L05F1
            PHA
            _DisposeHandle
            LDA   L05F5+2
            PHA
            LDA   L05F5
            PHA
            _DisposeHandle
            STZ   L0C71
            STZ   L0C71+2
L02C6       LDA   L040A
            CMP   #$0147
            BEQ   L02D6
            CMP   #$0148
            BEQ   L02D6
            BRL   L00DC
L02D6       LDA   L040A
            JSR   L0538
            BRL   L00DC
L02DF       PHA
            LDA   L0C99
            PHA
            LDA   L0C97
            PHA
            _GetCtlValue
            LDA   L0408
            SEC
            SBC   #$00C8
            LDX   L0C6F
            BEQ   L02FF
            CLC
            ADC   #$0019
L02FF       ASL
            TAY
            STY   L0C75
            PLA
            STA   L0362
            CMP   #$0148
            BNE   L0312
            JSR   L0827
            BRA   L031A
L0312       CMP   #$0147
            BNE   L035C
            JSR   L0827
L031A       BCS   L0338
            PHA
            LDA   L0C75
            TAY
            LDA   L0362
            STA   L040C,Y
            TYA
            ASL
            TAY
            PLA
            STA   L0470,Y
            TXA
            STA   L0472,Y
            LDY   L0C75
            BRL   L0253
L0338       LDY   L0C75
            LDA   L040C,Y
            CMP   L0362
            BEQ   L0359
            LDA   #$012C
            STA   L040C,Y
            PHA
            LDA   L0C99
            PHA
            LDA   L0C97
            PHA
            _SetCtlValue
L0359       BRL   L0253
L035C       STA   L040C,Y
            BRL   L0253
L0362       BRK   $00
L0364       LDA   L0C6F
            BEQ   L036C
            LDA   #$0001
L036C       DEC
            STA   L0C6F
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0065
            _GetCtlHandleFromID
            PLA
            STA   L0C97
            PLA
            STA   L0C99
            BRL   L022D
L0396       PEA   $006E
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006D
            _GetCtlHandleFromID
            _SetCtlValue
            BRL   L00DC
L03BE       JSR   L05F9
L03C1       PEA   $0000
            PEA   $0000
            PEA   ^L0C79
            PEA   L0C79
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _DoModalWindow
            PLA
            PLX
            CMP   #$0000
            BNE   L0402
            LDA   L0C79
            CMP   #$0003
            BEQ   L0402
            CMP   #$0001
            BEQ   L0402
            CMP   #$0005
            BNE   L03C1
L0402       JSR   L0710
            BRL   L00DC
L0408       DW    $0000
L040A       DW    $0000
L040C       DB    $2C
            DB    $01
L040E       DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
            DB    $2C
            DB    $01
L0470       DB    $00
            DB    $00
L0472       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0538       STA   L05ED
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0002
            PEA   $0000
            PEA   $006D
            _NewControl2
            PLA
            STA   L0C71
            PLA
            STA   L0C71+2
            BCC   L0564
            RTS

L0564       PHA
            PHA
            _GetMenuBar
            LDA   L0C71+2
            PHA
            LDA   L0C71
            PHA
            _SetMenuBar
            PEA   $0000
            LDA   L0C75
            ASL
            TAY
            LDA   L0472,Y
            PHA
            LDA   L0470,Y
            PHA
            PEA   $0000
            PEA   $006D
            PEA   $006E
            PEA   $006F
            PEA   ^L05EF
            PEA   L05EF
            _InsertPathMItems
            BCS   L05D6
            LDA   L05ED
            CMP   #$0148
            BNE   L05D6
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $00B3
            PEA   $0000
            PEA   $0000
            _GetSysIcon
            LDA   L05EF
            PHA
            _SetMItemIcon
L05D6       _SetMenuBar
            LDA   L0C71+2
            PHA
            LDA   L0C71
            PHA
            _DrawOneCtl
            RTS

L05ED       DW    $0000
L05EF       DW    $0000
L05F1       ADRL  $00000000
L05F5       ADRL  $00000000
L05F9       PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0065
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0069
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0068
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0067
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006C
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006D
            _GetCtlHandleFromID
            BCC   L06E6
            PLA
            PLA
            BRA   L06ED
L06E6       _EraseControl
L06ED       PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006B
            _GetCtlHandleFromID
            _ShowControl
            RTS

L0710       PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006B
            _GetCtlHandleFromID
            _EraseControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0065
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0069
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0068
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $0067
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006C
            _GetCtlHandleFromID
            _ShowControl
            PEA   $0000
            PEA   $0000
            LDA   L0C6B+2
            PHA
            LDA   L0C6B
            PHA
            PEA   $0000
            PEA   $006D
            _GetCtlHandleFromID
            BCC   L081F
            PLA
            PLA
            BRA   L0826
L081F       _ShowControl
L0826       RTS

L0827       STA   L09CC
            STZ   L0A32
            STZ   L0A34
            STZ   L0A34+2
            PHA
            _SFStatus
            PLA
            BCS   L0840
            BNE   L0890
L0840       PEA   $0017
            PEA   $0101
            _LoadOneTool
            BCC   L0852
L084F       BRL   L09E8
L0852       PHA
            PHA
            PEA   $0000
            PEA   $0100
            LDA   $0C
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLA
            BCS   L084F
            STX   L0A34
            STA   L0A34+2
            PHD
            PHA
            PHX
            TSC
            TCD
            LDA   [$01]
            TAX
            PLY
            PLY
            PLD
            LDA   $0C
            PHA
            PHX
            _SFStartUp
            INC   L0A32
L0890       LDA   L09CC
            CMP   #$0148
            BNE   L089B
            BRL   L0964
L089B       PEA   $0078
            PEA   $0028
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0C4F
            PEA   L0C4F
            PEA   $0000
            PEA   ^L0C43
            PEA   L0C43
            PEA   ^L0A6E
            PEA   L0A6E
            PEA   ^L0C60
            PEA   L0C60
            PEA   ^L0A5A
            PEA   L0A5A
            _SFPPutFile2
            PHA
            PHP
            LDA   L0A64+2
            PHA
            LDA   L0A64
            PHA
            _DisposeHandle
            PLP
            BCC   L08F9
            LDA   L0A6A+2
            PHA
            LDA   L0A6A
            PHA
            _DisposeHandle
            PLA
            BRL   L09E8
L08F9       PLA
            LDA   L0A5A
            BNE   L0911
            LDA   L0A6A+2
            PHA
            LDA   L0A6A
            PHA
            _DisposeHandle
            BRL   L09FD
L0911       LDA   L0A6A+2
            PHA
            LDA   L0A6A
            PHA
            _HLock
            LDA   L0A6A
            LDX   L0A6A+2
            PHD
            PHX
            PHA
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PLY
            PLY
            PHX
            PHA
            LDY   #$0002
            LDA   [$01],Y
            INC
            INC
            TAY
L093F       LDA   [$01],Y
            AND   #$007F
            CMP   #$003A
            BEQ   L0951
            DEY
            CPY   #$0005
            BCS   L093F
            BRA   L095B
L0951       TYA
            DEC
            DEC
            DEC
            DEC
            LDY   #$0002
            STA   [$01],Y
L095B       PLA
            PLX
            PLD
            INC
            INC
            CLC
            BRL   L09FE
L0964       PEA   $0078
            PEA   $0028
            PEA   $0000
            PEA   ^L09CE
            PEA   L09CE
            PEA   $0000
            PEA   $0000
            PEA   ^L0A38
            PEA   L0A38
            PEA   ^L0A5A
            PEA   L0A5A
            _SFGetFile2
            BCS   L09E8
            LDA   L0A5A
            BEQ   L09FD
            LDA   L0A64+2
            PHA
            LDA   L0A64
            PHA
            _DisposeHandle
            LDA   L0A6A+2
            PHA
            LDA   L0A6A
            PHA
            _HLock
            LDA   L0A6A
            LDX   L0A6A+2
            PHD
            PHX
            PHA
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PLY
            PLY
            PLD
            INC
            INC
            CLC
            BRA   L09FE
L09CC       DW    $0000
L09CE       STR   'Launch Which Application?'
L09E8       PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHA
            _ErrorWindow
            PLA
L09FD       SEC
L09FE       PHP
            PHA
            PHX
            LDA   L0A32
            BEQ   L0A2E
            _SFShutDown
            PEA   $0017
            _UnloadOneTool
            LDA   L0A34
            ORA   L0A34+2
            BEQ   L0A2E
            LDA   L0A34+2
            PHA
            LDA   L0A34
            PHA
            _DisposeHandle
L0A2E       PLX
            PLA
            PLP
            RTS

L0A32       DW    $0000
L0A34       ADRL  $00000000
L0A38       DW    $0004
            DW    $8000
            DW    $00B3
            ADRL  $00000000
            DW    $8000
            DW    $00FF
            ADRL  $00000000
            DW    $8000
            DW    $00B5
            ADRL  $00000000
            DW    $0000
            DW    $005A
            ADRL  $00008048
L0A5A       DW    $0000
            DW    $0000
            ADRL  $00000000
            DW    $0003
L0A64       ADRL  $00000000
            DW    $0003
L0A6A       ADRL  $00000000
L0A6E       DW    $0000       ; dtBoundsRect
            DW    $0000
            DW    $0082
            DW    $0140
            DW    $FFFF       ; dtVisible
            ADRL  $00000000   ; dtRefCon
            ADRL  L0AB4       ; itemPtr
            ADRL  L0ACC       ; itemPtr
            ADRL  L0AE4       ; itemPtr
            ADRL  L0AFC       ; itemPtr
            ADRL  L0B14       ; itemPtr
            ADRL  L0B2C       ; itemPtr
            ADRL  L0B44       ; itemPtr
            ADRL  L0B5C       ; itemPtr
            ADRL  L0B74       ; itemPtr
            ADRL  L0B8C       ; itemPtr
            ADRL  L0BA4       ; itemPtr
            ADRL  L0BBC       ; itemPtr
            ADRL  L0BD4       ; itemPtr
            ADRL  $00000000   ; Terminator
L0AB4       DW    $0001       ; Item ID
            DW    $0061       ; Item rect
            DW    $00CC
            DW    $006D
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0C1B       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0ACC       DW    $0002       ; Item ID
            DW    $003B       ; Item rect
            DW    $00CC
            DW    $0047
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0C22       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0AE4       DW    $0003       ; Item ID
            DW    $004A       ; Item rect
            DW    $00CC
            DW    $0056
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0C27       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0AFC       DW    $0004       ; Item ID
            DW    $0019       ; Item rect
            DW    $00CC
            DW    $0025
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0C2D       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B14       DW    $0005       ; Item ID
            DW    $0072       ; Item rect
            DW    $00CC
            DW    $007E
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0C35       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B2C       DW    $0006       ; Item ID
            DW    $0000       ; Item rect
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0014       ; User item
            ADRL  $00000000   ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B44       DW    $0007       ; Item ID
            DW    $000A       ; Item rect
            DW    $000A
            DW    $0016
            DW    $013B
            DW    $0014       ; User item
            ADRL  $00000000   ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B5C       DW    $0008       ; Item ID
            DW    $0024       ; Item rect
            DW    $000A
            DW    $0062
            DW    $00AA
            DW    $8014       ; User item
            ADRL  $00000000   ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B74       DW    $0009       ; Item ID
            DW    $0062       ; Item rect
            DW    $000A
            DW    $006E
            DW    $00C8
            DW    $800F       ; Static text
            ADRL  $00000000   ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0B8C       DW    $000A       ; Item ID
            DW    $006E       ; Item rect
            DW    $000A
            DW    $0080
            DW    $00C2
            DW    $8011       ; Editable text
            ADRL  $00000000   ; Item descriptor
            DW    $003F       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0BA4       DW    $000B       ; Item ID
            DW    $0016       ; Item rect
            DW    $000A
            DW    $0020
            DW    $00C8
            DW    $800F       ; Static text
            ADRL  L0C0A       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0BBC       DW    $000C       ; Item ID
            DW    $0027       ; Item rect
            DW    $00CC
            DW    $0033
            DW    $0136
            DW    $000A       ; Std button
            ADRL  L0BEC       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0BD4       DW    $000D       ; Item ID
            DW    $0000       ; Item rect
            DW    $000A
            DW    $000C
            DW    $013B
            DW    $800F       ; Static text
            ADRL  L0BF7       ; Item descriptor
            DW    $0000       ; Item value
            DW    $0000       ; Bit flag
            ADRL  $00000000   ; Ptr to color table
L0BEC       STR   'New Folder'
L0BF7       STR   'Open which Folder?'
L0C0A       STR   '^0 free of ^1 k.'
L0C1B       STR   'Accept'
L0C22       STR   'Open'
L0C27       STR   'Close'
L0C2D       STR   'Volumes'
L0C35       STR   'Cancel'
            STR   'Accept'
L0C43       STRL  'New.Folder'
L0C4F       STR   'New Folder Name:'
L0C60       PHB
            PLA
            PLX
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            PLB
            RTL

L0C6B       ADRL  $00000000
L0C6F       DW    $0000
L0C71       ADRL  $00000000
L0C75       DW    $0000
L0C77       DW    $0000
L0C79       DW    $0000       ; event code
L0C7B       ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
            DW    $0000       ; mouse location
            DW    $0000
L0C87       DW    $0000       ; modifiers
            ADRL  $00000000   ; task data
            ADRL  $00000000   ; task mask
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C97       DB    $00
            DB    $00
L0C99       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CA7       DW    $000D
            DW    $0030
            DW    $0031
            DW    $0032
            DW    $0033
            DW    $0034
            DW    $0035
            DW    $0036
            DW    $0037
            DW    $0038
            DW    $0039
            DW    $002B
            DW    $002D
            DW    $002A
            DW    $002F
            DW    $003D
            DW    $0060
            DW    $0061
            DW    $0062
            DW    $0064
            DW    $0065
            DW    $006D
            DW    $0067
            DW    $006F
            DW    $002E

