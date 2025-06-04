*
* Open Sesame
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	OpenSesame.l

*------------------------------

	use	4/Desk.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Sch.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------

            ADRL  openROUTINE	; Open routine
            ADRL  closeROUTINE	; Close routine
            ADRL  actionROUTINE	; Action routine
            ADRL  initROUTINE	; Init routine
            DW    $FFFF	; Period
            DW    $FFFF	; Event mask
L0014       ASC   '##OpenSesame\H**'00

*------------------------------

closeROUTINE
actionROUTINE
initROUTINE
            RTL

*------------------------------

openROUTINE
            PHB
            PHK
            PLB
            _WaitCursor
            PHA
            _QDVersion
            PLA
            AND   #$0FFF
            CMP   #$0307
            BCS   L0056
            LDA   L0014+$E
            PHA
            _DisableMItem
            _SysBeep
            BRL   L0097
L0056       PHA
            _MMStartUp
            PLA
            STA   L02F3
            JSR   L01EB
            BCS   L0097
            PHA
            PEA   ^L00A7
            PEA   L00A7
            _SchAddTask
            PLA
            BNE   L0097
            _InitCursor
            PHA
            PEA   $0020
            PEA   $0000
            PEA   $0000
            PEA   ^L0558
            PEA   L0558
            _AlertWindow
            PLA
L0097       LDA   #$0000
            STA   $07,S
            STA   $05,S
            _InitCursor
            PLB
            RTL

*------------------------------

L00A7       PHB
            PHK
            PLB
            PEA   $0104
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   ^L02F5
            PEA   L02F5
            PEA   ^L030D
            PEA   L030D
            _SendRequest
            BCC   L00FC
            PEA   $0105
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   ^L02F5
            PEA   L02F5
            PEA   ^L030D
            PEA   L030D
            _SendRequest
            BCC   L00FC
            STZ   L0102
            PEA   ^L00FE
            PEA   L00FE
            _AddToRunQ
L00FC       PLB
            RTL

*------------------------------

L00FE       ADRL  $00000000
L0102       DW    $0000
            DW    $A55A
            ADRL  $00000000

            PEA   ^L00FE
            PEA   L00FE
            _RemoveFromRunQ
            PHA
            PHA
            _GetCursorAdr
            _InitCursor
            PHA
            PEA   $0020
            PEA   $0000
            PEA   $0000
            PEA   ^L0513
            PEA   L0513
            _AlertWindow
            PLA
            _SetCursor
            RTL

*------------------------------

L0147       STZ   L01E5
            STZ   L01E7
            STZ   L01E7+2
            PHA
            _SFStatus
            PLA
            BCS   L015D
            BNE   L01B5
L015D       PEA   $0017
            PEA   $0101
            _LoadOneTool
            BCC   L0175
L016C       _SysBeep
            SEC
            RTS

L0175       PHA
            PHA
            PEA   $0000
            PEA   $0100
            LDA   L02F3
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLA
            BCS   L016C
            STX   L01E7
            STA   L01E7+2
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
            LDA   L02F3
            PHA
            PHX
            _SFStartUp
            INC   L01E5
L01B5       CLC
            RTS

L01B7       LDA   L01E5
            BEQ   L01E4
            _SFShutDown
            PEA   $0017
            _UnloadOneTool
            LDA   L01E7
            ORA   L01E7+2
            BEQ   L01E4
            LDA   L01E7+2
            PHA
            LDA   L01E7
            PHA
            _DisposeHandle
L01E4       RTS

L01E5       DW    $0000
L01E7       ADRL  $00000000
L01EB       JSR   L0147
            BCC   L01FD
            RTS

L01F1       _SysBeep
            JSR   L01B7
            SEC
            RTS

L01FD       PEA   $0010
            PEA   $0028
            PEA   $0000
            PEA   ^L02CE
            PEA   L02CE
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L02DF
            PEA   L02DF
            _InitCursor
            _SFGetFile2
            BCS   L01F1
            _WaitCursor
            LDA   L02DF
            BNE   L023F
            JSR   L01B7
            SEC
            RTS

L023F       LDA   L02EB
            PHA
            LDA   L02E9
            PHA
            _DisposeHandle
            LDA   L02EF+2
            PHA
            LDA   L02EF
            PHA
            _HLock
            LDA   L02EF
            LDX   L02EF+2
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
            INC
            INC
            PHA
            LDA   [$01]
            CMP   #$01FD
            BCS   L02B7
            PEA   ^L0315
            PEA   L0315
            PEA   $0000
            INC
            INC
            PHA
            _BlockMove
            PLD
            JSR   L01B7
            LDA   L02EF+2
            PHA
            LDA   L02EF
            PHA
            _DisposeHandle
            LDA   L02E1
            STA   L02FF
            LDA   L02E3
            STA   L0301
            LDA   L02E5
            STA   L0303
            CLC
            RTS

L02B7       PLA
            PLA
            PLD
            JSR   L01B7
            LDA   L02EF+2
            PHA
            LDA   L02EF
            PHA
            _DisposeHandle
            SEC
            RTS

L02CE       STR   'Open which file:'
L02DF       DB    $00
            DB    $00
L02E1       DB    $00
            DB    $00
L02E3       DB    $00
            DB    $00
L02E5       DB    $00
            DB    $00
            DB    $03
            DB    $00
L02E9       DB    $00
            DB    $00
L02EB       DB    $00
            DB    $00
            DB    $03
            DB    $00
L02EF       ADRL  $00000000
L02F3       DW    $0000
L02F5       DW    $0007
            ADRL  L0315
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02FF       DB    $00
            DB    $00
L0301       DB    $00
            DB    $00
L0303       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L030D       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0315       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   0000000000000000000000000000

L0513       ASC   '52~None of the installed System Extensions could open this file.~^#6'00
L0558       ASC   '52~The System is too busy at this time to handle this request.~^#6'00

