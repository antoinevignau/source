*
* Memory Use
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	CPU.Use.l

GSOS	EQU	$E100A8

*------------------------------

	use	4/Ctl.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
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
            DW    $0000       ; Period
            DW    $FFFF       ; Event mask
L0014       ASC   '##CPU Use\H**'00

*------------------------------

openROUTINE
            PHB
            PHK
            PLB
            LDA   L0516
            BEQ   L002D
            BRL   L01F5
L002D       PHA
            PHA
            _GetCursorAdr
            PLA
            STA   L0234
            PLA
            STA   L0234+2
            _WaitCursor
            STZ   L03AE
            PEA   $0000
            _GetCurResourceApp
            PLA
            STA   L0232
            PHA
            _MMStartUp
            PLA
            STA   L0518
            LDA   L0518
            PHA
            _ResourceStartUp
            BCC   L0072
            BRL   L01F7
L0072       PEA   $0000
            PEA   $0000
            LDA   L0518
            PHA
            PEA   $0001
            _LGetPathname2
            PLA
            STA   L022E
            PLA
            STA   L022E+2
            BCC   L0093
            BRL   L01F7
L0093       JSL   GSOS
            DW    $201B       ; GetLevel
            ADRL  L023A
            JSL   GSOS
            DW    $201A       ; SetLevel
            ADRL  L023E
            JSL   GSOS
            DW    $200F       ; GetSysPrefs
            ADRL  L0242
            LDA   L0244
            AND   #$7FFF
            ORA   #$8000
            STA   L0248
            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  L0246
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            LDA   L022E+2
            PHA
            LDA   L022E
            PHA
            _OpenResourceFile
            PLA
            STA   L051A
            BCC   L00EB
            BRL   L0202
L00EB       PEA   $0000
            PEA   $0000
            PEA   ^L051C
            PEA   L051C
            PEA   $0000
            PEA   $0000
            PEA   ^L03B0
            PEA   L03B0
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $800E
            _NewWindow2
            PLX
            PLA
            BCC   L0123
            BRL   L0202
L0123       STX   L0529
            STA   L0529+2
            STA   $07,S
            TXA
            STA   $05,S
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _SetPort
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _SetSysWindow
            PHA
            _GetMasterSCB
            PLA
            AND   #$0080
            BNE   L015D
            BRL   L0181
L015D       PEA   ^L0537
            PEA   L0537
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _SetFrameColor
            LDA   #^L043A
            STA   L03F6+2
            LDA   #L043A
            STA   L03F6
            BRL   L01A2
L0181       PEA   ^L052D
            PEA   L052D
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _SetFrameColor
            LDA   #^L041A
            STA   L03F6+2
            LDA   #L041A
            STA   L03F6
L01A2       LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _ShowWindow
            LDA   #$FFFF
            STA   L0516
L01B7       JSL   GSOS
            DW    $201A       ; SetLevel
            ADRL  L023A
            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  L0242
L01CB       LDA   L0232
            PHA
            _SetCurResourceApp
            PEA   ^L056F
            PEA   L056F
            _SetHeartBeat
            DEC   L0269
            LDA   L0234+2
            PHA
            LDA   L0234
            PHA
            _SetCursor
L01F5       PLB
            RTL

L01F7       LDA   #L04CF
            LDY   #^L04CF
            JSR   L045A
            BRA   L01CB
L0202       LDA   #L04EA
            LDY   #^L04EA
            JSR   L045A
            BRA   L01B7
            LDA   #L04FE
            LDY   #^L04FE
            JSR   L045A
            LDA   #$0000
            STA   $07,S
            STA   $05,S
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _CloseWindow
            BRA   L01B7
L022E       ADRL  $00000000
L0232       DW    $0000
L0234       ADRL  $00000000
            DW    $0000
L023A       DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num
L023E       DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num
L0242       DW    $0001       ; Parms for SetSysPrefs
L0244       DW    $0000       ;  preferences
L0246       DW    $0001       ; Parms for SetSysPrefs
L0248       DW    $0000       ;  preferences

*------------------------------

initROUTINE
            PHB
            PHK
            PLB
            CMP   #$0000
            BNE   L026B
            LDA   L0269
            BEQ   L0267
            PEA   ^L056F
            PEA   L056F
            _DelHeartBeat
            STZ   L0269
L0267       PLB
            RTL

L0269       BRK   $00
L026B       STZ   L0516
            LDA   #$0000
            LDY   #$0014
            STA   L0551
            STA   L0551+2
L027A       STA   L0559,Y
            DEY
            DEY
            BPL   L027A
            LDA   #$FFFF
            STA   L0555
            LDA   #$001F
            STA   L0555+2
            PLB
            RTL

*------------------------------

closeROUTINE
            PHB
            PHK
            PLB
            LDA   L0516
            BEQ   L02DB
            LDA   L0269
            BEQ   L02AC
            PEA   ^L056F
            PEA   L056F
            _DelHeartBeat
            STZ   L0269
L02AC       STZ   L0516
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _CloseWindow
            LDA   L051A
            PHA
            _CloseResourceFile
            LDA   L0518
            PHA
            _SetCurResourceApp
            _ResourceShutDown
L02DB       PLB
            RTL

*------------------------------

actionROUTINE
            PHB
            PHK
            PLB
            PHA
            PHY
            PHX
            PEA   ^L0541
            PEA   L0541
            PEA   $0000
            PEA   $0010
            _BlockMove
            PLA
            ASL
            TAX
            JSR   (L02FE,X)
            PLB
            RTL

L02FE       DA    L0312
            DA    L0316
            DA    L032E
            DA    L0312
            DA    L0312
            DA    L0312
            DA    L0312
            DA    L0312
            DA    L0312
            DA    L0312
L0312       LDA   #$FFFF
            RTS

L0316       PEA   $0000
            PEA   $FFFF
            PEA   ^L0541
            PEA   L0541
            _TaskMasterDA
            PLA
            LDA   #$0000
            RTS

L032E       INC   L03AE
            RTS

L0332       PHA
            PHA
            _GetPort
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _SetPort
            LDA   L03AE
            ASL
            CMP   #$0064
            BCC   L0356
            LDA   #$0064
L0356       STA   L03A8
            LDA   #$0064
            SEC
            SBC   L03A8
            CLC
            ADC   L03E8
            CMP   L03AC
            BEQ   L03A0
            STA   L03EC
            STA   L03AC
            STA   L03F0
            LDA   #$006B
            STA   L03F4
            PEA   ^L03E6
            PEA   L03E6
            LDA   L03F6+2
            PHA
            LDA   L03F6
            PHA
            _FillRect
            PEA   ^L03EE
            PEA   L03EE
            PEA   ^L03FA
            PEA   L03FA
            _FillRect
L03A0       _SetPort
            RTS

L03A8       DW    $0000
            DW    $0000
L03AC       DW    $0000
L03AE       DW    $0000

L03B0       PHB
            PHK
            PLB
            LDA   L0529+2
            PHA
            LDA   L0529
            PHA
            _DrawControls
            PEA   $0000
            _SetSolidPenPat
            PEA   ^L03DE
            PEA   L03DE
            _FrameRect
            JSR   L0332
            PLB
            RTL

L03DE       DW    $0003
            DW    $0007
            DW    $000C
            DW    $006D
L03E6       DW    $0004
L03E8       DW    $0008
            DW    $000B
L03EC       DW    $006A
L03EE       DW    $0004
L03F0       DW    $0008
            DW    $000B
L03F4       DW    $006A
L03F6       ADRL  L041A
L03FA       HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L041A       HEX   77777777777777777777777777777777
            HEX   77777777777777777777777777777777
L043A       HEX   44444444444444444444444444444444
            HEX   44444444444444444444444444444444

*------------------------------

L045A       STA   L0491
            STY   L0491+2
            PEA   $0000
            PEA   ^L0495
            PEA   L0495
            LDA   L0491+2
            PHA
            LDA   L0491
            PHA
            PEA   ^L04B3
            PEA   L04B3
            PEA   ^L04CD
            PEA   L04CD
            _TLTextMountVolume
            PLA
            LDA   L0014+$B
            PHA
            _DisableMItem
            RTS

L0491       ADRL  $00000000
L0495       STR   'CPU Use:Fatal Error Occurred.'
L04B3       STR   'Press RETURN to continue.'
L04CD       STR   ' '
L04CF       STR   'Cannot open Resource Fork.'
L04EA       STR   'Cannot open window.'
L04FE       STR   'Cannot access controls.'
L0516       DW    $0000
L0518       DW    $0000
L051A       DW    $0000
L051C       STR   ' CPU Use... '
L0529       ADRL  $00000000
L052D       DW    $0000
            DW    $0F04
            DW    $024F
            DW    $F0FF
            DW    $00F0
L0537       DW    $0000
            DW    $0F01
            DW    $021F
            DW    $F0FF
            DW    $00F0
L0541       DW    $0000       ; event code
            ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
            DW    $0000       ; mouse location
            DW    $0000
            DW    $0000       ; modifiers
L0551       ADRL  $00000000   ; task data
L0555       ADRL  $001FFFFF   ; task mask
L0559       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

*------------------------------

L056F       ADRL  $00000000
L0573       DW    $001E
            DW    $A55A
            REP   #$30
            LDAL  $E100FF
            BEQ   L0584
            LDA   #$0001
            BRA   L0595
L0584       PHB
            PHK
            PLB
            JSR   L0332
            PLB
            LDA   #$0000
            STAL  L03AE
            LDA   #$001E
L0595       STAL  L0573
            SEP   #$30
            RTL


