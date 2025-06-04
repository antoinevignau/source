*
* CDev Alias v2.1
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	PIF
	dsk	CDev.Alias.l

GSOS	EQU	$E100A8

*------------------------------

	use	4/Ctl.Macs
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
            BCC   L004D
            PEA   ^L004F
            PEA   L004F
            PEA   ^L0080
            PEA   L0080
            _ShowBootInfo
            PEA   ^L006C
            PEA   L006C
            PHA
            _MMStartUp
            PLA
            STA   L03CD
            PHA
            ORA   #$0100
            STA   L03CF
            PEA   ^L02B8
            PEA   L02B8
            _AcceptRequests
L004D       PLB
            RTL

L004F       ASC   'CDev NDA Alias        v02.10'00
L006C       STR   'Tudor~CDevNdaAlias~'
L0080       DW    $0080       ; Icon type
            DW    $0118       ; Icon size
            DW    $0014       ; Icon height
            DW    $001C       ; Icon width
            HEX   000000000000000000000F0F3F3F  ; Icon image
            HEX   0FFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   0FFFFFFF83FFFFFFFFFFFFFFFFFF
            HEX   0FFFFFF88FFFFC00FC3FC0FFFFFF
            HEX   0FFF188F883FFC3FFFFFF0FFFFFF
            HEX   0FF3EEEEEE3FFC3FF03FF0FFC03F
            HEX   0FF3666663FFFC03FC3FF0FF0F0F
            HEX   0FF14444444FFC3FFC3FF0FF000F
            HEX   0FFC5555553FFC3FFC3FF0FF0FFF
            HEX   0FFF11F113FFFC3FF00FC03FC03F
            HEX   0FFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   000000000000000000000F0F3F3F
            HEX   DDDD0440FFFFF0DDDDDDDDDDDDDD
            HEX   DDDD0440F00CF0DDDDDDDDDDDDDD
            HEX   DDDD0BB0FFFFF0DDDDDDDDDDDDDD
            HEX   DDDD0BB0F00CF0DDDDDDDDDDDDDD
            HEX   DDDD0110FFFFF0DDDDDDDDDDDDDD
            HEX   DDDD0110000000DDDDDDDDDDDDDD
            HEX   DDDD0EE0DDDDD0DDDDDDDDDDDDDD
            HEX   DDDD0000000000DDDDDDDDDDDDDD
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF  ; Icon mask
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFF
L02B8       PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0100
            BNE   L02C8
            JSR   L0381
            BRL   L036D
L02C8       CMP   #$0101
            BNE   L02D3
            JSR   L03A5
            BRL   L036D
L02D3       CMP   #$0108
            BEQ   L02F3
            CMP   #$0003
            BNE   L02F0
            LDY   #$0002
            LDAL  L03CD
            STA   [$06],Y
            INY
            INY
            LDA   #$0000
            STA   [$06],Y
            BRL   L036D
L02F0       BRL   L0372
L02F3       LDA   $0A
            CMPL  L0404
            BNE   L02F0
            PEA   $0000
            _GetCurResourceApp
            PLA
            STAL  L0A01
            LDAL  L03CD
            PHA
            _ResourceStartUp
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDAL  L03CD
            PHA
            PEA   $0001
            _LGetPathname2
            _OpenResourceFile
            PLA
            BCS   L035A
            PHB
            PHK
            PLB
            JSR   L0416
            LDA   L03CF
            PHA
            _DisposeAll
            _InitCursor
            PLB
L035A       _ResourceShutDown
            LDAL  L0A01
            PHA
            _SetCurResourceApp
L036D       LDA   #$8000
            STA   $10
L0372       PLD
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

L0381       PHB
            PHK
            PLB
            PEA   $800F
            PEA   $0001
            PEA   ^L03EE
            PEA   L03EE
            PEA   ^L0408
            PEA   L0408
            PEA   ^L0400
            PEA   L0400
            _SendRequest
            PLB
            RTS

L03A5       PHB
            PHK
            PLB
            PEA   $8014
            PEA   $0001
            PEA   ^L03EE
            PEA   L03EE
            PEA   $0000
            LDA   L0404
            PHA
            PEA   ^L03FC
            PEA   L03FC
            _SendRequest
            STZ   L0404
            PLB
            RTS

L03CD       DW    $0000
L03CF       DW    $0000
L03D1       STR   'Create CDev AliasI'
L03E4       STR   'Apple~IR~'
L03EE       STR   'Apple~Finder~'
L03FC       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0400       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0404       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0408       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ADRL  L03D1
L0416       _WaitCursor
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L09AE
            PEA   L09AE
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0064
            PEA   $800E
            _NewWindow2
            STA   L09F9
            PLA
            STA   L09F1
            PLA
            STA   L09F1+2
            BCC   L046B
            BRA   L0460
            STA   L09F9
L0460       JSR   L09BF
            _WaitCursor
            RTS

L046B       PHA
            PHA
            _GetPort
            PLA
            STA   L09F5
            PLA
            STA   L09F5+2
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            _SetPort
            PEA   $0000
            PEA   $0000
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            PEA   $0000
            PEA   ^L0A41
            PEA   L0A41
            _NewControl2
            PLA
            STA   L0A03
            PLA
            STA   L0A03+2
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            _ShowWindow
            STZ   L09FB
            STZ   L09FD
            PEA   $0000
            PEA   $0000
            PEA   ^L0A13
            PEA   L0A13
            PEA   ^L09AE
            PEA   L09AE
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _DoModalWindow
            PLA
            PLX
            STZ   L09FF
            PEA   $C301
            PEA   $0001
            PEA   ^L03E4
            PEA   L03E4
            PEA   $0000
            PEA   $0000
            PEA   ^L03FC
            PEA   L03FC
            _SendRequest
            BCS   L051E
            LDA   L03FC
            BEQ   L051E
            DEC   L09FF
            BRA   L0540
L051E       PEA   $0000
            PEA   $0000
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            PEA   $0000
            PEA   $0005
            _GetCtlHandleFromID
            _ShowControl
L0540       JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0A7D
            BCC   L0561
L054C       JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0A95
            BRA   L055B
L0558       STA   L09F9
L055B       JSR   L06F9
            JMP   L09BF

L0561       LDA   L0A7F
            STA   L0A9B
            STA   L0A97
            STZ   L0A9F
            STZ   L0AA1
            JSL   GSOS
            DW    $201C       ; GetDirEntry
            ADRL  L0A99
            BCS   L0558
            LDY   L0AA7
            BNE   L0584
            BRL   L06EA
L0584       LDA   #$0000
            TAX
L0588       CLC
            ADC   #$0005
            BCC   L058F
            INX
L058F       DEY
            BNE   L0588
            PEA   $0000
            PEA   $0000
            PHX
            PHA
            LDA   L03CF
            PHA
            PEA   $C010
            PEA   $0000
            PEA   $0000
            _NewHandle
            STA   L09F9
            PLA
            PLX
            BCS   L054C
            JSR   L09E0
            STA   L0A0B
            STX   L0A0D
            LDY   L0AA7
            LDA   #$0000
            TAX
L05C5       CLC
            ADC   #$0024
            BCC   L05CC
            INX
L05CC       DEY
            BNE   L05C5
            PEA   $0000
            PEA   $0000
            PHX
            PHA
            LDA   L03CF
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STA   L09F9
            PLA
            PLX
            BCC   L05F5
            BRL   L054C
L05F5       JSR   L09E0
            STA   L0A0F
            STX   L0A0F+2
            LDA   #$0001
            STA   L0A9F
            STA   L0AA1
            STZ   L0A07
            STZ   L0A09
            PHD
            LDA   L0A0D
            PHA
            LDA   L0A0B
            PHA
            LDA   L0A0F+2
            PHA
            LDA   L0A0F
            PHA
            TSC
            TCD
L0620       JSL   GSOS
            DW    $201C       ; GetDirEntry
            ADRL  L0A99
            BCS   L069A
            LDA   L0AA9
            CMP   #$00C7
            BNE   L0620
            LDA   L0AC5
            AND   #$8000
            BNE   L0620
            LDY   L0A07
            PLA
            PLX
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   [$05],Y
            INY
            INY
            TXA
            STA   [$05],Y
            INY
            INY
            LDA   #$0000
            STA   [$05],Y
            LDA   L0ACB
            INC
            INC
            LDY   #$0000
            STA   [$01],Y
            INY
            INY
            LDA   #$3A38
            STA   [$01],Y
            INY
            LDX   #$0001
L066A       INY
            LDA   L0ACB+1,X
            STA   [$01],Y
            INX
            CPX   L0ACB
            BCC   L066A
            INY
            INY
            LDA   #$0000
            STA   [$01],Y
            PLA
            PLX
            CLC
            ADC   #$0024
            BCC   L0686
            INX
L0686       PHX
            PHA
            INC   L0A09
            LDA   L0A07
            CLC
            ADC   #$0005
            STA   L0A07
            BRL   L0620
            BRK   $00
L069A       PLA
            PLA
            PLA
            PLA
            PLD
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0A95
            LDA   L0A09
            BEQ   L06EA
            PEA   $FFFF
            PEA   $FFFF
            PEA   $0001
            LDA   L0A0D
            PHA
            LDA   L0A0B
            PHA
            PEA   $0000
            LDA   L0A09
            PHA
            LDA   L0A03+2
            PHA
            LDA   L0A03
            PHA
            _NewList2
            PEA   $0000
            PEA   $0000
            LDA   L0A03+2
            PHA
            LDA   L0A03
            PHA
            _SortList2
L06EA       _InitCursor
L06F1       LDA   L09FB
            BNE   L06F9
            BRL   L0718
L06F9       LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            _CloseWindow
            LDA   L09F5+2
            PHA
            LDA   L09F5
            PHA
            _SetPort
            RTS

L0718       PEA   $0000
            PEA   $0000
            PEA   ^L0A13
            PEA   L0A13
            PEA   ^L09AE
            PEA   L09AE
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _DoModalWindow
            PLA
            PLX
            CMP   #$0000
            BEQ   L0752
            CMP   #$0005
            BCS   L0752
            DEC
            ASL
            TAX
            JSR   (L0755,X)
L0752       BRL   L06F1
L0755       DA    L094B
            DA    L0768
            DA    L075D
            DA    L0908
L075D       _WaitCursor
            DEC   L09FB
            RTS

L0768       _WaitCursor
            PEA   $0000
            PEA   $0000
            LDA   L0A03+2
            PHA
            LDA   L0A03
            PHA
            _NextMember2
            PLA
            BNE   L078F
            _InitCursor
            RTS

L078F       TAY
            LDA   L0A0B
            LDX   L0A0D
L0796       DEY
            BEQ   L07A2
            CLC
            ADC   #$0005
            BCC   L0796
            INX
            BRA   L0796
L07A2       PHD
            PHX
            PHA
            TSC
            TCD
            LDA   [$01]
            SEC
            SBC   #$0004
            STA   L0B0D
            STA   L0B19
            STA   L08F8
            LDY   #$0002
            LDA   [$01],Y
            STA   L0B0D+2
            STA   L0B19+2
            STA   L08FA
            PLA
            PLA
            PLD
            PEA   $0000
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0001
            _LoadResource
            STA   L09F9
            PLA
            STA   L08F2
            PLX
            STX   L08F4
            BCC   L07ED
            BRL   L09BF
L07ED       JSR   L09E0
            STA   L0B23
            STX   L0B23+2
            PHA
            PHA
            LDA   L08F4
            PHA
            LDA   L08F2
            PHA
            _GetHandleSize
            PLA
            STA   L0B27
            PLA
            STA   L0B27+2
            JSL   GSOS
            DW    $2009       ; SetPrefix
            ADRL  L0AEF
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L0B0B
            BCC   L0850
            _InitCursor
            PHA
            PEA   $0024
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            _AlertWindow
            PLA
            BNE   L0849
            BRL   L08E8
L0849       _WaitCursor
L0850       JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0B15
            BCC   L085F
            BRL   L08EC
L085F       LDA   L0B17
            STA   L0A97
            STA   L0B21
            STA   L0B31
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L0B1F
            JSL   GSOS
            DW    $2018       ; SetEOF
            ADRL  L0B2F
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0A95
            PEA   $800C
            PEA   $0001
            PEA   ^L03EE
            PEA   L03EE
            PEA   ^L0AF7
            PEA   L0AF7
            PEA   ^L03FC
            PEA   L03FC
            _SendRequest
            LDA   L09FF
            BEQ   L08E8
            PEA   $0000
            _GetCurResourceApp
            LDA   L0A01
            PHA
            _SetCurResourceApp
            PEA   $C302
            PEA   $0001
            PEA   ^L03E4
            PEA   L03E4
            PEA   ^L08F6
            PEA   L08F6
            PEA   ^L0902
            PEA   L0902
            _SendRequest
            _SetCurResourceApp
L08E8       DEC   L09FB
            RTS

L08EC       STA   L09F9
            JMP   L09BF

L08F2       DW    $0000
L08F4       DW    $0000
L08F6       DW    $0083
L08F8       DW    $0000
L08FA       DW    $0000
            DW    $00B8
            DW    $0000
            DW    $0000
L0902       DW    $0000
            DW    $0000
            DW    $0000
L0908       PEA   $0000
            PEA   $0000
            LDA   L0A03+2
            PHA
            LDA   L0A03
            PHA
            _NextMember2
            PLA
            BEQ   L0925
            PEA   $0000
            BRA   L0928
L0925       PEA   $00FF
L0928       PEA   $0000
            PEA   $0000
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            PEA   $0000
            PEA   $0002
            _GetCtlHandleFromID
            _HiliteControl
            RTS

L094B       PEA   $0000
            PEA   $0000
            LDA   L09F1+2
            PHA
            LDA   L09F1
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            PLA
            STA   L09AA
            PLA
            STA   L09AA+2
            BCS   L09A9
            LDA   L09FD
            BEQ   L0988
            STZ   L09FD
            LDA   L09AA+2
            PHA
            LDA   L09AA
            PHA
            _HideControl
            RTS

L0988       DEC   L09FD
            LDA   L09AA+2
            PHA
            LDA   L09AA
            PHA
            _ShowControl
            LDA   L09AA+2
            PHA
            LDA   L09AA
            PHA
            _DrawOneCtl
L09A9       RTS

L09AA       ADRL  $00000000
L09AE       PHA
            PHA
            _GetPort
            _DrawControls
            RTL

L09BF       PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L09F9
            PHA
            _InitCursor
            _ErrorWindow
            PLA
            SEC
            RTS

L09E0       PHD
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
            RTS

L09F1       ADRL  $00000000
L09F5       ADRL  $00000000
L09F9       DW    $0000
L09FB       DW    $0000
L09FD       DW    $0000
L09FF       DW    $0000
L0A01       DW    $0000
L0A03       ADRL  $00000000
L0A07       BRK   $00
L0A09       BRK   $00
L0A0B       BRK   $00
L0A0D       BRK   $00
L0A0F       ADRL  $00000000
L0A13       DW    $0000       ; event code
            ADRL  $00000000   ; event message
            ADRL  $00000000   ; tick count
            DW    $0000       ; mouse location
            DW    $0000
            DW    $0000       ; modifiers
            ADRL  $00000000   ; task data
            ADRL  $00000000   ; task mask
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0A41       DW    $000F       ; pCount
            ADRL  $00000004   ; ID
            DW    $0023       ; rect
            DW    $0008
            DW    $0061
            DW    $01AE
            ADRL  $89000000   ; procRef
            DW    $0043       ; flag
            DW    $3400       ; moreFlags
            ADRL  $00000000   ; refCon
            DW    $0000       ; listSize
            DW    $0006       ; listView
            DW    $0000       ; listType
            DW    $0001       ; listStart
            ADRL  $00000000   ; listDraw
            DW    $000A       ; listMemHeight
            DW    $0005       ; listMemSize
            ADRL  $00000000   ; listRef
            ADRL  L0A73       ; colorTableRef
L0A73       DW    $0000
            DW    $0000
            DW    $0000
            DW    $FFFF
            DW    $AAAA
L0A7D       DW    $0002       ; Parms for Open
L0A7F       DW    $0000       ;  ref num
            ADRL  L0A85       ;  path name
L0A85       STRL  '*:System:Cdevs'
L0A95       DW    $0001       ; Parms for Close
L0A97       DW    $0000       ;  ref num
L0A99       DW    $000D       ; Parms for GetDirEntry
L0A9B       DW    $0000       ;  ref num
            DW    $0000       ;  flags
L0A9F       DW    $0000       ;  base
L0AA1       DW    $0000       ;  displacement
            ADRL  L0AC9       ;  file name
L0AA7       DW    $0000       ;  entry num
L0AA9       DW    $0000       ;  file type
            ADRL  $00000000   ;  end of file
            ADRL  $00000000   ;  blocks used
            DS    8           ;  creation date
            DS    8           ;  modification date
            DW    $0000       ;  access
L0AC5       ADRL  $00000000   ;  aux type
L0AC9       DW    $0022
L0ACB       DW    $0000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0AEF       DW    $0002       ; Parms for SetPrefix
            DW    $0008       ;  prefix num
            ADRL  L0AF7       ;  prefix ptr
L0AF7       STRL  '*:System:Desk.Accs'
L0B0B       DW    $0003       ; Parms for Create
L0B0D       ADRL  $00000000   ;  file name
            DW    $00C3       ;  access
            DW    $00B8       ;  file type
L0B15       DW    $0003       ; Parms for Open
L0B17       DW    $0000       ;  ref num
L0B19       ADRL  $00000000   ;  path name
            DW    $0003       ;  req access
L0B1F       DW    $0004       ; Parms for Write
L0B21       DW    $0000       ;  ref num
L0B23       ADRL  $00000000   ;  buffer ptr
L0B27       ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
L0B2F       DW    $0003       ; Parms for SetEOF
L0B31       DW    $0000       ;  ref num
            DW    $0002       ;  base
            ADRL  $00000000   ;  displacement


