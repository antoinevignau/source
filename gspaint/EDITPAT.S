*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	EDITPAT.E
	 use	EDITPAT.X
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

         BRA   L060004
         LDA   $A5
L060004  PHB
         PHK
         PLB
         PEA   $0064
         PEA   $0028
         PEA   $0095
         PEA   $0066
         JSL   L018223
         LDX   $70
         JSL   L0149AE
         PHX
         PHA
         PEA   ^L0605AB
         PEA   L0605AB
         PEA   $0000
         PEA   $0020
         _BlockMove
         PEA   ^L0605AB
         PEA   L0605AB
         PEA   ^L0605CB
         PEA   L0605CB
         PEA   $0000
         PEA   $0020
         _BlockMove
         _PenNormal
         PEA   ^L060553
         PEA   L060553
         _FrameRect
         PEA   ^L06055B
         PEA   L06055B
         _FrameRect
         JSR   L060401
         PHA
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   ^L06056B
         PEA   L06056B
         PEA   ^L01046F
         PEA   L01046F
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         PEA   $0001
         PHA
         PHA
         _NewControl
         PLA
         STA   L060633
         PLA
         STA   L060633+2
         PHA
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   ^L060573
         PEA   L060573
         PEA   ^L010472
         PEA   L010472
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         PEA   $0002
         PHA
         PHA
         _NewControl
         PLA
         STA   L060637
         PLA
         STA   L060637+2
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _DrawControls
         PEA   ^L060563
         PEA   L060563
         PEA   ^L0605AB
         PEA   L0605AB
         _FillRect
         STZ   L06062F
         LDA   #$0010
         STA   L0605F3
         PEA   ^L060605
         PEA   L060605
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         LDY   #$0007
L060112  LDX   #$0007
L060115  PHX
         PHY
         LDA   #L0605AB
         JSR   L060524
         STA   L06062D
         PLY
         PLX
         PHX
         PHY
         JSR   L0603AC
         JSR   L060487
         PEA   ^L0605EB
         PEA   L0605EB
         PEA   ^L06058B
         PEA   L06058B
         _FillRect
         PLY
         PLX
         DEX
         BPL   L060115
         DEY
         BPL   L060112
L060145  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   #$0001
         STA   L060631
         LDAL  L0196BB
         CMP   #$0001
         BEQ   L0601A5
         CMP   #$0003
         BNE   L060145
         LDAL  L0196BD
         CMP   #$000D
         BNE   L06018B
         PEA   $0002
         LDA   L060633+2
         PHA
         LDA   L060633
         PHA
         _HiliteControl
         BRL   L0602B2
L06018B  CMP   #$001B
         BNE   L060145
         PEA   $0002
         LDA   L060637+2
         PHA
         LDA   L060637
         PHA
         _HiliteControl
         BRL   L0602D2
L0601A5  LDAL  L0196C5
         STAL  L019751
         LDAL  L0196C7
         STAL  L019753
         PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L06057B
         PEA   L06057B
         _PtInRect
         PLA
         BNE   L0601DE
         BRL   L060145
L0601DE  JSR   L06049B
         BCC   L06021B
         STX   L0605F3
         STX   L06062D
         JSR   L060487
         PEA   ^L060605
         PEA   L060605
         PEA   ^L06058B
         PEA   L06058B
         _FillRect
         PEA   ^L0605AB
         PEA   L0605AB
         PEA   ^L0605CB
         PEA   L0605CB
         PEA   $0000
         PEA   $0020
         _BlockMove
         BRL   L060145
L06021B  PHA
         PEA   ^L06063B
         PEA   L06063B
         LDAL  L019753
         PHA
         LDAL  L019751
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _FindControl
         PLA
         BNE   L06027A
L06023C  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L060553
         PEA   L060553
         _PtInRect
         PLA
         BEQ   L060256
         JSR   L0602F2
L060256  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L060268
         BRL   L060145
L060268  STZ   L060631
         PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         BRA   L06023C
L06027A  PHA
         LDAL  L019753
         PHA
         LDAL  L019751
         PHA
         LDA   #$0000
         PHA
         PHA
         LDA   L06063B+2
         PHA
         LDA   L06063B
         PHA
         _TrackControl
         PLA
         CMP   #$0002
         BEQ   L0602A2
         BRL   L060145
L0602A2  LDA   L06063B
         CMP   L060633
         BNE   L0602D2
         LDA   L06063B+2
         CMP   L060633+2
         BNE   L0602D2
L0602B2  PEA   ^L0605AB
         PEA   L0605AB
         LDX   $70
         JSL   L0149AE
         PHX
         PHA
         PEA   $0000
         PEA   $0020
         _BlockMove
         LDA   #$0001
         STA   $3C
L0602D2  LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         JSL   L010D82
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         PLB
         RTL

L0602F2  PHA
         PHA
         LDAL  L0196C5
         SEC
         SBC   #$0007
         PHA
         PEA   $0005
         _UDivide
         PLA
         STA   L06063F
         PLX
         CMP   #$0008
         BCS   L060333
         PHA
         PHA
         LDAL  L0196C7
         SEC
         SBC   #$000C
         PHA
         PEA   $0007
         _UDivide
         PLX
         PLA
         CPX   #$0008
         BCS   L060333
         LDY   L06063F
         JSR   L060334
L060333  RTS

L060334  LDA   L0605F3
         STA   L06062D
         PHX
         PHY
         LDA   L060631
         BNE   L060355
         LDA   L06062F
         BEQ   L060376
         LDA   #L0605CB
         PLY
         PLX
         PHX
         PHY
         JSR   L060524
         STA   L06062D
         BRA   L060376
L060355  STZ   L06062F
         LDA   #L0605AB
         JSR   L060524
         CMP   L0605F3
         BNE   L060376
         LDA   #$0001
         STA   L06062F
         LDA   #L0605CB
         PLY
         PLX
         PHX
         PHY
         JSR   L060524
         STA   L06062D
L060376  PLY
         PLX
         PHX
         PHY
         JSR   L0603AC
         JSR   L060487
         PEA   ^L0605EB
         PEA   L0605EB
         PEA   ^L06058B
         PEA   L06058B
         _FillRect
         PLY
         PLX
         JSR   L0604F5
         PEA   ^L060563
         PEA   L060563
         PEA   ^L0605AB
         PEA   L0605AB
         _FillRect
         RTS

L0603AC  CLC
         LDA   L060555
         ADC   #$0002
         STA   L0605ED
         CLC
         ADC   #$0006
         STA   L0605F1
         CPX   #$0000
         BEQ   L0603D6
         LDA   L0605ED
L0603C5  CLC
         ADC   #$0007
         DEX
         BNE   L0603C5
         STA   L0605ED
         CLC
         ADC   #$0006
         STA   L0605F1
L0603D6  CLC
         LDA   L060553
         ADC   #$0002
         STA   L0605EB
         CLC
         ADC   #$0004
         STA   L0605EF
         CPY   #$0000
         BEQ   L060400
         LDA   L0605EB
L0603EF  CLC
         ADC   #$0005
         DEY
         BNE   L0603EF
         STA   L0605EB
         CLC
         ADC   #$0004
         STA   L0605EF
L060400  RTS

L060401  PEA   ^L0605FD
         PEA   L0605FD
         _FrameRect
         LDX   #$0001
         STX   L06062D
L060414  PHX
         JSR   L060487
         JSR   L0604C5
         PEA   ^L0605F5
         PEA   L0605F5
         PEA   ^L06058B
         PEA   L06058B
         _FillRect
         INC   L06062D
         PLX
         INX
         CPX   #$0011
         BNE   L060414
         PEA   $0022
         PEA   $0041
         _MoveTo
         PEA   $0089
         PEA   $0041
         _LineTo
         LDX   #$0008
         LDA   #$0022
L060458  PHX
         PHA
         PHA
         PHA
         PEA   $0036
         _MoveTo
         PEA   $004D
         _LineTo
         CLC
         PLA
         ADC   #$000D
         PLX
         DEX
         BNE   L060458
         PEA   ^L060583
         PEA   L060583
         _FrameRect
         RTS

L060487  LDA   L06062D
         DEC
         ASL
         TAY
         LDA   L06060D,Y
         LDY   #$001E
L060493  STA   L06058B,Y
         DEY
         DEY
         BPL   L060493
         RTS

L06049B  LDX   #$0001
L06049E  PHX
         JSR   L0604C5
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0605F5
         PEA   L0605F5
         _PtInRect
         PLA
         BNE   L0604C2
         PLX
         INX
         CPX   #$0011
         BNE   L06049E
         CLC
         RTS

L0604C2  SEC
         PLX
         RTS

L0604C5  LDA   #$0037
         CPX   #$0009
         BCC   L0604D6
         TXA
         SEC
         SBC   #$0008
         TAX
         LDA   #$0042
L0604D6  STA   L0605F5
         CLC
         ADC   #$000B
         STA   L0605F9
         LDA   #$0015
L0604E3  CLC
         ADC   #$000D
         DEX
         BNE   L0604E3
         STA   L0605F7
         CLC
         ADC   #$000D
         STA   L0605FB
         RTS

L0604F5  JSR   L060546
         LDA   L06062D
         DEC
         BCS   L060513
         ASL
         ASL
         ASL
         ASL
         SEP   #$30
         PHA
         LDA   L0605AB,X
         AND   #$0F
         ORA   $01,S
         STA   L0605AB,X
         PLA
         REP   #$30
         RTS

L060513  SEP   #$30
         PHA
         LDA   L0605AB,X
         AND   #$F0
         ORA   $01,S
         STA   L0605AB,X
         PLA
         REP   #$30
         RTS

L060524  STA   $0A
         LDA   #^L0605AB
         STA   $0C
         JSR   L060546
         TXY
         LDA   #$0000
         BCS   L06053F
         LDA   [$0A],Y
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         INC
         RTS

L06053F  LDA   [$0A],Y
         AND   #$000F
         INC
         RTS

L060546  TYA
         ASL
         ASL
         ASL
         PHA
         TXA
         CLC
         ADC   $01,S
         LSR
         TAX
         PLA
         RTS

L060553  DW    $0006
L060555  DW    $000B
         DW    $0031
         DW    $0046
L06055B  DW    $0006
         DW    $0050
         DW    $0031
         DW    $008A
L060563  DW    $0007
         DW    $0051
         DW    $0030
         DW    $0089
L06056B  DW    $0052
         DW    $000B
         DW    $005F
         DW    $0046
L060573  DW    $0052
         DW    $0050
         DW    $005F
         DW    $008A
L06057B  DW    $0000
         DW    $0000
         DW    $0066
         DW    $0095
L060583  DW    $0036
         DW    $000B
         DW    $004E
         DW    $008A
L06058B  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0605AB  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0605CB  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0605EB  DW    $0000
L0605ED  DW    $0000
L0605EF  DW    $0000
L0605F1  DW    $0000
L0605F3  DW    $0000
L0605F5  DW    $0000
L0605F7  DW    $0000
L0605F9  DW    $0000
L0605FB  DW    $0000
L0605FD  DW    $003B
         DW    $000F
         DW    $004A
         DW    $001E
L060605  DW    $003C
         DW    $0010
         DW    $0049
         DW    $001D
L06060D  HEX   00001111222233334444555566667777
         HEX   88889999AAAABBBBCCCCDDDDEEEEFFFF
L06062D  DW    $0000
L06062F  DW    $0000
L060631  DW    $0000
L060633  ADRL  $00000000
L060637  ADRL  $00000000
L06063B  ADRL  $00000000
L06063F  DW    $0000
