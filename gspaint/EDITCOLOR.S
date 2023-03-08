*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	EDITCOLOR.X
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

         BRA   L030004
         LDA   $A5
L030004  PHB
         PHK
         PLB
         JSL   L0149A7
         STA   $0A
         STX   $0C
         LDA   [$0A]
         AND   #$000F
         STA   L03177B
         STA   L031763
         LDA   $56
         STA   L0318DF
         LDA   $58
         STA   L0318E1
         LDA   $5A
         STA   L0318E3
         LDA   $5C
         STA   L0318E5
         CLC
         LDA   L0318DF
         ADC   #$0036
         STA   L0318E3
         CLC
         LDA   L0318E1
         ADC   #$00DA
         STA   L0318E5
         STZ   L031759
         STZ   L031777
         STZ   L031779
         LDA   #$00FF
         STA   L031767
         STA   L031769
         STA   L03176B
         STA   L03176D
         STA   L03176F
         PEA   $0000
         PEA   $0000
         LDA   L03177B
         PHA
         _GetColorEntry
         PLA
         STA   L031765
         PEA   $0000
         PEA   ^L03179D
         PEA   L03179D
         _GetColorTable
         JSR   L030570
         JSR   L030EF4
         JSR   L0300F0
         JSR   L03063F
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         _InitPalette
         JSL   L010D82
         PLB
         RTL

L0300A8  LDA   L031763
         JSR   L0300CF
         PEA   ^L0317DB
         PEA   L0317DB
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         PEA   ^L0317DB
         PEA   L0317DB
         _FrameRect
         RTS

L0300CF  AND   #$000F
         STA   L0300ED+1
         ASL
         ASL
         ASL
         ASL
         ORA   L0300ED+1
         STA   L0300ED+1
         ORA   L0300ED
         LDX   #$001E
L0300E5  STA   L03177D,X
         DEX
         DEX
         BPL   L0300E5
         RTS

L0300ED  HEX   000000
L0300F0  PEA   $0000
         PEA   $FFFF
         PEA   ^L0317EB
         PEA   L0317EB
         _GetNextEvent
         PLA
         PEA   ^L0317F5
         PEA   L0317F5
         _GlobalToLocal
         JSR   L030EAB
         LDA   L0317EB
         CMP   #$0001
         BNE   L03011F
         JSR   L0301C2
L03011F  LDA   L0317EB
         CMP   #$0003
         BEQ   L03012F
         CMP   #$0005
         BEQ   L03012F
         BRL   L0301B9
L03012F  LDA   L0317ED
         CMP   #$001B
         BNE   L03016D
         LDA   L0317F9
         AND   #$0100
         BEQ   L03016D
         LDA   L0317F9
         AND   #$0800
         BEQ   L03016D
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _InitColorTable
         PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _SetColorTable
         _InitPalette
         BRA   L0301B9
L03016D  LDA   L0317ED
         CMP   #$000D
         BNE   L03018F
         PEA   ^L031998
         PEA   L031998
         PEA   $000F
         PEA   $000D
         _InvertRRect
         LDA   #$0001
         STA   $3C
         BRA   L0301C1
L03018F  CMP   #$001B
         BNE   L0301B9
         PEA   $0000
         PEA   ^L03179D
         PEA   L03179D
         _SetColorTable
         PEA   ^L0319A0
         PEA   L0319A0
         PEA   $000F
         PEA   $000D
         _InvertRRect
         BRA   L0301C1
L0301B9  LDA   L031759
         BNE   L0301C1
         BRL   L0300F0
L0301C1  RTS

L0301C2  LDA   L031763
         JSR   L0300CF
         PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L0317DB
         PEA   L0317DB
         _PtInRect
         PLA
         BEQ   L0301FC
         LDA   L0317DB
         STA   L03175B
         LDA   L0317DD
         STA   L03175B+2
         LDA   L0317DF
         STA   L03175B+4
         LDA   L0317E1
         STA   L03175B+6
         BRL   L030CA9
L0301FC  PHA
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L031988
         PEA   L031988
         _PtInRect
         PLA
         BEQ   L03021E
         LDA   #$0001
         STA   $3C
         LDA   #$0001
L03021B  BRL   L030BFD
L03021E  PHA
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L031990
         PEA   L031990
         _PtInRect
         LDA   #$0002
         PLX
         BNE   L03021B
         LDA   L0317F5
         CMP   #$003C
         BCC   L030296
         CMP   #$004D
         BCC   L030248
         BRL   L030676
L030248  LDA   L0317F7
         CMP   #$0030
         BCC   L030296
         CMP   #$0130
         BCS   L030296
         SBC   #$002F
         LSR
         LSR
         LSR
         LSR
         EOR   #$000F
         STA   L031763
         JSR   L0300A8
         LDA   L031763
         EOR   #$000F
         ASL
         ASL
         ASL
         ASL
         ADC   #$0030
         STA   L03175B+2
         ADC   #$0010
         STA   L03175B+6
         LDA   #$003D
         STA   L03175B
         LDA   #$004C
         STA   L03175B+4
         LDA   L0317F9
         AND   #$0100
         BNE   L030292
         BRL   L030CA9
L030292  JSR   L0313E8
         RTS

L030296  PHA
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L0317CB
         PEA   L0317CB
         _PtInRect
         PLA
         BNE   L0302AE
         RTS

L0302AE  PEA   ^L0317CB
         PEA   L0317CB
         _ClipRect
         LDA   #$0005
         PHA
         PHA
         _SetPenSize
         PEA   ^L03177D
         PEA   L03177D
         _SetPenPat
         LDA   L0317F7
         PHA
         LDA   L0317F5
         PHA
         _MoveTo
L0302E3  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BEQ   L030310
         PEA   ^L0317F5
         PEA   L0317F5
         _GetMouse
         LDA   L0317F7
         PHA
         LDA   L0317F5
         PHA
         _LineTo
         BRA   L0302E3
L030310  _PenNormal
         PEA   ^L0317D3
         PEA   L0317D3
         _ClipRect
         RTS

L030325  LDX   #$000F
L030328  PHX
         TXA
         LSR
         PHP
         CLC
         ADC   #$0008
         STA   L0304A0
         PLP
         LDA   #$0005
         BCC   L03033C
         LDA   #$0009
L03033C  STA   L0304A2
         LDA   L031765
         AND   #$00FF
         STA   L0304A4
         PLA
         PHA
         XBA
         ORA   L0304A4
         TAY
         LDA   L0304A0
         PHA
         LDA   L0304A2
         PHA
         PHY
         _SetColorEntry
         INC   L0304A2
         LDA   L031765
         AND   #$0F0F
         STA   L0304A4
         PLA
         PHA
         ASL
         ASL
         ASL
         ASL
         ORA   L0304A4
         TAY
         LDA   L0304A0
         PHA
         LDA   L0304A2
         PHA
         PHY
         _SetColorEntry
         INC   L0304A2
         LDA   L031765
         AND   #$0FF0
         STA   L0304A4
         PLA
         PHA
         ORA   L0304A4
         TAY
         LDA   L0304A0
         PHA
         LDA   L0304A2
         PHA
         PHY
         _SetColorEntry
         PLX
         DEX
         BMI   L0303AE
         BRL   L030328
L0303AE  LDX   #$000F
L0303B1  PHX
         PHX
         PEA   $000D
         LDA   L031765
         PHA
         _SetColorEntry
         PLX
         DEX
         CPX   #$0008
         BCS   L0303B1
         LDA   #$000F
         STA   L031773
         STZ   L031775
         LDA   L031765
         JSR   L03048C
         LDA   L031765
         LSR
         LSR
         LSR
         LSR
         JSR   L03048C
         LDA   L031765
         XBA
         JSR   L03048C
         LDA   L031777
         CMP   #$0004
         BEQ   L030408
         LDA   #$0008
         STA   L0304A6
         LDA   #$0004
         STA   L0304A8
         JSR   L03042A
         JSR   L03045B
         LDA   L031777
         CMP   #$0004
L030408  LDA   #$0001
         STA   L0304A6
         LDA   #$000F
         STA   L0304A8
         LDA   L031777
         CMP   #$0005
         BEQ   L030422
         JSR   L030425
         JSR   L030456
L030422  BRL   L030929
L030425  LDX   L031775
         BRA   L03042D
L03042A  LDX   L031773
L03042D  LDA   L031765
L030430  PHA
         PHX
         TAY
         TXA
         LSR
         PHP
         CLC
         ADC   #$0008
         PLP
         PHA
         LDA   L0304A6
         BCC   L030444
         EOR   L0304A8
L030444  PHA
         PHY
         _SetColorEntry
         PLX
         PLA
         JSR   L030562
         DEX
         BPL   L030430
         RTS

L030456  LDX   L031775
         BRA   L03045E
L03045B  LDX   L031773
L03045E  LDA   L031765
L030461  INX
         CPX   #$0010
         BCS   L03048B
         JSR   L030554
         PHA
         PHX
         TAY
         TXA
         LSR
         PHP
         CLC
         ADC   #$0008
         PLP
         PHA
         LDA   L0304A6
         BCC   L03047E
         EOR   L0304A8
L03047E  PHA
         PHY
         _SetColorEntry
         PLX
         PLA
         BRA   L030461
L03048B  RTS

L03048C  AND   #$000F
         CMP   L031773
         BCS   L030497
         STA   L031773
L030497  CMP   L031775
         BCC   L03049F
         STA   L031775
L03049F  RTS

L0304A0  DW    $0000
L0304A2  DW    $0000
L0304A4  DW    $0000
L0304A6  DW    $0000
L0304A8  DW    $0000
L0304AA  STA   L0304FE
         CPX   #$0001
         BNE   L0304C4
         XBA
         JSR   L0304F1
         XBA
         STA   L030500
         LDA   L0304FE
         AND   #$00FF
         ORA   L030500
         RTS

L0304C4  CPX   #$0002
         BNE   L0304E1
         LSR
         LSR
         LSR
         LSR
         JSR   L0304F1
         ASL
         ASL
         ASL
         ASL
         STA   L030500
         LDA   L0304FE
         AND   #$0F0F
         ORA   L030500
         RTS

L0304E1  JSR   L0304F1
         STA   L030500
         LDA   L0304FE
         AND   #$0FF0
         ORA   L030500
         RTS

L0304F1  AND   #$000F
         INC
         AND   #$000F
         BNE   L0304FD
         LDA   #$000F
L0304FD  RTS

L0304FE  DW    $0000
L030500  DW    $0000
L030502  STA   L030550
         CPX   #$0001
         BNE   L03051C
         XBA
         JSR   L030549
         XBA
         STA   L030552
         LDA   L030550
         AND   #$00FF
         ORA   L030552
         RTS

L03051C  CPX   #$0002
         BNE   L030539
         LSR
         LSR
         LSR
         LSR
         JSR   L030549
         ASL
         ASL
         ASL
         ASL
         STA   L030552
         LDA   L030550
         AND   #$0F0F
         ORA   L030552
         RTS

L030539  JSR   L030549
         STA   L030552
         LDA   L030550
         AND   #$0FF0
         ORA   L030552
         RTS

L030549  AND   #$000F
         BEQ   L03054F
         DEC
L03054F  RTS

L030550  DW    $0000
L030552  DW    $0000
L030554  PHX
         PHY
         LDX   #$0003
L030559  JSR   L0304AA
         DEX
         BNE   L030559
         PLY
         PLX
         RTS

L030562  PHX
         PHY
         LDX   #$0003
L030567  JSR   L030502
         DEX
         BNE   L030567
         PLY
         PLX
         RTS

L030570  PEA   ^L030656
         PEA   L030656
         _InitColorTable
         PEA   $0007
         PEA   ^L030656
         PEA   L030656
         _SetColorTable
         LDA   #$0F00
         STA   L030656+4
         LDA   #$00F0
         STA   L030656+6
         LDA   #$000F
         STA   L030656+8
         LDA   #$0FFF
         STA   L030656+$1C
         LDX   #$000F
L0305A8  PHX
         PHX
         PEA   ^L030656
         PEA   L030656
         _SetColorTable
         LDA   L030656+4
         SEC
         SBC   #$0200
         STA   L030656+4
         LDA   L030656+6
         SEC
         SBC   #$0020
         STA   L030656+6
         LDA   L030656+8
         SEC
         SBC   #$0002
         STA   L030656+8
         LDA   L030656+$1C
         SEC
         SBC   #$0222
         STA   L030656+$1C
         PLX
         DEX
         CPX   #$0008
         BCS   L0305A8
L0305E6  PEA   $0000
         PEA   $0000
         PEA   $0000
         _GetColorEntry
         PLA
         STA   L030656
         PEA   $0000
         PEA   $0000
         PEA   $000F
         _GetColorEntry
         PLA
         STA   L030656+2
         LDX   #$0007
L030611  PHX
         PHX
         PHX
         PEA   $0000
         LDA   L030656
         PHA
         _SetColorEntry
         PEA   $000F
         LDA   L030656+2
         PHA
         _SetColorEntry
         PLX
         INX
         CPX   #$0010
         BCC   L030611
         _InitPalette
         RTS

L03063F  LDA   #$00C7
L030642  PHA
         PHA
         PEA   $0000
         _SetSCB
         PLA
         DEC
         CMP   #$000A
         BCS   L030642
         RTS

L030656  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L030676  STZ   L0307F0
         STZ   L0307E8
         STZ   L0307EE
L03067F  STZ   L0307E4
         LDA   L0317F5
         LDY   L0317F7
         CMP   #$0050
         BCC   L0306D9
         CMP   #$005D
         BCC   L0306A0
         SEC
         ROR   L0307E4
         CMP   #$009D
         BCC   L0306EA
         CMP   #$00AA
         BCS   L0306D9
L0306A0  LDX   #$0001
         CPY   #$0028
         BCC   L0306D9
         CPY   #$0038
         BCC   L0306F5
         INX
         CPY   #$004B
         BCC   L0306D9
         CPY   #$005B
         BCC   L0306F5
         INX
         CPY   #$006E
         BCC   L0306D9
         CPY   #$007E
         BCC   L0306F5
         INX
         CPY   #$00A0
         BCC   L0306D9
         CPY   #$00B0
         BCC   L0306F5
         INX
         CPY   #$00C3
         BCC   L0306D9
         CPY   #$00D3
         BCC   L0306F5
L0306D9  BIT   L0307E8
         BPL   L0306E7
         LDA   #$0000
         JSR   L03079B
         BRL   L03076E
L0306E7  BRL   L0307F2
L0306EA  BIT   L0307E8
         BMI   L0306D9
         SEC
         ROR   L0307EE
         BRA   L0306A0
L0306F5  STX   L031777
         BIT   L0307EE
         BPL   L030700
         BRL   L030AB4
L030700  STX   L0307E6
         BIT   L0307E8
         BPL   L030715
         CPX   L0307EA
         BNE   L03076E
         LDA   L0307E4
         CMP   L0307EC
         BNE   L03076E
L030715  LDA   L0307E4
         STA   L0307EC
         STX   L0307EA
         LDA   #$0001
         JSR   L03079B
         LDX   L0307EA
         LDA   L0307EC
         BPL   L030753
         LDA   L031765
         CPX   #$0004
         BCC   L030748
         TXA
         ASL
         TAY
         LDA   L031765,Y
         INC
         CMP   #$0010
         BCC   L030743
         LDA   #$000F
L030743  JSR   L030BAA
         BRA   L03074B
L030748  JSR   L0304AA
L03074B  STA   L031765
         JSR   L030325
         BRA   L03076E
L030753  LDA   L031765
         CPX   #$0004
         BCC   L030769
         TXA
         ASL
         TAY
         LDA   L031765,Y
         BEQ   L030764
         DEC
L030764  JSR   L030BAA
         BRA   L03074B
L030769  JSR   L030502
         BRA   L03074B
L03076E  SEC
         ROR   L0307E8
         LDA   #$000A
         JSR   L0308EF
         PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BEQ   L030798
         PEA   ^L0317F5
         PEA   L0317F5
         _GetMouse
         BRL   L03067F
L030798  LDA   #$0000
L03079B  CMP   L0307F0
         BEQ   L0307DB
         STA   L0307F0
         LDA   L0307EA
         ASL
         ASL
         ASL
         TAX
         LDA   L031841,X
         INC
         STA   L03175B+2
         LDA   L031845,X
         DEC
         STA   L03175B+6
         LDX   #$0000
         LDA   L0307EC
         BPL   L0307C2
         INX
         INX
L0307C2  LDA   L0307DC,X
         STA   L03175B
         LDA   L0307E0,X
         STA   L03175B+4
         PEA   ^L03175B
         PEA   L03175B
         _InvertRect
L0307DB  RTS

L0307DC  DW    $0051
         DW    $009E
L0307E0  DW    $005C
         DW    $00A9
L0307E4  DW    $0000
L0307E6  DW    $0000
L0307E8  DW    $0000
L0307EA  DW    $0000
L0307EC  DW    $0000
L0307EE  DW    $0000
L0307F0  DW    $0000
L0307F2  PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L03186F
         PEA   L03186F
         _PtInRect
         PLA
         BEQ   L030838
         LDA   L0317F5
         LDX   L0317F7
         CMP   #$007C
         BCC   L030819
         LDA   #$007C
L030819  CPX   #$0108
         BCC   L030821
         LDX   #$0108
L030821  STA   L03175B
         CLC
         ADC   #$0010
         STA   L03175B+4
         TXA
         STA   L03175B+2
         ADC   #$0010
         STA   L03175B+6
         BRL   L030CA9
L030838  LDA   #$009D
         STA   L03175B
         CLC
         ADC   #$0010
         STA   L03175B+4
         LDA   #$00DA
         STA   L03175B+2
         ADC   #$0040
         STA   L03175B+6
         PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L03175B
         PEA   L03175B
         _PtInRect
         PLA
         BEQ   L03089C
         LDA   L0317F5
         SEC
         SBC   #$009D
         AND   #$FFF8
         CLC
         ADC   #$009D
         STA   L03175B
         ADC   #$0008
         STA   L03175B+4
         LDA   L0317F7
         SEC
         SBC   #$00DA
         AND   #$FFF8
         INC
         CLC
         ADC   #$00DA
         STA   L03175B+2
         ADC   #$0008
         STA   L03175B+6
         BRL   L030CA9
L03089C  LDA   #$0002
L03089F  PHA
         PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         ASL
         ASL
         ASL
         LDX   #^L03182F
         PHX
         CLC
         ADC   #L03182F
         PHA
         _PtInRect
         PLA
         BNE   L0308C4
         PLA
         DEC
         BPL   L03089F
         RTS

L0308C4  PLA
         ASL
         ASL
         ASL
         TAX
         LDA   L0317F5
         SEC
         SBC   L03182F,X
         AND   #$FFF8
         CLC
         ADC   L03182F,X
         STA   L03175B
         ADC   #$0008
         STA   L03175B+4
         LDA   L031831,X
         STA   L03175B+2
         LDA   L031835,X
         STA   L03175B+6
         BRL   L030CA9
L0308EF  STA   L030925
         PEA   $0000
         PEA   $0000
         _GetTick
         PLA
         CLC
         ADC   L030925
         STA   L030925
         PLA
         STA   L030927
L03090B  PEA   $0000
         PEA   $0000
         _GetTick
         PLA
         PLY
         CMP   L030925
         BNE   L03090B
         CPY   L030927
         BNE   L03090B
         RTS

L030925  DW    $0000
L030927  DW    $0000
L030929  LDA   L031765
         XBA
         AND   #$000F
         LDX   #$0001
         JSR   L030964
         LDA   L031765
         LSR
         LSR
         LSR
         LSR
         AND   #$000F
         LDX   #$0002
         JSR   L030964
         LDA   L031765
         AND   #$000F
         LDX   #$0003
         JSR   L030964
         LDA   L031773
         LDX   #$0004
         JSR   L030964
         LDA   L031775
         LDX   #$0005
         BRL   L030964
L030964  STA   L030AAA
         STX   L030AAC
         TXA
         ASL
         TAX
         LDA   L031765,X
         STA   L030AAE
         CMP   L030AAA
         BNE   L030979
         RTS

L030979  LDX   L030AAC
         JSR   L030A97
         STX   L030AB0
         STY   L030AB2
         LDA   L030AAE
         LDX   L030AAC
         CPX   #$0005
         BNE   L03099B
         LSR
         LDA   #$0001
         BCC   L0309A6
         LDA   #$000E
         BRA   L0309A6
L03099B  LSR
         LDA   #$0004
         BCC   L0309A2
         ASL
L0309A2  CLC
         ADC   L030AAC
L0309A6  JSR   L0300CF
         PEA   ^L03177D
         PEA   L03177D
         _SetPenPat
         LDY   L030AB2
         LDX   L030AAC
         TYA
         CLC
         ADC   #$0004
         TAY
         LDA   L030AB2
         LDX   L030AB0
         SEC
         JSR   L030A09
         LDA   L030AAC
         ASL
         TAX
         LDA   L030AAA
         STA   L031765,X
         LDA   #$0000
         JSR   L0300CF
         PEA   ^L03177D
         PEA   L03177D
         _SetPenPat
         LDA   L030AAA
         LDX   L030AAC
         JSR   L030A97
         STX   L030AB0
         STY   L030AB2
         LDX   L030AAC
         TYA
         CLC
         ADC   #$0004
         TAY
         LDA   L030AB2
         LDX   L030AB0
         CLC
L030A09  STA   L030A8F
         STY   L030A93
         STX   L030A91
         TXA
         BCS   L030A30
         SBC   #$0001
         STA   L030A91
         CLC
         ADC   #$0013
         STA   L030A95
         PEA   ^L030A8F
         PEA   L030A8F
         _FrameRect
         RTS

L030A30  ADC   #$000D
         STA   L030A95
         PEA   ^L030A8F
         PEA   L030A8F
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         LDA   L030A91
         SEC
         SBC   #$0003
         STA   L030A91
         CLC
         ADC   #$0002
         STA   L030A95
         PEA   ^L030A8F
         PEA   L030A8F
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         LDA   L030A91
         CLC
         ADC   #$0013
         STA   L030A91
         INC
         STA   L030A95
         PEA   ^L030A8F
         PEA   L030A8F
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         RTS

L030A8F  DW    $0000
L030A91  DW    $0000
L030A93  DW    $0000
L030A95  DW    $0000
L030A97  ASL
         ASL
         CLC
         ADC   #$005D
         PHA
         TXA
         ASL
         ASL
         ASL
         TAX
         LDA   L031841,X
         TAX
         INX
         PLY
         RTS

L030AAA  DW    $0000
L030AAC  DW    $0000
L030AAE  DW    $0000
L030AB0  DW    $0000
L030AB2  DW    $0000
L030AB4  STX   L030B63
         TXA
         ASL
         TAY
         LDA   L031765,Y
         STA   L030B69
         STA   L030B6B
         JSR   L030A97
         TXA
         SEC
         SBC   #$000A
         STA   L030B65
         ADC   #$0024
         STA   L030B67
         TYA
         CMP   L0317F5
         BEQ   L030B12
         BCS   L030AEB
         LDX   L030B63
         CPX   #$0004
         CLC
         ADC   #$0003
         CMP   L0317F5
         BCS   L030B12
L030AEB  LDA   L0317F5
         SEC
         SBC   #$005D
         LSR
         LSR
         LDX   L030B63
         JSR   L030A97
         STX   L03175B+2
         TXA
         CLC
         ADC   #$000F
         STA   L03175B+6
         STY   L03175B
         TYA
         ADC   #$0004
         STA   L03175B+4
         BRL   L030CA9
L030B12  PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BEQ   L030B60
         PEA   ^L0317F5
         PEA   L0317F5
         _GetMouse
         LDA   L0317F7
         CMP   L030B65
         BCC   L030B5A
         CMP   L030B67
         BCS   L030B5A
         LDA   L0317F5
         SEC
         SBC   #$005D
         LSR
         LSR
L030B45  CMP   #$00FF
         BCC   L030B4D
         LDA   #$0000
L030B4D  CMP   #$0010
         BCC   L030B55
         LDA   #$000F
L030B55  JSR   L030B6D
         BRA   L030B12
L030B5A  LDA   L030B69
         BRA   L030B45
         RTS

L030B60  BRL   L030325
L030B63  DW    $0000
L030B65  DW    $0000
L030B67  DW    $0000
L030B69  DW    $0000
L030B6B  DW    $0000
L030B6D  STA   L030B6B
         LDX   L030B63
         CPX   #$0004
         BCS   L030BAE+1
         PHA
         TXA
         ASL
         TAX
         LDA   L030B6B
         LDA   L03179D+$1E,X
         AND   L031765
         STA   L031765
         LDA   L030B6B
         LDX   L030B63
         CPX   #$0001
         BNE   L030B94
         XBA
L030B94  CPX   #$0002
         BNE   L030B9D
         ASL
         ASL
         ASL
         ASL
L030B9D  ORA   L031765
         STA   L031765
         PLA
L030BA4  LDY   L031775
         BRL   L030964
L030BAA  STA   L030B6B
         SEC
L030BAE  BCC   L030BC8
         PHP
         TXA
         INC
         AND   #$0006
         TAY
         LDA   L030BEB+2,Y
         STA   L030BF9
         LDA   L030BF1,Y
         STA   L030BFB
         LDA   L030B6B
         LSR
         PHP
L030BC8  CLC
         ADC   #$0008
         PLP
         PEA   $0000
         PHA
         LDA   L030BF9
         BCC   L030BD9
         EOR   L030BFB
L030BD9  PHA
         _GetColorEntry
         PLA
         STA   L031765
         PLP
         BCS   L030BF0
         LDX   L030B63
L030BEB  LDA   L030B6B
         BRA   L030BA4
L030BF0  RTS

L030BF1  DW    $0008
         DW    $0001
         DW    $0004
         DW    $000F
L030BF9  DW    $0000
L030BFB  DW    $0000
L030BFD  STZ   L030CA5
         STA   L030CA7
         LDA   #$0001
         JSR   L030C79
L030C09  PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BEQ   L030C57
         PEA   ^L0317F5
         PEA   L0317F5
         _GetMouse
         PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         LDA   L030CA7
         CMP   #$0001
         BNE   L030C3F
         PEA   ^L031998
         PEA   L031998
         BRA   L030C45
L030C3F  PEA   ^L0319A0
         PEA   L0319A0
L030C45  _PtInRect
         PLA
         BEQ   L030C52
         LDA   #$0001
L030C52  JSR   L030C79
         BRA   L030C09
L030C57  LDA   L030CA5
         BEQ   L030C78
         LDA   L030CA7
         CMP   #$0001
         BEQ   L030C74
         PEA   $0000
         PEA   ^L03179D
         PEA   L03179D
         _SetColorTable
L030C74  SEC
         ROR   L031759
L030C78  RTS

L030C79  CMP   L030CA5
         BEQ   L030CA4
         STA   L030CA5
         LDA   L030CA7
         CMP   #$0001
         BNE   L030C91
         PEA   ^L031998
         PEA   L031998
         BRA   L030C97
L030C91  PEA   ^L0319A0
         PEA   L0319A0
L030C97  PEA   $000F
         PEA   $000D
         _InvertRRect
L030CA4  RTS

L030CA5  DW    $0000
L030CA7  DW    $0000

L030CA9  _HideCursor
         PEA   $0000
         PEA   $0000
         LDA   L03175B
         CLC
         ADC   #$0015
         PHA
         _GetSCB
         PLA
         AND   #$000F
         PHA
         PEA   $0000
         LDA   L03175B+2
         INC
         PHA
         LDA   L03175B
         INC
         PHA
         _GetPixel
         _GetColorEntry
         PLA
         STA   L030E89
         _ShowCursor
L030CF0  LDA   L0317F1
         STA   L030E85
         PEA   ^L030E8B
         PEA   L030E8B
         _SetPenPat
         PEA   $0002
         _SetPenMode
         STZ   L030E87
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
         LDA   L0317F5
         STA   L030E81
         LDA   L0317F7
         STA   L030E83
L030D29  PEA   $0000
         PEA   $0000
         _GetTick
         PLA
         STA   L0317F1
         PLA
         PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BEQ   L030DBC
         PEA   ^L0317F5
         PEA   L0317F5
         _GetMouse
         LDA   L0317F7
         SEC
         SBC   L030E83
         TAX
         LDA   L0317F5
         SEC
         SBC   L030E81
         TAY
         BNE   L030D6D
         TXA
         BEQ   L030D82
L030D6D  PEA   ^L03175B
         PEA   L03175B
         PHX
         PHY
         JSR   L030E54
         _OffsetRect
         BRL   L030CF0
L030D82  LDA   L030E85
         CLC
         ADC   #$000A
         BCS   L030D90
         CMP   L0317F1
         BCS   L030D29
L030D90  PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
         LDA   L0317F1
         STA   L030E85
         LDA   #$FFFF
         EOR   L030E87
         STA   L030E87
         BRL   L030D29
L030DBC  JSR   L030E54
         PEA   $0000
         _SetPenMode
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L03186F
         PEA   L03186F
         _PtInRect
         PLA
         BEQ   L030E00
         STZ   L031777
         LDA   L030E89
         CMP   L031765
         BEQ   L030E36
         STA   L031765
         BRL   L030325
L030E00  LDA   L0317F5
         CMP   #$003C
         BCC   L030E36
         CMP   #$004D
         BCS   L030E36
         LDA   L0317F7
         CMP   #$0030
         BCC   L030E36
         CMP   #$0130
         BCS   L030E36
         SBC   #$002F
         LSR
         LSR
         LSR
         LSR
         EOR   #$000F
L030E24  PEA   $0000
         PHA
         LDA   L030E89
         PHA
         _SetColorEntry
         BRL   L0305E6
L030E36  PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L0317DB
         PEA   L0317DB
         _PtInRect
         PLA
         BEQ   L030E80
         LDA   L031763
         BRA   L030E24
L030E54  BIT   L030E87
         BPL   L030E66
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
L030E66  PEA   ^L030E8B
         PEA   L030E8B
         _SetPenPat
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
L030E80  RTS

L030E81  DW    $0000
L030E83  DW    $0000
L030E85  DW    $0000
L030E87  DW    $0000
L030E89  DW    $0000
L030E8B  HEX   00FF00FFFF00FF0000FF00FFFF00FF00
         HEX   00FF00FFFF00FF0000FF00FFFF00FF00
L030EAB  PEA   $0000
         PEA   ^L0317F5
         PEA   L0317F5
         PEA   ^L0317CB
         PEA   L0317CB
         _PtInRect
         PLA
         BEQ   L030EC7
         LDA   #$0001
L030EC7  CMP   L031779
         BEQ   L030EE5
         STA   L031779
         ORA   #$0000
         BNE   L030EE6
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
L030EE5  RTS

L030EE6  PEA   ^L0317FF
         PEA   L0317FF
         _SetCursor
         RTS

L030EF4  PEA   $0000
         PEA   $000C
         PEA   $0140
         PEA   $00BC
         JSL   L018223
         LDA   $A0
         STA   L0318B7
         LDA   $A2
         STA   L0318B7+2
         LDA   $A0
         STA   L0318CD
         LDA   $A2
         STA   L0318CD+2
         PEA   $0000
         PEA   $FFF8
         _SetOrigin
         PEA   ^L0317E3
         PEA   L0317E3
         _FrameRect
         PEA   $0004
         PEA   $004E
         _MoveTo
         PEA   $0137
         PEA   $0000
         _Line
         PEA   ^L0317C3
         PEA   L0317C3
         _FrameRect
         LDA   $3E
         BNE   L030F6A
         PEA   ^L0318C9
         PEA   L0318C9
         _PaintPixels
L030F6A  LDX   #$000F
L030F6D  PHX
         LDA   #$003C
         STA   L03175B
         LDA   #$004D
         STA   L03175B+4
         TXA
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$0030
         STA   L03175B+2
         ADC   #$0010
         STA   L03175B+6
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
         INC   L03175B
         INC   L03175B+2
         DEC   L03175B+4
         DEC   L03175B+6
         PLA
         PHA
         EOR   #$000F
         JSR   L0300CF
         PEA   ^L03175B
         PEA   L03175B
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         PLX
         DEX
         BPL   L030F6D
         JSR   L0300A8
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   ^L031988
         PEA   L031988
         PEA   $000F
         PEA   $000D
         _FrameRRect
         PEA   ^L031990
         PEA   L031990
         PEA   $000F
         PEA   $000D
         _FrameRRect
         PEA   $0021
         PEA   $0014
         _MoveTo
         PEA   ^L01046F
         PEA   L01046F
         _DrawString
         PEA   $0011
         PEA   $0028
         _MoveTo
         PEA   ^L010472
         PEA   L010472
         _DrawString
         LDA   #$0002
L031031  PHA
         ASL
         ASL
         ASL
         CLC
         ADC   #L03182F
         STA   L0313E4
         LDA   #^L03182F
         STA   L0313E4+2
         PLA
         PHA
         INC
         INC
         CMP   #$0005
         BNE   L03104E
         LDA   #$000E
L03104E  JSR   L0300CF
         LDA   L0313E4+2
         PHA
         LDA   L0313E4
         PHA
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         LDA   L0313E4+2
         PHA
         LDA   L0313E4
         PHA
         _FrameRect
         PLA
         DEC
         BMI   L03107C
         BRL   L031031
L03107C  LDA   #$009D
         STA   L03175B
         CLC
         ADC   #$0009
         STA   L03175B+4
         LDA   #$00DA
         STA   L03175B+2
         ADC   #$0009
         STA   L03175B+6
         LDA   #$000F
L031098  PHA
         JSR   L0300CF
         PEA   ^L03175B
         PEA   L03175B
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         PEA   ^L03175B
         PEA   L03175B
         _FrameRect
         PLA
         PHA
         AND   #$0007
         BNE   L0310DC
         LDA   #$00A5
         STA   L03175B
         CLC
         ADC   #$0009
         STA   L03175B+4
         LDA   #$00D2
         STA   L03175B+2
         ADC   #$0009
         STA   L03175B+6
L0310DC  PEA   ^L03175B
         PEA   L03175B
         PEA   $0008
         PEA   $0000
         _OffsetRect
         PLA
         DEC
         BPL   L031098
         PEA   ^L031847
         PEA   L031847
         _FrameRect
         PEA   ^L03184F
         PEA   L03184F
         _FrameRect
         PEA   ^L031857
         PEA   L031857
         _FrameRect
         PEA   ^L03185F
         PEA   L03185F
         _FrameRect
         PEA   ^L031867
         PEA   L031867
         _FrameRect
         LDA   #$0004
L031137  PHA
         ASL
         ASL
         ASL
         TAX
         LDA   L03184D,X
         PHA
         PEA   $0051
         _MoveTo
         PEA   $0000
         PEA   $0059
         _Line
         PEA   $FFF1
         PEA   $0000
         _Line
         PLA
         DEC
         BPL   L031137
         LDA   #$0028
         JSR   L031359
         LDA   #$004B
         JSR   L031359
         LDA   #$006E
         JSR   L031359
         LDA   #$00A0
         JSR   L031359
         LDA   #$00C3
         JSR   L031359
         LDA   #$000D
         JSR   L0300CF
         PEA   ^L03186F
         PEA   L03186F
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         PEA   ^L03186F
         PEA   L03186F
         _FrameRect
         LDA   #$005D
         STA   L031877
         STA   L03187F
         STA   L031887
         STA   L03188F
         STA   L031897
         LDA   #$0061
         STA   L03187B
         STA   L031883
         STA   L03188B
         STA   L031893
         STA   L03189B
         LDA   #$0029
         STA   L031879
         LDA   #$0037
         STA   L03187D
         LDA   #$004C
         STA   L031881
         LDA   #$005A
         STA   L031885
         LDA   #$006F
         STA   L031889
         LDA   #$007D
         STA   L03188D
         LDA   #$00A1
         STA   L031891
         LDA   #$00AF
         STA   L031895
         LDA   #$00C4
         STA   L031899
         LDA   #$00D2
         STA   L03189D
         LDA   #$0000
L03120F  PHA
         LSR
         LDA   #$0000
         BCC   L031219
         LDA   #$0004
L031219  CLC
         ADC   #$0005
         STA   L0313E2
         JSR   L0300CF
         PEA   ^L031877
         PEA   L031877
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         INC   L0313E2
         LDA   L0313E2
         JSR   L0300CF
         PEA   ^L03187F
         PEA   L03187F
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         INC   L0313E2
         LDA   L0313E2
         JSR   L0300CF
         PEA   ^L031887
         PEA   L031887
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         INC   L0313E2
         LDA   L0313E2
         JSR   L0300CF
         PEA   ^L03188F
         PEA   L03188F
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         LDX   L0313E2
         LDA   #$0001
         CPX   #$0009
         BCC   L031298
         LDA   #$000E
L031298  JSR   L0300CF
         PEA   ^L031897
         PEA   L031897
         PEA   ^L03177D
         PEA   L03177D
         _FillRect
         LDX   #$0005
         LDA   #L031877
         STA   $0A
L0312B6  PHX
         PEA   ^L031877
         LDA   $0A
         PHA
         PEA   $0000
         PEA   $0004
         _OffsetRect
         CLC
         LDA   $0A
         ADC   #$0008
         STA   $0A
         PLX
         DEX
         BNE   L0312B6
         PLA
         INC
         CMP   #$0010
         BCS   L0312E0
         BRL   L03120F
L0312E0  LDA   #$0071
         STA   L0313E2
         LDX   #$0000
L0312E9  LDY   #$0008
L0312EC  PHX
         PHY
         LDA   L0313E2
         PHA
         TXA
         CLC
         ADC   #$0008
         PHA
         _SetSCB
         INC   L0313E2
         PLY
         PLX
         DEY
         BNE   L0312EC
         INX
         CPX   #$0008
         BCC   L0312E9
         LDX   #$0020
         LDA   #$00B1
L031313  PHX
         PHA
         PHA
         PEA   $0007
         _SetSCB
         PLA
         INC
         PLX
         DEX
         BNE   L031313
         LDA   #$0009
L031329  PHA
         ASL
         ASL
         TAX
         LDA   L031392,X
         STA   L0318A1
         LDA   L031392+2,X
         STA   L0318A1+2
         LDA   L0313BA,X
         STA   L0318AF
         LDA   L0313BC,X
         STA   L0318B1
         PEA   ^L0318B3
         PEA   L0318B3
         _PaintPixels
         PLA
         DEC
         BPL   L031329
         BRL   L030325
L031359  STA   L031390
         PHA
         PEA   $005C
         _MoveTo
         PEA   $000F
         PEA   $0000
         _Line
         LDA   L031390
         PHA
         PEA   $009D
         _MoveTo
         PEA   $000F
         PEA   $0000
         _Line
         RTS

L031390  DW    $0000
L031392  ADRL  L0318E7
         ADRL  L0318E7
         ADRL  L0318E7
         ADRL  L0318E7
         ADRL  L0318E7
         ADRL  L031934
         ADRL  L031934
         ADRL  L031934
         ADRL  L031934
         ADRL  L031934
L0313BA  DW    $0051
L0313BC  DW    $0029
         DW    $0051
         DW    $004C
         DW    $0051
         DW    $006F
         DW    $0051
         DW    $00A1
         DW    $0051
         DW    $00C4
         DW    $009E
         DW    $0029
         DW    $009E
         DW    $004C
         DW    $009E
         DW    $006F
         DW    $009E
         DW    $00A1
         DW    $009E
         DW    $00C4
L0313E2  DW    $0000
L0313E4  ADRL  $00000000

L0313E8  LDA   L031763
         STA   L031731
         LDX   #$0006
L0313F1  LDA   L03175B,X
         STA   L031711,X
         STA   L031719,X
         DEX
         DEX
         BPL   L0313F1
         PEA   ^L031711
         PEA   L031711
         PEA   $0001
         PEA   $0000
         _InsetRect
         PEA   ^L031719
         PEA   L031719
         PEA   $0002
         PEA   $0001
         _InsetRect
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   ^L031711
         PEA   L031711
         _FrameRect
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   ^L031719
         PEA   L031719
         _FrameRect
L031458  _SystemTask
         PEA   $0000
         PEA   $FFFF
         PEA   ^L0317EB
         PEA   L0317EB
         _GetNextEvent
         PLA
         PEA   ^L0317F5
         PEA   L0317F5
         _GlobalToLocal
         LDA   L0317EB
         CMP   #$0001
         BNE   L031458
         LDA   L0317F5
         CMP   #$003C
         BCC   L031458
         CMP   #$004D
         BCS   L031458
         LDA   L0317F7
         CMP   #$0030
         BCC   L031458
         CMP   #$0130
         BCS   L031458
         SBC   #$002F
         LSR
         LSR
         LSR
         LSR
         EOR   #$000F
         STA   L031733
         EOR   #$000F
         ASL
         ASL
         ASL
         ASL
         ADC   #$0030
         STA   L031723
         STA   L03172B
         ADC   #$0010
         STA   L031727
         STA   L03172F
         LDA   #$003D
         STA   L031721
         STA   L031729
         LDA   #$004C
         STA   L031725
         STA   L03172D
         PEA   ^L031721
         PEA   L031721
         PEA   $0001
         PEA   $0000
         _InsetRect
         PEA   ^L031729
         PEA   L031729
         PEA   $0002
         PEA   $0001
         _InsetRect
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   ^L031721
         PEA   L031721
         _FrameRect
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         PEA   ^L031729
         PEA   L031729
         _FrameRect
         LDA   L031731
         STA   L031735
         LDA   L031733
         STA   L031737
         LDA   L031735
         CMP   L031737
         BCC   L031553
         PHA
         LDA   L031737
         STA   L031735
         PLA
         STA   L031737
L031553  SEC
         LDA   L031737
         SBC   L031735
         BNE   L03155F
         BRL   L03168F
L03155F  CMP   #$0001
         BNE   L031567
         BRL   L03168F
L031567  STA   L0316FD
         PEA   $0000
         PEA   ^L031739
         PEA   L031739
         _GetColorTable
         LDA   L031735
         ASL
         TAX
         LDA   L031739,X
         AND   #$0F00
         XBA
         STA   L031701
         STZ   L0316FF
         LDA   L031739,X
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   L031707
         STZ   L031705
         LDA   L031739,X
         AND   #$000F
         STA   L03170D
         STZ   L03170B
         LDA   L031737
         ASL
         TAX
         LDA   L031739,X
         AND   #$0F00
         XBA
         STA   L031703
         LDA   L031739,X
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   L031709
         LDA   L031739,X
         AND   #$000F
         STA   L03170F
         PHA
         PHA
         SEC
         LDA   L031703
         SBC   L031701
         PHA
         LDA   L0316FD
         PHA
         _FixRatio
         PLA
         STA   L0316F1
         PLA
         STA   L0316F1+2
         PHA
         PHA
         SEC
         LDA   L031709
         SBC   L031707
         PHA
         LDA   L0316FD
         PHA
         _FixRatio
         PLA
         STA   L0316F5
         PLA
         STA   L0316F5+2
         PHA
         PHA
         SEC
         LDA   L03170F
         SBC   L03170D
         PHA
         LDA   L0316FD
         PHA
         _FixRatio
         PLA
         STA   L0316F9
         PLA
         STA   L0316F9+2
         LDA   L031735
         INC
L031628  PHA
         ASL
         TAX
         CLC
         LDA   L0316FF
         ADC   L0316F1
         STA   L0316FF
         LDA   L031701
         ADC   L0316F1+2
         STA   L031701
         XBA
         STA   L031739,X
         CLC
         LDA   L031705
         ADC   L0316F5
         STA   L031705
         LDA   L031707
         ADC   L0316F5+2
         STA   L031707
         ASL
         ASL
         ASL
         ASL
         ORA   L031739,X
         STA   L031739,X
         CLC
         LDA   L03170B
         ADC   L0316F9
         STA   L03170B
         LDA   L03170D
         ADC   L0316F9+2
         STA   L03170D
         ORA   L031739,X
         STA   L031739,X
         PLA
         INC
         CMP   L031737
         BNE   L031628
         PEA   $0000
         PEA   ^L031739
         PEA   L031739
         _SetColorTable
L03168F  LDA   L031731
         JSR   L0300CF
         PEA   ^L03177D
         PEA   L03177D
         _SetPenPat
         PEA   ^L031711
         PEA   L031711
         _FrameRect
         PEA   ^L031719
         PEA   L031719
         _FrameRect
         LDA   L031733
         JSR   L0300CF
         PEA   ^L03177D
         PEA   L03177D
         _SetPenPat
         PEA   ^L031721
         PEA   L031721
         _FrameRect
         PEA   ^L031729
         PEA   L031729
         _FrameRect
         _PenNormal
         RTS

L0316F1  ADRL  $00000000
L0316F5  ADRL  $00000000
L0316F9  ADRL  $00000000
L0316FD  DW    $0000
L0316FF  DW    $0000
L031701  DW    $0000
L031703  DW    $0000
L031705  DW    $0000
L031707  DW    $0000
L031709  DW    $0000
L03170B  DW    $0000
L03170D  DW    $0000
L03170F  DW    $0000
L031711  HEX   0000000000000000
L031719  HEX   0000000000000000
L031721  DW    $0000
L031723  DW    $0000
L031725  DW    $0000
L031727  DW    $0000
L031729  DW    $0000
L03172B  DW    $0000
L03172D  DW    $0000
L03172F  DW    $0000
L031731  DW    $0000
L031733  DW    $0000
L031735  DW    $0000
L031737  DW    $0000
L031739  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L031759  DW    $0000
L03175B  HEX   0000000000000000
L031763  DW    $0000
L031765  DW    $0000
L031767  DW    $0000
L031769  DW    $0000
L03176B  DW    $0000
L03176D  DW    $0000
L03176F  DW    $0000
         DW    $0000
L031773  DW    $0000
L031775  DW    $0000
L031777  DW    $0000
L031779  DW    $0000
L03177B  DW    $0000
L03177D  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L03179D  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
         DW    $00FF
         DW    $0F0F
         DW    $0FF0
L0317C3  DW    $0000
         DW    $0055
         DW    $0038
         DW    $0131
L0317CB  DW    $0001
         DW    $0056
         DW    $0037
         DW    $0130
L0317D3  DW    $0000
         DW    $0000
         DW    $00B4
         DW    $0140
L0317DB  DW    $003F
L0317DD  DW    $0019
L0317DF  DW    $004A
L0317E1  DW    $002C
L0317E3  DW    $003C
         DW    $0014
         DW    $004D
         DW    $0130
L0317EB  DW    $0000      ; event code
L0317ED  ADRL  $00000000  ; event message
L0317F1  ADRL  $00000000  ; tick count
L0317F5  DW    $0000      ; mouse location
L0317F7  DW    $0000
L0317F9  DW    $0000      ; modifiers
         DW    $0000
         DW    $0000
L0317FF  DW    $0005      ; cursor height
         DW    $0002      ; cursor width
         HEX   FFFFF000   ; cursor image
         HEX   FFFFF000
         HEX   FFFFF000
         HEX   FFFFF000
         HEX   FFFFF000
         HEX   FFFFF000   ; cursor mask
         HEX   FFFFF000
         HEX   FFFFF000
         HEX   FFFFF000
         HEX   FFFFF000
         DW    $0000      ; hot spot
         DW    $0000
L03182F  DW    $005D
L031831  DW    $001E
         DW    $009D
L031835  DW    $0024
         DW    $005D
         DW    $0041
         DW    $009D
         DW    $0047
         DW    $005D
L031841  DW    $0064
         DW    $009D
L031845  DW    $006A
L031847  DW    $0050
         DW    $0028
         DW    $00AA
L03184D  DW    $0038
L03184F  DW    $0050
         DW    $004B
         DW    $00AA
         DW    $005B
L031857  DW    $0050
         DW    $006E
         DW    $00AA
         DW    $007E
L03185F  DW    $0050
         DW    $00A0
         DW    $00AA
         DW    $00B0
L031867  DW    $0050
         DW    $00C3
         DW    $00AA
         DW    $00D3
L03186F  DW    $0078
         DW    $00DC
         DW    $008C
         DW    $0118
L031877  DW    $0000
L031879  DW    $0000
L03187B  DW    $0000
L03187D  DW    $0000
L03187F  DW    $0000
L031881  DW    $0000
L031883  DW    $0000
L031885  DW    $0000
L031887  DW    $0000
L031889  DW    $0000
L03188B  DW    $0000
L03188D  DW    $0000
L03188F  DW    $0000
L031891  DW    $0000
L031893  DW    $0000
L031895  DW    $0000
L031897  DW    $0000
L031899  DW    $0000
L03189B  DW    $0000
L03189D  DW    $0000
L03189F  DW    $0000
L0318A1  ADRL  L0318E7
         DW    $0007
L0318A7  DW    $0000
         DW    $0000
         DW    $000B
         DW    $000E
L0318AF  DW    $0051
L0318B1  DW    $0029
L0318B3  ADRL  L03189F
L0318B7  DW    $0000
L0318B9  DW    $0000
         ADRL  L0318A7
         ADRL  L0318AF
         DW    $0000
         DW    $0000
         DW    $0000
L0318C9  ADRL  L019825
L0318CD  DW    $0000
L0318CF  DW    $0000
         ADRL  L0318DF
         ADRL  L0317CB
         DW    $0000
         DW    $0000
         DW    $0000
L0318DF  DW    $0000
L0318E1  DW    $0000
L0318E3  DW    $0000
L0318E5  DW    $0000
L0318E7  HEX   FFFFFF0FFFFFFF
         HEX   FFFFF0F0FFFFFF
         HEX   FFFF0FFF0FFFFF
         HEX   FFF0FFFFF0FFFF
         HEX   FF0FFFFFFF0FFF
         HEX   FF000FFF0000FF
         HEX   FFFF0FFF0000FF
         HEX   FFFF0FFF00FFFF
         HEX   FFFF000000FFFF
         HEX   FFFFF00000FFFF
         HEX   FFFFFFFFFFFFFF
L031934  HEX   FFFFFFFFFFFFFF
         HEX   FFFF00000FFFFF
         HEX   FFFF0FFF00FFFF
         HEX   FFFF0FFF00FFFF
         HEX   FF000FFF0000FF
         HEX   FF0FFFFFFF00FF
         HEX   FFF0FFFFF000FF
         HEX   FFFF0FFF000FFF
         HEX   FFFFF0F000FFFF
         HEX   FFFFFF000FFFFF
         HEX   FFFFFFF0FFFFFF
         HEX   FFFFFFFFFFFFFF

L031988  DW    $000A
         DW    $000B
         DW    $0017
         DW    $004A
L031990  DW    $001E
         DW    $000B
         DW    $002B
         DW    $004A
L031998  DW    $000B
         DW    $000C
         DW    $0016
         DW    $0049
L0319A0  DW    $001F
         DW    $000C
         DW    $002A
         DW    $0049
