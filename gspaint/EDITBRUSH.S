*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	EDITBRUSH.X
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

         BRA   L040004
         LDA   $A5
L040004  PHB
         PHK
         PLB
         PEA   $0043
         PEA   $0028
         PEA   $00E1
         PEA   $005C
         JSL   L018223
         JSR   L040132
         PEA   $0002
         PEA   $0001
         _SetPenSize
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   $0002
         _SetPenMode
         JSR   L0400D1
L040041  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BNE   L040041
         PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         JSR   L0400A8
         BCC   L040041
         PHA
         JSR   L0400D1
         PLA
         STA   $7A
         JSR   L0400D1
L04007A  PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BNE   L04007A
         LDA   $76
         CMP   #$0004
         BNE   L040095
         JSL   L016FC2
L040095  LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         JSL   L010D82
         PLB
         RTL

L0400A8  LDA   #$001F
L0400AB  PHA
         JSR   L0400E4
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L040112
         PEA   L040112
         _PtInRect
         PLA
         BNE   L0400CE
         PLA
         DEC
         BPL   L0400AB
         CLC
         RTS

L0400CE  PLA
         SEC
         RTS

L0400D1  LDA   $7A
         JSR   L0400E4
         PEA   ^L040112
         PEA   L040112
         _FrameRect
         RTS

L0400E4  PHA
         AND   #$0003
         ASL
         TAX
         LDA   L04011A,X
         SEC
         SBC   #$0008
         STA   L040112
         CLC
         ADC   #$0010
         STA   L040116
         PLA
         LSR
         LSR
         ASL
         TAX
         LDA   L040122,X
         SEC
         SBC   #$000A
         STA   L040114
         CLC
         ADC   #$0014
         STA   L040118
         RTS

L040112  DW    $0000
L040114  DW    $0000
L040116  DW    $0000
L040118  DW    $0000
L04011A  DW    $0013
         DW    $0025
         DW    $0037
         DW    $0049
L040122  DW    $0019
         DW    $0032
         DW    $004B
         DW    $0064
         DW    $007D
         DW    $0096
         DW    $00AF
         DW    $00C8
L040132  PEA   ^L040232
         PEA   L040232
         _PaintRect
         PEA   ^L04023A
         PEA   L04023A
         _PaintRect
         PEA   ^L040242
         PEA   L040242
         _PaintRect
         PEA   ^L04024A
         PEA   L04024A
         _PaintRect
         PEA   ^L040252
         PEA   L040252
         _PaintOval
         PEA   ^L04025A
         PEA   L04025A
         _PaintOval
         PEA   ^L040262
         PEA   L040262
         _PaintOval
         PEA   ^L04026A
         PEA   L04026A
         _PaintOval
         PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   #$0000
L0401AA  PHA
         ASL
         ASL
         ASL
         TAX
         LDA   L040272,X
         PHA
         LDA   L040274,X
         PHA
         LDA   L040276,X
         PHA
         LDA   L040278,X
         PHA
         _MoveTo
         _LineTo
         PLA
         INC
         CMP   #$000A
         BNE   L0401AA
         LDA   #$0001
         PHA
         PHA
         _SetPenSize
         LDA   #$0000
L0401E3  PHA
         ASL
         ASL
         ASL
         TAX
         LDA   L0402C2,X
         PHA
         LDA   L0402C4,X
         PHA
         LDA   L0402C6,X
         PHA
         LDA   L0402C8,X
         PHA
         _MoveTo
         _LineTo
         PLA
         INC
         CMP   #$0006
         BNE   L0401E3
         LDA   #$001E
L040210  PHA
         ASL
         ASL
         TAX
         LDA   L0402F2,X
         TAY
         LDA   L0402F4,X
         PHA
         PHY
         PHA
         PHY
         _MoveTo
         _LineTo
         PLA
         DEC
         BPL   L040210
         RTS

L040232  DW    $000F
         DW    $0014
         DW    $0017
         DW    $001E
L04023A  DW    $0023
         DW    $0016
         DW    $0028
         DW    $001D
L040242  DW    $0036
         DW    $0017
         DW    $0039
         DW    $001B
L04024A  DW    $0048
         DW    $0018
         DW    $004A
         DW    $001A
L040252  DW    $000F
         DW    $002D
         DW    $0017
         DW    $0037
L04025A  DW    $0022
         DW    $002E
         DW    $0029
         DW    $0036
L040262  DW    $0035
         DW    $002F
         DW    $003A
         DW    $0035
L04026A  DW    $0047
         DW    $0030
         DW    $004B
         DW    $0034
L040272  DW    $004E
L040274  DW    $000F
L040276  DW    $0047
L040278  DW    $0016
         DW    $004D
         DW    $0022
         DW    $0048
         DW    $0027
         DW    $004C
         DW    $0035
         DW    $0048
         DW    $0039
         DW    $004B
         DW    $0048
         DW    $0049
         DW    $004A
         DW    $0067
         DW    $0016
         DW    $0060
         DW    $000F
         DW    $0065
         DW    $0027
         DW    $0060
         DW    $0022
         DW    $0065
         DW    $0039
         DW    $0061
         DW    $0035
         DW    $0064
         DW    $004A
         DW    $0062
         DW    $0048
         DW    $007C
         DW    $0016
         DW    $007C
         DW    $000F
         DW    $007C
         DW    $0027
         DW    $007C
         DW    $0022
L0402C2  DW    $007C
L0402C4  DW    $0039
L0402C6  DW    $007C
L0402C8  DW    $0035
         DW    $007C
         DW    $004A
         DW    $007C
         DW    $0048
         DW    $009A
         DW    $0013
         DW    $0091
         DW    $0013
         DW    $0099
         DW    $0025
         DW    $0092
         DW    $0025
         DW    $0098
         DW    $0037
         DW    $0093
         DW    $0037
         DW    $0097
         DW    $0049
         DW    $0094
         DW    $0049
L0402F2  DW    $0016
L0402F4  DW    $00AB
         DW    $0014
         DW    $00AD
         DW    $0012
         DW    $00AF
         DW    $0010
         DW    $00B1
         DW    $0026
         DW    $00AD
         DW    $0024
         DW    $00AF
         DW    $0033
         DW    $00AB
         DW    $0035
         DW    $00AD
         DW    $0037
         DW    $00AF
         DW    $0039
         DW    $00B1
         DW    $0047
         DW    $00AD
         DW    $0049
         DW    $00AF
         DW    $0010
         DW    $00C8
         DW    $0012
         DW    $00C8
         DW    $0014
         DW    $00C8
         DW    $0016
         DW    $00C8
         DW    $0025
         DW    $00C5
         DW    $0025
         DW    $00C7
         DW    $0025
         DW    $00C9
         DW    $0025
         DW    $00CB
         DW    $0034
         DW    $00C7
         DW    $0034
         DW    $00CB
         DW    $0035
         DW    $00C4
         DW    $0036
         DW    $00C7
         DW    $0036
         DW    $00CB
         DW    $0037
         DW    $00C5
         DW    $0038
         DW    $00C8
         DW    $0039
         DW    $00C4
         DW    $0039
         DW    $00CB
         DW    $003A
         DW    $00C7
         DW    $0049
         DW    $00C8
