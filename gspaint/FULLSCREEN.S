*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	FULLSCREEN.X
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

         BRA   L0A0004
         LDA   $A5
L0A0004  PHB
         PHK
         PLB
         LDA   $3E
         BEQ   L0A000D
         PLB
         RTL

L0A000D  STZ   L0A016F
         STZ   L0A0171
         LDA   #$00C7
         STA   L0A0173
         LDA   #$013F
         STA   L0A0175
         JSL   L018744
         PEA   $0000
         _SetAllSCBs
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         LDAL  L019976
         STA   $0A
         LDAL  L019978
         STA   $0C
         JSR   L0A00B4
         PEA   ^L01A500
         PEA   L01A500
         _SetCursor
L0A0056  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BNE   L0A0076
         BRL   L0A00EE
L0A0076  CMP   #$0003
         BNE   L0A0056
         JSL   L01351E
         BCS   L0A0056
         _HideCursor
         _DrawMenuBar
         _InitPalette
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
         JSL   L010D82
         _ShowCursor
         JSL   L018752
         PLB
         RTL

L0A00B4  _HideCursor
         LDA   #$2000
         STA   $0E
         LDA   #$00E1
         STA   $10
         LDX   #$00C8
L0A00C8  LDY   #$009E
L0A00CB  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0A00CB
         CLC
         LDA   $0A
         ADC   #$00A0
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         DEX
         BNE   L0A00C8
         _ShowCursor
         RTS

L0A00EE  LDAL  L0196C5
         STA   L0A016D
L0A00F5  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L0A0107
         BRL   L0A0056
L0A0107  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         SEC
         LDA   L0A016D
         SBCL  L0196C5
         STA   L0A0177
         BEQ   L0A00F5
         CLC
         LDA   L0A016F
         ADC   L0A0177
         STA   L0A016F
         BPL   L0A0138
         STZ   L0A016F
         LDA   #$00C7
         STA   L0A0173
         BRA   L0A0153
L0A0138  CLC
         LDA   L0A0173
         ADC   L0A0177
         STA   L0A0173
         CMP   $F0
         BCC   L0A0153
         LDA   $F0
         DEC
         STA   L0A0173
         SEC
         SBC   #$00C7
         STA   L0A016F
L0A0153  LDA   L0A016F
         JSL   L0182D0
         CLC
         ADCL  L019976
         STA   $0A
         LDAL  L019978
         STA   $0C
         JSR   L0A00B4
         BRL   L0A00EE

L0A016D  DW    $0000
L0A016F  DW    $0000
L0A0171  DW    $0000
L0A0173  DW    $0000
L0A0175  DW    $0000
L0A0177  DW    $0000
