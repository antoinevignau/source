*
* Memory Use
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	Memory.Use.l

GSOS	EQU	$E100A8

*------------------------------

	use	4/Ctl.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------

            ADRL  openROUTINE	; Open routine
            ADRL  closeROUTINE	; Close routine
            ADRL  actionROUTINE	; Action routine
            ADRL  initROUTINE	; Init routine
            DW    $003C       ; Period
            DW    $FFFF       ; Event mask
L0014       ASC   '##Memory Use\H**'00

*------------------------------

openROUTINE PHB
            PHK
            PLB
            LDA   L054B
            BEQ   L0030
            BRL   L01F9
L0030       PHA
            PHA
            _GetCursorAdr
            PLA
            STA   L0238
            PLA
            STA   L0238+2
            _WaitCursor
            PHA
            PHA
            _TotalMem
            PLA
            STA   L03D9
            PLA
            STA   L03D9+2
            STZ   L03DD
            PEA   $0000
            _GetCurResourceApp
            PLA
            STA   L0236
            PHA
            _MMStartUp
            PLA
            STA   L054D
            LDA   L054D
            PHA
            _ResourceStartUp
            BCC   L0086
            BRL   L01FB
L0086       PEA   $0000
            PEA   $0000
            LDA   L054D
            PHA
            PEA   $0001
            _LGetPathname2
            PLA
            STA   L0232
            PLA
            STA   L0232+2
            BCC   L00A7
            BRL   L01FB
L00A7       JSL   GSOS
            DW    $201B       ; GetLevel
            ADRL  L023E
            JSL   GSOS
            DW    $201A       ; SetLevel
            ADRL  L0242
            JSL   GSOS
            DW    $200F       ; GetSysPrefs
            ADRL  L0246
            LDA   L0248
            AND   #$7FFF
            ORA   #$8000
            STA   L024C
            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  L024A
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            LDA   L0232+2
            PHA
            LDA   L0232
            PHA
            _OpenResourceFile
            PLA
            STA   L054F
            BCC   L00FF
            BRL   L0206
L00FF       PEA   $0000
            PEA   $0000
            PEA   ^L0553
            PEA   L0553
            PEA   $0000
            PEA   $0000
            PEA   ^L03DF
            PEA   L03DF
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $800E
            _NewWindow2
            PLX
            PLA
            BCC   L0137
            BRL   L0206
L0137       STX   L0563
            STA   L0563+2
            STA   $07,S
            TXA
            STA   $05,S
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _SetPort
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _SetSysWindow
            PHA
            _GetMasterSCB
            PLA
            AND   #$0080
            BNE   L0171
            BRL   L0195
L0171       PEA   ^L0571
            PEA   L0571
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _SetFrameColor
            LDA   #^L046C
            STA   L0428+2
            LDA   #L046C
            STA   L0428
            BRL   L01B6
L0195       PEA   ^L0567
            PEA   L0567
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _SetFrameColor
            LDA   #^L044C
            STA   L0428+2
            LDA   #L044C
            STA   L0428
L01B6       LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _ShowWindow
            LDA   #$FFFF
            STA   L054B
L01CB       JSL   GSOS
            DW    $201A       ; SetLevel
            ADRL  L023E
            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  L0246
L01DF       LDA   L0236
            PHA
            _SetCurResourceApp
            LDA   L0238+2
            PHA
            LDA   L0238
            PHA
            _SetCursor
L01F9       PLB
            RTL

L01FB       LDA   #L0504
            LDY   #^L0504
            JSR   L048C
            BRA   L01DF
L0206       LDA   #L051F
            LDY   #^L051F
            JSR   L048C
            BRA   L01CB
            LDA   #L0533
            LDY   #^L0533
            JSR   L048C
            LDA   #$0000
            STA   $07,S
            STA   $05,S
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _CloseWindow
            BRA   L01CB

L0232       ADRL  $00000000
L0236       DW    $0000
L0238       ADRL  $00000000
            DW    $0000
L023E       DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num
L0242       DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num
L0246       DW    $0001       ; Parms for SetSysPrefs
L0248       DW    $0000       ;  preferences
L024A       DW    $0001       ; Parms for SetSysPrefs
L024C       DW    $0000       ;  preferences

*------------------------------

initROUTINE
            PHB
            PHK
            PLB
            CMP   #$0000
            BNE   L0258
            PLB
            RTL

L0258       STZ   L054B
            LDA   #$0000
            LDY   #$0014
            STA   L058B
            STA   L058B+2
L0267       STA   L0593,Y
            DEY
            DEY
            BPL   L0267
            LDA   #$FFFF
            STA   L058F
            LDA   #$001F
            STA   L058F+2
            PLB
            RTL

*------------------------------

closeROUTINE
            PHB
            PHK
            PLB
            LDA   L054B
            BEQ   L02B3
            STZ   L054B
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _CloseWindow
            LDA   L054F
            PHA
            _CloseResourceFile
            LDA   L054D
            PHA
            _SetCurResourceApp
            _ResourceShutDown
L02B3       PLB
            RTL

*------------------------------

actionROUTINE
            PHB
            PHK
            PLB
            PHA
            PHY
            PHX
            PEA   ^L057B
            PEA   L057B
            PEA   $0000
            PEA   $0010
            _BlockMove
            PLA
            ASL
            TAX
            JSR   (L02D6,X)
            PLB
            RTL

L02D6       DA    L02EA
            DA    L02EE
            DA    L0306
            DA    L02EA
            DA    L02EA
            DA    L02EA
            DA    L02EA
            DA    L02EA
            DA    L02EA
            DA    L02EA
L02EA       LDA   #$FFFF
            RTS

L02EE       PEA   $0000
            PEA   $FFFF
            PEA   ^L057B
            PEA   L057B
            _TaskMasterDA
            PLA
            LDA   #$0000
            RTS

L0306       PHA
            PHA
            _GetPort
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _SetPort
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _RealFreeMem
            PEA   $0000
            PEA   $0064
            _LongMul
            PLA
            STA   L03D5
            PLA
            STA   L03D5+2
            PLA
            PLA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L03D5+2
            PHA
            LDA   L03D5
            PHA
            LDA   L03D9+2
            PHA
            LDA   L03D9
            PHA
            _LongDivide
            PLA
            STA   L03D5
            PLA
            STA   L03D5+2
            PLA
            PLA
            LDA   #$0064
            SEC
            SBC   L03D5
            CMP   #$0064
            BCC   L038A
            LDA   #$0064
L038A       CLC
            ADC   L041A
            CMP   L03DD
            BEQ   L03CA
            STA   L041E
            STA   L03DD
            STA   L0422
            LDA   #$006A
            STA   L0426
            PEA   ^L0418
            PEA   L0418
            LDA   L0428+2
            PHA
            LDA   L0428
            PHA
            _FillRect
            PEA   ^L0420
            PEA   L0420
            PEA   ^L042C
            PEA   L042C
            _FillRect
L03CA       LDA   #$0000
            _SetPort
            RTS

L03D5       ADRL  $00000000
L03D9       ADRL  $00000000
L03DD       DW    $0000

*------------------------------

L03DF       PHB
            PHK
            PLB
            LDA   L0563+2
            PHA
            LDA   L0563
            PHA
            _DrawControls
            PEA   $0000
            _SetSolidPenPat
            PEA   ^L0410
            PEA   L0410
            _FrameRect
            STZ   L03DD
            JSR   L0306
            PLB
            RTL

L0410       DW    $0003
            DW    $0007
            DW    $000C
            DW    $006C
L0418       DW    $0004
L041A       DW    $0008
            DW    $000B
L041E       DW    $006A
L0420       DW    $0004
L0422       DW    $0008
            DW    $000B
L0426       DW    $006A
L0428       ADRL  L044C

L042C       HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L044C       HEX   77777777777777777777777777777777
            HEX   77777777777777777777777777777777
L046C       HEX   44444444444444444444444444444444
            HEX   44444444444444444444444444444444

*------------------------------

L048C       STA   L04C3
            STY   L04C3+2
            PEA   $0000
            PEA   ^L04C7
            PEA   L04C7
            LDA   L04C3+2
            PHA
            LDA   L04C3
            PHA
            PEA   ^L04E8
            PEA   L04E8
            PEA   ^L0502
            PEA   L0502
            _TLTextMountVolume
            PLA
            LDA   L0014+$E
            PHA
            _DisableMItem
            RTS

*------------------------------

L04C3       ADRL  $00000000
L04C7       STR   'Memory Use:Fatal Error Occurred.'
L04E8       STR   'Press RETURN to continue.'
L0502       STR   ' '
L0504       STR   'Cannot open Resource Fork.'
L051F       STR   'Cannot open window.'
L0533       STR   'Cannot access controls.'
L054B       DW    $0000
L054D       DW    $0000
L054F       DW    $0000
            DW    $0000
L0553       STR   ' Memory Use... '
L0563       ADRL  $00000000
L0567       DW    $0000
            DW    $0F04
            DW    $024F
            DW    $F0FF
            DW    $00F0
L0571       DW    $0000
            DW    $0F01
            DW    $021F
            DW    $F0FF
            DW    $00F0
L057B       DW    $0000       ; event code
            ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
            DW    $0000       ; mouse location
            DW    $0000
            DW    $0000       ; modifiers
L058B       ADRL  $00000000   ; task data
L058F       ADRL  $001FFFFF   ; task mask
L0593       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

