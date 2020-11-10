*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	EDITMIROR.E
	 use	EDITMIROR.X
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

         BRA   L050004
         LDA   $A5
L050004  PHB
         PHK
         PLB
         PEA   $0050
         PEA   $0028
         PEA   $00B9
         PEA   $0064
         JSL   L018223
         PHA
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   ^L0503C2
         PEA   L0503C2
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
         STA   L050430
         PLA
         STA   L050430+2
         PHA
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   ^L0503CA
         PEA   L0503CA
         PEA   ^L010482
         PEA   L010482
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
         STA   L050434
         PLA
         STA   L050434+2
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _DrawControls
         LDA   $8A
         STA   L0503E2
         PEA   ^L0503D2
         PEA   L0503D2
         _FrameRect
         JSR   L0501E6
L05009D  PHA
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BEQ   L0500D1
         CMP   #$0003
         BNE   L05009D
         LDAL  L0196BD
         CMP   #$000D
         BNE   L0500C9
         BRL   L050164
L0500C9  CMP   #$001B
         BNE   L05009D
         BRL   L05016B
L0500D1  LDAL  L0196C5
         STAL  L019751
         LDAL  L0196C7
         STAL  L019753
         PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0503D2
         PEA   L0503D2
         _PtInRect
         PLA
         BEQ   L050108
         BRL   L05018D
L050108  PHA
         PEA   ^L050438
         PEA   L050438
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
         BNE   L05012C
         BRL   L05009D
L05012C  PHA
         LDAL  L019753
         PHA
         LDAL  L019751
         PHA
         LDA   #$0000
         PHA
         PHA
         LDA   L050438+2
         PHA
         LDA   L050438
         PHA
         _TrackControl
         PLA
         CMP   #$0002
         BEQ   L050154
         BRL   L05009D
L050154  LDA   L050438
         CMP   L050430
         BNE   L05016B
         LDA   L050438+2
         CMP   L050430+2
         BNE   L05016B
L050164  LDA   L0503E2
         STA   $8A
         BRA   L05016D
L05016B  STZ   $8A
L05016D  LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         LDA   $8A
         PHA
         PEA   $011A
         _CheckMItem
         JSL   L010D82
         PLB
         RTL

L05018D  LDX   #$0001
         LDA   #L0503E8
         STA   L0503E4
         LDA   #^L0503E8
         STA   L0503E6
L05019C  PHX
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         LDA   L0503E6
         PHA
         LDA   L0503E4
         PHA
         _PtInRect
         PLA
         BNE   L0501C9
         CLC
         LDA   L0503E4
         ADC   #$0008
         STA   L0503E4
         PLX
         INX
         CPX   #$000A
         BNE   L05019C
         BRK   $02        ; BUG
L0501C9  PLA
         DEC
         ASL
         TAX
         LDA   L05043C,X
         PHA
         AND   L0503E2
         BEQ   L0501DC
         PLA
         TRB   L0503E2
         BRA   L0501E0
L0501DC  PLA
         TSB   L0503E2
L0501E0  JSR   L0501E6
         BRL   L05009D
L0501E6  PEA   ^L0503DA
         PEA   L0503DA
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         LDA   L0503E2
         AND   #$0001
         BNE   L050237
         PEA   $0001
         PEA   $0001
         _SetPenSize
         PEA   ^L05046E
         PEA   L05046E
         _SetPenPat
         PEA   $0010
         PEA   $000B
         _MoveTo
         PEA   $005C
         PEA   $0057
         _LineTo
         BRA   L05026B
L050237  PEA   $0002
         PEA   $0002
         _SetPenSize
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   $0010
         PEA   $000B
         _MoveTo
         PEA   $005B
         PEA   $0056
         _LineTo
L05026B  LDA   L0503E2
         AND   #$0002
         BNE   L0502A9
         PEA   $0001
         PEA   $0001
         _SetPenSize
         PEA   ^L05044E
         PEA   L05044E
         _SetPenPat
         PEA   $0036
         PEA   $000B
         _MoveTo
         PEA   $0036
         PEA   $0057
         _LineTo
         BRA   L0502DD
L0502A9  PEA   $0003
         PEA   $0001
         _SetPenSize
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   $0035
         PEA   $000B
         _MoveTo
         PEA   $0035
         PEA   $0057
         _LineTo
L0502DD  LDA   L0503E2
         AND   #$0004
         BNE   L05031B
         PEA   $0001
         PEA   $0001
         _SetPenSize
         PEA   ^L05046E
         PEA   L05046E
         _SetPenPat
         PEA   $0010
         PEA   $0057
         _MoveTo
         PEA   $005C
         PEA   $000B
         _LineTo
         BRA   L05034F
L05031B  PEA   $0002
         PEA   $0002
         _SetPenSize
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   $0010
         PEA   $0056
         _MoveTo
         PEA   $005B
         PEA   $000B
         _LineTo
L05034F  LDA   L0503E2
         AND   #$0008
         BNE   L05038D
         PEA   $0001
         PEA   $0001
         _SetPenSize
         PEA   ^L05044E
         PEA   L05044E
         _SetPenPat
         PEA   $0010
         PEA   $0031
         _MoveTo
         PEA   $005C
         PEA   $0031
         _LineTo
         BRA   L0503C1
L05038D  PEA   $0001
         PEA   $0002
         _SetPenSize
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   $0010
         PEA   $0030
         _MoveTo
         PEA   $005C
         PEA   $0030
         _LineTo
L0503C1  RTS

L0503C2  DW    $0014
         DW    $006E
         DW    $0021
         DW    $00AA
L0503CA  DW    $0041
         DW    $006E
         DW    $004E
         DW    $00AA
L0503D2  DW    $000A
         DW    $000F
         DW    $0059
         DW    $005E
L0503DA  DW    $000B
         DW    $0010
         DW    $0058
         DW    $005D
L0503E2  DW    $0000
L0503E4  DW    $0000
L0503E6  DW    $0000
L0503E8  DW    $000A
         DW    $000F
         DW    $002C
         DW    $0031
         DW    $000A
         DW    $0031
         DW    $002C
         DW    $003B
         DW    $000A
         DW    $003B
         DW    $002C
         DW    $005E
         DW    $002C
         DW    $003B
         DW    $0036
         DW    $005E
         DW    $0036
         DW    $003B
         DW    $0059
         DW    $005E
         DW    $0036
         DW    $0031
         DW    $0059
         DW    $003B
         DW    $0036
         DW    $000F
         DW    $0059
         DW    $0031
         DW    $002C
         DW    $000F
         DW    $0036
         DW    $0031
         DW    $002C
         DW    $0031
         DW    $0036
         DW    $003B
L050430  ADRL  $00000000
L050434  ADRL  $00000000
L050438  ADRL  $00000000
L05043C  DW    $0001
         DW    $0002
         DW    $0004
         DW    $0008
         DW    $0001
         DW    $0002
         DW    $0004
         DW    $0008
         DW    $000F
L05044E  HEX   F0F0F0F00F0F0F0FF0F0F0F00F0F0F0F
         HEX   F0F0F0F00F0F0F0FF0F0F0F00F0F0F0F
L05046E  HEX   F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
         HEX   F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
