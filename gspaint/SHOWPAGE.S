*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	SHOWPAGE.X
	 lst	off
	 
*-------------------------------

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

         BRA   L0C0004
         LDA   $A5
L0C0004  PHB
         PHK
         PLB
         JSL   L018744
         LDA   $34
         BEQ   L0C0013
         JSL   L01436D
L0C0013  JSL   L0118C4
         LDA   #$0084
         STA   L0C073A
         LDA   $F0
         CMP   #$00C9
         BNE   L0C002A
         LDA   #$0043
         STA   L0C073A
L0C002A  CLC
         LDA   L0C073A
         ADC   #$001C
         STA   L0C06B6
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         PEA   ^L019E74
         PEA   L019E74
         PEA   ^L0C06C2
         PEA   L0C06C2
         _FillRect
         _PenNormal
         PEA   ^L0C06AA
         PEA   L0C06AA
         _FrameRect
         LDA   L0C06B4
         PHA
         LDA   L0C06B6
         PHA
         _MoveTo
         LDA   L0C06B8
         PHA
         LDA   L0C06B6
         PHA
         _LineTo
         PEA   ^L0C06B2
         PEA   L0C06B2
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRect
         LDA   $F0
         CMP   #$00C9
         BNE   L0C00E0
         LDA   L0C06B4
         STA   L0C06BC
         LDA   L0C06B8
         STA   L0C06C0
         LDA   L0C06B6
         INC
         STA   L0C06BA
         LDA   L0C06AE
         DEC
         STA   L0C06BE
         PEA   ^L0C06BA
         PEA   L0C06BA
         PEA   ^L0C06E6
         PEA   L0C06E6
         _FillRect
L0C00E0  PEA   ^L0C0706
         PEA   L0C0706
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         PEA   ^L0C0706
         PEA   L0C0706
         PEA   $0010
         PEA   $000D
         _FrameRRect
         CLC
         LDA   L0C0708
         ADC   #$0019
         PHA
         CLC
         LDA   L0C0706
         ADC   #$000A
         PHA
         _MoveTo
         PEA   ^L01046F
         PEA   L01046F
         _DrawString
         PEA   ^L0C070E
         PEA   L0C070E
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         PEA   ^L0C070E
         PEA   L0C070E
         PEA   $0010
         PEA   $000D
         _FrameRRect
         CLC
         LDA   L0C0710
         ADC   #$0009
         PHA
         CLC
         LDA   L0C070E
         ADC   #$000A
         PHA
         _MoveTo
         PEA   ^L010472
         PEA   L010472
         _DrawString
         _HideCursor
         LDX   $74
         JSL   L0149AE
         STX   $0C
         STA   $0A
         LDA   [$0A]
         STA   L0C069A
         STZ   L0C069E
         STZ   L0C06A0
         LDA   L0C073A
         STA   L0C06A2
         LDA   #$00A0
         STA   L0C06A4
         JSR   L0C0583
         JSR   L0C0662
         PHA
         PHA
         LDA   $56
         PHA
         PEA   $0003
         _UDivide
         PLA
         CLC
         ADC   #$001C
         STA   L0C0724
         CLC
         ADC   #$002D
         STA   L0C0728
         PLA
         LDA   $58
         LSR
         CLC
         ADC   #$003C
         STA   L0C0726
         CLC
         ADC   #$0086
         STA   L0C072A
         PEA   $0002
         _SetPenMode
         PEA   ^L0C06E6
         PEA   L0C06E6
         _SetPenPat
         JSR   L0C0575
         _ShowCursor
L0C01F3  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BNE   L0C01F3
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0C0706
         PEA   L0C0706
         _PtInRect
         PLA
         BEQ   L0C022A
         BRL   L0C0284
L0C022A  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0C070E
         PEA   L0C070E
         _PtInRect
         PLA
         BEQ   L0C0244
         BRL   L0C0380
L0C0244  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0C0724
         PEA   L0C0724
         _PtInRect
         PLA
         BEQ   L0C0261
         STZ   L0C069C
         BRL   L0C03AD
L0C0261  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0C06B2
         PEA   L0C06B2
         _PtInRect
         PLA
         BNE   L0C027B
         BRL   L0C01F3
L0C027B  LDA   #$0001
         STA   L0C069C
         BRL   L0C03AD
L0C0284  PEA   ^L0C0706
         PEA   L0C0706
         PEA   $0010
         PEA   $000D
         _InvertRRect
         PHA
         PHA
         SEC
         LDA   L0C0724
         SBC   #$001C
         PHA
         PEA   $0003
         _Multiply
         PLA
         STA   $56
         CLC
         ADC   #$0085
         STA   $5A
         CMP   $F0
         BEQ   L0C02C4
         BCC   L0C02C4
         LDA   $F0
         STA   $5A
         SEC
         SBC   #$0085
         STA   $56
L0C02C4  PLA
         SEC
         LDA   L0C0726
         SBC   #$003C
         ASL
         STA   $58
         CLC
         ADC   #$010C
         STA   $5C
         _PenNormal
         LDA   L0C069E
         BNE   L0C02E6
         LDA   L0C06A0
         BEQ   L0C0340
L0C02E6  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         PEA   ^L019825
         PEA   L019825
         _SetPort
         LDA   $74
         DEC
         EOR   #$000F
         PHA
         _SetSolidBackPat
         PEA   ^L01997C
         PEA   L01997C
         LDA   L0C06A0
         ASL
         PHA
         LDA   L0C069E
         ASL
         CLC
         ADC   L0C069E
         PHA
         PEA   $0000
         PEA   $0000
         _ScrollRect
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
L0C0340  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   $58
         PHA
         LDA   $56
         PHA
         _SetOrigin
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _ClipRect
         CLC
         LDA   $56
         ADC   $5A
         LSR
         STAL  L019681
         CLC
         LDA   $58
         ADC   $5C
         LSR
         STAL  L019683
         BRA   L0C03A7
L0C0380  PEA   ^L0C070E
         PEA   L0C070E
         PEA   $0010
         PEA   $000D
         _InvertRRect
         _PenNormal
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
L0C03A7  JSL   L01194B
         PLB
         RTL

L0C03AD  LDAL  L0196C9
         AND   #$0200
         STA   $50
         STZ   L0C0738
         LDAL  L0196C7
         STA   L0C072E
         LDAL  L0196C5
         STA   L0C072C
L0C03C7  LDAL  L0196C5
         STA   L0C0730
         LDAL  L0196C7
         STA   L0C0732
         LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L0C03E7
         BRL   L0C04B1
L0C03E7  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         SEC
         LDAL  L0196C7
         SBC   L0C0732
         STA   L0C0736
         SEC
         LDAL  L0196C5
         SBC   L0C0730
         STA   L0C0734
         BNE   L0C0411
         LDA   L0C0736
         BEQ   L0C03C7
L0C0411  LDA   $50
         BEQ   L0C0435
         LDA   L0C0736
         PHA
         LDA   L0C0734
         PHA
         LDA   L0C0732
         PHA
         LDA   L0C0730
         PHA
         LDA   L0C0738
         PHA
         JSL   L01855E
         PLA
         STA   L0C0734
         PLA
         STA   L0C0736
L0C0435  LDA   #$0001
         STA   L0C0738
         LDA   L0C069C
         BEQ   L0C047E
         LDA   #$0001
         TRB   L0C0736
         CLC
         LDA   L0C069E
         ADC   L0C0734
         STA   L0C069E
         CLC
         ADC   L0C073A
         STA   L0C06A2
         CLC
         LDA   L0C06A0
         ADC   L0C0736
         STA   L0C06A0
         CLC
         ADC   #$00A0
         STA   L0C06A4
         CLC
         BPL   L0C046C
         SEC
L0C046C  ROR
         STA   L0C06A8
         LDA   L0C06A0
         CLC
         BPL   L0C0477
         SEC
L0C0477  ROR
         STA   L0C06A6
         BRL   L0C04B4
L0C047E  JSR   L0C0575
         LDA   L0C0736
         PHA
         LDA   L0C0734
         PHA
         LDA   L0C072E
         PHA
         LDA   L0C072C
         PHA
         PEA   ^L0C06B2
         PEA   L0C06B2
         PEA   ^L0C0724
         PEA   L0C0724
         JSL   L0183EE
         PLA
         STA   L0C072C
         PLA
         STA   L0C072E
         PLA
         PLA
         JSR   L0C0575
         BRL   L0C03C7
L0C04B1  BRL   L0C01F3
L0C04B4  LDA   #$319E
         STA   $28
         LDA   #$00E1
         STA   $2A
         LDAL  L019998
         STA   $0A
         LDAL  L01999A
         STA   $0C
         LDA   L0C069E
         BPL   L0C04EA
         PHA
         PHA
         SEC
         LDA   #$0000
         SBC   L0C069E
         PHA
         PEA   $0050
         _Multiply
         PLA
         CLC
         ADC   $0A
         STA   $0A
         PLA
L0C04EA  _HideCursor
         LDY   #$0000
L0C04F4  PHY
         TYA
         SEC
         SBC   L0C06A2
         BVS   L0C04FF
         EOR   #$8000
L0C04FF  BMI   L0C0567
         TYA
         SEC
         SBC   L0C069E
         BVS   L0C050B
         EOR   #$8000
L0C050B  BPL   L0C0567
         LDY   #$0000
L0C0510  PHY
         TYA
         SEC
         SBC   L0C06A6
         BVS   L0C051B
         EOR   #$8000
L0C051B  BPL   L0C0533
         TYA
         SEC
         SBC   L0C06A8
         BVS   L0C0527
         EOR   #$8000
L0C0527  BMI   L0C0533
         TYA
         SEC
         SBC   L0C06A6
         TAY
         LDA   [$0A],Y
         BRA   L0C0536
L0C0533  LDA   L0C069A
L0C0536  PLY
         SEP   #$20
         STA   [$28],Y
         REP   #$20
         INY
         CPY   #$0050
         BNE   L0C0510
         CLC
         LDA   $0A
         ADC   #$0050
         STA   $0A
L0C054B  CLC
         LDA   $28
         ADC   #$00A0
         STA   $28
         PLY
         INY
         CPY   L0C073A
         BNE   L0C04F4
         _ShowCursor
         JSR   L0C0575
         BRL   L0C03C7
L0C0567  LDA   L0C069A
         LDY   #$004E
L0C056D  STA   [$28],Y
         DEY
         DEY
         BPL   L0C056D
         BRA   L0C054B
L0C0575  PEA   ^L0C0724
         PEA   L0C0724
         _FrameRect
         RTS

L0C0583  LDAL  L019998
         STA   $28
         LDAL  L01999A
         STA   $2A
         LDAL  L019976
         STA   $0A
         CLC
         ADC   #$00A0
         STA   $0E
         CLC
         ADC   #$00A0
         STA   $12
         LDAL  L019978
         STA   $0C
         STA   $10
         STA   $14
         LDX   L0C073A
L0C05AE  PHX
         STZ   L0C071E
         LDY   #$0000
L0C05B5  PHY
         LDA   [$0A],Y
         AND   #$00F0
         STA   L0C0720
         LDA   [$0E],Y
         AND   #$00F0
         CMP   L0C0720
         BCS   L0C05CB
         STA   L0C0720
L0C05CB  LDA   [$12],Y
         AND   #$00F0
         CMP   L0C0720
         BCS   L0C05D8
         STA   L0C0720
L0C05D8  LDA   [$0A],Y
         AND   #$000F
         STA   L0C0722
         LDA   [$0E],Y
         AND   #$000F
         CMP   L0C0722
         BCS   L0C05ED
         STA   L0C0722
L0C05ED  LDA   [$12],Y
         AND   #$000F
         CMP   L0C0722
         BCS   L0C05FA
         STA   L0C0722
L0C05FA  LDA   L0C0720
         LSR
         LSR
         LSR
         LSR
         CMP   L0C0722
         BCC   L0C0609
         LDA   L0C0722
L0C0609  PHA
         TYA
         AND   #$0003
         ASL
         TAX
         PLA
         JMP   (L0C0716,X)

L0C0614  XBA
L0C0615  ASL
         ASL
         ASL
         ASL
L0C0619  BRA   L0C061C
L0C061B  XBA
L0C061C  TSB   L0C071E
         CPX   #$0006
         BNE   L0C0634
         LDA   $01,S
         SEC
         SBC   #$0003
         LSR
         TAY
         LDA   L0C071E
         STA   [$28],Y
         STZ   L0C071E
L0C0634  PLY
         INY
         CPY   #$00A0
         BEQ   L0C063E
         BRL   L0C05B5
L0C063E  CLC
         LDA   $0A
         ADC   #$01E0
         STA   $0A
         CLC
         ADC   #$00A0
         STA   $0E
         CLC
         ADC   #$00A0
         STA   $12
         CLC
         LDA   $28
         ADC   #$0050
         STA   $28
         PLX
         DEX
         BEQ   L0C0661
         BRL   L0C05AE
L0C0661  RTS

L0C0662  LDAL  L019998
         STA   $0A
         LDAL  L01999A
         STA   $0C
         LDA   #$319E
         STA   $28
         LDA   #$00E1
         STA   $2A
         LDX   L0C073A
L0C067B  LDY   #$004E
L0C067E  LDA   [$0A],Y
         STA   [$28],Y
         DEY
         DEY
         BPL   L0C067E
         CLC
         LDA   $28
         ADC   #$00A0
         STA   $28
         CLC
         LDA   $0A
         ADC   #$0050
         STA   $0A
         DEX
         BNE   L0C067B
         RTS

L0C069A  DW    $0000
L0C069C  DW    $0000
L0C069E  DW    $0000
L0C06A0  DW    $0000
L0C06A2  DW    $0000
L0C06A4  DW    $0000
L0C06A6  DW    $0000
L0C06A8  DW    $0000
L0C06AA  DW    $001B
         DW    $003B
L0C06AE  DW    $00A1
         DW    $00DD
L0C06B2  DW    $001C
L0C06B4  DW    $003C
L0C06B6  DW    $0000
L0C06B8  DW    $00DC
L0C06BA  DW    $0000
L0C06BC  DW    $0000
L0C06BE  DW    $0000
L0C06C0  DW    $0000
L0C06C2  HEX   0FFF0FFFFFFFFFFFFF0FFF0FFFFFFFFF
         HEX   0FFF0FFFFFFFFFFFFF0FFF0FFFFFFFFF
         DW    $FF0F
         DW    $FF0F
L0C06E6  HEX   0F0F0F0FF0F0F0F00F0F0F0FF0F0F0F0
         HEX   0F0F0F0FF0F0F0F00F0F0F0FF0F0F0F0
L0C0706  DW    $007B
L0C0708  DW    $00EA
         DW    $0088
         DW    $012D
L0C070E  DW    $008D
L0C0710  DW    $00EA
         DW    $009A
         DW    $012D
L0C0716  DA    L0C0615
         DA    L0C0619
         DA    L0C0614
         DA    L0C061B
L0C071E  DW    $0000
L0C0720  DW    $0000
L0C0722  DW    $0000
L0C0724  DW    $0000
L0C0726  DW    $0000
L0C0728  DW    $0000
L0C072A  DW    $0000
L0C072C  DW    $0000
L0C072E  DW    $0000
L0C0730  DW    $0000
L0C0732  DW    $0000
L0C0734  DW    $0000
L0C0736  DW    $0000
L0C0738  DW    $0000
L0C073A  DW    $0000
