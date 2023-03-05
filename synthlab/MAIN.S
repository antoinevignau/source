*
* SynthLAB - MAIN
*
* (c) 1990, Apple Computer, Inc.
* (s) 2023, Antoine Vignau
*

	mx	%00
	rel
	lst	off
	
*-----------------------------------

INCBUSYFLG  EQU   $E10064
DECBUSYFLG  EQU   $E10068
GSOS        EQU   $E100A8
TickCount   EQU   $E100DC

	use	MAIN.X
	
	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDI.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-----------------------------------

            JMP   L020065

L020003     DW    $0000         ; event code
L020005     ADRL  $00000000     ; event message
L020009     ADRL  $00000000     ; tick count
L02000D     DW    $0000         ; mouse location
L02000F     DW    $0000
L020011     DW    $0000         ; modifiers
L020013     DW    $0000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02001B     DB    $00
            DB    $00
L02001D     DB    $00
            DB    $00
L02001F     DB    $00
            DB    $00
L020021     ADRL  $00000000
L020025     ADRL  $00000000
L020029     DB    $00
            DB    $00
L02002B     DW    $0000
L02002D     DB    $00
            DB    $00
L02002F     DA    L025500
L020031     DB    $00
L020032     DW    $0000         ;  version number
L020034     ADRL  L02742C
            ADRL  L02761A
            ADRL  L020064
            ADRL  L02743F
            ADRL  L02A0F2
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DW    $0000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020064     RTL

*-----------------------------------

L020065     PHK
            PLB
            TDC
            STA   L02002B
            STZ   $76
            PHK
            PHK
            PLA
            AND   #$00FF
            STA   $5E
            LDA   #^L040AE0
            STA   L02002D
            JSR   L0209BC
            JSL   GSOS
            DW    $002A         ; GetVersion
            ADRL  L020032
            LDA   L020032
            AND   #$7FFF
            CMP   #$0301
            BCS   L020099
            LDX   #L020938
            JMP   L02910D

L020099     PHA
            PHA
            _TotalMem
            PLA
            PLA
            AND   #$FFF0
            BNE   L0200AF
            LDX   #L020838
            JMP   L02910D

L0200AF     JSL   GSOS
            DW    $2009         ; SetPrefix
            ADRL  L02029E
            PHA
            _GetIRQEnable
            LDA   $01,S
            AND   #$0020
            BEQ   L0200CB
            JSR   L02BC14
L0200CB     JSR   L020A5A
            PLA
            AND   #$0010
            BEQ   L0200DA
            LDX   #L020898
            JMP   L02910D

L0200DA     PHA
            PHA
            PEA   $0000
            PEA   $8000
            LDA   L02095E
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   L020970
            PLA
            STA   L020970+2
            BCC   L020106
            LDX   #L0208D0
            JMP   L02910D

L020106     LDA   L020970
            STA   $00
            LDA   L020970+2
            STA   $02
            LDY   #$0002
            LDA   [$00]
            STA   L020025
            LDA   [$00],Y
            STA   L020025+2
            PHA
            PHA
            PEA   $0000
            PEA   $2000
            LDA   L02095E
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   $00
            PLA
            STA   $02
            BCC   L020147
            LDX   #L0208F4
            JMP   L02910D

L020147     LDY   #$0002
            LDA   [$00]
            STA   L0205B1
            LDA   [$00],Y
            STA   L0205B1+2
            JSR   L020597
            PHA
            PHA
            PEA   $0002
            PEA   $0000
            LDA   L02095E
            PHA
            PEA   $C004
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   L02096C
            PLA
            STA   L02096C+2
            BCC   L020183
            LDX   #L020915
            JMP   L02910D

L020183     LDA   L02096C
            STA   $00
            LDA   L02096C+2
            STA   $02
            LDY   #$0002
            LDA   [$00]
            STA   L027412
            STA   $3E
            LDA   [$00],Y
            STA   L027414
            STA   $40
            LDA   #$FFFF
            STA   [$3E]
            PHA
            PHA
            PEA   $0000
            PEA   $0004
            _GetWAP
            PLA
            STA   L0255B2
            PLX
            CLC
            ADC   #$0100
            STA   L0255B0
            LDA   #$0001
            STA   L027637
            STA   L027639
            JSR   L020589
            JSR   L028BA6
            STZ   L0212D9
            STZ   L021270
            STZ   L0212DF
            JSR   L021272
            PEA   $0000
            PEA   $0000
            _GetDblTime
            PLA
            STA   L0275E8
            PLA
            LDA   #$0001
            STA   L02B992
            JSR   L02B980
            LDA   #$0000
            STA   L0210FF
            LDA   #$0004
            STA   L021103
            LDA   #$0060
            STA   L021107
            PHA
            _SetBeat
            LDA   #$0001
            STA   L021105
            PEA   $006E
            _SetTempo
            LDA   #$003C
            STA   L021101
            STZ   L026A87
            STZ   L026A85
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _GetMSData
            PLA
            STA   $70
            PLA
            STA   $72
            PLA
            PLA
            _ShowPen
            JSR   L0292DB
            JSR   L023997
            JSR   L02B277
            JSR   L0292E2
            _InitCursor
            PEA   ^L020034
            PEA   L020034
            _SetCallBack
            JSR   L0270AD
            LDA   L02001B
            BEQ   L020277
            JSR   L029633
L020277     JSR   L0202B7
L02027A     JSR   L020D82
            SEP   #$20
            LDAL  $E1C034
            AND   #$F0
            ORA   L020031
            STAL  $E1C034
            REP   #$20
L02028E     JSL   GSOS
            DW    $0029         ; Quit
            ADRL  L020298
L020298     ADRL  $00000000     ;  path name
            DW    $0000         ;  flags
L02029E     DW    $0002         ; Parms for SetPrefix
            DW    $0000         ;  prefix num
            ADRL  L0202A6       ;  prefix ptr
L0202A6     STRL  '0:Seq.and.Instr'
L0202B7     LDA   #L0202F5
            STA   $6E
            PEA   $0001
            PEA   L020354
            JSR   L02055B
            STZ   L02001F
L0202C8     LDA   L02001F
            BNE   L0202F4
            LDX   #$0000
            JSR   (L02002F,X)
            JSR   L02A100
            PEA   $0000
            PEA   $044F
            PEA   ^L020003
            PEA   L020003
            _GetNextEvent
            PLA
            LDA   L020003
            ASL
            TAX
            JSR   (L0202F5,X)
            BRA   L0202C8
L0202F4     RTS

L0202F5     DA    L020588
            DA    L020588
            DA    L020588
            DA    L02045C
            DA    L020588
            DA    L02045C
            DA    L02032F
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L0203B1
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020383
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
L02032F     LDA   L020005+2
            PHA
            LDA   L020005
            PHA
            _BeginUpdate
            LDA   L020005+2
            PHA
            LDA   L020005
            PHA
            _EndUpdate
            LDX   #$0000
            JSR   (L02001D,X)
            RTS

L020354     STZ   $10
            LDA   $50
            PHA
            LDA   $4E
            PHA
            PEA   $0004
            JSR   L025483
            LDA   $10
            BNE   L020382
            PHA
            PEA   ^L0203A9
            PEA   L0203A9
            LDA   L02000F
            PHA
            LDA   L02000D
            PHA
            _FindWindow
            PLA
            ASL
            TAX
            JSR   (L0202F5,X)
L020382     RTS

L020383     PEA   $0000
            PEA   ^L0203AD
            PEA   L0203AD
            LDA   L02000F
            PHA
            LDA   L02000D
            PHA
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _FindControl
            PLA
            BNE   L0203DD
            RTS

            DB    $00
            DB    $00
L0203A9     DB    $00
            DB    $00
            DB    $00
            DB    $00
L0203AD     DB    $00
            DB    $00
L0203AF     DB    $00
            DB    $00
L0203B1     LDA   #$0001
            STA   $76
            PEA   $0000
            PEA   $040F
            PEA   ^L020003
            PEA   L020003
            _GetNextEvent
            PLA
            STZ   $76
            SEP   #$20
            LDAL  $E1C034
            AND   #$F0
            ORA   #$0A
            STAL  $E1C034
            REP   #$20
            RTS

L0203DD     PHA
            LDA   L02000F
            PHA
            LDA   L02000D
            PHA
            PEA   $FFFF
            PEA   $FFFF
            LDA   L0203AF
            PHA
            LDA   L0203AD
            PHA
            _TrackControl
            PLA
            BNE   L0203FF
            RTS

L0203FF     PHA
            PHA
            LDA   L0203AF
            PHA
            LDA   L0203AD
            PHA
            _GetCtlRefCon
            PLA
            PLX
            DEC
            ASL
            TAX
            JSR   (L020419,X)
            RTS

L020419     DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _KillControls
            RTS

            LDA   #$000F
            STA   L020029
L02044F     LDA   L020029
            PHA
            JSR   L02057C
            DEC   L020029
            BPL   L02044F
            RTS

L02045C     LDA   L020011
            AND   #$0100
            BEQ   L02046D
            LDA   L020005
            AND   #$00FF
            JSR   L02954D
L02046D     RTS

L02046E     STA   L020013
            SEC
            SBC   #$00FA
            ASL
            TAX
            JSR   (L02047B,X)
            RTS

L02047B     DA    L020588
            DA    L020588
            DA    L020588
            DA    L029876
            DA    L020588
            DA    L020588
            DA    L02B250
            DA    L020519
            DA    L0282AB
            DA    L020588
            DA    L02855C
            DA    L027883
            DA    L028761
            DA    L028813
            DA    L0266E8
            DA    L028AAB
            DA    L026233
            DA    L020520
L02049F     DA    L025C3B
            DA    L02A192
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L0294D3
            DA    L02BE2D
            DA    L029752
            DA    L0297B6
            DA    L0297EC
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L02951E
            DA    L025EB7
            DA    L02B866
            DA    L020588
            DA    L0257A7
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
            DA    L020588
L020519     LDA   #$8000
            STA   L02001F
            RTS

L020520     _KillAllNotes
            RTS

L020528     PHA
            PHA
            PEA   ^L020DF2
            PEA   L020DF2
            _NewWindow
            PLA
            STA   L020021
            PLA
            STA   L020021+2
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _SetPort
            RTS
L02054F     RTL

L020550     PLX
            PLA
            PHX
            ASL
            TAX
            LDA   L0202F5,X
            STA   $03,S
            RTS

L02055B     PLX
            PLY
            PLA
            PHX
            ASL
            TAX
            TYA
            TXY
            STA   ($6E),Y
L020565     RTS

            PLX
            PLA
            PHX
            ASL
            TAY
            LDA   #L020565
            STA   ($6E),Y
            RTS

            PLX
            PLY
            PLA
            PHX
            ASL
            TAX
            TYA
            STA   L020419,X
            RTS

L02057C     PLX
            PLA
            PHX
            ASL
            TAX
            LDA   #L020565
            STA   L020419,X
            RTS
L020588     RTS

L020589     PEA   $0000
            PEA   $0000
            _SetMIDIPort
            RTS

L020597     LDA   L0205B1
            STA   $3E
            LDA   L0205B1+2
            STA   $40
            LDY   #$0000
            LDA   #$FFFF
L0205A7     STA   [$3E],Y
            INY
            INY
            CPY   #$2000
            BNE   L0205A7
            RTS

L0205B1     ADRL  $00000000
L0205B5     JSL   INCBUSYFLG
            JSR   L02B20D
            _HideCursor
            LDA   #$28C0
            STA   $16
            LDAL  L020966
            STA   $18
            LDA   L020025
            STA   $1C
            LDA   L020025+2
            STA   $1E
            LDA   #$00A0
            STA   $2E
            STA   $20
            LDA   #$00BA
            STA   $2C
            LDA   #$00A0
            STA   $1A
            JSR   L025501
            _ShowCursor
            RTS

L0205F4     _HideCursor
            LDA   #$28C0
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   L020025
            STA   $16
            LDA   L020025+2
            STA   $18
            LDA   #$00A0
            STA   $2E
            STA   $1A
            LDA   #$00BA
            STA   $2C
            LDA   #$00A0
            STA   $20
            JSR   L025501
            _ShowCursor
            JSR   L02B226
            JSL   DECBUSYFLG
            RTS

L020633     JSR   L02B20D
            _HideCursor
            LDA   #$2000
            STA   $16
            LDAL  L020966
            STA   $18
            LDA   L020025
            STA   $1C
            LDA   L020025+2
            STA   $1E
            LDA   #$00A0
            STA   $2E
            STA   $20
            LDA   #$00C8
            STA   $2C
            LDA   #$00A0
            STA   $1A
            JSR   L025501
            _ShowCursor
            RTS

L02066E     _HideCursor
            LDA   #$2000
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   L020025
            STA   $16
            LDA   L020025+2
            STA   $18
            LDA   #$00A0
            STA   $2E
            STA   $1A
            LDA   #$00C8
            STA   $2C
            LDA   #$00A0
            STA   $20
            JSR   L025501
            _ShowCursor
            JSR   L02B226
            RTS

L0206A9     LDAL  L020966
            STA   $1E
            LDA   #$2992
            STA   $30
            LDA   #$006E
            STA   $2E
            LDA   #$0022
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            LDA   #$3EA0
            STA   $30
            LDA   #$00A0
            STA   $2E
            LDA   #$0097
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            RTS

L0206DE     LDAL  L020966
            STA   $1E
            LDA   #$2000
            STA   $30
            LDA   #$00A0
            STA   $2E
            LDA   #$00C8
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            RTS

L0206FC     LDAL  L020966
            STA   $1E
            LDA   #$2820
            STA   $30
            LDA   #$00A0
            STA   $2E
            LDA   #$00BB
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            RTS

            JSR   L020729
            JMP   L02028E

L020720     JSR   L020729
            JSR   L020D82
            JMP   L02028E

L020729     STX   L020836
            PEA   $0000
            PEA   $0000
            PEA   $0003
            _SetOutputDevice
            PEA   $007F
            PEA   $0080
            _SetOutGlobals
            PEA   $0001
            _InitTextDev
            SEP   #$20
            LDAL  $E0C029
            AND   #$7F
            STAL  $E0C029
            REP   #$20
            JSR   L020819
            JSR   L020820
            BRA   L020786
L020769     STR   'Sorry, can'27't start synthLAB.'
L020786     PEA   ^L020769
            PEA   L020769
            _WriteLine
            JSR   L02080E
            JSR   L020820
            BRA   L0207A0
L02079B     STR   '--> '
L0207A0     PEA   ^L02079B
            PEA   L02079B
            _WriteString
            LDA   $5E
            PHA
            LDA   L020836
            PHA
            _WriteLine
            JSR   L02080E
            JSR   L020819
            JSR   L020820
            BRA   L0207F1
L0207C6     STR   'Press any key to return back to Finder....'
L0207F1     PEA   ^L0207C6
            PEA   L0207C6
            _WriteLine
            CLI
            PEA   $0000
            PEA   $0001
            _ReadChar
            PLA
            RTS

L02080E     PEA   $000D
            _WriteChar
            RTS

L020819     JSR   L02080E
            JSR   L02080E
            RTS

L020820     BRA   L020828
L020822     STR   '     '
L020828     PEA   ^L020822
            PEA   L020822
            _WriteString
            RTS

L020836     DW    $0000
L020838     STR   'System needs at least 1 MEG of memory.'
            STR   'Not enough free memory available.'
            STR   'Serial ports are busy.'
L020898     STR   '1 second IRQs must be OFF'
            STR   'AppleTalk must be turned OFF.'
L0208D0     STR   'Memory is too fragmented. (Scratch)'
L0208F4     STR   'Memory is too fragmented. (List)'
L020915     STR   'Memory is too fragmented. (SeqBuf)'
L020938     STR   'GS/OS must be version 3.01 or greater'
L02095E     DW    $0000
            DB    $00
            DB    $00
L020962     DB    $00
            DB    $00
L020964     DB    $00
            DB    $00
L020966     DB    $00
            DB    $00
L020968     ADRL  $00000000
L02096C     ADRL  $00000000
L020970     ADRL  $00000000
L020974     DW    $0000
            DW    $0080
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $000D         ; number of tools
            DW    $0003         ; misc tool set
            DW    $0300
            DW    $0004         ; quickdraw II
            DW    $0301
            DW    $0006         ; event manager
            DW    $0300
            DW    $0008         ; sound tool set
            DW    $0300
            DW    $000B         ; int math tool set
            DW    $0300
            DW    $000E         ; window manager
            DW    $0301
            DW    $000F         ; menu manager
            DW    $0301
            DW    $0010         ; control manager
            DW    $0301
            DW    $0012         ; quickdraw II aux
            DW    $0301
            DW    $0014         ; lineedit tool set
            DW    $0301
            DW    $0015         ; dialog manager
            DW    $0302
            DW    $0017         ; std file tool set
            DW    $0301
            DW    $001C         ; list manager
            DW    $0301
L0209B4     BCS   L0209B7
            RTS

L0209B7     PLA
            PLA
            JMP   L020720

L0209BC     _TLStartUp
            PHA
            _MMStartUp
            PLA
            ORA   #$0100
            STA   L02095E
            _MTStartUp
            PHA
            PHA
            LDA   L02095E
            PHA
            PEA   $0000
            PEA   ^L020974
            PEA   L020974
            _StartUpTools
            TAX
            PLA
            STA   L020968
            PLA
            STA   L020968+2
            TXA
            LDX   #L020D5A
            JSR   L0209B4
            _HideMenuBar
            PHA
            PHA
            _GetPort
            PHD
            TSC
            TCD
            LDY   #$0004
            LDA   [$03],Y
            AND   #$00FF
            STAL  L020966
            PLD
            PLA
            STA   L020962
            PLA
            STA   L020964
            PEA   $0000
            PEA   ^L020F55
            PEA   L020F55
            _SetColorTable
            JSR   L020528
            JSL   L030000
            SEP   #$20
            LDAL  $E1C034
            STA   L020031
            AND   #$F0
            ORA   #$0A
            STAL  $E1C034
            LDA   L020031
            AND   #$0F
            STA   L020031
            REP   #$20
            RTS

L020A5A     SEI
            JSR   L020A81
            BCC   L020A67
            PLA
            LDX   #L020CE1
            JMP   L02910D

L020A67     _MSStartUp
            BCC   L020A77
            PLA
            LDX   #L020CBD
            JMP   L02910D

L020A77     LDA   L02001B
            BNE   L020A7F
            JSR   L020ACE
L020A7F     CLI
            RTS

L020A81     STZ   L020C27
            PEA   $0023
            PEA   $0000
            _LoadOneTool
            BCC   L020ACD
            PHA
            PHA
            PHA
            PHA
            PHA
*            PEA   $0FB7
	pea   $0000		; 202303 - Ask for a userID
            PEA   ^L020C46
            PEA   L020C46
            PEA   $0001
            _InitialLoad
            PLA
	sta   userID	; 202303 - Assigned userID
            PLA
            STA   L020C26
            PLA
            STA   L020C28
            PLA
            PLA
            BCS   L020ACD
            PEA   $0000
            PEA   $0023
            LDA   L020C28
            PHA
            LDA   L020C26
            PHA
            _SetTSPtr
L020ACD     RTS

userID      ds    2		; 202303 - Room for the userID

L020ACE     JSL   GSOS
            DW    $0010         ; Open
            ADRL  L020BE7
            BCC   L020ADD
            BRL   L020B62
L020ADD     LDA   L020BE7
            STA   L020BF1
            STA   L020BFF
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L020BF1
            BCC   L020AF5
            BRL   L020B62
L020AF5     JSL   GSOS
            DW    $0014         ; Close
            ADRL  L020BFF
            SEP   #$30
            LDA   L020C05
            TAX
            CLC
            ADC   L020C50
            STA   L020C50
L020B0C     DEX
            BMI   L020B17
            LDA   L020C06,X
            STA   L020C62,X
            BRA   L020B0C
L020B17     REP   #$30
            PHA
            PHA
            PHA
            PHA
            PHA
            LDA   L02095E
            PHA
            PEA   ^L020C50
            PEA   L020C50
            PEA   $0001
            _InitialLoad
            PLA
            PLA
            STA   L020C83
            PLA
            STA   L020C85
            PLA
            PLA
            BCS   L020B7B
            LDA   L020C03
            PHA
            LDA   L020C01
            PHA
            LDA   L02095E
            PHA
            LDA   L020C85
            PHA
            LDA   L020C83
            PHA
            _InitMIDIDriver
            BCS   L020B80
            LDA   #$FFFF
            STA   $7A
            RTS

L020B62     JSL   GSOS
            DW    $0014         ; Close
            ADRL  L020BFF
            LDA   #L020B85
L020B6F     STA   L02BA61
            STZ   $7A
            LDA   #L02BACA
            STA   L02049F
            RTS

L020B7B     LDA   #L020BA3
            BRA   L020B6F
L020B80     LDA   #L020BC4
            BRA   L020B6F

L020B85     STR   'Can'D5't find 'D2'Midi.Setup'D3' file.'
L020BA3     STR   'Can'D5't find the MIDI driver file.'
L020BC4     STR   'Error in starting the MIDI driver.'

L020BE7     DW    $0000         ;  ref num
            ADRL  L020C2A       ;  path name
            ADRL  $00000000     ;  reserved
L020BF1     DW    $0000         ;  ref num
            ADRL  L020C01       ;  buffer ptr
            ADRL  $00000025     ;  request count
            ADRL  $00000000     ;  transfer count
L020BFF     DW    $0000         ;  ref num
L020C01     DB    $00
            DB    $00
L020C03     DB    $00
            DB    $00
L020C05     DB    $00
L020C06     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020C26     DB    $00
L020C27     DB    $00
L020C28     DB    $00
            DB    $00
L020C2A     STR   '*/System/Drivers/MIDI.Setup'
L020C46     STR   '9/Tool035'
L020C50     STR   '*/System/Drivers/'
L020C62     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020C83     DB    $00
            DB    $00
L020C85     DB    $00
            DB    $00
            STR   'Initializing SynthLAB...'
            STR   'Sound Manager startup ERROR.'
L020CBD     STR   'MIDI Synth (Tool035) startup ERROR.'
L020CE1     STR   'Can'D5't find MIDI Synth (Tool035).'
            STR   'ProDOS Error #0000.'
            STR   'Tool00 not found in Tools Dir.'
            STR   'Can'D5't find -Apple.Midi- driver file.'
L020D5A     STR   'Error occurred while starting up tools.'
L020D82     JSL   L030033
            _MSShutDown
            LDA   L020C27
            BEQ   L020DA1
            PHA
*            PEA   $4023
	lda   userID	; 202303 - Shutdown assigned userID
	pha
            PEA   $0000
            _UserShutDown
            PLA
L020DA1     _HideMenuBar
            _ShowMenuBar
            PEA   $0000
            LDA   L020968+2
            PHA
            LDA   L020968
            PHA
            _ShutDownTools
            LDA   L020970+2
            PHA
            LDA   L020970
            PHA
            _DisposeHandle
            LDA   L02096C+2
            PHA
            LDA   L02096C
            PHA
            _DisposeHandle
            LDA   L02095E
            PHA
            _MMShutDown
            _TLShutDown
            RTS

L020DF2     DW    $004E
            DW    $0020         ; frame bits
            ADRL  L020E40       ; title ptr
            ADRL  $00000000     ; refcon
            DW    $0000         ; zoom rect
            DW    $0000
            DW    $0000
            DW    $0000
            ADRL  L020E4D       ; color table ptr
            DW    $0000         ; origin
            DW    $0000
            DW    $0000         ; data size
            DW    $0000
            DW    $00C8         ; max size
            DW    $0280
            DW    $0000         ; scroll size
            DW    $0000
            DW    $0000         ; page size
            DW    $0000
            ADRL  $00000000     ; info bar refcon
            DW    $0000         ; info bar hite
            ADRL  $00000000     ; window defproc
            ADRL  $00000000     ; info bar defproc
            ADRL  L02054F       ; content defproc
            DW    $0000         ; content rect
            DW    $0000
            DW    $00C8
            DW    $0280
            ADRL  $FFFFFFFF     ; starting plane
            ADRL  $00000000     ; storage ptr
L020E40     STR   ' Synth Edit '
L020E4D     DB    $00
            DB    $00
            DB    $00
            DB    $0F
            DB    $09
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $DF
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DF
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DF
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DF
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $89
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $89
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $89
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $89
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $79
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $79
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $79
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $79
            DB    $05
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $68
            DB    $04
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $68
            DB    $04
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $68
            DB    $04
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $68
            DB    $04
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $78
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $78
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $78
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $78
            DB    $0A
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $8A
            DB    $07
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $8A
            DB    $07
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $8A
            DB    $07
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $8A
            DB    $07
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $9A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $9A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $9A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $9A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $7A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $7A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $7A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $7A
            DB    $00
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
L020F55     DB    $00
            DB    $00
            DB    $DB
            DB    $0E
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DB
            DB    $0E
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DB
            DB    $0E
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
            DB    $00
            DB    $00
            DB    $DB
            DB    $0E
            DB    $FF
            DB    $0F
            DB    $AA
            DB    $0A
L020F75     DB    $D2
            DB    $01
L020F77     DB    $4D
            DB    $53
L020F79     DB    $45
            DB    $51
L020F7B     DB    $00
            DB    $01
L020F7D     DB    $D2
            DB    $01
            STR   'SynthLAB'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020F8F     STR   'Synth.bnk'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020F9F     STR   'Track 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 3'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 4'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 6'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 7'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 8'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 9'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 10'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 11'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 12'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 13'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 14'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 15'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Track 16'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02109F     HEX   7F007F007F007F007F007F007F007F00
            HEX   7F007F007F007F007F007F007F007F00
L0210BF     HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L0210DF     HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L0210FF     DW    $0000
L021101     DW    $003C
L021103     DW    $0001
L021105     DW    $0000
L021107     DW    $0060
L021109     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L021149     LDA   #$000F
            STA   L0211C2
L02114F     PEA   $0000
            PEA   $0002
            LDA   #$00B0
            ORA   L0211C2
            PHA
            LDA   #$0007
            PHA
            LDA   L0211C2
            ASL
            TAX
            LDA   L02109F,X
            PHA
            _MIDIMessage
            LDA   L0211C2
            PHA
            ASL
            TAX
            LDA   L0210BF,X
            PHA
            _TrackToChannel
            LDA   L0211C2
            PHA
            ASL
            TAX
            LDA   L0210DF,X
            PHA
            _SetPlayTrack
            LDA   L0211C2
            PHA
            ASL
            TAX
            LDA   L021109,X
            PHA
            _SetTrackOut
            DEC   L0211C2
            BPL   L02114F
            LDA   L0210FF
            PHA
            _SetRecTrack
            JSR   L027153
            LDA   L021107
            PHA
            _SetBeat
            RTS

L0211C2     DB    $00
            DB    $00
L0211C4     DB    $00
            DB    $00
L0211C6     DB    $00
            DB    $00
L0211C8     DB    $00
            DB    $00
L0211CA     DB    $00
            DB    $00
L0211CC     DB    $00
            DB    $00
L0211CE     DB    $00
            DB    $00
L0211D0     DB    $00
            DB    $00
L0211D2     DB    $00
            DB    $00
L0211D4     LDY   #$0010
            LDA   ($00),Y
            CMP   L02121F
            BNE   L0211DF
            RTS

L0211DF     STA   L02121F
            LDA   $00
            PHA
            LDA   L021221
            STA   $00
            LDX   #$0000
            JSR   L0212F6
            PLA
            STA   $00
            STA   L021221
            JSR   L0212E1
            LDA   L02121F
            ASL
            TAX
            JSR   (L021202,X)
            RTS

L021202     DA    L0270AD
            DA    L027CC1
            DA    L028CB4
L021208     LDY   #$0010
            LDA   ($00),Y
            CMP   L02121F
            BNE   L02121B
            JSR   L0212E1
            LDA   $00
            STA   L021221
            RTS

L02121B     JSR   L0212F6
            RTS

L02121F     DW    $0000
L021221     DW    $0000
L021223     LDY   #$0010
            LDA   ($00),Y
            CMP   L021270
            BNE   L02122E
            RTS

L02122E     STA   L021270
            LDA   $00
            PHA
            LDA   L02126E
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
            STA   L02126E
            JSR   L0212E1
            JSR   L021272
            LDX   #$0000
            JSR   (L02126C,X)
            RTS

L02124F     LDY   #$0010
            LDA   ($00),Y
            CMP   L021270
            BNE   L021265
            JSR   L0212E1
            LDA   $00
            STA   L02126E
            JSR   L021272
            RTS

L021265     JSR   L0212F6
            JSR   L021272
            RTS

L02126C     DW    $0000
L02126E     DW    $0000
L021270     DW    $0000
L021272     PEA   $0000
            LDA   L0212DF
            ASL
            PHA
            PEA   $0090
            JSR   L021342
            PLA
            CLC
            ADC   #L022797
            STA   $3A
            STA   $54
            CLC
            ADC   #$0090
            STA   $56
            LDX   L021270
            BNE   L021296
            LDA   $54
L021296     STA   $3A
            ADC   #$0010
            STA   $3C
            STA   $52
            LDA   L0212D9
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   $52
            STA   $3C
            LDA   $54
            ADC   #$0010
            STA   $78
            RTS

L0212B3     CMP   L0212D9
            BEQ   L0212D8
            STA   L0212D9
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   $52
            STA   $3C
            LDA   L02126C
            CMP   #L027D0E
            BNE   L0212D8
            LDA   $50
            PHA
            LDA   $4E
            PHA
            PEA   $0000
            JSR   L025483
L0212D8     RTS

L0212D9     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0212DF     DB    $00
            DB    $00
L0212E1     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$0006
            LDA   [$6A],Y
            BRA   L021309
L0212F6     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$0004
            LDA   [$6A],Y
L021309     STA   $16
            LDA   L02002D
            STA   $18
            LDY   #$0002
            LDA   [$6A],Y
            LSR
            LSR
            STA   $2E
            STA   $1A
            LDY   #$0000
            LDA   [$6A],Y
            STA   $2C
            LDY   #$0006
            LDA   ($00),Y
            STA   $06
            LDY   #$0004
            LDA   ($00),Y
            STA   $04
            _HideCursor
            JSR   L0254E3
            _ShowCursor
            RTS

L021342     PLX
            PLA
            STA   $4A
            PLA
            STA   $46
            PLA
            STA   $42
L02134C     LDA   $46
            BEQ   L021363
            LSR
            STA   $46
            BCC   L02135C
            LDA   $42
            CLC
            ADC   $4A
            STA   $42
L02135C     LDA   $4A
            ASL
            STA   $4A
            BRA   L02134C
L021363     PEI   $42
            PHX
            RTS

            STA   $00
            ASL
            ASL
            ASL
            ASL
            ORA   $00
            SEP   #$20
            LDX   #$0020
L021374     STA   L021389,X
            DEX
            BNE   L021374
            REP   #$20
            PEA   ^L02138A
            PEA   L02138A
            _SetPenPat
L021389     RTS

L02138A     HEX   05050505050505050505050505050505
            HEX   05050505050505050505050505050505
L0213AA     PEA   $0000
            BRA   L0213BC
            PEA   $0002
            BRA   L0213BC
            PEA   $0004
            BRA   L0213BC
            PEA   $0006
L0213BC     _HideCursor
            PLX
            LDA   $30
            STA   $36
            LDAL  L020966
            STA   $38
            BRA   L0213D8
L0213D0     LDA   $36
            CLC
            ADC   #$00A0
            STA   $36
L0213D8     LDY   $2E
            DEY
            DEY
            BMI   L0213E1
            JSR   (L0213ED,X)
L0213E1     DEC   $2C
            BNE   L0213D0
            _ShowCursor
            RTS

L0213ED     DA    L0213F5
            DA    L0213FE
            DA    L021409
            DA    L021414
L0213F5     LDA   $32
L0213F7     STA   [$36],Y
            DEY
            DEY
            BPL   L0213F7
            RTS

L0213FE     LDA   [$36],Y
            EOR   $32
            STA   [$36],Y
            DEY
            DEY
            BPL   L0213FE
            RTS

L021409     LDA   [$36],Y
            ORA   $32
            STA   [$36],Y
            DEY
            DEY
            BPL   L021409
            RTS

L021414     LDA   [$36],Y
            AND   $32
            STA   [$36],Y
            DEY
            DEY
            BPL   L021414
            RTS

L02141F     DB    $F0
            DB    $0F
            DB    $CF
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $3F
            DB    $00
            DB    $FF
            DB    $00
            DB    $00
            DB    $F0
            DB    $FF
            DB    $00
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $00
            DB    $0F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FC
            DB    $3F
            DB    $F0
            DB    $FF
            DB    $C3
            DB    $FF
            DB    $00
            DB    $0F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $F0
            DB    $3F
            DB    $FF
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $0F
            DB    $FF
            DB    $00
            DB    $3F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $FF
            DB    $00
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FC
            DB    $3F
            DB    $F0
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $C3
            DB    $FF
            DB    $C3
            DB    $FF
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $C0
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $0F
            DB    $C0
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $00
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $00
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $00
            DB    $00
L02151F     DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
L02152F     DB    $00
            DB    $00
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $2A
            DB    $AA
L021549     DB    $00
            DB    $02
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $FF
            DB    $FA
            DB    $AA
            DB    $AA
L021563     DW    $0000
            DW    $0001
            DW    $0002
            DW    $0003
            DW    $0004
            DW    $0005
            DW    $0006
            DW    $0007
            DW    $0008
            DW    $0009
            DW    $0010
            DW    $0011
            DW    $0012
            DW    $0013
            DW    $0014
            DW    $0015
            DW    $0016
            DW    $0017
            DW    $0018
            DW    $0019
            DW    $0020
            DW    $0021
            DW    $0022
            DW    $0023
            DW    $0024
            DW    $0025
            DW    $0026
            DW    $0027
            DW    $0028
            DW    $0029
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
            DW    $0040
            DW    $0041
            DW    $0042
            DW    $0043
            DW    $0044
            DW    $0045
            DW    $0046
            DW    $0047
            DW    $0048
            DW    $0049
            DW    $0050
            DW    $0051
            DW    $0052
            DW    $0053
            DW    $0054
            DW    $0055
            DW    $0056
            DW    $0057
            DW    $0058
            DW    $0059
            DW    $0060
            DW    $0061
            DW    $0062
            DW    $0063
            DW    $0064
            DW    $0065
            DW    $0066
            DW    $0067
            DW    $0068
            DW    $0069
            DW    $0070
            DW    $0071
            DW    $0072
            DW    $0073
            DW    $0074
            DW    $0075
            DW    $0076
            DW    $0077
            DW    $0078
            DW    $0079
            DW    $0080
            DW    $0081
            DW    $0082
            DW    $0083
            DW    $0084
            DW    $0085
            DW    $0086
            DW    $0087
            DW    $0088
            DW    $0089
            DW    $0090
            DW    $0091
            DW    $0092
            DW    $0093
            DW    $0094
            DW    $0095
            DW    $0096
            DW    $0097
            DW    $0098
            DW    $0099
L02162B     PHA
            LDY   #$0012
            LDA   ($00),Y
            STA   $1C
            LDA   #L02152F
            JSR   L02165A
            PLA
            PHA
            AND   #$00F0
            BNE   L021645
            JSR   L021691
            BRA   L021648
L021645     JSR   L021696
L021648     PLA
            ASL
            ASL
            ASL
            ASL
            AND   #$00F0
            JSR   L021696
            LDA   #L021549
            JSR   L02165A
            RTS

L02165A     STA   $16
            LDA   $1C
            STA   $3E
            LDAL  L020966
            STA   $40
            LDX   #$000D
            LDY   #$0000
L02166C     LDA   ($16),Y
            STA   [$3E]
            LDA   $3E
            CLC
            ADC   #$00A0
            STA   $3E
            INY
            INY
            DEX
            BNE   L02166C
            BRA   L02168C
L02167F     LDA   $3E
            CLC
            ADC   #$00A0
            STA   $3E
            LDA   #$AAAA
            STA   [$3E]
L02168C     INC   $1C
            INC   $1C
            RTS

L021691     LDA   #L02151F
            BRA   L02169A
L021696     CLC
            ADC   #L02141F
L02169A     STA   $16
            LDA   $1C
            STA   $3E
            LDAL  L020966
            STA   $40
            LDA   #$0000
            STA   [$3E]
            JSR   L0216CA
            LDX   #$0007
            LDY   #$0000
L0216B4     LDA   $3E
            CLC
            ADC   #$00A0
            STA   $3E
            LDA   ($16),Y
            STA   [$3E]
            INY
            INY
            DEX
            BNE   L0216B4
            JSR   L0216CA
            BRA   L02167F
L0216CA     LDA   $3E
            CLC
            ADC   #$00A0
            STA   $3E
            LDA   #$FFFF
            STA   [$3E]
            LDA   $3E
            CLC
            ADC   #$00A0
            STA   $3E
            LDA   #$FFFF
            STA   [$3E]
            RTS

            DW    $0000
            DW    $0006
            DW    $000C
            DW    $0012
            DW    $0018
            DW    $001E
            DW    $0024
            DW    $002A
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021701     DW    $0000
L021703     DW    $0000
L021705     DW    $0000
L021707     STZ   L021703
            LDA   L027639
            STA   L021701
L021710     CMP   #$0063
            BCC   L021723
            BEQ   L021723
            INC   L021703
            SEC
            SBC   #$0064
            STA   L021701
            BRA   L021710
L021723     ASL
            TAX
            LDA   L021563,X
            STA   L021701
            LDA   #$494D
            STA   L021705
            LDA   L021703
            BNE   L021746
            JSR   L021788
            LDA   L021701
            AND   #$00F0
            BNE   L02174F
            JSR   L021788
            BRA   L021756
L021746     JSR   L0217AC
            LDA   L021701
            AND   #$00F0
L02174F     LSR
            LSR
            LSR
            LSR
            JSR   L0217AC
L021756     LDA   L021701
            AND   #$000F
            JSR   L0217AC
            JSR   L0217A7
            LDA   L027637
            ASL
            TAX
            LDA   L021563,X
            STA   L021701
            AND   #$00F0
            BNE   L021777
            JSR   L021788
            BRA   L02177E
L021777     LSR
            LSR
            LSR
            LSR
            JSR   L0217AC
L02177E     LDA   L021701
            AND   #$000F
            JSR   L0217AC
            RTS

L021788     LDAL  L020966
            STA   $1E
            LDA   L021705
            STA   $30
            LDA   #$0004
            STA   $2E
            LDA   #$0009
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            BRA   L0217D8
L0217A7     LDA   #L043D6A
            BRA   L0217B2
L0217AC     ASL
            TAX
            LDAL  L043BEE,X
L0217B2     STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0004
            STA   $2E
            STA   $1A
            LDA   #$0009
            STA   $2C
            LDA   L021705
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            JSR   L025501
L0217D8     LDA   L021705
            CLC
            ADC   #$0004
            STA   L021705
            RTS

L0217E3     DW    $0005
            DW    $0000
            DW    $0018
            DW    $0014
            DA    L0211D4
            DA    L021208
            ADRL  L042846
            DW    $0000
L0217F5     DW    $0005
            DW    $0000
            DW    $0018
            DW    $004C
            DA    L0211D4
            DA    L021208
            ADRL  L04284E
            DW    $0001
L021807     DW    $0005
            DW    $0000
            DW    $0018
            DW    $0084
            DA    L0211D4
            DA    L021208
            ADRL  L042856
            DW    $0002
L021819     DW    $0005
            DW    $0000
            DW    $0064
            DW    $0054
            DA    L021223
            DA    L02124F
            ADRL  L04303E
            DW    $0000
L02182B     DW    $0005
            DW    $0000
            DW    $0064
            DW    $0084
            DA    L021223
            DA    L02124F
            ADRL  L043046
            DW    $0001
L02183D     DW    $0000
L02183F     ADRL  $00000000
L021843     DB    $00
            DB    $00
            DB    $00
            DB    $00
L021847     DB    $00
            DB    $00
L021849     DB    $00
            DB    $00
L02184B     DB    $00
            DB    $00
            DB    $00
            DB    $00
L02184F     DW    $0000
L021851     DW    $0000
L021853     ADRL  $00000000
L021857     DW    $0000
L021859     DW    $0000
L02185B     DW    $0000
L02185D     DA    L025500
L02185F     STZ   L02183D
L021862     LDA   L02183D
            BNE   L0218A4
            JSR   L02A100
            STZ   $76
            PEA   $0000
            PEA   $044F
            PEA   ^L020003
            PEA   L020003
            _GetNextEvent
            PLA
            LDA   L020003
            ASL
            TAX
            JSR   (L0218A8,X)
            LDX   #$0000
            JSR   (L02185D,X)
            LDA   L021851
            BEQ   L021862
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEIdle
            BRA   L021862
L0218A4     STZ   L0218F2
            RTS

L0218A8     DA    L025500
            DA    L0218F4
            DA    L025500
            DA    L02198C
            DA    L025500
            DA    L02198C
            DA    L0218C8
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L0203B1
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
            DA    L025500
L0218C8     LDA   L020005+2
            PHA
            LDA   L020005
            PHA
            _BeginUpdate
            LDA   L020005+2
            PHA
            LDA   L020005
            PHA
            _EndUpdate
            LDA   L0218F2
            BEQ   L0218F1
            LDX   #$0000
            JSR   (L0218F2,X)
L0218F1     RTS

L0218F2     DA    $0000
L0218F4     PHA
            PEA   ^L021843
            PEA   L021843
            LDA   L02000F
            PHA
            LDA   L02000D
            PHA
            _FindWindow
            PLA
            STA   L02184F
            STZ   $10
            LDA   $50
            PHA
            LDA   $4E
            PHA
            PEA   $0004
            JSR   L025483
            LDA   $10
            BEQ   L021921
            RTS

L021921     PEA   $0000
            PEA   ^L02184B
            PEA   L02184B
            LDA   L02000F
            PHA
            LDA   L02000D
            PHA
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _FindControl
            PLA
            STA   L021857
            BNE   L02194A
            JSR   L02194B
L02194A     RTS

L02194B     LDA   L021851
            BEQ   L02198B
            LDA   L02185B
            STA   $42
            LDY   #$0000
            LDA   ($42),Y
            STA   $08
            LDY   #$0004
            LDA   ($42),Y
            STA   $0C
            LDY   #$0002
            LDA   ($42),Y
            STA   $0A
            LDY   #$0006
            LDA   ($42),Y
            STA   $0E
            JSR   L02555A
            BCC   L02198B
            PEA   ^L020003
            PEA   L020003
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEClick
L02198B     RTS

L02198C     LDA   L020011
            AND   #$0100
            BNE   L0219A8
            LDA   L020005
            AND   #$00FF
            CMP   #$000D
            BNE   L0219A8
            LDX   #$0000
            JSR   (L0219F8,X)
            JMP   L0219F7

L0219A8     LDA   L021851
            BNE   L0219B0
            JMP   L0219F7

L0219B0     LDA   L020011
            AND   #$0100
            BNE   L0219CA
            LDA   L020005
            AND   #$00FF
            CMP   #$007F
            BEQ   L0219C5
            BCS   L0219DA
L0219C5     CMP   #$0020
            BCS   L0219DD
L0219CA     LDA   L020005
            AND   #$00FF
            CMP   #$0008
            BEQ   L0219DD
            CMP   #$0015
            BEQ   L0219DD
L0219DA     BRL   L0219F7
L0219DD     LDA   L020005
            AND   #$00FF
            PHA
            LDA   L020011
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEKey
L0219F7     RTS

L0219F8     DA    L021AC7
L0219FA     LDA   $50
            STA   L021849
            LDA   $4E
            STA   L021847
            LDA   $00
            STA   L021859
            RTS

L021A0A     LDA   L021849
            STA   $50
            LDA   L021847
            STA   $4E
            LDA   L021859
            STA   $00
            RTS

L021A1A     STA   $3E
            LDY   #$0006
L021A1F     LDA   ($3E),Y
            STA   L021AB9,Y
            STA   L021AB1,Y
            DEY
            DEY
            BPL   L021A1F
            PEA   $0003
            _SetSolidPenPat
            PEA   ^L021AB1
            PEA   L021AB1
            _PaintRect
            PEA   $0000
            _SetSolidPenPat
            PEA   $0003
            PEA   $0001
            _SetPenSize
            PEA   ^L021AB1
            PEA   L021AB1
            _FrameRect
            PEA   $0005
            PEA   $0002
            _SetPenSize
            PEA   ^L021AB9
            PEA   L021AB9
            PEA   $0008
            PEA   $0003
            _InsetRect
            PEA   ^L021AB9
            PEA   L021AB9
            _FrameRect
            PEA   $0001
            PEA   $0001
            _SetPenSize
            LDA   $6E
            STA   L021AC1
            LDA   #L0218A8
            STA   $6E
            RTS

L021AAB     LDA   L021AC1
            STA   $6E
            RTS

L021AB1     DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021AB9     DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021AC1     DW    $0000
L021AC3     DW    $0000
L021AC5     DW    $0000
L021AC7     LDA   L021AC5
            STA   $00
            JSR   L021AD6
            JSR   L021B04
            JSR   L021AEC
            RTS

L021AD6     JSR   L0212E1
            LDA   #$FFFF
            STA   L021AC3
            RTS

L021AE0     JSR   L0212F6
            STZ   L021AC3
            LDA   $00
            STA   L021AC5
            RTS

L021AEC     LDA   L021AC3
            STA   L02183D
            RTS

L021AF3     JSR   L025353
            BCS   L021AFE
            LDA   L021AC3
            BNE   L021AE0
            RTS

L021AFE     LDA   L021AC3
            BEQ   L021AD6
            RTS

L021B04     PHA
            PHA
            _GetTick
            PLA
            CLC
            ADC   #$0014
            STA   L021B38
            PLA
            ADC   #$0000
            STA   L021B3A
L021B1C     PHA
            PHA
            _GetTick
            PLA
            STA   L021B3C
            PLA
            CMP   L021B3A
            BCC   L021B1C
            LDA   L021B3C
            CMP   L021B38
            BCC   L021B1C
            RTS

L021B38     DW    $0000
L021B3A     DW    $0000
L021B3C     DW    $0000
L021B3E     DW    $0000
L021B40     DW    $0000
L021B42     LDA   L021B40
            STA   $00
            JSR   L021B51
            JSR   L021B04
            JSR   L021B67
            RTS

L021B51     JSR   L0212E1
            LDA   #$FFFF
            STA   L021B3E
            RTS

L021B5B     JSR   L0212F6
            STZ   L021B3E
            LDA   $00
            STA   L021B40
            RTS

L021B67     LDA   L021B3E
            STA   L02183D
            RTS

L021B6E     JSR   L025353
            BCS   L021B79
            LDA   L021B3E
            BNE   L021B5B
            RTS

L021B79     LDA   L021B3E
            BEQ   L021B51
            RTS

L021B7F     DW    $0000
L021B81     DW    $0000
            LDA   L021B81
            STA   $00
            JSR   L021B92
            JSR   L021B04
            JSR   L021BA8
            RTS

L021B92     JSR   L0212E1
            LDA   #$FFFF
            STA   L021B7F
            RTS

L021B9C     JSR   L0212F6
            STZ   L021B7F
            LDA   $00
            STA   L021B81
            RTS

L021BA8     LDA   L021B7F
            STA   L02183D
            RTS

L021BAF     JSR   L025353
            BCS   L021BBA
            LDA   L021B7F
            BNE   L021B9C
            RTS

L021BBA     LDA   L021B7F
            BEQ   L021B92
            RTS

L021BC0     LDA   $14
            CMP   #$0000
            BNE   L021BC9
            BRA   L021BD3
L021BC9     CMP   #$0004
            BNE   L021BD1
            JMP   L021BF3

L021BD1     CLC
            RTS

L021BD3     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$000A
            LDA   ($00),Y
            BEQ   L021BF1
            STA   L021C7A
            LDX   #$0000
            JSR   (L021C7A,X)
L021BF1     CLC
            RTS

L021BF3     JSR   L025353
            BCS   L021BF9
            RTS

L021BF9     INC   $10
            PEA   L021C16
            PEA   L021C25
            JSR   L021C37
            LDY   #$0008
            LDA   ($00),Y
            BEQ   L021C14
            STA   L021C7A
            LDX   #$0000
            JSR   (L021C7A,X)
L021C14     SEC
            RTS

L021C16     LDY   #$0010
            LDA   ($00),Y
            STA   L021C7A
            LDX   #$0000
            JSR   (L021C7A,X)
            RTS

L021C25     LDY   #$0012
            LDA   ($00),Y
            STA   L021C7A
            LDX   #$0000
            JSR   (L021C7A,X)
            JSR   L021C65
            RTS

L021C37     PEA   $0000
            PEA   $0000
            JSR   L021C86
            PLA
            STA   L021C7E
            PEA   $0000
            PEA   $0002
            JSR   L021C86
            PLA
            STA   L021C82
            PLX
            PLY
            PLA
            PHX
            PEA   $0002
            PHY
            PEA   $0000
            PHA
            JSR   L021C91
            JSR   L021C91
            SEC
            RTS

L021C65     PEA   $0000
            LDA   L021C7E
            PHA
            JSR   L021C91
            PEA   $0002
            LDA   L021C82
            PHA
            JSR   L021C91
            RTS

L021C7A     DA    $0000
            DA    $0000
L021C7E     DA    $0000
            DA    $0000
L021C82     DA    $0000
            DA    $0000
L021C86     PLX
            PLA
            PHX
            ASL
            TAX
            LDA   L0218A8,X
            STA   $03,S
            RTS

L021C91     PLX
            PLY
            PLA
            PHX
            ASL
            TAX
            TYA
            STA   L0218A8,X
            RTS

L021C9C     PHB
            PHD
            PHK
            PLB
            LDA   L02002B
            TCD
            LDA   $07,S
            STA   $3E
            LDA   $09,S
            STA   $40
            LDY   #$0002
            LDA   [$3E]
            STA   $66
            LDA   [$3E],Y
            STA   $68
            LDA   $0F,S
            STA   L021CE9
            LDA   $0B,S
            STA   L021CEB
            LDA   $0D,S
            STA   L021CED
            STZ   L021CEF
            STZ   L021CF1
            JSR   L021CF3
            LDA   L021CEF
            STA   $11,S
            LDA   L021CF1
            STA   $13,S
            PLD
            PLB
            LDA   $02,S
            STA   $0C,S
            PLA
            STA   $09,S
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L021CE9     DW    $0000
L021CEB     DW    $0000
L021CED     DW    $0000
L021CEF     DW    $0000
L021CF1     DW    $0000
L021CF3     LDA   L021CE9
            CMP   #$000D
            BCS   L021D1D
            ASL
            TAX
            LDAL  L021D03,X
            PHA
            RTS

L021D03     DA    L021D2E
            DA    L021D1B+1
            DA    L021D27
            DA    L021D26
            DA    L021D1D+1
            DA    L021D2E
            DA    L021D1B+1
            DA    L021D1B+1
            DA    L021D1B+1
            DA    L021D2E
            DA    L021D1B+1
            DA    L021D1B+1
L021D1B     DA    L021D1F
L021D1D     DW    $0000
L021D1F     RTS

            LDA   #$0028
            STA   L021CEF
L021D26     RTS
L021D27     RTS

            LDA   #$0002
            STA   L021CEF
L021D2E     RTS

            LDY   #$0008
            LDA   [$66],Y
            STA   L021DB7
            INY
            INY
            LDA   [$66],Y
            STA   L021DB9
            PEA   ^L021DB7
            PEA   L021DB7
            _LocalToGlobal
            LDY   #$001C
            LDA   [$66],Y
            STA   $6A
            INY
            INY
            LDA   [$66],Y
            STA   $6C
            STZ   L021DBB
            LDY   #$0011
            LDA   [$66],Y
            LDY   #$0004
            AND   #$00FF
            BEQ   L021D78
            CMP   #$00FF
            BNE   L021D72
            LDY   #$0008
            BRA   L021D78
L021D72     LDY   #$0006
            STY   L021DBB
L021D78     LDA   [$6A],Y
            STA   $16
            LDA   L02002D
            STA   $18
            LDY   #$0002
            LDA   [$6A],Y
            LSR
            LSR
            STA   $2E
            STA   $1A
            LDY   #$0000
            LDA   [$6A],Y
            STA   $2C
            LDA   L021DB9
            STA   $06
            LDA   L021DB7
            STA   $04
            _HideCursor
            JSR   L0254E3
            _ShowCursor
            LDA   L021DBB
            BEQ   L021DB6
            JSR   L021B04
L021DB6     RTS

L021DB7     DW    $0000
L021DB9     DW    $0000
L021DBB     DW    $0000
L021DBD     DW    $0000         ; dtBoundsRect
            DW    $0000
            DW    $0075
            DW    $0180
            DW    $FFFF         ; dtVisible
            ADRL  $00000000     ; dtRefCon
            ADRL  L021DEF       ; itemPtr
            ADRL  L021E17       ; itemPtr
            ADRL  L021E3F       ; itemPtr
            ADRL  L021E67       ; itemPtr
            ADRL  L021E8F       ; itemPtr
            ADRL  L021EB7       ; itemPtr
            ADRL  L021ECF       ; itemPtr
            ADRL  L021EE7       ; itemPtr
            ADRL  $00000000     ; Terminator
L021DEF     DW    $0001         ; Item ID
            DW    $003D         ; Item rect
            DW    $0118
            DW    $004A
            DW    $0160
            DW    $0015         ; User item
            ADRL  L021E07       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021E07     ADRL  L021C9C
            ADRL  L0464B4
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021E17     DW    $0002         ; Item ID
            DW    $004F         ; Item rect
            DW    $0118
            DW    $005C
            DW    $0160
            DW    $0015         ; User item
            ADRL  L021E2F       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021E2F     ADRL  L021C9C
            ADRL  L0464C8
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021E3F     DW    $0003         ; Item ID
            DW    $0019         ; Item rect
            DW    $0118
            DW    $0026
            DW    $0160
            DW    $0015         ; User item
            ADRL  L021E57       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021E57     ADRL  L021C9C
            ADRL  L0464D2
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021E67     DW    $0004         ; Item ID
            DW    $0061         ; Item rect
            DW    $0118
            DW    $006E
            DW    $0160
            DW    $0015         ; User item
            ADRL  L021E7F       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021E7F     ADRL  L021C9C
            ADRL  L0464E6
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021E8F     DW    $0005         ; Item ID
            DW    $002B         ; Item rect
            DW    $0118
            DW    $0038
            DW    $0160
            DW    $0015         ; User item
            ADRL  L021EA7       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021EA7     ADRL  L021C9C
            ADRL  L0464E6
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021EB7     DW    $0006         ; Item ID
            DW    $000C         ; Item rect
            DW    $000F
            DW    $0018
            DW    $018B
            DW    $0014         ; User item
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021ECF     DW    $0007         ; Item ID
            DW    $0019         ; Item rect
            DW    $0012
            DW    $006B
            DW    $00D7
            DW    $8014         ; User item
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021EE7     DW    $0008         ; Item ID
            DW    $0003         ; Item rect
            DW    $000F
            DW    $000C
            DW    $018B
            DW    $800F         ; Static text
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
            STR   '???'
L021F03     STR   '^0 free of ^1 k.'
            STR   'Untitled'
L021F1D     DW    $0000         ; dtBoundsRect
            DW    $0000
            DW    $007B
            DW    $0140
            DW    $FFFF         ; dtVisible
            ADRL  $00000000     ; dtRefCon
            ADRL  L021F77       ; itemPtr
            ADRL  L021FB7       ; itemPtr
            ADRL  L021F9F       ; itemPtr
            ADRL  L022007       ; itemPtr
            ADRL  L021F5F       ; itemPtr
            ADRL  L02201F       ; itemPtr
            ADRL  L022037       ; itemPtr
            ADRL  L02204F       ; itemPtr
            ADRL  L022067       ; itemPtr
            ADRL  L02207F       ; itemPtr
            ADRL  L022097       ; itemPtr
            ADRL  L021FDF       ; itemPtr
            ADRL  $00000000     ; Terminator
L021F5F     DW    $0005         ; Item ID
            DW    $0068         ; Item rect
            DW    $00DC
            DW    $0075
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021E7F       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021F77     DW    $0001         ; Item ID
            DW    $0056         ; Item rect
            DW    $00DC
            DW    $0063
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021F8F       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021F8F     ADRL  L021C9C
            ADRL  L0464AA
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021F9F     DW    $0003         ; Item ID
            DW    $0044         ; Item rect
            DW    $00DC
            DW    $0051
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021E2F       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021FB7     DW    $0002         ; Item ID
            DW    $0032         ; Item rect
            DW    $00DC
            DW    $003F
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021FCF       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021FCF     ADRL  L021C9C
            ADRL  L0464BE
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L021FDF     DW    $000C         ; Item ID
            DW    $0020         ; Item rect
            DW    $00DC
            DW    $002D
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021FF7       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L021FF7     ADRL  L021C9C
            ADRL  L0464DC
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L022007     DW    $0004         ; Item ID
            DW    $000E         ; Item rect
            DW    $00DC
            DW    $001B
            DW    $0124
            DW    $0015         ; User item
            ADRL  L021E57       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L02201F     DW    $0006         ; Item ID
            DW    $0000         ; Item rect
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0014         ; User item
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L022037     DW    $0007         ; Item ID
            DW    $0000         ; Item rect
            DW    $000A
            DW    $000C
            DW    $013B
            DW    $0014         ; User item
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L02204F     DW    $0008         ; Item ID
            DW    $001A         ; Item rect
            DW    $000A
            DW    $0058
            DW    $00AA
            DW    $8014         ; User item
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L022067     DW    $0009         ; Item ID
            DW    $0058         ; Item rect
            DW    $000A
            DW    $0064
            DW    $00C8
            DW    $800F         ; Static text
            ADRL  $00000000     ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L02207F     DW    $000A         ; Item ID
            DW    $0064         ; Item rect
            DW    $000A
            DW    $0076
            DW    $00C2
            DW    $8011         ; Editable text
            ADRL  $00000000     ; Item descriptor
            DW    $003F         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L022097     DW    $000B         ; Item ID
            DW    $000C         ; Item rect
            DW    $000A
            DW    $0016
            DW    $00C8
            DW    $800F         ; Static text
            ADRL  L021F03       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L0220AF     DW    $0003
            DW    $0000
L0220B3     LDA   $14
            CMP   #$0000
            BNE   L0220BD
            JMP   L022205

L0220BD     CMP   #$0004
            BNE   L0220C4
            BRA   L0220C6
L0220C4     CLC
            RTS

L0220C6     JSR   L022112
            BCC   L0220E9
            JSR   L02213F
            LDA   L0221FB
            STA   L022221
            LDA   L0221FD
            STA   L0221FF
            JSR   L0221AA
            INC   $10
            PEA   L0220F1
            PEA   L0220EA
            JSR   L025129
            SEC
L0220E9     RTS

L0220EA     JSR   L0221D7
            JSR   L025157
            RTS

L0220F1     JSR   L022112
            JSR   L02213F
            LDA   L0221FB
            CMP   L022221
            BEQ   L022111
            JSR   L0221D7
            LDA   L0221FB
            STA   L022221
            LDA   L0221FD
            STA   L0221FF
            JSR   L0221AA
L022111     RTS

L022112     LDA   L02000D
            SEC
            SBC   #$003C
            STA   L02213B
            LDA   L02000F
            SEC
            SBC   #$0014
            STA   L02213D
            BMI   L022139
            CMP   #$00E0
            BPL   L022139
            LDA   L02213B
            BMI   L022139
            CMP   #$001D
            BPL   L022139
            SEC
            RTS

L022139     CLC
            RTS

L02213B     DW    $0000
L02213D     DW    $0000
L02213F     LDA   L02213B
            BMI   L02214B
            CMP   #$0010
            BEQ   L02214B
            BCS   L022186
L02214B     STZ   L02221D
L02214E     LDA   L02221D
            CMP   #$0009
            BEQ   L022158
            BCS   L022186
L022158     ASL
            TAX
            LDA   L022223,X
            ASL
            ASL
            ADC   #$0002
            CMP   L02213D
            BCS   L022186
            ADC   #$000C
            CMP   L02213D
            BCS   L022174
            INC   L02221D
            BRA   L02214E
L022174     LDA   L02221D
            ORA   #$8000
            STA   L0221FD
            ASL
            TAX
            LDA   L0222C3,X
            STA   L0221FB
            RTS

L022186     LDA   L02213D
            BPL   L022190
            LDA   #$0000
            BRA   L02219E
L022190     LSR
            LSR
            LSR
            LSR
            CMP   #$000D
            BCC   L02219E
            BEQ   L02219E
            LDA   #$000D
L02219E     STA   L0221FD
            ASL
            TAX
            LDA   L0222A7,X
            STA   L0221FB
            RTS

L0221AA     LDA   L0221FF
            BMI   L0221CF
            LDA   L0221FF
            JSR   L0222E5
L0221B5     LDA   L022221
            CLC
            ADC   L022201
            STA   L02235A
            LDA   L022203
            STA   L02235C
            LDA   L0212DF
            STA   L022358
            JSR   L02237A
            RTS

L0221CF     AND   #$000F
            JSR   L0222FB
            BRA   L0221B5
L0221D7     LDA   L0221FF
            BMI   L0221F3
            JSR   L0222D7
L0221DF     LDA   L022221
            CLC
            ADC   L022201
            STA   L02235A
            LDA   L0212DF
            STA   L022358
            JSR   L02235E
            RTS

L0221F3     AND   #$000F
            JSR   L0222ED
            BRA   L0221DF
L0221FB     DW    $0000
L0221FD     DW    $0000
L0221FF     DW    $0000
L022201     DW    $0030
L022203     DW    $007F
L022205     LDA   #$0000
            STA   L02221D
L02220B     JSR   L0222D7
            INC   L02221D
            LDA   L02221D
            CMP   #$000E
            BNE   L02220B
            CLC
            RTS

            DW    $0000
L02221D     DW    $0000
            DW    $0000
L022221     DW    $0000
L022223     DW    $0002
            DW    $0006
            DW    $000E
            DW    $0012
            DW    $0016
            DW    $001E
            DW    $0022
            DW    $002A
            DW    $002E
            DW    $0032
L022237     DA    L046172
            DW    $0000
            DA    L0461E6
            DW    $0004
            DA    L04625A
            DW    $0008
            DA    L046172
            DW    $000C
            DA    L0461E6
            DW    $0010
            DA    L0461E6
            DW    $0014
            DA    L04625A
            DW    $0018
            DA    L046172
            DW    $001C
            DA    L0461E6
            DW    $0020
            DA    L04625A
            DW    $0024
            DA    L046172
            DW    $0028
            DA    L0461E6
            DW    $002C
            DA    L0461E6
            DW    $0030
            DA    L04625A
            DW    $0034
L02226F     DA    L0462CE
            DW    $0000
            DA    L046342
            DW    $0004
            DA    L0463B6
            DW    $0008
            DA    L0462CE
            DW    $000C
            DA    L046342
            DW    $0010
            DA    L046342
            DW    $0014
            DA    L0463B6
            DW    $0018
            DA    L0462CE
            DW    $001C
            DA    L046342
            DW    $0020
            DA    L0463B6
            DW    $0024
            DA    L0462CE
            DW    $0028
            DA    L046342
            DW    $002C
            DA    L046342
            DW    $0030
            DA    L0463B6
            DW    $0034
L0222A7     DW    $0000
            DW    $0002
            DW    $0004
            DW    $0005
            DW    $0007
            DW    $0009
            DW    $000B
            DW    $000C
            DW    $000E
            DW    $0010
            DW    $0011
            DW    $0013
            DW    $0015
            DW    $0017
L0222C3     DW    $0001
            DW    $0003
            DW    $0006
            DW    $0008
            DW    $000A
            DW    $000D
            DW    $000F
            DW    $0012
            DW    $0014
            DW    $0016
L0222D7     PHA
            LDA   #L022237
            STA   $3E
L0222DD     PLA
            JSR   L022303
            JSR   L02231D
            RTS

L0222E5     PHA
            LDA   #L02226F
            STA   $3E
            BRA   L0222DD
L0222ED     PHA
            LDA   #L04646A
            STA   $16
L0222F3     PLA
            JSR   L022316
            JSR   L022351
            RTS

L0222FB     PHA
            LDA   #L04642A
            STA   $16
            BRA   L0222F3
L022303     ASL
            ASL
            TAY
            LDA   ($3E),Y
            STA   $16
            INY
            INY
            LDA   ($3E),Y
L02230E     STA   $06
            LDA   L02002D
            STA   $18
            RTS

L022316     ASL
            TAX
            LDA   L022223,X
            BRA   L02230E
L02231D     LDA   #$001D
L022320     STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   L022356
            CLC
            ADC   $06
            STA   $1C
            LDA   #$0004
            STA   $1A
            LDA   #$00A0
            STA   $20
            LDA   #$0004
            STA   $2E
            _HideCursor
            JSR   L025501
            _ShowCursor
            RTS

L022351     LDA   #$0010
            BRA   L022320
L022356     DW    $4585
L022358     DW    $0000
L02235A     DW    $0000
L02235C     DW    $0000
L02235E     PEA   $0001
            PEA   $0002
            LDA   #$0080
            ORA   L022358
            PHA
            LDA   L02235A
            PHA
            PEA   $0000
            _MIDIMessage
            RTS

L02237A     PEA   $0001
            PEA   $0002
            LDA   #$0090
            ORA   L022358
            PHA
            LDA   L02235A
            PHA
            LDA   L02235C
            PHA
            _MIDIMessage
            RTS

L022397     DB    $49
            DB    $4E
            DB    $53
            DB    $54
            DB    $00
            DB    $01
            DB    $00
            DB    $04
            DB    $53
            DB    $79
            DB    $6E
            DB    $74
            DB    $68
            DB    $4C
            DB    $41
            DB    $42
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0223AF     DB    $0C
            DB    $53
            DB    $61
            DB    $6D
            DB    $70
            DB    $6C
            DB    $65
            DB    $72
            DB    $2E
            DB    $77
            DB    $61
            DB    $76
            DB    $65
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0F
            DB    $10
            DB    $00
            DB    $00
            DB    $00
L0223C7     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0223CF     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L022697     STR   'Inst 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 3'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 4'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 6'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 7'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 8'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 9'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 10'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 11'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 12'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 13'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 14'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 15'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            STR   'Inst 16'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L022797     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L0228B7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L0229D7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L022AF7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L022C17     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L022D37     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L022E57     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L022F77     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023097     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L0231B7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L0232D7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L0233F7     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023517     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023637     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023757     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023877     DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $06
            DB    $28
            DB    $02
            DB    $40
            DB    $02
            DB    $00
            DB    $07
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $7F
            DB    $18
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $7F
            DB    $1F
            DB    $00
            DB    $0B
            DB    $00
            DB    $1F
            DB    $1F
            DB    $00
            DB    $00
            DB    $00
            DB    $59
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $05
            DB    $00
            DB    $04
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $06
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $28
            DB    $02
            DB    $40
            DB    $04
            DB    $00
            DB    $08
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $28
            DB    $02
            DB    $1F
            DB    $02
            DB    $00
            DB    $02
L023997     LDA   #$0001
            JSR   L0239F1
            PHA
            PHA
            PEA   $0000
            PEA   ^L023B8D
            PEA   L023B8D
            _NewMenu2
            PLA
            STA   L023B89
            PLA
            STA   L023B89+2
            JSR   L023A2A
            RTS

L0239BB     LDA   L023B89+2
            PHA
            LDA   L023B89
            PHA
            _DisposeMenu
            JSR   L023A11
            LDA   L024034
            AND   #$003F
            JSR   L0239F1
            PHA
            PHA
            PEA   $0000
            PEA   ^L023B8D
            PEA   L023B8D
            _NewMenu2
            PLA
            STA   L023B89
            PLA
            STA   L023B89+2
            RTS

L0239F1     ASL
            ASL
            CLC
            ADC   #L023B97
            STA   $42
            STA   L023A24
            LDY   #$0002
            LDA   ($42)
            STA   L023A26
            LDA   ($42),Y
            STA   L023A28
            LDA   #$0000
            STA   ($42)
            STA   ($42),Y
            RTS

L023A11     LDA   L023A24
            STA   $42
            LDY   #$0002
            LDA   L023A26
            STA   ($42)
            LDA   L023A28
            STA   ($42),Y
            RTS

L023A24     DW    $0000
L023A26     DW    $0000
L023A28     DW    $0000
L023A2A     SEI
            PEA   ^L0486D6
            PEA   L0486D6
            PEA   $2800
            PEA   $0400
            _WriteRamBlock
            CLI
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _SetMetro
            RTS

L023A53     STA   L023B7F
            JSR   L023B0E
            LDX   L023B81
            LDA   L0223C7,X
            AND   #$007F
            JSR   L023B4B
            RTS

L023A66     STA   L023B7F
            JSR   L023B0E
            LDX   L023B81
            LDA   L0223C7,X
            AND   #$007F
            CLC
            ADC   #$0149
            STA   L023B87
            PHA
            LDA   L023B87
            PHA
            PEA   $0190
            LDA   L023B7F
            BNE   L023A8E
            PEA   $001D
            BRA   L023A91
L023A8E     PEA   $003D
L023A91     LDA   #$0040
            PHA
            LDA   L023B89+2
            PHA
            LDA   L023B89
            PHA
            _PopUpMenuSelect
            PLA
            BEQ   L023AFF
            SEC
            SBC   #$0149
            STA   L023B00
            JSR   L0212F6
            LDA   L023B00
            JSR   L023B4B
            LDA   L023B00
            JSR   L023B02
            JSR   L023B0E
            LDA   L023B00
            LDX   L023B81
            SEP   #$20
            STA   L0223C7,X
            LDA   L023B7F
            BNE   L023AE6
            LDY   #$0011
            LDA   ($3E),Y
            LDY   #$0004
            STA   ($3C),Y
            LDY   #$0013
            LDA   ($3E),Y
            LDY   #$0005
            STA   ($3C),Y
            BRA   L023AFA
L023AE6     LDY   #$0011
            LDA   ($3E),Y
            LDY   #$000A
            STA   ($3C),Y
            LDY   #$0013
            LDA   ($3E),Y
            LDY   #$000B
            STA   ($3C),Y
L023AFA     REP   #$20
            JSR   L028C34
L023AFF     RTS

L023B00     DW    $0000
L023B02     ASL
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L02411C
            STA   $3E
            RTS

L023B0E     LDA   L0212DF
            ASL
            ASL
            ASL
            ASL
            ASL
            STA   L023B81
            STA   L023B83
            STA   L023B85
            LDA   L021270
            BEQ   L023B31
            LDA   #$0010
            CLC
            ADC   L023B81
            STA   L023B81
            STA   L023B85
L023B31     LDA   L023B7F
            BEQ   L023B40
            LDA   #$0008
            CLC
            ADC   L023B81
            STA   L023B81
L023B40     LDA   L0212D9
            CLC
            ADC   L023B81
            STA   L023B81
            RTS

L023B4B     ASL
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L02411C
            STA   L023B7D
            PEA   $0198
            LDA   L023B7F
            BNE   L023B64
            PEA   $0026
            BRA   L023B67
L023B64     PEA   $0046
L023B67     _MoveTo
            LDA   $5E
            PHA
            LDA   L023B7D
            PHA
            _DrawString
            RTS

L023B7D     DB    $00
            DB    $00
L023B7F     DB    $00
            DB    $00
L023B81     DB    $00
            DB    $00
L023B83     DB    $00
            DB    $00
L023B85     DB    $00
            DB    $00
L023B87     DB    $49
            DB    $01
L023B89     ADRL  $00000000
L023B8D     DB    $00
            DB    $00
            DB    $0F
            DB    $00
            DB    $28
            DB    $00
            ADRL  L023C9B
L023B97     ADRL  L023C9C
            ADRL  L023CAA
            ADRL  L023CB8
            ADRL  L023CC6
            ADRL  L023CD4
            ADRL  L023CE2
            ADRL  L023CF0
            ADRL  L023CFE
            ADRL  L023D0C
            ADRL  L023D1A
            ADRL  L023D28
            ADRL  L023D36
            ADRL  L023D44
            ADRL  L023D52
            ADRL  L023D60
            ADRL  L023D6E
            ADRL  L023D7C
            ADRL  L023D8A
            ADRL  L023D98
            ADRL  L023DA6
            ADRL  L023DB4
            ADRL  L023DC2
            ADRL  L023DD0
            ADRL  L023DDE
            ADRL  L023DEC
            ADRL  L023DFA
            ADRL  L023E08
            ADRL  L023E16
            ADRL  L023E24
            ADRL  L023E32
            ADRL  L023E40
            ADRL  L023E4E
            ADRL  L023E5C
            ADRL  L023E6A
            ADRL  L023E78
            ADRL  L023E86
            ADRL  L023E94
            ADRL  L023EA2
            ADRL  L023EB0
            ADRL  L023EBE
            ADRL  L023ECC
            ADRL  L023EDA
            ADRL  L023EE8
            ADRL  L023EF6
            ADRL  L023F04
            ADRL  L023F12
            ADRL  L023F20
            ADRL  L023F2E
            ADRL  L023F3C
            ADRL  L023F4A
            ADRL  L023F58
            ADRL  L023F66
            ADRL  L023F74
            ADRL  L023F82
            ADRL  L023F90
            ADRL  L023F9E
            ADRL  L023FAC
            ADRL  L023FBA
            ADRL  L023FC8
            ADRL  L023FD6
            ADRL  L023FE4
            ADRL  L023FF2
            ADRL  L024000
            ADRL  L02400E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L023C9B     DB    $00
L023C9C     DB    $00
            DB    $00
            DB    $49
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02411C
L023CAA     DB    $00
            DB    $00
            DB    $4A
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02413C
L023CB8     DB    $00
            DB    $00
            DB    $4B
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02415C
L023CC6     DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02417C
L023CD4     DB    $00
            DB    $00
            DB    $4D
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02419C
L023CE2     DB    $00
            DB    $00
            DB    $4E
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0241BC
L023CF0     DB    $00
            DB    $00
            DB    $4F
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0241DC
L023CFE     DB    $00
            DB    $00
            DB    $50
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0241FC
L023D0C     DB    $00
            DB    $00
            DB    $51
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02421C
L023D1A     DB    $00
            DB    $00
            DB    $52
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02423C
L023D28     DB    $00
            DB    $00
            DB    $53
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02425C
L023D36     DB    $00
            DB    $00
            DB    $54
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02427C
L023D44     DB    $00
            DB    $00
            DB    $55
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02429C
L023D52     DB    $00
            DB    $00
            DB    $56
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0242BC
L023D60     DB    $00
            DB    $00
            DB    $57
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0242DC
L023D6E     DB    $00
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0242FC
L023D7C     DB    $00
            DB    $00
            DB    $59
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02431C
L023D8A     DB    $00
            DB    $00
            DB    $5A
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02433C
L023D98     DB    $00
            DB    $00
            DB    $5B
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02435C
L023DA6     DB    $00
            DB    $00
            DB    $5C
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02437C
L023DB4     DB    $00
            DB    $00
            DB    $5D
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02439C
L023DC2     DB    $00
            DB    $00
            DB    $5E
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0243BC
L023DD0     DB    $00
            DB    $00
            DB    $5F
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0243DC
L023DDE     DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0243FC
L023DEC     DB    $00
            DB    $00
            DB    $61
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02441C
L023DFA     DB    $00
            DB    $00
            DB    $62
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02443C
L023E08     DB    $00
            DB    $00
            DB    $63
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02445C
L023E16     DB    $00
            DB    $00
            DB    $64
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02447C
L023E24     DB    $00
            DB    $00
            DB    $65
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02449C
L023E32     DB    $00
            DB    $00
            DB    $66
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0244BC
L023E40     DB    $00
            DB    $00
            DB    $67
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0244DC
L023E4E     DB    $00
            DB    $00
            DB    $68
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0244FC
L023E5C     DB    $00
            DB    $00
            DB    $69
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02451C
L023E6A     DB    $00
            DB    $00
            DB    $6A
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02453C
L023E78     DB    $00
            DB    $00
            DB    $6B
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02455C
L023E86     DB    $00
            DB    $00
            DB    $6C
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02457C
L023E94     DB    $00
            DB    $00
            DB    $6D
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02459C
L023EA2     DB    $00
            DB    $00
            DB    $6E
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0245BC
L023EB0     DB    $00
            DB    $00
            DB    $6F
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0245DC
L023EBE     DB    $00
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0245FC
L023ECC     DB    $00
            DB    $00
            DB    $71
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02461C
L023EDA     DB    $00
            DB    $00
            DB    $72
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02463C
L023EE8     DB    $00
            DB    $00
            DB    $73
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02465C
L023EF6     DB    $00
            DB    $00
            DB    $74
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02467C
L023F04     DB    $00
            DB    $00
            DB    $75
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02469C
L023F12     DB    $00
            DB    $00
            DB    $76
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0246BC
L023F20     DB    $00
            DB    $00
            DB    $77
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0246DC
L023F2E     DB    $00
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0246FC
L023F3C     DB    $00
            DB    $00
            DB    $79
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02471C
L023F4A     DB    $00
            DB    $00
            DB    $7A
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02473C
L023F58     DB    $00
            DB    $00
            DB    $7B
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02475C
L023F66     DB    $00
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02477C
L023F74     DB    $00
            DB    $00
            DB    $7D
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02479C
L023F82     DB    $00
            DB    $00
            DB    $7E
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0247BC
L023F90     DB    $00
            DB    $00
            DB    $7F
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0247DC
L023F9E     DB    $00
            DB    $00
            DB    $80
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0247FC
L023FAC     DB    $00
            DB    $00
            DB    $81
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02481C
L023FBA     DB    $00
            DB    $00
            DB    $82
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02483C
L023FC8     DB    $00
            DB    $00
            DB    $83
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02485C
L023FD6     DB    $00
            DB    $00
            DB    $84
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02487C
L023FE4     DB    $00
            DB    $00
            DB    $85
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L02489C
L023FF2     DB    $00
            DB    $00
            DB    $86
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0248BC
L024000     DB    $00
            DB    $00
            DB    $87
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0248DC
L02400E     DB    $00
            DB    $00
            DB    $88
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            ADRL  L0248FC
L02401C     ASC   'WAVE'
            DB    $00
            DB    $01
            DB    $00
            STR   'SynthLAB'00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L024034     DB    $28
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02411C     STR   '~Organ 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02413C     STR   '~Ahh C1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02415C     STR   '~Ahh E2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02417C     STR   '~Ahh C3'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02419C     STR   '~Ahh G3'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0241BC     STR   '~Ahh E4'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0241DC     STR   '~Ahh D5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0241FC     STR   'Metal'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $D0
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02421C     STR   '~Metal'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $2C
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02423C     STR   '~HpsdA C1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02425C     STR   '~HpsdB C1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02427C     STR   '~HpsdA E5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02429C     STR   '~HpsdB E5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0242BC     STR   '~HpsdC E5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $48
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0242DC     STR   'Breath'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0242FC     STR   '~Sine Wave'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $F8
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02431C     STR   '~Sawtooth 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $24
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02433C     STR   '~Sawtooth 2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $26
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02435C     STR   'Lead Guitar'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02437C     STR   '~Lead Guitar'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4C
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02439C     STR   '~Bell'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $1C
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0243BC     STR   '~E Organ 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0243DC     STR   '~Clarinet'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $38
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0243FC     STR   'Pluck'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02441C     STR   '~Pluck'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02443C     STR   'E Organ2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $E0
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02445C     STR   '~E Organ2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02447C     STR   '~Triangle'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4E
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02449C     STR   'Bass Pluck'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0244BC     STR   '~Bass Pluck'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0244DC     STR   'Fifths'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $A0
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0244FC     STR   '~Fifths'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $3C
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02451C     STR   '~Harmonica'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02453C     STR   'Trumpet'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02455C     STR   '~Trumpet'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $14
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02457C     STR   '~Hpschrd 1'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02459C     STR   '~Hpschrd 2'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0245BC     STR   '~Hpschrd 3'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0245DC     STR   '~Hpschrd 4'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $34
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0245FC     STR   '~Hpschrd 5'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02461C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02463C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02465C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02467C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02469C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0246BC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0246DC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0246FC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02471C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02473C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02475C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02477C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02479C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0247BC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0247DC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0247FC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02481C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02483C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02485C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02487C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02489C     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0248BC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0248DC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0248FC     STR   '~Apple'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02491C     STZ   L024A58
            BRA   L024927
L024921     LDA   #$FFFF
            STA   L024A58
L024927     LDA   $14
            CMP   #$0004
            BNE   L024931
            BRL   L024A5A
L024931     LDA   $14
            CMP   #$0000
            BNE   L02493A
            BRA   L024946
L02493A     CMP   #$0003
            BNE   L024944
            JSR   L024A18
            CLC
            RTS

L024944     CLC
            RTS

L024946     JSR   L02494E
            JSR   L024D50
            CLC
            RTS

L02494E     LDY   #$0004
            LDA   ($00),Y
            STA   $04
            LDY   #$0006
            LDA   ($00),Y
            STA   $06
            LDY   #$0010
            LDA   ($00),Y
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            LDA   #$0008
            STA   $2E
            STA   $1A
            JSR   L025598
            LDA   #L0484F6
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$000C
            STA   $2C
            JSR   L025501
            LDY   #$0008
            LDA   ($00),Y
            SEC
            SBC   #$0018
            LDY   #$0016
            STA   ($00),Y
            STA   $12
L02499A     LDA   $12
            BMI   L0249BA
            LDA   #L048626
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   $12
            SEC
            SBC   #$0008
            STA   $12
            LDA   #$0008
            STA   $2C
            JSR   L025501
            BRA   L02499A
L0249BA     LDA   #L04848E
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$000C
            STA   $2C
            JSR   L025501
            LDY   #$000E
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            BIT   L024A58
            BMI   L0249E7
            JSR   L025574
            DEC   L024A58
            CLC
            RTS

L0249E7     LDY   #$000C
            LDA   ($00),Y
            LDY   #$000A
            STA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            ADC   #$000C
            STA   $04
            LDA   #L048666
            LDY   #$0002
            STA   ($00),Y
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0008
            STA   $2C
            JSR   L0254E3
            JSR   L025574
            CLC
            RTS

L024A18     LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            ADC   #$000C
            STA   $04
            LDY   #$0006
            LDA   ($00),Y
            STA   $06
            LDA   #L048626
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0008
            STA   $2C
            LDA   #$0008
            STA   $2E
            STA   $1A
            JSR   L025598
            JSR   L0254E3
            BIT   L024A58
            BMI   L0249E7
            JSR   L025574
            DEC   L024A58
            CLC
            RTS

L024A58     DW    $FFFF
L024A5A     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            STA   $04
            CLC
            LDY   #$0008
            ADC   ($00),Y
            ADC   #$0008
            STA   $0C
            STA   $06
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            CLC
            ADC   #$0020
            STA   $0E
            JSR   L02555A
            BCS   L024A83
            RTS

L024A83     LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $08
            ADC   #$000C
            STA   $08
            CLC
            ADC   #$0008
            STA   $0C
            JSR   L02555A
            BCC   L024AA8
            LDA   L024A58
            BMI   L024AA5
            DEC   L024A58
            SEC
            RTS

L024AA5     BRL   L024AF5
L024AA8     JMP   L024BE5

            LDA   $0A
            CLC
            ADC   #$0006
            STA   $0A
            LDA   $0E
            SEC
            SBC   #$0006
            STA   $0E
            LDX   $08
            LDA   $04
            STA   $08
            LDA   $0C
            STA   $04
            STX   $0C
            JSR   L02555A
            BCC   L024ACF
            BRL   L024AE9
L024ACF     LDA   $04
            STA   $08
            LDA   $06
            STA   $0C
            JSR   L02555A
            BCS   L024ADD
            RTS

L024ADD     INC   $10
            PEA   L024B0A
            PEA   L024B28
            JSR   L021C37
            RTS

L024AE9     INC   $10
            PEA   L024B3F
            PEA   L024B5A
            JSR   L021C37
            RTS

L024AF5     INC   $10
            PEA   L024B71
            PEA   L024B92
            JSR   L021C37
            LDA   L02000D
            SEC
            SBC   $08
            STA   $64
            SEC
            RTS

L024B0A     JSR   L02555A
            BCS   L024B10
            RTS

L024B10     LDA   #$0001
            JSR   L024BA9
            LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            CLC
            ADC   #$0007
            STA   $08
            RTS

L024B28     JSR   L024B0A
            JSR   L021C65
            LDY   #$0020
            LDA   ($00),Y
            BEQ   L024B3E
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024B3E     RTS

L024B3F     JSR   L02555A
            BCS   L024B45
            RTS

L024B45     LDA   #$FFFF
            JSR   L024BA9
            LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $08
            INC
            INC
            INC
            INC
            STA   $0C
            RTS

L024B5A     JSR   L024B3F
            JSR   L021C65
            LDY   #$0020
            LDA   ($00),Y
            BEQ   L024B70
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024B70     RTS

L024B71     SEC
            LDA   L02000D
            SBC   $64
            SEC
            SBC   $08
            BNE   L024B7D
            RTS

L024B7D     JSR   L024BA9
            LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            CLC
            ADC   #$000C
            STA   $08
            RTS

L024B92     JSR   L024B71
            JSR   L021C65
            LDY   #$0020
            LDA   ($00),Y
            BEQ   L024BA8
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024BA8     RTS

L024BA9     STA   $3E
            LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $3E
            BPL   L024BC0
            LDA   ($00),Y
            BNE   L024BBA
            RTS

L024BBA     EOR   #$FFFF
            INC
            BRA   L024BD2
L024BC0     LDY   #$0016
            CMP   ($00),Y
            BMI   L024BD4
            LDA   ($00),Y
            LDY   #$000A
            SEC
            SBC   ($00),Y
            BNE   L024BD2
            RTS

L024BD2     STA   $3E
L024BD4     LDA   $3E
            CLC
            LDY   #$000A
            ADC   ($00),Y
            LDY   #$000C
            STA   ($00),Y
            JSR   L024A18
            RTS

L024BE5     JSR   L024CD0
            BCS   L024BF0
            JSR   L024CF1
            BCS   L024C16
            RTS

L024BF0     INC   $10
            INC   L024D1B
            PEA   L024C3C
            PEA   L024C7C
            JSR   L021C37
            JSR   L024D27
            JSR   L024E42
            LDY   #$001C
            LDA   ($00),Y
            BEQ   L024C14
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024C14     SEC
            RTS

L024C16     INC   $10
            INC   L024D1B
            PEA   L024C8A
            PEA   L024CC9
            JSR   L021C37
            JSR   L024D1D
            JSR   L024E42
            LDY   #$0018
            LDA   ($00),Y
            BEQ   L024C3A
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024C3A     SEC
            RTS

L024C3C     JSR   L024CD0
            BCS   L024C4D
            LDA   L024D1B
            BEQ   L024C4C
            JSR   L024D2E
            STZ   L024D1B
L024C4C     RTS

L024C4D     LDA   L024D1B
            BNE   L024C58
            JSR   L024D27
            INC   L024D1B
L024C58     JSR   L0252C3
            BCC   L024C7A
            LDA   #$0003
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDY   #$001C
            LDA   ($00),Y
            BEQ   L024C7A
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024C7A     RTS
            RTS

L024C7C     JSR   L021C65
            LDY   #$0004
            LDA   ($00),Y
            STA   $04
            JSR   L024D2E
            RTS

L024C8A     JSR   L024CF1
            BCS   L024C9B
            LDA   L024D1B
            BEQ   L024C9A
            JSR   L024D22
            STZ   L024D1B
L024C9A     RTS

L024C9B     LDA   L024D1B
            BNE   L024CA6
            JSR   L024D1D
            INC   L024D1B
L024CA6     JSR   L0252C3
            BCC   L024CC8
            LDA   #$0003
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDY   #$0018
            LDA   ($00),Y
            BEQ   L024CC8
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024CC8     RTS

L024CC9     JSR   L021C65
            JSR   L024D22
            RTS

L024CD0     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            STA   $04
            CLC
            ADC   #$000C
            STA   $0C
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            STA   $06
            CLC
            ADC   #$0020
            STA   $0E
            JMP   L02555A

L024CF1     LDY   #$0004
            LDA   ($00),Y
            CLC
            LDY   #$0008
            ADC   ($00),Y
            ADC   #$0008
            STA   $0C
            SEC
            SBC   #$000C
            STA   $08
            STA   $04
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            STA   $06
            CLC
            ADC   #$0020
            STA   $0E
            JMP   L02555A

L024D1B     DW    $0000
L024D1D     LDA   #L0485BE
            BRA   L024D33
L024D22     LDA   #L04848E
            BRA   L024D33
L024D27     LDA   #L048556
            DEC   $04
            BRA   L024D33
L024D2E     LDA   #L048426
            DEC   $04
L024D33     STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$000D
            STA   $2C
            LDA   #$0008
            STA   $2E
            STA   $1A
            JSR   L025598
            JSR   L0254E3
            JSR   L025574
            RTS

L024D50     LDY   #$0008
            LDA   ($00),Y
            SEC
            SBC   #$0008
            STA   $12
            LDY   #$0004
            LDA   ($00),Y
            STA   $04
            STA   L024E09
            LDY   #$0006
            LDA   ($00),Y
            LDY   #$0012
            SEC
            SBC   ($00),Y
            STA   $06
            LDA   #L0486A6
            JSR   L024E0F
L024D78     LDA   $04
            CLC
            ADC   #$0008
            STA   $04
            LDA   #L0486C6
            JSR   L024E0F
            LDA   $12
            SEC
            SBC   #$0008
            STA   $12
            BNE   L024D78
            LDA   $04
            CLC
            ADC   #$0008
            STA   $04
            LDA   #L0486B6
            JSR   L024E0F
            LDA   $04
            CLC
            ADC   #$0006
            STA   $04
            LDA   $06
            CLC
            ADC   #$0008
            STA   L024E0B
            STA   $06
            LDY   #$0012
            LDA   ($00),Y
            SEC
            SBC   #$0008
            LSR
            LSR
            STA   $2E
            STA   L024E0D
            LDA   #$0000
            STA   $32
            JSR   L024E26
            LDA   L024E0B
            STA   $06
            INC   $04
            LDA   L024E0D
            STA   $2E
            LDA   #$BBBB
            STA   $32
            JSR   L024E26
            LDA   L024E0B
            STA   $06
            LDA   L024E09
            STA   $04
            LDA   L024E0D
            STA   $2E
            LDA   #$0000
            STA   $32
            JSR   L024E26
            LDA   L024E0B
            STA   $06
            INC   $04
            LDA   L024E0D
            STA   $2E
            LDA   #$BBBB
            STA   $32
            JSR   L024E26
            RTS

L024E09     DW    $0000
L024E0B     DW    $0000
L024E0D     DW    $0000
L024E0F     STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0008
            STA   $2C
            LDA   #$0002
            STA   $2E
            STA   $1A
            JSR   L0254E3
            RTS

L024E26     LDA   $04
            ASL
            TAX
            LDA   $06
            LSR
            LSR
            CLC
            ADC   L025617,X
            STA   $30
            LDA   #$00A0
            STA   $20
            LDA   #$0001
            STA   $2C
            JSR   L0213AA
            RTS

L024E42     LDAL  TickCount
            STA   L025178
            LDA   #$000F
            STA   L02517A
            RTS

L024E50     LDA   $14
            CMP   #$0004
            BNE   L024E5A
            JMP   L024F7E

L024E5A     LDA   $14
            CMP   #$0000
            BNE   L024E63
            BRA   L024E6D
L024E63     CMP   #$0003
            BNE   L024E6B
            JSR   L024F49
L024E6B     CLC
            RTS

L024E6D     JSR   L024E9A
            LDY   #$001A
            LDA   ($00),Y
            PHA
            LDY   #$001C
            LDA   ($00),Y
            PHA
            _MoveTo
            LDY   #$0018
            LDA   ($00),Y
            PHA
            DEY
            DEY
            LDA   ($00),Y
            PHA
            _DrawString
            JSR   L025117
            CLC
            RTS

L024E9A     LDY   #$0004
            LDA   ($00),Y
            STA   $04
            LDY   #$0006
            LDA   ($00),Y
            STA   $06
            LDY   #$0010
            LDA   ($00),Y
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            LDA   #$0008
            STA   $2E
            STA   $1A
            JSR   L025598
            LDA   #L0460B2
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0004
            STA   $2C
            JSR   L025501
            LDY   #$0008
            LDA   ($00),Y
            STA   $12
L024EDD     LDA   $12
            BMI   L024EFD
            LDA   #L0460F2
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   $12
            SEC
            SBC   #$0008
            STA   $12
            LDA   #$0008
            STA   $2C
            JSR   L025501
            BRA   L024EDD
L024EFD     LDA   #L0460D2
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0004
            STA   $2C
            JSR   L025501
            LDY   #$000E
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L024F1D     LDY   #$000C
            LDA   ($00),Y
            LDY   #$000A
            STA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            ADC   #$0004
            STA   $04
            LDA   #L046132
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0008
            STA   $2C
            JSR   L0254E3
            JSR   L025574
            CLC
            RTS

L024F49     LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            ADC   #$0004
            STA   $04
            LDY   #$0006
            LDA   ($00),Y
            STA   $06
            LDA   #L0460F2
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0008
            STA   $2C
            LDA   #$0008
            STA   $2E
            STA   $1A
            JSR   L025598
            JSR   L0254E3
            BRA   L024F1D
L024F7E     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            STA   $04
            CLC
            LDY   #$0008
            ADC   ($00),Y
            ADC   #$000E
            STA   $0C
            STA   $06
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            CLC
            ADC   #$0020
            STA   $0E
            JSR   L02555A
            BCS   L024FA7
            RTS

L024FA7     LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $08
            ADC   #$0004
            STA   $08
            CLC
            ADC   #$0008
            STA   $0C
            JSR   L02555A
            BCC   L024FC2
            BRL   L025009
L024FC2     LDX   $08
            LDA   $04
            STA   $08
            LDA   $0C
            STA   $04
            STX   $0C
            JSR   L02555A
            BCC   L024FD6
            BRL   L024FEF
L024FD6     LDA   $04
            STA   $08
            LDA   $06
            STA   $0C
            JSR   L02555A
            BCS   L024FE5
            CLC
            RTS

L024FE5     INC   $10
            PEA   L02501E
            PEA   L02504E
            BRA   L024FF5
L024FEF     PEA   L025063
            PEA   L025090
L024FF5     JSR   L025129
            LDA   #$0001
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            INC   $10
            SEC
            RTS

L025009     INC   $10
            PEA   L0250A5
            PEA   L0250C6
            JSR   L025129
            LDA   L02000D
            SEC
            SBC   $08
            STA   $64
            SEC
            RTS

L02501E     JSR   L0252C3
            BCC   L025028
            JSR   L02555A
            BCS   L025029
L025028     RTS

L025029     LDA   #$0001
            JSR   L0250DB
            LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            CLC
            ADC   #$0007
            STA   $08
            LDA   #$0001
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            RTS

L02504E     JSR   L02501E
            JSR   L025157
            LDY   #$0020
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L025063     JSR   L0252C3
            BCC   L02506D
            JSR   L02555A
            BCS   L02506E
L02506D     RTS

L02506E     LDA   #$FFFF
            JSR   L0250DB
            LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $08
            INC
            INC
            INC
            INC
            STA   $0C
            LDA   #$0001
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            RTS

L025090     JSR   L025063
            JSR   L025157
            LDY   #$0020
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L0250A5     SEC
            LDA   L02000D
            SBC   $64
            SEC
            SBC   $08
            BNE   L0250B1
            RTS

L0250B1     JSR   L0250DB
            LDY   #$000A
            LDA   ($00),Y
            CLC
            LDY   #$0004
            ADC   ($00),Y
            CLC
            ADC   #$0004
            STA   $08
            RTS

L0250C6     JSR   L0250A5
            JSR   L025157
            LDY   #$0020
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L0250DB     STA   $3E
            LDY   #$000A
            LDA   ($00),Y
            CLC
            ADC   $3E
            BPL   L0250F2
            LDA   ($00),Y
            BNE   L0250EC
            RTS

L0250EC     EOR   #$FFFF
            INC
            BRA   L025105
L0250F2     LDY   #$0008
            CMP   ($00),Y
            BMI   L025107
            LDA   ($00),Y
            SEC
            LDY   #$000A
            SBC   ($00),Y
            DEC
            BNE   L025105
            RTS

L025105     STA   $3E
L025107     LDA   $3E
            CLC
            LDY   #$000A
            ADC   ($00),Y
            LDY   #$000C
            STA   ($00),Y
            JSR   L024F49
L025117     LDY   #$0014
            LDA   ($00),Y
            BEQ   L025128
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS
L025128     RTS

L025129     PEA   $0000
            PEA   $0000
            JSR   L020550
            PLA
            STA   L025170
            PEA   $0000
            PEA   $0002
            JSR   L020550
            PLA
            STA   L025174
            PLX
            PLY
            PLA
            PHX
            PEA   $0002
            PHY
            PEA   $0000
            PHA
            JSR   L02055B
            JSR   L02055B
            SEC
            RTS

L025157     PEA   $0000
            LDA   L025170
            PHA
            JSR   L02055B
            PEA   $0002
            LDA   L025174
            PHA
            JSR   L02055B
            RTS

L02516C     DA    $0000
            DA    $0000
L025170     DA    $0000
            DA    $0000
L025174     DA    $0000
            DA    $0000
L025178     DA    $0000
L02517A     DA    $0000
L02517C     LDA   $14
            CMP   #$0000
            BEQ   L02518A
            CMP   #$0004
            BEQ   L0251CA
            CLC
            RTS

L02518A     LDA   #L045E32
            JSR   L0252CF
            LDY   #$001A
            LDA   ($00),Y
            PHA
            LDY   #$001C
            LDA   ($00),Y
            PHA
            _MoveTo
            LDY   #$0018
            LDA   ($00),Y
            BEQ   L0251B7
            PHA
            DEY
            DEY
            LDA   ($00),Y
            PHA
            _DrawString
L0251B7     LDY   #$000E
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            JSR   L025117
            CLC
            RTS

L0251CA     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            CLC
            ADC   #$000A
            STA   $0C
            STA   $06
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            CLC
            ADC   #$0020
            STA   $0E
            JSR   L02555A
            BCS   L0251FB
            LDA   $06
            STA   $08
            CLC
            ADC   #$000A
            STA   $0C
            JSR   L02555A
            BCS   L02521E
            RTS

L0251FB     INC   $10
            PEA   L025241
            PEA   L0252AB
            JSR   L025129
            LDA   #L045ED2
            JSR   L0252CF
            JSR   L025260
            LDAL  TickCount
            STA   L025178
            LDA   #$001E
            STA   L02517A
            SEC
            RTS

L02521E     INC   $10
            PEA   L025276
            PEA   L0252AB
            JSR   L025129
            LDA   #L045F72
            JSR   L0252CF
            JSR   L025295
            LDAL  TickCount
            STA   L025178
            LDA   #$001E
            STA   L02517A
            SEC
            RTS

L025241     JSR   L02555A
            BCS   L02524E
            LDAL  TickCount
            STA   L025178
            RTS

L02524E     JSR   L0252C3
            BCC   L025275
            LDA   #$0003
            STA   L02517A
            LDAL  TickCount
            STA   L025178
L025260     LDY   #$000C
            LDA   ($00),Y
            LDY   #$000A
            CMP   ($00),Y
            BEQ   L0252A4
            INC
L02526D     LDY   #$000C
            STA   ($00),Y
            JSR   L025117
L025275     RTS

L025276     JSR   L02555A
            BCS   L025283
            LDAL  TickCount
            STA   L025178
            RTS

L025283     JSR   L0252C3
            BCC   L025275
            LDA   #$0003
            STA   L02517A
            LDAL  TickCount
            STA   L025178
L025295     LDY   #$000C
            LDA   ($00),Y
            LDY   #$0008
            CMP   ($00),Y
            BEQ   L0252A4
            DEC
            BRA   L02526D
L0252A4     LDA   #L046012
            JSR   L0252CF
            RTS

L0252AB     LDA   #L045E32
            JSR   L0252CF
            JSR   L025157
            LDY   #$001E
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L0252C3     LDAL  TickCount
            SEC
            SBC   L025178
            CMP   L02517A
            RTS

L0252CF     STA   $16
            LDA   L02002D
            STA   $18
            LDY   #$0010
            LDA   ($00),Y
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            LDA   #$0008
            STA   $2E
            STA   $1A
            LDA   #$0014
            STA   $2C
            _HideCursor
            JSR   L025501
            _ShowCursor
            RTS

L025306     LDA   $14
            CMP   #$0000
            BNE   L02530F
            BRA   L025319
L02530F     CMP   #$0004
            BNE   L025317
            JMP   L025339

L025317     CLC
            RTS

L025319     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$000A
            LDA   ($00),Y
            BEQ   L025337
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L025337     CLC
            RTS

L025339     JSR   L025353
            BCS   L02533F
            RTS

L02533F     LDY   #$0008
            LDA   ($00),Y
            BEQ   L02534F
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L02534F     SEC
            INC   $10
            RTS

L025353     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$0004
            LDA   ($00),Y
            STA   $08
            LDY   #$0000
            LDA   [$6A],Y
            CLC
            ADC   $08
            STA   $0C
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            LDY   #$0002
            LDA   [$6A],Y
            CLC
            ADC   $0A
            STA   $0E
            JSR   L02555A
            RTS

L025387     LDA   $14
            CMP   #$0000
            BNE   L025390
            BRA   L02539A
L025390     CMP   #$0004
            BNE   L025398
            JMP   L0253AC

L025398     CLC
            RTS

L02539A     LDY   #$000A
            LDA   ($00),Y
            BEQ   L0253AA
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L0253AA     CLC
            RTS

L0253AC     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            LDY   #$000C
            LDA   ($00),Y
            STA   $0C
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            LDY   #$000E
            LDA   ($00),Y
            STA   $0E
            JSR   L02555A
            BCS   L0253CE
            RTS

L0253CE     LDY   #$0008
            LDA   ($00),Y
            BEQ   L0253DE
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
L0253DE     SEC
            RTS

L0253E0     LDA   $14
            CMP   #$0000
            BNE   L0253E9
            BRA   L0253F3
L0253E9     CMP   #$0004
            BNE   L0253F1
            JMP   L025411

L0253F1     CLC
            RTS

L0253F3     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$000A
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            CLC
            RTS

L025411     LDY   #$000C
            LDA   ($00),Y
            STA   $6A
            LDY   #$000E
            LDA   ($00),Y
            STA   $6C
            LDY   #$0004
            LDA   ($00),Y
            STA   $08
            LDY   #$0000
            LDA   [$6A],Y
            CLC
            ADC   $08
            STA   $0C
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            LDY   #$0002
            LDA   [$6A],Y
            CLC
            ADC   $0A
            STA   $0E
            JSR   L02555A
            BCS   L025447
            RTS

L025447     INC   $10
            PEA   L025462
            PEA   L025471
            JSR   L025129
            LDY   #$0008
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            SEC
            RTS

L025462     LDY   #$0010
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L025471     LDY   #$0012
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            JSR   L025157
            RTS

L025483     PLX
            PLA
            STA   $14
            PLA
            STA   $22
            PLA
            STA   $24
            PHX
            LDA   [$22]
            ASL
            INC
            INC
            STA   $2A
            LDA   #$0002
            STA   $28
            PEI   $14
L02549C     LDY   $28
            CPY   $2A
            BPL   L0254B9
            LDA   [$22],Y
            INY
            INY
            STY   $28
            STA   $00
            LDA   ($00)
            ASL
            TAX
            LDA   $01,S
            STA   $14
            JSR   (L0254BB,X)
            BCS   L0254B9
            BRA   L02549C
L0254B9     PLA
            RTS

L0254BB     DA    L025500
            DA    L024E50
            DA    L02517C
            DA    L0220B3
            DA    L025500
            DA    L025306
            DA    L0253E0
            DA    L021BC0
            DA    L025387
            DA    L024921
            DA    L02AB36
            DA    L02491C
            PLX
            PLA
            STA   $14
            PLA
            STA   $00
            PHX
            LDA   ($00)
            ASL
            TAX
            JSR   (L0254BB,X)
            RTS

L0254E3     LDA   $04
            ASL
            TAX
            LDA   $06
            LSR
            LSR
            CLC
            ADC   L025617,X
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            JSR   L025501
            RTS
L025500     RTS

L025501     BRA   L02551E
L025503     LDA   $16
            CLC
            ADC   $1A
            STA   $16
            BCC   L02550E
            INC   $18
L02550E     LDA   $1C
            CLC
            ADC   $20
            STA   $1C
            BCC   L025519
            INC   $1E
L025519     DEC   $2C
            BNE   L02551E
            RTS

L02551E     LDY   $2E
            DEY
            DEY
L025522     LDA   [$16],Y
            STA   [$1C],Y
            DEY
            DEY
            BPL   L025522
            BRA   L025503
L02552C     BRA   L02554A
L02552E     LDA   $16
            CLC
            ADC   $1A
            STA   $16
            BCC   L025539
            INC   $18
L025539     LDA   $1C
            CLC
            ADC   #$00A0
            STA   $1C
            BCC   L025545
            INC   $1E
L025545     DEC   $2C
            BNE   L02554A
            RTS

L02554A     SEP   #$30
            LDY   $2E
            DEY
L02554F     LDA   [$16],Y
            STA   [$1C],Y
            DEY
            BPL   L02554F
            REP   #$30
            BRA   L02552E
L02555A     LDA   L02000D
            CMP   $08
            BMI   L025572
            CMP   $0C
            BPL   L025572
            LDA   L02000F
            CMP   $0A
            BMI   L025572
            CMP   $0E
            BPL   L025572
            SEC
            RTS

L025572     CLC
            RTS

L025574     PHD
            LDA   L0255B0
            TCD
            PHP
            SEI
            BIT   $CE
            BPL   L025587
            STZ   $CE
            LDA   $CC
            BMI   L025587
            DEC   $CC
L025587     INC   $CC
            BMI   L025595
            LDA   $CC
            BNE   L025593
            JSL   $E01FCC
L025593     STZ   $CC
L025595     PLP
            PLD
            RTS

L025598     PHD
            LDA   L0255B0
            TCD
            PHP
            SEI
            LDA   $CC
            BMI   L0255AB
            BIT   $CE
            BMI   L0255AB
            JSL   $E01FD0
L0255AB     DEC   $CC
            PLP
            PLD
            RTS

L0255B0     DW    $0000
L0255B2     DW    $0000
L0255B4     DW    $0000
L0255B6     DW    $0000
L0255B8     DW    $0000
L0255BA     DW    $0000
L0255BC     PHD
            LDA   L0255B0
            TCD
            BIT   $EE
            BVS   L025603
            BIT   $CC
            BMI   L025603
            LDA   L0255B4
            CMP   $F8
            BPL   L0255D2
            LDA   $F8
L0255D2     STA   $F0
            LDA   L0255B8
            CMP   $FC
            BMI   L0255DD
            LDA   $FC
L0255DD     CMP   $F0
            BMI   L025603
            LDA   L0255B6
            CMP   $FA
            BPL   L0255EA
            LDA   $FA
L0255EA     STA   $F0
            LDA   L0255BA
            CMP   $FE
            BMI   L0255F5
            LDA   $FE
L0255F5     CMP   $F0
            BMI   L025603
            LDA   #$C000
            STA   $EE
            PLD
            JSR   L025598
            RTS

L025603     PLD
            RTS

L025605     PHD
            LDA   L0255B0
            TCD
            BIT   $EE
            BVC   L025615
            STZ   $EE
            PLD
            JSR   L025574
            RTS

L025615     PLD
            RTS

L025617     DW    $2000
            DW    $20A0
            DW    $2140
            DW    $21E0
            DW    $2280
            DW    $2320
            DW    $23C0
            DW    $2460
            DW    $2500
            DW    $25A0
            DW    $2640
            DW    $26E0
            DW    $2780
            DW    $2820
            DW    $28C0
            DW    $2960
            DW    $2A00
            DW    $2AA0
            DW    $2B40
            DW    $2BE0
            DW    $2C80
            DW    $2D20
            DW    $2DC0
            DW    $2E60
            DW    $2F00
            DW    $2FA0
            DW    $3040
            DW    $30E0
            DW    $3180
            DW    $3220
            DW    $32C0
            DW    $3360
            DW    $3400
            DW    $34A0
            DW    $3540
            DW    $35E0
            DW    $3680
            DW    $3720
            DW    $37C0
            DW    $3860
            DW    $3900
            DW    $39A0
            DW    $3A40
            DW    $3AE0
            DW    $3B80
            DW    $3C20
            DW    $3CC0
            DW    $3D60
            DW    $3E00
            DW    $3EA0
            DW    $3F40
            DW    $3FE0
            DW    $4080
            DW    $4120
            DW    $41C0
            DW    $4260
            DW    $4300
            DW    $43A0
            DW    $4440
            DW    $44E0
            DW    $4580
            DW    $4620
            DW    $46C0
            DW    $4760
            DW    $4800
            DW    $48A0
            DW    $4940
            DW    $49E0
            DW    $4A80
            DW    $4B20
            DW    $4BC0
            DW    $4C60
            DW    $4D00
            DW    $4DA0
            DW    $4E40
            DW    $4EE0
            DW    $4F80
            DW    $5020
            DW    $50C0
            DW    $5160
            DW    $5200
            DW    $52A0
            DW    $5340
            DW    $53E0
            DW    $5480
            DW    $5520
            DW    $55C0
            DW    $5660
            DW    $5700
            DW    $57A0
            DW    $5840
            DW    $58E0
            DW    $5980
            DW    $5A20
            DW    $5AC0
            DW    $5B60
            DW    $5C00
            DW    $5CA0
            DW    $5D40
            DW    $5DE0
            DW    $5E80
            DW    $5F20
            DW    $5FC0
            DW    $6060
            DW    $6100
            DW    $61A0
            DW    $6240
            DW    $62E0
            DW    $6380
            DW    $6420
            DW    $64C0
            DW    $6560
            DW    $6600
            DW    $66A0
            DW    $6740
            DW    $67E0
            DW    $6880
            DW    $6920
            DW    $69C0
            DW    $6A60
            DW    $6B00
            DW    $6BA0
            DW    $6C40
            DW    $6CE0
            DW    $6D80
            DW    $6E20
            DW    $6EC0
            DW    $6F60
            DW    $7000
            DW    $70A0
            DW    $7140
            DW    $71E0
            DW    $7280
            DW    $7320
            DW    $73C0
            DW    $7460
            DW    $7500
            DW    $75A0
            DW    $7640
            DW    $76E0
            DW    $7780
            DW    $7820
            DW    $78C0
            DW    $7960
            DW    $7A00
            DW    $7AA0
            DW    $7B40
            DW    $7BE0
            DW    $7C80
            DW    $7D20
            DW    $7DC0
            DW    $7E60
            DW    $7F00
            DW    $7FA0
            DW    $8040
            DW    $80E0
            DW    $8180
            DW    $8220
            DW    $82C0
            DW    $8360
            DW    $8400
            DW    $84A0
            DW    $8540
            DW    $85E0
            DW    $8680
            DW    $8720
            DW    $87C0
            DW    $8860
            DW    $8900
            DW    $89A0
            DW    $8A40
            DW    $8AE0
            DW    $8B80
            DW    $8C20
            DW    $8CC0
            DW    $8D60
            DW    $8E00
            DW    $8EA0
            DW    $8F40
            DW    $8FE0
            DW    $9080
            DW    $9120
            DW    $91C0
            DW    $9260
            DW    $9300
            DW    $93A0
            DW    $9440
            DW    $94E0
            DW    $9580
            DW    $9620
            DW    $96C0
            DW    $9760
            DW    $9800
            DW    $98A0
            DW    $9940
            DW    $99E0
            DW    $9A80
            DW    $9B20
            DW    $9BC0
            DW    $9C60
L0257A7     JSR   L0205B5
            JSR   L0219FA
            LDA   #L0257C9
            JSR   L021A1A
            JSR   L0257D1
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L0257C9     DW    $0027
            DW    $002A
            DW    $00B3
            DW    $0244
L0257D1     PEA   $0049
            PEA   $0039
            _MoveTo
            PEA   $01B6
            PEA   $0039
            _LineTo
            PEA   $00B2
            PEA   $003C
            _MoveTo
            PEA   ^L025851
            PEA   L025851
            _DrawString
            PEA   $01E4
            PEA   $003D
            _MoveTo
            PEA   ^L025867
            PEA   L025867
            _DrawString
L02581F     LDA   L025951
            BNE   L02582F
            LDA   #^L025955
            STA   $50
            PHA
            LDA   #L025955
            BRA   L025838
L02582F     LDA   #^L02596F
            STA   $50
            PHA
            LDA   #L02596F
L025838     STA   $4E
            PHA
            PEA   $0000
            LDA   #$FFFF
            STA   L0258B7
            JSR   L025598
            JSR   L025483
            JSR   L025574
            STZ   L0258B7
            RTS

L025851     STR   '  Instrument Volume  '
L025867     STR   'Sys Vol'
L02586F     LDY   #$000C
            LDA   #$001F
            SEC
            SBC   ($00),Y
            ASL
            PHA
            ASL
            STA   L0258B9
            LDY   #$001E
            LDA   ($00),Y
            STA   L0258BB
            ASL
            TAX
            LDA   L0258B9
            STA   L02109F,X
            PLX
            LDA   L021563,X
            JSR   L02162B
            LDA   L0258B7
            BNE   L0258B6
            PEA   $0000
            PEA   $0002
            LDA   #$00B0
            ORA   L0258BB
            PHA
            LDA   #$0007
            PHA
            LDA   L0258B9
            PHA
            _MIDIMessage
L0258B6     RTS

L0258B7     DW    $0000
L0258B9     DW    $007F
L0258BB     DW    $000F
L0258BD     LDY   #$001E
            LDA   ($00),Y
            ASL
            TAX
            LDA   L02109F,X
            LSR
            LSR
            STA   L0258D9
            LDA   #$001F
            SEC
            SBC   L0258D9
            LDY   #$000C
            STA   ($00),Y
            RTS

L0258D9     DW    $0000
L0258DB     LDY   #$000C
            LDA   #$000F
            SEC
            SBC   ($00),Y
            SEP   #$20
            STAL  $E100CA
            REP   #$20
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L0258F5     SEP   #$20
            LDAL  $E100CA
            REP   #$20
            AND   #$000F
            STA   L025910
            LDA   #$000F
            SEC
            SBC   L025910
            LDY   #$000C
            STA   ($00),Y
            RTS

L025910     DW    $0000
            DW    $0000
L025914     LDY   #$0010
            LDA   ($00),Y
            CMP   L025951
            BNE   L02591F
            RTS

L02591F     STA   L025951
            LDA   $00
            PHA
            LDA   L025953
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
            STA   L025953
            JSR   L0212E1
            JSR   L02581F
            RTS

L02593A     LDY   #$0010
            LDA   ($00),Y
            CMP   L025951
            BNE   L02594D
            JSR   L0212E1
            LDA   $00
            STA   L025953
            RTS

L02594D     JSR   L0212F6
            RTS

L025951     DW    $0000
L025953     DW    $0000
L025955     DW    $000C
            DA    L025989
            DA    L0259AE
            DA    L0259D4
            DA    L0259FA
            DA    L025A20
            DA    L025A46
            DA    L025A6C
            DA    L025A92
            DA    L025BE0
            DA    L025C03
            DA    L025C17
            DA    L025C29
L02596F     DW    $000C
            DA    L025AB8
            DA    L025ADD
            DA    L025B02
            DA    L025B27
            DA    L025B4C
            DA    L025B71
            DA    L025B96
            DA    L025BBB
            DA    L025BE0
            DA    L025C03
            DA    L025C17
            DA    L025C29
L025989     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $48
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $D2
            DB    $55
            DB    $32
            DB    $4B
            DA    L02586F
            ADRL  L0259AB
            DB    $56
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $00
            DA    L025500
L0259AB     DB    $02
            DB    $31
            DB    $20
L0259AE     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $78
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $DE
            DB    $55
            DB    $3E
            DB    $4B
            DA    L02586F
            ADRL  L0259D0
            DB    $82
            DB    $00
            DB    $90
            DB    $00
            DB    $01
            DB    $00
            DA    L025500
L0259D0     DB    $03
            DB    $20
            DB    $32
            DB    $20
L0259D4     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $A8
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $EA
            DB    $55
            DB    $4A
            DB    $4B
            DA    L02586F
            ADRL  L0259F6
            DB    $B2
            DB    $00
            DB    $90
            DB    $00
            DB    $02
            DB    $00
            DA    L025500
L0259F6     DB    $03
            DB    $20
            DB    $33
            DB    $20
L0259FA     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $D8
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $F6
            DB    $55
            DB    $56
            DB    $4B
            DA    L02586F
            ADRL  L025A1C
            DB    $E2
            DB    $00
            DB    $90
            DB    $00
            DB    $03
            DB    $00
            DA    L025500
L025A1C     DB    $03
            DB    $20
            DB    $34
            DB    $20
L025A20     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $08
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $02
            DB    $56
            DB    $62
            DB    $4B
            DA    L02586F
            ADRL  L025A42
            DB    $12
            DB    $01
            DB    $90
            DB    $00
            DB    $04
            DB    $00
            DA    L025500
L025A42     DB    $03
            DB    $20
            DB    $35
            DB    $20
L025A46     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $38
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $0E
            DB    $56
            DB    $6E
            DB    $4B
            DA    L02586F
            ADRL  L025A68
            DB    $42
            DB    $01
            DB    $90
            DB    $00
            DB    $05
            DB    $00
            DA    L025500
L025A68     DB    $03
            DB    $20
            DB    $36
            DB    $20
L025A6C     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $68
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $1A
            DB    $56
            DB    $7A
            DB    $4B
            DA    L02586F
            ADRL  L025A8E
            DB    $72
            DB    $01
            DB    $90
            DB    $00
            DB    $06
            DB    $00
            DA    L025500
L025A8E     DB    $03
            DB    $20
            DB    $37
            DB    $20
L025A92     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $98
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $26
            DB    $56
            DB    $86
            DB    $4B
            DA    L02586F
            ADRL  L025AB4
            DB    $A2
            DB    $01
            DB    $90
            DB    $00
            DB    $07
            DB    $00
            DA    L025500
L025AB4     DB    $03
            DB    $20
            DB    $38
            DB    $20
L025AB8     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $48
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $D2
            DB    $55
            DB    $32
            DB    $4B
            DA    L02586F
            ADRL  L025ADA
            DB    $52
            DB    $00
            DB    $90
            DB    $00
            DB    $08
            DB    $00
            DA    L025500
L025ADA     DB    $02
            DB    $20
            DB    $39
L025ADD     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $78
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $DE
            DB    $55
            DB    $3E
            DB    $4B
            DA    L02586F
            ADRL  L025AFF
            DB    $82
            DB    $00
            DB    $90
            DB    $00
            DB    $09
            DB    $00
            DA    L025500
L025AFF     DB    $02
            DB    $31
            DB    $30
L025B02     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $A8
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $EA
            DB    $55
            DB    $4A
            DB    $4B
            DA    L02586F
            ADRL  L025B24
            DB    $B2
            DB    $00
            DB    $90
            DB    $00
            DB    $0A
            DB    $00
            DA    L025500
L025B24     DB    $02
            DB    $31
            DB    $31
L025B27     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $D8
            DB    $00
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $F6
            DB    $55
            DB    $56
            DB    $4B
            DA    L02586F
            ADRL  L025B49
            DB    $E2
            DB    $00
            DB    $90
            DB    $00
            DB    $0B
            DB    $00
            DA    L025500
L025B49     DB    $02
            DB    $31
            DB    $32
L025B4C     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $08
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $02
            DB    $56
            DB    $62
            DB    $4B
            DA    L02586F
            ADRL  L025B6E
            DB    $12
            DB    $01
            DB    $90
            DB    $00
            DB    $0C
            DB    $00
            DA    L025500
L025B6E     DB    $02
            DB    $31
            DB    $33
L025B71     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $38
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $0E
            DB    $56
            DB    $6E
            DB    $4B
            DA    L02586F
            ADRL  L025B93
            DB    $42
            DB    $01
            DB    $90
            DB    $00
            DB    $0D
            DB    $00
            DA    L025500
L025B93     DB    $02
            DB    $31
            DB    $34
L025B96     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $68
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $1A
            DB    $56
            DB    $7A
            DB    $4B
            DA    L02586F
            ADRL  L025BB8
            DB    $72
            DB    $01
            DB    $90
            DB    $00
            DB    $0E
            DB    $00
            DA    L025500
L025BB8     DB    $02
            DB    $31
            DB    $35
L025BBB     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $98
            DB    $01
            DB    $20
            DB    $00
            DB    $1E
            DB    $00
            DB    $1E
            DB    $00
            DA    L0258BD
            DB    $26
            DB    $56
            DB    $86
            DB    $4B
            DA    L02586F
            ADRL  L025BDD
            DB    $A2
            DB    $01
            DB    $90
            DB    $00
            DB    $0F
            DB    $00
            DA    L025500
L025BDD     DB    $02
            DB    $31
            DB    $36
L025BE0     DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $F0
            DB    $01
            DB    $10
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DA    L0258F5
            DB    $3C
            DB    $56
            DB    $9C
            DB    $4B
            DA    L0258DB
            ADRL  L025C02
            DB    $F4
            DB    $01
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DA    L025500
L025C02     DB    $00
L025C03     DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $9C
            DB    $00
            DB    $E0
            DB    $01
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L025C17     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $99
            DB    $00
            DB    $BC
            DB    $00
            DA    L025914
            DA    L02593A
            ADRL  L046FE8
            DB    $00
            DB    $00
L025C29     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $99
            DB    $00
            DB    $04
            DB    $01
            DA    L025914
            DA    L02593A
            ADRL  L046FF0
            DB    $01
            DB    $00
L025C3B     JSR   L0205B5
            JSR   L0219FA
            LDA   #L025CB3
            JSR   L021A1A
            PEA   $009E
            PEA   $0034
            _MoveTo
            PEA   ^L025CBB
            PEA   L025CBB
            _DrawString
            PEA   $012C
            PEA   $0034
            _MoveTo
            PEA   ^L025CC5
            PEA   L025CC5
            _DrawString
            LDA   #^L025DE0
            STA   $50
            PHA
            LDA   #L025DE0
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            LDA   L021B3E
            BEQ   L025CA9
L025CA9     JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L025CB3     DW    $001E
            DW    $0074
            DW    $00BC
            DW    $01C8
L025CBB     STR   'MIDI Mode'
L025CC5     STR   'In/Out Select'
L025CD3     DW    $0000
L025CD5     DW    $0000
L025CD7     LDA   L025CD3
            PHA
            LDA   L025CD5
            PHA
            _SetMIDIPort
            RTS

L025CE7     LDA   L025CD3
            BEQ   L025CFC
            JSR   L0212F6
            STZ   L025CD3
            JSR   L025CD7
            STZ   L0211C8
            JSR   L02A132
            RTS

L025CFC     JSR   L0212E1
            LDA   #$FFFF
            STA   L025CD3
            JSR   L025CD7
            LDA   #$0001
            STA   L0211C8
            JSR   L02A132
            RTS

L025D12     LDA   L025CD3
            BEQ   L025D1B
            JSR   L0212E1
            RTS

L025D1B     JSR   L0212F6
            RTS

L025D1F     LDA   L025CD5
            BEQ   L025D2E
            JSR   L0212F6
            STZ   L025CD5
            JSR   L025CD7
            RTS

L025D2E     JSR   L0212E1
            LDA   #$FFFF
            STA   L025CD5
            JSR   L025CD7
            RTS

L025D3B     LDA   L025CD5
            BEQ   L025D44
            JSR   L0212E1
            RTS

L025D44     JSR   L0212F6
            RTS

L025D48     LDY   #$0010
            LDA   ($00),Y
            CMP   L0211C4
            BNE   L025D53
            RTS

L025D53     STA   L0211C4
            LDA   $00
            PHA
            LDA   L025D90
            STA   $00
            LDX   #$0000
            JSR   L0212F6
            PLA
            STA   $00
            STA   L025D90
            JSR   L0212E1
            LDA   L0211C4
            PHA
            _SetMIDIMode
            RTS

L025D79     LDY   #$0010
            LDA   ($00),Y
            CMP   L0211C4
            BNE   L025D8C
            JSR   L0212E1
            LDA   $00
            STA   L025D90
            RTS

L025D8C     JSR   L0212F6
            RTS

L025D90     DW    $0000
L025D92     LDY   #$000C
            LDA   ($00),Y
            STA   L0211C6
            DEC   L0211C6
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            LDA   L0211C6
            PHA
            _SetBasicChannel
            RTS

L025DB1     LDA   L0211C6
            INC
            LDY   #$000C
            STA   ($00),Y
            RTS

L025DBB     LDY   #$000C
            LDA   ($00),Y
            STA   L0211CA
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            LDA   L0211CA
            PHA
            _SetVelComp
            RTS

L025DD7     LDA   L0211CA
            LDY   #$000C
            STA   ($00),Y
            RTS

L025DE0     DW    $0008
            DA    L025E4C
            DA    L025DF2
            DA    L025E04
            DA    L025E16
            DA    L025E28
            DA    L025E3A
            DA    L025E7A
            DA    L025EA3
L025DF2     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $39
            DB    $00
            DB    $3C
            DB    $01
            DA    L025CE7
            DA    L025D12
            ADRL  L044C88
            DB    $00
            DB    $00
L025E04     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $56
            DB    $00
            DB    $3C
            DB    $01
            DA    L025D1F
            DA    L025D3B
            ADRL  L044C90
            DB    $00
            DB    $00
L025E16     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $39
            DB    $00
            DB    $A4
            DB    $00
            DA    L025D48
            DA    L025D79
            ADRL  L0432BE
            DB    $00
            DB    $00
L025E28     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $46
            DB    $00
            DB    $A4
            DB    $00
            DA    L025D48
            DA    L025D79
            ADRL  L0432C6
            DB    $01
            DB    $00
L025E3A     DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $53
            DB    $00
            DB    $A4
            DB    $00
            DA    L025D48
            DA    L025D79
            ADRL  L0432CE
            DB    $02
            DB    $00
L025E4C     DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $00
            DB    $CC
            DB    $00
            DB    $01
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DA    L025DB1
            DB    $33
            DB    $6B
            DB    $A9
            DB    $6D
            DA    L025D92
            ADRL  L025E6C
            DB    $98
            DB    $00
            DB    $96
            DB    $00
            DA    L025500
L025E6C     STR   'Basic Channel'
L025E7A     DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $00
            DB    $64
            DB    $01
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DA    L025DD7
            DB    $59
            DB    $6B
            DB    $CF
            DB    $6D
            DA    L025DBB
            ADRL  L025E9A
            DB    $40
            DB    $01
            DB    $96
            DB    $00
            DA    L025500
L025E9A     STR   'Vel Comp'
L025EA3     DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $A4
            DB    $00
            DB    $5C
            DB    $01
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L025EB7     JSR   L0205B5
            JSR   L0219FA
            LDA   #L025F97
            JSR   L021A1A
            PEA   $007C
            PEA   $0030
            _MoveTo
            PEA   ^L025FD8
            PEA   L025FD8
            _DrawString
            PEA   $00DC
            PEA   $0030
            _MoveTo
            PEA   ^L025F9F
            PEA   L025F9F
            _DrawString
            PEA   $013C
            PEA   $0030
            _MoveTo
            PEA   ^L025FB3
            PEA   L025FB3
            _DrawString
            PEA   $0198
            PEA   $0030
            _MoveTo
            PEA   ^L025FA9
            PEA   L025FA9
            _DrawString
            PEA   $0064
            PEA   $006C
            _MoveTo
            PEA   ^L025FC6
            PEA   L025FC6
            _DrawString
            PEA   $015C
            PEA   $006C
            _MoveTo
            PEA   ^L025FBD
            PEA   L025FBD
            _DrawString
            LDA   #^L026130
            STA   $50
            PHA
            LDA   #L026130
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            LDA   L021B3E
            BEQ   L025F8D
L025F8D     JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L025F97     DW    $001D
            DW    $003C
            DW    $00B1
            DW    $0212
L025F9F     STR   'Metronome'
L025FA9     STR   'Key Start'
L025FB3     STR   'Count Off'
L025FBD     STR   'Beat To:'
L025FC6     STR   'Beats Per Measure'
L025FD8     STR   'Clock'
L025FDE     LDA   L0211CC
            BNE   L025FE7
            JSR   L0212F6
            RTS

L025FE7     JSR   L0212E1
            RTS

L025FEB     LDA   L0211CC
            BEQ   L026000
            STZ   L0211CC
            JSR   L0212F6
            LDA   L027426
            AND   #$F7FF
            STA   L027426
            RTS

L026000     INC   L0211CC
            JSR   L0212E1
            LDA   L027426
            ORA   #$0800
            STA   L027426
            RTS

L026010     LDA   L0211D0
            BNE   L026019
            JSR   L0212F6
            RTS

L026019     JSR   L0212E1
            RTS

L02601D     LDA   L0211D0
            BEQ   L026032
            STZ   L0211D0
            LDA   L027426
            AND   #$FF80
            STA   L027426
            JSR   L0212F6
            RTS

L026032     INC   L0211D0
            LDA   L027426
            ORA   L021103
            STA   L027426
            JSR   L0212E1
            RTS

L026042     LDA   L0211CE
            BNE   L02604B
            JSR   L0212F6
            RTS

L02604B     JSR   L0212E1
            RTS

L02604F     LDA   L0211CE
            BEQ   L026064
            STZ   L0211CE
            LDA   L027426
            AND   #$EFFF
            STA   L027426
            JSR   L0212F6
            RTS

L026064     INC   L0211CE
            LDA   L027426
            ORA   #$1000
            STA   L027426
            JSR   L0212E1
            RTS
            RTS

L026075     LDY   #$0010
            LDA   ($00),Y
            CMP   L021105
            BNE   L026080
            RTS

L026080     STA   L021105
            LDA   $00
            PHA
            LDA   L0260C2
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
            STA   L0260C2
            JSR   L0212E1
            LDA   L021105
            ASL
            TAY
            LDA   L0260C4,Y
            STA   L021107
            PHA
            _SetBeat
            RTS

L0260AB     LDY   #$0010
            LDA   ($00),Y
            CMP   L021105
            BNE   L0260BE
            JSR   L0212E1
            LDA   $00
            STA   L0260C2
            RTS

L0260BE     JSR   L0212F6
            RTS

L0260C2     DW    $0000
L0260C4     DW    $0090
            DW    $0060
            DW    $0030
            DW    $0018
            DW    $000C
L0260CE     LDY   #$0010
            LDA   ($00),Y
            CMP   L0211D2
            BNE   L0260D9
            RTS

L0260D9     STA   L0211D2
            LDA   $00
            PHA
            LDA   L026114
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
            STA   L026114
            JSR   L0212E1
            LDA   L027426
            AND   #$FBFF
            ORA   L0211D2
            STA   L027426
            RTS

L0260FD     LDY   #$0010
            LDA   ($00),Y
            CMP   L0211D2
            BNE   L026110
            JSR   L0212E1
            LDA   $00
            STA   L026114
            RTS

L026110     JSR   L0212F6
            RTS

L026114     DW    $0000
L026116     LDY   #$000C
            LDA   ($00),Y
            STA   L021103
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L026127     LDA   L021103
            LDY   #$000C
            STA   ($00),Y
            RTS

L026130     DW    $000C
            DA    L0261FB
            DA    L02620D
            DA    L02614A
            DA    L02616E
            DA    L02615C
            DA    L0261DA
            DA    L026180
            DA    L026192
            DA    L0261A4
            DA    L0261B6
            DA    L0261C8
            DA    L02621F
L02614A     DW    $0005
            DW    $0000
            DW    $0035
            DW    $00E0
            DA    L025FEB
            DA    L025FDE
            ADRL  L043D8E
            DW    $0000
L02615C     DW    $0005
            DW    $0000
            DW    $0035
            DW    $013C
            DA    L02601D
            DA    L026010
            ADRL  L044840
            DW    $0000
L02616E     DW    $0005
            DW    $0000
            DW    $0035
            DW    $0198
            DA    L02604F
            DA    L026042
            ADRL  L0441D6
            DW    $0000
L026180     DW    $0005
            DW    $0000
            DW    $0071
            DW    $0114
            DA    L026075
            DA    L0260AB
            ADRL  L0473A0
            DW    $0000
L026192     DW    $0005
            DW    $0000
            DW    $0071
            DW    $013C
            DA    L026075
            DA    L0260AB
            ADRL  L0473A8
            DW    $0001
L0261A4     DW    $0005
            DW    $0000
            DW    $0071
            DW    $0164
            DA    L026075
            DA    L0260AB
            ADRL  L0473B0
            DW    $0002
L0261B6     DW    $0005
            DW    $0000
            DW    $0071
            DW    $018C
            DA    L026075
            DA    L0260AB
            ADRL  L0473B8
            DW    $0003
L0261C8     DW    $0005
            DW    $0000
            DW    $0071
            DW    $01B4
            DA    L026075
            DA    L0260AB
            ADRL  L0473C0
            DW    $0004
L0261DA     DW    $0002
            DW    $0000
            DW    $0072
            DW    $00AC
            DW    $0001
            DW    $0063
            DW    $0000
            DA    L026127
            DW    $676B
            DW    $69E1
            DA    L026116
            ADRL  L0261FA
            DW    $008C
            DW    $008F
            DA    L025500
L0261FA     DB    $00
L0261FB     DW    $0005
            DW    $0000
            DW    $0038
            DW    $0068
            DA    L0260CE
            DA    L0260FD
            ADRL  L047E78
            DW    $0000
L02620D     DW    $0005
            DW    $0000
            DW    $0045
            DW    $0068
            DA    L0260CE
            DA    L0260FD
            ADRL  L047E80
            DW    $0400
L02621F     DW    $0007
            DW    $0000
            DW    $0099
            DW    $0194
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L026233     JSR   L0205B5
            JSR   L0219FA
            JSR   L0263DC
            STA   L026417
            STA   $42
            STA   L026417+2
            PEA   $0000
            PEA   $0000
            PEA   ^L0263F1
            PEA   L0263F1
            _GetNewModalDialog
            PLA
            STA   L02183F
            PLA
            STA   L02183F+2
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _DrawDialog
            JSR   L0263A0
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _SetPort
            PHA
            PHA
            PEA   ^L02640F
            PEA   L02640F
            PEA   ^L02640F
            PEA   L02640F
            PEA   $000F
            _LENew
            PLA
            STA   L021853
            PLA
            STA   L021853+2
            LDA   $5E
            PHA
            LDA   L026417
            INC
            PHA
            LDA   ($42)
            AND   #$00FF
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LESetText
            LDA   #^L026479
            STA   $50
            PHA
            LDA   #L026479
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEActivate
            PEA   $0000
            PEA   $000E
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LESetSelect
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEUpdate
            LDA   #L026407
            STA   L02185B
            LDA   #$FFFF
            STA   L021851
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            STZ   L021851
            LDA   L021B3E
            BEQ   L02636C
            LDA   L0263EB
            STA   $4A
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEGetTextLen
            PLA
            STA   ($4A)
            PHA
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEGetTextHand
            PLA
            STA   $3E
            PLA
            STA   $40
            LDA   [$3E]
            STA   $42
            LDY   #$0002
            LDA   [$3E],Y
            STA   $44
            INC   $4A
            SEP   #$20
            LDY   #$000E
L026360     LDA   [$42],Y
            STA   ($4A),Y
            DEY
            BPL   L026360
            REP   #$20
            JSR   L029467
L02636C     LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEDispose
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _CloseDialog
            JSR   L0205F4
            JSR   L021A0A
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _SetPort
            RTS

L0263A0     LDAL  L045B7C
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$000F
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   #$5422
            STA   $1C
            LDA   #$0026
            STA   $1A
            LDA   #$00A0
            STA   $20
            LDA   #$0026
            STA   $2E
            _HideCursor
            JSR   L025501
            _ShowCursor
            RTS

L0263DC     LDA   L0212DF
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L022697
            STA   L0263EB
            RTS

L0263EB     DW    $0000
            DW    $0004
            DW    $0000
L0263F1     DW    $003C         ; dtBoundsRect
            DW    $00DA
            DW    $0084
            DW    $01CF
            DW    $FFFF         ; dtVisible
            ADRL  $00000000     ; dtRefCon
            ADRL  L02642C       ; itemPtr
            ADRL  $00000000     ; Terminator
L026407     DW    $0053
            DW    $010A
            DW    $0062
            DW    $019E
L02640F     DW    $001A
            DW    $0038
            DW    $0029
            DW    $00C4
L026417     ADRL  L022697
L02641B     STR   'Instrument Name:'
L02642C     DW    $0004         ; Item ID
            DW    $0005         ; Item rect
            DW    $0038
            DW    $000F
            DW    $00F0
            DW    $800F         ; Static text
            ADRL  L02641B       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
            JSR   L0263DC
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $01F4
            PEA   $0013
            _MoveTo
            LDA   $5E
            PHA
            LDA   L0263EB
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            RTS

L026479     DW    $0002
            DA    L02647F
            DA    L026493
L02647F     DW    $0007
            DW    $0000
            DW    $0071
            DW    $016E
            DA    L021B51
            DA    L021B5B
            ADRL  L045444
            DA    L021B6E
            DA    L021B67
L026493     DW    $0007
            DW    $0000
            DW    $0071
            DW    $00F6
            DA    L021B92
            DA    L021B9C
            ADRL  L04543C
            DA    L021BAF
            DA    L021BA8
L0264A7     JSR   L0205B5
            JSR   L0219FA
            JSR   L02665B
            STA   L026690
            STA   $42
            STA   L026690+2
            PEA   $0000
            PEA   $0000
            PEA   ^L02666A
            PEA   L02666A
            _GetNewModalDialog
            PLA
            STA   L02183F
            PLA
            STA   L02183F+2
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _DrawDialog
            JSR   L02661F
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _SetPort
            PHA
            PHA
            PEA   ^L026680
            PEA   L026680
            PEA   ^L026680
            PEA   L026680
            PEA   $000F
            _LENew
            PLA
            STA   L021853
            PLA
            STA   L021853+2
            LDA   $5E
            PHA
            LDA   L026690
            INC
            PHA
            LDA   ($42)
            AND   #$00FF
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LESetText
            LDA   #^L0266BA
            STA   $50
            PHA
            LDA   #L0266BA
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEActivate
            PEA   $0000
            PEA   $000E
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LESetSelect
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEUpdate
            LDA   #L026688
            STA   L02185B
            LDA   #$FFFF
            STA   L021851
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            STZ   L021851
            LDA   L021B3E
            BEQ   L0265EB
            LDA   L026694
            STA   $4A
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEGetTextLen
            PLA
            STA   ($4A)
            PHA
            PHA
            LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEGetTextHand
            PLA
            STA   $3E
            PLA
            STA   $40
            LDA   [$3E]
            STA   $42
            LDY   #$0002
            LDA   [$3E],Y
            STA   $44
            INC   $4A
            SEP   #$20
            LDY   #$000E
L0265E2     LDA   [$42],Y
            STA   ($4A),Y
            DEY
            BPL   L0265E2
            REP   #$20
L0265EB     LDA   L021853+2
            PHA
            LDA   L021853
            PHA
            _LEDispose
            LDA   L02183F+2
            PHA
            LDA   L02183F
            PHA
            _CloseDialog
            JSR   L0205F4
            JSR   L021A0A
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _SetPort
            RTS

L02661F     LDAL  L045B7C
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$000F
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   #$5422
            STA   $1C
            LDA   #$0026
            STA   $1A
            LDA   #$00A0
            STA   $20
            LDA   #$0026
            STA   $2E
            _HideCursor
            JSR   L025501
            _ShowCursor
            RTS

L02665B     LDA   L027871
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L020F9F
            STA   L026694
            RTS

L02666A     DW    $003C         ; dtBoundsRect
            DW    $00DA
            DW    $0084
            DW    $01CF
            DW    $FFFF         ; dtVisible
            ADRL  $00000000     ; dtRefCon
            ADRL  L0266A2       ; itemPtr
            ADRL  $00000000     ; Terminator
L026680     DW    $001A
            DW    $0038
            DW    $0029
            DW    $00C4
L026688     DW    $0053
            DW    $010A
            DW    $0062
            DW    $019E
L026690     ADRL  L020F9F
L026694     DW    $0000
L026696     STR   'Track Name:'
L0266A2     DW    $0004         ; Item ID
            DW    $0005         ; Item rect
            DW    $0050
            DW    $000F
            DW    $0108
            DW    $800F         ; Static text
            ADRL  L026696       ; Item descriptor
            DW    $0000         ; Item value
            DW    $0000         ; Bit flag
            ADRL  $00000000     ; Ptr to color table
L0266BA     DW    $0002
            DA    L0266C0
            DA    L0266D4
L0266C0     DW    $0007
            DW    $0000
            DW    $0071
            DW    $016E
            DA    L021B51
            DA    L021B5B
            ADRL  L045444
            DA    L021B6E
            DA    L021B67
L0266D4     DW    $0007
            DW    $0000
            DW    $0071
            DW    $00F6
            DA    L021B92
            DA    L021B9C
            ADRL  L04543C
            DA    L021BAF
            DA    L021BA8
L0266E8     JSR   L0205B5
            JSR   L0219FA
            LDA   #L02672D
            JSR   L021A1A
            JSR   L026B41
            LDA   #^L026FBF
            STA   $50
            PHA
            LDA   #L026FBF
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            LDA   #L021B42
            STA   L0219F8
            JSR   L026735
            _ShowCursor
            JSR   L02185F
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02672D     DW    $001B
            DW    $002C
            DW    $00BC
            DW    $026C
L026735     LDA   #$0060
            STA   L026A81
            LDA   #$0036
            STA   L026A83
            LDA   #$000A
            STA   L026A89
            LDA   L026DED
            STA   L026A85
            STA   L026A9B
            STZ   L026A87
L026753     JSR   L026776
            BCS   L02676C
            DEC   L026A89
            BEQ   L02676F
            LDA   L026A83
            CLC
            ADC   #$000C
            STA   L026A83
            INC   L026A85
            BRA   L026753
L02676C     INC   L026A87
L02676F     LDA   L026A85
            STA   L026A9D
            RTS

L026776     JSR   L026A9F
            LDA   [$3E]
            BMI   L026794
            LDA   L026A81
            STA   L026A8B
            JSR   L0267B2
            JSR   L0267DC
            JSR   L026824
            JSR   L026841
            JSR   L0268D0
            CLC
            RTS

L026794     LDA   L026A81
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            PEA   ^L026A8D
            PEA   L026A8D
            _DrawString
            SEC
            RTS

L0267B2     JSR   L026AB4
            LDA   L026A8B
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            PEA   ^L026B28
            PEA   L026B28
            _DrawString
            LDA   L026A8B
            CLC
            ADC   #$0050
            STA   L026A8B
            RTS

L0267DC     LDY   #$0005
            LDA   [$3E],Y
            AND   #$000F
            INC
            PHA
            PEA   ^L026A72
            PEA   L026A72
            LDA   #$0002
            PHA
            STA   L026A71
            PEA   $0000
            _Int2Dec
            LDA   L026A8B
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            PEA   ^L026A71
            PEA   L026A71
            _DrawString
            LDA   L026A8B
            CLC
            ADC   #$001C
            STA   L026A8B
            RTS

L026824     LDY   #$0005
            LDA   [$3E],Y
            AND   #$0070
            STA   L026A99
            LSR
            LSR
            LSR
            TAY
            JSR   L026922
            LDA   L026A8B
            CLC
            ADC   #$0024
            STA   L026A8B
            RTS

L026841     LDY   #$0004
            LDA   [$3E],Y
            AND   #$000F
            BNE   L02684E
            BRL   L0268CF
L02684E     LDA   L026A99
            CMP   #$0020
            BCS   L026889
            LDA   L026A8B
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            LDA   $5E
            PHA
            LDY   #$0006
            LDA   [$3E],Y
            AND   #$007F
            SEC
            SBC   #$0018
            BCS   L026879
            ADC   #$0018
L026879     ASL
            ASL
            CLC
            ADC   #L026DEF
            PHA
            _DrawString
            BRA   L0268C5
L026889     LDY   #$0006
            LDA   [$3E],Y
            AND   #$007F
            PHA
            PEA   ^L026A72
            PEA   L026A72
            LDA   #$0003
            PHA
            STA   L026A71
            PEA   $0000
            _Int2Dec
            LDA   L026A8B
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            PEA   ^L026A71
            PEA   L026A71
            _DrawString
L0268C5     LDA   L026A8B
            CLC
            ADC   #$0020
            STA   L026A8B
L0268CF     RTS

L0268D0     LDY   #$0004
            LDA   [$3E],Y
            AND   #$000F
            DEC
            BEQ   L026921
            LDY   #$0007
            LDA   [$3E],Y
            AND   #$007F
            PHA
            PEA   ^L026A72
            PEA   L026A72
            LDA   #$0003
            PHA
            STA   L026A71
            PEA   $0000
            _Int2Dec
            LDA   L026A8B
            PHA
            LDA   L026A83
            PHA
            _MoveTo
            PEA   ^L026A71
            PEA   L026A71
            _DrawString
            LDA   L026A8B
            CLC
            ADC   #$0019
            STA   L026A8B
L026921     RTS

L026922     LDA   #L048298
            STA   $6A
            LDA   L02002D
            STA   $6C
            LDA   [$6A],Y
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0006
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDA   $06
            PHA
            LDA   $04
            PHA
            LDA   L026A8B
            STA   $06
            LDA   L026A83
            SEC
            SBC   #$0008
            STA   $04
            JSR   L0254E3
            PLA
            STA   $04
            PLA
            STA   $06
            RTS

L02695F     LDA   L026A87
            BEQ   L026965
            RTS

L026965     LDA   #$4458
            STA   $16
            LDAL  L020966
            STA   $18
            LDA   L0205B1
            STA   $1C
            LDA   L0205B1+2
            STA   $1E
            LDA   #$0068
            STA   $2C
            LDA   #$0036
            STA   $2E
            STA   $20
            LDA   #$00A0
            STA   $1A
            JSR   L025501
            LDA   #$3CD8
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   L0205B1
            STA   $16
            LDA   L0205B1+2
            STA   $18
            LDA   #$0074
            STA   $2C
            LDA   #$0036
            STA   $2E
            STA   $1A
            LDA   #$00A0
            STA   $20
            JSR   L025501
            LDA   #$00A2
            STA   L026A83
            LDA   #$0060
            STA   L026A81
            INC   L026A9D
            INC   L026A9B
            LDA   L026A9D
            STA   L026A85
            JSR   L026776
            BCC   L0269D7
            INC   L026A87
L0269D7     RTS

L0269D8     LDA   L026A9B
            BNE   L0269DE
            RTS

L0269DE     LDA   #$3CD8
            STA   $16
            LDAL  L020966
            STA   $18
            LDA   L0205B1
            STA   $1C
            LDA   L0205B1+2
            STA   $1E
            LDA   #$0068
            STA   $2C
            LDA   #$0036
            STA   $2E
            STA   $20
            LDA   #$00A0
            STA   $1A
            JSR   L025501
            LDA   #$4458
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   L0205B1
            STA   $16
            LDA   L0205B1+2
            STA   $18
            LDA   #$0068
            STA   $2C
            LDA   #$0036
            STA   $2E
            STA   $1A
            LDA   #$00A0
            STA   $20
            JSR   L025501
            LDA   #$3CD8
            JSR   L026A55
            LDA   #$0036
            STA   L026A83
            LDA   #$0060
            STA   L026A81
            DEC   L026A9D
            DEC   L026A9B
            STZ   L026A87
            LDA   L026A9B
            STA   L026A85
            JSR   L026776
            RTS

L026A55     STA   $30
            LDA   #$0008
            STA   $2C
            LDA   #$0036
            STA   $2E
            STA   $1A
            LDA   #$00A0
            STA   $20
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            RTS

L026A71     DB    $00
L026A72     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L026A81     DB    $00
            DB    $00
L026A83     DB    $00
            DB    $00
L026A85     DB    $00
            DB    $00
L026A87     DB    $00
            DB    $00
L026A89     DB    $0A
            DB    $00
L026A8B     DB    $00
            DB    $00
L026A8D     STR   '*** EOS ***'
L026A99     DB    $00
            DB    $00
L026A9B     DB    $00
            DB    $00
L026A9D     DB    $00
            DB    $00
L026A9F     LDA   L026A85
            ASL
            ASL
            ASL
            CLC
            ADC   L027412
            STA   $3E
            LDA   L027414
            ADC   #$0000
            STA   $40
            RTS

L026AB4     PHA
            PHA
            PHA
            LDA   L021107
            PHA
            LDA   L021103
            PHA
            LDY   #$0001
            LDA   [$3E],Y
            AND   #$00FF
            PHA
            INY
            LDA   [$3E],Y
            PHA
            _ConvertToMeasure
            PLA
            STA   L026B33
            PLA
            STA   L026B35
            PLA
            STA   L026B37
            LDA   L026B33
            PHA
            PEA   ^L026B29
            PEA   L026B29
            LDA   #$0003
            PHA
            PEA   $0000
            _Int2Dec
            LDA   L026B35
            PHA
            PEA   ^L026B2D
            PEA   L026B2D
            LDA   #$0002
            PHA
            PEA   $0000
            _Int2Dec
            LDA   L026B37
            PHA
            PEA   ^L026B30
            PEA   L026B30
            LDA   #$0003
            PHA
            PEA   $0000
            _Int2Dec
            RTS

L026B28     DB    $0A
L026B29     ASC   '123'
            ASC   ':'
L026B2D     ASC   '12'
            ASC   ':'
L026B30     ASC   '123'
L026B33     DW    $0000
L026B35     DW    $0000
L026B37     DW    $0000
L026B39     DW    $0029
            DW    $0178
            DW    $0096
            DW    $0244
L026B41     JSR   L026D27
            PEA   $0002
            PEA   $0001
            _SetPenSize
            PEA   $0000
            _SetSolidPenPat
            PEA   ^L026B39
            PEA   L026B39
            PEA   $0018
            PEA   $000A
            _FrameRRect
            PEA   $0001
            PEA   $0001
            _SetPenSize
            PEA   $0190
            PEA   $0038
            _MoveTo
            PEA   ^L026D00
            PEA   L026D00
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $01CC
            PEA   $0038
            _MoveTo
            PEA   ^L028B08
            PEA   L028B08
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            PEA   $0190
            PEA   $0044
            _MoveTo
            PEA   ^L026D06
            PEA   L026D06
            _DrawString
            LDA   L026DE7
            PHA
            LDA   L026DE5
            PHA
            PEA   ^L026D21
            PEA   L026D21
            LDA   #$0006
            PHA
            STA   L026D20
            PEA   $0000
            _Long2Dec
            PEA   $01CC
            PEA   $0044
            _MoveTo
            PEA   ^L026D20
            PEA   L026D20
            _DrawString
            PEA   $0190
            PEA   $0050
            _MoveTo
            PEA   ^L026D0E
            PEA   L026D0E
            _DrawString
            LDA   L026DEB
            PHA
            LDA   L026DE9
            PHA
            PEA   ^L026D21
            PEA   L026D21
            LDA   #$0006
            PHA
            STA   L026D20
            PEA   $0000
            _Long2Dec
            PEA   $01CC
            PEA   $0050
            _MoveTo
            PEA   ^L026D20
            PEA   L026D20
            _DrawString
            PEA   $0190
            PEA   $0074
            _MoveTo
            PEA   ^L026D14
            PEA   L026D14
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $01CC
            PEA   $0074
            _MoveTo
            PEA   ^L028C64
            PEA   L028C64
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            PEA   $0190
            PEA   $0080
            _MoveTo
            PEA   ^L026D1A
            PEA   L026D1A
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $01CC
            PEA   $0080
            _MoveTo
            PEA   ^L028C74
            PEA   L028C74
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            RTS

L026D00     STR   'Name:'
L026D06     STR   'Length:'
L026D0E     STR   'Free:'
L026D14     STR   'Bank:'
L026D1A     STR   'Wave:'
L026D20     DB    $06
L026D21     ASC   000000000000
L026D27     PHA
            PHA
            LDA   L02763F
            PHA
            LDA   L02763D
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _Locate
            PLA
            STA   L026DDD
            PLA
            STA   L026DDF
            SEC
            LDA   L026DDD
            SBC   L027412
            STA   L026DDD
            LDA   L026DDF
            SBC   L027414
            STA   L026DDF
            LSR   L026DDF
            ROR   L026DDD
            LSR   L026DDF
            ROR   L026DDD
            LSR   L026DDF
            ROR   L026DDD
            LDA   L026DDD
            STA   L026DED
            PHA
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _LocateEnd
            PLA
            STA   L026DDD
            PLA
            STA   L026DDF
            LDA   L026DDD
            SEC
            SBC   L027412
            STA   L026DE5
            LDA   L026DDF
            SBC   L027414
            STA   L026DE7
            LDA   L026DE5
            SEC
            SBC   #$0002
            STA   L026DE5
            LDA   L026DE7
            SBC   #$0000
            STA   L026DE7
            LDA   L027412
            CLC
            ADC   #$0000
            STA   L026DE1
            LDA   L027414
            ADC   #$0002
            STA   L026DE3
            LDA   L026DE1
            SEC
            SBC   L026DDD
            STA   L026DE9
            LDA   L026DE3
            SBC   L026DDF
            LSR
            STA   L026DEB
            ROR   L026DE9
            RTS

L026DDD     DB    $00
            DB    $00
L026DDF     DB    $00
            DB    $00
L026DE1     DB    $00
            DB    $00
L026DE3     DB    $00
            DB    $00
L026DE5     DB    $00
            DB    $00
L026DE7     DB    $00
            DB    $00
L026DE9     DB    $00
            DB    $00
L026DEB     DB    $00
            DB    $00
L026DED     DB    $00
            DB    $00
L026DEF     STR   'C0 '
            STR   'C#0'
            STR   'D0 '
            STR   'D#0'
            STR   'E0 '
            STR   'F0 '
            STR   'F#0'
            STR   'G0 '
            STR   'G#0'
            STR   'A0 '
            STR   'A#0'
            STR   'B0 '
            STR   'C1 '
            STR   'C#1'
            STR   'D1 '
            STR   'D#1'
            STR   'E1 '
            STR   'F1 '
            STR   'F#1'
            STR   'G1 '
            STR   'G#1'
            STR   'A1 '
            STR   'A#1'
            STR   'B1 '
            STR   'C2 '
            STR   'C#2'
            STR   'D2 '
            STR   'D#2'
            STR   'E2 '
            STR   'F2 '
            STR   'F#2'
            STR   'G2 '
            STR   'G#2'
            STR   'A2 '
            STR   'A#2'
            STR   'B2 '
            STR   'C3 '
            STR   'C#3'
            STR   'D3 '
            STR   'D#3'
            STR   'E3 '
            STR   'F3 '
            STR   'F#3'
            STR   'G3 '
            STR   'G#3'
            STR   'A3 '
            STR   'A#3'
            STR   'B3 '
            STR   'C4 '
            STR   'C#4'
            STR   'D4 '
            STR   'D#4'
            STR   'E4 '
            STR   'F4 '
            STR   'F#4'
            STR   'G4 '
            STR   'G#4'
            STR   'A4 '
            STR   'A#4'
            STR   'B4 '
            STR   'C5 '
            STR   'C#5'
            STR   'D5 '
            STR   'D#5'
            STR   'E5 '
            STR   'F5 '
            STR   'F#5'
            STR   'G5 '
            STR   'G#5'
            STR   'A5 '
            STR   'A#5'
            STR   'B5 '
            STR   'C6 '
            STR   'C#6'
            STR   'D6 '
            STR   'D#6'
            STR   'E6 '
            STR   'F6 '
            STR   'F#6'
            STR   'G6 '
            STR   'G#6'
            STR   'A6 '
            STR   'A#6'
            STR   'B6 '
            STR   'C7 '
            STR   'C#7'
            STR   'D7 '
            STR   'D#7'
            STR   'E7 '
            STR   'F7 '
            STR   'F#7'
            STR   'G7 '
            STR   'G#7'
            STR   'A7 '
            STR   'A#7'
            STR   'B7 '
            STR   'C8 '
            STR   'C#8'
            STR   'D8 '
            STR   'D#8'
            STR   'E8 '
            STR   'F8 '
            STR   'F#8'
            STR   'G8 '
            STR   'G#8'
            STR   'A8 '
            STR   'A#8'
            STR   'B8 '
            STR   'C9 '
            STR   'C#9'
            STR   'D9 '
            STR   'D#9'
            STR   'E9 '
            STR   'F9 '
            STR   'F#9'
            STR   'G9 '
L026FBF     DW    $0002
            DA    L026FC5
            DA    L026FE7
L026FC5     DW    $000B
            DW    $0000
            DW    $0028
            DW    $0138
            DW    $0078
            DW    $003C
            DW    $003C
            DA    L025500
            DW    $394E
            DW    $00E8
            DA    L025500
            DW    $0000
            ADRL  L02695F
            ADRL  L0269D8
            DA    L025500
L026FE7     DW    $0007
            DW    $0000
            DW    $00A1
            DW    $01C0
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L026FFB     JSR   L0205B5
            JSR   L0219FA
            LDA   #L027049
            JSR   L021A1A
            LDA   #^L02706B
            STA   $50
            PHA
            LDA   #L02706B
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            LDA   L021B3E
            BEQ   L02703F
            LDX   L027804
            LDA   L027806
            DEC
            STA   L0210BF,X
L02703F     JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L027049     DW    $002E
            DW    $012C
            DW    $0084
            DW    $01BC
L027051     LDY   #$000C
            LDA   ($00),Y
            STA   L027806
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L027062     LDA   L027806
            LDY   #$000C
            STA   ($00),Y
            RTS

L02706B     DW    $0002
            DA    L027071
            DA    L027099
L027071     DW    $0002
            DW    $0000
            DW    $003C
            DW    $0178
            DW    $0000
            DW    $0010
            DW    $0000
            DA    L027062
            DW    $45DE
            DW    $4854
            DA    L027051
            ADRL  L027091
            DW    $0158
            DW    $0059
            DA    L025500
L027091     STR   'Channel'
L027099     DW    $0007
            DW    $0000
            DW    $0068
            DW    $0152
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L0270AD     JSR   L0206A9
L0270B0     JSR   L0270E3
            LDA   #L0270E3
            STA   L02126C
            LDA   #L0270B0
            STA   L02001D
            LDA   #L0275F2
            STA   L02002F
            JSR   L0270FE
            PEA   $0040
            PEA   $00A6
            _MoveTo
            PEA   ^L0270FC
            PEA   L0270FC
            _DrawString
            RTS

L0270E3     JSR   L025598
            LDA   #^L027963
            STA   $50
            PHA
            LDA   #L027963
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            JSR   L025574
            RTS

L0270FC     STR   '='
L0270FE     LDA   #L027107
            STA   $3E
            JSR   L028050
            RTS

L027107     ADRL  L042648
            DW    $0009
            DW    $0008
            DW    $2F3F
            ADRL  L042690
            DW    $000C
            DW    $000E
            DW    $2F4E
            ADRL  L042738
            DW    $0009
            DW    $000C
            DW    $2F62
            ADRL  L0427A4
            DW    $0009
            DW    $0012
            DW    $2F79
            DW    $0000
L027131     JSR   L0212F6
            JSR   L021707
            RTS
L027138     RTS

L027139     LDY   #$000C
            LDA   ($00),Y
            STA   L021101
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L02714A     LDA   L021101
            LDY   #$000C
            STA   ($00),Y
            RTS

L027153     LDA   L021101
            SEC
            SBC   #$0005
            ASL
            PHA
            _SetTempo
            RTS

L027164     JSR   L0212E1
            RTS

L027168     LDY   #$0010
            LDA   ($00),Y
            CMP   L0271C4
            BEQ   L027176
            JSR   L0212F6
            RTS

L027176     LDA   $00
            STA   L0271C8
            JSR   L0212E1
            RTS

L02717F     LDY   #$0010
            LDA   ($00),Y
            CMP   L0271C4
            BNE   L02718A
            RTS

L02718A     STA   L0271C6
            LDA   L0271C4
            BEQ   L027198
            LDA   L0271C6
            BEQ   L02719B
            RTS

L027198     LDA   L0271C6
L02719B     STA   L0271C4
            JSR   L02AFCD
            LDA   $00
            PHA
            LDA   L0271C8
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
            STA   L0271C8
            JSR   L0212E1
            LDA   L0271C4
            ASL
            TAX
            JSR   (L0271BE,X)
            RTS

L0271BE     DA    L0271CA
            DA    L02721B
            DA    L027244
L0271C4     DW    $0000
L0271C6     DW    $0000
L0271C8     DW    $0000
L0271CA     LDA   L027426
            AND   #$FCFF
            STA   L027426
            PEA   ^L027416
            PEA   L027416
            _SeqPlayer
            _KillAllNotes
            JSR   L0272DD
            STZ   L027643
            LDA   L02728E
            BEQ   L02721A
            _WaitCursor
            LDA   L027420
            PHA
            LDA   L02741E
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _Merge
            STZ   L02728E
            _InitCursor
L02721A     RTS

L02721B     JSR   L02AF76
            JSR   L02732A
            JSR   L02737E
            LDA   L027426
            AND   #$FDFF
            ORA   #$0100
            STA   L027426
            JSR   L021707
            PEA   ^L027416
            PEA   L027416
            _SeqPlayer
            STZ   L02728E
            RTS

L027244     LDA   L0210FF
            BMI   L02726E
            PHA
            PHA
            PHA
            PHA
            PHA
            LDA   L02763F
            PHA
            LDA   L02763D
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _Locate
            _DeleteTrack
            PLA
            PLA
L02726E     JSR   L02732A
            JSR   L02737E
            LDA   L027426
            ORA   #$0300
            STA   L027426
            PEA   ^L027416
            PEA   L027416
            _SeqPlayer
            INC   L02728E
            RTS

L02728E     DW    $0000
L027290     JSR   L02737E
            LDA   L027426
            AND   #$FDFF
            ORA   #$0100
            STA   L027426
            PEA   ^L027416
            PEA   L027416
            _SeqPlayer
            RTS

L0272AD     LDA   L027426
            AND   #$FCFF
            STA   L027426
            PEA   ^L027416
            PEA   L027416
            _SeqPlayer
            _KillAllNotes
            RTS

L0272CB     JSR   L0272DD
            LDA   $00
            PHA
            LDA   #L027A23
            STA   $00
            JSR   L02717F
            PLA
            STA   $00
            RTS

L0272DD     LDA   #$000F
            STA   L027310
L0272E3     PEA   $0000
            PEA   $0002
            LDA   #$00B0
            ORA   L027310
            PHA
            LDA   #$0007
            PHA
            LDA   L027310
            ASL
            TAY
            LDA   L02109F,Y
            PHA
            _MIDIMessage
            DEC   L027310
            BPL   L0272E3
            JSR   L027312
            JSR   L02965B
            RTS

L027310     DW    $000F
L027312     LDA   L027589
            BEQ   L027329
            STZ   L02763D
            STZ   L02763F
            LDA   #$0001
            STA   L027637
            STA   L027639
            JSR   L021707
L027329     RTS

L02732A     LDA   #$0001
            STA   L027643
            LDA   L027426
            AND   #$007F
            STA   L027641
            LDA   L027637
            CMP   #$0001
            BEQ   L027346
            LDA   #$0180
            BRA   L027349
L027346     LDA   #$01A0
L027349     LDY   #$00E4
            STA   [$70],Y
            LDA   #$000F
            STA   L027310
L027354     PEA   $0000
            PEA   $0002
            LDA   #$00B0
            ORA   L027310
            PHA
            LDA   #$0007
            PHA
            LDA   L027310
            ASL
            TAY
            LDA   L02109F,Y
            PHA
            _MIDIMessage
            DEC   L027310
            BPL   L027354
            JSR   L029619
            RTS

L02737E     LDA   L027412
            STA   L027422
            LDA   L027414
            CLC
            ADC   #$0002
            STA   L027424
            JSR   L02739E
            LDA   L02763D
            STA   L027428
            LDA   L02763F
            STA   L02742A
            RTS

L02739E     PHA
            PHA
            LDA   L02763F
            PHA
            LDA   L02763D
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _Locate
            PLA
            STA   L027416
            PLA
            STA   L027418
            PHA
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _LocateEnd
            PLA
            STA   L02741E
            PLA
            STA   L027420
            LDA   L027422
            SEC
            SBC   L02741E
            STA   L02740C
            LDA   L027424
            SBC   L027420
            LSR
            STA   L02740E
            ROR   L02740C
            CLC
            LDA   L02740C
            ADC   L02741E
            STA   L02741E
            STA   $3E
            LDA   L02740E
            ADC   L027420
            STA   L027420
            STA   $40
            LDA   #$FFFF
            STA   [$3E]
            RTS

L02740C     DB    $00
            DB    $00
L02740E     DB    $00
            DB    $00
L027410     DB    $00
            DB    $00
L027412     DB    $00
            DB    $00
L027414     DB    $00
            DB    $00
L027416     DB    $00
            DB    $00
L027418     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02741E     DB    $00
            DB    $00
L027420     DB    $00
            DB    $00
L027422     DB    $00
            DB    $00
L027424     DB    $00
            DB    $00
L027426     DB    $00
            DB    $00
L027428     DB    $00
            DB    $00
L02742A     DB    $00
            DB    $00
L02742C     PHB
            PHK
            PLB
            LDA   L0271C4
            CMP   #$0001
            BNE   L02743D
            LDA   #$0001
            STA   L027410
L02743D     PLB
            RTL

L02743F     PHB
            PHK
            PLB
            LDA   #$0001
            STA   L027410
            PLB
            RTL

L02744A     JSR   L0212F6
            RTS

L02744E     LDA   L0271C4
            BEQ   L02747D
            CMP   #$0001
            BEQ   L027459
            RTS

L027459     STA   L0274CA
            JSR   L0212E1
            LDA   L021101
            STA   L0274CC
            ASL
            CMP   #$0084
            BCC   L027470
            BEQ   L027470
            LDA   #$0084
L027470     STA   L021101
            JSR   L027153
            LDA   #$0001
            STA   L02755E
            RTS

L02747D     STA   L0274CA
            STZ   L027560
            JMP   L02750F

L027486     LDA   L0274CA
            BNE   L027491
            STZ   L027560
            JMP   L027522

L027491     JSR   L025353
            BCS   L0274A2
            LDA   L02755E
            BEQ   L0274AD
            JSR   L0274BD
            STZ   L02755E
            RTS

L0274A2     LDA   L02755E
            BNE   L0274AD
            LDA   L0274CA
            JSR   L027459
L0274AD     RTS

L0274AE     LDA   L0274CA
            BEQ   L0274B9
            CMP   #$0001
            BEQ   L0274BD
            RTS

L0274B9     JSR   L0212F6
            RTS

L0274BD     JSR   L0212F6
            LDA   L0274CC
            STA   L021101
            JSR   L027153
            RTS

L0274CA     DW    $0000
L0274CC     DW    $0000
L0274CE     JSR   L0212F6
            RTS

L0274D2     LDA   L0271C4
            BEQ   L0274D8
            RTS

L0274D8     LDA   #$0002
            STA   L027560
            JSR   L027599
            BCC   L0274F5
            LDA   #$0001
            STA   L027639
            STA   L027637
            STA   L02763B
            STZ   L02763D
            STZ   L02763F
L0274F5     BRA   L02750F
L0274F7     LDA   L0271C4
            BEQ   L0274FD
            RTS

L0274FD     LDA   #$0002
            STA   L027560
            BRA   L027522
L027505     LDA   L0271C4
            BEQ   L02750B
            RTS

L02750B     JSR   L0212F6
            RTS

L02750F     JSR   L0212E1
            LDA   #$0001
            STA   L02755E
            JSR   L02758B
            LDX   L027560
            JSR   (L027562,X)
L027521     RTS

L027522     JSR   L025353
            BCS   L027533
            LDA   L02755E
            BEQ   L027521
            JSR   L0212F6
            STZ   L02755E
            RTS

L027533     LDA   L02755E
            BNE   L027545
            JSR   L0212E1
            INC   L02755E
            LDAL  TickCount
            STA   L025178
L027545     JSR   L0252C3
            BCC   L027521
            LDA   #$0003
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDX   L027560
            JSR   (L027562,X)
            RTS

L02755E     DW    $0000
L027560     DW    $0000
L027562     DA    L027645
            DA    L027696
L027566     LDA   L027589
            BEQ   L02756F
            JSR   L0212E1
            RTS

L02756F     JSR   L0212F6
            RTS

L027573     LDA   L027589
            BNE   L027582
            LDA   #$FFFF
            STA   L027589
            JSR   L0212E1
            RTS

L027582     STZ   L027589
            JSR   L0212F6
            RTS

L027589     DW    $FFFF
L02758B     LDAL  TickCount
            STA   L025178
            LDA   #$001E
            STA   L02517A
            RTS

L027599     LDA   L02000D
            CMP   L0275EA
            BNE   L0275CE
            LDA   L02000F
            CMP   L0275EC
            BNE   L0275CE
            LDA   L020009
            SEC
            SBC   L0275EE
            TAX
            INY
            INY
            LDA   L020009+2
            SBC   L0275F0
            BNE   L0275CE
            CPX   L0275E8
            BCS   L0275CE
            STZ   L0275EA
            STZ   L0275EC
            STZ   L0275EE
            STZ   L0275F0
            SEC
            RTS

L0275CE     LDA   L02000D
            STA   L0275EA
            LDA   L02000F
            STA   L0275EC
            LDA   L020009
            STA   L0275EE
            LDA   L020009+2
            STA   L0275F0
            CLC
            RTS

L0275E8     DB    $00
            DB    $00
L0275EA     DB    $00
            DB    $00
L0275EC     DB    $00
            DB    $00
L0275EE     DB    $00
            DB    $00
L0275F0     DB    $00
            DB    $00
L0275F2     LDA   L02763B
            BEQ   L0275FD
            STZ   L02763B
            JSR   L021707
L0275FD     LDA   L027410
            BEQ   L027609
            STZ   L027410
            JSR   L0272CB
            RTS

L027609     LDA   L0271C4
            BEQ   L027619
            LDA   L02126C
            CMP   #L0270E3
            BNE   L027619
            JSR   L02AF60
L027619     RTS

L02761A     PHB
            PHD
            PHK
            PLB
            LDA   L02002B
            TCD
            LDA   L027643
            BEQ   L027631
            DEC   L027641
            BPL   L027634
            STZ   L027643
            BRA   L027634
L027631     JSR   L027645
L027634     PLD
            PLB
            RTL

L027637     DW    $0001
L027639     DW    $0001
L02763B     DW    $0000
L02763D     DW    $0000
L02763F     DW    $0000
L027641     DW    $0000
L027643     DW    $0000
L027645     INC   L027637
            LDA   L027637
            CMP   L021103
            BCC   L027678
            BEQ   L027678
            LDA   #$0001
            STA   L027637
            LDY   #$00E4
            LDA   #$01A0
            STA   [$70],Y
            INC   L027639
            LDA   L027639
            CMP   #$03E8
            BNE   L027680
            LDA   #$03E7
            STA   L027639
            LDA   L021103
            STA   L027637
            RTS

L027678     LDY   #$00E4
            LDA   #$0180
            STA   [$70],Y
L027680     LDA   L02763D
            CLC
            ADC   L021107
            STA   L02763D
            BCC   L02768F
            INC   L02763F
L02768F     LDA   #$0001
            STA   L02763B
            RTS

L027696     DEC   L027637
            LDA   L027637
            BNE   L0276B3
            LDA   L021103
            STA   L027637
            DEC   L027639
            BNE   L0276B3
            LDA   #$0001
            STA   L027639
            STA   L027637
            RTS

L0276B3     LDA   L02763D
            SEC
            SBC   L021107
            STA   L02763D
            BCS   L0276C2
            DEC   L02763F
L0276C2     LDA   #$0001
            STA   L02763B
            RTS

L0276C9     STZ   L02763D
            STZ   L02763F
            LDA   #$0001
            STA   L027637
            STA   L027639
            LDA   L02126C
            CMP   #L0270E3
            BNE   L0276E3
            JSR   L021707
L0276E3     RTS

L0276E4     LDY   #$0010
            LDA   ($00),Y
            ASL
            TAX
            LDA   L0210DF,X
            BNE   L0276F4
            JSR   L0212F6
            RTS

L0276F4     LDA   #$FFFF
            STA   L0210DF,X
            JSR   L0212E1
            RTS

L0276FE     LDY   #$0010
            LDA   ($00),Y
            STA   L027737
            ASL
            TAX
            LDA   L0210DF,X
            EOR   #$FFFF
            STA   L0210DF,X
            BNE   L027725
            JSR   L0212F6
            LDA   L027737
            PHA
            PEA   $0000
            _SetPlayTrack
            RTS

L027725     JSR   L0212E1
            LDA   L027737
            PHA
            PEA   $0001
            _SetPlayTrack
            RTS

L027737     DW    $0000
L027739     LDY   #$0010
            LDA   ($00),Y
            CMP   L0210FF
            BEQ   L027747
            JSR   L0212F6
            RTS

L027747     LDA   $00
            STA   L02779D
            JSR   L0212E1
            RTS

L027750     LDY   #$0010
            LDA   ($00),Y
            CMP   L0210FF
            BNE   L02776E
            LDA   #$FFFF
            STA   L0210FF
            JSR   L0212F6
            PEA   $FFFF
            _SetRecTrack
            RTS

L02776E     LDA   L0210FF
            BMI   L027781
            LDA   $00
            PHA
            LDA   L02779D
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
L027781     LDY   #$0010
            LDA   ($00),Y
            STA   L0210FF
            LDA   $00
            STA   L02779D
            JSR   L0212E1
            LDA   L0210FF
            PHA
            _SetRecTrack
            RTS

L02779D     DW    $0000
L02779F     LDY   #$0010
            LDA   ($00),Y
            ASL
            TAX
            LDA   L0210BF,X
            INC
            STA   L027806
            ASL
            TAX
            LDAL  L0417CE,X
            LDY   #$000C
            STA   ($00),Y
            JMP   L0212F6

L0277BB     LDY   #$0010
            LDA   ($00),Y
            ASL
            TAX
            STX   L027804
            LDA   L0210BF,X
            INC
            STA   L027806
            ASL
            TAX
            LDAL  L0417CE,X
            LDY   #$000C
            STA   ($00),Y
            JSR   L0212E1
            JSR   L026FFB
            LDX   L027804
            LDA   L0210BF,X
            INC
            ASL
            TAX
            LDAL  L0417CE,X
            LDY   #$000C
            STA   ($00),Y
            JSR   L0212F6
            LDA   L027804
            TAX
            LSR
            PHA
            LDA   L0210BF,X
            PHA
            _TrackToChannel
            RTS

L027804     DW    $0000
L027806     DW    $0000
L027808     JSR   L0212F6
            LDY   #$0010
            LDA   ($00),Y
            STA   L027871
            JSR   L02783E
            RTS

L027817     LDY   #$0010
            LDA   ($00),Y
            STA   L027871
            LDA   #$0001
            PHA
            _SetForeColor
            JSR   L02783E
            LDA   #$0000
            PHA
            _SetForeColor
            JSR   L0264A7
            JMP   L027808

L02783E     LDA   L027871
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L020F9F
            STA   L02786F
            LDA   #$01D8
            PHA
            LDA   L027871
            ASL
            TAX
            LDA   L027873,X
            PHA
            _MoveTo
            LDA   $5E
            PHA
            LDA   L02786F
            PHA
            _DrawString
            RTS

L02786F     DW    $0000
L027871     DW    $0000
L027873     DW    $0033
            DW    $0047
            DW    $005B
            DW    $006F
            DW    $0083
            DW    $0097
            DW    $00AB
            DW    $00BF
L027883     LDX   #$0000
L027886     LDA   L0278E3,X
            STA   L020F9F,X
            INX
            INX
            CPX   #$0080
            BNE   L027886
            LDX   #$0000
L027896     LDA   #$007F
            STA   L02109F,X
            LDA   #$0000
            STA   L0210DF,X
            LDA   #$FFFF
            STA   L0210BF,X
            INX
            INX
            CPX   #$0020
            BNE   L027896
            LDA   #$0000
            STA   L0210FF
            LDA   #$0001
            STA   L0210DF
            LDA   L027412
            STA   $3E
            LDA   L027414
            STA   $40
            LDA   #$FFFF
            STA   [$3E]
            STZ   L02763D
            STZ   L02763F
            LDA   #$0001
            STA   L027637
            STA   L027639
            JSR   L021149
            LDX   #$0000
            JSR   (L02126C,X)
            RTS

L0278E3     STR   'Track 1'
            HEX   0000000000000000
            STR   'Track 2'
            HEX   0000000000000000
            STR   'Track 3'
            HEX   0000000000000000
            STR   'Track 4'
            HEX   0000000000000000
            STR   'Track 5'
            HEX   0000000000000000
            STR   'Track 6'
            HEX   0000000000000000
            STR   'Track 7'
            HEX   0000000000000000
            STR   'Track 8'
            HEX   0000000000000000
L027963     DW    $0032
            DA    L027B11
            DA    L027B23
            DA    L027B35
            DA    L027B47
            DA    L027B59
            DA    L027B6B
            DA    L027B7D
            DA    L027B8F
            DA    L027BA1
            DA    L027BB3
            DA    L027BC5
            DA    L027BD7
            DA    L027BE9
            DA    L027BFB
            DA    L027C0D
            DA    L027C1F
            DA    L027C31
            DA    L027C43
            DA    L027C55
            DA    L027C67
            DA    L027C79
            DA    L027C8B
            DA    L027C9D
            DA    L027CAF
            DA    L027A81
            DA    L027A93
            DA    L027AA5
            DA    L027AB7
            DA    L027AC9
            DA    L027ADB
            DA    L027AED
            DA    L027AFF
            DA    L027A23
            DA    L027A35
            DA    L027A11
            DA    L027A47
            DA    L027A5B
            DA    L027A6F
            DA    L0279C9
            DA    L0279DB
            DA    L0217E3
            DA    L0217F5
            DA    L021807
            DA    L0279FF
            DA    L0296A2
            DA    L0296B8
            DA    L0296CE
            DA    L0296E4
            DA    L0296FA
            DA    L029710
L0279C9     DW    $0005
            DW    $0000
            DW    $003E
            DW    $002C
            DA    L027138
            DA    L027131
            ADRL  L045258
            DW    $0000
L0279DB     DW    $0002
            DW    $0000
            DW    $0099
            DW    $0080
            DW    $0005
            DW    $0063
            DW    $003C
            DA    L02714A
            DW    $7FC0
            DW    $8236
            DA    L027139
            ADRL  L0279FB
            DW    $005C
            DW    $00B6
            DA    L027153
L0279FB     STR   'BPM'
L0279FF     DW    $0005
            DW    $0000
            DW    $009B
            DW    $0024
            DA    L025500
            DA    L027164
            ADRL  L047DF8
            DW    $0000
L027A11     DW    $0005
            DW    $0000
            DW    $005B
            DW    $0014
            DA    L02717F
            DA    L027168
            ADRL  L040010
            DW    $0002
L027A23     DW    $0005
            DW    $0000
            DW    $005B
            DW    $004C
            DA    L02717F
            DA    L027168
            ADRL  L040000
            DW    $0000
L027A35     DW    $0005
            DW    $0000
            DW    $005B
            DW    $0084
            DA    L02717F
            DA    L027168
            ADRL  L040008
            DW    $0001
L027A47     DW    $0006
            DW    $0000
            DW    $0074
            DW    $0084
            DA    L02744E
            DA    L02744A
            ADRL  L040020
            DA    L027486
            DA    L0274AE
L027A5B     DW    $0006
            DW    $0000
            DW    $0074
            DW    $004C
            DA    L0274D2
            DA    L0274CE
            ADRL  L040018
            DA    L0274F7
            DA    L027505
L027A6F     DW    $0005
            DW    $0000
            DW    $0074
            DW    $0014
            DA    L027573
            DA    L027566
            ADRL  L040910
            DW    $0000
L027A81     DW    $0005
            DW    $0000
            DW    $0028
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0000
L027A93     DW    $0005
            DW    $0000
            DW    $003C
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0001
L027AA5     DW    $0005
            DW    $0000
            DW    $0050
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0002
L027AB7     DW    $0005
            DW    $0000
            DW    $0064
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0003
L027AC9     DW    $0005
            DW    $0000
            DW    $0078
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0004
L027ADB     DW    $0005
            DW    $0000
            DW    $008C
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0005
L027AED     DW    $0005
            DW    $0000
            DW    $00A0
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0006
L027AFF     DW    $0005
            DW    $0000
            DW    $00B4
            DW    $00FC
            DA    L0277BB
            DA    L02779F
            ADRL  L0417F0
            DW    $0007
L027B11     DW    $0005
            DW    $0000
            DW    $0028
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0000
L027B23     DW    $0005
            DW    $0000
            DW    $003C
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0001
L027B35     DW    $0005
            DW    $0000
            DW    $0050
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0002
L027B47     DW    $0005
            DW    $0000
            DW    $0064
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0003
L027B59     DW    $0005
            DW    $0000
            DW    $0078
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0004
L027B6B     DW    $0005
            DW    $0000
            DW    $008C
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0005
L027B7D     DW    $0005
            DW    $0000
            DW    $00A0
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0006
L027B8F     DW    $0005
            DW    $0000
            DW    $00B4
            DW    $0144
            DA    L0276FE
            DA    L0276E4
            ADRL  L043A3E
            DW    $0007
L027BA1     DW    $0005
            DW    $0000
            DW    $0028
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0000
L027BB3     DW    $0005
            DW    $0000
            DW    $003C
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0001
L027BC5     DW    $0005
            DW    $0000
            DW    $0050
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0002
L027BD7     DW    $0005
            DW    $0000
            DW    $0064
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0003
L027BE9     DW    $0005
            DW    $0000
            DW    $0078
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0004
L027BFB     DW    $0005
            DW    $0000
            DW    $008C
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0005
L027C0D     DW    $0005
            DW    $0000
            DW    $00A0
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0006
L027C1F     DW    $0005
            DW    $0000
            DW    $00B4
            DW    $018C
            DA    L027750
            DA    L027739
            ADRL  L043A46
            DW    $0007
L027C31     DW    $0005
            DW    $0000
            DW    $0028
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0000
L027C43     DW    $0005
            DW    $0000
            DW    $003C
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0001
L027C55     DW    $0005
            DW    $0000
            DW    $0050
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0002
L027C67     DW    $0005
            DW    $0000
            DW    $0064
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0003
L027C79     DW    $0005
            DW    $0000
            DW    $0078
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0004
L027C8B     DW    $0005
            DW    $0000
            DW    $008C
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0005
L027C9D     DW    $0005
            DW    $0000
            DW    $00A0
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0006
L027CAF     DW    $0005
            DW    $0000
            DW    $00B4
            DW    $01C4
            DA    L027817
            DA    L027808
            ADRL  L045B78
            DW    $0007
L027CC1     JSR   L0206A9
L027CC4     JSR   L027D0E
            LDA   #L027D0E
            STA   L02126C
            LDA   #L027CC4
            STA   L02001D
            PEA   $01BC
            PEA   $0035
            _MoveTo
            PEA   ^L027D27
            PEA   L027D27
            _DrawString
            PEA   $01BC
            PEA   $0055
            _MoveTo
            PEA   ^L027D2E
            PEA   L027D2E
            _DrawString
            LDA   #L027D0D
            STA   L02002F
L027D0D     RTS

L027D0E     JSR   L025598
            LDA   #^L02808F
            STA   $50
            PHA
            LDA   #L02808F
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            JSR   L025574
            RTS

L027D27     STR   'Wave A'
L027D2E     STR   'Wave B'
L027D35     SEP   #$20
            LDY   #$0003
            LDA   ($3C),Y
            REP   #$20
            AND   #$00FF
            LDY   #$000C
            STA   ($00),Y
            RTS

L027D47     LDY   #$000C
            LDA   ($00),Y
            SEP   #$20
            LDY   #$0003
            STA   ($3C),Y
            REP   #$20
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L027D5E     LDY   #$0009
            LDA   ($3C),Y
            AND   #$003F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027D6C     LDY   #$000F
            LDA   ($3C),Y
            AND   #$003F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027D7A     LDY   #$0008
            LDA   ($3C),Y
            AND   #$000F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027D88     LDY   #$000E
            LDA   ($3C),Y
            AND   #$000F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027D96     LDY   #$0007
            LDA   ($3C),Y
            AND   #$000F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027DA4     LDY   #$000D
            LDA   ($3C),Y
            AND   #$000F
            LDY   #$000C
            STA   ($00),Y
            RTS

L027DB2     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$09
            STA   ($3C),Y
L027DBD     REP   #$30
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L027DC8     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0F
            STA   ($3C),Y
            BRA   L027DBD
            MX    %00
L027DD5     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$08
            STA   ($3C),Y
            BRA   L027DBD
            MX    %00
L027DE2     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0E
            STA   ($3C),Y
            BRA   L027DBD
            MX    %00
L027DEF     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$07
            STA   ($3C),Y
            BRA   L027DBD
            MX    %00
L027DFC     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0D
            STA   ($3C),Y
            BRA   L027DBD
	MX    %00
L027E09     SEP   #$20
            LDY   #$0006
            LDA   ($3C),Y
            LSR
            LSR
            STA   L027E78
            LDA   #$1F
            SEC
            SBC   L027E78
            REP   #$20
            AND   #$001F
            LDY   #$000C
            STA   ($00),Y
            RTS
            MX    %00
L027E26     LDY   #$000C
            LDA   #$001F
            SEC
            SBC   ($00),Y
            ASL
            TAX
            SEP   #$30
            ASL
            LDY   #$06
            STA   ($3C),Y
            REP   #$30
            LDA   L021563,X
            JSR   L02162B
            RTS
            MX    %00
L027E41     SEP   #$30
            LDY   #$0C
            LDA   ($3C),Y
            LSR
            LSR
            STA   L027E78
            LDA   #$1F
            SEC
            SBC   L027E78
            REP   #$30
            AND   #$001F
            LDY   #$000C
            STA   ($00),Y
            RTS
            MX    %00
L027E5D     LDY   #$000C
            LDA   #$001F
            SEC
            SBC   ($00),Y
            ASL
            TAX
            SEP   #$30
            ASL
            LDY   #$0C
            STA   ($3C),Y
            REP   #$30
            LDA   L021563,X
            JSR   L02162B
            RTS
            MX    %00
L027E78     DW    $0000
L027E7A     LDY   #$0002
            LDA   ($3C),Y
            AND   #$0007
            LDY   #$000C
            STA   ($00),Y
            RTS

L027E88     LDY   #$000C
            LDA   ($00),Y
            PHA
            SEP   #$30
            LDY   #$02
            STA   ($3C),Y
            REP   #$30
            PLA
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L027EA0     JSR   L0212F6
            LDA   #$0000
            JSR   L023A53
            RTS

L027EAA     LDA   #$0000
            JSR   L023A66
            RTS

L027EB1     JSR   L0212F6
            LDA   #$0001
            JSR   L023A53
            RTS

L027EBB     LDA   #$0001
            JSR   L023A66
            RTS

L027EC2     LDY   #$0001
            LDA   ($3C),Y
            AND   #$000F
            ASL
            TAX
            LDA   L027EFA,X
            STA   $3E
            JSR   L02802C
            RTS

L027ED5     LDY   #$0001
            SEP   #$20
            LDA   ($3C),Y
            INC
            CMP   #$05
            BCC   L027EE5
            BEQ   L027EE5
            LDA   #$00
L027EE5     STA   ($3C),Y
            REP   #$20
            AND   #$000F
            ASL
            TAX
            LDA   L027EFA,X
            STA   $3E
            JSR   L02802C
            JSR   L028C34
            RTS

L027EFA     DA    L027F06
            DA    L027F32
            DA    L027F5C
            DA    L027F86
            DA    L027FBA
            DA    L027FEE
L027F06     ADRL  L0414D8
            DW    $0017
            DW    $0016
            DW    $6F7F
            ADRL  L0414D8
            DW    $0017
            DW    $0016
            DW    $841F
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $76F3
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8B93
            DW    $0000
            DW    $0000
L027F32     ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $7345
            ADRL  L0414D8
            DW    $0017
            DW    $0016
            DW    $84BF
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $7653
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8AF3
            DW    $0000
L027F5C     ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $73E6
            ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $84C6
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $7513
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8693
            DW    $0000
L027F86     ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $78CE
            ADRL  L0414D8
            DW    $0017
            DW    $0016
            DW    $7345
            ADRL  L0416D2
            DW    $0009
            DW    $0008
            DW    $7ABD
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $8A4F
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8A6C
            DW    $0000
L027FBA     ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $78D0
            ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $78E9
            ADRL  L0416D2
            DW    $0009
            DW    $0008
            DW    $7ABF
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $8A51
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8A6A
            DW    $0000
L027FEE     ADRL  L0413DC
            HEX   15000C
            DB    $00
            DB    $CE
            DB    $78
            ADRL  L0413DC
            DW    $0015
            DW    $000C
            DW    $78E5
            ADRL  L0416D2
            DW    $0009
            DW    $0008
            DW    $7ABC
            ADRL  L04171A
            DW    $0009
            DW    $000A
            DW    $8A4F
            ADRL  L041774
            DW    $0009
            DW    $000A
            DW    $8A66
            ADRL  L0416D2
            DW    $0009
            DW    $0008
            DW    $7AD3
            DW    $0000
L02802C     _HideCursor
            LDA   #$003A
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   #$6F6E
            STA   $30
            LDA   #$002C
            STA   $2E
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
L028050     LDY   #$0000
            LDA   ($3E),Y
L028055     STA   $16
            INY
            INY
            LDA   ($3E),Y
            STA   $18
            INY
            INY
            LDA   ($3E),Y
            STA   $2C
            LDAL  L020966
            STA   $1E
            INY
            INY
            LDA   ($3E),Y
            STA   $2E
            STA   $1A
            INY
            INY
            LDA   ($3E),Y
            STA   $1C
            LDA   #$00A0
            STA   $20
            PHY
            JSR   L025501
            PLY
            INY
            INY
            LDA   ($3E),Y
            BNE   L028055
            _ShowCursor
            RTS

L02808F     DW    $001A
            DA    L0220AF
            DA    L021819
            DA    L02182B
            DA    L0280C5
            DA    L0280D7
            DA    L0281B0
            DA    L028162
            DA    L02813B
            DA    L028189
            DA    L0280E9
            DA    L028112
            DA    L028285
            DA    L0281D7
            DA    L0281FE
            DA    L028275
            DA    L028225
            DA    L02824D
            DA    L0217E3
            DA    L0217F5
            DA    L021807
            DA    L0296A2
            DA    L0296B8
            DA    L0296CE
            DA    L0296E4
            DA    L0296FA
            DA    L029710
L0280C5     DW    $0005
            DW    $0000
            DW    $001B
            DW    $0184
            DA    L027EAA
            DA    L027EA0
            ADRL  L045B78
            DW    $0000
L0280D7     DW    $0005
            DW    $0000
            DW    $003B
            DW    $0184
            DA    L027EBB
            DA    L027EB1
            ADRL  L045B78
            DW    $0001
L0280E9     DW    $0002
            DW    $0000
            DW    $001B
            DW    $0150
            DW    $0000
            DW    $0006
            DW    $0003
            DA    L027D96
            DW    $3134
            DW    $33AA
            DA    L027DEF
            ADRL  L028109
            DW    $012C
            DW    $0038
            DA    L028C34
L028109     STR   'Octave A'
L028112     DW    $0002
            DW    $0000
            DW    $001B
            DW    $0258
            DW    $0000
            DW    $0006
            DW    $0003
            DA    L027DA4
            DW    $3176
            DW    $33EC
            DA    L027DFC
            ADRL  L028132
            DW    $0234
            DW    $0038
            DA    L028C34
L028132     STR   'Octave B'
L02813B     DW    $0002
            DW    $0000
            DW    $0041
            DW    $0150
            DW    $0000
            DW    $000B
            DW    $0000
            DA    L027D7A
            DW    $48F4
            DW    $4B6A
            DA    L027DD5
            ADRL  L02815B
            DW    $013C
            DW    $005E
            DA    L028C34
L02815B     STR   'Semi A'
L028162     DW    $0002
            DW    $0000
            DW    $0041
            DW    $0258
            DW    $0000
            DW    $000B
            DW    $0000
            DA    L027D88
            DW    $4936
            DW    $4BAC
            DA    L027DE2
            ADRL  L028182
            DW    $0244
            DW    $005E
            DA    L028C34
L028182     STR   'Semi B'
L028189     DW    $0002
            DW    $0000
            DW    $0067
            DW    $0150
            DW    $0000
            DW    $003F
            DW    $0000
            DA    L027D5E
            DW    $60B4
            DW    $632A
            DA    L027DB2
            ADRL  L0281A9
            DW    $013C
            DW    $0084
            DA    L028C34
L0281A9     STR   'Fine A'
L0281B0     DW    $0002
            DW    $0000
            DW    $0067
            DW    $0258
            DW    $0000
            DW    $003F
            DW    $0000
            DA    L027D6C
            DW    $60F6
            DW    $636C
            DA    L027DC8
            ADRL  L0281D0
            DW    $0244
            DW    $0084
            DA    L028C34
L0281D0     STR   'Fine B'
L0281D7     DW    $0002
            DW    $0000
            DW    $00A3
            DW    $0258
            DW    $0000
            DW    $0007
            DW    $0000
            DA    L027E7A
            DW    $8676
            DW    $88EC
            DA    L027E88
            ADRL  L0281F7
            DW    $023C
            DW    $00C0
            DA    L028C34
L0281F7     STR   'Stereo'
L0281FE     DW    $0002
            DW    $0000
            DW    $00A3
            DW    $0150
            DW    $0000
            DW    $0063
            DW    $0063
            DA    L027D35
            DW    $8634
            DW    $88AA
            DA    L027D47
            ADRL  L02821E
            DW    $0130
            DW    $00C0
            DA    L028C34
L02821E     STR   'Detune'
L028225     DW    $0001
            DW    $0000
            DW    $006D
            DW    $0190
            DW    $0020
            DW    $001E
            DW    $001E
            DA    L027E09
            DW    $6484
            DW    $59E4
            DA    L027E26
            ADRL  L028247
            DW    $0190
            DW    $00A7
            DW    $0000
            DA    L028C34
L028247     STR   'Vol A'
L02824D     DW    $0001
            DW    $0000
            DW    $006D
            DW    $01F4
            DW    $0020
            DW    $001E
            DW    $001E
            DA    L027E41
            DW    $649D
            DW    $59FD
            DA    L027E5D
            ADRL  L02826F
            DW    $01F4
            DW    $00A7
            DW    $0000
            DA    L028C34
L02826F     STR   'Vol B'
L028275     DW    $0008
            DW    $0000
            DW    $007F
            DW    $0038
            DA    L027ED5
            DA    L027EC2
            DW    $00B9
            DW    $00E8
L028285     DW    $0005
            DW    $0000
            DW    $00AF
            DW    $01B4
            DA    L028297
            DA    L0282A7
            ADRL  L04A59A
            DW    $0000
L028297     JSR   L0212E1
            JSR   L021B04
            JSR   L02A38E
            JSR   L021B04
            JSR   L0212F6
            RTS

L0282A7     JSR   L0212F6
            RTS

L0282AB     JSR   L0205B5
            PEA   $0078
            PEA   $0028
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L028404
            PEA   L028404
            PEA   $0000
            PEA   $0000
            PEA   ^L028414
            PEA   L028414
            PEA   ^L021DBD
            PEA   L021DBD
            PEA   $0000
            PEA   $0000
            PEA   ^L028339
            PEA   L028339
            _SFPGetFile2
            JSR   L0205F4
            LDA   L028339
            BEQ   L028338
            _WaitCursor
            LDA   L02834F
            XBA
            STA   L02834F
            LDA   L0283D9
            XBA
            STA   L0283D9
            LDA   #L028350
            STA   L028544
            JSR   L02841E
            BCC   L028322
            _InitCursor
            LDX   #L02852C
            LDY   #L0283DA
            JSR   L0291C6
            BRA   L028332
L028322     LDX   #L0283DA
            LDY   #L028C74
            JSR   L028C54
            _InitCursor
L028332     LDX   #$0000
            JSR   (L02126C,X)
L028338     RTS

L028339     DW    $0000
            DW    $0000
            ADRL  $00000000
            DW    $0000
            ADRL  L0283D7
            DW    $0000
            ADRL  L02834D
L02834D     DW    $007F
L02834F     DB    $00
L028350     STR   'Synth.wav'
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000
L0283D7     DW    $0000
L0283D9     DB    $00
L0283DA     STR   'Synth.wav'
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
L028404     STR   'Load Wave File:'
L028414     DW    $0001
            DW    $0000
            DW    $00D8
            ADRL  $00000004
L02841E     JSL   GSOS
            DW    $0010         ; Open
            ADRL  L028542
            BCC   L02842D
            BRL   L0284F7
L02842D     LDA   L028542
            STA   L02854C
            STA   L02855A
            LDA   #L02401C
            STA   L02854E
            LDA   #^L02401C
            STA   L02854E+2
            LDA   #$0900
            STA   L028552
            STZ   L028552+2
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L02854C
            BCC   L02845A
            BRL   L0284F8
L02845A     LDA   L028552
            CMP   L028556
            BEQ   L028465
            BRL   L0284F8
L028465     LDA   L020025
            STA   L02854E
            LDA   L020025+2
            STA   L02854E+2
            LDA   #$8000
            STA   L028552
            STZ   L028552+2
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L02854C
            BCC   L028489
            BRL   L0284F8
L028489     LDA   L028552
            CMP   L028556
            BNE   L0284F8
            SEI
            LDA   L02854E+2
            PHA
            LDA   L02854E
            PHA
            PEA   $0000
            PEA   $8000
            _WriteRamBlock
            CLI
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L02854C
            BCC   L0284B7
            BRL   L0284F8
L0284B7     LDA   L028552
            CMP   L028556
            BNE   L0284F8
            SEI
            LDA   L02854E+2
            PHA
            LDA   L02854E
            PHA
            PEA   $8000
            PEA   $8000
            _WriteRamBlock
            CLI
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02855A
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _SetMetro
            JSR   L0239BB
            CLC
L0284F7     RTS

L0284F8     JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02855A
            SEC
            RTS

L028504     LDA   #L0223AF
            STA   L028544
            JSR   L02841E
            BCS   L02851A
            LDX   #L0223AF
            LDY   #L028C74
            JSR   L028C54
            CLC
            RTS

L02851A     _InitCursor
            LDX   #L02852C
            LDY   #L0223AF
            JSR   L0291C6
            SEC
            RTS

L02852C     STR   'Can'D5't load Wave File:'
L028542     DW    $0000         ;  ref num
L028544     ADRL  L028350       ;  path name
            ADRL  $00000000     ;  reserved
L02854C     DW    $0000         ;  ref num
L02854E     ADRL  $00000000     ;  buffer ptr
L028552     ADRL  $00000000     ;  request count
L028556     ADRL  $00000000     ;  transfer count
L02855A     DW    $0000         ;  ref num
L02855C     JSR   L0205B5
            PEA   $0078
            PEA   $0028
            PEA   ^L028679
            PEA   L028679
            PEA   $0000
            PEA   $0000
            PEA   ^L028677
            PEA   L028677
            PEA   ^L021DBD
            PEA   L021DBD
            PEA   $0000
            PEA   $0000
            PEA   ^L0285D6
            PEA   L0285D6
            _SFPGetFile
            JSR   L0205F4
            LDA   L0285D6
            BEQ   L0285D5
            _WaitCursor
            LDA   #L0285EC
            STA   L028729
            JSR   L02868F
            BCC   L0285BC
            _InitCursor
            LDX   #L02870B
            LDY   #L0285DC
            JSR   L0291C6
            BRA   L0285CF
L0285BC     LDX   #L0285DC
            LDY   #L028C64
            JSR   L028C54
            JSR   L028504
            _InitCursor
L0285CF     LDX   #$0000
            JSR   (L02126C,X)
L0285D5     RTS

L0285D6     DW    $0000
            DW    $0000
            DW    $0000
L0285DC     DS    $10
L0285EC     STR   'Synth.bnk'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L028677     HEX   01D6
L028679     STR   'Load Instrument File:'
L02868F     LDA   #$1600
            STA   L028737
            STZ   L028737+2
            LDA   #L022397
            STA   L028733
            LDA   #^L022397
            STA   L028733+2
            JSL   GSOS
            DW    $0010         ; Open
            ADRL  L028727
            BCS   L0286D6
            LDA   L028727
            STA   L028731
            STA   L02873F
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L028731
            BCS   L0286D7
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02873F
            JSR   L029467
            JSR   L028BA6
            CLC
L0286D6     RTS

L0286D7     JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02873F
            SEC
            RTS

L0286E3     LDA   #L020F8F
            STA   L028729
            JSR   L02868F
            BCS   L0286F9
            LDX   #L020F8F
            LDY   #L028C64
            JSR   L028C54
            CLC
            RTS

L0286F9     _InitCursor
            LDX   #L02870B
            LDY   #L020F8F
            JSR   L0291C6
            SEC
            RTS

L02870B     STR   'Can'D5't load Instrument File:'
L028727     DW    $0000         ;  ref num
L028729     ADRL  L0285EC       ;  path name
            ADRL  $00000000     ;  reserved
L028731     DW    $0000         ;  ref num
L028733     ADRL  $00000000     ;  buffer ptr
L028737     ADRL  $00000000     ;  request count
            ADRL  $00000000     ;  transfer count
L02873F     DW    $0000         ;  ref num
L028741     ADRL  L0285EC       ;  file name
            DW    $00E3         ;  access
            DW    $00D6         ;  file type
            ADRL  $00000001     ;  aux type
            DW    $0001         ;  storage
            DS    4             ;  creation date
L028753     DW    $0000         ;  ref num
L028755     ADRL  L022397       ;  buffer ptr
L028759     ADRL  $00001600     ;  request count
            ADRL  $00000000     ;  transfer count
L028761     JSR   L0205B5
            PEA   $0078
            PEA   $0028
            PEA   ^L0287B6
            PEA   L0287B6
            PEA   ^L028C64
            PEA   L028C64
            PEA   $000E
            PEA   ^L021F1D
            PEA   L021F1D
            PEA   $0000
            PEA   $0000
            PEA   ^L0285D6
            PEA   L0285D6
            _SFPPutFile
            JSR   L0205F4
            LDA   L0285D6
            BEQ   L0287B5
            LDA   #L0285EC
            STA   L028729
            LDX   #L0285DC
            LDY   #L028C64
            JSR   L028C54
            LDX   #L028C74
            LDY   #L0223AF
            JSR   L028C54
            JSR   L0287CC
L0287B5     RTS

L0287B6     STR   'Save Instrument File:'
L0287CC     LDA   #$1600
            STA   L028759
            STZ   L028759+2
            LDA   #L022397
            STA   L028755
            LDA   #^L022397
            STA   L028755+2
            JSL   GSOS
            DW    $0001         ; Create
            ADRL  L028741
            JSL   GSOS
            DW    $0010         ; Open
            ADRL  L028727
            LDA   L028727
            STA   L028753
            STA   L02873F
            JSL   GSOS
            DW    $0013         ; Write
            ADRL  L028753
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02873F
            RTS

L028813     JSR   L0205B5
            PEA   $0078
            PEA   $0028
            PEA   ^L02896A
            PEA   L02896A
            PEA   $0000
            PEA   $0000
            PEA   ^L028968
            PEA   L028968
            PEA   ^L021DBD
            PEA   L021DBD
            PEA   $0000
            PEA   $0000
            PEA   ^L0288C7
            PEA   L0288C7
            _SFPGetFile
            JSR   L0205F4
            LDA   L0288C7
            BEQ   L028882
            _WaitCursor
            LDA   #L0288DD
            STA   L028A10
            JSR   L02897E
            BCS   L028883
            JSR   L0276C9
            JSR   L028B9C
            LDA   #$FFFF
            STA   L0210FF
            JSR   L0286E3
            BCS   L02887C
            JSR   L028504
            _InitCursor
L02887C     LDX   #$0000
            JSR   (L02126C,X)
L028882     RTS

L028883     _InitCursor
            LDX   #L028894
            LDY   #L0288B0
            JSR   L0291C6
            RTS

L028894     STR   'Problem with Sequence file.'
L0288B0     STR   'Try another file . . .'
L0288C7     DW    $0000
            DW    $0000
            DW    $0000
L0288CD     STR   'Synth.seq'
            DS    6
L0288DD     STR   'Synth.seq'
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L028968     HEX   01D5
L02896A     STR   'Open Sequence file:'
L02897E     JSL   GSOS
            DW    $0010         ; Open
            ADRL  L028A0E
            BCS   L028A01
            LDA   L028A0E
            STA   L028A18
            STA   L028A26
            STA   L028A48
            JSR   L028A56
            BCS   L028A02
            LDA   #L020F77
            STA   L028A1A
            LDA   #^L020F77
            STA   L028A1A+2
            LDA   L020F75
            STA   L028A1E
            STZ   L028A1E+2
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L028A18
            BCS   L028A02
            LDA   L020F7D
            STA   L028A4A
            STZ   L028A4A+2
            JSL   GSOS
            DW    $0016         ; SetMark
            ADRL  L028A48
            LDA   L027412
            STA   L028A1A
            LDA   L027414
            STA   L028A1A+2
            LDA   #$0000
            STA   L028A1E
            LDA   #$0002
            STA   L028A1E+2
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L028A18
            BCS   L028A02
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L028A26
            JSR   L021149
            CLC
L028A01     RTS

L028A02     JSL   GSOS
            DW    $0014         ; Close
            ADRL  L028A26
            SEC
            RTS

L028A0E     DW    $0000         ;  ref num
L028A10     ADRL  L0288DD       ;  path name
            ADRL  $00000000     ;  reserved
L028A18     DW    $0000         ;  ref num
L028A1A     ADRL  $00000000     ;  buffer ptr
L028A1E     ADRL  $00020000     ;  request count
            ADRL  $00000000     ;  transfer count
L028A26     DW    $0000         ;  ref num
L028A28     ADRL  L0288DD       ;  file name
            DW    $00E3         ;  access
            DW    $00D5         ;  file type
            ADRL  $00000001     ;  aux type
            DW    $0001         ;  storage
            DS    4             ;  creation date
L028A3A     DW    $0000         ;  ref num
L028A3C     ADRL  $00000000     ;  buffer ptr
L028A40     ADRL  $00020000     ;  request count
            ADRL  $00000000     ;  transfer count
L028A48     DW    $0000         ;  ref num
L028A4A     ADRL  $00000000     ;  position
L028A4E     DB    $00
            DB    $00
L028A50     DB    $00
            DB    $00
L028A52     DB    $00
            DB    $00
L028A54     DB    $00
            DB    $00
L028A56     LDA   #L028A4E
            STA   L028A1A
            LDA   #^L028A4E
            STA   L028A1A+2
            LDA   #$0008
            STA   L028A1E
            STZ   L028A1E+2
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L028A18
            BCS   L028AA9
            LDA   L028A4E
            CMP   L020F77
            BNE   L028AA9
            LDA   L028A50
            CMP   L020F79
            BNE   L028AA9
            LDA   L028A52
            CMP   L020F7B
            BNE   L028AA9
            LDA   L028A54
            CMP   L020F75
            BCC   L028AA9
            STZ   L028A4A
            STZ   L028A4A+2
            JSL   GSOS
            DW    $0016         ; SetMark
            ADRL  L028A48
            CLC
            RTS

L028AA9     SEC
            RTS

L028AAB     JSR   L0205B5
            PEA   $0078
            PEA   $0028
            PEA   ^L028AF4
            PEA   L028AF4
            PEA   ^L028B08
            PEA   L028B08
            PEA   $000E
            PEA   ^L021F1D
            PEA   L021F1D
            PEA   $0000
            PEA   $0000
            PEA   ^L0288C7
            PEA   L0288C7
            _SFPPutFile
            JSR   L0205F4
            LDA   L0288C7
            BEQ   L028AF3
            LDX   #L028C64
            LDY   #L020F8F
            JSR   L028C54
            JSR   L028B1C
            JSR   L028B9C
L028AF3     RTS

L028AF4     STR   'Save Sequence file:'
L028B08     STR   'Synth.seq'
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
L028B1C     JSL   GSOS
            DW    $0001         ; Create
            ADRL  L028A28
            JSL   GSOS
            DW    $0010         ; Open
            ADRL  L028A0E
            LDA   L028A0E
            STA   L028A3A
            STA   L028A26
            LDA   #L020F77
            STA   L028A3C
            LDA   #^L020F77
            STA   L028A3C+2
            LDA   L020F75
            STA   L028A40
            STA   L020F7D
            STZ   L028A40+2
            JSL   GSOS
            DW    $0013         ; Write
            ADRL  L028A3A
            PHA
            PHA
            LDA   L027414
            PHA
            LDA   L027412
            PHA
            _LocateEnd
            PLA
            SEC
            SBC   L027412
            STA   L028A40
            PLA
            SBC   L027414
            STA   L028A40+2
            LDA   L027412
            STA   L028A3C
            LDA   L027414
            STA   L028A3C+2
            JSL   GSOS
            DW    $0013         ; Write
            ADRL  L028A3A
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L028A26
            RTS

L028B9C     LDX   #L0288CD
            LDY   #L028B08
            JSR   L028C54
            RTS

L028BA6     LDA   #L022797
            STA   L028BDC
            STZ   L028BDE
L028BAF     LDA   $5E
            PHA
            LDA   L028BDC
            PHA
            LDA   L028BDE
            PHA
            _SetInstrument
            BCC   L028BC6
            JSR   L028BE0
L028BC6     LDA   L028BDC
            CLC
            ADC   #$0120
            STA   L028BDC
            INC   L028BDE
            LDA   L028BDE
            CMP   #$0010
            BNE   L028BAF
            RTS

L028BDC     DW    $0000
L028BDE     DW    $0000
L028BE0     LDA   L028BDE
            INC
            PHA
            PEA   ^L028C02+$18
            PEA   L028C02+$18
            PEA   $0002
            PEA   $0000
            _Int2Dec
            LDX   #L028C02
            LDY   #L028C1C
            JSR   L0291C6
            RTS

L028C02     STR   'Can'D5't play Instrument #01'
L028C1C     STR   'Parameter out of range.'
L028C34     LDA   $5E
            PHA
            LDA   L0212DF
            STA   L028BDE
            ASL
            TAX
            LDA   L028C92,X
            PHA
            LDA   L0212DF
            PHA
            _SetInstrument
            BCC   L028C53
            JSR   L028BE0
L028C53     RTS

L028C54     STX   $42
            STY   $46
            LDY   #$000E
L028C5B     LDA   ($42),Y
            STA   ($46),Y
            DEY
            DEY
            BPL   L028C5B
            RTS

L028C64     STR   'None'
            HEX   0000000000000000000000
L028C74     STR   'None'
            HEX   0000000000000000000000
L028C84     JSR   L02897E
            BCS   L028C91
            JSR   L0286E3
            BCS   L028C91
            JSR   L028504
L028C91     RTS

L028C92     DA    L022797
            DA    L0228B7
            DA    L0229D7
            DA    L022AF7
            DA    L022C17
            DA    L022D37
            DA    L022E57
            DA    L022F77
            DA    L023097
            DA    L0231B7
            DA    L0232D7
            DA    L0233F7
            DA    L023517
            DA    L023637
            DA    L023757
            DA    L023877
            DA    L023997
L028CB4     JSR   L0206A9
L028CB7     JSR   L028CCD
            LDA   #L028CCD
            STA   L02126C
            LDA   #L028CB7
            STA   L02001D
            LDA   #L028CCC
            STA   L02002F
L028CCC     RTS

L028CCD     JSR   L025598
            LDA   L021270
            BEQ   L028CE3
            JSR   L028CF9
            LDA   #^L028E66
            STA   $50
            PHA
            LDA   #L028E66
            BRA   L028CEC
L028CE3     LDA   #^L028E2C
            STA   $50
            PHA
            LDA   #L028E2C
L028CEC     STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            JSR   L025574
            RTS

L028CF9     LDAL  L020966
            STA   $1E
            LDA   #$8408
            STA   $30
            LDA   #$0014
            STA   $2E
            LDA   #$001F
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            LDAL  L020966
            STA   $1E
            LDA   #$6C66
            STA   $30
            LDA   #$0014
            STA   $2E
            LDA   #$001F
            STA   $2C
            LDA   #$FFFF
            STA   $32
            JSR   L0213AA
            RTS

L028D34     LDY   #$001E
            LDA   ($00),Y
            TAY
            SEP   #$20
            LDA   ($3A),Y
            LSR
            LSR
            STA   L028D79
            LDA   #$1F
            SEC
            SBC   L028D79
            REP   #$20
            AND   #$001F
            LDY   #$000C
            STA   ($00),Y
            RTS

L028D54     LDY   #$000C
            LDA   #$001F
            SEC
            SBC   ($00),Y
            STA   L028D79
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            SEP   #$30
            LDY   #$1E
            LDA   ($00),Y
            TAY
            LDA   L028D79
            ASL
            ASL
            STA   ($3A),Y
            REP   #$30
            RTS

L028D79     DW    $0000
L028D7B     SEP   #$30
            LDY   #$1E
            LDA   ($00),Y
            TAY
            LDA   #$1F
            SEC
            SBC   ($3A),Y
            REP   #$30
            AND   #$001F
            LDY   #$000C
            STA   ($00),Y
            RTS

L028D92     LDY   #$000C
            LDA   #$001F
            SEC
            SBC   ($00),Y
            STA   L028D79
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            SEP   #$30
            LDY   #$1E
            LDA   ($00),Y
            TAY
            LDA   L028D79
            STA   ($3A),Y
            REP   #$30
            RTS

L028DB5     LDY   #$000F
            LDA   ($3A),Y
            AND   #$00FF
            LDY   #$000C
            STA   ($00),Y
            RTS

L028DC3     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0F
            STA   ($3A),Y
            REP   #$30
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L028DD9     SEP   #$30
            LDY   #$0E
            LDA   ($3A),Y
            REP   #$30
            AND   #$00FF
            LDY   #$000C
            STA   ($00),Y
            RTS

L028DEA     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0E
            STA   ($3A),Y
            REP   #$30
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L028E00     LDY   #$000D
            LDA   ($3A),Y
            AND   #$000F
            CMP   #$000A
            BCC   L028E10
            LDA   #$0000
L028E10     LDY   #$000C
            STA   ($00),Y
            RTS

L028E16     LDY   #$000C
            LDA   ($00),Y
            SEP   #$30
            LDY   #$0D
            STA   ($3A),Y
            REP   #$30
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L028E2C     DW    $001C
            DA    L0220AF
            DA    L021819
            DA    L02182B
            DA    L028E9C
            DA    L028F81
            DA    L028EC3
            DA    L028FA7
            DA    L028EE9
            DA    L028FCD
            DA    L028F0F
            DA    L028FF3
            DA    L028F35
            DA    L029019
            DA    L028F5B
            DA    L029040
            DA    L029067
            DA    L02908E
            DA    L0290B9
            DA    L0290E2
            DA    L0217E3
            DA    L0217F5
            DA    L021807
            DA    L0296A2
            DA    L0296B8
            DA    L0296CE
            DA    L0296E4
            DA    L0296FA
            DA    L029710
L028E66     DW    $001A
            DA    L0220AF
            DA    L021819
            DA    L02182B
            DA    L028E9C
            DA    L028F81
            DA    L028EC3
            DA    L028FA7
            DA    L028EE9
            DA    L028FCD
            DA    L028F0F
            DA    L028FF3
            DA    L028F35
            DA    L029019
            DA    L028F5B
            DA    L029040
            DA    L029067
            DA    L0290E2
            DA    L0217E3
            DA    L0217F5
            DA    L021807
            DA    L0296A2
            DA    L0296B8
            DA    L0296CE
            DA    L0296E4
            DA    L0296FA
            DA    L029710
L028E9C     DW    $0001
            DW    $0000
            DW    $002D
            DW    $0128
            DW    $0020
            DW    $001E
            DW    $001E
            DA    L028D34
            DW    $3C6A
            DW    $31CA
            DA    L028D54
            ADRL  L028EBE
            DW    $0128
            DW    $0067
            DW    $0000
            DA    L028C34
L028EBE     STR   'Vatk'
L028EC3     DW    $0001
            DW    $0000
            DW    $002D
            DW    $0158
            DW    $0020
            DW    $000E
            DW    $000E
            DA    L028D34
            DW    $3C76
            DW    $31D6
            DA    L028D54
            ADRL  L028EE5
            DW    $015C
            DW    $0067
            DW    $0002
            DA    L028C34
L028EE5     STR   'VD1'
L028EE9     DW    $0001
            DW    $0000
            DW    $002D
            DW    $0188
            DW    $0020
            DW    $0004
            DW    $0004
            DA    L028D34
            DW    $3C82
            DW    $31E2
            DA    L028D54
            ADRL  L028F0B
            DW    $018C
            DW    $0067
            DW    $0004
            DA    L028C34
L028F0B     STR   'VD2'
L028F0F     DW    $0001
            DW    $0000
            DW    $002D
            DW    $01B8
            DW    $0020
            DW    $000C
            DW    $000C
            DA    L028D34
            DW    $3C8E
            DW    $31EE
            DA    L028D54
            ADRL  L028F31
            DW    $01BC
            DW    $0067
            DW    $0006
            DA    L028C34
L028F31     STR   'Sus'
L028F35     DW    $0001
            DW    $0000
            DW    $002D
            DW    $01E8
            DW    $0020
            DW    $0010
            DW    $0010
            DA    L028D34
            DW    $3C9A
            DW    $31FA
            DA    L028D54
            ADRL  L028F57
            DW    $01EC
            DW    $0067
            DW    $0008
            DA    L028C34
L028F57     STR   'VR1'
L028F5B     DW    $0001
            DW    $0000
            DW    $002D
            DW    $0218
            DW    $0020
            DW    $0014
            DW    $0014
            DA    L028D34
            DW    $3CA6
            DW    $3206
            DA    L028D54
            ADRL  L028F7D
            DW    $021C
            DW    $0067
            DW    $000A
            DA    L028C34
L028F7D     STR   'VR2'
L028F81     DW    $0001
            DW    $0000
            DW    $0083
            DW    $0128
            DW    $0020
            DW    $0009
            DW    $0009
            DA    L028D7B
            DW    $722A
            DW    $678A
            DA    L028D92
            ADRL  L028FA3
            DW    $012C
            DW    $00BD
            DW    $0001
            DA    L028C34
L028FA3     STR   'Atk'
L028FA7     DW    $0001
            DW    $0000
            DW    $0083
            DW    $0158
            DW    $0020
            DW    $0019
            DW    $0019
            DA    L028D7B
            DW    $7236
            DW    $6796
            DA    L028D92
            ADRL  L028FC9
            DW    $015C
            DW    $00BD
            DW    $0003
            DA    L028C34
L028FC9     STR   'Dk1'
L028FCD     DW    $0001
            DW    $0000
            DW    $0083
            DW    $0188
            DW    $0020
            DW    $0010
            DW    $0010
            DA    L028D7B
            DW    $7242
            DW    $67A2
            DA    L028D92
            ADRL  L028FEF
            DW    $018C
            DW    $00BD
            DW    $0005
            DA    L028C34
L028FEF     STR   'Dk2'
L028FF3     DW    $0001
            DW    $0000
            DW    $0083
            DW    $01B8
            DW    $0020
            DW    $001B
            DW    $001B
            DA    L028D7B
            DW    $724E
            DW    $67AE
            DA    L028D92
            ADRL  L029015
            DW    $01BC
            DW    $00BD
            DW    $0007
            DA    L028C34
L029015     STR   'Dk3'
L029019     DW    $0001
            DW    $0000
            DW    $0083
            DW    $01E8
            DW    $0020
            DW    $001B
            DW    $001B
            DA    L028D7B
            DW    $725A
            DW    $67BA
            DA    L028D92
            ADRL  L02903B
            DW    $01E8
            DW    $00BD
            DW    $0009
            DA    L028C34
L02903B     STR   'Rel1'
L029040     DW    $0001
            DW    $0000
            DW    $0083
            DW    $0218
            DW    $0020
            DW    $0006
            DW    $0006
            DA    L028D7B
            DW    $7266
            DW    $67C6
            DA    L028D92
            ADRL  L029062
            DW    $0218
            DW    $00BD
            DW    $000B
            DA    L028C34
L029062     STR   'Rel2'
L029067     DW    $0001
            DW    $0000
            DW    $0083
            DW    $0248
            DW    $0020
            DW    $0010
            DW    $0010
            DA    L028D7B
            DW    $7272
            DW    $67D2
            DA    L028D92
            ADRL  L029089
            DW    $0248
            DW    $00BD
            DW    $000C
            DA    L028C34
L029089     STR   'Rel3'
L02908E     DW    $0002
            DW    $0000
            DW    $00A0
            DW    $004C
            DW    $0000
            DW    $000C
            DW    $0000
            DA    L028DB5
            DW    $8413
            DW    $8689
            DA    L028DC3
            ADRL  L0290AE
            DW    $0024
            DW    $00BD
            DA    L028C34
L0290AE     STR   'Pitch Pend'
L0290B9     DW    $0002
            DW    $0000
            DW    $007B
            DW    $00C4
            DW    $0000
            DW    $000A
            DW    $0000
            DA    L028DD9
            DW    $6D11
            DW    $6F87
            DA    L028DEA
            ADRL  L0290D9
            DW    $00A0
            DW    $0098
            DA    L028C34
L0290D9     STR   'Vel Gain'
L0290E2     DW    $0002
            DW    $0000
            DW    $00A0
            DW    $00C4
            DW    $0000
            DW    $0009
            DW    $0000
            DA    L028E00
            DW    $8431
            DW    $86A7
            DA    L028E16
            ADRL  L029102
            DW    $009C
            DW    $00BD
            DA    L028C34
L029102     STR   'Decay Gain'
            MX    %00
L02910D     STX   L029198
            CLI
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #L0291BE
            JSR   L021A1A
            PEA   $0100
            PEA   $0046
            _MoveTo
            PEA   ^L02919C
            PEA   L02919C
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $0100
            PEA   $0055
            _MoveTo
            LDA   $5E
            PHA
            LDA   L029198
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #^L0292AF
            STA   $50
            PHA
            LDA   #L0292AF
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   #L021AC7
            STA   L0219F8
            LDA   #L029280
            STA   L02185D
            _InitCursor
            JSR   L02185F
            JMP   L02027A

L029198     DW    $0000
L02919A     DW    $0000
L02919C     STR   'Sorry, can'D5't start synthLAB . . .'
L0291BE     DW    $001B
            DW    $0084
            DW    $009B
            DW    $0228
L0291C6     STX   L029198
            STY   L02919A
            JSR   L0205B5
            JSR   L0219FA
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #L0291BE
            JSR   L021A1A
            PEA   $0100
            PEA   $0046
            _MoveTo
            LDA   $5E
            PHA
            LDA   L029198
            PHA
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $0100
            PEA   $0055
            _MoveTo
            LDA   $5E
            PHA
            LDA   L02919A
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #^L0292AF
            STA   $50
            PHA
            LDA   #L0292AF
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   #L021AC7
            STA   L0219F8
            LDA   #L029280
            STA   L02185D
            _InitCursor
            JSR   L02185F
            LDA   #L02927F
            STA   L02185D
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L029267     JSR   L0212F6
            STZ   L0292AB
            LDA   #$0028
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDA   $00
            STA   L0292AD
L02927F     RTS

L029280     JSR   L0252C3
            BCC   L0292AA
            LDA   $00
            PHA
            LDA   L0292AD
            STA   $00
            LDA   L0292AB
            BEQ   L02929A
            JSR   L0212F6
            STZ   L0292AB
            BRA   L0292A0
L02929A     JSR   L0212E1
            INC   L0292AB
L0292A0     LDAL  TickCount
            STA   L025178
            PLA
            STA   $00
L0292AA     RTS

L0292AB     DW    $0000
L0292AD     DW    $0000
L0292AF     DW    $0002
            DA    L0292C9
            DA    L0292B5
L0292B5     DW    $0007
            DW    $0000
            DW    $007A
            DW    $01C0
            DA    L021AD6
            DA    L021AE0
            ADRL  L048AD6
            DA    L021AF3
            DA    L021AEC
L0292C9     DW    $0005
            DW    $0000
            DW    $003E
            DW    $00A8
            DA    L02927F
            DA    L029267
            ADRL  L048ADE
            DW    $0000
L0292DB     JSR   L0206DE
            JSR   L029450
            RTS

L0292E2     JSR   L029450
            JSR   L0292EF
            JSR   L029467
            JSR   L02A132
            RTS

L0292EF     PHA
            PHA
            PEA   $0000
            PEA   ^L029A7A
            PEA   L029A7A
            _NewMenu2
            PLA
            STA   L0296B4
            PLA
            STA   L0296B6
            LDA   L0296B6
            PHA
            LDA   L0296B4
            PHA
            PEA   $0000
            _InsertMenu
            PHA
            PHA
            PEA   $0000
            PEA   ^L029C71
            PEA   L029C71
            _NewMenu2
            PLA
            STA   L0296CA
            PLA
            STA   L0296CC
            LDA   L0296CC
            PHA
            LDA   L0296CA
            PHA
            PEA   $0000
            _InsertMenu
            PHA
            PHA
            PEA   ^L029ADB
            PEA   L029ADB
            _NewMenu
            PLA
            STA   L0296E0
            PLA
            STA   L0296E0+2
            LDA   L0296E0+2
            PHA
            LDA   L0296E0
            PHA
            PEA   $0000
            _InsertMenu
            PHA
            PHA
            PEA   $0000
            PEA   ^L029B8C
            PEA   L029B8C
            _NewMenu2
            PLA
            STA   L0296F6
            PLA
            STA   L0296F6+2
            LDA   L0296F6+2
            PHA
            LDA   L0296F6
            PHA
            PEA   $0000
            _InsertMenu
            PHA
            PHA
            PEA   $0000
            PEA   ^L029D78
            PEA   L029D78
            _NewMenu2
            PLA
            STA   L02970C
            PLA
            STA   L02970C+2
            LDA   L02970C+2
            PHA
            LDA   L02970C
            PHA
            PEA   $0000
            _InsertMenu
            PEA   $0001
            PEA   $0113
            _CheckMItem
            PHA
            PHA
            PEA   $0000
            PEA   ^L029FE7
            PEA   L029FE7
            _NewMenu2
            PLA
            STA   L029722
            PLA
            STA   L029724
            LDA   L029724
            PHA
            LDA   L029722
            PHA
            PEA   $0000
            _InsertMenu
            PEA   $0001
            PEA   $012C
            _CheckMItem
            RTS

L02940F     JSR   L0212F6
            RTS

L029413     JSR   L0212E1
            PHA
            LDY   #$0010
            LDA   ($00),Y
            PHA
            LDY   #$0006
            LDA   ($00),Y
            PHA
            LDY   #$0004
            LDA   ($00),Y
            CLC
            ADC   #$000D
            PHA
            PEA   $0040
            LDY   #$0014
            LDA   ($00),Y
            PHA
            LDY   #$0012
            LDA   ($00),Y
            PHA
            _PopUpMenuSelect
            JSR   L029731
            PLA
            BEQ   L02944C
            JSR   L02046E
L02944C     JSR   L0212F6
            RTS

L029450     LDA   #$0010
            STA   $3E
L029455     LDA   $3E
            PHA
            PEA   $0080
            _SetSCB
            DEC   $3E
            BPL   L029455
            RTS

L029467     LDA   #$0113
            STA   L0294D1
            LDA   #L022697
            STA   $3E
            LDA   #L029EA7
            STA   L029489+1
            STA   $46
L02947A     SEP   #$30
            LDA   ($3E)
            CLC
            ADC   #$04
            STA   ($46)
            LDX   #$13
            LDY   #$0F
L029487     LDA   ($3E),Y
L029489     STA   L029EA7,X
            DEX
            DEY
            BNE   L029487
            REP   #$30
            LDA   $5E
            PHA
            LDA   L029489+1
            PHA
            LDA   L0294D1
            PHA
            _SetMItemName
            LDA   L029489+1
            CLC
            ADC   #$0014
            STA   L029489+1
            STA   $46
            INC   L0294D1
            LDA   $3E
            CLC
            ADC   #$0010
            STA   $3E
            CMP   #L022797
            BNE   L02947A
            PEA   $0000
            PEA   $0000
            PEA   $0004
            _CalcMenuSize
            RTS

L0294D1     DW    $0000
L0294D3     LDA   L020013
            SEC
            SBC   #$0113
            STA   L0212DF
            JSR   L021272
            LDA   L0211C4
            BNE   L0294F3
            LDA   L0212DF
            STA   L0211C6
            PHA
            _SetBasicChannel
L0294F3     PEA   $0000
            LDA   L02951C
            PHA
            _CheckMItem
            PEA   $0001
            LDA   L020013
            PHA
            _CheckMItem
            LDA   L020013
            STA   L02951C
            LDX   #$0000
            JSR   (L02126C,X)
            RTS

L02951C     DW    $0113
L02951E     LDA   L020013
            SEC
            SBC   #$012C
            JSR   L0212B3
            PEA   $0000
            LDA   L02954B
            PHA
            _CheckMItem
            PEA   $0001
            LDA   L020013
            PHA
            _CheckMItem
            LDA   L020013
            STA   L02954B
            RTS

L02954B     DW    $012C
L02954D     STA   $42
            LDA   #L029581
            STA   $3E
            LDY   #$0002
L029557     LDA   ($3E)
            CMP   $42
            BEQ   L029571
            LDA   ($3E),Y
            CMP   $42
            BEQ   L029571
            LDA   $3E
            CLC
            ADC   #$0008
            STA   $3E
            CMP   #L029601
            BNE   L029557
            RTS

L029571     INY
            INY
            LDA   ($3E),Y
            STA   L020013
            INY
            INY
            LDA   ($3E),Y
            TAX
            JSR   L029601
            RTS

L029581     DW    $0031
            DW    $0031
            DW    $012C
            DA    L029710
            DW    $0032
            DW    $0032
            DW    $012D
            DA    L029710
            DW    $0033
            DW    $0033
            DW    $012E
            DA    L029710
            DW    $0034
            DW    $0034
            DW    $012F
            DA    L029710
            DW    $0035
            DW    $0035
            DW    $0130
            DA    L029710
            DW    $0036
            DW    $0036
            DW    $0131
            DA    L029710
            DW    $0037
            DW    $0037
            DW    $0132
            DA    L029710
            DW    $0038
            DW    $0038
            DW    $0133
            DA    L029710
            DW    $004E
            DW    $006E
            DW    $0105
            DA    L0296B8
            DW    $004F
            DW    $006F
            DW    $0107
            DA    L0296B8
            DW    $0053
            DW    $0073
            DW    $0109
            DA    L0296B8
            DW    $0045
            DW    $0065
            DW    $0108
            DA    L0296CE
            DW    $0049
            DW    $0069
            DW    $010A
            DA    L0296CE
            DW    $0051
            DW    $0071
            DW    $0101
            DA    L0296B8
            DW    $005A
            DW    $007A
            DW    $010B
            DA    L0296E4
            DW    $0056
            DW    $0076
            DW    $00FD
            DA    L0296CE
L029601     LDA   $00
            PHA
            STX   $00
            JSR   L0212E1
            JSR   L021B04
            LDA   L020013
            JSR   L02046E
            JSR   L0212F6
            PLA
            STA   $00
            RTS

L029619     PEA   $0080
            PEA   $0002
            _SetMenuFlag
            PEA   $0080
            PEA   $0100
            _SetMItemFlag
L029633     PEA   $0080
            PEA   $010C
            _SetMItemFlag
            PEA   $0080
            PEA   $0134
            _SetMItemFlag
            PEA   $0080
            PEA   $0123
            _SetMItemFlag
            RTS

L02965B     PEA   $FF7F
            PEA   $0002
            _SetMenuFlag
            PEA   $FF7F
            PEA   $0100
            _SetMItemFlag
            LDA   L02001B
            BNE   L0296A1
            PEA   $FF7F
            PEA   $010C
            _SetMItemFlag
            PEA   $FF7F
            PEA   $0134
            _SetMItemFlag
            PEA   $FF7F
            PEA   $0123
            _SetMItemFlag
L0296A1     RTS

L0296A2     DW    $0005
            DW    $0000
            DW    $0000
            DW    $0000
            DA    L029413
            DA    L02940F
            ADRL  L049422
            DW    $0100
L0296B4     DW    $0000
L0296B6     DW    $0000
L0296B8     DW    $0005
            DW    $0000
            DW    $0000
            DW    $0038
            DA    L029413
            DA    L02940F
            ADRL  L04942A
            DW    $0105
L0296CA     DW    $0000
L0296CC     DW    $0000
L0296CE     DW    $0005
            DW    $0000
            DW    $0000
            DW    $0070
            DA    L029413
            DA    L02940F
            ADRL  L049432
            DW    $0108
L0296E0     ADRL  $00000000
L0296E4     DW    $0005
            DW    $0000
            DW    $0000
            DW    $00A8
            DA    L029413
            DA    L02940F
            ADRL  L04943A
            DW    $010C
L0296F6     ADRL  $00000000
L0296FA     DW    $0005
            DW    $0000
            DW    $0000
            DW    $00E8
            DA    L029413
            DA    L02940F
            ADRL  L049442
            DW    $0113
L02970C     ADRL  $00000000
L029710     DW    $0005
            DW    $0000
            DW    $0000
            DW    $0158
            DA    L029726
            DA    L02940F
            ADRL  L04944A
            DW    $012C
L029722     DW    $0000
L029724     DW    $0000
L029726     LDA   #$0000
            STA   $32
            JSR   L02973A
            JMP   L029413

L029731     LDA   #$FFFF
            STA   $32
            JSR   L02973A
            RTS

L02973A     LDAL  L020966
            STA   $1E
            LDA   #$27EE
            STA   $30
            LDA   #$0008
            STA   $2E
            LDA   #$0001
            STA   $2C
            JMP   L0213AA

L029752     LDY   #$0000
L029755     LDA   ($3C),Y
            STA   L02992A,Y
            INY
            INY
            CPY   #$0010
            BCC   L029755
            PHY
            JSR   L023B0E
            PLY
            LDA   L023B85
            CLC
            ADC   L0212D9
            TAX
            LDA   L0223C7,X
            AND   #$007F
            STA   L02992A,Y
            INY
            INY
            LDA   L0223CF,X
            AND   #$007F
            STA   L02992A,Y
            LDA   #L029886
            STA   L029928
            PEA   ^L029843
            PEA   L029843
L02978E     PEA   $00FD
            _SetMItemName
            PEA   $FF7F
            PEA   $00FD
            _SetMItemFlag
            PEA   $0000
            PEA   $0000
            PEA   $0003
            _CalcMenuSize
            RTS

L0297B6     LDY   #$0000
L0297B9     LDA   ($3A),Y
            STA   L02992A,Y
            INY
            INY
            CPY   #$0090
            BCC   L0297B9
            PHY
            JSR   L023B0E
            PLY
            LDX   L023B85
            SEP   #$20
L0297CF     LDA   L0223C7,X
            STA   L02992A,Y
            INX
            INY
            CPY   #$00A0
            BCC   L0297CF
            REP   #$20
            LDA   #L0298B5
            STA   L029928
            PEA   ^L029853
            PEA   L029853
            BRA   L02978E
L0297EC     LDY   #$0000
L0297EF     LDA   ($54),Y
            STA   L02992A,Y
            INY
            INY
            CPY   #$0120
            BCC   L0297EF
            PHY
            JSR   L023B0E
            PLX
            LDY   L023B83
            SEP   #$20
L029805     LDA   L0223C7,Y
            AND   #$7F
            STA   L02992A,X
            INY
            INX
            CPX   #$0140
            BCC   L029805
            REP   #$20
            LDA   L0212DF
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L022697
            STA   $3E
            LDY   #$0000
L029826     LDA   ($3E),Y
            STA   L02992A,X
            INY
            INY
            INX
            INX
            CPX   #$0150
            BCC   L029826
            LDA   #L0298DE
            STA   L029928
            PEA   ^L029864
            PEA   L029864
            JMP   L02978E

L029843     STR   ' Paste WaveList'
L029853     STR   ' Paste Generator'
L029864     STR   ' Paste Instrument'
L029876     LDX   #$0000
            JSR   (L029928,X)
            JSR   L028C34
            LDX   #$0000
            JSR   (L02126C,X)
            RTS

L029886     LDY   #$0000
L029889     LDA   L02992A,Y
            STA   ($3C),Y
            INY
            INY
            CPY   #$0010
            BCC   L029889
            PHY
            JSR   L023B0E
            PLY
            LDA   L023B85
            CLC
            ADC   L0212D9
            TAX
            SEP   #$20
            LDA   L02992A,Y
            STA   L0223C7,X
            INY
            INY
            LDA   L02992A,Y
            STA   L0223CF,X
            REP   #$20
            RTS

L0298B5     LDY   #$0000
L0298B8     LDA   L02992A,Y
            STA   ($3A),Y
            INY
            INY
            CPY   #$0090
            BCC   L0298B8
            PHY
            JSR   L023B0E
            PLY
            LDX   L023B85
            SEP   #$20
L0298CE     LDA   L02992A,Y
            STA   L0223C7,X
            INX
            INY
            CPY   #$00A0
            BCC   L0298CE
            REP   #$20
            RTS

L0298DE     LDY   #$0000
L0298E1     LDA   L02992A,Y
            STA   ($54),Y
            INY
            INY
            CPY   #$0120
            BCC   L0298E1
            PHY
            JSR   L023B0E
            PLX
            LDY   L023B83
            SEP   #$20
L0298F7     LDA   L02992A,X
            STA   L0223C7,Y
            INY
            INX
            CPX   #$0140
            BCC   L0298F7
            REP   #$20
            LDA   L0212DF
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #L022697
            STA   $3E
            LDY   #$0000
L029916     LDA   L02992A,X
            STA   ($3E),Y
            INY
            INY
            INX
            INX
            CPX   #$0150
            BCC   L029916
            JSR   L029467
            RTS

L029928     DB    $00
            DB    $00
L02992A     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L029A7A     DW    $0000
            DW    $0001
            DW    $0028
            ADRL  L029DC6
            ADRL  L029A94
            ADRL  L029AA2
            ADRL  L029AB0
            ADRL  $00000000
L029A94     DW    $0000
            DW    $0100
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029ABE
L029AA2     DW    $0000
            DW    $01FF
            DW    $0000
            DW    $0000
            DW    $00A0
            ADRL  L029C6F
L029AB0     DW    $0000
            DW    $010D
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029AD1
L029ABE     STR   ' About SynthLAB...'
L029AD1     STR   ' Clock...'
L029ADB     ASC   '%%    \H'03000D
            ASC   '>> View Sequence... \*EeH'08010D
            ASC   '>> Name Instrument... \*IiH'0A010D
            ASC   '>>-\N511D'0D
            ASC   '>> Copy WaveList \H$'010D
            ASC   '>> Copy Generator \H%'010D
            ASC   '>> Copy Instrument \H&'010D
            ASC   '>>-\N511D'0D
            ASC   '>> Paste \D*VvH'
            ASC   "}"000D
            ASC   '.'
L029B8C     DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $28
            DB    $00
            ADRL  L029DC6
            ADRL  L029BB6
            ADRL  L029BC4
            ADRL  L029BEE
            ADRL  L029BD2
            ADRL  L029BE0
            ADRL  L029BFC
            ADRL  L029C0A
            ADRL  $00000000
L029BB6     DW    $0000
            DW    $010C
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029C18
L029BC4     DW    $0000
            DW    $0134
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029C21
L029BD2     DW    $0000
            DW    $0135
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029C2F
L029BE0     DW    $0000
            DW    $0137
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029C43
L029BEE     DW    $0000
            DW    $0123
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029C4E
L029BFC     DW    $0000
            DW    $01FF
            DW    $0000
            DW    $0000
            DW    $00A0
            ADRL  L029C6F
L029C0A     DW    $0000
            DW    $010B
            DW    $7A5A
            DW    $0000
            DW    $0020
            ADRL  L029C5F
L029C18     STR   ' MIDI...'
L029C21     STR   ' Sequencer...'
L029C2F     STR   ' System Controls...'
L029C43     STR   ' Volume...'
L029C4E     STR   ' Track Output...'
L029C5F     STR   ' All Notes Off '
L029C6F     STR   '-'
L029C71     DW    $0000
            DW    $0002
            DW    $0028
            ADRL  L029DC6
            ADRL  L029CA7
            ADRL  L029CB5
            ADRL  L029CC3
            ADRL  L029BFC
            ADRL  L029CD1
            ADRL  L029CDF
            ADRL  L029BFC
            ADRL  L029CED
            ADRL  L029BFC
            ADRL  L029CFB
            ADRL  $00000000
L029CA7     DW    $0000
            DW    $0105
            ASC   'Nn'
            DW    $0000
            DW    $0020
            ADRL  L029D09
L029CB5     DW    $0000
            DW    $0107
            ASC   'Oo'
            DW    $0000
            DW    $0020
            ADRL  L029D17
L029CC3     DW    $0000
            DW    $0109
            ASC   'Ss'
            DW    $0000
            DW    $0020
            ADRL  L029D29
L029CD1     DW    $0000
            DW    $0104
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029D3B
L029CDF     DW    $0000
            DW    $0106
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029D4F
L029CED     DW    $0000
            DW    $0102
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029D63
L029CFB     DW    $0000
            DW    $0101
            DW    $7151
            DW    $0000
            DW    $0020
            ADRL  L029D72
L029D09     STR   ' New Sequence'
L029D17     STR   ' Open Sequence...'
L029D29     STR   ' Save Sequence...'
L029D3B     STR   ' Load Instrument...'
L029D4F     STR   ' Save Instrument...'
L029D63     STR   ' Load Waves...'
L029D72     STR   ' Quit'
L029D78     DW    $0000
            DW    $0004
            DW    $0028
            ADRL  L029DC6
            ADRL  L029DC7
            ADRL  L029DD5
            ADRL  L029DE3
            ADRL  L029DF1
            ADRL  L029DFF
            ADRL  L029E0D
            ADRL  L029E1B
            ADRL  L029E29
            ADRL  L029E37
            ADRL  L029E45
            ADRL  L029E53
            ADRL  L029E61
            ADRL  L029E6F
            ADRL  L029E7D
            ADRL  L029E8B
            ADRL  L029E99
            ADRL  $00000000
L029DC6     DB    $00
L029DC7     DW    $0000
            DW    $0113
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029EA7
L029DD5     DW    $0000
            DW    $0114
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029EBB
L029DE3     DW    $0000
            DW    $0115
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029ECF
L029DF1     DW    $0000
            DW    $0116
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029EE3
L029DFF     DW    $0000
            DW    $0117
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029EF7
L029E0D     DW    $0000
            DW    $0118
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F0B
L029E1B     DW    $0000
            DW    $0119
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F1F
L029E29     DW    $0000
            DW    $011A
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F33
L029E37     DW    $0000
            DW    $011B
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F47
L029E45     DW    $0000
            DW    $011C
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F5B
L029E53     DW    $0000
            DW    $011D
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F6F
L029E61     DW    $0000
            DW    $011E
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F83
L029E6F     DW    $0000
            DW    $011F
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029F97
L029E7D     DW    $0000
            DW    $0120
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029FAB
L029E8B     DW    $0000
            DW    $0121
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029FBF
L029E99     DW    $0000
            DW    $0122
            DW    $0000
            DW    $0000
            DW    $0020
            ADRL  L029FD3
L029EA7     STR   ' 1  Inst 1'
            HEX   000000000000000000
L029EBB     STR   ' 2  Inst 2'
            HEX   000000000000000000
L029ECF     STR   ' 3  Inst 3'
            HEX   000000000000000000
L029EE3     STR   ' 4  Inst 4'
            HEX   000000000000000000
L029EF7     STR   ' 5  Inst 5'
            HEX   000000000000000000
L029F0B     STR   ' 6  Inst 6'
            HEX   000000000000000000
L029F1F     STR   ' 7  Inst 7'
            HEX   000000000000000000
L029F33     STR   ' 8  Inst 8'
            HEX   000000000000000000
L029F47     STR   ' 9  Inst 9'
            HEX   000000000000000000
L029F5B     STR   '10  Inst 10'
            HEX   0000000000000000
L029F6F     STR   '11  Inst 11'
            HEX   0000000000000000
L029F83     STR   '12  Inst 12'
            HEX   0000000000000000
L029F97     STR   '13  Inst 13'
            HEX   0000000000000000
L029FAB     STR   '14  Inst 14'
            HEX   0000000000000000
L029FBF     STR   '15  Inst 15'
            HEX   0000000000000000
L029FD3     STR   '16  Inst 16'
            HEX   0000000000000000
L029FE7     DW    $0000
            DW    $0007
            DW    $0028
            ADRL  L029DC6
            ADRL  L02A015
            ADRL  L02A023
            ADRL  L02A031
            ADRL  L02A03F
            ADRL  L02A04D
            ADRL  L02A05B
            ADRL  L02A069
            ADRL  L02A077
            ADRL  $00000000
L02A015     DW    $0000
            DW    $012C
            ASC   '1'00
            DW    $0000
            DW    $0020
            ADRL  L02A085
L02A023     DW    $0000
            DW    $012D
            ASC   '2'00
            DW    $0000
            DW    $0020
            ADRL  L02A092
L02A031     DW    $0000
            DW    $012E
            ASC   '3'00
            DW    $0000
            DW    $0020
            ADRL  L02A09F
L02A03F     DW    $0000
            DW    $012F
            ASC   '4'00
            DW    $0000
            DW    $0020
            ADRL  L02A0AC
L02A04D     DW    $0000
            DW    $0130
            ASC   '5'00
            DW    $0000
            DW    $0020
            ADRL  L02A0B9
L02A05B     DW    $0000
            DW    $0131
            ASC   '6'00
            DW    $0000
            DW    $0020
            ADRL  L02A0C6
L02A069     DW    $0000
            DW    $0132
            ASC   '7'00
            DW    $0000
            DW    $0020
            ADRL  L02A0D3
L02A077     DW    $0000
            DW    $0133
            ASC   '8'00
            DW    $0000
            DW    $0020
            ADRL  L02A0E0
L02A085     STR   ' WaveList 1 '
L02A092     STR   ' WaveList 2 '
L02A09F     STR   ' WaveList 3 '
L02A0AC     STR   ' WaveList 4 '
L02A0B9     STR   ' WaveList 5 '
L02A0C6     STR   ' WaveList 6 '
L02A0D3     STR   ' WaveList 7 '
L02A0E0     STR   ' WaveList 8 '
            ASC   '.'
L02A0EE     DW    $0000
L02A0F0     DW    $0000
L02A0F2     LDAL  TickCount
            STAL  L02A190
            STAL  L02A0EE
            CLC
            RTL

L02A100     LDA   L0211C8
            BEQ   L02A131
            LDA   L02A0EE
            BEQ   L02A131
            LDA   L02A0F0
            BNE   L02A120
            LDA   #L04A2FA
            JSR   L02A149
            LDAL  TickCount
            STA   L02A190
            STA   L02A0F0
            RTS

L02A120     JSR   L02A184
            BCC   L02A131
            LDA   #L04A22A
            JSR   L02A149
            STZ   L02A0EE
            STZ   L02A0F0
L02A131     RTS

L02A132     LDA   L0211C8
            BEQ   L02A146
            LDA   L02A0EE
            BEQ   L02A141
            LDA   #L04A2FA
            BRA   L02A149
L02A141     LDA   #L04A22A
            BRA   L02A149
L02A146     LDA   #L04A15A
L02A149     STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$2085
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            LDA   #$0010
            STA   $2E
            STA   $1A
            LDA   #$000D
            STA   $2C
            LDA   L02000D
            CMP   #$000C
            BEQ   L02A176
            BCS   L02A180
L02A176     JSR   L025598
            JSR   L025501
            JSR   L025574
            RTS

L02A180     JSR   L025501
            RTS

L02A184     LDAL  TickCount
            SEC
            SBC   L02A190
            CMP   #$000A
            RTS

L02A190     DW    $0000
L02A192     JSR   L0205B5
            JSR   L0219FA
            LDA   #L02A1E0
            JSR   L021A1A
            JSR   L02A203
            LDA   #^L02A290
            STA   $50
            PHA
            LDA   #L02A290
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            LDA   #L02A203
            STA   L02185D
            JSR   L02185F
            LDA   #L025500
            STA   L02185D
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02A1E0     DW    $0023
            DW    $0064
            DW    $0065
            DW    $00F4
L02A1E8     ASC   'MM/DD/YY'
L02A1F0     ASC   ' 12:00:00 am       '

L02A203     PEA   ^L02A1E8
            PEA   L02A1E8
            _ReadAsciiTime
            LDA   L02A1F0
            AND   #$7F7F
            STA   L02A1F0
            LDA   L02A1F0+2
            AND   #$7F7F
            STA   L02A1F0+2
            LDA   L02A1F0+4
            AND   #$7F7F
            STA   L02A1F0+4
            LDA   L02A1F0+6
            AND   #$7F7F
            STA   L02A1F0+6
            LDA   L02A1F0+8
            AND   #$7F7F
            STA   L02A1F0+8
            LDA   L02A1F0+$A
            AND   #$7F7F
            ORA   #$2020
            STA   L02A1F0+$A
            PEA   $0001
            _SetForeColor
            PEA   $0003
            _SetBackColor
            LDA   #$0088
            PHA
            LDA   #$003C
            PHA
            _MoveTo
            LDA   L02A1F0
            AND   #$FF00
            ORA   #$000F
            STA   L02A1F0
            PEA   ^L02A1F0
            PEA   L02A1F0
            _DrawString
            PEA   $0000
            _SetForeColor
            RTS

L02A290     DW    $0001
            DA    L02A294
L02A294     DW    $0007
            DW    $0000
            DW    $004C
            DW    $008A
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67

*--- DEAD CODE

            LDA   L02A353
            BEQ   L02A2B0
            BRL   L02A327
L02A2B0     PHA
            PHA
            PEA   $0003
            PEA   $0000
            LDA   L02095E
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   $3E
            PLA
            STA   $40
            BCC   L02A2D6

*            BRK   $13           ; LOGO - There's a BREAK
	dec   L02A353	; 202303 - no more crash
	clc
	rts
	
L02A2D6     LDY   #$0002
            LDA   [$3E]
            STA   L02A355
            LDA   [$3E],Y
            STA   L02A355+2
            JSL   GSOS
            DW    $0010         ; Open
            ADRL  L02A367
            BCC   L02A2F2
            BRL   L02A351
L02A2F2     LDA   L02A367
            STA   L02A371
            STA   L02A37F
            LDA   L02A355
            STA   L02A373
            LDA   L02A355+2
            STA   L02A373+2
            LDA   #$0003
            STA   L02A377+2
            STZ   L02A377
            JSL   GSOS
            DW    $0012         ; Read
            ADRL  L02A371
            JSL   GSOS
            DW    $0014         ; Close
            ADRL  L02A37F
            DEC   L02A353
L02A327     PEA   $0701
            PEA   ^L02A355
            PEA   L02A355
            _FFStartSound
L02A337     PHA
            PEA   $0007
            _FFSoundDoneStatus
            PLA
            BEQ   L02A337
            PEA   $0080
            _FFStopSound
            CLC
            RTS

L02A351     DB    $00
            DB    $14
L02A353     DW    $0000
L02A355     ADRL  $00000000
            DW    $0271
            DW    $0100
            DW    $0000
            DW    $0000
            ADRL  $00000000
            DW    $00FF
L02A367     DW    $0000         ;  ref num
            ADRL  L02A381       ;  path name
            ADRL  $00000000     ;  reserved
L02A371     DW    $0000         ;  ref num
L02A373     ADRL  $00000000     ;  buffer ptr
L02A377     ADRL  $00000000     ;  request count
            ADRL  $00000000     ;  transfer count
L02A37F     DW    $0000         ;  ref num
L02A381     STR   'gunshots.raw'

L02A38E     JSR   L0205B5
            JSR   L0206FC
            JSR   L0219FA
            LDA   #L02A3D1
            JSR   L021A1A
            JSR   L02A578
            LDA   #^L02A3D9
            STA   $50
            PHA
            LDA   #L02A3D9
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   #L021B42
            STA   L0219F8
            LDA   #L02A4E2
            STA   L02185D
            JSR   L02185F
            LDA   #L025500
            STA   L02185D
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02A3D1     DW    $0012
            DW    $0000
            DW    $00C7
            DW    $027F
L02A3D9     DW    $000A
L02A3DB     DA    L02A403
            DA    L02A41B
            DA    L02A433
            DA    L02A44B
            DA    L02A463
            DA    L02A47B
            DA    L02A493
            DA    L02A4AB
            DA    L02A4C3
            DA    L02A3EF
L02A3EF     DW    $0007
            DW    $0000
            DW    $00B0
            DW    $021C
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L02A403     DW    $000A
            DW    $0000
            DW    $003F
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $4767
            DW    $000C
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0000
L02A41B     DW    $000A
            DW    $0000
            DW    $004D
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $5027
            DW    $0018
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0001
L02A433     DW    $000A
            DW    $0000
            DW    $005B
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $58E7
            DW    $0000
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0002
L02A44B     DW    $000A
            DW    $0000
            DW    $0069
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $61A7
            DW    $0024
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0003
L02A463     DW    $000A
            DW    $0000
            DW    $0077
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $6A67
            DW    $0030
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0004
L02A47B     DW    $000A
            DW    $0000
            DW    $0085
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $7327
            DW    $0038
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0005
L02A493     DW    $000A
            DW    $0000
            DW    $0093
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $7BE7
            DW    $000C
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0006
L02A4AB     DW    $000A
            DW    $0000
            DW    $00A1
            DW    $001C
            DA    L02AAC7
            DA    L02AA8C
            DW    $84A7
            DW    $003B
            DA    L02AADB
            DA    L02AAFD
            DW    $0000
            DW    $0007
L02A4C3     DW    $0005
            DW    $0000
            DW    $00AF
            DW    $00FC
            DA    L025500
            DA    L02A4D5
            ADRL  L04A8A6
            DW    $0000
L02A4D5     JSR   L0212E1
            LDA   #$FFFF
            STA   L02A572
            STZ   L02A576
            RTS

L02A4E2     LDA   L02A576
            BEQ   L02A4EA
            BRL   L02A56F
L02A4EA     STZ   L02A570
L02A4ED     LDA   L02A570
            CMP   #$0010
            BNE   L02A509
            LDA   L02A572
            BPL   L02A4FD
            BRL   L02A56F
L02A4FD     LDA   #$FFFF
            STA   L02A572
            LDA   #L04AB0A
            JMP   L02A548

L02A509     STA   L02A574
            TAX
            LDA   L02A3DB,X
            STA   $42
            INC   L02A570
            INC   L02A570
            LDY   #$0004
            LDA   ($42),Y
            STA   $08
            CLC
            ADC   #$0008
            STA   $0C
            LDY   #$0006
            LDA   ($42),Y
            STA   $0A
            CLC
            ADC   #$0248
            STA   $0E
            JSR   L02555A
            BCS   L02A539
            BRA   L02A4ED
L02A539     LDX   L02A574
            CPX   L02A572
            BEQ   L02A56F
            STX   L02A572
            LDAL  L04AA52,X
L02A548     STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0007
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   #$9036
            STA   $1C
            LDA   #$0003
            STA   $1A
            STA   $2E
            JSR   L025598
            JSR   L02552C
            JSR   L025574
L02A56F     RTS

L02A570     DW    $0000
L02A572     DW    $0000
L02A574     DW    $0000
L02A576     DW    $0000
L02A578     LDA   #$0000
            STA   L02A590
L02A57E     JSR   L02AA75
            INC   L02A590
            LDA   L02A590
            CMP   #$003C
            BNE   L02A57E
            CLC
            RTS

            DW    $0000
L02A590     DW    $0000
            DW    $0000
            DW    $0000
L02A596     DW    $0002
            DW    $0006
            DW    $000E
            DW    $0012
            DW    $0016
            DW    $001E
            DW    $0022
            DW    $002A
            DW    $002E
            DW    $0032
            DW    $003A
            DW    $003E
            DW    $0046
            DW    $004A
            DW    $004E
            DW    $0056
            DW    $005A
            DW    $0062
            DW    $0066
            DW    $006A
            DW    $0072
            DW    $0076
            DW    $007E
            DW    $0082
            DW    $0086
L02A5C8     DA    L02A965
            DW    $0000
            DA    L02A9AB
            DW    $0004
            DA    L02A9F5
            DW    $0008
            DA    L02A965
            DW    $000C
            DA    L02A9AB
            DW    $0010
            DA    L02A9AB
            DW    $0014
            DA    L02A9F5
            DW    $0018
            DA    L02A965
            DW    $001C
            DA    L02A9AB
            DW    $0020
            DA    L02A9F5
            DW    $0024
            DA    L02A965
            DW    $0028
            DA    L02A9AB
            DW    $002C
            DA    L02A9AB
            DW    $0030
            DA    L02A9F5
            DW    $0034
            DA    L02A965
            DW    $0038
            DA    L02A9AB
            DW    $003C
            DA    L02A9F5
            DW    $0040
            DA    L02A965
            DW    $0044
            DA    L02A9AB
            DW    $0048
            DA    L02A9AB
            DW    $004C
            DA    L02A9F5
            DW    $0050
            DA    L02A965
            DW    $0054
            DA    L02A9AB
            DW    $0058
            DA    L02A9F5
            DW    $005C
            DA    L02A965
            DW    $0060
            DA    L02A9AB
            DW    $0064
            DA    L02A9AB
            DW    $0068
            DA    L02A9F5
            DW    $006C
            DA    L02A965
            DW    $0070
            DA    L02A9AB
            DW    $0074
            DA    L02A9F5
            DW    $0078
            DA    L02A965
            DW    $007C
            DA    L02A9AB
            DW    $0080
            DA    L02A9AB
            DW    $0084
            DA    L02A9F5
            DW    $0088
L02A654     DA    L02A9A6
            DW    $0000
            DA    L02A9F0
            DW    $0004
            DA    L02AA3A
            DW    $0008
            DA    L02A9A6
            DW    $000C
            DA    L02A9F0
            DW    $0010
            DA    L02A9F0
            DW    $0014
            DA    L02AA3A
            DW    $0018
            DA    L02A9A6
            DW    $001C
            DA    L02A9F0
            DW    $0020
            DA    L02AA3A
            DW    $0024
            DA    L02A9A6
            DW    $0028
            DA    L02A9F0
            DW    $002C
            DA    L02A9F0
            DW    $0030
            DA    L02AA3A
            DW    $0034
            DA    L02A9A6
            DW    $0038
            DA    L02A9F0
            DW    $003C
            DA    L02AA3A
            DW    $0040
            DA    L02A9A6
            DW    $0044
            DA    L02A9F0
            DW    $0048
            DA    L02A9F0
            DW    $004C
            DA    L02AA3A
            DW    $0050
            DA    L02A9A6
            DW    $0054
            DA    L02A9F0
            DW    $0058
            DA    L02AA3A
            DW    $005C
            DA    L02A9A6
            DW    $0060
            DA    L02A9F0
            DW    $0064
            DA    L02A9F0
            DW    $0068
            DA    L02AA3A
            DW    $006C
            DA    L02A9A6
            DW    $0070
            DA    L02A9F0
            DW    $0074
            DA    L02AA3A
            DW    $0078
            DA    L02A9A6
            DW    $007C
            DA    L02A9F0
            DW    $0080
            DA    L02A9F0
            DW    $0084
            DA    L02AA3A
            DW    $0088
            DW    $0000
            DW    $0002
            DW    $0004
            DW    $0005
            DW    $0007
            DW    $0009
            DW    $000B
            DW    $000C
            DW    $000E
            DW    $0010
            DW    $0011
            DW    $0013
            DW    $0015
            DW    $0017
            DW    $0018
            DW    $001A
            DW    $001C
            DW    $001D
            DW    $001F
            DW    $0021
            DW    $0023
            DW    $0024
            DW    $0026
            DW    $0028
            DW    $0029
            DW    $002B
            DW    $002D
            DW    $002F
            DW    $0030
            DW    $0032
            DW    $0034
            DW    $0035
            DW    $0037
            DW    $0039
            DW    $003B
            DW    $0001
            DW    $0003
            DW    $0006
            DW    $0008
            DW    $000A
            DW    $000D
            DW    $000F
            DW    $0012
            DW    $0014
            DW    $0016
            DW    $0019
            DW    $001B
            DW    $001E
            DW    $0020
            DW    $0022
            DW    $0025
            DW    $0027
            DW    $002A
            DW    $002C
            DW    $002E
            DW    $0031
            DW    $0033
            DW    $0036
            DW    $0038
            DW    $003A
L02A758     DW    $0000
            DW    $0001
            DW    $0002
            DW    $0003
            DW    $0004
            DW    $0006
            DW    $0007
            DW    $0008
            DW    $0009
            DW    $000A
            DW    $000B
            DW    $000C
            DW    $000E
            DW    $000F
            DW    $0010
            DW    $0011
            DW    $0012
            DW    $0014
            DW    $0015
            DW    $0016
            DW    $0017
            DW    $0018
            DW    $0019
            DW    $001A
            DW    $001C
            DW    $001D
            DW    $001E
            DW    $001F
            DW    $0020
            DW    $0022
            DW    $0023
            DW    $0024
            DW    $0025
            DW    $0026
            DW    $0027
            DW    $0028
            DW    $002A
            DW    $002B
            DW    $002C
            DW    $002D
            DW    $002E
            DW    $0030
            DW    $0031
            DW    $0032
            DW    $0033
            DW    $0034
            DW    $0035
            DW    $0036
            DW    $0038
            DW    $0039
            DW    $003A
            DW    $003B
            DW    $003C
            DW    $003E
            DW    $003F
            DW    $0040
            DW    $0041
            DW    $0042
            DW    $0043
            DW    $0044
L02A7D0     DW    $0000
            DW    $0001
            DW    $0002
            DW    $0003
            DW    $0004
            DW    $0004
            DW    $0005
            DW    $0006
            DW    $0007
            DW    $0008
            DW    $0009
            DW    $000A
            DW    $000B
            DW    $000B
            DW    $000C
            DW    $000D
            DW    $000E
            DW    $000F
            DW    $0010
            DW    $0010
            DW    $0011
            DW    $0012
            DW    $0013
            DW    $0014
            DW    $0015
            DW    $0016
            DW    $0017
            DW    $0017
            DW    $0018
            DW    $0019
            DW    $001A
            DW    $001B
            DW    $001C
            DW    $001C
            DW    $001D
            DW    $001E
            DW    $001F
            DW    $0020
            DW    $0021
            DW    $0022
            DW    $0023
            DW    $0023
            DW    $0024
            DW    $0025
            DW    $0026
            DW    $0027
            DW    $0028
            DW    $0028
            DW    $0029
            DW    $002A
            DW    $002B
            DW    $002C
            DW    $002D
            DW    $002E
            DW    $002F
            DW    $002F
            DW    $0030
            DW    $0031
            DW    $0032
            DW    $0033
            DW    $0034
            DW    $0034
            DW    $0035
            DW    $0036
            DW    $0037
            DW    $0038
            DW    $0039
            DW    $003A
            DW    $003B
            DW    $003B
L02A85C     DW    $0000
            DW    $8000
            DW    $0001
            DW    $8001
            DW    $0002
            DW    $0003
            DW    $8002
            DW    $0004
            DW    $8003
            DW    $0005
            DW    $8004
            DW    $0006
            DW    $0007
            DW    $8005
            DW    $0008
            DW    $8006
            DW    $0009
            DW    $000A
            DW    $8007
            DW    $000B
            DW    $8008
            DW    $000C
            DW    $8009
            DW    $000D
            DW    $000E
            DW    $800A
            DW    $000F
            DW    $800B
            DW    $0010
            DW    $0011
            DW    $800C
            DW    $0012
            DW    $800D
            DW    $0013
            DW    $800E
            DW    $0014
            DW    $0015
            DW    $800F
            DW    $0016
            DW    $8010
            DW    $0017
            DW    $0018
            DW    $8011
            DW    $0019
            DW    $8012
            DW    $001A
            DW    $8013
            DW    $001B
            DW    $001C
            DW    $8014
            DW    $001D
            DW    $8015
            DW    $001E
            DW    $001F
            DW    $8016
            DW    $0020
            DW    $8017
            DW    $0021
            DW    $8018
            DW    $0022
L02A8D4     PHA
            LDA   #L02A5C8
            STA   $3E
L02A8DA     PLA
            JSR   L02A905
            LDX   #$0000
            JSR   (L02A8E5,X)
            RTS

L02A8E5     DA    $0000
L02A8E7     PHA
            LDA   #L02A654
            STA   $3E
            BRA   L02A8DA
L02A8EF     PHA
            LDA   #L04646A
            STA   $16
L02A8F5     PLA
            JSR   L02A919
            JSR   L02A920
            RTS

L02A8FD     PHA
            LDA   #L04642A
            STA   $16
            BRA   L02A8F5
L02A905     ASL
            ASL
            TAY
            LDA   ($3E),Y
            STA   L02A8E5
            INY
            INY
            LDA   ($3E),Y
L02A911     STA   $06
            LDA   L02002D
            STA   $18
            RTS

L02A919     ASL
            TAX
            LDA   L02A596,X
            BRA   L02A911
L02A920     LDA   #$0010
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   L02AA5E
            CLC
            ADC   $06
            STA   $1C
            LDA   #$0004
            STA   $1A
            LDA   #$0003
            STA   $2E
            LDA   #$001C
            STA   L0255B4
            CLC
            ADC   #$0010
            STA   L0255B8
            LDA   $06
            ASL
            ASL
            CLC
            ADC   #$0024
            STA   L0255B6
            ADC   #$000C
            STA   L0255BA
            JSR   L0255BC
            JSR   L02552C
            JSR   L025605
            RTS

L02A965     LDA   #L046172
L02A968     STA   $16
            LDA   #$0002
            STA   $2E
            LDA   #$0010
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   L02AA5E
            CLC
            ADC   $06
            STA   $1C
            LDA   #$0004
            STA   $1A
            LDA   #$00A0
            STA   $20
            JSR   L02AA3F
            JSR   L0255BC
            JSR   L025501
            LDA   #$000D
            STA   $2C
            LDA   #$0004
            STA   $2E
            JSR   L025501
            JSR   L025605
            RTS

L02A9A6     LDA   #L0462CE
            BRA   L02A968
L02A9AB     LDA   #L0461E7
L02A9AE     STA   $16
            LDA   #$0001
            STA   $2E
            LDA   #$0010
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   L02AA5E
            SEC
            ADC   $06
            STA   $1C
            LDA   #$0004
            STA   $1A
            LDA   #$00A0
            STA   $20
            JSR   L02AA3F
            JSR   L0255BC
            JSR   L02552C
            LDA   #$000D
            STA   $2C
            LDA   #$0004
            STA   $2E
            DEC   $16
            DEC   $1C
            JSR   L025501
            JSR   L025605
            RTS

L02A9F0     LDA   #L046343
            BRA   L02A9AE
L02A9F5     LDA   #L04625B
L02A9F8     STA   $16
            LDA   #$0003
            STA   $2E
            LDA   #$0010
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   L02AA5E
            SEC
            ADC   $06
            STA   $1C
            LDA   #$0004
            STA   $1A
            LDA   #$00A0
            STA   $20
            JSR   L02AA3F
            JSR   L0255BC
            JSR   L02552C
            LDA   #$000D
            STA   $2C
            LDA   #$0004
            STA   $2E
            DEC   $16
            DEC   $1C
            JSR   L025501
            JSR   L025605
            RTS

L02AA3A     LDA   #L0463B7
            BRA   L02A9F8
L02AA3F     LDA   #$001C
            STA   L0255B4
            CLC
            ADC   #$001D
            STA   L0255B8
            LDA   $06
            ASL
            ASL
            CLC
            ADC   #$0024
            STA   L0255B6
            ADC   #$0010
            STA   L0255BA
            RTS

L02AA5E     DW    $3189
L02AA60     ASL
            TAX
            LDA   L02A85C,X
            STA   L02AA8A
            BMI   L02AA6E
            JSR   L02A8E7
            RTS

L02AA6E     AND   #$00FF
            JSR   L02A8FD
            RTS

L02AA75     ASL
            TAX
            LDA   L02A85C,X
            STA   L02AA8A
            BMI   L02AA83
            JSR   L02A8D4
            RTS

L02AA83     AND   #$00FF
            JSR   L02A8EF
            RTS

L02AA8A     DW    $0000
L02AA8C     LDY   #$0016
            LDA   ($00),Y
            ASL
            ASL
            ASL
            ASL
            ADC   $78
            STA   $42
            SEP   #$20
            LDY   #$0000
            LDA   ($42),Y
            SEC
            SBC   #$25
            BCS   L02AAA7
            LDA   #$00
L02AAA7     CMP   #$3B
            BCC   L02AAAF
            BEQ   L02AAAF
            LDA   #$3B
L02AAAF     REP   #$20
            AND   #$007F
            LDY   #$000E
            STA   ($00),Y
            ASL
            TAX
            LDA   L02A758,X
            ASL
            ASL
            ASL
            LDY   #$0014
            STA   ($00),Y
            RTS

L02AAC7     LDY   #$000E
            LDA   ($00),Y
            STA   L02AAD9
            JSR   L02AA60
            LDA   #$0001
            STA   L02A576
            RTS

L02AAD9     DW    $0000
L02AADB     LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            TAX
            LDA   L02A7D0,X
            CMP   L02AAD9
            BEQ   L02AAFC
            PHA
            LDA   L02AAD9
            JSR   L02AA75
            PLA
            STA   L02AAD9
            JSR   L02AA60
L02AAFC     RTS

L02AAFD     LDA   L02AAD9
            JSR   L02AA75
            LDY   #$0016
            LDA   ($00),Y
            ASL
            ASL
            ASL
            ASL
            ADC   $78
            STA   $42
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            TAX
            LDA   L02A7D0,X
            LDY   #$000E
            STA   ($00),Y
            SEP   #$20
            CLC
            ADC   #$25
            LDY   #$0000
            STA   ($42),Y
            REP   #$20
            JSR   L028C34
            STZ   L02A576
            RTS

L02AB36     LDA   $14
            CMP   #$0000
            BEQ   L02AB47
            CMP   #$0004
            BNE   L02AB45
            BRL   L02AC2D
L02AB45     CLC
            RTS

L02AB47     LDY   #$000A
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            LDA   #L04A55A
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0002
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDY   #$000C
            LDA   ($00),Y
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            JSR   L025501
            LDAL  L020966
            STA   $1E
            LDY   #$000C
            LDA   ($00),Y
            CLC
            ADC   #$0002
            STA   $30
            PHA
            LDA   #$008E
            STA   $2E
            LDA   #$0001
            STA   $2C
            LDA   #$0000
            STA   $32
            JSR   L0213AA
            PLA
            CLC
            ADC   #$0460
            STA   $30
            LDA   #$0001
            STA   $2C
            LDA   #$AAAA
            STA   $32
            JSR   L0213AA
            LDA   #L04A56A
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0002
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDY   #$000C
            LDA   ($00),Y
            CLC
            ADC   #$0090
            STA   $1C
            LDAL  L020966
            STA   $1E
            LDA   #$00A0
            STA   $20
            JSR   L025501
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            STA   $2E
            PHA
            LDY   #$000C
            LDA   ($00),Y
            CLC
            ADC   #$0002
            STA   $30
            LDA   #$0007
            STA   $2C
            LDA   #$0000
            STA   $32
            JSR   L0213AA
            LDAL  L04A3CA
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0006
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            PLA
            CLC
            ADC   $30
            STA   $1C
            JSR   L025501
            RTS

L02AC2D     LDY   #$0004
            LDA   ($00),Y
            STA   $08
            CLC
            ADC   #$0008
            STA   $0C
            LDY   #$0006
            LDA   ($00),Y
            STA   $0A
            STA   $06
            CLC
            ADC   #$0248
            STA   $0E
            JSR   L02555A
            BCS   L02AC4F
            RTS

L02AC4F     LDA   $06
            CLC
            ADC   #$0008
            LDY   #$0014
            ADC   ($00),Y
            STA   $0A
            STA   $04
            CLC
            ADC   #$0010
            STA   $0E
            JSR   L02555A
            BCC   L02AC6C
            BRL   L02AD3C
L02AC6C     LDA   $06
            STA   $0A
            LDA   $04
            STA   $0E
            JSR   L02555A
            BCS   L02AC91
            LDA   $04
            CLC
            ADC   #$0010
            STA   $0A
            LDA   $06
            CLC
            ADC   #$0248
            STA   $0E
            PEA   L02ACB9
            PEA   L02ACE5
            BRA   L02AC97
L02AC91     PEA   L02ACFA
            PEA   L02AD27
L02AC97     JSR   L021C37
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            STA   L02AEF6
            LDY   #$0008
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            INC   $10
            SEC
            RTS

L02ACB9     JSR   L02555A
            BCS   L02ACBF
            RTS

L02ACBF     LDA   #$0001
            JSR   L02ADB0
            LDY   #$0014
            LDA   ($00),Y
            CLC
            LDY   #$0006
            ADC   ($00),Y
            CLC
            ADC   #$0010
            STA   $0A
            LDY   #$0010
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L02ACE5     JSR   L02ACB9
            JSR   L021C65
            LDY   #$0012
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L02ACFA     JSR   L02555A
            BCS   L02AD00
            RTS

L02AD00     LDA   #$FFFF
            JSR   L02ADB0
            LDY   #$0014
            LDA   ($00),Y
            CLC
            LDY   #$0006
            ADC   ($00),Y
            CLC
            ADC   #$0010
            STA   $0E
            LDY   #$0010
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS
            RTS

L02AD27     JSR   L02ACFA
            JSR   L021C65
            LDY   #$0012
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L02AD3C     INC   $10
            PEA   L02AD6C
            PEA   L02AD9B
            JSR   L021C37
            LDA   L02000F
            SEC
            SBC   $0A
            STA   $64
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            STA   L02AEF6
            LDY   #$0008
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            SEC
            RTS

L02AD6C     SEC
            LDA   L02000F
            SBC   $64
            SEC
            SBC   $0A
            BNE   L02AD78
            RTS

L02AD78     JSR   L02ADB0
            LDY   #$0014
            LDA   ($00),Y
            CLC
            LDY   #$0006
            ADC   ($00),Y
            CLC
            ADC   #$0008
            STA   $0A
            LDY   #$0010
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L02AD9B     JSR   L02AD6C
            JSR   L021C65
            LDY   #$0012
            LDA   ($00),Y
            STA   L02516C
            LDX   #$0000
            JSR   (L02516C,X)
            RTS

L02ADB0     BPL   L02ADB5
            BRL   L02AE66
L02ADB5     STA   $3E
            LDY   #$0014
            LDA   ($00),Y
            CLC
            ADC   $3E
            CMP   #$0224
            BMI   L02ADD3
            LDA   #$0224
            SEC
            LDY   #$0014
            SBC   ($00),Y
            DEC
            BNE   L02ADD1
            RTS

L02ADD1     STA   $3E
L02ADD3     LDA   $3E
            CLC
            LDY   #$0014
            ADC   ($00),Y
            STA   ($00),Y
            LDA   L02002D
            STA   $18
            LDY   #$000C
            LDA   ($00),Y
            CLC
            ADC   #$0002
            STA   L02AEFC
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            STA   L02AEF8
            JSR   L02AEFE
            JSR   L0255BC
            LDA   L02AEF8
            CMP   L02AEF6
            BEQ   L02AE35
L02AE09     LDA   #L04A58A
            STA   $16
            LDA   #$0002
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDA   L02AEF6
            CLC
            ADC   L02AEFC
            STA   $1C
            JSR   L025501
            LDA   L02AEF6
            CLC
            ADC   #$0002
            STA   L02AEF6
            CMP   L02AEF8
            BNE   L02AE09
L02AE35     LDY   #$0014
            LDA   ($00),Y
            AND   #$0007
            ASL
            TAX
            LDAL  L04A3CA,X
            STA   $16
            LDA   #$0006
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDA   L02AEF8
            ADC   L02AEFC
            STA   $1C
            JSR   L025501
            JSR   L025605
            LDA   L02AEF8
            STA   L02AEF6
            RTS

L02AE66     STA   $3E
            LDY   #$0014
            LDA   ($00),Y
            CLC
            ADC   $3E
            BPL   L02AE7D
            LDA   ($00),Y
            BNE   L02AE77
            RTS

L02AE77     EOR   #$FFFF
            INC
            STA   $3E
L02AE7D     LDA   $3E
            CLC
            LDY   #$0014
            ADC   ($00),Y
            STA   ($00),Y
            LDA   L02002D
            STA   $18
            LDY   #$000C
            LDA   ($00),Y
            CLC
            ADC   #$0002
            STA   L02AEFC
            LDA   L02AEF6
            CLC
            ADC   #$0004
            STA   L02AEF6
            LDY   #$0014
            LDA   ($00),Y
            LSR
            LSR
            AND   #$FFFE
            STA   L02AEF8
            CLC
            ADC   #$0004
            STA   L02AEFA
            JSR   L02AF2F
            JSR   L0255BC
            LDA   L02AEFA
            CMP   L02AEF6
            BNE   L02AEC7
            BRL   L02AE35
L02AEC7     LDA   #L04A57A
            STA   $16
            LDA   #$0002
            STA   $2E
            STA   $1A
            LDA   #$0008
            STA   $2C
            LDA   L02AEF6
            CLC
            ADC   L02AEFC
            STA   $1C
            JSR   L025501
            LDA   L02AEF6
            SEC
            SBC   #$0002
            STA   L02AEF6
            CMP   L02AEFA
            BNE   L02AEC7
            JMP   L02AE35

L02AEF6     DW    $0000
L02AEF8     DW    $0000
L02AEFA     DW    $0000
L02AEFC     DW    $0000
L02AEFE     LDY   #$0004
            LDA   ($00),Y
            STA   L0255B4
            CLC
            ADC   #$0008
            STA   L0255B8
            LDA   L02AEF6
            ASL
            ASL
            CLC
            LDY   #$0006
            ADC   ($00),Y
            STA   L0255B6
            LDA   L02AEF8
            SEC
            SBC   L02AEF6
            ASL
            ASL
            CLC
            ADC   L0255B6
            ADC   #$0018
            STA   L0255BA
            RTS

L02AF2F     LDY   #$0004
            LDA   ($00),Y
            STA   L0255B4
            CLC
            ADC   #$0008
            STA   L0255B8
            LDA   L02AEFA
            ASL
            ASL
            CLC
            LDY   #$0006
            ADC   ($00),Y
            STA   L0255B6
            LDA   L02AEF6
            SEC
            SBC   L02AEFA
            ASL
            ASL
            CLC
            ADC   L0255B6
            ADC   #$0018
            STA   L0255BA
            RTS

L02AF60     JSR   L02B240
            BCC   L02AF75
            JSR   L02AFDF
            LDA   #$0007
            STA   L02B24E
            LDAL  TickCount
            STA   L02B24C
L02AF75     RTS

L02AF76     JSR   L02AFFB
            JSR   L02AF8A
            LDA   #$0007
            STA   L02B24E
            LDAL  TickCount
            STA   L02B24C
            RTS

L02AF8A     JSR   L02AF8E
            RTS

L02AF8E     SEP   #$20
            LDX   #$005D
            LDY   #$0000
L02AF96     LDA   L02AFA7,Y
            STAL  $E19D00,X
            INX
            INY
            CPY   #$0007
            BNE   L02AF96
            REP   #$20
            RTS

L02AFA7     HEX   87
L02AFA8     HEX   88898A8B8C8D8E8F8F8E8D8C8B8A8988
            HEX   87868788898A8B8C8D8E8F8F8E8D8C8B
            HEX   8A89888786
L02AFCD     SEP   #$30
            LDX   #$5D
            LDA   #$80
L02AFD3     STAL  $E19D00,X
            INX
            CPX   #$64
            BNE   L02AFD3
            REP   #$30
            RTS

L02AFDF     SEP   #$30
            LDX   #$00
            LDA   L02AFA7
L02AFE6     LDY   L02AFA8,X
            STA   L02AFA8,X
            TYA
            INX
            CPX   #$11
            BNE   L02AFE6
            STA   L02AFA7
            REP   #$30
            JSR   L02AF8E
            RTS

L02AFFB     LDX   #$0000
L02AFFE     LDA   L02B00D,X
            STAL  $E19E00,X
            INX
            INX
            CPX   #$0200
            BNE   L02AFFE
            RTS

L02B00D     HEX   0000DB0EFF0FAA0A0000DB0EFF0FAA0A
            HEX   0000DB0EFF0FAA0A0000DB0EFF0FAA0A
            HEX   00000000FF0FAA0A00000000FF0FAA0A
            HEX   00000000FF0FAA0A00000000FF0FAA0A
            HEX   00001100FF0FAA0A00001100FF0FAA0A
            HEX   00001100FF0FAA0A00001100FF0FAA0A
            HEX   00002200FF0FAA0A00002200FF0FAA0A
            HEX   00002200FF0FAA0A00002200FF0FAA0A
            HEX   00003300FF0FAA0A00003300FF0FAA0A
            HEX   00003300FF0FAA0A00003300FF0FAA0A
            HEX   00004400FF0FAA0A00004400FF0FAA0A
            HEX   00004400FF0FAA0A00004400FF0FAA0A
            HEX   00005500FF0FAA0A00005500FF0FAA0A
            HEX   00005500FF0FAA0A00005500FF0FAA0A
            HEX   00006600FF0FAA0A00006600FF0FAA0A
            HEX   00006600FF0FAA0A00006600FF0FAA0A
            HEX   00007700FF0FAA0A00007700FF0FAA0A
            HEX   00007700FF0FAA0A00007700FF0FAA0A
            HEX   00008800FF0FAA0A00008800FF0FAA0A
            HEX   00008800FF0FAA0A00008800FF0FAA0A
            HEX   00009900FF0FAA0A00009900FF0FAA0A
            HEX   00009900FF0FAA0A00009900FF0FAA0A
            HEX   0000AA00FF0FAA0A0000AA00FF0FAA0A
            HEX   0000AA00FF0FAA0A0000AA00FF0FAA0A
            HEX   0000BB00FF0FAA0A0000BB00FF0FAA0A
            HEX   0000BB00FF0FAA0A0000BB00FF0FAA0A
            HEX   0000CB00FF0FAA0A0000CB00FF0FAA0A
            HEX   0000CB00FF0FAA0A0000CB00FF0FAA0A
            HEX   0000DB00FF0FAA0A0000DB00FF0FAA0A
            HEX   0000DB00FF0FAA0A0000DB00FF0FAA0A
            HEX   0000EB00FF0FAA0A0000EB00FF0FAA0A
            HEX   0000EB00FF0FAA0A0000EB00FF0FAA0A
L02B20D     SEP   #$30
            LDX   #$00
L02B211     LDAL  $E19D5D,X
            STA   L02B239,X
            LDA   #$80
            STAL  $E19D5D,X
            INX
            CPX   #$07
            BNE   L02B211
            REP   #$30
            RTS

L02B226     SEP   #$30
            LDX   #$00
L02B22A     LDA   L02B239,X
            STAL  $E19D5D,X
            INX
            CPX   #$07
            BNE   L02B22A
            REP   #$30
            RTS

L02B239     HEX   00000000000000
L02B240     LDAL  TickCount
            SEC
            SBC   L02B24C
            CMP   L02B24E
            RTS

L02B24C     DW    $0000
L02B24E     DW    $0000
L02B250     STZ   L02B82C
            LDA   L027412
            STA   $3E
            LDA   L027414
            STA   $40
            LDA   [$3E]
            CMP   #$FFFF
            BEQ   L02B26A
            INC   L02B82C
            JSR   L02B6DF
L02B26A     JSR   L020633
            JSR   L02B2C4
            JSR   L02066E
            JSR   L029450
            RTS

L02B277     JSR   L0206DE
            JSR   L0219FA
            _HideMenuBar
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _BeginUpdate
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _EndUpdate
            JSR   L02B39B
            LDA   #L02B39B
            STA   L0218F2
            _WaitCursor
            STZ   L02B82C
            JSR   L028C84
            BCS   L02B2C0
            INC   L02B82C
            JSR   L02B6DF
L02B2C0     JSR   L02B2F8
            RTS

L02B2C4     JSR   L0206DE
            JSR   L0219FA
            _HideMenuBar
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _BeginUpdate
            LDA   L020021+2
            PHA
            LDA   L020021
            PHA
            _EndUpdate
            JSR   L02B39B
            LDA   #L02B39B
            STA   L0218F2
L02B2F8     JSR   L02B454
            _InitCursor
            LDA   #L021AC7
            STA   L0219F8
            LDA   #L02B703
            STA   L02185D
            LDA   L02B82C
            BEQ   L02B316
            JSR   L027290
L02B316     LDA   #$0004
            STA   L02B854
            LDAL  TickCount
            STA   L02B852
            JSR   L02185F
            JSR   L0272AD
            LDA   #L025500
            STA   L02185D
            JSR   L02B499
            JSR   L02AFFB
            JSR   L021A0A
            JSR   L021AAB
            PEA   ^L020034
            PEA   L020034
            _SetCallBack
            _ShowMenuBar
            JSR   L0206DE
            RTS

*L02B353     STR   'v1.1                    Copyright 1989 - 92 Apple Computer, Inc'
L02B353     STR   'v1.1                  Copyright 1989 - 2023 Apple Computer, Inc'

L02B393     DW    $000A
            DW    $0000
            DW    $00C6
            DW    $027F
L02B39B     LDA   #L02B393
            JSR   L021A1A
            JSR   L02A578
            JSR   L02B3D4
            PEA   $0020
            PEA   $00B7
            _MoveTo
            PEA   ^L02B353
            PEA   L02B353
            _DrawString
            LDA   #^L02B82E
            STA   $50
            PHA
            LDA   #L02B82E
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            RTS

L02B3D4     LDA   #L040AE0
            STA   $16
            LDA   L02002D
            STA   $18
            LDA   #$0032
            STA   $2C
            LDAL  L020966
            STA   $1E
            LDA   #$4C90
            STA   $1C
            LDA   #$002E
            STA   $1A
            STA   $2E
            LDA   #$00A0
            STA   $20
            _HideCursor
            JSR   L025501
            LDA   #L04A87A
            STA   $16
            LDA   #$000B
            STA   $2C
            LDA   #$6BDE
            STA   $1C
            LDA   #$0004
            STA   $1A
            STA   $2E
            JSR   L025501
            LDA   #L04A742
            STA   $16
            LDA   #$000D
            STA   $2C
            LDA   #$753E
            STA   $1C
            LDA   #$0018
            STA   $1A
            STA   $2E
            JSR   L025501
            _ShowCursor
            RTS

L02B43E     JSR   L02B846
            BCC   L02B453
            JSR   L02B4AB
            LDA   #$0004
            STA   L02B854
            LDAL  TickCount
            STA   L02B852
L02B453     RTS

L02B454     JSR   L02B4CD
            JSR   L02B45B
            RTS

L02B45B     LDX   #$004C
            JSR   L02B465
            JSR   L02B465
            RTS

L02B465     SEP   #$20
            LDY   #$0000
L02B46A     LDA   L02B47B,Y
            STAL  $E19D00,X
            INX
            INY
            CPY   #$001E
            BNE   L02B46A
            REP   #$20
            RTS

L02B47B     HEX   8182838485868788898A8B8C8D8E8F8F
            HEX   8E8D8C8B8A898887868584838281
L02B499     SEP   #$30
            LDX   #$4C
            LDA   #$80
L02B49F     STAL  $E19D00,X
            INX
            CPX   #$88
            BNE   L02B49F
            REP   #$30
            RTS

L02B4AB     PHB
            PEA   $E1E1
            PLB
            PLB
            SEP   #$30
            LDX   #$4C
            LDA   $9D00,X
L02B4B8     LDY   $9D01,X
            AND   #$8F
            STA   $9D01,X
            TYA
            INX
            CPX   #$87
            BNE   L02B4B8
            STA   $9D4C
            REP   #$30
            PLB
            RTS

L02B4CD     LDX   #$0000
L02B4D0     LDA   L02B4DF,X
            STAL  $E19E00,X
            INX
            INX
            CPX   #$0200
            BNE   L02B4D0
            RTS

L02B4DF     HEX   0000DB0EFF0FAA0A0000DB0EFF0FAA0A
            HEX   0000DB0EFF0FAA0A0000DB0EFF0FAA0A
            HEX   00000B00FF0FAA0A00000B00FF0FAA0A
            HEX   00000B00FF0FAA0A00000B00FF0FAA0A
            HEX   00001B00FF0FAA0A00001B00FF0FAA0A
            HEX   00001B00FF0FAA0A00001B00FF0FAA0A
            HEX   00002B00FF0FAA0A00002B00FF0FAA0A
            HEX   00002B00FF0FAA0A00002B00FF0FAA0A
            HEX   00003B00FF0FAA0A00003B00FF0FAA0A
            HEX   00003B00FF0FAA0A00003B00FF0FAA0A
            HEX   00004B00FF0FAA0A00004B00FF0FAA0A
            HEX   00004B00FF0FAA0A00004B00FF0FAA0A
            HEX   00005B00FF0FAA0A00005B00FF0FAA0A
            HEX   00005B00FF0FAA0A00005B00FF0FAA0A
            HEX   00006B00FF0FAA0A00006B00FF0FAA0A
            HEX   00006B00FF0FAA0A00006B00FF0FAA0A
            HEX   00007B00FF0FAA0A00007B00FF0FAA0A
            HEX   00007B00FF0FAA0A00007B00FF0FAA0A
            HEX   00008B00FF0FAA0A00008B00FF0FAA0A
            HEX   00008B00FF0FAA0A00008B00FF0FAA0A
            HEX   00009B00FF0FAA0A00009B00FF0FAA0A
            HEX   00009B00FF0FAA0A00009B00FF0FAA0A
            HEX   0000AB00FF0FAA0A0000AB00FF0FAA0A
            HEX   0000AB00FF0FAA0A0000AB00FF0FAA0A
            HEX   0000BB00FF0FAA0A0000BB00FF0FAA0A
            HEX   0000BB00FF0FAA0A0000BB00FF0FAA0A
            HEX   0000CB00FF0FAA0A0000CB00FF0FAA0A
            HEX   0000CB00FF0FAA0A0000CB00FF0FAA0A
            HEX   0000DB00FF0FAA0A0000DB00FF0FAA0A
            HEX   0000DB00FF0FAA0A0000DB00FF0FAA0A
            HEX   0000EB00FF0FAA0A0000EB00FF0FAA0A
            HEX   0000EB00FF0FAA0A0000EB00FF0FAA0A

L02B6DF     SEP   #$20
            STZ   $74
            STZ   $75
            REP   #$20
            STZ   L02B7E8
            STZ   L02B7EA
            PEA   ^L02B7B7
            PEA   L02B7B7
            _SetCallBack
            RTS

L02B6FB     LDA   #$0001
            STAL  L02B7E8
            RTL

L02B703     LDA   L02B7EA
            BEQ   L02B716
            JSR   L02B856
            BCS   L02B710
            BRL   L02B758
L02B710     STZ   L02B7EA
            JSR   L027290
L02B716     SEP   #$30
L02B718     LDX   $75
            CPX   $74
            BEQ   L02B756
            LDA   L02B7EC,X
            BMI   L02B741
            REP   #$30
            AND   #$007F
            SEC
            SBC   #$0024
            BCC   L02B736
            CMP   #$003C
            BCS   L02B736
            JSR   L02AA60
L02B736     SEP   #$30
            LDA   $75
            INC
            AND   #$3F
            STA   $75
            BRA   L02B718
L02B741     REP   #$30
            AND   #$007F
            SEC
            SBC   #$0024
            BCC   L02B736
            CMP   #$003C
            BCS   L02B736
            JSR   L02AA75
            BRA   L02B736
L02B756     REP   #$30
L02B758     JSR   L02B43E
            LDA   L02B7E8
            BEQ   L02B776
            STZ   L02B7E8
            JSR   L0272AD
            INC   L02B7EA
            LDA   #$00C8
            STA   L02B864
            LDAL  TickCount
            STA   L02B862
L02B776     RTS

L02B777     PHB
            PHD
            PHK
            PLB
            LDA   L02002B
            TCD
            LDA   $76
            BNE   L02B7B2
            SEP   #$30
            LDY   #$31
            LDA   [$70],Y
            AND   #$F0
            CMP   #$80
            BNE   L02B7A1
            INY
L02B790     LDA   [$70],Y
            ORA   #$80
L02B794     LDX   $74
            STA   L02B7EC,X
            TXA
            INC
            AND   #$3F
            STA   $74
            BRA   L02B7B2
L02B7A1     CMP   #$90
            BNE   L02B7B2
            INY
            INY
            LDA   [$70],Y
            DEY
            CMP   #$00
            BEQ   L02B790
            LDA   [$70],Y
            BRA   L02B794
L02B7B2     REP   #$30
            PLD
            PLB
            RTL

L02B7B7     ADRL  L02B6FB
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  L02B777
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            DB    $6B
L02B7E8     DB    $00
            DB    $00
L02B7EA     DB    $00
            DB    $00
L02B7EC     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02B82C     DB    $00
            DB    $00
L02B82E     DW    $0001
            DA    L02B832
L02B832     DW    $0007
            DW    $0000
            DW    $00A3
            DW    $0214
            DA    L021AD6
            DA    L021AE0
            ADRL  L048AD6
            DA    L021AF3
            DA    L021AEC
L02B846     LDAL  TickCount
            SEC
            SBC   L02B852
            CMP   L02B854
            RTS

L02B852     DW    $0000
L02B854     DW    $0000
L02B856     LDAL  TickCount
            SEC
            SBC   L02B862
            CMP   L02B864
            RTS

L02B862     DW    $0000
L02B864     DW    $0000
L02B866     JSR   L0205B5
            JSR   L0219FA
            LDA   #L02B8F3
            JSR   L021A1A
            PEA   $009C
            PEA   $0064
            _MoveTo
            PEA   $01A0
            PEA   $0064
            _LineTo
            PEA   $00E0
            PEA   $0067
            _MoveTo
            PEA   ^L02B901
            PEA   L02B901
            _DrawString
            PEA   $0140
            PEA   $008B
            _MoveTo
            PEA   ^L02B8FB
            PEA   L02B8FB
            _DrawString
            LDA   #^L02B9B2
            STA   $50
            PHA
            LDA   #L02B9B2
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02B8F3     DW    $001E
            DW    $0074
            DW    $00BC
            DW    $01C8
L02B8FB     STR   'Range'
L02B901     STR   ' Local Keyboard '
L02B912     LDY   #$000C
            LDA   #$000F
            SEC
            SBC   ($00),Y
            PHA
            ASL
            ASL
            ASL
            STA   L022203
            PLA
            INC
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L02B92D     LDA   L022203
            LSR
            LSR
            LSR
            STA   L02B943
            LDA   #$000F
            SEC
            SBC   L02B943
            LDY   #$000C
            STA   ($00),Y
            RTS

L02B943     DW    $0000
L02B945     LDY   #$0010
            LDA   ($00),Y
            CMP   L02B992
            BNE   L02B958
            JSR   L0212E1
            LDA   $00
            STA   L02B994
            RTS

L02B958     JSR   L0212F6
L02B95B     RTS

L02B95C     LDY   #$0010
            LDA   ($00),Y
            CMP   L02B992
            BEQ   L02B95B
            STA   L02B992
            LDA   $00
            PHA
            LDA   L02B994
            STA   $00
            LDX   #$0000
            JSR   L0212F6
            PLA
            STA   $00
            STA   L02B994
            JSR   L0212E1
L02B980     LDA   L02B992
            ASL
            TAX
            LDA   L02B98C,X
            STA   L022201
            RTS

L02B98C     DW    $0024
            DW    $0030
            DW    $003C
L02B992     DW    $0001
L02B994     DW    $0000
L02B996     LDY   #$000C
            LDA   ($00),Y
            STA   L02B9B0
            ASL
            TAX
            LDA   L021563,X
            JSR   L02162B
            RTS

L02B9A7     LDA   L02B9B0
            LDY   #$000C
            STA   ($00),Y
            RTS

L02B9B0     DW    $0020
L02B9B2     DW    $0006
            DA    L02B9C0
            DA    L02B9E9
            DA    L02B9FB
            DA    L02BA0D
            DA    L02BA1F
            DA    L02BA4D
L02B9C0     DW    $0001
            DW    $0000
            DW    $0080
            DW    $00BC
            DW    $0010
            DW    $000E
            DW    $000E
            DA    L02B92D
            DW    $702F
            DW    $658F
            DA    L02B912
            ADRL  L02B9E2
            DW    $00B4
            DW    $00AA
            DW    $0000
            DW    $5500
L02B9E2     STR   'Volume'
L02B9E9     DW    $0005
            DW    $0000
            DW    $0074
            DW    $0114
            DA    L02B95C
            DA    L02B945
            ADRL  L04371A
            DW    $0000
L02B9FB     DW    $0005
            DW    $0000
            DW    $0074
            DW    $013C
            DA    L02B95C
            DA    L02B945
            ADRL  L043722
            DW    $0001
L02BA0D     DW    $0005
            DW    $0000
            DW    $0074
            DW    $0164
            DA    L02B95C
            DA    L02B945
            ADRL  L04372A
            DW    $0002
L02BA1F     DW    $0002
            DW    $0000
            DW    $002F
            DW    $011C
            DW    $0000
            DW    $003F
            DW    $0020
            DA    L02B9A7
            DW    $3DA7
            DW    $401D
            DA    L02B996
            ADRL  L02BA3F
            DW    $00E8
            DW    $004D
            DA    L025500
L02BA3F     STR   'Master Tuning'
L02BA4D     DW    $0007
            DW    $0000
            DW    $00A4
            DW    $015C
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L02BA61     DW    $0000
L02BA63     STR   'Sorry, unable to start MIDI.'
L02BA80     STR   'Make sure that MIDI is set correctly'
L02BAA5     STR   'in the Finder Control Panel.'
L02BAC2     DW    $001B
            DW    $0084
            DW    $009B
            DW    $0228
            MX    %00
L02BACA     JSR   L0205B5
            JSR   L0219FA
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #L02BAC2
            JSR   L021A1A
            PEA   $0100
            PEA   $003B
            _MoveTo
            LDA   $5E
            PHA
            PEA   L02BA63
            _DrawString
            PEA   $0100
            PEA   $0046
            _MoveTo
            LDA   $5E
            PHA
            PEA   L02BA80
            _DrawString
            PEA   $0100
            PEA   $0051
            _MoveTo
            LDA   $5E
            PHA
            PEA   L02BAA5
            _DrawString
            LDA   #$0001
            PHA
            _SetForeColor
            PEA   $0100
            PEA   $0067
            _MoveTo
            LDA   $5E
            PHA
            LDA   L02BA61
            PHA
            _DrawString
            LDA   #$0000
            PHA
            _SetForeColor
            LDA   #^L02BBE0
            STA   $50
            PHA
            LDA   #L02BBE0
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   #L021AC7
            STA   L0219F8
            LDA   #L02BBB1
            STA   L02185D
            _InitCursor
            JSR   L02185F
            LDA   #L02BBB0
            STA   L02185D
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02BB98     JSR   L0212F6
            STZ   L02BBDC
            LDA   #$0028
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDA   $00
            STA   L02BBDE
L02BBB0     RTS

L02BBB1     JSR   L0252C3
            BCC   L02BBDB
            LDA   $00
            PHA
            LDA   L02BBDE
            STA   $00
            LDA   L02BBDC
            BEQ   L02BBCB
            JSR   L0212F6
            STZ   L02BBDC
            BRA   L02BBD1
L02BBCB     JSR   L0212E1
            INC   L02BBDC
L02BBD1     LDAL  TickCount
            STA   L025178
            PLA
            STA   $00
L02BBDB     RTS

L02BBDC     DW    $0000
L02BBDE     DW    $0000
L02BBE0     DW    $0002
            DA    L02BBFA
            DA    L02BBE6
L02BBE6     DW    $0007
            DW    $0000
            DW    $007A
            DW    $01C0
            DA    L021AD6
            DA    L021AE0
            ADRL  L048AD6
            DA    L021AF3
            DA    L021AEC
L02BBFA     DW    $0005
            DW    $0000
            DW    $003E
            DW    $00A8
            DA    L02BBB0
            DA    L02BB98
            ADRL  L048ADE
            DW    $0000
L02BC0C     DW    $001B
            DW    $005A
            DW    $00A7
            DW    $0230
L02BC14     LDA   #$0000
            PHA
            _SetForeColor
            LDA   #L02BC0C
            JSR   L021A1A
            PEA   ^L02BCC1
            PEA   L02BCC1
            PEA   $0126
            PEA   ^L02BCB9
            PEA   L02BCB9
            PEA   $0000
            _LETextBox2
            LDA   #^L02BDEB
            STA   $50
            PHA
            LDA   #L02BDEB
            STA   $4E
            PHA
            PEA   $0000
            JSR   L025483
            LDA   #L02BC8E
            STA   L02185D
            _InitCursor
            JSR   L02185F
            LDA   L021AC3
            BNE   L02BC6E
            LDA   #L02BC8D
            STA   L02185D
            JMP   L02027A

L02BC6E     LDA   #$0001
            STA   L02001B
            RTS

L02BC75     JSR   L0212F6
            STZ   L02BDE7
            LDA   #$0028
            STA   L02517A
            LDAL  TickCount
            STA   L025178
            LDA   $00
            STA   L02BDE9
L02BC8D     RTS

L02BC8E     JSR   L0252C3
            BCC   L02BCB8
            LDA   $00
            PHA
            LDA   L02BDE9
            STA   $00
            LDA   L02BDE7
            BEQ   L02BCA8
            JSR   L0212F6
            STZ   L02BDE7
            BRA   L02BCAE
L02BCA8     JSR   L0212E1
            INC   L02BDE7
L02BCAE     LDAL  TickCount
            STA   L025178
            PLA
            STA   $00
L02BCB8     RTS

L02BCB9     ASC   '-'00
            ASC   "T"
	HEX   0081000A02
L02BCC1     ASC   'synthLAB'
            ASC   "U"
            ASC   's MIDI (Musical Instrument Digital Interface) functions and AppleTalk cannot be used at the same time.  Press '
            ASC   "T"
            ASC   'Continue'
            ASC   "U"
            ASC   ' to run synthLAB with MIDI disabled.  To access the MIDI functions, quit synthLAB, turn off AppleTalk and restart the system.'
	HEX   0D0D0158FCFF
            ASC   'Press '
            ASC   "T"
            ASC   'Quit'
            ASC   "U"
            ASC   ' to exit this program.'

L02BDE7     DW    $0000
L02BDE9     DW    $0000
L02BDEB     DW    $0003
            DA    L02BE1B
            DA    L02BDF3
            DA    L02BE07
L02BDF3     DW    $0007
            DW    $0000
            DW    $0089
            DW    $01C2
            DA    L021AD6
            DA    L021AE0
            ADRL  L04544C
            DA    L021AF3
            DA    L021AEC
L02BE07     DW    $0007
            DW    $0000
            DW    $0089
            DW    $014F
            DA    L021B92
            DA    L021B9C
            ADRL  L045454
            DA    L021BAF
            DA    L021BA8
L02BE1B     DW    $0005
            DW    $0000
            DW    $003E
            DW    $007E
            DA    L02BC8D
            DA    L02BC75
            ADRL  L048ADE
            DW    $0000
L02BE2D     JSR   L0205B5
            JSR   L0219FA
            LDA   #L02BE6C
            JSR   L021A1A
            LDA   #^L02BF3C
            STA   $50
            PHA
            LDA   #L02BF3C
            STA   $4E
            PHA
            PEA   $0000
            _HideCursor
            JSR   L025483
            _ShowCursor
            LDA   #L021B42
            STA   L0219F8
            JSR   L02185F
            JSR   L0205F4
            JSR   L021A0A
            JSR   L021AAB
            RTS

L02BE6C     DW    $0012
            DW    $0000
            DW    $00C7
            DW    $027F
L02BE74     JSR   L02BED0
            BCS   L02BEA2
            LDA   L02BF14
            BEQ   L02BE8F
            LDA   $00
            PHA
            LDX   L02BF12
            LDA   L02BF16,X
            STA   $00
            JSR   L0212F6
            PLA
            STA   $00
L02BE8F     JSR   L0212E1
            LDX   L02BF12
            LDA   $00
            STA   L02BF16,X
            LDA   L02BF10
            STA   L021109,X
            BRA   L02BEAB
L02BEA2     JSR   L0212F6
            LDX   L02BF12
            STZ   L021109,X
L02BEAB     LDA   L02BF36
            PHA
            LDA   L021109,X
            PHA
            _SetTrackOut
            RTS

L02BEBB     JSR   L02BED0
            BCS   L02BEC4
            JSR   L0212F6
            RTS

L02BEC4     JSR   L0212E1
            LDX   L02BF12
            LDA   $00
            STA   L02BF16,X
            RTS

L02BED0     LDY   #$0010
            LDA   ($00),Y
            BMI   L02BEF2
            STA   L02BF36
            ASL
            TAX
            LDA   L021109,X
            STA   L02BF14
            STX   L02BF12
            LDA   #$0001
            STA   L02BF10
            AND   L02BF14
            BEQ   L02BF0E
L02BEF0     SEC
            RTS

L02BEF2     AND   #$0007
            STA   L02BF36
            ASL
            TAX
            LDA   L021109,X
            STA   L02BF14
            STX   L02BF12
            LDA   #$0002
            STA   L02BF10
            AND   L02BF14
            BNE   L02BEF0
L02BF0E     CLC
            RTS

L02BF10     DW    $0000
L02BF12     DW    $0000
L02BF14     DW    $0000
L02BF16     DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000
L02BF36     DW    $0000
L02BF38     JSR   L0212F6
            RTS

L02BF3C     DW    $001A
            DA    L02BF72
            DA    L02BF84
            DA    L02BF96
            DA    L02BFA8
            DA    L02BFBA
            DA    L02BFCC
            DA    L02BFDE
            DA    L02BFF0
            DA    L02C002
            DA    L02C014
            DA    L02C026
            DA    L02C038
            DA    L02C04A
            DA    L02C05C
            DA    L02C06E
            DA    L02C080
            DA    L02C0A6
            DA    L02C0B8
            DA    L02C0CA
            DA    L02C0DC
            DA    L02C0EE
            DA    L02C100
            DA    L02C112
            DA    L02C124
            DA    L02C136
            DA    L02C092
L02BF72     DW    $0005
            DW    $0000
            DW    $0030
            DW    $0020
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0000
L02BF84     DW    $0005
            DW    $0000
            DW    $0030
            DW    $00A0
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8000
L02BF96     DW    $0005
            DW    $0000
            DW    $0050
            DW    $0020
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0001
L02BFA8     DW    $0005
            DW    $0000
            DW    $0050
            DW    $00A0
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8001
L02BFBA     DW    $0005
            DW    $0000
            DW    $0070
            DW    $0020
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0002
L02BFCC     DW    $0005
            DW    $0000
            DW    $0070
            DW    $00A0
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8002
L02BFDE     DW    $0005
            DW    $0000
            DW    $0090
            DW    $0020
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0003
L02BFF0     DW    $0005
            DW    $0000
            DW    $0090
            DW    $00A0
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8003
L02C002     DW    $0005
            DW    $0000
            DW    $0030
            DW    $0180
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0004
L02C014     DW    $0005
            DW    $0000
            DW    $0030
            DW    $0200
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8004
L02C026     DW    $0005
            DW    $0000
            DW    $0050
            DW    $0180
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0005
L02C038     DW    $0005
            DW    $0000
            DW    $0050
            DW    $0200
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8005
L02C04A     DW    $0005
            DW    $0000
            DW    $0070
            DW    $0180
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0006
L02C05C     DW    $0005
            DW    $0000
            DW    $0070
            DW    $0200
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8006
L02C06E     DW    $0005
            DW    $0000
            DW    $0090
            DW    $0180
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB1F
            DW    $0007
L02C080     DW    $0005
            DW    $0000
            DW    $0090
            DW    $0200
            DA    L02BE74
            DA    L02BEBB
            ADRL  L04AB27
            DW    $8007
L02C092     DW    $0007
            DW    $0000
            DW    $00B0
            DW    $021C
            DA    L021B51
            DA    L021B5B
            ADRL  L049452
            DA    L021B6E
            DA    L021B67
L02C0A6     DW    $0005
            DW    $0000
            DW    $001F
            DW    $011C
            DA    L025500
            DA    L02BF38
            ADRL  L04B3EF
            DW    $0000
L02C0B8     DW    $0005
            DW    $0000
            DW    $0036
            DW    $0110
            DA    L025500
            DA    L02BF38
            ADRL  L04B3F5
            DW    $0000
L02C0CA     DW    $0005
            DW    $0000
            DW    $0056
            DW    $0110
            DA    L025500
            DA    L02BF38
            ADRL  L04B3FB
            DW    $0000
L02C0DC     DW    $0005
            DW    $0000
            DW    $0076
            DW    $0110
            DA    L025500
            DA    L02BF38
            ADRL  L04B401
            DW    $0000
L02C0EE     DW    $0005
            DW    $0000
            DW    $0096
            DW    $0110
            DA    L025500
            DA    L02BF38
            ADRL  L04B407
            DW    $0000
L02C100     DW    $0005
            DW    $0000
            DW    $0036
            DW    $0160
            DA    L025500
            DA    L02BF38
            ADRL  L04B40D
            DW    $0000
L02C112     DW    $0005
            DW    $0000
            DW    $0056
            DW    $0160
            DA    L025500
            DA    L02BF38
            ADRL  L04B413
            DW    $0000
L02C124     DW    $0005
            DW    $0000
            DW    $0076
            DW    $0160
            DA    L025500
            DA    L02BF38
            ADRL  L04B419
            DW    $0000
L02C136     DW    $0005
            DW    $0000
            DW    $0096
            DW    $0160
            DA    L025500
            DA    L02BF38
            ADRL  L04B41F
            DW    $0000
