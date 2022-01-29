*
* Genesys v1.2.4 -> V1.3.6
* Main program
*
* (c) 1990-1991, SSSi
* (u) 2020-2022, Brutal Deluxe Software
*

* v1.3.6 - AV 202201
* - main program
*   - allow all ID range
*
* v1.3.5 - AV 202102
* - Editor / Control
*   - Bug in ref icon pointer fixed
*
* v1.3.4 - AV 202010
* - Main program
*   - new resource types added
* - Editor / Control
*   - disassembly & re-assembly
*   - existing controls support 6.0 and 6.0.1 bits
*   - rectangle and thermometer controls support added
* - Editor / Versions
*   - Update Info (yeah)
*
 
         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
	 use   4/Desk.Macs
	 use   4/Dialog.Macs
	 use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
	 use   4/List.Macs
	 use   4/Load.Macs
	 use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
	 use   4/Misc.Macs
         use   4/QD.Macs
         use   4/QDAux.Macs
         use   4/Resource.Macs
	 use   4/SANE.Macs
	 use   4/Scrap.Macs
	 use   4/Std.Macs
         use   4/Text.Macs
	 use   4/TextEdit.Macs
         use   4/Util.Macs
         use   4/Window.Macs

	 use   GEMAIN.X.S
	
*----------------------------

BUTN0 EQU $C061
GSOS EQU $E100A8

*----------------------------
* Commands to editors
*  0002: say goodbye
*  0005: say hello
*----------------------------

         PHB
         PHD
         PHK
         PLB
	 
         _TLStartUp
         PEA   $0000
         _TLVersion
         PLA
         AND   #$7F00
         CMP   #$0300
         BCS   L020025
         JSL   L029C90
         BRL   L0202E2
L020025  PEA   $0000
         _MMStartUp
         PLA
         STA   L024112
         PEA   $0000
         PEA   $0000
         LDA   L024112
         PHA
         PEA   $0002
         PEA   $0000
         PEA   $0001
         _StartUpTools
         BCC   L020088
         CMP   #$0104
         BEQ   L020063
         PLA
         STA   L020353
         PLA
         STA   L020353+2
         JSL   L029C90
         BRL   L0202A4
L020063  PLA
         STA   L020353
         PLA
         STA   L020353+2
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000B
         _AlertWindow
         PLA
         BRL   L0202A4
L020088  JSL   GSOS
         DW    $202A      ; GetVersion
         ADRL  L020361
         LDA   L020363
         CMP   #$0303
         BCC   L020063
         PLA
         STA   L020353
         PLA
         STA   L020353+2
         PEA   $0000
         PEA   $0000
         _GetWMgrPort
         _SetPort
         PEA   ^L020376
         PEA   L020376
         JSL   L020E54
         LDA   L024112
         ORA   #$0100
         STA   L024388
         LDA   L024112
         ORA   #$0200
         STA   L02410E
         JSL   L02212F
         STZ   L0240DC
         PEA   $0000
         _GetCurResourceFile
         LDX   #$0102
         JSL   L027D42
         PLA
         STA   L0240D4
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0001
         PEA   $0000
         PEA   $0000
         _NewMenuBar2
         LDX   #$0104
         JSL   L027D42
         _SetSysBar
         LDX   #$0105
         JSL   L027D42
         PEA   $0000
         PEA   $0000
         _SetMenuBar
         LDX   #$0106
         JSL   L027D42
         PEA   $0001
         _FixAppleMenu
         LDX   #$0107
         JSL   L027D42
         PEA   $0000
         _FixMenuBar
         LDX   #$0108
         JSL   L027D42
         PLA
         _DrawMenuBar
         LDX   #$0109
         JSL   L027D42
         JSL   L027B45
         PEA   ^L021B9C
         PEA   L021B9C
         PEA   $0000
         JSL   L027BA4
         JSR   L020E2A
         JSR   L021340
         JSR   L020E3B
         _InitCursor
         LDA   L021DE4+2
         PHA
         LDA   L021DE4
         PHA
         _CloseWindow
         LDX   #$0110
         JSL   L027D42
         PEA   $0000
         PEA   $0003
         PEA   $0000
         PEA   $0000
         PEA   ^L0245BE
         PEA   L0245BE
         _OpenResourceFile
         BCC   L0201E0
         CMP   #$0050
         BNE   L0201D9
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000D
         _AlertWindow
         PLA
         PLA
         BRL   L0202A4
L0201D9  LDX   #$0120
         JSL   L027D42
L0201E0  PLA
         STA   L024110
         JSL   L0202F5
         PEA   $0000
         _GetScrapCount
         LDX   #$0130
         JSL   L027D42
         PLA
         STA   L0240E8
         STZ   L0240EA
         STZ   L0240EC
         PEA   $0000
         _GetKeyTranslation
         LDX   #$0140
         JSL   L027D42
         PLA
         STA   L020357
         PEA   $0000
         _SetKeyTranslation
         LDX   #$0141
         JSL   L027D42
         LDA   L0240DC
         BNE   L020280
         JSR   L020381
         _WaitCursor
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   ^L021D9E
         PEA   L021D9E
         JSL   L026E07
         STA   L021D21
         STX   L021D23
         _UnloadScrap
         LDX   #$0152
         JSL   L027D42
         LDA   L021D23
         PHA
         LDA   L021D21
         PHA
         _CloseDialog
         LDX   #$0154
         JSL   L027D42
         _SetPort
L020280  LDA   L020357
         PHA
         _SetKeyTranslation
         LDX   #$0160
         JSL   L027D42
         LDA   L024110
         PHA
         _CloseResourceFile
         LDX   #$0170
         JSL   L027D42
L0202A4  PEA   $0001
         LDA   L020353+2
         PHA
         LDA   L020353
         PHA
         _ShutDownTools
         PEA   $0000
         LDX   #$0080
L0202BC  LDA   L0246BF,X
         BEQ   L0202D2
         PHA
         PEA   $0000
         STX   L020351
         _UserShutDown
         LDX   L020351
L0202D2  DEX
         DEX
         BPL   L0202BC
         PLA
         LDA   L024112
         PHA
         _MMShutDown
L0202E2  _TLShutDown
         PLD
         PLB
         JSL   GSOS
         DW    $2029      ; Quit
         ADRL  L020359

L0202F5  PHD
         PHB
         PHK
         PLB
         LDA   L0240D4
         PHA
         _SetCurResourceFile
         LDX   #$01E0
         JSL   L027D42
         PEA   $0000
         PEA   $FFFF
         _SetResourceFileDepth
         LDX   #$01E1
         JSL   L027D42
         PLY
         PLB
         PLD
         RTL

L020323  PHD
         PHB
         PHK
         PLB
         LDA   L024110
         PHA
         _SetCurResourceFile
         LDX   #$01E2
         JSL   L027D42
         PEA   $0000
         PEA   $FFFF
         _SetResourceFileDepth
         LDX   #$01E3
         JSL   L027D42
         PLY
         PLB
         PLD
         RTL

L020351  DW    $0000
L020353  ADRL  $00000000
L020357  DW    $0000
L020359  DW    $0000      ; Parms for Quit
         DW    $0000
         DW    $0000
         DW    $0000
L020361  DW    $0001      ; Parms for GetVersion
L020363  DW    $0000      ;  version number
         DW    $0001
         DW    $0000

L020369  STR   'Shell v1.3.6'
L020376  STR   'v1.3.6'
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L020381  STZ   L024394
         STZ   L02186F
L020387  JSL   L027B65
         JSL   L027699
         JSL   L02115F
         PEA   $001F
         PEA   $7FFF
         LDA   L024100
         BEQ   L020410
         AND   #$0003
         BNE   L020410
         LDA   L024100
         AND   #$8000
         BEQ   L020410
         PEA   $0000
         PEA   $0002
         PEA   ^L0204E9
         PEA   L0204E9
         _EventAvail
         PLA
         BEQ   L020406
         PEA   $0000
         PEA   ^L0204F9
         PEA   L0204F9
         LDA   L0204F5
         PHA
         LDA   L0204F3
         PHA
         _FindWindow
         LDX   #$0202
         JSL   L027D42
         PLA
         CMP   #$001B
         BNE   L020406
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0203
         JSL   L027D42
         PLA
         PLX
         CPX   L0204F9+2
         BNE   L020406
         CMP   L0204F9
         BEQ   L020410
L020406  LDA   #$B70F
         STA   $01,S
         LDA   #$001F
         STA   $03,S
L020410  LDA   L024394
         AND   #$0100
         BEQ   L02041F
         LDA   $03,S
         AND   #$FFFC
         STA   $03,S
L02041F  PLA
         PLX
         STA   L024360
         STX   L024360+2
         PHA
         PEA   $FFFF
         PEA   ^L02434C
         PEA   L02434C
         _TaskMaster
         PLA
         STA   L024396
         ASL
         TAX
         JSR   (L0204A5,X)
         LDA   L0240DC
         BNE   L020449
         BRL   L020387
L020449  RTS

L02044A  PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$02E0
         JSL   L027D42
         PLA
         PLX
         CMP   L021EEC
         BNE   L02046F
         CPX   L021EEC+2
         BNE   L02046F
         JSL   L02B766
         RTS
L02046F  JMP   L0208FA

L020472  LDA   L024100
         BMI   L02047A
         JMP   L0208FA

L02047A  PEA   $0002
         LDA   L024358
         PHA
         LDA   L024356
         PHA
         PEA   $0008
         PEA   $0000
         PEA   $0000
         LDA   L02435C+2
         PHA
         LDA   L02435C
         PHA
         _DragWindow
         LDX   #$02E2
         JSL   L027D42
         RTS

L0204A5  DA    L0207B5
         DA    L0208FA
         DA    L0208FA
         DA    L02044A
         DA    L020449
         DA    L0208FA
         DA    L0208FA
         DA    L020449
         DA    L0204FD
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L0208FA
         DA    L02090E
         DA    L0208FA
         DA    L0208FA
         DA    L020472
         DA    L0208FA
         DA    L02083D
         DA    L0208FA
         DA    L0208FA
         DA    L02090E
         DA    L020449
         DA    L0208FA
         DA    L020449
         DA    L020449
         DA    L020449
         DA    L0208FA
         DA    L0208FA
         DA    L0209EE
L0204E9  DW    $0000      ; event code
         ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
L0204F3  DW    $0000      ; mouse location
L0204F5  DW    $0000
         DW    $0000      ; modifiers
L0204F9  ADRL  $00000000
L0204FD  LDA   L02435C+2
         PHA
         LDA   L02435C
         PHA
         JSL   L02897A
         CMP   #$FFFF
         BEQ   L02054C
         CMP   #$5752
         BNE   L020516
         BRL   L020610
L020516  CMP   #$5751
         BNE   L020561
         LDX   #$000E
         LDA   L02435A
         AND   #$0001
         BEQ   L02054E
         PEA   $0000
         _GetKeyTranslation
         LDX   #$0302
         JSL   L027D42
         PLA
         STA   L0207B3
         PEA   $00FF
         _SetKeyTranslation
         LDX   #$0303
         JSL   L027D42
L02054C  BRA   L0205AA
L02054E  LDA   L0207B3
         PHA
         _SetKeyTranslation
         LDX   #$0304
         JSL   L027D42
         RTS

L020561  TAX
         AND   #$FF00
         CMP   #$5700
         BEQ   L0205AA
         TXA
         PHA
         STA   L0207B1
         JSR   L020DB0
         CPX   #$FFFF
         BEQ   L0205CC
         PLA
         AND   #$0008
         BEQ   L020580
         LDX   #$0080
L020580  LDA   L02435A
         AND   #$0001
         BEQ   L02058B
         BRL   L020634
L02058B  LDA   #$0002
         STA   L02438A
         JSR   L020CBB
         LDA   L02435C
         CMP   L0240F8
         BNE   L0205AA
         LDX   L02435C+2
         CPX   L0240FA
         BNE   L0205AA
         STZ   L0240F8
         STZ   L0240FA
L0205AA  LDX   #$0000
L0205AD  LDA   L02186F,X
         BEQ   L0205C7
         PHX
         PHA
         _DeleteMItem
         LDX   #$0310
         JSL   L027D42
         PLX
         INX
         INX
         BRA   L0205AD
L0205C7  LDA   L02186F
         BNE   L0205CD
L0205CC  RTS

L0205CD  STZ   L02186F
         PEA   $0000
         PEA   $0000
         PEA   $0006
         _CalcMenuSize
         LDX   #$0312
         JSL   L027D42
         PEA   $0080
         PEA   $0006
         _SetMenuFlag
         LDX   #$0313
         JSL   L027D42
         PEA   $0000
         PEA   $0006
         _HiliteMenu
         LDX   #$0314
         JSL   L027D42
         RTS

L020610  STZ   L024100
         PEA   ^L021BB0
         PEA   L021BB0
         PEA   $0001
         JSL   L027BA4
         JSL   L027BE8
         PEA   ^L021BD2
         PEA   L021BD2
         PEA   $0001
         JSL   L027BA4
         BRL   L0205AA
L020634  PHX
         PHX
         JSR   L0205AA
         PLX
         TXA
         ASL
         TAX
         LDA   L024E30,X
         ORA   L024E2E,X
         BNE   L020648
         BRL   L0206F3
L020648  PHD
         PHA
         PHA
         CLC
         LDA   L024E2E,X
         ADC   #$000A
         PHA
         PHA
         LDA   L024E30,X
         ADC   #$0000
         STA   $03,S
         TSC
         TCD
         LDX   #$0000
L020661  LDY   #$0002
         LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         ORA   $05
         BEQ   L0206AA
         LDA   [$05],Y
         STA   L02186F,X
         INX
         INX
         STZ   L02186F,X
         PHX
         PEA   $0000
         LDA   $07
         PHA
         LDA   $05
         PHA
         PEA   $FFFF
         PEA   $0006
         _InsertMItem2
         LDX   #$0320
         JSL   L027D42
         CLC
         LDA   $01
         ADC   #$0004
         STA   $01
         LDA   $03
         ADC   #$0000
         STA   $03
         PLX
         BRA   L020661
L0206AA  PLA
         PLA
         PLA
         PLA
         PLD
         LDA   L02186F
         BEQ   L0206F3
         PEA   $0000
         PEA   $0000
L0206BA  PEA   $0006
         _CalcMenuSize
         LDX   #$0330
         JSL   L027D42
         PEA   $FF7F
         PEA   $0006
         _SetMenuFlag
         LDX   #$0331
         JSL   L027D42
         PEA   $0000
         PEA   $0006
         _HiliteMenu
         LDX   #$0332
         JSL   L027D42
L0206F3  PEA   $0000
         LDA   L024384+2
         PHA
         LDA   L024384
         PHA
         LDA   L024382
         PHA
         JSL   L025A27
         PHX
         PHA
         JSL   L02C395
         STA   L02437E
         STX   L02437E+2
         LDY   #$0002
         LDA   L024100
         TAX
         AND   #$0002
         BEQ   L02073A
         LDY   #$0006
         TXA
         EOR   #$0002
         STA   L024100
         LDA   L0240F6
         STA   L02439C
         LDA   L024114
         STA   L02439E
         LDA   L024114+2
         STA   L02439E+2
L02073A  LDA   L0207B1
         AND   #$FFF7
         CMP   #$0001
         BEQ   L020772
         PHY
         PEA   ^L021BB0
         PEA   L021BB0
         PEA   $FFFF
         JSL   L027BA4
         JSL   L027BE8
         PEA   ^L021BD2
         PEA   L021BD2
         PEA   $FFFF
         JSL   L027BA4
         PLY
         LDA   L024100
L020768  BPL   L0207A9
         EOR   #$8000
         STA   L024100
         BRA   L0207A9
L020772  PHY
         PEA   ^L021BB0
         PEA   L021BB0
         PEA   $0000
         JSL   L027BA4
         PEA   ^L021BD2
         PEA   L021BD2
         PEA   $0000
         JSL   L027BA4
         PLY
         LDA   L024100
         ORA   #$8000
         STA   L024100
         LDA   L024382
         STA   L0240F6
         LDA   L024384
         STA   L024114
         LDA   L024384+2
         STA   L024114+2
L0207A9  PLX
         STY   L02438A
         JSR   L020CBB
         RTS

L0207B1  DW    $0000
L0207B3  DW    $0000

L0207B5  LDA   L024100
         AND   #$0001
         BNE   L0207FE
         LDA   L024394
         AND   #$0200
         BNE   L020834
         LDA   #$0005
         STA   L02438A
         JSR   L020C59
         PEA   $0111
         LDA   L024100
         BMI   L0207DB
         LDA   L024394
         BMI   L0207EA
L0207DB  _DisableMItem
         LDX   #$0401
         JSL   L027D42
         RTS

L0207EA  AND   #$0080
         BNE   L0207DB
         _EnableMItem
         LDX   #$0402
         JSL   L027D42
         RTS

L0207FE  LDA   #$0000
         STA   L02438A
         LDA   L0240D8
         STA   L024382
         LDA   L0240EE
         STA   L024384
         LDA   L0240F0
         STA   L024384+2
         LDA   L024394
         ORA   #$0400
         STA   L024394
         LDA   L024100
         EOR   #$0001
         STA   L024100
L020828  JSR   L020DB0
         CPX   #$FFFF
         BEQ   L020833
         JSR   L020CBB
L020833  RTS

L020834  LDA   L024394
         EOR   #$0200
         STA   L024394
L02083D  PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0410
         JSL   L027D42
         JSL   L02897A
         CMP   #$FFFF
         BNE   L02085E
         LDA   #$0000
         RTS

L02085E  CMP   #$5752
         BNE   L02086B
         JSL   L026B63
         LDA   #$0000
         RTS

L02086B  CMP   #$5754
         BNE   L020875
         JSL   L042C42
         RTS

L020875  CMP   #$5751
         BNE   L02087F
         JSL   L02B718
         RTS

L02087F  CMP   #$5753
         BNE   L020889
         JSL   L0211D2
         RTS

L020889  PHA
         AND   #$FF00
         CMP   #$5700
         BNE   L0208B6
         PLA
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0420
         JSL   L027D42
         _CloseWindow
L0208AE  LDX   #$0422
         JSL   L027D42
         RTS

L0208B6  PLA
         CMP   #$0001
         BNE   L0208CA
         LDA   L024100
         BPL   L0208C4
         EOR   #$8000
L0208C4  ORA   #$0002
         STA   L024100
L0208CA  PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0430
         JSL   L027D42
         PLA
         STA   L02435C
         PLA
         STA   L02435C+2
         LDX   #$0016
         STX   L024396
         LDX   #$0002
         STX   L02438A
         JSR   L020C59
         JSL   L027C06
         RTS

L0208FA  LDX   #$0002
         STX   L02438A
         JSR   L020C59
         RTS

L020904  PHD
         PHB
         PHK
         PLB
         JSR   L02083D
         PLB
         PLD
         RTL

L02090E  _InitCursor
         PEA   $0000
         LDA   L02435C+2
         PHA
         LDA   L02435C
         CMP   #$0800
         BCC   L020948
         LDA   #$0002
         STA   L02438A
         JSR   L020DB0
         CPX   #$FFFF
         BEQ   L020935
         JSR   L020CBB
L020935  JSL   L030000
         _HiliteMenu
         LDX   #$0510
         JSL   L027D42
         RTS

L020948  SEC
         SBC   #$00FA
         ASL
         ASL
         TAX
         PHK
         PEA   L020935-1
         SEP   #$20
         LDA   L020966+2,X
         PHA
         REP   #$20
         LDA   L020966,X
         PHA
         RTL

         DW    $0000
         LDA   #$0000
         RTL

L020966  ADRL  L02107F-1
         ADRL  L02107F-1
         ADRL  L02107F-1
         ADRL  L02107F-1
         ADRL  L02107F-1
         ADRL  L020904-1
         ADRL  L021046-1
         ADRL  L026C9F-1
         ADRL  L02B44F-1
         ADRL  L026232-1
         ADRL  L0262B5-1
         ADRL  L02638C-1
         ADRL  L02639B-1
         ADRL  L02725A-1
         ADRL  L02108F-1
         ADRL  L0275D8-1
         ADRL  L027570-1
         ADRL  L02725A-1
         ADRL  L0277E3-1
         ADRL  L0277ED-1
         ADRL  L02624E-1
         ADRL  $00000000
         ADRL  $00000000
         ADRL  L0264DB-1
         ADRL  $00000000
         ADRL  L027358-1
         ADRL  L0279D0-1
         ADRL  L027988-1
         ADRL  $00000000
         ADRL  L026AEC-1
         ADRL  L027A3C-1
         ADRL  L027A3C-1
         ADRL  L027A3C-1
         ADRL  L027A04-1

L0209EE  PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0602
         JSL   L027D42
         PLA
         PLX
         CMP   L021EEC
         BNE   L020A13
         CPX   L021EEC+2
         BNE   L020A13
         JSL   L02B7F2
         RTS

L020A13  CMP   L0240F2
         BNE   L020A1D
         CPX   L0240F4
         BEQ   L020A20
L020A1D  BRL   L020A83
L020A20  LDA   L02436E
         CMP   #$0005
         BEQ   L020A4A
         CMP   #$0006
         BEQ   L020A4A
         CMP   #$0007
         BEQ   L020A4A
         CMP   #$0008
         BEQ   L020A4A
         CMP   #$0081
         BEQ   L020A4A
         LDA   L024372
         CMP   #$0001
         BNE   L020A4B
         JSR   L020A92
         JSR   L020B77
L020A4A  RTS

L020A4B  CMP   #$0002
         BNE   L020A5A
         JSR   L020A92
         STA   L021C2C
         JSR   L020AAD
         RTS

L020A5A  CMP   #$0003
         BNE   L020A67
         PEA   $0000
         JSL   L023C33
         RTS

L020A67  CMP   #$0004
         BNE   L020A91
         PEA   $0001
         JSL   L023C33
         LDA   L024368
         CMP   #$0002
         BEQ   L020A7C
         RTS

L020A7C  LDA   L021C2C
         JSR   L020AAD
         RTS

L020A83  LDA   #$0002
         STA   L02438A
         LDA   L024382
         BEQ   L020A91
         JSR   L020C59
L020A91  RTS

L020A92  PEA   $0000
         LDA   L02436A+2
         PHA
         LDA   L02436A
         PHA
         _GetCtlValue
         LDX   #$0630
         JSL   L027D42
         PLA
         RTS

L020AAD  CMP   #$0191
         BNE   L020AB6
         JSR   L020BD7
         RTS

L020AB6  CMP   #$0193
         BNE   L020AD4
         LDA   L0240DE
         ORA   L0240DE+2
         BEQ   L020AD3
         LDA   L0240DE+2
         PHA
         LDA   L0240DE
         PHA
         LDA   L0240C6
         PHA
         JSL   L028A3F
L020AD3  RTS

L020AD4  CMP   #$0194
         BNE   L020B01
         LDA   L0240DE
         ORA   L0240DE+2
         BEQ   L020AD3
         LDA   L0240DE+2
         PHA
         LDA   L0240DE
         PHA
         LDA   L0240C6
         PHA
         JSL   L029833
         BNE   L020AF4
         RTS

L020AF4  LDA   L024394
         ORA   #$8000
         STA   L024394
         LDA   #$0000
         RTS

L020B01  CMP   #$0195
         BNE   L020B0A
         JSR   L020C24
L020B09  RTS

L020B0A  CMP   #$0192
         BNE   L020B09
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $00A0
         PEA   $001E
         PEA   $0000
         PEA   ^L021D0F
         PEA   L021D0F
         PEA   $0000
         LDA   L0240DE+2
         PHA
         LDA   L0240DE
         PHA
         LDA   L0240C6
         PHA
         JSL   L02A888
         PHX
         PHA
         PEA   ^L021A64
         PEA   L021A64
         _SFPutFile2
         LDX   #$0631
         JSL   L027D42
         _SetPort
         LDA   L021A64
         BEQ   L020B76
         LDA   L0240DE+2
         PHA
         LDA   L0240DE
         PHA
         LDA   L0240C6
         PHA
         PEA   ^L021A9C
         PEA   L021A9C
         JSL   L02A59A
L020B76  RTS

L020B77  PHA
         PEA   $0000
         PEA   $0000
         _RealFreeMem
         LDX   #$0640
         JSL   L027D42
         PLA
         PLX
         CPX   #$0000
         BNE   L020BB3
         CMP   #$8000
         BCS   L020BB3
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000C
         _AlertWindow
         PLA
         RTS

L020BB3  PLA
         LDX   #$0000
L020BB7  CMP   L0258FE,X
         BEQ   L020BC0
         INX
         INX
         BRA   L020BB7
L020BC0  LDA   L025732,X
         STA   L024382
         STZ   L02438A
         STZ   L024384
         STZ   L024384+2
         JSR   L020CBB
         JSL   L030000
         RTS

L020BD7  STZ   L02438A
         LDA   L0240DE
         ORA   L0240DE+2
         BNE   L020BE3
         RTS

L020BE3  LDA   L0240DE
         STA   L024384
         LDA   L0240DE+2
         STA   L024384+2
         LDA   L0240C6
         STA   L024382
         JSR   L020DB0
         PHX
         CPX   #$FFFF
         BEQ   L020C22
         JSL   L027A49
         BEQ   L020C22
         LDA   L024384+2
         PHA
         LDA   L024384
         PHA
L020C0C  LDA   L024382
         PHA
         JSL   L02990B
         CMP   #$0000
         BNE   L020C22
L020C19  PLX
         JSR   L020CBB
         JSL   L030000
         PHX
L020C22  PLX
         RTS

L020C24  STZ   L02438A
         LDA   L0240DE
         ORA   L0240DE+2
         BNE   L020C30
         RTS

L020C30  LDA   L0240DE
         STA   L024384
         LDA   L0240DE+2
         STA   L024384+2
         LDA   #$FFFF
         STA   L024382
         JSR   L020DB0
         PHX
         CPX   #$FFFF
         BEQ   L020C22
         LDA   L0240C6
         STA   L024382
         JSL   L027A49
         BEQ   L020C22
         BRA   L020C19

*--- Command dispatcher

L020C59  PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$0702
         JSL   L027D42
         JSL   L02897A
         CMP   #$FFFF
         BEQ   L020C8A
         AND   #$0008
         BEQ   L020C80
         LDX   #$0080
         BRA   L020CBB
L020C80  LDA   L024102
         ASL
         TAX
         LDA   L024382
         BNE   L020C91
L020C8A  STZ   L020DE9
         LDA   #$0000
         RTS

L020C91  CMP   L020DE9
         BNE   L020CB2
         PHB
         PEA   ^L02434C
         PEA   L02434C
         PHK
         PEA   L020D23
         SEP   #$20
         LDA   L020DEB+2
         PHA
         PHA
         REP   #$20
         LDA   L020DEB
         PLB
         PHA
         BRL   L020CEF
L020CB2  JSR   L020DB0
         CPX   #$FFFF
         BNE   L020CBB
         RTS

L020CBB  LDA   L024382
         CPX   #$0080
         BEQ   L020CC6
         LDA   L025732,X
L020CC6  STA   L020DE9
         TXA
         ASL
         TAX
         PHB
         PEA   ^L02434C
         PEA   L02434C
         PHK
         PEA   L020D23
         SEP   #$20
         LDA   L02484B,X
         PHA
         STA   L020DEB+2
         PHA
         REP   #$20
         SEC
         LDA   L024849,X
         SBC   #$0001
         STA   L020DEB
         PLB
         PHA
L020CEF  LDAL  L0240D4
         STAL  L0243AE
         LDAL  L0240D6
         STAL  L02439A
         PHA
         _SetCurResourceFile
         LDX   #$0750
         JSL   L027D42
         PEA   $0000
         PEA   $FFFF
         _SetResourceFileDepth
         LDX   #$0751
         JSL   L027D42
         PLA
L020D23  RTL

         PLX
         PLY
         CPX   #L02434C
         BNE   L020D30
         CPY   #^L02434C
         BEQ   L020D32
L020D30  PHY
         PHX
L020D32  PLB
         PHA
         JSL   L0202F5
L020D38  LDA   L024394
         AND   #$0400
         BEQ   L020D83
         LDA   L02439C
         STA   L0240D8
         LDA   L02439E
         STA   L0240EE
         LDA   L02439E+2
         STA   L0240F0
         LDA   L024394
         EOR   #$0400
         STA   L024394
         LDA   L024100
         ORA   #$0001
         STA   L024100
         LDA   #$0000
         PHA
         PHA
         PHA
         _FrontWindow
         LDX   #$0770
         JSL   L027D42
         PLA
         STA   L0240F8
         PLA
         STA   L0240FA
         PLA
         BRA   L020D9B
L020D83  LDA   L024394
         AND   #$4000
         BNE   L020D98
         LDA   L024394
         AND   #$1000
         BEQ   L020D9B
         JSR   L020E10
         BRA   L020D9B
L020D98  JSR   L020DEE
L020D9B  LDY   L02438A
         CPY   #$0009
         BEQ   L020DAD
         JSL   L030000
         PLA
         JSL   L030000
         RTS

L020DAD  TAX
         PLA
         RTS

L020DB0  PHA
         LDA   L024102
         ASL
         TAX
L020DB6  LDA   L025732,X
         CMP   L024382
         BEQ   L020DE7
         DEX
         DEX
         BPL   L020DB6
         LDX   #$0080
         LDA   L024108
         BMI   L020DE7
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         _AlertWindow
         PLA
         LDX   #$FFFF
L020DE7  PLA
         RTS

L020DE9  DW    $0000
L020DEB  ADR   $000000
L020DEE  LDA   L024394
         AND   #$2000
         BNE   L020DF6
L020DF6  LDA   L024394
         EOR   #$4000
         STA   L024394
         LDA   L02439E+2
         PHA
         LDA   L02439E
         PHA
         LDA   L02439C
         PHA
         JSL   L0239E8
         RTS

L020E10  LDA   L024394
         EOR   #$1000
         STA   L024394
         LDA   L02439E+2
         PHA
         LDA   L02439E
         PHA
         LDA   L02439C
         PHA
         JSL   L023AB0
         RTS

L020E2A  PHA
         PHX
         LDX   #$0006
L020E2F  LDA   $00,X
         STA   L020E4C,X
         DEX
         DEX
         BPL   L020E2F
         PLX
         PLA
         RTS

L020E3B  PHA
         PHX
         LDX   #$0006
L020E40  LDA   L020E4C,X
         STA   $00,X
         DEX
         DEX
         BPL   L020E40
         PLX
         PLA
         RTS

L020E4C  HEX   0000000000000000

L020E54  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetPort
         LDA   $0B,S
         ORA   $0D,S
         BNE   L020EE9
         LDA   #$2020
         STA   L02105D
         STA   L02105D+2
	 sta   L02105D+4
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000

* AV 202010 - Fixed the About bug
* It happened when users had more than 8MB

*         PEA   $0000
*         PEA   $0000
	 pha
	 pha
         _RealFreeMem
         LDX   #$2002
         JSL   L027D42
         PEA   $0000
         PEA   $0400
         _LongDivide
         LDX   #$2003
         JSL   L027D42
         PEA   ^L02105D
         PEA   L02105D
         PEA   $0006	; was 4
         PEA   $0000
         _Long2Dec
         LDX   #$2004
         JSL   L027D42
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$2006
         JSL   L027D42
         JSL   L02897A
         LDA   L024382
         BNE   L020EF1
         PEA   ^L020369
         PEA   L020369
         BRA   L020F02
L020EE9  LDA   $0D,S
         PHA
         LDA   $0D,S
         PHA
         BRA   L020F02
L020EF1  LDA   #$0001
         STA   L02438A
         JSR   L020C59
         LDA   L02437A+2
         PHA
         LDA   L02437A
         PHA
L020F02  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0FFD
         PEA   $800E
         _NewWindow2
         LDX   #$2010
         JSL   L027D42
         PLA
         STA   L021DE4
         PLA
         STA   L021DE4+2
         LDA   L021DE4+2
         PHA
         LDA   L021DE4
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         LDA   L021DE4+2
         PHA
         LDA   L021DE4
         PHA
         PEA   $0000
         PEA   $0001
         _GetCtlHandleFromID
         LDX   #$2011
         JSL   L027D42
         LDA   L021DE4+2
         PHA
         LDA   L021DE4
         PHA
         _ShowWindow
         LDX   #$2012
         JSL   L027D42
         _DrawOneCtl
         LDX   #$2013
         JSL   L027D42
         PEA   $0000
         LDA   $05,S
         PHA
         LDA   $05,S
         PHA
         _StringWidth
         PLA
         STA   L02105B
         LDA   #$0154
         SEC
         SBC   L02105B
         PHA
         PEA   $000E	; 14
         _MoveTo
         _DrawString

	 pha
	 PushLong #copyBRUTAL
	 _StringWidth
	 pla
	 sta	L02105B
	 
	 lda	#$154
	 sec
	 sbc	L02105B
	 pha
	 pea	$001a	; 26
	 _MoveTo
	 
	 PushLong #copyBRUTAL
	 _DrawString

         LDA   $0B,S
         ORA   $0D,S
         BNE   L021034
         PEA   $0000
         PEA   ^L02105D
         PEA   L02105D
         _CStringWidth
         PLA
         STA   L02105B
         LDA   #$0154
         SEC
         SBC   L02105B
         PHA
         PEA   $0026	; 38
         _MoveTo
         PEA   ^L02105D
         PEA   L02105D
         _DrawCString
L020FFD  PHA
         PEA   $FFFF
         PEA   ^L02106F
         PEA   L02106F
         _GetNextEvent
         PLA
         BEQ   L020FFD
         LDA   L02106F
         CMP   #$0001
         BEQ   L02101E
         CMP   #$0003
         BNE   L020FFD
L02101E  LDA   L021DE4+2
         PHA
         LDA   L021DE4
         PHA
         _CloseWindow
         LDX   #$2020
         JSL   L027D42
L021034  _SetPort
         PLB
         PLD
         LDA   $02,S
         STA   $06,S
         PLA
         STA   $03,S
         PLA
         RTL

L021046  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         JSL   L020E54
         PLB
         PLD
         LDA   #$0000
         CLC
         RTL

copyBRUTAL	str	'Brutal Deluxe Software'

L02105B  DW    $0000
L02105D  ASC   '     0k free memory'00
L02106F  DW    $0000      ; event code
         ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
         DW    $0000      ; mouse location
         DW    $0000
         DW    $0000      ; modifiers

L02107F  PHD
         PHB
         PHK
         PLB
         LDX   #$0002
         STX   L02438A
         JSR   L020C59
         PLB
         PLD
         RTL

L02108F  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$2702
         JSL   L027D42
L0210A7  PLA
         STA   L02133C
         PLA
         STA   L02133E
         ORA   L02133C
         BEQ   L0210FB
         LDA   L02133E
         PHA
         LDA   L02133C
         PHA
         JSL   L02897A
         CMP   #$5753
         BEQ   L0210E3
         PEA   $0000
         PEA   $0000
         LDA   L02133E
         PHA
         LDA   L02133C
         PHA
         _GetNextWindow
         LDX   #$2704
         JSL   L027D42
         BRA   L0210A7
L0210E3  LDA   L0240EC
         PHA
         LDA   L0240EA
         PHA
         _SelectWindow
         LDX   #$2706
         JSL   L027D42
         BRA   L02115C
L0210FB  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02132C
         PEA   L02132C
         PEA   ^L0211EF
         PEA   L0211EF
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0FFF
         PEA   $800E
         _NewWindow2
         LDX   #$2708
         JSL   L027D42
         PLA
         STA   L0240EA
         PLA
         STA   L0240EC
         LDA   L0240EC
         PHA
         LDA   L0240EA
         PHA
         _SetPort
         PEA   $FFFE
         LDA   L0240EC
L021150  PHA
         LDA   L0240EA
         PHA
         _SetOriginMask
L02115C  PLB
         PLD
         RTL

L02115F  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetScrapCount
         LDX   #$2710
         JSL   L027D42
         PLA
         CMP   L0240E8
         BEQ   L0211CF
         STA   L0240E8
         LDA   L0240EA
         ORA   L0240EC
         BEQ   L0211CF
         PEA   $0000
         PEA   $0000
         _GetPort
         LDA   L0240EC
         PHA
         LDA   L0240EA
         PHA
         _SetPort
         PEA   ^L02131C
         PEA   L02131C
         _GetPortRect
         PEA   ^L02131C
         PEA   L02131C
         _EraseRect
         PEA   ^L02131C
         PEA   L02131C
         _InvalRect
         _SetPort
L0211CF  PLB
         PLD
         RTL

L0211D2  LDA   L0240EC
         PHA
         LDA   L0240EA
         PHA
         _CloseWindow
         LDX   #$2720
         JSL   L027D42
         STZ   L0240EA
         STZ   L0240EC
         RTL

L0211EF  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDX   #$2802
         JSL   L027D42
         LDA   L0240D4
         PHA
         _SetCurResourceFile
         LDX   #$2803
         JSL   L027D42
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _GetScrapHandle
         BCS   L02129B
         PEA   ^L02131C
         PEA   L02131C
         _GetPortRect
         PEA   $0000
         PEA   $0000
         LDA   L0240EC
         PHA
         LDA   L0240EA
         PHA
         _GetContentOrigin
         PLA
         STA   L02133C
         SEC
         LDA   L02131C
         SBC   L02133C
         STA   L02131C
         PLA
         STA   L02133C
         SEC
         LDA   L02131E
         SBC   L02133C
         STA   L02131E
         PHD
         TSC
         TCD
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   $03
         STX   $05
         PLD
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _GetScrapSize
         PLA
         STA   $01,S
         PEA   ^L02131C
         PEA   L02131C
         PEA   $0000
         _LETextBox
         BRA   L0212F8
L02129B  PEA   $0001
         _GetScrapHandle
         BCS   L0212DD
         LDA   $03,S
         PHA
         LDA   $03,S
         PHA
         PHD
         TSC
         TCD
         LDY   #$0002
         LDA   [$03],Y
         TAX
         LDA   [$03]
         STA   $03
         STX   $05
         LDY   #$0008
L0212BF  LDA   [$03],Y
         DEY
         DEY
         STA   L02131C,Y
         CPY   #$0000
         BNE   L0212BF
         PLD
         PLA
         PLA
         PEA   ^L02131C
         PEA   L02131C
         _DrawPicture
         BRA   L0212F8
L0212DD  PLA
         PLA
         LDA   #$000A
         PHA
         PHA
         _MoveTo
         PEA   ^L021309
         PEA   L021309
         _DrawString
L0212F8  _SetCurResourceFile
         LDX   #$2882
         JSL   L027D42
         PLB
         PLD
         RTL

L021309  STR   'Clipboard empty...'
L02131C  DW    $0000
L02131E  DW    $0000
         DW    $0000
         DW    $0000
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02132C  ADRL  L021330
L021330  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ASC   'SW'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02133C  DW    $0000
L02133E  DW    $0000

L021340  TSC
         STA   L02166F
         STZ   L024102
         PEA   ^L024F32
         PEA   L024F32
         PLA
         STA   L021619
         PLA
         STA   L021619+2
         JSL   GSOS
         DW    $2010      ; Open
         ADRL  L02162F
         BCC   L021374
         CMP   #$0046
         BNE   L021369
         LDA   #$0044
L021369  JSL   L030000
         LDA   #$FFFF
         STA   L0240DC
         RTS

L021374  LDA   L021631
         STA   L021639
         STA   L02166D
L02137D  LDA   #$0020
         STA   L021649
         JSL   GSOS
         DW    $201C      ; GetDirEntry
         ADRL  L021637
         BCC   L0213B3
         CMP   #$0061
         BEQ   L02139F
L021394  LDX   #$2FFF
         JSL   L027D42
         LDA   L02166F
         TCS
L02139F  JSL   GSOS
         DW    $2014      ; Close
         ADRL  L02166B
         LDX   #$2F02
         JSL   L027D42
         BRL   L021557
L0213B3  LDA   L021647
         CMP   #$00BC
         BNE   L02137D
         LDA   L02164B
         INC
         INC
         STA   L021649
         LDA   #$3A36
         STA   L02164B
         PEA   $0000
         PEA   $0003
         PEA   $0000
         PEA   $0000
         PEA   ^L021649
         PEA   L021649
         _OpenResourceFile
         PLY
         BCC   L0213E8
         LDY   #$0000
L0213E8  STY   L02439A
         LDA   L021649
         XBA
         STA   L021649
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $1000
         PEA   ^L02164A
         PEA   L02164A
         PEA   $FFFF
         _InitialLoad
         TAY
         PLA
         STA   L02161D
         PLA
         STA   L021621
         PLA
         STA   L021621+2
         PLA
         PLA
         BCC   L021439
         PHY
         PEA   $0000
         LDA   L02161D
         PHA
         _UserShutDown
         PLA
         PLA
         BRL   L021394
L021439  LDA   #$0003
         STA   L02438A
         STZ   L02437E
L021442  STZ   L02437E+2
         PHB
         PEA   ^L02434C
         PEA   L02434C
         PHK
         PEA   L021462
         SEP   #$20
         LDA   L021621+2
         PHA
         PHA
         REP   #$20
         SEC
         LDA   L021621
         SBC   #$0001
         PLB
         PHA
L021462  RTL

         PLX
         PLY
         CPX   #L02434C
         BNE   L02146F
         CPY   #^L02434C
         BEQ   L021471
L02146F  PHY
         PHX
L021471  PLB
         LDA   L02437E
         ORA   L02437E+2
         BEQ   L02147D
         LDA   #$FFFF
L02147D  STA   L02162D
         PHA
         LDA   L02437A
         ORA   L02437A+2
         BNE   L0214B9
         LDA   #$8000
         STA   L024108
         LDX   #$0080
         LDA   L02161D
         STA   L0246BF,X
         LDX   #$0100
         LDA   L021621
         STA   L024849,X
         LDA   L021621+2
         STA   L02484B,X
         PLA
         BEQ   L0214B6
         LDA   L02437E
         STA   L024E2E,X
         LDA   L02437E+2
         STA   L024E30,X
L0214B6  BRL   L02137D
L0214B9  PLA
         JSR   L021588
L0214BD  LDA   L024102
         BEQ   L0214D3
         ASL
         TAX
L0214C4  DEX
         DEX
         BMI   L0214D3
         LDA   L025732,X
         CMP   L024382
         BNE   L0214C4
         BRL   L02154C
L0214D3  LDA   L024102
         ASL
         TAX
         LDA   L02161D
         STA   L0246BF,X
         STZ   L02161D
         CLC
         LDA   L024102
         ADC   #$1000
         STA   L0258FE,X
         INC   L024102
         LDA   L024382
         STA   L025732,X
         TXA
         ASL
         TAX
         LDA   L021621
         STA   L024849,X
         LDA   L021621+2
         STA   L02484B,X
         PHX
         LDA   L02437A+2
         PHA
         LDA   L02437A
         PHA
         LDA   L021619+2
         PHA
         LDA   L021619
         PHA
         PEA   $0000
         PEA   $0020
         _BlockMove
         CLC
         LDA   L021619
         ADC   #$0020
         STA   L021619
         LDA   L021619
         ADC   #$0000
         STA   L021619
         PLX
         LDA   L02162D
         STA   L024E2E,X
         STA   L024E30,X
         BEQ   L02154C
         LDA   L02437E
         STA   L024E2E,X
         LDA   L02437E+2
         STA   L024E30,X
L02154C  JSR   L0215C9
         BEQ   L021554
         BRL   L0214BD
L021554  BRL   L02137D
L021557  PEA   ^L030067
         PEA   L030067
         PEA   $0000
         PEA   $0004
         LDA   #$0000
         PHA
         LDA   L024102
         PHA
         PEA   ^L0257FE
         PEA   L0257FE
         JSL   L02C4BA
         LDA   L024102
         ASL
         ASL
         TAX
         LDA   #$0000
         STA   L0257FE,X
         STA   L025800,X
         STZ   L024382
         RTS

L021588  STA   L021617
         LDA   L024382
         BEQ   L02159B
         LDA   #$0000
         STA   $00
         STA   $02
         STA   L021613
         RTS

L02159B  LDA   L02437A
         STA   $00
         LDA   L02437A+2
         STA   $02
         LDA   [$00]
         STA   L021613
         STZ   L021615
         CLC
         LDA   $00
         ADC   #$0002
         STA   $00
         LDA   $02
         ADC   #$0000
         STA   $02
         LDA   L02437E
         STA   $04
         LDA   L02437E+2
         STA   $06
         LDY   #$0000
L0215C9  LDA   L021613
         BEQ   L021612
         DEC   L021613
         LDA   [$00]
         STA   L024382
         CLC
         LDA   $00
         ADC   #$0002
         STA   L02437A
         LDA   $02
         ADC   #$0000
         STA   L02437A+2
         CLC
         LDA   $00
         ADC   #$0022
         STA   $00
         LDA   $02
         ADC   #$0000
         STA   $02
         LDA   L021617
         BEQ   L02160F
         LDY   L021615
         LDA   [$04],Y
         STA   L02437E
         INY
         INY
         LDA   [$04],Y
         STA   L02437E+2
         INY
         INY
         STY   L021615
L02160F  LDA   #$FFFF
L021612  RTS

L021613  DW    $0000
L021615  DW    $0000
L021617  DW    $0000
L021619  ADRL  $00000000
L02161D  ADRL  $00000000
L021621  ADRL  $00000000
         ADRL  $00000000
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02162D  DB    $00
         DB    $00
L02162F  DW    $0002      ; Parms for Open
L021631  DW    $0000      ;  ref num
         ADRL  L02424B    ;  path name
L021637  DW    $0007      ; Parms for GetDirEntry
L021639  DW    $0000      ;  ref num
         DW    $0000      ;  flags
         DW    $0001      ;  base
         DW    $0001      ;  displacement
         ADRL  L021649    ;  file name
         DW    $0000      ;  entry num
L021647  DW    $0000      ;  file type
L021649  DB    $20
L02164A  DB    $00
L02164B  DS    $20
L02166B  DW    $0001      ; Parms for Close
L02166D  DW    $0000      ;  ref num
L02166F  DW    $0000

         DW    $01FC
         DS    $01FC

L02186F  DS    $40

L0218AF  DB    $00
L0218B0  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0218C1  DB    $00
         DB    $00
L0218C3  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0218D4  STR   'Hide "'
L0218DB  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0218EC  STR   'Show "'
L0218F3  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021904  DS    $20
L021924  DS    $20
L021944  DS    $20
L021964  DS    $100
L021A64  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L021A78
         DB    $00
         DB    $00
         ADRL  L021A9A

L021A78  DW    $0020
L021A7A  DS    $20
L021A9A  DW    $0100
L021A9C  DS    $100

L021B9C  DW    $00FA
         DW    $00FB
         DW    $00FC
         DW    $00FD
         DW    $00FE
         DW    $0000
L021BA8  DW    $0103
         DW    $0104
         DW    $010E
         DW    $0000
L021BB0  DW    $0105
         DW    $0106
         DW    $0107
         DW    $010B
         DW    $0114
         DW    $0115
         DW    $011B
         DW    $010A
         DW    $0118
         DW    $0119
         DW    $011A
         DW    $0000
         DW    $00FF
         DW    $0109
         DW    $010C
         DW    $010D
         DW    $0000
L021BD2  DW    $0100
         DW    $0102
         DW    $0113
         DW    $0101
         DW    $0117
         DW    $0108
         DW    $0000

L021BE0  DW    $000A      ; pCount
         ADRL  $00000001  ; ID
         DW    $0002      ; rect
         DW    $0005
         DW    $0000
         DW    $0000
         ADRL  $87000000  ; procRef
         DW    $0040      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0000      ; titleWidth
         ADRL  L0257F4    ; menuRef
         ADRL  $00001000  ; colorTableRef
         DW    $0000
L021C06  DW    $000A      ; pCount
         ADRL  $00000002  ; ID
         DW    $0002      ; rect
         DW    $00F0
         DW    $0000
         DW    $0000
         ADRL  $87000000  ; procRef
         DW    $0040      ; flag
         DW    $1002      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0000      ; titleWidth
         ADRL  $00000190  ; menuRef
         ADRL  $00000191  ; colorTableRef
         DB    $00
         DB    $00
L021C2C  DB    $91
         DB    $01
L021C2E  DW    $0050
         DW    $C0A0      ; frame bits
         ADRL  $00000000  ; title ptr
         ADRL  L021C88    ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L021C7E    ; color table ptr
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
         DW    $0028      ; content rect
         DW    $0050
         DW    $007B
         DW    $0230
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
         DB    $00
         DB    $00
L021C7E  DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $0F
         DB    $02
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
L021C88  ADRL  L021C8C
L021C8C  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ASC   'RW'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021C98  ADRL  L024118
         ADRL  L0257BA
         ADRL  L021BE0
         ADRL  L021C06
         ADRL  $00000000
L021CAC  STR   'New file name:'
L021CBB  STR   'Select file to edit...'
L021CD2  STR   'Source file name:'
L021CE4  STR   'Equate file name:'
L021CF6  STR   'Select file to import...'
L021D0F  STR   'Export file name:'
L021D21  DB    $00
         DB    $00
L021D23  DB    $00
         DB    $00
L021D25  DB    $1E
         DB    $00
         DB    $B4
         DB    $00
         DB    $3C
         DB    $00
         DB    $CC
         DB    $01
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L021D3B
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021D3B  DB    $03
         DB    $00
         DB    $0A
         DB    $00
         DB    $0A
         DB    $00
         DB    $14
         DB    $00
         DB    $0E
         DB    $01
         DB    $0F
         DB    $80
         ADRL  L021D53
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021D53  STR   'Saving ^3...'
L021D60  DB    $1E
         DB    $00
         DB    $B4
         DB    $00
         DB    $3C
         DB    $00
         DB    $CC
         DB    $01
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L021D76
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021D76  DB    $03
         DB    $00
         DB    $0A
         DB    $00
         DB    $0A
         DB    $00
         DB    $14
         DB    $00
         DB    $0E
         DB    $01
         DB    $0F
         DB    $80
         ADRL  L021D8E
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021D8E  STR   'Restoring ^3...'
L021D9E  DB    $1E
         DB    $00
         DB    $B4
         DB    $00
         DB    $3C
         DB    $00
         DB    $CC
         DB    $01
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L021DB4
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021DB4  DB    $03
         DB    $00
         DB    $0A
         DB    $00
         DB    $0A
         DB    $00
         DB    $14
         DB    $00
         DB    $0E
         DB    $01
         DB    $0F
         DB    $80
         ADRL  L021DCC
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021DCC  STR   'Saving the clipboard...'
L021DE4  ADRL  $00000000

	 DS    $104	; AV 202010 - Lost space?

L021EEC  ADRL  $00000000
L021EF0  STR   'Ok'
L021EF3  DW    $0050
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
         ADRL  L026AB5    ; content defproc
         DW    $0036      ; content rect
         DW    $00D2
         DW    $00A0
         DW    $01AE
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  L021F43    ; storage ptr
         DB    $03
         DB    $00
L021F43  ADRL  L021F53
         ADRL  L021F7B
         ADRL  L021FA9
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021F53  DW    $0009      ; pCount
         ADRL  $00000001  ; ID
         DW    $0057      ; rect
         DW    $0041
         DW    $0064
         DW    $009B
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L021EF0    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L021F7B  DW    $000E      ; pCount
         ADRL  $00000002  ; ID
         DW    $0012      ; rect
         DW    $000A
         DW    $0050
         DW    $00BA
         ADRL  $89000000  ; procRef
         DW    $0000      ; flag
         DW    $1400      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $000E      ; listSize
         DW    $0006      ; listView
         DW    $0002      ; listType
         DW    $0001      ; listStart
         ADRL  $00000000  ; listDraw
         DW    $000A      ; listMemHeight
         DW    $0007      ; listMemSize
         ADRL  L021FE4    ; listRef
L021FA9  DW    $0009      ; pCount
         ADRL  $00000003  ; ID
         DW    $0004      ; rect
         DW    $000A
         DW    $000E
         DW    $00C1
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L021FCB    ; textRef
         DW    $0019      ; textSize
         DB    $00
         DB    $00
L021FCB  ASC   'Select language format...'
L021FE4  ADR   L022046
         DB    $00
         DB    $00
         DB    $FE
         DB    $00
         ADR   L02205B
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         ADR   L02206D
         DB    $00
         DB    $00
         DB    $0A
         DB    $00
         ADR   L022073
         DB    $00
         DB    $00
         DB    $15
         DB    $00
         ADR   L02207B
         DB    $00
         DB    $00
         DB    $9E
         DB    $00
         ADR   L022091
         DB    $00
         DB    $00
         DB    $83
         DB    $00
         ADR   L02209A
         DB    $00
         DB    $00
         DB    $FF
         DB    $00
         ADR   L0220A4
         DB    $00
         DB    $20
         DB    $90
         DB    $00
         ADR   L0220B0
         DB    $00
         DB    $20
         DB    $91
         DB    $00
         ADR   L0220BC
         DB    $00
         DB    $20
         DB    $80
         DB    $00
         ADR   L0220CF
         DB    $00
         DB    $20
         DB    $81
         DB    $00
         ADR   L0220DA
         DB    $00
         DB    $20
         DB    $82
         DB    $00
         ADR   L0220EA
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         ADR   L0220F1
         DB    $00
         DB    $00
         DB    $05
         DB    $00
L022046  STR   'Resource info report'
L02205B  STR   'APW/ORCA ASM65816'
L02206D  STR   'APW C'
L022073  STR   'APW Rez'
L02207B  STR   'Complete (TML) Pascal'
L022091  STR   'Lisa 816'
L02209A  STR   'Merlin 16'
L0220A4  STR   'Micol BASIC'
L0220B0  STR   'Micol MACRO'
L0220BC  STR   'MPW IIgs Assembler'
L0220CF  STR   'MPW IIgs C'
L0220DA  STR   'MPW IIgs Pascal'
L0220EA  STR   'ORCA C'
L0220F1  STR   'ORCA Pascal'
L0220FD  ENT
         DB    $00
         DB    $00
         DB    $14
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $60
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
         DB    $01
         DB    $00
         DB    $20
         DB    $00
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $30
         DB    $75
         DB    $00
         DB    $08
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF

L02212F  TSC
         SEC
         SBC   #$0012
         TCS
         PHD
         TCD
         LDA   #$0002
         STA   L0257B2
         STA   L0257EC
         LDA   #$0003
         STA   L0257EE
         PEA   ^L024D2D
         PEA   L024D2D
         PEA   ^L0257F0
         PEA   L0257F0
         PLA
         STA   $01
         PLA
         STA   $03
L022158  PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   $2009
         PEA   ^L0257EC
         PEA   L0257EC
         JSL   L02C243
         PEA   $B002
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0005
         STA   L0257EE
         PEA   ^L0243B0
         PEA   L0243B0
         PEA   ^L0257B4
         PEA   L0257B4
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   $2006
         PEA   ^L0257B2
         PEA   L0257B2
         JSL   L02C243
         JSL   L02CA27
         TAX
         BNE   L0221CC
         PEA   ^L0243B0
         PEA   L0243B0
L0221B5  PEA   ^L0257F0
         PEA   L0257F0
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         BRA   L0221E7
L0221CC  PEA   ^L02414A
         PEA   L02414A
         PEA   ^L0257F0
         PEA   L0257F0
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
L0221E7  PEA   $2009
         PEA   ^L0257EC
         PEA   L0257EC
         JSL   L02C243
         PEA   $B004
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0006
         STA   L0257EE
         PEA   ^L02424B
         PEA   L02424B
         PEA   ^L0257F0
         PEA   L0257F0
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   $2009
         PEA   ^L0257EC
         PEA   L0257EC
         JSL   L02C243
         PEA   $B006
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0000
         STA   L024100
         STA   L0240D8
         STZ   L0240F0
         STZ   L0240EE
         STZ   L0240F4
         STZ   L0240F2
         STZ   L0240EC
         STZ   L0240EA
         LDA   #$0001
         STA   L0240DA
         PEA   ^L02494D
         PEA   L02494D
         PEA   ^L0245B2
         PEA   L0245B2
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L02496D
         PEA   L02496D
         PEA   ^L0245B6
         PEA   L0245B6
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   ^L02498D
         PEA   L02498D
         PEA   ^L0245BA
         PEA   L0245BA
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   #$0000
         STA   $05
L0222AB  LDA   $05
         BMI   L0222B7
         CMP   #$0040
         BCC   L0222B7
         BRL   L0223A5
L0222B7  LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         PHA
         LDA   $05
         ASL
         ASL
         CLC
         ADC   #L0257FE
         PEA   ^L0257FE
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         PHA
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         CLC
         ADC   #$0004
         PHA
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         CLC
         ADC   #$0006
         PHA
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         CLC
         ADC   #$0008
         PHA
         LDA   $05
         ASL
         TAX
         LDA   #$0000
         STA   L0246BF,X
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         PHA
         LDA   $05
         CLC
         ADC   #$1000
         PLX
         STA   L0249AF,X
         LDA   $05
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L024F32
         PEA   ^L024F32
         PHA
         LDA   $05
         LDX   #$000E
         JSL   L02DDD6
         CLC
         ADC   #L0249AD
         PEA   ^L0249AD
         CLC
         ADC   #$000A
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         INC   $05
         BRL   L0222AB
L0223A5  LDA   #$0000
         STA   L024108
         STA   L0240D2
         STZ   L0240D0
         STZ   L0240CE
         PEA   ^L0276F1
         PEA   L0276F1
         PEA   ^L0243A2
         PEA   L0243A2
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PEA   ^L02A8F1
         PEA   L02A8F1
         PEA   ^L0243A6
         PEA   L0243A6
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         PEA   ^L030108
         PEA   L030108
         PLA
         STA   $07
         PLA
         STA   $09
         PEA   $0000
         PEA   $005C
         PEI   $09
         PEI   $07
         PEA   $0000
         PEA   $0008
         JSL   L02DCF2
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PEA   ^L0243AA
         PEA   L0243AA
         PLA
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         LDY   #$0002
         PLA
         STA   [$01],Y
         PLD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L02242F  TSC
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         JSL   L022467
         PEA   $0000
         JSL   L02333E
         PEA   $FFFF
         LDA   L0240C6
         PHA
         JSL   L0229B5
         PEA   $0000
         PEA   $0000
         JSL   L023681
         LDA   #$0000
         STA   $05
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         RTL

L022467  TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         TCD
         _WaitCursor
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $B302
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $09
         PEA   $B303
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   L0240D2
         BNE   L0224B8
         BRL   L0225CD
L0224B8  LDA   #$0000
         STA   $0B
         STA   $0F
L0224BF  LDX   L0240D0
         LDA   L0240CE
         PHX
         PHA
         LDA   $0B
         LDX   #$0000
         TAY
         BPL   L0224D0
         DEX
L0224D0  PHX
         PHA
         JSL   L02D6DE
         BNE   L0224DB
         BRL   L022578
L0224DB  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02250D
         DEX
L02250D  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$0080
         BNE   L022573
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02255C
         DEX
L02255C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         STA   $0F
L022573  INC   $0B
         BRL   L0224BF
L022578  LDX   L0240CA
         LDA   L0240C8
         PHX
         PHA
         JSL   L02C20F
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         JSL   L02C20F
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
L0225CD  PHA
         _CountTypes
         PLA
         STA   L0240D2
         BNE   L0225E1
         BRL   L0228D4
L0225E1  LDA   L0240D2
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0005
         JSL   L02DCF2
         PLA
         STA   $11
         PLA
         STA   $13
         PHA
         PHA
         LDX   $13
         LDA   $11
         PHX
         PHA
         LDA   L02410E
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $15
         PLA
         STA   $17
         PEA   $B307
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $17
         LDA   $15
         PHX
         PHA
         _HLock
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STX   L0240CA
         STA   L0240C8
         LDA   L0240D2
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0007
         JSL   L02DBC3
         PLA
         STA   $11
         PLA
         STA   $13
         PHA
         PHA
         LDX   $13
         LDA   $11
         PHX
         PHA
         LDA   L02410E
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $15
         PLA
         STA   $17
         PEA   $B309
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $17
         LDA   $15
         PHX
         PHA
         _HLock
         LDY   #$0002
         LDA   [$15],Y
         PHA
         LDA   [$15]
         PHA
L0226A8  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   L024104
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
L0226D3  ADC   #$001E
         STA   $01
         STX   $03
         LDA   L0240D2
         STA   [$01]
         LDX   L0240CA
         LDA   L0240C8
         STX   $07
         STA   $05
         LDA   #$0000
         STA   $0B
L0226EE  LDA   L0240D2
         CMP   $0B
         BEQ   L0226F7
         BCS   L0226FA
L0226F7  BRL   L0228D1
L0226FA  PHA
         LDA   $0B
         INC
         PHA
         _GetIndType
         PLA
         STA   $0D
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02273E
         DEX
L02273E  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   $05
         STA   [$01]
         LDY   #$0002
         LDA   $07
         STA   [$01],Y
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022788
         DEX
L022788  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         SEP   #$20
         LDA   #$00
         STA   [$01]
         REP   #$20
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0227D6
         DEX
L0227D6  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0005
         PLX
         STA   $01
         STX   $03
         LDA   $0D
         STA   [$01]
         LDA   $0F
         CMP   #$0000
         BEQ   L022854
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022827
         DEX
L022827  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         PHA
         LDA   $0F
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L022849
         LDA   #$0001
L022849  EOR   #$0001
         CMP   #$0000
         BEQ   L022854
         LDA   #$0001
L022854  TAX
         BEQ   L0228A5
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0B
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022889
         DEX
L022889  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         SEP   #$20
         LDA   #$80
         STA   [$01]
         REP   #$20
L0228A5  PEA   $0000
         PEI   $0D
         JSL   L02597E
         PHX
         PHA
         JSL   L02C395
         PHX
         PHA
         LDX   $07
         LDA   $05
         PHX
         PHA
         JSL   L02BF46
         CLC
         LDA   $05
         ADC   #$0020
         STA   $05
         BCC   L0228CC
         INC   $07
L0228CC  INC   $0B
         BRL   L0226EE
L0228D1  BRL   L02299F
L0228D4  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L022902
         DEY
L022902  TXA
         CMP   $03,S
         BEQ   L02290A
         LDY   #$0000
L02290A  PLA
         PLA
         TYA
         BNE   L022942
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         JSL   L02C20F
         LDX   L0240CA
         LDA   L0240C8
         PHX
         PHA
         JSL   L02C20F
L022942  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDA   L024104
         STA   $01
         STX   $03
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$001E
         PHA
         LDA   L024104
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0012
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         STA   L0240D2
         STZ   L0240D0
         STZ   L0240CE
L02299F  JSL   L0202F5
         _InitCursor
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L0229B5  TSC
         SEC
         SBC   #$0026
         TCS
         PHD
         TCD
         _WaitCursor
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $B402
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0D
         PEA   $B403
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   L0240CE
         ORA   L0240D0
         BNE   L022A09
         BRL   L022B28
L022A09  LDA   #$0000
         STA   $0F
         STA   $1B
         STA   $1D
L022A12  LDX   L0240D0
         LDA   L0240CE
         PHX
         PHA
         LDA   $0F
         LDX   #$0000
         TAY
         BPL   L022A23
         DEX
L022A23  PHX
         PHA
         JSL   L02D6DE
         BNE   L022A2E
         BRL   L022AD3
L022A2E  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022A60
         DEX
L022A60  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         AND   #$00FF
         CMP   #$0080
         BNE   L022ACE
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022AAF
         DEX
L022AAF  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         STX   $1D
         STA   $1B
L022ACE  INC   $0F
         BRL   L022A12
L022AD3  LDX   L02410C
         LDA   L02410A
         PHX
         PHA
         JSL   L02C20F
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         JSL   L02C20F
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
L022B28  LDA   $2A
         LDX   #$0000
         STX   $01
         ORA   $01
         BEQ   L022B56
         PHA
         PHA
         PEI   $2A
         _CountResources
         LDA   $01,S
         STA   L0240CE
         LDA   $03,S
         STA   L0240D0
         PLA
         STA   $01
         PLA
         ORA   $01
         BEQ   L022B56
         LDA   #$0001
L022B56  BNE   L022B5B
         BRL   L023254
L022B5B  LDX   L0240D0
         LDA   L0240CE
         PHX
         PHA
         PEA   $0000
         PEA   $0006
         JSL   L02DCF2
         PLA
         STA   $1F
         PLA
         STA   $21
         PHA
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         LDA   L02410E
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $23
         PLA
         STA   $25
         PEA   $B407
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $25
         LDA   $23
         PHX
         PHA
         _HLock
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STX   L02410C
         STA   L02410A
         LDX   L0240D0
         LDA   L0240CE
         PHX
         PHA
         PEA   $0000
         PEA   $000B
         JSL   L02DBC3
         PLA
         STA   $1F
         PLA
         STA   $21
         PHA
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         LDA   L02410E
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $23
         PLA
         STA   $25
         PEA   $B409
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $25
         LDA   $23
         PHX
         PHA
         _HLock
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$001E
         STA   $01
         STX   $03
         LDX   L0240D0
         LDA   L0240CE
         STA   [$01]
         LDX   L02410C
         LDA   L02410A
         STX   $07
         STA   $05
         LDA   #$0000
         STA   $15
         STA   $0F
L022C6F  LDX   L0240D0
         LDA   L0240CE
         SEC
         SBC   $0F
         BEQ   L022C81
         BVS   L022C7F
         EOR   #$8000
L022C7F  BMI   L022C84
L022C81  BRL   L023247
L022C84  PHA
         PHA
         PEI   $2A
         LDA   $0F
         LDX   #$0000
         TAY
         BPL   L022C91
         DEX
L022C91  PHX
         CLC
         ADC   #$0001
         PHA
         _GetIndResource
         PLA
         STA   $17
         PLA
         STA   $19
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022CD9
         DEX
L022CD9  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   $05
         STA   [$01]
         LDY   #$0002
         LDA   $07
         STA   [$01],Y
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022D23
         DEX
L022D23  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         SEP   #$20
         LDA   #$00
         STA   [$01]
         REP   #$20
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022D71
         DEX
L022D71  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0005
         STA   $01
         PLA
         STA   $03
         LDA   $17
         STA   [$01]
         LDY   #$0002
         LDA   $19
         STA   [$01],Y
         LDX   $1D
         LDA   $1B
         STX   $01
         ORA   $01
         BEQ   L022E01
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022DC9
         DEX
L022DC9  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         LDY   #$0000
         CMP   $1B
         BNE   L022DED
         CPX   $1D
L022DED  BNE   L022DF0
         INY
L022DF0  TYA
         LDX   #$0000
         TAY
         BPL   L022DF8
         DEX
L022DF8  STX   $01
         ORA   $01
         BEQ   L022E01
         LDA   #$0001
L022E01  BEQ   L022E51
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022E35
         DEX
L022E35  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         SEP   #$20
         LDA   #$80
         STA   [$01]
         REP   #$20
L022E51  PEA   $0000
         LDX   $19
         LDA   $17
         PHX
         PHA
         PEI   $2A
         JSL   L025A27
         PHX
         PHA
         JSL   L02C395
         STX   $0B
         STA   $09
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022E9C
         DEX
L022E9C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0009
         PLX
         STA   $01
         STX   $03
         LDA   L025C94
         STA   [$01]
         LDA   [$09]
         AND   #$00FF
         BMI   L022EC1
         CMP   #$0040
         BCS   L022EC3
L022EC1  BRA   L022ECB
L022EC3  SEP   #$20
         LDA   #$3F
         STA   [$09]
         REP   #$20
L022ECB  LDX   $0B
         LDA   $09
         PHX
         PHA
         LDX   $07
         LDA   $05
         PHX
         PHA
         JSL   L02BF46
         CLC
         LDA   $05
         ADC   #$0040
         STA   $05
         BCC   L022EE7
         INC   $07
L022EE7  LDA   $2C
         LDX   #$0000
         CMP   #$0000
         BEQ   L022EF2
         INX
L022EF2  TXA
         CMP   #$0000
         BEQ   L022F0D
         LDA   L025C94
         LDX   #$0000
         CMP   #$0000
         BEQ   L022F04
         INX
L022F04  TXA
         CMP   #$0000
         BEQ   L022F0D
         LDA   #$0001
L022F0D  TAX
         BNE   L022F13
         BRL   L023242
L022F13  LDA   #$0000
         STA   $11
L022F18  LDA   $0F
         LDX   #$0000
         CMP   #$0000
         BEQ   L022F23
         INX
L022F23  TXA
         CMP   #$0000
         BEQ   L022F44
         LDA   $0F
         LDX   #$0001
         SEC
         SBC   $11
         BEQ   L022F3A
         BVS   L022F38
         EOR   #$8000
L022F38  BMI   L022F3B
L022F3A  DEX
L022F3B  TXA
         CMP   #$0000
         BEQ   L022F44
         LDA   #$0001
L022F44  TAX
         BNE   L022F4A
         BRL   L023242
L022F4A  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $11
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022F7C
         DEX
L022F7C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0009
         LDA   [$01],Y
         BNE   L022F96
         BRL   L02323D
L022F96  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $11
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L022FC8
         DEX
L022FC8  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023011
         DEX
L023011  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L02BF98
         TAX
         BEQ   L023035
         BRL   L02323D
L023035  PEA   $0000
         PEI   $2A
         JSL   L02597E
         PHX
         PHA
         PEA   ^L02494D
         PEA   L02494D
         JSL   L02C78E
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02307C
         DEX
L02307C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L02C440
         PHX
         PHA
         PEA   ^L02494D
         PEA   L02494D
         LDA   #$0020
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C78E
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0230E0
         DEX
L0230E0  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         PHX
         PHA
         PEA   $0001
         PEI   $2A
         JSL   L02597E
         PHX
         PHA
         PEA   ^L023334
         PEA   L023334
         PEA   ^L02494D
         PEA   L02494D
         LDA   #$0040
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C68C
         PEA   ^L02494D
         PEA   L02494D
         LDA   #$0040
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C395
         PHX
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023166
         DEX
L023166  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L02BF46
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0231B6
         DEX
L0231B6  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0009
         PLX
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         INC   $15
         JSL   L0202F5
         _InitCursor
         PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0011
         _AlertWindow
         PLA
         STA   $13
         _WaitCursor
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $B410
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0D
         PEA   $B411
         JSL   L02CA27
         PHA
         JSL   L027CEB
L02323D  INC   $11
         BRL   L022F18
L023242  INC   $0F
         BRL   L022C6F
L023247  LDA   $15
         BEQ   L023251
         PEI   $2A
         JSL   L023D5F
L023251  BRL   L023316
L023254  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L023282
         DEY
L023282  TXA
         CMP   $03,S
         BEQ   L02328A
         LDY   #$0000
L02328A  PLA
         PLA
         TYA
         BNE   L0232C2
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         JSL   L02C20F
         LDX   L02410C
         LDA   L02410A
         PHX
         PHA
         JSL   L02C20F
L0232C2  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$001E
         PHA
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$0012
         STA   $01
         STX   $03
         LDA   #$0000
         STA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L023316  JSL   L0202F5
         _InitCursor
         LDA   $28
         STA   $2C
         LDA   $27
         STA   $2B
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L023334  ASC   '%s_%0.8lX'00
         MX    %00
L02333E  TSC
         SEC
         SBC   #$000E
         TCS
         PHD
         TCD
         PHA
         PHA
         _GetPort
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDX   L0240F4
         LDA   L0240F2
         PHX
         PHA
         _SetPort
         LDA   #$0000
         STA   L0240C6
         LDA   L0240D2
         LDX   #$0000
         CMP   #$0000
         BNE   L02337C
         INX
L02337C  TXA
         BNE   L023384
         LDA   #$0001
         BRA   L023387
L023384  LDA   #$0000
L023387  STA   $09
         PEA   $0000
         PEA   $0000
         PEI   $09
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         PEA   $0000
         LDA   L0240D2
         PHA
         LDX   L024106
         LDA   L024104
         PHX
         PHA
         _NewList2
         PEA   $B102
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $09
         BNE   L0233E0
         BRL   L023661
L0233E0  PEA   $0000
         PEA   $0000
         LDX   L024106
         LDA   L024104
         PHX
         PHA
         _SortList2
         PEA   $B104
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0001
         STA   $07
         LDA   $12
         BEQ   L023464
L02340D  LDA   L0240D2
         CMP   $07
         BCC   L023464
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $07
         DEC
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023447
         DEX
L023447  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         CMP   $12
         BEQ   L023464
         INC   $07
         BRA   L02340D
L023464  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         PHA
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PLY
         STY   $01
         CMP   $01
         BCC   L0234AA
         LDA   #$0001
         STA   $09
         BRL   L023535
L0234AA  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PHA
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         SEC
         SBC   $01,S
         PLX
         STA   $01
         LDA   $07
         CMP   $01
         BEQ   L0234EF
         BCS   L0234F1
L0234EF  BRA   L023531
L0234F1  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PHA
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         SEC
         SBC   $01,S
         PLX
         INC
         STA   $09
         BRA   L023535
L023531  LDA   $07
         STA   $09
L023535  LDA   #$0001
         STA   $05
L02353A  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         CMP   $05
         BCC   L0235C6
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $05
         DEC
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02358C
         DEX
L02358C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         PEI   $07
         LDA   $05
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L0235AE
         LDA   #$0001
L0235AE  EOR   #$0001
         BNE   L0235B8
         LDA   #$0000
         BRA   L0235BB
L0235B8  LDA   #$0080
L0235BB  SEP   #$20
         STA   [$01]
         REP   #$20
         INC   $05
         BRL   L02353A
L0235C6  PEA   $0000
         PEA   $0000
         PEI   $09
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         PEA   $0000
         LDA   L0240D2
         PHA
         LDX   L024106
         LDA   L024104
         PHX
         PHA
         _NewList2
         PEA   $B106
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $07
         DEC
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023649
         DEX
L023649  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         STA   L0240C6
L023661  LDX   $0D
         LDA   $0B
         PHX
         PHA
         _SetPort
         LDA   $10
         STA   $12
         LDA   $0F
         STA   $11
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L023681  TSC
         SEC
         SBC   #$000E
         TCS
         PHD
         TCD
         PHA
         PHA
         _GetPort
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDX   L0240F4
         LDA   L0240F2
         PHX
         PHA
         _SetPort
         STZ   L0240DE+2
         STZ   L0240DE
         LDY   #$0000
         LDA   L0240CE
         ORA   L0240D0
         BNE   L0236BF
         INY
L0236BF  TYA
         BNE   L0236C7
         LDA   #$0001
         BRA   L0236CA
L0236C7  LDA   #$0000
L0236CA  STA   $09
         PEA   $0000
         PEA   $0000
         PEI   $09
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         PEA   $0000
         LDX   L0240D0
         LDA   L0240CE
         PHA
         LDX   L0240FE
         LDA   L0240FC
         PHX
         PHA
         _NewList2
         PEA   $B202
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $09
         BNE   L023726
         BRL   L0239C8
L023726  PEA   $0000
         PEA   $0000
         LDX   L0240FE
         LDA   L0240FC
         PHX
         PHA
         _SortList2
         PEA   $B204
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0001
         STA   $07
         LDA   $12
         ORA   $14
         BEQ   L0237BF
L023755  LDX   L0240D0
         LDA   L0240CE
         SEC
         SBC   $07
         BVS   L023763
         EOR   #$8000
L023763  BPL   L0237BF
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $07
         DEC
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023798
         DEX
L023798  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         CMP   $12
         BNE   L0237B9
         CPX   $14
L0237B9  BEQ   L0237BF
         INC   $07
         BRA   L023755
L0237BF  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PLY
         STY   $01
         CMP   $01
         BCC   L023805
         LDA   #$0001
         STA   $09
         BRL   L023890
L023805  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         SEC
         SBC   $01,S
         PLX
         STA   $01
         LDA   $07
         CMP   $01
         BEQ   L02384A
         BCS   L02384C
L02384A  BRA   L02388C
L02384C  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001C
         LDA   [$01],Y
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         SEC
         SBC   $01,S
         PLX
         INC
         STA   $09
         BRA   L023890
L02388C  LDA   $07
         STA   $09
L023890  LDA   #$0001
         STA   $05
L023895  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         CMP   $05
         BCC   L023921
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $05
         DEC
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0238E7
         DEX
L0238E7  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0004
         PLX
         STA   $01
         STX   $03
         PEI   $07
         LDA   $05
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L023909
         LDA   #$0001
L023909  EOR   #$0001
         BNE   L023913
         LDA   #$0000
         BRA   L023916
L023913  LDA   #$0080
L023916  SEP   #$20
         STA   [$01]
         REP   #$20
         INC   $05
         BRL   L023895
L023921  PEA   $0000
         PEA   $0000
         PEI   $09
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         TAX
         LDY   #$0030
         LDA   [$01],Y
         PHX
         PHA
         PEA   $0000
         LDX   L0240D0
         LDA   L0240CE
         PHA
         LDX   L0240FE
         LDA   L0240FC
         PHX
         PHA
         _NewList2
         PEA   $B206
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $07
         DEC
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0239A7
         DEX
L0239A7  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         STX   L0240DE+2
         STA   L0240DE
L0239C8  LDX   $0D
         LDA   $0B
         PHX
         PHA
         _SetPort
         LDA   $10
         STA   $14
         LDA   $0F
         STA   $13
         PLD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L0239E8  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   #$0001
         STA   $09
         LDA   L0240D2
         BNE   L0239FD
         BRL   L023A94
L0239FD  LDA   L0240C6
         STA   $0B
         LDA   #$0000
         STA   $07
L023A07  LDA   L0240D2
         CMP   $07
         BEQ   L023A10
         BCS   L023A12
L023A10  BRA   L023A66
L023A12  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $07
         LDX   #$0007
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023A44
         DEX
L023A44  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         CMP   $10
         BNE   L023A62
         LDA   #$0000
         STA   $09
L023A62  INC   $07
         BRA   L023A07
L023A66  LDA   $09
         CMP   #$0001
         BNE   L023A79
         JSL   L022467
         PEI   $0B
         JSL   L02333E
         BRA   L023A92
L023A79  LDA   $10
         CMP   $0B
         BNE   L023A92
         PEA   $0000
         PEI   $10
         JSL   L0229B5
         LDX   $14
         LDA   $12
         PHX
         PHA
         JSL   L023681
L023A92  BRA   L023A98
L023A94  JSL   L02242F
L023A98  LDA   #$0000
         STA   $05
         LDA   $0E
         STA   $14
         LDA   $0D
         STA   $13
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         RTL

L023AB0  TSC
         SEC
         SBC   #$0014
         TCS
         PHD
         TCD
         _WaitCursor
         LDA   L0240C6
         STA   $0B
         LDX   L0240DE+2
         LDA   L0240DE
         STX   $13
         STA   $11
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $B702
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $07
         PEA   $B703
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEI   $18
         _CountResources
         PLA
         STA   $0D
         PLA
         STA   $0F
         PEA   $B704
         JSL   L02CA27
         PHA
         JSL   L027CEB
         JSL   L0202F5
         _InitCursor
         LDA   $18
         CMP   $0B
         BNE   L023B76
         LDA   $0D
         ORA   $0F
         BEQ   L023B70
         PEA   $0000
         PEI   $18
         JSL   L0229B5
         LDX   $1C
         LDA   $1A
         LDY   #$0000
         CMP   $11
         BNE   L023B58
         CPX   $13
L023B58  BNE   L023B5B
         INY
L023B5B  TYA
         BNE   L023B64
         PEI   $13
         PEI   $11
         BRA   L023B6A
L023B64  PEA   $0000
         PEA   $0000
L023B6A  JSL   L023681
         BRA   L023B74
L023B70  JSL   L02242F
L023B74  BRA   L023B9F
L023B76  LDA   $0D
         ORA   $0F
         BNE   L023B9F
         JSL   L022467
         PEI   $18
         LDA   $0B
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L023B8E
         LDA   #$0001
L023B8E  EOR   #$0001
         BNE   L023B97
         LDA   $0B
         BRA   L023B9A
L023B97  LDA   #$0000
L023B9A  PHA
         JSL   L02333E
L023B9F  LDA   #$0000
         STA   $05
         LDA   $16
         STA   $1C
         LDA   $15
         STA   $1B
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         TYA
         RTL

L023BB7  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         LDA   L02410E
         PHA
         _DisposeAll
         JSL   L02CA27
         TAX
         BEQ   L023BDE
         _SysBeep
L023BDE  LDA   #$0000
         STA   L0240D2
         STZ   L0240D0
         STZ   L0240CE
         LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         PHA
         LDA   [$01]
         CLC
         ADC   #$0030
         STA   $01
         PLA
         STA   $03
         LDA   #$0000
         STA   [$01]
         STA   [$01],Y
         PLD
         TSC
         CLC
         ADC   #$0004
         TCS
         RTL

L023C33  TSC
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         LDA   L0240D2
         BEQ   L023C43
         LDA   #$0001
L023C43  EOR   #$0001
         BEQ   L023C57
         LDA   #$0000
         STA   L0240C6
         STZ   L0240DE+2
         STZ   L0240DE
         BRL   L023D4F
L023C57  LDA   $0A
         BEQ   L023C5E
         LDA   #$0001
L023C5E  EOR   #$0001
         BNE   L023C66
         BRL   L023CE6
L023C66  LDX   L024106
         LDA   L024104
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         PHA
         PEA   $0000
         LDX   L024106
         LDA   L024104
         PHX
         PHA
         _NextMember2
         PLA
         DEC
         LDX   #$0007
         JSL   L02DDD6
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0005
         LDA   [$01],Y
         STA   $05
         PEA   $B902
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   L0240C6
         CMP   $05
         BEQ   L023CE6
         LDA   $05
         STA   L0240C6
         PEA   $0001
         LDA   L0240C6
         PHA
         JSL   L0229B5
         PEA   $0000
         PEA   $0000
         JSL   L023681
L023CE6  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         PHA
         PEA   $0000
         LDX   L0240FE
         LDA   L0240FC
         PHX
         PHA
         _NextMember2
         PLA
         DEC
         LDX   #$000B
         JSL   L02DDD6
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         STX   L0240DE+2
         STA   L0240DE
         PEA   $B904
         JSL   L02CA27
         PHA
         JSL   L027CEB
L023D4F  LDA   $08
         STA   $0A
         LDA   $07
         STA   $09
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         RTL

L023D5F  TSC
         SEC
         SBC   #$002C
         TCS
         PHD
         TCD
         LDA   #$0000
         STA   $21
         STA   $23
         PHA
         _GetCurResourceFile
         PLA
         STA   $0D
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0B
         PHA
         PHA
         PEI   $30
         _CountResources
         PLA
         STA   $1D
         PLA
         STA   $1F
         PEI   $1F
         PEI   $1D
         PEA   $0000
         PEA   $0044
         JSL   L02DBC3
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L023DC7
         DEX
L023DC7  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $19
         PLA
         STA   $1B
         PHA
         PHA
         LDX   $1B
         LDA   $19
         PHX
         PHA
         LDA   L02410E
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $25
         PLA
         STA   $27
         PEA   $BA10
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STX   $09
         STA   $07
         PEI   $09
         PEI   $07
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L023E25
         DEX
L023E25  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $07
         PLA
         STA   $09
         LDA   #$0000
         STA   $0F
L023E3A  PEI   $1F
         PEI   $1D
         LDA   $0F
         LDX   #$0000
         TAY
         BPL   L023E47
         DEX
L023E47  PHX
         PHA
         JSL   L02D6DE
         BNE   L023E52
         BRL   L023F4F
L023E52  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023E84
         DEX
L023E84  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0009
         LDA   [$01],Y
         BNE   L023E9E
         BRL   L023F4A
L023E9E  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023ED0
         DEX
L023ED0  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $0F
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L023F19
         DEX
L023F19  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         PHX
         PHA
         LDX   $09
         LDA   $07
         PHX
         PHA
         JSL   L0300C8
         STX   $09
         STA   $07
         INC   $21
         BNE   L023F4A
         INC   $23
L023F4A  INC   $0F
         BRL   L023E3A
L023F4F  LDA   $21
         ORA   $23
         BNE   L023F68
         LDX   $27
         LDA   $25
         PHX
         PHA
         _DisposeHandle
         BRL   L024091
L023F68  LDA   $30
         LDX   #$0000
         CLC
         ADC   #$0000
         STA   $11
         TXA
         ADC   #$0001
         STA   $13
         LDX   $23
         LDA   $21
         PHX
         PHA
         LDY   #$0002
         LDA   [$25],Y
         PHA
         LDA   [$25]
         CLC
         ADC   #$0002
         STA   $01
         PLA
         STA   $03
         PLA
         STA   [$01]
         PLA
         STA   [$01],Y
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $01
         STX   $03
         LDA   #$0001
         STA   [$01]
         LDA   [$25],Y
         TAX
         LDA   [$25]
         PHX
         PHA
         LDX   $09
         LDA   $07
         PHX
         PHA
         SEC
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         STA   $19
         PLA
         STA   $1B
         LDX   $1B
         LDA   $19
         PHX
         PHA
         LDX   $27
         LDA   $25
         PHX
         PHA
         _SetHandleSize
         PEA   $BA12
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $FFFF
         PEA   $8014
         LDX   $13
         LDA   $11
         PHX
         PHA
         _ReleaseResource
         PEA   $8014
         LDX   $13
         LDA   $11
         PHX
         PHA
         _RemoveResource
         LDX   $27
         LDA   $25
         PHX
         PHA
         PEA   $0000
         PEA   $8014
         LDX   $13
         LDA   $11
         PHX
         PHA
         _AddResource
         PEA   $BA20
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $8014
         LDX   $13
         LDA   $11
         PHX
         PHA
         _WriteResource
         PEA   $BA21
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $FFFF
         PEA   $8014
         LDX   $13
         LDA   $11
         PHX
         PHA
         _ReleaseResource
         PEA   $BA22
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #L024394
         STA   $29
         LDA   #^L024394
         STA   $2B
         PEI   $2B
         PEI   $29
         LDA   [$29]
         ORA   #$8000
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L024091  PEI   $0D
         _SetCurResourceFile
         PHA
         PEI   $0B
         _SetResourceFileDepth
         PLA
         STA   $0B
         LDA   #$0000
         STA   $05
         LDA   $2E
         STA   $30
         LDA   $2D
         STA   $2F
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         TYA
         RTL

         DB    $00
L0240C6  DB    $00
         DB    $00
L0240C8  DB    $00
         DB    $00
L0240CA  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0240CE  DB    $00
         DB    $00
L0240D0  DB    $00
         DB    $00
L0240D2  DB    $00
         DB    $00
L0240D4  DB    $00
         DB    $00
L0240D6  DB    $00
         DB    $00
L0240D8  DB    $00
         DB    $00
L0240DA  DB    $00
         DB    $00
L0240DC  DB    $00
         DB    $00
L0240DE  ADRL  $00000000
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0240E8  DB    $00
         DB    $00
L0240EA  DB    $00
         DB    $00
L0240EC  DB    $00
         DB    $00
L0240EE  DB    $00
         DB    $00
L0240F0  DB    $00
         DB    $00
L0240F2  DB    $00
         DB    $00
L0240F4  DB    $00
         DB    $00
L0240F6  DB    $00
         DB    $00
L0240F8  DB    $00
         DB    $00
L0240FA  DB    $00
         DB    $00
L0240FC  DB    $00
         DB    $00
L0240FE  DB    $00
         DB    $00
L024100  DB    $00
         DB    $00
L024102  DB    $00
         DB    $00
L024104  DB    $00
         DB    $00
L024106  DB    $00
         DB    $00
L024108  DB    $00
         DB    $00
L02410A  DB    $00
         DB    $00
L02410C  DB    $00
         DB    $00
L02410E  DB    $00
         DB    $00
L024110  DB    $00
         DB    $00

L024112  ENT
         DW    $0000
L024114  ADRL  $000000
L024118  DW    $000F      ; pCount
         ADRL  $00000003  ; ID
         DW    $0011      ; rect
         DW    $000A
         DW    $004F
         DW    $00D2
         ADRL  $89000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0000      ; listSize
         DW    $0000      ; listView
         DW    $0002      ; listType
         DW    $0000      ; listStart
         ADRL  $00000000  ; listDraw
         DW    $000A      ; listMemHeight
         DW    $0007      ; listMemSize
         ADRL  $00000000  ; listRef
         ADRL  $00000000  ; colorTableRef

*L02414A  STRL  ':Genesys.2:Gen.Lang'
L02414A  STRL  '@:Gen.Lang'

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02424B  STRL  '@:Gen.Edit'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*--- The buffer that is passed to the editor

L02434C  DW    $0000      ; 00 event code
L02434E  ADRL  $00000000  ; 02 event message
         ADRL  $00000000  ; 06 tick count
L024356  DW    $0000      ; 0A mouse location
L024358  DW    $0000	  ; 0C
L02435A  DW    $0000      ; 0E modifiers
L02435C  ADRL  $00000000  ; 10 task data
L024360  ADRL  $00000000  ; 14 task mask
         ADRL  $00000000  ; 18
L024368  DW    $0000	  ; 1C
L02436A  ADRL  $00000000  ; 1E control to handle
L02436E  DW    $0000      ; 22 
         DW    $0000	  ; 
L024372  DW    $0000	  ; 26 $0001 or $1002 or $1003
         DW    $0000	  ; 
         DW    $0000	  ; 
         DW    $0000	  ; 
L02437A  ADRL  $00000000  ; 2E source pointer of data to be copied ($20 bytes) (STR 'Version')
L02437E  ADRL  $00000000  ; 32 another pointer (STR 'VERSIONS_01234567')
L024382  DW    $0000	  ; 36
L024384  ADRL  $00000000  ; 38 window pointer?
L024388  DW    $0000	  ; 3C memory ID
L02438A  DW    $0000	  ; 3E command
L02438C  DW    $0000	  ; 40 Y-coord
L02438E  DW    $0000	  ; 42 X-coord
         DW    $0000	  ; 
         DW    $0000      ; 
L024394  DW    $0000	  ; 48
L024396  DW    $0000	  ; 4A TaskMaster result
         DW    $0000	  ; 
L02439A  DW    $0000	  ; 4E Resource file ID
L02439C  DW    $0000	  ; 50 Resource type
L02439E  ADRL  $00000000  ; 52 Resource ID

*--- Perhaps the end of the buffer

L0243A2  ADRL  $00000000  ; 56 Routine that shows coordinates
L0243A6  ADRL  $00000000  ; 5A Routine that shows the grid?
L0243AA  ADRL  $00000000  ; 5E Routine that displays the error?
L0243AE  DW    $0000	  ; 60 Resource file ID

L0243B0  STRL  '@:Gen.Lang'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0244B1  STRL  '3:ScratchFile'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0245B2  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0245B6  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0245BA  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0245BE  STRL  '@:Gen.Data'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0246BF  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L024741  STR   ' Add '
         DB    $00
L024748  STRL  '3:DefaultFile'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L024849  DB    $00
         DB    $00
L02484B  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02494D  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02496D  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02498D  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0249AD  DB    $00
         DB    $00
L0249AF  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L024D2D  STRL  '@:Gen.Work'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L024E2E  DB    $00
         DB    $00
L024E30  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L024F32  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L025732  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0257B2  DB    $00
         DB    $00
L0257B4  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0257BA  DW    $000F      ; pCount
         ADRL  $00000004  ; ID
         DW    $0011      ; rect
         DW    $00F5
         DW    $004F
         DW    $01BD
         ADRL  $89000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0000      ; listSize
         DW    $0000      ; listView
         DW    $0002      ; listType
         DW    $0000      ; listStart
         ADRL  $00000000  ; listDraw
         DW    $000A      ; listMemHeight
         DW    $000B      ; listMemSize
         ADRL  $00000000  ; listRef
         ADRL  $00000000  ; colorTableRef
L0257EC  DB    $00
         DB    $00
L0257EE  DB    $00
         DB    $00
L0257F0  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0257F4  DB    $00
         DB    $00
         DB    $2C
         DB    $01
         DB    $00
         DB    $00
         ADRL  L024741
L0257FE  DB    $00
         DB    $00
L025800  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0258FE  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02597E  TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         LDA   L025C96	; AV 202010 - number of recognized resources
         STA   $09
L02598B  LDA   $09
         BMI   L0259DE
         LDX   #$000A
         JSL   L02DDD6
         TAX
         LDA   L025DCA,X
         CMP   $0E
         BNE   L0259DA
         LDA   $10
         LDX   #$0000
         CMP   #$0000
         BEQ   L0259A9
         INX
L0259A9  TXA
         BNE   L0259C0
         LDA   $09
         LDX   #$000A
         JSL   L02DDD6
         TAX
         LDY   L025DD0+2,X
         LDA   L025DD0,X
         PHY
         PHA
         BRA   L0259D2
L0259C0  LDA   $09
         LDX   #$000A
         JSL   L02DDD6
         TAX
         LDY   L025DCC+2,X
         LDA   L025DCC,X
         PHY
         PHA
L0259D2  PLA
         STA   $05
         PLA
         STA   $07
         BRA   L025A12
L0259DA  DEC   $09
         BRA   L02598B
L0259DE  LDA   $10
         BEQ   L0259F6
         PEI   $0E
         PEA   ^L025DB8
         PEA   L025DB8
         PEA   ^L025D98
         PEA   L025D98
         JSL   L02C68C
         BRA   L025A08
L0259F6  PEI   $0E
         PEA   ^L025F5A
         PEA   L025F5A
         PEA   ^L025D98
         PEA   L025D98
         JSL   L02C68C
L025A08  LDA   #L025D98
         STA   $05
         LDA   #^L025D98
         STA   $07
L025A12  LDA   $0C
         STA   $10
         LDA   $0B
         STA   $0F
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L025A27  ENT
         TSC
         SEC
         SBC   #$002C
         TCS
         PHD
         TCD
         PHA
         _GetCurResourceFile
         PLA
         STA   $0F
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0D
         LDA   #$FFFF
         STA   L025C94
         SEP   #$20
         LDA   #$00
         STA   L025C98
         REP   #$20
         LDA   $30
         LDX   #$0000
         CLC
         ADC   #$0000
         STA   $15
         TXA
         ADC   #$0001
         STA   $17
         PHA
         PHA
         PEA   $8014
         LDX   $17
         LDA   $15
         PHX
         PHA
         _LoadResource
         PLA
         STA   $25
         PLA
         STA   $27
         JSL   L02CA27
         STA   $11
         PEI   $0F
         _SetCurResourceFile
         PHA
         PEI   $0D
         _SetResourceFileDepth
         PLA
         STA   $0D
         LDA   $11
         LDX   #$0000
         CMP   #$0000
         BNE   L025AC4
         INX
L025AC4  TXA
         CMP   #$0000
         BEQ   L025AEA
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $01
         STX   $03
         LDA   [$01]
         LDX   #$0000
         CMP   #$0001
         BNE   L025AE1
         INX
L025AE1  TXA
         CMP   #$0000
         BEQ   L025AEA
         LDA   #$0001
L025AEA  TAX
         BNE   L025AF0
         BRL   L025C2F
L025AF0  LDY   #$0002
         LDA   [$25],Y
         PHA
         LDA   [$25]
         CLC
         ADC   #$0006
         STA   $21
         PLA
         STA   $23
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         TAX
         LDY   #$0002
         LDA   [$01],Y
         STX   $1B
         STA   $19
L025B19  PEI   $1B
         PEI   $19
         PEA   $0000
         PEA   $0000
         JSL   L02D6DE
         BNE   L025B2C
         BRL   L025C19
L025B2C  LDY   #$0004
         LDX   #$0009
         TYA
         CLC
         ADC   $21
         STA   $00,X
         LDA   $23
         ADC   #$0000
         STA   $02,X
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         CMP   $32
         BNE   L025B4D
         CPX   $34
L025B4D  BEQ   L025B52
         BRL   L025BD9
L025B52  LDA   #$0000
         STA   $11
         LDA   [$09]
         AND   #$00FF
         STA   $13
L025B5E  LDA   $13
         SEC
         SBC   $11
         BEQ   L025B6C
         BVS   L025B6A
         EOR   #$8000
L025B6A  BMI   L025B6E
L025B6C  BRA   L025BCC
L025B6E  LDX   $11
         TXA
         CLC
         ADC   #L025C98
         PEA   ^L025C98
         PHA
         INC   $09
         BNE   L025B7F
         INC   $0B
L025B7F  PEI   $0B
         LDA   $09
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         TAX
         LDA   L02C277,X
         AND   #$00FF
         AND   #$0010
         CMP   #$0000
         BEQ   L025BB0
         LDA   $36
         LDX   #$0000
         CMP   #$0000
         BEQ   L025BA7
         INX
L025BA7  TXA
         CMP   #$0000
         BEQ   L025BB0
         LDA   #$0001
L025BB0  TAX
         BNE   L025BBA
         LDA   [$09]
         AND   #$00FF
         BRA   L025BBC
L025BBA  LDA   $36
L025BBC  PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         INC   $11
         BRA   L025B5E
L025BCC  LDX   $11
         SEP   #$20
         LDA   #$00
         STA   L025C98,X
         REP   #$20
         BRA   L025C19
L025BD9  STZ   $2B
         TDC
         CLC
         ADC   #$0021
         STA   $29
         LDA   [$09]
         AND   #$00FF
         CLC
         ADC   #$0005
         LDX   #$0000
         TAY
         BPL   L025BF2
         DEX
L025BF2  PHX
         PHA
         LDY   #$0002
         LDA   [$29],Y
         PHA
         LDA   [$29]
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   [$29]
         PLA
         STA   [$29],Y
         LDA   $19
         BNE   L025C14
         DEC   $1B
L025C14  DEC   $19
         BRL   L025B19
L025C19  PEA   $FFFF
         PEA   $8014
         LDX   $17
         LDA   $15
         PHX
         PHA
         _ReleaseResource
L025C2F  LDA   L025C98
         AND   #$00FF
         BNE   L025C74
         LDA   #$0000
         STA   L025C94
         LDX   $34
         LDA   $32
         PHX
         PHA
         LDA   $36
         LDX   #$0000
         CMP   #$0000
         BEQ   L025C4E
         INX
L025C4E  TXA
         BNE   L025C56
         LDA   #$005F
         BRA   L025C58
L025C56  LDA   $36
L025C58  PHA
         PEA   $0001
         PEI   $30
         JSL   L02597E
         PHX
         PHA
         PEA   ^L025DBF
         PEA   L025DBF
         PEA   ^L025C98
         PEA   L025C98
         JSL   L02C68C
L025C74  LDA   #L025C98
         STA   $05
         LDA   #^L025C98
         STA   $07
         LDA   $2E
         STA   $36
         LDA   $2D
         STA   $35
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0034
         TCS
         TYA
         RTL

         DB    $00
L025C94  DW    $0000

*--- Number of recognized resource types

L025C96  DW    51	; AV 202010 - was $27

L025C98  DS    $100
L025D98  DS    $20
L025DB8  ASC   'R%0.4X'00
L025DBF  ASC   '%s%c%0.8lX'00

L025DCA  DW    $8001
L025DCC  ADRL  L025F67
L025DD0  ADRL  L025F6C
         DW    $8002
         ADRL  L025F71
         ADRL  L025F79
         DW    $8003
         ADRL  L025F81
         ADRL  L025F88
         DW    $8004
         ADRL  L025F95
         ADRL  L025F9C
         DW    $8005
         ADRL  L025FA4
         ADRL  L025FAC
         DW    $8006
         ADRL  L025FBC
         ADRL  L025FC1
         DW    $8007
         ADRL  L025FCF
         ADRL  L025FD6
         DW    $8008
         ADRL  L025FE2
         ADRL  L025FEA
         DW    $8009
         ADRL  L025FF3
         ADRL  L025FF8
         DW    $800A
         ADRL  L025FFD
         ADRL  L026006
         DW    $800B
         ADRL  L026010
         ADRL  L026019
         DW    $800C
         ADRL  L02602B
         ADRL  L026033
         DW    $800D
         ADRL  L026044
         ADRL  L02604D
         DW    $800E
         ADRL  L02605B
         ADRL  L026063
         DW    $800F
         ADRL  L02606A
         ADRL  L026072
         DW    $8010
         ADRL  L026082
         ADRL  L026089
         DW    $8011
         ADRL  L026096
         ADRL  L02609D
         DW    $8012
         ADRL  L0260A8
         ADRL  L0260B1
         DW    $8013
         ADRL  L0260BD
         ADRL  L0260C4
         DW    $8014
         ADRL  L0260CF
         ADRL  L0260D5
         DW    $8015
         ADRL  L0260E3
         ADRL  L0260E9
         DW    $8016
         ADRL  L0260F6
         ADRL  L0260FA
         DW    $8017
         ADRL  L0260FF
         ADRL  L026104
         DW    $8018
         ADRL  L026112
         ADRL  L02611B
         DW    $8019
         ADRL  L026120
         ADRL  L026128
         DW    $801A
         ADRL  L026132
         ADRL  L02613B
         DW    $801B
         ADRL  L026145
         ADRL  L02614E
         DW    $801C
         ADRL  L026158
         ADRL  L02615F
         DW    $801D
         ADRL  L026168
         ADRL  L02616D
         DW    $801E
         ADRL  L026176
         ADRL  L02617B
         DW    $801F
         ADRL  L026180
         ADRL  L026185
         DW    $8020
         ADRL  L02618A
         ADRL  L026191
         DW    $8021
         ADRL  L02619E
         ADRL  L0261A5
         DW    $8022
         ADRL  L0261B5
         ADRL  L0261BA
         DW    $8023
         ADRL  L0261C3
         ADRL  L0261CC
         DW    $8024
         ADRL  L0261DD
         ADRL  L0261E4
         DW    $8025
         ADRL  L0261F1
         ADRL  L0261F9
         DW    $8026
         ADRL  L026202
         ADRL  L026207
         DW    $8027
         ADRL  L026212
         ADRL  L026219
	 dw	$8028
	 adrl	strITEMSTRUCT1
	 adrl	strITEMSTRUCT2
	 dw	$8029
	 adrl	strVERSION1
	 adrl	strVERSION2
	 dw	$802A
	 adrl	strCOMMENT1
	 adrl	strCOMMENT2
	 dw	$802B
	 adrl	strBUNDLE1
	 adrl	strBUNDLE2
	 dw	$802C
	 adrl	strFINDERPATH1
	 adrl	strFINDERPATH2
	 dw	$802D
	 adrl	strPALETTEWINDOW1
	 adrl	strPALETTEWINDOW2
	 dw	$802E
	 adrl	strTAGGEDSTR1
	 adrl	strTAGGEDSTR2
	 dw	$802F
	 adrl	strPATTERNLIST1
	 adrl	strPATTERNLIST2
	 dw	$8102
	 adrl	strHYPERCARD1
	 adrl	strHYPERCARD2
         DW    $C001
         ADRL  L026220
         ADRL  L026228
	 dw	$c002
	 adrl	strPRINTRECORD1
	 adrl	strPRINTRECORD2
	 dw	$c003
	 adrl	strFONT1
	 adrl	strFONT2
	 dw	$DEAD
	 adrl	strVERSIONS1
	 adrl	strVERSIONS2

strITEMSTRUCT1	asc	'ITEMSTRUCT'00
strITEMSTRUCT2	asc	'Item Structure'00
strVERSION1	asc	'VERSION'00
strVERSION2	asc	'Version'00
strCOMMENT1	asc	'COMMENT'00
strCOMMENT2	asc	'Comment'00
strBUNDLE1	asc	'BUNDLE'00
strBUNDLE2	asc	'Bundle'00
strFINDERPATH1	asc	'FINDERPATH'00
strFINDERPATH2	asc	'Finder Path'00
strPALETTEWINDOW1	asc	'PALETTEWINDOW'00
strPALETTEWINDOW2	asc	'Palette Window'00
strTAGGEDSTR1	asc	'TAGGEDSTRINGS'00
strTAGGEDSTR2	asc	'Tagged Strings'00
strPATTERNLIST1	asc	'PATTERNLIST'00
strPATTERNLIST2	asc	'Pattern List'00
strHYPERCARD1	asc	'HYPERCARD'00
strHYPERCARD2	asc	'Hypercard'00
strPRINTRECORD1	asc	'PRINTRECORD'00
strPRINTRECORD2	asc	'Print Record'00
strFONT1	asc	'FONT'00
strFONT2	asc	'Font'00
strVERSIONS1	asc	'UPDATEINFO'00
strVERSIONS2	asc	'Update Info'00

L025F5A  ASC   'rType $%0.4X'00
L025F67  ASC   'ICON'00
L025F6C  ASC   'Icon'00
L025F71  ASC   'PICTURE'00
L025F79  ASC   'Picture'00
L025F81  ASC   'CTLLST'00
L025F88  ASC   'Control List'00
L025F95  ASC   'CTLTMP'00
L025F9C  ASC   'Control'00
L025FA4  ASC   'C1INPUT'00
L025FAC  ASC   'C1 Input String'00
L025FBC  ASC   'PSTR'00
L025FC1  ASC   'Pascal String'00
L025FCF  ASC   'STRLST'00
L025FD6  ASC   'String List'00
L025FE2  ASC   'MENUBAR'00
L025FEA  ASC   'Menu Bar'00
L025FF3  ASC   'MENU'00
L025FF8  ASC   'Menu'00
L025FFD  ASC   'MENUITEM'00
L026006  ASC   'Menu Item'00
L026010  ASC   'LETXTBOX'00
L026019  ASC   'LETextBox2 String'00
L02602B  ASC   'CTLPROC'00
L026033  ASC   'Control Def Proc'00
L026044  ASC   'CTLCOLOR'00
L02604D  ASC   'Control Color'00
L02605B  ASC   'WPARAM1'00
L026063  ASC   'Window'00
L02606A  ASC   'WPARAM2'00
L026072  ASC   'Window (custom)'00
L026082  ASC   'WCOLOR'00
L026089  ASC   'Window Color'00
L026096  ASC   'TXTBLK'00
L02609D  ASC   'Text Block'00
L0260A8  ASC   'STYLEBLK'00
L0260B1  ASC   'Style Block'00
L0260BD  ASC   'TSTART'00
L0260C4  ASC   'Tool Table'00
L0260CF  ASC   'RNAME'00
L0260D5  ASC   'Resource Name'00
L0260E3  ASC   'ALERT'00
L0260E9  ASC   'Alert String'00
L0260F6  ASC   'TXT'00
L0260FA  ASC   'Text'00
L0260FF  ASC   'CODE'00
L026104  ASC   'Code Resource'00
L026112  ASC   'CDEVCODE'00
L02611B  ASC   'CDev'00
L026120  ASC   'CDEVFLG'00
L026128  ASC   'CDev Flag'00
L026132  ASC   'TWORECTS'00
L02613B  ASC   'Two Rects'00
L026145  ASC   'FILETYPE'00
L02614E  ASC   'File Type'00
L026158  ASC   'LSTREF'00
L02615F  ASC   'List Ref'00
L026168  ASC   'CSTR'00
L02616D  ASC   'C String'00
L026176  ASC   'XCMD'00
L02617B  ASC   'XCmd'00
L026180  ASC   'XFCN'00
L026185  ASC   'XFcn'00
L02618A  ASC   'ERRSTR'00
L026191  ASC   'Error String'00
L02619E  ASC   'KEYTBL'00
L0261A5  ASC   'Key Trans Table'00
L0261B5  ASC   'WSTR'00
L0261BA  ASC   'W String'00
L0261C3  ASC   'C1OUTPUT'00
L0261CC  ASC   'C1 Output String'00
L0261DD  ASC   'SSOUND'00
L0261E4  ASC   'Sound Sample'00
L0261F1  ASC   'TERULER'00
L0261F9  ASC   'TE Ruler'00
L026202  ASC   'FSEQ'00
L026207  ASC   'F Sequence'00
L026212  ASC   'CURSOR'00
L026219  ASC   'Cursor'00
L026220  ASC   'RECTLST'00
L026228  ASC   'Rect List'00

L026232  PHB
         PHD
         PHK
         PLB
         PEA   ^L02629F
         PEA   L02629F
         PEA   ^L0262AB
         PEA   L0262AB
         JSL   L0265A0
         JSL   L0266C1
         BCS   L026293
         BRA   L026284

L02624E  PHB
         PHD
         PHK
         PLB
         PEA   ^L02629F
         PEA   L02629F
         PEA   ^L0262AB
         PEA   L0262AB
         JSL   L0265A0
         JSL   L0266C1
         BCS   L026293
         _WaitCursor
         PEA   ^L024748
         PEA   L024748
         PEA   ^L0244B1
         PEA   L0244B1
         JSL   L026748
         CMP   #$0000
         BNE   L026293
L026284  JSL   L02691A
         PHA
         LDA   L024394
         ORA   #$8080
         STA   L024394
         PLA
L026293  PHA
         _InitCursor
         PLA
         PLD
         PLB
         RTL

L02629F  STRL  '8:Untitled'
L0262AB  STRL  'Untitled'

L0262B5  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $0078
         PEA   $001E
         PEA   $0000
         PEA   ^L021CBB
         PEA   L021CBB
         PEA   ^L026A82
         PEA   L026A82
         PEA   $0000
         PEA   $0000
         PEA   ^L021A64
         PEA   L021A64
         _SFGetFile2
         LDX   #$4002
         JSL   L027D42
         _SetPort
         LDA   L021A64
         BEQ   L026337
         _WaitCursor
         PEA   ^L021A9C
         PEA   L021A9C
         PEA   ^L021A7A
         PEA   L021A7A
         JSL   L0265A0
         JSL   L0266C1
         BCS   L026337
         PEA   ^L021964
         PEA   L021964
         PEA   ^L0244B1
         PEA   L0244B1
         JSL   L026748
         CMP   #$0000
         BNE   L026343
L026333  JSL   L02691A
L026337  PHA
         _InitCursor
         PLA
         PLD
         PLB
         RTL

L026343  CMP   #$004C
         BNE   L026337
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0006
         _AlertWindow
         PLA
         BEQ   L026369
         LDA   #$0000
         BRA   L026337
L026369  PEA   $0000
         PEA   $0001
         PEA   $005E
         PEA   $00C3
         PEA   ^L021964
         PEA   L021964
         _CreateResourceFile
         BCS   L026337
         JSL   L0266C1
         BCS   L026337
         BRA   L026333

L02638C  PHB
         PHD
         PHK
         PLB
         LDA   L024394
         AND   #$0080
         BNE   L02639F
         BRL   L026436

L02639B  PHB
         PHD
         PHK
         PLB
L02639F  PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $00A0
         PEA   $001E
         PEA   $0000
         PEA   ^L021CAC
         PEA   L021CAC
         PEA   $0000
         PEA   ^L021944
         PEA   L021944
         PEA   ^L021A64
         PEA   L021A64
         _SFPutFile2
         LDX   #$4202
         JSL   L027D42
         _SetPort
         LDA   L021A64
         BNE   L0263EA
         LDY   #$FFFF
         BRL   L0264D5
L0263EA  PEA   ^L021A9C
         PEA   L021A9C
         PEA   ^L021A7A
         PEA   L021A7A
         JSL   L0265A0
         PEA   ^L0218C1
         PEA   L0218C1
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _SetWTitle
         PEA   $0000
         PEA   $0001
         PEA   $005E
         PEA   $00C3
         PEA   ^L021964
         PEA   L021964
         _CreateResourceFile
         BEQ   L026436
         CMP   #$1E01
         BEQ   L026436
         LDX   #$4210
         JSL   L027D42
L026436  JSL   L026DDA
         _WaitCursor
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   ^L021D25
         PEA   L021D25
         JSL   L026E07
         STA   L021D21
         STX   L021D23
         LDA   L0240D6
         PHA
         _CloseResourceFile
         LDX   #$4214
         JSL   L027D42
         PEA   ^L0244B1
         PEA   L0244B1
         PEA   ^L021964
         PEA   L021964
         JSL   L026748
         JSL   L030000
         PEA   $0000
         PEA   $0003
         PEA   $0000
         PEA   $0000
         PEA   ^L0244B1
         PEA   L0244B1
         _OpenResourceFile
         LDX   #$4216
         JSL   L027D42
         PLA
         STA   L0240D6
         JSL   L0202F5
         LDA   L021D23
         PHA
         LDA   L021D21
         PHA
         _CloseDialog
         _InitCursor
         _SetPort
         LDA   L024394
         AND   #$7F7F
         STA   L024394
         LDY   #$0000
L0264D5  LDA   #$0000
         PLD
         PLB
         RTL

L0264DB  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0004
         _AlertWindow
         PLA
         BEQ   L026501
         LDA   #$0000
         PLD
         PLB
         RTL

L026501  JSL   L026BF7
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   ^L021D60
         PEA   L021D60
         JSL   L026E07
         STA   L021D21
         STX   L021D23
         LDA   L0240D6
         PHA
         _CloseResourceFile
         LDX   #$4302
         JSL   L027D42
         PEA   ^L021964
         PEA   L021964
         PEA   ^L0244B1
         PEA   L0244B1
         JSL   L026748
         JSL   L030000
         PEA   $0000
         PEA   $0003
         PEA   $0000
         PEA   $0000
         PEA   ^L0244B1
         PEA   L0244B1
         _OpenResourceFile
         LDX   #$4304
         JSL   L027D42
         PLA
         STA   L0240D6
         JSL   L0202F5
         JSL   L026A11
         LDA   L021D23
         PHA
         LDA   L021D21
         PHA
         _CloseDialog
         _InitCursor
         _SetPort
         LDA   L024394
         AND   #$7FFF
         STA   L024394
         LDA   #$0000
         PLD
         PLB
         RTL

L0265A0  PHB
         PHD
         PHK
         PLB
         TSC
         PHA
         PLD
         LDA   [$0B]
         TAY
L0265AA  LDA   [$0B],Y
         TYX
         STAL  L021964,X
         DEY
         BEQ   L0265AA
         DEY
         BPL   L0265AA
         LDA   [$07]
         PHA
         TAY
         CLC
         STA   L021944
         STA   L021904
         STA   L021924
         STA   L0218AF
         ADC   #$2002
         STA   L0218C1
         ADC   #$2805
         STA   L0218D4
         ADC   #$0B00
         STA   L0218EC
         INC   $07
         INC   $07
L0265DE  LDA   [$07],Y
         TYX
         STAL  L021944+2,X
         STAL  L021904+2,X
         STAL  L021924+2,X
         STAL  L0218B0,X
         STAL  L0218C3,X
         STAL  L0218DB,X
         STAL  L0218F3,X
         DEY
         BEQ   L0265DE
         DEY
         BPL   L0265DE
         PLX
         LDA   #$0020
         STAL  L0218C3,X
         LDA   #$0022
         STAL  L0218DB,X
         STAL  L0218F3,X
         LDA   L021904
         TAX
         CLC
         ADC   #$0004
         CMP   #$0010
         BCC   L026626
         LDA   #$000F
L026626  STA   L021904
         STA   L021924
         CPX   #$000C
         BCC   L026634
         LDX   #$000B
L026634  LDA   #$532E	; .S
         STAL  L021904+2,X
         LDA   #$4352	; RC
         STAL  L021904+4,X
         LDA   #$452E	; .E
         STAL  L021924+2,X
         LDA   #$5551	; QU
         STAL  L021924+4,X
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L0218AF
         PEA   L0218AF
         _ParamText
         LDX   #$4502
         JSL   L027D42
         PEA   ^L0218D4
         PEA   L0218D4
         PEA   $0114
         _SetMItemName
         LDX   #$4510
         JSL   L027D42
         PEA   ^L0218EC
         PEA   L0218EC
         PEA   $0115
         _SetMItemName
         LDX   #$4511
         JSL   L027D42
         PEA   $0000
         PEA   $0000
         PEA   $0005
         _CalcMenuSize
         PLD
         PLB
         LDA   $02,S
         STA   $0A,S
         PLA
         STA   $07,S
         PLA
         PLA
         PLA
         RTL

L0266C1  PHB
         PHK
         PLB
L0266C4  JSL   L026710
         PEA   $0000
         PEA   $0001
         PEA   $005E
         PEA   $00C3
         PEA   ^L0244B1
         PEA   L0244B1
         _CreateResourceFile
         BCC   L02670E
         CMP   #$002B
         BNE   L026704
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0003
         _AlertWindow
         PLA
         BRA   L0266C4
L026704  PHA
         LDX   #$4610
         JSL   L027D42
         PLA
         SEC
L02670E  PLB
         RTL

L026710  PHB
         PHK
         PLB
L026713  JSL   GSOS
         DW    $2002      ; Destroy
         ADRL  L026742
         BCC   L026740
         CMP   #$002B
         BNE   L026740
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0003
         _AlertWindow
         PLA
         BRA   L026713
L026740  PLB
         RTL

L026742  DW    $0001      ; Parms for Destroy
         ADRL  L0244B1    ;  file name

L026748  PHB
         PHD
         PHK
         PLB
         TSC
         PHA
         PLD
         LDA   $07
         LDX   $09
         STA   L0268E6
         STX   L0268E6+2
         LDA   $0B
         LDX   $0D
         STA   L0268B0
         STX   L0268B0+2
         JSL   GSOS
         DW    $2010      ; Open
         ADRL  L0268AC
         BCC   L026772
         BRL   L02689B
L026772  LDA   L0268AE
         STA   L0268F0
         STA   L026910
         PEA   $0000
         PEA   $0000
L026781  LDA   L0268DE+2
         PHA
         LDA   L0268DE
         PHA
         LDA   L024112
         PHA
         PEA   $C008
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L0267BF
         CMP   #$0201
         BNE   L0267B7
         LSR   L0268DE+2
         ROR   L0268DE
         LDA   L0268DE+2
         BNE   L026781
         LDA   L0268DE
         CMP   #$0400
         BCS   L026781
L0267B7  LDX   #$4710
         PLY
         PLY
         BRL   L026863
L0267BF  LDA   L0268DE
         LDX   L0268DE+2
         STA   L0268F6
         STX   L0268F6+2
         STA   L026906
         STX   L026906+2
         PHD
         TSC
         PHA
         PLD
         LDY   #$0002
         LDA   [$03]
         STA   L0268F2
         STA   L026902
         LDA   [$03],Y
         STA   L0268F2+2
         STA   L026902+2
         PLD
         PLA
         STA   L026916
         PLA
         STA   L026918
         JSL   GSOS
         DW    $2010      ; Open
         ADRL  L0268E2
         BCC   L026803
         LDX   #$4722
         BRL   L026850
L026803  LDA   L0268E4
         STA   L026900
         STA   L026914
L02680C  JSL   GSOS
         DW    $2012      ; Read
         ADRL  L0268EE
         BCC   L02682E
         CMP   #$004C
         BNE   L02683F
         LDA   L0268FA
         LDX   L0268FA+2
         STA   L026906
         ORA   L0268FA+2
         BEQ   L026874
         STX   L026906+2
L02682E  JSL   GSOS
         DW    $2013      ; Write
         ADRL  L0268FE
         BCC   L02680C
         LDX   #$4731
         BRA   L026842
L02683F  LDX   #$4730
L026842  PHA
         PHX
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L026912
         PLX
         PLA
L026850  PHA
         PHX
         LDA   L026918
         PHA
         LDA   L026916
         PHA
         _DisposeHandle
         PLX
         PLA
L026863  PHA
         PHX
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L02690E
         PLX
         PLA
         SEC
         BRA   L02689B
L026874  LDA   L026918
         PHA
         LDA   L026916
         PHA
         _DisposeHandle
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L02690E
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L026912
         LDA   #$0000
         CLC
L02689B  STA   $08
         STX   $0A
         LDA   $05
         STA   $0D
         PLD
         PLB
         PLA
         STA   $07,S
         PLA
         PLA
         PLX
         RTL

L0268AC  DW    $000E      ; Parms for Open
L0268AE  DW    $0000      ;  ref num
L0268B0  ADRL  $00000000  ;  path name
         DW    $0003      ;  req access
         DW    $0001      ;  res num
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
         ADRL  $00000000  ;  end of file
         ADRL  $00000000  ;  blocks used
L0268DE  ADRL  $00000000  ;  resource eof
L0268E2  DW    $0004      ; Parms for Open
L0268E4  DW    $0000      ;  ref num
L0268E6  ADRL  $00000000  ;  path name
         DW    $0003      ;  req access
         DW    $0001      ;  res num
L0268EE  DW    $0004      ; Parms for Read
L0268F0  DW    $0000      ;  ref num
L0268F2  ADRL  $00000000  ;  buffer ptr
L0268F6  ADRL  $00000000  ;  request count
L0268FA  ADRL  $00000000  ;  transfer count
L0268FE  DW    $0004      ; Parms for Write
L026900  DW    $0000      ;  ref num
L026902  ADRL  $00000000  ;  buffer ptr
L026906  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02690E  DW    $0001      ; Parms for Close
L026910  DW    $0000      ;  ref num
L026912  DW    $0001      ; Parms for Close
L026914  DW    $0000      ;  ref num
L026916  DB    $00
         DB    $00
L026918  DB    $00
         DB    $00

L02691A  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0003
         PEA   $0000
         PEA   $0000
         PEA   ^L0244B1
         PEA   L0244B1
         _OpenResourceFile
         BCC   L02693D
         PLY
         PLD
         PLB
         RTL

L02693D  PLA
         STA   L0240D6
         JSL   L0202F5
         PEA   $0000
         PEA   $0000
         PEA   ^L0218C1
         PEA   L0218C1
         PEA   ^L021C88
         PEA   L021C88
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L021C2E
         PEA   L021C2E
         PEA   $800E
         _NewWindow2
         LDX   #$4808
         JSL   L027D42
         PLA
         STA   L0240F2
         PLA
         STA   L0240F4
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         PEA   $0003
         PEA   ^L021C98
         PEA   L021C98
         _NewControl2
         LDX   #$480A
         JSL   L027D42
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         PEA   $0000
         PEA   $0003
         _GetCtlHandleFromID
         LDX   #$480B
         JSL   L027D42
         PLA
         STA   L024104
         PLA
         STA   L024106
         PEA   $0000
         PEA   $0000
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         PEA   $0000
         PEA   $0004
         _GetCtlHandleFromID
         LDX   #$480C
         JSL   L027D42
         PLA
         STA   L0240FC
         PLA
         STA   L0240FE
         PLD
         PLB
         MX    %00
L026A11  PHB
         PHD
         PHK
         PLB
         JSL   L02242F
         PEA   $0000
         PEA   $0000
         LDA   L024106
         PHA
         LDA   L024104
         PHA
         _SortList2
         LDX   #$4810
         JSL   L027D42
         PEA   $0000
         PEA   $0000
         LDA   L0240FE
         PHA
         LDA   L0240FC
         PHA
         _SortList2
         LDX   #$4811
         JSL   L027D42
         PEA   ^L021BA8
         PEA   L021BA8
         PEA   $0000
         JSL   L027BA4
         PEA   ^L021BB0
         PEA   L021BB0
         PEA   $FFFF
         JSL   L027BA4
         JSL   L027BE8
         LDA   #$0191
         STA   L021C2C
         _InitCursor
         LDA   #$0000
         PLD
         PLB
         RTL

L026A82  PHD
         TSC
         PHA
         PLD
         LDX   #$0001
         LDY   #$0004
         LDA   [$06],Y
         BPL   L026AA9
         INX
         BRA   L026AA9
L026A93  PHD
         TSC
         PHA
         PLD
         LDX   #$0001
         LDY   #$0004
         LDA   [$06],Y
         BMI   L026AA9
         LDY   #$0014
         LDA   [$06],Y
         BNE   L026AA9
         INX
L026AA9  STX   $0A
         PLD
         LDA   $02,S
         STA   $06,S
         PLA
         STA   $03,S
         PLA
         RTL

L026AB5  ENT
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   L0240D4
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

L026AEC  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$4902
         JSL   L027D42
L026B04  PLA
         STA   L026B5F
         PLA
         STA   L026B61
         ORA   L026B5F
         BEQ   L026B58
         LDA   L026B61
         PHA
         LDA   L026B5F
         PHA
         JSL   L02897A
         CMP   #$5754
         BNE   L026B3A
         LDA   L026B61
         PHA
         LDA   L026B5F
         PHA
         _SelectWindow
         LDX   #$4906
         JSL   L027D42
         BRA   L026B5C
L026B3A  PEA   $0000
         PEA   $0000
         LDA   L026B61
         PHA
         LDA   L026B5F
         PHA
         _GetNextWindow
         LDX   #$4908
         JSL   L027D42
         BRA   L026B04
L026B58  JSL   L0429E3
L026B5C  PLB
         PLD
         RTL

L026B5F  DW    $0000
L026B61  DW    $0000

L026B63  PHB
         PHD
         PHK
         PLB
         LDA   L024394
         AND   #$8080
         BEQ   L026BA2
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0005
         _AlertWindow
         PLA
         BNE   L026B8E
         BRL   L026BF4
L026B8E  CMP   #$0002
         BNE   L026BA2
         JSL   L02638C
         CPY   #$0000
         BEQ   L026BA2
         LDA   #$0000
         BRL   L026BF4
L026BA2  _WaitCursor
         JSL   L026BF7
         LDA   L0240D6
         PHA
         _CloseResourceFile
         LDX   #$4A02
         JSL   L027D42
         JSL   L023BB7
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _CloseWindow
         LDX   #$4A04
         JSL   L027D42
         JSL   L027B45
         LDA   L024394
         AND   #$0007
         STA   L024394
         _InitCursor
         JSL   L026710
         LDA   #$FFFF
L026BF4  PLD
         PLB
         RTL

L026BF7  PHB
         PHD
         PHK
         PLB
         LDA   #$0400
         STA   L026C99
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$4B02
         JSL   L027D42
L026C15  LDA   $01,S
         STA   L026C9B
         LDA   $03,S
         STA   L026C9B+2
         ORA   $01,S
         BEQ   L026C94
         JSL   L02897A
         BMI   L026C55
         AND   #$FF00
         CMP   #$5700
         BEQ   L026C55
         LDA   L024382
         BEQ   L026C55
         LDA   L026C9B+2
         PHA
         LDA   L026C9B
         PHA
         _BringToFront
         LDX   #$4B04
         JSL   L027D42
         LDX   #$0004
         STX   L02438A
         JSR   L020C59
L026C55  DEC   L026C99
         BEQ   L026C78
         PEA   $0000
         PEA   $0000
         LDA   L026C9B+2
         PHA
         LDA   L026C9B
         PHA
         _GetNextWindow
         LDX   #$4B06
         JSL   L027D42
         BRA   L026C15
L026C78  PEA   $0000
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0007
         _AlertWindow
L026C94  PLA
         PLA
         PLD
         PLB
         RTL

L026C99  DW    $0000
L026C9B  ADRL  $00000000

L026C9F  PHB
         PHD
         PHK
         PLB
         DEC   L0240DC
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$4C02
         JSL   L027D42
L026CBA  PLA
         STA   L026DD6
         PLA
         STA   L026DD6+2
         ORA   L026DD6
         BEQ   L026D14
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         JSL   L02897A
         CMP   #$5752
         BEQ   L026CEF
         PEA   $0000
         PEA   $0000
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _GetNextWindow
         BRA   L026CBA
L026CEF  LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _SelectWindow
         LDX   #$4C04
         JSL   L027D42
         JSL   L026B63
         STA   L0240DC
         CMP   #$0000
         BNE   L026D14
L026D11  PLD
         PLB
         RTL

L026D14  PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$4C06
         JSL   L027D42
L026D28  PLA
         STA   L026DD6
         PLA
         STA   L026DD6+2
         ORA   L026DD6
         BEQ   L026D11
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         JSL   L02897A
         CMP   #$5751
         BNE   L026D62
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _BringToFront
         LDX   #$4C08
         JSL   L027D42
         JSL   L02B718
         BRA   L026DB7
L026D62  CMP   #$5754
         BNE   L026D83
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _BringToFront
         LDX   #$4C0A
         JSL   L027D42
         JSL   L042C42
         BRA   L026DB7
L026D83  AND   #$FF00
         CMP   #$5700
         BNE   L026DB7
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _BringToFront
         LDX   #$4C0C
         JSL   L027D42
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _CloseWindow
         LDX   #$4C0D
         JSL   L027D42
L026DB7  PEA   $0000
         PEA   $0000
         LDA   L026DD6+2
         PHA
         LDA   L026DD6
         PHA
         _GetNextWindow
         LDX   #$4C0E
         JSL   L027D42
         BRL   L026D28
L026DD6  ADRL  $00000000
L026DDA  PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$4D02
         JSL   L027D42
         JSL   L02897A
         LDA   L024382
         BEQ   L026E04
         LDA   #$0007
         STA   L02438A
         JSR   L020C59
L026E04  PLB
         PLD
         RTL

L026E07  PHB
         PHD
         PHK
         PLB
         LDA   $09,S
         PHA
         LDA   $09,S
         PHA
         LDA   $09,S
         STA   $0D,S
         LDA   $07,S
         STA   $0B,S
         LDA   $05,S
         STA   $09,S
         _WaitCursor
         _GetNewModalDialog
         LDA   $03,S
         TAX
         LDA   $01,S
         PHX
         PHA
         PHX
         PHA
         _SetPort
         _DrawDialog
         PLA
         PLX
         PLD
         PLB
         RTL

L026E47  ENT
         PHD
         PHB
         PHK
         PLB
         LDA   $07,S
         STA   L026F1C
         LDA   $09,S
         STA   L026F1C+2
         JSL   GSOS
         DW    $200E      ; ExpandPath
         ADRL  L026F1A
         LDX   #$4F02
         JSL   L027D42
         LDY   L026F56
         STY   L027058
         DEY
L026E6D  LDA   L026F58,Y
         STA   L02705A,Y
         PHA
         AND   #$00FF
         CMP   #$003A
         BNE   L026E84
         STY   L027058
         LDA   #$0000
         STA   $01,S
L026E84  PLA
         STA   L02715A,Y
         DEY
         BEQ   L026E8D
         BPL   L026E6D
L026E8D  LDA   L026F58
         STA   L02705A
         STA   L02715A
         PEA   $0000
         _GetCurResourceFile
         LDX   #$4F06
         JSL   L027D42
         LDA   L0240D4
         PHA
         _SetCurResourceFile
         LDX   #$4F07
         JSL   L027D42
L026EB9  _WaitCursor
         JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L026F24
         BCC   L026EFE
         _InitCursor
         PEA   $0000
         PEA   $0004
         PEA   ^L026F2C
         PEA   L026F2C
         LDA   $15,S
         BEQ   L026EEB
         PEA   $0000
         PEA   $000E
         BRA   L026EF1
L026EEB  PEA   $0000
         PEA   $000F
L026EF1  _AlertWindow
         PLA
         BEQ   L026EB9
         LDA   #$FFFF
L026EFE  STA   $0A,S
         _SetCurResourceFile
         LDX   #$4F08
         JSL   L027D42
         PLB
         PLD
         LDA   $02,S
         STA   $08,S
         PLA
         STA   $05,S
         PLA
         PLA
         RTL

L026F1A  DW    $0002      ; Parms for ExpandPath
L026F1C  ADRL  $00000000  ;  path name
         ADRL  L026F54    ;  new pathname
L026F24  DW    $0002      ; Parms for GetFileInfo
         ADRL  L027058    ;  file name
         DW    $0000      ;  access
L026F2C  ADRL  L02715A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026F54  DW    $0100
L026F56  DW    $0000
L026F58  DS    $100
L027058  DW    $0000
L02705A  DS    $100
L02715A  DS    $100

L02725A  PHB
         PHD
         PHK
         PLB
         JSL   L026DDA
         LDA   L027528
         BNE   L02726B
         JSL   L027358
L02726B  STZ   L027566
         PEA   ^L021CD2
         PEA   L021CD2
         PLA
         STA   L027568
         PLA
         STA   L02756A
         PEA   ^L021904
         PEA   L021904
         PLA
         STA   L02756C
         PLA
         STA   L02756E
         LDA   L02435C
         CMP   #$0107
         BEQ   L0272B4
         LDA   #$8000
         STA   L027566
         PEA   ^L021CE4
         PEA   L021CE4
         PLA
         STA   L027568
         PLA
         STA   L02756A
         PEA   ^L021924
         PEA   L021924
         PLA
         STA   L02756C
         PLA
         STA   L02756E
L0272B4  PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $00A0
         PEA   $001E
         PEA   $0000
         LDA   L02756A
         PHA
         LDA   L027568
         PHA
         PEA   $0000
         LDA   L02756E
         PHA
         LDA   L02756C
         PHA
         PEA   ^L021A64
         PEA   L021A64
         _SFPutFile2
         LDX   #$5002
         JSL   L027D42
         _SetPort
         LDA   L021A64
         BEQ   L027355
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $FFFF
         LDA   L027566
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         JSL   L02ACFE
         LDA   L0240D6
         STA   L02755C
         LDA   L024112
         STA   L02755E
         PEA   ^L021A7A
         PEA   L021A7A
         PLA
         STA   L027558
         PLA
         STA   L02755A
         PEA   ^L027558
         PEA   L027558
         JSL   L040000
         JSL   L030000
         JSL   L0202F5
         LDA   #$0000
L027355  PLD
         PLB
         RTL

L027358  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L021EF3
         PEA   L021EF3
         PEA   $800E
         _NewWindow2
         LDX   #$5102
         JSL   L027D42
         PLA
         STA   L027518
         PLA
         STA   L027518+2
         LDA   L027518+2
         PHA
         LDA   L027518
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         LDA   L027518+2
         PHA
         LDA   L027518
         PHA
         PEA   $0000
         PEA   $0002
         _GetCtlHandleFromID
         LDX   #$5106
         JSL   L027D42
         PLA
         PLX
         STA   L027524
         STX   L027524+2
         LDA   L027528
         BNE   L0273EA
         LDA   #$0001
L0273EA  PHA
         LDA   L027524+2
         PHA
         LDA   L027524
         PHA
         _SelectMember2
         LDX   #$5108
         JSL   L027D42
         LDA   L027518+2
         PHA
         LDA   L027518
         PHA
         _ShowWindow
         LDX   #$510A
         JSL   L027D42
L027417  PEA   $0000
         PEA   $FFFF
         PEA   ^L02752A
         PEA   L02752A
         _TaskMaster
         PLA
         CMP   #$0014
         BNE   L02747A
         PEA   ^L02751C
         PEA   L02751C
         PEA   $0000
         PEA   $0000
         PEA   $027F
         PEA   $00C7
         _SetRect
         LDX   #$5110
         JSL   L027D42
         PEA   $0000
         LDA   L027536
         PHA
         LDA   L027534
         PHA
         PEA   $0008
         PEA   ^L02751C
         PEA   L02751C
         LDA   L02753A+2
         PHA
         LDA   L02753A
         PHA
         _DragWindow
         LDX   #$5112
         JSL   L027D42
L02747A  CMP   #$0021
         BNE   L027417
         LDA   L027550
         CMP   #$0001
         BEQ   L0274B2
         CMP   #$0002
         BNE   L027417
         LDA   L027546
         CMP   #$0002
         BEQ   L027496
L027494  BRA   L027417
L027496  LDA   L02754C
         CMP   #$0005
         BEQ   L027494
         CMP   #$0006
         BEQ   L027494
         CMP   #$0007
         BEQ   L027494
         CMP   #$0008
         BEQ   L027494
         CMP   #$0081
         BEQ   L027494
L0274B2  PEA   $0000
         LDA   L027524+2
         PHA
         LDA   L027524
         PHA
         _ResetMember2
         LDX   #$5120
         JSL   L027D42
         PLA
         STA   L027528
         PEA   $0000
         PEA   $0000
         LDA   L027528
         PHA
         PEA   $0007
         _Multiply
         LDX   #$5121
         JSL   L027D42
         PLA
         PLX
         DEC
         DEC
         TAX
         LDA   L021FE4,X
         STA   L027560
         STZ   L027562
         LDA   L027518+2
         PHA
         LDA   L027518
         PHA
         _CloseWindow
         LDX   #$5124
         JSL   L027D42
         _SetPort
         PLD
         PLB
         RTL

L027518  ADRL  $00000000
L02751C  DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L027524  ADRL  $00000000
L027528  DW    $0000
L02752A  DW    $0000      ; event code
         ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
L027534  DW    $0000      ; mouse location
L027536  DW    $0000
         DW    $0000      ; modifiers
L02753A  ADRL  $00000000  ; task data
         ADRL  $001B2006  ; task mask
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027546  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02754C  DB    $00
         DB    $00
         DB    $00
         DB    $00
L027550  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027558  DB    $00
         DB    $00
L02755A  DB    $00
         DB    $00
L02755C  DB    $00
         DB    $00
L02755E  DB    $00
         DB    $00
L027560  DB    $00
         DB    $00
L027562  DB    $00
         DB    $00
         DB    $00
         DB    $00
L027566  DB    $00
         DB    $00
L027568  DB    $00
         DB    $00
L02756A  DB    $00
         DB    $00
L02756C  DB    $00
         DB    $00
L02756E  DB    $00
         DB    $00

L027570  PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $0078
         PEA   $001E
         PEA   $0000
         PEA   ^L021CF6
         PEA   L021CF6
         PEA   ^L026A93
         PEA   L026A93
         PEA   $0000
         PEA   $0000
         PEA   ^L021A64
         PEA   L021A64
         _SFGetFile2
         LDX   #$5300
         JSL   L027D42
         _SetPort
         LDA   L021A64
         BEQ   L0275D6
         PEA   ^L021A7A
         PEA   L021A7A
         PEA   ^L021A9C
         PEA   L021A9C
         JSL   L029D22
         PHA
         LDA   L024394
         ORA   #$8000
         STA   L024394
         PLA
L0275D6  PLB
         RTL

L0275D8  LDA   L024394
         AND   #$0001
         BNE   L027604
         LDA   L024394
         ORA   #$0001
         STA   L024394
         PEA   ^L027856
         PEA   L027856
         PEA   $0109
         _SetMItemName
         LDX   #$8002
         JSL   L027D42
         LDA   #$0000
         RTL

L027604  LDA   L024394
         EOR   #$0001
         STA   L024394
         PEA   ^L027845
         PEA   L027845
         PEA   $0109
         _SetMItemName
         LDX   #$8004
         JSL   L027D42
L027624  PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $0000
         PEA   $0000
         _GetMenuMgrPort
         _SetPort
         PEA   $0000
         _GetTextMode
         PEA   $000F
         _SetBackColor
         PEA   $0000
         _SetForeColor
         PEA   $0000
         _SetTextMode
         PEA   $01E0
         PEA   $000A
         _MoveTo
         PEA   ^L0278AD
         PEA   L0278AD
         _DrawString
         _SetTextMode
         _SetPort
         LDA   #$0000
         RTL

L027699  PHB
         PHD
         PHK
         PLB
         LDA   L024394
         AND   #$0001
         BEQ   L0276EE
         PEA   $0000
         PEA   $0000
         _GetPort
         PEA   $0000
         PEA   $0000
         _GetWMgrPort
         _SetPort
         PEA   ^L027841
         PEA   L027841
         _GetMouse
         _SetPort
         SEC
         LDA   L027843
         SBC   L02438E
         PHA
         SEC
         LDA   L027841
         SBC   L02438C
         PHA
         JSL   L0276F1
L0276EE  PLD
         PLB
L0276F0  ENT
         RTL

L0276F1  PHD
         PHB
         PHK
         PLB
         LDA   L024394
         AND   #$0001
         BNE   L027700
         BRL   L0277D8
L027700  PEA   $0000
         PEA   $0000
         _GetPort
         LDA   $0B,S
         STA   L027841
         LDA   $0D,S
         STA   L027843
         PEA   $0000
         PEA   $0000
         _GetMenuMgrPort
         LDX   #$8102
         JSL   L027D42
         _SetPort
         PEA   $0000
         _GetTextMode
         PEA   $000F
         _SetBackColor
         PEA   $0000
         _SetForeColor
         PEA   $0000
         _SetTextMode
         LDA   L027841
         PHA
         PEA   ^L0278A6
         PEA   L0278A6
         PEA   $0004
         PEA   $0001
         _Int2Dec
         LDX   #$8110
         JSL   L027D42
         LDA   L027843
         PHA
         PEA   ^L027899
         PEA   L027899
         PEA   $0004
         PEA   $0001
         _Int2Dec
         LDX   #$8111
         JSL   L027D42
         PEA   $01E0
         PEA   $000A
         _MoveTo
         PEA   ^L027893
         PEA   L027893
         _DrawString
         PEA   $0228
         PEA   $000A
         _MoveTo
         PEA   ^L0278A0
         PEA   L0278A0
         _DrawString
         _SetTextMode
         _SetPort
L0277D8  LDA   $05,S
         STA   $09,S
         PLB
         PLD
         PLA
         STA   $03,S
         PLA
         RTL

L0277E3  STZ   L02438C
         STZ   L02438E
         LDA   #$0000
         RTL

L0277ED  LDA   L024394
         PHA
         ORA   #$0001
         STA   L024394
         STZ   L02438C
         STZ   L02438E
         PEA   ^L0278D0
         PEA   L0278D0
         _SetCursor
L02780A  JSL   L027699
         PEA   $0000
         PEA   $0000
         _Button
         PLA
         BEQ   L02780A
         LDA   L027841
         STA   L02438C
         LDA   L027843
         STA   L02438E
         _InitCursor
         PLA
         STA   L024394
         AND   #$0001
         BEQ   L02783E
         LDA   #$0000
         RTL
L02783E  JMP   L027624

L027841  DW    $0000
L027843  DW    $0000

L027845  STR   'Show Coordinates'
L027856  STR   'Hide Coordinates'
         STR   'Show Rulers'
         STR   'Hide Rulers'
         STR   'Show Grid'
         STR   'Hide Grid'

L027893  DB    L0278A0-L027894
L027894  ASC   'H =  '
L027899  ASC   '       '
L0278A0  DB    L0278AD-L0278A1
L0278A1  ASC   'V =  '
L0278A6  ASC   '       '
L0278AD  STR   '                                  '

L0278D0  DW    $000B      ; cursor height
         DW    $0004      ; cursor width
         HEX   00000F0000000000 ; cursor image
         HEX   0000FFF000000000
         HEX   000F0F0F00000000
         HEX   00F00F00F0000000
         HEX   0F000F000F000000
         HEX   FFFFF0FFFFF00000
         HEX   0F000F000F000000
         HEX   00F00F00F0000000
         HEX   000F0F0F00000000
         HEX   0000FFF000000000
         HEX   00000F0000000000
         HEX   00000F0000000000 ; cursor mask
         HEX   0000FFF000000000
         HEX   000F0F0F00000000
         HEX   00F00F00F0000000
         HEX   0F000F000F000000
         HEX   FFFFFFFFFFF00000
         HEX   0F000F000F000000
         HEX   00F00F00F0000000
         HEX   000F0F0F00000000
         HEX   0000FFF000000000
         HEX   00000F0000000000
         DW    $0005      ; hot spot
L027986  DW    $000B

L027988  PEA   $0001
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _ShowHide
         LDX   #$8502
         JSL   L027D42
         LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _SelectWindow
         LDX   #$8503
         JSL   L027D42
         PEA   $0114
         _EnableMItem
         LDX   #$8504
         JSL   L027D42
         LDA   L024394
         AND   #$FFBF
         BRA   L0279FD
L0279D0  LDA   L0240F4
         PHA
         LDA   L0240F2
         PHA
         _HideWindow
         LDX   #$8506
         JSL   L027D42
         PEA   $0114
         _DisableMItem
         LDX   #$8508
         JSL   L027D42
         LDA   L024394
         ORA   #$0040
L0279FD  STA   L024394
         LDA   #$0000
         RTL

L027A04  PEA   $FFFF
         PEA   $FFFE
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$8602
         JSL   L027D42
         LDA   $01,S
         ORA   $03,S
         BNE   L027A2A
         PLA
         PLA
         PLA
         PLA
         BRA   L027A38
L027A2A  _SendBehind
         LDX   #$8603
         JSL   L027D42
L027A38  LDA   #$0000
         RTL

L027A3C  SEC
         LDA   L02435C
         SBC   #$0117
         PHA
         JSL   L029A18
         RTL

L027A49  PEA   $0000
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$8802
         JSL   L027D42
         LDA   $01,S
         STA   L027B41
         LDA   $03,S
         STA   L027B41+2
L027A6A  _GetSysWFlag
         PLA
         BNE   L027A84
         LDA   L027B41
         CMP   L0240F2
         BNE   L027ABD
         LDA   L027B41+2
         CMP   L0240F4
         BNE   L027ABD
L027A84  PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L027B41+2
         PHA
         LDA   L027B41
         PHA
         _GetNextWindow
         LDX   #$8804
         JSL   L027D42
         LDA   $01,S
         STA   L027B41
         LDA   $03,S
         STA   L027B41+2
         ORA   $01,S
         BNE   L027A6A
         PLA
         PLA
         PLA
         LDA   #$FFFF
         RTL

L027AB8  JSR   L020E3B
         BRA   L027A84
L027ABD  PEA   $0000
         PEA   $0000
         LDA   L027B41+2
         PHA
         LDA   L027B41
         PHA
         _GetWRefCon
         LDX   #$8806
         JSL   L027D42
         JSR   L020E2A
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
         LDY   #$0000
         LDA   [$00],Y
         CMP   L024382
         BNE   L027AB8
         LDY   #$0002
         LDA   [$00],Y
         CMP   L024384
         BNE   L027AB8
         INY
         INY
         LDA   [$00],Y
         CMP   L024384+2
         BNE   L027AB8
         JSR   L020E3B
         PEA   $0001
         LDA   L027B41+2
         PHA
         LDA   L027B41
         PHA
         _ShowHide
         LDX   #$8808
         JSL   L027D42
         LDA   L027B41+2
         PHA
         LDA   L027B41
         PHA
         _SelectWindow
         LDX   #$880A
         JSL   L027D42
         LDA   #$0000
         RTL

L027B41  ADRL  $00000000
L027B45  PHB
         PHD
         PHK
         PLB
         PEA   ^L021BA8
         PEA   L021BA8
         PEA   $FFFF
         JSL   L027BA4
         PEA   ^L021BB0
         PEA   L021BB0
         PEA   $0000
         JSL   L027BA4
         PLD
         PLB
L027B65  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDX   #$8902
         JSL   L027D42
         PLA
         ORA   $01,S
         BEQ   L027B85
         LDA   #$FFFF
L027B85  CMP   L027BA2
         BEQ   L027B9B
         STA   L027BA2
         PEA   ^L021B9C
         PEA   L021B9C
         LDA   L027BA2
         PHA
         JSL   L027BA4
L027B9B  PLA
         PLD
         PLB
         LDA   #$0000
         RTL

L027BA2  DW    $FFFF
L027BA4  PHD
         TSC
         PHA
         PLD
         LDY   #$0000
L027BAB  LDA   [$08],Y
         BEQ   L027BD9
         INY
         INY
         PHY
         PHA
         LDA   $06
         BEQ   L027BC8
         _EnableMItem
         LDX   #$8980
         JSL   L027D42
         PLY
         BRA   L027BAB
L027BC8  _DisableMItem
         LDX   #$8981
         JSL   L027D42
         PLY
         BRA   L027BAB
L027BD9  PLD
         LDA   $02,S
         STA   $08,S
         PLA
         STA   $05,S
         PLA
         PLA
         LDA   #$0000
         CLC
         RTL

L027BE8  PHB
         PHK
         PLB
         LDA   L024394
         AND   #$0040
         BEQ   L027C04
         PEA   $0114
         _DisableMItem
         LDX   #$8983
         JSL   L027D42
L027C04  PLB
         RTL

L027C06  PHB
         PHD
         PHK
         PLB
         LDA   L024394
         AND   #$0040
         BEQ   L027C68
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$8A02
         JSL   L027D42
L027C26  PLA
         STA   L027C6E
         PLA
         STA   L027C6E+2
         ORA   L027C6E
         BNE   L027C39
         JSL   L027988
         BRA   L027C68
L027C39  LDA   L027C6E+2
         PHA
         LDA   L027C6E
         PHA
         JSL   L02897A
         LDA   L024382
         BNE   L027C68
         PEA   $0000
         PEA   $0000
         LDA   L027C6E+2
         PHA
         LDA   L027C6E
         PHA
         _GetNextWindow
         LDX   #$8A04
         JSL   L027D42
         BRA   L027C26
L027C68  LDA   #$0000
         PLD
         PLB
         RTL

L027C6E  ADRL  $00000000

L027C72  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetFirstWindow
         LDX   #$8B02
         JSL   L027D42
         BRA   L027CA8
L027C8C  PEA   $0000
         PEA   $0000
         LDA   L027CE7+2
         PHA
         LDA   L027CE7
         PHA
         _GetNextWindow
         LDX   #$8B04
         JSL   L027D42
L027CA8  PLA
         STA   L027CE7
         PLA
         STA   L027CE7+2
         ORA   L027CE7
         BEQ   L027CD6
         LDA   L027CE7+2
         PHA
         LDA   L027CE7
         PHA
         JSL   L02897A
         LDA   L024382
         CMP   $07,S
         BNE   L027C8C
         LDA   L024384
         CMP   $09,S
         BNE   L027C8C
         LDA   L024384+2
         CMP   $0B,S
         BNE   L027C8C
L027CD6  LDY   L027CE7
         LDX   L027CE7+2
         PLD
         PLA
         STA   $05,S
         PLA
         STA   $05,S
         PLA
         PLB
         TYA
         RTL

L027CE7  ADRL  $00000000
L027CEB  ENT
         PHB
         PHD
         PHK
         PLB
         TSC
         TCD
         LDA   $07
         BNE   L027CF8
         BRL   L027D31
L027CF8  LDX   $09
         PHX
         PHA
         PEA   ^L027DAA
         PEA   L027DAA
         PEA   $0004
         _Int2Hex
         PEA   ^L027DBB
         PEA   L027DBB
         PEA   $0004
         _Int2Hex
         PHA
         PEA   ^L027D4F
         PEA   L027D4F
         PEA   $0000
         PEA   $0000
         _StopAlert
         PLA
L027D31  LDA   $04
         STA   $08
         LDA   $05
         STA   $09
         TSC
         PLD
         PLB
         CLC
         ADC   #$0007
         TCS
         RTL

L027D42  CMP   #$0000
         BNE   L027D48
         RTL

L027D48  PHX
         PHA
         JSL   L027CEB
         RTL

L027D4F  DW    $001E      ; Alert rect
         DW    $0078
         DW    $0050
         DW    $0208
         DW    $1A0A      ; Alert ID
         HEX   80         ; First stage byte
         HEX   80         ; Second stage byte
         HEX   80         ; Third stage byte
         HEX   80         ; fourth stage byte
         ADRL  L027D69    ; Ptr to item template
         ADRL  L027D8A    ; Ptr to item template
         ADRL  $00000000
L027D69  DW    $0001      ; Item ID
         DW    $001F      ; Item rect
         DW    $0096
         DW    $002C
         DW    $00FA
         DW    $000A      ; Std button
         ADRL  L027D81    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L027D81  STR   'Continue'
L027D8A  DW    $0544      ; Item ID
         DW    $0006      ; Item rect
         DW    $0048
         DW    $00C8
         DW    $0280
         DW    $800F      ; Static text
         ADRL  L027DA2    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table

L027DA2  DB    L027DF7-L027DA3	; $55
L027DA3  ASC   'Error $'
L027DAA  HEX   00000000
         ASC   ' occured at $'
L027DBB  HEX   00000000
         ASC   ' in the Shell'0D
         ASC   'Please record and report this information.'0D

L027DF7  ENT
         PHB
         PHD
         PHK
         PLB
         JSR   L027E26
         LDA   $07,S
         STA   L024382
         LDA   $09,S
         STA   L024384
         LDA   $0B,S
         STA   L024384+2
         LDA   #$0009
         STA   L02438A
         JSR   L020C59
         STA   $07,S
         JSR   L027E34
         PLD
         PLA
         STA   $05,S
         PLA
         STA   $05,S
         PLA
         PLB
         RTL

L027E26  LDY   #$0062
L027E29  LDA   L02434C,Y
         STA   L027E42,Y
         DEY
         DEY
         BPL   L027E29
         RTS

L027E34  LDY   #$0062
L027E37  LDA   L027E42,Y
         STA   L02434C,Y
         DEY
         DEY
         BPL   L027E37
         RTS

L027E42  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027EA7  ENT
         DB    $00
         DB    $00
L027EA9  ENT
         DB    $00
         DB    $00
L027EAB  ENT
         DB    $00
         DB    $00
L027EAD  ENT
         DB    $00
         DB    $00
L027EAF  ENT
         DB    $00
L027EB0  ENT
         DB    $00
L027EB1  ENT
         DB    $00
         DB    $00
L027EB3  ENT
         DB    $00
         DB    $00
L027EB5  ENT
         DB    $00
         DB    $00
L027EB7  ENT
         DB    $00
         DB    $00
L027EB9  ENT
         DB    $00
         DB    $00
L027EBB  ENT
         DB    $00
         DB    $00
L027EBD  ENT
         DB    $00
         DB    $00
L027EBF  ENT
         DB    $00
         DB    $00
L027EC1  ENT
         DB    $00
         DB    $00
L027EC3  ENT
         DB    $00
         DB    $00
L027EC5  ENT
         DB    $00
         DB    $00
L027EC7  ENT
         DB    $00
         DB    $00
L027EC9  ENT
         DB    $00
         DB    $00
L027ECB  ENT
         DB    $00
         DB    $00
L027ECD  ENT
         DB    $00
         DB    $00
L027ECF  ENT
         DB    $00
         DB    $00
L027ED1  ENT
         DB    $00
         DB    $00
L027ED3  ENT
         DB    $00
         DB    $00
L027ED5  ENT
         DB    $00
         DB    $00
L027ED7  ENT
         DB    $00
         DB    $00
L027ED9  ENT
         DB    $04
         DB    $00
L027EDB  ENT
         DB    $00
         DB    $00
L027EDD  ENT
         DB    $00
         DB    $00
L027EDF  ENT
         DB    $00
         DB    $00
L027EE1  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027EEB  ENT
         DB    $04
         DB    $00
L027EED  ENT
         DB    $00
         DB    $00
L027EEF  ENT
         DB    $00
         DB    $00
         DB    $C3
         DB    $00
L027EF3  ENT
         DB    $B0
         DB    $00
L027EF5  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027F03  ENT
         DB    $02
         DB    $00
L027F05  ENT
         DB    $00
         DB    $00
L027F07  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027F3D  ENT
         DB    $02
         DB    $00
         DB    $35
         DB    $3A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027F5F  ENT
         DB    $04
         DB    $00
L027F61  ENT
         DB    $00
         DB    $00
L027F63  ENT
         ADRL  L028630
L027F67  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027F71  ENT
         DS    $100
L028071  ENT
         DB    $0C
         DB    $00
L028073  ENT
         DB    $00
         DB    $00
L028075  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02809B  ENT
         DB    $00
         DB    $00
L02809D  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0280AB  ENT
         DB    $01
         DB    $00
L0280AD  ENT
         DB    $00
         DB    $00
L0280AF  ENT
         DB    $00
         DB    $00
L0280B1  ENT
         DB    $30
         DB    $00
L0280B3  ENT
         DB    $0D
         DB    $00
L0280B5  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
L0280BD  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0280C3  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0280DF  ENT
         DB    $00
         DB    $00
L0280E1  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0280F1  ENT
         DB    $02
         DB    $00
L0280F3  ENT
         DB    $00
         DB    $00
L0280F5  ENT
         DB    $00
         DB    $00
L0280F7  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02812B  ENT
         DS    $100
L02822B  ENT
         ASC   'SSSi'
         DB    $00
L028230  ENT
         DB    $00
         DB    $00
L028232  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028258  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02825C  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028260  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028264  ENT
         DB    $00
         DB    $00
L028266  ENT
         DB    $00
         DB    $00
L028268  ENT
         DB    $00
         DB    $00
L02826A  ENT
         DB    $00
         DB    $00
L02826C  ENT
         DB    $00
         DB    $00
L02826E  ENT
         DB    $00
         DB    $00
L028270  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028274  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028278  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02827C  ENT
         DS    $3B4
L028630  DS    $100
L028730  ENT
         DB    $00
         DB    $00
L028732  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L028770  ENT
         ADRL  L0288CA
         ADRL  L0288CE
         ADRL  L0288D2
         ADRL  L0288D7
         ADRL  L0288DC
         ADRL  L0288E1
         ADRL  L0288E6
         ADRL  L0288EA
         ADRL  L0288EF
         ADRL  L0288F4
         ADRL  L0288F8
         ADRL  L0288FB
         ADRL  L0288FE
         ADRL  L028903
         ADRL  L028906
         ADRL  L028909
         ADRL  L02890D
         ADRL  L028910
         ADRL  L028915
         ADRL  L02891A
         ADRL  L02891F
         ADRL  L028922
         ADRL  L028927
         ADRL  L02892A
         ADRL  L02892E
         ADRL  L028933
         ADRL  L028936
         ADRL  L02893B
         ADRL  L028940
         ADRL  L028945
         ADRL  L02894A
         ADRL  L028950
         ADRL  L028954
         ADRL  L028956
         ADRL  L02895A
         ADRL  L02895E
         ADRL  L028962
         ADRL  L028965
         ADRL  L028968
         ADRL  L02896E
         ADRL  L028974
L028814  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028824  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028854  ENT
         DB    $00
         DB    $00
L028856  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028878  ENT
         DB    $03
         DB    $00
         DB    $03
         DB    $00
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $03
         DB    $00
         DB    $02
         DB    $00
         DB    $FF
         DB    $FF
         DB    $02
         DB    $00
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $02
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $03
         DB    $00
         DB    $FF
         DB    $FF
         DB    $03
         DB    $00
         DB    $01
         DB    $00
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00

L0288CA  ASC   'AND'00
L0288CE  ASC   'BIT'00
L0288D2  ASC   'BYTE'00
L0288D7  ASC   'CONT'00
L0288DC  ASC   'CSTR'00
L0288E1  ASC   'CTRL'00
L0288E6  ASC   'DEC'00
L0288EA  ASC   'DONE'00
L0288EF  ASC   'ELSE'00
L0288F4  ASC   'END'00
L0288F8  ASC   'EQ'00
L0288FB  ASC   'GE'00
L0288FE  ASC   'GSOS'00
L028903  ASC   'GT'00
L028906  ASC   'IF'00
L028909  ASC   'INC'00
L02890D  ASC   'LE'00
L028910  ASC   'LOAD'00
L028915  ASC   'LONG'00
L02891A  ASC   'LOOP'00
L02891F  ASC   'LT'00
L028922  ASC   'NAME'00
L028927  ASC   'NE'00
L02892A  ASC   'NOR'00
L02892E  ASC   'NSTR'00
L028933  ASC   'OR'00
L028936  ASC   'PSTR'00
L02893B  ASC   'READ'00
L028940  ASC   'TYPE'00
L028945  ASC   'WORD'00
L02894A  ASC   'WRITE'00
L028950  ASC   'XOR'00
L028954  ASC   '#'00
L028956  ASC   'MUL'00
L02895A  ASC   'DIV'00
L02895E  ASC   'MOD'00
L028962  ASC   'SL'00
L028965  ASC   'SR'00
L028968  ASC   'PTEXT'00
L02896E  ASC   'INDEX'00
L028974  ASC   'TITLE'00

L02897A  TSC
         SEC
         SBC   #$0012
         TCS
         PHD
         TCD
         LDA   #$FFFF
         STA   $07
         LDA   #$0000
         STA   $09
         STA   $0B
         STA   $0D
         LDA   $16
         ORA   $18
         BNE   L028999
         BRL   L028A19
L028999  PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetSysWFlag
         PLA
         BNE   L028A19
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetWRefCon
         PLA
         STA   $0F
         PLA
         STA   $11
         PEA   $9302
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDA   [$01]
         BEQ   L028A06
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDA   [$01]
         STA   $09
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         TAX
         LDY   #$0002
         LDA   [$01],Y
         STX   $0D
         STA   $0B
L028A06  LDY   #$0002
         LDA   [$0F],Y
         TAX
         LDA   [$0F]
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         STA   $07
L028A19  LDA   $09
         STA   L024382
         LDX   $0D
         LDA   $0B
         STX   L024384+2
         STA   L024384
         LDA   $07
         STA   $05
         LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         TYA
         RTL

L028A3F  TSC
         SEC
         SBC   #$0078
         TCS
         PHD
         TCD
         LDA   #$2006
         STA   $5F
         LDA   #$001B
         STA   $61
         LDA   #$0000
         STA   $19
         STA   $17
         STA   $1D
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9002
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0B
         PEA   $9003
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _GetResourceAttr
         PLA
         STA   $09
         PEA   $9004
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEI   $7C
         _CountResources
         PLA
         STA   $1F
         PLA
         STA   $21
         JSL   L0202F5
         PHA
         PHA
         _GetPort
         PLA
         STA   $2B
         PLA
         STA   $2D
         PEI   $7C
         PEA   ^L02AC66
         PEA   L02AC66
         PEA   $0004
         _Int2Hex
         LDX   $80
         LDA   $7E
         PHX
         PHA
         PEA   ^L02ABF9
         PEA   L02ABF9
         PEA   $0008
         _Long2Hex
         PEA   $0000
         PEA   $003F
         PEA   $0000
         LDX   $80
         LDA   $7E
         PHX
         PHA
         PEI   $7C
         JSL   L025A27
         PHX
         PHA
         PEA   ^L02AC6B
         PEA   L02AC6B
         JSL   L02C7E6
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0FFE
         PEA   $800E
         _NewWindow2
         PLA
         STA   $27
         PLA
         STA   $29
         PEA   $9006
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $29
         LDA   $27
         PHX
         PHA
         _SetPort
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         _GetCtlHandleFromID
         PLA
         STA   $47
         PLA
         STA   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         STX   $41
         STA   $3F
         PEA   ^L02ABF9
         PEA   L02ABF9
         PEA   $0008
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LESetText
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         _GetCtlHandleFromID
         PLA
         STA   $47
         PLA
         STA   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         STX   $41
         STA   $3F
         PEA   ^L02AC6B
         PEA   L02AC6B
         JSL   L02C7C2
         STA   $11
         PEA   ^L02AC6B
         PEA   L02AC6B
         PEI   $11
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LESetText
         PEA   $0000
         PEI   $11
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LESetSelect
         LDA   $09
         AND   #$0300
         STA   $0F
         LDA   $0F
         BNE   L028C76
         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0005
         _GetCtlHandleFromID
         _SetCtlValue
         BRL   L028CFA
L028C76  LDA   $0F
         CMP   #$0100
         BNE   L028CA5
         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0006
         _GetCtlHandleFromID
         _SetCtlValue
         BRA   L028CFA
L028CA5  LDA   $0F
         CMP   #$0200
         BNE   L028CD4
         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0007
         _GetCtlHandleFromID
         _SetCtlValue
         BRA   L028CFA
L028CD4  LDA   #$0001
         PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0008
         _GetCtlHandleFromID
         _SetCtlValue
L028CFA  LDA   #$0009
         STA   $07
L028CFF  LDA   $07
         BMI   L028D08
         CMP   #$0011
         BCS   L028D46
L028D08  LDA   $07
         SEC
         SBC   #$0006
         ASL
         TAX
         LDA   L02AC2E,X
         AND   $09
         BEQ   L028D42
         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L028D2C
         DEX
L028D2C  PHX
         PHA
         _GetCtlHandleFromID
         _SetCtlValue
L028D42  INC   $07
         BRA   L028CFF
L028D46  PHA
         PEA   $FFFF
         PEA   $0000
         TDC
         CLC
         ADC   #$004B
         PHA
         _TaskMaster
         PLA
         STA   $0D
         CMP   #$0008
         BNE   L028D8B
         PEA   $0088
         PEA   $0012
         _MoveTo
         PEA   ^L02AC66
         PEA   L02AC66
         PEA   $0004
         _DrawText
         BRL   L0297D9
L028D8B  LDA   $0D
         CMP   #$0014
         BNE   L028DE3
         PEA   $0000
         TDC
         CLC
         ADC   #$0033
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $027F
         PEA   $00C7
         _SetRect
         PEA   $0000
         PEI   $57
         PEI   $55
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$0033
         PHA
         LDA   $5B
         LDX   $5D
         PHX
         PHA
         _DragWindow
         PEA   $9020
         JSL   L02CA27
         PHA
         JSL   L027CEB
         BRL   L0297D9
L028DE3  LDA   $0D
         CMP   #$0021
         BEQ   L028DED
         BRL   L0297D9
L028DED  LDA   $71
         LDX   $73
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         CMP   $01,S
         BEQ   L028DFF
         DEY
L028DFF  TXA
         CMP   $03,S
         BEQ   L028E07
         LDY   #$0000
L028E07  PLA
         PLA
         TYA
         BNE   L028E0F
         BRL   L029763
L028E0F  LDA   #$0001
         STA   $1D
         LDA   #$0000
         STA   $09
         LDA   #$0006
         STA   $07
L028E1E  LDA   $07
         BMI   L028E27
         CMP   #$0011
         BCS   L028E65
L028E27  PHA
         PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L028E39
         DEX
L028E39  PHX
         PHA
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         BEQ   L028E61
         LDA   $07
         SEC
         SBC   #$0006
         ASL
         TAX
         LDA   L02AC2E,X
         ORA   $09
         STA   $09
L028E61  INC   $07
         BRA   L028E1E
L028E65  LDA   $19
         CMP   #$0001
         BEQ   L028E6F
         BRL   L029382
L028E6F  PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         _GetCtlHandleFromID
         PLA
         STA   $47
         PLA
         STA   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         STX   $41
         STA   $3F
         PHA
         PHA
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LEGetTextHand
         PLA
         STA   $3B
         PLA
         STA   $3D
         PHA
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LEGetTextLen
         PLA
         STA   $15
         PHA
         PHA
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         PHX
         PHA
         PEI   $15
         _Hex2Long
         PLA
         STA   $23
         PLA
         STA   $25
         LDX   $25
         LDA   $23
         CMP   $7E
         BNE   L028EFC
         CPX   $80
L028EFC  BNE   L028F01
         BRL   L029382
L028F01  LDY   #$0000
         LDA   $23
         ORA   $25
         BNE   L028F0B
         INY		; bad ID (00000000) - v1.3.6 - allow all ranges of resource IDs
L028F0B  TYA
         LDX   #$0000
         TAY
         BPL   L028F13
         DEX
L028F13  STX   $01
         ORA   $01
         BEQ   L028F1E
         LDA   #$0001	; bad ID
*         BRA   L028F38
L028F1E
*         PEI   $25
*         LDA   $23
*         AND   #$0000
*         PHA
*         LDA   $03,S
*         AND   #$F800
*         STA   $03,S
*         PLA
*         STA   $01
*         PLA
*         ORA   $01
*         BEQ   L028F38
*         LDA   #$0001	; bad ID (07FF0000++)
L028F38  CMP   #$0000
         BEQ   L028F42
         LDA   #$0001
         BRA   L028F58
L028F42  JSL   L02CA27	; get GS/OS error code
         LDX   #$0000
         CMP   #$0000
         BEQ   L028F4F
         INX
L028F4F  TXA
         CMP   #$0000
         BEQ   L028F58
         LDA   #$0001
L028F58  TAX		; bad resource ID range
         BEQ   L028F82	; if entry value <> 0
         PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0015
         _AlertWindow
         PLA
         STA   $1B
         LDA   #$0000
         STA   $19
         STA   $1D
         BRL   L0290A3
L028F82  LDX   $80	; resource ID range is OK
         LDA   $7E
         PHX
         PHA
         PEI   $7C
         JSL   L027C72
         PHX
         PHA
         LDA   $01,S
         STA   $2F
         LDA   $03,S
         STA   $31
         LDA   #$0000
         TAX
         LDY   #$0001
         CMP   $01,S
         BEQ   L028FA4
         DEY
L028FA4  TXA
         CMP   $03,S
         BEQ   L028FAC
         LDY   #$0000
L028FAC  PLA
         PLA
         TYA
         BNE   L028FD8
         PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0014
         _AlertWindow
         PLA
         STA   $1B
         LDA   #$0000
         STA   $19
         STA   $1D
         BRL   L0290A3
L028FD8  LDA   #$0000
         STA   $13
L028FDD  LDX   $21
         LDA   $1F
         SEC
         SBC   $13
         BEQ   L028FED
         BVS   L028FEB
         EOR   #$8000
L028FEB  BMI   L028FF0
L028FED  BRL   L0290A3
L028FF0  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L029022
         DEX
L029022  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         CMP   $23
         BNE   L029043
         CPX   $25
L029043  BNE   L02909E
         PEA   $0000
         PEI   $7C
         JSL   L02597E
         PHX
         PHA
         PEA   ^L02494D
         PEA   L02494D
         JSL   L02C78E
         LDX   $25
         LDA   $23
         PHX
         PHA
         PEA   ^L02982C
         PEA   L02982C
         PEA   ^L02494D
         PEA   L02494D
         LDA   #$0020
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C68C
         PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0013
         _AlertWindow
         PLA
         STA   $1B
         LDA   #$0000
         STA   $19
         STA   $1D
         BRA   L0290A3
L02909E  INC   $13
         BRL   L028FDD
L0290A3  LDA   $19
         CMP   #$0001
         BEQ   L0290AD
         BRL   L0292AA
L0290AD  PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0010
         _AlertWindow
         PLA
         STA   $1B
         LDA   $1B
         BNE   L0290D1
         BRL   L0292A3
L0290D1  LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9032
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0B
         PEA   $9033
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $0000
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _SetResourceAttr
         PEA   $9034
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _LoadResource
         PLA
         STA   $43
         PLA
         STA   $45
         PEA   $9035
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _DetachResource
         LDX   $45
         LDA   $43
         PHX
         PHA
         _HLock
         LDX   $45
         LDA   $43
         PHX
         PHA
         PEA   $0000
         PEI   $7C
         LDX   $25
         LDA   $23
         PHX
         PHA
         _AddResource
         PEA   $9038
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $7C
         LDX   $25
         LDA   $23
         PHX
         PHA
         _WriteResource
         PEA   $9039
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _RemoveResource
         PEA   $903A
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0000
         STA   $13
L0291D9  LDX   $21
         LDA   $1F
         SEC
         SBC   $13
         BEQ   L0291E9
         BVS   L0291E7
         EOR   #$8000
L0291E7  BMI   L0291EC
L0291E9  BRL   L0292A1
L0291EC  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02921E
         DEX
L02921E  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         CMP   $7E
         BNE   L02923F
         CPX   $80
L02923F  BNE   L02929C
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L029273
         DEX
L029273  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0005
         STA   $01
         PLA
         STA   $03
         LDA   $23
         STA   [$01]
         LDY   #$0002
         LDA   $25
         STA   [$01],Y
         LDA   $23
         LDX   $25
         STA   $7E
         STX   $80
         BRA   L0292A1
L02929C  INC   $13
         BRL   L0291D9
L0292A1  BRA   L0292AA
L0292A3  LDA   #$0000
         STA   $19
         STA   $1D
L0292AA  LDA   $19
         BEQ   L0292B1
         BRL   L029382
L0292B1  LDX   $80
         LDA   $7E
         PHX
         PHA
         PEA   ^L02ABF9
         PEA   L02ABF9
         PEA   $0008
         _Long2Hex
         PEA   ^L02ABF9
         PEA   L02ABF9
         PEA   $0008
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LESetText
         PEA   $0000
         TDC
         CLC
         ADC   #$0033
         PHA
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0035
         PHA
         LDA   [$47],Y
         TAX
         LDA   [$47]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0037
         PHA
         LDA   [$47],Y
         TAX
         LDA   [$47]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0039
         PHA
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0033
         PHA
         _InvalRect
L029382  LDA   $17
         LDX   #$0000
         CMP   #$0001
         BNE   L02938D
         INX
L02938D  TXA
         CMP   #$0000
         BEQ   L0293A7
         LDA   $1D
         LDX   #$0000
         CMP   #$0001
         BNE   L02939E
         INX
L02939E  TXA
         CMP   #$0000
         BEQ   L0293A7
         LDA   #$0001
L0293A7  TAX
         BNE   L0293AD
         BRL   L0296AF
L0293AD  PHA
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         _GetCtlHandleFromID
         PLA
         STA   $47
         PLA
         STA   $49
         LDY   #$0002
         LDA   [$47],Y
         TAX
         LDA   [$47]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         STX   $41
         STA   $3F
         PHA
         PHA
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LEGetTextHand
         PLA
         STA   $3B
         PLA
         STA   $3D
         PHA
         LDX   $41
         LDA   $3F
         PHX
         PHA
         _LEGetTextLen
         PLA
         STA   $15
         LDX   #$0000
         TAY
         BPL   L029419
         DEX
L029419  PHX
         PHA
         LDY   #$0002
         LDA   [$3B],Y
         TAX
         LDA   [$3B]
         PHX
         PHA
         PEA   ^L02ACAB
         PEA   L02ACAB
         JSL   L02C7E6
         LDX   $15
         SEP   #$20
         LDA   #$00
         STA   L02ACAB,X
         REP   #$20
         PEA   ^L02ACAB
         PEA   L02ACAB
         PEA   ^L02AC6B
         PEA   L02AC6B
         JSL   L02C751
         TAX
         BNE   L029450
         BRL   L0296AF
L029450  PEA   ^L02ACAB
         PEA   L02ACAB
         JSL   L02C395
         PHX
         PHA
         PEA   ^L02ACAB
         PEA   L02ACAB
         JSL   L02BF46
         LDA   #$0000
         STA   $13
L02946B  LDX   $21
         LDA   $1F
         SEC
         SBC   $13
         BEQ   L02947B
         BVS   L029479
         EOR   #$8000
L029479  BMI   L02947E
L02947B  BRL   L02958D
L02947E  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0294B0
         DEX
L0294B0  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         CMP   $7E
         BNE   L0294D1
         CPX   $80
L0294D1  BNE   L0294D6
         BRL   L029588
L0294D6  PEA   ^L02ACAB
         PEA   L02ACAB
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02950E
         DEX
L02950E  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L02BF98
         TAX
         BNE   L029588
         PEA   $0000
         PEI   $7C
         JSL   L02597E
         PHX
         PHA
         PEA   ^L02494D
         PEA   L02494D
         JSL   L02C78E
         PEA   ^L02ACAB
         PEA   L02ACAB
         JSL   L02C440
         PHX
         PHA
         PEA   ^L02494D
         PEA   L02494D
         LDA   #$0020
         CLC
         ADC   $01,S
         STA   $01,S
         JSL   L02C78E
         PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0012
         _AlertWindow
         PLA
         STA   $1B
         LDA   #$0000
         STA   $17
         STA   $1D
         BRA   L02958D
L029588  INC   $13
         BRL   L02946B
L02958D  LDA   $17
         CMP   #$0001
         BEQ   L029597
         BRL   L0296AF
L029597  LDA   #$0000
         STA   $13
L02959C  LDX   $21
         LDA   $1F
         SEC
         SBC   $13
         BEQ   L0295AC
         BVS   L0295AA
         EOR   #$8000
L0295AA  BMI   L0295AF
L0295AC  BRL   L0296AF
L0295AF  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L0295E1
         DEX
L0295E1  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0007
         LDA   [$01],Y
         TAX
         LDY   #$0005
         LDA   [$01],Y
         CMP   $7E
         BNE   L029602
         CPX   $80
L029602  BEQ   L029607
         BRL   L0296AA
L029607  LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L029639
         DEX
L029639  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         CLC
         ADC   #$0009
         PLX
         STA   $01
         STX   $03
         LDA   #$0001
         STA   [$01]
         PEA   ^L02ACAB
         PEA   L02ACAB
         LDX   L0240FE
         LDA   L0240FC
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         LDY   #$0032
         LDA   [$01],Y
         PHA
         LDY   #$0030
         LDA   [$01],Y
         PHA
         LDA   $13
         LDX   #$000B
         JSL   L02DB64
         LDX   #$0000
         TAY
         BPL   L02968A
         DEX
L02968A  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L02BF46
         BRA   L0296AF
L0296AA  INC   $13
         BRL   L02959C
L0296AF  LDA   $1D
         BNE   L0296B6
         BRL   L029761
L0296B6  LDA   $17
         LDX   #$0000
         CMP   #$0001
         BNE   L0296C1
         INX
L0296C1  TXA
         CMP   #$0000
         BEQ   L0296CC
         LDA   #$0001
         BRA   L0296E0
L0296CC  LDA   $19
         LDX   #$0000
         CMP   #$0001
         BNE   L0296D7
         INX
L0296D7  TXA
         CMP   #$0000
         BEQ   L0296E0
         LDA   #$0001
L0296E0  TAX
         BEQ   L029706
         PEI   $7C
         JSL   L023D5F
         JSL   L022467
         PEI   $7C
         JSL   L02333E
         PEA   $0000
         PEI   $7C
         JSL   L0229B5
         LDX   $80
         LDA   $7E
         PHX
         PHA
         JSL   L023681
L029706  LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9042
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $0B
         PEA   $9043
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $09
         PEI   $7C
         LDX   $80
         LDA   $7E
         PHX
         PHA
         _SetResourceAttr
         PEA   $9044
         JSL   L02CA27
         PHA
         JSL   L027CEB
         JSL   L0202F5
L029761  BRA   L0297D9
L029763  LDA   $71
         LDX   $73
         PHX
         PHA
         LDA   #$0002
         LDX   #$0000
         LDY   #$0001
         CMP   $01,S
         BEQ   L029777
         DEY
L029777  TXA
         CMP   $03,S
         BEQ   L02977F
         LDY   #$0000
L02977F  PLA
         PLA
         TYA
         BEQ   L02978B
         LDA   #$0001
         STA   $1D
         BRA   L0297D9
L02978B  LDA   $71
         LDX   $73
         PHX
         PHA
         LDA   #$0003
         LDX   #$0000
         LDY   #$0001
         CMP   $01,S
         BEQ   L02979F
         DEY
L02979F  TXA
         CMP   $03,S
         BEQ   L0297A7
         LDY   #$0000
L0297A7  PLA
         PLA
         TYA
         BEQ   L0297B3
         LDA   #$0001
         STA   $17
         BRA   L0297D9
L0297B3  LDA   $71
         LDX   $73
         PHX
         PHA
         LDA   #$0004
         LDX   #$0000
         LDY   #$0001
         CMP   $01,S
         BEQ   L0297C7
         DEY
L0297C7  TXA
         CMP   $03,S
         BEQ   L0297CF
         LDY   #$0000
L0297CF  PLA
         PLA
         TYA
         BEQ   L0297D9
         LDA   #$0001
         STA   $19
L0297D9  LDA   $1D
         BEQ   L0297E0
         LDA   #$0001
L0297E0  EOR   #$0001
         BEQ   L0297E8
         BRL   L028D46
L0297E8  LDX   $29
         LDA   $27
         PHX
         PHA
         _CloseWindow
         PEA   $9050
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _SetPort
         LDA   #$0000
         STA   $05
         LDA   $7A
         STA   $80
         LDA   $79
         STA   $7F
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$007E
         TCS
         TYA
         RTL

L02982C  ASC   '%0.8lX'00

L029833  TSC
         SEC
         SBC   #$000E
         TCS
         PHD
         TCD
         LDX   $16
         LDA   $14
         PHX
         PHA
         PEI   $12
         JSL   L027C72
         STX   $0D
         STA   $0B
         ORA   $0D
         BEQ   L02986E
         PHA
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0009
         _AlertWindow
         PLA
         STA   $07
         BRA   L02988B
L02986E  PHA
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         _AlertWindow
         PLA
         STA   $07
L02988B  LDA   $07
         BEQ   L0298F4
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9102
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $09
         PEA   $9103
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $12
         LDX   $16
         LDA   $14
         PHX
         PHA
         _RemoveResource
         PEA   $9104
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $16
         LDA   $14
         PHX
         PHA
         PEI   $12
         JSL   L023AB0
         JSL   L0202F5
L0298F4  LDA   $07
         STA   $05
         LDA   $10
         STA   $16
         LDA   $0F
         STA   $15
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         RTL

L02990B  TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9202
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $09
         PEA   $9203
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEI   $0E
         LDX   $12
         LDA   $10
         PHX
         PHA
         _GetResourceAttr
         PLA
         STA   $07
         PEA   $9204
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $07
         AND   #$0080
         BNE   L029976
         BRL   L0299FC
L029976  JSL   L0202F5
         PHA
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0008
         _AlertWindow
         PLA
         BNE   L02999E
         LDA   #$FFFF
         STA   $05
         BRA   L029A05
L02999E  LDA   $07
         AND   #$FF7F
         STA   $07
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9212
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $09
         PEA   $9213
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $07
         PEI   $0E
         LDX   $12
         LDA   $10
         PHX
         PHA
         _SetResourceAttr
         PEA   $9214
         JSL   L02CA27
         PHA
         JSL   L027CEB
L0299FC  JSL   L0202F5
         LDA   #$0000
         STA   $05
L029A05  LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         RTL

L029A18  TSC
         SEC
         SBC   #$0026
         TCS
         PHD
         TCD
         PHA
         PHA
         _FrontWindow
         PLA
         STA   $1B
         PLA
         STA   $1D
         PEA   $9402
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $1B
         ORA   $1D
         BNE   L029A47
         BRL   L029C78
L029A47  PHA
         PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetWRefCon
         PLA
         STA   $1F
         PLA
         STA   $21
         PEA   $9403
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDY   #$0002
         LDA   [$1F],Y
         TAX
         LDA   [$1F]
         STA   $01
         STX   $03
         LDA   [$01]
         CMP   #$800E
         BNE   L029A99
         LDA   #L024394
         STA   $23
         LDA   #^L024394
         STA   $25
         PEI   $25
         PEI   $23
         LDA   [$23]
         ORA   #$8000
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L029A99  PHA
         PHA
         _GetPort
         PLA
         STA   $17
         PLA
         STA   $19
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _SetPort
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         _GetPortRect
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         _LocalToGlobal
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         _LocalToGlobal
         LDA   $2A
         AND   #$0001
         BEQ   L029B55
         PEA   $0000
         TDC
         CLC
         ADC   #$0009
         PHA
         PEI   $09
         LDA   $0D
         SEC
         SBC   $01,S
         STA   $01,S
         LDA   #$0280
         SEC
         SBC   $01,S
         PLX
         LDX   #$0002
         JSL   L02D661
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetWFrame
         PLA
         AND   #$1000
         BEQ   L029B55
         STZ   $25
         TDC
         CLC
         ADC   #$0009
         STA   $23
         PEI   $25
         PEI   $23
         LDA   [$23]
         SEC
         SBC   #$000C
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L029B55  LDA   $2A
         AND   #$0002
         BNE   L029B5F
         BRL   L029C44
L029B5F  PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         PEI   $07
         LDA   $0B
         SEC
         SBC   $01,S
         STA   $01,S
         LDA   #$00BB
         SEC
         SBC   $01,S
         PLX
         LDX   #$0002
         JSL   L02D661
         CLC
         ADC   #$000D
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetWFrame
         PLA
         AND   #$8000
         BEQ   L029BBD
         STZ   $25
         TDC
         CLC
         ADC   #$0007
         STA   $23
         PEI   $25
         PEI   $23
         LDA   [$23]
         CLC
         ADC   #$0006
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L029BBD  PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetWFrame
         PLA
         AND   #$0800
         BEQ   L029BEF
         STZ   $25
         TDC
         CLC
         ADC   #$0007
         STA   $23
         PEI   $25
         PEI   $23
         LDA   [$23]
         SEC
         SBC   #$0006
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L029BEF  PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetWFrame
         PLA
         AND   #$0010
         BEQ   L029C44
         PEA   $0000
         TDC
         CLC
         ADC   #$000F
         PHA
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _GetRectInfo
         STZ   $25
         TDC
         CLC
         ADC   #$0007
         STA   $23
         PEI   $25
         PEI   $23
         LDA   [$23]
         PHA
         LDA   $13
         LDX   #$0002
         JSL   L02D661
         CLC
         ADC   $01,S
         PLX
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
L029C44  LDA   $09
         AND   #$FFFE
         PHA
         PEI   $07
         LDX   $1D
         LDA   $1B
         PHX
         PHA
         _MoveWindow
         PEA   $9410
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $19
         LDA   $17
         PHX
         PHA
         _SetPort
L029C78  LDA   #$0000
         STA   $05
         LDA   $28
         STA   $2A
         LDA   $27
         STA   $29
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         TYA
         RTL

L029C90  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         _GrafOff
         PEA   ^L029CB8
         PEA   L029CB8
         JSL   L02C482
         JSL   L02C3D4
         PLD
         TSC
         CLC
         ADC   #$0004
         TCS
         RTL

L029CB8  ASC   'A fatal error occurred during GENESYS startup!'0A
         ASC   'Press RETURN to exit: '00

L029CFD  ENT
         TSC
         SEC
         SBC   #$0008
         TCS
         PHD
         TCD
         LDA   #$0000
         STA   $05
         STA   $07
         LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
         RTL

L029D22  TSC
         SEC
         SBC   #$00FD
         TCS
         PHD
         TCD
         LDA   #$0009
         STA   $7E
         LDX   #$0101
         LDA   $02,X
         PHA
         LDA   $00,X
         STA   $80
         PLA
         STA   $82
         LDA   #$0001
         STA   $84
         LDA   #$0000
         STA   $86
         STA   $88
         STA   $8A
         STA   $8C
         SEP   #$20
         LDA   #$00
         STA   $8E
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $8F
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $90
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $91
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $92
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $93
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $94
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $95
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $96
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $97
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $98
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $99
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $9A
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $9B
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $9C
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $9D
         REP   #$20
         LDA   #$0000
         STA   $9E
         STA   $A0
         STA   $A2
         STA   $A4
         STA   $A6
         STA   $A8
         STA   $AA
         STA   $AC
         STA   $AE
         STA   $B0
         LDA   #$0002
         STA   $B2
         LDA   #$0000
         STA   $B4
         LDX   #$0101
         LDA   $02,X
         PHA
         LDA   $00,X
         STA   $B6
         PLA
         STA   $B8
         LDA   #$0000
         STA   $BA
         STA   $BC
         STA   $BE
         STA   $C0
         STA   $C2
         STA   $C4
         STA   $C6
         SEP   #$20
         LDA   #$00
         STA   $C8
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $C9
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CA
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CB
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CC
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CD
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CE
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $CF
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D0
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D1
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D2
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D3
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D4
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D5
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D6
         REP   #$20
         SEP   #$20
         LDA   #$00
         STA   $D7
         REP   #$20
         LDA   #$0000
         STA   $D8
         STA   $DA
         STA   $DC
         STA   $DE
         STA   $E0
         STA   $E2
         STA   $E4
         STA   $E6
         STA   $E8
         STA   $EA
         LDA   #$2006
         STA   $64
         LDA   #$001B
         STA   $66
         LDA   #$0000
         STA   $18
         STA   $1A
         PHA
         PHA
         _GetPort
         PLA
         STA   $40
         PLA
         STA   $42
         PEA   $2006
         PEA   $0000
         TDC
         CLC
         ADC   #$007E
         PHA
         JSL   L02C243
         PEA   $9E02
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   $A2
         LDX   $A4
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         CMP   $01,S
         BEQ   L029EF3
         DEY
L029EF3  TXA
         CMP   $03,S
         BEQ   L029EFB
         LDY   #$0000
L029EFB  PLA
         PLA
         TYA
         BNE   L029F05
         LDA   #$0073
         BRA   L029F08
L029F05  LDA   #$0020
L029F08  SEP   #$20
         STA   $11
         REP   #$20
         PEI   $86
         PEA   ^L02A580
         PEA   L02A580
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         JSL   L02C68C
         LDA   $88
         LDX   $8A
         PHX
         PHA
         PEA   ^L02A587
         PEA   L02A587
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         JSL   L02C68C
         LDA   $11
         AND   #$00FF
         BIT   #$0080
         BEQ   L029F49
         ORA   #$FF00
L029F49  CMP   #$0000
         PHA
         LDA   $A2
         LDX   $A4
         PHX
         PHA
         PEA   ^L02A58F
         PEA   L02A58F
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         JSL   L02C68C
         LDA   L0240DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0012
         PHA
         PEA   $0004
         _Int2Hex
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L026AB5
         PEA   L026AB5
         PEA   $0000
         PEA   $0000
         PEA   $0002
         PEA   $0000
         PEA   $0FFC
         PEA   $800E
         _NewWindow2
         PLA
         STA   $3C
         PLA
         STA   $3E
         PEA   $9E04
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $3E
         LDA   $3C
         PHX
         PHA
         _SetPort
         PHA
         PHA
         LDX   $3E
         LDA   $3C
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         _GetCtlHandleFromID
         PLA
         STA   $38
         PLA
         STA   $3A
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         PHX
         STA   $30
         PLA
         STA   $32
         PEA   $0000
         TDC
         CLC
         ADC   #$0012
         PHA
         PEA   $0004
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LESetText
         PEA   $0000
         PEA   $0004
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LESetSelect
L02A03F  PHA
         PEA   $FFFF
         PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         _TaskMaster
         PLA
         STA   $1C
         CMP   #$0014
         BNE   L02A0A3
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $027F
         PEA   $00C7
         _SetRect
         PEA   $0000
         PEI   $5C
         PEI   $5A
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         LDA   $60
         LDX   $62
         PHX
         PHA
         _DragWindow
         BRL   L02A477
L02A0A3  LDA   $1C
         CMP   #$0021
         BEQ   L02A0AD
         BRL   L02A477
L02A0AD  LDA   $76
         LDX   $78
         PHX
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         CMP   $01,S
         BEQ   L02A0BF
         DEY
L02A0BF  TXA
         CMP   $03,S
         BEQ   L02A0C7
         LDY   #$0000
L02A0C7  PLA
         PLA
         TYA
         BNE   L02A0CF
         BRL   L02A451
L02A0CF  LDA   #$0001
         STA   $18
         PHA
         PHA
         LDX   $3E
         LDA   $3C
         PHX
         PHA
         PEA   $0000
         PEA   $0003
         _GetCtlHandleFromID
         PLA
         STA   $38
         PLA
         STA   $3A
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         STA   $01
         STX   $03
         LDY   #$001E
         LDA   [$01],Y
         TAX
         LDY   #$001C
         LDA   [$01],Y
         STX   $32
         STA   $30
         PHA
         PHA
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LEGetTextHand
         PLA
         STA   $2C
         PLA
         STA   $2E
         PHA
         LDY   #$0002
         LDA   [$2C],Y
         TAX
         LDA   [$2C]
         PHX
         PHA
         PHA
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LEGetTextLen
         PLA
         PHA
         _Hex2Int
         PLA
         STA   $1E
         LDX   #$0000
         CMP   #$0000
         BNE   L02A159
         INX
L02A159  TXA
         CMP   #$0000
         BEQ   L02A164
         LDA   #$0001
         BRA   L02A17A
L02A164  JSL   L02CA27
         LDX   #$0000
         CMP   #$0000
         BEQ   L02A171
         INX
L02A171  TXA
         CMP   #$0000
         BEQ   L02A17A
         LDA   #$0001
L02A17A  TAX
         BNE   L02A180
         BRL   L02A295
L02A180  PHA
         PEA   $0004
         PEA   ^L0245B2
         PEA   L0245B2
         PEA   $0000
         PEA   $0016
         _AlertWindow
         PLA
         STA   $1A
         LDA   L0240DA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0012
         PHA
         PEA   $0004
         _Int2Hex
         PEA   $0000
         TDC
         CLC
         ADC   #$0012
         PHA
         PEA   $0004
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LESetText
         PEA   $0000
         PEA   $0004
         LDX   $32
         LDA   $30
         PHX
         PHA
         _LESetSelect
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDA   [$01]
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDA   [$38],Y
         TAX
         LDA   [$38]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         LDA   [$38],Y
         TAX
         LDA   [$38]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         CLC
         ADC   #$0008
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         PEA   $0000
         TDC
         CLC
         ADC   #$0024
         PHA
         _InvalRect
         LDA   #$0008
         STA   $1C
         LDA   #$0000
         STA   $18
         BRL   L02A44F
L02A295  _WaitCursor
         LDA   $1E
         STA   L0240DA
         PHA
         PHA
         LDA   $A2
         LDX   $A4
         PHX
         PHA
         LDA   L024112
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $34
         PLA
         STA   $36
         JSL   L02CA27
         STA   $1A
         LDA   $1A
         BEQ   L02A2D6
         BRL   L02A44F
L02A2D6  LDX   $36
         LDA   $34
         PHX
         PHA
         _HLock
         PEA   $2010
         PEA   $0000
         TDC
         CLC
         ADC   #$00B2
         PHA
         JSL   L02C243
         PEA   $9E30
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0004
         STA   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$00EE
         PHA
         LDA   $B4
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDY   #$0002
         LDA   [$34],Y
         PHA
         LDA   [$34]
         STA   $F0
         PLA
         STA   $F2
         LDA   $A2
         LDX   $A4
         PHX
         STA   $F4
         PLA
         STA   $F6
         PEA   $2012
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L02C243
         PEA   $9E31
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0001
         STA   $EC
         PEA   $2014
         PEA   $0000
         TDC
         CLC
         ADC   #$00EC
         PHA
         JSL   L02C243
         PEA   $9E32
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9E40
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $16
         PEA   $9E41
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEA   $FFFF
         PEI   $1E
         _UniqueResourceID
         PLA
         STA   $20
         PLA
         STA   $22
         PEA   $9E42
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $36
         LDA   $34
         PHX
         PHA
         PEA   $0000
         PEI   $1E
         LDX   $22
         LDA   $20
         PHX
         PHA
         _AddResource
         PEA   $9E43
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEI   $1E
         LDX   $22
         LDA   $20
         PHX
         PHA
         _WriteResource
         PEA   $9E44
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $FFFF
         PEI   $1E
         LDX   $22
         LDA   $20
         PHX
         PHA
         _ReleaseResource
         PEA   $9E45
         JSL   L02CA27
         PHA
         JSL   L027CEB
         JSL   L022467
         PEI   $1E
         JSL   L02333E
         PEA   $0000
         PEI   $1E
         JSL   L0229B5
         LDX   $22
         LDA   $20
         PHX
         PHA
         JSL   L023681
         JSL   L0202F5
L02A44F  BRA   L02A477
L02A451  LDA   $76
         LDX   $78
         PHX
         PHA
         LDA   #$0002
         LDX   #$0000
         LDY   #$0001
         CMP   $01,S
         BEQ   L02A465
         DEY
L02A465  TXA
         CMP   $03,S
         BEQ   L02A46D
         LDY   #$0000
L02A46D  PLA
         PLA
         TYA
         BEQ   L02A477
         LDA   #$0001
         STA   $18
L02A477  LDA   $1C
         CMP   #$0008
         BEQ   L02A481
         BRL   L02A51E
L02A481  PEA   $006A
         PEA   $000C
         _MoveTo
         LDX   #$0105
         LDA   $02,X
         PHA
         LDA   $00,X
         CLC
         ADC   #$0002
         PHA
         LDA   $02,X
         PHA
         LDA   $00,X
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         PHA
         _DrawText
         PEA   $006A
         PEA   $0015
         _MoveTo
         PEA   $0000
         TDC
         CLC
         ADC   #$0007
         PHA
         _DrawCString
         PEA   $006A
         PEA   $001E
         _MoveTo
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         _DrawCString
         PEA   $006A
         PEA   $0027
         _MoveTo
         PEA   $0000
         TDC
         CLC
         ADC   #$0044
         PHA
         _DrawCString
L02A51E  LDA   $18
         BEQ   L02A525
         LDA   #$0001
L02A525  EOR   #$0001
         BEQ   L02A52D
         BRL   L02A03F
L02A52D  LDX   $3E
         LDA   $3C
         PHX
         PHA
         _CloseWindow
         PEA   $9E50
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDX   $42
         LDA   $40
         PHX
         PHA
         _SetPort
         _InitCursor
         LDA   $1A
         STA   $05
         LDX   #$00FE
         LDA   $00,X
         LDY   $01,X
         LDX   #$0106
         STA   $00,X
         STY   $01,X
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0105
         TCS
         TYA
         RTL

L02A580  ASC   '$%0.2X'00
L02A587  ASC   '$%0.4lX'00
L02A58F  ASC   '%lu byte%c'00
         MX    %00

L02A59A  TSC
         SEC
         SBC   #$007A
         TCS
         PHD
         TCD
         LDA   #$0001
         STA   $11
         LDA   $7E
         STA   $13
	 sta   $19
	 sta   $33
         LDA   $80
         STA   $15
	 sta   $1b
	 sta   $35
         LDA   #$0004
         STA   $17
*         LDA   $7E
*         STA   $19
*         LDA   $80
*         STA   $1B
         LDA   #$00C3
         STA   $1D
         LDA   #$0006
         STA   $1F

*         LDA   #$0000
         STz   $21
         STz   $23
         STz   $25
         STz   $27
         STz   $29
         STz   $2B
         STz   $2D
         LDA   #$0003
         STA   $2F
	 sta   $37
*         LDA   #$0000
         STz   $31
*         LDA   $7E
*         STA   $33
*         LDA   $80
*         STA   $35
*         LDA   #$0003
*         STA   $37
*         LDA   #$0000
         STz   $39
         STz   $3B
         STz   $3D
         STz   $3F
         STz   $41
         STz   $43

	 stz	$45
	 stz	$47
	 stz	$49
	 stz	$4b
	 stz	$4d
	 stz	$4f
	 stz	$51
	 stz	$53
	 
*        SEP   #$20
*        LDA   #$00
*        STA   $45
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $46
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $47
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $48
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $49
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4A
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4B
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4C
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4D
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4E
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $4F
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $50
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $51
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $52
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $53
*        REP   #$20
*        SEP   #$20
*        LDA   #$00
*        STA   $54
*        REP   #$20
*        LDA   #$0000
         STz   $55
         STz   $57
         STz   $59
         STz   $5B
         STz   $5D
         STz   $5F
         STz   $61
         STz   $63
         STz   $65
         STz   $67
         _WaitCursor
         LDA   L0240D6
         PHA
         _SetCurResourceFile
         PEA   $9F02
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   $07
         PEA   $9F03
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEI   $82
         LDX   $86
         LDA   $84
         PHX
         PHA
         _GetResourceAttr
         PLA
         STA   $0B
         PEA   $9F04
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PEA   $0000
         PEI   $82
         LDX   $86
         LDA   $84
         PHX
         PHA
         _SetResourceAttr
         PEA   $9F05
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PHA
         PEI   $82
         LDX   $86
         LDA   $84
         PHX
         PHA
         _LoadResource
         PLA
         STA   $0D
         PLA
         STA   $0F
         JSL   L02CA27
         STA   $09
         PEI   $0B
         PEI   $82
         LDX   $86
         LDA   $84
         PHX
         PHA
         _SetResourceAttr
         PEA   $9F07
         JSL   L02CA27
         PHA
         JSL   L027CEB
         PHA
         PEI   $07
         _SetResourceFileDepth
         PLA
         STA   $07
         PEA   $9F08
         JSL   L02CA27
         PHA
         JSL   L027CEB
         JSL   L0202F5
         LDA   $09
         BEQ   L02A77F
         BRL   L02A857
L02A77F  PEI   $82
         LDX   $86
         LDA   $84
         PHX
         PHA
         _DetachResource
         LDX   $0F
         LDA   $0D
         PHX
         PHA
         _HLock
         PEA   $2002
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PHA
         JSL   L02C243
         PEA   $2001
         PEA   $0000
         TDC
         CLC
         ADC   #$0017
         PHA
         JSL   L02C243
         JSL   L02CA27
         STA   $09
         TAX
         BEQ   L02A7CD
         BRL   L02A857
L02A7CD  PEA   $2010
         PEA   $0000
         TDC
         CLC
         ADC   #$002F
         PHA
         JSL   L02C243
         PEA   $9F10
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0004
         STA   $69
         PEA   $0000
         TDC
         CLC
         ADC   #$006B
         PHA
         LDA   $31
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDY   #$0002
         LDA   [$0D],Y
         PHA
         LDA   [$0D]
         STA   $6D
         PLA
         STA   $6F
         PHA
         PHA
         LDX   $0F
         LDA   $0D
         PHX
         PHA
         _GetHandleSize
         PLA
         STA   $71
         PLA
         STA   $73
         PEA   $2013
         PEA   $0000
         TDC
         CLC
         ADC   #$0069
         PHA
         JSL   L02C243
         PEA   $9F20
         JSL   L02CA27
         PHA
         JSL   L027CEB
         LDA   #$0001
         STA   $69
         PEA   $2014
         PEA   $0000
         TDC
         CLC
         ADC   #$0069
         PHA
         JSL   L02C243
L02A857  LDX   $0F
         LDA   $0D
         PHX
         PHA
         _DisposeHandle
         _InitCursor
         LDA   $09
         STA   $05
         LDA   $7C
         STA   $86
         LDA   $7B
         STA   $85
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0084
         TCS
         TYA
         RTL

L02A888  TSC
         SEC
         SBC   #$0008
         TCS
         PHD
         TCD
         PEA   $0000
         PEA   $000F
         PEA   $002E
         LDX   $10
         LDA   $0E
         PHX
         PHA
         PEI   $0C
         JSL   L025A27
         PHX
         PHA
         PEA   ^L02AC46
         PEA   L02AC46
         JSL   L02C7E6
         SEP   #$20
         LDA   #$00
         STA   L02AC55
         REP   #$20
         PEA   ^L02AC44
         PEA   L02AC44
         PEA   ^L02AC46
         PEA   L02AC46
         JSL   L02C7C2
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         LDA   #L02AC44
         STA   $05
         LDA   #^L02AC44
         STA   $07
         LDA   $0A
         STA   $10
         LDA   $09
         STA   $0F
         LDX   $07
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         TYA
L02A8F0  ENT
         RTL

L02A8F1  TSC
         SEC
         SBC   #$0048
         TCS
         PHD
         TCD
         PHB
         PHB
         PLA
         STA   $05
         PEA   >L02ABC8
         PLB
         PLB
         PHA
         PHA
         _GetPort
         PLA
         STA   $0D
         PLA
         STA   $0F
         LDX   $4E
         LDA   $4C
         PHX
         PHA
         _SetPort
         PEA   $0000
         TDC
         CLC
         ADC   #$0017
         PHA
         _GetPenState
         PEA   $0002
         PEA   $0001
         _SetPenSize
         PEA   $8002
         _SetPenMode
         LDA   $54
         STA   $11
         BRL   L02AB77
L02A95C  PEA   $0000
         PEA   $000A
         LDX   L02ABC9+2
         LDA   L02ABC9
         PHX
         PHA
         PEI   $58
         PEI   $56
         SEC
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         SBC   $03,S
         STA   $03,S
         PLY
         PLA
         LDX   #$0001
         CMP   $03,S
         BNE   L02A985
         TYA
         CMP   $01,S
L02A985  BCS   L02A988
         DEX
L02A988  PLA
         PLA
         TXA
         BNE   L02A990
         BRL   L02AA77
L02A990  PHA
         PHA
         PHA
         LDX   $4E
         LDA   $4C
         PHX
         PHA
         _GetUpdateRgn
         _EmptyRgn
         PLA
         BNE   L02A9B3
         BRL   L02AA77
L02A9B3  LDX   $58
         LDA   $56
         STX   L02ABC9+2
         STA   L02ABC9
         PEA   ^L02ABCD
         PEA   L02ABCD
         LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01]
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         _SetPenPat
         LDA   #$0000
         STA   $07
L02A9E7  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01],Y
         SEC
         SBC   $07
         BEQ   L02AA01
         BVS   L02A9FF
         EOR   #$8000
L02A9FF  BMI   L02AA03
L02AA01  BRA   L02AA34
L02AA03  LDY   #$0002
         LDA   [$50],Y
         PHA
         LDA   [$50]
         CLC
         ADC   #$0004
         PHA
         LDA   $07
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         _FrameRgn
         INC   $07
         BRA   L02A9E7
L02AA34  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01]
         BMI   L02AA47
         DEC
         BPL   L02AA49
L02AA47  BRA   L02AA66
L02AA49  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STX   $15
         STA   $13
         PEI   $15
         PEI   $13
         LDA   [$13]
         DEC
         PLX
         STX   $01
         PLX
         STX   $03
         STA   [$01]
         BRA   L02AA77
L02AA66  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   #$0003
         STA   [$01]
L02AA77  BRL   L02AB91
L02AA7A  LDX   $58
         LDA   $56
         STX   L02ABC9+2
         STA   L02ABC9
         PEA   ^L02AC02
         PEA   L02AC02
         LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01]
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         _SetPenPat
         LDA   #$0000
         STA   $07
L02AAAE  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01],Y
         SEC
         SBC   $07
         BEQ   L02AAC8
         BVS   L02AAC6
         EOR   #$8000
L02AAC6  BMI   L02AACA
L02AAC8  BRA   L02AAFB
L02AACA  LDY   #$0002
         LDA   [$50],Y
         PHA
         LDA   [$50]
         CLC
         ADC   #$0004
         PHA
         LDA   $07
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         _FrameRgn
         INC   $07
         BRA   L02AAAE
L02AAFB  BRL   L02AB91
L02AAFE  PEA   ^L02AC02
         PEA   L02AC02
         LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01]
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         _SetPenPat
         LDA   #$0000
         STA   $07
L02AB28  LDY   #$0002
         LDA   [$50],Y
         TAX
         LDA   [$50]
         STA   $01
         STX   $03
         LDA   [$01],Y
         SEC
         SBC   $07
         BEQ   L02AB42
         BVS   L02AB40
         EOR   #$8000
L02AB40  BMI   L02AB44
L02AB42  BRA   L02AB75
L02AB44  LDY   #$0002
         LDA   [$50],Y
         PHA
         LDA   [$50]
         CLC
         ADC   #$0004
         PHA
         LDA   $07
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         _FrameRgn
         INC   $07
         BRA   L02AB28
L02AB75  BRA   L02AB91
L02AB77  LDA   $11
         CMP   #$0003
         BCC   L02AB81
         LDA   #$0003
L02AB81  ASL
         TAX
         LDAL  L02AB89,X
         PHA
         RTS

L02AB89  DA    L02A95C-1
         DA    L02AA7A-1
         DA    L02AAFE-1
         DA    L02AB91-1

L02AB91  PEA   $0000
         TDC
         CLC
         ADC   #$0017
         PHA
         _SetPenState
         LDX   $0F
         LDA   $0D
         PHX
         PHA
         _SetPort
         LDA   $4A
         STA   $58
         LDA   $49
         STA   $57
         PEI   $05
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$0056
         TCS
         RTL

L02ABC8  DB    $00
L02ABC9  ADRL  $00000000
L02ABCD  DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
L02ABF9  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02AC02  DB    $44
         DB    $FF
         DB    $44
         DB    $FF
         DB    $4F
         DB    $F4
         DB    $4F
         DB    $F4
         DB    $FF
         DB    $44
         DB    $FF
         DB    $44
         DB    $F4
         DB    $4F
         DB    $F4
         DB    $4F
         DB    $44
         DB    $FF
         DB    $44
         DB    $FF
         DB    $4F
         DB    $F4
         DB    $4F
         DB    $F4
         DB    $FF
         DB    $44
         DB    $FF
         DB    $44
         DB    $F4
         DB    $4F
         DB    $F4
         DB    $4F
         DB    $44
         DB    $FF
         DB    $44
         DB    $FF
         DB    $4F
         DB    $F4
         DB    $4F
         DB    $F4
         DB    $FF
         DB    $44
         DB    $FF
         DB    $44
L02AC2E  DB    $00
         DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $03
         DB    $00
         DB    $40
         DB    $00
         DB    $08
         DB    $80
         DB    $00
         DB    $40
         DB    $00
         DB    $10
         DB    $00
         DB    $08
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $80
L02AC44  DB    $00
         DB    $00
L02AC46  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02AC55  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02AC66  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02AC6B  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02ACAB  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02ACEC  ENT
         DB    $02
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
         DB    $80
         DB    $B0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02ACFE  ENT
         TSC
         SEC
         SBC   #$0012
         TCS
         PHD
         TCD
         LDA   $24
         STA   $11
         BRL   L02B1C8
L02AD0D  LDA   $22
         STA   L02B36C
         LDA   #$0000
         STA   L02B362
         PHA
         PHA
         _GetPort
         PLA
         STA   L02B368
         PLA
         STA   L02B36A
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
         PEA   $0000
         PEA   ^L02B3D1
         PEA   L02B3D1
         PEA   $800E
         _NewWindow2
         PLA
         STA   L02B372
         PLA
         STA   L02B374
         LDX   L02B374
         LDA   L02B372
         PHX
         PHA
         _SetPort
         PEA   $0013
         PEA   $000F
         _MoveTo
         PEA   ^L02B210
         PEA   L02B210
         _DrawCString
         BRL   L02B1F8
L02ADA3  PEA   ^L02B3C9
         PEA   L02B3C9
         _EraseRect
         PEA   $0005
         PEA   $0002
         _SetPenSize
         PEA   $0013
         PEA   $000F
         _MoveTo
         LDA   L02B36C
         BNE   L02ADEA
         PEA   ^L02B222
         PEA   L02B222
         _DrawCString
         BRA   L02ADFA
L02ADEA  PEA   ^L02B237
         PEA   L02B237
         _DrawCString
L02ADFA  PHA
         PHA
         LDX   L02B374
         LDA   L02B372
         PHX
         PHA
         PEA   $0000
         PEA   ^L02B421
         PEA   L02B421
         _NewControl2
         PLA
         STA   L02B364
         PLA
         STA   L02B366
         LDX   L02B366
         LDA   L02B364
         PHX
         PHA
         _ShowControl
         LDX   L02B374
         LDA   L02B372
         PHX
         PHA
         _DrawControls
         PEA   $0002
         PEA   $0001
         _SetPenSize
         PEA   ^L02B3C1
         PEA   L02B3C1
         _FrameRect
         PEA   ^L02B37E
         PEA   L02B37E
         _FrameRect
         _PenNormal
         PEA   $0013
         PEA   $0037
         _MoveTo
         PEA   ^L02B24D
         PEA   L02B24D
         _DrawCString
         BRL   L02B1F8
L02AEA0  PEA   $0013
         PEA   $001E
         _MoveTo
         PEA   $0000
         PEI   $16
         JSL   L02597E
         STX   $09
         STA   $07
         LDX   $09
         LDA   $07
         PHX
         PHA
         _DrawCString
         LDX   $09
         LDA   $07
         PHX
         PHA
         JSL   L02C7C2
         PHX
         PHA
         PEA   ^L02B38E
         PEA   L02B38E
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         _DrawCString
         PEA   ^L02B386
         PEA   L02B386
         _EraseRect
         STZ   L02B370
         STZ   L02B36E
         BRL   L02B1F8
L02AF0D  LDA   $22
         DEC
         LDX   #$012C
         JSL   L02DB64
         LDX   $1E
         JSL   L02D661
         LDX   #$0000
         TAY
         BPL   L02AF24
         DEX
L02AF24  STX   L02B370
         STA   L02B36E
         BRL   L02B1F8
L02AF2D  LDA   #$012C
         LDX   $22
         JSL   L02DB64
         LDX   $1E
         JSL   L02CA89
         PHA
         PEA   $0021
         JSL   L02B2F1
         LDA   $20
         DEC
         LDX   #$012C
         JSL   L02DB64
         LDX   $1C
         JSL   L02D661
         PHA
         LDA   #$012C
         LDX   $22
         JSL   L02DB64
         LDX   $1C
         JSL   L02D661
         LDX   $1E
         JSL   L02D661
         CLC
         ADC   $01,S
         STA   $01,S
         PEA   $003A
         JSL   L02B2F1
         BRL   L02B1F8
L02AF79  LDX   L02B374
         LDA   L02B372
         PHX
         PHA
         _CloseWindow
         LDX   L02B36A
         LDA   L02B368
         PHX
         PHA
         _SetPort
         _InitCursor
         BRL   L02B1F8
L02AFAA  LDA   #$FFFE
         STA   $05
         BRL   L02B1FD
L02AFB2  INC   L02B362
         LDA   L02B362
         BMI   L02AFC0
         DEC
         DEC
         DEC
         DEC
         BPL   L02AFC2
L02AFC0  BRA   L02AFCA
L02AFC2  LDA   #$FFFE
         STA   $05
L02AFC7  BRL   L02B1FD
L02AFCA  LDA   #$0000
         STA   $0B
L02AFCF  PHA
         PEA   $0000
         _Button
         PLA
         BEQ   L02B054
         PEA   $0000
         TDC
         CLC
         ADC   #$000D
         PHA
         _GetMouse
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$000D
         PHA
         PEA   ^L02B376
         PEA   L02B376
         _PtInRect
         PLA
         BEQ   L02B030
         LDA   $0B
         BNE   L02B02E
         PEA   $0001
         LDX   L02B366
         LDA   L02B364
         PHX
         PHA
         _HiliteControl
         LDA   #$FFFF
         STA   $0B
L02B02E  BRA   L02B051
L02B030  LDA   $0B
         CMP   #$FFFF
         BNE   L02B051
         PEA   $0000
         LDX   L02B366
         LDA   L02B364
         PHX
         PHA
         _HiliteControl
         LDA   #$0000
         STA   $0B
L02B051  BRL   L02AFCF
L02B054  LDA   $0B
         CMP   #$FFFF
         BNE   L02B082
         PEA   $0000
         LDX   L02B366
         LDA   L02B364
         PHX
         PHA
         _HiliteControl
         _InitCursor
         LDA   #$FFFF
         STA   $05
         BRL   L02B1FD
L02B082  BRL   L02B1F8
L02B085  LDX   L02B370
         LDA   L02B36E
         PHX
         PHA
         LDA   #$012C
         LDX   #$0000
         TAY
         BPL   L02B097
         DEX
L02B097  PHX
         PHA
         PEI   $28
         PEI   $26
         LDA   #$0048
         LDX   #$0000
         TAY
         BPL   L02B0A7
         DEX
L02B0A7  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L02DC66
         PEI   $28
         PEI   $26
         LDA   #$002C
         LDX   #$0000
         TAY
         BPL   L02B0D2
         DEX
L02B0D2  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEI   $2C
         PEI   $2A
         SEC
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         SBC   $03,S
         STA   $03,S
         JSL   L02DBC3
         PEI   $28
         PEI   $26
         LDA   #$0030
         LDX   #$0000
         TAY
         BPL   L02B10C
         DEX
L02B10C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         JSL   L02DC66
         PLA
         PLX
         PEA   $0000
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         STA   $01,S
         PEA   $0021
         JSL   L02B2F1
         BRL   L02B1F8
L02B147  PEA   $0013
         PEA   $001E
         _MoveTo
         PEA   ^L02B258
         PEA   L02B258
         _DrawCString
         BRL   L02B1F8
L02B16A  PEA   ^L02B3C1
         PEA   L02B3C1
         _EraseRect
         PEA   $0013
         PEA   $001E
         _MoveTo
         PEA   ^L02B28B
         PEA   L02B28B
         _DrawCString
         PEA   $0013
         PEA   $0027
         _MoveTo
         PEA   ^L02B2BE
         PEA   L02B2BE
         _DrawCString
         PEA   $012C
         PEA   $003A
         JSL   L02B2F1
L02B1C4  BRA   L02B1F8
L02B1C6  BRA   L02B1F8
L02B1C8  LDA   $11
         SEC
         SBC   #$FFFF
         CMP   #$000C
         BCC   L02B1D6
         LDA   #$000C
L02B1D6  ASL
         TAX
         LDAL  L02B1DE,X
         PHA
         RTS

L02B1DE  DA    L02AD0D-1
         DA    L02ADA3-1
         DA    L02AEA0-1
         DA    L02AF0D-1
         DA    L02AF2D-1
         DA    L02AF79-1
         DA    L02AFAA-1
         DA    L02AFB2-1
         DA    L02AFCA-1
         DA    L02B085-1
         DA    L02B147-1
         DA    L02B16A-1
         DA    L02B1C6-1

L02B1F8  LDA   #$0000
         STA   $05
L02B1FD  LDA   $14
         STA   $2C
         LDA   $13
         STA   $2B
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         TYA
         RTL

L02B210  ASC   'Preparing data...'00
L02B222  ASC   'Generating source...'00
L02B237  ASC   'Generating equates...'00
L02B24D  ASC   'Total file'00
L02B258  ASC   'Writing output header                  '
         ASC   '           '00
L02B28B  ASC   'Generation complete                    '
         ASC   '           '00
L02B2BE  ASC   'Please stand by...                     '
         ASC   '           '00

L02B2F1  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   #$012C
         LDX   #$0001
         CMP   $12
         BEQ   L02B305
         BCS   L02B306
L02B305  DEX
L02B306  TXA
         BNE   L02B30E
         LDA   #$012C
         BRA   L02B310
L02B30E  LDA   $12
L02B310  STA   $12
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PHA
         PEA   $001E
         PEI   $10
         LDA   #$001E
         CLC
         ADC   $12
         PHA
         LDA   $10
         CLC
         ADC   #$0008
         PHA
         _SetRect
         PEA   $0000
         TDC
         CLC
         ADC   #$0005
         PHA
         PEA   $4444
         PEA   $4444
         _SpecialRect
         LDA   $0E
         STA   $12
         LDA   $0D
         STA   $11
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

         DB    $00
L02B362  DB    $00
         DB    $00
L02B364  DB    $00
         DB    $00
L02B366  DB    $00
         DB    $00
L02B368  DB    $00
         DB    $00
L02B36A  DB    $00
         DB    $00
L02B36C  DB    $00
         DB    $00
L02B36E  DB    $00
         DB    $00
L02B370  DB    $00
         DB    $00
L02B372  DB    $00
         DB    $00
L02B374  DB    $00
         DB    $00
L02B376  DW    $0005
         DW    $0102
         DW    $0012
         DW    $0152
L02B37E  DW    $0039
         DW    $001C
         DW    $0043
         DW    $014C
L02B386  DW    $0021
         DW    $001E
         DW    $0029
         DW    $014A
L02B38E  ASC   '                                       '
         ASC   '           '00
L02B3C1  DW    $0020
         DW    $001C
         DW    $002A
         DW    $014C
L02B3C9  DW    $0001
         DW    $0001
         DW    $0046
         DW    $015C
L02B3D1  DW    $0050
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
         DW    $0030      ; content rect
         DW    $008C
         DW    $0078
         DW    $01F4
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
         DB    $00
         DB    $00
L02B421  DW    $0007      ; pCount
         ADRL  $00000002  ; ID
         DW    $0005      ; rect
         DW    $0102
         DW    $0012
         DW    $0152
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02B449    ; titleRef
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02B449  STR   'Stop'
         DB    $00

L02B44F  PHB
         PHD
         PHK
         PLB
         PHA
         PHA
         TSC
         TCD
         PEA   $0000
         _GetCurResourceFile
         PLA
         STA   L02BC54
         LDA   L024110
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $FFFF
         _SetResourceFileDepth
         PLA
         STA   L02BC56
         LDA   L021EEC
         ORA   L021EEC+2
         BEQ   L02B49B
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         _SelectWindow
         BRL   L02B6F6
L02B49B  _WaitCursor
         PEA   $0000
         PEA   $0000
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _LoadResource
         BCC   L02B4CD
         _InitCursor
         PLY
         PLY
         LDX   #$6002
         JSL   L027D42
         BRL   L02B6F6
L02B4CD  _InitCursor
         PLA
         STA   L02BC48
         PLA
         STA   L02BC48+2
         PEA   $0000
         PEA   $0000
         LDA   L02BC48+2
         PHA
         LDA   L02BC48
         PHA
         JSL   L02BAD5
         PLA
         STA   L02BC4C
         PLA
         STA   L02BC4C+2
         PEA   $0000
         PEA   $0000
         LDA   L02BC48+2
         PHA
         LDA   L02BC48
         PHA
         _GetHandleSize
         PLA
         STA   L02BC50
         PLA
         STA   L02BC50+2
         BCC   L02B51F
         LDX   #$6004
         JSL   L027D42
         BRL   L02B6F6
L02B51F  JSL   L02B865
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _FrontWindow
         LDA   $01,S
         ORA   $03,S
         BNE   L02B56B
         PLA
         PLA
L02B544  PLA
         PLA
         PLA
         PLA
L02B548  LDA   #$0000
         LDX   #$0001
         JSL   L02B960
         JSL   L02B9D6
         BCC   L02B565
         LDA   #$FFFF
         LDX   #$6000
         JSL   L027D42
         BRL   L02B6F6
L02B565  STA   L02BD70
         BRL   L02B5F3
L02B56B  _GetWRefCon
         LDA   $01,S
         ORA   $03,S
         BEQ   L02B544
         JSL   L02BAD5
         PLA
         STA   $01
         PLA
         STA   $03
         LDY   #$0006
         LDA   [$01],Y
         CMP   #$5752
         BNE   L02B5A5
         LDA   #$5752
         LDX   #$0001
         JSL   L02B960
         JSL   L02B9D6
         BCC   L02B59F
         BRL   L02B548
L02B59F  STA   L02BD70
         BRL   L02B5F3
L02B5A5  CMP   #$0000
         BNE   L02B5AD
         BRL   L02B5DB
L02B5AD  CMP   #$0001
         BNE   L02B5B5
         BRL   L02B5DB
L02B5B5  CMP   #$0002
         BNE   L02B5BD
         BRL   L02B5DB
L02B5BD  CMP   #$5754
         BNE   L02B5DB
         LDA   #$5754
         LDX   #$0001
         JSL   L02B960
         JSL   L02B9D6
         BCC   L02B5D5
         BRL   L02B548
L02B5D5  STA   L02BD70
         BRL   L02B5F3
L02B5DB  LDY   #$0000
         LDA   [$01],Y
         LDX   #$0002
         JSL   L02B960
         JSL   L02B9D6
         BCC   L02B5F0
         BRL   L02B548
L02B5F0  STA   L02BD70
L02B5F3  LDA   L02435A
         AND   #$0800
         BEQ   L02B5FE
         LDA   #$FFFF
L02B5FE  STA   L02BCF0
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02BCE0
         PEA   L02BCE0
         PEA   ^L02BABA
         PEA   L02BABA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L02BC81
         PEA   L02BC81
         PEA   $800E
         _NewWindow2
         PLA
         STA   L021EEC
         PLA
         STA   L021EEC+2
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         _SetPort
         LDA   L02BC4C
         STA   L02BD2A
         LDA   L02BC4C+2
         STA   L02BD2A+2
         LDA   L02BC50
         STA   L02BD2E
         LDA   L02BC50+2
         STA   L02BD2E+2
         LDA   L02BCF0
         BEQ   L02B69A
         LDA   L02BD4E
         STA   L02BD0C+2
         LDA   L02BD4C
         STA   L02BD0C
         PEA   $0000
         PEA   $0000
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         PEA   $0000
         PEA   ^L02BD72
         PEA   L02BD72
         _NewControl2
         PLA
         STA   L02BC70
         PLA
         STA   L02BC70+2
         BRA   L02B6AA
L02B69A  LDA   L02BD4A
         STA   L02BD0C+2
         LDA   L02BD48
         STA   L02BD0C
         JSL   L02BA93
L02B6AA  PEA   $0000
         PEA   $0000
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         PEA   $0000
         PEA   ^L02BCF2
         PEA   L02BCF2
         _NewControl2
         PLA
         STA   L02BC68
         PLA
         STA   L02BC68+2
         PEA   $0000
         PEA   $0000
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         PEA   $0000
         PEA   ^L02BD50
         PEA   L02BD50
         _NewControl2
         PLA
         STA   L02BC6C
         PLA
         STA   L02BC6C+2
L02B6F6  LDA   L02BC54
         PHA
         _SetCurResourceFile
         PEA   $0000
         LDA   L02BC56
         PHA
         _SetResourceFileDepth
         PLA
         PLA
         PLA
         PLD
         PLB
         LDA   #$0000
         RTL

L02B718  PHB
         PHD
         PHK
         PLB
         LDA   L021EEC+2
         PHA
         LDA   L021EEC
         PHA
         _CloseWindow
         STZ   L021EEC+2
         STZ   L021EEC
         LDA   L02BC60
         ORA   L02BC60+2
         BEQ   L02B74C
         LDA   L02BC60+2
         PHA
         LDA   L02BC60
         PHA
         _DisposeHandle
         JSL   L020323
L02B74C  PEA   $FFFF
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _ReleaseResource
         JSL   L0202F5
         PLD
         PLB
         RTL

L02B766  PHB
         PHD
         PHK
         PLB
         LDA   L02435A
         AND   #$0800
         BEQ   L02B7EF
         PEA   $0000
         LDA   L02BC6C+2
         PHA
         LDA   L02BC6C
         PHA
         _GetCtlValue
         PLX
         LDA   L02434E
         AND   #$00FF
         CMP   #$0008
         BNE   L02B798
         CPX   L02BC64
         BEQ   L02B7EF
         DEX
         BRA   L02B7A3
L02B798  CMP   #$0015
         BNE   L02B7EF
         CPX   L02BC66
         BCS   L02B7EF
         INX
L02B7A3  PHX
         PHX
         LDA   L02BC6C+2
         PHA
         LDA   L02BC6C
         PHA
         _SetCtlValue
         PLA
         LDX   #$0000
         JSL   L02B960
         JSL   L02B9D6
         JSL   L02BA93
         PEA   $0005
         LDA   L02BD2A+2
         PHA
         LDA   L02BD2A
         PHA
         LDA   L02BD2E+2
         PHA
         LDA   L02BD2E
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L02BC68+2
         PHA
         LDA   L02BC68
         PHA
         _TESetText
L02B7EF  PLD
         PLB
         RTL

L02B7F2  PHB
         PHD
         PHK
         PLB
         LDA   L024372
         CMP   #$1002
         BNE   L02B856
         PEA   $0000
         LDA   L02BC6C+2
         PHA
         LDA   L02BC6C
         PHA
         _GetCtlValue
         PLA
         CMP   #$2710
         BCS   L02B819
         BRL   L02B85F
L02B819  LDX   #$0000
         JSL   L02B960
         JSL   L02B9D6
         JSL   L02BA93
         PEA   $0005
         LDA   L02BD2A+2
         PHA
         LDA   L02BD2A
         PHA
         LDA   L02BD2E+2
         PHA
         LDA   L02BD2E
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L02BC68+2
         PHA
         LDA   L02BC68
         PHA
         _TESetText
         BRL   L02B85F
L02B856  CMP   #$1003
         BNE   L02B85F
         JSL   L02BAFF
L02B85F  PLD
         PLB
         LDA   #$0000
         RTL

L02B865  PHD
         PHA
         PHA
         TSC
         TCD
         LDA   L02BC4C
         STA   $01
         LDA   L02BC4C+2
         STA   $03
         LDY   #$0000
         BRA   L02B87A
L02B879  INY
L02B87A  LDA   [$01],Y
         CMP   #$4E5C
         BNE   L02B879
         INY
         INY
         TYA
         CLC
         ADC   $01
         TAX
         LDA   #$0000
         ADC   $03
         PHA
         PHA
         PHX
         PEA   $0005
         PEA   $0000
         _Dec2Int
         PLA
         STA   L02BC64
         SEP   #$20
         LDY   #$0000
         BRA   L02B8A9
L02B8A8  INY
L02B8A9  LDA   [$01],Y
         CMP   #$7E
         BNE   L02B8A8
         REP   #$20
         INY
         STY   L02B95C
         STZ   L02B95E
         DEY
         BRA   L02B8BC
L02B8BB  DEY
L02B8BC  LDA   [$01],Y
         CMP   #$4E5C
         BNE   L02B8BB
         INY
         INY
         TYA
         CLC
         ADC   $01
         TAX
         LDA   #$0000
         ADC   $03
         PHA
         PHA
         PHX
         PEA   $0005
         PEA   $0000
         _Dec2Int
         PLA
         STA   L02BC66
         PEA   $0000
         PEA   $0000
         LDA   L02B95E
         PHA
         LDA   L02B95C
         PHA
         LDA   L024388
         PHA
         PEA   $C018
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L02B90E
         LDX   #$6102
         JSL   L027D42
L02B90E  PLA
         STA   L02BC60
         PLA
         STA   L02BC60+2
         LDA   L02BC4C+2
         PHA
         LDA   L02BC4C
         PHA
         LDA   L02BC60+2
         PHA
         LDA   L02BC60
         PHA
         LDA   L02B95E
         PHA
         LDA   L02B95C
         PHA
         _PtrToHand
         BCC   L02B93E
         LDX   #$6104
         JSL   L027D42
L02B93E  PEA   $0000
         PEA   $0000
         LDA   L02BC60+2
         PHA
         LDA   L02BC60
         PHA
         JSL   L02BAD5
         PLA
         STA   L02BD6C
         PLA
         STA   L02BD6C+2
         PLX
         PLX
         PLD
         RTL

L02B95C  DW    $0000
L02B95E  DW    $0000

L02B960  STA   L02B9D4
         CPX   #$0000
         BNE   L02B994
         STZ   L02BC74+7
         LDA   L02B9D4
         PHA
         PEA   ^L02BC76
         PEA   L02BC76
         PEA   $0005
         PEA   $0000
         _Int2Dec
         BCC   L02B98B
         LDX   #$6202
         JSL   L027D42
L02B98B  STZ   L02BC74+$A
         STZ   L02BC74+8
         BRL   L02B9D3
L02B994  CPX   #$0001
         BNE   L02B9A4
         SEP   #$10
         LDX   #$57
         STX   L02BC74+7
         REP   #$10
         BRA   L02B9AD
L02B9A4  SEP   #$10
         LDX   #$52
         STX   L02BC74+7
         REP   #$10
L02B9AD  LDA   L02B9D4
         PHA
         PEA   ^L02BC7C
         PEA   L02BC7C
         PEA   $0004
         _Int2Hex
         BCC   L02B9CA
         LDX   #$6204
         JSL   L027D42
L02B9CA  STZ   L02BC74+5
         STZ   L02BC74+4
         STZ   L02BC74+2
L02B9D3  RTL

L02B9D4  DW    $0000

L02B9D6  PHD
         PHA
         PHA
         TSC
         TCD
         LDA   L02BC4C+2
         STA   $03
         LDA   L02BC4C
         STA   $01
         LDA   L02BC74
         AND   #$00FF
         INC
         STA   L02BA91
         SEP   #$20
         LDY   #$0000
         LDX   #$0001
         BRA   L02B9FA
L02B9F9  INY
L02B9FA  CPY   L02BC50
         BCC   L02BA02
         BRL   L02BA89
L02BA02  LDA   [$01],Y
         CMP   L02BC74,X
         BNE   L02B9F9
L02BA09  INX
         CPX   L02BA91
         BCC   L02BA12
         BRL   L02BA2A
L02BA12  INY
         CPY   L02BC50
         BCC   L02BA1B
         BRL   L02BA89
L02BA1B  LDA   L02BC74,X
         BEQ   L02BA09
         CMP   [$01],Y
         BEQ   L02BA09
         LDX   #$0001
         BRL   L02B9F9
L02BA2A  REP   #$20
         INY
         STY   L02BC58
         STZ   L02BC5A
         SEP   #$20
         BRA   L02BA40
L02BA37  INY
         CPY   L02BC50
         BCC   L02BA40
         BRL   L02BA89
L02BA40  LDA   [$01],Y
         CMP   L02BC74+1
         BNE   L02BA37
         REP   #$20
         STY   L02BC5C
         STZ   L02BC5E
         LDA   L02BC58
         SEC
         SBC   #$000B
         CLC
         ADC   L02BC4C
         STA   $01
         LDA   #$0000
         ADC   L02BC4C+2
         STA   $03
         PEA   $0000
         LDA   $03
         PHA
         LDA   $01
         PHA
         PEA   $0005
         PEA   $0000
         _Dec2Int
         BCC   L02BA83
         LDX   #$6302
         JSL   L027D42
L02BA83  PLA
         CLC
L02BA85  PLX
         PLX
         PLD
         RTL

L02BA89  REP   #$20
         SEC
         LDA   #$0000
         BRA   L02BA85
L02BA91  DW    $0000
L02BA93  LDA   L02BC4C
         CLC
         ADC   L02BC58
         STA   L02BD2A
         LDA   #$0000
         ADC   L02BC4C+2
         STA   L02BD2A+2
         LDA   L02BC5C
         SEC
         SBC   L02BC58
         STA   L02BD2E
         LDA   L02BC5E
         SBC   L02BC5A
         STA   L02BD2E+2
         RTL

L02BABA  PHB
         PHD
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PLD
         PLB
         RTL

L02BAD5  PHB
         PHD
         TSC
         TCD
         LDY   #$0004
         LDA   [$07],Y
         ORA   #$8000
         STA   [$07],Y
         LDA   [$07]
         STA   $0B
         LDY   #$0002
         LDA   [$07],Y
         STA   $0D
         LDA   $04
         STA   $08
         LDA   $05
         STA   $09
         TSC
         PLD
         PLB
         CLC
         ADC   #$0007
         TCS
         RTL

L02BAFF  PHD
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         LDA   L024388
         PHA
         PEA   $0018
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L02BB2E
         LDX   #$6402
         JSL   L027D42
         PLA
         PLA
         BRL   L02BC3E
L02BB2E  PLA
         STA   L02BC40
         PLA
         STA   L02BC40+2
         PEA   $0000
         PEA   $0000
         PEA   $000D
         LDA   L02BC40+2
         PHA
         LDA   L02BC40
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L02BC68+2
         PHA
         LDA   L02BC68
         PHA
         _TEGetText
         BCC   L02BB73
         PLY
         PLY
         LDX   #$6404
         JSL   L027D42
         BRL   L02BC3E
L02BB73  PLA
         STA   L02BC44
         PLA
         STA   L02BC44+2
         LDA   L02BC40+2
         PHA
         LDA   L02BC40
         PHA
         _HLock
         PEA   $0000
         _GetCurResourceFile
         PLA
         STA   L02BC54
         LDA   L024110
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0001
         _SetResourceFileDepth
         PLA
         STA   L02BC56
         PEA   $FFFF
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _ReleaseResource
         LDX   #$6410
         JSL   L027D42
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _RemoveResource
         LDX   #$6412
         JSL   L027D42
         STZ   L02BC48
         STZ   L02BC48+2
         LDA   L02BC40+2
         PHA
         LDA   L02BC40
         PHA
         PEA   $8018
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _AddResource
         LDX   #$6414
         JSL   L027D42
         PEA   $5751
         PEA   $0000
         PEA   $0001
         _WriteResource
         LDX   #$6416
         JSL   L027D42
         JSL   L02B718
         LDA   L02BC40+2
         PHA
         LDA   L02BC40
         PHA
         _DisposeHandle
         LDX   #$6418
         JSL   L027D42
L02BC3E  PLD
         RTL

L02BC40  ADRL  $00000000
L02BC44  ADRL  $00000000
L02BC48  ADRL  $00000000
L02BC4C  ADRL  $00000000
L02BC50  ADRL  $00000000
L02BC54  DW    $0000
L02BC56  DW    $0000
L02BC58  DW    $0000
L02BC5A  DW    $0000
L02BC5C  DW    $0000
L02BC5E  DW    $0000
L02BC60  ADRL  $00000000
L02BC64  DW    $0000
L02BC66  DW    $0000
L02BC68  ADRL  $00000000
L02BC6C  ADRL  $00000000
L02BC70  ADRL  $00000000

L02BC74  DB    L02BC81-L02BC75   
L02BC75  ASC   '~'
L02BC76  ASC   'xxxxxZ'
L02BC7C  ASC   'xxxx~'

L02BC81  DW    $0050
         DW    $C0A8      ; frame bits
         ADRL  L02BCD1    ; title ptr
         ADRL  L02BCE0    ; refcon
         DW    $001E      ; zoom rect
         DW    $0032
         DW    $00AB
         DW    $024E
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
         ADRL  L02BABA    ; content defproc
         DW    $001E      ; content rect
         DW    $0032
         DW    $00AB
         DW    $024E
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
         DW    $0000
L02BCD1  STR   ' Genesys Help '
L02BCE0  ADRL  L02BCE4
L02BCE4  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $51
         DB    $57
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02BCF0  DB    $00
         DB    $00
L02BCF2  DW    $0017      ; pCount
         ADRL  $00001001  ; ID
         DW    $0011      ; rect
         DW    $0004
         DW    $008B
         DW    $0218
         ADRL  $85000000  ; procRef
         DW    $0000      ; flag
         DW    $7400      ; moreFlags
         ADRL  $00000000  ; refCon
L02BD0C  ADRL  $46B00000  ; textFlags
         DW    $FFFF      ; indentRect
         DW    $FFFF
         DW    $FFFF
         DW    $FFFF
         ADRL  $FFFFFFFF  ; vertBar
         DW    $0000      ; vertAmount
         ADRL  $00000000  ; horzBar
         DW    $0000      ; horzAmount
         ADRL  $00000000  ; styleRef
         DW    $0005      ; textDescriptor
L02BD2A  ADRL  $00000000  ; textRef
L02BD2E  ADRL  $00000000  ; textLength
         ADRL  $00000000  ; maxChars
         ADRL  $00000000  ; maxLines
         DW    $0000      ; maxCharsPerLine
         DW    $0000      ; maxHeight
         ADRL  $00000000  ; colorRef
         DW    $0000      ; drawMode
         ADRL  $00000000  ; filterProcPtr
L02BD48  DB    $00
         DB    $00
L02BD4A  DB    $B0
         DB    $46
L02BD4C  DB    $00
         DB    $00
L02BD4E  DB    $80
         DB    $42
L02BD50  DW    $0009      ; pCount
         ADRL  $00001002  ; ID
         DW    $0002      ; rect
         DW    $0004
         DW    $0000
         DW    $0000
         ADRL  $87000000  ; procRef
         DW    $0040      ; flag
         DW    $1004      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    $0000      ; titleWidth
L02BD6C  ADRL  $00000000  ; menuRef
L02BD70  DW    $2710      ; initialValue
L02BD72  DW    $0007      ; pCount
         ADRL  $00001003  ; ID
         DW    $0002      ; rect
         DW    $01C2
         DW    $000F
         DW    $0218
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L02BD90    ; titleRef
L02BD90  STR   'Save'
         MX    %00
L02BD95  ENT
         TSC
         SEC
         SBC   #$000A
         TCS
         PHD
         TCD
         PEI   $10
         LDA   $0E
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $14
         LDA   $12
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         LDX   #$0001
         SEC
         SBC   $01
         BEQ   L02BDCC
         BVS   L02BDCA
         EOR   #$8000
L02BDCA  BMI   L02BDCD
L02BDCC  DEX
L02BDCD  TXA
         BNE   L02BDE0
         PEI   $14
         LDA   $12
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BRA   L02BDEE
L02BDE0  PEI   $10
         LDA   $0E
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
L02BDEE  STA   $09
         LDA   #$0001
         STA   $07
L02BDF5  LDA   $09
         SEC
         SBC   $07
         BVS   L02BDFF
         EOR   #$8000
L02BDFF  BMI   L02BE04
         BRL   L02BEC4
L02BE04  PEI   $10
         PEI   $0E
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02BE11
         DEX
L02BE11  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $14
         PEI   $12
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02BE34
         DEX
L02BE34  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02BE58
         BVS   L02BE56
         EOR   #$8000
L02BE56  BMI   L02BE5A
L02BE58  BRA   L02BE62
L02BE5A  LDA   #$FFFF
         STA   $05
         BRL   L02BF33
L02BE62  PEI   $14
         PEI   $12
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02BE6F
         DEX
L02BE6F  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $10
         PEI   $0E
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02BE92
         DEX
L02BE92  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02BEB6
         BVS   L02BEB4
         EOR   #$8000
L02BEB4  BMI   L02BEB8
L02BEB6  BRA   L02BEBF
L02BEB8  LDA   #$0001
         STA   $05
         BRA   L02BF33
L02BEBF  INC   $07
         BRL   L02BDF5
L02BEC4  PEI   $10
         LDA   $0E
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $14
         LDA   $12
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02BEF0
         BVS   L02BEEE
         EOR   #$8000
L02BEEE  BMI   L02BEF2
L02BEF0  BRA   L02BEF9
L02BEF2  LDA   #$FFFF
         STA   $05
         BRA   L02BF33
L02BEF9  PEI   $14
         LDA   $12
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $10
         LDA   $0E
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02BF25
         BVS   L02BF23
         EOR   #$8000
L02BF23  BMI   L02BF27
L02BF25  BRA   L02BF2E
L02BF27  LDA   #$0001
         STA   $05
         BRA   L02BF33
L02BF2E  LDA   #$0000
         STA   $05
L02BF33  LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0012
         TCS
         TYA
         RTL

L02BF46  TSC
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         LDA   [$0E]
         AND   #$00FF
         STA   $05
L02BF55  LDA   $05
         BMI   L02BF88
         PEI   $0C
         PEI   $0A
         INC   $0A
         BNE   L02BF63
         INC   $0C
L02BF63  PEI   $10
         PEI   $0E
         INC   $0E
         BNE   L02BF6D
         INC   $10
L02BF6D  PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLX
         STX   $01
         PLX
         STX   $03
         SEP   #$20
         STA   [$01]
         REP   #$20
         DEC   $05
         BRA   L02BF55
L02BF88  LDA   $08
         STA   $10
         LDA   $07
         STA   $0F
         PLD
         TSC
         CLC
         ADC   #$000E
         TCS
         RTL

L02BF98  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         PEI   $12
         LDA   $10
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $16
         LDA   $14
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         LDX   #$0001
         SEC
         SBC   $01
         BEQ   L02BFCF
         BVS   L02BFCD
         EOR   #$8000
L02BFCD  BMI   L02BFD0
L02BFCF  DEX
L02BFD0  TXA
         BNE   L02BFE3
         PEI   $16
         LDA   $14
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BRA   L02BFF1
L02BFE3  PEI   $12
         LDA   $10
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
L02BFF1  STA   $09
         LDA   #$0001
         STA   $07
L02BFF8  LDA   $09
         SEC
         SBC   $07
         BVS   L02C002
         EOR   #$8000
L02C002  BMI   L02C007
         BRL   L02C18D
L02C007  PEI   $12
         PEI   $10
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C014
         DEX
L02C014  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         TAX
         LDA   L02C277,X
         AND   #$00FF
         AND   #$0004
         LDX   #$0000
         CMP   #$0000
         BEQ   L02C03C
         INX
L02C03C  TXA
         BNE   L02C063
         PEI   $12
         PEI   $10
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C04C
         DEX
L02C04C  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BRA   L02C088
L02C063  PEI   $12
         PEI   $10
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C070
         DEX
L02C070  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         AND   #$005F
L02C088  SEP   #$20
         STA   $0B
         REP   #$20
         PEI   $16
         PEI   $14
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C09B
         DEX
L02C09B  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         TAX
         LDA   L02C277,X
         AND   #$00FF
         AND   #$0004
         LDX   #$0000
         CMP   #$0000
         BEQ   L02C0C3
         INX
L02C0C3  TXA
         BNE   L02C0EA
         PEI   $16
         PEI   $14
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C0D3
         DEX
L02C0D3  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         BRA   L02C10F
L02C0EA  PEI   $16
         PEI   $14
         LDA   $07
         LDX   #$0000
         TAY
         BPL   L02C0F7
         DEX
L02C0F7  CLC
         ADC   $01,S
         STA   $01,S
         TXA
         ADC   $03,S
         STA   $03,S
         PLA
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         AND   #$005F
L02C10F  SEP   #$20
         STA   $0C
         REP   #$20
         LDA   $0B
         AND   #$00FF
         BIT   #$0080
         BEQ   L02C122
         ORA   #$FF00
L02C122  CMP   #$0000
         PHA
         LDA   $0C
         AND   #$00FF
         BIT   #$0080
         BEQ   L02C133
         ORA   #$FF00
L02C133  CMP   #$0000
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02C145
         BVS   L02C143
         EOR   #$8000
L02C143  BMI   L02C147
L02C145  BRA   L02C14F
L02C147  LDA   #$FFFF
         STA   $05
         BRL   L02C1FC
L02C14F  LDA   $0C
         AND   #$00FF
         BIT   #$0080
         BEQ   L02C15C
         ORA   #$FF00
L02C15C  CMP   #$0000
         PHA
         LDA   $0B
         AND   #$00FF
         BIT   #$0080
         BEQ   L02C16D
         ORA   #$FF00
L02C16D  CMP   #$0000
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02C17F
         BVS   L02C17D
         EOR   #$8000
L02C17D  BMI   L02C181
L02C17F  BRA   L02C188
L02C181  LDA   #$0001
         STA   $05
         BRA   L02C1FC
L02C188  INC   $07
         BRL   L02BFF8
L02C18D  PEI   $12
         LDA   $10
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $16
         LDA   $14
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02C1B9
         BVS   L02C1B7
         EOR   #$8000
L02C1B7  BMI   L02C1BB
L02C1B9  BRA   L02C1C2
L02C1BB  LDA   #$FFFF
         STA   $05
         BRA   L02C1FC
L02C1C2  PEI   $16
         LDA   $14
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PHA
         PEI   $12
         LDA   $10
         PLX
         STA   $01
         STX   $03
         LDA   [$01]
         AND   #$00FF
         PLY
         STY   $01
         SEC
         SBC   $01
         BEQ   L02C1EE
         BVS   L02C1EC
         EOR   #$8000
L02C1EC  BMI   L02C1F0
L02C1EE  BRA   L02C1F7
L02C1F0  LDA   #$0001
         STA   $05
         BRA   L02C1FC
L02C1F7  LDA   #$0000
         STA   $05
L02C1FC  LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDY   $05
         PLD
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         RTL

L02C20F  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         PHA
         PHA
         LDX   $0A
         LDA   $08
         PHX
         PHA
         _FindHandle
         _DisposeHandle
         LDA   $06
         STA   $0A
         LDA   $05
         STA   $09
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         RTL

L02C243  ENT
         TSC
         PHD
         TCD
         LDA   $08
         STAL  L02C25C
         LDA   $04
         STAL  L02C25E
         LDA   $06
         STAL  L02C25E+2
         JSL   GSOS
L02C25C  DW    $0000
L02C25E  ADRL  $00000000
         STAL  L02DD98
         LDA   $02
         STA   $08
         LDA   $01
         STA   $07
         PLD
         TSC
         CLC
         ADC   #$0006
         TCS
         RTL

         DB    $00
L02C277  ENT
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $28
         DB    $28
         DB    $28
         DB    $28
         DB    $28
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $08
         DB    $B0
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $C1
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $C2
         DB    $C2
         DB    $C2
         DB    $C2
         DB    $C2
         DB    $C2
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $82
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $C4
         DB    $C4
         DB    $C4
         DB    $C4
         DB    $C4
         DB    $C4
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $84
         DB    $90
         DB    $90
         DB    $90
         DB    $90
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02C377  ENT
         PEA   $000A
         PEA   $0000
         PEA   $0000
         LDA   $0C,S
         PHA
         LDA   $0C,S
         PHA
         JSL   L02C83C
         TAY
         LDA   $02,S
         STA   $06,S
         PLA
         STA   $03,S
         PLA
         TYA
         RTL

L02C395  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         PHB
         PHK
         PLB
         SEP   #$30
         LDY   #$00
L02C3A4  LDA   [$08],Y
         STA   L02CCE7,Y
         BEQ   L02C3AF
         INY
         BNE   L02C3A4
         DEY
L02C3AF  STY   L02CCE6
         REP   #$30
         LDA   #L02CCE6
         STA   $01
         LDA   #^L02CCE6
         STA   $03
         PLB
         LDX   $03
         LDY   $01
         LDA   $06
         STA   $0A
         LDA   $05
         STA   $09
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         RTL

L02C3D4  LDAL  L02C6D9
         CMP   #L02C6DD
         BNE   L02C431
         LDAL  L02C6D9+2
         CMP   #^L02C6DD
         BNE   L02C431
         LDAL  L02C6F9
         CMP   #$FFFF
         BNE   L02C431
         LDAL  L02C6F5
         AND   #$0080
         BNE   L02C40F
         LDAL  L02C6F5
         AND   #$00FF
         TAX
         LDAL  L02C6F5
         XBA
         ORA   #$FF00
         STAL  L02C6F5
         TXA
         BRA   L02C428
L02C40F  JSL   L02DABE
         TAX
         BNE   L02C428
         LDA   #$0080
         ORAL  L02C6F7
         STAL  L02C6F7
         JSL   L02DABE
         LDA   #$FFFF
L02C428  CMP   #$000D
         BNE   L02C430
         LDA   #$000A
L02C430  RTL

L02C431  LDAL  L02C6D9+2
         PHA
         LDAL  L02C6D9
         PHA
         JSL   L02CDF0
         RTL

L02C440  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         PHB
         PHK
         PLB
         SEP   #$30
         LDA   [$08]
         TAY
         LDA   #$00
         STA   L02CCE6,Y
         TYX
         BEQ   L02C460
L02C458  LDA   [$08],Y
         STA   L02CCE5,Y
         DEY
         BNE   L02C458
L02C460  REP   #$30
         LDA   #L02CCE6
         STA   $01
         LDA   #^L02CCE6
         STA   $03
         PLB
         LDX   $03
         LDY   $01
         LDA   $06
         STA   $0A
         LDA   $05
         STA   $09
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         RTL

L02C482  TSC
         SEC
         SBC   #$0002
         TCS
         PHD
         TCD
         STZ   $01
L02C48C  LDA   [$06]
         AND   #$00FF
         BEQ   L02C4A0
         PHA
         JSL   L02CFDE
         INC   $06
         BNE   L02C49E
         INC   $08
L02C49E  BRA   L02C48C
L02C4A0  PEA   $000A
         JSL   L02CFDE
         LDY   $01
         LDA   $04
         STA   $08
         LDA   $03
         STA   $07
         PLD
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         RTL

L02C4BA  TSC
         PHD
         TCD
         PHB
         PHK
         PLB
         LDA   $08
         BNE   L02C4C6
         DEC   $0A
L02C4C6  DEC   $08
         LDA   $0A
         PHA
         LDA   $08
         PHA
         LDA   $0E
         PHA
         LDA   $0C
         PHA
         JSL   L02DBC3
         PLA
         STA   $08
         PLA
         STA   $0A
         CLC
         LDA   $08
         ADC   $04
         STA   $08
         LDA   $0A
         ADC   $06
         STA   $0A
         LDA   $0E
         STA   L02C68A
         LDA   $0C
         STA   L02C688
         LDA   $10
         STA   L02C57D+1
         STA   L02C5AB+1
         LDA   $11
         STA   L02C57D+2
         STA   L02C5AB+2
         LDA   $0A
         PHA
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L02C526
         PLB
         LDA   $02
         STA   $12
         LDA   $01
         STA   $11
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L02C526  TSC
         SEC
         SBC   #$0008
         TCS
         PHD
         TCD
         PHB
         PHK
         PLB
L02C531  LDA   $12
         CMP   $0E
         BNE   L02C53B
         LDA   $10
         CMP   $0C
L02C53B  BEQ   L02C53F
         BCS   L02C550
L02C53F  PLB
         LDA   $0A
         STA   $12
         LDA   $09
         STA   $11
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L02C550  LDA   $12
         STA   $07
         LDA   $10
         STA   $05
         LDA   $0E
         STA   $03
         LDA   $0C
         STA   $01
         BRA   L02C571
L02C562  CLC
         LDA   $01
         ADC   L02C688
         STA   $01
         LDA   $03
         ADC   L02C68A
         STA   $03
L02C571  LDA   $12
         PHA
         LDA   $10
         PHA
         LDA   $03
         PHA
         LDA   $01
         PHA
L02C57D  JSL   L02C57D
         TAX
         BMI   L02C562
L02C584  LDA   $05
         CMP   $0C
         BNE   L02C590
         LDA   $07
         CMP   $0E
         BEQ   L02C5B2
L02C590  SEC
         LDA   $05
         SBC   L02C688
         STA   $05
         LDA   $07
         SBC   L02C68A
         STA   $07
         LDA   $12
         PHA
         LDA   $10
         PHA
         LDA   $07
         PHA
         LDA   $05
         PHA
L02C5AB  JSL   L02C5AB
         DEC
         BPL   L02C584
L02C5B2  LDA   $03
         PHA
         LDA   $01
         PHA
         LDA   $07
         PHA
         LDA   $05
         PHA
         JSR   L02C61C
         LDA   $03
         CMP   $07
         BNE   L02C5CB
         LDA   $01
         CMP   $05
L02C5CB  BCC   L02C562
         LDA   $07
         PHA
         LDA   $05
         PHA
         LDA   $03
         PHA
         LDA   $01
         PHA
         JSR   L02C61C
         LDA   $03
         PHA
         LDA   $01
         PHA
         LDA   $12
         PHA
         LDA   $10
         PHA
         JSR   L02C61C
         SEC
         LDA   $01
         SBC   L02C688
         STA   $05
         LDA   $03
         SBC   L02C68A
         STA   $07
         LDA   $07
         PHA
         LDA   $05
         PHA
         LDA   $0E
         PHA
         LDA   $0C
         PHA
         JSL   L02C526
         CLC
         LDA   $01
         ADC   L02C688
         STA   $0C
         LDA   $03
         ADC   L02C68A
         STA   $0E
         BRL   L02C531
L02C61C  TSC
         PHD
         TCD
         LDX   L02C68A
         BEQ   L02C63C
         LDY   #$0000
L02C627  LDA   [$03],Y
         TAX
         LDA   [$07],Y
         STA   [$03],Y
         TXA
         STA   [$07],Y
         DEY
         DEY
         BNE   L02C627
         INC   $05
         INC   $09
         DEX
         BNE   L02C627
L02C63C  LDA   L02C688
         LSR
         BCC   L02C660
         SEP   #$20
         LDA   [$03]
         TAX
         LDA   [$07]
         STA   [$03]
         TXA
         STA   [$07]
         REP   #$20
         INC   $03
         BNE   L02C656
         INC   $05
L02C656  INC   $07
         BNE   L02C65C
         INC   $09
L02C65C  LDA   L02C688
         LSR
L02C660  ASL
         BEQ   L02C67E
         TAY
         BRA   L02C670
L02C666  LDA   [$03],Y
         TAX
         LDA   [$07],Y
         STA   [$03],Y
         TXA
         STA   [$07],Y
L02C670  DEY
         DEY
         BNE   L02C666
         LDA   [$03]
         TAX
         LDA   [$07]
         STA   [$03]
         TXA
         STA   [$07]
L02C67E  PLD
         PLX
         TSC
         CLC
         ADC   #$0008
         TCS
         PHX
         RTS

L02C688  DB    $00
         DB    $00
L02C68A  DB    $00
         DB    $00
L02C68C  ENT
         PHB
         PHK
         PLB
         PLX
         PLY
         PLA
         STA   L02C6D5
         PLA
         STA   L02C6D7
         PHY
         PHX
         PLB
         LDA   #L02C6AD
         STAL  L02CC50+1
         LDA   #>L02C6AD
         STAL  L02CC50+2
         BRL   L02CAB7
L02C6AD  PHB
         PLX
         PLA
         PLY
         PHA
         PHX
         PLB
         LDX   L02C6D7
         PHX
         LDX   L02C6D5
         PHX
         PHD
         TSC
         TCD
         TYA
         AND   #$00FF
         STA   [$03]
         PLD
         PLA
         PLA
         PHB
         PHK
         PLB
         INC   L02C6D5
         BNE   L02C6D3
         INC   L02C6D7
L02C6D3  PLB
         RTL

L02C6D5  DB    $00
         DB    $00
L02C6D7  DB    $00
         DB    $00
L02C6D9  ADRL  L02C6DD
L02C6DD  ADRL  L02C719
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02C6F5  DB    $FF
         DB    $FF
L02C6F7  DB    $0A
         DB    $02
L02C6F9  DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $0A
         DB    $02
         DB    $FF
         DB    $FF
L02C715  ADRL  L02C719
L02C719  ADRL  L02D037
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $12
         DB    $02
L02C735  DB    $FE
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $12
         DB    $02
         DB    $FE
         DB    $FF
L02C751  ENT
         TSC
         PHD
         TCD
         LDY   #$0000
         SEP   #$20
L02C759  LDA   [$04],Y
         BEQ   L02C76A
         CMP   [$08],Y
         BNE   L02C776
         INY
         BNE   L02C759
         INC   $06
         INC   $0A
         BRA   L02C759
L02C76A  LDX   #$0000
         LDA   [$08],Y
         BEQ   L02C77B
L02C771  LDX   #$FFFF
         BRA   L02C77B
L02C776  BCC   L02C771
         LDX   #$0001
L02C77B  REP   #$20
         LDA   $01
         STA   $09
         LDA   $02
         STA   $0A
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         TXA
         RTL

L02C78E  ENT
         LDA   $06,S
         PHA
         LDA   $06,S
         PHA
         TSC
         PHD
         TCD
         SEP   #$20
         LDY   #$0000
L02C79C  LDA   [$0C],Y
         STA   [$08],Y
         BEQ   L02C7AB
         INY
         BNE   L02C79C
         INC   $0A
         INC   $0E
         BRA   L02C79C
L02C7AB  REP   #$20
         LDA   $05
         STA   $0D
         LDA   $06
         STA   $0E
         LDX   $03
         LDY   $01
         PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         TYA
         RTL

L02C7C2  ENT
         TSC
         PHD
         TCD
         LDY   #$0000
         LDX   #$0000
         SEP   #$20
L02C7CD  LDA   [$04],Y
         BEQ   L02C7D9
         INY
         BNE   L02C7CD
         INX
         INC   $06
         BRA   L02C7CD
L02C7D9  REP   #$20
         PLD
         LDA   $02,S
         STA   $06,S
         PLA
         STA   $03,S
         PLA
         TYA
         RTL

L02C7E6  TSC
         SEC
         SBC   #$0004
         TCS
         PHD
         TCD
         LDA   $0A
         STA   $03
         LDA   $08
         STA   $01
         SEP   #$20
         LDY   #$0000
         LDX   $12
         BMI   L02C825
         BNE   L02C805
         LDX   $10
         BEQ   L02C825
L02C805  LDX   $10
L02C807  LDA   [$0C],Y
         STA   [$08],Y
         BEQ   L02C822
         DEX
         BNE   L02C816
         LDA   $12
         BEQ   L02C825
         DEC   $12
L02C816  INY
         BNE   L02C807
         INC   $0A
         INC   $0E
         BRA   L02C807
L02C81F  INY
         STA   [$08],Y
L02C822  DEX
         BNE   L02C81F
L02C825  REP   #$20
         LDX   $03
         LDY   $01
         LDA   $06
         STA   $12
         LDA   $05
         STA   $11
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         RTL

L02C83C  PEA   $0000
         PEA   $0000
         PEA   $0000
         TSC
         PHD
         TCD
         LDA   $0E
         ORA   $10
         BEQ   L02C859
         LDA   $0A
         STA   [$0E]
         LDY   #$0002
         LDA   $0C
         STA   [$0E],Y
L02C859  LDA   [$0A]
         AND   #$00FF
         TAX
         LDAL  L02C277,X
         AND   #$0020
         BEQ   L02C870
         INC   $0A
         BNE   L02C86E
         INC   $0C
L02C86E  BRA   L02C859
L02C870  LDA   [$0A]
         AND   #$00FF
         CMP   #$002D
         BNE   L02C87E
         INC   $01
         BRA   L02C883
L02C87E  CMP   #$002B
         BNE   L02C889
L02C883  INC   $0A
         BNE   L02C889
         INC   $0C
L02C889  LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   $12
         PHA
         LDA   $10
         PHA
         LDA   $0E
         PHA
         LDA   $0C
         PHA
         LDA   $0A
         PHA
         JSL   L02C8EB
         STX   $05
         STA   $03
         TXY
         BPL   L02C8C1
         LDA   #$0002
         STAL  L02CDE8
         LDA   $0E
         ORA   $10
         BNE   L02C8C1
         LDA   $01,S
         STA   [$0E]
         LDY   #$0002
         LDA   $03,S
         STA   [$0E],Y
L02C8C1  PLA
         PLA
         LDA   $01
         BEQ   L02C8D6
         SEC
         LDA   #$0000
         SBC   $03
         STA   $03
         LDA   #$0000
         SBC   $05
         STA   $05
L02C8D6  LDX   $05
         LDY   $03
         LDA   $07
         STA   $11
         LDA   $08
         STA   $12
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         RTL

L02C8EB  PEA   $0000
         PEA   $0000
         PEA   $0000
         TSC
         PHD
         TCD
         LDA   $0E
         ORA   $10
         BEQ   L02C908
         LDA   $0A
         STA   [$0E]
         LDY   #$0002
         LDA   $0C
         STA   [$0E],Y
L02C908  LDA   [$0A]
         AND   #$00FF
         TAX
         LDAL  L02C277,X
         AND   #$0020
         BEQ   L02C91F
         INC   $0A
         BNE   L02C91D
         INC   $0C
L02C91D  BRA   L02C908
L02C91F  LDA   [$0A]
         AND   #$00FF
         CMP   #$002B
         BNE   L02C92F
         INC   $0A
         BNE   L02C92F
         INC   $0C
L02C92F  LDA   $12
         BNE   L02C956
         LDA   #$000A
         STA   $12
         LDA   [$0A]
         AND   #$00FF
         CMP   #$0030
         BNE   L02C956
         LDA   #$0008
         STA   $12
         LDY   #$0001
         LDA   [$0A],Y
         AND   #$005F
         CMP   #$0058
         BNE   L02C956
         ASL   $12
L02C956  LDA   [$0A]
         AND   #$5F7F
         CMP   #$5830
         BNE   L02C973
         CLC
         LDA   $0A
         ADC   #$0002
         STA   $0A
         BCC   L02C96C
         INC   $0C
L02C96C  LDA   $12
         CMP   #$0010
         BNE   L02C9DE
L02C973  LDA   [$0A]
         AND   #$00FF
         CMP   #$0030
         BCC   L02C9DA
         CMP   #$003A
         BCC   L02C994
         AND   #$005F
         CMP   #$0041
         BCC   L02C9DA
         CMP   #$005B
         BCS   L02C9DA
         SBC   #$0036
         BRA   L02C997
L02C994  AND   #$000F
L02C997  CMP   $12
         BCS   L02C9DA
         LDX   #$0001
         STX   $01
         PHA
         PHA
         PHA
         PHA
         PHA
         LDA   $05
         PHA
         LDA   $03
         PHA
         PEA   $0000
         LDA   $12
         PHA
         _LongMul
         PLA
         STA   $03
         PLA
         STA   $05
         PLA
         ORA   $01,S
         PLX
         PLY
         TAX
         BNE   L02C9DE
         CLC
         TYA
         ADC   $03
         STA   $03
         BCC   L02C9D2
         INC   $05
         BEQ   L02C9DE
L02C9D2  INC   $0A
         BNE   L02C9D8
         INC   $0C
L02C9D8  BRA   L02C973
L02C9DA  LDA   $01
         BNE   L02C9E7
L02C9DE  LDA   #$0002
         STAL  L02CDE8
         BRA   L02C9F8
L02C9E7  LDA   $0E
         ORA   $0E
         BEQ   L02C9F8
         LDA   $0A
         STA   [$0E]
         LDY   #$0002
         LDA   $0C
         STA   [$0E],Y
L02C9F8  LDX   $05
         LDY   $03
         LDA   $07
         STA   $11
         LDA   $08
         STA   $12
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         RTL

L02CA0D  ENT
         LDA   $04,S
         TAX
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         LDAL  L02C277,X
         AND   #$0002
         BEQ   L02CA25
         TXA
         ORA   #$0020
         RTL

L02CA25  TXA
         RTL

L02CA27  ENT
         LDAL  L02DD98
         RTL

L02CA2C  ENT
         LDA   $04,S
         TAX
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         LDAL  L02C277,X
         AND   #$0004
         BEQ   L02CA44
         TXA
         AND   #$005F
         RTL

L02CA44  TXA
         RTL

L02CA46  ENT
         TSC
         PHD
         TCD
         LDA   $06
         BPL   L02CA68
         CMP   #$FFFF
         BNE   L02CA62
         LDX   $04
         CPX   #$FFDE
         BCC   L02CA62
L02CA59  ASL   $08
         ROL   $0A
         INX
         BNE   L02CA59
         BRA   L02CA7D
L02CA62  STZ   $08
         STZ   $0A
         BRA   L02CA7D
L02CA68  BNE   L02CA62
         LDX   $04
         BEQ   L02CA7D
         CPX   #$0021
         BCS   L02CA62
L02CA73  LDA   $0A
         ASL
         ROR   $0A
         ROR   $08
         DEX
         BNE   L02CA73
L02CA7D  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L02CA89  TXY
         BEQ   L02CAB3
         PHA
         PHX
         TSC
         PHD
         TCD
         LDA   #$0000
         LDY   #$0010
L02CA97  ASL   $03
         ROL
         SEC
         SBC   $01
         BCS   L02CAA6
         ADC   $01
         DEY
         BNE   L02CA97
         BRA   L02CAAB
L02CAA6  INC   $03
         DEY
         BNE   L02CA97
L02CAAB  TAX
         LDA   $03
         CLV
         PLD
         PLY
         PLY
         RTL

L02CAB3  PLA
         SEP   #$40
         RTL

L02CAB7  PHB
         PHK
         PLB
         PHD
         TSC
         TCD
         STZ   L02CC6C
L02CAC0  LDA   [$07]
         AND   #$00FF
         BEQ   L02CAD9
         CMP   #$0025
         BEQ   L02CAEA
         PHA
         JSL   L02CC4D
         INC   $07
         BNE   L02CAD7
         INC   $09
L02CAD7  BRA   L02CAC0
L02CAD9  LDA   $05
         STA   $09
         LDA   $04
         STA   $08
         PLD
         PLB
         PLA
         PLA
         LDAL  L02CC6C
         RTL

L02CAEA  INC   $07
         BNE   L02CAF0
         INC   $09
L02CAF0  STZ   L02CC64
         STZ   L02CC56
         STZ   L02CC60
         STZ   L02CC62
         STZ   L02CC5A
         LDA   #$0020
         STA   L02CC5E
         STZ   L02CC5C
         STZ   L02CC66
         STZ   L02CC54
L02CB0E  JSR   L02CB75
         BCS   L02CB0E
         JSR   L02CBBD
         STA   L02CC56
         LDA   [$07]
         AND   #$00FF
         CMP   #$002E
         BNE   L02CB37
         INC   $07
         BNE   L02CB29
         INC   $09
L02CB29  INC   L02CC62
         JSR   L02CBBD
         STA   L02CC60
         LDA   [$07]
         AND   #$00FF
L02CB37  CMP   #$006C
         BNE   L02CB41
         INC   L02CC5A
         BRA   L02CB4B
L02CB41  CMP   #$004C
         BEQ   L02CB4B
         CMP   #$0068
         BNE   L02CB56
L02CB4B  INC   $07
         BNE   L02CB51
         INC   $09
L02CB51  LDA   [$07]
         AND   #$00FF
L02CB56  INC   $07
         BNE   L02CB5C
         INC   $09
L02CB5C  LDX   #$003C
L02CB5F  CMP   L02CC0D,X
         BEQ   L02CB6D
         DEX
         DEX
         DEX
         DEX
         BPL   L02CB5F
         BRL   L02CAC0
L02CB6D  PEA   L02CAC0-1
         INX
         INX
         JMP   (L02CC0D,X)

L02CB75  LDA   [$07]
         AND   #$00FF
         CMP   #$002D
         BNE   L02CB87
         LDA   #$0001
         STA   L02CC5C
         BRA   L02CBB3
L02CB87  CMP   #$0030
         BNE   L02CB91
         STA   L02CC5E
         BRA   L02CBB3
L02CB91  CMP   #$002B
         BEQ   L02CBA3
         CMP   #$0020
         BNE   L02CBA8
         LDX   L02CC66
         CPX   #$002B
         BEQ   L02CBB3
L02CBA3  STA   L02CC66
         BRA   L02CBB3
L02CBA8  CMP   #$0023
         BNE   L02CBBB
         LDA   #$0001
         STA   L02CC54
L02CBB3  INC   $07
         BNE   L02CBB9
         INC   $09
L02CBB9  SEC
         RTS

L02CBBB  CLC
         RTS

L02CBBD  STZ   L02CC0B
         LDA   [$07]
         AND   #$00FF
         CMP   #$002A
         BNE   L02CBDF
         INC   $07
         BNE   L02CBD0
         INC   $09
L02CBD0  LDA   $0B
         STA   L02CC0B
         LDY   #$0001
         JSR   L02D5E2
L02CBDB  LDA   L02CC0B
         RTS

L02CBDF  LDA   [$07]
         AND   #$00FF
         CMP   #$0030
         BCC   L02CBDB
         CMP   #$003A
         BCS   L02CBDB
         AND   #$000F
         PHA
         ASL   L02CC0B
         LDA   L02CC0B
         ASL
         ASL
         ADC   L02CC0B
         ADC   $01,S
         PLX
         STA   L02CC0B
         INC   $07
         BNE   L02CC09
         INC   $09
L02CC09  BRA   L02CBDF
L02CC0B  DW    $0000
L02CC0D  DA    $0025
         DA    L02D2CD
         DA    $006E
         DA    L02D4E0
         DA    $0073
         DA    L02D569
         DA    $0070
         DA    L02D578
         DA    $0063
         DA    L02D364
         DA    $0058
         DA    L02D2E5
         DA    $0078
         DA    L02D2DD
         DA    $006F
         DA    L02D4F9
         DA    $0075
         DA    L02D3A4
         DA    $0064
         DA    L02D37A
         DA    $0069
         DA    L02D37A
         DA    $0066
         DA    L02D082
         DA    $0065
         DA    L02D06F
         DA    $0045
         DA    L02D074
         DA    $0067
         DA    L02D243
         DA    $0047
         DA    L02D248

L02CC4D  INC   L02CC6C
L02CC50  JMPL  $000000

L02CC54  DB    $00
         DB    $00
L02CC56  DB    $00
         DB    $00
L02CC58  DB    $00
L02CC59  DB    $00
L02CC5A  DB    $00
         DB    $00
L02CC5C  DB    $00
         DB    $00
L02CC5E  DB    $00
         DB    $00
L02CC60  DB    $00
         DB    $00
L02CC62  DB    $00
         DB    $00
L02CC64  DB    $00
         DB    $00
L02CC66  DB    $00
         DB    $00
L02CC68  DB    $00
L02CC69  DB    $00
L02CC6A  DB    $00
L02CC6B  DB    $00
L02CC6C  DB    $00
         DB    $00
L02CC6E  DB    $00
L02CC6F  DB    $00
L02CC70  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CCBF  DB    $00
         DB    $00
L02CCC1  DB    $00
         DB    $00
L02CCC3  DB    $00
         DB    $00
L02CCC5  DB    $00
         DB    $00
L02CCC7  DB    $00
         DB    $00
L02CCC9  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02CCE5  DB    $00
L02CCE6  DB    $00
L02CCE7  DS    $101
L02CDE8  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00

L02CDF0  TSC
         SEC
         SBC   #$0006
         TCS
         PHD
         TCD
         PHB
         PHK
         PLB
         LDA   $0C
         PHA
         LDA   $0A
         PHA
         JSL   L02D605
         BCS   L02CE11
         LDY   #$001A
         LDA   [$0A],Y
         AND   #$0180
         BEQ   L02CE19
L02CE11  LDA   #$FFFF
         STA   $01
         BRL   L02CFA2
L02CE19  LDY   #$0018
         LDA   [$0A],Y
         AND   #$0080
         BNE   L02CE35
         LDA   [$0A],Y
         AND   #$00FF
         STA   $01
         LDA   [$0A],Y
         XBA
         ORA   #$FF00
         STA   [$0A],Y
         BRL   L02CFA2
L02CE35  LDY   #$001C
         LDA   [$0A],Y
         BPL   L02CE70
         CMP   #$FFFF
         BNE   L02CE5F
         JSL   L02DABE
         TAX
         BNE   L02CE5A
         LDA   #$0080
         ORAL  L02C6F7
         STAL  L02C6F7
         JSL   L02DABE
         LDA   #$FFFF
L02CE5A  STA   $01
         BRL   L02CFA2
L02CE5F  LDA   $0C
         PHA
         LDA   $0A
         PHA
         JSR   L02D647
         LDA   #$FFFF
         STA   $01
         BRL   L02CFA2
L02CE70  LDY   #$001A
         LDA   [$0A],Y
         BIT   #$0008
         BNE   L02CE81
         BIT   #$0010
         BNE   L02CE5F
         BRA   L02CE8F
L02CE81  LDY   #$0014
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BEQ   L02CE8F
         BRL   L02CF50
L02CE8F  LDY   #$001A
         LDA   [$0A],Y
         BIT   #$0002
         BEQ   L02CEB2
         STZ   L02CFD0+2
         TDC
         CLC
         ADC   #$0001
         STA   L02CFD0
         LDA   #$0001
         STA   L02CFD4
         LDA   #$0000
         STA   L02CFD4+2
         BRA   L02CED0
L02CEB2  LDY   #$0008
         LDA   [$0A],Y
         STA   L02CFD0
         INY
         INY
         LDA   [$0A],Y
         STA   L02CFD0+2
         LDY   #$0010
         LDA   [$0A],Y
         STA   L02CFD4
         INY
         INY
         LDA   [$0A],Y
         STA   L02CFD4+2
L02CED0  LDY   #$001C
         LDA   [$0A],Y
         STA   L02CFCE
         JSL   GSOS
         DW    $2012      ; Read
         ADRL  L02CFCC
         BCC   L02CF00
         LDY   #$001A
         CMP   #$004C
         BNE   L02CEF1
         LDA   #$0080
         BRA   L02CEF4
L02CEF1  LDA   #$0100
L02CEF4  ORA   [$0A],Y
         STA   [$0A],Y
         LDA   #$FFFF
         STA   $01
         BRL   L02CFA2
L02CF00  LDY   #$001A
         LDA   [$0A],Y
         AND   #$0002
         BEQ   L02CF0D
         BRL   L02CFA2
L02CF0D  CLC
         LDY   #$000C
         LDA   L02CFD0
         ADC   L02CFD8
         STA   [$0A],Y
         INY
         INY
         LDA   L02CFD0+2
         ADC   L02CFD8+2
         STA   [$0A],Y
         LDY   #$0008
         LDA   [$0A],Y
         TAX
         INY
         INY
         LDA   [$0A],Y
         LDY   #$0006
         STA   [$0A],Y
         DEY
         DEY
         TXA
         STA   [$0A],Y
         LDY   #$0014
         LDA   L02CFD8
         STA   [$0A],Y
         INY
         INY
         LDA   L02CFD8+2
         STA   [$0A],Y
         LDY   #$001A
         LDA   [$0A],Y
         ORA   #$0008
         STA   [$0A],Y
L02CF50  LDY   #$0004
         LDA   [$0A],Y
         STA   $03
         CLC
         ADC   #$0001
         STA   [$0A],Y
         INY
         INY
         LDA   [$0A],Y
         STA   $05
         ADC   #$0000
         STA   [$0A],Y
         LDA   [$03]
         AND   #$00FF
         STA   $01
         LDY   #$0014
         SEC
         LDA   [$0A],Y
         SBC   #$0001
         STA   [$0A],Y
         BCS   L02CF83
         INY
         INY
         LDA   [$0A],Y
         DEC
         STA   [$0A],Y
L02CF83  LDY   #$001A
         LDA   [$0A],Y
         AND   #$0020
         BEQ   L02CFA2
         LDY   #$0014
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BNE   L02CFA2
         LDY   #$001A
         LDA   [$0A],Y
         EOR   #$0008
         STA   [$0A],Y
L02CFA2  LDA   $01
         CMP   #$000D
         BNE   L02CFB8
         LDY   #$001A
         LDA   [$0A],Y
         AND   #$0200
         BEQ   L02CFB8
         LDA   #$000A
         STA   $01
L02CFB8  PLB
         LDY   $01
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         TYA
         RTL

L02CFCC  DW    $0004      ; Parms for Read
L02CFCE  DW    $0000      ;  ref num
L02CFD0  ADRL  $00000000  ;  buffer ptr
L02CFD4  ADRL  $00000000  ;  request count
L02CFD8  ADRL  $00000000  ;  transfer count
         DW    $0001
L02CFDE  LDAL  L02C715
         CMP   #L02C719
         BNE   L02D01A
         LDAL  L02C715+1
         CMP   #>L02C719
         BNE   L02D01A
         LDAL  L02C735
         CMP   #$FFFE
         BNE   L02D01A
         PHP
         PLX
         PLY
         PLA
         PHY
         PHX
         PLP
         PHA
         PHA
         CMP   #$000A
         BNE   L02D011
         PEA   $000D
         _WriteChar
L02D011  _WriteChar
         PLA
         RTL

L02D01A  LDAL  L02C715+2
         PHA
         LDAL  L02C715
         PHA
         LDA   $08,S
         PHA
         JSL   $000000
         PHB
         PLX
         PLY
         PLA
         PHY
         PHX
         PLB
         RTL

         ADRL  L02D037
L02D037  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $12
         DB    $02
         DB    $FD
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $FF
         DB    $12
         DB    $02
         DB    $FD
         DB    $FF
L02D06F  STZ   L02D241
         BRA   L02D07A
L02D074  LDA   #$0001
         STA   L02D241
L02D07A  STZ   L02CCC1
         INC   L02CC60
         BRA   L02D08B
L02D082  LDA   #$0001
         STA   L02CCC1
         STZ   L02D241
L02D08B  LDA   $13
         BPL   L02D09A
         EOR   #$8000
         STA   $13
         LDA   #$002D
         STA   L02CC66
L02D09A  LDA   L02CC62
         BNE   L02D0A8
         LDA   #$0007
         SEC
         SBC   L02CCC1
         BRA   L02D0AB
L02D0A8  LDA   L02CC60
L02D0AB  STA   L02CCC3
         PEA   ^L02CCC1
         PEA   L02CCC1
         PEA   $0000
         CLC
         TDC
         ADC   #$000B
         PHA
         PEA   ^L02CCC5
         PEA   L02CCC5
         PEA   $000B
         _SANEFP816
         PEA   ^L02CCC1
         PEA   L02CCC1
         PEA   ^L02CCC5
         PEA   L02CCC5
         PEA   ^L02CC6E
         PEA   L02CC6E
         PEA   $0001
         _SANEDecStr816
         LDA   L02CCC1
         BNE   L02D108
         SEP   #$30
         LDX   L02CC6E
         LDA   L02CC6C,X
         CMP   #$65
         BNE   L02D108
         INC   L02CC6E
         LDA   L02CC6E,X
         STA   L02CC6F,X
         LDA   #$30
         STA   L02CC6E,X
L02D108  REP   #$30
         LDA   L02CC64
         BEQ   L02D114
L02D10F  JSR   L02D1F5
         BCS   L02D10F
L02D114  LDA   L02D241
         BEQ   L02D12F
         SEP   #$30
         LDX   L02CC6E
L02D11E  LDA   L02CC6E,X
         CMP   #$65
         BEQ   L02D128
         DEX
         BNE   L02D11E
L02D128  LDA   #$45
         STA   L02CC6E,X
         REP   #$30
L02D12F  LDA   L02CC6F
         AND   #$00FF
         CMP   #$0020
         BNE   L02D149
         DEC   L02CC6E
         LDA   #$0050
         LDX   #L02CC70
         LDY   #L02CC6F
         MVN   L02CC70,L02CC6F
L02D149  LDA   L02CCC3
         BNE   L02D184
         LDA   L02CC54
         BEQ   L02D184
         SEP   #$30
         INC   L02CC6E
         LDX   #$01
L02D15A  LDA   L02CC6E,X
         CMP   #$30
         BCC   L02D16B
         CMP   #$3A
         BCS   L02D16B
         INX
         CPX   L02CC6E
         BNE   L02D15A
L02D16B  LDY   L02CC6E,X
         LDA   #$2E
         STA   L02CC6E,X
L02D173  CPX   L02CC6E
         BEQ   L02D182
         INX
         TYA
         LDY   L02CC6E,X
         STA   L02CC6E,X
         BRA   L02D173
L02D182  REP   #$30
L02D184  LDA   L02CC66
         BEQ   L02D18C
         DEC   L02CC56
L02D18C  LDA   L02CC6E
         AND   #$00FF
         SEC
         SBC   L02CC56
         EOR   #$FFFF
         INC
         STA   L02CC56
         LDA   L02CC5E
         CMP   #$0030
         BEQ   L02D1A8
         JSR   L02D5C9
L02D1A8  LDA   L02CC66
         BEQ   L02D1B2
         PHA
         JSL   L02CC4D
L02D1B2  LDA   L02CC5E
         CMP   #$0030
         BNE   L02D1CD
         LDA   L02CC56
         BEQ   L02D1CD
         BMI   L02D1CD
L02D1C1  PEA   $0030
         JSL   L02CC4D
         DEC   L02CC56
         BNE   L02D1C1
L02D1CD  LDA   L02CC6E
         AND   #$00FF
         TAY
         BEQ   L02D1EC
         LDX   #$0001
L02D1D9  LDA   L02CC6E,X
         PHX
         PHY
         AND   #$00FF
         PHA
         JSL   L02CC4D
         PLY
         PLX
         INX
         DEY
         BNE   L02D1D9
L02D1EC  LDY   #$0005
         JSR   L02D5E2
         BRL   L02D5C3
L02D1F5  SEP   #$30
         LDX   #$00
L02D1F9  LDA   L02CC6F,X
         CMP   #$2E
         BEQ   L02D208
         INX
         CPX   L02CC6E
         BNE   L02D1F9
         BRA   L02D22B
L02D208  CPX   L02CC6E
         BEQ   L02D217
         LDA   L02CC6F,X
         CMP   #$65
         BEQ   L02D217
         INX
         BRA   L02D208
L02D217  LDA   L02CC6E,X
         CMP   #$30
         BNE   L02D224
         JSR   L02D22F
         SEC
         BRA   L02D22C
L02D224  CMP   #$2E
         BNE   L02D22B
         JSR   L02D22F
L02D22B  CLC
L02D22C  REP   #$30
         RTS

L02D22F  CPX   L02CC6E
         BEQ   L02D23D
         LDA   L02CC6F,X
         STA   L02CC6E,X
         INX
         BRA   L02D22F
L02D23D  DEC   L02CC6E
         RTS

L02D241  DW    $0000
L02D243  STZ   L02D2C9
         BRA   L02D24E
L02D248  LDA   #$0001
         STA   L02D2C9
L02D24E  LDA   L02CC62
         BNE   L02D25C
         LDA   #$0006
         STA   L02CC60
         INC   L02CC62
L02D25C  LDA   L02CC60
         STA   L02CCC3
         PEA   ^L02CCC1
         PEA   L02CCC1
         PEA   $0000
         CLC
         TDC
         ADC   #$000B
         PHA
         PEA   ^L02CCC5
         PEA   L02CCC5
         PEA   $000B
         _SANEFP816
         LDA   L02CC54
         EOR   #$0001
         STA   L02CC64
         LDA   #$0001
         STA   L02CC54
         LDA   L02CCC9
         AND   #$00FF
         CLC
         ADC   L02CCC7
         DEC
         STA   L02D2CB
         BPL   L02D2A5
         CMP   #$FFFD
         BCS   L02D2BF
L02D2A5  CMP   L02CC60
         BCC   L02D2BF
         BEQ   L02D2BF
         DEC   L02CC60
         BPL   L02D2B4
         STZ   L02CC60
L02D2B4  LDA   L02D2C9
         BNE   L02D2BC
         BRL   L02D06F
L02D2BC  BRL   L02D074
L02D2BF  SEC
         LDA   L02CC60
         SBC   L02D2CB
         BRL   L02D082
L02D2C9  DB    $00
         DB    $00
L02D2CB  DB    $00
         DB    $00
L02D2CD  DEC   L02CC56
         JSR   L02D5C9
         PEA   $0025
         JSL   L02CC4D
         BRL   L02D5C3
L02D2DD  LDA   #$0020
         STA   L02D362
         BRA   L02D2E8
L02D2E5  STZ   L02D362
L02D2E8  STZ   L02CC66
         LDA   #$2020
         STA   L02CC6E
         LDA   #$0051
         LDX   #L02CC6E
         LDY   #L02CC6F
         MVN   L02CC6E,L02CC6F
         STZ   L02CC6A
         LDA   L02CC5A
         BEQ   L02D30A
         LDA   $0D
         STA   L02CC6A
L02D30A  LDA   $0B
         STA   L02CC68
         STZ   L02CC58
         SEP   #$30
         LDY   #$52
L02D316  LDA   #$00
         LDX   #$04
L02D31A  LSR   L02CC6B
         ROR   L02CC6A
         ROR   L02CC69
         ROR   L02CC68
         ROR
         DEX
         BNE   L02D31A
         LSR
         LSR
         LSR
         LSR
         ORA   #$30
         CMP   #$3A
         BCC   L02D339
         ADC   #$06
         ORA   L02D362
L02D339  STA   L02CC6E,Y
         DEY
         LDA   L02CC6B
         ORA   L02CC6A
         ORA   L02CC69
         ORA   L02CC68
         BNE   L02D316
         LDA   L02CC54
         BEQ   L02D35D
         LDA   #$58
         ORA   L02D362
         STA   L02CC59
         LDA   #$30
         STA   L02CC58
L02D35D  REP   #$30
         BRL   L02D3D8
L02D362  DB    $00
         DB    $00
L02D364  DEC   L02CC56
         JSR   L02D5C9
         LDA   $0B
         PHA
         JSL   L02CC4D
         LDY   #$0001
         JSR   L02D5E2
         BRL   L02D5C3
L02D37A  LDA   L02CC5A
         BEQ   L02D394
         LDA   $0D
         BPL   L02D3A4
         SEC
         LDA   #$0000
         SBC   $0B
         STA   $0B
         LDA   #$0000
         SBC   $0D
         STA   $0D
         BRA   L02D39E
L02D394  LDA   $0B
         BPL   L02D3A4
         EOR   #$FFFF
         INC
         STA   $0B
L02D39E  LDA   #$002D
         STA   L02CC66
L02D3A4  STZ   L02CC58
         LDA   L02CC5A
         BEQ   L02D3B4
         LDA   $0D
         PHA
         LDA   $0B
         PHA
         BRA   L02D3B7
L02D3B4  LDA   $0B
         PHA
L02D3B7  PEA   ^L02CC6E
         PEA   L02CC6E
         PEA   $0053
         PEA   $0000
         LDA   L02CC5A
         BEQ   L02D3D1
         _Long2Dec
         BRA   L02D3D8
L02D3D1  _Int2Dec
L02D3D8  LDA   L02CC62
         BNE   L02D3E3
         LDA   #$0001
         STA   L02CC60
L02D3E3  LDX   L02CC60
         BNE   L02D3F8
         LDA   L02CCBF
         CMP   #$3020
         BNE   L02D41F
         LDA   #$2020
         STA   L02CCBF
         BRA   L02D41F
L02D3F8  LDY   #$0000
         SEP   #$20
         LDA   #$20
L02D3FF  CMP   L02CC6E,Y
         BNE   L02D40C
         INY
         CPY   #$0053
         BNE   L02D3FF
         BRA   L02D41D
L02D40C  CMP   L02CC6E,Y
         BEQ   L02D41A
         DEX
         BEQ   L02D41A
         INY
         CPY   #$0053
         BNE   L02D40C
L02D41A  STX   L02CC60
L02D41D  REP   #$20
L02D41F  SEC
         LDA   L02CC56
         SBC   L02CC60
         STA   L02CC56
         LDA   L02CC66
         BEQ   L02D431
         DEC   L02CC56
L02D431  LDA   L02CC58
         BEQ   L02D43C
         DEC   L02CC56
         DEC   L02CC56
L02D43C  LDX   #$0000
         LDY   #$0052
         SEP   #$20
         LDA   #$20
L02D446  CMP   L02CC6E,Y
         BEQ   L02D44F
         INX
         DEY
         BPL   L02D446
L02D44F  REP   #$20
         SEC
         TXA
         SBC   L02CC56
         EOR   #$FFFF
         INC
         STA   L02CC56
         LDA   L02CC5E
         CMP   #$0030
         BEQ   L02D468
         JSR   L02D5C9
L02D468  LDA   L02CC66
         BEQ   L02D472
         PHA
         JSL   L02CC4D
L02D472  LDA   L02CC58
         BEQ   L02D484
         PHA
         JSL   L02CC4D
         LDA   L02CC59
         PHA
         JSL   L02CC4D
L02D484  LDA   L02CC5E
         CMP   #$0030
         BNE   L02D4A0
         LDA   L02CC56
         BMI   L02D4A0
         BEQ   L02D4A0
L02D493  LDA   L02CC5E
         PHA
         JSL   L02CC4D
         DEC   L02CC56
         BNE   L02D493
L02D4A0  LDA   L02CC60
         BEQ   L02D4B2
L02D4A5  LDA   L02CC5E
         PHA
         JSL   L02CC4D
         DEC   L02CC60
         BNE   L02D4A5
L02D4B2  LDY   #$FFFF
L02D4B5  INY
         LDA   L02CC6E,Y
         AND   #$00FF
         CMP   #$0020
         BEQ   L02D4B5
L02D4C1  CPY   #$0053
         BEQ   L02D4D6
         PHY
         LDA   L02CC6E,Y
         AND   #$00FF
         PHA
         JSL   L02CC4D
         PLY
         INY
         BRA   L02D4C1
L02D4D6  LDY   L02CC5A
         INY
         JSR   L02D5E2
         BRL   L02D5C3
L02D4E0  LDA   L02CC6C
         STA   [$0B]
         LDA   L02CC5A
         BEQ   L02D4F2
         LDY   #$0002
         LDA   #$0000
         STA   [$0B],Y
L02D4F2  LDY   #$0002
         JSR   L02D5E2
         RTS

L02D4F9  STZ   L02CC66
         LDA   #$2020
         STA   L02CC6E
         LDA   #$0051
         LDX   #L02CC6E
         LDY   #L02CC6F
         MVN   L02CC6E,L02CC6F
         STZ   L02CC6A
         LDA   L02CC5A
         BEQ   L02D51B
         LDA   $0D
         STA   L02CC6A
L02D51B  LDA   $0B
         STA   L02CC68
         SEP   #$30
         LDY   #$52
L02D524  LDA   L02CC6B
         ORA   L02CC6A
         ORA   L02CC69
         ORA   L02CC68
         BEQ   L02D553
         LDA   #$00
         LDX   #$03
L02D536  LSR   L02CC6B
         ROR   L02CC6A
         ROR   L02CC69
         ROR   L02CC68
         ROR
         DEX
         BNE   L02D536
         LSR
         LSR
         LSR
         LSR
         LSR
         ORA   #$30
         STA   L02CC6E,Y
         DEY
         BRA   L02D524
L02D553  CPY   #$52
         BEQ   L02D55C
         LDA   L02CC54
         BEQ   L02D561
L02D55C  LDA   #$30
         STA   L02CC6E,Y
L02D561  REP   #$30
         STZ   L02CC58
         BRL   L02D3D8
L02D569  SEP   #$20
         LDY   #$FFFF
L02D56E  INY
         LDA   [$0B],Y
         BNE   L02D56E
         REP   #$20
         TYA
         BRA   L02D583
L02D578  LDA   [$0B]
         AND   #$00FF
         INC   $0B
         BNE   L02D583
         INC   $0D
L02D583  LDX   L02CC62
         BEQ   L02D590
         CMP   L02CC60
         BCC   L02D590
         LDA   L02CC60
L02D590  STA   L02CC68
         SEC
         LDA   L02CC56
         SBC   L02CC68
         STA   L02CC56
         JSR   L02D5C9
         LDX   L02CC68
         BEQ   L02D5BA
         LDY   #$0000
L02D5A8  PHY
         LDA   [$0B],Y
         AND   #$00FF
         PHA
         JSL   L02CC4D
         PLY
         INY
         DEC   L02CC68
         BNE   L02D5A8
L02D5BA  LDY   #$0002
         JSR   L02D5E2
         BRL   L02D5C3
L02D5C3  LDA   L02CC5C
         BNE   L02D5CE
L02D5C8  RTS

L02D5C9  LDA   L02CC5C
         BNE   L02D5C8
L02D5CE  LDA   L02CC56
         BMI   L02D5C8
         BEQ   L02D5C8
L02D5D5  PEA   $0020
         JSL   L02CC4D
         DEC   L02CC56
         BNE   L02D5D5
         RTS

L02D5E2  LDA   $0D,S
         STA   $0F,S
         LDA   $0B,S
         STA   $0D,S
         LDA   $09,S
         STA   $0B,S
         LDA   $07,S
         STA   $09,S
         LDA   $05,S
         STA   $07,S
         LDA   $03,S
         STA   $05,S
         PLA
         STA   $01,S
         TDC
         INC
         INC
         TCD
         DEY
         BNE   L02D5E2
         RTS

L02D605  PHB
         PHK
         PLB
         PEA   ^L02C6DD
         PEA   L02C6DD
         TSC
         PHD
         TCD
L02D611  LDA   $01
         ORA   $03
         BEQ   L02D631
         LDA   $01
         CMP   $09
         BNE   L02D623
         LDA   $03
         CMP   $0B
         BEQ   L02D63B
L02D623  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $01
         STX   $03
         BRA   L02D611
L02D631  LDA   #$0005
         STAL  L02CDE8
         SEC
         BRA   L02D63C
L02D63B  CLC
L02D63C  PLD
         PLA
         PLA
         PLX
         PLY
         PLA
         PLA
         PHY
         PHX
         PLB
         RTL

L02D647  TSC
         PHD
         TCD
         LDY   #$001A
         LDA   [$03],Y
         ORA   #$0100
         STA   [$03],Y
         LDA   #$0005
         STAL  L02CDE8
         PLD
         PLA
         PLY
         PLY
         PHA
         RTS

L02D661  LDY   #$0000
         BIT   #$8000
         BEQ   L02D66E
         EOR   #$FFFF
         INC
         INY
L02D66E  PHA
         TXA
         BEQ   L02D6A9
         BPL   L02D679
         DEY
         EOR   #$FFFF
         INC
L02D679  PHA
         PHY
         TSC
         PHD
         TCD
         LDA   #$0000
         LDY   #$0010
L02D684  ASL   $05
         ROL
         SEC
         SBC   $03
         BCS   L02D693
         ADC   $03
         DEY
         BNE   L02D684
         BRA   L02D698
L02D693  INC   $05
         DEY
         BNE   L02D684
L02D698  TAX
         LDA   $05
         LDY   $01
         BEQ   L02D6A3
         EOR   #$FFFF
         INC
L02D6A3  CLV
         PLD
         PLY
         PLY
         PLY
         RTL

L02D6A9  PLA
         SEP   #$40
         RTL

L02D6AD  ENT
         LDY   #$0000
         PHX
         PHA
         TSC
         PHD
         TCD
         TXA
         EOR   $0A
         BPL   L02D6C0
         LDA   $03
         CMP   $0A
         BRA   L02D6CA
L02D6C0  LDA   $0A
         CMP   $03
         BNE   L02D6CA
         LDA   $08
         CMP   $01
L02D6CA  BCC   L02D6CD
         INY
L02D6CD  LDA   $06
         STA   $0A
         LDA   $05
         STA   $09
         PLD
         TSC
         CLC
         ADC   #$0008
         TCS
         TYA
         RTL

L02D6DE  ENT
         LDX   #$0000
         LDA   $0A,S
         EOR   $06,S
         BPL   L02D6ED
         LDA   $06,S
         CMP   $0A,S
         BRA   L02D6F7
L02D6ED  LDA   $0A,S
         CMP   $06,S
         BNE   L02D6F7
         LDA   $08,S
         CMP   $04,S
L02D6F7  BCC   L02D6FC
         BEQ   L02D6FC
         INX
L02D6FC  PHB
         PLA
         STA   $07,S
         PLA
         STA   $07,S
         PLA
         PLA
         PLB
         TXA
         RTL

L02D708  PHD
         PHB
         PHK
         PLB
         TSC
         SEC
         SBC   #$000A
         TCS
         INC
         TCD
         REP   #$30
         LDA   #$0001
         STA   L02DAB8
         STZ   $00
         STZ   $02
         LDA   L02DAB2
         ORA   L02DAB4
         BNE   L02D739
         LDA   L02DD9C
         BNE   L02D739
         JSL   GSOS
         DW    $010F      ; Shell: Direction
         ADRL  L02DABA
         BCC   L02D73F
L02D739  STZ   L02DAB8
         STZ   L02DABC
L02D73F  SEP   #$30
L02D741  STZ   $00
         STZ   $02
         STZ   L02DAB6
         STZ   L02D9B1
         JSR   L02D8C5
         JSR   L02D937
L02D751  JSR   L02D8E4
         CMP   #$08
         BNE   L02D763
         LDX   $00
         BEQ   L02D751
         DEC   $00
         JSR   L02D909
         BRA   L02D751
L02D763  CMP   #$15
         BNE   L02D78A
         LDX   $00
         INX
         CPX   #$FF
         BEQ   L02D751
         INC   $00
         LDA   $00
         TAY
         CMP   L02D9B1
         BEQ   L02D77A
         BCS   L02D77F
L02D77A  LDA   L02D9B1,Y
         BRA   L02D784
L02D77F  LDA   #$20
         STA   L02D9B1,Y
L02D784  JSR   L02D909
         BRL   L02D751
L02D78A  CMP   #$0D
         BEQ   L02D792
         CMP   #$8D
         BNE   L02D7AF
L02D792  LDA   L02D9B1
         STA   $02
         JSR   L02D937
         LDA   L02D9B1
         INC
         TAY
         LDA   #$0D
         STA   L02D9B1,Y
         JSR   L02D909
         LDA   #$0A
         JSR   L02D909
         BRL   L02D9A6
L02D7AF  CMP   #$BE
         BEQ   L02D7B7
         CMP   #$AE
         BNE   L02D7C2
L02D7B7  LDA   L02D9B1
         STA   $02
         JSR   L02D937
         BRL   L02D751
L02D7C2  CMP   #$BC
         BEQ   L02D7CA
         CMP   #$AC
         BNE   L02D7D2
L02D7CA  STZ   $02
         JSR   L02D937
         BRL   L02D751
L02D7D2  CMP   #$F9
         BEQ   L02D7DE
         CMP   #$D9
         BEQ   L02D7DE
         CMP   #$19
         BNE   L02D7FC
L02D7DE  LDA   $00
         CMP   L02D9B1
         BCS   L02D7E8
         STA   L02D9B1
L02D7E8  LDA   $00
         PHA
         STZ   $02
         JSR   L02D937
         JSR   L02D8C5
         PLA
         STA   $02
         JSR   L02D937
         BRL   L02D751
L02D7FC  CMP   #$FA
         BEQ   L02D808
         CMP   #$DA
         BEQ   L02D808
         CMP   #$1A
         BNE   L02D810
L02D808  STZ   $02
         JSR   L02D937
         BRL   L02D741
L02D810  CMP   #$1B
         BEQ   L02D818
         CMP   #$18
         BNE   L02D825
L02D818  LDA   #$01
         STA   L02D9B1
         LDA   #$0D
         STA   L02D9B2
         BRL   L02D9A6
L02D825  CMP   #$7F
         BNE   L02D863
         LDA   L02D9B1
         STA   $04
         LDA   $00
         BEQ   L02D87B
         CMP   $04
         BEQ   L02D838
         BCS   L02D84E
L02D838  TAY
L02D839  INY
         LDA   L02D9B1,Y
         DEY
         STA   L02D9B1,Y
         INY
         CPY   $04
         BCC   L02D839
         BEQ   L02D839
         LDA   $04
         DEC
         STA   L02D9B1
L02D84E  LDA   $00
         PHA
         STZ   $02
         JSR   L02D937
         JSR   L02D8C5
         PLA
         DEC
         STA   $02
         JSR   L02D937
         BRL   L02D751
L02D863  CMP   #$E5
         BEQ   L02D86F
         CMP   #$C5
         BEQ   L02D86F
         CMP   #$05
         BNE   L02D87E
L02D86F  LDA   #$00
         LDX   L02DAB6
         BNE   L02D878
         LDA   #$01
L02D878  STA   L02DAB6
L02D87B  BRL   L02D751
L02D87E  PHA
         LDX   L02DAB6
         BEQ   L02D887
         JSR   L02D97A
L02D887  LDA   $00
         INC
         CMP   #$FF
         BEQ   L02D8BC
         CMP   L02D9B1
         BCC   L02D898
         BEQ   L02D898
         STA   L02D9B1
L02D898  TAY
         LDA   $01,S
         STA   L02D9B1,Y
         LDX   L02DAB6
         BNE   L02D8AA
         JSR   L02D909
         INC   $00
         BRA   L02D8BC
L02D8AA  LDA   $00
         PHA
         STZ   $02
         JSR   L02D937
         JSR   L02D8C5
         PLA
         INC
         STA   $02
         JSR   L02D937
L02D8BC  PLA
         BEQ   L02D8C2
         BRL   L02D751
L02D8C2  BRL   L02D792
L02D8C5  LDA   L02D9B1
         STA   $00
         BEQ   L02D8D9
         TAX
         LDY   #$01
L02D8CF  LDA   L02D9B1,Y
         JSR   L02D909
         INY
         DEX
         BNE   L02D8CF
L02D8D9  LDA   L02DD9C
         BEQ   L02D8DF
         RTS

L02D8DF  LDA   #$1D
         JMP   L02D909

L02D8E4  REP   #$30
         PHA
         PEA   $0000
         _ReadChar
         PLA
         SEP   #$30
         AND   #$7F
         LDX   L02DABC
         BNE   L02D908
         TAX
         LDAL  BUTN0
         BPL   L02D907
         TXA
         ORA   #$80
         BRA   L02D908
L02D907  TXA
L02D908  RTS

L02D909  REP   #$30
         PHY
         PHX
         PHA
         LDX   L02DAB8
         BEQ   L02D927
         LDX   L02DABC
         BNE   L02D92F
         STA   L02D935
         JSL   GSOS
         DW    $011A      ; Shell: ConsoleOut
         ADRL  L02D935
         BRA   L02D92F
L02D927  PHA
         _WriteChar
L02D92F  PLA
         PLX
         PLY
         SEP   #$30
         RTS

L02D935  DB    $00        ;  char
         DB    $00
L02D937  REP   #$30
         SEC
         LDA   $02
         SBC   $00
         TAX
         SEP   #$20
         BEQ   L02D973
         BMI   L02D967
L02D945  INC   $00
         LDA   $00
         TAY
         CMP   L02D9B1
         BEQ   L02D951
         BCS   L02D956
L02D951  LDA   L02D9B1,Y
         BRA   L02D95B
L02D956  LDA   #$20
         STA   L02D9B1,Y
L02D95B  PHX
         PHP
         JSR   L02D909
         PLP
         PLX
         DEX
         BNE   L02D945
         BRA   L02D973
L02D967  LDA   #$08
L02D969  PHX
         PHP
         JSR   L02D909
         PLP
         PLX
         INX
         BNE   L02D969
L02D973  LDA   $02
         STA   $00
         SEP   #$10
         RTS

L02D97A  LDA   $00
         INC
         CMP   L02D9B1
         BEQ   L02D984
         BCS   L02D9A5
L02D984  STA   $06
         LDA   L02D9B1
         INC
         TAY
L02D98B  DEY
         LDA   L02D9B1,Y
         INY
         STA   L02D9B1,Y
         DEY
         CPY   $06
         BCS   L02D98B
         INC   L02D9B1
         LDA   L02D9B1
         CMP   #$FF
         BNE   L02D9A5
         DEC   L02D9B1
L02D9A5  RTS

L02D9A6  REP   #$30
         TSC
         CLC
         ADC   #$000A
         TCS
         PLB
         PLD
         RTL

L02D9B1  DB    $00
L02D9B2  DS    $101
L02DAB2  DW    $0000
L02DAB4  DW    $0000
L02DAB6  DW    $0000
L02DAB8  DW    $0000
L02DABA  DW    $0000      ;  device num
L02DABC  DW    $0000      ;  direction

L02DABE  PHB
         PHK
         PLB
         PHX
         PHY
         LDA   L02DB0E
         BNE   L02DAD5
         JSL   L02D708
         STZ   L02DB0C
         LDA   #$0001
         STA   L02DB0E
L02DAD5  SEP   #$30
         LDX   L02DB0C
         LDA   L02D9B2,X
         CMP   #$0D
         BNE   L02DAE7
         DEC   L02DB0E
         DEC   L02DB0C
L02DAE7  INC   L02DB0C
         REP   #$30
         AND   #$00FF
         PLY
         PLX
         PLB
         RTL

         PHB
         PHK
         PLB
         PHX
         SEP   #$30
         DEC   L02DB0C
         LDX   L02DB0C
         STA   L02D9B2,X
         LDX   #$01
         STX   L02DB0E
         REP   #$30
         PLX
         PLB
         RTL

L02DB0C  DW    $0000
L02DB0E  DW    $0000

L02DB10  ENT
         PHB
         PHK
         PLB
         LDA   $07,S
         BMI   L02DB56
         STA   L02DB5C
         LDA   $05,S
         STA   L02DB5A
         LDA   $0B,S
         STA   L02DB5E
         PLA
         STA   L02DB60
         PLA
         STA   L02DB62
         JSL   L02E055
         LDA   L02DB62
         PHA
         LDA   L02DB60
         PHA
         BVS   L02DB56
         LDA   L02DB5E
         BPL   L02DB54
         LDA   $09,S
         ORA   $0B,S
         BEQ   L02DB54
         SEC
         LDA   L02DB5A
         SBC   $09,S
         STA   $09,S
         LDA   L02DB5C
         SBC   $0B,S
         STA   $0B,S
L02DB54  PLB
         RTL

L02DB56  SEP   #$40
         PLB
         RTL

L02DB5A  DW    $0000
L02DB5C  DW    $0000
L02DB5E  DW    $0000
L02DB60  DW    $0000
L02DB62  DW    $0000

L02DB64  TAY
         PHD
         TSC
         SEC
         SBC   #$0007
         TCD
         DEC
         TCS
         TYA
         LDY   #$0000
         BIT   #$8000
         BEQ   L02DB7C
         EOR   #$FFFF
         INC
         INY
L02DB7C  STA   $02
         TXA
         BPL   L02DB86
         DEY
         EOR   #$FFFF
         INC
L02DB86  STA   $04
         STY   $06
         LDY   #$0010
         LDA   #$0000
L02DB90  LSR   $02
         BCC   L02DB97
         CLC
         ADC   $04
L02DB97  ROR
         ROR   $00
         DEY
         BNE   L02DB90
         TAX
         BNE   L02DBB8
         LDA   $00
         BMI   L02DBB8
         LDY   $06
         BEQ   L02DBAC
         EOR   #$FFFF
         INC
L02DBAC  TAY
         TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         TYA
         CLV
         RTL

L02DBB8  TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         SEP   #$40
         RTL

L02DBC3  ENT
         TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         JSL   L02DD35
         LDA   $07
         BEQ   L02DBFA
         LDY   #$0020
         JSR   L02DBDC
         BRL   L02DC2B
L02DBDC  LDA   $05
         LSR
         BCC   L02DBEE
         CLC
         LDA   $09
         ADC   $10
         STA   $09
         LDA   $0B
         ADC   $12
         STA   $0B
L02DBEE  ROR   $0B
         ROR   $09
         ROR   $07
         ROR   $05
         DEY
         BNE   L02DBDC
         RTS

L02DBFA  ORA   $12
         BEQ   L02DC15
         LDY   #$0010
         JSR   L02DBDC
         LDA   $07
         STA   $05
         LDA   $09
         STA   $07
         LDA   $0B
         STA   $09
         STZ   $0B
         BRL   L02DC2B
L02DC15  LDY   #$0010
         LDX   $05
         STX   $07
L02DC1C  LSR   $07
         BCC   L02DC23
         CLC
         ADC   $10
L02DC23  ROR
         ROR   $05
         DEY
         BNE   L02DC1C
         STA   $07
L02DC2B  LDA   $07
         AND   #$8000
         ORA   $09
         ORA   $0B
         BEQ   L02DC3A
         SEP   #$40
         BRA   L02DC56
L02DC3A  LDA   $01
         BEQ   L02DC4D
         SEC
         LDA   #$0000
         SBC   $05
         STA   $05
         LDA   #$0000
         SBC   $07
         STA   $07
L02DC4D  CLV
         LDA   $07
         STA   $16
         LDA   $05
         STA   $14
L02DC56  LDA   $0E
         STA   $12
         LDA   $0C
         STA   $10
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L02DC66  ENT
         TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   $10
         ORA   $12
         BNE   L02DC7E
         PEA   $0009
         JSL   L02DDFD
         BRL   L02DCD9
L02DC7E  JSL   L02DD35
         LDA   $16
         ORA   $12
         BEQ   L02DCAA
         LDY   #$0020
L02DC8B  ASL   $05
         ROL   $07
         ROL   $09
         ROL   $0B
         SEC
         LDA   $09
         SBC   $10
         TAX
         LDA   $0B
         SBC   $12
         BCC   L02DCA5
         STX   $09
         STA   $0B
         INC   $05
L02DCA5  DEY
         BNE   L02DC8B
         BEQ   L02DCC6
L02DCAA  LDA   #$0000
         LDY   #$0010
L02DCB0  ASL   $05
         ROL
         SEC
         SBC   $10
         BCS   L02DCBF
         ADC   $10
         DEY
         BNE   L02DCB0
         BEQ   L02DCC4
L02DCBF  INC   $05
         DEY
         BNE   L02DCB0
L02DCC4  STA   $09
L02DCC6  LDA   $01
         BEQ   L02DCD9
         SEC
         LDA   #$0000
         SBC   $05
         STA   $05
         LDA   #$0000
         SBC   $07
         STA   $07
L02DCD9  LDA   $05
         STA   $14
         LDA   $07
         STA   $16
         LDA   $0C
         STA   $10
         LDA   $0E
         STA   $12
         CLV
         PLD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L02DCF2  ENT
         TSC
         PHD
         TCD
         LDA   $06
         BPL   L02DD17
         CMP   #$FFFF
         BNE   L02DD11
         LDX   $04
         CPX   #$FFDE
         BCC   L02DD11
L02DD05  LDA   $0A
         ASL
         ROR   $0A
         ROR   $08
         INX
         BNE   L02DD05
         BRA   L02DD29
L02DD11  STZ   $08
         STZ   $0A
         BRA   L02DD29
L02DD17  BNE   L02DD11
         LDX   $04
         BEQ   L02DD29
         CPX   #$0021
         BCS   L02DD11
L02DD22  ASL   $08
         ROL   $0A
         DEX
         BNE   L02DD22
L02DD29  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L02DD35  STZ   $01
         LDA   $16
         BPL   L02DD4E
         SEC
         LDA   #$0000
         SBC   $14
         STA   $05
         LDA   #$0000
         SBC   $16
         STA   $07
         INC   $01
         BRA   L02DD54
L02DD4E  STA   $07
         LDA   $14
         STA   $05
L02DD54  STZ   $09
         STZ   $0B
         LDA   $12
         BPL   L02DD6D
         SEC
         LDA   #$0000
         SBC   $10
         STA   $10
         LDA   #$0000
         SBC   $12
         STA   $12
         DEC   $01
L02DD6D  RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L02DD7A
L02DD7A  DB    $00
         DB    $00
         ADRL  L02DD80
L02DD80  DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L02DD88
L02DD88  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02DD98  ENT
         DB    $00
         DB    $00
L02DD9A  DB    $00
         DB    $00
L02DD9C  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02DDA2  DB    $00
         DB    $00
L02DDA4  DB    $00
         DB    $00
L02DDA6  DB    $00
L02DDA7  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02DDB4  PHA
         JSL   L02E0D7
         LDAL  L02DD9A
         PHA
         _DisposeAll
         PLA
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L02DDD0
L02DDD0  ADRL  L02DDD4    ;  path name
L02DDD4  DW    $0000      ;  flags

L02DDD6  PHX
         PHA
         PHD
         TSC
         TCD
         LDA   #$0000
         LDY   #$0010
L02DDE1  LSR   $03
         BCC   L02DDE8
         CLC
         ADC   $05
L02DDE8  ASL   $05
         DEY
         BNE   L02DDE1
         PLD
         PLX
         PLX
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

L02DDFD  LDA   $04,S
         PHA
         JSL   L02DF20
         JMPL  L02DE08

L02DE08  PHK
         PLB
         LDA   L02DDA6
         BNE   L02DE12
         BRL   L02DF1A
L02DE12  BRA   L02DE2C
L02DE14  STR   'Error occurred at line '
L02DE2C  PEA   ^L02DE14
         PEA   L02DE14
         _ErrWriteString
         LDA   L02DDA6
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         JSL   L02E0EC
         BRA   L02DE5B
L02DE4C  STR   ' in procedure '
L02DE5B  PEA   ^L02DE4C
         PEA   L02DE4C
         _ErrWriteString
         PEA   ^L02DDA7
         PEA   L02DDA7
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L02E11C
         JSL   L02E161
         LDA   L02DDA2
         ORA   L02DDA4
         BNE   L02DE8A
         BRL   L02DF1A
L02DE8A  PEA   $000D
         _ErrWriteChar
         PEA   $000A
         _ErrWriteChar
         BRA   L02DEAD
L02DEA0  STR   '  Line  Name'
L02DEAD  PEA   ^L02DEA0
         PEA   L02DEA0
         _ErrWriteLine
         BRA   L02DEC9
L02DEBC  STR   '  ----  ----'
L02DEC9  PEA   ^L02DEBC
         PEA   L02DEBC
         _ErrWriteLine
L02DED6  LDA   L02DDA2
         ORA   L02DDA4
         BEQ   L02DF1A
         LDA   L02DDA6
         PHA
         PEA   $0006
         PEA   $0000
         PEA   $0001
         JSL   L02E0EC
         BRA   L02DEF4
L02DEF1  STR   '  '
L02DEF4  PEA   ^L02DEF1
         PEA   L02DEF1
         _ErrWriteString
         PEA   ^L02DDA7
         PEA   L02DDA7
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L02E11C
         JSL   L02E161
         BRA   L02DED6
L02DF1A  LDA   #$FFFF
         BRL   L02DDB4
L02DF20  PHD
         PEA   ^L02DF4A
         PEA   L02DF4A
         TSC
         TCD
         LDX   $0A
L02DF2B  DEX
         BEQ   L02DF3A
         SEC
         LDA   [$01]
         AND   #$00FF
         ADC   $01
         STA   $01
         BRA   L02DF2B
L02DF3A  _ErrWriteLine
         PLD
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         RTL

L02DF4A  STR   'Subrange exceeded'
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
         STR   'Stack error'

L02E055  TSC
         SEC
         SBC   #$000C
         TCS
         PHD
         TCD
         LDA   $10
         ORA   $12
         BNE   L02E068
         SEP   #$40
         BRL   L02E0CF
L02E068  JSL   L02DD35
         LDA   $16
         ORA   $12
         BEQ   L02E094
         LDY   #$0020
L02E075  ASL   $05
         ROL   $07
         ROL   $09
         ROL   $0B
         SEC
         LDA   $09
         SBC   $10
         TAX
         LDA   $0B
         SBC   $12
         BCC   L02E08F
         STX   $09
         STA   $0B
         INC   $05
L02E08F  DEY
         BNE   L02E075
         BEQ   L02E0B0
L02E094  LDA   #$0000
         LDY   #$0010
L02E09A  ASL   $05
         ROL
         SEC
         SBC   $10
         BCS   L02E0A9
         ADC   $10
         DEY
         BNE   L02E09A
         BEQ   L02E0AE
L02E0A9  INC   $05
         DEY
         BNE   L02E09A
L02E0AE  STA   $09
L02E0B0  LDA   $01
         BEQ   L02E0C3
         SEC
         LDA   #$0000
         SBC   $05
         STA   $05
         LDA   #$0000
         SBC   $07
         STA   $07
L02E0C3  LDX   #$0006
L02E0C6  LDA   $05,X
         STA   $10,X
         DEX
         DEX
         BPL   L02E0C6
         CLV
L02E0CF  PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L02E0D7  PHB
         PHK
         PLB
         STZ   L02E18A
         STZ   L02E18C
         LDX   #$0026
L02E0E3  STZ   L02E18E,X
         DEX
         DEX
         BPL   L02E0E3
         PLB
         RTL

L02E0EC  TSC
         PHD
         TCD
         PEA   ^L02E387
         PEA   L02E387
         LDA   $0A
         JSL   L02E1B6
         PEA   ^L02E387
         PEA   L02E387
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L02E11C
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

L02E11C  TSC
         PHD
         TCD
         INC   $0A
         BNE   L02E125
         INC   $0C
L02E125  LDA   [$0A]
         AND   #$00FF
         SEC
         SBC   $08
         BPL   L02E139
         EOR   #$FFFF
         INC
         LDY   $04
         JSL   L02E426
L02E139  LDA   $0C
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

L02E161  PHB
         PHK
         PLB
         LDA   L02DDA4
         PHA
         LDA   L02DDA2
         PHA
         TSC
         PHD
         TCD
         LDY   #$0010
L02E172  LDA   [$01],Y
         STA   L02DDA2,Y
         DEY
         DEY
         BPL   L02E172
         LDA   $03
         PHA
         LDA   $01
         PHA
         JSL   L02E1CD
         PLD
         PLA
         PLA
         PLB
         RTL

L02E18A  DB    $00
         DB    $00
L02E18C  DB    $00
         DB    $00
L02E18E  DB    $00
         DB    $00
L02E190  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02E1B6  PHA
         PEA   ^L02E3B1
         PEA   L02E3B1
         PEA   $0028
         PEA   $0001
         _Int2Dec
         JMP   L02E3D9

L02E1CD  TSC
         PHD
         TCD
         LDY   $04
         LDX   $06
         SEC
         TYA
         SBC   #$0002
         STA   $04
         BCS   L02E1DF
         DEC   $06
L02E1DF  LDA   [$04]
         BNE   L02E1EA
         TYA
         JSL   L02E2E8
         BRA   L02E1EF
L02E1EA  TYA
         JSL   L02E1FB
L02E1EF  LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L02E1FB  PHA
         PHA
         PHA
         SEC
         SBC   #$0004
         BCS   L02E205
         DEX
L02E205  PHX
         PHA
         TSC
         PHD
         TCD
         LDA   [$01]
         BPL   L02E211
         BRL   L02E2E0
L02E211  LDA   [$01]
         ORA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         TAY
         LDA   $01
         LDX   $03
         JSL   L02E35C
L02E228  LDA   $09
         CMP   #$1000
         BCC   L02E232
         BRL   L02E2CE
L02E232  LDA   [$01]
         AND   $09
         BEQ   L02E289
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
         BEQ   L02E252
         BRL   L02E2E0
L02E252  LDA   [$05]
         BMI   L02E259
         BRL   L02E2E0
L02E259  LDY   $09
         LDX   $03
         LDA   $01
         JSL   L02E442
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L02E442
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
         JSL   L02E35C
         BRA   L02E228
L02E289  CLC
         LDA   $01
         ADC   $09
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BNE   L02E2E0
         LDA   [$05]
         BPL   L02E2E0
         LDY   $09
         LDX   $03
         LDA   $01
         JSL   L02E442
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L02E442
         ASL   $09
         LDY   #$0002
         LDA   $09
         STA   [$01],Y
         LDY   $09
         LDA   $01
         LDX   $03
         JSL   L02E35C
         BRL   L02E228
L02E2CE  LDY   $09
         LDA   $01
         LDX   $03
         JSL   L02E442
         LDA   $01
         LDX   $03
         JSL   L02E2E8
L02E2E0  PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L02E2E8  PHA
         PHA
         SEC
         SBC   #$000E
         BCS   L02E2F1
         DEX
L02E2F1  PHX
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$01],Y
         ORA   [$01]
         BNE   L02E312
         LDY   #$0004
         LDA   [$01],Y
         STAL  L02E18A
         INY
         INY
         LDA   [$01],Y
         STAL  L02E18C
         BRA   L02E327
L02E312  LDA   [$01]
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
L02E327  LDY   #$0004
         LDA   [$01],Y
         TAX
         INY
         INY
         ORA   [$01],Y
         BEQ   L02E344
         LDA   [$01],Y
         STA   $07
         STX   $05
         LDY   #$0002
         LDA   [$01]
         STA   [$05]
         LDA   [$01],Y
         STA   [$05],Y
L02E344  LDY   #$000A
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

L02E35C  PHX
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L02E4AD
         LDY   #$0004
         LDAL  L02E18E,X
         STA   [$01],Y
         INY
         INY
         LDAL  L02E190,X
         STA   [$01],Y
         LDA   $01
         STAL  L02E18E,X
         LDA   $03
         STAL  L02E190,X
         PLD
         PLA
         PLA
         RTL

L02E387  DW    $0028
         DS    $28
L02E3B1  DS    $28

L02E3D9  PHD
         TSC
         TCD
         SEP   #$20
         LDX   #$0000
         LDA   #$20
L02E3E3  CMPL  L02E3B1,X
         BNE   L02E3EC
         INX
         BRA   L02E3E3
L02E3EC  REP   #$20
         TXA
         SEC
         SBC   #$0028
         EOR   #$FFFF
         INC
         SEP   #$20
         CMP   [$06]
         BEQ   L02E3FF
         BCS   L02E416
L02E3FF  LDY   #$0001
         STA   [$06],Y
L02E404  LDAL  L02E3B1,X
         INY
         STA   [$06],Y
         INX
         CPX   #$0028
         BCC   L02E404
         REP   #$20
         CLV
         BRA   L02E41A
L02E416  REP   #$20
         SEP   #$40
L02E41A  LDA   $02,S
         STA   $06,S
         LDA   $04,S
         STA   $08,S
         PLD
         PLA
         PLA
         RTL

L02E426  PHA
         TYA
         XBA
         CLC
         ADC   #$180C
         PHA
         PHD
         TSC
         TCD
L02E431  PEA   $0020
         LDX   $03
         JSL   $E10000
         DEC   $05
         BNE   L02E431
         PLD
         PLA
         PLA
         RTL

L02E442  PHX
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
         JSL   L02E4AD
         LDAL  L02E18E,X
         STA   $05
         LDAL  L02E190,X
         STA   $07
L02E45F  LDA   $05
         CMP   $09
         BNE   L02E46B
         LDA   $07
         CMP   $0B
         BEQ   L02E482
L02E46B  LDA   $05
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
         BRA   L02E45F
L02E482  LDY   #$0004
         LDA   $01
         ORA   $02
         BNE   L02E49B
         LDA   [$05],Y
         STAL  L02E18E,X
         INY
         INY
         LDA   [$05],Y
         STAL  L02E190,X
         BRA   L02E4A5
L02E49B  LDA   [$05],Y
         STA   [$01],Y
         INY
         INY
         LDA   [$05],Y
         STA   [$01],Y
L02E4A5  PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L02E4AD  LDX   #$0000
         DEC
         LSR
         LSR
         LSR
         BEQ   L02E4BD
L02E4B6  INX
         INX
         INX
         INX
         LSR
         BNE   L02E4B6
L02E4BD  RTL

