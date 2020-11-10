*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	SEARCHC.X
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

         BRA   L090004
         LDA   $A5
L090004  PHB
         PHK
         PLB
         PEA   $0000
         PEA   ^L09036E
         PEA   L09036E
         _GetColorTable
         PEA   ^L01A2C4
         PEA   L01A2C4
         _SetCursor
         STZ   L090362
         STZ   L090366
         STZ   L090364
         STZ   L090368
         STZ   L090398
         STZ   L09039A
L090036  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         SEC
         LDAL  L0196C1
         SBC   L090398
         CMP   #$000A
         BCC   L090082
         LDAL  L0196C1
         STA   L090398
         LDA   L090366
         BEQ   L090082
         LDA   L09039A
         EOR   #$FFFF
         STA   L09039A
         BMI   L090079
         LDX   L090366
         LDA   L090396
         JSR   L090201
         BRA   L090082
L090079  LDX   L090366
         LDA   #$FFFF
         JSR   L090201
L090082  LDAL  L0196BB
         CMP   #$0001
         BNE   L09008E
         BRL   L0902C9
L09008E  PHA
         PHA
         _GetCursorAdr
         PLA
         STA   L09036A
         PLA
         STA   L09036A+2
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L019E74
         PEA   L019E74
         _PtInRect
         PLA
         BEQ   L0900B9
         BRL   L090147
L0900B9  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L09038E
         PEA   L09038E
         _PtInRect
         PLA
         BNE   L090108
         LDA   L09036A
         CMPL  L019EE0
         BNE   L0900E2
         LDA   L09036A+2
         CMPL  L019EE0+2
         BEQ   L090105
L0900E2  LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         JSR   L09018A
         STZ   L090362
         STZ   L090366
         STZ   L09039A
         JSR   L09021E
         JSR   L0901D0
L090105  BRL   L090036
L090108  LDA   L09036A
         CMP   #L01A2C4
         BNE   L090118
         LDA   L09036A+2
         CMP   #^L01A2C4
         BEQ   L09012E
L090118  STZ   L090368
         STZ   L090364
         STZ   L09039A
         PEA   ^L01A2C4
         PEA   L01A2C4
         _SetCursor
L09012E  JSL   L014903
         BCC   L090144
         CPX   #$0010
         BCS   L090144
         CPX   #$0001
         BEQ   L090144
         STX   L090366
         JSR   L0901D0
L090144  BRL   L090036
L090147  LDA   L09036A
         CMP   #L01A2C4
         BNE   L090157
         LDA   L09036A+2
         CMP   #^L01A2C4
         BEQ   L090170
L090157  JSR   L09018A
         STZ   L090364
         STZ   L090368
         STZ   L09039A
         PEA   ^L01A2C4
         PEA   L01A2C4
         _SetCursor
L090170  PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         JSL   L0181CE
         JSR   L090199
         JSR   L09021E
         BRL   L090036
L09018A  LDA   L090366
         BEQ   L090198
         LDX   L090368
         LDA   L090396
         JSR   L090201
L090198  RTS

L090199  LDAL  L0196C5
         JSL   L0182D0
         CLC
         ADCL  L019976
         STA   $0A
         LDAL  L019978
         STA   $0C
         LDAL  L0196C7
         LSR
         TAY
         LDA   [$0A],Y
         XBA
         PHA
         LDAL  L0196C7
         LSR
         PLA
         BCS   L0901C4
         LSR
         LSR
         LSR
         LSR
L0901C4  AND   #$0F00
         XBA
         EOR   #$000F
         INC
         STA   L090362
         RTS

L0901D0  LDA   L090368
         BEQ   L0901E2
         CMP   L090366
         BNE   L0901DB
         RTS

L0901DB  TAX
         LDA   L090396
         JSR   L090201
L0901E2  LDA   L090366
         BNE   L0901E8
         RTS

L0901E8  STA   L090368
         DEC
         EOR   #$000F
         ASL
         TAX
         LDA   L09036E,X
         STA   L090396
         LDA   #$FFFF
         LDX   L090368
         JSR   L090201
         RTS

L090201  PHA
         TXA
         DEC
         EOR   #$000F
         ASL
         TAX
         PLA
         STA   L09036E,X
         PEA   $0000
         PEA   ^L09036E
         PEA   L09036E
         _SetColorTable
         RTS

L09021E  LDA   L090364
         BEQ   L090229
         CMP   L090362
         BNE   L090229
         RTS

L090229  LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L090325
         LDX   L090362
         STX   L090364
         BEQ   L0902BB
         PEA   ^L090352
         PEA   L090352
         JSL   L01493B
         LDA   L090352
         STA   L09035A
         LDA   L090354
         STA   L09035C
         LDA   L090356
         STA   L09035E
         LDA   L090358
         STA   L090360
         PEA   ^L090352
         PEA   L090352
         LDA   #$0001
         PHA
         PHA
         _InsetRect
         PEA   ^L09035A
         PEA   L09035A
         LDA   #$0002
         PHA
         PHA
         _InsetRect
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   ^L090352
         PEA   L090352
         _FrameRect
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   ^L09035A
         PEA   L09035A
         _FrameRect
L0902BB  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

L0902C9  LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L090325
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L09018A
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L019E74
         PEA   L019E74
         _PtInRect
         PLA
         BNE   L090323
         PHA
         PEA   $0001
         LDAL  L0196BD+2
         PHA
         LDAL  L0196BD
         PHA
         _PostEvent
         PLA
L090323  PLB
         RTL

L090325  LDX   L090364
         BEQ   L090351
         JSL   L0149AE
         PHX
         PHA
         _SetPenPat
         PEA   ^L090352
         PEA   L090352
         _FrameRect
         PEA   ^L09035A
         PEA   L09035A
         _FrameRect
L090351  RTS

L090352  DW    $0000
L090354  DW    $0000
L090356  DW    $0000
L090358  DW    $0000
L09035A  DW    $0000
L09035C  DW    $0000
L09035E  DW    $0000
L090360  DW    $0000
L090362  DW    $0000
L090364  DW    $0000
L090366  DW    $0000
L090368  DW    $0000
L09036A  ADRL  $00000000
L09036E  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L09038E  DW    $00A5
         DW    $0059
         DW    $00B3
         DW    $012F
L090396  DW    $0000
L090398  DW    $0000
L09039A  DW    $0000
