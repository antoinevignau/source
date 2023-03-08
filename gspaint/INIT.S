*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	INIT.E
	 use	INIT.X
	 lst	off
	 
*-------------------------------

BUTN0 EQU $C061
CLRROM EQU $CFFF
GSOS EQU $E100A8

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-------------------------------

         BRA   L020004
         LDA   $A5
L020004  PHB
         PHK
         PLB
         LDA   #$0000
         STAL  L019693
         SEP   #$20
         LDAL  BUTN0
         BPL   L02001F
         REP   #$20
         LDA   #$0001
         STAL  L019693
L02001F  REP   #$20
         _TLStartUp
         PEA   $0000
         _MMStartUp
         BCC   L020036
         BRK   $F1
L020036  PLA
         _MTStartUp
         BCC   L020042
         BRK   $F2
L020042  LDA   $0A
         PHA
         LDA   $0C
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0C00
         LDAL  L01967F
         PHA
         PEA   $C005
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L020069
         BRK   $F3
L020069  PLA
         STA   $0A
         PLA
         STA   $0C
         LDA   [$0A]
         TAX
         LDY   #$0002
         LDA   [$0A],Y
         STA   $0C
         STX   $0A
         LDY   #$00FE
         LDA   #$0000
L020081  STA   [$0A],Y
         DEY
         DEY
         BPL   L020081
         LDA   $0A
         PLX
         STX   $0C
         PLX
         STX   $0A
         TCD
         STAL  L01968D
         PEA   ^L020DD0
         PEA   L020DD0
         _LoadTools
         BCC   L0200A9
         LDA   #$0004
         BRL   L020715
L0200A9  LDX   #$000A
L0200AC  LDA   L020DC4,X
         STA   $7E,X
         DEX
         DEX
         BPL   L0200AC
         LDA   #$3197
         STA   $06
         LDA   #$00E1
         STA   $08
         LDA   #$000E
         STA   $76
         STAL  L01969D
         STA   $78
         STZ   $6E
         LDA   #$0010
         STA   $70
         STA   $72
         LDA   #$0001
         STA   $74
         LDA   #$0003
         STA   $7A
         LDAL  L01968D
         CLC
         ADC   #$0100
         PHA
         PEA   $0000
         PEA   $00A0
         LDAL  L01967F
         PHA
         _QDStartUp
         BCC   L020100
         LDA   #$0005
         BRL   L020715
L020100  PHD
         LDAL  L01968D
         CLC
         ADC   #$0200
         TCD
         PHA
         PHA
         PHA
         PHA
         PEI   $B2
         PEI   $B0
         _GetHandleSize
         PEI   $B2
         PEI   $B0
         _DisposeHandle
         LDAL  L01967F
         PHA
         PEA   $8010
         PHA
         PHA
         _NewHandle
         PLA
         STA   $B0
         PLA
         STA   $B2
         PHA
         PHA
         _GetCursorAdr
         _SetCursor
         PLD
         LDAL  L01968D
         CLC
         ADC   #$0400
         PHA
         PEA   $0014
         PEA   $0000
         PEA   $013F
         PEA   $0000
         PEA   $00C7
         LDAL  L01967F
         PHA
         _EMStartUp
         BCC   L020178
         LDA   #$0006
         BRL   L020715
L020178  JSR   L02072B
         LDA   #$018C
         STA   $F0
         STAL  L019980
         LDA   #$F780
         STAL  L019699
         LDA   #$0000
         STAL  L01969B
         LDAL  L019699
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L0201A8
         LDA   #$0014
         BRL   L020715
L0201A8  LDA   $0A
         STA   $EC
         LDA   $0C
         STA   $EE
         LDA   [$0A]
         STAL  L019976
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019978
         LDA   #$459E
         LDX   #$0000
         LDY   #$8011
         JSL   L018717
         BCC   L0201D4
         LDA   #$0014
         BRL   L020715
L0201D4  LDA   $0A
         STA   $E8
         LDA   $0C
         STA   $EA
         LDA   [$0A]
         STAL  L019998
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L01999A
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L020200
         LDA   #$0014
         BRL   L020715
L020200  LDA   $0A
         STA   $E4
         LDA   $0C
         STA   $E6
         LDA   [$0A]
         STAL  L019984
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019986
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L02022C
         LDA   #$0014
         BRL   L020715
L02022C  LDA   $0A
         STA   $DC
         LDA   $0C
         STA   $DE
         LDA   [$0A]
         STAL  L0199AC
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L0199AE
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L020258
         LDA   #$0014
         BRL   L020715
L020258  LDA   $0A
         STA   $E0
         LDA   $0C
         STA   $E2
         LDA   [$0A]
         STAL  L019970
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019972
         PEA   ^L020DDA
         PEA   L020DDA
         _LoadTools
         BCC   L020284
         LDA   #$0004
         BRL   L020715
L020284  _QDAuxStartUp
         BCC   L020293
         LDX   #$0011
         BRL   L020715
L020293  LDAL  L01967F
         ORA   #$0800
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0500
         PHA
         _FMStartUp
         BCC   L0202B3
         LDX   #$000F
         BRL   L020715
L0202B3  LDAL  L01967F
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0600
         PHA
         _PMStartUp
         BCC   L0202D0
         LDA   #$0010
         BRL   L020715
L0202D0  LDA   #$008C
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         LDA   $0C
         STA   $F6
         PHA
         LDA   $0A
         STA   $F4
         PHA
         _PrDefault
         LDAL  L01967F
         PHA
         _WindStartUp
         BCC   L020302
         LDA   #$0007
         BRL   L020715
L020302  LDAL  L01967F
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0800
         PHA
         _CtlStartUp
         BCC   L02031F
         LDA   #$0008
         BRL   L020715
L02031F  LDAL  L01967F
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0900
         PHA
         _LEStartUp
         BCC   L02033C
         LDA   #$0009
         BRL   L020715
L02033C  LDAL  L01967F
         PHA
         _DialogStartUp
         BCC   L020350
         LDA   #$000A
         BRL   L020715
L020350  LDAL  L01967F
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0A00
         PHA
         _MenuStartUp
         BCC   L02036D
         LDA   #$000B
         BRL   L020715
L02036D  _DeskStartUp
         BCC   L02037C
         LDA   #$000C
         BRL   L020715
L02037C  LDAL  L01967F
         PHA
         CLC
         LDAL  L01968D
         ADC   #$0B00
         PHA
         _SFStartUp
         BCC   L020399
         LDA   #$000D
         BRL   L020715
L020399  _ListStartUp
         BCC   L0203A8
         LDA   #$0012
         BRL   L020715
L0203A8  PEA   $0005
         PEA   ^L0107E3
         PEA   L0107E3
         _Desktop
         LDA   #$0086
         STAL  L019683
         LDA   #$0042
         STAL  L019681
         PEA   $0000
         PEA   $0000
         _GetCursorAdr
         PLA
         STAL  L019EE0
         PLA
         STAL  L019EE0+2
         LDA   #L01A3CC
         STAL  L019EDC
         LDA   #^L01A3CC
         STAL  L019EDC+2
         LDA   #$0001
         STA   $54
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         _ShowCursor
         PHA
         PHA
         _GetPort
         PLA
         STA   $8C
         PLA
         STA   $8E
         LDA   #$010C
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         LDA   [$0A]
         STA   $A4
         LDY   #$0002
         LDA   [$0A],Y
         STA   $A6
         LDA   $A4
         STA   L020E16
         LDA   $A6
         STA   L020E16+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L020E0A
         BCS   L02046A
         LDA   L020E0A
         STA   L020E14
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L020E14
         BCS   L02046A
         PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _SetColorTable
         _InitPalette
L02046A  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L020E08
         LDY   #$0014
L020477  PHY
         PHA
         PHA
         LDA   L020E7B+2,Y
         PHA
         LDA   L020E7B,Y
         PHA
         _NewMenu
         PEA   $0000
         _InsertMenu
         PLY
         DEY
         DEY
         DEY
         DEY
         BPL   L020477
         PEA   $0001
         _FixAppleMenu
         PHA
         _FixMenuBar
         PLA
         _DrawMenuBar
         PEA   ^L019825
         PEA   L019825
         _OpenPort
         PEA   ^L019974
         PEA   L019974
         _SetPortLoc
         PEA   ^L01997C
         PEA   L01997C
         _SetPortRect
         PEA   ^L01997C
         PEA   L01997C
         _ClipRect
         PHA
         PHA
         _GetClipHandle
         _SetVisRgn
         PHA
         PHA
         PEA   $0000
         PEA   $0100
         LDAL  L01967F
         PHA
         PEA   $0008
         LDA   #$0000
         PHA
         PHA
         _NewHandle
         PLA
         STAL  L0199CC
         PLA
         STAL  L0199CE
         PEA   $0000
         PEA   $0000
         _GetDblTime
         PLA
         STAL  L01973D
         PLA
         STAL  L01973F
         PHA
         PEA   $0029	; Display language
         _ReadBParam
         PLA
         STAL  L019691

         SEP   #$30
L020547  LDAL  CLRROM
         LDY   #$03
         LDX   #$BA
L02054F  LDAL  $00C100
L020553  LDAL  $00C800,X
         DEX
         DEY
         BMI   L020568
         CMP   L020D7D,Y
         BEQ   L020553
         INC   L02054F+2
         LDA   L02054F+2
         CMP   #$C8
L020568  LDA   L02054F+2
         STAL  L019686
         BCC   L020547
         REP   #$30
         LDAL  L019685
         CMP   #$C800
         BEQ   L020580
         JSL   L0192CA

L020580  LDA   #L010676
         STA   L020E97
         LDA   #^L010676
         STA   L020E97+2
         PHA
         PHA
         PEA   ^L020E93
         PEA   L020E93
         _NewWindow
         LDA   $03,S
         PHA
         LDA   $03,S
         PHA
         _SetPort
         PLA
         STA   $90
         PLA
         STA   $92
         PEA   $0000
         PEA   $0000
         _SetOrigin
         PEA   ^L0196A3
         PEA   L0196A3
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetFrameColor
         LDA   $92
         PHA
         LDA   $90
         PHA
         _ShowWindow
         LDA   #$0085
         STAL  L0199C0
         STA   $5A
         LDA   #$0084
         STAL  L0199C2
         STZ   $56
         STZ   $58
         LDA   #$010C
         STA   $5C
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _ClipRect
         PEA   $0004
         _SetTextMode
         PHA
         PHA
         _FMGetSysFID
         PLA
         STAL  L0196AF
         PLA
         STAL  L0196B1
         _LoadSysFont
         PEA   ^L0196B3
         PEA   L0196B3
         _GetFontInfo
         CLC
         LDAL  L0196B3
         ADCL  L0196B5
         CLC
         ADCL  L0196B9
         STAL  L0196AD
         LDAL  L019693
         BEQ   L020667
         PEA   ^L0106DA
         PEA   L0106DA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetWTitle
         LDA   #$0001
         STA   $3C
         BRA   L020687
L020667  PEA   ^L019825
         PEA   L019825
         _SetPort
         PEA   ^L01997C
         PEA   L01997C
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
L020687  LDA   #$0000
         STAL  L019693
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSL   L0118C4
         PHA
         PHA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _GetWTitle
         PEA   ^L0198DF
         PEA   L0198DF
         PEA   $0000
         PEA   $0010
         _BlockMove
         JSL   L010D82
         LDA   #$0100
         STA   $D8
         STZ   $DA
         PHA
         PHA
         LDA   $DA
         PHA
         LDA   $D8
         PHA
         LDAL  L01967F
         PHA
         PEA   $0008
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLA
         STA   $CC
         PLA
         STA   $CE
         LDA   #$0001
         STAL  L019687
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L020713
         PLB
         RTL

L020713  DW    $0000      ;  ref num
L020715  PHA
         DEC
         ASL
         ASL
         TAY
         LDA   L020B0A+2,Y
         PHA
         LDA   L020B0A,Y
         PHA
         _SysFailMgr
         BRK   $FE
L02072B  PEA   $0000
         PEA   ^L020ACA
         PEA   L020ACA
         _SetColorTable
         STZ   L02083C
         STZ   L02083C+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L020836
         BCC   L020750
         BRL   L02081B
L020750  LDA   L020836
         STA   L020854
         STA   L020864
         LDA   #L020AEA
         STA   L020856
         LDA   #^L020AEA
         STA   L020856+2
         LDA   #$0020
         STA   L02085A
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L020854
         BCC   L02077A
         BRL   L02081B
L02077A  LDA   #L02086A
         STA   L020856
         LDA   #^L02086A
         STA   L020856+2
         LDA   #$0202
         STA   L02085A
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L020854
         BCC   L02079B
         BRL   L02081B
L02079B  LDA   #L02086A
         STA   L020856
         LDA   #^L02086A
         STA   L020856+2
         LDA   #$2000
         STA   L020AC2
         LDA   #$00E1
         STA   L020AC2+2
         LDA   #$7D00
         STA   L020AC6
         LDA   #$00A0
         STA   L02085A
         JSL   GSOS
         DW    $0017      ; GetMark
         ADRL  L020864
L0207C9  JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L020864
         BCC   L0207DD
         CMP   #$004D
         BEQ   L02081B
         BRL   L02081B
L0207DD  JSL   GSOS
         DW    $0012      ; Read
         ADRL  L020854
         BCC   L0207F1
         CMP   #$004C
         BEQ   L02081B
         BRL   L02081B
L0207F1  PHA
         PEA   ^L02086A
         PEA   L02086A
         PEA   $00A0
         PEA   ^L020AC2
         PEA   L020AC2
         PEA   ^L020AC6
         PEA   L020AC6
         _UnPackBytes
         PLA
         CLC
         ADC   L020866
         STA   L020866
         LDA   L020AC6
         BNE   L0207C9
L02081B  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L020862
         PEA   $0000
         PEA   ^L020AEA
         PEA   L020AEA
         _SetColorTable
         RTS

L020836  DW    $0000      ;  ref num
         ADRL  L020840    ;  path name
L02083C  ADRL  $00000000  ;  reserved
L020840  STR   '1/PaintTools/Screen'
L020854  DW    $0000      ;  ref num
L020856  ADRL  $00000000  ;  buffer ptr
L02085A  ADRL  $00007D00  ;  request count
         ADRL  $00000000  ;  transfer count
L020862  DW    $0000      ;  ref num
L020864  DW    $0000      ;  ref num
L020866  ADRL  $00000000  ;  position
L02086A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L020AC2  ADRL  $00000000
L020AC6  DW    $0000
         DW    $0000
L020ACA  DS    $20
L020AEA  DS    $20
L020B0A  ADRL  L020B5A
         ADRL  L020B74
         ADRL  L020B8E
         ADRL  L020BA7
         ADRL  L020BBD
         ADRL  L020BD8
         ADRL  L020BF7
         ADRL  L020C17
         ADRL  L020C38
         ADRL  L020C54
         ADRL  L020C74
         ADRL  L020C91
         ADRL  L020CAF
         ADRL  L020CCE
         ADRL  L020CED
         ADRL  L020D0B
         ADRL  L020D2C
         ADRL  L020D46
         ADRL  L020D64
         ADRL  L020D6B
L020B5A  STR   'Could not Memory manager.'
L020B74  STR   'Could not init Msc Tools.'
L020B8E  STR   'Could not get zero page.'
L020BA7  STR   'Could not load Tools.'
L020BBD  STR   'Could not Start QuickDraw.'
L020BD8  STR   'Could not Start Event Manager.'
L020BF7  STR   'Could not start Window Manager.'
L020C17  STR   'Could not start Control Manager.'
L020C38  STR   'Could not start LE Manager.'
L020C54  STR   'Could not start Dialog Manager.'
L020C74  STR   'Could not start Menu Manager'
L020C91  STR   'Could not start Desk Manager.'
L020CAF  STR   'Could not start Standard File.'
L020CCE  STR   'Could not start Scrap Manager.'
L020CED  STR   'Could not start Font Manager.'
L020D0B  STR   'Could not start Printer Manager.'
L020D2C  STR   'Could not start Pictures.'
L020D46  STR   'Could not start List Manager.'
L020D64  STR   'Unused'
L020D6B  STR   'No enough memory.'
L020D7D  HEX   206ACA0000
         STR   '1/PaintTools/Paint018'
         STR   '1/PaintTools/Paint027'
         STR   '1/Painttools/Paint019'

L020DC4  PHB
         PHK
         PLB
         JSR   $CBB9
         JSR   $CB70
         PLB
         RTL

         HEX   00

L020DD0  DW    $0002      ; number of tools
         DW    $0004      ; quickdraw II
         DW    $0100
         DW    $0005      ; desk manager
         DW    $0100

L020DDA  DW    $000B      ; number of tools
         DW    $0006      ; event manager
         DW    $0100
         DW    $000E      ; window manager
         DW    $0000
         DW    $000F      ; menu manager
         DW    $0100
         DW    $0010      ; control manager
         DW    $0000
         DW    $0012      ; quickdraw II aux
         DW    $0000
         DW    $0013      ; print manager
         DW    $0000
         DW    $0014      ; lineedit tool set
         DW    $0000
         DW    $0015      ; dialog manager
         DW    $0000
         DW    $0017      ; std file tool set
         DW    $0000
         DW    $001B      ; font manager
         DW    $0000
         DW    $001C      ; list manager
         DW    $0000

L020E08  DW    $0000      ;  ref num
L020E0A  DW    $0000      ;  ref num
         ADRL  L020E22    ;  path name
         ADRL  $00000000  ;  reserved
L020E14  DW    $0000      ;  ref num
L020E16  ADRL  $00000000  ;  buffer ptr
         ADRL  $00000020  ;  request count
         ADRL  $00000000  ;  transfer count
L020E22  STR   '1/PaintTools/Palette'
         ADRL  L020E51
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
L020E51  STR   '1/PaintTools/Fonts'
         STR   '*/System/Tools/Tool019'

L020E7B  ADRL  L01012B
         ADRL  L010155
         ADRL  L01023E
         ADRL  L0102FE
         ADRL  L0103A8
         ADRL  L010405

L020E93  DW    $004E
         DW    $C004      ; frame bits
L020E97  ADRL  $00000000  ; title ptr
         ADRL  $00000001  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  $00000000  ; color table ptr
         DW    $0000      ; origin
         DW    $01F4
         DW    $0000      ; data size
         DW    $03E8
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
         DW    $001C      ; content rect
         DW    $002E
         DW    $00A1
         DW    $013A
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
