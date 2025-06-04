*
* HotKeys v2.1
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	PIF
	dsk	HotKeys.l

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
            BCC   L004A
            PEA   ^L0CBB
            PEA   L0CBB
            PEA   ^L0CE7
            PEA   L0CE7
            _ShowBootInfo
            PEA   ^L0CD8
            PEA   L0CD8
            PHA
            _MMStartUp
            PLA
            STA   L0C7C
            PHA
            PEA   ^L004E
            PEA   L004E
            _AcceptRequests
            JSR   L0A47
L004A       PLB
            RTL

L004C       DW    $0000
L004E       PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0100
            BNE   L005E
            JSR   L01ED
            BRL   L01D9
L005E       CMP   #$0101
            BNE   L006C
            JSR   L0211
            BRL   L01D9
L0069       BRL   L01DE
L006C       CMP   #$0108
            BEQ   L00B9
            CMP   #$010A
            BEQ   L008E
            CMP   #$0003
            BNE   L0069
            LDY   #$0002
            LDAL  L0C7C
            STA   [$06],Y
            INY
            INY
            LDA   #$0000
            STA   [$06],Y
            BRL   L01D9
L008E       LDY   #$0004
            LDA   [$0A],Y
            AND   #$2900
            CMP   #$2000
            BEQ   L009E
L009B       BRL   L01DE
L009E       LDA   [$0A],Y
            AND   #$0200
            STAL  L0C7E
            DEY
            DEY
            LDA   [$0A],Y
            AND   #$007F
            JSR   L0239
            CMP   #$1234
            BEQ   L009B
            BRL   L01D9
L00B9       LDA   $0A
            CMPL  L0CA9
            BNE   L0069
            PHB
            PHK
            PLB
            PEA   $0000
            _GetCurResourceApp
            LDA   L0C7C
            PHA
            _ResourceStartUp
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L0C7C
            PHA
            PEA   $0001
            _LGetPathname2
            _OpenResourceFile
            PLA
            BCC   L0106
            BRL   L0199
L0106       _WaitCursor
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
            BCS   L01B2
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            SEP   #$20
            STA   L0166+3
            REP   #$20
            LDA   [$01]
            STA   L0166+1
            PLA
            PLA
            PLD
            LDA   L0C7C
            PHA
            PEA   $0000
            PEA   ^L0F51
            PEA   L0F51
            LDX   L004C
L0166       JSL   $000000
            BCS   L01D3
            PEA   ^L0F51
            PEA   L0F51
            PEA   $0000
            PEA   $012C
            _BlockMove
            PLA
            BEQ   L0185
            JSR   L0B5C
L0185       PLA
            PEA   $0003
            PEA   $8017
            PEA   $0000
            PEA   $0001
            _ReleaseResource
L0199       _ResourceShutDown
            _SetCurResourceApp
            _InitCursor
            PLB
            BRL   L01D9
L01B2       PLX
            PLX
            PLD
L01B5       PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHA
            _InitCursor
            _ErrorWindow
            PLA
            BRA   L0199
L01D3       PLX
            PLX
            PLX
            PLX
            BRA   L01B5
L01D9       LDA   #$8000
            STA   $10
L01DE       PLD
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

L01ED       PHB
            PHK
            PLB
            PEA   $800F
            PEA   $0001
            PEA   ^L0C93
            PEA   L0C93
            PEA   ^L0CAD
            PEA   L0CAD
            PEA   ^L0CA5
            PEA   L0CA5
            _SendRequest
            PLB
            RTS

L0211       PHB
            PHK
            PLB
            PEA   $8014
            PEA   $0001
            PEA   ^L0C93
            PEA   L0C93
            PEA   $0000
            LDA   L0CA9
            PHA
            PEA   ^L0CA1
            PEA   L0CA1
            _SendRequest
            STZ   L0CA9
            PLB
            RTS

L0239       PHB
            PHK
            PLB
            LDX   #$0030
            CMP   #$002C
            BNE   L0249
            LDY   L0C7E
            BNE   L0257
L0249       CMP   L0F1F,X
            BEQ   L0257
            DEX
            DEX
            BPL   L0249
L0252       LDA   #$1234
            PLB
            RTS

L0257       LDA   L0C7E
            BEQ   L0264
            TXA
            LSR
            CLC
            ADC   #$0019
            ASL
            TAX
L0264       STX   L0C84
            LDA   L0F51,X
            SEC
            SBC   #$012C
            CMP   #$002F
            BCS   L0252
            ASL
            TAX
            JMP   (L0278,X)

L0278       DA    L02D6
            DA    L07CF
            DA    L07D4
            DA    L07D9
            DA    L07DE
            DA    L07E3
            DA    L07E8
            DA    L07ED
            DA    L0842
            DA    L082A
            DA    L0838
            DA    L083D
            DA    L0882
            DA    L0887
            DA    L088C
            DA    L0891
            DA    L0896
            DA    L089B
            DA    L07F7
            DA    L07F2
            DA    L085F
            DA    L0869
            DA    L086E
            DA    L0864
            DA    L0878
            DA    L0873
            DA    L087D
            DA    L07BA
            DA    L06C7
            DA    L0593
            DA    L04F5
            DA    L04FA
            DA    L02E9
            DA    L02F7
            DA    L0305
            DA    L0313
            DA    L0321
            DA    L0326
            DA    L032B
            DA    L0330
            DA    L0335
            DA    L033A
            DA    L033F
            DA    L0344
            DA    L0349
            DA    L02DB
            DA    L0587
L02D6       LDA   #$1234
            PLB
            RTS

L02DB       PEA   ^L04DA
            PEA   L04DA
            PEA   ^L04EB
            PEA   L04EB
            BRA   L035E
L02E9       PEA   ^L0450
            PEA   L0450
            PEA   ^L0462
            PEA   L0462
            BRA   L035E
L02F7       PEA   ^L046E
            PEA   L046E
            PEA   ^L0480
            PEA   L0480
            BRA   L035E
L0305       PEA   ^L048B
            PEA   L048B
            PEA   ^L0499
            PEA   L0499
            BRA   L035E
L0313       PEA   ^L04A1
            PEA   L04A1
            PEA   ^L04B4
            PEA   L04B4
            BRA   L035E
L0321       LDA   #$0001
            BRA   L034C
L0326       LDA   #$0002
            BRA   L034C
L032B       LDA   #$0003
            BRA   L034C
L0330       LDA   #$0004
            BRA   L034C
L0335       LDA   #$0005
            BRA   L034C
L033A       LDA   #$0006
            BRA   L034C
L033F       LDA   #$0007
            BRA   L034C
L0344       LDA   #$0008
            BRA   L034C
L0349       LDA   #$0000
L034C       ORA   #$8100
            TAX
            PEA   ^L04C1
            PEA   L04C1
            PEA   ^L04D1
            PEA   L04D1
            BRA   L0361
L035E       LDX   #$8100
L0361       PLA
            STA   L03BD
            PLA
            STA   L03BF
            PLA
            STA   L03B9
            PLA
            STA   L03BB
            PHX
            PEA   $0001
            LDA   L03BB
            PHA
            LDA   L03B9
            PHA
            PEA   $0000
            PEA   $0000
            PEA   ^L03B5
            PEA   L03B5
            _SendRequest
            BCS   L0399
            LDA   L03B5
            BEQ   L0399
            PLB
            RTS

L0399       PEA   $0000
            PEA   $0020
            PEA   ^L03BD
            PEA   L03BD
            PEA   ^L03C1
            PEA   L03C1
            _AlertWindow
            PLA
            PLB
            RTS

L03B5       DW    $0000
            DB    $00
            DB    $00
L03B9       DB    $00
            DB    $00
L03BB       DB    $00
            DB    $00
L03BD       DB    $00
            DB    $00
L03BF       DB    $00
            DB    $00
L03C1       ASC   '72~HotKeys Error: '01
            ASC   'S'0100
            ASC   '*0'01
            ASC   'S'00
            ASC   00
            ASC   ' not installed.'0D0D
            ASC   'You must have the latest version of '
            ASC   "R"
            ASC   '*0'
            ASC   "S"
            ASC   ' installed in your system to complete t'
            ASC   'his operation.~^#6'00
L0450       STR   'Tudor~FilePeeker~'
L0462       ASC   'File Peeker'00
L046E       STR   'Tudor~LaunchList~'
L0480       ASC   'LaunchList'00
L048B       STR   'Tudor~SizeUp~'
L0499       ASC   'Size-Up'00
L04A1       STR   'Tudor~SelectIcons~'
L04B4       ASC   'Select Icons'00
L04C1       STR   'Tudor~MoreInfo~'
L04D1       ASC   'MoreInfo'00
L04DA       STR   'Tudor~ButtonBar~'
L04EB       ASC   'ButtonBar'00
L04F5       LDA   #$0001
            BRA   L04FD
L04FA       LDA   #$0002
L04FD       STA   L0531
            STZ   L0547
L0503       INC   L0547
            JSL   GSOS
            DW    $202C       ; DInfo
            ADRL  L0545
            BCS   L052F
            LDA   L0559
            CMP   #$0003
            BNE   L0503
            DEC   L0531
            BNE   L0503
            LDA   L0547
            STA   L0535
            JSL   GSOS
            DW    $202E       ; DControl
            ADRL  L0533
L052F       PLB
            RTS

L0531       DW    $0000
L0533       DW    $0005       ; Parms for DControl
L0535       DW    $0000       ;  device num
            DW    $0002       ;  control code
            ADRL  $00000000   ;  control list
            ADRL  $00000000   ;  request count
            ADRL  $00000000   ;  transfer count
L0545       DW    $0008       ; Parms for DInfo
L0547       DW    $0000       ;  device num
            ADRL  L055B       ;  device name
            DW    $0000       ;  characteristics
            ADRL  $00000000   ;  total blocks
            DW    $0000       ;  slot
            DW    $0000       ;  unit
            DW    $0000       ;  version number
L0559       DW    $0000       ;  device id
L055B       DW    $0026
            DW    $0000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0585       DW    $0000
L0587       LDA   #$FFFF
            STA   L0585
            LDA   #$0000
            TAX
            BRA   L05A1
L0593       STZ   L0585
            PHA
            PHA
            _FrontWindow
            PLA
            PLX
L05A1       STA   L06A5
            STX   L06A5+2
            PHA
            PHA
            _GetFirstWindow
L05B0       PLA
            PLX
            CPX   #$0000
            BNE   L05BF
            CMP   #$0000
            BNE   L05BF
            BRL   L06A3
L05BF       STX   L06A9+2
            STA   L06A9
            CMP   L06A5
            BNE   L05D5
            LDA   L06A9+2
            CMP   L06A5+2
            BNE   L05D5
L05D2       BRL   L068F
L05D5       PHA
            LDA   L06A9+2
            PHA
            LDA   L06A9
            PHA
            _GetWKind
            PLA
            AND   #$8000
            CMP   #$8000
            BNE   L0605
            LDA   L0585
            BNE   L05D2
            LDA   L06A9+2
            PHA
            LDA   L06A9
            PHA
            _CloseNDAbyWinPtr
            BRL   L0683
L0605       PEA   $8013
            PEA   $0001
            PEA   ^L0C93
            PEA   L0C93
            LDA   L06A9+2
            PHA
            LDA   L06A9
            PHA
            PEA   ^L06AD
            PEA   L06AD
            _SendRequest
            LDA   L06AF
            BNE   L068F
            LDA   L06B1
            CMP   #$0002
            BEQ   L0658
            CMP   #$0004
            BEQ   L0647
            CMP   #$0008
            BEQ   L064C
            CMP   #$0040
            BNE   L068F
            LDA   #L0912
            BRA   L064F
L0647       LDA   #L0922
            BRA   L064F
L064C       LDA   #L0929
L064F       LDX   #^L0929
            STA   L06BB
            STX   L06BD
L0658       PEA   $8003
            PEA   $0001
            PEA   ^L0C93
            PEA   L0C93
            LDA   L06BD
            PHA
            LDA   L06BB
            PHA
            PEA   ^L08A4
            PEA   L08A4
            _SendRequest
            LDA   L08A4
            BEQ   L068F
            LDA   L08A6
            BNE   L068F
L0683       PHA
            PHA
            _GetFirstWindow
            BRL   L05B0
L068F       PHA
            PHA
            LDA   L06A9+2
            PHA
            LDA   L06A9
            PHA
            _GetNextWindow
            BRL   L05B0
L06A3       PLB
            RTS

L06A5       ADRL  $00000000
L06A9       ADRL  $00000000
L06AD       DW    $0000
L06AF       DB    $00
            DB    $00
L06B1       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L06BB       DB    $00
            DB    $00
L06BD       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L06C7       LDA   L0C84
            ASL
            TAX
            LDA   L0FB5,X
            STA   L0775
            STA   L077F
            STA   L078D
            INX
            INX
            LDA   L0FB5,X
            STA   L0777
            STA   L077F+2
            STA   L078F
            LDA   #L0773
            STA   L08A0
            LDA   #^L0773
            STA   L08A0+2
            LDA   #$8006
            JSR   L0808
            LDA   L08A6
            BEQ   L0771
            JSL   GSOS
            DW    $2006       ; GetFileInfo
            ADRL  L077D
            BCS   L0771
            LDA   L0785
            STA   L0795
            CMP   #$005A
            BNE   L0771
            LDA   L0787
            STA   L0797
            CMP   #$8048
            BNE   L0771
            LDA   L0787+2
            STA   L0799
            BNE   L0771
            STZ   L079B
            PEA   $0104
            PEA   $0001
            PEA   ^L07A3
            PEA   L07A3
            PEA   ^L078B
            PEA   L078B
            PEA   ^L0779
            PEA   L0779
            _SendRequest
            BCC   L0771
            LDA   #L07B2
            STA   L03BD
            LDA   #^L07B2
            STA   L03BF
            PEA   $0000
            PEA   $0020
            PEA   ^L03BD
            PEA   L03BD
            PEA   ^L03C1
            PEA   L03C1
            _AlertWindow
            PLA
L0771       PLB
            RTS

L0773       BRK   $00
L0775       BRK   $00
L0777       BRK   $00
L0779       BRK   $00
            BRK   $00
L077D       DW    $0004       ; Parms for GetFileInfo
L077F       ADRL  $00000000   ;  file name
            DW    $0000       ;  access
L0785       DW    $0000       ;  file type
L0787       ADRL  $00000000   ;  aux type
L078B       DB    $06
            DB    $00
L078D       DB    $00
            DB    $00
L078F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0795       DB    $00
            DB    $00
L0797       DB    $00
            DB    $00
L0799       DB    $00
            DB    $00
L079B       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L07A3       STR   'Tudor~Workset~'
L07B2       ASC   'Workset'00
L07BA       LDA   L0C84
            ASL
            TAX
            LDA   L0FB5,X
            STA   L08A0
            INX
            INX
            LDA   L0FB5,X
            STA   L08A0+2
            BRA   L0803
L07CF       LDA   #L08AC
            BRA   L07FA
L07D4       LDA   #L08B6
            BRA   L07FA
L07D9       LDA   #L08CD
            BRA   L07FA
L07DE       LDA   #L08E1
            BRA   L07FA
L07E3       LDA   #L08F1
            BRA   L07FA
L07E8       LDA   #L0902
            BRA   L07FA
L07ED       LDA   #L0912
            BRA   L07FA
L07F2       LDA   #L0922
            BRA   L07FA
L07F7       LDA   #L0919
L07FA       STA   L08A0
            LDA   #^L0919
            STA   L08A0+2
L0803       LDA   #$8002
            BRA   L0809
L0808       PHB
L0809       PHA
            PEA   $0001
            PEA   ^L0C93
            PEA   L0C93
            LDA   L08A0+2
            PHA
            LDA   L08A0
            PHA
            PEA   ^L08A4
            PEA   L08A4
            _SendRequest
            PLB
            RTS

L082A       LDA   #$0001
L082D       STA   L08A0
            STZ   L08A0+2
            LDA   #$8007
            BRA   L0809
L0838       LDA   #$0002
            BRA   L082D
L083D       LDA   #$0000
            BRA   L082D
L0842       LDA   #$01C3
L0845       STA   L0859
            LDA   #L0859
            STA   L08A0
            LDA   #^L0859
            STA   L08A0+2
            LDA   #$8008
            BRA   L0809
L0859       DW    $0000
            DW    $0000
            DW    $0000
L085F       LDA   #$0192
            BRA   L0845
L0864       LDA   #$0229
            BRA   L0845
L0869       LDA   #$0163
            BRA   L0845
L086E       LDA   #$0166
            BRA   L0845
L0873       LDA   #$025E
            BRA   L0845
L0878       LDA   #$0259
            BRA   L0845
L087D       LDA   #$025B
            BRA   L0845
L0882       LDA   #$01F5
            BRA   L0845
L0887       LDA   #$01F6
            BRA   L0845
L088C       LDA   #$01F7
            BRA   L0845
L0891       LDA   #$01F8
            BRA   L0845
L0896       LDA   #$01F9
            BRA   L0845
L089B       LDA   #$01FA
            BRA   L0845
L08A0       ADRL  $00000000
L08A4       DW    $0000
L08A6       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L08AC       STRL  '*:System'
L08B6       STRL  '*:System:System.Setup'
L08CD       STRL  '*:System:Desk.Accs'
L08E1       STRL  '*:System:Cdevs'
L08F1       STRL  '*:System:Sounds'
L0902       STRL  '*:System:Fonts'
L0912       STRL  'About'
L0919       STRL  '*:Icons'
L0922       STRL  'Trash'
L0929       STR   'Clip'
L092E       LDA   #L0C66
            STA   L0C46
            STA   L0C3E
            LDA   #^L0C66
            STA   L0C46+2
            STA   L0C3E+2
            RTS

L0941       PHD
            PEA   $0000
            PEA   $0000
            LDA   L0C7C
            PHA
            PEA   $0001
            _LGetPathname2
            TSC
            TCD
            LDA   [$01]
            STA   L0A13
            CLC
            ADC   #$000E
            STA   L0A17
            PLA
            STA   L0A0F
            PLA
            STA   L0A0F+2
            PLD
            BCS   L09B6
            PHA
            PHA
            LDA   L0A17+2
            PHA
            LDA   L0A17
            PHA
            LDA   L0C7C
            PHA
            PEA   $C018
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            STA   L0C78
            PLA
            STA   L0C78+2
            BCS   L09B6
            LDA   L0A0F+2
            PHA
            LDA   L0A0F
            PHA
            LDA   L0C78+2
            PHA
            LDA   L0C78
            PHA
            LDA   L0A13+2
            PHA
            LDA   L0A13
            PHA
            _PtrToHand
L09B6       BCS   L0A07
            PHD
            LDA   L0C78+2
            PHA
            LDA   L0C78
            PHA
            TSC
            TCD
            LDA   [$01]
            TAX
            LDY   #$0002
            LDA   [$01],Y
            PLY
            PLY
            STA   L0C46+2
            STA   L0C3E+2
            STX   L0C46
            STX   L0C3E
            PHA
            PHX
            LDA   [$01]
            TAY
            SEP   #$20
L09E0       LDA   [$01],Y
            CMP   #$3A
            BEQ   L09EE
            DEY
            CPY   #$0002
            BCS   L09E0
            BRA   L0A08
L09EE       LDX   #$0000
L09F1       INY
            LDA   L0A1B,X
            STA   [$01],Y
            INX
            CPX   #$000E
            BCC   L09F1
            REP   #$20
            TYA
            DEC
            STA   [$01]
            PLY
            PLY
            PLD
            CLC
L0A07       RTS

L0A08       REP   #$20
            PLY
            PLY
            PLD
            SEC
            RTS

L0A0F       ADRL  $00000000
L0A13       ADRL  $00000000
L0A17       ADRL  $00000000
L0A1B       ASC   'HotKeys.config'
L0A29       LDA   L0C78
            ORA   L0C78+2
            BEQ   L0A46
            LDA   L0C78+2
            PHA
            LDA   L0C78
            PHA
            _DisposeHandle
            STZ   L0C78
            STZ   L0C78+2
L0A46       RTS

L0A47       JSR   L0B46
            JSR   L0941
            BCS   L0A6D
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0C3A
            BCC   L0A71
            JSR   L0A29
            JSR   L092E
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0C3A
            BCC   L0A71
L0A6D       JSR   L0A29
            RTS

L0A71       LDA   L0C3C
            STA   L0C64
            STA   L0C54
            STA   L0C34
            STA   L004C
            JSL   GSOS
            DW    $2019       ; GetEOF
            ADRL  L0C32
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L0C52
            LDA   L0C5E
            CMP   #$0064
            BCS   L0A9F
L0A9C       BRL   L0B36
L0A9F       LDA   L0C36
            SEC
            SBC   #$0064
            STA   L0C5A
            LDA   L0C36+2
            BCS   L0AAF
            DEC
L0AAF       STA   L0C5A+2
            PHA
            PHA
            LDA   L0C5A+2
            PHA
            LDA   L0C5A
            PHA
            LDA   L0C7C
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLA
            PLX
            BCS   L0A9C
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
            STA   L0C56
            STX   L0C56+2
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L0C52
            LDY   #$0062
L0AF8       STY   L0B44
            LDA   L0F51,Y
            CMP   #$0147
            BEQ   L0B08
            CMP   #$0148
            BNE   L0B2C
L0B08       TYA
            ASL
            TAY
            LDA   L0C56+2
            STA   L0FB5+2,Y
            TAX
            LDA   L0C56
            STA   L0FB5,Y
            PLY
            PLY
            PHX
            PHA
            LDA   [$01]
            INC
            INC
            CLC
            ADC   L0C56
            STA   L0C56
            BCC   L0B2C
            INC   L0C56+2
L0B2C       LDY   L0B44
            DEY
            DEY
            BPL   L0AF8
            PLA
            PLA
            PLD
L0B36       JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0C62
            JSR   L0A29
            RTS

L0B44       DW    $0000
L0B46       LDA   #L0F51
            STA   L0C56
            LDA   #^L0F51
            STA   L0C56+2
            LDA   #$0064
            STA   L0C5A
            STZ   L0C5A+2
            RTS

L0B5C       JSR   L0B46
            LDA   #$FFFF
            STA   L004C
            JSR   L0941
            BCS   L0BA0
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0C3A
            BCC   L0BAF
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L0C44
            BCC   L0BA3
            JSR   L0A29
            JSR   L092E
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0C3A
            BCC   L0BAF
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L0C44
            BCC   L0BA3
L0BA0       BRL   L0C22
L0BA3       JSL   GSOS
            DW    $2010       ; Open
            ADRL  L0C3A
            BCS   L0BA0
L0BAF       LDA   L0C3C
            STA   L0C64
            STA   L0C54
            STA   L0C34
            STA   L0C2A
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L0C52
            LDY   #$0062
L0BCB       STY   L0C26
            LDA   L0F51,Y
            CMP   #$0147
            BEQ   L0BDB
            CMP   #$0148
            BNE   L0C07
L0BDB       TYA
            ASL
            TAY
            LDA   L0FB5+2,Y
            STA   L0C56+2
            TAX
            LDA   L0FB5,Y
            STA   L0C56
            PHD
            PHX
            PHA
            TSC
            TCD
            LDA   [$01]
            INC
            INC
            STA   L0C5A
            STZ   L0C5A+2
            PLA
            PLA
            PLD
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L0C52
L0C07       LDY   L0C26
            DEY
            DEY
            BPL   L0BCB
            JSL   GSOS
            DW    $2018       ; SetEOF
            ADRL  L0C28
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L0C62
L0C22       JSR   L0A29
            RTS

L0C26       DW    $0000
L0C28       DW    $0003       ; Parms for SetEOF
L0C2A       DW    $0000       ;  ref num
            DW    $0002       ;  base
            ADRL  $00000000   ;  displacement
L0C32       DW    $0002       ; Parms for GetEOF
L0C34       DW    $0000       ;  ref num
L0C36       ADRL  $00000000   ;  end of file
L0C3A       DW    $0003       ; Parms for Open
L0C3C       DW    $0000       ;  ref num
L0C3E       ADRL  $00000000   ;  path name
            DW    $0003       ;  req access
L0C44       DW    $0004       ; Parms for Create
L0C46       ADRL  $00000000   ;  file name
            DW    $00E7       ;  access
            DW    $005A       ;  file type
            ADRL  $00000000   ;  aux type
L0C52       DW    $0004       ; Parms for Write
L0C54       DW    $0000       ;  ref num
L0C56       ADRL  L0F51       ;  buffer ptr
L0C5A       ADRL  $00000064   ;  request count
L0C5E       ADRL  $00000000   ;  transfer count
L0C62       DW    $0001       ; Parms for Close
L0C64       DW    $0000       ;  ref num
L0C66       STRL  '@:HotKeys.config'
L0C78       ADRL  $00000000
L0C7C       DW    $0000
L0C7E       DW    $0000
            DW    $0000
            DW    $0000
L0C84       DW    $0000
            DW    $0000
L0C88       STR   'HotKeys...'
L0C93       STR   'Apple~Finder~'
L0CA1       DW    $0000
            DB    $00
            DB    $00
L0CA5       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CA9       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0CAD       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ADRL  L0C88
L0CBB       ASC   'HotKeys               v02.10'00
L0CD8       STR   'Tudor~HotKeys~'
L0CE7       DW    $0080       ; Icon type
            DW    $0118       ; Icon size
            DW    $0014       ; Icon height
            DW    $001C       ; Icon width
            HEX   D4DDD4DD4DDDD4DDDDDDDDDDDDDD  ; Icon image
            HEX   444D44DD44DD44DDDDDDDDDDDDDD
            HEX   444DD44DD4444DDDDDDDDDD0007D
            HEX   D464D44DD4644DDDDDDDDD00077D
            HEX   DDD44D6DD44DDDDDDDDD0007777D
            HEX   D06044004406000000000777777D
            HEX   D03E64E64EFFFFFF00077777777D
            HEX   D03F4E6F666EFF0007777777777D
            HEX   D0344F6EEF6F000F07777777777D
            HEX   D03F60000000FFFF07777777777D
            HEX   D03FF03300FFFFF077777777770D
            HEX   D03FF03F0707007777777770000D
            HEX   D03FF0300077777777770000000D
            HEX   D03FF03330003707000000000DDD
            HEX   D03FF03333000000000000DDDDDD
            HEX   D03FF033333333F3330DDDDDDDDD
            HEX   D03FF0FFFFFFFF33330DDDDDDDDD
            HEX   D03F33333333333F330DDDDDDDDD
            HEX   D033333333333333330DDDDDDDDD
            HEX   D000000000000000000DDDDDDDDD
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
L0F1F       DW    $000D
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
L0F51       DW    $012C
            DW    $012D
            DW    $012E
            DW    $012F
            DW    $0130
            DW    $013E
            DW    $0132
            DW    $0131
            DW    $0138
            DW    $0139
            DW    $013A
            DW    $013C
            DW    $013B
            DW    $0134
            DW    $0141
            DW    $0133
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $0136
            DW    $012C
            DW    $012C
            DW    $014A
            DW    $014B
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $0149
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
            DW    $012C
L0FB5       ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000

