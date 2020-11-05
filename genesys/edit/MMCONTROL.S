*
* Genesys v1.2.4
* Control editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/QD.Macs
         use   4/QDAux.Macs
         use   4/Resource.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

	 use   MMCONTROL.X.S
	
*----------------------------

GSOS     EQU   $E100A8

*----------------------------

L020000  LDA   $04,S
         STA   L026C61
         LDA   $06,S
         STA   L026C61+2
         JMPL  L02695A

         BRK   $69
         RTL

L020011  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L020340
         PEA   L020340
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L020060
         PEA   L020060
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
*         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L020060  DW    $0050
         DW    $2000      ; frame bits
         ADRL  $00000000  ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  $00000000  ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  L020340    ; content defproc
         DW    40      ; content rect
         DW    $0096
         DW    153
         DW    $01EA
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L0200B0    ; storage ptr
         DW    $0003

L0200B0  ADRL  L0200EC
         ADRL  L020117
         ADRL  L020146
         ADRL  L020174
         ADRL  L02019E
         ADRL  L0201CA
         ADRL  L0201F4
         ADRL  L020219
         ADRL  L020241
         ADRL  L020268
         ADRL  L020296
         ADRL  L0202C1
         ADRL  L0202EA
         ADRL  L020316
         ADRL  L020337
         ADRL  L020339
         ADRL  $00000000

L0200EC  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    93      ; rect
         DW    $00B4
         DW    106
         DW    $0118
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020114    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L020114  STR   'Ok'

L020117  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    93      ; rect
         DW    $0028
         DW    106
         DW    $008C
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02013F    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02013F  STR   'Cancel'

L020146  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0012      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020166    ; titleRef
         DW    $0001      ; initialValue
L020166  STR   'Simple Button'

L020174  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $001C      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020194    ; titleRef
         DW    $0000      ; initialValue
L020194  STR   'Check box'

L02019E  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0026      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0201BE    ; titleRef
         DW    $0000      ; initialValue
L0201BE  STR   'Icon button'

L0201CA  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0030      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0201EA    ; titleRef
         DW    $0000      ; initialValue
L0201EA  STR   'Line edit'

L0201F4  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $003A      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020214    ; titleRef
         DW    $0000      ; initialValue
L020214  STR   'List'

L020219  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0044      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020239    ; titleRef
         DW    $0000      ; initialValue
L020239  STR   'Picture'

L020241  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0012      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020261    ; titleRef
         DW    $0000      ; initialValue
L020261  STR   'Pop-up'

L020268  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $001C      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020288    ; titleRef
         DW    $0000      ; initialValue
L020288  STR   'Radio control'

L020296  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0026      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0202B6    ; titleRef
         DW    $0000      ; initialValue
L0202B6  STR   'Scroll bar'

L0202C1  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $0030      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0202E1    ; titleRef
         DW    $0000      ; initialValue
L0202E1  STR   'Size box'

L0202EA  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $003A      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02030A    ; titleRef
         DW    $0000      ; initialValue
L02030A  STR   'Static text'

L020316  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0044      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020336    ; titleRef
         DW    $0000      ; initialValue
L020336  STR   'Text edit'

L020337  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $004e      ; rect
         DW    $0014
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L020338    ; titleRef
         DW    $0000      ; initialValue
L020338  STR   'Rectangle'

L020339  DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $004e      ; rect
         DW    $00B4
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02033A    ; titleRef
         DW    $0000      ; initialValue
L02033A  STR   'Thermometer'

L020340  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   L026C65
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $0014
         PEA   $000C
         _MoveTo
         PEA   ^L020391
         PEA   L020391
         _DrawString
         _SetCurResourceFile
         PLB
         PLD
         RTL

L020391  STR   'Choose control to create...'

L0203AD  PLA
         STA   L0203E0
         SEP   #$20
         PLA
         STA   L0203E0+2
         REP   #$20
         PLA
         SEP   #$20
         XBA
         PHA
         XBA
         PLA
         ASL
         ASL
         ASL
         ASL
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L0203E0+2
         PHA
         REP   #$20
         LDA   L0203E0
         PHA
         TXA
         RTL

L0203E0  ADR   $000000

L0203E3  ENT
         PLA
         STA   L020416
         SEP   #$20
         PLA
         STA   L020416+2
         REP   #$20
         PLA
         SEP   #$20
         XBA
         PHA
         LSR
         LSR
         LSR
         LSR
         XBA
         PLA
         REP   #$20
         LSR
         LSR
         LSR
         LSR
         SEP   #$20
         PHA
         XBA
         PLA
         REP   #$20
         TAX
         SEP   #$20
         LDA   L020416+2
         PHA
         REP   #$20
         LDA   L020416
         PHA
         TXA
         RTL

L020416  ADR   $000000

L020419  ENT
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   $1B
         BNE   L020429
         BRL   L0211A0
L020429  LDX   #^L026D83
         LDA   #L026D83
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L0211B0
         PEA   L0211B0
         LDA   #$0058
         PHA
         JSL   L02C5F5
         LDA   $1B
         PHA
         LDA   #$000B
         DEC
         TAX
         TXA
         CLC
         ADC   #L026D83
         PEA   ^L026D83
         PHA
         LDA   #$0004
         PHA
         _Int2Hex
         STA   L02C957
         LDA   $19
         PHA
         LDA   #$0014
         DEC
         TAX
         TXA
         CLC
         ADC   #L026D83
         PEA   ^L026D83
         PHA
         LDA   #$0004
         PHA
         _Int2Hex
         STA   L02C957
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1F62
         PEA   $4B43
         PEA   $4548
         PEA   $4354
         PEA   $4944
         PEA   $0001
L0204A7  PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0800
         PEA   $0000
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $0402
         PEA   $FD00
         PEA   $0100
         PEA   $0100
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1F2A
         PEA   $0000
         PEA   $0000
         PEA   $0D08
         PEA   $9700
         PEA   $0005
         PEA   $08EA
         PEA   $4700
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $08EA
         PEA   $0200
         PEA   $0000
         PEA   $0047
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
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1EF2
         PEA   $0000
         PEA   $05A4
         PEA   $9700
         PEA   $0000
         PEA   $0007
         PEA   $0000
         PEA   $0000
         PEA   $0D08
         PEA   $0000
         PEA   $0000
         PEA   $5845
         PEA   $5454
         PEA   $4944
         PEA   $0047
         PEA   $000D
         PEA   $1F0E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1EBA
         PEA   $000D
         PEA   $17E0
         PEA   $000D
         PEA   $1F46
         PEA   $000D
         PEA   $1ED6
         PEA   $1F00
         PEA   $05A4
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E9E
         PEA   $000D
         PEA   $16B8
         PEA   $000D
         PEA   $1F7E
         PEA   $000D
         PEA   $1EBA
         PEA   $0000
         PEA   $08EA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E82
         PEA   $000D
         PEA   $169C
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E9E
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E66
         PEA   $000D
         PEA   $1676
         PEA   $0000
         PEA   $0000
         PEA   $0D07
         PEA   $C700
         PEA   $000D
         PEA   $1CDE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1FEE
         PEA   $000D
         PEA   $165A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $008E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E2E
         PEA   $9D00
         PEA   $05A4
         PEA   $FD00
         PEA   $0D08
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0D07
         PEA   $0000
         PEA   $0000
         PEA   $08EA
         PEA   $4700
         PEA   $0000
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $2044
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1DF6
         PEA   $0200
         PEA   $0000
         PEA   $0200
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $05A4
         PEA   $9700
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0D07
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $5053
         PEA   $4944
         PEA   $4E4F
         PEA   $4349
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1DBE
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0004
         PEA   $02FA
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0719
         PEA   $0047
         PEA   $000D
         PEA   $1DDA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1D86
         PEA   $000D
         PEA   $163E
         PEA   $000D
         PEA   $1E12
         PEA   $000D
         PEA   $1DA2
         PEA   $4449
         PEA   $06C8
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1D6A
         PEA   $000D
         PEA   $1CFA
         PEA   $000D
         PEA   $1622
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0005
         PEA   $A497
         PEA   $000D
         PEA   $1D4E
         PEA   $000D
         PEA   $1D16
         PEA   $000D
         PEA   $1CFA
         PEA   $000D
         PEA   $1606
         PEA   $0000
         PEA   $0000
         PEA   $4445
         PEA   $0000
         PEA   $000D
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1D32
         PEA   $000D
         PEA   $1D16
         PEA   $000D
         PEA   $15EA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1D16
         PEA   $000D
         PEA   $15CE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0008
         PEA   $EA47
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1CFA
         PEA   $000D
         PEA   $15AC
         PEA   $000D
         PEA   $1E4A
         PEA   $000D
         PEA   $1D86
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1CDE
         PEA   $000D
         PEA   $1590
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1CFA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1CC2
         PEA   $000D
         PEA   $1574
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B3A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1E66
         PEA   $000D
         PEA   $1558
         PEA   $0000
         PEA   $0000
         PEA   $A489
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1C8A
         PEA   $4543
         PEA   $5255
         PEA   $4F53
         PEA   $4552
         PEA   $0001
         PEA   $414D
         PEA   $0000
         PEA   $001E
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $05C4
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $0016
         PEA   $0006
         PEA   $02F8
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1C52
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0004
         PEA   $0000
         PEA   $0008
         PEA   $EA47
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0008
         PEA   $EA02
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $4449
         PEA   $4C54
         PEA   $437A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1C1A
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $9700
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0D05
         PEA   $6B00
         PEA   $0000
         PEA   $0047
         PEA   $000D
         PEA   $1C36
         PEA   $0000
         PEA   $0000
         PEA   $4955
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1BE2
         PEA   $000D
         PEA   $153C
         PEA   $000D
         PEA   $1C6E
         PEA   $000D
         PEA   $1BFE
         PEA   $0005
         PEA   $A489
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1BC6
         PEA   $000D
         PEA   $1B56
         PEA   $000D
         PEA   $1520
         PEA   $0000
         PEA   $0000
         PEA   $5453
         PEA   $4543
         PEA   $5255
         PEA   $4F53
         PEA   $000D
         PEA   $1BAA
         PEA   $000D
         PEA   $1B72
         PEA   $000D
         PEA   $1B56
         PEA   $000D
         PEA   $1504
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0004
         PEA   $0016
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B8E
         PEA   $000D
         PEA   $1B72
         PEA   $000D
         PEA   $14E8
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0586
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B72
         PEA   $000D
         PEA   $14CC
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $046D
         PEA   $0020
         PEA   $4449
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B56
         PEA   $000D
         PEA   $14AA
         PEA   $000D
         PEA   $1CA6
         PEA   $000D
         PEA   $1BE2
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B3A
         PEA   $000D
         PEA   $148E
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B56
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1B1E
         PEA   $000D
         PEA   $1468
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $000D
         PEA   $19B2
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1CC2
         PEA   $000D
         PEA   $144C
         PEA   $0000
         PEA   $0000
         PEA   $584F
         PEA   $4245
         PEA   $5A49
         PEA   $5345
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1AE6
         PEA   $0200
         PEA   $0000
         PEA   $002D
         PEA   $001D
         PEA   $0007
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $F600
         PEA   $0100
         PEA   $0100
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $3E00
         PEA   $05A4
         PEA   $FD00
         PEA   $0D04
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1AAE
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $08EA
         PEA   $0001
         PEA   $0D03
         PEA   $A400
         PEA   $2044
         PEA   $0000
         PEA   $0000
         PEA   $03E6
         PEA   $0000
         PEA   $0000
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0002
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1A76
         PEA   $0000
         PEA   $000D
         PEA   $03D8
         PEA   $0000
         PEA   $0007
         PEA   $E9F1
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $55AE
         PEA   $0000
         PEA   $0000
         PEA   $0047
         PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0100
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1A3E
         PEA   $0D03
         PEA   $AE00
         PEA   $0D03
         PEA   $9F00
         PEA   $0001
         PEA   $4142
         PEA   $4C4C
         PEA   $4F52
         PEA   $0000
         PEA   $0000
         PEA   $5255
         PEA   $4F53
         PEA   $4552
         PEA   $0047
         PEA   $000D
         PEA   $1A5A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1A06
         PEA   $000D
         PEA   $1430
         PEA   $000D
         PEA   $1A92
         PEA   $000D
         PEA   $1A22
         PEA   $000D
         PEA   $0375
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $19EA
         PEA   $000D
         PEA   $12A7
         PEA   $000D
         PEA   $1ACA
         PEA   $000D
         PEA   $1A06
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $19CE
         PEA   $000D
         PEA   $128B
         PEA   $000D
         PEA   $1B02
         PEA   $000D
         PEA   $19EA
         PEA   $0000
         PEA   $0600
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $19B2
         PEA   $000D
         PEA   $1269
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $19CE
         PEA   $0000
         PEA   $0D03
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1243
         PEA   $0000
         PEA   $0000
         PEA   $0064
         PEA   $0000
         PEA   $0000
         PEA   $0056
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $000D
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $196E
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1227
         PEA   $0000
         PEA   $0000
         PEA   $4C4F
         PEA   $5254
         PEA   $4E4F
         PEA   $434F
         PEA   $000D
         PEA   $1952
         PEA   $000D
         PEA   $1936
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $120B
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $1936
         PEA   $000D
         PEA   $11EF
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $02AA
         PEA   $0005
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $11D3
         PEA   $0008
         PEA   $EA47
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $4449
         PEA   $4C54
         PEA   $4352
         PEA   $0046
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0200
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0310
         PEA   $0000
         PEA   $0043
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $3F00
         PEA   $0000
         PEA   $08E9
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $030F
         PEA   $0004
         PEA   $0043
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $030E
         PEA   $0019
         PEA   $0043
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0215
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $191A
         PEA   $0000
         PEA   $0000
         PEA   $4352
         PEA   $0000
         PEA   $5345
         PEA   $0028
         PEA   $4B41
         PEA   $4D37
         PEA   $000C
         PEA   $0000
         PEA   $0001
         PEA   $0001
         PEA   $000D
         PEA   $18AA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0311
         PEA   $1600
         PEA   $0045
         PEA   $F300
         PEA   $0100
         PEA   $0100
         PEA   $0400
         PEA   $0001
         PEA   $0001
         PEA   $000D
         PEA   $188E
         PEA   $0000
         PEA   $0000
         PEA   $5A00
         PEA   $0312
         PEA   $0000
         PEA   $0045
         PEA   $C900
         PEA   $0000
         PEA   $08EA
         PEA   $4700
         PEA   $0001
         PEA   $0000
         PEA   $000D
         PEA   $1872
         PEA   $0000
         PEA   $0000
         PEA   $4400
         PEA   $0312
         PEA   $494C
         PEA   $001F
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $000D
         PEA   $1856
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0002
         PEA   $002D
         PEA   $A497
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $000D
         PEA   $183A
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0020
         PEA   $0031
         PEA   $5501
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $000D
         PEA   $181E
         PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0059
         PEA   $000E
         PEA   $004E
         PEA   $000C
         PEA   $F837
         PEA   $0004
         PEA   $0000
         PEA   $0D01
         PEA   $4E00
         PEA   $0D01
         PEA   $0007
         PEA   $0000
         PEA   $000D
         PEA   $1802
         PEA   $000D
         PEA   $17FC
         PEA   $5255
         PEA   $0000
         PEA   $4552
         PEA   $0023
         PEA   $414D
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $0104
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0036
         PEA   $0016
         PEA   $0006
         PEA   $02F2
         PEA   $0001
         PEA   $0001
         PEA   $0004
         PEA   $0000
         PEA   $000D
         PEA   $0115
         PEA   $0005
         PEA   $A4FD
         PEA   $000D
         PEA   $0193
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0100
         PEA   $0000
         PEA   $0008
         PEA   $EA47
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0008
         PEA   $EA02
         PEA   $000D
         PEA   $007B
         PEA   $0020
         PEA   $4449
         PEA   $4C54
         PEA   $430D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0600
         PEA   $0200
         PEA   $0200
         PEA   $0000
         PEA   $0200
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $05A4
         PEA   $9700
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0D00
         PEA   $AF00
         PEA   $0000
         PEA   $08E9
         PEA   $F100
         PEA   $0000
         PEA   $0000
         PEA   $2044
         PEA   $4955
         PEA   $FEE8
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0001
         PEA   $0002
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $000D
         PEA   $0085
         PEA   $0005
         PEA   $A489
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $0085
         PEA   $000D
         PEA   $0076
         PEA   $0020
         PEA   $5453
         PEA   $494C
         PEA   $4543
         PEA   $5255
         PEA   $4F53
         PEA   $4552
         PEA   $454B
         PEA   $414D
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $003C
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0016
         PEA   $0006
         PEA   $02F1
         PEA   $0001
         PEA   $0001
         PEA   $0004
         PEA   $0000
         PEA   $000D
         PEA   $004C
         PEA   $0005
         PEA   $A4FD
         PEA   $000D
         PEA   $00CA
         PEA   $0000
         PEA   $0000
         PEA   $000D
         PEA   $003A
         PEA   $00E0
         PEA   $08AA
         LDX   #^L026D83
         LDA   #L026D83
         PHX
         PHA
         _AlertWindow
         STA   L02C957
         PLA
*         BEQ   L0211A0
*         BRL   L0211A0
L0211A0  LDA   $17
         STA   $1B
         LDA   $16
         STA   $1A
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0211B0  ASC   '52~Error $0000 at $0000. Please record and report this Control Editor error to SSSi.~^#0'

L021208  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   $19
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0050
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   $17
         STA   $19
         LDA   $16
         STA   $18
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L0212A0  TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L0212B5
         DEX
L0212B5  PHX
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0212D5
         DEX
L0212D5  PHX
         PHA
         _NewHandle
         STA   L02C957
         PLA
         STA   L026C7B
         PLA
         STA   L026C7D
         LDA   L02C957
         PHA
         LDA   #$0201
         PHA
         JSL   L020419
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $16
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8004
         PHA
         _UniqueResourceID
         STA   L02C957
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0038
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L026C7D
         LDA   L026C7B
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$8004
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         STA   L02C957
         LDA   #$8004
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$0205
         PHA
         JSL   L020419
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $16
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $16
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

*--- AV 202010 Write a resource

L0213E0  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         _WaitCursor
         STA   L02C957
         LDA   #$0003
         STA   $1A
L0213F8  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $1A
         CLC
         ADC   #$0000
         LDX   #$0000
         TAY
         BPL   L02140D
         DEX
L02140D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $1C
         PLA
         STA   $1E
         PHA
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _GetCtlValue
         STA   L02C957
         PLA
         STA   $18
         LDA   $18
         BNE   L02143A
         BRL   L02143E
L02143A  LDA   $1A
         STA   $16
L02143E  INC   $1A
         LDA   $1A
         CMP   #$0011	; AV 202010 was #$0F
         BEQ   L02144A
         BRL   L0213F8
L02144A  LDA   $16
         CMP   #$0003
         BEQ   L021454
         BRL   L021498
L021454  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L026E83
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L02148F
         DEX
L02148F  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L021498  LDA   $16
         CMP   #$0004
         BEQ   L0214A2
         BRL   L0214E6
L0214A2  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L02703C
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0214DD
         DEX
L0214DD  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L0214E6  LDA   $16
         CMP   #$0005
         BEQ   L0214F0
         BRL   L021534
L0214F0  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0271FA
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L02152B
         DEX
L02152B  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3

L021534  LDA   $16
         CMP   #$0006
         BEQ   L02153E
         BRL   L021582
L02153E  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0273FE	; Write line edit
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021579
         DEX
L021579  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3

L021582  LDA   $16
         CMP   #$0007
         BEQ   L02158C
         BRL   L0215D0
L02158C  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0275BC
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0215C7
         DEX
L0215C7  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L0215D0  LDA   $16
         CMP   #$0008
         BEQ   L0215DA
         BRL   L02161E
L0215DA  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0276C8
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021615
         DEX
L021615  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L02161E  LDA   $16
         CMP   #$0009
         BEQ   L021628
         BRL   L02166C
L021628  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L027E8C
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021663
         DEX
L021663  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L02166C  LDA   $16
         CMP   #$000A
         BEQ   L021676
         BRL   L0216BA
L021676  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L028298
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0216B1
         DEX
L0216B1  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3
L0216BA  LDA   $16
         CMP   #$000B
         BEQ   L0216C4
         BRL   L0216F2
L0216C4  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L028459
         BRL   L0217C3
L0216F2  LDA   $16
         CMP   #$000C
         BEQ   L0216FC
         BRL   L02172A
L0216FC  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L028560
         BRL   L0217C3

L02172A  LDA   $16
         CMP   #$000D
         BEQ   L021734
         BRL   L021778

L021734  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L02865D
         LDA   #$0000
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L02176F
         DEX
L02176F  STX   L026C67+2
         STA   L026C67
         BRL   L0217C3

L021778  LDA   $16
         CMP   #$000E
         bne   checkRECTANGLE

         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         pha
         LDY   #$0038
         LDA   [$00],Y
         pha
         JSL   L028818
         stz   L026C6B
         stz   L026C67+2
         stz   L026C67
	 brl   L0217C3
	 
*--- AV 202010 - Add Rectangle and Thermometer

checkRECTANGLE
         LDA   $16	; Rectangle
         CMP   #$000F
         bne   checkTHERMOMETER

         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         pha
         LDY   #$0038
         LDA   [$00],Y
         pha
         JSL   writeRECTANGLE
         stz   L026C6B
         stz   L026C67+2
         stz   L026C67
	 bra   L0217C3

checkTHERMOMETER
         LDA   $16	; Thermometer
         CMP   #$0010
         bne   L0217C3

         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         pha
         LDY   #$0038
         LDA   [$00],Y
         pha
         JSL   writeTHERMOMETER
         stz   L026C6B
         stz   L026C67+2
         stz   L026C67

*--- end of AV 202010

L0217C3  LDA   $16
         STA   L026C31
         _InitCursor
         STA   L02C957
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L0217DA  TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _SetPort
         STA   L02C957
         PHA
         PHA
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _FindHandle
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDX   $18
         LDA   $16
         PHX
         PHA
         _DisposeHandle
         STA   L02C957
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L021833  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L021848
         DEX
L021848  PHX
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         CLC
         ADC   #$4000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L02186C
         DEX
L02186C  PHX
         PHA
         _NewHandle
         STA   L02C957
         PLA
         STA   L026C77
         PLA
         STA   L026C79
         LDA   L02C957
         PHA
         LDA   #$0501
         PHA
         JSL   L020419
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STX   $08
         STA   $06
         PEI   $08
         PEI   $06
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDY   #$0002
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y
         LDY   #$0006
         LDA   #$0001
         STA   [$06],Y
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         LDY   #$0008
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y
         LDY   #$000C
         LDA   #$0000
         STA   [$06],Y
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L02190D  TSC
         SEC
         SBC   #$0026
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $24
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L02C957
         PHA
         LDA   #$0601
         PHA
         JSL   L020419
         LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L02C957

*         PHA

         LDY   #$0002
         LDA   [$20],Y
         TAX
         LDA   [$20]
         STA   $00
         STX   $02

         LDY   #$0010
         LDA   [$00],Y
*         TAX
	sta	theDEFPROC+2
         LDY   #$000E
         LDA   [$00],Y
	sta	theDEFPROC
*         PHX
*         PHA
*         _HiWord
*         STA   L02C957
*         PLA
*         STA   $16

         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $24
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $24
*         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
*         TXA
	lda	theDEFPROC+2
	ldx	theDEFPROC

         RTL

theDEFPROC	ds	4	; we have the defproc here now

*--- From the resource to the control management window

L0219F9  TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         JSL   L02190D	; get the resource defproc
         STA   $16	; A has the high word
	 		; X has the low word
         CMP   #$07FF	; Icon
         bne   L021A30
L021A12  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L030057	; Icon control - from the resource to the window
         BRL   L021C04

L021A30  CMP   #$8000
         bne   L021A58
L021A3A  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L030853
         BRL   L021C04

L021A58  CMP   #$8100
         bne   L021A80
L021A62  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L030B5F
         BRL   L021C04

L021A80  CMP   #$8200
         bne   L021AA8
L021A8A  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L030E51
         BRL   L021C04

L021AA8  CMP   #$8300	; Line Edit control - from the resource to the window
         bne   L021AD0
L021AB2  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0310E1	; show window
         BRL   L021C04

L021AD0  CMP   #$8400
         bne   L021AF8
L021ADA  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L03143D
         BRL   L021C04
	 
L021AF8  CMP   #$8500
         bne   L021B30
L021B02  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         JSL   L03171C
         BRL   L021C04
	 
L021B30  CMP   #$8600
         bne   L021B58
L021B3A  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0322D6
         BRL   L021C04

L021B58  CMP   #$8700
         bne   L021B80
L021B62  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0327DA
         BRL   L021C04

L021B80  CMP   #$8800
         bne   L021BA8
L021B8A  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L032B88
         BRL   L021C04

L021BA8  CMP   #$8900
         bne   L021BD0
L021BB2  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L032D53
         BRL   L021C04

L021BD0  CMP   #$8D00
         bne   L021BD1
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L032F4A
         BRL   L021C04

* AV 202010 - Add Rectangle and Thermometer

L021BD1  cmp   #$87FF
         bne   L021BF8
	 cpx   #$0002		; $87FF0002
	 bne   L021BD2

         LDX   L026C61+2	; we have a thermometer
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   doTHERMOMETER
         bra   L021C04

L021BD2	 cpx   #$0003		; $87FF0003
	 bne   L021BF8

         LDX   L026C61+2	; we have a rectangle
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   doRECTANGLE
         bra   L021C04

*---
	 
L021BF8  LDA   L02C957
         PHA
         LDA   #$0701
         PHA
         JSL   L020419

L021C04  JSL   L021833
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _ShowWindow
         STA   L02C957
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _SetPort
         STA   L02C957
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$000C
         STA   $00
         STX   $02
         LDA   $16
         STA   [$00]
         LDX   L026C79
         LDA   L026C77
         PHX
         PHA
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _SetWRefCon
         STA   L02C957
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L021C6C  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         JSL   L0212A0
         JSL   L021833
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         AND   #$0400
         BNE   L021C94
         BRL   L021CB6
L021C94  LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$000C
         STA   $00
         STX   $02
         LDA   #$0001
         STA   [$00]
         BRL   L021CD5
L021CB6  LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$000C
         STA   $00
         STX   $02
         LDA   #$0002
         STA   [$00]
L021CD5  JSL   L020011
         LDX   L026C79
         LDA   L026C77
         PHX
         PHA
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _SetWRefCon
         STA   L02C957
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _ShowWindow
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L026C31
         LDX   #$0000
         TAY
         BPL   L021D1B
         DEX
L021D1B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L021D39  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _SetPort
         STA   L02C957
         PHA
         PHA
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _GetWRefCon
         STA   L02C957
         PLA
         STA   L026C77
         PLA
         STA   L026C79
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L021D8C  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         JSL   L0217DA
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _CloseWindow
         STA   L02C957
         LDA   #$0100
         PHA
         _DisableMItem
         STA   L02C957
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L021DC1  TSC
         SEC
         SBC   #$002A
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L021DD6
         DEX
L021DD6  PHX
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021DF6
         DEX
L021DF6  PHX
         PHA
         _NewHandle
         STA   L02C957
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L02C957
         PHA
         LDA   #$0B01
         PHA
         JSL   L020419
         LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L021DC1
         PEA   L021DC1
         LDA   #$0000
         PHA
         JSL   L02C5F5
         LDA   #$0000
         TAX
         TXA
         CLC
         ADC   #L026C83
         PEA   ^L026C83
         PHA
         LDY   #$0002
         LDA   [$20],Y
         PHA
         LDA   [$20]
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L021E4E
         DEX
L021E4E  PHX
         PHA
         _BlockMove
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8006
         PHA
         _UniqueResourceID
         STA   L02C957
         PLA
         STA   $24
         PLA
         STA   $26
         LDX   $22
         LDA   $20
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$8006
         PHA
         LDX   $26
         LDA   $24
         PHX
         PHA
         _AddResource
         STA   L02C957
         LDA   #$8006
         PHA
         LDX   $26
         LDA   $24
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$0B05
         PHA
         JSL   L020419
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDX   $26
         LDA   $24
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDX   $26
         LDA   $24
         STX   $18
         STA   $16
         LDX   $18
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         TYA
         RTL

L021F06  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   $27
         LDA   $25
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L026C6D+2
         STA   L026C6D
         PHA
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L026C73
         PLA
         STA   L026C75
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L026C71
         LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L026C75
         LDA   L026C73
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDA   #$8006
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$0C04
         PHA
         JSL   L020419
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L02C957
         LDA   L026C71
         CLC
         ADC   #$0001
         LDX   #$0000
         TAY
         BPL   L021FFC
         DEX
L021FFC  PHX
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$0C06
         PHA
         JSL   L020419
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L026C71
         LDA   #L026C71
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L022045
         DEX
L022045  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   L026C71
         STA   $06
         LDA   #$0001
         STA   $1A
         LDA   $06
         SEC
         SBC   $1A
         BVS   L022065
         EOR   #$8000
L022065  BMI   L02206A
         BRL   L0220A1
L02206A  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   $1A
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   $1A
         SEC
         SBC   #$0001
         TAX
         LDA   L026C83,X
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   $06
         CMP   $1A
         BNE   L02209C
         BRL   L0220A1
L02209C  INC   $1A
         BRL   L02206A
L0220A1  LDA   #$0001
         PHA
         LDA   #$8006
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _MarkResourceChange
         STA   L02C957
         LDA   #$8006
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$0C09
         PHA
         JSL   L020419
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDA   $1F
         STA   $27
         LDA   $1E
         STA   $26
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L022116  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   $25
         LDA   $23
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L026C6D+2
         STA   L026C6D
         PHA
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L026C73
         PLA
         STA   L026C75
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L026C71
         PHA
         PHA
         LDX   L026C75
         LDA   L026C73
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   L026C71
         PHA
         _Hex2Long
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         LDX   $18
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         TYA
         RTL

L0221CB  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   $27
         LDA   $25
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L026C6D+2
         STA   L026C6D
         PHA
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L026C73
         PLA
         STA   L026C75
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L026C71
         LDA   $23
         BNE   L022249
         BRL   L022271
L022249  PHA
         LDX   L026C75
         LDA   L026C73
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   L026C71
         PHA
         _Hex2Int
         STA   L02C957
         PLA
         STA   $16
         BRL   L0222DF
L022271  LDX   #^L026C71
         LDA   #L026C71
         PHX
         PHA
         LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L02228B
         DEX
L02228B  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDX   L026C75
         LDA   L026C73
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L026C83
         PEA   ^L026C83
         PHA
         LDA   L026C71
         LDX   #$0000
         TAY
         BPL   L0222C1
         DEX
L0222C1  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C4A4
         STA   $16
L0222DF  LDA   $21
         STA   $27
         LDA   $20
         STA   $26
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         TXA
         RTL

L0222F2  TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $16
         LDA   #$0001
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         STA   L02C957
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$0F02
         PHA
         JSL   L020419
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $16
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $16
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

*--- Icon control management (from the control window to the resource)

L0223F9  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18

* AV 202010

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	[$00]	; check pCount
	cmp	#12	; if already 12
	bcs	nci12P	; we are good

	pha
	pha
	pei	$18
	pei	$16
	_GetHandleSize
	plx
	ply
	cpy	#0
	bne	nci12P	; check size of $30
	cpx	#48	; we have the right size
	bcs	nci12P

	pei	$18	; size is < $30 bytes
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $30 bytes long
	pea	$0030
	pei	$18
	pei	$16
	_SetHandleSize

*---

nci12P
         LDA   L02C957
         PHA
         LDA   #$1001
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L02248C
         DEX
L02248C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L026C6D+2
         STA   L026C6D
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L026C71
         LDA   L026C71
         BMI   L0224DA
         DEC
         BPL   L0224DD
L0224DA  BRL   L02269C
L0224DD  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0224FD
         BVS   L0224FB
         EOR   #$8000
L0224FB  BMI   L022500
L0224FD  BRL   L0225A0
L022500  LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L02C957
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetHandleSize
         STA   L02C957
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L02252C
         DEX
L02252C  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$1004
         PHA
         JSL   L020419
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0008	; Eight parms?
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L022580
         DEX
L022580  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L0225A0  PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L0225CE
         INX
L0225CE  TXA
         PHA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L0225FE
         INX
L0225FE  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L022608
         BRL   L02262C
L022608  JSL   L021DC1
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L02262C  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$0002
         BEQ   L022645
         BRL   L022670
L022645  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022670  LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L02267A
         DEX
L02267A  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         JSL   L021F06
         BRL   L022726
L02269C  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         SEC
         SBC   #$0008
         BVS   L0226B3
         EOR   #$8000
L0226B3  BMI   L0226B8
         BRL   L022726
L0226B8  LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0226C2
         DEX
L0226C2  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$0002
         BNE   L0226FB
         BRL   L022726
L0226FB  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         EOR   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022726  LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L022730
         DEX
L022730  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0012
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]

*--- AV 202010 - Handle the icon invisible flag bit 7

	ldy	#2	; points to the control record
	lda	[$16],y
	sta	$02
	lda	[$16]
	sta	$00

	lda	[$00]	; if 11 parms
	cmp	#11	; do not erase
	bcs	nci11P	; the key equivalent
	
	lda	#0	; init values
	ldy	#$28
	sta	[$00],y
	iny
	iny
	sta	[$00],y
	iny
	iny
	sta	[$00],y

nci11P
	lda	#12	; and force 12 parms now
	sta	[$00]

	ldy	#$2e
	lda	#0
	sta	[$00],y

*--- Bit 7

	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0012
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	icnBIT7
	lda	[$00],y		; set bit
	ora	#%00000000_10000000
	sta	[$00],y
	bne	icnNOBIT7
icnBIT7	lda	[$00],y		; reset bit
	and	#%11111111_01111111
	sta	[$00],y

icnNOBIT7

*--- Bit 3

	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0013
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	icnBIT3
	lda	[$00],y		; set bit
	ora	#%00000000_00001000
	sta	[$00],y
	bne	icnNOBIT3
icnBIT3	lda	[$00],y		; reset bit
	and	#%11111111_11110111
	sta	[$00],y

icnNOBIT3

*--- Bit 4 - sticky icons

	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0014
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	icnBIT4
	lda	[$00],y		; set bit
	ora	#%00000000_00010000
	sta	[$00],y
	
* Get the radio button value and set as the default value
* ID $15 is the off button. If off is selected, its value is 1, so we record 0, meaning sticky is set but value is 0

	pha			; check off is selected
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0015
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	pla
	eor	#$0001		; 1 off becomes 0, 0 becomes 1
	bra	icnNOSTICK
	
*--- Sticky is not selected
	
icnBIT4	lda	[$00],y		; reset bit
	and	#%11111111_11101111
	sta	[$00],y

	lda	#0		; set the initial value to 0 as Sticky is not checked

icnNOSTICK
	ldy	#$2e		; set the initial value
	sta	[$00],y
	
icnNOBIT4

*---

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0012
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02279A
         BRL   L0227C5
L02279A  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- The rest of the code

L0227C5  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0227F4
         BRL   L022905
L0227F4  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0009
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L022823
         BRL   L02284E
L022823  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02284E  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L022861
         DEX
L022861  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02287D
         BRL   L0228A8
L02287D  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0228A8  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L0228BB
         DEX
L0228BB  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0228D7
         BRL   L022902
L0228D7  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0003
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022902  BRL   L022930
L022905  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0004
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022930  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L02293C  TSC
         SEC
         SBC   #$002C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $2A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $24
         PLA
         STA   $26
         LDA   L02C957
         PHA
         LDA   #$5001
         PHA
         JSL   L020419
         PHA
         LDA   $2A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $2A
         LDX   $26
         LDA   $24
         PHX
         PHA
         _HLock
         STA   L02C957
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         _SetPort
         STA   L02C957
         LDA   #$001B
         STA   L026C47+2
         LDA   #$2006
         STA   L026C47
L0229DF  LDA   #$0000
         STA   $16
         PHA
         LDA   #$FFFF
         PHA
         LDX   #^L026C33
         LDA   #L026C33
         PHX
         PHA
         _TaskMaster
         STA   L02C957
         PLA
         STA   $18
         LDA   $18
         CMP   #$0021
         BEQ   L022A08
         BRL   L022F22
L022A08  PHA
         LDX   L026C5B
         LDA   L026C59
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         STA   $22
         LDA   $22
         BRL   L022EF8
L022A23  LDA   #$0001
         STA   $16
         BRL   L022F22
L022A2B  LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0004
         BNE   L022A44
         BRL   L022A6F
L022A44  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         EOR   #$0004
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022A6F  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L022A82
         DEX
L022A82  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L022A9E
         BRL   L022AC9
L022A9E  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         ORA   #$0004
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022AC9  BRL   L022F22
L022ACC  LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0002
         BNE   L022AE5
         BRL   L022B10
L022AE5  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         EOR   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022B10  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L022B23
         DEX
L022B23  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L022B3F
         BRL   L022B6A
L022B3F  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022B6A  BRL   L022F22
L022B6D  LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0001
         BNE   L022B86
         BRL   L022BB1
L022B86  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         EOR   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022BB1  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L022BC4
         DEX
L022BC4  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L022BE0
         BRL   L022C0B
L022BE0  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L022C0B  BRL   L022F22
L022C0E  LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$F000
         STA   $28
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDA   $28
         PHA
         JSL   L0203E3
         PHA
         _SpecialRect
         STA   L02C957
         BRL   L022F22
L022C8C  LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0F00
         STA   $28
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDA   $28
         PHA
         JSL   L0203AD
         PHA
         _SpecialRect
         STA   L02C957
         BRL   L022F22
L022CE7  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L022CFA
         DEX
L022CFA  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L022D16
         BRL   L022E05
L022D16  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$F0FF
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $22
         LDX   #$0000
         TAY
         BPL   L022D55
         DEX
L022D55  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlRefCon
         STA   L02C957
         _LoWord
         STA   L02C957
         PLA
         STA   $28
         LDA   $28
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   $28
         LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         ORA   $28
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0F00
         PHA
         JSL   L0203AD
         PHA
         _SpecialRect
         STA   L02C957
         BRL   L022EF5
L022E05  LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0FFF
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         PHA
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   $22
         LDX   #$0000
         TAY
         BPL   L022E44
         DEX
L022E44  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlRefCon
         STA   L02C957
         _LoWord
         STA   L02C957
         PLA
         STA   $28
         LDA   $28
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   $28
         LDY   #$0002
         LDA   [$24],Y
         PHA
         LDA   [$24]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         ORA   $28
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$24],Y
         TAX
         LDA   [$24]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$F000
         PHA
         JSL   L0203E3
         PHA
         _SpecialRect
         STA   L02C957
L022EF5  BRL   L022F22
L022EF8  SEC
         SBC   #$0001
         CMP   #$0007
         BCC   L022F04
         LDA   #$0007
L022F04  ASL
         TAX
         LDAL  L022F12,X
         BEQ   L022F0E
         PHA
         RTS

L022F0E  JSL   L02C9E9

L022F12  DA    L022A23-1
         DA    L022A23-1
         DA    L022A2B-1
         DA    L022ACC-1
         DA    L022B6D-1
         DA    L022C0E-1
         DA    L022C8C-1
         DA    L022CE7-1
	 
L022F22  LDA   $18
         CMP   #$0014
         BEQ   L022F2C
         BRL   L022F7A
L022F2C  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L02C957
         LDA   #$0000
         PHA
         LDA   L026C3F
         PHA
         LDA   L026C3D
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDX   L026C43+2
         LDA   L026C43
         PHX
         PHA
         _DragWindow
         STA   L02C957
L022F7A  LDA   $16
         BNE   L022F81
         BRL   L0229DF
L022F81  PHA
         PHA
         _FrontWindow
         STA   L02C957
         _CloseWindow
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $2A
         LDA   $22
         CMP   #$0001
         BEQ   L022FB3
         BRL   L023025
L022FB3  LDA   #$0001
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         STA   L02C957
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$5003
         PHA
         JSL   L020419
L023025  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $2A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $2A
         PLD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L023077  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
L0230A4  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1101
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L023102
         DEX
L023102  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         JSL   L021F06
	 pea   $0000
	 pea   $000b
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0012
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L023179
         DEX
L023179  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023195
         BRL   L0231C0
L023195  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080		; set invisible bit
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0231C0  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L0231D3
         DEX
L0231D3  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0231EF
         BRL   L02321A
L0231EF  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02321A  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L02322D
         DEX
L02322D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023249
         BRL   L023274
L023249  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023274  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L023287
         DEX
L023287  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0232A3
         BRL   L0232CE
L0232A3  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0003
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0232CE  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

*--- AV 202010 Stat text controls - From the window to the control resource

L0232DA  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1201
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L023365
         DEX
L023365  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

	ldy	#2	; points to the control record
	lda	[$16],y
	sta	$02
	lda	[$16]
	sta	$00
	
*--- Bit 7

	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000d
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	noBIT7
	lda	[$00],y		; set bit
	ora	#%00000000_10000000
	sta	[$00],y
	bne	doBIT1
noBIT7	lda	[$00],y		; reset bit
	and	#%11111111_01111111
	sta	[$00],y

*--- Bit 1

doBIT1	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000c
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	noBIT1
	lda	[$00],y		; set bit
	ora	#%00000000_00000010
	sta	[$00],y
	bne	doBIT2
noBIT1	lda	[$00],y		; reset bit
	and	#%11111111_11111101
	sta	[$00],y

*--- Bit 2

doBIT2	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0010
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	noBIT2
	lda	[$00],y		; set bit
	ora	#%00000000_00000100
	sta	[$00],y
	bne	doBIT3
noBIT2	lda	[$00],y		; reset bit
	and	#%11111111_11111011
	sta	[$00],y

*--- Bit 3

doBIT3	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000f
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	noBIT3
	lda	[$00],y		; set bit
	ora	#%00000000_00001000
	sta	[$00],y
	bne	doBIT4
noBIT3	lda	[$00],y		; reset bit
	and	#%11111111_11110111
	sta	[$00],y

*--- Bit 4

doBIT4	pha
	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000e
	_GetCtlHandleFromID
	sta	L02C957
	_GetCtlValue
	sta	L02C957
	ldy	#$12
	pla
	beq	noBIT4
	lda	[$00],y		; set bit
	ora	#%00000000_00010000
	sta	[$00],y
	bne	doBIT5
noBIT4	lda	[$00],y		; reset bit
	and	#%11111111_11101111
	sta	[$00],y

doBIT5

*--- End of work

L023500  LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L02C957
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetHandleSize
         STA   L02C957
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L02352C
         DEX
L02352C  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$1204
         PHA
         JSL   L020419
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L02357A  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L02359A
         BVS   L023598
         EOR   #$8000
L023598  BMI   L02359D
L02359A  BRL   L023602
L02359D  LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L02C957
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetHandleSize
         STA   L02C957
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L0235C9
         DEX
L0235C9  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$1207
         PHA
         JSL   L020419
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
L023602  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0020
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L02363B
         DEX
L02363B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023657
         BRL   L02366F
L023657  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0020
         STA   $00
         STX   $02
         LDA   #$0002
         STA   [$00]
         BRL   L023701
L02366F  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L023682
         DEX
L023682  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02369E
         BRL   L0236BA
L02369E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0020
         STA   $00
         STX   $02
         LDA   #$0001
         EOR   #$FFFF
         INC
         STA   [$00]
         BRL   L023701
L0236BA  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L0236CD
         DEX
L0236CD  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0236E9
         BRL   L023701
L0236E9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0020
         STA   $00
         STX   $02
         LDA   #$0001
         STA   [$00]
         BRL   L023701
L023701  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L02370D  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1301
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L023798
         DEX
L023798  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         JSL   L021F06
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L0237C1
         DEX
L0237C1  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L0237FA
         DEX
L0237FA  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023816
         BRL   L023844
L023816  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L023890
L023844  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L02385D
         BRL   L023890
L02385D  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023890  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0238D4
         BRL   L0238E9
L0238D4  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0001
         STA   [$00]
L0238E9  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

*--- Line Edit control template feedback (from the window to the resource)

L0238F5  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16	; return the handle to the resource
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1401
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18	; lock handle
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957

*--- AV 202010 - Add the extra parm

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	[$00]	; check pCount
	cmp	#10	; if already 10
	bcs	le10P	; we are good

	pha
	pha
	pei	$18
	pei	$16
	_GetHandleSize
	plx
	ply
	cpy	#0
	bne	le10P	; check size of 32+2+2
	cpx	#$24	; we have the right size
	bcs	le10P

	pei	$18	; size is < $24 bytes
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $24 bytes long
	pea	$0024
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

	lda	[$00]	; if we have 9 parms
	cmp	#9	; add parm 10 only
	bcs	le9P

	ldy	#$20	; pwChar
	lda	#$ffff	; default password character
	sta	[$00],y

le9P	ldy	#$22	; keyMask
	lda	#$0001 
	sta	[$00],y

	lda	#10	; 10 parms now
	sta	[$00]

*---

le10P	
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L0239A4
         INX
L0239A4  TXA
         PHA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L0239D4
         INX
L0239D4  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L0239DE
         BRL   L023A02
L0239DE  JSL   L021DC1
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001C
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L023A02  LDA   #$0006	; Text value
         LDX   #$0000
         TAY
         BPL   L023A0C
         DEX
L023A0C  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         JSL   L021F06
         LDA   #$0008	; refCon value
         LDX   #$0000
         TAY
         BPL   L023A35
         DEX
L023A35  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         LDA   #$0004	; maxChars value
         LDX   #$0000
         TAY
         BPL   L023A74
         DEX
L023A74  PHX
         PHA
         LDA   #$0000
         PHA
         JSL   L0221CB
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         SEC
         SBC   #$00FF
         BEQ   L023AA4
         BVS   L023AA2
         EOR   #$8000
L023AA2  BMI   L023AA7
L023AA4  BRL   L023ABC
L023AA7  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001A
         STA   $00
         STX   $02
         LDA   #$00FF
         STA   [$00]
L023ABC  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   #$0000
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L023ADF
         BVS   L023ADD
         EOR   #$8000
L023ADD  BMI   L023AE2
L023ADF  BRL   L023AF7
L023AE2  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L023AF7  PHA		; the invisible bit
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $000C
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023B26
         BRL   L023B54
L023B26  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L023BA0

L023B54  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L023B6D
         BRL   L023BA0
L023B6D  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- AV 202010 - Handle the new fields

L023BA0
         LDY   #$0002	; first of all, get the target control pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

         PHA		; the Not a password checkbox
         PHA		; if set, we put a #$FFFF in pwChar
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $000f
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 cmp	#1
	 bne	L023BA1	; it is not checked, verify the pwChar value
	 
	ldy	#$20	; Not a password is checked
	lda	#-1	; save the value
	sta	[$00],y
	bra	L023BA3	; we skip the rest

L023BA1 
	pha		; pwChar value
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000e
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	pha
	ldy	#$1c
	lda	[$00],y
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
			; we do not init the value
			
	pha		; from a hex string to a int value
	lda	thePOINTER+2
	pha
	lda	thePOINTER
	pha
	pea	$0004
	_Hex2Int
	pla
	bcs	L023BA3

	ldy	#$20	; value is valid
	sta	[$00],y	; save it

*---

L023BA3	
	pha		; keyMask value
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0011
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	pha
	ldy	#$1c
	lda	[$00],y
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
	
	ldy	#$22	; set the default value
	lda	#$0001
	sta	[$00],y
	
	pha		; from a hex string to a int value
	lda	thePOINTER+2
	pha
	lda	thePOINTER
	pha
	pea	$0004
	_Hex2Int
	pla
	bcs	L023BA5

	ldy	#$22	; value is valid
	sta	[$00],y	; save it
		
*---

L023BA5	
         PHA		; password chekbox
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $0003
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023BCF
         BRL   L023BFA
L023BCF  LDY   #$0002	; is checked
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         ORA   #$8000	; set bit 15 of the maxSize field
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023BFA  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

theLENGTH	ds	2	; length of the Line Edit text
theHANDLE	ds	4	; handle to the line edit control
thePOINTER	ds	4	; pointer to the pwCHAR on feedback
thePWCHAR	ds	2	; the returned value
theKEYMASK	ds	2	; the second returned value

*---

L023C06  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1501
         PHA
         JSL   L020419
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L023C91
         DEX
L023C91  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         JSL   L021F06
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L023CBA
         DEX
L023CBA  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L023CF9
         DEX
L023CF9  PHX
         PHA
         LDA   #$0000
         PHA
         JSL   L0221CB
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         SEC
         SBC   #$007F
         BEQ   L023D29
         BVS   L023D27
         EOR   #$8000
L023D27  BMI   L023D2C
L023D29  BRL   L023D41
L023D2C  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0012
         STA   $00
         STX   $02
         LDA   #$007F
         STA   [$00]
L023D41  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L023D54
         DEX
L023D54  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023D70
         BRL   L023D9E
L023D70  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L023DEA
L023D9E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L023DB7
         BRL   L023DEA
L023DB7  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023DEA  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L023E12
         DEX
L023E12  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023E2E
         BRL   L023E43
L023E2E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0001
         STA   [$00]
L023E43  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L023E4F  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1601
         PHA
         JSL   L020419
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L023EDA
         DEX
L023EDA  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         pea   $0000
	 pea   $0015
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023F2F
         BRL   L023F5D
L023F2F  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L023FA9
L023F5D  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L023F76
         BRL   L023FA9
L023F76  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023FA9  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L023FBC
         DEX
L023FBC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L023FD8
         BRL   L024030
L023FD8  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L02400D
         DEX
L02400D  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         BRL   L02407C
L024030  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$0800
         BNE   L024049
         BRL   L02407C
L024049  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0800
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02407C  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L02408F
         DEX
L02408F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0240AB
         BRL   L0240D8
L0240AB  LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L0240B5
         DEX
L0240B5  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         BRL   L024102
L0240D8  LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0240E2
         DEX
L0240E2  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0026
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L024102  LDA   #$0000
         STA   $1A
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L02411A
         DEX
L02411A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024136
         BRL   L02413D
L024136  LDA   $1A
         ORA   #$2000
         STA   $1A
L02413D  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L024150
         DEX
L024150  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02416C
         BRL   L024173
L02416C  LDA   $1A
         ORA   #$1000
         STA   $1A
L024173  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L024186
         DEX
L024186  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0241A2
         BRL   L0241A9
L0241A2  LDA   $1A
         ORA   #$0800
         STA   $1A
L0241A9  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0241D8
         BRL   L0241DF
L0241D8  LDA   $1A
         ORA   #$0400
         STA   $1A
L0241DF  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L0241F2
         DEX
L0241F2  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02420E
         BRL   L024215
L02420E  LDA   $1A
         ORA   #$0200
         STA   $1A
L024215  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L024228
         DEX
L024228  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024244
         BRL   L02424B
L024244  LDA   $1A
         ORA   #$0100
         STA   $1A
L02424B  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L02425E
         DEX
L02425E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02427A
         BRL   L024281
L02427A  LDA   $1A
         ORA   #$0080
         STA   $1A
L024281  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L024294
         DEX
L024294  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0242B0
         BRL   L0242B7
L0242B0  LDA   $1A
         ORA   #$0020
         STA   $1A
L0242B7  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L0242CA
         DEX
L0242CA  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0242E6
         BRL   L0242ED
L0242E6  LDA   $1A
         ORA   #$0010
         STA   $1A
L0242ED  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L024300
         DEX
L024300  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02431C
         BRL   L024323
L02431C  LDA   $1A
         ORA   #$0008
         STA   $1A
L024323  LDA   $1A
         CLC
         ADC   #$0000
         LDX   #$0000
         TAY
         BPL   L024330
         DEX
L024330  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         PLA
         STA   $00
L024344  PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L024372
         DEX
L024372  PHX
         PHA
         JSL   L02C8EA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0243A2  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1701
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L02442D
         DEX
L02442D  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L02446C
         DEX
L02446C  PHX
         PHA
         LDA   #$0000
         PHA
         JSL   L0221CB
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         PHA
         LDA   #$0000
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0244A1
         BVS   L02449F
         EOR   #$8000
L02449F  BMI   L0244A4
L0244A1  BRL   L0244B9
L0244A4  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L0244B9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         SEC
         SBC   #$03E7
         BEQ   L0244D7
         BVS   L0244D5
         EOR   #$8000
L0244D5  BMI   L0244DA
L0244D7  BRL   L0244EF
L0244DA  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$03E7
         STA   [$00]
L0244EF  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001C
         PHA
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L024508
         DEX
L024508  PHX
         PHA
         LDA   #$0000
         PHA
         JSL   L0221CB
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDA   #$0000
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L02453D
         BVS   L02453B
         EOR   #$8000
L02453B  BMI   L024540
L02453D  BRL   L024555
L024540  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001C
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L024555  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L02456E
         DEX
L02456E  PHX
         PHA
         LDA   #$0000
         PHA
         JSL   L0221CB
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   #$0000
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0245A3
         BVS   L0245A1
         EOR   #$8000
L0245A1  BMI   L0245A6
L0245A3  BRL   L0245BB
L0245A6  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L0245BB  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0014
         LDX   #$0000
         TAY
         BPL   L0245CE
         DEX
L0245CE  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0245EA
         BRL   L024618
L0245EA  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024664
L024618  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L024631
         BRL   L024664
L024631  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024664  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0010
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0008
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0004
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0002
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0001
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0013
         LDX   #$0000
         TAY
         BPL   L024776
         DEX
L024776  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024792
         BRL   L024874
L024792  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0010
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0247D0
         DEX
L0247D0  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0247EC
         BRL   L024817
L0247EC  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0008
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024817  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L02482A
         DEX
L02482A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024846
         BRL   L024871
L024846  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0004
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024871  BRL   L024957
L024874  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0012
         LDX   #$0000
         TAY
         BPL   L024887
         DEX
L024887  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0248A3
         BRL   L024957
L0248A3  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L0248B6
         DEX
L0248B6  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0248D2
         BRL   L0248FD
L0248D2  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0248FD  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L024910
         DEX
L024910  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02492C
         BRL   L024957
L02492C  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024957  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L024963  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1801
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L0249EE
         DEX
L0249EE  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L024A27
         DEX
L024A27  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024A43
         BRL   L024A71
L024A43  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024ABD
L024A71  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L024A8A
         BRL   L024ABD
L024A8A  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024ABD  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L024AD0
         DEX
L024AD0  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024AEC
         BRL   L024B1A
L024AEC  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$FF00
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024B66
L024B1A  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$FF00
         BNE   L024B33
         BRL   L024B66
L024B33  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$FF00
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024B66  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L024B79
         DEX
L024B79  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024B95
         BRL   L024BC3
L024B95  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0040
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024C0F
L024BC3  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0040
         BNE   L024BDC
         BRL   L024C0F
L024BDC  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0040
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024C0F  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L024C22
         DEX
L024C22  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024C3E
         BRL   L024C6C
L024C3E  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0020
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024CB8
L024C6C  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0020
         BNE   L024C85
         BRL   L024CB8
L024C85  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0020
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024CB8  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L024CCB
         DEX
L024CCB  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024CE7
         BRL   L024D15
L024CE7  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0010
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024D61
L024D15  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0010
         BNE   L024D2E
         BRL   L024D61
L024D2E  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0010
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024D61  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L024D74
         DEX
L024D74  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024D90
         BRL   L024DBE
L024D90  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0008
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024E0A
L024DBE  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0008
         BNE   L024DD7
         BRL   L024E0A
L024DD7  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0008
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024E0A  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024E39
         BRL   L024E67
L024E39  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0004
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024EB3
L024E67  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0004
         BNE   L024E80
         BRL   L024EB3
L024E80  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0004
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024EB3  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L024EC6
         DEX
L024EC6  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024EE2
         BRL   L024F10
L024EE2  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024F5C
L024F10  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0002
         BNE   L024F29
         BRL   L024F5C
L024F29  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0002
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024F5C  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L024F6F
         DEX
L024F6F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L024F8B
         BRL   L024FB9
L024F8B  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L025005
L024FB9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0001
         BNE   L024FD2
         BRL   L025005
L024FD2  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0001
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025005  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L025011  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1901
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L02509C
         DEX
L02509C  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L0250D5
         DEX
L0250D5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0250F1
         BRL   L02511F
L0250F1  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L02516B
L02511F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L025138
         BRL   L02516B
L025138  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02516B  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L02517E
         DEX
L02517E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02519A
         BRL   L0251C8
L02519A  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L025214
L0251C8  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0001
         BNE   L0251E1
         BRL   L025214
L0251E1  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0001
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025214  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L025220  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1A01
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L0252AB
         DEX
L0252AB  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0012
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L0252F9
         DEX
L0252F9  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L025315
         BRL   L025340
L025315  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025340  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$001E
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L025368
         DEX
L025368  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BEQ   L025384
         BRL   L0253AF
L025384  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         ORA   #$0001
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0253AF  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L0253BB  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1B01
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L025446
         DEX
L025446  PHX
         PHA
         JSL   L022116
         PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0016
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L02547F
         DEX
L02547F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02549B
         BRL   L0254C9
L02549B  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L025515
L0254C9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L0254E2
         BRL   L025515
L0254E2  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0012
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0080
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025515  JSL   L0222F2
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

*--- AV 202010 LOGO

*--- Rectangle control template feedback (from the window to the resource)

updateRECT
	 TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16	; return the handle to the resource
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1401
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18	; lock handle
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

*--- AV 202010 - Check pCount

	lda	[$00]	; check pCount
	cmp	#8	; if already 8
	bcs	rect8OK	; we are good

	pei	$18
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $1e bytes long
	pea	$001e
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
	 
	lda	#8	; pCount
	sta	[$00]

	ldy	#$1a	; penHeight
	lda	#1
	sta	[$00],y

	ldy	#$1c	; penWidth
	lda	#2 
	sta	[$00],y

rect8OK	

*--- The invisible bit

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $0007
         _GetCtlHandleFromID
         _GetCtlValue
	 ldy	#$12
         PLA
         BNE   rectISINVISIBLE

	 lda	[$00],y	; control is visible
	 and	#%11111111_01111111
	 sta	[$00],y
	 bra	rectNEXT

rectISINVISIBLE
	 lda	[$00],y
	 and	#%11111111_01111111
	 ora	#%00000000_10000000
	 sta	[$00],y

rectNEXT

*--- The penHeight word

	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000d
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	sta	theHANDLE+2
	pha
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02

	pha		; get the length of the text
	PushLong theHANDLE
	_LEGetTextLen
	pla
	sta	theLENGTH
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
			; we do not init the value
			
	pha		; from a dec string to an unsigned int value
	PushLong thePOINTER
	PushWord theLENGTH
	PushWord #0
	_Dec2Int
	pla
	bcs	rectNEXT2

	ldy	#$1a	; value is valid
	sta	[$00],y	; save it

rectNEXT2

*--- The penWidth word

	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000f
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	sta	theHANDLE+2
	pha
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02
	
	pha		; get the length of the text
	PushLong theHANDLE
	_LEGetTextLen
	pla
	sta	theLENGTH

	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
			; we do not init the value
			
	pha		; from a dec string to an unsigned int value
	PushLong thePOINTER
	PushWord theLENGTH
	PushWord #0
	_Dec2Int
	pla
	bcs	rectNEXT3

	ldy	#$1c	; value is valid
	sta	[$00],y	; save it

rectNEXT3

*--- The control's appearance

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $0009
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 beq	rectNEXT4
	 ldx	#$0000	; transparent
	 bra	rectNEXT6

rectNEXT4	 
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $000a
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 beq	rectNEXT5
	 ldx	#$0001	; grey pattern
	 bra	rectNEXT6

rectNEXT5
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $000b
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 beq	rectNEXT7
	 ldx	#$0002	; black pattern

rectNEXT6
	ldy	#$12	; save the control's appearance
	phx
	lda	[$00],y
	and	#%11111111_11111100
	ora	1,s
	plx
	sta	[$00],y
	
rectNEXT7
	
*--- The refCon

	pha		; refCon
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0006
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	pha
	ldy	#$1c
	lda	[$00],y
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY	#$0002	; first of all, get the target control pointer
        LDA	[$16],Y
        TAX
        LDA	[$16]
        STA	$00
        STX	$02

	ldy	#$16
	lda	#0
	sta	[$00],y
	ldy	#$18
	sta	[$00],y

	pha		; from a hex string to a long value
	pha
	lda	thePOINTER+2
	pha
	lda	thePOINTER
	pha
	pea	$0008
	_Hex2Long
	pla
	plx
	bcs	rectNEXT8

	ldy	#$16	; value is valid
	sta	[$00],y	; save it
	ldy	#$18
	txa
	sta	[$00],y	; save the high word

rectNEXT8
	
	 JSL   L0222F2	; save the resource
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

*--- Thermo control template feedback (from the window to the resource)

updateTHERMO
	 TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16	; return the handle to the resource
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$1401
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18	; lock handle
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

*--- AV 202010 - Check pCount

	lda	[$00]	; check pCount
	cmp	#8	; if already 8
	bcs	thermo8OK	; we are good

	pei	$18
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $1e bytes long
	pea	$001e
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
	 
	lda	#8	; pCount
	sta	[$00]

	ldy	#$1a	; position of mercury
	lda	#0
	sta	[$00],y

	ldy	#$1c	; scale
	lda	#100
	sta	[$00],y

thermo8OK	

*--- The invisible bit

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $0007
         _GetCtlHandleFromID
         _GetCtlValue
	 ldy	#$12
         PLA
         BNE   thermoISINVISIBLE

	 lda	[$00],y	; control is visible
	 and	#%11111111_01111111
	 sta	[$00],y
	 bra	thermoNEXT

thermoISINVISIBLE
	 lda	[$00],y
	 and	#%11111111_01111111
	 ora	#%00000000_10000000
	 sta	[$00],y

thermoNEXT

*--- The position of mercury word

	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000d
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	sta	theHANDLE+2
	pha
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02

	pha		; get the length of the text
	PushLong theHANDLE
	_LEGetTextLen
	pla
	sta	theLENGTH
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
			; we do not init the value
			
	pha		; from a dec string to an unsigned int value
	PushLong thePOINTER
	PushWord theLENGTH
	PushWord #0
	_Dec2Int
	pla
	bcs	thermoNEXT2

	ldy	#$1a	; value is valid
	sta	[$00],y	; save it

thermoNEXT2

*--- The scale word

	pha
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$000f
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	sta	theHANDLE+2
	pha
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02

	pha		; get the length of the text
	PushLong theHANDLE
	_LEGetTextLen
	pla
	sta	theLENGTH
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY   #$0002	; first of all, get the target control pointer
        LDA   [$16],Y
        TAX
        LDA   [$16]
        STA   $00
        STX   $02
			; we do not init the value
			
	pha		; from a dec string to an unsigned int value
	PushLong thePOINTER
	PushWord theLENGTH
	PushWord #0
	_Dec2Int
	pla
	bcs	thermoNEXT3

	ldy	#$1c	; value is valid
	sta	[$00],y	; save it

thermoNEXT3

*--- The control's orientation

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $0009
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 beq	thermoNEXT4
	 ldx	#$0000	; vertical thermometer
	 bra	thermoNEXT6

thermoNEXT4	 
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pea   $000a
         _GetCtlHandleFromID
         _GetCtlValue
	 pla
	 beq	thermoNEXT5
	 ldx	#$0001	; horizontal thermometer

thermoNEXT5
thermoNEXT6
	ldy	#$12	; save the control's appearance
	phx
	lda	[$00],y
	and	#%11111111_11111100
	ora	1,s
	plx
	sta	[$00],y
	
thermoNEXT7
	
*--- The refCon

	pha		; refCon
	pha
	pea	$0000
	pea	$0000
	pea	$0000
	pea	$0006
	_GetCtlHandleFromID
	pla		; handle to the control
	sta	$00
	pla
	sta	$02
	
	pha		; space for _LEGetTextHand
	pha
	
	ldy	#2	; we point to the control
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02

	ldy	#$1e	; get the handle to the text
	lda	[$00],y
	pha
	ldy	#$1c
	lda	[$00],y
	pha
	_LEGetTextHand
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2	; we point to the text now
	lda	[$00],y
	sta	thePOINTER+2
	lda	[$00]
	sta	thePOINTER

        LDY	#$0002	; first of all, get the target control pointer
        LDA	[$16],Y
        TAX
        LDA	[$16]
        STA	$00
        STX	$02

	ldy	#$16
	lda	#0
	sta	[$00],y
	ldy	#$18
	sta	[$00],y

	pha		; from a hex string to a long value
	pha
	lda	thePOINTER+2
	pha
	lda	thePOINTER
	pha
	pea	$0008
	_Hex2Long
	pla
	plx
	bcs	thermoNEXT8

	ldy	#$16	; value is valid
	sta	[$00],y	; save it
	ldy	#$18
	txa
	sta	[$00],y	; save the high word

thermoNEXT8
	
	 JSL   L0222F2	; save the resource
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

*---

L025521  TSC
         SEC
         SBC   #$002A
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $24
         PLA
         STA   $26
         LDA   L02C957
         PHA
         LDA   #$5501
         PHA
         JSL   L020419
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDX   $26
         LDA   $24
         PHX
         PHA
         _HLock
         STA   L02C957
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         _SetPort
         STA   L02C957
         LDA   $2D
         CMP   #$07FF
         BEQ   L0255C2
         BRL   L0255CF
L0255C2  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L03447D
         BRL   L025611
L0255CF  LDA   $2D
         CMP   #$8000
         BEQ   L0255D9
         BRL   L0255E6
L0255D9  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L03455D
         BRL   L025611
L0255E6  LDA   $2D
         CMP   #$8200
         BEQ   L0255F0
         BRL   L0255FD
L0255F0  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L03463D
         BRL   L025611
L0255FD  LDA   $2D
         CMP   #$8400
         BEQ   L025607
         BRL   L025611
L025607  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L03471D
L025611  LDA   #$001B
         STA   L026C47+2
         LDA   #$2006
         STA   L026C47
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L02562F
         DEX
L02562F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L026C6D+2
         STA   L026C6D
L02565E  LDA   #$0000
         STA   $16
         PHA
         LDA   #$FFFF
         PHA
         LDX   #^L026C33
         LDA   #L026C33
         PHX
         PHA
         _TaskMaster
         STA   L02C957
         PLA
         STA   $18
         LDA   $18
         CMP   #$0021
         BEQ   L025687
         BRL   L025902
L025687  PHA
         LDX   L026C5B
         LDA   L026C59
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         STA   $22
         LDA   $22
         LDX   #$0000
         CMP   #$0001
         BNE   L0256A8
         INX
L0256A8  TXA
         PHA
         LDA   $22
         LDX   #$0000
         CMP   #$0002
         BNE   L0256B5
         INX
L0256B5  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0256BF
         BRL   L0256C7
L0256BF  LDA   #$0001
         STA   $16
         BRL   L025902
L0256C7  LDA   $22
         CMP   #$7010
         BEQ   L0256D1
         BRL   L0257E5
L0256D1  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7012
         LDX   #$0000
         TAY
         BPL   L0256E4
         DEX
L0256E4  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L025700
         BRL   L02572C
L025700  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7012
         LDX   #$0000
         TAY
         BPL   L025716
         DEX
L025716  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L02572C  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7013
         LDX   #$0000
         TAY
         BPL   L02573F
         DEX
L02573F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L02575B
         BRL   L025787
L02575B  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7013
         LDX   #$0000
         TAY
         BPL   L025771
         DEX
L025771  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L025787  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7016
         LDX   #$0000
         TAY
         BPL   L02579A
         DEX
L02579A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0257B6
         BRL   L0257E2
L0257B6  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7016
         LDX   #$0000
         TAY
         BPL   L0257CC
         DEX
L0257CC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0257E2  BRL   L025902
L0257E5  LDA   $22
         LDX   #$0000
         CMP   #$7013
         BNE   L0257F0
         INX
L0257F0  TXA
         PHA
         LDA   $22
         LDX   #$0000
         CMP   #$7012
         BNE   L0257FD
         INX
L0257FD  TXA
         ORA   $01,S
         PLX
         PHA
         LDA   $22
         LDX   #$0000
         CMP   #$7016
         BNE   L02580D
         INX
L02580D  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L025817
         BRL   L02588C
L025817  PEA   ^L025ADB
         PEA   L025ADB
         LDA   #$0000
         PHA
         LDX   L026C6D+2
         LDA   L026C6D
         PHX
         PHA
         _LESetText
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L02584E
         DEX
L02584E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L02C5AB
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         _InvalRect
         STA   L02C957
         BRL   L025902
L02588C  LDA   #$2000
         LDX   #$0000
         TAY
         BPL   L025896
         DEX
L025896  PHX
         PHA
         LDX   L026C5B
         LDA   L026C59
         JSL   L02C519
         BNE   L0258A7
         BRL   L025902
L0258A7  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   L026C5B
         LDA   L026C59
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   L026C5B
         PHA
         LDA   L026C59
         PHA
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0258E8
         DEX
L0258E8  PHX
         PHA
         JSL   L02C8EA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L025902  LDA   $18
         CMP   #$0014
         BEQ   L02590C
         BRL   L02595A
L02590C  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0280
         PHA
         LDA   #$00C8
         PHA
         _SetRect
         STA   L02C957
         LDA   #$0000
         PHA
         LDA   L026C3F
         PHA
         LDA   L026C3D
         PHA
         LDA   #$0008
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDX   L026C43+2
         LDA   L026C43
         PHX
         PHA
         _DragWindow
         STA   L02C957
L02595A  LDA   $16
         BNE   L025961
         BRL   L02565E
L025961  LDA   $22
         CMP   #$0001
         BEQ   L02596B
         BRL   L025A59
L02596B  LDA   $2D
         CMP   #$07FF
         BEQ   L025975
         BRL   L025982
L025975  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L0334C2
         BRL   L0259C4
L025982  LDA   $2D
         CMP   #$8000
         BEQ   L02598C
         BRL   L025999
L02598C  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L0337FF
         BRL   L0259C4
L025999  LDA   $2D
         CMP   #$8200
         BEQ   L0259A3
         BRL   L0259B0
L0259A3  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L033A79
         BRL   L0259C4
L0259B0  LDA   $2D
         CMP   #$8400
         BEQ   L0259BA
         BRL   L0259C4
L0259BA  LDX   $26
         LDA   $24
         PHX
         PHA
         JSL   L033CF3
L0259C4  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDA   #$0001
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         STA   L02C957
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$5504
         PHA
         JSL   L020419
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
L025A59  PHA
         PHA
         _FrontWindow
         STA   L02C957
         _CloseWindow
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDA   $2B
         STA   $2D
         LDA   $2A
         STA   $2C
         PLD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L025ADB  DW    $0000

*--- From the window to the resource

L025ADD  TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0028
         LDA   [$00],Y
         TAX
         LDY   #$0026
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         STA   $18
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000C
         LDA   [$00],Y
         LDX   #$0000
         CMP   #$0001
         BNE   L025B62
         INX
L025B62  TXA
         PHA
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000C
         LDA   [$00],Y
         LDX   #$0000
         CMP   #$0002
         BNE   L025B88
         INX
L025B88  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L025B92
         BRL   L025CE2

L025B92  LDA   $18
         CMP   #$0001
         BEQ   L025B9C
         BRL   L025C3C
L025B9C  JSL   L0213E0
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$2000
         CLC
         ADC   #$4000
         PHA
         JSL   L021208
         LDX   L026C79
         LDA   L026C77
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L025BF7
         BRL   L025C14
L025BF7  JSL   L0217DA
         LDX   L026C7F+2
         LDA   L026C7F
         PHX
         PHA
         _CloseWindow
         STA   L02C957
         JSL   L0219F9
         BRL   L025C3C
L025C14  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

L025C3C  LDA   $18
         CMP   #$0002
         BEQ   L025C46
         BRL   L025CDF
L025C46  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$8004
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _RemoveResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025C98
         DEX
L025C98  PHX
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025CDF  BRL   L026952

* AV 202010 - From the window to the resource

L025CE2  JSL   L02190D
         STA   $16	; A has the high word

         LDA   $18
         CMP   #$0001
         BEQ   L025CF2
         BRL   L025DE6

L025CF2  LDA   $16
         CMP   #$07FF
         bne   L025D03
	 cpx   #$0001
	 bne   L025D00
L025CFC  JSL   L0223F9	; 7F000001 Icon control - from the window to the resource
L025D00  brl   L025DBB

L025D03  CMP   #$8000
         bne   L025D14
L025D0D  JSL   L023077	; 80000000
         brl   L025DBB

L025D14  CMP   #$8100
         bne   L025D25
L025D1E  JSL   L0232DA	; 81000000
         bra   L025DBB

L025D25  CMP   #$8200
         bne   L025D36
L025D2F  JSL   L02370D	; 82000000
         bra   L025DBB

L025D36  CMP   #$8300
         bne   L025D47
L025D40  JSL   L0238F5	; 83000000 Line Edit control - from the window to the resource
         bra   L025DBB

L025D47  CMP   #$8400
         bne   L025D58
L025D51  JSL   L023C06	; 84000000
         bra   L025DBB

L025D58  CMP   #$8500
         bne   L025D69
L025D62  JSL   L023E4F	; 85000000
         bra   L025DBB

L025D69  CMP   #$8600
         bne   L025D7A
L025D73  JSL   L0243A2	; 86000000
         bra   L025DBB

L025D7A  CMP   #$8700
         bne   L025D8B
L025D84  JSL   L024963	; 87000000
         bra   L025DBB

L025D8B  CMP   #$8800
         bne   L025D9C
L025D95  JSL   L025011	; 88000000
         bra   L025DBB

L025D9C  CMP   #$8900
         bne   L025DAD
L025DA6  JSL   L025220	; 89000000
         bra   L025DBB

L025DAD  CMP   #$8D00
         bne   isitRECT
L025DB7  JSL   L0253BB	; 8D000000

isitRECT cmp   #$87ff
	 bne   L025DBB
	 cpx   #$0003
	 bne   isitTHERMO
	 jsl   updateRECT
	 bra   L025DBB
isitTHERMO cpx   #$0002
	 bne   L025DBB
	 jsl   updateTHERMO
	 
L025DBB  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026952

L025DE6  LDA   $18
         CMP   #$0002
         BEQ   L025DF0
         BRL   L025E1B

L025DF0  LDA   L026C61+2	; 00000002 - What is that resource?
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026952
L025E1B  LDA   $18
         CMP   #$0003
         BEQ   L025E25
         BRL   L026007
L025E25  LDA   $16
         CMP   #$8100
         BEQ   L025E2F
         BRL   L025F0A
L025E2F  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L02C957
         PHA
         LDA   #$1C03
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$800B
         STA   [$00]
         BRL   L026004
L025F0A  LDA   $16
         CMP   #$8D00
         BEQ   L025F14
         BRL   L025FEF
L025F14  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L02C957
         PHA
         LDA   #$1C04
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8002
         STA   [$00]
         BRL   L026004
L025FEF  LDA   $16
         CMP   #$07FF
         BEQ   L025FF9
         BRL   L026004
L025FF9  JSL   L02BFAD
         LDA   $16
         PHA
         JSL   L025521
L026004  BRL   L026952
L026007  LDA   $18
         CMP   #$0004
         BEQ   L026011
         BRL   L02621B
L026011  LDA   $16
         CMP   #$8500
         BEQ   L02601B
         BRL   L0260F6
L02601B  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L02C957
         PHA
         LDA   #$1C05
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8016
         STA   [$00]
         BRL   L026218
L0260F6  LDA   $16
         CMP   #$8700
         BEQ   L026100
         BRL   L0261DB
L026100  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         PHA
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L02C957
         PHA
         LDA   #$1C06
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8009
         STA   [$00]
         BRL   L026218
L0261DB  LDA   $16
         LDX   #$0000
         CMP   #$8000
         BNE   L0261E6
         INX
L0261E6  TXA
         PHA
         LDA   $16
         LDX   #$0000
         CMP   #$8200
         BNE   L0261F3
         INX
L0261F3  TXA
         ORA   $01,S
         PLX
         PHA
         LDA   $16
         LDX   #$0000
         CMP   #$8400
         BNE   L026203
         INX
L026203  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L02620D
         BRL   L026218
L02620D  JSL   L02BFAD
         LDA   $16
         PHA
         JSL   L025521
L026218  BRL   L026952
L02621B  LDA   $18
         CMP   #$0005
         BEQ   L026225
         BRL   L02630A
L026225  LDA   $16
         CMP   #$07FF
         BEQ   L02622F
         BRL   L026307
L02622F  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L02C957
         PHA
         LDA   #$1C07
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8001
         STA   [$00]
L026307  BRL   L026952
L02630A  LDA   $18
         CMP   #$0006
         BEQ   L026314
         BRL   L026340
L026314  LDA   $16
         CMP   #$07FF
         BEQ   L02631E
         BRL   L02633D
L02631E  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   L030524
         JSL   L02293C
L02633D  BRL   L026952

* Check if Border checkbox is selected

L026340  LDA   $18
         CMP   #$000B
         BEQ   L02634A
         BRL   L0263C5
L02634A  LDA   $16
         CMP   #$07FF
         BEQ   L026354
         BRL   L0265C2

L026354  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L026383
         BRL   L026462

L026383  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0007
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0008
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0009
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000a
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0008
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L0265C2

L026462  LDA   #$00FF	; inactive
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0007
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0008
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0009
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000a
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0007
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0008
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0009
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000a
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

L0265C2  BRL   L026952

*--- AV 202010 - Handle the Sticky icon checkbox

L0263C5  LDA   $18
         CMP   #$0014
         BEQ   L02634B
         BRL   L0265C5
L02634B  LDA   $16
         CMP   #$07FF
         bne   L0265C2

         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0014
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L026384
         BRL   L026463

L026384  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0015
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0016
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0016
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L0265C2

L026463  LDA   #$00FF	; inactive
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0015
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0016
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0015
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0016
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

         BRL   L026952
	 
*--- Back to the normal code

L0265C5  LDA   $18
         LDX   #$0000
         CMP   #$0012
         BNE   L0265D0
         INX
L0265D0  TXA
         PHA
         LDA   $18
         LDX   #$0000
         CMP   #$0013
         BNE   L0265DD
         INX
L0265DD  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0265E7
         BRL   L0268C1
L0265E7  LDA   $16
         CMP   #$8600
         BEQ   L0265F1
         BRL   L0268BE
L0265F1  LDA   $18
         CMP   #$0013
         BEQ   L0265FB
         BRL   L02675E
L0265FB  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L026611
         DEX
L026611  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L02663D
         DEX
L02663D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L026669
         DEX
L026669  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L026695
         DEX
L026695  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L0266C1
         DEX
L0266C1  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L0266ED
         DEX
L0266ED  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L026719
         DEX
L026719  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L026745
         DEX
L026745  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L0268BE
L02675E  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L026774
         DEX
L026774  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L0267A0
         DEX
L0267A0  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0267CC
         DEX
L0267CC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L0267F8
         DEX
L0267F8  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L026824
         DEX
L026824  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L026850
         DEX
L026850  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L02687C
         DEX
L02687C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L0268A8
         DEX
L0268A8  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0268BE  BRL   L026952
L0268C1  LDA   $18
         LDX   #$0000
         CMP   #$000F
         BNE   L0268CC
         INX
L0268CC  TXA
         PHA
         LDA   $18
         LDX   #$0000
         CMP   #$0010
         BNE   L0268D9
         INX
L0268D9  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0268E3
         BRL   L026952
L0268E3  LDA   $16
         CMP   #$8500
         BEQ   L0268ED
         BRL   L026952
L0268ED  LDA   $18
         CMP   #$000F
         BEQ   L0268F7
         BRL   L026926
L0268F7  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L02690D
         DEX
L02690D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L026952
L026926  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L02693C
         DEX
L02693C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L026952  PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L02695A  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$004E
         LDA   [$00],Y
         STA   L026C65
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003E
         LDA   [$00],Y
         BRL   L026BE3
L026987  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0269A7
         DEX
L0269A7  LDY   #$0001
         CMP   $01,S
         BEQ   L0269AF
         DEY
L0269AF  TXA
         CMP   $03,S
         BEQ   L0269B7
         LDY   #$0000
L0269B7  PLA
         PLA
         TYA
         BNE   L0269BF
         BRL   L0269C6
L0269BF  JSL   L021C6C
         BRL   L0269CA
L0269C6  JSL   L0219F9
L0269CA  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         AND   #$0400
         BNE   L0269E1
         BRL   L026A09
L0269E1  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         EOR   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L026A09  BRL   L026C07
L026A0C  LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L026C17
         PEA   L026C17
         LDA   #$0013
         PHA
         JSL   L02C5F5
         PEA   ^L026C83
         PEA   L026C83
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         BRL   L026C07
L026A4C  JSL   L021D39
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$004A
         LDA   [$00],Y
         CMP   #$0016
         BEQ   L026A67
         BRL   L026A6E
L026A67  JSL   L021D8C
         BRL   L026AB1
L026A6E  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$004A
         LDA   [$00],Y
         CMP   #$0021
         BEQ   L026A85
         BRL   L026A8C
L026A85  JSL   L025ADD
         BRL   L026AB1
L026A8C  LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$004A
         LDA   [$00],Y
         CMP   #$0008
         BEQ   L026AA3
         BRL   L026AB1
L026AA3  LDA   #$0100
         PHA
         _EnableMItem
         STA   L02C957
L026AB1  BRL   L026C07
L026AB4  LDX   #^L026C83
         LDA   #L026C83
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L026C2A
         PEA   L026C2A
         LDA   #$0007
         PHA
         JSL   L02C5F5
         PEA   ^L026C83
         PEA   L026C83
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L026AFB
         DEX
L026AFB  PHX
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0032
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #$8004
         STA   [$00]
         LDA   #$0003
         STA   L026C31
         LDA   #$0001
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L026B43
         DEX
L026B43  STX   L026C67+2
         STA   L026C67
         BRL   L026C07
L026B4C  JSL   L021D39
         JSL   L021D8C
         BRL   L026C07
L026B57  LDA   L026C6B
         BEQ   L026B5F
         BRL   L026BDD
L026B5F  LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L026C61+2
         LDA   L026C61
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         PHA
         LDA   #$4000
         CLC
         ADC   #$2000
         ORA   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L026C61+2
         LDA   L026C61
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   L026C6B
         STA   [$00]
         LDA   L026C67+2
         PHA
         LDA   L026C67
         PHA
         LDA   L026C61+2
         PHA
         LDA   L026C61
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   #$0001
         STA   L026C6B
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L026BD7
         DEX
L026BD7  STX   L026C67+2
         STA   L026C67
L026BDD  BRL   L026C07
L026BE0  BRL   L026C07

L026BE3  CMP   #$0006
         BCC   L026BEB
         LDA   #$0006
L026BEB  ASL
         TAX
         LDAL  L026BF9,X
         BEQ   L026BF5
         PHA
         RTS

L026BF5  JSL   L02C9E9

L026BF9  DA    L026987-1
         DA    L026A0C-1
         DA    L026A4C-1
         DA    L026AB4-1
         DA    L026B4C-1
         DA    L026B57-1
         DA    L026BE0-1

L026C07  LDA   #$0000
         STA   $16
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         TXA
         RTL

L026C17  ASC   'Control editor v1.3'
L026C2A  ASC   'Control'
L026C31  DW    $0000
L026C33  DW    $0000      ; event code
         ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
L026C3D  DW    $0000      ; mouse location
L026C3F  DW    $0000
         DW    $0000      ; modifiers
L026C43  ADRL  $00000000  ; task data
L026C47  ADRL  $00000000  ; task mask
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026C59  DB    $00
         DB    $00
L026C5B  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026C61  ADRL  $00000000
L026C65  DW    $0000
L026C67  ADRL  $00000000
L026C6B  DW    $0000
L026C6D  ADRL  $00000000
L026C71  DB    $00
         DB    $00
L026C73  DB    $00
         DB    $00
L026C75  DB    $00
         DB    $00
L026C77  DB    $00
         DB    $00
L026C79  DB    $00
         DB    $00
L026C7B  DB    $00
         DB    $00
L026C7D  DB    $00
         DB    $00
L026C7F  ADRL  $00000000
L026C83  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026D83  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L026E83  LDA   $04,S
         STA   L027019
         LDA   $06,S
         STA   L027019+2
         LDA   $08,S
         STA   L027015
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0007
         LDA   L027015
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L027011
         PLA
         STA   L027011+2
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         _HLock
         PEA   ^L027035
         PEA   L027035
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         PEA   $0000
         PEA   $0007
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L027031
         PLA
         STA   L027033
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L027033
         PHA
         LDA   L027031
         PHA
         _AddResource
         PEA   $8006
         LDA   L027033
         PHA
         LDA   L027031
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L027033
         PHA
         LDA   L027031
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L027019+2
         PHA
         LDA   L027019
         PHA
         _LoadResource
         PLA
         STA   L027011
         PLA
         STA   L027011+2
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         _HUnlock
         PEA   $0000
         PEA   $001E
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         _SetHandleSize
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         _HLock
         PEA   ^L027017
         PEA   L027017
         LDA   L027011+2
         PHA
         LDA   L027011
         PHA
         PEA   $0000
         PEA   $001E
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L027019+2
         PHA
         LDA   L027019
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L027019+2
         PHA
         LDA   L027019
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L027019+2
         PHA
         LDA   L027019
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L027011  ADRL  $00000000
L027015  DW    $0000
L027017  DW    $0007
L027019  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0017
         DW    $0064
         ADRL  $80000000
         DW    $0000
         DW    $1002
         DW    $0000
         DW    $0000
L027031  DW    $0000
L027033  DW    $0000
L027035  STR   'Button'

L02703C  LDA   $04,S
         STA   L0271D2
         LDA   $06,S
         STA   L0271D2+2
         LDA   $08,S
         STA   L0271CE
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         LDA   L0271CE
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L0271CA
         PLA
         STA   L0271CA+2
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         _HLock
         PEA   ^L0271F0
         PEA   L0271F0
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         PEA   $0000
         PEA   $000A
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L0271EA
         PLA
         STA   L0271EC
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L0271EC
         PHA
         LDA   L0271EA
         PHA
         _AddResource
         PEA   $8006
         LDA   L0271EC
         PHA
         LDA   L0271EA
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L0271EC
         PHA
         LDA   L0271EA
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L0271D2+2
         PHA
         LDA   L0271D2
         PHA
         _LoadResource
         PLA
         STA   L0271CA
         PLA
         STA   L0271CA+2
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0020
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         _SetHandleSize
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         _HLock
         PEA   ^L0271D0
         PEA   L0271D0
         LDA   L0271CA+2
         PHA
         LDA   L0271CA
         PHA
         PEA   $0000
         PEA   $0020
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L0271D2+2
         PHA
         LDA   L0271D2
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L0271D2+2
         PHA
         LDA   L0271D2
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L0271D2+2
         PHA
         LDA   L0271D2
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L0271CA  ADRL  $00000000
L0271CE  DW    $0000
L0271D0  DW    $0008
L0271D2  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0013
         DW    $0078
         ADRL  $82000000
         DW    $0000
         DW    $1002
         DW    $0000
         DW    $0000
L0271EA  DW    $0000
L0271EC  DW    $0000
         DW    $0000
L0271F0  STR   'Check box'

L0271FA  LDA   $04,S
         STA   L027390
         LDA   $06,S
         STA   L027390+2
         LDA   $08,S
         STA   L02738C
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0048
         LDA   L02738C
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L027388
         PLA
         STA   L027388+2
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         _HLock
         PEA   ^L0273B6
         PEA   L0273B6
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         PEA   $0000
         PEA   $0048
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8001
         _UniqueResourceID
         PLA
         STA   L0273A8
         PLA
         STA   L0273A8+2
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         PEA   $0000
         PEA   $8001
         LDA   L0273A8+2
         PHA
         LDA   L0273A8
         PHA
         _AddResource
         PEA   $8001
         LDA   L0273A8+2
         PHA
         LDA   L0273A8
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8001
         LDA   L0273A8+2
         PHA
         LDA   L0273A8
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L027390+2
         PHA
         LDA   L027390
         PHA
         _LoadResource
         PLA
         STA   L027388
         PLA
         STA   L027388+2
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0030	; AV 202010 was 28 (added 6+2)
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         _SetHandleSize
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         _HLock
         PEA   ^L02738E
         PEA   L02738E
         LDA   L027388+2
         PHA
         LDA   L027388
         PHA
         PEA   $0000
         PEA   $0030	; AV 202010 was 28 (added 6+2)
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L027390+2
         PHA
         LDA   L027390
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L027390+2
         PHA
         LDA   L027390
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L027390+2
         PHA
         LDA   L027390
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L027388  ADRL  $00000000
L02738C  DW    $0000

* 26d bytes here
* whereas 40d booked

L02738E  DW    12		; 10 parms, 12 max and we'll support 12
L027390  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0013
         DW    $001E
         ADRL  $07FF0001
         DW    $0006		; flag
         DW    $1020		; moreFlags
         ADRL  $00000000	; refCon
	 adrl	$00000000	; iconRef
	 adrl	$00000000	; titleRef
	 adrl	$00000000	; colorTableRef
	 dw	$0000		; displayMode
	 ds	6		; keyEquivalent
	 dw	$0000		; initialValue

L0273A8  ADRL  $00000000
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0273B6  DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $08
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $0F
         DB    $FF
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $F0
         DB    $00
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
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
         DB    $FF
         DB    $FF

*--- AV 202010

writeRECTANGLE
         LDA   $04,S	; resourceID
         STA   rectID
         LDA   $06,S
         STA   rectID+2
         LDA   $08,S	; memID
         STA   L027590
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA

         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth

         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $001e
         LDA   L027590
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2

*         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock

         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   rectID+2
         PHA
         LDA   rectID
         PHA
         _LoadResource
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2

*         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HUnlock

         PEA   $0000
         PEA   $001e
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _SetHandleSize

         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock

         PEA   ^rectTEMPLATE	; Rectangle control template
         PEA   rectTEMPLATE
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         PEA   $0000
         PEA   $001e
         _PtrToHand

         PEA   $FFFF
         PEA   $8004
         LDA   rectID+2
         PHA
         LDA   rectID
         PHA
         _MarkResourceChange

         PEA   $8004
         LDA   rectID+2
         PHA
         LDA   rectID
         PHA
         _WriteResource

         PEA   $FFFF
         PEA   $8004
         LDA   rectID+2
         PHA
         LDA   rectID
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

*--- Default Rectangle control template

rectTEMPLATE
         DW    $0008	; pCount
rectID   ADRL  $00000000 ; ID
         DW    $000A	; rect
         DW    $000A
         DW    $0017
         DW    $0096
         ADRL  $87FF0003 ; procRef
         DW    $0001	; flag
         DW    $1000	; moreFlags
         ADRL  $00000000 ; refCon
         DW    $0001	; penHeight
	 DW    $0002	; penWidth

*---

writeTHERMOMETER
         LDA   $04,S	; resourceID
         STA   thermoID
         LDA   $06,S
         STA   thermoID+2
         LDA   $08,S	; memID
         STA   L027590
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA

         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth

         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $001e
         LDA   L027590
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2

*         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock

         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   thermoID+2
         PHA
         LDA   thermoID
         PHA
         _LoadResource
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2

*         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HUnlock

         PEA   $0000
         PEA   $001e
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _SetHandleSize

         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock

         PEA   ^thermoTEMPLATE	; Thermometer control template
         PEA   thermoTEMPLATE
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         PEA   $0000
         PEA   $001e
         _PtrToHand

         PEA   $FFFF
         PEA   $8004
         LDA   thermoID+2
         PHA
         LDA   thermoID
         PHA
         _MarkResourceChange

         PEA   $8004
         LDA   thermoID+2
         PHA
         LDA   thermoID
         PHA
         _WriteResource

         PEA   $FFFF
         PEA   $8004
         LDA   thermoID+2
         PHA
         LDA   thermoID
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

*--- Default Rectangle control template

thermoTEMPLATE
         DW    $0008	; pCount
thermoID   ADRL  $00000000 ; ID
         DW    $000A	; rect
         DW    $000A
         DW    $0017
         DW    $0096
         ADRL  $87FF0002 ; procRef
         DW    $0001	; flag
         DW    $1000	; moreFlags
         ADRL  $00000000 ; refCon
         DW    $0000	; value
	 DW    $0064	; data

*--- Write an line edit resource

L0273FE  LDA   $04,S	; resourceID
         STA   L027594
         LDA   $06,S
         STA   L027594+2
         LDA   $08,S	; memID
         STA   L027590
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA

         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth

         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         LDA   L027590
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2

         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock

         PEA   ^L0275B2
         PEA   L0275B2
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         PEA   $0000
         PEA   $000A
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L0275AE
         PLA
         STA   L0275AE+2
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L0275AE+2
         PHA
         LDA   L0275AE
         PHA
         _AddResource
         PEA   $8006
         LDA   L0275AE+2
         PHA
         LDA   L0275AE
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L0275AE+2
         PHA
         LDA   L0275AE
         PHA
         _ReleaseResource

         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L027594+2
         PHA
         LDA   L027594
         PHA
         _LoadResource
         PLA
         STA   L02758C
         PLA
         STA   L02758C+2
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0024	; was $20
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _SetHandleSize
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         _HLock
         PEA   ^L027592	; Line edit control template
         PEA   L027592
         LDA   L02758C+2
         PHA
         LDA   L02758C
         PHA
         PEA   $0000
         PEA   $0024	; AV 202010 - size of $24 now
         _PtrToHand

* AV 202010

         PEA   $FFFF
         PEA   $8004
         LDA   L027594+2
         PHA
         LDA   L027594
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L027594+2
         PHA
         LDA   L027594
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L027594+2
         PHA
         LDA   L027594
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L02758C  ADRL  $00000000
L027590  DW    $0000

*--- Default Line Edit control template

L027592  DW    $000A	; pCount - was 8
L027594  ADRL  $00000000 ; ID
         DW    $000A	; rect
         DW    $000A
         DW    $0017
         DW    $0096
         ADRL  $83000000 ; procRef
         DW    $0000	; flag
         DW    $7002	; moreFlags
         ADRL  $00000000 ; refCon
         DW    $0014	; maxSize
L0275AE  ADRL  $00000000
	 dw    $ffff	; pwChar - by default, not a password field
	 dw    $0001	; keyMask - new for 6.0.1

L0275B2  STR   'Edit Line'

*---

L0275BC  LDA   $04,S
         STA   L02769C
         LDA   $06,S
         STA   L02769C+2
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L02769C+2
         PHA
         LDA   L02769C
         PHA
         _LoadResource
         PLA
         STA   L027694
         PLA
         STA   L027694+2
         LDA   L027694+2
         PHA
         LDA   L027694
         PHA
         _HUnlock
         PEA   $0000
         PEA   $002E
         LDA   L027694+2
         PHA
         LDA   L027694
         PHA
         _SetHandleSize
         LDA   L027694+2
         PHA
         LDA   L027694
         PHA
         _HLock
         PEA   ^L02769A
         PEA   L02769A
         LDA   L027694+2
         PHA
         LDA   L027694
         PHA
         PEA   $0000
         PEA   $002E
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L02769C+2
         PHA
         LDA   L02769C
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L02769C+2
         PHA
         LDA   L02769C
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L02769C+2
         PHA
         LDA   L02769C
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L027694  ADRL  $00000000
         DW    $0000
L02769A  DW    $000E
L02769C  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $003E
         DW    $0096
         ADRL  $89000000
         DW    $0000
         DW    $1400
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0005
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $000A
         DW    $0005
         DW    $0000
         DW    $0000
L0276C8  LDA   $04,S
         STA   L02785E
         LDA   $06,S
         STA   L02785E+2
         LDA   $08,S
         STA   L02785A
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0612
         LDA   L02785A
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L027856
         PLA
         STA   L027856+2
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         _HLock
         PEA   ^L02787A
         PEA   L02787A
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         PEA   $0000
         PEA   $0612
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8002
         _UniqueResourceID
         PLA
         STA   L027876
         PLA
         STA   L027878
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         PEA   $0000
         PEA   $8002
         LDA   L027878
         PHA
         LDA   L027876
         PHA
         _AddResource
         PEA   $8002
         LDA   L027878
         PHA
         LDA   L027876
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8002
         LDA   L027878
         PHA
         LDA   L027876
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L02785E+2
         PHA
         LDA   L02785E
         PHA
         _LoadResource
         PLA
         STA   L027856
         PLA
         STA   L027856+2
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         _HUnlock
         PEA   $0000
         PEA   $001E
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         _SetHandleSize
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         _HLock
         PEA   ^L02785C
         PEA   L02785C
         LDA   L027856+2
         PHA
         LDA   L027856
         PHA
         PEA   $0000
         PEA   $001E
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L02785E+2
         PHA
         LDA   L02785E
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L02785E+2
         PHA
         LDA   L02785E
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L02785E+2
         PHA
         LDA   L02785E
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L027856  ADRL  $00000000
L02785A  DW    $0000
L02785C  DW    $0007
L02785E  ADRL  $00000000
         DW    $0007
         DW    $0012
         DW    $0029
         DW    $00C2
         ADRL  $8D000000
         DW    $0000
         DW    $1002
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027876  DB    $00
         DB    $00
L027878  DB    $00
         DB    $00
L02787A  DB    $80
         DB    $00
         DB    $07
         DB    $00
         DB    $12
         DB    $00
         DB    $29
         DB    $00
         DB    $C2
         DB    $00
         DB    $11
         DB    $82
         DB    $01
         DB    $00
         DB    $0A
         DB    $00
         DB    $07
         DB    $00
         DB    $12
         DB    $00
         DB    $29
         DB    $00
         DB    $C2
         DB    $00
         DB    $90
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $2C
         DB    $00
         DB    $07
         DB    $00
         DB    $12
         DB    $00
         DB    $29
         DB    $00
         DB    $C2
         DB    $00
         DB    $07
         DB    $00
         DB    $12
         DB    $00
         DB    $29
         DB    $00
         DB    $C2
         DB    $00
         DB    $07
         DB    $00
         DB    $12
         DB    $00
         DB    $29
         DB    $00
         DB    $C2
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $03
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $C0
         DB    $00
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $00
         DB    $77
         DB    $70
         DB    $00
         DB    $00
         DB    $3F
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $0E
         DB    $EE
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $00
         DB    $03
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
         DB    $EF
         DB    $F0
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $0F
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $C0
         DB    $77
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $07
         DB    $0F
         DB    $07
         DB    $70
         DB    $00
         DB    $00
         DB    $77
         DB    $77
         DB    $00
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $C0
         DB    $00
         DB    $07
         DB    $70
         DB    $77
         DB    $70
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $70
         DB    $0F
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $0F
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $00
         DB    $00
         DB    $72
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $0F
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $70
         DB    $77
         DB    $20
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $07
         DB    $22
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $70
         DB    $22
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $77
         DB    $00
         DB    $20
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $00
         DB    $00
         DB    $03
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $C0
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $07
         DB    $77
         DB    $70
         DB    $27
         DB    $02
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $22
         DB    $20
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $07
         DB    $02
         DB    $72
         DB    $00
         DB    $20
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $72
         DB    $20
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $70
         DB    $07
         DB    $20
         DB    $FE
         DB    $02
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $77
         DB    $77
         DB    $77
         DB    $20
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $1F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $70
         DB    $0F
         DB    $EE
         DB    $07
         DB    $22
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $1F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $70
         DB    $00
         DB    $77
         DB    $77
         DB    $22
         DB    $07
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $C0
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $07
         DB    $77
         DB    $07
         DB    $00
         DB    $27
         DB    $77
         DB    $70
         DB    $77
         DB    $77
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $72
         DB    $72
         DB    $02
         DB    $77
         DB    $00
         DB    $77
         DB    $00
         DB    $00
         DB    $00
         DB    $07
         DB    $70
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $00
         DB    $02
         DB    $00
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $77
         DB    $77
         DB    $70
         DB    $FE
         DB    $07
         DB    $70
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $00
         DB    $77
         DB    $77
         DB    $72
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $07
         DB    $77
         DB    $70
         DB    $FE
         DB    $07
         DB    $70
         DB    $77
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $77
         DB    $22
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $77
         DB    $07
         DB    $77
         DB    $77
         DB    $72
         DB    $22
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $22
         DB    $72
         DB    $77
         DB    $77
         DB    $77
         DB    $70
         DB    $73
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $3F
         DB    $FC
         DB    $00
         DB    $3F
         DB    $FF
         DB    $F0
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $0F
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $F0
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $C0
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $F0
         DB    $00
         DB    $0F
         DB    $FF
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $03
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $1F
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
         DB    $00
         DB    $00
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $10
         DB    $1F
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
         DB    $00
         DB    $00
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $0F
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
         DB    $C0
         DB    $00
         DB    $00
         DB    $01
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
         DB    $11
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
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
L027E8C  LDA   $04,S
         STA   L028244
         LDA   $06,S
         STA   L028244+2
         LDA   $08,S
         STA   L028240
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0009
         LDA   L028240
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02823C
         PLA
         STA   L02823C+2
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HLock
         PEA   ^L028288
         PEA   L028288
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $0009
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L02826E
         PLA
         STA   L028270
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L028270
         PHA
         LDA   L02826E
         PHA
         _AddResource
         PEA   $8006
         LDA   L028270
         PHA
         LDA   L02826E
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L028270
         PHA
         LDA   L02826E
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0007
         LDA   L028240
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02823C
         PLA
         STA   L02823C+2
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HLock
         PEA   ^L028291
         PEA   L028291
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $0007
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L028284
         PLA
         STA   L028286
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L028286
         PHA
         LDA   L028284
         PHA
         _AddResource
         PEA   $8006
         LDA   L028286
         PHA
         LDA   L028284
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L028286
         PHA
         LDA   L028284
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000E
         LDA   L028240
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02823C
         PLA
         STA   L02823C+2
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HLock
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $800A
         _UniqueResourceID
         PLA
         STA   L028272
         PLA
         STA   L028274
         LDA   L028272
         STA   L02827C
         STA   L028262
         PEA   ^L02827A
         PEA   L02827A
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $000E
         _PtrToHand
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $800A
         LDA   L028274
         PHA
         LDA   L028272
         PHA
         _AddResource
         PEA   $800A
         LDA   L028274
         PHA
         LDA   L028272
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $800A
         LDA   L028274
         PHA
         LDA   L028272
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0012
         LDA   L028240
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L02823C
         PLA
         STA   L02823C+2
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HLock
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8009
         _UniqueResourceID
         PLA
         STA   L02825E
         PLA
         STA   L028260
         LDA   L02825E
         STA   L02826A
         PEA   ^L028268
         PEA   L028268
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $0012
         _PtrToHand
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $8009
         LDA   L028260
         PHA
         LDA   L02825E
         PHA
         _AddResource
         PEA   $8009
         LDA   L028260
         PHA
         LDA   L02825E
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8009
         LDA   L028260
         PHA
         LDA   L02825E
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L028244+2
         PHA
         LDA   L028244
         PHA
         _LoadResource
         PLA
         STA   L02823C
         PLA
         STA   L02823C+2
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0026
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _SetHandleSize
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         _HLock
         PEA   ^L028242
         PEA   L028242
         LDA   L02823C+2
         PHA
         LDA   L02823C
         PHA
         PEA   $0000
         PEA   $0026
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L028244+2
         PHA
         LDA   L028244
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L028244+2
         PHA
         LDA   L028244
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L028244+2
         PHA
         LDA   L028244
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L02823C  ADRL  $00000000
L028240  DW    $0000
L028242  DW    $000A
L028244  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0000
         DW    $0000
         ADRL  $87000000
         DW    $0040
         DW    $1002
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02825E  DB    $00
         DB    $00
L028260  DB    $00
         DB    $00
L028262  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028268  DB    $00
         DB    $00
L02826A  DB    $00
         DB    $00
         DB    $00
         DB    $A0
L02826E  DB    $00
         DB    $00
L028270  DB    $00
         DB    $00
L028272  DB    $00
         DB    $00
L028274  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02827A  DB    $00
         DB    $00
L02827C  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
L028284  DB    $00
         DB    $00
L028286  DB    $00
         DB    $00
L028288  STR   ' Pop-up '
L028291  STR   'Item 1'
L028298  LDA   $04,S
         STA   L02842E
         LDA   $06,S
         STA   L02842E+2
         LDA   $08,S
         STA   L02842A
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         LDA   L02842A
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L028426
         PLA
         STA   L028426+2
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         _HLock
         PEA   ^L02844C
         PEA   L02844C
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         PEA   $0000
         PEA   $000D
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $8006
         _UniqueResourceID
         PLA
         STA   L028446
         PLA
         STA   L028448
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         PEA   $0000
         PEA   $8006
         LDA   L028448
         PHA
         LDA   L028446
         PHA
         _AddResource
         PEA   $8006
         LDA   L028448
         PHA
         LDA   L028446
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8006
         LDA   L028448
         PHA
         LDA   L028446
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L02842E+2
         PHA
         LDA   L02842E
         PHA
         _LoadResource
         PLA
         STA   L028426
         PLA
         STA   L028426+2
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0020
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         _SetHandleSize
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         _HLock
         PEA   ^L02842C
         PEA   L02842C
         LDA   L028426+2
         PHA
         LDA   L028426
         PHA
         PEA   $0000
         PEA   $0020
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L02842E+2
         PHA
         LDA   L02842E
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L02842E+2
         PHA
         LDA   L02842E
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L02842E+2
         PHA
         LDA   L02842E
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L028426  ADRL  $00000000
L02842A  DW    $0000
L02842C  DW    $0008
L02842E  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0013
         DW    $0082
         ADRL  $84000000
         DW    $0000
         DW    $1002
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028446  DB    $00
         DB    $00
L028448  DB    $00
         DB    $00
         DB    $00
         DB    $00
L02844C  STR   'Radio button'
L028459  LDA   $04,S
         STA   L02853E
         LDA   $06,S
         STA   L02853E+2
         LDA   $08,S
         STA   L02853A
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L02853E+2
         PHA
         LDA   L02853E
         PHA
         _LoadResource
         PLA
         STA   L028536
         PLA
         STA   L028536+2
         LDA   L028536+2
         PHA
         LDA   L028536
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0024
         LDA   L028536+2
         PHA
         LDA   L028536
         PHA
         _SetHandleSize
         LDA   L028536+2
         PHA
         LDA   L028536
         PHA
         _HLock
         PEA   ^L02853C
         PEA   L02853C
         LDA   L028536+2
         PHA
         LDA   L028536
         PHA
         PEA   $0000
         PEA   $0024
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L02853E+2
         PHA
         LDA   L02853E
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L02853E+2
         PHA
         LDA   L02853E
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L02853E+2
         PHA
         LDA   L02853E
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L028536  ADRL  $00000000
L02853A  DW    $0000
L02853C  DW    $000A
L02853E  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0017
         DW    $00D2
         ADRL  $86000000
         DW    $001C
         DW    $1002
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $64
         DB    $00
         DB    $32
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028560  LDA   $04,S
         STA   L028645
         LDA   $06,S
         STA   L028645+2
         LDA   $08,S
         STA   L028641
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L028645+2
         PHA
         LDA   L028645
         PHA
         _LoadResource
         PLA
         STA   L02863D
         PLA
         STA   L02863D+2
         LDA   L02863D+2
         PHA
         LDA   L02863D
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0020
         LDA   L02863D+2
         PHA
         LDA   L02863D
         PHA
         _SetHandleSize
         LDA   L02863D+2
         PHA
         LDA   L02863D
         PHA
         _HLock
         PEA   ^L028643
         PEA   L028643
         LDA   L02863D+2
         PHA
         LDA   L02863D
         PHA
         PEA   $0000
         PEA   $0020
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L028645+2
         PHA
         LDA   L028645
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L028645+2
         PHA
         LDA   L028645
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L028645+2
         PHA
         LDA   L028645
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L02863D  ADRL  $00000000
L028641  DW    $0000
L028643  DW    $0006
L028645  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0017
         DW    $0024
         ADRL  $88000000
         DW    $0000
         DW    $1000
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02865D  LDA   $04,S
         STA   L0287F3
         LDA   $06,S
         STA   L0287F3+2
         LDA   $08,S
         STA   L0287EF
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0009
         LDA   L0287EF
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   L0287EB
         PLA
         STA   L0287EB+2
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         _HLock
         PEA   ^L02880F
         PEA   L02880F
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         PEA   $0000
         PEA   $0009
         _PtrToHand
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         PEA   $800B
         _UniqueResourceID
         PLA
         STA   L02880B
         PLA
         STA   L02880D
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         PEA   $0000
         PEA   $800B
         LDA   L02880D
         PHA
         LDA   L02880B
         PHA
         _AddResource
         PEA   $800B
         LDA   L02880D
         PHA
         LDA   L02880B
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $800B
         LDA   L02880D
         PHA
         LDA   L02880B
         PHA
         _ReleaseResource
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L0287F3+2
         PHA
         LDA   L0287F3
         PHA
         _LoadResource
         PLA
         STA   L0287EB
         PLA
         STA   L0287EB+2
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         _HUnlock
         PEA   $0000
         PEA   $001E
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         _SetHandleSize
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         _HLock
         PEA   ^L0287F1
         PEA   L0287F1
         LDA   L0287EB+2
         PHA
         LDA   L0287EB
         PHA
         PEA   $0000
         PEA   $001E
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L0287F3+2
         PHA
         LDA   L0287F3
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L0287F3+2
         PHA
         LDA   L0287F3
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L0287F3+2
         PHA
         LDA   L0287F3
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L0287EB  ADRL  $00000000
L0287EF  DW    $0000
L0287F1  DW    $0007
L0287F3  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $0013
         DW    $0055
         ADRL  $81000000
         DW    $0000
         DW    $1002
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02880B  DB    $00
         DB    $00
L02880D  DB    $00
         DB    $00

L02880F  ASC   'Stat text'

L028818  LDA   $04,S
         STA   L0288FD
         LDA   $06,S
         STA   L0288FD+2
         LDA   $08,S
         STA   L0288F9
         LDA   $01,S
         STA   $07,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PEA   $0000
         PEA   $0000
         PEA   $8004
         LDA   L0288FD+2
         PHA
         LDA   L0288FD
         PHA
         _LoadResource
         PLA
         STA   L0288F5
         PLA
         STA   L0288F5+2
         LDA   L0288F5+2
         PHA
         LDA   L0288F5
         PHA
         _HUnlock
         PEA   $0000
         PEA   $0032
         LDA   L0288F5+2
         PHA
         LDA   L0288F5
         PHA
         _SetHandleSize
         LDA   L0288F5+2
         PHA
         LDA   L0288F5
         PHA
         _HLock
         PEA   ^L0288FB
         PEA   L0288FB
         LDA   L0288F5+2
         PHA
         LDA   L0288F5
         PHA
         PEA   $0000
         PEA   $0032
         _PtrToHand
         PEA   $FFFF
         PEA   $8004
         LDA   L0288FD+2
         PHA
         LDA   L0288FD
         PHA
         _MarkResourceChange
         PEA   $8004
         LDA   L0288FD+2
         PHA
         LDA   L0288FD
         PHA
         _WriteResource
         PEA   $FFFF
         PEA   $8004
         LDA   L0288FD+2
         PHA
         LDA   L0288FD
         PHA
         _ReleaseResource
         _SetResourceFileDepth
         PLA
         RTL

L0288F5  ADRL  $00000000
L0288F9  DW    $0000
L0288FB  DW    $000C
L0288FD  ADRL  $00000000
         DW    $000A
         DW    $000A
         DW    $003C
         DW    $00C8
         ADRL  $85000000
         DW    $0000
         DW    $7400
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $A8
         DB    $63
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02892D  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L028C89
         PEA   L028C89
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02897C
	adrl	stickyON
	adrl	stickyOFF
	adrl	ctlICNsticky
	adrl	ctlICNdisabled
	 ADRL  L0289C8
         ADRL  L0289E8
         ADRL  L028A08
         ADRL  L028A68
         ADRL  L028A88
         ADRL  L028A28
         ADRL  L028A48
         ADRL  L028AA8
         ADRL  L028AC8
         ADRL  L028AE8
         ADRL  L028B08
         ADRL  L028B28
         ADRL  L028B48
         ADRL  L028B66
         ADRL  L028B84
         ADRL  L028BA2
         ADRL  L028BC0
         ADRL  L028BEF
         ADRL  $00000000

* AV 202010 - Checkbox Sticky

stickyON DW    $0008      ; pCount
         ADRL  $00000016  ; ID
         DW    41      ; rect
         DW    222
         DW    50
         DW    269
         ADRL  $84000000  ; procRef
         DW    $FF06      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTION   ; titleRef
         DW    $0001      ; initialValue

stickyOFF
         DW    $0008      ; pCount
         ADRL  $00000015  ; ID
         DW    41      ; rect
         DW    284
         DW    50
         DW    333
         ADRL  $84000000  ; procRef
         DW    $FF06      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTIOFF  ; titleRef
         DW    $0000      ; initialValue

ctlICNsticky
	 DW    $0008      ; pCount
         ADRL  $00000014  ; ID
         DW    41      ; rect
         DW    140
         DW    50
         DW    218
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strICNsticky
         DW    $0000      ; initialValue
	 
* Checkbox Disabled

ctlICNdisabled
	 DW    $0008      ; pCount
         ADRL  $00000013  ; ID
         DW    63      ; rect
         DW    $001E
         DW    72
         DW    $0077
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strICNdisabled
         DW    $0000      ; initialValue
	 
* Checkbox Invisible

L0289C8  DW    $0008      ; pCount
         ADRL  $00000012  ; ID
         DW    41      ; rect
         DW    $001E
         DW    50
         DW    $0080
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C6A    ; titleRef
         DW    $0000      ; initialValue

L0289E8  DW    $0008      ; pCount
         ADRL  $00000011  ; ID
         DW    $000A      ; rect
         DW    $001C
         DW    $0013
         DW    $0045
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C7B    ; textRef
         DW    $0002      ; textSize
L028A08  DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $000A      ; rect
         DW    $0054
         DW    $0013
         DW    $00A0
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L028A28  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $000A      ; rect
         DW    $00B4
         DW    $0013
         DW    $00EB
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C7D    ; textRef
         DW    $0007      ; textSize
L028A48  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0008      ; rect
         DW    $00FC
         DW    $0015
         DW    $0148
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L028A68  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $001A      ; rect
         DW    $001C
         DW    $0023
         DW    $0050
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C84    ; textRef
         DW    $0005      ; textSize
L028A88  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $0018      ; rect
         DW    $0054
         DW    $0025
         DW    $0148
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L02B9AD    ; defaultRef

* Checkbox Border

L028AA8  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    52      ; rect
         DW    $001E
         DW    61
         DW    $0080
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C4A    ; titleRef
         DW    $0000      ; initialValue

L028AC8  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0034      ; rect
         DW    $007E
         DW    $003D
         DW    $00CC
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C29    ; titleRef
         DW    $0001      ; initialValue

L028AE8  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0034      ; rect
         DW    $00DE
         DW    $003D
         DW    $0130
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C36    ; titleRef
         DW    $0000      ; initialValue

L028B08  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $003E      ; rect
         DW    $007E
         DW    $0047
         DW    $00CC
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C2F    ; titleRef
         DW    $0000      ; initialValue

L028B28  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $003E      ; rect
         DW    $00DE
         DW    $0047
         DW    $014E
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C3E    ; titleRef
         DW    $0000      ; initialValue

L028B48  DW    $0007      ; pCount
         ADRL  $00000006  ; ID
         DW    $0060      ; rect
         DW    $001C
         DW    $006D
         DW    $0076
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C1E    ; titleRef
L028B66  DW    $0007      ; pCount
         ADRL  $00000005  ; ID
         DW    $004D      ; rect
         DW    $001C
         DW    $005A
         DW    $0076
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C51    ; titleRef
L028B84  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $0060      ; rect
         DW    $0084
         DW    $006D
         DW    $00DE
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C61    ; titleRef
L028BA2  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $004D      ; rect
         DW    $0084
         DW    $005A
         DW    $00DE
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C59    ; titleRef
L028BC0  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $004D      ; rect
         DW    $00EE
         DW    $005A
         DW    $0148
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028BE8    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L028BE8  STR   'Cancel'
L028BEF  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0060      ; rect
         DW    $00EE
         DW    $006D
         DW    $0148
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028C17    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

strSTION	str	'On'
strSTIOFF	str	'Off'
strICNsticky	str	'Sticky'
strICNdisabled	str	'Disabled'

L028C17  STR   'Change'
L028C1E  STR   'Display...'
L028C29  STR   'Round'
L028C2F  STR   'Square'
L028C36  STR   'Default'
L028C3E  STR   'Drop shadow'
L028C4A  STR   'Border'
L028C51  STR   'Edit...'
L028C59  STR   'Keys...'
L028C61  STR   'Color...'
L028C6A  STR   'Invisible'
L028C74  STR   ' Icon '
L028C7B  ASC   'ID'
L028C7D  ASC   'Ref Con'
L028C84  ASC   'Title'

L028C89  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L028C74    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L028CD9    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $004F      ; content rect
         DW    $011A
         DW    $00C6
         DW    $027B
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02897C    ; storage ptr
         DW    $0003
L028CD9  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L028CE3  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02911C
         PEA   L02911C
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L028D32  ADRL  L028E9D
         ADRL  L028E6E
         ADRL  L028DB0
         ADRL  L028DD0
         ADRL  L028E4E
         ADRL  L028E2E
         ADRL  L028E0E
         ADRL  L028F80
         ADRL  L029052
         ADRL  L028F62
         ADRL  L028F44
         ADRL  L029034
         ADRL  L029016
         ADRL  L028FF8
         ADRL  L028F08
         ADRL  L028F26
         ADRL  L028D92
         ADRL  L028ECC
         ADRL  L028FDA
         ADRL  L028FBC
         ADRL  L028EEA
         ADRL  L028F9E
         ADRL  L028DF0
         ADRL  $00000000
L028D92  DW    $0007      ; pCount
         ADRL  $00000011  ; ID
         DW    $0008      ; rect
         DW    $00F4
         DW    $000F
         DW    $0110
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000006  ; refCon
         ADRL  L029360    ; iconRef
L028DB0  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0022      ; rect
         DW    $0024
         DW    $002B
         DW    $0138
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0290FA    ; titleRef
         DW    $0000      ; initialValue
L028DD0  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0018      ; rect
         DW    $0024
         DW    $0021
         DW    $0134
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0290D8    ; titleRef
         DW    $0001      ; initialValue
L028DF0  DW    $0007      ; pCount
         ADRL  $00000017  ; ID
         DW    $0008      ; rect
         DW    $003E
         DW    $000F
         DW    $005A
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029180    ; iconRef
L028E0E  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0043      ; rect
         DW    $0024
         DW    $004C
         DW    $015C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0290B1    ; titleRef
         DW    $0000      ; initialValue
L028E2E  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0039      ; rect
         DW    $0024
         DW    $0042
         DW    $0124
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029092    ; titleRef
         DW    $0000      ; initialValue
L028E4E  DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $002F      ; rect
         DW    $0024
         DW    $0038
         DW    $0132
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029070    ; titleRef
         DW    $0000      ; initialValue
L028E6E  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0052      ; rect
         DW    $0048
         DW    $005F
         DW    $00A2
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028E96    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L028E96  STR   'Cancel'
L028E9D  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0052      ; rect
         DW    $00D8
         DW    $005F
         DW    $0132
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L028EC5    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L028EC5  STR   'Change'
L028ECC  DW    $0007      ; pCount
         ADRL  $00000012  ; ID
         DW    $0008      ; rect
         DW    $00D4
         DW    $000F
         DW    $00F0
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000005  ; refCon
         ADRL  L029310    ; iconRef
L028EEA  DW    $0007      ; pCount
         ADRL  $00000015  ; ID
         DW    $0008      ; rect
         DW    $007A
         DW    $000F
         DW    $0096
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000002  ; refCon
         ADRL  L029220    ; iconRef
L028F08  DW    $0007      ; pCount
         ADRL  $0000000F  ; ID
         DW    $0010      ; rect
         DW    $003E
         DW    $0017
         DW    $005A
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000008  ; refCon
         ADRL  L029400    ; iconRef
L028F26  DW    $0007      ; pCount
         ADRL  $00000010  ; ID
         DW    $0008      ; rect
         DW    $0112
         DW    $000F
         DW    $012E
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000007  ; refCon
         ADRL  L0293B0    ; iconRef
L028F44  DW    $0007      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0010      ; rect
         DW    $00B6
         DW    $0017
         DW    $00D2
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000C  ; refCon
         ADRL  L029540    ; iconRef
L028F62  DW    $0007      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0010      ; rect
         DW    $00D4
         DW    $0017
         DW    $00F0
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000D  ; refCon
         ADRL  L029590    ; iconRef
L028F80  DW    $0007      ; pCount
         ADRL  $00000008  ; ID
         DW    $0010      ; rect
         DW    $0114
         DW    $0017
         DW    $012E
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000F  ; refCon
         ADRL  L029630    ; iconRef
L028F9E  DW    $0007      ; pCount
         ADRL  $00000016  ; ID
         DW    $0008      ; rect
         DW    $005C
         DW    $000F
         DW    $0078
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000001  ; refCon
         ADRL  L0291D0    ; iconRef
L028FBC  DW    $0007      ; pCount
         ADRL  $00000014  ; ID
         DW    $0008      ; rect
         DW    $009A
         DW    $000F
         DW    $00B2
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000003  ; refCon
         ADRL  L029270    ; iconRef
L028FDA  DW    $0007      ; pCount
         ADRL  $00000013  ; ID
         DW    $0008      ; rect
         DW    $00B8
         DW    $000F
         DW    $00D0
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000004  ; refCon
         ADRL  L0292C0    ; iconRef
L028FF8  DW    $0007      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0010      ; rect
         DW    $005E
         DW    $0017
         DW    $0076
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000009  ; refCon
         ADRL  L029450    ; iconRef
L029016  DW    $0007      ; pCount
         ADRL  $0000000D  ; ID
         DW    $0010      ; rect
         DW    $007C
         DW    $0017
         DW    $0094
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000A  ; refCon
         ADRL  L0294A0    ; iconRef
L029034  DW    $0007      ; pCount
         ADRL  $0000000C  ; ID
         DW    $0010      ; rect
         DW    $009A
         DW    $0017
         DW    $00B2
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000B  ; refCon
         ADRL  L0294F0    ; iconRef
L029052  DW    $0007      ; pCount
         ADRL  $00000009  ; ID
         DW    $0010      ; rect
         DW    $00F6
         DW    $0017
         DW    $010E
         ADRL  $07FF0001  ; procRef
         DW    $0006      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000E  ; refCon
         ADRL  L0295E0    ; iconRef
L029070  STR   'Off line (AND light-gray pattern)'
L029092  STR   'Open (Copy light-gray pattern)'
L0290B1  STR   'Selected (Invert image before copying)'
L0290D8  STR   'Background color applied to black'
L0290FA  STR   'Foreground color applied to white'
L02911C  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02916C    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L029176    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0056      ; content rect
         DW    $00F2
         DW    $00BC
         DW    $0265
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L028D32    ; storage ptr
         DW    $0003
L02916C  STR   ' Display '
L029176  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L029180  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0291D0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   011111111110
         HEX   011111111110
         HEX   011111111110
         HEX   011111111110
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029220  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   022222222220
         HEX   022222222220
         HEX   022222222220
         HEX   022222222220
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029270  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   033333333330
         HEX   033333333330
         HEX   033333333330
         HEX   033333333330
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0292C0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   044444444440
         HEX   044444444440
         HEX   044444444440
         HEX   044444444440
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029310  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   055555555550
         HEX   055555555550
         HEX   055555555550
         HEX   055555555550
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029360  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   066666666660
         HEX   066666666660
         HEX   066666666660
         HEX   066666666660
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0293B0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   077777777770
         HEX   077777777770
         HEX   077777777770
         HEX   077777777770
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029400  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   088888888880
         HEX   088888888880
         HEX   088888888880
         HEX   088888888880
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029450  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   099999999990
         HEX   099999999990
         HEX   099999999990
         HEX   099999999990
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0294A0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0AAAAAAAAAA0
         HEX   0AAAAAAAAAA0
         HEX   0AAAAAAAAAA0
         HEX   0AAAAAAAAAA0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0294F0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0BBBBBBBBBB0
         HEX   0BBBBBBBBBB0
         HEX   0BBBBBBBBBB0
         HEX   0BBBBBBBBBB0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029540  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0CCCCCCCCCC0
         HEX   0CCCCCCCCCC0
         HEX   0CCCCCCCCCC0
         HEX   0CCCCCCCCCC0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029590  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0DDDDDDDDDD0
         HEX   0DDDDDDDDDD0
         HEX   0DDDDDDDDDD0
         HEX   0DDDDDDDDDD0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L0295E0  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0EEEEEEEEEE0
         HEX   0EEEEEEEEEE0
         HEX   0EEEEEEEEEE0
         HEX   0EEEEEEEEEE0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
L029630  DW    $0000      ; Icon type
         DW    $0024      ; Icon size
         DW    $0006      ; Icon height
         DW    $000C      ; Icon width
         HEX   000000000000 ; Icon image
         HEX   0FFFFFFFFFF0
         HEX   0FFFFFFFFFF0
         HEX   0FFFFFFFFFF0
         HEX   0FFFFFFFFFF0
         HEX   000000000000
         HEX   FFFFFFFFFFFF ; Icon mask
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF
         HEX   FFFFFFFFFFFF

*--- Window for Stat text control

L029680  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02994B
         PEA   L02994B
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

*--- Controls for the Stat text window

L0296CF
	adrl	ctlBlastText
	adrl	ctlTextCanDim
	adrl	ctlSquishText
         ADRL  L029707
         ADRL  L029727
         ADRL  L029747
         ADRL  L029767
         ADRL  L029787
         ADRL  L0297A7
         ADRL  L0297C7
         ADRL  L0297E7
         ADRL  L029807
         ADRL  L029827
         ADRL  L029847
         ADRL  L029865
         ADRL  L02988D
         ADRL  $00000000

* Checkbox Blast text (bit 2)

ctlBlastText
         DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    102      ; rect
         DW    $001A
         DW    111
         DW    $0094
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strBlastText    ; titleRef
         DW    $0000      ; initialValue

* Checkbox Text can dim (bit 3)

ctlTextCanDim
         DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    112      ; rect
         DW    $001A
         DW    121
         DW    $00AE
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTextCanDim    ; titleRef
         DW    $0000      ; initialValue

* Checkbox Squish text (bit 4)

ctlSquishText
         DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    122      ; rect
         DW    $001A
         DW    131
         DW    $009E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSquishText    ; titleRef
         DW    $0000      ; initialValue

* Checkbox Invisible (bit 7)

L029707  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    7      ; rect
         DW    $001A
         DW    16
         DW    $007E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02992C    ; titleRef
         DW    $0000      ; initialValue

* Checkbox Text substitution (bit 1)

L029727  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    92      ; rect (was 9B)
         DW    $001A	; was 3E
         DW    101	  ; was A4
         DW    $00BC	; was E0
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02991A    ; titleRef
         DW    $0000      ; initialValue

* Radio Left justification

L029747  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    50      ; rect
         DW    $001A
         DW    59
         DW    $00BA
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029907    ; titleRef
         DW    $0000      ; initialValue

* Radio Right justification

L029767  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    60      ; rect
         DW    $001A
         DW    69
         DW    $00CE
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298F2    ; titleRef
         DW    $0000      ; initialValue

* Radio Center justification

L029787  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    70      ; rect
         DW    $001A
         DW    79
         DW    $00C8
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298DE    ; titleRef
         DW    $0000      ; initialValue

* Radio Full justification

L0297A7  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    80      ; rect
         DW    $001A
         DW    89
         DW    $00C0
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298CB    ; titleRef
         DW    $0000      ; initialValue

* Static text ID

L0297C7  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    21      ; rect
         DW    $0016
         DW    30
         DW    $0061
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029942    ; textRef
         DW    $0002      ; textSize

* Static text ID value

L0297E7  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    21      ; rect
         DW    $006A
         DW    30
         DW    $00B6
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize

* Static text Ref Con

L029807  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    36      ; rect
         DW    $0016
         DW    45
         DW    $0061
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029944    ; textRef
         DW    $0007      ; textSize

* Line edit Ref Con

L029827  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    34      ; rect
         DW    $006A
         DW    47
         DW    $00B6
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0014      ; maxSize
         ADRL  L02BAAD    ; defaultRef

* Button Edit...

L029847  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    134	  ; rect from 100
         DW    $001A
         DW    147	  ; 113
         DW    $0074
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298C3    ; titleRef

* Button Cancel

L029865  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    150      ; rect
         DW    $001A
         DW    163
         DW    $0074
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298BC    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

* Button Change

L02988D  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    150      ; rect
         DW    $0086
         DW    163
         DW    $00E0
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L0298B5    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

L0298B5  STR   'Change'
L0298BC  STR   'Cancel'
L0298C3  STR   'Edit...'
L0298CB  STR   'Full justification'
L0298DE  STR   'Right justification'
L0298F2  STR   'Center justification'
L029907  STR   'Left justification'
L02991A  STR   'Text substitution'
L02992C  STR   'Invisible'
L029936  STR   ' Stat text '
L029942  ASC   'ID'
L029944  ASC   'Ref Con'

* AV 202010

strBlastText	str	'Blast text'
strTextCanDim	str	'Text can dim'
strSquishText	str	'Squish text'

*--- Window for Static Text

L02994B  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L029936    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02999B    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
	 		  ; content rect
         DW    $001B      ; 18  Y1 (was 3A or 58d) AV 202010
         DW    $0188	  ; 392 X1
         DW    $00C6	  ; 198 Y2
         DW    $027C	  ; 636 X2
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L0296CF    ; storage ptr
         DW    $0003

L02999B  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0

L0299A5  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L029BFF
         PEA   L029BFF
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L0299F4  ADRL  L029A28
         ADRL  L029AA8
         ADRL  L029B54
         ADRL  L029A68
         ADRL  L029B74
         ADRL  L029A48
         ADRL  L029B94
         ADRL  L029A88
         ADRL  L029AC8
         ADRL  L029AE6
         ADRL  L029B04
         ADRL  L029B2C
         ADRL  $00000000
L029A28  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $0007      ; rect
         DW    $0018
         DW    $0010
         DW    $0086
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BDB    ; titleRef
         DW    $0000      ; initialValue
L029A48  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0024      ; rect
         DW    $0112
         DW    $0031
         DW    $015E
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L029A68  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0026      ; rect
         DW    $0058
         DW    $002F
         DW    $00A4
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L029A88  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0013      ; rect
         DW    $005A
         DW    $0020
         DW    $015E
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L02B9AD    ; defaultRef
L029AA8  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0007      ; rect
         DW    $008A
         DW    $0010
         DW    $00E2
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BD3    ; titleRef
         DW    $0000      ; initialValue
L029AC8  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $0036      ; rect
         DW    $0018
         DW    $0043
         DW    $0066
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BCB    ; titleRef
L029AE6  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $0036      ; rect
         DW    $006A
         DW    $0043
         DW    $00B8
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BC2    ; titleRef
L029B04  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0036      ; rect
         DW    $00BC
         DW    $0043
         DW    $010A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BBB    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L029B2C  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0036      ; rect
         DW    $0114
         DW    $0043
         DW    $0164
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BB4    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L029B54  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0026      ; rect
         DW    $0018
         DW    $002F
         DW    $0055
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BF1    ; textRef
         DW    $0002      ; textSize
L029B74  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0026      ; rect
         DW    $00D4
         DW    $002F
         DW    $010F
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BF3    ; textRef
         DW    $0007      ; textSize
L029B94  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0015      ; rect
         DW    $0016
         DW    $001E
         DW    $0057
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029BFA    ; textRef
         DW    $0005      ; textSize
L029BB4  STR   'Change'
L029BBB  STR   'Cancel'
L029BC2  STR   'Color...'
L029BCB  STR   'Keys...'
L029BD3  STR   'Checked'
L029BDB  STR   'Invisible'
L029BE5  STR   ' Check box '
L029BF1  ASC   'ID'
L029BF3  ASC   'Ref Con'
L029BFA  ASC   'Title'

L029BFF  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L029BE5    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L029C4F    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0078      ; content rect
         DW    $0102
         DW    $00C6
         DW    $027B
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L0299F4    ; storage ptr
         DW    $0003
L029C4F  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0

*--- Line Edit control entry point

L029C59  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L029EB5
         PEA   L029EB5
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L029CA8
	 adrl	ctlPWCHAR	; D
	 adrl	ctlNOTAPWD	; F
	 adrl	ctlKEYMASK	; 10
	 adrl	ctlLEDOLLAR1	; 12
	 adrl	ctlLEDOLLAR2	; 13
         ADRL  L029E2C	; 1
         ADRL  L029E0C	; 2
         ADRL  L029DEC	; 3
         ADRL  L029D8C	; 4
         ADRL  L029DCC	; 9 refCon text
         ADRL  L029D4C	; 7 Text string
         ADRL  L029DAC	; 8 refCon value
	 adrl	ctlKEYMASKVALUE	; 11 keyMask value
	 adrl	ctlPWCHARVALUE	; E pwChar value
         ADRL  L029D6C	; 4 maxChar value
         ADRL  L029D2C	; 6 Text value
         ADRL  L029E4C	; A
         ADRL  L029D04	; B
         ADRL  L029CDC	; C
         ADRL  $00000000

ctlLEDOLLAR1  DW    $0008      ; pCount - pwChar $
         ADRL  $00000012  ; ID
         DW    70      ; rect
         DW    94
         DW    79
         DW    103
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strLEDOLLAR1  ; textRef
         DW    1      ; textSize

ctlLEDOLLAR2 DW    $0008      ; pCount - Key mask $
         ADRL  $00000013  ; ID
         DW    10      ; rect
         DW    269
         DW    19
         DW    278
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strLEDOLLAR1  ; textRef
         DW    1      ; textSize
	 
ctlPWCHAR  DW    $0008      ; pCount - Password char text
         ADRL  $0000000D  ; ID
         DW    70      ; rect
         DW    24
         DW    79
         DW    89
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strPWCHAR  ; textRef
         DW    8      ; textSize

ctlPWCHARVALUE  DW    $0008      ; pCount - Password char value in hex
         ADRL  $0000000E  ; ID
         DW    68      ; rect
         DW    104
         DW    81
         DW    152
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0004      ; maxSize
         ADRL  pwChar0     ; defaultRef

ctlNOTAPWD  DW    $0008      ; pCount - Not a password checkbox
         ADRL  $0000000F  ; ID
         DW    70      ; rect
         DW    $00C0
         DW    79
         DW    $014A
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strNOTPWD    ; titleRef
         DW    $0000      ; initialValue

ctlKEYMASK  DW    $0008      ; pCount - Key mask text
         ADRL  $00000010  ; ID
         DW    10      ; rect
         DW    186
         DW    19
         DW    265
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strKEYMASK    ; textRef
         DW    $0008      ; textSize

ctlKEYMASKVALUE  DW    $0008      ; pCount - Key mask value
         ADRL  $00000011  ; ID
         DW    8      ; rect
         DW    278
         DW    21
         DW    326
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0004      ; maxSize
         ADRL  keyMask0   ; defaultRef

L029CDC  DW    $0009      ; pCount - Change button
         ADRL  $00000001  ; ID
         DW    85      ; rect - was 73
         DW    $00D0
         DW    101      ; was 86
         DW    $012A
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029E8C    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

L029D04  DW    $0009      ; pCount - Cancel button
         ADRL  $00000002  ; ID
         DW    85      ; rect - was 73
         DW    $003C
         DW    101      ; was 86
         DW    $0096
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029E85    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

L029D2C  DW    $0008      ; pCount - Text value
         ADRL  $00000006  ; ID
         DW    38      ; rect
         DW    $0068
         DW    51
         DW    $0146
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L02B9AD    ; defaultRef

L029D4C  DW    $0008      ; pCount - Text
         ADRL  $00000007  ; ID
         DW    40      ; rect
         DW    $0018
         DW    49
         DW    $0063
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029E9F    ; textRef
         DW    $0004      ; textSize

L029D6C  DW    $0008      ; pCount - Max Chars value
         ADRL  $00000004  ; ID
         DW    53      ; rect
         DW    $0068
         DW    66
         DW    $008C
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L02BCAD    ; defaultRef

L029D8C  DW    $0008      ; pCount - Max Chars text
         ADRL  $00000005  ; ID
         DW    55      ; rect
         DW    $0018
         DW    64
         DW    $0063
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029EA3    ; textRef
         DW    $0009      ; textSize

L029DAC  DW    $0008      ; pCount - Ref Con value
         ADRL  $00000008  ; ID
         DW    23      ; rect
         DW    $00FA
         DW    36
         DW    $0146
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef

L029DCC  DW    $0008      ; pCount - Ref Con text
         ADRL  $00000009  ; ID
         DW    25      ; rect
         DW    $00BA
         DW    34
         DW    $00F7
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029EAC    ; textRef
         DW    $0007      ; textSize

L029DEC  DW    $0008      ; pCount - ID value
         ADRL  $0000000A  ; ID
         DW    25      ; rect
         DW    $0068
         DW    34
         DW    $00B4
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize

L029E0C  DW    $0008      ; pCount - ID text
         ADRL  $0000000B  ; ID
         DW    25      ; rect
         DW    $0018
         DW    34
         DW    $0063
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029EB3    ; textRef
         DW    $0002      ; textSize

L029E2C  DW    $0008      ; pCount - Invisible
         ADRL  $0000000C  ; ID
         DW    9      ; rect
         DW    $001C
         DW    18
         DW    $0080
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029E7B    ; titleRef
         DW    $0000      ; initialValue

L029E4C  DW    $0008      ; pCount - Password checkbox
         ADRL  $00000003  ; ID
         DW    55      ; rect
         DW    $00C0
         DW    64
         DW    $014A
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L029E6C    ; titleRef
         DW    $0000      ; initialValue

L029E6C  STR   'Password field'
L029E7B  STR   'Invisible'
L029E85  STR   'Cancel'
L029E8C  STR   'Change'
L029E93  STR   ' Line Edit '
L029E9F  ASC   'Text'
L029EA3  ASC   'Max chars'
L029EAC  ASC   'Ref Con'
L029EB3  ASC   'ID'

strNOTPWD	str	'Not a password'
strPWCHAR	asc	'Pwd char'
pwChar0	db	$04
pwChar	ENT
	asc	'FFFF'	; Default password character

strKEYMASK	asc	'Key mask'
keyMask0	db $04
keyMask	ENT
	asc	'0001'	; Default key mask
strLEDOLLAR1	asc	'$'

*---

L029EB5  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L029E93    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L029F05    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    85      ; content rect - was 100
         DW    280
         DW    198
         DW    636
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L029CA8    ; storage ptr
         DW    $0003
L029F05  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0

*--- AV 202010 - Adding Rectangle and Thermometer

showRECTANGLE	 ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^winRECTANGLE
         PEA   winRECTANGLE
         PEA   $800E
         _NewWindow2
         lda	1,s
         sta	L026C7F
         lda	3,s
         sta	L026C7F+2
         _SetPort
         PLB
         PLD
         RTL

winRECTANGLE
         DW    $0050
         DW    $80A0      ; frame bits
         ADRL  titleRECTANGLE    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  clrRECTANGLE    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    75      ; content rect - was 100
         DW    280
         DW    198
         DW    636
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  ctlRECTANGLE    ; storage ptr
         DW    $0003
clrRECTANGLE
         DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0

titleRECTANGLE	str	' Rectangle '

ctlRECTANGLE
	adrl	ctlRECTF	; penWidth
	adrl	ctlRECTE
	adrl	ctlRECTD	; penHeight
	adrl	ctlRECTC
	adrl	ctlRECTB
	adrl	ctlRECTA
	adrl	ctlRECT9
	adrl	ctlRECT8
	adrl	ctlRECT7
	adrl	ctlRECT6	; refCon value
	adrl	ctlRECT5
	adrl	ctlRECT4
	adrl	ctlRECT3
	adrl	ctlRECT2
	adrl	ctlRECT1
	adrl	$0

ctlRECT1 DW    $0009      ; pCount - Change button
         ADRL  $00000001  ; ID
         DW    99      ; rect - was 73
         DW    $00D0
         DW    115      ; was 86
         DW    $012A
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT1    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

ctlRECT2 DW    $0009      ; pCount - Cancel button
         ADRL  $00000002  ; ID
         DW    99      ; rect - was 73
         DW    $003C
         DW    115      ; was 86
         DW    $0096
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT2    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

ctlRECT3  DW    $0008      ; pCount - ID text
         ADRL  $00000003  ; ID
         DW    9      ; rect
         DW    200
         DW    18
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT3    ; textRef
         DW    $0002      ; textSize

ctlRECT4  DW    $0008      ; pCount - ID value
         ADRL  $00000004  ; ID
         DW    9      ; rect
         DW    234
         DW    18
         DW    310
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize

ctlRECT5  DW    $0008      ; pCount - Ref Con text
         ADRL  $00000005  ; ID
         DW    25      ; rect
         DW    24
         DW    34
         DW    100
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT5    ; textRef
         DW    $0007      ; textSize

ctlRECT6  DW    $0008      ; pCount - Ref Con value
         ADRL  $00000006  ; ID
         DW    23      ; rect
         DW    104
         DW    36
         DW    180
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef

ctlRECT7  DW    $0008      ; pCount - Invisible
         ADRL  $00000007  ; ID
         DW    9      ; rect
         DW    24
         DW    18
         DW    124
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT7    ; titleRef
         DW    $0000      ; initialValue

ctlRECT8  DW    $0008      ; pCount - Appearance
         ADRL  $00000008  ; ID
         DW    43      ; rect
         DW    24
         DW    52
         DW    124
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT8    ; textRef
         DW    10      ; textSize

ctlRECT9 DW    $0008      ; pCount - Transparent
         ADRL  $0000009  ; ID
         DW    43      ; rect
         DW    130
         DW    52
         DW    270
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECT9   ; titleRef
         DW    $0000      ; initialValue

ctlRECTA DW    $0008      ; pCount - Grey pattern
         ADRL  $000000A  ; ID
         DW    54      ; rect
         DW    130
         DW    63
         DW    270
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECTA   ; titleRef
         DW    $0000      ; initialValue

ctlRECTB DW    $0008      ; pCount - Black pattern
         ADRL  $000000B  ; ID
         DW    65      ; rect
         DW    130
         DW    74
         DW    270
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECTB  ; titleRef
         DW    $0000      ; initialValue

ctlRECTC  DW    $0008      ; pCount - Pen height text
         ADRL  $0000000C  ; ID
         DW    81      ; rect
         DW    24
         DW    90
         DW    103
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECTC  ; textRef
         DW    10      ; textSize

ctlRECTD  DW    $0008      ; pCount - Pen height value
         ADRL  $0000000D  ; ID
         DW    79      ; rect
         DW    114
         DW    92
         DW    172	; 162 - LOGO
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize - $0004 LOGO
         ADRL  strRECTD    ; defaultRef
	 
ctlRECTE  DW    $0008      ; pCount - Pen width text
         ADRL  $0000000E  ; ID
         DW    81      ; rect
         DW    180
         DW    90
         DW    250
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strRECTE  ; textRef
         DW    9      ; textSize

ctlRECTF  DW    $0008      ; pCount - Pen width value
         ADRL  $0000000F  ; ID
         DW    79      ; rect
         DW    264
         DW    92
         DW    322
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize
         ADRL  strRECTF   ; defaultRef
	 
strRECT1	str	'Change'
strRECT2	str	'Cancel'
strRECT3	asc	'ID'
strRECT5	asc	'Ref Con'
strRECT7	str	'Invisible'
strRECT8	asc	'Appearance'
strRECT9	str	'Transparent'
strRECTA	str	'Grey pattern'
strRECTB	str	'Black pattern'
strRECTC	asc	'Pen height'
strRECTD	db	$05
strRECTD2	ENT
		asc	'00001'
strRECTE	asc	'Pen width'
strRECTF	db	$05
strRECTF2	ENT
		asc	'00002'

*---

showTHERMOMETER ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^winTHERMOMETER
         PEA   winTHERMOMETER
         PEA   $800E
         _NewWindow2
         lda	1,s
         sta	L026C7F
         lda	3,s
         sta	L026C7F+2
         _SetPort
         PLB
         PLD
         RTL

winTHERMOMETER
         DW    $0050
         DW    $80A0      ; frame bits
         ADRL  titleTHERMOMETER    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  clrTHERMOMETER    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    70      ; content rect - was 100
         DW    280
         DW    198
         DW    636
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  ctlTHERMOMETER    ; storage ptr
         DW    $0003
clrTHERMOMETER
         DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0

titleTHERMOMETER	str	' Thermometer '

ctlTHERMOMETER
	adrl	ctlTHERMOF
	adrl	ctlTHERMOE
	adrl	ctlTHERMOD
	adrl	ctlTHERMOC
	adrl	ctlTHERMOA	; no B control
	adrl	ctlTHERMO9
	adrl	ctlTHERMO8
	adrl	ctlTHERMO7
	adrl	ctlTHERMO6
	adrl	ctlTHERMO5
	adrl	ctlTHERMO4
	adrl	ctlTHERMO3
	adrl	ctlTHERMO2
	adrl	ctlTHERMO1
	adrl	$0

ctlTHERMO1 DW    $0009      ; pCount - Change button
         ADRL  $00000001  ; ID
         DW    104      ; rect - was 73
         DW    $00D0
         DW    120      ; was 86
         DW    $012A
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO1    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

ctlTHERMO2 DW    $0009      ; pCount - Cancel button
         ADRL  $00000002  ; ID
         DW    104      ; rect - was 73
         DW    $003C
         DW    120      ; was 86
         DW    $0096
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO2    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits

ctlTHERMO3  DW    $0008      ; pCount - ID text
         ADRL  $00000003  ; ID
         DW    9      ; rect
         DW    200
         DW    18
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO3    ; textRef
         DW    $0002      ; textSize

ctlTHERMO4  DW    $0008      ; pCount - ID value
         ADRL  $00000004  ; ID
         DW    9      ; rect
         DW    234
         DW    18
         DW    310
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize

ctlTHERMO5  DW    $0008      ; pCount - Ref Con text
         ADRL  $00000005  ; ID
         DW    25      ; rect
         DW    24
         DW    34
         DW    100
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO5    ; textRef
         DW    $0007      ; textSize

ctlTHERMO6  DW    $0008      ; pCount - Ref Con value
         ADRL  $00000006  ; ID
         DW    23      ; rect
         DW    104
         DW    36
         DW    180
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef

ctlTHERMO7  DW    $0008      ; pCount - Invisible
         ADRL  $00000007  ; ID
         DW    9      ; rect
         DW    24
         DW    18
         DW    124
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO7    ; titleRef
         DW    $0000      ; initialValue

ctlTHERMO8  DW    $0008      ; pCount - Orientation
         ADRL  $00000008  ; ID
         DW    43      ; rect
         DW    24
         DW    52
         DW    124
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO8    ; textRef
         DW    11      ; textSize

ctlTHERMO9 DW    $0008      ; pCount - Vertical
         ADRL  $0000009  ; ID
         DW    43      ; rect
         DW    130
         DW    52
         DW    270
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMO9   ; titleRef
         DW    $0000      ; initialValue

ctlTHERMOA DW    $0008      ; pCount - Horizontal
         ADRL  $000000A  ; ID
         DW    54      ; rect
         DW    130
         DW    63
         DW    270
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMOA   ; titleRef
         DW    $0000      ; initialValue

ctlTHERMOC  DW    $0008      ; pCount - Position
         ADRL  $0000000C  ; ID
         DW    70      ; rect
         DW    24
         DW    79
         DW    103
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMOC  ; textRef
         DW    8      ; textSize

ctlTHERMOD  DW    $0008      ; pCount - Position value
         ADRL  $0000000D  ; ID
         DW    68      ; rect
         DW    114
         DW    81
         DW    172
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize
         ADRL  strTHERMOD    ; defaultRef
	 
ctlTHERMOE  DW    $0008      ; pCount - Scale text
         ADRL  $0000000E  ; ID
         DW    86      ; rect
         DW    24
         DW    95
         DW    103
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strTHERMOE  ; textRef
         DW    5      ; textSize

ctlTHERMOF  DW    $0008      ; pCount - Scale value
         ADRL  $0000000F  ; ID
         DW    84      ; rect
         DW    114
         DW    97
         DW    172
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize
         ADRL  strTHERMOF   ; defaultRef


strTHERMO1	str	'Change'
strTHERMO2	str	'Cancel'
strTHERMO3	asc	'ID'
strTHERMO5	asc	'Ref Con'
strTHERMO7	str	'Invisible'
strTHERMO8	asc	'Orientation'
strTHERMO9	str	'Vertical'
strTHERMOA	str	'Horizontal'
strTHERMOC	asc	'Position'
strTHERMOD	db	$05
strTHERMOD2	ENT
		asc	'00001'
strTHERMOE	asc	'Scale'
strTHERMOF	db	$05
strTHERMOF2	ENT
		asc	'00002'

*---

L029F0F  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02A1B0
         PEA   L02A1B0
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L029F5E  ADRL  L02A03A
         ADRL  L029F9A
         ADRL  L029FBA
         ADRL  L02A01A
         ADRL  L02A108
         ADRL  L02A128
         ADRL  L02A05A
         ADRL  L02A07A
         ADRL  L029FFA
         ADRL  L029FDA
         ADRL  L02A148
         ADRL  L02A0C2
         ADRL  L02A0E0
         ADRL  L02A09A
         ADRL  $00000000
L029F9A  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $001B      ; rect
         DW    $00CA
         DW    $0024
         DW    $012E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A188    ; titleRef
         DW    $0000      ; initialValue
L029FBA  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $000C      ; rect
         DW    $001C
         DW    $0015
         DW    $0067
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A19C    ; textRef
         DW    $0002      ; textSize
L029FDA  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $000A      ; rect
         DW    $011A
         DW    $0017
         DW    $0166
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L029FFA  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $000C      ; rect
         DW    $00CA
         DW    $0015
         DW    $0115
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A19E    ; textRef
         DW    $0007      ; textSize
L02A01A  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $000C      ; rect
         DW    $0070
         DW    $0015
         DW    $00BC
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02A03A  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $001B      ; rect
         DW    $011A
         DW    $0024
         DW    $017E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A17E    ; titleRef
         DW    $0000      ; initialValue
L02A05A  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $001B      ; rect
         DW    $001C
         DW    $0024
         DW    $0067
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A1A5    ; textRef
         DW    $0006      ; textSize
L02A07A  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0019      ; rect
         DW    $0070
         DW    $0026
         DW    $0094
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L02BCAD    ; defaultRef
L02A09A  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $003E      ; rect
         DW    $015C
         DW    $004B
         DW    $01B6
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A177    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02A0C2  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $003E      ; rect
         DW    $0086
         DW    $004B
         DW    $00E0
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A16D    ; titleRef
L02A0E0  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $003E      ; rect
         DW    $00EE
         DW    $004B
         DW    $0148
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A166    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02A108  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $002A      ; rect
         DW    $001C
         DW    $0033
         DW    $0067
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A1AB    ; textRef
         DW    $0005      ; textSize
L02A128  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0028      ; rect
         DW    $0070
         DW    $0035
         DW    $017A
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L02B9AD    ; defaultRef
L02A148  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $003E      ; rect
         DW    $0020
         DW    $004B
         DW    $007A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A194    ; titleRef
L02A166  STR   'Cancel'
L02A16D  STR   'Colors...'
L02A177  STR   'Change'
L02A17E  STR   'Invisible'
L02A188  STR   'Set'
L02A18C  STR   ' Radio '
L02A194  STR   'Keys...'
L02A19C  ASC   'ID'
L02A19E  ASC   'Ref Con'
L02A1A5  ASC   'Family'
L02A1AB  ASC   'Title'
L02A1B0  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02A18C    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02A200    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $006E      ; content rect
         DW    $00AA
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L029F5E    ; storage ptr
         DW    $0003
L02A200  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02A20A  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02A69F
         PEA   L02A69F
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02A259  ADRL  L02A2B1
         ADRL  L02A2D1
         ADRL  L02A2F1
         ADRL  L02A311
         ADRL  L02A331
         ADRL  L02A3BF
         ADRL  L02A3DF
         ADRL  L02A3FF
         ADRL  L02A41F
         ADRL  L02A43F
         ADRL  L02A45F
         ADRL  L02A47F
         ADRL  L02A49F
         ADRL  L02A4BF
         ADRL  L02A4DF
         ADRL  L02A4FF
         ADRL  L02A51F
         ADRL  L02A53F
         ADRL  L02A351
         ADRL  L02A36F
         ADRL  L02A397
         ADRL  $00000000
L02A2B1  DW    $0008      ; pCount
         ADRL  $00000015  ; ID
         DW    $000B      ; rect
         DW    $001C
         DW    $0014
         DW    $007E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A678    ; titleRef
         DW    $0000      ; initialValue
L02A2D1  DW    $0008      ; pCount
         ADRL  $00000014  ; ID
         DW    $000B      ; rect
         DW    $0086
         DW    $0014
         DW    $00A3
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A696    ; textRef
         DW    $0002      ; textSize
L02A2F1  DW    $0008      ; pCount
         ADRL  $00000013  ; ID
         DW    $000B      ; rect
         DW    $00AC
         DW    $0014
         DW    $00F8
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02A311  DW    $0008      ; pCount
         ADRL  $00000012  ; ID
         DW    $000B      ; rect
         DW    $0102
         DW    $0014
         DW    $014D
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A698    ; textRef
         DW    $0007      ; textSize
L02A331  DW    $0008      ; pCount
         ADRL  $00000011  ; ID
         DW    $0009      ; rect
         DW    $0150
         DW    $0016
         DW    $019C
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02A351  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $005F      ; rect
         DW    $0092
         DW    $006C
         DW    $00EC
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A66E    ; titleRef
L02A36F  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $005F      ; rect
         DW    $010E
         DW    $006C
         DW    $0168
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A667    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02A397  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $005F      ; rect
         DW    $0190
         DW    $006C
         DW    $01EA
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A660    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02A3BF  DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $001A      ; rect
         DW    $001C
         DW    $0023
         DW    $0086
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A655    ; titleRef
         DW    $0000      ; initialValue
L02A3DF  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $001A      ; rect
         DW    $00E8
         DW    $0023
         DW    $0144
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A64C    ; titleRef
         DW    $0000      ; initialValue
L02A3FF  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0024      ; rect
         DW    $001C
         DW    $002D
         DW    $0080
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A642    ; titleRef
         DW    $0000      ; initialValue
L02A41F  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $0024      ; rect
         DW    $00E8
         DW    $002D
         DW    $01A2
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A62C    ; titleRef
         DW    $0000      ; initialValue
L02A43F  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $002E      ; rect
         DW    $001C
         DW    $0037
         DW    $00DE
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A615    ; titleRef
         DW    $0000      ; initialValue
L02A45F  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $002E      ; rect
         DW    $00E8
         DW    $0037
         DW    $019A
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A600    ; titleRef
         DW    $0000      ; initialValue
L02A47F  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0038      ; rect
         DW    $001C
         DW    $0041
         DW    $00E6
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A5E8    ; titleRef
         DW    $0000      ; initialValue
L02A49F  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0038      ; rect
         DW    $00E8
         DW    $0041
         DW    $01C6
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A5CD    ; titleRef
         DW    $0000      ; initialValue
L02A4BF  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0042      ; rect
         DW    $001C
         DW    $004B
         DW    $00E2
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A5B6    ; titleRef
         DW    $0000      ; initialValue
L02A4DF  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0042      ; rect
         DW    $00E8
         DW    $004B
         DW    $01DA
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A598    ; titleRef
         DW    $0000      ; initialValue
L02A4FF  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $004C      ; rect
         DW    $001C
         DW    $0055
         DW    $00E6
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A580    ; titleRef
         DW    $0000      ; initialValue
L02A51F  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $004C      ; rect
         DW    $00E8
         DW    $0055
         DW    $01FC
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A55D    ; titleRef
         DW    $0000      ; initialValue
L02A53F  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $005F      ; rect
         DW    $001A
         DW    $006C
         DW    $0074
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02A68E    ; titleRef
L02A55D  STR   'Frame selected text when inactive '
L02A580  STR   'User cannot select text'
L02A598  STR   'Resizing window resizes ruler'
L02A5B6  STR   'Draw boundary rectangle'
L02A5CD  STR   'Enable tab to next control'
L02A5E8  STR   'Use smart cut and paste'
L02A600  STR   'Do not allow editing'
L02A615  STR   'Do not allow scrolling'
L02A62C  STR   'Do not word wrap text'
L02A642  STR   'One style'
L02A64C  STR   'Size box'
L02A655  STR   'Scroll bar'
L02A660  STR   'Change'
L02A667  STR   'Cancel'
L02A66E  STR   'Colors...'
L02A678  STR   'Invisible'
L02A682  STR   ' Text Edit '
L02A68E  STR   'Edit...'
L02A696  ASC   'ID'
L02A698  ASC   'Ref Con'
L02A69F  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02A682    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02A6EF    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $004B      ; content rect
         DW    $0068
         DW    $00C6
         DW    $027B
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02A259    ; storage ptr
         DW    $0003
L02A6EF  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02A6F9  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02AAC6
         PEA   L02AAC6
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02A748  ADRL  L02A79C
         ADRL  L02A7BC
         ADRL  L02A7DC
         ADRL  L02A7FC
         ADRL  L02A81C
         ADRL  L02A83C
         ADRL  L02A85C
         ADRL  L02A87C
         ADRL  L02A8DC
         ADRL  L02A97C
         ADRL  L02A91C
         ADRL  L02A93C
         ADRL  L02A95C
         ADRL  L02A8FC
         ADRL  L02A99C
         ADRL  L02A8BC
         ADRL  L02A89C
         ADRL  L02A9BC
         ADRL  L02A9DA
         ADRL  L02AA02
         ADRL  $00000000
L02A79C  DW    $0008      ; pCount
         ADRL  $00000014  ; ID
         DW    $000B      ; rect
         DW    $0022
         DW    $0014
         DW    $0090
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA89    ; titleRef
         DW    $0000      ; initialValue
L02A7BC  DW    $0008      ; pCount
         ADRL  $00000013  ; ID
         DW    $001D      ; rect
         DW    $0022
         DW    $0026
         DW    $00AC
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA7A    ; titleRef
         DW    $0000      ; initialValue
L02A7DC  DW    $0008      ; pCount
         ADRL  $00000012  ; ID
         DW    $0032      ; rect
         DW    $0022
         DW    $003B
         DW    $009A
         ADRL  $84000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA6D    ; titleRef
         DW    $0000      ; initialValue
L02A7FC  DW    $0008      ; pCount
         ADRL  $00000011  ; ID
         DW    $0018      ; rect
         DW    $00B0
         DW    $0021
         DW    $011E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA62    ; titleRef
         DW    $0000      ; initialValue
L02A81C  DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $0022      ; rect
         DW    $00B0
         DW    $002B
         DW    $011E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA56    ; titleRef
         DW    $0000      ; initialValue
L02A83C  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $002D      ; rect
         DW    $00B0
         DW    $0036
         DW    $011E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA4D    ; titleRef
         DW    $0000      ; initialValue
L02A85C  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0037      ; rect
         DW    $00B0
         DW    $0040
         DW    $011E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA42    ; titleRef
         DW    $0000      ; initialValue
L02A87C  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $000B      ; rect
         DW    $008E
         DW    $0014
         DW    $00AD
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AAA0    ; textRef
         DW    $0002      ; textSize
L02A89C  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0009      ; rect
         DW    $014E
         DW    $0016
         DW    $019A
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02A8BC  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $000B      ; rect
         DW    $0104
         DW    $0014
         DW    $0149
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AAA2    ; textRef
         DW    $0007      ; textSize
L02A8DC  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $000B      ; rect
         DW    $00B0
         DW    $0014
         DW    $00FC
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02A8FC  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0045      ; rect
         DW    $001E
         DW    $004E
         DW    $0069
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AAA9    ; textRef
         DW    $000A      ; textSize
L02A91C  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0043      ; rect
         DW    $006C
         DW    $0050
         DW    $00A0
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize
         ADRL  L02B9AD    ; defaultRef
L02A93C  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0045      ; rect
         DW    $00A6
         DW    $004E
         DW    $00F1
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AAB3    ; textRef
         DW    $0009      ; textSize
L02A95C  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0043      ; rect
         DW    $00F4
         DW    $0050
         DW    $0118
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0003      ; maxSize
         ADRL  L02BBAD    ; defaultRef
L02A97C  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0045      ; rect
         DW    $011A
         DW    $004E
         DW    $0165
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AABC    ; textRef
         DW    $000A      ; textSize
L02A99C  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0043      ; rect
         DW    $0166
         DW    $0050
         DW    $019A
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0005      ; maxSize
         ADRL  L02BCAD    ; defaultRef
L02A9BC  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $0058      ; rect
         DW    $0026
         DW    $0065
         DW    $0080
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA38    ; titleRef
L02A9DA  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0058      ; rect
         DW    $00B0
         DW    $0065
         DW    $010A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA31    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02AA02  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0058      ; rect
         DW    $013A
         DW    $0065
         DW    $0194
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AA2A    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02AA2A  STR   'Change'
L02AA31  STR   'Cancel'
L02AA38  STR   'Colors...'
L02AA42  STR   'Down arrow'
L02AA4D  STR   'Up arrow'
L02AA56  STR   'Right arrow'
L02AA62  STR   'Left arrow'
L02AA6D  STR   'Vertical bar'
L02AA7A  STR   'Horizontal bar'
L02AA89  STR   'Invisible'
L02AA93  STR   ' Scroll bar '
L02AAA0  ASC   'ID'
L02AAA2  ASC   'Ref Con'
L02AAA9  ASC   'Total size'
L02AAB3  ASC   '  Initial'
L02AABC  ASC   ' View size'
L02AAC6  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02AA93    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02AB16    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0058      ; content rect
         DW    $00C6
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02A748    ; storage ptr
         DW    $0003
L02AB16  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02AB20  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02AEB5
         PEA   L02AEB5
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02AB6F  ADRL  L02ABB7
         ADRL  L02ABD7
         ADRL  L02ABF7
         ADRL  L02AC17
         ADRL  L02AC37
         ADRL  L02AC57
         ADRL  L02AC77
         ADRL  L02AC97
         ADRL  L02ACB7
         ADRL  L02ADC3
         ADRL  L02AD83
         ADRL  L02ADA3
         ADRL  L02AD63
         ADRL  L02AD27
         ADRL  L02AD45
         ADRL  L02ACFF
         ADRL  L02ACD7
         ADRL  $00000000
L02ABB7  DW    $0008      ; pCount
         ADRL  $00000011  ; ID
         DW    $0016      ; rect
         DW    $0020
         DW    $001F
         DW    $0084
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE99    ; titleRef
         DW    $0000      ; initialValue
L02ABD7  DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $0016      ; rect
         DW    $00F8
         DW    $001F
         DW    $0158
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE90    ; titleRef
         DW    $0000      ; initialValue
L02ABF7  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $0020      ; rect
         DW    $0020
         DW    $0029
         DW    $00B0
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE80    ; titleRef
         DW    $0000      ; initialValue
L02AC17  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0020      ; rect
         DW    $00F8
         DW    $0029
         DW    $01B4
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE6A    ; titleRef
         DW    $0000      ; initialValue
L02AC37  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $002A      ; rect
         DW    $0020
         DW    $0033
         DW    $00B8
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE59    ; titleRef
         DW    $0000      ; initialValue
L02AC57  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $002A      ; rect
         DW    $00F8
         DW    $0033
         DW    $01B8
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE42    ; titleRef
         DW    $0000      ; initialValue
L02AC77  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0034      ; rect
         DW    $0020
         DW    $003D
         DW    $00AA
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE33    ; titleRef
         DW    $0000      ; initialValue
L02AC97  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0034      ; rect
         DW    $00F8
         DW    $003D
         DW    $01AE
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE1D    ; titleRef
         DW    $0000      ; initialValue
L02ACB7  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $003E      ; rect
         DW    $0020
         DW    $0047
         DW    $00F8
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AE03    ; titleRef
         DW    $0000      ; initialValue
L02ACD7  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $004D      ; rect
         DW    $0154
         DW    $005A
         DW    $01B0
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02ADFC    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02ACFF  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $004D      ; rect
         DW    $00EA
         DW    $005A
         DW    $0144
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02ADF5    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02AD27  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $004D      ; rect
         DW    $0020
         DW    $005A
         DW    $007A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02ADED    ; titleRef
L02AD45  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $004D      ; rect
         DW    $0086
         DW    $005A
         DW    $00E0
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02ADE3    ; titleRef
L02AD63  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0007      ; rect
         DW    $00F8
         DW    $0014
         DW    $0144
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02AD83  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0009      ; rect
         DW    $003C
         DW    $0012
         DW    $0088
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02ADA3  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0009      ; rect
         DW    $00AC
         DW    $0012
         DW    $00F7
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AEAC    ; textRef
         DW    $0007      ; textSize
L02ADC3  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0009      ; rect
         DW    $001C
         DW    $0012
         DW    $0037
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02AEB3    ; textRef
         DW    $0002      ; textSize
L02ADE3  STR   'Colors...'
L02ADED  STR   'Edit...'
L02ADF5  STR   'Cancel'
L02ADFC  STR   'Change'
L02AE03  STR   'Selection right justified'
L02AE1D  STR   'Title right justified'
L02AE33  STR   'Keep in window'
L02AE42  STR   'Don'27't set to selection'
L02AE59  STR   'Don'27't draw title'
L02AE6A  STR   'Don'27't highlight title'
L02AE80  STR   'Use white space'
L02AE90  STR   'Inactive'
L02AE99  STR   'Invisible'
L02AEA3  STR   ' Pop-up '
L02AEAC  ASC   'Ref Con'
L02AEB3  ASC   'ID'
L02AEB5  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02AEA3    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02AF05    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0064      ; content rect
         DW    $00B2
         DW    $00C6
         DW    $027B
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02AB6F    ; storage ptr
         DW    $0003
L02AF05  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02AF0F  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B0FB
         PEA   L02B0FB
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02AF5E  ADRL  L02AF86
         ADRL  L02AFA6
         ADRL  L02AFC6
         ADRL  L02AFE6
         ADRL  L02B006
         ADRL  L02B026
         ADRL  L02B046
         ADRL  L02B064
         ADRL  L02B08C
         ADRL  $00000000
L02AF86  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $000B      ; rect
         DW    $001C
         DW    $0014
         DW    $0082
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0DD    ; titleRef
         DW    $0000      ; initialValue
L02AFA6  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $001A      ; rect
         DW    $0018
         DW    $0023
         DW    $0033
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0F2    ; textRef
         DW    $0002      ; textSize
L02AFC6  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $001A      ; rect
         DW    $0038
         DW    $0023
         DW    $0084
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02AFE6  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $001A      ; rect
         DW    $008C
         DW    $0023
         DW    $00D7
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0F4    ; textRef
         DW    $0007      ; textSize
L02B006  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0018      ; rect
         DW    $00DA
         DW    $0025
         DW    $0126
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02B026  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $000B      ; rect
         DW    $0090
         DW    $0014
         DW    $012E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0CC    ; titleRef
         DW    $0000      ; initialValue
L02B046  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $002C      ; rect
         DW    $001A
         DW    $0039
         DW    $0074
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0C2    ; titleRef
L02B064  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $002C      ; rect
         DW    $007A
         DW    $0039
         DW    $00D4
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0BB    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B08C  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $002C      ; rect
         DW    $00DE
         DW    $0039
         DW    $0138
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B0B4    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B0B4  STR   'Change'
L02B0BB  STR   'Cancel'
L02B0C2  STR   'Colors...'
L02B0CC  STR   'Call grow window'
L02B0DD  STR   'Invisible'
L02B0E7  STR   ' Size box '
L02B0F2  ASC   'ID'
L02B0F4  ASC   'Ref Con'
L02B0FB  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02B0E7    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02B14B    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0084      ; content rect
         DW    $0132
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02AF5E    ; storage ptr
         DW    $0003
L02B14B  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02B155  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B363
         PEA   L02B363
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02B1A4  ADRL  L02B1D0
         ADRL  L02B1F0
         ADRL  L02B210
         ADRL  L02B230
         ADRL  L02B250
         ADRL  L02B270
         ADRL  L02B290
         ADRL  L02B2AE
         ADRL  L02B2CC
         ADRL  L02B2F4
         ADRL  $00000000
L02B1D0  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0009      ; rect
         DW    $001C
         DW    $0012
         DW    $008A
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B31C    ; titleRef
         DW    $0000      ; initialValue
L02B1F0  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0009      ; rect
         DW    $0090
         DW    $0012
         DW    $0110
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B346    ; titleRef
         DW    $0000      ; initialValue
L02B210  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0018      ; rect
         DW    $0018
         DW    $0021
         DW    $0063
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B35A    ; textRef
         DW    $0002      ; textSize
L02B230  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0018      ; rect
         DW    $006A
         DW    $0021
         DW    $00B6
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02B250  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0027      ; rect
         DW    $0018
         DW    $0030
         DW    $0063
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B35C    ; textRef
         DW    $0007      ; textSize
L02B270  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0025      ; rect
         DW    $006A
         DW    $0032
         DW    $00B6
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0014      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02B290  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $0039      ; rect
         DW    $001C
         DW    $0046
         DW    $0076
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B326    ; titleRef
L02B2AE  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $004B      ; rect
         DW    $001C
         DW    $0058
         DW    $0076
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B33C    ; titleRef
L02B2CC  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $004B      ; rect
         DW    $0084
         DW    $0058
         DW    $00DE
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B335    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B2F4  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $004B      ; rect
         DW    $00F2
         DW    $0058
         DW    $014C
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B32E    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B31C  STR   'Invisible'
L02B326  STR   'Edit...'
L02B32E  STR   'Change'
L02B335  STR   'Cancel'
L02B33C  STR   'Colors...'
L02B346  STR   'Multi-select'
L02B353  STR   ' List '
L02B35A  ASC   'ID'
L02B35C  ASC   'Ref Con'
L02B363  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02B353    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02B3B3    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0064      ; content rect
         DW    $011C
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02B1A4    ; storage ptr
         DW    $0003
L02B3B3  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02B3BD  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B571
         PEA   L02B571
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02B40C  ADRL  L02B430
         ADRL  L02B450
         ADRL  L02B470
         ADRL  L02B490
         ADRL  L02B4B0
         ADRL  L02B4D0
         ADRL  L02B4EE
         ADRL  L02B516
         ADRL  $00000000
L02B430  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $000A      ; rect
         DW    $0018
         DW    $0013
         DW    $007E
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B54C    ; titleRef
         DW    $0000      ; initialValue
L02B450  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0018      ; rect
         DW    $0012
         DW    $0021
         DW    $0042
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B568    ; textRef
         DW    $0002      ; textSize
L02B470  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0018      ; rect
         DW    $0046
         DW    $0021
         DW    $0092
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02B490  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0018      ; rect
         DW    $00B8
         DW    $0021
         DW    $00F5
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B56A    ; textRef
         DW    $0007      ; textSize
L02B4B0  DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0016      ; rect
         DW    $00F9
         DW    $0023
         DW    $0145
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02B4D0  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $002B      ; rect
         DW    $0018
         DW    $0038
         DW    $0072
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B560    ; titleRef
L02B4EE  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $002B      ; rect
         DW    $0086
         DW    $0038
         DW    $00E0
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B53E    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B516  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $002B      ; rect
         DW    $00F8
         DW    $0038
         DW    $0152
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B545    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B53E  STR   'Cancel'
L02B545  STR   'Change'
L02B54C  STR   'Invisible'
L02B556  STR   ' Picture '
L02B560  STR   'Edit...'
L02B568  ASC   'ID'
L02B56A  ASC   'Ref Con'
L02B571  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02B556    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02B5C1    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0081      ; content rect
         DW    $0110
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02B40C    ; storage ptr
         DW    $0003
L02B5C1  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02B5CB  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B907
         PEA   L02B907
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02B61A
         PEA   L02B61A
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02B61A  DW    $0050
         DW    $80A0      ; frame bits
         ADRL  L02B66A    ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L02B67A    ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $007D      ; content rect
         DW    $00C0
         DW    $00C6
         DW    $027C
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02B684    ; storage ptr
         DW    $0003
L02B66A  STR   ' Simple Button '
L02B67A  DW    $0000
         DW    $0F0F
         DW    $0004
         DW    $F0FF
         DW    $00F0
L02B684  ADRL  L02B6C4
         ADRL  L02B6E6
         ADRL  L02B706
         ADRL  L02B730
         ADRL  L02B756
         ADRL  L02B776
         ADRL  L02B79B
         ADRL  L02B7BB
         ADRL  L02B7E1
         ADRL  L02B809
         ADRL  L02B830
         ADRL  L02B85C
         ADRL  L02B882
         ADRL  L02B8A9
         ADRL  L02B8D8
         ADRL  $00000000
L02B6C4  DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $000A      ; rect
         DW    $0092
         DW    $0014
         DW    $00B1
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B6E4    ; textRef
         DW    $0002      ; textSize
L02B6E4  ASC   'ID'
L02B6E6  DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $000A      ; rect
         DW    $00B4
         DW    $0014
         DW    $0102
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BDAE    ; textRef
         DW    $0008      ; textSize
L02B706  DW    $0008      ; pCount
         ADRL  $0000000D  ; ID
         DW    $000A      ; rect
         DW    $0022
         DW    $0013
         DW    $0088
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B726    ; titleRef
         DW    $0000      ; initialValue
L02B726  STR   'Invisible'
L02B730  DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $000A      ; rect
         DW    $010C
         DW    $0013
         DW    $0151
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B750    ; textRef
         DW    $0006      ; textSize
L02B750  ASC   'Refcon'
L02B756  DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0008      ; rect
         DW    $0152
         DW    $0015
         DW    $01A2
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0008      ; maxSize
         ADRL  L02BAAD    ; defaultRef
L02B776  DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $0019      ; rect
         DW    $001E
         DW    $0023
         DW    $005D
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B796    ; textRef
         DW    $0005      ; textSize
L02B796  ASC   'Title'
L02B79B  DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0017      ; rect
         DW    $0062
         DW    $0024
         DW    $01A4
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $00FF      ; maxSize
         ADRL  L02B9AD    ; defaultRef
L02B7BB  DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $0027      ; rect
         DW    $0020
         DW    $0030
         DW    $006A
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B7DB    ; titleRef
         DW    $0001      ; initialValue
L02B7DB  STR   'Round'
L02B7E1  DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0027      ; rect
         DW    $0078
         DW    $0030
         DW    $00CE
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B801    ; titleRef
         DW    $0000      ; initialValue
L02B801  STR   'Default'
L02B809  DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0027      ; rect
         DW    $00D8
         DW    $0031
         DW    $0126
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B829    ; titleRef
         DW    $0000      ; initialValue
L02B829  STR   'Square'
L02B830  DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $0027      ; rect
         DW    $0136
         DW    $0030
         DW    $01A6
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B850    ; titleRef
         DW    $0000      ; initialValue
L02B850  STR   'Drop shadow'
L02B85C  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $0034      ; rect
         DW    $001E
         DW    $0041
         DW    $0078
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B87A    ; titleRef
L02B87A  STR   'Keys...'
L02B882  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $0034      ; rect
         DW    $0080
         DW    $0041
         DW    $00DA
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B8A0    ; titleRef
L02B8A0  STR   'Color...'
L02B8A9  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0034      ; rect
         DW    $00E2
         DW    $0041
         DW    $013C
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B8D1    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1E         ; keyequivalent
         ASC   1E         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B8D1  STR   'Cancel'
L02B8D8  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0034      ; rect
         DW    $0148
         DW    $0041
         DW    $01A2
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B900    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02B900  STR   'Change'
L02B907  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   L026C65
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0000
         _GetPort
         PLA
         STA   L02B98F
         PLA
         STA   L02B991
         PEA   ^L02B993
         PEA   L02B993
         _GetPortRect
         PEA   ^L02B993
         PEA   L02B993
         PEA   $0002
         PEA   $0001
         _InsetRect
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   ^L02B993
         PEA   L02B993
         _FrameRect
         _PenNormal
         LDA   L02B991
         PHA
         LDA   L02B98F
         PHA
         _DrawControls
         _SetCurResourceFile
         PLB
         PLD
         RTL

L02B98F  DB    $00
         DB    $00
L02B991  DB    $00
         DB    $00
L02B993  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02B99B  ENT
         DB    $00
         DB    $00
L02B99D  ENT
         DB    $00
         DB    $00
L02B99F  ENT
         DB    $00
         DB    $00
L02B9A1  ENT
         DB    $00
         DB    $00
L02B9A3  ENT
         DB    $00
         DB    $00
L02B9A5  ENT
         DB    $00
         DB    $00
L02B9A7  ENT
         DB    $00
         DB    $00
L02B9A9  ENT
         DB    $00
         DB    $00
L02B9AB  ENT
         DB    $00
         DB    $00

* These are the text buffers

L02B9AD  ENT
	 DS    $100
L02BAAD  ENT
         DS    $100
L02BBAD  ENT
         DS    $100
L02BCAD  ENT
         DS    $100
L02BDAD  ENT
         DB    $00
L02BDAE  DS    $FF
L02BEAD  ENT
         DS    $100

L02BFAD  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02C40D
         PEA   L02C40D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02C3BD
         PEA   L02C3BD
         PEA   $800E
         _NewWindow2
         PLA
         STA   L026C7F
         PLA
         STA   L026C7F+2
         LDA   L026C7F+2
         PHA
         LDA   L026C7F
         PHA
         _SetPort
         PLB
         PLD
         RTL

L02BFFC  ADRL  L02C058
         ADRL  L02C07F
         ADRL  L02C0AB
         ADRL  L02C0D6
         ADRL  L02C100
         ADRL  L02C12A
         ADRL  L02C154
         ADRL  L02C183
         ADRL  L02C1BC
         ADRL  L02C1E8
         ADRL  L02C208
         ADRL  L02C228
         ADRL  L02C248
         ADRL  L02C268
         ADRL  L02C288
         ADRL  L02C2A8
         ADRL  L02C2C8
         ADRL  L02C2ED
         ADRL  L02C311
         ADRL  L02C338
         ADRL  L02C367
         ADRL  L02C396
         ADRL  $00000000
L02C058  DW    $0008      ; pCount
         ADRL  $00002000  ; ID
         DW    $001D      ; rect
         DW    $001E
         DW    $0026
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C078    ; titleRef
         DW    $0000      ; initialValue
L02C078  STR   'Keypad'
L02C07F  DW    $0008      ; pCount
         ADRL  $00001000  ; ID
         DW    $0027      ; rect
         DW    $001E
         DW    $0030
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C09F    ; titleRef
         DW    $0000      ; initialValue
L02C09F  STR   'Control key'
L02C0AB  DW    $0008      ; pCount
         ADRL  $00000800  ; ID
         DW    $0031      ; rect
         DW    $001E
         DW    $003A
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C0CB    ; titleRef
         DW    $0000      ; initialValue
L02C0CB  STR   'Option key'
L02C0D6  DW    $0008      ; pCount
         ADRL  $00000400  ; ID
         DW    $003B      ; rect
         DW    $001E
         DW    $0044
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C0F6    ; titleRef
         DW    $0000      ; initialValue
L02C0F6  STR   'Caps lock'
L02C100  DW    $0008      ; pCount
         ADRL  $00000200  ; ID
         DW    $0045      ; rect
         DW    $001E
         DW    $004E
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C120    ; titleRef
         DW    $0000      ; initialValue
L02C120  STR   'Shift key'
L02C12A  DW    $0008      ; pCount
         ADRL  $00000100  ; ID
         DW    $004F      ; rect
         DW    $001E
         DW    $0058
         DW    $008C
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C14A    ; titleRef
         DW    $0000      ; initialValue
L02C14A  STR   'Apple key'
L02C154  DW    $0009      ; pCount
         ADRL  $00007007  ; ID
         DW    $0013      ; rect
         DW    $0014
         DW    $001C
         DW    $0071
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C176    ; textRef
         DW    $000D      ; textSize
         DW    $0000
L02C176  ASC   'Must press...'
L02C183  DW    $0009      ; pCount
         ADRL  $00007008  ; ID
         DW    $0008      ; rect
         DW    $0050
         DW    $0011
         DW    $0103
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C1A5    ; textRef
         DW    $0017      ; textSize
         DW    $0000
L02C1A5  ASC   'Control key equivalents'
L02C1BC  DW    $0009      ; pCount
         ADRL  $00007009  ; ID
         DW    $0013      ; rect
         DW    $00A0
         DW    $001C
         DW    $00EB
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C1DE    ; textRef
         DW    $000A      ; textSize
         DW    $0000
L02C1DE  ASC   'But not...'
L02C1E8  DW    $0008      ; pCount
         ADRL  $20000000  ; ID
         DW    $001D      ; rect
         DW    $00AA
         DW    $0026
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C078    ; titleRef
         DW    $0000      ; initialValue
L02C208  DW    $0008      ; pCount
         ADRL  $10000000  ; ID
         DW    $0027      ; rect
         DW    $00AA
         DW    $0030
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C09F    ; titleRef
         DW    $0000      ; initialValue
L02C228  DW    $0008      ; pCount
         ADRL  $08000000  ; ID
         DW    $0031      ; rect
         DW    $00AA
         DW    $003A
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C0CB    ; titleRef
         DW    $0000      ; initialValue
L02C248  DW    $0008      ; pCount
         ADRL  $04000000  ; ID
         DW    $003B      ; rect
         DW    $00AA
         DW    $0044
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C0F6    ; titleRef
         DW    $0000      ; initialValue
L02C268  DW    $0008      ; pCount
         ADRL  $02000000  ; ID
         DW    $0045      ; rect
         DW    $00AA
         DW    $004E
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C120    ; titleRef
         DW    $0000      ; initialValue
L02C288  DW    $0008      ; pCount
         ADRL  $01000000  ; ID
         DW    $004F      ; rect
         DW    $00AA
         DW    $0058
         DW    $0118
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C14A    ; titleRef
         DW    $0000      ; initialValue
L02C2A8  DW    $0008      ; pCount
         ADRL  $00007010  ; ID
         DW    $005E      ; rect
         DW    $0036
         DW    $006B
         DW    $0052
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0002      ; maxSize
         ADRL  L02BEAD    ; defaultRef
L02C2C8  DW    $0009      ; pCount
         ADRL  $00007011  ; ID
         DW    $0060      ; rect
         DW    $0014
         DW    $006A
         DW    $0031
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C2EA    ; textRef
         DW    $0003      ; textSize
         DW    $0000
L02C2EA  ASC   'Key'
L02C2ED  DW    $0008      ; pCount
         ADRL  $00007012  ; ID
         DW    $0060      ; rect
         DW    $005A
         DW    $0069
         DW    $008C
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C30D    ; titleRef
         DW    $0000      ; initialValue
L02C30D  STR   'Esc'
L02C311  DW    $0008      ; pCount
         ADRL  $00007013  ; ID
         DW    $0060      ; rect
         DW    $0090
         DW    $0069
         DW    $00DA
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C331    ; titleRef
         DW    $0000      ; initialValue
L02C331  STR   'Return'
L02C338  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0071      ; rect
         DW    $00B4
         DW    $007E
         DW    $010E
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C360    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02C360  STR   'Change'
L02C367  DW    $0009      ; pCount
         ADRL  $00000002  ; ID
         DW    $0071      ; rect
         DW    $0032
         DW    $007E
         DW    $008C
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C38F    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L02C38F  STR   'Cancel'
L02C396  DW    $0008      ; pCount
         ADRL  $00007016  ; ID
         DW    $0060      ; rect
         DW    $00DE
         DW    $0069
         DW    $012A
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02C3B6    ; titleRef
         DW    $0000      ; initialValue
L02C3B6  STR   'Delete'
L02C3BD  DW    $0050
         DW    $2020      ; frame bits
         ADRL  $00000000  ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  $00000000  ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0026      ; content rect
         DW    $009C
         DW    $00AE
         DW    $01E2
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L02BFFC    ; storage ptr
         DW    $0003
L02C40D  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   L026C65
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         _SetCurResourceFile
         PLB
         PLD
         RTL

L02C444  ENT
         LDA   $01,S
         PHA
         LDA   $05,S
         STA   $03,S
         PHD
         TSC
         TCD
         LDA   $0A
         PHA
         LDA   $08
         PHA
         LDA   #$0014
         STA   $06
         LDX   #$0000
         JSR   L02C542
         STA   $08
         STX   $0A
         BCS   L02C498
         PHX
         PHA
         LDA   $06
         PHA
         PEA   $0001
         _Long2Dec
         BCC   L02C47A
         STZ   $06
         BRA   L02C496
L02C47A  LDY   #$0000
         SEP   #$20
L02C47F  LDA   #$20
         CMP   [$08],Y
         BNE   L02C48A
         INY
         DEC   $06
         BNE   L02C47F
L02C48A  REP   #$20
         TYA
         CLC
         ADC   $08
         STA   $08
         BCC   L02C496
         INC   $0A
L02C496  PLD
         RTL

L02C498  PEA   $0005
         JSL   L02C9F6
         STZ   $06
         PLA
         BRA   L02C496
L02C4A4  TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         PEA   $0000
         LDA   $07
         PHA
         LDA   $05
         PHA
         LDA   $03
         PHA
         JSR   L02C995
         PEA   $0001
         _Dec2Int
         PLX
         LDA   $01
         STA   $07
         LDA   $00
         STA   $06
         CLC
         TDC
         ADC   #$0005
         PLD
         TCS
         TXA
         RTL

L02C4DA  ENT
         LDA   $02
         PHA
         LDA   $00
         PHA
         PHB
         PHK
         PLB
         LDA   L02C95F
         STA   $02
         LDA   L02C95D
         STA   $00
L02C4ED  LDA   $00
         ORA   $02
         BEQ   L02C50B
         LDA   $02
         PHA
         LDA   $00
         PHA
         LDY   #$0002
         LDA   [$00]
         TAX
         LDA   [$00],Y
         STA   $02
         STX   $00
         JSL   L02CC6E
         BRA   L02C4ED
L02C50B  STZ   L02C95D
         STZ   L02C95F
         PLB
         PLA
         STA   $00
         PLA
         STA   $02
         RTL

L02C519  LDY   #$0000
         STA   $00
         STX   $02
         TXA
         EOR   $06,S
         BPL   L02C52B
         LDA   $02
         CMP   $06,S
         BRA   L02C535
L02C52B  LDA   $06,S
         CMP   $02
         BNE   L02C535
         LDA   $04,S
         CMP   $00
L02C535  BCC   L02C538
         INY
L02C538  LDA   $02,S
         STA   $06,S
         PLA
         STA   $03,S
         PLA
         TYA
         RTL

L02C542  PHB
         PHK
         PLB
         CLC
         ADC   #$0004
         BCC   L02C54C
         INX
L02C54C  PHX
         PHA
         JSL   L02C6A8
         STA   L02C5A7
         STX   L02C5A9
         ORA   L02C5A9
         BEQ   L02C5A4
         LDA   $02
         PHA
         LDA   $00
         PHA
         LDA   L02C5A9
         STA   $02
         LDA   L02C5A7
         STA   $00
         LDA   L02C95D
         STA   [$00]
         LDY   #$0002
         LDA   L02C95F
         STA   [$00],Y
         LDA   L02C5A9
         STA   L02C95F
         LDA   L02C5A7
         STA   L02C95D
         CLC
         LDA   L02C5A7
         ADC   #$0004
         STA   L02C5A7
         BCC   L02C595
         INC   L02C5A9
L02C595  PLA
         STA   $00
         PLA
         STA   $02
         LDA   L02C5A7
         LDX   L02C5A9
         PLB
         CLC
         RTS

L02C5A4  PLB
         SEC
         RTS

L02C5A7  DW    $0000
L02C5A9  DW    $0000
L02C5AB  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         LDA   $03
         LSR
         BCC   L02C5D1
         SEP   #$20
         LDA   [$05]
         STA   [$09]
         REP   #$20
         INC   $05
         BNE   L02C5C9
         INC   $07
L02C5C9  INC   $09
         BNE   L02C5CF
         INC   $0B
L02C5CF  DEC   $03
L02C5D1  LDY   $03
         BEQ   L02C5E5
         DEY
         DEY
         BEQ   L02C5E1
L02C5D9  LDA   [$05],Y
         STA   [$09],Y
         DEY
         DEY
         BNE   L02C5D9
L02C5E1  LDA   [$05]
         STA   [$09]
L02C5E5  LDA   $01
         STA   $0B
         LDA   $00
         STA   $0A
         CLC
         TDC
         ADC   #$0009
         PLD
         TCS
         RTL

L02C5F5  ENT
         TDC
         TAX
         TSC
         SEC
         SBC   #$0005
         TCD
         DEC
         TCS
         PHX
         LDA   $09
         CMP   $0F
         BNE   L02C622
         LDA   $13
         PHA
         LDA   $11
         PHA
         LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         BPL   L02C61B
         EOR   #$FFFF
         INC
         INC
L02C61B  PHA
         JSL   L02C5AB
         BRA   L02C698
L02C622  LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         PHA
         JSR   L02C995
         PLA
         STA   $09
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   $13
         STA   $04
         LDA   $11
         STA   $02
         LDA   $0F
         BPL   L02C64D
         EOR   #$FFFF
         INC
         INC   $11
         BNE   L02C64D
         INC   $13
L02C64D  CMP   $09
         BCC   L02C653
         LDA   $09
L02C653  TAY
         STA   $00
         BEQ   L02C67C
         LSR
         BCC   L02C672
         SEP   #$20
         LDA   [$0B]
         STA   [$11]
         REP   #$20
         INC   $0B
         BNE   L02C669
         INC   $0D
L02C669  INC   $11
         BNE   L02C66F
         INC   $13
L02C66F  DEY
         BEQ   L02C67C
L02C672  DEY
         DEY
L02C674  LDA   [$0B],Y
         STA   [$11],Y
         DEY
         DEY
         BPL   L02C674
L02C67C  LDY   $0F
         BPL   L02C68A
         SEP   #$20
         LDA   $00
         STA   [$02]
         REP   #$20
         BRA   L02C698
L02C68A  LDY   $00
         CPY   $0F
         BCS   L02C698
         SEP   #$20
         LDA   #$00
         STA   [$02],Y
         REP   #$20
L02C698  LDA   $07
         STA   $13
         LDA   $06
         STA   $12
         CLC
         TDC
         ADC   #$0011
         PLD
         TCS
         RTL

L02C6A8  LDA   $06,S
         TAX
         LDA   $04,S
         CPX   #$0000
         BNE   L02C6C2
         CMP   #$0FFC
         BCS   L02C6C2
         CMP   #$0000
         BEQ   L02C6C6
         JSL   L02C6D3
         BRA   L02C6C6
L02C6C2  JSL   L02C7E4
L02C6C6  TAY
         LDA   $00,S
         STA   $04,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TYA
         RTL

L02C6D3  PHA
         CLC
         ADC   #$0004
         PHA
         TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         LDA   #$0008
L02C6E4  CMP   $0B
         BCS   L02C6EB
         ASL
         BRA   L02C6E4
L02C6EB  STA   $0D
         JSL   L02CDFD
         STX   $09
         STX   $0B
L02C6F5  LDX   $0B
         LDAL  L02CC46,X
         ORAL  L02CC48,X
         BNE   L02C750
         CPX   #$0024
         BCC   L02C744
         LDA   #$1000
         LDX   #$0000
         JSL   L02C7E4
         STA   $01
         STAL  L02CC6A
         STX   $03
         TXA
         STAL  L02CC6C
         ORA   $01
         BNE   L02C724
         BRL   L02C7CF
L02C724  LDA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   #$1000
         STA   [$01],Y
         INY
         INY
         LDA   #$0000
         STA   [$01],Y
         INY
         INY
         STA   [$01],Y
         LDA   $0B
         CMP   $09
         BEQ   L02C7B0
         BRA   L02C7A5
L02C744  CLC
         LDA   $0B
         ADC   #$0004
         STA   $0B
         ASL   $0D
         BRA   L02C7A5
L02C750  LDX   $0B
         CPX   $09
         BCC   L02C79D
         BEQ   L02C79D
         LDAL  L02CC48,X
         STA   $03
         LDAL  L02CC46,X
         STA   $01
         LDY   $0D
         LDX   $03
         JSL   L02C87F
         LSR   $0D
         CLC
         LDA   $01
         ADC   $0D
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   $0D
         STA   [$05],Y
         STA   [$01],Y
         ORA   [$01]
         STA   [$05]
         LDY   $0D
         LDA   $01
         LDX   $03
         JSL   L02CE0E
         LDY   $0D
         LDA   $05
         LDX   $07
         JSL   L02CE0E
L02C79D  SEC
         LDA   $0B
         SBC   #$0004
         STA   $0B
L02C7A5  LDA   $0B
         BMI   L02C7B0
         CMP   $09
         BCC   L02C7B0
         BRL   L02C6F5
L02C7B0  LDX   $09
         LDAL  L02CC46,X
         STA   $01
         LDAL  L02CC48,X
         STA   $03
         LDY   $0D
         LDX   $03
         LDA   $01
         JSL   L02C87F
         LDA   [$01]
         AND   #$7FFF
         STA   [$01]
L02C7CF  LDA   $01
         LDX   $03
         CLC
         ADC   #$0004
         BCC   L02C7DA
         INX
L02C7DA  TAY
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L02C7E4  CLC
         ADC   #$000E
         BCC   L02C7EB
         INX
L02C7EB  PHA
         PHA
         PHX
         PHA
         LDAL  L02C959
         PHA
         PEA   $C010
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L02C80D
         PLA
         PLA
         LDA   #$0000
         TAX
         RTL

L02C80D  PHA
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$05]
         STA   $01
         LDA   [$05],Y
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDAL  L02CC42
         INY
         INY
         STA   [$01],Y
         LDAL  L02CC44
         INY
         INY
         STA   [$01],Y
         INY
         INY
         LDA   $05
         STA   [$01],Y
         INY
         INY
         LDA   $07
         STA   [$01],Y
         INY
         INY
         LDA   #$0000
         STA   [$01],Y
         LDAL  L02CC42
         STA   $05
         LDAL  L02CC44
         STA   $07
         ORA   $05
         BEQ   L02C862
         LDY   #$0002
         LDA   $01
         STA   [$05]
         LDA   $03
         STA   [$05],Y
L02C862  LDA   $01
         STAL  L02CC42
         LDA   $03
         STAL  L02CC44
         CLC
         LDA   $01
         ADC   #$000E
         LDX   $03
         BCC   L02C879
         INX
L02C879  PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L02C87F  PHX
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L02CDFD
         LDAL  L02CC46,X
         STA   $05
         LDAL  L02CC48,X
         STA   $07
L02C89C  LDA   $05
         CMP   $09
         BNE   L02C8A8
         LDA   $07
         CMP   $0B
         BEQ   L02C8BF
L02C8A8  LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   $05
         INY
         INY
         LDA   [$01],Y
         STA   $07
         BRA   L02C89C
L02C8BF  LDY   #$0004
         LDA   $01
         ORA   $02
         BNE   L02C8D8
         LDA   [$05],Y
         STAL  L02CC46,X
         INY
         INY
         LDA   [$05],Y
         STAL  L02CC48,X
         BRA   L02C8E2
L02C8D8  LDA   [$05],Y
         STA   [$01],Y
         INY
         INY
         LDA   [$05],Y
         STA   [$01],Y
L02C8E2  PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L02C8EA  TSC
         PHD
         TCD
         LDA   $06
         BPL   L02C90F
         CMP   #$FFFF
         BNE   L02C909
         LDX   $04
         CPX   #$FFDE
         BCC   L02C909
L02C8FD  LDA   $0A
         ASL
         ROR   $0A
         ROR   $08
         INX
         BNE   L02C8FD
         BRA   L02C921
L02C909  STZ   $08
         STZ   $0A
         BRA   L02C921
L02C90F  BNE   L02C909
         LDX   $04
         BEQ   L02C921
         CPX   #$0021
         BCS   L02C909
L02C91A  ASL   $08
         ROL   $0A
         DEX
         BNE   L02C91A
L02C921  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L02C939
L02C939  DB    $00
         DB    $00
         ADRL  L02C93F
L02C93F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L02C947
L02C947  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02C957  ENT
         DB    $00
         DB    $00
L02C959  DB    $00
         DB    $00
         DB    $00
         DB    $00
L02C95D  DB    $00
         DB    $00
L02C95F  DB    $00
         DB    $00
L02C961  DB    $00
         DB    $00
L02C963  DB    $00
         DB    $00
L02C965  DB    $00
L02C966  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02C973  PHA
         JSL   L02CE39
         LDAL  L02C959
         PHA
         _DisposeAll
         PLA
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L02C98F
L02C98F  ADRL  L02C993    ;  path name
L02C993  DW    $0000      ;  flags
L02C995  PHD
         TSC
         TCD
         LDA   $05
         BEQ   L02C9E5
         BPL   L02C9D2
         INC
         BNE   L02C9C3
         LDA   $09
         AND   #$00FF
         BNE   L02C9AC
         STZ   $05
         BRA   L02C9E5
L02C9AC  LDA   #$0001
         STA   $05
         LDA   $09
         STAL  L02C9E7
         LDA   #L02C9E7
         STA   $07
         LDA   #^L02C9E7
         STA   $09
         BRA   L02C9E5
L02C9C3  LDA   [$07]
         AND   #$00FF
         STA   $05
         INC   $07
         BNE   L02C9D0
         INC   $09
L02C9D0  BRA   L02C9E5
L02C9D2  LDX   $05
         LDY   #$0000
         SEP   #$20
L02C9D9  LDA   [$07],Y
         BEQ   L02C9E1
         INY
         DEX
         BNE   L02C9D9
L02C9E1  STY   $05
         REP   #$20
L02C9E5  PLD
         RTS

L02C9E7  DW    $0000

L02C9E9  PEA   $0008
         JSL   L02C9F6
         LDA   #$FFFF
         JMP   L02C973

L02C9F6  LDA   $04,S
         PHA
         JSL   L02CB19
         JMPL  L02CA01

L02CA01  PHK
         PLB
         LDA   L02C965
         BNE   L02CA0B
         BRL   L02CB13
L02CA0B  BRA   L02CA25
L02CA0D  STR   'Error occurred at line '
L02CA25  PEA   ^L02CA0D
         PEA   L02CA0D
         _ErrWriteString
         LDA   L02C965
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         JSL   L02CE7F
         BRA   L02CA54
L02CA45  STR   ' in procedure '
L02CA54  PEA   ^L02CA45
         PEA   L02CA45
         _ErrWriteString
         PEA   ^L02C966
         PEA   L02C966
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L02CEAF
         JSL   L02CE4E
         LDA   L02C961
         ORA   L02C963
         BNE   L02CA83
         BRL   L02CB13
L02CA83  PEA   $000D
         _ErrWriteChar
         PEA   $000A
         _ErrWriteChar
         BRA   L02CAA6
L02CA99  STR   '  Line  Name'
L02CAA6  PEA   ^L02CA99
         PEA   L02CA99
         _ErrWriteLine
         BRA   L02CAC2
L02CAB5  STR   '  ----  ----'
L02CAC2  PEA   ^L02CAB5
         PEA   L02CAB5
         _ErrWriteLine
L02CACF  LDA   L02C961
         ORA   L02C963
         BEQ   L02CB13
         LDA   L02C965
         PHA
         PEA   $0006
         PEA   $0000
         PEA   $0001
         JSL   L02CE7F
         BRA   L02CAED
L02CAEA  STR   '  '
L02CAED  PEA   ^L02CAEA
         PEA   L02CAEA
         _ErrWriteString
         PEA   ^L02C966
         PEA   L02C966
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L02CEAF
         JSL   L02CE4E
         BRA   L02CACF
L02CB13  LDA   #$FFFF
         BRL   L02C973
L02CB19  PHD
         PEA   ^L02CB43
         PEA   L02CB43
         TSC
         TCD
         LDX   $0A
L02CB24  DEX
         BEQ   L02CB33
         SEC
         LDA   [$01]
         AND   #$00FF
         ADC   $01
         STA   $01
         BRA   L02CB24
L02CB33  _ErrWriteLine
         PLD
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         RTL

L02CB43  STR   'Subrange exceeded'
         STR   'File is not open'
         STR   'Read while at end of file'
         STR   'I/O error'
         STR   'Out of memory'
         STR   'EOLN while at end of file'
         STR   'Set overflow'
         STR   'Jump to undefined case statement label'
         STR   'Integer math error'
         STR   'Real math error'
         STR   'Underflow'
         STR   'Overflow'
         STR   'Divide by zero'
         STR   'Inexact'
         STR   'Stack overflow'
L02CC42  DB    $00
         DB    $00
L02CC44  DB    $00
         DB    $00
L02CC46  DB    $00
         DB    $00
L02CC48  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CC6A  DB    $00
         DB    $00
L02CC6C  DB    $00
         DB    $00
L02CC6E  TSC
         PHD
         TCD
         LDY   $04
         LDX   $06
         SEC
         TYA
         SBC   #$0002
         STA   $04
         BCS   L02CC80
         DEC   $06
L02CC80  LDA   [$04]
         BNE   L02CC8B
         TYA
         JSL   L02CD89
         BRA   L02CC90
L02CC8B  TYA
         JSL   L02CC9C
L02CC90  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L02CC9C  PHA
         PHA
         PHA
         SEC
         SBC   #$0004
         BCS   L02CCA6
         DEX
L02CCA6  PHX
         PHA
         TSC
         PHD
         TCD
         LDA   [$01]
         BPL   L02CCB2
         BRL   L02CD81
L02CCB2  LDA   [$01]
         ORA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         TAY
         LDA   $01
         LDX   $03
         JSL   L02CE0E
L02CCC9  LDA   $09
         CMP   #$1000
         BCC   L02CCD3
         BRL   L02CD6F
L02CCD3  LDA   [$01]
         AND   $09
         BEQ   L02CD2A
         SEC
         LDA   $01
         SBC   $09
         STA   $05
         LDA   $03
         SBC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BEQ   L02CCF3
         BRL   L02CD81
L02CCF3  LDA   [$05]
         BMI   L02CCFA
         BRL   L02CD81
L02CCFA  LDY   $09
         LDX   $03
         LDA   $01
         JSL   L02C87F
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L02C87F
         LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         ASL   $09
         LDA   $09
         LDY   #$0002
         STA   [$01],Y
         TAY
         LDA   $01
         LDX   $03
         JSL   L02CE0E
         BRA   L02CCC9
L02CD2A  CLC
         LDA   $01
         ADC   $09
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BNE   L02CD81
         LDA   [$05]
         BPL   L02CD81
         LDY   $09
         LDX   $03
         LDA   $01
         JSL   L02C87F
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L02C87F
         ASL   $09
         LDY   #$0002
         LDA   $09
         STA   [$01],Y
         LDY   $09
         LDA   $01
         LDX   $03
         JSL   L02CE0E
         BRL   L02CCC9
L02CD6F  LDY   $09
         LDA   $01
         LDX   $03
         JSL   L02C87F
         LDA   $01
         LDX   $03
         JSL   L02CD89
L02CD81  PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L02CD89  PHA
         PHA
         SEC
         SBC   #$000E
         BCS   L02CD92
         DEX
L02CD92  PHX
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$01],Y
         ORA   [$01]
         BNE   L02CDB3
         LDY   #$0004
         LDA   [$01],Y
         STAL  L02CC42
         INY
         INY
         LDA   [$01],Y
         STAL  L02CC44
         BRA   L02CDC8
L02CDB3  LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         LDY   #$0004
         LDA   [$01],Y
         STA   [$05],Y
         INY
         INY
         LDA   [$01],Y
         STA   [$05],Y
L02CDC8  LDY   #$0004
         LDA   [$01],Y
         TAX
         INY
         INY
         ORA   [$01],Y
         BEQ   L02CDE5
         LDA   [$01],Y
         STA   $07
         STX   $05
         LDY   #$0002
         LDA   [$01]
         STA   [$05]
         LDA   [$01],Y
         STA   [$05],Y
L02CDE5  LDY   #$000A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         _DisposeHandle
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L02CDFD  LDX   #$0000
         DEC
         LSR
         LSR
         LSR
         BEQ   L02CE0D
L02CE06  INX
         INX
         INX
         INX
         LSR
         BNE   L02CE06
L02CE0D  RTL

L02CE0E  PHX
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L02CDFD
         LDY   #$0004
         LDAL  L02CC46,X
         STA   [$01],Y
         INY
         INY
         LDAL  L02CC48,X
         STA   [$01],Y
         LDA   $01
         STAL  L02CC46,X
         LDA   $03
         STAL  L02CC48,X
         PLD
         PLA
         PLA
         RTL

L02CE39  PHB
         PHK
         PLB
         STZ   L02CC42
         STZ   L02CC44
         LDX   #$0026
L02CE45  STZ   L02CC46,X
         DEX
         DEX
         BPL   L02CE45
         PLB
         RTL

L02CE4E  PHB
         PHK
         PLB
         LDA   L02C963
         STA   $02
         LDA   L02C961
         STA   $00
         LDY   #$0010
L02CE5E  LDA   [$00],Y
         STA   L02C961,Y
         DEY
         DEY
         BPL   L02CE5E
         LDA   $02
         PHA
         LDA   $00
         PHA
         JSL   L02CC6E
         PLB
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CE7F  TSC
         PHD
         TCD
         PEA   ^L02CF0B
         PEA   L02CF0B
         LDA   $0A
         JSL   L02CEF4
         PEA   ^L02CF0B
         PEA   L02CF0B
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L02CEAF
         LDA   $02
         STA   $0A
         LDA   $00
         STA   $08
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L02CEAF  TSC
         PHD
         TCD
         INC   $0A
         BNE   L02CEB8
         INC   $0C
L02CEB8  LDA   [$0A]
         AND   #$00FF
         SEC
         SBC   $08
         BPL   L02CECC
         EOR   #$FFFF
         INC
         LDY   $04
         JSL   L02CFAA
L02CECC  LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   $06
         EOR   #$0001
         ASL
         ORA   $04
         XBA
         CLC
         ADC   #$1A0C
         TAX
         JSL   $E10000
         LDA   $02
         STA   $0C
         LDA   $00
         STA   $0A
         PLD
         CLC
         TSC
         ADC   #$000A
         TCS
         RTL

L02CEF4  PHA
         PEA   ^L02CF35
         PEA   L02CF35
         PEA   $0028
         PEA   $0001
         _Int2Dec
         JMP   L02CF5D

L02CF0B  DB    $28
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CF35  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CF5D  PHD
         TSC
         TCD
         SEP   #$20
         LDX   #$0000
         LDA   #$20
L02CF67  CMPL  L02CF35,X
         BNE   L02CF70
         INX
         BRA   L02CF67
L02CF70  REP   #$20
         TXA
         SEC
         SBC   #$0028
         EOR   #$FFFF
         INC
         SEP   #$20
         CMP   [$06]
         BEQ   L02CF83
         BCS   L02CF9A
L02CF83  LDY   #$0001
         STA   [$06],Y
L02CF88  LDAL  L02CF35,X
         INY
         STA   [$06],Y
         INX
         CPX   #$0028
         BCC   L02CF88
         REP   #$20
         CLV
         BRA   L02CF9E
L02CF9A  REP   #$20
         SEP   #$40
L02CF9E  LDA   $02,S
         STA   $06,S
         LDA   $04,S
         STA   $08,S
         PLD
         PLA
         PLA
         RTL

L02CFAA  PHA
         TYA
         XBA
         CLC
         ADC   #$180C
         PHA
         PHD
         TSC
         TCD
L02CFB5  PEA   $0020
         LDX   $03
         JSL   $E10000
         DEC   $05
         BNE   L02CFB5
         PLD
         PLA
         PLA
         RTL

