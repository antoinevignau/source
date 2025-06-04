*
* Xtra Sounds v1.0
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	PIF
	dsk	XtraSounds.l

GSOS	EQU	$E100A8

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

            PHB
            PHK
            PLB
            PHA
            _QDVersion
            PLA
            AND   #$0FFF
            CMP   #$0307
            BCC   L0062
            PEA   ^L0744
            PEA   L0744
            PEA   ^L0773
            PEA   L0773
            _ShowBootInfo
            PEA   ^L0761
            PEA   L0761
            PHA
            _MMStartUp
            PLA
            STA   L069F
            PHA
            PEA   ^L0064
            PEA   L0064
            _AcceptRequests
            STZ   L06A1
            STZ   L06A1+2
            STZ   L06A5
            STZ   L06A5+2
            STZ   L06A9
            STZ   L06A9+2
            STZ   L06AD
            STZ   L06AD+2
            JSR   L053F
L0062       PLB
            RTL

L0064       PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0107
            BEQ   L0084
            LDX   #$0012
L0071       CMPL  L0093,X
            BEQ   L007D
            DEX
            DEX
            BPL   L0071
            BRA   L0084
L007D       PHB
            PHK
            PLB
            JSR   (L00A7,X)
            PLB
L0084       PLD
            LDA   $02,S
            STA   $0C,S
            LDA   $01,S
            STA   $0B,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

L0093       DW    $8001
            DW    $8000
            DW    $0100
            DW    $0101
            DW    $0003
            DW    $0108
            DW    $0109
            DW    $0106
            DW    $0104
            DW    $0103
L00A7       DA    L01FE
            DA    L0221
            DA    L00C1
            DA    L00C9
            DA    L01BA
            DA    L00D1
            DA    L01FA
            DA    L01FA
            DA    L01EC
            DA    L01F2
L00BB       LDA   #$8000
            STA   $10
L00C0       RTS

L00C1       JSR   L02F3
            JSR   L03DA
            BRA   L00BB
L00C9       JSR   L02F3
            JSR   L03FE
            BRA   L00BB
L00D1       LDA   $0A
            CMP   L06C9
            BNE   L00C0
            PEA   $0000
            _GetCurResourceApp
            LDA   L069F
            PHA
            _ResourceStartUp
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L069F
            PHA
            PEA   $0001
            _LGetPathname2
            _OpenResourceFile
            PLA
            BCS   L0181
            _WaitCursor
            PHD
            PEA   $0000
            PEA   $0000
            _GetCodeResConverter
            PEA   $8017
            PEA   $0001
            _ResourceConverter
            PEA   $0000
            PEA   $0000
            PEA   $8017
            PEA   $0000
            PEA   $0001
            _LoadResource
            BCS   L0199
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            SEP   #$20
            STA   L016A+3
            REP   #$20
            LDA   [$01]
            STA   L016A+1
            PLA
            PLA
            PLD
            LDA   L069F
L016A       JSL   $000000
            PEA   $0003
            PEA   $8017
            PEA   $0000
            PEA   $0001
            _ReleaseResource
L0181       _ResourceShutDown
            _SetCurResourceApp
            _InitCursor
            BRL   L00BB
L0199       PLX
            PLX
            PLD
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHA
            _InitCursor
            _ErrorWindow
            PLA
            BRA   L0181
L01BA       LDA   L06A1
            ORA   L06A1+2
            BEQ   L01D7
            LDA   L06A1+2
            PHA
            LDA   L06A1
            PHA
            _DisposeHandle
            STZ   L06A1+2
            STZ   L06A1
L01D7       LDY   #$0002
            LDA   L069F
            STA   [$06],Y
            INY
            INY
            LDA   #$0000
            STA   [$06],Y
            LDA   #$8000
            STA   $10
            RTS

L01EC       JSR   L0256
            BCC   L01FA
            RTS

L01F2       LDY   #$0002
            LDA   [$0A],Y
            ORA   #$2000
L01FA       JSR   L02F3
            RTS

L01FE       LDY   #$0008
            LDA   L06A9+2
            STA   [$06],Y
            DEY
            DEY
            LDA   L06A9
            STA   [$06],Y
            DEY
            DEY
            LDA   L06A5+2
            STA   [$06],Y
            DEY
            DEY
            LDA   L06A5
            STA   [$06],Y
L021B       LDA   #$8000
            STA   $10
            RTS

L0221       LDA   L06A1
            ORA   L06A1+2
            BEQ   L0250
            LDA   L06A1+2
            PHA
            LDA   L06A1
            PHA
            _DisposeHandle
            STZ   L06A1
            STZ   L06A1+2
            STZ   L06A5
            STZ   L06A5+2
            STZ   L06A9
            STZ   L06A9+2
            STZ   L06AD
            STZ   L06AD+2
L0250       JSR   L053F
            BRA   L021B
            RTS

L0256       LDA   L06A9
            STA   L02EF
            LDA   L06A9+2
            STA   L02EF+2
            BNE   L026A
            LDA   L02EF
            BNE   L026A
            RTS

L026A       PHD
            LDY   #$0004
            LDA   [$0A],Y
            PHA
            DEY
            DEY
            LDA   [$0A],Y
            PHA
            LDA   L02EF+2
            PHA
            LDA   L02EF
            PHA
            TSC
            TCD
            LDA   [$01]
            BEQ   L02DD
            STA   L02EB
            LDA   $01
            CLC
            ADC   #$0004
            STA   $01
            BCC   L0293
            INC   $03
L0293       LDA   [$05]
            CMP   [$01]
            BNE   L02C3
            TAY
L029A       LDA   [$01],Y
            AND   #$005F
            STA   L02ED
            LDA   [$05],Y
            AND   #$005F
            CMP   L02ED
            BNE   L02C3
            DEY
            DEY
            CPY   #$0002
            BCS   L029A
            LDA   $01
            SEC
            SBC   #$0002
            STA   $01
            BCS   L02BF
            DEC   $03
L02BF       LDA   [$01]
            BRA   L02E4
L02C3       LDA   [$01]
            LDX   $03
            CLC
            ADC   #$0004
            BCC   L02CE
            INX
L02CE       CLC
            ADC   $01
            STA   $01
            BCC   L02D6
            INX
L02D6       STX   $03
            DEC   L02EB
            BNE   L0293
L02DD       PLA
            PLA
            PLA
            PLA
            PLD
            SEC
            RTS

L02E4       PLY
            PLY
            PLY
            PLY
            PLD
            CLC
            RTS

L02EB       DW    $0000
L02ED       DW    $0000
L02EF       ADRL  $00000000
L02F3       STA   L03C8
            LDA   L06A1
            ORA   L06A1+2
            BNE   L02FF
            RTS

L02FF       PHD
            LDA   L06A5+2
            PHA
            LDA   L06A5
            PHA
            TSC
            TCD
            LDA   [$01]
            BEQ   L0344
            STA   L03C6
            LDA   $01
            CLC
            ADC   #$0002
            STA   $01
            BCC   L031D
            INC   $03
L031D       LDA   [$01]
            CMP   L03C8
            BEQ   L0348
            LDY   #$0002
            LDA   [$01],Y
            AND   #$00FF
            CLC
            ADC   #$0003
            STA   L03CA
            LDA   $01
            CLC
            ADC   L03CA
            STA   $01
            BCC   L033F
            INC   $03
L033F       DEC   L03C6
            BNE   L031D
L0344       PLA
            PLA
            PLD
            RTS

L0348       PLA
            PLX
            PLD
            CLC
            ADC   #$0002
            BCC   L0352
            INX
L0352       STA   L03BA
            STX   L03BA+2
            PEA   $0004
            PEA   $8000
            PEA   $0000
            PEA   $0000
            LDA   L03BA+2
            PHA
            LDA   L03BA
            PHA
            PEA   ^L03BE
            PEA   L03BE
            STZ   L03BE
            _SendRequest
            BCS   L03B9
            LDA   L03BE
            BEQ   L03B9
            PEA   $0006
            PEA   $8000
            PEA   $0000
            PEA   $0000
            LDA   L03C0+2
            PHA
            LDA   L03C0
            PHA
            PEA   ^L03CC
            PEA   L03CC
            _SendRequest
            LDA   L03C4
            ASL
            BCC   L03B9
            LDA   L03C0+2
            PHA
            LDA   L03C0
            PHA
            _DisposeHandle
L03B9       RTS

L03BA       ADRL  $00000000
L03BE       DW    $0000
L03C0       ADRL  $00000000
L03C4       DW    $0000
L03C6       DW    $0000
L03C8       DW    $0000
L03CA       DW    $0000
L03CC       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03DA       PHB
            PHK
            PLB
            PEA   $800F
            PEA   $0001
            PEA   ^L06B3
            PEA   L06B3
            PEA   ^L06CD
            PEA   L06CD
            PEA   ^L06C5
            PEA   L06C5
            _SendRequest
            PLB
            RTS

L03FE       PHB
            PHK
            PLB
            PEA   $8014
            PEA   $0001
            PEA   ^L06B3
            PEA   L06B3
            PEA   $0000
            LDA   L06C9
            PHA
            PEA   ^L06C1
            PEA   L06C1
            _SendRequest
            STZ   L06C9
            PLB
            RTS

L0426       LDA   #L0689
            STA   L0669
            STA   L0661
            LDA   #^L0689
            STA   L066B
            STA   L0661+2
            RTS

L0439       PHD
            PEA   $0000
            PEA   $0000
            LDA   L069F
            PHA
            PEA   $0001
            _LGetPathname2
            TSC
            TCD
            LDA   [$01]
            STA   L050B
            CLC
            ADC   #$000E
            STA   L050F
            PLA
            STA   L0507
            PLA
            STA   L0507+2
            PLD
            BCS   L04AE
            PHA
            PHA
            LDA   L050F+2
            PHA
            LDA   L050F
            PHA
            LDA   L069F
            PHA
            PEA   $C018
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   L069B
            PLA
            STA   L069B+2
            BCS   L04AE
            LDA   L0507+2
            PHA
            LDA   L0507
            PHA
            LDA   L069B+2
            PHA
            LDA   L069B
            PHA
            LDA   L050B+2
            PHA
            LDA   L050B
            PHA
            _PtrToHand
L04AE       BCS   L04FF
            PHD
            LDA   L069B+2
            PHA
            LDA   L069B
            PHA
            TSC
            TCD
            LDA   [$01]
            TAX
            LDY   #$0002
            LDA   [$01],Y
            PLY
            PLY
            STA   L066B
            STA   L0661+2
            STX   L0669
            STX   L0661
            PHA
            PHX
            LDA   [$01]
            TAY
            SEP   #$20
L04D8       LDA   [$01],Y
            CMP   #$3A
            BEQ   L04E6
            DEY
            CPY   #$0002
            BCS   L04D8
            BRA   L0500
L04E6       LDX   #$0000
L04E9       INY
            LDA   L0513,X
            STA   [$01],Y
            INX
            CPX   #$000E
            BCC   L04E9
            REP   #$20
            TYA
            DEC
            STA   [$01]
            PLY
            PLY
            PLD
            CLC
L04FF       RTS

L0500       REP   #$20
            PLY
            PLY
            PLD
            SEC
            RTS

L0507       ADRL  $00000000
L050B       ADRL  $00000000
L050F       ADRL  $00000000
L0513       ASC   'XtraSnd.config'
L0521       LDA   L069B
            ORA   L069B+2
            BEQ   L053E
            LDA   L069B+2
            PHA
            LDA   L069B
            PHA
            _DisposeHandle
            STZ   L069B
            STZ   L069B+2
L053E       RTS

L053F       JSR   L0439
            BCS   L0562
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L065D
            BCC   L0566
            JSR   L0521
            JSR   L0426
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L065D
            BCC   L0566
L0562       JSR   L0521
            RTS

L0566       LDA   L065F
            STA   L0687
            STA   L0677
            STA   L0657
            JSL   GSOS
            DW    $2019       ; GetEOF
            ADRL  L0655
            LDA   L0659
            STA   L067D
            LDA   L0659+2
            STA   L067D+2
            PHD
            PHA
            PHA
            LDA   L0659+2
            PHA
            LDA   L0659
            PHA
            LDA   L069F
            PHA
            PEA   $C018
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L05C2
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            STA   L0679+2
            LDA   [$01]
            STA   L0679
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L0675
L05C2       BCS   L063A
            PLA
            STA   L06A1
            PLA
            STA   L06A1+2
            LDA   L0679+2
            PHA
            LDA   L0679
            PHA
            LDY   #$000A
L05D7       LDA   [$01],Y
            STA   L063F,Y
            DEY
            DEY
            BPL   L05D7
            PLA
            PLA
            PLD
            LDA   L0679
            CLC
            ADC   L063F
            STA   L06A5
            LDA   L0679+2
            ADC   L0641
            STA   L06A5+2
            LDA   L0643
            ORA   L0645
            BEQ   L0611
            LDA   L0679
            CLC
            ADC   L0643
            STA   L06A9
            LDA   L0679+2
            ADC   L0645
            STA   L06A9+2
L0611       LDA   L0647
            ORA   L0649
            BEQ   L062C
            LDA   L0679
            CLC
            ADC   L0647
            STA   L06AD
            LDA   L0679+2
            ADC   L0649
            STA   L06AD+2
L062C       JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0685
            JSR   L0521
            RTS

L063A       PLA
            PLA
            PLD
            BRA   L062C
L063F       DB    $00
            DB    $00
L0641       DB    $00
            DB    $00
L0643       DB    $00
            DB    $00
L0645       DB    $00
            DB    $00
L0647       DB    $00
            DB    $00
L0649       DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0655       DW    $0002       ; Parms for GetEOF
L0657       DW    $0000       ;  ref num
L0659       ADRL  $00000000   ;  end of file
L065D       DW    $0003       ; Parms for Open
L065F       DW    $0000       ;  ref num
L0661       ADRL  $00000000   ;  path name
            DW    $0003       ;  req access
            DB    $04
            DB    $00
L0669       DB    $00
            DB    $00
L066B       DB    $00
            DB    $00
            DB    $E7
            DB    $00
            DB    $5A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0675       DW    $0004       ; Parms for Read
L0677       DW    $0000       ;  ref num
L0679       ADRL  $00000000   ;  buffer ptr
L067D       ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
L0685       DW    $0001       ; Parms for Close
L0687       DW    $0000       ;  ref num
L0689       STRL  '@:XtraSnd.config'
L069B       ADRL  $00000000
L069F       DW    $0000
L06A1       ADRL  $00000000
L06A5       ADRL  $00000000
L06A9       ADRL  $00000000
L06AD       ADRL  $00000000
            DB    $00
            DB    $00
L06B3       STR   'Apple~Finder~'
L06C1       DB    $00
            DB    $00
            DB    $00
            DB    $00
L06C5       DB    $00
            DB    $00
            DB    $00
            DB    $00
L06C9       DB    $00
            DB    $00
            DB    $00
            DB    $00
L06CD       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $04
            ADRL  L06DB
L06DB       DW    $8000
            ADRL  L06E5
            ADRL  L06F4
L06E5       STR   'Xtra Sounds...'
L06F4       DW    $0080       ; Icon type
            DW    $0024       ; Icon size
            DW    $0009       ; Icon height
            DW    $0008       ; Icon width
            HEX   FFFFFC0F    ; Icon image
            HEX   FFFFC00F
            HEX   FFFC0B0F
            HEX   C000BB0F
            HEX   0BB0BB0F
            HEX   C000BB0F
            HEX   FFFC0B0F
            HEX   FFFFC00F
            HEX   FFFFFC0F
            HEX   FFFFFFFF    ; Icon mask
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
            HEX   FFFFFFFF
L0744       ASC   'XtraSounds            v01.00'00
L0761       STR   'Tudor~XtraSounds~'
L0773       DW    $0080       ; Icon type
            DW    $0118       ; Icon size
            DW    $0014       ; Icon height
            DW    $001C       ; Icon width
            HEX   FFF03FFFFFFFC0FFFFF0FFF66FFF  ; Icon image
            HEX   FFC00FFFFFFF00FFFF00F66FFFFF
            HEX   FF0003FFFFFC0FFFF030FFFF88FF
            HEX   FF0C00FFFFF03F000030F888FFFF
            HEX   FF0F003FFFC0FF033030FFFFFFFF
            HEX   FF0FC00FFF03FF033030F77777FF
            HEX   FFFFF003FC0FFF033030FFFFFFFF
            HEX   FF0FFC00F03FFF000030F555FFFF
            HEX   FF00FF0000FFFFFFF030FFFF55FF
            HEX   FF0F0FC003FFFFFFFF00FDDFFFFF
            HEX   FF0FCFF003FFFFFFFFF0FFFDDFFF
            HEX   FF0F3FF000FFFFFFFFFFFFFFFFFF
            HEX   FF0FFFC0003FFFFFC3FFFFFFFFFF
            HEX   FF0FFF03C00FFFFF003C30F000FF
            HEX   F00FFC0FF003FF0FC3F00FC3F0FF
            HEX   000FF03FFC00FF0FC3FC3FC3F0FF
            HEX   00FFC0FFFF003F0FC3FC3FC3F0FF
            HEX   FFFF03FFFFC00F0FC3CC3FC3C0CF
            HEX   FFFC0FFFFFF0003FC33C0FC3303F
            HEX   FFF03FFFFFFC00FFC0FC3FF0F0FF
            HEX   000FF0000000FF00000F000FF000  ; Icon mask
            HEX   00FFF0000000FF0000FF0FF00000
            HEX   00FFFF00000FF0000FFF0000FF00
            HEX   00FFFF00000FF0FFFFFF0FFF0000
            HEX   00F0FFF000FF00FFFFFF00000000
            HEX   00F0FFF000FF00FFFFFF0FFFFF00
            HEX   00000FFF0FF000FFFFFF00000000
            HEX   00F00FFF0FF000FFFFFF0FFF0000
            HEX   00FF00FFFF0000000FFF0000FF00
            HEX   00F0F0FFFF00000000FF0FF00000
            HEX   00F0F00FFF000000000F000FF000
            HEX   00F0F00FFF000000000000000000
            HEX   00F000FFFFF00000FF0000000000
            HEX   00F000FFFFF00000FFFFFF0FFF00
            HEX   0FF00FF00FFF00F0FFFFF0FF0F00
            HEX   FFF00FF00FFF00F0FF0FF0FF0F00
            HEX   FF00FF0000FFF0F0FF0FF0FF0F00
            HEX   0000FF0000FFF0F0FF0FF0FFFFF0
            HEX   000FF000000FFFF0FFFFF0FFFFF0
            HEX   000FF000000FFF00FF0FF00F0F00

