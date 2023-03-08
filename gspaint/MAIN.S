*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	MAIN.E
	 lst	off
	 
*-------------------------------

MSLOT EQU $07F8
KEYMODREG EQU $C025
BUTN1 EQU $C062
CLRROM EQU $CFFF
GSOS EQU $E100A8

LANGUAGE	=	2	; 1 for FR, 2 for US, ...

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

         BRL   L010003
L010003  PHK
         PLB
         STA   L01967F
         PHA
         PEA   ^L01001F
         PEA   L01001F
         PEA   $0000
         PEA   $0004
         _GetFontLore
         PLA
         BRA   L010023
L01001F  HEX   00000000
L010023  LDA   #$0002
         JSR   L01080A
         PHA
         PEA   $FFFF
         PEA   $0000
         _FlushEvents
         PLA
L010038  _SystemTask
         PHA
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   $52
         BEQ   L010066
         JSL   L01876B
         AND   #$FFFF
         BMI   L010073
         LDA   #$0008
         JSR   L0190DA
         STZ   $52
L010066  JSR   L010B8E
         JSR   L018E75
         LDA   $48
         BEQ   L010073
         JSR   L015E21
L010073  LDA   L0196BB
         ASL
         TAX
         JSR   (L0100AA,X)
         LDA   L019747
         BEQ   L010038
         LDA   #$000B
         JSR   L01080A
         LDA   L01967F
         PHA
         _MMShutDown
         LDA   #$0000
         STAL  $E100FF
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L0100A2
L0100A2  ADRL  $00000000  ;  path name
         DW    $0000      ;  flags
         DW    $0000

L0100AA  DA    L0100CA
         DA    L010AAB
         DA    L0100CA
         DA    L0100CB
         DA    L0100CA
         DA    L0100CB
         DA    L010C70
         DA    L0100CA
         DA    L010A5D
         DA    L0100CA
         DA    L0100CA
         DA    L0100CA
         DA    L0100CA
         DA    L0100CA
         DA    L0100CA
         DA    L0100CA

L0100CA  RTS

L0100CB  JSL   L0185C2
         BCC   L0100D4
         BRL   L010038
L0100D4  PEA   ^L0196BB
         PEA   L0196BB
         LDA   #$0000
         PHA
         PHA
         _MenuKey
         LDA   L0196CB
         BEQ   L0100F0
         JSR   L013A62
         BRA   L01012A
L0100F0  LDA   $48
         BEQ   L0100F9
         JSR   L0159B7
         BRA   L01012A
L0100F9  LDA   L0196BD
         CMP   #$007F
         BNE   L01010C
         LDA   $36
         BEQ   L01012A
         BMI   L01012A
         JSR   L0143F4
         BRA   L01012A
L01010C  CMP   #$001B
         BNE   L010116
         JSR   L013B93
         BRA   L01012A
L010116  LDA   L0196BD
         CMP   #$0020
         BNE   L010126
         LDA   #$000A
         JSR   L01080A
         BRA   L01012A
L010126  JSL   L01351E
L01012A  RTS

*-------------------------------

	do	LANGUAGE=1
	 put	GSPAINT.FR.S
	else
	do	LANGUAGE=2
	 put	GSPAINT.US.S
	fin
	fin
	
*-------------------------------

L0107E3  ENT
         PHD
         PHB
         PHK
         PLB
         LDA   L01968D
         TCD
         PEA   ^L0199EC
         PEA   L0199EC
         PEA   ^L019A54
         PEA   L019A54
         _FillRect
         JSR   L0116FE
         JSR   L0117DA
         JSR   L010DA6
         PLB
         PLD
         RTL

L01080A  STA   L0108E7
         CMP   #$0002
         BEQ   L010816
         JSL   L018744
L010816  LDA   L01967F
         PHA
         PEA   $0001
         LDA   L0108E7
         PHA
         PEA   ^L0108F1
         PEA   L0108F1
         _GetLoadSegInfo
         CMP   #$0000
         BEQ   L01084B
L010833  JSL   GSOS
         DW    $0006      ; GetFileInfo
         ADRL  L0108ED
         BCC   L01084B
         LDA   #$0001
         LDX   #$0001
         JSL   L017D37
         BRA   L010833
L01084B  JSL   L010D82
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         PHA
         PHA
         LDA   L01967F
         PHA
         PEA   $0001
         LDA   L0108E7
         PHA
         _LoadSegNum
         CMP   #$0000
         BEQ   L010879
         PLX
         PLX
         BRA   L0108C9
L010879  PLA
         STA   L0108E9
         PLA
         STA   L0108EB
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         LDA   L0108E7
         PHA
         JSL   L0108BA
         PLA
         STA   L0108E7
         LDA   L01967F
         PHA
         PEA   $0001
         LDA   L0108E7
         PHA
         _UnloadSegNum
         CMP   #$0000
         BEQ   L0108B8
         BRL   L0108C9
L0108B8  CLC
         RTS

L0108BA  LDA   L0108E9+1
         PHA
         PHB
         PLA
         LDA   L0108E9
         SEC
         SBC   #$0001
         PHA
         RTL

L0108C9  CMP   #$0201
         BNE   L0108D7
         LDX   #$0002
         JSL   L017D37
         SEC
         RTS

L0108D7  PHA
         PEA   ^L010662
         PEA   L010662
         _SysFailMgr
         BRK   $0A
L0108E7  DW    $0000
L0108E9  DW    $0000
L0108EB  DW    $0000
L0108ED  ADRL  L010907    ;  file name
L0108F1  DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    4          ;  creation date
         DS    4          ;  modification date
         ADRL  $00000000  ;  blocks used
L010907  STR   '1'

L010909  JSL   L018744
         PHA
         PHA
         _GetCursorAdr
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         LDA   L01059D
         STA   L01971F
         LDA   L01059F
         STA   L019721
         LDA   L0105A1
         STA   L019723
         LDA   L0105A3
         STA   L019725
         LDA   #L0105A5
         STA   L019729
         LDA   #^L0105A5
         STA   L019729+2
         PHA
         PEA   ^L0196CF
         PEA   L0196CF
         PEA   $0000
         PEA   $0000
         _Alert
         JSL   L010D82
         PLA
         CMP   #$0001
         BEQ   L01096A
         BRL   L010A41
L01096A  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   #$0001
         STA   $3C
         LDA   $74
         DEC
         EOR   #$000F
         STA   L010A49
         ASL
         ASL
         ASL
         ASL
         STA   L010A4B
         XBA
         STA   L010A4F
         LDA   L010A49
         XBA
         STA   L010A4D
         LDA   $70
         DEC
         EOR   #$000F
         STA   L010A51
         ASL
         ASL
         ASL
         ASL
         STA   L010A53
         XBA
         STA   L010A57
         LDA   L010A51
         XBA
         STA   L010A55
         LDA   L019976
         STA   $0A
         LDA   L019978
         STA   $0C
         LDX   $F0
L0109BE  LDY   #$009E
L0109C1  STZ   L010A59
         LDA   [$0A],Y
         XBA
         STA   L010A5B
         PHA
         AND   #$000F
         CMP   L010A51
         BNE   L0109DF
         LDA   #$000F
         TRB   L010A5B
         LDA   L010A49
         TSB   L010A59
L0109DF  LDA   $01,S
         AND   #$00F0
         CMP   L010A53
         BNE   L0109F5
         LDA   #$00F0
         TRB   L010A5B
         LDA   L010A4B
         TSB   L010A59
L0109F5  LDA   $01,S
         AND   #$0F00
         CMP   L010A55
         BNE   L010A0B
         LDA   #$0F00
         TRB   L010A5B
         LDA   L010A4D
         TSB   L010A59
L010A0B  PLA
         AND   #$F000
         CMP   L010A57
         BNE   L010A20
         LDA   #$F000
         TRB   L010A5B
         LDA   L010A4F
         TSB   L010A59
L010A20  LDA   L010A59
         ORA   L010A5B
         XBA
         STA   [$0A],Y
         DEY
         DEY
         BPL   L0109C1
         CLC
         LDA   $0A
         ADC   #$00A0
         STA   $0A
         DEX
         BNE   L0109BE
         JSR   L011953
         JSR   L0118CC
         JSR   L014117
L010A41  _SetCursor
         RTS

L010A49  DW    $0000
L010A4B  DW    $0000
L010A4D  DW    $0000
L010A4F  DW    $0000
L010A51  DW    $0000
L010A53  DW    $0000
L010A55  DW    $0000
L010A57  DW    $0000
L010A59  DW    $0000
L010A5B  DW    $0000
L010A5D  PHA
         LDA   L0196BD+2
         PHA
         LDA   L0196BD
         PHA
         _GetWKind
         PLA
         BPL   L010A7B
         JSL   L01876B
         AND   #$FFFF
         BPL   L010AA2
         BRA   L010A8D
L010A7B  LDA   L0196C9
         BIT   #$0001
         BNE   L010A9D
         JSL   L01876B
         AND   #$FFFF
         BMI   L010A8D
         RTS

L010A8D  LDA   #$0007
         JSR   L0190DA
         LDA   #$0001
         STA   $52
         JSL   L018752
         RTS

L010A9D  LDA   $52
         BNE   L010AA2
         RTS

L010AA2  LDA   #$0008
         JSR   L0190DA
         STZ   $52
         RTS

L010AAB  JSR   L017F05
         PHA
         PEA   ^L019689
         PEA   L019689
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         _FindWindow
         PLA
         BEQ   L010AE0
         BPL   L010AE1
         TAX
         PEA   ^L0196BB
         PEA   L0196BB
         LDA   L01968B
         PHA
         LDA   L019689
         PHA
         PHX
         _SystemClick
L010AE0  RTS

L010AE1  SEC
         SBC   #$0010
         ASL
         TAX
         JMP   (L010AEA,X)

L010AEA  DA    L010B03
         DA    L013A0E
         DA    L010B02
         DA    L010B79
         DA    L010B02
         DA    L010B02
         DA    L010B56
         DA    L010B02
         DA    L010B02
         DA    L010B02
         DA    L010B02
         DA    L010B02
L010B02  RTS

L010B03  LDA   $52
         BNE   L010B55
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0199DC
         PEA   L0199DC
         _PtInRect
         PLA
         BEQ   L010B21
         JMP   L0147C5

L010B21  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0199D4
         PEA   L0199D4
         _PtInRect
         PLA
         BEQ   L010B3B
         JMP   L0149C7

L010B3B  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0199E4
         PEA   L0199E4
         _PtInRect
         PLA
         BEQ   L010B55
         JMP   L0162B4
L010B55  RTS

L010B56  PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _TrackGoAway
         PLA
         BEQ   L010B78
         LDA   #$0104
         STA   L0196CB
         JSR   L013DC6
L010B78  RTS

L010B79  LDA   $52
         BEQ   L010B7E
         RTS

L010B7E  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JMP   L01647C

L010B8E  LDA   $3E
         BNE   L010B9B
         JSR   L010C12
         JSR   L010B9C
         JSR   L013976
L010B9B  RTS

L010B9C  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L019E74
         PEA   L019E74
         _PtInRect
         PLA
         BEQ   L010BF9
         JSR   L018A9D
         LDA   $44
         BEQ   L010BD3
         LDA   $54
         BNE   L010BD2
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         LDA   #$0001
         STA   $54
L010BD2  RTS

L010BD3  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L013950
         LDA   $54
         BEQ   L010BF8
         LDA   L019EDC+2
         PHA
         LDA   L019EDC
         PHA
         _SetCursor
         STZ   $54
L010BF8  RTS

L010BF9  LDA   $54
         BNE   L010C11
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         LDA   #$0001
         STA   $54
L010C11  RTS

L010C12  SEP   #$20
         LDAL  BUTN1
         REP   #$20
         BPL   L010C4B
         LDA   $76
         CMP   #$0002
         BEQ   L010C6F
         LDA   $76
         STA   L01969D
         LDA   #$0002
         STA   $76
         LDA   L019EDC
         STA   L01969F
         LDA   L019EDC+2
         STA   L0196A1
         LDA   #L01A500
         STA   L019EDC
         LDA   #^L01A500
         STA   L019EDC+2
         LDA   #$0001
         STA   $54
         RTS

L010C4B  LDA   L01969D
         CMP   $76
         BEQ   L010C6F
         LDA   $76
         CMP   #$0002
         BNE   L010C6F
         LDA   L01969D
         STA   $76
         LDA   L01969F
         STA   L019EDC
         LDA   L0196A1
         STA   L019EDC+2
         LDA   #$0001
         STA   $54
L010C6F  RTS

L010C70  LDA   L0196BD+2
         PHA
         LDA   L0196BD
         PHA
         _SetPort
         LDA   L0196BD+2
         PHA
         LDA   L0196BD
         PHA
         _BeginUpdate
         PHA
         LDA   L0196BD+2
         PHA
         LDA   L0196BD
         PHA
         _GetWKind
         PLA
         CMP   #$0000
         BCS   L010CA7
         BRL   L010D44
L010CA7  LDA   $3E
         BEQ   L010CAE
         BRL   L010D44
L010CAE  LDA   $52
         BNE   L010D05
         LDA   $34
         BEQ   L010CEF
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         _PenNormal
         LDA   L019697
         BEQ   L010CE2
         PEA   ^L019E74
         PEA   L019E74
         PEA   ^L019A14
         PEA   L019A14
         _FillRect
L010CE2  PEA   ^L019E8C
         PEA   L019E8C
         _FrameRect
L010CEF  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L011953
         JSR   L014117
         BRL   L010D44
L010D05  LDA   L019998
         STA   L01999E
         LDA   L01999A
         STA   L0199A0
         CLC
         TDC
         ADC   #$0056
         STA   L010D70
         STZ   L010D72
         LDA   $90
         STA   L010D68
         LDA   $92
         STA   L010D6A
         PHA
         PHA
         _GetVisHandle
         PLA
         STA   L010D76
         PLA
         STA   L010D76+2
         PEA   ^L010D64
         PEA   L010D64
         _PaintPixels
L010D44  LDA   L0196BD+2
         PHA
         LDA   L0196BD
         PHA
         _EndUpdate
         PHA
         PHA
         _FrontWindow
         _SetPort
         RTS

L010D64  ADRL  L01999C
L010D68  DW    $0000
L010D6A  DW    $0000
         ADRL  L010D7A
L010D70  DW    $0000
L010D72  DW    $0000
         DW    $0000
L010D76  ADRL  $00000000
L010D7A  DW    $0000
         DW    $0000
         DW    $0085
         DW    $010C

L010D82  ENT
         PHB
         PHK
         PLB
L010D85  PHA
         PEA   $0040
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   L0196BB
         CMP   #$0000
         BNE   L010DA1
         PLB
         RTL

L010DA1  JSR   L010C70
         BRA   L010D85
L010DA6  _PenNormal
         PEA   ^L0199E4
         PEA   L0199E4
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         PEA   ^L0199E4
         PEA   L0199E4
         _FrameRect
         LDA   #L010E8E
         STA   L010E7C
         LDA   #^L010E8E
         STA   L010E7C+2
         LDA   #$0005
         STA   L010E8C
         LDA   #$0010
         STA   L010E8A
         LDX   #$0002
L010DE8  PHX
         LDX   #$000A
L010DEC  PHX
         PEA   ^L010E7A
         PEA   L010E7A
         PEA   ^L010E82
         PEA   L010E82
         LDA   L010E8C
         PHA
         LDA   L010E8A
         PHA
         PEA   $0000
         _PPToPort
         CLC
         LDA   L010E7C
         ADC   #$006C
         STA   L010E7C
         CLC
         LDA   L010E8A
         ADC   #$000D
         STA   L010E8A
         PLX
         DEX
         BNE   L010DEC
         LDA   #$0010
         STA   L010E8A
         LDA   #$0016
         STA   L010E8C
         PLX
         DEX
         BNE   L010DE8
         LDX   #$0009
         LDA   #$001C
L010E39  PHX
         PHA
         PEA   $0005
         PHA
         _MoveTo
         PLA
         PHA
         PEA   $0027
         PHA
         _LineTo
         CLC
         PLA
         ADC   #$000D
         PLX
         DEX
         BNE   L010E39
         PEA   $0016
         PEA   $0010
         _MoveTo
         PEA   $0016
         PEA   $0092
         _LineTo
         JSR   L01635D
         RTS

L010E7A  DW    $0000      ; SCB byte
L010E7C  ADRL  $00000000  ; Pointer to pixel image
         DW    $0009      ; Width
L010E82  DW    $0000      ; Bounds rect
         DW    $0000
         DW    $000C
         DW    $0012
L010E8A  DW    $0000
L010E8C  DW    $0000
L010E8E  HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFF00000FFFFFF
         HEX   FFFF000FFFFF00FFFF
         HEX   FF0FFFFFFFFFFF0FFF
         HEX   F0FFFFFFFFFFF0FFFF
         HEX   F0FFFFFFFFF00FFFFF
         HEX   FF000FFF000FFFFFFF
         HEX   F00F0000FFFFFFFFFF
         HEX   F0F00FFFFFFFFFFFFF
         HEX   FF00FFFFFFFFFFFFFF
         HEX   FFF0FFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFF0FFFFFFFFF
         HEX   FFFFFF00F00FFFFFFF
         HEX   FFFFF0F0F0F0FFFFFF
         HEX   FFFF00F0F0F00FFFFF
         HEX   FFF0F0FFFFF0F0FFFF
         HEX   FFF0FF0FFFFFF0FFFF
         HEX   FFFF0FFFFFFF0FFFFF
         HEX   FFFFF0FFFFFF0FFFFF
         HEX   FFFFFF0FFFF0FFFFFF
         HEX   FFFFFF0FFFF0FFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFF0FFFFFFFFFF
         HEX   FFFFFF0F0FFFFFFFFF
         HEX   FFFFF0FFF00FFFFFFF
         HEX   FFFF0FFFFF000FFFFF
         HEX   FFF0FFF0FFF000FFFF
         HEX   FF0FFF000F0F00FFFF
         HEX   FFF0FFF000FF00FFFF
         HEX   FFFF0FFF0FFF00FFFF
         HEX   FFFFF0F0FFFF00FFFF
         HEX   FFFFFF0FFFFF0FFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFF000FFFFFFFF
         HEX   FFFFFFF0F0FFFFFFFF
         HEX   FFFFFFF000FFFFFFFF
         HEX   FFFFFFF000FFFFFFFF
         HEX   FFFF000000000FFFFF
         HEX   FFFF0FFFFFFF0FFFFF
         HEX   FFFF0FFFFFFF0FFFFF
         HEX   FFFF0F0F0F0F0FFFFF
         HEX   FFF0F0F0F0F00FFFFF
         HEX   FF0000000000FFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF00FFFFFFFFFFFF
         HEX   FFFFF00FFFFFFFFFFF
         HEX   FFFFFF00FFFFFFFFFF
         HEX   FFFFFFF00FFFFFFFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFFFF00FFFFFFF
         HEX   FFFFFFFFFF00FFFFFF
         HEX   FFFFFFFFFFF00FFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FF00000000000000FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF00000000000000FF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF0000000000FFFF
         HEX   FFF0FFFFFFFFFF0FFF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FFF0FFFFFFFFFF0FFF
         HEX   FFFF0000000000FFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFF000000FFFFFF
         HEX   FFFF000FFFF000FFFF
         HEX   FFF00FFFFFFFF00FFF
         HEX   FF00FFFFFFFFFF00FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF00FFFFFFFFFF00FF
         HEX   FFF00FFFFFFFF00FFF
         HEX   FFFF000FFFF000FFFF
         HEX   FFFFFF000000FFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF00FFFFFF00FFFF
         HEX   FFF0FF00FFF0FF0FFF
         HEX   FF0FFFFF000FFF0FFF
         HEX   FF0FFFFFFFFFFF0FFF
         HEX   FFF0FFFFFFFFF0FFFF
         HEX   FFF0FFFFFFFF0FFFFF
         HEX   FFFF00FFFF00FFFFFF
         HEX   FFFFFF0000FFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFF00000000FFFF
         HEX   FFFFF00FFFFF00FFFF
         HEX   FFFF00FFFFF00FFFFF
         HEX   FFF00FFFFF00FFFFFF
         HEX   FFF0FFFFFF00FFFFFF
         HEX   FFF0FFFFFFFF00FFFF
         HEX   FFF0FFFFFFFFF00FFF
         HEX   FFF000000000000FFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF

         HEX   FFFFFFFFFFFFFFFFFF	; Second colmun
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FF000FF0000FF000FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FF0FFFFFFFFFFFF0FF
         HEX   FF000FF0000FF000FF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF0000000000FFFF
         HEX   FFFF0FFF00FFF0FFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFFF00FFFFFFFF
         HEX   FFFFFFF0000FFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFF0F0FFFFFFFFFFFF
         HEX   FFFF0F0F0F00FFFFFF
         HEX   FFF0F0FFF0000FFFFF
         HEX   FFFFFFFF000000FFFF
         HEX   FFFFFFFF0FFFF0FFFF
         HEX   FFFFFFFF0F0000FFFF
         HEX   FFFFFFFF0F0FF0FFFF
         HEX   FFFFFFFF0F0000FFFF
         HEX   FFFFFFFF0FFFF0FFFF
         HEX   FFFFFFFF000000FFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFF000FFFFFF
         HEX   FFFFFFFFF0FF0FFFFF
         HEX   FFFFFFFF00FF0FFFFF
         HEX   FFFFFFFF0F00FFFFFF
         HEX   FFFFFFF0FFF0FFFFFF
         HEX   FFFFFFF0FF0FFFFFFF
         HEX   FFFFFF0FFF0FFFFFFF
         HEX   FFFFFF0FF0FFFFFFFF
         HEX   FFFFFF000FFFFFFFFF
         HEX   FFFFFF00FFFFFFFFFF
         HEX   FFFFFF0FFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFF0000000FFFF
         HEX   FFFFFF0FFFFF00FFFF
         HEX   FFFFF0FFFFF0F0FFFF
         HEX   FFFF0FFFFF0F0FFFFF
         HEX   FFF0000000F0FFFFFF
         HEX   FFF0FFFFF00FFFFFFF
         HEX   FFF0000000FFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FF00000000000000FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF00000000000000FF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF0000000000FFFF
         HEX   FFF00F0F0F0F0F0FFF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FFF0F0F0F0F0F00FFF
         HEX   FFFF0000000000FFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFF000000FFFFFF
         HEX   FFFF000F0F0000FFFF
         HEX   FFF000F0F0F0F00FFF
         HEX   FF000F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F0F0FF
         HEX   FF0F0F0F0F0F0F00FF
         HEX   FF00F0F0F0F0F000FF
         HEX   FFF00F0F0F0F000FFF
         HEX   FFFF0000F0F000FFFF
         HEX   FFFFFF000000FFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFF00FFFFFF00FFFF
         HEX   FFF0F000FFF00F0FFF
         HEX   FF00F0F00000F00FFF
         HEX   FF0F0F0F0F0F0F0FFF
         HEX   FFF0F0F0F0F0F0FFFF
         HEX   FFF00F0F0F0F0FFFFF
         HEX   FFFF00F0F000FFFFFF
         HEX   FFFFFF0000FFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFF00000000FFFF
         HEX   FFFFF00F0F0F00FFFF
         HEX   FFFF00F0F0F00FFFFF
         HEX   FFF00F0F0F00FFFFFF
         HEX   FFF0F0F0F000FFFFFF
         HEX   FFF00F0F0F0F00FFFF
         HEX   FFF0F0F0F0F0F00FFF
         HEX   FFF000000000000FFF
         HEX   FFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFF

L0116FE  _PenNormal
         PEA   ^L0199D4
         PEA   L0199D4
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         PEA   ^L0199D4
         PEA   L0199D4
         _FrameRect
         JSR   L01172C
         JSR   L011773
         RTS

L01172C  JSR   L017EDD
         LDX   #$0000
L011732  PHX
         PEA   $0001
         LDA   L0117BA,X
         PHA
         _SetPenSize
         PLX
         INX
         INX
         PHX
         PEA   $000E
         LDA   L0117BA,X
         PHA
         _MoveTo
         PLX
         PHX
         PEA   $0025
         LDA   L0117BA,X
         PHA
         _LineTo
         PLX
         INX
         INX
         CPX   #$0010
         BNE   L011732
         _PenNormal
         RTS

L011773  PEA   $0006
         _SetTextMode
         PEA   $00FF
         _SetForeColor
         LDA   $6E
         ASL
         ASL
         TAY
         LDA   L0117CC,Y
         PHA
         LDA   L0117CA,Y
         PHA
         _MoveTo
         PEA   $0012
         _DrawChar
         PEA   $0004
         _SetTextMode
         PEA   $0000
         _SetForeColor
         RTS

L0117BA  DW    $0001
         DW    $009E
         DW    $0002
         DW    $00A6
         DW    $0003
         DW    $00AF
         DW    $0004
         DW    $00B9
L0117CA  DW    $00A1
L0117CC  DW    $0006
         DW    $00A9
         DW    $0006
         DW    $00B3
         DW    $0006
         DW    $00BD
         DW    $0006
L0117DA  _PenNormal
         PEA   ^L0199DC
         PEA   L0199DC
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         PEA   ^L0199DC
         PEA   L0199DC
         _FrameRect
         PEA   $004A
         PEA   $00B3
         _MoveTo
         PEA   $013A
         PEA   $00B3
         _LineTo
         LDY   #$0010
         LDA   #$004A
L011821  PHY
         PHA
         PHA
         PHA
         PEA   $00A5
         _MoveTo
         PEA   $00C1
         _LineTo
         PLA
         CLC
         ADC   #$000F
         PLY
         DEY
         BNE   L011821
         LDX   #$0001
         LDA   #L019A74
L011848  PHX
         PHA
         PHA
         PEA   ^L019749
         PEA   L019749
         JSL   L01493B
         PLA
         PEA   ^L019749
         PEA   L019749
         PEA   ^L019A74
         PHA
         _FillRect
         PLA
         CLC
         ADC   #$0020
         PLX
         INX
         CPX   #$0021
         BNE   L011848
         JSR   L011884
         PEA   $0000
         PEA   $0000
         _SetOrigin
         RTS

L011884  PEA   ^L019EC4
         PEA   L019EC4
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRect
         JSR   L017EDD
         PEA   ^L019EB4
         PEA   L019EB4
         _FrameRect
         PEA   ^L019EBC
         PEA   L019EBC
         JSL   L0149A7
         PHX
         PHA
         _FillRect
         _PenNormal
         RTS

L0118C4  ENT
         PHB
         PHK
         PLB
         JSR   L0118CC
         PLB
         RTL

L0118CC  JSR   L011A25
         LDA   $34
         BNE   L0118E3
         LDA   $06
         STA   $0E
         LDA   $08
         STA   $10
         LDY   L0199C0
         LDX   L0199C2
         BRA   L0118F3
L0118E3  JSR   L01192F
         LDY   $5E
         LDX   $60
         JSR   L011A0C
         LDY   #$0085
         LDX   #$0084
L0118F3  STX   L011A0A
         PHY
         LDA   L019970
         STA   $0A
         LDA   L019972
         STA   $0C
         _HideCursor
         PLX
L011909  LDY   L011A0A
L01190C  LDA   [$0E],Y
         STA   [$0A],Y
         DEY
         DEY
         BPL   L01190C
         CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         CLC
         LDA   #$0086
         ADC   $0A
         STA   $0A
         DEX
         BNE   L011909
         _ShowCursor
         RTS

L01192F  JSR   L011A25
         LDY   $56
         LDX   $58
         JSR   L011A0C
         LDA   $0E
         STA   $0A
         LDA   $10
         STA   $0C
         LDA   $06
         STA   $0E
         LDA   $08
         STA   $10
         BRA   L011965
L01194B  ENT
         PHB
         PHK
         PLB
         JSR   L011953
         PLB
         RTL

L011953  JSR   L011A25
         LDY   $56
         LDX   $58
         JSR   L011A0C
         LDA   $06
         STA   $0A
         LDA   $08
         STA   $0C
L011965  _HideCursor
         LDX   L0199C0
L01196F  LDY   L0199C2
L011972  LDA   [$0E],Y
         STA   [$0A],Y
         DEY
         DEY
         BPL   L011972
         CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$00A0
         STA   $0A
         DEX
         BNE   L01196F
         _ShowCursor
         RTS

L011995  JSR   L011A25
         LDA   $34
         BNE   L0119AE
         LDA   $06
         STA   $0E
         LDA   $08
         STA   $10
         LDY   L0199C0
         LDX   L0199C2
         JSR   L0119C8
         RTS

L0119AE  JSR   L01192F
         LDY   $5E
         LDX   $60
         JSR   L011A0C
         LDY   #$0085
         LDX   #$0084
         JSR   L0119C8
         JSR   L011953
         JSR   L014117
         RTS

L0119C8  STX   L011A0A
         PHY
         _HideCursor
         LDA   L019970
         STA   $0A
         LDA   L019972
         STA   $0C
         PLX
L0119DE  LDY   L011A0A
L0119E1  LDA   [$0A],Y
         PHA
         LDA   [$0E],Y
         STA   [$0A],Y
         PLA
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0119E1
         CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         CLC
         LDA   #$0086
         ADC   $0A
         STA   $0A
         DEX
         BNE   L0119DE
         _ShowCursor
         RTS

L011A0A  DW    $0000
L011A0C  PHX
         TYA
         JSL   L0182D0
         CLC
         ADC   L019976
         STA   $0E
         LDA   L019978
         STA   $10
         PLA
         LSR
         CLC
         ADC   $0E
         STA   $0E
         RTS

L011A25  LDA   $3E
         BEQ   L011A2A
         PLA
L011A2A  RTS
         RTS

L011A2C  JSR   L013C36
         JSR   L015981
         JSR   L01192F
         PEA   $0037
         PEA   $0028
         PEA   $00FA
         PEA   $0056
         JSL   L018223
         LDA   #L0106E9
         LDX   #^L0106E9
         LDY   #$000F
         JSR   L011AC3
         LDA   #L0106F7
         LDX   #^L0106F7
         LDY   #$0019
         JSR   L011AC3
         LDA   #L0106FB
         LDX   #^L0106FB
         LDY   #$0023
         JSR   L011AC3
         LDA   #L010707
         LDX   #^L010707
         LDY   #$002D
         JSR   L011AC3
         LDA   #L01070A
         LDX   #^L01070A
         LDY   #$0037
         JSR   L011AC3
         LDA   #L010722
         LDX   #^L010722
         LDY   #$0041
         JSR   L011AC3
         LDA   #L010737
         LDX   #^L010737
         LDY   #$004E
         JSR   L011AC3
L011A99  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   L0196BB
         CMP   #$0001
         BNE   L011A99
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         RTS

L011AC3  PHX
         PHA
         STY   L011AEE
         PHA
         PHX
         PHA
         _StringWidth
         SEC
         LDA   #$00FA
         SBC   $01,S
         LSR
         STA   $01,S
         LDA   L011AEE
         PHA
         _MoveTo
         _DrawString
         RTS

L011AEE  DW    $0000
L011AF0  LDA   $52
         BNE   L011B39
         JSL   L018744
         LDA   $06
         STA   $0E
         LDA   $08
         STA   $10
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         _HideCursor
         LDX   #$0085
L011B14  LDY   #$0084
L011B17  LDA   [$0E],Y
         STA   [$0A],Y
         DEY
         DEY
         BPL   L011B17
         CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         CLC
         LDA   #$0086
         ADC   $0A
         STA   $0A
         DEX
         BNE   L011B14
         _ShowCursor
L011B39  PHA
         LDA   L0196CB
         PHA
         _OpenNDA
         PLA
         PEA   $0000
         LDA   L0196CD
         PHA
         _HiliteMenu
         RTS

L011B55  JSR   L013C36
         JSL   L018752
         LDA   $48
         BNE   L011B63
         JSR   L01192F
L011B63  PHA
         PHA
         PEA   $0000
         PEA   $3000
         LDA   L01967F
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L011B8A
         _DisposeHandle
         PHA
         PHA
L011B8A  PLA
         PLA
         PHA
         PHA
         _MaxBlock
         PLA
         PLX
         STX   L011CC4
         BNE   L011BEB
         CMP   #$3000
         BCS   L011BEB
         LDA   L0196B1
         PHA
         LDA   L0196AF
         PHA
         PEA   $0010
         _SetPurgeStat
         LDA   L0196AF
         CMP   #$FFFE
         BEQ   L011BCA
         LDA   #$FFFE
         STA   L0196AF
         LDA   #$0800
         STA   L0196B1
         BRL   L011B63
L011BCA  LDX   #$0002
         LDA   #$0201
         JSL   L017D37
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         _LoadSysFont
         BRL   L011C87
L011BEB  JSR   L011C8F
         LDA   L0196B1
         PHA
         LDA   L0196AF
         PHA
         PEA   $0010
         _SetPurgeStat
         PHA
         PHA
         LDA   L0196B1
         PHA
         LDA   L0196AF
         PHA
         PEA   $0020
         LDA   L011CC4
         BNE   L011C18
         JSL   L011CC6
         BRA   L011C1F
L011C18  _ChooseFont
L011C1F  PLA
         STA   L0196AF
         PLA
         STA   L0196B1
         ORA   L0196AF
         BNE   L011C2F
         BRL   L011C87
L011C2F  JSR   L011C8F
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   L0196B1
         PHA
         LDA   L0196AF
         PHA
         LDA   L011CC4
         BEQ   L011C51
         PEA   $0000
         BRA   L011C54
L011C51  PEA   $0001
L011C54  _InstallFont
         PHA
         PHA
         _FMGetCurFID
         PLA
         STA   L0196AF
         PLA
         STA   L0196B1
         PEA   ^L0196B3
         PEA   L0196B3
         _GetFontInfo
         CLC
         LDA   L0196B3
         ADC   L0196B5
         CLC
         ADC   L0196B9
         STA   L0196AD
L011C87  JSL   L010D82
         JSR   L015CB0
         RTS

L011C8F  JSL   GSOS
         DW    $0006      ; GetFileInfo
         ADRL  L011CA8
         BCC   L011CA7
         LDA   #$0000
         LDX   #$0001
         JSL   L017D37
         BRA   L011C8F
L011CA7  RTS

L011CA8  ADRL  L011CC2    ;  file name
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    4          ;  creation date
         DS    4          ;  modification date
         ADRL  $00000000  ;  blocks used
L011CC2  STR   '*'
L011CC4  DW    $0000
L011CC6  PHB
         PHK
         PLB
         LDA   #$0000
         STA   $0B,S
         STA   $0D,S
         PHA
         PHA
         PEA   ^L011FB8
         PEA   L011FB8
         _GetNewModalDialog
         PLA
         STA   L011FB4
         PLA
         STA   L011FB4+2
         LDA   $07,S
         LDX   #$000A
L011CEC  CMP   L01210D,X
         BEQ   L011CF8
         DEX
         DEX
         BPL   L011CEC
         LDX   #$0000
L011CF8  TXA
         LSR
         STA   L0122A2
         CLC
         ADC   #$0003
         TAX
         PEA   $FFFF
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _SetDItemValue
         LDA   $09,S
         XBA
         AND   #$00FF
         LDX   #$0006
L011D1E  CMP   L012184,X
         BEQ   L011D2A
         DEX
         DEX
         BPL   L011D1E
         LDX   #$0000
L011D2A  TXA
         LSR
         STA   L0122A4
         CLC
         ADC   #$0009
         TAX
         PEA   $FFFF
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _SetDItemValue
         LDA   $09,S
         AND   #$00FF
         STA   L0122A6
         LDX   #$0000
         CMP   #$0000
         BNE   L011D5A
         LDX   #$FFFF
L011D5A  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000D
         _SetDItemValue
         LDA   L0122A6
         LDX   #$0000
         AND   #$0001
         BEQ   L011D7B
         LDX   #$FFFF
L011D7B  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000E
         _SetDItemValue
         LDA   L0122A6
         LDX   #$0000
         AND   #$0002
         BEQ   L011D9C
         LDX   #$FFFF
L011D9C  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000F
         _SetDItemValue
         LDA   L0122A6
         LDX   #$0000
         AND   #$0004
         BEQ   L011DBD
         LDX   #$FFFF
L011DBD  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0010
         _SetDItemValue
         LDA   L0122A6
         LDX   #$0000
         AND   #$0008
         BEQ   L011DDE
         LDX   #$FFFF
L011DDE  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0011
         _SetDItemValue
         LDA   L0122A6
         LDX   #$0000
         AND   #$0010
         BEQ   L011DFF
         LDX   #$FFFF
L011DFF  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0012
         _SetDItemValue
L011E12  PHA
         PEA   $8000
         PEA   $0000
         _ModalDialog
         PLA
         BEQ   L011E12
         DEC
         ASL
         TAX
         JSR   (L011E68,X)
         BRA   L011E12
L011E2B  LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         _CloseDialog
         LDA   $03,S
         STA   $09,S
         LDA   $01,S
         STA   $07,S
         PLA
         PLA
         PLA
         LDA   #$0000
         PLB
         RTL

L011E4A  PLA
         LDA   L0122A2
         ASL
         TAX
         LDA   L01210D,X
         STA   $0B,S
         LDA   L0122A4
         ASL
         TAX
         LDA   L012184,X
         XBA
         ORA   L0122A6
         STA   $0D,S
         BRA   L011E2B
L011E65  PLA
         BRA   L011E2B
L011E68  DA    L011E4A
         DA    L011E65
         DA    L011F96
         DA    L011F96
         DA    L011F96
         DA    L011F96
         DA    L011F96
         DA    L011F96
         DA    L011F78
         DA    L011F78
         DA    L011F78
         DA    L011F78
         DA    L011EF6
         DA    L011E93
         DA    L011E93
         DA    L011E93
         DA    L011E93
         DA    L011E93
         DA    L011E92
         DA    L011E92
         DA    L011E92
L011E92  RTS

L011E93  LSR
         INC
         PHA
         SEC
         SBC   #$000E
         TAX
         LDA   #$0001
L011E9E  CPX   #$0000
         BEQ   L011EA7
         ASL
         DEX
         BRA   L011E9E
L011EA7  EOR   L0122A6
         STA   L0122A6
         LDA   $01,S
         TAX
         PHA
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _GetDItemValue
         PLA
         PLX
         EOR   #$FFFF
         PHA
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _SetDItemValue
         LDX   #$0000
         LDA   L0122A6
         BNE   L011EE2
         LDX   #$FFFF
L011EE2  PHX
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000D
         _SetDItemValue
         RTS

L011EF6  STZ   L0122A6
         PEA   $FFFF
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000D
         _SetDItemValue
         PEA   $0000
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000E
         _SetDItemValue
         PEA   $0000
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $000F
         _SetDItemValue
         PEA   $0000
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0010
         _SetDItemValue
         PEA   $0000
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0011
         _SetDItemValue
         PEA   $0000
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PEA   $0012
         _SetDItemValue
         RTS

L011F78  LSR
         INC
         TAX
         SEC
         SBC   #$0009
         STA   L0122A4
         PEA   $FFFF
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _SetDItemValue
         RTS

L011F96  LSR
         INC
         TAX
         SEC
         SBC   #$0003
         STA   L0122A2
         PEA   $FFFF
         LDA   L011FB4+2
         PHA
         LDA   L011FB4
         PHA
         PHX
         _SetDItemValue
         RTS

L011FB4  ADRL  $00000000
L011FB8  DW    $0032      ; dtBoundsRect
         DW    $0023
         DW    $00A0
         DW    $011D
         DW    $FFFF      ; dtVisible
         ADRL  $00000000  ; dtRefCon
         ADRL  L01201E    ; itemPtr
         ADRL  L012036    ; itemPtr
         ADRL  L01204E    ; itemPtr
         ADRL  L012066    ; itemPtr
         ADRL  L01207E    ; itemPtr
         ADRL  L012096    ; itemPtr
         ADRL  L0120AE    ; itemPtr
         ADRL  L0120C6    ; itemPtr
         ADRL  L012119    ; itemPtr
         ADRL  L012131    ; itemPtr
         ADRL  L012149    ; itemPtr
         ADRL  L012161    ; itemPtr
         ADRL  L01218C    ; itemPtr
         ADRL  L0121A4    ; itemPtr
         ADRL  L0121BC    ; itemPtr
         ADRL  L0121D4    ; itemPtr
         ADRL  L0121EC    ; itemPtr
         ADRL  L012204    ; itemPtr
         ADRL  L012247    ; itemPtr
         ADRL  L01225F    ; itemPtr
         ADRL  L012277    ; itemPtr
         ADRL  $00000000  ; Terminator
L01201E  DW    $0001      ; Item ID
         DW    $005B      ; Item rect
         DW    $0087
         DW    $0068
         DW    $00C3
         DW    $000A      ; Std button
         ADRL  L01046F    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012036  DW    $0002      ; Item ID
         DW    $005B      ; Item rect
         DW    $0037
         DW    $0068
         DW    $0073
         DW    $000A      ; Std button
         ADRL  L010472    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01204E  DW    $0003      ; Item ID
         DW    $0014      ; Item rect
         DW    $000D
         DW    $001F
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L0120DE    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012066  DW    $0004      ; Item ID
         DW    $001F      ; Item rect
         DW    $000D
         DW    $002A
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L0120E6    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01207E  DW    $0005      ; Item ID
         DW    $002A      ; Item rect
         DW    $000D
         DW    $0035
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L0120ED    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012096  DW    $0006      ; Item ID
         DW    $0035      ; Item rect
         DW    $000D
         DW    $0040
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L0120F3    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0120AE  DW    $0007      ; Item ID
         DW    $0040      ; Item rect
         DW    $000D
         DW    $004B
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L0120FD    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0120C6  DW    $0008      ; Item ID
         DW    $004B      ; Item rect
         DW    $000D
         DW    $0056
         DW    $0064
         DW    $000C      ; Std radio button
         ADRL  L012107    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0120DE  STR   'Shaston'
L0120E6  STR   'Venice'
L0120ED  STR   'Times'
L0120F3  STR   'Helvetica'
L0120FD  STR   'Hollywood'
L012107  STR   'Cairo'
L01210D  DW    $FFFE
         DW    $0005
         DW    $0014
         DW    $0015
         DW    $0097
         DW    $000B
L012119  DW    $0009      ; Item ID
         DW    $0014      ; Item rect
         DW    $006E
         DW    $001F
         DW    $008C
         DW    $000C      ; Std radio button
         ADRL  L012179    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0002      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012131  DW    $000A      ; Item ID
         DW    $0026      ; Item rect
         DW    $006E
         DW    $0031
         DW    $008C
         DW    $000C      ; Std radio button
         ADRL  L01217B    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0002      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012149  DW    $000B      ; Item ID
         DW    $0038      ; Item rect
         DW    $006E
         DW    $0043
         DW    $008C
         DW    $000C      ; Std radio button
         ADRL  L01217E    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0002      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012161  DW    $000C      ; Item ID
         DW    $004A      ; Item rect
         DW    $006E
         DW    $0055
         DW    $008C
         DW    $000C      ; Std radio button
         ADRL  L012181    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0002      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012179  STR   '8'
L01217B  STR   '12'
L01217E  STR   '14'
L012181  STR   '16'
L012184  DW    $0008
         DW    $000C
         DW    $000E
         DW    $0010
L01218C  DW    $000D      ; Item ID
         DW    $0014      ; Item rect
         DW    $009B
         DW    $001F
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L01221C    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0121A4  DW    $000E      ; Item ID
         DW    $001F      ; Item rect
         DW    $009B
         DW    $002A
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L012222    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0121BC  DW    $000F      ; Item ID
         DW    $002A      ; Item rect
         DW    $009B
         DW    $0035
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L012227    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0121D4  DW    $0010      ; Item ID
         DW    $0035      ; Item rect
         DW    $009B
         DW    $0040
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L01222E    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0121EC  DW    $0011      ; Item ID
         DW    $0040      ; Item rect
         DW    $009B
         DW    $004B
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L012238    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012204  DW    $0012      ; Item ID
         DW    $004B      ; Item rect
         DW    $009B
         DW    $0056
         DW    $00F0
         DW    $000B      ; Std check box
         ADRL  L012240    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01221C  STR   'Plain'
L012222  STR   'Bold'
L012227  STR   'Italic'
L01222E  STR   'Underline'
L012238  STR   'OutLine'
L012240  STR   'Shadow'
L012247  DW    $0013      ; Item ID
         DW    $0003      ; Item rect
         DW    $0014
         DW    $000E
         DW    $0032
         DW    $800F      ; Static text
         ADRL  L01228F    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01225F  DW    $0013      ; Item ID
         DW    $0003      ; Item rect
         DW    $006E
         DW    $000E
         DW    $0096
         DW    $800F      ; Static text
         ADRL  L012295    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L012277  DW    $0013      ; Item ID
         DW    $0003      ; Item rect
         DW    $009B
         DW    $000E
         DW    $00F0
         DW    $800F      ; Static text
         ADRL  L01229B    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01228F  STR   'Font:'
L012295  STR   'Size:'
L01229B  STR   'Style:'
L0122A2  DW    $0000
L0122A4  DW    $0000
L0122A6  DW    $0000

L0122A8  JSR   L013C36
         JSR   L015981
         JSR   L01192F
         STZ   L012403
         STZ   L012403+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L0123FD
         BCC   L0122C6
         BRL   L01230F
L0122C6  LDA   L0123FD
         STA   L012407
         STA   L012417
         LDA   #L01241D
         STA   L012409
         LDA   #^L01241D
         STA   L012409+2
         LDA   #$0002
         STA   L01240D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012407
         JSR   L012354
         JSR   L012339
         LDA   L01241D
         STA   L012419
         STZ   L012419+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012417
         BCC   L012309
         BRL   L0123DC
L012309  JSR   L012354
         JSR   L012339
L01230F  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L012415
         _InitPalette
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
         _DrawMenuBar
         JSL   L010D82
         RTS

L012339  PHA
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   L0196BB
         CMP   #$0001
         BNE   L012339
         RTS

L012354  _HideCursor
         LDA   $A4
         STA   L012409
         LDA   $A6
         STA   L012409+2
         LDA   #$2000
         STA   L012423
         LDA   #$00E1
         STA   L012423+2
         LDA   #$7D00
         STA   L01241F
         LDA   #$00A0
         STA   L01240D
         JSL   GSOS
         DW    $0017      ; GetMark
         ADRL  L012417
         BCC   L01238C
         BRL   L0123DC
L01238C  JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012417
         BCC   L01239B
         BRL   L0123DC
L01239B  JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012407
         BCC   L0123AA
         BRL   L0123DC
L0123AA  PHA
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         PEA   $00A0
         PEA   ^L012423
         PEA   L012423
         PEA   ^L01241F
         PEA   L01241F
         _UnPackBytes
         PLA
         CLC
         ADC   L012419
         STA   L012419
         LDA   L01241F
         BNE   L01238C
         _ShowCursor
         RTS

L0123DC  PLA
         _ShowCursor
         BRL   L01230F

L0123E7  STR   '1/PaintTools/HelpFile'
L0123FD  DW    $0000      ;  ref num
         ADRL  L0123E7    ;  path name
L012403  ADRL  $00000000  ;  reserved
L012407  DW    $0000      ;  ref num
L012409  ADRL  $00000000  ;  buffer ptr
L01240D  ADRL  $00000002  ;  request count
         ADRL  $00000000  ;  transfer count
L012415  DW    $0000      ;  ref num
L012417  DW    $0000      ;  ref num
L012419  ADRL  $00000000  ;  position
L01241D  DW    $0000
L01241F  DW    $0000
         DW    $0000
L012423  ADRL  $00000000

L012427  LDA   $3E
         BNE   L012439
         LDA   #$0104
         STA   L0196CB
         JSR   L013DC6
         LDA   $3E
         BNE   L012439
         RTS

L012439  PEA   $001E	; X/Y
         PEA   $001E
         PEA   ^L0105F5	; promptPtr
         PEA   L0105F5
         PEA   ^L0129C6	; filterProcPtr
         PEA   L0129C6
         PEA   ^L012A29	; typeListPtr
         PEA   L012A29
         PEA   ^L0198D9	; replyPtr
         PEA   L0198D9
         _SFGetFile
         JSL   L010D82
         LDA   L0198D9	; true for open
         BNE   L012468
         RTS

L012468  LDA   L0198DB
         CMP   #$00C0
         BEQ   L012487
         CMP   #$0006
         BEQ   L01247E
         LDA   #$0002	; filetype is C1 => 2
         STA   L019687
         BRL   L01274A
L01247E  LDA   #$0003	; filetype is 06 => 3
         STA   L019687
         BRL   L01274A

L012487  LDA   L0198DD
         BEQ   L012495
*	 cmp   #$8005	; AV 202004
*	 beq   L012490
         LDA   #$0000	; C0/0002 => 0
         STA   L019687
         BRL   L0124E0

*L012490  lda   #4	; AV 202004
*	 sta   L019687
*	 brl   handleDG
	 
L012495  LDA   #$0001	; C0/0000 => 1
         STA   L019687
         BRL   L012836
L01249E  LDA   L012A6D
         BMI   L0124B4
         JSR   L011953
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

L0124B4  LDA   L019976
         STA   $0A
         LDA   L019978
         STA   $0C
         LDX   #$0080
         LDY   #$7DFE
         LDA   #$0000
L0124C7  STA   [$0A],Y
         DEY
         DEY
         DEX
         BNE   L0124C7
         LDX   #$001E
         LDY   #$7E1E
L0124D4  LDA   L012A4D,X
         STA   [$0A],Y
         DEY
         DEY
         DEX
         DEX
         BPL   L0124D4
         RTS

L0124E0  LDA   #$0001
         STA   $74
         JSR   L01296D
         BCC   L0124ED
         BRL   L012999

L0124ED  LDA   #L01271B
         STA   L012A39
         LDA   #^L01271B
         STA   L012A39+2
         LDA   #$000F
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L01250E
         BRL   L012999
L01250E  LDA   L012728
         BEQ   L012549
         LDA   $A4
         STA   L012A39
         LDA   $A6
         STA   L012A39+2
         LDA   #$0020
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L012532
         BRL   L012999
L012532  PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _SetColorTable
         _InitPalette
L012549  LDA   L012728
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #$000F
         STA   L012A49
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012A47
         BCC   L012567
         BRL   L012999
L012567  LDA   #L01272A
         STA   L012A39
         LDA   #^L01272A
         STA   L012A39+2
         LDA   #$0002
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L012588
         BRL   L012999
L012588  LDA   L01272A
         STA   L012732
         LDA   $F0
         CMP   L01272A
         BCS   L012598
         STA   L012732
L012598  LDA   L019984
         STA   L012A39
         LDA   L019986
         STA   L012A39+2
         LDA   L012732
         ASL
         ASL
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L0125BB
         BRL   L012999
L0125BB  LDA   L01272A
         ASL
         ASL
         CLC
         ADC   #$0002
         CLC
         ADC   L012A49
         STA   L012A49
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012A47
         BCC   L0125DA
         BRL   L012999
L0125DA  JSR   L0129AF
         LDA   $A4
         STA   L012A39
         LDA   $A6
         STA   L012A39+2
         LDA   L019976
         STA   L012A23
         LDA   L019978
         STA   L012A23+2
         LDA   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         STZ   L012730
L012600  LDA   #$00A0
         STA   L01272C
         LDY   L012730
         LDA   [$0A],Y
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L012622
         CMP   #$004C
         BEQ   L012652
         BRL   L012999
L012622  PHA
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         LDY   L012730
         LDA   [$0A],Y
         PHA
         PEA   ^L012A23
         PEA   L012A23
         PEA   ^L01272C
         PEA   L01272C
         _UnPackBytes
         PLA
         CLC
         LDA   L012730
         ADC   #$0004
         STA   L012730
         DEC   L012732
         BNE   L012600
L012652  STZ   L012738
         STZ   L012738+2
L012658  CLC
         LDA   L012738
         ADC   L01271B
         STA   L012738
         STA   L012A49
         LDA   L012738+2
         ADC   L01271D
         STA   L012738+2
         STA   L012A49+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012A47
         BCC   L012680
         BRL   L012999
L012680  LDA   #L01271B
         STA   L012A39
         LDA   #^L01271B
         STA   L012A39+2
         LDA   #$000B
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L0126A9
         CMP   #$004C
         BNE   L0126A6
         BRL   L012707
L0126A6  BRL   L012999
L0126A9  LDA   L012720
         CMP   L012734
         BNE   L012658
         LDA   L012722
         CMP   L012734+2
         BNE   L012658
         LDA   #$0010
         CMP   L012724
         BCS   L0126C4
         STA   L012724
L0126C4  LDA   L012724
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   L012A3D
         LDA   #L019C74
         STA   L012A39
         LDA   #^L019C74
         STA   L012A39+2
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L0126EA
         BRL   L012999
L0126EA  LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L0117DA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
L012707  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L012A45
         LDA   #$0001
         STA   $40
         STZ   $3C
         BRL   L01249E

L01271B  DW    $0000
L01271D  DB    $00
         DB    $00
         DB    $00
L012720  DW    $0000
L012722  DW    $0000
L012724  DW    $0000
         DW    $0000
L012728  DW    $0000
L01272A  DW    $0000
L01272C  DW    $0000
         DW    $0000
L012730  DW    $0000
L012732  DW    $0000
L012734  ASC   'PATS'
L012738  ADRL  $00000000

L01273C  ENT
         PHB
         PHK
         PLB
         LDA   #$FFFF
         STA   L012A6D
         JSR   L01274D
         PLB
         RTL

*--- Handle C1/06 files

L01274A  STZ   L012A6D
L01274D  JSR   L01296D	; open file
         BCC   L012755
         BRL   L012999
L012755  LDA   L019976	; read $7D00 bytes
         STA   L012A39
         LDA   L019978
         STA   L012A39+2
         LDA   #$7D00
         STA   L012A3D
         BIT   L012A6D
         BMI   L01276F
         JSR   L0129AF	; show file name

L01276F  JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L01277E
         BRL   L012999

*--- now, read ONE palette only!

L01277E  LDA   #$7E00
         STA   L012A49
         STZ   L012A49+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012A47
         BCC   L012796
         BRL   L012999
L012796  LDA   #$0020
         STA   L012A3D
         LDA   $A4
         STA   L012A39
         LDA   $A6
         STA   L012A39+2
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L0127B5
         BRL   L012999

L0127B5  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L012A45

         LDA   L012A6D
         BPL   L0127D2

         LDY   #$001E
L0127C7  LDA   [$A4],Y
         STA   L012A4D,Y
         DEY
         DEY
         BPL   L0127C7
         BRA   L012825

L0127D2  LDA   L019687
         CMP   #$0002
         BEQ   L0127E5
         JSR   L018F57
         LDA   #$0002
         STA   L019687
         BRA   L0127F5
L0127E5  PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _SetColorTable
L0127F5  _InitPalette
         LDA   #$0001
         STA   $40
         STZ   $3C
         LDA   #$0001
         STA   $74
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L0117DA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort

L012825  BRL   L01249E

L012828  ENT
         PHB
         PHK
         PLB
         LDA   #$FFFF
         STA   L012A6D
         JSR   L012839
         PLB
         RTL

L012836  STZ   L012A6D
L012839  JSR   L01296D
         BCC   L012841
         BRL   L012999
L012841  LDA   $A4
         STA   L012A39
         LDA   $A6
         STA   L012A39+2
         LDA   #$0022
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L012860
         BRL   L012999
L012860  LDY   #$0020
         LDA   [$A4],Y
         EOR   #$000F
         INC
         STA   $74
         LDA   #L019C74
         STA   L012A39
         LDA   #^L019C74
         STA   L012A39+2
         LDA   #$0200
         STA   L012A3D
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L01288C
         BRL   L012999
L01288C  BIT   L012A6D
         BMI   L0128CA
         PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _SetColorTable
         _InitPalette
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L0117DA
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L0129AF
         BRA   L0128D6
L0128CA  LDY   #$001E
L0128CD  LDA   [$A4],Y
         STA   L012A4D,Y
         DEY
         DEY
         BPL   L0128CD
L0128D6  LDA   $A4
         STA   L012A39
         LDA   $A6
         STA   L012A39+2
         LDA   L019976
         STA   L012A23
         LDA   L019978
         STA   L012A23+2
         LDA   L019699
         STA   L012A27
         LDA   #$00A0
         STA   L012A3D
         JSL   GSOS
         DW    $0017      ; GetMark
         ADRL  L012A47
L012902  JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L012A47
         BCC   L012916
         CMP   #$004D
         BEQ   L012954
         BRL   L012999
L012916  JSL   GSOS
         DW    $0012      ; Read
         ADRL  L012A37
         BCC   L01292A
         CMP   #$004C
         BEQ   L012954
         BRL   L012999
L01292A  PHA
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         PEA   $00A0
         PEA   ^L012A23
         PEA   L012A23
         PEA   ^L012A27
         PEA   L012A27
         _UnPackBytes
         PLA
         CLC
         ADC   L012A49
         STA   L012A49
         LDA   L012A27
         BNE   L012902
L012954  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L012A45
         BIT   L012A6D
         BMI   L01296A
         LDA   #$0001
         STA   $40
         STZ   $3C
L01296A  BRL   L01249E

L01296D  STZ   L012A33
         STZ   L012A33+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L012A2D
         BCS   L012997
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L012A2D
         STA   L012A37
         STA   L012A47
         CLC
         RTS

L012997  SEC
         RTS

L012999  PHA
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L012A45
         PLA
         LDX   #$0000
         JSL   L017D37
         BRL   L01249E

L0129AF  PEA   ^L0198DF
         PEA   L0198DF
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetWTitle
         JSR   L013D4D
         RTS

*--- filterProcPtr
* Stack:
*  word  space for result
*  long  pointer to DirEntry

* It opens BIN/PIC of $8000
* It opens PNT/0000 and PNT/0002
* It could handle DG files, no?

L0129C6  PHB
         PHD
         PHK
         PLB
         LDA   L01968D	; get my DP
         TCD
         LDA   $07,S	; get DirEntry ptr
         STA   $0A
         LDA   $09,S
         STA   $0C
         LDY   #$0010	; file_type
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0006
         BEQ   L012A03
         CMP   #$00C0
         BEQ   L0129F2
         CMP   #$00C1
         BEQ   L012A03
L0129ED  LDA   #$0000	; return noDisplay
         BRA   L012A14

*--- check ayx file type of $C0

L0129F2  LDY   #$001F	; aux_type
         LDA   [$0A],Y	; 0000
         BEQ   L0129FE
	 cmp   #$8005	; AV 202004 - for DreamGrafix
	 beq   L0129FE
         CMP   #$0002
         BNE   L0129ED
L0129FE  LDA   #$0002	; return displaySelect
         BRA   L012A14
	 
L012A03  LDY   #$0013	; blocks_used
         LDA   [$0A],Y
         CMP   #$0041
         BEQ   L0129FE
         CMP   #$007F
         BNE   L0129ED
         BRA   L0129FE

L012A14  STA   $0B,S	; put result
         PLD
         PLB
         LDA   $00,S	; move stack 4 bytes
         STA   $04,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         RTL

L012A23  ADRL  $00000000
L012A27  DW    $0000

L012A29  DB    $03	  ; the three filetypes that GS/Paint can read
         HEX   06C0C1

L012A2D  DW    $0000      ;  ref num
         ADRL  L0198EF    ;  path name
L012A33  ADRL  $00000000  ;  reserved

L012A37  DW    $0000      ;  ref num
L012A39  ADRL  $00000000  ;  buffer ptr
L012A3D  ADRL  $00007D00  ;  request count
         ADRL  $00000000  ;  transfer count

L012A45  DW    $0000      ;  ref num

L012A47  DW    $0000      ;  ref num
L012A49  ADRL  $00000000  ;  position

L012A4D  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L012A6D  DW    $0000

L012A6F  JSL   L018744
L012A73  LDA   $40
         BEQ   L012A87
         JSR   L013172
         LDA   L019687
         STA   L01319B
         BRL   L012B03
L012A83  JSL   L018744
L012A87  JSR   L013172
         STZ   L013121
         STZ   L013139
         STZ   L013151
         LDA   L019687
         CMP   #$0000
         BEQ   L012AAB
         CMP   #$0001
         BEQ   L012AB6
         STA   L01319B
         LDA   #$0001
         STA   L013151
         BRA   L012ABF
L012AAB  STA   L01319B
         LDA   #$0001
         STA   L013121
         BRA   L012ABF
L012AB6  STA   L01319B
         LDA   #$0001
         STA   L013139
L012ABF  JSL   L018752
         PEA   $0019
         PEA   $001E
         PEA   ^L0105E2
         PEA   L0105E2
         PEA   ^L0198DF
         PEA   L0198DF
         PEA   $000F
         PEA   ^L012FA3
         PEA   L012FA3
         PEA   ^L012F2B
         PEA   L012F2B
         PEA   ^L0198D9
         PEA   L0198D9
         _SFPPutFile
         JSL   L010D82
         _ShowCursor
         LDA   L0198D9
         BNE   L012B03
         CLC
         RTS

L012B03  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L01319B
         STA   L019687
         ASL
         TAX
         JMP   (L012B1B,X)

L012B1B  DA    L012B21
         DA    L012B33
         DA    L012B42
L012B21  LDA   #$00C0
         STA   L0131AB
         STZ   L0131AD
         LDA   #$0002
         STA   L0131AD
         BRL   L012B99
L012B33  LDA   #$00C0
         STA   L0131AB
         STZ   L0131AD
         STZ   L0131AD+2
         BRL   L012DDD
L012B42  LDA   #$00C1
         STA   L0131AB
         STZ   L0131AD
         STZ   L0131AD+2
         BRL   L012D7C
L012B51  JSL   GSOS
         DW    $0017      ; GetMark
         ADRL  L0131D1
         BCC   L012B60
         BRL   L013159
L012B60  JSL   GSOS
         DW    $0018      ; SetEOF
         ADRL  L0131D1
         BCC   L012B6F
         BRL   L013159
L012B6F  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0131CF
         LDA   #$0001
         STA   $40
         STZ   $3C
         JSL   L018752
         PEA   ^L0198DF
         PEA   L0198DF
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetWTitle
         SEC
         RTS

L012B99  JSR   L012EB2
         BCC   L012BA1
         BRL   L013159
L012BA1  JSR   L012D1A
         BCC   L012BA9
         BRL   L013159
L012BA9  LDA   #$9E00
         STA   L0131C3
         LDA   #$00E1
         STA   L0131C3+2
         LDA   #$0200
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012BCA
         BRL   L013159
L012BCA  JSR   L012D3C
         BCC   L012BD2
         BRL   L013159
L012BD2  LDA   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         LDA   #$018C
         STA   [$0A]
         STA   L012D78
         LDA   #$0002
         STA   L012D7A
         LDA   $A4
         STA   L0131C3
         LDA   $A6
         STA   L0131C3+2
         LDA   L019976
         STA   L01319D
         LDA   L019978
         STA   L01319F
L012C00  LDA   #$00A0
         STA   L013199
         LDA   L01319D
         STA   L013195
         LDA   L01319F
         STA   L013197
         PHA
         PEA   ^L013195
         PEA   L013195
         PEA   ^L013199
         PEA   L013199
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         PEA   $FFFF
         _PackBytes
         PLA
         STA   L0131C7
         LDY   L012D7A
         STA   [$0A],Y
         INY
         INY
         LDA   #$0000
         STA   [$0A],Y
         INY
         INY
         STY   L012D7A
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012C53
         BRL   L013159
L012C53  CLC
         LDA   L01319D
         ADC   #$00A0
         STA   L01319D
         DEC   L012D78
         BNE   L012C00
         JSL   GSOS
         DW    $0017      ; GetMark
         ADRL  L0131D1
         BCC   L012C71
         BRL   L013159
L012C71  LDA   L0131D3
         STA   L012D5E
         LDA   L0131D3+2
         STA   L012D5E+2
         STZ   L0131D3
         STZ   L0131D3+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L0131D1
         BCC   L012C92
         BRL   L013159
L012C92  JSR   L012D1A
         BCC   L012C9A
         BRL   L013159
L012C9A  LDA   #$020F
         STA   L0131D3
         STZ   L0131D3+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L0131D1
         BCC   L012CB2
         BRL   L013159
L012CB2  JSR   L012D3C
         BCC   L012CBA
         BRL   L013159
L012CBA  LDA   L012D5E
         STA   L0131D3
         LDA   L012D5E+2
         STA   L0131D3+2
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L0131D1
         BCC   L012CD5
         BRL   L013159
L012CD5  LDA   #L012D6D
         STA   L0131C3
         LDA   #^L012D6D
         STA   L0131C3+2
         LDA   #$000B
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012CF6
         BRL   L013159
L012CF6  LDA   #L019C74
         STA   L0131C3
         LDA   #^L019C74
         STA   L0131C3+2
         LDA   #$0200
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012D17
         BRL   L013159
L012D17  BRL   L012B51
L012D1A  LDA   #L012D5E
         STA   L0131C3
         LDA   #^L012D5E
         STA   L0131C3+2
         LDA   #$000F
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCS   L012D3A
         CLC
         RTS

L012D3A  SEC
         RTS

L012D3C  LDA   L019984
         STA   L0131C3
         LDA   L019986
         STA   L0131C3+2
         LDA   #$0632
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCS   L012D5C
         CLC
         RTS

L012D5C  SEC
         RTS

L012D5E  ADRL  $00000000
         STR   'MAIN'
         DB    $00
         DB    $00
         DB    $40
         DB    $01
         DB    $10
         DB    $00
L012D6D  DB    $0B
         DB    $02
         DB    $00
         DB    $00
         STR   'PATS'
         DB    $10
         DB    $00
L012D78  DW    $0000
L012D7A  DW    $0000
L012D7C  JSR   L012EB2
         BCC   L012D84
         BRL   L013159
L012D84  LDA   L019976
         STA   L0131C3
         LDA   L019978
         STA   L0131C3+2
         LDA   #$7D00
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012DA5
         BRL   L013159
L012DA5  PEA   $0000
         _SetAllSCBs
         LDA   #$0300
         STA   L0131C7
         STZ   L0131C7+2
         LDA   #$9D00
         STA   L0131C3
         LDA   #$00E1
         STA   L0131C3+2
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012DD3
         BRL   L013159
L012DD3  _InitPalette
         BRL   L012B51
L012DDD  JSR   L012EB2
         BCC   L012DE5
         BRL   L013159
L012DE5  PEA   $0000
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         _GetColorTable
         LDA   $74
         DEC
         EOR   #$000F
         LDY   #$0020
         STA   [$A4],Y
         LDA   $A4
         STA   L0131C3
         LDA   $A6
         STA   L0131C3+2
         LDA   #$0022
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012E1F
         BRL   L013159
L012E1F  LDA   #L019C74
         STA   L0131C3
         LDA   #^L019C74
         STA   L0131C3+2
         LDA   #$0200
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012E40
         BRL   L013159
L012E40  LDA   $A4
         STA   L0131C3
         LDA   $A6
         STA   L0131C3+2
         LDA   L019976
         STA   L01319D
         LDA   L019978
         STA   L01319F
         LDY   $F0
L012E58  PHY
         LDA   #$00A0
         STA   L013199
         LDA   L01319D
         STA   L013195
         LDA   L01319F
         STA   L013197
L012E6B  PHA
         PEA   ^L013195
         PEA   L013195
         PEA   ^L013199
         PEA   L013199
         LDA   $A6
         PHA
         LDA   $A4
         PHA
         PEA   $00A0
         _PackBytes
         PLA
         STA   L0131C7
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0131C1
         BCC   L012E9C
         PLY
         BRL   L013159
L012E9C  LDA   L013199
         BNE   L012E6B
         CLC
         LDA   L01319D
         ADC   #$00A0
         STA   L01319D
         PLY
         DEY
         BNE   L012E58
         BRL   L012B51
L012EB2  JSL   GSOS
         DW    $0001      ; Create
         ADRL  L0131A5
         BCC   L012EC6
         CMP   #$0047
         BEQ   L012EC6
         BRL   L012F29
L012EC6  JSL   GSOS
         DW    $0006      ; GetFileInfo
         ADRL  L0131D7
         BCC   L012ED5
         BRL   L012F29
L012ED5  LDA   L0131AB
         STA   L0131DD
         LDA   L0131AD
         STA   L0131DF
         LDA   L0131AD+2
         STA   L0131DF+2
         LDA   #$00C3
         STA   L0131DB
         JSL   GSOS
         DW    $0005      ; SetFileInfo
         ADRL  L0131D7
         BCC   L012EFC
         BRL   L012F29
L012EFC  STZ   L0131BD
         STZ   L0131BD+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L0131B7
         BCS   L012F29
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L0131B7
         STA   L0131C1
         STA   L0131D1
         STA   L0131D1
         CLC
         RTS

L012F29  SEC
         RTS

*--- dialogHookPtr

L012F2B  PHB
         PHD
         PHK
         PLB
         LDA   L01968D
         TCD
         LDA   $0B,S
         STA   $0A
         LDA   $0D,S
         STA   $0C
         LDA   $07,S
         STA   $0E
         LDA   $09,S
         STA   $10
         LDA   [$0E]
         STA   L0131A1
         CMP   #$000D
         BCC   L012F94
         LDX   #$000E
         LDA   L0131A1
         CMP   #$000D
         BEQ   L012F59
         DEX
L012F59  STX   L0131A3
         PHA
         LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   L0131A1
         PHA
         _GetDItemValue
         PLA
         BNE   L012F8F
         SEC
         LDA   L0131A1
         SBC   #$000D
         STA   L01319B
         PEA   $0001
         LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   L0131A1
         PHA
         _SetDItemValue
L012F8F  LDA   #$0000
         STA   [$0E]
L012F94  PLD
         PLB
         LDA   $00,S
         STA   $08,S
         LDA   $02,S
         STA   $0A,S
         PLA
         PLA
         PLA
         PLA
         RTL

*--- Dialog Template

L012FA3  DW    $0000      ; dtBoundsRect
         DW    $0000
         DW    $0098
         DW    $010E
         DW    $FFFF      ; dtVisible
         ADRL  $00000000  ; dtRefCon
         ADRL  L012FF1    ; itemPtr
         ADRL  L013009    ; itemPtr
         ADRL  L013021    ; itemPtr
         ADRL  L013039    ; itemPtr
         ADRL  L013051    ; itemPtr
         ADRL  L013069    ; itemPtr
         ADRL  L013081    ; itemPtr
         ADRL  L013099    ; itemPtr
         ADRL  L0130B1    ; itemPtr
         ADRL  L0130C9    ; itemPtr
         ADRL  L0130E1    ; itemPtr
         ADRL  L0130F9    ; itemPtr
         ADRL  L013111    ; itemPtr
         ADRL  L013129    ; itemPtr
         ADRL  L013141    ; itemPtr
         ADRL  $00000000  ; Terminator
L012FF1  DW    $0001      ; Item ID
         DW    $005D      ; Item rect
         DW    $00A5
         DW    $0069
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L0104A5    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013009  DW    $0002      ; Item ID
         DW    $0036      ; Item rect
         DW    $00A5
         DW    $0042
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L01049E    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013021  DW    $0003      ; Item ID
         DW    $0048      ; Item rect
         DW    $00A5
         DW    $0054
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L010490    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013039  DW    $0004      ; Item ID
         DW    $000F      ; Item rect
         DW    $00A5
         DW    $001B
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L010488    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013051  DW    $0005      ; Item ID
         DW    $006F      ; Item rect
         DW    $00A5
         DW    $007B
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L010472    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013069  DW    $0006      ; Item ID
         DW    $001A      ; Item rect
         DW    $0090
         DW    $0058
         DW    $009D
         DW    $000D      ; Dialog scroll bar
         ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0003      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013081  DW    $0007      ; Item ID
         DW    $0000      ; Item rect
         DW    $000A
         DW    $000C
         DW    $0109
         DW    $0014      ; User item
         ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013099  DW    $0008      ; Item ID
         DW    $001A      ; Item rect
         DW    $000A
         DW    $0058
         DW    $0091
         DW    $0014      ; User item
         ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0130B1  DW    $0009      ; Item ID
         DW    $0058      ; Item rect
         DW    $000A
         DW    $0064
         DW    $00AA
         DW    $8014      ; User item
         ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0130C9  DW    $000A      ; Item ID
         DW    $0064      ; Item rect
         DW    $000A
         DW    $0076
         DW    $009D
         DW    $0011      ; Editable text
         ADRL  L0198DF    ; Item descriptor
         DW    $000F      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0130E1  DW    $000B      ; Item ID
         DW    $000C      ; Item rect
         DW    $000A
         DW    $0016
         DW    $00A0
         DW    $800F      ; Static text
         ADRL  L0104AC    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0130F9  DW    $000C      ; Item ID
         DW    $0021      ; Item rect
         DW    $00A5
         DW    $002D
         DW    $0109
         DW    $000A      ; Std button
         ADRL  L0104BD    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013111  DW    $000D      ; Item ID
         DW    $008B      ; Item rect
         DW    $000A
         DW    $0095
         DW    $006E
         DW    $000C      ; Std radio button
         ADRL  L01061A    ; Item descriptor
L013121  DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013129  DW    $000E      ; Item ID
         DW    $007F      ; Item rect
         DW    $004B
         DW    $0089
         DW    $00B9
         DW    $000C      ; Std radio button
         ADRL  L01060C    ; Item descriptor
L013139  DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013141  DW    $000F      ; Item ID
         DW    $008B      ; Item rect
         DW    $0091
         DW    $0095
         DW    $0109
         DW    $000C      ; Std radio button
         ADRL  L0105FE    ; Item descriptor
L013151  DW    $0000      ; Item value
         DW    $0001      ; Bit flag
         ADRL  $00000000  ; Ptr to color table

L013159  PHA
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0131CF
         PLA
         LDX   #$0000
         JSL   L017D37
         JSL   L018752
         CLC
         RTS

L013172  PHA
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
         RTS

L013195  DW    $0000
L013197  DW    $0000
L013199  DW    $0000
L01319B  DW    $0000
L01319D  DW    $0000
L01319F  DW    $0000
L0131A1  DW    $0000
L0131A3  DW    $0000
L0131A5  ADRL  L0198DF    ;  file name
         DW    $00C3      ;  access
L0131AB  DW    $0000      ;  file type
L0131AD  ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    4          ;  creation date
L0131B7  DW    $0000      ;  ref num
         ADRL  L0198DF    ;  path name
L0131BD  ADRL  $00000000  ;  reserved
L0131C1  DW    $0000      ;  ref num
L0131C3  ADRL  $00000000  ;  buffer ptr
L0131C7  ADRL  $00007D00  ;  request count
         ADRL  $00000000  ;  transfer count
L0131CF  DW    $0000      ;  ref num
L0131D1  DW    $0000      ;  ref num
L0131D3  ADRL  $00000000  ;  position
L0131D7  ADRL  L0198DF    ;  file name
L0131DB  DW    $0000      ;  access
L0131DD  DW    $0000      ;  file type
L0131DF  ADRL  $00000000  ;  aux type
         DS    2          ;  (null field)
         DS    4          ;  creation date
         DS    4          ;  modification date
         ADRL  $00000000  ;  blocks used

L0131F1  JSL   L018744
         JSL   L018752
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HLock
         LDY   #$0000
         LDA   [$F4],Y
         STA   $0A
         INY
         INY
         LDA   [$F4],Y
         STA   $0C
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HUnlock
         PLA
         STA   L01341D
         CMP   #$0001
         BEQ   L013232
         BRL   L0132B2
L013232  PHA
         PHA
         _MaxBlock
         PLA
         PLA
         CMP   #$0001
         BCS   L0132B2
         PHA
         PEA   ^L01341F
         PEA   L01341F
         PEA   $0000
         PEA   $0000
         _Alert
         JSL   L010D82
         PLA
         CMP   #$0003
         BNE   L013261
         RTS

L013261  STA   L01341B
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _PrDefault
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HLock
         LDA   [$F4]
         STA   $0A
         LDY   #$0002
         LDA   [$F4],Y
         STA   $0C
         LDY   #$0056
         LDA   #$0000
         STA   [$0A],Y
         LDA   L01341B
         CMP   #$0001
         BNE   L0132A3
         LDY   #$0018
         LDA   [$0A],Y
         ORA   #$0020
         STA   [$0A],Y
L0132A3  LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HUnlock
         BRA   L0132C8
L0132B2  PHA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _PrJobDialog
         JSL   L010D82
         PLA
         BNE   L0132C8
         RTS

L0132C8  LDA   L01341D
         CMP   #$0001
         BNE   L013310
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HLock
         LDY   #$0000
         LDA   [$F4],Y
         STA   $0A
         INY
         INY
         LDA   [$F4],Y
         STA   $0C
         LDY   #$0018
         LDA   [$0A],Y
         AND   #$FFBE
         STA   [$0A],Y
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _HUnlock
         PHA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _PrValidate
         PLA
L013310  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         PHA
         PHA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         LDA   #$0000
         PHA
         PHA
         _PrOpenDoc
         CMP   #$0000
         BEQ   L013345
         PLA
         PLA
         LDA   #$0002
         LDX   #$0001
         JSL   L017D37
         BRL   L0133AD
L013345  LDA   $01,S
         STA   L0133C5
         LDA   $03,S
         STA   L0133C7
         LDA   #$0000
         PHA
         PHA
         _PrOpenPage
         PEA   ^L019825
         PEA   L019825
         PEA   ^L01997C
         PEA   L01997C
         LDA   #$0000
         PHA
         PHA
         PEA   $0000
         _PPToPort
         LDA   L0133C7
         PHA
         LDA   L0133C5
         PHA
         _PrClosePage
         LDA   L0133C7
         PHA
         LDA   L0133C5
         PHA
         _PrCloseDoc
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _PrPicFile
L0133AD  PHA
         PEA   $000A
         PEA   $0000
         _FlushEvents
         PLA
         JSL   L010D82
         JSL   L018752
         RTS

L0133C5  DW    $0000
L0133C7  DW    $0000

L0133C9  JSL   L018744
         PHA
         PHA
         _MaxBlock
         PLA
         PLA
         CMP   #$0001
         BCS   L0133E8
         LDX   #$0002
         LDA   #$0201
         JSL   L017D37
         RTS

L0133E8  PHA
         _PrChoosePrinter
         PLA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _PrDefault
         JSL   L010D82
         RTS

L013403  JSL   L018744
         PHA
         LDA   $F6
         PHA
         LDA   $F4
         PHA
         _PrStlDialog
         PLA
         JSL   L010D82
         RTS

L01341B  DW    $0000
L01341D  DW    $0000
L01341F  DW    $0028      ; Alert rect
         DW    $003C
         DW    $006E
         DW    $012C
         DW    $0001      ; Alert ID
         HEX   80         ; First stage byte
         HEX   80         ; Second stage byte
         HEX   80         ; Third stage byte
         HEX   80         ; fourth stage byte
         ADRL  L013441    ; Ptr to item template
         ADRL  L013459    ; Ptr to item template
         ADRL  L013471    ; Ptr to item template
         ADRL  L013489    ; Ptr to item template
         ADRL  $00000000
L013441  DW    $0001      ; Item ID
         DW    $002E      ; Item rect
         DW    $0007
         DW    $003C
         DW    $004D
         DW    $000A      ; Std button
         ADRL  L01047A    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013459  DW    $0002      ; Item ID
         DW    $002E      ; Item rect
         DW    $0055
         DW    $003C
         DW    $009B
         DW    $000A      ; Std button
         ADRL  L01047E    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013471  DW    $0003      ; Item ID
         DW    $002E      ; Item rect
         DW    $00A3
         DW    $003C
         DW    $00E9
         DW    $000A      ; Std button
         ADRL  L010472    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013489  DW    $0004      ; Item ID
         DW    $0014      ; Item rect
         DW    $0005
         DW    $0022
         DW    $00FA
         DW    $800F      ; Static text
         ADRL  L0105C5    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L0134A1  RTS
L0134A2  RTS

L0134A3  SEP   #$30
         LDX   L0106D3
L0134A8  LDA   L0106D3,X
         STA   L0135ED,X
         DEX
         BPL   L0134A8
         BRA   L0134CC
L0134B3  SEP   #$30
         LDY   L0135ED
         LDA   L0135ED,Y
         INC
         STA   L0135ED,Y
         CMP   #$3A
         BNE   L0134CC
         LDA   #$30
         STA   L0135ED,Y
         REP   #$30
         BRA   L0134E0
L0134CC  REP   #$30
         JSL   GSOS
         DW    $0001      ; Create
         ADRL  L01360C
         BCC   L0134E0
         CMP   #$0047
         BEQ   L0134B3
         RTS

L0134E0  STZ   L013622
         STZ   L013622+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L01361C
         BCC   L0134F5
         BRL   L013513
L0134F5  _HideCursor
         LDA   L01361C
         STA   L013626
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L013626
         _ShowCursor
L013513  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L013634
         RTS

L01351E  ENT
         PHB
         PHK
         PLB
         LDA   L0196C9
         AND   #$0100
         BNE   L01352C
         PLB
         CLC
         RTL

L01352C  PHA
         PEA   $002A
         _ReadBParam
         PLA
         CMP   #$0008
         BCC   L013540
         LDA   #$0000
L013540  ASL
         ASL
         TAX
         LDA   L01356D,X
         STA   $0A
         LDA   L01356D+2,X
         STA   $0C
         LDY   #$0008
L013550  LDA   [$0A],Y
         CMP   L0196BD
         BEQ   L013560
         DEY
         DEY
         DEY
         DEY
         BPL   L013550
         PLB
         CLC
         RTL

L013560  INY
         INY
         LDA   [$0A],Y
         STA   L013567+1
L013567  JSR   $1000
         PLB
         SEC
         RTL

L01356D  ADRL  L01358D
         ADRL  L013599
         ADRL  L0135A5
         ADRL  L0135B1
         ADRL  L0135BD
         ADRL  L0135C9
         ADRL  L0135D5
         ADRL  L0135E1
L01358D  DA    $0033      ; DW EVERY 2
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L013599  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135A5  DA    $0033
         DA    L0134A3
         DA    $0027
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135B1  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135BD  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135C9  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135D5  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135E1  DA    $0033
         DA    L0134A3
         DA    $0024
         DA    L0134A1
         DA    $0034
         DA    L0134A2
L0135ED  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01360C  ADRL  L0135ED    ;  file name
         DW    $00C3      ;  access
         DW    $00C1      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    2          ;  creation date
L01361C  DW    $0000      ;  ref num
         ADRL  L0135ED    ;  path name
L013622  ADRL  $00000000  ;  reserved
L013626  DW    $0000      ;  ref num
         ADRL  $00E12000  ;  buffer ptr
         ADRL  $00008000  ;  request count
         ADRL  $00000000  ;  transfer count
L013634  DW    $0000      ;  ref num
L013636  LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDY   #$459C
         LDA   #$FFFF
L013650  STA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L013650
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDY   #$459C
L01366F  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L01366F
         LDA   $66
         STA   L013938
         LDA   $68
         STA   L01393A
         LDA   $6A
         STA   L01393C
         LDA   $6C
         STA   L01393E
         SEC
         LDA   $6A
         SBC   $66
         STA   L013940
         SEC
         LDA   $6C
         SBC   $68
         STA   L013942
         SEC
         LDA   $6A
         SBC   $66
         LSR
         CLC
         ADC   $66
         STA   L01394C
         SEC
         LDA   $6C
         SBC   $68
         LSR
         CLC
         ADC   $68
         STA   L01394E
         SEC
         LDA   $6C
         SBC   L01394E
         PHA
         SEC
         LDA   L01394C
         SBC   $01,S
         STA   $01,S
         SEC
         LDA   $66
         SBC   L01394C
         EOR   #$FFFF
         INC
         PHA
         SEC
         LDA   L01394E
         SBC   $01,S
         STA   $68
         PLA
         PLA
         STA   $66
         LDA   #$0085
         CMP   L013942
         BCS   L0136E4
         STA   L013942
L0136E4  LDA   #$010C
         CMP   L013940
         BCS   L0136EF
         STA   L013940
L0136EF  CLC
         LDA   $66
         ADC   L013942
         STA   $6A
         CLC
         LDA   $68
         ADC   L013940
         STA   $6C
         LDA   $66
         SEC
         SBC   $56
         BVS   L013709
         EOR   #$8000
L013709  BMI   L013715
         LDA   $56
         STA   $66
         CLC
         ADC   L013942
         STA   $6A
L013715  LDA   $68
         SEC
         SBC   $58
         BVS   L01371F
         EOR   #$8000
L01371F  BMI   L01372B
         LDA   $58
         STA   $68
         CLC
         ADC   L013940
         STA   $6C
L01372B  LDA   $6A
         SEC
         SBC   $5A
         BEQ   L013743
         BVS   L013737
         EOR   #$8000
L013737  BPL   L013743
         LDA   $5A
         STA   $6A
         SEC
         SBC   L013942
         STA   $66
L013743  LDA   $6C
         SEC
         SBC   $5C
         BEQ   L01375B
         BVS   L01374F
         EOR   #$8000
L01374F  BPL   L01375B
         LDA   $5C
         STA   $6C
         SEC
         SBC   L013940
         STA   $68
L01375B  DEC   L013940
         DEC   L013942
         LDY   L013940
L013764  LDX   L013942
L013767  PHY
         PHX
         JSR   L0138CC
         LDA   $03,S
         TAX
         SEC
         LDA   L013942
         SBC   $01,S
         TAY
         JSR   L0138F7
         PLX
         PLY
         DEX
         BPL   L013767
         DEY
         BPL   L013764
         JSR   L013896
         JSR   L013C57
         JSR   L011953
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         JSR   L014117
         JSR   L013C4D
         LDA   #$0009
         STA   $46
         LDA   $66
         STA   L019761
         LDA   $68
         STA   L019763
         LDA   $6A
         STA   L019765
         LDA   $6C
         STA   L019767
         RTS

L0137B7  LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDY   #$459C
L0137CE  LDA   [$0E],Y
         PHA
         LDA   [$0A],Y
         STA   [$0E],Y
         PLA
         STA   [$0A],Y
         DEY
         DEY
         BPL   L0137CE
         LDA   L013938
         STA   L013944
         LDA   L01393A
         STA   L013946
         LDA   L01393C
         STA   L013948
         LDA   L01393E
         STA   L01394A
         LDA   $66
         STA   L013938
         LDA   $68
         STA   L01393A
         LDA   $6A
         STA   L01393C
         LDA   $6C
         STA   L01393E
         LDA   L013944
         STA   $66
         LDA   L013946
         STA   $68
         LDA   L013948
         STA   $6A
         LDA   L01394A
         STA   $6C
         JSR   L013C57
         JSR   L011953
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         JSR   L013C4D
         RTS

L013833  LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDY   #$459C
         LDA   #$FFFF
L01384D  STA   [$0E],Y
         DEY
         DEY
         BPL   L01384D
         SEC
         LDA   $6C
         SBC   $68
         DEC
         STA   L013942
         SEC
         LDA   $6A
         SBC   $66
         DEC
         TAY
L013863  LDX   L013942
L013866  PHY
         PHX
         JSR   L0138CC
         LDA   $03,S
         TAY
         SEC
         LDA   L013942
         SBC   $01,S
         TAX
         JSR   L0138F7
         PLX
         PLY
         DEX
         BPL   L013866
         DEY
         BPL   L013863
         JSR   L013896
         LDA   #$0007
         STA   $46
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         RTS

L013896  LDA   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDY   #$459C
L0138AD  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0138AD
         LDA   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         LDY   #$459C
         LDA   #$0000
L0138C5  STA   [$0A],Y
         DEY
         DEY
         BPL   L0138C5
         RTS

L0138CC  TYA
         JSR   L018607
         CLC
         ADC   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         TXA
         LSR
         TAY
         LDA   [$0A],Y
         XBA
         PHA
         TXA
         LSR
         PLA
         BCS   L0138EC
         AND   #$F000
         BRA   L0138F3
L0138EC  AND   #$0F00
         ASL
         ASL
         ASL
         ASL
L0138F3  STA   L013936
         RTS

L0138F7  TYA
         JSR   L018607
         CLC
         ADC   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         TXA
         LSR
         TAY
         LDA   [$0A],Y
         XBA
         STA   L013934
         PHY
         TXA
         LSR
         BCS   L01391F
         LDA   #$F000
         TRB   L013934
         LDA   L013936
         BRA   L01392C
L01391F  LDA   #$0F00
         TRB   L013934
         LDA   L013936
         LSR
         LSR
         LSR
         LSR
L01392C  ORA   L013934
         PLY
         XBA
         STA   [$0A],Y
         RTS

L013934  DW    $0000
L013936  DW    $0000
L013938  DW    $0000
L01393A  DW    $0000
L01393C  DW    $0000
L01393E  DW    $0000
L013940  DW    $0000
L013942  DW    $0000
L013944  DW    $0000
L013946  DW    $0000
L013948  DW    $0000
L01394A  DW    $0000
L01394C  DW    $0000
L01394E  DW    $0000
L013950  LDA   L0196C5
         STA   L0139E2
         LDA   L0196C7
         STA   L0139E4
         PEA   ^L0139E2
         PEA   L0139E2
         _GlobalToLocal
         LDA   L0139E2
         STA   L0139DE
         LDA   L0139E4
         STA   L0139E0
         RTS

L013976  JSR   L0139CE
         SEC
         LDA   L0196C7
         SBC   #$002E
         CLC
         ADC   $58
         CLC
         ADC   #$0004
         AND   #$FFF8
         SEC
         SBC   $58
         CLC
         ADC   #$002E
         STA   L0196C7
         SEC
         LDA   L0196C5
         SBC   #$001C
         CLC
         ADC   $56
         CLC
         ADC   #$0004
         AND   #$FFF8
         SEC
         SBC   $56
         CLC
         ADC   #$001C
         STA   L0196C5
         RTS

L0139B0  JSR   L0139CE
         CLC
         LDA   L0196C7
         ADC   #$0004
         AND   #$FFF8
         STA   L0196C7
         CLC
         LDA   L0196C5
         ADC   #$0004
         AND   #$FFF8
         STA   L0196C5
         RTS

L0139CE  LDA   $4A
         BNE   L0139D4
         PLA
         RTS

L0139D4  LDA   $76
         DEC
         ASL
         TAX
         JMP   (L0139E6,X)

L0139DC  PLA
L0139DD  RTS

L0139DE  DW    $0000
L0139E0  DW    $0000
L0139E2  DW    $0000
L0139E4  DW    $0000
L0139E6  DA    L0139DD
         DA    L0139DC
         DA    L0139DC
         DA    L0139DC
         DA    L0139DD
         DA    L0139DD
         DA    L0139DD
         DA    L0139DD
         DA    L0139DC
         DA    L0139DD
         DA    L0139DD
         DA    L0139DD
         DA    L0139DC
         DA    L0139DC
         DA    L0139DC
         DA    L0139DD
         DA    L0139DD
         DA    L0139DD
         DA    L0139DC
         DA    L0139DD
L013A0E  STZ   L019741
         LDA   $36
         CMP   #$0002
         BNE   L013A3D
         PEA   $0114
         SEC
         LDA   $5A
         SBC   $56
         STA   L013B91
         SEC
         LDA   $6C
         SBC   $68
         CMP   L013B91
         BCS   L013A36
         _EnableMItem
         BRA   L013A3D
L013A36  _DisableMItem
L013A3D  PEA   ^L0196BB
         PEA   L0196BB
         LDA   #$0000
         PHA
         PHA
         _MenuSelect
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   L0196CB
         BNE   L013A62
         RTS

L013A62  LDA   L0196CB
         CMP   #$0100
         BCS   L013A6E
         JSR   L011AF0
         RTS

L013A6E  AND   #$00FF
         ASL
         TAX
         JSR   (L013A85,X)
         PEA   $0000
         LDA   L0196CD
         PHA
         _HiliteMenu
         RTS

L013A85  DA    L011A2C
         DA    L0122A8
         DA    L013D25
         DA    L012427
         DA    L013DC6
         DA    L012A6F
         DA    L012A83
         DA    L013C61
         DA    L0133C9
         DA    L013403
         DA    L0131F1
         DA    L013DC6
         DA    L013B66
         DA    L013B66
         DA    L013B66
         DA    L013B66
         DA    L013B66
         DA    L018922
         DA    L013833
         DA    L01898C
         DA    L013636
         DA    L013B17
         DA    L013F7B
         DA    L013B11
         DA    L013B0B
         DA    L013AD7
         DA    L013ADD
         DA    L013AEF
         DA    L013AE9
         DA    L013AE9
         DA    L013B05
         DA    L010909
         DA    L013AD1
         DA    L013AE3
         DA    L011B55
         DA    L013B2A
         DA    L013B2A
         DA    L013B2A
L013AD1  LDA   #$0003
         JMP   L01080A

L013AD7  LDA   #$0004
         JMP   L01080A

L013ADD  LDA   #$0005
         JMP   L01080A

L013AE3  LDA   #$0007
         JMP   L01080A

L013AE9  LDA   #$0008
         JMP   L01080A

L013AEF  LDA   #$0006
         JSR   L01080A
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JMP   L014897

L013B05  LDA   #$0009
         JMP   L01080A

L013B0B  LDA   #$000A
         JMP   L01080A

L013B11  LDA   #$000C
         JMP   L01080A

L013B17  LDA   $4A
         EOR   #$FFFF
         STA   $4A
         PHA
         PEA   $0115
         _CheckMItem
         RTS

L013B2A  SEC
         LDA   L0196CB
         SBC   #$0123
         CMP   $7C
         BNE   L013B36
         RTS

L013B36  PEA   $0000
         CLC
         LDA   $7C
         ADC   #$0123
         PHA
         _CheckMItem
         SEC
         LDA   L0196CB
         SBC   #$0123
         STA   $7C
         LDA   $48
         BEQ   L013B57
         JSR   L015CB0
L013B57  PEA   $0001
         LDA   L0196CB
         PHA
         _CheckMItem
         RTS

L013B66  PHA
         SEC
         LDA   L0196CB
         SBC   #$010C
         INC
         PHA
         _SystemEdit
         PLA
         BEQ   L013B7B
         RTS

L013B7B  SEC
         LDA   L0196CB
         SBC   #$010C
         ASL
         TAX
         JMP   (L013B87,X)

L013B87  DA    L013B93
         DA    L01439B
         DA    L01439B
         DA    L014480
         DA    L0143F4
L013B91  DW    $0000
L013B93  LDA   $36
         BEQ   L013B9B
         BMI   L013BF1
         BRA   L013BA6
L013B9B  LDA   $48
         BEQ   L013BA2
         JSR   L015981
L013BA2  JMPL  L011995

L013BA6  LDA   $46
         CMP   #$0001
         BNE   L013BB1
         JMPL  L013C12

L013BB1  CMP   #$0004
         BNE   L013BBA
         JMPL  L018922

L013BBA  CMP   #$0007
         BNE   L013BC3
         JMPL  L013833

L013BC3  CMP   #$0008
         BNE   L013BCC
         JMPL  L01898C

L013BCC  CMP   #$0009
         BNE   L013BD5
         JMPL  L0137B7

L013BD5  CMP   #$000B
         BNE   L013BDE
         JMPL  L017BBA

L013BDE  JSR   L013C57
         LDA   $46
         CMP   #$0002
         BEQ   L013BED
         CMP   #$0003
         BNE   L013BF0
L013BED  JSR   L011953
L013BF0  RTS

L013BF1  LDA   $46
         CMP   #$0002
         BNE   L013C01
         JMPL  L014480

         CMP   #$0003
         BEQ   L013C0E
L013C01  LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
L013C0E  JMPL  L013C4D

L013C12  LDA   L019769
         STA   L0196C5
         LDA   L01976B
         STA   L0196C7
         LDA   $66
         STA   L019769
         LDA   $68
         STA   L01976B
         LDA   $6A
         STA   L01976D
         LDA   $6C
         STA   L01976F
         JSR   L01618F
         RTS

L013C36  LDA   $3E
         BNE   L013C4C
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L013C57
         STZ   $36
L013C4C  RTS

L013C4D  LDA   #$0001
         JSR   L018A48
         JSR   L018E07
         RTS

L013C57  JSR   L018E21
         LDA   #$0000
         JSR   L018A48
         RTS

L013C61  JSL   L018744
         LDA   L01050F
         STA   L01971F
         LDA   L010511
         STA   L019721
         LDA   L010513
         STA   L019723
         LDA   L010515
         STA   L019725
         LDA   #L010517
         STA   L019729
         LDA   #^L010517
         STA   L019729+2
         PHA
         PEA   ^L0196CF
         PEA   L0196CF
         PEA   $0000
         PEA   $0000
         _Alert
         JSL   L010D82
         PLA
         CMP   #$0001
         BEQ   L013CAA
         BRL   L013D1E
L013CAA  LDA   $40
         BNE   L013CB1
         BRL   L013D1E
L013CB1  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   $34
         BEQ   L013CC5
         JSR   L013F7B
L013CC5  LDA   L019687
         ASL
         TAX
         JSR   (L013D1F,X)
         STZ   $3C
         STZ   $56
         STZ   $58
         LDA   #$0085
         STA   L0199C0
         STA   $5A
         LDA   #$0084
         STA   L0199C2
         LDA   #$010C
         STA   $5C
         LDA   #$0086
         STA   L019683
         LDA   #$0042
         STA   L019681
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   #$0000
         PHA
         PHA
         _SetOrigin
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _ClipRect
         JSR   L011953
L013D1E  RTS

L013D1F  DA    L0124E0	; 0
         DA    L012836	; 1
         DA    L01274A	; 2

L013D25  LDA   $3E
         BNE   L013D37
         LDA   #$0104
         STA   L0196CB
         JSR   L013DC6
         LDA   $3E
         BNE   L013D37
         RTS

L013D37  PEA   ^L010676
         PEA   L010676
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetWTitle
         STZ   L0198DF
L013D4D  LDA   $92
         PHA
         LDA   $90
         PHA
         _ShowWindow
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SelectWindow
         STZ   $3E
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         _SetOrigin
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _ClipRect
         PEA   ^L019825
         PEA   L019825
         _SetPort
         PEA   ^L01997C
         PEA   L01997C
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRect
         JSR   L011953
         JSR   L0118CC
         LDA   #$0005
         JSR   L0190DA
         JSL   L010D82
         RTS

L013DC6  JSL   L018744
         LDA   $3C
         BEQ   L013DE9
         JSR   L013E81
         LDA   L013F79
         CMP   #$0001
         BNE   L013DDF
         JSR   L012A73
         BCS   L013DE9
         RTS

L013DDF  CMP   #$0002
         BEQ   L013DE9
         JSL   L010D82
         RTS

L013DE9  LDA   L0196CB
         CMP   #$010B
         BNE   L013DF8
         LDA   #$0001
         STA   L019747
         RTS

L013DF8  LDA   $34
         BEQ   L013DFF
         JSR   L013F7B
L013DFF  LDA   $92
         PHA
         LDA   $90
         PHA
         _HideWindow
         JSL   L018752
         STZ   $40
         STZ   $3C
         LDA   #$0001
         STA   $3E
         LDA   #$0001
         STA   L019687
         STZ   $56
         STZ   $58
         LDA   #$0085
         STA   L0199C0
         STA   $5A
         LDA   #$0084
         STA   L0199C2
         LDA   #$010C
         STA   $5C
         LDA   #$0086
         STA   L019683
         LDA   #$0042
         STA   L019681
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   #$0000
         PHA
         PHA
         _SetOrigin
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _ClipRect
         LDA   #$0006
         JSR   L0190DA
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         RTS

L013E81  PHA
         PHA
         _GetCursorAdr
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         LDA   L0104CD
         STA   L013F63
         LDA   L0104CF
         STA   L013F65
         LDA   L0104D1
         STA   L013F67
         LDA   L0104D3
         STA   L013F69
         LDA   L0196CB
         CMP   #$0104
         BEQ   L013EC1
         PEA   ^L0104C5
         PEA   L0104C5
         BRA   L013EC7
L013EC1  PEA   ^L010497
         PEA   L010497
L013EC7  LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         _ParamText
         PHA
         PEA   ^L013EF7
         PEA   L013EF7
         PEA   $0000
         PEA   $0000
         _Alert
         PLA
         STA   L013F79
         _SetCursor
         RTS

L013EF7  DW    $0028      ; Alert rect
         DW    $003C
         DW    $006E
         DW    $012C
         DW    $0001      ; Alert ID
         HEX   80         ; First stage byte
         HEX   80         ; Second stage byte
         HEX   80         ; Third stage byte
         HEX   80         ; fourth stage byte
         ADRL  L013F19    ; Ptr to item template
         ADRL  L013F31    ; Ptr to item template
         ADRL  L013F49    ; Ptr to item template
         ADRL  L013F61    ; Ptr to item template
         ADRL  $00000000
L013F19  DW    $0001      ; Item ID
         DW    $001E      ; Item rect
         DW    $0014
         DW    $002C
         DW    $005A
         DW    $000A      ; Std button
         ADRL  L01047A    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013F31  DW    $0002      ; Item ID
         DW    $0032      ; Item rect
         DW    $0014
         DW    $0040
         DW    $005A
         DW    $000A      ; Std button
         ADRL  L01047E    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013F49  DW    $0003      ; Item ID
         DW    $0032      ; Item rect
         DW    $0096
         DW    $0040
         DW    $00DC
         DW    $000A      ; Std button
         ADRL  L010472    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013F61  DW    $0004      ; Item ID
L013F63  DW    $0000      ; Item rect
L013F65  DW    $0000
L013F67  DW    $0000
L013F69  DW    $0000
         DW    $800F      ; Static text
         ADRL  L0104D5    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L013F79  DW    $0000
L013F7B  JSR   L013C36
         JSR   L015981
         LDA   $34
         BEQ   L013F88
         BRL   L014091
L013F88  LDA   $3E
         BEQ   L013F8D
         RTS

L013F8D  LDA   #$0001
         STA   $34
         PHA
         PEA   $0116
         _CheckMItem
         JSR   L01192F
         LDA   L0196C9
         AND   #$0400
         STA   L019697
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         PEA   ^L019749
         PEA   L019749
         _GetPortRect
         PEA   ^L019749
         PEA   L019749
         LDA   L019697
         BNE   L013FDC
         PEA   ^L0199F4
         PEA   L0199F4
         LDA   #$000F
         STA   L014399
         BRA   L013FE5
L013FDC  PEA   ^L019A14
         PEA   L019A14
         STZ   L014399
L013FE5  _FillRect
         LDA   $56
         STA   $5E
         LDA   $58
         STA   $60
         LDA   $5A
         STA   $62
         LDA   $5C
         STA   $64
         LDA   #$0016
         STA   L0199C0
         LDA   #$0014
         STA   L0199C2
         SEC
         LDA   L019681
         SBC   #$000C
         STA   $56
         CLC
         ADC   #$0016
         STA   $5A
         SEC
         LDA   L019683
         SBC   #$0016
         STA   $58
         CLC
         ADC   #$002C
         STA   $5C
         LDX   #$0000
         LDY   #$0000
         JSR   L0182E5
         LDA   $58
         PHA
         LDA   $56
         PHA
         _SetOrigin
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         PEA   ^L019E8C
         PEA   L019E8C
         _FrameRect
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         PEA   $002C
         PEA   $0016
         _SetPortSize
         PEA   ^L019749
         PEA   L019749
         _GetPortRect
         PEA   ^L019749
         PEA   L019749
         _ClipRect
         JSR   L011953
         JSR   L014117
         RTS

L014091  STZ   $34
         PEA   $0000
         PEA   $0116
         _CheckMItem
         JSR   L01192F
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   #$0085
         STA   L0199C0
         LDA   #$0084
         STA   L0199C2
         LDA   $5E
         STA   $56
         LDA   $60
         STA   $58
         LDA   $62
         STA   $5A
         LDA   $64
         STA   $5C
         LDA   $58
         PHA
         LDA   $56
         PHA
         _SetOrigin
         PEA   $010C
         PEA   $0085
         _SetPortSize
         PEA   ^L019749
         PEA   L019749
         _GetPortRect
         PEA   ^L019749
         PEA   L019749
         _ClipRect
         PEA   ^L019749
         PEA   L019749
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         JSR   L011953
         RTS

L014117  LDA   $34
         BNE   L01411C
         RTS

L01411C  LDA   #$0000
         STA   L014393
         LDA   #$0015
         STA   L014395
         BRA   L01413B
L01412A  LDA   $34
         BNE   L01412F
         RTS

L01412F  JSR   L0142EC
         LDA   L014393
         CMP   #$0016
         BCC   L01413B
         RTS

L01413B  _HideCursor
         LDA   L014393
         JSL   L0182D0
         STA   L014375
         LDA   #$0000
         PHA
         PHA
         PEA   $03C0
         LDA   L014393
         PHA
         _Multiply
         PLA
         CLC
         ADC   #$00A1
         STA   L014379
         PLX
         CLC
         ADC   #$00A0
         STA   L01437B
         CLC
         ADC   #$00A0
         STA   L01437D
         CLC
         ADC   #$00A0
         STA   L01437F
         CLC
         ADC   #$00A0
         STA   L014381
         LDA   L014395
         INC
         JSL   L0182D0
         STA   L014377
L01418F  LDX   #$000B
L014192  LDY   L014375
         CPY   #$0280
         BCS   L0141D5
         CPX   #$000B
         BNE   L0141D5
         LDX   #$0009
         LDA   L014375
         CLC
         ADC   #$0004
         STA   L014375
         LDA   L014379
         CLC
         ADC   #$0018
         STA   L014379
         CLC
         ADC   #$00A0
         STA   L01437B
         CLC
         ADC   #$00A0
         STA   L01437D
         CLC
         ADC   #$00A0
         STA   L01437F
         CLC
         ADC   #$00A0
         STA   L014381
         LDY   L014375
L0141D5  LDA   [$06],Y
         INC   L014375
         INC   L014375
         STA   L014397
         AND   #$00F0
         STA   L014391
         XBA
         ORA   L014391
         STA   L01438F
         LSR
         LSR
         LSR
         LSR
         ORA   L01438F
         STA   L014383
         LDA   L014397
         AND   #$000F
         XBA
         STA   L01438F
         ASL
         ASL
         ASL
         ASL
         PHA
         ORA   L01438F
         ORA   L014391
         ORA   L014399
         STA   L014385
         XBA
         AND   #$0FFF
         ORA   $01,S
         STA   L014387
         PLA
         LDA   L014397
         AND   #$F000
         STA   L01438F
         XBA
         STA   L014391
         ORA   L01438F
         STA   L01438F
         LSR
         LSR
         LSR
         LSR
         ORA   L01438F
         STA   L014389
         LDA   L014397
         AND   #$0F00
         STA   L01438F
         ASL
         ASL
         ASL
         ASL
         PHA
         ORA   L01438F
         ORA   L014391
         ORA   L014399
         STA   L01438B
         XBA
         AND   #$0FFF
         ORA   $01,S
         STA   L01438D
         PLA
         PHX
         LDX   #$0000
L014261  LDA   L014383,X
         LDY   L014379
         STA   [$06],Y
         INC   L014379
         INC   L014379
         LDY   L01437B
         STA   [$06],Y
         INC   L01437B
         INC   L01437B
         LDY   L01437D
         STA   [$06],Y
         INC   L01437D
         INC   L01437D
         LDY   L01437F
         STA   [$06],Y
         INC   L01437F
         INC   L01437F
         LDY   L014381
         STA   [$06],Y
         INC   L014381
         INC   L014381
         INX
         INX
         CPX   #$000C
         BNE   L014261
         PLX
         DEX
         BEQ   L0142A9
         BRL   L014192
L0142A9  LDA   L014375
         CLC
         ADC   #$008A
         STA   L014375
         LDA   L014379
         CLC
         ADC   #$033C
         STA   L014379
         CLC
         ADC   #$00A0
         STA   L01437B
         CLC
         ADC   #$00A0
         STA   L01437D
         CLC
         ADC   #$00A0
         STA   L01437F
         CLC
         ADC   #$00A0
         STA   L014381
         LDA   L014375
         CMP   L014377
         BCS   L0142E4
         BRL   L01418F
L0142E4  _ShowCursor
         RTS

L0142EC  SEC
         TXA
         SBC   $56
         STA   L014393
         SEC
         TYA
         SBC   $56
         STA   L014395
         LDA   L014393
         SEC
         SBC   L014395
         BVS   L014306
         EOR   #$8000
L014306  BPL   L014314
         LDX   L014393
         LDA   L014395
         STA   L014393
         STX   L014395
L014314  CLC
         LDA   L014395
         ADC   L01975F
         STA   L014395
         LDA   L014393
         SEC
         SBC   #$0000
         BVS   L01432A
         EOR   #$8000
L01432A  BMI   L014331
         STZ   L014393
         BRA   L014345
L014331  LDA   L014393
         SEC
         SBC   #$0016
         BVS   L01433D
         EOR   #$8000
L01433D  BPL   L014345
         LDA   #$0015
         STA   L014393
L014345  LDA   L014395
         SEC
         SBC   #$0000
         BVS   L014351
         EOR   #$8000
L014351  BMI   L014358
         STZ   L014395
         BRA   L01436C
L014358  LDA   L014395
         SEC
         SBC   #$0016
         BVS   L014364
         EOR   #$8000
L014364  BPL   L01436C
         LDA   #$0015
         STA   L014395
L01436C  RTS

L01436D  ENT
         PHB
         PHK
         PLB
         JSR   L013F7B
         PLB
         RTL

L014375  DW    $0000
L014377  DW    $0000
L014379  DW    $0000
L01437B  DW    $0000
L01437D  DW    $0000
L01437F  DW    $0000
L014381  DW    $0000
L014383  DW    $0000
L014385  DW    $0000
L014387  DW    $0000
L014389  DW    $0000
L01438B  DW    $0000
L01438D  DW    $0000
L01438F  DW    $0000
L014391  DW    $0000
L014393  DW    $0000
L014395  DW    $0000
L014397  DW    $0000
L014399  DW    $0000
L01439B  PHA
         PHA
         SEC
         LDA   $6C
         SBC   $68
         STA   L0147AB
         DEC
         LSR
         AND   #$FFFE
         INC
         INC
         STA   L0147AD
         PHA
         SEC
         LDA   $6A
         SBC   $66
         STA   L0147A9
         PHA
         _Multiply
         PLA
         STA   L0147A5
         PLA
         STA   L0147A5+2
         JSR   L014403
         BCC   L0143D8
         LDX   #$0002
         JSL   L017D37
         JSR   L01618F
         RTS

L0143D8  LDA   $36
         STA   $D0
         LDA   #$0001
         STA   $42
         PEA   $010F
         _EnableMItem
         LDA   L0196CB
         CMP   #$010D
         BEQ   L0143F4
         RTS

L0143F4  LDA   #$0003
         STA   $46
         JSR   L013C57
         JSR   L011953
         JSR   L014117
         RTS

L014403  LDA   L0147A5
         CMP   $D8
         BNE   L014411
         LDA   L0147A5+2
         CMP   $DA
         BEQ   L014429
L014411  LDA   L0147A5+2
         PHA
         LDA   L0147A5
         PHA
         LDA   $CE
         PHA
         LDA   $CC
         PHA
         _SetHandleSize
         BCC   L014429
         RTS

L014429  LDA   L0147A5
         STA   $D8
         LDA   L0147A5+2
         STA   $DA
         LDA   L0147AB
         STA   $D6
         LDA   L0147A9
         STA   $D4
         LDA   L0147AD
         STA   $D2
         LDA   $CE
         PHA
         LDA   $CC
         PHA
         _HLock
         LDA   [$CC]
         STA   $0E
         LDY   #$0002
         LDA   [$CC],Y
         STA   $10
         LDA   L01999E
         STA   $0A
         LDA   L0199A0
         STA   $0C
         LDA   #$0086
         STA   L0147A1
         LDA   $D2
         STA   L0147A3
         JSR   L01477E
         LDA   $CE
         PHA
         LDA   $CC
         PHA
         _HUnlock
         RTS

L014480  LDA   $42
         BNE   L014485
         RTS

L014485  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L013C36
         JSR   L015981
         JSR   L01192F
         JSR   L0118CC
         LDA   $34
         BEQ   L0144B3
         LDA   $D4
         CMP   #$0017
         BCS   L0144B0
         LDA   $D6
         CMP   #$002D
         BCC   L0144B3
L0144B0  JSR   L013F7B
L0144B3  SEC
         LDA   L0199C0
         SBC   $D4
         LSR
         CLC
         ADC   $56
         STA   $66
         LDA   $4A
         BEQ   L0144C8
         LDA   #$0007
         TRB   $66
L0144C8  CLC
         LDA   $66
         ADC   $D4
         STA   $6A
         LDA   L0199C2
         INC
         INC
         ASL
         SEC
         SBC   $D6
         LSR
         CLC
         ADC   $58
         STA   $68
         LDA   $4A
         BEQ   L0144E7
         LDA   #$0007
         TRB   $68
L0144E7  CLC
         LDA   $68
         ADC   $D6
         STA   $6C
         LDA   $66
         SEC
         SBC   $56
         BVS   L0144F8
         EOR   #$8000
L0144F8  BMI   L014503
         LDA   $56
         STA   $66
         CLC
         ADC   $D4
         STA   $6A
L014503  LDA   $68
         SEC
         SBC   $58
         BVS   L01450D
         EOR   #$8000
L01450D  BMI   L014518
         LDA   $58
         STA   $68
         CLC
         ADC   $D6
         STA   $6C
L014518  LDA   $6A
         SEC
         SBC   $5A
         BEQ   L01452F
         BVS   L014524
         EOR   #$8000
L014524  BPL   L01452F
         LDA   $5A
         STA   $6A
         SEC
         SBC   $D4
         STA   $66
L01452F  LDA   $6C
         SEC
         SBC   $5C
         BEQ   L014546
         BVS   L01453B
         EOR   #$8000
L01453B  BPL   L014546
         LDA   $5C
         STA   $6C
         SEC
         SBC   $D6
         STA   $68
L014546  LDA   $66
         STA   L019761
         LDA   $68
         STA   L019763
         LDA   $6A
         STA   L019765
         LDA   $6C
         STA   L019767
         LDA   $D0
         STA   $36
         LDA   #$0002
         STA   $46
         LDA   L019998
         STA   L01999E
         LDA   L01999A
         STA   L0199A0
         LDA   L019984
         STA   L01998A
         LDA   L019986
         STA   L01998C
         LDA   L0199AC
         STA   L0199B2
         LDA   L0199AE
         STA   L0199B4
         LDA   $CE
         PHA
         LDA   $CC
         PHA
         _HLock
         LDA   $CC
         STA   $0E
         LDA   $CE
         STA   $10
         LDA   [$0E]
         STA   $0A
         LDY   #$0002
         LDA   [$0E],Y
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDA   $D2
         STA   L0147A1
         LDA   #$0086
         STA   L0147A3
         JSR   L01477E
         LDA   $CE
         PHA
         LDA   $CC
         PHA
         _HUnlock
         LDA   $D0
         CMP   #$0002
         BNE   L0145F8
         LDA   L019984
         STA   $12
         LDA   L019986
         STA   $14
         LDA   #$0000
         LDY   #$459C
L0145E3  STA   [$12],Y
         DEY
         DEY
         BPL   L0145E3
         JSR   L018DDB
         LDA   #$0003
         JSR   L0190DA
         LDY   #$000B
         BRL   L01472B
L0145F8  LDA   L019984
         STA   $12
         LDA   L019986
         STA   $14
         LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   #$FFFF
         LDY   #$459C
L014612  STA   [$12],Y
         STA   [$0A],Y
         DEY
         DEY
         BPL   L014612
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDA   $74
         CMP   #$0001
         BNE   L014644
         LDA   #$0086
         STA   L0147A1
         STA   L0147A3
         JSR   L01477E
         BRL   L0146DE
L014644  LDA   $74
         DEC
         EOR   #$000F
         STA   L0147B7
         XBA
         STA   L0147BB
         LSR
         LSR
         LSR
         LSR
         STA   L0147B9
         XBA
         STA   L0147BD
         LDA   L0147B7
         ORA   L0147B9
         ORA   L0147BB
         ORA   L0147BD
         STA   L0147BF
         LDX   $D4
L01466D  LDY   $D6
L01466F  LDA   #$FFFF
         STA   L0147C3
         LDA   [$0A],Y
         STA   L0147C1
         CMP   L0147BF
         BNE   L014681
         BRA   L0146C2
L014681  AND   #$000F
         CMP   L0147B7
         BEQ   L01468F
         LDA   #$000F
         TRB   L0147C3
L01468F  LDA   L0147C1
         AND   #$00F0
         CMP   L0147B9
         BEQ   L0146A0
         LDA   #$00F0
         TRB   L0147C3
L0146A0  LDA   L0147C1
         AND   #$0F00
         CMP   L0147BB
         BEQ   L0146B1
         LDA   #$0F00
         TRB   L0147C3
L0146B1  LDA   L0147C1
         AND   #$F000
         CMP   L0147BD
         BEQ   L0146C2
         LDA   #$F000
         TRB   L0147C3
L0146C2  LDA   L0147C3
         STA   [$0E],Y
         DEY
         DEY
         BPL   L01466F
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         DEX
         BNE   L01466D
L0146DE  STZ   L0147AF
         STZ   L0147B1
         LDA   $D4
         STA   L0147B3
         LDA   $D6
         DEC
         AND   #$FFFC
         CLC
         ADC   #$0004
         STA   L0147B5
         PEA   ^L019988
         PEA   L019988
         PEA   ^L0147AF
         PEA   L0147AF
         PEA   ^L019A14
         PEA   L019A14
         PEA   $000F
         JSR   L016906
         LDA   L019986
         PHA
         LDA   L019984
         PHA
         PEA   ^L0147AF
         PEA   L0147AF
         JSR   L019480
         JSR   L018EF6
         LDA   #$0001
         JSR   L0190DA
         LDY   #$0001
L01472B  JSR   L016313
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         RTS

L01473C  LDA   #$010E
         STA   L0196CB
         JSR   L01439B
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         JSR   L013C57
         JSR   L01192F
         JSR   L0118CC
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         PLA
         STA   L0196C5
         PLA
         STA   L0196C7
         JSR   L013C4D
         STZ   $4C
         RTS

L01477E  LDX   $D4
L014780  LDA   $D2
         DEC
         DEC
         TAY
L014785  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L014785
         CLC
         LDA   $0A
         ADC   L0147A1
         STA   $0A
         CLC
         LDA   $0E
         ADC   L0147A3
         STA   $0E
         DEX
         BNE   L014780
         RTS

L0147A1  DW    $0000
L0147A3  DW    $0000
L0147A5  ADRL  $00000000
L0147A9  DW    $0000
L0147AB  DW    $0000
L0147AD  DW    $0000
L0147AF  DW    $0000
L0147B1  DW    $0000
L0147B3  DW    $0000
L0147B5  DW    $0000
L0147B7  DW    $0000
L0147B9  DW    $0000
L0147BB  DW    $0000
L0147BD  DW    $0000
L0147BF  DW    $0000
L0147C1  DW    $0000
L0147C3  DW    $0000
L0147C5  LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSL   L014903
         BCS   L0147DB
         BRL   L0148ED
L0147DB  LDA   L0196C9
         AND   #$0100
         BEQ   L01480D
         STZ   L019741
         STX   $72
         JSR   L01172C
         JSR   L011884
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   $72
         DEC
         EOR   #$000F
         PHA
         _SetForeColor
         JSR   L015CB0
         RTS

L01480D  LDA   L0196C9
         AND   #$0800
         BEQ   L014825
         STZ   L019741
         CPX   #$0011
         BCS   L014822
         STX   $74
         JSR   L011884
L014822  BRL   L0148ED
L014825  STX   $70
         LDA   L019741
         BNE   L01482F
         BRL   L0148B6
L01482F  STZ   L019741
         LDA   $70
         CMP   #$0011
         BCS   L01486A
         PEA   $FFFF
         PEA   $0005
         _HiliteMenu
         LDA   #$0003
         JSR   L01080A
         PEA   $0000
         PEA   $0005
         _HiliteMenu
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L0117DA
         RTS

L01486A  PEA   $FFFF
         PEA   $0004
         _HiliteMenu
         LDA   #$0006
         JSR   L01080A
         PEA   $0000
         PEA   $0004
         _HiliteMenu
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
L014897  LDX   $70
         PEA   ^L0148FB
         PEA   L0148FB
         JSL   L01493B
         PEA   ^L0148FB
         PEA   L0148FB
         JSL   L0149A7
         PHX
         PHA
         _FillRect
L0148B6  JSR   L011884
         PEA   $011F
         LDY   $70
         CPY   #$0011
         BCS   L0148CC
         _EnableMItem
         BRA   L0148D3
L0148CC  _DisableMItem
L0148D3  PEA   $011B
         LDY   $70
         CPY   #$0011
         BCS   L0148E6
         _DisableMItem
         BRA   L0148ED
L0148E6  _EnableMItem
L0148ED  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

L0148FB  DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L014903  ENT
         PHB
         PHK
         PLB
         LDX   #$0001
L014909  PHX
         PEA   ^L0148FB
         PEA   L0148FB
         JSL   L01493B
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0148FB
         PEA   L0148FB
         _PtInRect
         PLA
         BNE   L014937
         PLX
         INX
         CPX   #$0021
         BNE   L014909
         PLB
         CLC
         RTL

L014937  PLX
         PLB
         SEC
         RTL

L01493B  ENT
         PHB
         PHK
         PLB
         LDA   #$0000
         CPX   #$0011
         BCC   L01494F
         TXA
         SEC
         SBC   #$0010
         TAX
         LDA   #$000F
L01494F  CLC
         ADC   #$00A5
         STA   L01499F
         CLC
         ADC   #$000E
         STA   L0149A3
         LDA   #$003C
L014960  CLC
         ADC   #$000F
         DEX
         BNE   L014960
         STA   L0149A1
         CLC
         ADC   #$000E
         STA   L0149A5
         LDA   $06,S
         PHA
         PLB
         PLB
         LDY   #$0000
         LDAL  L01499F
         STA   ($05,S),Y
         INY
         INY
         LDAL  L0149A1
         STA   ($05,S),Y
         INY
         INY
         LDAL  L0149A3
         STA   ($05,S),Y
         INY
         INY
         LDAL  L0149A5
         STA   ($05,S),Y
         PLX
         PLY
         PLA
         PLA
         PHY
         PHX
         PLB
         RTL

L01499F  DW    $0000
L0149A1  DW    $0000
L0149A3  DW    $0000
L0149A5  DW    $0000
L0149A7  ENT
         PHB
         PHK
         PLB
         LDX   $70
         BRA   L0149B1
L0149AE  ENT
         PHB
         PHK
         PLB
L0149B1  TXA
         DEC
         ASL
         ASL
         ASL
         ASL
         ASL
         CLC
         ADC   #L019A74
         PHA
         LDA   #^L019A74
         ADC   #$0000
         TAX
         PLA
         PLB
         RTL

L0149C7  STZ   L019741
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         LDY   #$0000
         LDA   L0196C5
L0149DD  CMP   L014A0E,Y
         BCC   L0149EB
         CPY   #$0006
         BEQ   L014A00
         INY
         INY
         BRA   L0149DD
L0149EB  TYA
         LSR
         PHA
         LDA   $6E
         CMP   $01,S
         BNE   L0149F7
         PLA
         BRA   L014A00
L0149F7  JSR   L011773
         PLA
         STA   $6E
         JSR   L011773
L014A00  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

L014A0E  DW    $00A1
         DW    $00AC
         DW    $00B8
         DW    $00C4
L014A16  JSR   L01192F
         PHA
         PHA
         _NewRgn
         PLA
         STA   L014FF5
         PLA
         STA   L014FF7
         _OpenRgn
         _PenNormal
         _ShowPen
         LDA   #$0001
         STA   L01975F
         JSR   L018126
         JSL   L0181CE
         JSR   L018168
         LDX   L0196C7
         STX   $68
         STX   $6C
         STX   L014FC1
         STX   L014FBD
         LDA   L0196C5
         STA   L014FBB
         STA   L014FBF
         STA   $66
         STA   $6A
         PHA
         PHX
         PHA
         PHX
         PHA
         _MoveTo
         _LineTo
         PLX
         TXY
         JSR   L01412A
L014A81  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L014A93
         BRL   L014AFE
L014A93  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         JSR   L018168
         LDA   L0196C7
         CMP   L014FBD
         BNE   L014AB7
         LDA   L0196C5
         CMP   L014FBB
         BEQ   L014A81
L014AB7  LDA   L014FBB
         PHA
         LDA   L0196C7
         PHA
         STA   L014FBD
         LDA   L0196C5
         PHA
         STA   L014FBB
         _LineTo
         PLX
         LDY   L014FBB
         JSR   L01412A
         LDA   L014FBD
         CMP   $68
         BCS   L014AE0
         STA   $68
L014AE0  LDA   L014FBB
         CMP   $66
         BCS   L014AE9
         STA   $66
L014AE9  LDA   L014FBD
         CMP   $6C
         BCC   L014AF2
         STA   $6C
L014AF2  LDA   L014FBB
         CMP   $6A
         BCC   L014AFB
         STA   $6A
L014AFB  BRL   L014A81
L014AFE  LDA   L014FC1
         PHA
         LDA   L014FBF
         PHA
         _LineTo
         _HidePen
         LDA   L014FF7
         PHA
         LDA   L014FF5
         PHA
         _CloseRgn
         SEC
         LDA   $6A
         SBC   $66
         CMP   #$0002
         BCS   L014B3E
         SEC
         LDA   $6C
         SBC   $68
         CMP   #$0002
         BCS   L014B3E
L014B37  JSR   L011953
         JSR   L014117
         RTS

L014B3E  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   $74
         DEC
         EOR   #$000F
         STA   L014FCF
         XBA
         STA   L014FD3
         LSR
         LSR
         LSR
         LSR
         STA   L014FD1
         XBA
         STA   L014FD5
         LDA   L014FCF
         ORA   L014FD1
         STA   L014FCD
         ORA   L014FD3
         ORA   L014FD5
         STA   L014FCB
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDY   #$459C
         LDA   L014FCB
L014B85  STA   [$0A],Y
         DEY
         DEY
         BPL   L014B85
         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDA   L0199AC
         STA   $12
         LDA   L0199AE
         STA   $14
         LDY   #$459C
         LDA   #$FFFF
L014BA5  STA   [$0E],Y
         STA   [$12],Y
         DEY
         DEY
         BPL   L014BA5
         LDA   $66
         STA   L019749
         LDA   $68
         STA   L01974B
         LDA   $6A
         STA   L01974D
         LDA   $6C
         STA   L01974F
         INC   $6A
         INC   $6C
         LDA   L014FF7
         PHA
         LDA   L014FF5
         PHA
         PEA   ^L019749
         PEA   L019749
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         _MapRgn
         LDA   $A4
         STA   $0A
         LDA   $A6
         STA   $0C
         LDA   #$F0F0
         JSR   L014F72
         LDA   #$0F0F
         JSR   L014F72
         STZ   $38
         STZ   L014FDB
         STZ   L014FDD
         SEC
         LDA   $6A
         SBC   $66
         STA   L014FDF
         SEC
         LDA   $6C
         SBC   $68
         STA   L014FE1
         JSR   L011953
         JSR   L014117
         PEA   ^L019825
         PEA   L019825
         _SetPort
         LDA   L014FF7
         PHA
         LDA   L014FF5
         PHA
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRgn
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   L019998
         STA   L01999E
         LDA   L01999A
         STA   L0199A0
         LDA   L019984
         STA   L01998A
         LDA   L019986
         STA   L01998C
         LDA   L014FF7
         PHA
         LDA   L014FF5
         PHA
         LDA   $68
         DEC
         EOR   #$FFFF
         PHA
         LDA   $66
         DEC
         EOR   #$FFFF
         PHA
         _OffsetRgn
         CLC
         TDC
         ADC   #$0066
         STA   L014FEB
         LDA   $90
         STA   L014FE3
         LDA   $92
         STA   L014FE5
         _HideCursor
         PEA   ^L014FE3
         PEA   L014FE3
         _PaintPixels
         _ShowCursor
         LDA   L014FF7
         PHA
         LDA   L014FF5
         PHA
         _DisposeRgn
         LDA   L014FE1
         AND   #$FFFC
         LSR
         DEC
         DEC
         STA   L014FC5
         LDA   L019998
         STA   $12
         LDA   L01999A
         STA   $14
         LDX   #$0000
L014CD0  LDY   L014FC5
L014CD3  LDA   [$12],Y
         CMP   L014FCB
         BNE   L014CEF
         DEY
         DEY
         BPL   L014CD3
         CLC
         LDA   $12
         ADC   #$0086
         STA   $12
         INX
         CPX   L014FDF
         BNE   L014CD0
         BRL   L014F62
L014CEF  STX   L014FC7
         PHA
         PHA
         PHX
         LDA   #$0086
         PHA
         _Multiply
         CLC
         LDA   $01,S
         ADC   L019984
         STA   L01998A
         LDA   L019986
         STA   L01998C
         CLC
         LDA   $01,S
         ADC   L0199AC
         STA   L0199B2
         LDA   L0199AE
         STA   L0199B4
         PLA
         CLC
         ADC   L019998
         STA   L01999E
         PLA
         LDA   L01999A
         STA   L0199A0
         CLC
         LDA   $66
         ADC   L014FC7
         STA   $66
         PHA
         PHA
         LDA   L014FDF
         DEC
         PHA
         LDA   #$0086
         PHA
         _Multiply
         PLA
         CLC
         ADC   L019998
         STA   $12
         PLA
         LDA   L01999A
         STA   $14
         LDX   L014FDF
         DEX
L014D58  LDY   L014FC5
L014D5B  LDA   [$12],Y
         CMP   L014FCB
         BNE   L014D74
         DEY
         DEY
         BPL   L014D5B
         SEC
         LDA   $12
         SBC   #$0086
         STA   $12
         DEX
         BPL   L014D58
         BRL   L014F62
L014D74  INX
         SEC
         TXA
         SBC   L014FC7
         STA   L014FC3
         CLC
         ADC   $66
         STA   $6A
         LDA   L014FE1
         CMP   #$010C
         BNE   L014D8D
         BRL   L014E1F
L014D8D  LDY   #$0000
L014D90  LDA   L01999E
         STA   $12
         LDA   L0199A0
         STA   $14
         LDX   L014FC3
L014D9D  LDA   [$12],Y
         AND   #$00FF
         CMP   L014FCD
         BNE   L014DB5
         CLC
         LDA   $12
         ADC   #$0086
         STA   $12
         DEX
         BPL   L014D9D
         INY
         BRA   L014D90
L014DB5  TYA
         ASL
         STA   L014FC9
         CLC
         TYA
         ADC   L01999E
         STA   L01999E
         CLC
         TYA
         ADC   L01998A
         STA   L01998A
         CLC
         TYA
         ADC   L0199B2
         STA   L0199B2
         CLC
         LDA   $68
         ADC   L014FC9
         STA   $68
         STZ   L014FB9
         LDA   L014FE1
         ROR
         BCC   L014DE9
         LDA   #$0001
         STA   L014FB9
L014DE9  SEC
         LDA   L014FE1
         SBC   L014FC9
         LSR
         TAY
L014DF2  LDA   L01999E
         STA   $12
         LDA   L0199A0
         STA   $14
         LDX   L014FC3
L014DFF  LDA   [$12],Y
         AND   #$00FF
         CMP   L014FCD
         BNE   L014E17
         CLC
         LDA   $12
         ADC   #$0086
         STA   $12
         DEX
         BPL   L014DFF
         DEY
         BRA   L014DF2
L014E17  TYA
         INC
         ASL
         CLC
         ADC   $68
         STA   $6C
L014E1F  LDA   $66
         STA   L019761
         LDA   $68
         STA   L019763
         LDA   $6A
         STA   L019765
         LDA   $6C
         STA   L019767
         CLC
         LDA   $66
         ADC   $6A
         LSR
         STA   L019681
         CLC
         LDA   $68
         ADC   $6C
         LSR
         STA   L019683
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDA   $74
         CMP   #$0001
         BEQ   L014ED7
         LDX   L0199C0
L014E63  LDY   L0199C2
L014E66  LDA   #$FFFF
         STA   L014FD9
         LDA   [$0A],Y
         STA   L014FD7
         CMP   L014FCB
         BNE   L014E78
         BRA   L014EB9
L014E78  AND   #$000F
         CMP   L014FCF
         BEQ   L014E86
         LDA   #$000F
         TRB   L014FD9
L014E86  LDA   L014FD7
         AND   #$00F0
         CMP   L014FD1
         BEQ   L014E97
         LDA   #$00F0
         TRB   L014FD9
L014E97  LDA   L014FD7
         AND   #$0F00
         CMP   L014FD3
         BEQ   L014EA8
         LDA   #$0F00
         TRB   L014FD9
L014EA8  LDA   L014FD7
         AND   #$F000
         CMP   L014FD5
         BEQ   L014EB9
         LDA   #$F000
         TRB   L014FD9
L014EB9  LDA   L014FD9
         STA   [$0E],Y
         DEY
         DEY
         BPL   L014E66
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         DEX
         BNE   L014E63
         BRA   L014EF8
L014ED7  LDX   L0199C0
L014EDA  LDY   L0199C2
L014EDD  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L014EDD
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         DEX
         BNE   L014EDA
L014EF8  LDA   L01998C
         PHA
         LDA   L01998A
         PHA
         LDA   L019984
         STA   L01998A
         LDA   L019986
         STA   L01998C
         LDA   L014FE1
         DEC
         AND   #$FFFC
         CLC
         ADC   #$0004
         STA   L014FE1
         PEA   ^L019988
         PEA   L019988
         PEA   ^L014FDB
         PEA   L014FDB
         PEA   ^L019A14
         PEA   L019A14
         PEA   $000F
         JSR   L016906
         PLA
         STA   L01998A
         PLA
         STA   L01998C
         BCC   L014F3F
         JMP   L014B37

L014F3F  LDA   L019986
         PHA
         LDA   L019984
         PHA
         PEA   ^L014FDB
         PEA   L014FDB
         JSR   L019480
         LDA   #$0001
         STA   $36
         STZ   $46
         STZ   $44
         LDA   #$0001
         JSR   L0190DA
         JSR   L018EF6
L014F62  LDA   L019EDC+2
         PHA
         LDA   L019EDC
         PHA
         _SetCursor
         RTS

L014F72  LDY   #$0084
L014F75  STA   [$0A],Y
         DEY
         DEY
         BPL   L014F75
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         RTS

         LDA   L019984
         STA   $0E
         LDA   L019986
         STA   $10
         LDA   $06
         STA   $0A
         LDA   $08
         STA   $0C
         LDX   #$0085
L014F99  LDY   #$0084
L014F9C  LDA   [$0E],Y
         STA   [$0A],Y
         DEY
         DEY
         BPL   L014F9C
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$00A0
         STA   $0A
         DEX
         BNE   L014F99
         BRK   $FF
	 
L014FB9  DW    $0000
L014FBB  DW    $0000
L014FBD  DW    $0000
L014FBF  DW    $0000
L014FC1  DW    $0000
L014FC3  DW    $0000
L014FC5  DW    $0000
L014FC7  DW    $0000
L014FC9  DW    $0000
L014FCB  DW    $0000
L014FCD  DW    $0000
L014FCF  DW    $0000
L014FD1  DW    $0000
L014FD3  DW    $0000
L014FD5  DW    $0000
L014FD7  DW    $0000
L014FD9  DW    $0000
L014FDB  DW    $0000
L014FDD  DW    $0000
L014FDF  DW    $0000
L014FE1  DW    $0000
L014FE3  DW    $0000
L014FE5  DW    $0000
         ADRL  L01999C
L014FEB  DW    $0000
         DW    $0000
         ADRL  L014FDB
         DW    $0000
L014FF5  DW    $0000
L014FF7  DW    $0000
L014FF9  STZ   L019741
         JSR   L015476
         LDA   L0196C9
         AND   #$0200
         STA   $50
         STZ   L0154E3
         LDA   #$002E
         STA   L0154E3+$28
         LDA   L0199C2
         INC
         INC
         ASL
         ADC   L0154E3+$28
         STA   L0154E3+$2C
         LDA   #$001C
         STA   L0154E3+$26
         CLC
         ADC   L0199C0
         STA   L0154E3+$2A
         SEC
         LDA   $5C
         SBC   $58
         LSR
         CLC
         ADC   $58
         STA   L0154E3+$30
         SEC
         LDA   $5A
         SBC   $56
         LSR
         CLC
         ADC   $56
         STA   L0154E3+$2E
         LDA   $5A
         STA   L0154E3+$32
         LDA   L0199C0
         LSR
         CLC
         ADC   L0154E3+$30
         STA   L0154E3+$34
         LDA   $56
         STA   L0154E3+$36
         LDA   L0154E3+$34
         SEC
         SBC   L0199C0
         STA   L0154E3+$38
         JSL   L0181CE
         LDA   L0196C7
         STA   L0154E3+8
         STA   L0154E3+$C
         LDA   L0196C5
         STA   L0154E3+6
         STA   L0154E3+$A
         JSR   L0151E8
         BRA   L01508A
L01507B  JSR   L0150F9
         LDA   L0196C7
         STA   L0154E3+8
         LDA   L0196C5
         STA   L0154E3+6
L01508A  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L01509A
         RTS

L01509A  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         LDA   L0196C7
         CMP   L0154E3+8
         BNE   L0150BB
         LDA   L0196C5
         CMP   L0154E3+6
         BEQ   L01508A
L0150BB  LDA   $50
         BEQ   L01507B
         SEC
         LDA   L0196C7
         SBC   L0154E3+8
         PHA
         SEC
         LDA   L0196C5
         SBC   L0154E3+6
         PHA
         LDA   L0154E3+8
         PHA
         LDA   L0154E3+6
         PHA
         LDA   L0154E3
         PHA
         JSL   L01855E
         PLA
         PLA
         LDA   #$0001
         STA   L0154E3
         LDA   L0196C7
         CMP   L0154E3+8
         BNE   L01507B
         LDA   L0196C5
         CMP   L0154E3+6
         BEQ   L01508A
         BRA   L01507B
L0150F9  LDA   L0154E3+6
         STA   L0154E3+$A
         LDA   L0154E3+8
         STA   L0154E3+$C
         LDA   #$0001
         STA   L0154E3+$1A
         STA   L0154E3+$18
         SEC
         LDA   L0196C7
         SBC   L0154E3+8
         STA   L0154E3+$10
         BEQ   L01512B
         BPL   L01512E
         LDA   #$FFFF
         STA   L0154E3+$1A
         EOR   L0154E3+$10
         INC
         STA   L0154E3+$10
         BRA   L01512E
L01512B  STZ   L0154E3+$1A
L01512E  SEC
         LDA   L0196C5
         SBC   L0154E3+6
         STA   L0154E3+$E
         BEQ   L01514B
         BPL   L01514E
         LDA   #$FFFF
         STA   L0154E3+$18
         EOR   L0154E3+$E
         INC
         STA   L0154E3+$E
         BRA   L01514E
L01514B  STZ   L0154E3+$18
L01514E  STZ   L0154E3+$1C
         LDA   L0154E3+$10
         CMP   L0154E3+$E
         BCS   L01516D
         LDA   L0154E3+$10
         PHA
         LDA   L0154E3+$E
         STA   L0154E3+$10
         PLA
         STA   L0154E3+$E
         LDA   #$0001
         STA   L0154E3+$1C
L01516D  LDA   L0154E3+$10
         ASL
         STA   L0154E3+$14
         LDA   L0154E3+$E
         ASL
         STA   L0154E3+$12
         SEC
         LDA   L0154E3+$12
         SBC   L0154E3+$10
         STA   L0154E3+$16
         LDX   #$0001
L015188  PHX
         JSR   L0151E8
L01518C  LDA   L0154E3+$16
         ASL
         BCS   L0151B9
         LDA   L0154E3+$1C
         BEQ   L0151A3
         CLC
         LDA   L0154E3+$C
         ADC   L0154E3+$1A
         STA   L0154E3+$C
         BRA   L0151AD
L0151A3  CLC
         LDA   L0154E3+$A
         ADC   L0154E3+$18
         STA   L0154E3+$A
L0151AD  SEC
         LDA   L0154E3+$16
         SBC   L0154E3+$14
         STA   L0154E3+$16
         BRA   L01518C
L0151B9  LDA   L0154E3+$1C
         BEQ   L0151CA
         CLC
         LDA   L0154E3+$A
         ADC   L0154E3+$18
         STA   L0154E3+$A
         BRA   L0151D4
L0151CA  CLC
         LDA   L0154E3+$C
         ADC   L0154E3+$1A
         STA   L0154E3+$C
L0151D4  CLC
         LDA   L0154E3+$16
         ADC   L0154E3+$12
         STA   L0154E3+$16
         PLX
         INX
         CPX   L0154E3+$10
         BEQ   L015188
         BCC   L015188
         RTS

L0151E8  LDA   L0154E3+$A
         STA   L0154E3+2
         LDA   L0154E3+$C
         STA   L0154E3+4
         JSR   L015328
         LDA   $8A
         ASL
         TAX
         JMP   (L01563F,X)
L0151FE  RTS

L0151FF  BRL   L015283
L015202  BRL   L0152A2
L015205  JSR   L015283
         JSR   L0152A2
         BRL   L0152C1
L01520E  BRL   L015232
L015211  BRL   L01524A
L015214  JSR   L015232
         JSR   L01524A
         BRL   L015262
L01521D  JSR   L015232
         JSR   L01524A
         JSR   L015262
         JSR   L015283
         JSR   L0152A2
         JSR   L0152E0
         BRL   L015304
L015232  SEC
         LDA   L0154E3+$30
         SBC   L0154E3+$C
         ASL
         CLC
         ADC   L0154E3+$C
         STA   L0154E3+4
         LDA   L0154E3+$A
         STA   L0154E3+2
         BRL   L015328
L01524A  SEC
         LDA   L0154E3+$2E
         SBC   L0154E3+$A
         ASL
         CLC
         ADC   L0154E3+$A
         STA   L0154E3+2
         LDA   L0154E3+$C
         STA   L0154E3+4
         BRL   L015328
L015262  SEC
         LDA   L0154E3+$30
         SBC   L0154E3+$C
         ASL
         CLC
         ADC   L0154E3+$C
         STA   L0154E3+4
         SEC
         LDA   L0154E3+$2E
         SBC   L0154E3+$A
         ASL
         CLC
         ADC   L0154E3+$A
         STA   L0154E3+2
         BRL   L015328
L015283  SEC
         LDA   L0154E3+$C
         SBC   L0154E3+$38
         CLC
         ADC   L0154E3+$36
         STA   L0154E3+2
         SEC
         LDA   L0154E3+$A
         SBC   L0154E3+$36
         CLC
         ADC   L0154E3+$38
         STA   L0154E3+4
         BRL   L015328
L0152A2  SEC
         LDA   L0154E3+$32
         SBC   L0154E3+$C
         CLC
         ADC   L0154E3+$38
         STA   L0154E3+2
         SEC
         LDA   L0154E3+$34
         SBC   L0154E3+$A
         CLC
         ADC   L0154E3+$36
         STA   L0154E3+4
         BRL   L015328
L0152C1  SEC
         LDA   L0154E3+$34
         SBC   L0154E3+$C
         CLC
         ADC   L0154E3+$38
         STA   L0154E3+4
         SEC
         LDA   L0154E3+$32
         SBC   L0154E3+$A
         CLC
         ADC   L0154E3+$36
         STA   L0154E3+2
         BRL   L015328
L0152E0  LDA   L0154E3+$30
         ASL
         SEC
         SBC   L0154E3+$A
         CLC
         ADC   L0154E3+$36
         SEC
         SBC   L0154E3+$38
         STA   L0154E3+4
         SEC
         LDA   L0154E3+$C
         SBC   L0154E3+$38
         CLC
         ADC   L0154E3+$36
         STA   L0154E3+2
         BRL   L015328
L015304  LDA   L0154E3+$30
         ASL
         SEC
         SBC   L0154E3+$34
         CLC
         ADC   L0154E3+$A
         SEC
         SBC   L0154E3+$36
         STA   L0154E3+4
         LDA   L0154E3+$32
         SEC
         SBC   L0154E3+$C
         CLC
         ADC   L0154E3+$38
         STA   L0154E3+2
         BRL   L015328
L015328  LDA   L0154E3+4
         AND   #$0001
         BEQ   L015333
         DEC   L0154E3+4
L015333  ASL
         ASL
         TAX
         LDA   L01551F,X
         STA   $0E
         LDA   L01551F+2,X
         STA   $10
         SEC
         LDA   L0154E3+4
         SBC   $58
         CLC
         ADC   #$002E
         STA   L0154E3+$20
         BPL   L015352
         STZ   L0154E3+$20
L015352  CLC
         ADC   #$0010
         STA   L0154E3+$24
         BPL   L01535E
         STZ   L0154E3+$24
L01535E  SEC
         LDA   L0154E3+2
         SBC   $56
         CLC
         ADC   #$001C
         STA   L0154E3+$1E
         BPL   L015370
         STZ   L0154E3+$1E
L015370  CLC
         ADC   #$0008
         STA   L0154E3+$22
         BPL   L01537C
         STZ   L0154E3+$22
L01537C  LDA   L0154E3+2
         AND   #$0007
         ASL
         TAX
         LDA   L0154E3+4
         LSR
         AND   #$0003
         CLC
         ADC   L01562F,X
         CLC
         ADC   $A4
         STA   $0A
         LDA   $A6
         STA   $0C
         LDA   L0154E3+$1E
         JSL   L0182D0
         CLC
         ADC   #$2000
         STA   $12
         LDA   L0154E3+$20
         LSR
         CLC
         ADC   $12
         STA   $12
         LDA   #$00E1
         STA   $14
         LDA   #L015527
         STA   $28
         LDA   #^L015527
         STA   $2A
         LDA   L0154E3+$20
         CMP   L0154E3+$28
         BCS   L0153E7
         LDX   #$0078
         SEC
         LDA   L0154E3+$28
         SBC   L0154E3+$20
         CMP   #$0010
         BCS   L0153D9
         DEC
         ASL
         ASL
         ASL
         TAX
L0153D9  TXA
         CLC
         ADC   #L01552F
         STA   $28
         LDA   #^L01552F
         STA   $2A
         BRA   L01540F
L0153E7  LDA   L0154E3+$2C
         CMP   L0154E3+$24
         BCS   L01540F
         LDX   #$0078
         SEC
         LDA   L0154E3+$24
         SBC   L0154E3+$2C
         CMP   #$0010
         BCS   L015403
         DEC
         ASL
         ASL
         ASL
         TAX
L015403  TXA
         CLC
         ADC   #L0155AF
         STA   $28
         LDA   #^L0155AF
         STA   $2A
L01540F  _HideCursor
         LDX   L0154E3+$1E
L015419  CPX   L0154E3+$26
         BCC   L015444
         CPX   L0154E3+$2A
         BCS   L015444
         LDY   #$0000
L015426  LDA   [$0E],Y
         AND   [$28],Y
         STA   L0154E3+$3A
         AND   [$0A],Y
         PHA
         LDA   L0154E3+$3A
         EOR   #$FFFF
         AND   [$12],Y
         ORA   $01,S
         STA   [$12],Y
         PLA
         INY
         INY
         CPY   #$0008
         BCC   L015426
L015444  CLC
         LDA   $12
         ADC   #$00A0
         STA   $12
         CLC
         LDA   $0A
         ADC   #$000C
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0008
         STA   $0E
         INX
         CPX   L0154E3+$22
         BCC   L015419
         _ShowCursor
         LDX   L0154E3+2
         TXA
         CLC
         ADC   #$0008
         TAY
         JSR   L01412A
         RTS

L015476  JSL   L0149A7
         STA   $0A
         STX   $0C
         LDA   $A4
         STA   $0E
         CLC
         ADC   #$0004
         STA   $12
         CLC
         ADC   #$0004
         STA   $28
         LDA   $A6
         STA   $10
         STA   $14
         STA   $2A
         LDX   #$0008
L015499  LDY   #$0002
L01549C  LDA   [$0A],Y
         STA   [$0E],Y
         STA   [$12],Y
         STA   [$28],Y
         DEY
         DEY
         BPL   L01549C
         CLC
         LDA   $0A
         ADC   #$0004
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$000C
         STA   $0E
         CLC
         ADC   #$0004
         STA   $12
         CLC
         ADC   #$0004
         STA   $28
         DEX
         BNE   L015499
         LDA   $A4
         STA   $0A
         CLC
         ADC   #$0060
         STA   $0E
         LDA   $A6
         STA   $0C
         STA   $10
         LDY   #$005E
L0154DA  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0154DA
         RTS

L0154E3  DW    $0000
L0154E5  DW    $0000
L0154E7  DW    $0000
L0154E9  DW    $0000
L0154EB  DW    $0000
L0154ED  DW    $0000
L0154EF  DW    $0000
L0154F1  DW    $0000
L0154F3  DW    $0000
L0154F5  DW    $0000
L0154F7  DW    $0000
L0154F9  DW    $0000
L0154FB  DW    $0000
L0154FD  DW    $0000
L0154FF  DW    $0000
L015501  DW    $0000
L015503  DW    $0000
L015505  DW    $0000
L015507  DW    $0000
L015509  DW    $0000
L01550B  DW    $0000
L01550D  DW    $0000
L01550F  DW    $0000
L015511  DW    $0000
L015513  DW    $0000
L015515  DW    $0000
L015517  DW    $0000
L015519  DW    $0000
L01551B  DW    $0000
L01551D  DW    $0000
L01551F  ADRL  L019F6C
         ADRL  L019FAC
L015527  HEX   FFFFFFFFFFFFFFFF
L01552F  HEX   0FFFFFFFFFFFFFFF
         HEX   00FFFFFFFFFFFFFF
         HEX   000FFFFFFFFFFFFF
         HEX   0000FFFFFFFFFFFF
         HEX   00000FFFFFFFFFFF
         HEX   000000FFFFFFFFFF
         HEX   0000000FFFFFFFFF
         HEX   00000000FFFFFFFF
         HEX   000000000FFFFFFF
         HEX   0000000000FFFFFF
         HEX   00000000000FFFFF
         HEX   000000000000FFFF
         HEX   0000000000000FFF
         HEX   00000000000000FF
         HEX   000000000000000F
         HEX   0000000000000000
L0155AF  HEX   FFFFFFFFFFFFFFF0
         HEX   FFFFFFFFFFFFFF00
         HEX   FFFFFFFFFFFFF000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFF00000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFF0000000
         HEX   FFFFFFFF00000000
         HEX   FFFFFFF000000000
         HEX   FFFFFF0000000000
         HEX   FFFFF00000000000
         HEX   FFFF000000000000
         HEX   FFF0000000000000
         HEX   FF00000000000000
         HEX   F000000000000000
         HEX   0000000000000000
L01562F  DW    $0000
         DW    $000C
         DW    $0018
         DW    $0024
         DW    $0030
         DW    $003C
         DW    $0048
         DW    $0054
L01563F  DA    L0151FE
         DA    L0151FF
         DA    L01520E
         DA    L01521D
         DA    L015202
         DA    L015205
         DA    L01521D
         DA    L01521D
         DA    L015211
         DA    L01521D
         DA    L015214
         DA    L01521D
         DA    L01521D
         DA    L01521D
         DA    L01521D
         DA    L01521D
L01565F  LDA   L0196C9
         AND   #$0100
         BEQ   L01567F
         LDA   $34
         BNE   L01567B
         LDA   L0196C5
         STA   L019681
         LDA   L0196C7
         STA   L019683
         JMPL  L013F7B
L01567B  JMPL  L013F7B

L01567F  LDA   L0196C9
         AND   #$0200
         STA   $50
         STZ   L0158B5
         _PenNormal
         LDA   #$0001
         STA   L01975F
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         JSL   L0181CE
         _HideCursor
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         _GetPixel
         PLA
         EOR   #$000F
         INC
         CMP   $70
         BEQ   L0156C8
         JSR   L017ECF
         BRA   L0156D7
L0156C8  LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _SetPenPat
L0156D7  PLA
         STA   L0196C5
         PLA
         STA   L0196C7
         _ShowCursor
         BRL   L015803
L0156E9  LDA   L0196C9
         AND   #$0200
         STA   $50
         STZ   L0158B5
         PEA   $0000
         _SetPenMode
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _SetPenPat
         LDA   $34
         BEQ   L01571A
         LDA   #$0003
         PHA
         LDA   #$0002
         BRA   L015720
L01571A  PEA   $000C
         LDA   #$000A
L015720  STA   L01975F
         PHA
         _SetPenSize
         BRL   L015803
L01572E  STZ   $50
         STZ   L0158B5
         PEA   $0000
         _SetPenMode
         JSR   L017EDD
         JSR   L017EED
         JSR   L015803
         LDA   L0158BD
         PHA
         LDA   L0158BB
         PHA
         _LineTo
         JSR   L014117
         RTS

L015759  STZ   $50
         STZ   L0158B5
         PEA   $0000
         _SetPenMode
         JSR   L017EDD
         JSR   L017EED
         PHA
         PHA
         _OpenPoly
         PLA
         STA   L0157FF
         PLA
         STA   L0157FF+2
         _ShowPen
         JSR   L015803
         LDA   L0158BD
         PHA
         LDA   L0158BB
         PHA
         _LineTo
         _HidePen
         _ClosePoly
         PHA
         PHA
         _GetCursorAdr
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L0157FF+2
         PHA
         LDA   L0157FF
         PHA
         LDX   $70
         JSL   L0149AE
         PHX
         PHA
         _FillPoly
         JSR   L017EDD
         LDA   L0157FF+2
         PHA
         LDA   L0157FF
         PHA
         _FramePoly
         JSR   L014117
         LDA   L0157FF+2
         PHA
         LDA   L0157FF
         PHA
         _KillPoly
         _SetCursor
         RTS

L0157FF  ADRL  $00000000
L015803  JSR   L018126
         JSL   L0181CE
         LDA   L0196C5
         STA   L0158B7
         STA   L0158BB
         LDA   L0196C7
         STA   L0158B9
         STA   L0158BD
L01581C  LDA   L0158B9
         PHA
         LDA   L0158B7
         PHA
         _MoveTo
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         _LineTo
         LDX   L0158B7
         LDY   L0196C5
         JSR   L01412A
         LDA   L0196C5
         STA   L0158B7
         LDA   L0196C7
         STA   L0158B9
L01584F  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L01585F
         RTS

L01585F  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         JSR   L018168
         JSR   L0139B0
         LDA   L0196C7
         CMP   L0158B9
         BNE   L015886
         LDA   L0196C5
         CMP   L0158B7
         BEQ   L01584F
L015886  LDA   $50
         BEQ   L01581C
         SEC
         LDA   L0196C7
         SBC   L0158B9
         PHA
         SEC
         LDA   L0196C5
         SBC   L0158B7
         PHA
         LDA   L0158B9
         PHA
         LDA   L0158B7
         PHA
         LDA   L0158B5
         PHA
         JSL   L01855E
         PLA
         PLA
         LDA   #$0001
         STA   L0158B5
         BRL   L01581C
L0158B5  DW    $0000
L0158B7  DW    $0000
L0158B9  DW    $0000
L0158BB  DW    $0000
L0158BD  DW    $0000
L0158BF  LDA   $48
         BEQ   L0158C6
         JSR   L015981
L0158C6  LDA   $72
         DEC
         EOR   #$000F
         PHA
         _SetForeColor
         JSL   L0181CE
         STZ   L015EAA
         LDA   L0196C7
         STA   L015E94
         STA   L015E98
         STA   L015F22
         PHA
         LDA   L0196C5
         STA   L015E92
         STA   L015E96
         PHA
         SEC
         SBC   L0196B3
         SEC
         SBC   L0196B9
         STA   L015F20
         _MoveTo
         LDA   L0196AD
         STA   L015EEC
         PHA
         PHA
         _GetVisHandle
         PLA
         STA   L015EDC
         PLA
         STA   L015EDE
         PHA
         PHA
         _GetClipHandle
         PLA
         STA   L015EC0
         PLA
         STA   L015EC2
         LDA   $90
         STA   L015ECE
         LDA   $92
         STA   L015ED0
         LDA   $90
         STA   L015EB2
         LDA   $92
         STA   L015EB4
L015940  STZ   L015EC8
         LDA   #$0001
         STA   $48
         STA   L015EAC
         JSR   L01192F
         PEA   $0000
         PEA   $0000
         _GetCaretTime
         PLA
         STA   L019743
         PLA
         STA   L019745
         JSR   L015DCC
         LDA   $2C
         STA   $30
         LDA   $2E
         STA   $32
         STZ   L015E8C
         LDA   #$0100
         STA   L015E8E
         STZ   L015E90
         STZ   L015EA6
         STZ   L015EA8
         RTS

L015981  LDA   $48
         BEQ   L0159B6
         STZ   $48
         JSR   L015E54
         LDA   L0199CE
         PHA
         LDA   L0199CC
         PHA
         _HUnlock
         LDA   L015E8E
         CMP   #$0100
         BEQ   L0159B6
         PEA   $0000
         PEA   $0100
         LDA   L0199CE
         PHA
         LDA   L0199CC
         PHA
         _SetHandleSize
L0159B6  RTS

L0159B7  LDA   L0196AD
         STA   L015EEC
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   L0196BD
         JSR   L017C7F
         CMP   #$007F
         BNE   L0159D8
         BRL   L015B2A
L0159D8  LDY   L015E8C
         CPY   L015E8E
         BEQ   L015A1D
         BCC   L015A1D
         PHA
         PHY
         LDA   L0199CE
         PHA
         LDA   L0199CC
         PHA
         _HUnlock
         CLC
         LDA   L015E8E
         ADC   #$0100
         STA   L015E8E
         LDA   L015E90
         PHA
         LDA   L015E8E
         PHA
         LDA   L0199CE
         PHA
         LDA   L0199CC
         PHA
         _SetHandleSize
         BCC   L015A18
         BRK   $EA
L015A18  JSR   L015DCC
         PLY
         PLA
L015A1D  SEP   #$20
         STA   [$2C],Y
         REP   #$20
         INC   L015E8C
         INC   L015EA8
         CMP   #$000D
         BNE   L015A31
         BRL   L015ACE
L015A31  PHA
         JSR   L015E54
         LDA   $01,S
         PHA
         PHA
         _CharWidth
         PLA
         CLC
         ADC   L015EA6
         STA   L015EA6
         LDA   $7C
         BNE   L015A56
         _DrawChar
         BRL   L015A81
L015A56  CMP   #$0001
         BNE   L015A63
         LDA   L015EA6
         LSR
         STA   $01,S
         BRA   L015A68
L015A63  LDA   L015EA6
         STA   $01,S
L015A68  SEC
         LDA   L015E94
         SBC   $01,S
         STA   $01,S
         STA   L015E98
         LDA   L015E96
         PHA
         _MoveTo
         JSR   L015A88
L015A81  JSR   L015E6D
         JSR   L01412A
         RTS

L015A88  LDA   $32
         PHA
         LDA   $30
         PHA
         LDA   L015EA8
         PHA
         PEA   ^L015E9C
         PEA   L015E9C
         _TextBounds
         LDA   L015E98
         STA   L015E9E
         CLC
         ADC   L015EA6
         STA   L015EA2
         JSR   L015DF2
         PEA   ^L015EAE
         PEA   L015EAE
         _PaintPixels
         LDA   $32
         PHA
         LDA   $30
         PHA
         LDA   L015EA8
         PHA
         _DrawText
         RTS

L015ACE  LDA   L0196C9
         AND   #$2000
         BNE   L015B04
         CLC
         LDA   $30
         ADC   L015EA8
         STA   $30
         STZ   L015EA8
         STZ   L015EA6
         STZ   L015EAC
         LDA   L015E94
         STA   L015E98
         PHA
         CLC
         LDA   L015E96
         ADC   L0196AD
         STA   L015E96
         PHA
         _MoveTo
         JSR   L015E6D
         RTS

L015B04  JSR   L015981
         JSR   L0118CC
         PEA   ^L015E96
         PEA   L015E96
         _GetPen
         SEC
         LDA   L015E98
         SBC   L015E94
         STA   L015EAA
         LDA   L015E96
         STA   L015E92
         JMP   L015940

L015B2A  LDY   L015E8C
         DEY
         BPL   L015B31
         RTS

L015B31  SEP   #$20
         LDA   [$2C],Y
         REP   #$20
         AND   #$00FF
         STA   L015EA4
         CMP   #$000D
         BNE   L015B45
         BRL   L015C1E
L015B45  LDA   $32
         PHA
         LDA   $30
         PHA
         LDA   L015EA8
         PHA
         PEA   ^L015E9C
         PEA   L015E9C
         _TextBounds
         LDA   L015E98
         STA   L015E9E
         CLC
         ADC   L015EA6
         STA   L015EA2
         JSR   L015DF2
         DEC   L015E8C
         DEC   L015EA8
         PEA   $0000
         LDA   L015EA4
         PHA
         _CharWidth
         PLA
         EOR   #$FFFF
         INC
         STA   L015E9A
         CLC
         LDA   L015EA6
         ADC   L015E9A
         STA   L015EA6
         LDA   $7C
         BEQ   L015BE1
         CMP   #$0001
         BNE   L015BA2
         LDA   L015EA6
         LSR
         PHA
         BRA   L015BA6
L015BA2  LDA   L015EA6
         PHA
L015BA6  SEC
         LDA   L015E94
         SBC   $01,S
         STA   $01,S
         STA   L015E98
         LDA   L015E96
         PHA
         _MoveTo
         JSR   L015E54
         PEA   ^L015EAE
         PEA   L015EAE
         _PaintPixels
         LDA   $32
         PHA
         LDA   $30
         PHA
         LDA   L015EA8
         PHA
         _DrawText
         JSR   L015E6D
         RTS

L015BE1  LDA   L015E9A
         PHA
         PEA   $0000
         _Move
         LDA   L015EA4
         PHA
         PEA   ^L015E9C
         PEA   L015E9C
         _CharBounds
         JSR   L015E54
         PEA   ^L015EAE
         PEA   L015EAE
         _PaintPixels
         JSR   L015E54
         CLC
         LDA   L015F22
         ADC   L015E9A
         STA   L015F22
         RTS

L015C1E  DEC   L015E8C
         DEC   $30
         STZ   L015EA6
         STZ   L015EA8
L015C29  DEY
         PHY
         BPL   L015C35
         LDA   #$0001
         STA   L015EAC
         BRA   L015C5C
L015C35  SEP   #$20
         LDA   [$2C],Y
         REP   #$20
         AND   #$00FF
         CMP   #$000D
         BEQ   L015C5C
         PHA
         PHA
         _CharWidth
         PLA
         CLC
         ADC   L015EA6
         STA   L015EA6
         INC   L015EA8
         DEC   $30
         PLY
         BRA   L015C29
L015C5C  PLY
         LDA   L015EA6
         PHA
         LDX   $7C
         BEQ   L015C76
         CPX   #$0001
         BEQ   L015C71
         LDA   #$0000
         STA   $01,S
         BRA   L015C76
L015C71  LDA   $01,S
         LSR
         STA   $01,S
L015C76  SEC
         LDA   L015E94
         SBC   $01,S
         STA   L015E98
         CLC
         LDA   L015E94
         ADC   $01,S
         STA   $01,S
         SEC
         LDA   L015E96
         SBC   L0196AD
         STA   L015E96
         PHA
         _MoveTo
         LDA   L015EAC
         BEQ   L015CAC
         LDA   L015EAA
         PHA
         PEA   $0000
         _Move
L015CAC  JSR   L015E6D
         RTS

L015CB0  LDA   $48
         BNE   L015CB5
         RTS

L015CB5  LDA   #$0001
         STA   L015EAC
         JSR   L015E54
         LDA   L0196AD
         STA   L015EEC
         LDA   L015E94
         PHA
         LDA   L015E92
         PHA
         _MoveTo
         LDA   L015EAA
         PHA
         PEA   $0000
         _Move
         JSR   L011953
         LDA   $2C
         STA   $0A
         LDA   $2E
         STA   $0C
         LDY   #$0000
         PHY
         LDA   L015E92
         STA   L015E96
         LDA   L015E94
         STA   L015E98
L015CFC  PLY
         CPY   L015E8C
         BNE   L015D05
         BRL   L015DA5
L015D05  JSR   L015DA9
         PHY
         CPX   #$0000
         BNE   L015D11
         BRL   L015DA5
L015D11  PHX
         LDA   $7C
         BEQ   L015D5C
         PHA
         LDA   $0C
         PHA
         LDA   $0A
         PHA
         PHX
         SEC
         LDA   $01,S
         SBC   L015EC4
         STA   $01,S
         _TextWidth
         LDA   $7C
         CMP   #$0002
         BEQ   L015D44
         LDA   L015EAC
         BEQ   L015D41
         SEC
         LDA   $01,S
         SBC   L015EAA
         STA   $01,S
L015D41  PLA
         LSR
         PHA
L015D44  SEC
         LDA   L015E94
         SBC   $01,S
         STA   $01,S
         STA   L015E98
         LDA   L015E96
         PHA
         _MoveTo
         PLX
         PHX
L015D5C  LDA   $0C
         PHA
         LDA   $0A
         PHA
         PHX
         SEC
         LDA   $01,S
         SBC   L015EC4
         STA   $01,S
         _DrawText
         STZ   L015EAC
         CLC
         LDA   $0A
         ADC   $01,S
         STA   $0A
         PLX
         LDA   L015EC4
         BNE   L015D85
         BRL   L015CFC
L015D85  CLC
         LDA   L015E96
         ADC   L0196AD
         STA   L015E96
         LDA   $7C
         BNE   L015DA2
         LDA   L015E98
         PHA
         LDA   L015E96
         PHA
         _MoveTo
L015DA2  BRL   L015CFC
L015DA5  JSR   L015E6D
         RTS

L015DA9  STZ   L015EC4
         LDX   #$0000
L015DAF  SEP   #$20
         LDA   [$2C],Y
         REP   #$20
         AND   #$00FF
         INX
         INY
         CMP   #$000D
         BNE   L015DC6
         LDA   #$0001
         STA   L015EC4
         RTS

L015DC6  CPY   L015E8C
         BCC   L015DAF
         RTS

L015DCC  LDA   L0199CE
         PHA
         LDA   L0199CC
         PHA
         _HLock
         LDA   L0199CC
         STA   $2C
         LDA   L0199CE
         STA   $2E
         LDA   [$2C]
         TAX
         LDY   #$0002
         LDA   [$2C],Y
         STA   $2E
         STX   $2C
         RTS

L015DF2  LDA   L015E9C
         BPL   L015DFA
         STZ   L015E9C
L015DFA  LDA   L015E9E
         BPL   L015E02
         STZ   L015E9E
L015E02  LDA   L015EA0
         CMP   $F0
         BEQ   L015E10
         BCC   L015E10
         LDA   $F0
         STA   L015EA0
L015E10  LDA   L015EA2
         CMP   #$0140
         BEQ   L015E20
         BCC   L015E20
         LDA   #$0140
         STA   L015EA2
L015E20  RTS

L015E21  SEC
         LDA   L0196C1
         SBC   L015EC6
         CMP   L019743
         BCC   L015E53
         LDA   L0196C1
         STA   L015EC6
         PEA   ^L015ECA
         PEA   L015ECA
         _PaintPixels
         JSR   L014117
         LDA   L015EC8
         BEQ   L015E4D
         STZ   L015EC8
         BRA   L015E53
L015E4D  LDA   #$0001
         STA   L015EC8
L015E53  RTS

L015E54  LDA   L015EC8
         BEQ   L015E6C
         STZ   L015EC8
         PEA   ^L015ECA
         PEA   L015ECA
         _PaintPixels
         JSR   L014117
L015E6C  RTS

L015E6D  JSR   L015E54
         PEA   ^L015F20
         PEA   L015F20
         _GetPen
         SEC
         LDA   L015F20
         SBC   L0196B3
         SEC
         SBC   L0196B9
         STA   L015F20
         RTS

L015E8C  DB    $00
         DB    $00
L015E8E  DB    $00
         DB    $00
L015E90  DB    $00
         DB    $00
L015E92  DB    $00
         DB    $00
L015E94  DB    $00
         DB    $00
L015E96  DB    $00
         DB    $00
L015E98  DB    $00
         DB    $00
L015E9A  DB    $00
         DB    $00
L015E9C  DB    $00
         DB    $00
L015E9E  DB    $00
         DB    $00
L015EA0  DB    $00
         DB    $00
L015EA2  DB    $00
         DB    $00
L015EA4  DB    $00
         DB    $00
L015EA6  DB    $00
         DB    $00
L015EA8  DB    $00
         DB    $00
L015EAA  DB    $00
         DB    $00
L015EAC  DB    $00
         DB    $00
L015EAE  ADRL  L019974
L015EB2  DW    $0000
L015EB4  DW    $0000
         ADRL  L015E9C
         ADRL  L015E9C
         DW    $0000
L015EC0  DW    $0000
L015EC2  DW    $0000
L015EC4  DW    $0000
L015EC6  DW    $0000
L015EC8  DW    $0000
L015ECA  ADRL  L015EE0
L015ECE  DW    $0000
L015ED0  DW    $0000
         ADRL  L015EE8
         ADRL  L015F20
         DW    $0002
L015EDC  DW    $0000
L015EDE  DW    $0000
L015EE0  DW    $0000
         ADRL  L015EF0
         DW    $0001
L015EE8  DW    $0000
         DW    $0000
L015EEC  DW    $0008
         DW    $0001
L015EF0  HEX   F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
         HEX   F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
         HEX   F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
L015F20  DW    $0000
L015F22  DW    $0000
L015F24  JSR   L01192F
         JSL   L0181CE
         LDA   #$0000
         PHA
         LDA   L0196C9
         AND   #$0200
         PHA
         PEA   $0001
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         JSR   L017F84
         SEC
         LDA   $6A
         SBC   $66
         CMP   #$0002
         BCS   L015F79
         SEC
         LDA   $6C
         SBC   $68
         CMP   #$0002
         BCS   L015F79
         STZ   $36
         LDA   #$0004
         JSR   L0190DA
         RTS

L015F79  LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         LDY   #$459C
         LDA   #$FFFF
L015F89  STA   [$0A],Y
         DEY
         DEY
         BPL   L015F89
         LDA   L019984
         STA   $0A
         LDA   L019986
         STA   $0C
         LDY   #$459C
         LDA   #$0000
L015F9F  STA   [$0A],Y
         DEY
         DEY
         BPL   L015F9F
         LDA   #$0002
         STA   $36
         STZ   $46
         STZ   $44
         LDA   #$0003
         JSR   L0190DA
         CLC
         LDA   $66
         ADC   $6A
         LSR
         STA   L019681
         CLC
         LDA   $68
         ADC   $6C
         LSR
         STA   L019683
         PHA
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         _EqualRect
         PLA
         STA   $38
         LDA   L019998
         STA   L01999E
         LDA   L01999A
         STA   L0199A0
         LDA   L019984
         STA   L01998A
         LDA   L019986
         STA   L01998C
         STZ   L01608B
         STZ   L01608D
         SEC
         LDA   $6A
         SBC   $66
         STA   L01608F
         SEC
         LDA   $6C
         SBC   $68
         STA   L016091
         CLC
         TDC
         ADC   #$0066
         STA   L01609B
         LDA   $90
         STA   L016093
         LDA   $92
         STA   L016095
         _HideCursor
         JSR   L018E21
         PEA   ^L016093
         PEA   L016093
         _PaintPixels
         JSR   L018E07
         _ShowCursor
         PEA   ^L019825
         PEA   L019825
         _SetPort
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRect
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   $66
         STA   L019761
         LDA   $68
         STA   L019763
         LDA   $6A
         STA   L019765
         LDA   $6C
         STA   L019767
         RTS

L01608B  DW    $0000
L01608D  DW    $0000
L01608F  DW    $0000
L016091  DW    $0000
L016093  DW    $0000
L016095  DW    $0000
         ADRL  L01999C
L01609B  DW    $0000
         DW    $0000
         ADRL  L01608B
         DW    $0000
         DW    $0000
         DW    $0000
L0160A9  JSL   L0181CE
         LDA   L0196C9
         AND   #$0800
         STA   $4C
         BEQ   L0160BC
         JSR   L01473C
         BRA   L0160CA
L0160BC  LDA   L0196C9
         AND   #$0100
         STA   $4E
         BEQ   L0160CA
         JMPL  L017876

L0160CA  LDA   L0196C9
         AND   #$0200
         STA   $50
         LDA   L0196C7
         STA   L0162B0
         LDA   L0196C5
         STA   L0162AE
         STZ   L0162B2
         LDA   L019761
         STA   L019769
         LDA   L019763
         STA   L01976B
         LDA   L019765
         STA   L01976D
         LDA   L019767
         STA   L01976F
L0160F9  LDA   L0196C5
         STA   L0162AA
         LDA   L0196C7
         STA   L0162AC
         LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BEQ   L01617C
         PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         JSR   L0139B0
         SEC
         LDA   L0196C7
         SBC   L0162AC
         STA   L0162A8
         SEC
         LDA   L0196C5
         SBC   L0162AA
         STA   L0162A6
         BNE   L016143
         LDA   L0162A8
         BEQ   L0160F9
L016143  LDA   $38
         BNE   L0160F9
         LDA   $50
         BEQ   L01616B
         LDA   L0162A8
         PHA
         LDA   L0162A6
         PHA
         LDA   L0162AC
         PHA
         LDA   L0162AA
         PHA
         LDA   L0162B2
         PHA
         JSL   L01855E
         PLA
         STA   L0162A6
         PLA
         STA   L0162A8
L01616B  JSR   L01619F
         LDA   #$0001
         STA   L0162B2
         LDA   #$0001
         STA   $46
         BRL   L0160F9
L01617C  CLC
         LDA   $66
         ADC   $6A
         LSR
         STA   L019681
         CLC
         LDA   $68
         ADC   $6C
         LSR
         STA   L019683
         RTS

L01618F  LDA   $66
         STA   L0162AE
         LDA   $68
         STA   L0162B0
         STZ   L0162A8
         STZ   L0162A6
L01619F  LDA   $66
         STA   L01629E
         LDA   $68
         STA   L0162A0
         LDA   $6A
         STA   L0162A2
         LDA   $6C
         STA   L0162A4
         LDA   L0162A8
         PHA
         LDA   L0162A6
         PHA
         LDA   L0162B0
         PHA
         LDA   L0162AE
         PHA
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         JSL   L0183EE
         PLA
         STA   L0162AE
         PLA
         STA   L0162B0
         PLA
         STA   L0162A6
         PLA
         STA   L0162A8
         LDA   $66
         CMP   L01629E
         BCS   L0161F3
         STA   L01629E
L0161F3  LDA   $68
         CMP   L0162A0
         BCS   L0161FD
         STA   L0162A0
L0161FD  LDA   $6A
         CMP   L0162A2
         BCC   L016207
         STA   L0162A2
L016207  LDA   $6C
         CMP   L0162A4
         BCC   L016211
         STA   L0162A4
L016211  SEC
         LDA   L0162A0
         SBC   $58
         AND   #$FFFC
         LSR
         STA   L0162A0
         SEC
         LDA   L0162A4
         DEC
         SBC   $58
         AND   #$FFFC
         LSR
         INC
         INC
         STA   L0162A4
         LDA   L01629E
         JSL   L0182D0
         CLC
         ADC   L019976
         STA   $0A
         LDA   L019978
         STA   $0C
         LDA   $58
         LSR
         CLC
         ADC   $0A
         STA   $0A
         SEC
         LDA   L01629E
         SBC   $56
         JSL   L0182D0
         CLC
         ADC   #$3197
         STA   $0E
         LDA   #$00E1
         STA   $10
         LDA   L01999E
         STA   $12
         LDA   L0199A0
         STA   $14
         LDA   L01998A
         STA   $28
         LDA   L01998C
         STA   $2A
         LDA   L0162A0
         PHA
         LDA   L01629E
         PHA
         LDA   L0162A4
         PHA
         LDA   L0162A2
         PHA
         PEA   $FFFF
         PEA   $FFFF
         JSR   L018B29
         LDA   $36
         CMP   #$0002
         BNE   L016294
         JSR   L018E2E
L016294  LDX   L01629E
         LDY   L0162A2
         JSR   L01412A
         RTS

L01629E  DW    $0000
L0162A0  DW    $0000
L0162A2  DW    $0000
L0162A4  DW    $0000
L0162A6  DW    $0000
L0162A8  DW    $0000
L0162AA  DW    $0000
L0162AC  DW    $0000
L0162AE  DW    $0000
L0162B0  DW    $0000
L0162B2  DW    $0000
L0162B4  JSR   L013C36
         JSR   L015981
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         LDY   #$0001
         LDA   #L0163D4
         STA   L016380
         LDA   #^L0163D4
         STA   L016382
L0162D6  PHY
         CLC
         LDA   L016380
         ADC   #$0008
         STA   L016380
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         LDA   L016382
         PHA
         LDA   L016380
         PHA
         _PtInRect
         PLA
         BNE   L016305
         PLY
         INY
         CPY   #$0015
         BNE   L0162D6
         BRA   L01634F
L016305  PLY
         CPY   L01969D
         BNE   L016322
         LDA   L019741
         BEQ   L01634F
         JMP   L0187F8

L016313  PHY
         LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         PLY
L016322  PHY
         JSR   L01635D
         LDA   $76
         STA   $78
         PLY
         STY   $76
         STY   L01969D
         JSR   L01635D
L016333  LDA   $76
         CMP   #$0004
         BNE   L01633F
         JSL   L016FC2
         RTS

L01633F  DEC
         ASL
         ASL
         TAY
         LDA   L016384,Y
         STA   L019EDC
         LDA   L016384+2,Y
         STA   L019EDC+2
L01634F  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

L01635D  LDA   L01969D
         ASL
         ASL
         ASL
         CLC
         ADC   #L0163D4
         STA   L016380
         LDA   #^L0163D4
         STA   L016382
         LDA   L016382
         PHA
         LDA   L016380
         PHA
         _InvertRect
         RTS

L016380  DW    $0000
L016382  DW    $0000
L016384  ADRL  L01A198
         ADRL  L01A500
         ADRL  L01A0F0
         ADRL  $00000000
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A320
         ADRL  L01A37C
         ADRL  L019FEC
         ADRL  L01A3CC
         ADRL  L01A048
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
         ADRL  L01A268
L0163D4  DW    $0010
         DW    $0005
         DW    $0010
         DW    $0005
         DW    $0010
         DW    $0005
         DW    $001C
         DW    $0016
         DW    $001D
         DW    $0005
         DW    $0029
         DW    $0016
         DW    $002A
         DW    $0005
         DW    $0036
         DW    $0016
         DW    $0037
         DW    $0005
         DW    $0043
         DW    $0016
         DW    $0044
         DW    $0005
         DW    $0050
         DW    $0016
         DW    $0051
         DW    $0005
         DW    $005D
         DW    $0016
         DW    $005E
         DW    $0005
         DW    $006A
         DW    $0016
         DW    $006B
         DW    $0005
         DW    $0077
         DW    $0016
         DW    $0078
         DW    $0005
         DW    $0084
         DW    $0016
         DW    $0085
         DW    $0005
         DW    $0091
         DW    $0016
         DW    $0010
         DW    $0017
         DW    $001C
         DW    $0028
         DW    $001D
         DW    $0017
         DW    $0029
         DW    $0028
         DW    $002A
         DW    $0017
         DW    $0036
         DW    $0028
         DW    $0037
         DW    $0017
         DW    $0043
         DW    $0028
         DW    $0044
         DW    $0017
         DW    $0050
         DW    $0028
         DW    $0051
         DW    $0017
         DW    $005D
         DW    $0028
         DW    $005E
         DW    $0017
         DW    $006A
         DW    $0028
         DW    $006B
         DW    $0017
         DW    $0077
         DW    $0028
         DW    $0078
         DW    $0017
         DW    $0084
         DW    $0028
         DW    $0085
         DW    $0017
         DW    $0091
         DW    $0028
L01647C  STZ   L019741
         LDA   $3E
         BEQ   L016484
         RTS

L016484  LDA   $34
         BEQ   L0164A3
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L019E7C
         PEA   L019E7C
         _PtInRect
         PLA
         BEQ   L0164A3
         JSR   L013F7B
         RTS

L0164A3  LDA   $76
         CMP   #$0002
         BEQ   L0164AF
         LDA   #$0001
         STA   $3C
L0164AF  LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         LDA   $36
         BEQ   L0164D7
         BMI   L0164D7
         LDA   $44
         BEQ   L0164D7
         JMPL  L0160A9

L0164D7  JSR   L013C36
         JSR   L015981
         JSR   L0118CC
         LDA   $34
         BNE   L0164F0
         LDA   L0196C5
         STA   L019681
         LDA   L0196C7
         STA   L019683
L0164F0  LDA   $76
         DEC
         ASL
         TAX
         JSR   (L0164F9,X)
         RTS

L0164F9  DA    L014A16
         DA    L0167C4
         DA    L01688D
         DA    L014FF9
         DA    L01666C
         DA    L016522
         DA    L016522
         DA    L016522
         DA    L01572E
         DA    L0174FD
         DA    L015F24
         DA    L0158BF
         DA    L01744A
         DA    L01565F
         DA    L0156E9
         DA    L016582
         DA    L016582
         DA    L016582
         DA    L015759
         DA    L01755F
         RTS

L016522  PEA   $0002
         _SetPenMode
         JSR   L0182C2
         JSL   L0181CE
         SEC
         LDA   $76
         SBC   #$0006
         PHA
         LDA   L0196C9
         AND   #$0200
         PHA
         PEA   $0000
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         JSR   L017F84
         JSR   L017EED
         PEA   $0000
         _SetPenMode
         LDA   #$0006
         JSR   L016620
         LDX   $66
         LDY   $6A
         JSR   L01412A
         RTS

L016582  PEA   $0002
         _SetPenMode
         JSR   L0182C2
         JSL   L0181CE
         SEC
         LDA   $76
         SBC   #$0010
         PHA
         LDA   L0196C9
         AND   #$0200
         PHA
         PEA   $0000
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         JSR   L017F84
         JSR   L017EED
         PEA   $0000
         _SetPenMode
         JSR   L017ECF
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         SEC
         LDA   $76
         SBC   #$0010
         ASL
         TAX
         JMP   (L016660,X)

L0165EB  _PaintRect
         BRA   L016612
L0165F4  SEC
         LDA   $6C
         SBC   $68
         LSR
         PHA
         SEC
         LDA   $6A
         SBC   $66
         LSR
         PHA
         _PaintRRect
         BRA   L016612
L01660B  _PaintOval
L016612  LDA   #$0010
         JSR   L016620
         LDX   $66
         LDY   $6A
         JSR   L01412A
         RTS

L016620  PHA
         JSR   L017EDD
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         SEC
         LDA   $76
         SBC   $05,S
         ASL
         TAX
         JMP   (L016666,X)

L016637  _FrameRect
         BRA   L01665E
L016640  SEC
         LDA   $6C
         SBC   $68
         LSR
         PHA
         SEC
         LDA   $6A
         SBC   $66
         LSR
         PHA
         _FrameRRect
         BRA   L01665E
L016657  _FrameOval
L01665E  PLA
         RTS

L016660  DA    L0165EB
         DA    L0165F4
         DA    L01660B
L016666  DA    L016637
         DA    L016640
         DA    L016657
L01666C  LDA   L0196C9
         AND   #$0200
         STA   L0167B8
         JSR   L017EED
         JSL   L0181CE
         LDA   L0196C5
         STA   L0167B0
         LDA   L0196C7
         STA   L0167B2
         LDA   L0196C5
         STA   L0167B4
         LDA   L0196C7
         STA   L0167B6
         PEA   $0002
         _SetPenMode
         JSR   L0182C2
         JSR   L018126
         JSR   L016714
L0166A7  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L0166D2
         PEA   $0000
         _SetPenMode
         LDX   $72
         JSL   L0149AE
         PHX
         PHA
         _SetPenPat
         BRL   L016714
L0166D2  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         JSR   L018168
         JSR   L0139B0
         JSR   L01673C
         LDA   L0196C7
         CMP   L0167B6
         BNE   L0166FF
         LDA   L0196C5
         CMP   L0167B4
         BNE   L0166FF
         BRL   L0166A7
L0166FF  JSR   L016714
         LDA   L0196C7
         STA   L0167B6
         LDA   L0196C5
         STA   L0167B4
         JSR   L016714
         BRL   L0166A7
L016714  LDA   L0167B2
         PHA
         LDA   L0167B0
         PHA
         _MoveTo
         LDA   L0167B6
         PHA
         LDA   L0167B4
         PHA
         _LineTo
         LDX   L0167B0
         LDY   L0167B4
         JSR   L01412A
         RTS

L01673C  LDA   L0167B8
         BNE   L016742
         RTS

L016742  SEC
         LDA   L0167B2
         SBC   L0196C7
         BNE   L01674E
         BRL   L0167A9
L01674E  BPL   L016754
         EOR   #$FFFF
         INC
L016754  STA   L0167BC
         LSR
         STA   L0167C0
         SEC
         LDA   L0167B0
         SBC   L0196C5
         STA   L0167C2
         BNE   L01676A
         BRL   L016789
L01676A  BPL   L016770
         EOR   #$FFFF
         INC
L016770  STA   L0167BA
         LSR
         STA   L0167BE
         LDA   L0167BA
         CMP   L0167C0
         BCC   L016789
         LDA   L0167BC
         CMP   L0167BE
         BCC   L0167A9
         BRA   L016790
L016789  LDA   L0167B0
         STA   L0196C5
         RTS

L016790  LDA   L0167C2
         BMI   L01679E
         SEC
         LDA   L0167B0
         SBC   L0167BC
         BRA   L0167A5
L01679E  CLC
         LDA   L0167BC
         ADC   L0167B0
L0167A5  STA   L0196C5
         RTS

L0167A9  LDA   L0167B2
         STA   L0196C7
         RTS

L0167B0  DW    $0000
L0167B2  DW    $0000
L0167B4  DW    $0000
L0167B6  DW    $0000
L0167B8  DW    $0000
L0167BA  DW    $0000
L0167BC  DW    $0000
L0167BE  DW    $0000
L0167C0  DW    $0000
L0167C2  DW    $0000
L0167C4  JSR   L01192F
         STZ   L01688B
         LDA   L0196C9
         AND   #$0200
         STA   $50
L0167D2  LDA   L0196C7
         STA   L016885
         LDA   L0196C5
         STA   L016883
L0167DE  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L01681B
         JSR   L0118CC
         LDA   $92
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
         RTS

L01681B  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         SEC
         LDA   L016885
         SBC   L0196C7
         STA   L016889
         SEC
         LDA   L016883
         SBC   L0196C5
         STA   L016887
         BNE   L016843
         LDA   L016889
         BEQ   L0167DE
L016843  LDA   $50
         BEQ   L016867
         LDA   L016889
         PHA
         LDA   L016887
         PHA
         LDA   L016885
         PHA
         LDA   L016883
         PHA
         LDA   L01688B
         PHA
         JSL   L01855E
         PLA
         STA   L016887
         PLA
         STA   L016889
L016867  LDX   L016889
         LDY   L016887
         JSR   L0182E5
         JSR   L011953
         LDA   #$0001
         STA   L01688B
         LDA   $34
         BEQ   L016880
         JSR   L014117
L016880  BRL   L0167D2
L016883  DW    $0000
L016885  DW    $0000
L016887  DW    $0000
L016889  DW    $0000
L01688B  DW    $0000
L01688D  JSL   L0181CE
         _HideCursor
         PEA   $0000
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         _GetPixel
         PLA
         STA   L0168F0
         _ShowCursor
         LDA   $92
         PHA
         LDA   $90
         PHA
         PEA   $0000
         CLC
         TDC
         ADC   #$0056
         PHA
         JSL   L0149A7
         PHX
         PHA
         LDA   L0168F0
         PHA
         LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         _HideCursor
         JSR   L0168F2
         BCC   L0168E5
         JSR   L011953
L0168E5  _ShowCursor
         JSR   L014117
         RTS

L0168F0  DW    $0000
L0168F2  PLA
         STA   L016FB0
         PLA
         STA   L016F70
         PLA
         STA   L016F6E
         LDA   #$FFFF
         STA   L016F72
         BRA   L016922
L016906  PLA
         STA   L016FB0
         STZ   L016F70
         STZ   L016F86
         STZ   L016F8C
         STZ   L016F88
         STZ   L016F6E
         STZ   L016F8E
         STZ   L016F92
         STZ   L016F72
L016922  PLA
         AND   #$000F
         STA   L016E6A
         STA   L016E72
         XBA
         STA   L016E6E
         TSB   L016E72
         LSR
         LSR
         LSR
         LSR
         STA   L016E6C
         TSB   L016E72
         XBA
         STA   L016E70
         TSB   L016E72
         PLA
         STA   $16
         PLA
         STA   $18
         PLA
         STA   $28
         PLA
         STA   $2A
         SEC
         LDY   #$0004
         LDA   [$28],Y
         SBC   [$28]
         DEC
         STA   L016F68
         SEC
         LDY   #$0006
         LDA   [$28],Y
         LDY   #$0002
         SBC   [$28],Y
         LSR
         LSR
         STA   L016F6A
         ASL
         STA   L016F84
         PLA
         STA   $2C
         PLA
         STA   $2E
         LDA   #$0000
         PHA
         PHA
         LDY   #$0006
         LDA   [$2C],Y
         PHA
         STA   L016F66
         SEC
         LDA   [$28]
         LDY   #$0008
         SBC   [$2C],Y
         PHA
         _Multiply
         PLA
         STA   L016FA6
         PLA
         STA   L016FA8
         SEC
         LDY   #$0002
         LDA   [$28],Y
         LDY   #$000A
         SBC   [$2C],Y
         LSR
         CLC
         ADC   L016FA6
         STA   L016FA6
         LDA   L016FA8
         ADC   #$0000
         STA   L016FA8
         CLC
         LDA   L016FA6
         LDY   #$0002
         ADC   [$2C],Y
         STA   L016F62
         LDA   L016FA8
         LDY   #$0004
         ADC   [$2C],Y
         STA   L016F64
         LDA   L016FB0
         PHA
         LDA   L016F6A
         BPL   L0169DB
         BRL   L016C53
L0169DB  LDA   L016F68
         BPL   L0169E3
         BRL   L016C53
L0169E3  PHA
         PHA
         LDA   L016F6A
         DEC
         LSR
         LSR
         INC
         STA   L016F6C
         ASL
         STA   L016FAA
         PHA
         DEC
         DEC
         STA   L016F82
         LDA   L016F68
         INC
         PHA
         _Multiply
         PLA
         STA   L016FA6
         PLA
         STA   L016FA8
         PHA
         PHA
         LDA   L016FA6
         ASL
         PHA
         LDA   L016FA8
         ROL
         TAX
         PLA
         CLC
         ADC   L016FAA
         TAY
         TXA
         ADC   #$0000
         PHA
         PHY
         LDA   L01967F
         PHA
         PEA   $8010
         LDA   #$0000
         PHA
         PHA
         _NewHandle
         BCC   L016A48
         PLA
         PLA
         LDX   #$0002
         LDA   #$0201
         JSL   L017D37
         SEC
         RTS

L016A48  PLA
         STA   $0A
         STA   L016F96
         PLA
         STA   $0C
         STA   L016F98
         LDA   [$0A]
         STA   L016FA2
         LDY   #$0002
         LDA   [$0A],Y
         STA   L016FA4
         CLC
         LDA   L016FA2
         ADC   L016FAA
         STA   L016F9A
         LDA   L016FA4
         ADC   #$0000
         STA   L016F9C
         CLC
         LDA   L016F9A
         ADC   L016FA6
         STA   L016F9E
         LDA   L016F9C
         ADC   L016FA8
         STA   L016FA0
         LDA   L016F9E
         STA   $0E
         LDA   L016FA0
         STA   $10
         LDY   L016F68
L016A94  PHY
         LDY   L016F82
         LDA   #$FFFF
L016A9B  STA   [$0E],Y
         DEY
         DEY
         BPL   L016A9B
         CLC
         LDA   $0E
         ADC   L016FAA
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         PLY
         DEY
         BPL   L016A94
         JSR   L016DA8
         LDA   L016F9A
         STA   $0A
         LDA   L016F9C
         STA   $0C
         LDA   L016F9E
         STA   $0E
         LDA   L016FA0
         STA   $10
         LDA   L016F72
         BNE   L016AE2
         LDA   L016F68
         STA   L016F8A
         LDA   L016F6C
         STA   L016F90
         STA   L016F94
         BRL   L016B5C
L016AE2  SEC
         LDA   L016F70
         SBC   [$28]
         STA   L016F70
         SEC
         LDA   L016F6E
         LDY   #$0002
         SBC   [$28],Y
         STA   L016F6E
         PHA
         PHA
         LDA   L016F70
         PHA
         LDA   L016FAA
         PHA
         _Multiply
         PLA
         TAX
         CLC
         ADC   L016F9E
         STA   $0E
         PLA
         TAY
         ADC   L016FA0
         STA   $10
         CLC
         TXA
         ADC   L016F9A
         STA   $0A
         TYA
         ADC   L016F9C
         STA   $0C
         LDA   L016F6E
         LSR
         LSR
         LSR
         TAY
         LDA   L016F6E
         AND   #$0007
         ASL
         TAX
         LDA   L016FB2,X
         AND   [$0E],Y
         STA   [$0E],Y
         TYA
         AND   #$FFFE
         STA   L016F6E
         STA   L016F8E
         STA   L016F90
         STA   L016F92
         STA   L016F94
         LDA   L016F70
         STA   L016F86
         STA   L016F88
         STA   L016F8A
         STA   L016F8C
L016B5C  LDA   L016FA2
         STA   $12
         LDA   L016FA4
         STA   $14
         LDY   L016F82
         LDA   L016F72
L016B6C  STA   [$12],Y
         DEY
         DEY
         BPL   L016B6C
         STZ   L016F76
L016B75  STZ   L016F7E
         LDA   L016F76
         BMI   L016BBD
         LDY   L016F88
         BNE   L016B8C
         LDA   L016FA2
         STA   $12
         LDA   L016FA4
         STA   $14
L016B8C  STZ   L016F80
         JSR   L016C6D
         LDA   L016F80
         BNE   L016BA0
         CPY   L016F8A
         BEQ   L016BA3
         BCC   L016BA3
         BRA   L016BAE
L016BA0  STY   L016F88
L016BA3  JSR   L016D5A
         INY
         CPY   L016F68
         BEQ   L016B8C
         BCC   L016B8C
L016BAE  DEY
         STY   L016F86
         LDA   L016F88
         STA   L016F8A
         JSR   L016D81
         BRA   L016BF7
L016BBD  LDY   L016F86
         CPY   L016F68
         BNE   L016BCF
         LDA   L016FA2
         STA   $12
         LDA   L016FA4
         STA   $14
L016BCF  STZ   L016F80
         JSR   L016C6D
         LDA   L016F80
         BNE   L016BE1
         CPY   L016F8C
         BCS   L016BE4
         BRA   L016BEA
L016BE1  STY   L016F86
L016BE4  JSR   L016D81
         DEY
         BPL   L016BCF
L016BEA  INY
         STY   L016F88
         JSR   L016D5A
         LDA   L016F86
         STA   L016F8C
L016BF7  LDA   L016F8E
         STA   L016F92
         LDA   L016F90
         STA   L016F94
         LDA   #$0000
         STA   L016F90
         DEC
         STA   L016F8E
         LDA   L016F76
         EOR   #$FFFF
         STA   L016F76
         LDA   L016F7E
         BPL   L016C1E
         BRL   L016B75
L016C1E  LDA   L016F72
         BNE   L016C50
         LDA   L016F9E
         STA   $0E
         LDA   L016FA0
         STA   $10
         LDX   L016F68
L016C30  LDY   L016F82
L016C33  LDA   [$0E],Y
         EOR   #$FFFF
         STA   [$0E],Y
         DEY
         DEY
         BPL   L016C33
         CLC
         LDA   $0E
         ADC   L016FAA
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         DEX
         BPL   L016C30
L016C50  JSR   L016E74
L016C53  LDA   L016F96
         LDX   L016F98
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         CLC
         RTS

L016C6D  PHY
         LDX   L016F72
         LDY   L016F92
         BEQ   L016C7E
         PHY
         DEY
         DEY
         LDA   [$0E],Y
         XBA
         TAX
         PLY
L016C7E  LDA   [$0E],Y
         BEQ   L016CB0
         STA   L016F7A
         LDA   [$0A],Y
         EOR   #$FFFF
         STA   L016F78
         LDA   [$12],Y
         AND   L016F7A
         ORA   L016F78
L016C95  STX   L016F74
         STA   L016F7A
         XBA
         LSR   L016F74
         ROR
         XBA
         AND   L016F7A
         ORA   L016F78
         CMP   L016F7A
         BNE   L016C95
         CMP   [$0E],Y
         BNE   L016CB9
L016CB0  CPY   L016F94
         BEQ   L016CDB
         BCC   L016CDB
         BRA   L016CE4
L016CB9  SEC
         ROR   L016F7E
         SEC
         ROR   L016F80
         STA   [$0E],Y
         CPY   L016F94
         BCC   L016CCB
         STY   L016F94
L016CCB  CPY   L016F8E
         BCS   L016CD3
         STY   L016F8E
L016CD3  CPY   L016F90
         BCC   L016CDB
         STY   L016F90
L016CDB  XBA
         TAX
         INY
         INY
         CPY   L016FAA
         BCC   L016C7E
L016CE4  LDX   L016F72
         LDY   L016F94
         CPY   L016F82
         BEQ   L016CF7
         PHY
         INY
         INY
         LDA   [$0E],Y
         XBA
         TAX
         PLY
L016CF7  LDA   [$0E],Y
         BEQ   L016D29
         STA   L016F7A
         LDA   [$0A],Y
         EOR   #$FFFF
         STA   L016F78
         LDA   [$12],Y
         AND   L016F7A
         ORA   L016F78
L016D0E  STX   L016F74
         STA   L016F7A
         XBA
         ASL   L016F74
         ROL
         XBA
         AND   L016F7A
         ORA   L016F78
         CMP   L016F7A
         BNE   L016D0E
         CMP   [$0E],Y
         BNE   L016D30
L016D29  CPY   L016F92
         BCS   L016D52
         BRA   L016D58
L016D30  SEC
         ROR   L016F7E
         SEC
         ROR   L016F80
         STA   [$0E],Y
         CPY   L016F92
         BCS   L016D42
         STY   L016F92
L016D42  CPY   L016F8E
         BCS   L016D4A
         STY   L016F8E
L016D4A  CPY   L016F90
         BCC   L016D52
         STY   L016F90
L016D52  XBA
         TAX
         DEY
         DEY
         BPL   L016CF7
L016D58  PLY
         RTS

L016D5A  CLC
         LDA   $0A
         ADC   L016FAA
         STA   $0A
         LDA   $0C
         ADC   #$0000
         STA   $0C
         LDA   $0E
         STA   $12
         LDA   $10
         STA   $14
         CLC
         LDA   $0E
         ADC   L016FAA
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         RTS

L016D81  SEC
         LDA   $0A
         SBC   L016FAA
         STA   $0A
         LDA   $0C
         SBC   #$0000
         STA   $0C
         LDA   $0E
         STA   $12
         LDA   $10
         STA   $14
         SEC
         LDA   $0E
         SBC   L016FAA
         STA   $0E
         LDA   $10
         SBC   #$0000
         STA   $10
         RTS

L016DA8  LDA   L016F62
         STA   $0A
         LDA   L016F64
         STA   $0C
         LDA   L016F9A
         STA   $0E
         LDA   L016F9C
         STA   $10
         LDY   #$0000
L016DBF  PHY
         LDA   L016F6C
         ASL
         ASL
         DEC
         ASL
         TAY
L016DC8  PHY
         LDA   L016F72
         EOR   #$FFFF
         CPY   L016F84
         BCS   L016DD7
         LDA   [$0A],Y
         XBA
L016DD7  CMP   L016E72
         BNE   L016DEC
         LDA   L016F7A
         SEC
         ROR
         SEC
         ROR
         SEC
         ROR
         SEC
         ROR
         STA   L016F7A
         BRA   L016E20
L016DEC  TAX
         AND   L016E62
         CMP   L016E6A
         BEQ   L016DF6
         CLC
L016DF6  ROR   L016F7A
         TXA
         AND   L016E64
         CMP   L016E6C
         BEQ   L016E03
         CLC
L016E03  ROR   L016F7A
         TXA
         AND   L016E66
         CMP   L016E6E
         BEQ   L016E10
         CLC
L016E10  ROR   L016F7A
         TXA
         AND   L016E68
         CMP   L016E70
         BEQ   L016E1D
         CLC
L016E1D  ROR   L016F7A
L016E20  LDA   $01,S
         AND   #$0007
         BNE   L016E32
         LDA   $01,S
         LSR
         LSR
         TAY
         LDA   L016F7A
         XBA
         STA   [$0E],Y
L016E32  PLY
         DEY
         DEY
         BPL   L016DC8
         CLC
         LDA   $0A
         ADC   L016F66
         STA   $0A
         LDA   $0C
         ADC   #$0000
         STA   $0C
         CLC
         LDA   $0E
         ADC   L016FAA
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         PLY
         INY
         CPY   L016F68
         BEQ   L016E5E
         BCS   L016E61
L016E5E  BRL   L016DBF
L016E61  RTS

L016E62  DW    $000F
L016E64  DW    $00F0
L016E66  DW    $0F00
L016E68  DW    $F000
L016E6A  DW    $000F
L016E6C  DW    $00F0
L016E6E  DW    $0F00
L016E70  DW    $F000
L016E72  DW    $FFFF
L016E74  LDA   L016F9E
         STA   $0A
         LDA   L016FA0
         STA   $0C
         LDA   L016F62
         STA   $0E
         LDA   L016F64
         STA   $10
         LDY   #$0000
L016E8B  PHY
         TYA
         CLC
         ADC   [$28]
         AND   #$0007
         ASL
         ASL
         STA   L016FAC
         LDA   L016F6C
         ASL
         ASL
         DEC
         ASL
         TAY
L016EA0  PHY
         TYA
         AND   #$0007
         CMP   #$0006
         BNE   L016EC5
         LDA   $01,S
         LSR
         LSR
         DEC
         TAY
         LDA   [$0A],Y
         CMP   #$FFFF
         BNE   L016EBF
         PLA
         SEC
         SBC   #$0006
         TAY
         BRA   L016F30
L016EBF  XBA
         STA   L016F7A
         BRA   L016ED0
L016EC5  SEC
         LDA   L016F7A
         ROR
         ROR
         ROR
         ROR
         STA   L016F7A
L016ED0  STZ   L016F7C
         LDA   L016F7A
         LSR
         PHA
         BCC   L016EE0
         LDA   #$000F
         TSB   L016F7C
L016EE0  PLA
         LSR
         PHA
         BCC   L016EEB
         LDA   #$00F0
         TSB   L016F7C
L016EEB  PLA
         LSR
         PHA
         BCC   L016EF6
         LDA   #$0F00
         TSB   L016F7C
L016EF6  PLA
         LSR
         PHA
         BCC   L016F01
         LDA   #$F000
         TSB   L016F7C
L016F01  PLA
         PLY
         CPY   L016F84
         BCS   L016F30
         LDA   L016F7C
         XBA
         PHY
         PHA
         AND   [$0E],Y
         STA   L016FAE
         LDY   #$0002
         LDA   [$28],Y
         LSR
         CLC
         ADC   $03,S
         AND   #$0002
         CLC
         ADC   L016FAC
         TAY
         PLA
         EOR   #$FFFF
         AND   [$16],Y
         ORA   L016FAE
         PLY
         STA   [$0E],Y
L016F30  DEY
         DEY
         BMI   L016F37
         BRL   L016EA0
L016F37  CLC
         LDA   $0A
         ADC   L016FAA
         STA   $0A
         LDA   $0C
         ADC   #$0000
         STA   $0C
         CLC
         LDA   $0E
         ADC   L016F66
         STA   $0E
         LDA   $10
         ADC   #$0000
         STA   $10
         PLY
         INY
         CPY   L016F68
         BCS   L016F5F
L016F5C  BRL   L016E8B
L016F5F  BEQ   L016F5C
         RTS

L016F62  DW    $0000
L016F64  DW    $0000
L016F66  DW    $0000
L016F68  DW    $0000
L016F6A  DW    $0000
L016F6C  DW    $0000
L016F6E  DW    $0000
L016F70  DW    $0000
L016F72  DW    $0000
L016F74  DW    $0000
L016F76  DW    $0000
L016F78  DW    $0000
L016F7A  DW    $0000
L016F7C  DW    $0000
L016F7E  DW    $0000
L016F80  DW    $0000
L016F82  DW    $0000
L016F84  DW    $0000
L016F86  DW    $0000
L016F88  DW    $0000
L016F8A  DW    $0000
L016F8C  DW    $0000
L016F8E  DW    $0000
L016F90  DW    $0000
L016F92  DW    $0000
L016F94  DW    $0000
L016F96  DW    $0000
L016F98  DW    $0000
L016F9A  DW    $0000
L016F9C  DW    $0000
L016F9E  DW    $0000
L016FA0  DW    $0000
L016FA2  DW    $0000
L016FA4  DW    $0000
L016FA6  DW    $0000
L016FA8  DW    $0000
L016FAA  DW    $0000
L016FAC  DW    $0000
L016FAE  DW    $0000
L016FB0  DW    $0000
L016FB2  DW    $FF7F
         DW    $FFBF
         DW    $FFDF
         DW    $FFEF
         DW    $FFF7
         DW    $FFFB
         DW    $FFFD
         DW    $FFFE
L016FC2  ENT
         PHB
         PHK
         PLB
         PEA   ^L019771
         PEA   L019771
         _OpenPort
         PEA   ^L017338
         PEA   L017338
         _SetPortLoc
         PEA   ^L017340
         PEA   L017340
         _PaintRect
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         LDA   $7A
         ASL
         TAX
         JSR   (L0172F0,X)
         PEA   ^L019771
         PEA   L019771
         _ClosePort
         LDA   #L019EE4
         STA   L019EDC
         LDA   #^L019EE4
         STA   L019EDC+2
         LDX   #$003E
L01701C  LDA   L019EE8,X
         STA   L019F6C,X
         DEX
         DEX
         BPL   L01701C
         LDA   #L019F6C
         STA   $0A
         LDA   #^L019F6C
         STA   $0C
         LDA   #L019FAC
         STA   $0E
         LDA   #^L019FAC
         STA   $10
         LDX   #$0008
L01703D  LDY   #$0000
         STZ   L017348
L017043  LDA   [$0A],Y
         XBA
         PHA
         LSR   L017348
         ROR
         LSR   L017348
         ROR
         LSR   L017348
         ROR
         LSR   L017348
         ROR
         XBA
         STA   [$0E],Y
         PLA
         STA   L017348
         INY
         INY
         CPY   #$0008
         BCC   L017043
         CLC
         LDA   $0E
         ADC   #$0008
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$0008
         STA   $0A
         DEX
         BNE   L01703D
         PEA   $0000
         PEA   $0090
         _SetPort
         PLB
         RTL

L017087  LDX   #$000A
         LDY   #$0008
         BRA   L0170A5
L01708F  LDX   #$0007
         LDY   #$0005
         BRA   L0170A5
L017097  LDX   #$0004
         LDY   #$0003
         BRA   L0170A5
L01709F  LDX   #$0002
         LDY   #$0002
L0170A5  STX   L017336
         STY   L017334
         PHX
         PHY
         _SetPenSize
         PEA   ^L017330
         PEA   L017330
         _PaintRect
         RTS

L0170C2  LDA   #L01734A
         BRA   L0170D4
L0170C7  LDA   #L01738A
         BRA   L0170D4
L0170CC  LDA   #L0173CA
         BRA   L0170D4
L0170D1  LDA   #L01740A
L0170D4  STA   $0A
         LDA   #L019EE8
         STA   $0E
         LDA   #^L019EE8
         STA   $10
         LDY   #$003E
L0170E3  LDA   ($0A),Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0170E3
         RTS

L0170EC  LDA   #$0007
         BRA   L0170FE
L0170F1  LDA   #$0005
         BRA   L0170FE
L0170F6  LDA   #$0004
         BRA   L0170FE
L0170FB  LDA   #$0002
L0170FE  PHA
         PEA   $0000
         PEA   $0000
         PHA
         PEA   $0002
         PEA   $0001
         _SetPenSize
         _MoveTo
         _LineTo
         RTS

L017122  LDA   #$0007
         BRA   L017134
L017127  LDA   #$0005
         BRA   L017134
L01712C  LDA   #$0004
         BRA   L017134
L017131  LDA   #$0002
L017134  PHA
         PHA
         LDA   #$0000
         PHA
         PHA
         PEA   $0002
         PEA   $0001
         _SetPenSize
         _MoveTo
         _LineTo
         RTS

L017157  PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   #$0007
         BRA   L01719B
L017169  PEA   $0002
         PEA   $0001
         _SetPenSize
         LDA   #$0006
         BRA   L01719B
L01717B  LDA   #$0001
         PHA
         PHA
         _SetPenSize
         LDA   #$0004
         BRA   L01719B
L01718C  LDA   #$0001
         PHA
         PHA
         _SetPenSize
         LDA   #$0002
L01719B  PEA   $0000
         PHA
         LDA   #$0000
         PHA
         PHA
         _MoveTo
         _LineTo
         RTS

L0171B3  LDA   #$0009
         BRA   L0171C5
L0171B8  LDA   #$0007
         BRA   L0171C5
L0171BD  LDA   #$0005
         BRA   L0171C5
L0171C2  LDA   #$0003
L0171C5  PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0001
         PEA   $0001
         _SetPenSize
         _MoveTo
         _LineTo
         RTS

L0171EB  LDX   #$0000
         LDY   #$0006
         JSR   L018210
         LDX   #$0002
         LDY   #$0004
         JSR   L018210
         LDX   #$0004
         LDY   #$0002
         JSR   L018210
         LDX   #$0006
         LDY   #$0000
         JMP   L018210

L01720F  LDX   #$0000
         LDY   #$0002
         JSR   L018210
         LDX   #$0002
         LDY   #$0000
         JMP   L018210

L017221  LDX   #$0000
         TXY
         JSR   L018210
         LDX   #$0002
         TXY
         JSR   L018210
         LDX   #$0004
         TXY
         JSR   L018210
         LDX   #$0006
         TXY
         JMP   L018210

L01723D  LDX   #$0000
         TXY
         JSR   L018210
         LDX   #$0002
         TXY
         JMP   L018210

L01724B  LDX   #$0000
         TXY
         JSR   L018210
         LDX   #$0000
         LDY   #$0002
         JSR   L018210
         LDX   #$0000
         LDY   #$0004
         JSR   L018210
         LDX   #$0000
         LDY   #$0006
         JMP   L018210

L01726D  LDX   #$0000
         TXY
         JSR   L018210
         LDX   #$0002
         LDY   #$0000
         JSR   L018210
         LDX   #$0004
         LDY   #$0000
         JSR   L018210
         LDX   #$0006
         LDY   #$0000
         JMP   L018210

L01728F  LDX   #$0003
         LDY   #$0000
         JSR   L018210
         LDX   #$0007
         LDY   #$0000
         JSR   L018210
         LDX   #$0000
         LDY   #$0001
         JSR   L018210
         LDX   #$0003
         LDY   #$0002
         JSR   L018210
         LDX   #$0007
         LDY   #$0002
         JSR   L018210
         LDX   #$0001
         LDY   #$0003
         JSR   L018210
         LDX   #$0004
         LDY   #$0004
         JSR   L018210
         LDX   #$0000
         LDY   #$0005
         JSR   L018210
         LDX   #$0007
         LDY   #$0005
         JSR   L018210
         LDX   #$0003
         LDY   #$0006
         JMP   L018210

L0172E9  LDX   #$0000
         TXY
         JMP   L018210

L0172F0  DA    L017087
         DA    L01708F
         DA    L017097
         DA    L01709F
         DA    L0170C2
         DA    L0170C7
         DA    L0170CC
         DA    L0170D1
         DA    L0170EC
         DA    L0170F1
         DA    L0170F6
         DA    L0170FB
         DA    L017122
         DA    L017127
         DA    L01712C
         DA    L017131
         DA    L017157
         DA    L017169
         DA    L01717B
         DA    L01718C
         DA    L0171B3
         DA    L0171B8
         DA    L0171BD
         DA    L0171C2
         DA    L0171EB
         DA    L01720F
         DA    L017221
         DA    L01723D
         DA    L01724B
         DA    L01726D
         DA    L01728F
         DA    L0172E9
L017330  DW    $0000
         DW    $0000
L017334  DW    $0000
L017336  DW    $0000
L017338  DW    $0000
         ADRL  L019EE8
         DW    $0008
L017340  DW    $0000
         DW    $0000
         DW    $0008
         DW    $0010
L017348  DW    $0000
L01734A  HEX   00FFFFFF00000000
         HEX   0FFFFFFFF0000000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFFF000000
         HEX   0FFFFFFFF0000000
         HEX   00FFFFFF00000000
L01738A  HEX   00FFFF0000000000
         HEX   0FFFFFF000000000
         HEX   FFFFFFFF00000000
         HEX   FFFFFFFF00000000
         HEX   FFFFFFFF00000000
         HEX   0FFFFFF000000000
         HEX   00FFFF0000000000
         HEX   0000000000000000
L0173CA  HEX   0FFFF00000000000
         HEX   FFFFFF0000000000
         HEX   FFFFFF0000000000
         HEX   FFFFFF0000000000
         HEX   0FFFF00000000000
         HEX   0000000000000000
         HEX   0000000000000000
         HEX   0000000000000000
L01740A  HEX   0FF0000000000000
         HEX   FFFF000000000000
         HEX   FFFF000000000000
         HEX   0FF0000000000000
         HEX   0000000000000000
         HEX   0000000000000000
         HEX   0000000000000000
         HEX   0000000000000000
L01744A  _PenNormal
         LDA   #$0007
         STA   L01975F
         JSR   L017ECF
         JSL   L0181CE
         LDA   L0196C5
         STA   L0174AF
L017464  JSR   L0174B3
         LDX   L0174AF
         LDY   L0196C5
         JSR   L01412A
         LDX   L0196C7
         STX   L0174B1
         LDA   L0196C5
         STA   L0174AF
L01747C  LDA   #$0000
         PHA
         PHA
         _StillDown
         PLA
         BNE   L01748C
         RTS

L01748C  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         LDA   L0196C7
         CMP   L0174B1
         BNE   L017464
         LDA   L0196C5
         CMP   L0174AF
         BEQ   L01747C
         BRA   L017464
L0174AF  DW    $0000
L0174B1  DW    $0000
L0174B3  LDA   #$0000
L0174B6  PHA
         ASL
         ASL
         TAX
         CLC
         LDA   L0196C5
         ADC   L0174D5,X
         TAY
         CLC
         LDA   L0196C7
         ADC   L0174D7,X
         TAX
         JSR   L018210
         PLA
         INC
         CMP   #$000A
         BNE   L0174B6
         RTS

L0174D5  DW    $0000
L0174D7  DW    $0003
         DW    $0000
         DW    $0007
         DW    $0001
         DW    $0000
         DW    $0002
         DW    $0003
         DW    $0002
         DW    $0006
         DW    $0003
         DW    $0001
         DW    $0004
         DW    $0004
         DW    $0005
         DW    $0000
         DW    $0005
         DW    $0007
         DW    $0006
         DW    $0003
L0174FD  STZ   L019741
         LDA   L0196C9
         AND   #$0200
         STA   L017866
         JSR   L017EED
         JSL   L0181CE
         JSR   L018126
         LDA   L0196C5
         STA   L01785A
         STA   L01785E
         STA   L017872
         LDA   L0196C7
         STA   L01785C
         STA   L017860
         STA   L017874
L01752B  JSR   L017691
         BCC   L01752B
         PEA   $0000
         _SetPenMode
         JSR   L017EDD
         LDA   L017874
         PHA
         LDA   L017872
         PHA
         _MoveTo
         LDA   L017860
         PHA
         LDA   L01785E
         PHA
         _LineTo
         JSR   L014117
         RTS

L01755F  STZ   L019741
         LDA   L0196C9
         AND   #$0200
         STA   L017866
         JSR   L017EED
         JSL   L0181CE
         JSR   L018126
         LDA   L0196C5
         STA   L01785A
         STA   L01785E
         LDA   L0196C7
         STA   L01785C
         STA   L017860
         LDA   #$FFFF
         STA   L017858
L01758D  INC   L017858
         LDA   L017858
         ASL
         ASL
         TAX
         LDA   L01785A
         STA   L017808,X
         LDA   L01785C
         STA   L01780A,X
         LDA   L017858
         CMP   #$0013
         BEQ   L0175F8
         JSR   L017691
         BCC   L01758D
         LDA   L017858
         CMP   #$0002
         BCS   L0175F8
         PEA   $0000
         _SetPenMode
         JSR   L017EDD
         LDA   L01780A
         PHA
         LDA   L017808
         PHA
         _MoveTo
         LDA   L017858
         BEQ   L0175E8
         LDA   L01780E
         PHA
         LDA   L01780C
         PHA
         _LineTo
         RTS

L0175E8  LDA   L01780A
         PHA
         LDA   L017808
         PHA
         _LineTo
         RTS

L0175F8  PHA
         PHA
         _OpenPoly
         PLA
         STA   L017862
         PLA
         STA   L017864
         LDA   L01780A
         PHA
         LDA   L017808
         PHA
         _MoveTo
         LDA   #$0001
L01761B  PHA
         ASL
         ASL
         TAX
         LDA   L01780A,X
         PHA
         LDA   L017808,X
         PHA
         _LineTo
         PLA
         INC
         CMP   L017858
         BEQ   L01761B
         BCC   L01761B
         LDA   L01780A
         PHA
         LDA   L017808
         PHA
         _LineTo
         _ClosePoly
         LDA   L017864
         PHA
         LDA   L017862
         PHA
         JSL   L0149A7
         PHX
         PHA
         _FillPoly
         PEA   $0000
         _SetPenMode
         JSR   L017EDD
         LDA   L017864
         PHA
         LDA   L017862
         PHA
         _FramePoly
         LDA   L017864
         PHA
         LDA   L017862
         PHA
         _KillPoly
         JSR   L014117
         RTS

L017691  PEA   $0002
         _SetPenMode
         JSR   L0182C2
         JSR   L01776C
L0176A1  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   L0196BB
         CMP   #$0001
         BNE   L01772A
         JSR   L017F05
         LDA   L019741
         BEQ   L0176CA
         STZ   L019741
         SEC
         RTS

L0176CA  JSR   L01776C
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L019E74
         PEA   L019E74
         _PtInRect
         PLA
         BNE   L0176E8
         SEC
         RTS

L0176E8  PEA   $0000
         _SetPenMode
         JSR   L017EDD
         LDA   L017860
         PHA
         LDA   L01785E
         PHA
         _MoveTo
         LDA   L01785C
         PHA
         LDA   L01785A
         PHA
         _LineTo
         LDX   L01785A
         LDY   L01785E
         JSR   L01412A
         LDA   L01785A
         STA   L01785E
         LDA   L01785C
         STA   L017860
         CLC
         RTS

L01772A  PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         JSL   L0181CE
         JSR   L018168
         JSR   L0139B0
         JSR   L017794
         LDA   L0196C7
         CMP   L01785C
         BNE   L017757
         LDA   L0196C5
         CMP   L01785A
         BNE   L017757
         BRL   L0176A1
L017757  JSR   L01776C
         LDA   L0196C7
         STA   L01785C
         LDA   L0196C5
         STA   L01785A
         JSR   L01776C
         BRL   L0176A1
L01776C  LDA   L017860
         PHA
         LDA   L01785E
         PHA
         _MoveTo
         LDA   L01785C
         PHA
         LDA   L01785A
         PHA
         _LineTo
         LDX   L01785E
         LDY   L01785A
         JSR   L01412A
         RTS

L017794  LDA   L017866
         BNE   L01779A
         RTS

L01779A  SEC
         LDA   L017860
         SBC   L0196C7
         BNE   L0177A6
         BRL   L017801
L0177A6  BPL   L0177AC
         EOR   #$FFFF
         INC
L0177AC  STA   L01786A
         LSR
         STA   L01786E
         SEC
         LDA   L01785E
         SBC   L0196C5
         STA   L017870
         BNE   L0177C2
         BRL   L0177E1
L0177C2  BPL   L0177C8
         EOR   #$FFFF
         INC
L0177C8  STA   L017868
         LSR
         STA   L01786C
         LDA   L017868
         CMP   L01786E
         BCC   L0177E1
         LDA   L01786A
         CMP   L01786C
         BCC   L017801
         BRA   L0177E8
L0177E1  LDA   L01785E
         STA   L0196C5
         RTS

L0177E8  LDA   L017870
         BMI   L0177F6
         SEC
         LDA   L01785E
         SBC   L01786A
         BRA   L0177FD
L0177F6  CLC
         LDA   L01786A
         ADC   L01785E
L0177FD  STA   L0196C5
         RTS

L017801  LDA   L017860
         STA   L0196C7
         RTS

L017808  DW    $0000      ; LONG NOT WORD
L01780A  DW    $0000
L01780C  DW    $0000
L01780E  DW    $0000
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
         DW    $0000
         DW    $0000
         DW    $0000
L017858  DW    $0000
L01785A  DW    $0000
L01785C  DW    $0000
L01785E  DW    $0000
L017860  DW    $0000
L017862  DW    $0000
L017864  DW    $0000
L017866  DW    $0000
L017868  DW    $0000
L01786A  DW    $0000
L01786C  DW    $0000
L01786E  DW    $0000
L017870  DW    $0000
L017872  DW    $0000
L017874  DW    $0000
L017876  LDA   $36
         CMP   #$0002
         BEQ   L01787E
         RTS

L01787E  STZ   L017C2D
         LDA   L0199AC
         STA   L0199B2
         LDA   L0199AE
         STA   L0199B4
         LDA   L019998
         STA   L01999E
         LDA   L01999A
         STA   L0199A0
         LDA   L0196C5
         STA   L017C37
         LDA   L0196C7
         STA   L017C39
         LDA   $66
         STA   L017C41
         LDA   $68
         STA   L017C43
         LDA   $6A
         STA   L017C45
         LDA   $6C
         STA   L017C47
         LDA   $66
         STA   L017C49
         LDA   $68
         STA   L017C4B
         LDA   $6A
         STA   L017C4D
         LDA   $6C
         STA   L017C4F
         SEC
         LDA   $6A
         SBC   $66
         STA   L017C73
         SEC
         LDA   $6C
         SBC   $68
         STA   L017C75
         LDA   L017C73
         LSR
         CLC
         ADC   $66
         STA   L017C3D
         LDA   L017C75
         LSR
         CLC
         ADC   $68
         STA   L017C3F
         LDA   L0196C7
         CMP   L017C3F
         BCC   L01790B
         LDA   L0196C5
         CMP   L017C3D
         BCC   L017906
         LDA   #$0004
         BRA   L01791B
L017906  LDA   #$0002
         BRA   L01791B
L01790B  LDA   L0196C5
         CMP   L017C3D
         BCC   L017918
         LDA   #$0006
         BRA   L01791B
L017918  LDA   #$0000
L01791B  STA   L017C3B
L01791E  LDA   L0196C5
         STA   L017C33
         LDA   L0196C7
         STA   L017C35
         PHA
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDA   L0196BB
         CMP   #$0002
         BNE   L017947
         BRL   L017A47
L017947  PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         JSL   L0181CE
         JSR   L0139B0
         SEC
         LDA   L0196C7
         SBC   L017C35
         STA   L017C31
         SEC
         LDA   L0196C5
         SBC   L017C33
         STA   L017C2F
         BNE   L017979
         LDA   L017C31
         BNE   L017979
         BRL   L01791E
L017979  JSR   L018E2E
         LDX   L017C3B
         JSR   (L017A9D,X)
         LDA   $66
         STA   L017C51
         LDA   $68
         STA   L017C53
         LDA   $6A
         STA   L017C55
         LDA   $6C
         STA   L017C57
         LDA   L017C41
         STA   $66
         LDA   L017C43
         STA   $68
         LDA   L017C45
         STA   $6A
         LDA   L017C47
         STA   $6C
         LDA   $6A
         SEC
         SBC   $66
         BVS   L0179B4
         EOR   #$8000
L0179B4  BMI   L0179BE
         LDX   $66
         LDA   $6A
         STA   $66
         STX   $6A
L0179BE  LDA   $6C
         SEC
         SBC   $68
         BVS   L0179C8
         EOR   #$8000
L0179C8  BMI   L0179D2
         LDX   $68
         LDA   $6C
         STA   $68
         STX   $6C
L0179D2  LDA   $66
         SEC
         SBC   $56
         BVS   L0179DC
         EOR   #$8000
L0179DC  BMI   L0179E2
         LDA   $56
         STA   $66
L0179E2  LDA   $68
         SEC
         SBC   $58
         BVS   L0179EC
         EOR   #$8000
L0179EC  BMI   L0179F2
         LDA   $58
         STA   $68
L0179F2  LDA   $6A
         SEC
         SBC   $5A
         BEQ   L017A04
         BVS   L0179FE
         EOR   #$8000
L0179FE  BPL   L017A04
         LDA   $5A
         STA   $6A
L017A04  LDA   $6C
         SEC
         SBC   $5C
         BEQ   L017A16
         BVS   L017A10
         EOR   #$8000
L017A10  BPL   L017A16
         LDA   $5C
         STA   $6C
L017A16  LDA   $66
         CMP   L017C51
         BCS   L017A20
         STA   L017C51
L017A20  LDA   $68
         CMP   L017C53
         BCS   L017A2A
         STA   L017C53
L017A2A  LDA   $6A
         CMP   L017C55
         BCC   L017A34
         STA   L017C55
L017A34  LDA   $6C
         CMP   L017C57
         BCC   L017A3E
         STA   L017C57
L017A3E  JSR   L017AF9
         JSR   L018E2E
         BRL   L01791E
L017A47  LDA   L017C2D
         BEQ   L017A9C
         LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDY   #$459C
L017A63  LDA   [$0A],Y
         PHA
         LDA   [$0E],Y
         STA   [$0A],Y
         PLA
         STA   [$0E],Y
         DEY
         DEY
         BPL   L017A63
         CLC
         LDA   $66
         ADC   $6A
         LSR
         STA   L019681
         CLC
         LDA   $68
         ADC   $6C
         LSR
         STA   L019683
         LDA   #$000B
         STA   $46
         LDA   $66
         STA   L019761
         LDA   $68
         STA   L019763
         LDA   $6A
         STA   L019765
         LDA   $6C
         STA   L019767
L017A9C  RTS

L017A9D  DA    L017AA5
         DA    L017ABA
         DA    L017ACF
         DA    L017AE4
L017AA5  CLC
         LDA   L017C41
         ADC   L017C2F
         STA   L017C41
         CLC
         LDA   L017C43
         ADC   L017C31
         STA   L017C43
         RTS

L017ABA  CLC
         LDA   L017C41
         ADC   L017C2F
         STA   L017C41
         CLC
         LDA   L017C47
         ADC   L017C31
         STA   L017C47
         RTS

L017ACF  CLC
         LDA   L017C45
         ADC   L017C2F
         STA   L017C45
         CLC
         LDA   L017C47
         ADC   L017C31
         STA   L017C47
         RTS

L017AE4  CLC
         LDA   L017C45
         ADC   L017C2F
         STA   L017C45
         CLC
         LDA   L017C43
         ADC   L017C31
         STA   L017C43
         RTS

L017AF9  LDA   #$0001
         STA   L017C2D
         SEC
         LDA   $6A
         SBC   $66
         STA   L017C7B
         SEC
         LDA   $6C
         SBC   $68
         STA   L017C7D
         PEA   ^L01999C
         PEA   L01999C
         PEA   ^L0199B0
         PEA   L0199B0
         PEA   ^L017C6F
         PEA   L017C6F
         PEA   ^L017C77
         PEA   L017C77
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _CopyPixels
         SEC
         LDA   L017C53
         SBC   $58
         AND   #$FFFC
         LSR
         STA   L017C53
         SEC
         LDA   L017C57
         DEC
         SBC   $58
         AND   #$FFFC
         LSR
         INC
         INC
         STA   L017C57
         LDA   L017C51
         JSL   L0182D0
         CLC
         ADC   L019976
         STA   $0A
         LDA   L019978
         STA   $0C
         LDA   $58
         LSR
         CLC
         ADC   $0A
         STA   $0A
         SEC
         LDA   L017C51
         SBC   $56
         JSL   L0182D0
         CLC
         ADC   #$3197
         STA   $0E
         LDA   #$00E1
         STA   $10
         LDA   L0199AC
         STA   $12
         LDA   L0199AE
         STA   $14
         LDA   L019984
         STA   $28
         LDA   L019986
         STA   $2A
         LDA   L017C53
         PHA
         LDA   L017C51
         PHA
         LDA   L017C57
         PHA
         LDA   L017C55
         PHA
         PEA   $FFFF
         PEA   $FFFF
         JSR   L018B29
         LDX   L017C51
         LDY   L017C55
         JSR   L01412A
         RTS

L017BBA  LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDY   #$459C
L017BD1  LDA   [$0E],Y
         PHA
         LDA   [$0A],Y
         STA   [$0E],Y
         PLA
         STA   [$0A],Y
         DEY
         DEY
         BPL   L017BD1
         LDX   L017C49
         LDA   $66
         STA   L017C49
         STX   L017C41
         STX   $66
         LDX   L017C4B
         LDA   $68
         STA   L017C4B
         STX   L017C43
         STX   $68
         LDX   L017C4D
         LDA   $6A
         STA   L017C4D
         STX   L017C45
         STX   $6A
         LDX   L017C4F
         LDA   $6C
         STA   L017C4F
         STX   L017C47
         STX   $6C
         JSR   L013C57
         JSR   L011953
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         JSR   L014117
         JSR   L013C4D
         RTS

L017C2D  DW    $0000
L017C2F  DW    $0000
L017C31  DW    $0000
L017C33  DW    $0000
L017C35  DW    $0000
L017C37  DW    $0000
L017C39  DW    $0000
L017C3B  DW    $0000
L017C3D  DW    $0000
L017C3F  DW    $0000
L017C41  DW    $0000
L017C43  DW    $0000
L017C45  DW    $0000
L017C47  DW    $0000
L017C49  DW    $0000
L017C4B  DW    $0000
L017C4D  DW    $0000
L017C4F  DW    $0000
L017C51  DW    $0000
L017C53  DW    $0000
L017C55  DW    $0000
L017C57  DW    $0000
         ADRL  L01999C
         ADRL  L0199B0
         ADRL  L017C6F
         ADRL  L017C77
         DW    $0000
         DW    $0000
         DW    $0000
L017C6F  DW    $0000
         DW    $0000
L017C73  DW    $0000
L017C75  DW    $0000
L017C77  DW    $0000
         DW    $0000
L017C7B  DW    $0000
L017C7D  DW    $0000

L017C7F  LDY   #$0014
L017C82  CMP   L017CB3,Y
         BEQ   L017C8C
         DEY
         DEY
         BPL   L017C82
         RTS

L017C8C  PHY
         LDA   L019691
         ASL
         TAY
         LDA   L017C9B,Y
         STA   $28
         PLY
         LDA   ($28),Y
         RTS

L017C9B  DA    L017CB3
         DA    L017CC9
         DA    L017CDF
         DA    L017CB3
         DA    L017D0B
         DA    L017D21
         DA    L017CF5
         DA    L017CB3
         DA    L017CB3
         DA    L017CB3
         DA    L017CB3
         DA    L017CB3
L017CB3  DW    $0023
         DW    $0040
         DW    $005B
         DW    $005C
         DW    $005D
         DW    $005E
         DW    $0060
         DW    $007B
         DW    $007C
         DW    $007D
         DW    $007E
L017CC9  DW    $00A3
         DW    $0040
         DW    $005B
         DW    $005C
         DW    $005D
         DW    $005E
         DW    $0060
         DW    $007B
         DW    $007C
         DW    $007D
         DW    $007E
L017CDF  DW    $00A3
         DW    $0088
         DW    $00A1
         DW    $008D
         DW    $00A4
         DW    $005E
         DW    $0060
         DW    $008E
         DW    $009D
         DW    $008F
         DW    $00AC
L017CF5  DW    $0023
         DW    $00A4
         DW    $0080
         DW    $0085
         DW    $0086
         DW    $005E
         DW    $0060
         DW    $008A
         DW    $009A
         DW    $009F
         DW    $00A7
L017D0B  DW    $00A3
         DW    $00A4
         DW    $00C1
         DW    $0084
         DW    $00C0
         DW    $005E
         DW    $0060
         DW    $00A1
         DW    $0096
         DW    $0082
         DW    $007E
L017D21  DW    $00A3
         DW    $00A4
         DW    $00A1
         DW    $0082
         DW    $008E
         DW    $005E
         DW    $009D
         DW    $0088
         DW    $0098
         DW    $008F
         DW    $0093

L017D37  ENT
         PHB
         PHK
         PLB
         STA   L017E3E
         STX   L017E40
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         _ShowCursor
         LDA   L017E40
         CMP   #$0001
         BNE   L017D61
         BRL   L017DAE
L017D61  LDA   L017E3E
         PHA
         PEA   ^L017E42+1
         PEA   L017E42+1
         PEA   $0004
         _Int2Hex
         PEA   ^L017E42
         PEA   L017E42
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         _ParamText
         LDA   L017E40
         BNE   L017D93
         BRL   L017DF4
L017D93  CMP   #$0002
         BNE   L017D9B
         BRL   L017DD0
L017D9B  CMP   #$0100
         BNE   L017DC2
         LDA   #L0106E7
         STA   L017EC3
         LDA   #^L0106E7
         STA   L017EC3+2
         BRA   L017E23
L017DAE  LDA   L017E3E
         ASL
         ASL
         TAX
         LDA   L017E79,X
         STA   L017EC3
         LDA   L017E79+2,X
         STA   L017EC3+2
         BRA   L017E23
L017DC2  LDA   #L010653
         STA   L017EC3
         LDA   #^L010653
         STA   L017EC3+2
         BRA   L017E23
L017DD0  LDA   L017E3E
         CMP   #$0201
         BEQ   L017DE6
         LDA   #L01063C
         STA   L017EC3
         LDA   #^L01063C
         STA   L017EC3+2
         BRA   L017E23
L017DE6  LDA   #L0107CD
         STA   L017EC3
         LDA   #^L0107CD
         STA   L017EC3+2
         BRA   L017E23
L017DF4  LDA   #L010629
         STA   L017EC3
         LDA   #^L010629
         STA   L017EC3+2
         LDX   L017E47
         LDA   L017E3E
L017E06  CMP   L017E49,X
         BEQ   L017E15
         DEX
         DEX
         DEX
         DEX
         DEX
         DEX
         BPL   L017E06
         BRA   L017E23
L017E15  INX
         INX
         LDA   L017E4B,X
         STA   L017EC3+2
         LDA   L017E49,X
         STA   L017EC3
L017E23  PHA
         PEA   ^L017E85
         PEA   L017E85
         PEA   $0000
         PEA   $0000
         _Alert
         PLA
         JSL   L010D82
         PLB
         RTL

L017E3E  DW    $0000
L017E40  DW    $0000
L017E42  STR   '    '
L017E47  DW    $002A
L017E49  DW    $002B
L017E4B  ADRL  L010755
         DW    $0044
         ADRL  L010771
         DW    $0045
         ADRL  L010771
         DW    $0046
         ADRL  L010771
         DW    $0047
         ADRL  L010785
         DW    $0048
         ADRL  L01079F
         DW    $0049
         ADRL  L0107AD
         DW    $004E
         ADRL  L0107BE
L017E79  ADRL  L010550
         ADRL  L01056A
         ADRL  L010586
L017E85  DW    $0028      ; Alert rect
         DW    $003C
         DW    $0064
         DW    $012C
         DW    $0001      ; Alert ID
         HEX   80         ; First stage byte
         HEX   80         ; Second stage byte
         HEX   80         ; Third stage byte
         HEX   80         ; fourth stage byte
         ADRL  L017E9F    ; Ptr to item template
         ADRL  L017EB7    ; Ptr to item template
         ADRL  $00000000
L017E9F  DW    $0001      ; Item ID
         DW    $0024      ; Item rect
         DW    $005A
         DW    $0032
         DW    $00A0
         DW    $000A      ; Std button
         ADRL  L01046F    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L017EB7  DW    $0004      ; Item ID
         DW    $0011      ; Item rect
         DW    $001E
         DW    $001F
         DW    $0122
         DW    $000F      ; Static text
L017EC3  ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L017ECF  JSL   L0149A7
         PHX
         PHA
         _SetPenPat
         RTS

L017EDD  LDX   $72
         JSL   L0149AE
         PHX
         PHA
         _SetPenPat
         RTS

L017EED  LDA   $6E
         ASL
         ASL
         TAY
         LDA   L019ECE,Y
         PHA
         LDA   L019ECC,Y
         PHA
         STA   L01975F
         _SetPenSize
         RTS

L017F05  SEC
         LDA   L0196C1
         SBC   L019735
         STA   L019757
         LDA   L0196C1+2
         SBC   L019737
         CMP   L01973F
         BNE   L017F20
         LDA   L019757
         CMP   L01973D
L017F20  BEQ   L017F24
         BCS   L017F54
L017F24  SEC
         LDA   L0196C7
         SBC   L01973B
         BPL   L017F34
         EOR   #$FFFF
         CLC
         ADC   #$0001
L017F34  CMP   #$0006
         BCS   L017F54
         SEC
         LDA   L0196C5
         SBC   L019739
         BPL   L017F49
         EOR   #$FFFF
         CLC
         ADC   #$0001
L017F49  CMP   #$0006
         BCS   L017F54
         LDA   #$0001
         STA   L019741
L017F54  LDA   L0196C1
         STA   L019735
         LDA   L0196C1+2
         STA   L019737
         LDA   L0196C7
         STA   L01973B
         LDA   L0196C5
         STA   L019739
         RTS

L017F6D  INC
         STA   L019755
         SEP   #$20
         STA   L017F7A+1
         REP   #$20
         LDA   $01,S
L017F7A  STA   $05,S
         CLC
         TSC
         ADC   L019755
         DEC
         TCS
         RTS

L017F84  LDA   $03,S
         STA   L0180B5
         LDA   $05,S
         STA   L0180B7
         LDA   $07,S
         STA   L0180B1
         LDA   $09,S
         STA   L0180B3
         LDA   $0B,S
         STA   $6A
         LDA   $0D,S
         STA   $6C
         LDA   $0F,S
         STA   $66
         LDA   $11,S
         STA   $68
         LDA   #$0001
         STA   L01975F
         PHA
         PHA
         _SetPenSize
         JSR   L018126
         LDA   $13,S
         BEQ   L017FC1
         JSR   L018DDB
L017FC1  LDA   $13,S
         BEQ   L017FC8
         JSR   L018E75
L017FC8  LDA   #$0000
         PHA
         PHA
         _WaitMouseUp
         PLA
         BNE   L017FE4
         LDA   $13,S
         BNE   L017FDE
         JSR   L01806A
L017FDE  LDA   #$0016
         JMP   L017F6D

L017FE4  PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         JSL   L0181CE
         JSR   L018168
         JSR   L0139B0
         JSR   L0180C5
         LDA   L0196C7
         CMP   L0180B7
         BNE   L018011
         LDA   L0196C5
         CMP   L0180B5
         BNE   L018011
         BRL   L017FC1
L018011  LDA   L0196C7
         STA   L0180B7
         LDA   L0196C5
         STA   L0180B5
         JSR   L01806A
         LDA   L0180B1
         STA   $66
         LDA   L0180B3
         STA   $68
         LDA   L0180B5
         STA   $6A
         LDA   L0180B7
         STA   $6C
         LDA   $6A
         SEC
         SBC   $66
         BVS   L01803E
         EOR   #$8000
L01803E  BMI   L018048
         LDX   $66
         LDA   $6A
         STA   $66
         STX   $6A
L018048  LDA   $6C
         SEC
         SBC   $68
         BVS   L018052
         EOR   #$8000
L018052  BMI   L01805C
         LDX   $68
         LDA   $6C
         STA   $68
         STX   $6C
L01805C  LDA   $15,S
         BNE   L018064
         INC   $6A
         INC   $6C
L018064  JSR   L01806A
         BRL   L017FC1
L01806A  LDA   $15,S
         BEQ   L018072
         JSR   L018E2E
         RTS

L018072  PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         LDA   $1D,S
         ASL
         TAX
         JMP   (L0180BF,X)

L018082  _FrameRect
         BRA   L0180A9
L01808B  _FrameOval
         BRA   L0180A9
L018094  SEC
         LDA   $6C
         SBC   $68
         LSR
         PHA
         SEC
         LDA   $6A
         SBC   $66
         LSR
         PHA
         _FrameRRect
L0180A9  LDX   $66
         LDY   $6A
         JSR   L01412A
         RTS

L0180B1  DW    $0000
L0180B3  DW    $0000
L0180B5  DW    $0000
L0180B7  DW    $0000
L0180B9  DW    $0000
L0180BB  DW    $0000
L0180BD  DW    $0000
L0180BF  DA    L018082
         DA    L018094
         DA    L01808B
L0180C5  LDA   $17,S
         BNE   L0180CA
         RTS

L0180CA  SEC
         LDA   L0196C7
         SBC   L0180B3
         STA   L0180B9
         BPL   L0180DA
         EOR   #$FFFF
         INC
L0180DA  PHA
         SEC
         LDA   L0196C5
         SBC   L0180B1
         STA   L0180BB
         BPL   L0180EB
         EOR   #$FFFF
         INC
L0180EB  CMP   $01,S
         BCC   L0180F1
         LDA   $01,S
L0180F1  STA   L0180BD
         PLA
         LDA   L0180B9
         BMI   L018103
         CLC
         LDA   L0180B3
         ADC   L0180BD
         BRA   L01810A
L018103  SEC
         LDA   L0180B3
         SBC   L0180BD
L01810A  STA   L0196C7
         LDA   L0180BB
         BMI   L01811B
         CLC
         LDA   L0180B1
         ADC   L0180BD
         BRA   L018122
L01811B  SEC
         LDA   L0180B1
         SBC   L0180BD
L018122  STA   L0196C5
         RTS

L018126  PEA   ^L0199C4
         PEA   L0199C4
         _GetPortRect
         PEA   ^L019751
         PEA   L019751
         _GetPenSize
         SEC
         LDA   L0199C8
         SBC   L019751
         STA   L0199C8
         SEC
         LDA   L0199CA
         SBC   L019753
         STA   L0199CA
         LDA   $76
         CMP   #$0001
         BNE   L018167
         INC   L0199C4
         INC   L0199C6
         DEC   L0199C8
         DEC   L0199CA
L018167  RTS

L018168  PHA
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0199C4
         PEA   L0199C4
         _PtInRect
         PLA
         BNE   L0181CD
         LDA   L0196C7
         SEC
         SBC   L0199C6
         BVS   L01818B
         EOR   #$8000
L01818B  BPL   L0181A0
         LDA   L0199CA
         SEC
         SBC   L0196C7
         BVS   L018199
         EOR   #$8000
L018199  BMI   L0181A6
         LDA   L0199CA
         BRA   L0181A3
L0181A0  LDA   L0199C6
L0181A3  STA   L0196C7
L0181A6  LDA   L0196C5
         SEC
         SBC   L0199C4
         BVS   L0181B2
         EOR   #$8000
L0181B2  BPL   L0181C7
         LDA   L0199C8
         SEC
         SBC   L0196C5
         BVS   L0181C0
         EOR   #$8000
L0181C0  BMI   L0181CD
         LDA   L0199C8
         BRA   L0181CA
L0181C7  LDA   L0199C4
L0181CA  STA   L0196C5
L0181CD  RTS

L0181CE  ENT
         PHB
         PHK
         PLB
         LDA   $34
         BEQ   L01820E
         PHA
         PHA
         SEC
         LDA   L0196C7
         SBC   $58
         DEC
         DEC
         PHA
         PEA   $0006
         _SDivide
         PLA
         CLC
         ADC   $58
         STA   L0196C7
         PLA
         PHA
         PHA
         SEC
         LDA   L0196C5
         SBC   $56
         DEC
         PHA
         PEA   $0006
         _SDivide
         PLA
         CLC
         ADC   $56
         STA   L0196C5
         PLA
L01820E  PLB
         RTL

L018210  PHX
         PHY
         PHX
         PHY
         _MoveTo
         _LineTo
         RTS

L018223  ENT
         PHB
         PHK
         PLB
         LDA   $09,S
         STA   L0187E8
         CLC
         ADC   $05,S
         STA   L0187EC
         LDA   $0B,S
         STA   L0187EA
         CLC
         ADC   $07,S
         STA   L0187EE
         PHA
         PHA
         PEA   ^L0187AA
         PEA   L0187AA
         _NewWindow
         LDA   $01,S
         STA   $A0
         LDA   $03,S
         STA   $A2
         _SetPort
         LDA   #$0000
         PHA
         PHA
         _SetOrigin
         PEA   ^L019749
         PEA   L019749
         _GetPortRect
         PEA   ^L019749
         PEA   L019749
         LDA   #$0002
         PHA
         PHA
         _InsetRect
         LDA   #$0002
         PHA
         PHA
         _SetPenSize
         PEA   ^L019749
         PEA   L019749
         _FrameRect
         LDA   #$0001
         PHA
         PHA
         _SetPenSize
         PLX
         PLY
         PLA
         PLA
         PLA
         PLA
         PHY
         PHX
         PLB
         RTL

         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         RTS

L0182C2  PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         RTS

L0182D0  ENT
         PHB
         PHK
         PLB
         ASL
         STA   L0182E3
         ASL
         ASL
         CLC
         ADC   L0182E3
         ASL
         ASL
         ASL
         ASL
         PLB
         RTL

L0182E3  DW    $0000
L0182E5  STX   L0183E2
         STY   L0183E4
         LDA   $34
         BNE   L018309
         LDA   L01997C
         STA   L0183E6
         LDA   L01997E
         STA   L0183E8
         LDA   L019980
         STA   L0183EA
         LDA   L019982
         STA   L0183EC
         BRA   L01831D
L018309  LDA   $5E
         STA   L0183E6
         LDA   $60
         STA   L0183E8
         LDA   $62
         STA   L0183EA
         LDA   $64
         STA   L0183EC
L01831D  LDA   $56
         STA   L019749
         LDA   $58
         STA   L01974B
         LDA   $5A
         STA   L01974D
         LDA   $5C
         STA   L01974F
         PEA   ^L019749
         PEA   L019749
         LDA   L0183E2
         PHA
         LDA   L0183E4
         PHA
         _OffsetRect
         LDA   L019749
         SEC
         SBC   L0183E6
         BVS   L018352
         EOR   #$8000
L018352  BMI   L01835F
         SEC
         LDA   L0183E6
         SBC   $56
         STA   L0183E4
         BRA   L01831D
L01835F  LDA   L01974B
         SEC
         SBC   L0183E8
         BVS   L01836B
         EOR   #$8000
L01836B  BMI   L018378
         SEC
         LDA   L0183E8
         SBC   $58
         STA   L0183E2
         BRA   L01831D
L018378  LDA   L01974D
         SEC
         SBC   L0183EA
         BEQ   L018394
         BVS   L018386
         EOR   #$8000
L018386  BPL   L018394
         SEC
         LDA   L0183EA
         SBC   $5A
         STA   L0183E4
         BRL   L01831D
L018394  LDA   L01974F
         SEC
         SBC   L0183EC
         BEQ   L0183B0
         BVS   L0183A2
         EOR   #$8000
L0183A2  BPL   L0183B0
         SEC
         LDA   L0183EC
         SBC   $5C
         STA   L0183E2
         BRL   L01831D
L0183B0  LDA   #$0001
         TRB   L01974B
         TRB   L01974F
         LDA   L019749
         STA   $56
         LDA   L01974B
         STA   $58
         LDA   L01974D
         STA   $5A
         LDA   L01974F
         STA   $5C
         CLC
         LDA   L0183E4
         ADC   L019681
         STA   L019681
         CLC
         LDA   L0183E2
         ADC   L019683
         STA   L019683
         RTS

L0183E2  DW    $0000
L0183E4  DW    $0000
L0183E6  DW    $0000
L0183E8  DW    $0000
L0183EA  DW    $0000
L0183EC  DW    $0000
L0183EE  ENT
         PHB
         PHK
         PLB
         PLA
         STA   L01855A
         PLA
         STA   L01855C
         PLA
         STA   $0A
         STA   L018546
         PLA
         STA   $0C
         STA   L018548
         LDA   [$0A]
         STA   L01854A
         LDY   #$0002
         LDA   [$0A],Y
         STA   L01854C
         LDY   #$0004
         LDA   [$0A],Y
         STA   L01854E
         LDY   #$0006
         LDA   [$0A],Y
         STA   L018550
         PLA
         STA   $0A
         PLA
         STA   $0C
         LDA   [$0A]
         STA   L018552
         LDY   #$0002
         LDA   [$0A],Y
         STA   L018554
         LDY   #$0004
         LDA   [$0A],Y
         STA   L018556
         LDY   #$0006
         LDA   [$0A],Y
         STA   L018558
         CLC
         LDA   $01,S
         ADC   $05,S
         CMP   L0196C5
         BEQ   L018457
         SEC
         LDA   L0196C5
         SBC   $01,S
         STA   $05,S
L018457  CLC
         LDA   $03,S
         ADC   $0B,S
         CMP   L0196C7
         BEQ   L018469
         SEC
         LDA   L0196C7
         SBC   $03,S
         STA   $07,S
L018469  CLC
         LDA   L01854A
         ADC   $05,S
         STA   L019749
         LDA   L019749
         SEC
         SBC   L018552
         BVS   L01847E
         EOR   #$8000
L01847E  BMI   L01848C
         SEC
         LDA   L018552
         STA   L019749
         SBC   L01854A
         STA   $05,S
L01848C  CLC
         LDA   L01854C
         ADC   $07,S
         STA   L01974B
         LDA   L01974B
         SEC
         SBC   L018554
         BVS   L0184A1
         EOR   #$8000
L0184A1  BMI   L0184AF
         SEC
         LDA   L018554
         STA   L01974B
         SBC   L01854C
         STA   $07,S
L0184AF  CLC
         LDA   L01854E
         ADC   $05,S
         STA   L01974D
         LDA   L01974D
         SEC
         SBC   L018556
         BEQ   L0184DB
         BVS   L0184C6
         EOR   #$8000
L0184C6  BPL   L0184DB
         SEC
         LDA   L018556
         STA   L01974D
         SBC   L01854E
         STA   $05,S
         CLC
         ADC   L01854A
         STA   L019749
L0184DB  CLC
         LDA   L018550
         ADC   $07,S
         STA   L01974F
         LDA   L01974F
         SEC
         SBC   L018558
         BEQ   L018507
         BVS   L0184F2
         EOR   #$8000
L0184F2  BPL   L018507
         SEC
         LDA   L018558
         STA   L01974F
         SBC   L018550
         STA   $07,S
         CLC
         ADC   L01854C
         STA   L01974B
L018507  LDA   L018546
         STA   $0A
         LDA   L018548
         STA   $0C
         LDA   L019749
         STA   [$0A]
         LDY   #$0002
         LDA   L01974B
         STA   [$0A],Y
         LDY   #$0004
         LDA   L01974D
         STA   [$0A],Y
         LDY   #$0006
         LDA   L01974F
         STA   [$0A],Y
         CLC
         LDA   $01,S
         ADC   $05,S
         STA   $01,S
         CLC
         LDA   $03,S
         ADC   $07,S
         STA   $03,S
         LDA   L01855C
         PHA
         LDA   L01855A
         PHA
         PLB
         RTL

L018546  DW    $0000
L018548  DW    $0000
L01854A  DW    $0000
L01854C  DW    $0000
L01854E  DW    $0000
L018550  DW    $0000
L018552  DW    $0000
L018554  DW    $0000
L018556  DW    $0000
L018558  DW    $0000
L01855A  DW    $0000
L01855C  DW    $0000
         MX    %00
L01855E  ENT
         PHB
         PHK
         PLB
         LDA   $05,S
         BNE   L018595
         LDA   $0D,S
         STA   L0185BE
         BPL   L018573
         EOR   #$FFFF
         INC
         STA   L0185BE
L018573  LDA   $0B,S
         STA   L0185BC
         BPL   L018581
         EOR   #$FFFF
         INC
         STA   L0185BC
L018581  LDA   #$0001
         STA   L0185C0
         LDA   L0185BC
         CMP   L0185BE
         BCS   L018595
         LDA   #$0002
         STA   L0185C0
L018595  LDA   L0185C0
         CMP   #$0001
         BEQ   L0185A9
         LDA   #$0000
         STA   $0B,S
         LDA   $07,S
         STA   L0196C5
         BRA   L0185B3
L0185A9  LDA   #$0000
         STA   $0D,S
         LDA   $09,S
         STA   L0196C7
L0185B3  PLX
         PLY
         PLA
         PLA
         PLA
         PHY
         PHX
         PLB
         RTL

L0185BC  DW    $0000
L0185BE  DW    $0000
L0185C0  DW    $0000
L0185C2  ENT
         PHB
         PHK
         PLB
         LDA   L0196BD
         CMP   #$001B
         BNE   L018604
         LDA   L0196C9
         AND   #$0100
         BEQ   L018604
         LDA   L0196C9
         AND   #$0800
         BEQ   L018604
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
         PLB
         SEC
         RTL

L018604  PLB
         CLC
         RTL

L018607  ASL
         TAY
         LDA   L01860D,Y
         RTS

L01860D  DW    $0000
         DW    $0086
         DW    $010C
         DW    $0192
         DW    $0218
         DW    $029E
         DW    $0324
         DW    $03AA
         DW    $0430
         DW    $04B6
         DW    $053C
         DW    $05C2
         DW    $0648
         DW    $06CE
         DW    $0754
         DW    $07DA
         DW    $0860
         DW    $08E6
         DW    $096C
         DW    $09F2
         DW    $0A78
         DW    $0AFE
         DW    $0B84
         DW    $0C0A
         DW    $0C90
         DW    $0D16
         DW    $0D9C
         DW    $0E22
         DW    $0EA8
         DW    $0F2E
         DW    $0FB4
         DW    $103A
         DW    $10C0
         DW    $1146
         DW    $11CC
         DW    $1252
         DW    $12D8
         DW    $135E
         DW    $13E4
         DW    $146A
         DW    $14F0
         DW    $1576
         DW    $15FC
         DW    $1682
         DW    $1708
         DW    $178E
         DW    $1814
         DW    $189A
         DW    $1920
         DW    $19A6
         DW    $1A2C
         DW    $1AB2
         DW    $1B38
         DW    $1BBE
         DW    $1C44
         DW    $1CCA
         DW    $1D50
         DW    $1DD6
         DW    $1E5C
         DW    $1EE2
         DW    $1F68
         DW    $1FEE
         DW    $2074
         DW    $20FA
         DW    $2180
         DW    $2206
         DW    $228C
         DW    $2312
         DW    $2398
         DW    $241E
         DW    $24A4
         DW    $252A
         DW    $25B0
         DW    $2636
         DW    $26BC
         DW    $2742
         DW    $27C8
         DW    $284E
         DW    $28D4
         DW    $295A
         DW    $29E0
         DW    $2A66
         DW    $2AEC
         DW    $2B72
         DW    $2BF8
         DW    $2C7E
         DW    $2D04
         DW    $2D8A
         DW    $2E10
         DW    $2E96
         DW    $2F1C
         DW    $2FA2
         DW    $3028
         DW    $30AE
         DW    $3134
         DW    $31BA
         DW    $3240
         DW    $32C6
         DW    $334C
         DW    $33D2
         DW    $3458
         DW    $34DE
         DW    $3564
         DW    $35EA
         DW    $3670
         DW    $36F6
         DW    $377C
         DW    $3802
         DW    $3888
         DW    $390E
         DW    $3994
         DW    $3A1A
         DW    $3AA0
         DW    $3B26
         DW    $3BAC
         DW    $3C32
         DW    $3CB8
         DW    $3D3E
         DW    $3DC4
         DW    $3E4A
         DW    $3ED0
         DW    $3F56
         DW    $3FDC
         DW    $4062
         DW    $40E8
         DW    $416E
         DW    $41F4
         DW    $427A
         DW    $4300
         DW    $4386
         DW    $440C
         DW    $4492
         DW    $4518

*--- Request memory
*
* X: size high
* A: size low
* Y: attributes
*

L018717  ENT
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PHX
         PHA
         LDA   L01967F
         PHA
         PHY
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L01873B
         PLA
         PLA
         PLB
         SEC
         RTL

L01873B  PLA
         STA   $0A
         PLA
         STA   $0C
         PLB
         CLC
         RTL

L018744  ENT
         PHB
         PHK
         PLB
         JSR   L013C36
         JSR   L015981
         JSR   L01192F
         PLB
         RTL

L018752  ENT
         PHB
         PHK
         PLB
         LDA   L019EE0+2
         PHA
         LDA   L019EE0
         PHA
         _SetCursor
         LDA   #$0001
         STA   $54
         PLB
         RTL

L01876B  PHB
         PHK
         PLB
         PHA
         PHA
         _FrontWindow
         PLA
         STA   L0187A6
         PLA
         STA   L0187A6+2
         ORA   L0187A6
         BEQ   L0187A1
         PHA
         LDA   L0187A6+2
         PHA
         LDA   L0187A6
         PHA
         _GetWKind
         PLA
         BMI   L01879C
         LDA   #$0001
         PLB
         RTL

L01879C  LDA   #$FFFF
         PLB
         RTL

L0187A1  LDA   #$0000
         PLB
         RTL

L0187A6  ADRL  $00000000
L0187AA  DW    $004E
         DW    $0020      ; frame bits
         ADRL  $00000000  ; title ptr
         ADRL  $00000005  ; refcon
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
L0187E8  DW    $0000      ; content rect
L0187EA  DW    $0000
L0187EC  DW    $0000
L0187EE  DW    $0000
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
L0187F8  STZ   L019741
         LDA   $76
         DEC
         ASL
         TAX
         JMP   (L01883D,X)

L018803  LDA   $76
         CMP   #$000B
         BEQ   L01883C
         LDA   $3E
         BNE   L01883C
         LDA   $76
         CMP   #$000F
         BEQ   L01881F
         CMP   #$0002
         BEQ   L01881F
         CMP   #$000C
         BNE   L01883C
L01881F  LDA   $8E
         PHA
         LDA   $8C
         PHA
         _SetPort
         JSR   L01635D
         LDA   $78
         STA   $76
         STA   L01969D
         JSR   L01635D
         JMP   L016333
L01883C  RTS

L01883D  DA    L018803
         DA    L0188CE
         DA    L018803
         DA    L0188F5
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L0188A1
         DA    L011B55
         DA    L018803
         DA    L018918
         DA    L018865
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L018803
         DA    L018803
L018865  LDA   $3E
         BNE   L01889E
         JSR   L0118CC
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         PEA   ^L019749
         PEA   L019749
         _GetPortRect
         PEA   ^L019749
         PEA   L019749
         LDX   $74
         JSL   L0149AE
         PHX
         PHA
         _FillRect
         JSR   L014117
L01889E  BRL   L018803
L0188A1  LDA   $3E
         BNE   L0188CB
         JSR   L01192F
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   $56
         STA   $66
         LDA   $58
         STA   $68
         LDA   $5A
         STA   $6A
         LDA   $5C
         STA   $6C
         JSR   L018DDB
         JSR   L015F79
L0188CB  BRL   L018803
L0188CE  LDA   $3E
         BNE   L0188F2
         PEA   $FFFF
         PEA   $0004
         _HiliteMenu
         LDA   #$000C
         JSR   L01080A
         PEA   $0000
         PEA   $0004
         _HiliteMenu
L0188F2  BRL   L018803
L0188F5  PEA   $FFFF
         PEA   $0004
         _HiliteMenu
         LDA   #$0004
         JSR   L01080A
         PEA   $0000
         PEA   $0004
         _HiliteMenu
         BRL   L018803
L018918  LDA   $3E
         BNE   L01891F
         JSR   L013F7B
L01891F  BRL   L018803
L018922  LDA   #$0004
         STA   $46
         PEA   ^L019771
         PEA   L019771
         _OpenPort
         PEA   ^L01999C
         PEA   L01999C
         _SetPortLoc
         STZ   L019749
         STZ   L01974B
         SEC
         LDA   $6A
         SBC   $66
         STA   L01974D
         SEC
         LDA   $6C
         SBC   $68
         STA   L01974F
         PEA   ^L019749
         PEA   L019749
         _InvertRect
         PEA   ^L019771
         PEA   L019771
         _ClosePort
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         RTS

L01898C  SEC
         LDA   $6A
         SBC   $66
         STA   L018A44
         SEC
         LDA   $6C
         SBC   $68
         STA   L018A46
         LDA   L018A46
         LSR
         AND   #$FFFC
         STA   L018A46
         LDA   L019998
         STA   $0A
         LDA   L01999A
         STA   $0C
         PHA
         PHA
         LDA   L018A44
         DEC
         PHA
         PEA   $0086
         _Multiply
         CLC
         PLA
         ADC   L0199AC
         STA   $0E
         PLA
         ADC   L0199AE
         STA   $10
         LDX   L018A44
L0189D1  LDY   L018A46
L0189D4  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0189D4
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         SEC
         LDA   $0E
         SBC   #$0086
         STA   $0E
         DEX
         BNE   L0189D1
         LDA   #$0008
         STA   $46
         LDA   L0199AC
         STA   $0A
         LDA   L0199AE
         STA   $0C
         LDA   L019998
         STA   $0E
         LDA   L01999A
         STA   $10
         LDX   L018A44
L018A0B  LDY   L018A46
L018A0E  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L018A0E
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L018A0B
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         RTS

         MX    %00
L018A44  DW    $0000
L018A46  DW    $0000
L018A48  TAX
         LDA   $36
         PHA
         EOR   #$FFFF
         INC
         STA   $36
         PLA
         CPX   #$0000
         BNE   L018A88
         CMP   #$0001
         BEQ   L018A64
         LDA   #$0004
         JMPL  L0190DA

L018A64  LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         LDA   $66
         STA   L0196C5
         LDA   $68
         STA   L0196C7
         JSR   L01618F
         PLA
         STA   L0196C5
         PLA
         STA   L0196C7
         LDA   #$0002
         JMPL  L0190DA

L018A88  LDA   $36
         CMP   #$0001
         BEQ   L018A96
         LDA   #$0003
         JMPL  L0190DA

L018A96  LDA   #$0001
         JMPL  L0190DA

L018A9D  STZ   $44
         LDA   $36
         BEQ   L018AA5
         BPL   L018AA6
L018AA5  RTS

L018AA6  LDA   L0196C7
         PHA
         LDA   L0196C5
         PHA
         PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         JSL   L0181CE
         LDA   L0196C5
         STA   L019751
         LDA   L0196C7
         STA   L019753
         PLA
         STA   L0196C5
         PLA
         STA   L0196C7
         PHA
         PEA   ^L019751
         PEA   L019751
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         _PtInRect
         PLA
         BEQ   L018B28
         PHA
         PHA
         SEC
         LDA   L019751
         SBC   $66
         PHA
         PEA   $0086
         _Multiply
         PLA
         CLC
         ADC   L01998A
         STA   $0A
         PLA
         ADC   L01998C
         STA   $0C
         SEC
         LDA   L019753
         SBC   $68
         LSR
         TAY
         LDA   [$0A],Y
         BCC   L018B1E
         AND   #$000F
         BRA   L018B21
L018B1E  AND   #$00F0
L018B21  BNE   L018B28
         LDA   #$0001
         STA   $44
L018B28  RTS

L018B29  PLX
         PLA
         STA   L018DD7
         PLA
         STA   L018DD9
         PLA
         STA   L018DBF
         PLA
         STA   L018DC1
         PLA
         STA   L018DBB
         PLA
         STA   L018DBD
         PHX
         LDA   $12
         STA   L018DD3
         LDA   $14
         STA   L018DD5
         SEC
         LDA   $68
         SBC   $58
         STA   L018DC3
         SEC
         LDA   $6C
         SBC   $58
         STA   L018DC5
         _HideCursor
         LDX   L018DBB
L018B67  PHX
         STZ   L018DC7
         CPX   $66
         BCC   L018B79
         CPX   $6A
         BCS   L018B79
         LDA   #$0001
         STA   L018DC7
L018B79  STZ   L018DCF
         STZ   L018DD1
         LDY   L018DBD
L018B82  PHY
         LDA   [$0A],Y
         LDX   L018DC7
         BNE   L018B8D
         BRL   L018D4D
L018B8D  STA   L018DC9
         TYA
         ASL
         TAX
         PHX
         CPX   L018DC3
         BCS   L018B9C
         BRL   L018C0D
L018B9C  INX
         INX
         INX
         CPX   L018DC5
         BCC   L018BA7
         BRL   L018C0D
L018BA7  PLX
         LDY   L018DCF
         TYA
         INC
         INC
         STA   L018DCF
         BIT   L018DD1
         BMI   L018BC3
         LDA   [$28],Y
         EOR   #$FFFF
         STA   L018DCD
         AND   [$12],Y
         BRL   L018D42
L018BC3  PHY
         LDY   L018DCF
         LDA   [$28],Y
         XBA
         STA   L018DCB
         PLY
         LDA   [$28],Y
         XBA
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         XBA
         EOR   #$FFFF
         STA   L018DCD
         PHY
         LDY   L018DCF
         LDA   [$12],Y
         XBA
         STA   L018DCB
         PLY
         LDA   [$12],Y
         XBA
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         ASL   L018DCB
         ROL
         XBA
         AND   L018DCD
         BRL   L018D42
L018C0D  PLX
         STZ   L018DCB
         STZ   L018DCD
         CPX   L018DC5
         BCC   L018C1C
         BRL   L018D3C
L018C1C  CPX   L018DC3
         BCC   L018C5C
         LDY   L018DCF
         LDA   [$28],Y
         EOR   #$FFFF
         BIT   L018DD1
         BMI   L018C33
         AND   #$00F0
         BRA   L018C3A
L018C33  AND   #$000F
         ASL
         ASL
         ASL
         ASL
L018C3A  TSB   L018DCD
         LDA   [$12],Y
         BIT   L018DD1
         BMI   L018C4C
         DEC   L018DD1
         AND   #$00F0
         BRA   L018C59
L018C4C  INC   L018DD1
         INC   L018DCF
         AND   #$000F
         ASL
         ASL
         ASL
         ASL
L018C59  TSB   L018DCB
L018C5C  INX
         CPX   L018DC5
         BCC   L018C65
         BRL   L018D3C
L018C65  CPX   L018DC3
         BCC   L018CA5
         LDY   L018DCF
         LDA   [$28],Y
         EOR   #$FFFF
         BIT   L018DD1
         BMI   L018C80
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         BRA   L018C83
L018C80  AND   #$000F
L018C83  TSB   L018DCD
         LDA   [$12],Y
         BIT   L018DD1
         BMI   L018C99
         DEC   L018DD1
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         BRA   L018CA2
L018C99  INC   L018DD1
         INC   L018DCF
         AND   #$000F
L018CA2  TSB   L018DCB
L018CA5  INX
         CPX   L018DC5
         BCC   L018CAE
         BRL   L018D3C
L018CAE  CPX   L018DC3
         BCC   L018CF2
         LDY   L018DCF
         LDA   [$28],Y
         EOR   #$FFFF
         BIT   L018DD1
         BMI   L018CC6
         AND   #$00F0
         XBA
         BRA   L018CCE
L018CC6  AND   #$000F
         XBA
         ASL
         ASL
         ASL
         ASL
L018CCE  TSB   L018DCD
         LDA   [$12],Y
         BIT   L018DD1
         BMI   L018CE1
         DEC   L018DD1
         AND   #$00F0
         XBA
         BRA   L018CEF
L018CE1  INC   L018DD1
         INC   L018DCF
         AND   #$000F
         XBA
         ASL
         ASL
         ASL
         ASL
L018CEF  TSB   L018DCB
L018CF2  INX
         CPX   L018DC5
         BCS   L018D3C
         CPX   L018DC3
         BCC   L018D3C
         LDY   L018DCF
         LDA   [$28],Y
         EOR   #$FFFF
         BIT   L018DD1
         BMI   L018D14
         AND   #$00F0
         XBA
         LSR
         LSR
         LSR
         LSR
         BRA   L018D18
L018D14  AND   #$000F
         XBA
L018D18  TSB   L018DCD
         LDA   [$12],Y
         BIT   L018DD1
         BMI   L018D2F
         DEC   L018DD1
         AND   #$00F0
         XBA
         LSR
         LSR
         LSR
         LSR
         BRA   L018D39
L018D2F  INC   L018DD1
         INC   L018DCF
         AND   #$000F
         XBA
L018D39  TSB   L018DCB
L018D3C  LDA   L018DCB
         AND   L018DCD
L018D42  PHA
         LDA   L018DCD
         TRB   L018DC9
         PLA
         ORA   L018DC9
L018D4D  PLY
         STA   [$0E],Y
         INY
         INY
         CPY   L018DC1
         BCS   L018D5A
         BRL   L018B82
L018D5A  CLC
         LDA   $0E
         ADC   #$00A0
         STA   $0E
         CLC
         LDA   $0A
         ADC   #$00A0
         STA   $0A
         LDA   L018DC7
         BEQ   L018D87
         CLC
         LDA   $12
         ADC   #$0086
         CMP   L018DD7
         BNE   L018D7D
         LDA   L018DD3
L018D7D  STA   $12
         CLC
         LDA   $28
         ADC   #$0086
         STA   $28
L018D87  PLX
         INX
         CPX   L018DBF
         BCS   L018D91
         BRL   L018B67
L018D91  _ShowCursor
         PHA
         PHA
         _GetTick
         LDA   $01,S
         STA   L018DC9
L018DA6  _GetTick
         SEC
         LDA   $01,S
         SBC   L018DC9
         CMP   #$0005
         BCC   L018DA6
         PLA
         PLA
         RTS

L018DBB  DW    $0000
L018DBD  DW    $0000
L018DBF  DW    $0000
L018DC1  DW    $0000
L018DC3  DW    $0000
L018DC5  DW    $0000
L018DC7  DW    $0000
L018DC9  DW    $0000
L018DCB  DW    $0000
L018DCD  DW    $0000
L018DCF  DW    $0000
L018DD1  DW    $0000
L018DD3  DW    $0000
L018DD5  DW    $0000
L018DD7  DW    $0000
L018DD9  DW    $0000
L018DDB  STZ   L018F55
         PEA   ^L019A34
         PEA   L019A34
         _SetPenPat
         PEA   $0002
         _SetPenMode
         LDA   #$0001
         STA   L01975F
         PHA
         PHA
         _SetPenSize
         BRL   L018E2E
L018E07  LDA   $36
         BMI   L018E20
         CMP   #$0002
         BNE   L018E20
         LDA   $92
         PHA
         LDA   $90
         PHA
         _SetPort
         BRL   L018DDB
L018E20  RTS

L018E21  LDA   $36
         BMI   L018E2D
         CMP   #$0002
         BNE   L018E2D
         JSR   L018E2E
L018E2D  RTS

L018E2E  LDA   L018F55
         BPL   L018E5D
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         _FrameRect
         PEA   ^L019A34
         PEA   L019A34
         _SetPenPat
L018E5D  PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         _FrameRect
         LDX   $66
         LDY   $6A
         JSR   L01412A
         RTS

L018E75  LDA   $36
         CMP   #$0002
         BEQ   L018EA8
         CMP   #$0001
         BEQ   L018E82
         RTS

L018E82  SEC
         LDA   L0196C1
         SBC   L018F53
         CMP   #$000A
         BCS   L018E8F
         RTS

L018E8F  LDA   L0196C1
         STA   L018F53
         LDY   #$010A
L018E98  LDA   [$A4],Y
         EOR   #$FFFF
         STA   [$A4],Y
         DEY
         DEY
         BPL   L018E98
         JSR   L018EF6
         BRA   L018EEE
L018EA8  SEC
         LDA   L0196C1
         SBC   L018F53
         CMP   #$000A
         BCS   L018EB5
         RTS

L018EB5  LDA   L0196C1
         STA   L018F53
         LDA   L018F55
         EOR   #$FFFF
         STA   L018F55
         PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   $0000
         CLC
         TDC
         ADC   #$0066
         PHA
         _FrameRect
         PEA   ^L019A34
         PEA   L019A34
         _SetPenPat
L018EEE  LDX   $66
         LDY   $6A
         JSR   L01412A
         RTS

L018EF6  LDA   $68
         PHA
         LDA   $66
         PHA
         LDA   $6C
         PHA
         LDA   $6A
         PHA
         SEC
         LDA   $07,S
         SBC   $58
         AND   #$FFFC
         LSR
         STA   $07,S
         SEC
         LDA   $03,S
         DEC
         SBC   $58
         AND   #$FFFC
         LSR
         INC
         INC
         STA   $03,S
         SEC
         LDA   $05,S
         SBC   $56
         JSL   L0182D0
         CLC
         ADC   #$3197
         STA   $0E
         STA   $0A
         LDA   #$00E1
         STA   $10
         STA   $0C
         LDA   L0199B2
         STA   $28
         LDA   L0199B4
         STA   $2A
         LDA   $A4
         STA   $12
         LDA   $A6
         STA   $14
         LDA   $14
         PHA
         CLC
         LDA   $12
         ADC   #$010C
         PHA
         JSR   L018B29
         RTS

L018F53  DW    $0000
L018F55  DW    $0000

L018F57  LDA   L019976
         STA   $0A
         LDA   L019978
         STA   $0C
         LDA   $A4
         STA   $0E
         LDA   $A6
         STA   $10
         LDY   #$0000
L018F6C  LDA   [$0E],Y
         JSR   L01902E
         STA   L0190B4,Y
         LDA   #$0000
         STA   L019074,Y
         INY
         INY
         INX
         INX
         CPY   #$0020
         BNE   L018F6C
         LDY   #$0000
L018F86  TYX
L018F87  INX
         INX
         LDA   L0190B4,X
         CMP   L0190B4,Y
         BCC   L018F96
         INC   L019074,X
         BRA   L018F9C
L018F96  PHX
         TYX
         INC   L019074,X
         PLX
L018F9C  CPX   #$001E
         BNE   L018F87
         INY
         INY
         CPY   #$001E
         BNE   L018F86
         LDY   #$0000
         STY   L0190D8
L018FAE  LDA   L019074,Y
         ASL
         ASL
         ASL
         ASL
         STA   L019094,Y
         TYA
         CMP   L019074,Y
         BEQ   L018FC1
         INC   L0190D8
L018FC1  INY
         INY
         CPY   #$0020
         BNE   L018FAE
         LDA   L0190D8
         BNE   L018FCE
         RTS

L018FCE  LDY   #$0000
L018FD1  LDA   [$0A],Y
         JSR   L019009
         XBA
         JSR   L019009
         XBA
         STA   [$0A],Y
         INY
         INY
         CPY   #$F800
         BNE   L018FD1
         LDY   #$0000
L018FE7  LDA   L019074,Y
         ASL
         TAX
         LDA   [$0E],Y
         STA   L019054,X
         INY
         INY
         CPY   #$0020
         BNE   L018FE7
         PEA   $0000
         PEA   ^L019054
         PEA   L019054
         _SetColorTable
         RTS

L019009  STA   L0190D4
         AND   #$000F
         ASL
         TAX
         LDA   L0190D4
         AND   #$FFF0
         ORA   L019074,X
         STA   L0190D4
         AND   #$00F0
         LSR
         LSR
         LSR
         TAX
         LDA   L0190D4
         AND   #$FF0F
         ORA   L019094,X
         RTS

L01902E  STA   L0190D6
         AND   #$000F
         STA   L0190D4
         LDA   L0190D6
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         CLC
         ADC   L0190D4
         STA   L0190D4
         LDA   L0190D6
         AND   #$0F00
         XBA
         CLC
         ADC   L0190D4
         RTS

L019054  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L019074  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L019094  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0190B4  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0190D4  DW    $0000
L0190D6  DW    $0000
L0190D8  DW    $0000

L0190DA  DEC
         ASL
         TAX
         JMP   (L0190E0,X)

L0190E0  DA    L0190F0
         DA    L019105
         DA    L01911A
         DA    L01912F
         DA    L019144
         DA    L01917B
         DA    L0191AE
         DA    L019221

L0190F0  LDX   L01929A
L0190F3  PHX
         LDA   L01929A,X
         PHA
         _EnableMItem
         PLX
         DEX
         DEX
         BNE   L0190F3
         RTS

L019105  LDX   L01929A
L019108  PHX
         LDA   L01929A,X
         PHA
         _DisableMItem
         PLX
         DEX
         DEX
         BNE   L019108
         RTS

L01911A  LDX   L0192A2
L01911D  PHX
         LDA   L0192A2,X
         PHA
         _EnableMItem
         PLX
         DEX
         DEX
         BNE   L01911D
         RTS

L01912F  LDX   L0192A2
L019132  PHX
         LDA   L0192A2,X
         PHA
         _DisableMItem
         PLX
         DEX
         DEX
         BNE   L019132
         RTS

L019144  PEA   $011C
         _DisableMItem
         PEA   $011D
         _DisableMItem
         LDA   $42
         BEQ   L019166
         PEA   $010F
         _EnableMItem
L019166  LDX   L0192B2
L019169  PHX
         LDA   L0192B2,X
         PHA
         _EnableMItem
         PLX
         DEX
         DEX
         BNE   L019169
         RTS

L01917B  PEA   $011C
         _EnableMItem
         PEA   $011D
         _EnableMItem
         PEA   $010F
         _DisableMItem
         LDX   L0192B2
L01919C  PHX
         LDA   L0192B2,X
         PHA
         _DisableMItem
         PLX
         DEX
         DEX
         BNE   L01919C
         RTS

L0191AE  PEA   $0100
         _DisableMItem
         PEA   $0101
         _DisableMItem
         PEA   $010D
         _EnableMItem
         PEA   $010E
         _EnableMItem
         PEA   $010F
         _EnableMItem
         PEA   $0110
         _EnableMItem
         LDA   #$0080
         PHA
         PHA
         PHA
         PHA
         PEA   $0004
         _SetMenuFlag
         PEA   $0005
         _SetMenuFlag
         PEA   $0006
         _SetMenuFlag
         PEA   $0002
         _SetMenuFlag
         _DrawMenuBar
         RTS

L019221  PEA   $0100
         _EnableMItem
         PEA   $0101
         _EnableMItem
         PEA   $010D
         _DisableMItem
         PEA   $010E
         _DisableMItem
         LDA   $42
         BNE   L019257
         PEA   $010F
         _DisableMItem
L019257  PEA   $0110
         _DisableMItem
         LDA   #$FF7F
         PHA
         PHA
         PHA
         PHA
         PEA   $0004
         _SetMenuFlag
         PEA   $0005
         _SetMenuFlag
         PEA   $0006
         _SetMenuFlag
         PEA   $0002
         _SetMenuFlag
         _DrawMenuBar
         RTS

         DW    $0000
L01929A  DW    $0006
         DW    $010D
         DW    $010E
         DW    $0110
L0192A2  DW    $000E
         DW    $010D
         DW    $010E
         DW    $0110
         DW    $0111
         DW    $0112
         DW    $0113
         DW    $0114
L0192B2  DW    $0016
         DW    $0117
         DW    $010C
         DW    $0118
         DW    $0116
         DW    $011E
         DW    $011F
         DW    $0104
         DW    $0105
         DW    $0106
         DW    $0107
         DW    $010A

L0192CA  ENT
         PHB
         PHK
         PLB
         LDA   L019685
         STA   L0192ED+1
         STA   L019379+1
         LDA   #$0022
         STA   L019384
         STZ   L019384+2
         TDC
         CLC
         ADC   #$007E
         STA   L019384+1
         SEP   #$30
         LDAL  CLRROM
L0192ED  LDAL  $00C100
         LDA   L019686
         STAL  MSLOT
         LDAL  MSLOT
         TAX
         LDA   #$00
         STAL  $0003B8,X
         EOR   #$25
         ORA   #$80
         STAL  $000438,X
         LDA   #$00
         STAL  $0005B8,X
         STAL  $0006B8,X
         STAL  $000538,X
         LDA   #$10
         STAL  $0004B8,X
         LDA   #$03
         STAL  $000638,X
         LDA   #$08
         STAL  $000738,X
         REP   #$30
         PEA   ^L01933C
         PEA   L01933C
         _SetHeartBeat
         PLB
         RTL

L01933C  ADRL  $00000000
L019340  DW    $0002
         DW    $A55A
         PHB
         PHK
         PLB
         REP   #$30
         LDA   L019470
         BNE   L019369
         INC   L019470
         PEA   $0000
         PEA   $0000
         PEA   $000D
         _GetAddr
         PLA
         STA   L019472
         PLA
         STA   L019472+2
L019369  LDA   #$0002
         STA   L019340
         TSC
         STA   L01947E
         SEC
         XCE
         LDAL  CLRROM
L019379  LDAL  $00C100
         LDA   L019686
         STAL  MSLOT
L019384  JSL   $FFFFFF
         CLC
         XCE
         REP   #$30
         LDA   L01947E
         TCS
         STZ   L019476
         LDA   L019478
         PHA
         LDA   L01947A
         PHA
         LDAL  $000285
         STA   L019478
         LDAL  $000287
         STA   L01947A
         PHD
         LDA   L019472+2
         PHA
         LDA   L019472
         PHA
         TSC
         TCD
         LDA   L019478
         BMI   L0193BD
         CMP   [$01]
         BCS   L0193C2
L0193BD  LDA   [$01]
         STA   L019478
L0193C2  LDY   #$0004
         CMP   [$01],Y
         BCC   L0193CE
         LDA   [$01],Y
         STA   L019478
L0193CE  LDY   #$0002
         LDA   L01947A
         BMI   L0193DA
         CMP   [$01],Y
         BCS   L0193DF
L0193DA  LDA   [$01],Y
         STA   L01947A
L0193DF  LDY   #$0006
         CMP   [$01],Y
         BCC   L0193EB
         LDA   [$01],Y
         STA   L01947A
L0193EB  PLA
         PLA
         PLD
         PLA
         CMP   L01947A
         BEQ   L0193FA
         LDA   #$0002
         STA   L019476
L0193FA  PLA
         CMP   L019478
         BEQ   L019406
         LDA   #$0002
         STA   L019476
L019406  LDA   L01947C
         AND   #$9000
         TAX
         STZ   L01947C
         LDAL  $000280
         ROR
         BCS   L01941D
         LDA   #$8000
         STA   L01947C
L01941D  TXA
         CMP   L01947C
         BEQ   L01942C
         LDA   L019476
         ORA   #$0004
         STA   L019476
L01942C  TXA
         AND   #$8000
         BEQ   L01943B
         LDA   L01947C
         ORA   #$4000
         STA   L01947C
L01943B  LDA   L019476
         BEQ   L01946B
         PHA
         SEP   #$30
         LDAL  KEYMODREG
         PHA
         LDA   #$00
         PHA
         REP   #$30
         LDA   L019478
         PHA
         LDA   L01947A
         PHA
         LDA   L01947C
         PHA
         _FakeMouse
         BCC   L01946B
         STZ   L019478
         STZ   L01947A
         STZ   L01947C
L01946B  SEP   #$30
         PLB
         CLC
         RTL

L019470  DW    $0000
L019472  ADRL  $00000000
L019476  DW    $0000
L019478  DW    $0000
L01947A  DW    $0000
L01947C  DW    $0000
L01947E  DW    $0000

         MX    %00
L019480  PLA
         STA   L019679
         PLA
         STA   $0A
         PLA
         STA   $0C
         SEC
         LDY   #$0004
         LDA   [$0A],Y
         SBC   [$0A]
         STA   L01966B
         SEC
         LDY   #$0006
         LDA   [$0A],Y
         LDY   #$0002
         SBC   [$0A],Y
         STA   L019677
         LSR
         DEC
         DEC
         STA   L01966D
         PLA
         STA   L01966F
         PLA
         STA   L019671
         LDA   L019679
         PHA
         LDA   L01966F
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDX   L01966B
L0194CC  LDY   L01966D
L0194CF  LDA   [$0A],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L0194CF
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L0194CC
         CLC
         LDA   L01966F
         ADC   #$0086
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDA   L01966B
         DEC
         STA   L019673
         LDA   L01966D
         STA   L019675
         JSR   L019647
         LDY   L019675
         LDA   #$FFFF
L019518  STA   [$0E],Y
         DEY
         DEY
         BPL   L019518
         LDA   L01966F
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDY   L019675
         LDA   #$FFFF
L019538  STA   [$0E],Y
         DEY
         DEY
         BPL   L019538
         CLC
         LDA   L0199AC
         ADC   #$0086
         STA   $0E
         JSR   L019647
         LDA   L01966F
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDX   L01966B
L019561  LDY   #$0000
L019564  PHY
         INY
         INY
         LDA   [$0A],Y
         XBA
         CPY   L01966D
         BEQ   L019574
         BCC   L019574
         LDA   #$FFFF
L019574  STA   L01967B
         PLY
         LDA   [$0A],Y
         XBA
         ASL   L01967B
         ROL
         ASL   L01967B
         ROL
         ASL   L01967B
         ROL
         ASL   L01967B
         ROL
         XBA
         ORA   [$0E],Y
         STA   [$0E],Y
         INY
         INY
         CPY   L01966D
         BEQ   L019564
         BCC   L019564
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L019561
         LDA   L01966F
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDX   L01966B
L0195C3  LDY   #$0000
         LDA   #$FFFF
         STA   L01967B
L0195CC  LDA   [$0A],Y
         XBA
         STA   L01967D
         LSR   L01967B
         ROR
         LSR   L01967B
         ROR
         LSR   L01967B
         ROR
         LSR   L01967B
         ROR
         XBA
         ORA   [$0E],Y
         STA   [$0E],Y
         LDA   L01967D
         STA   L01967B
         INY
         INY
         CPY   L01966D
         BEQ   L0195CC
         BCC   L0195CC
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L0195C3
         LDA   L01966F
         STA   $0A
         LDA   L019671
         STA   $0C
         LDA   L0199AC
         STA   $0E
         LDA   L0199AE
         STA   $10
         LDX   L01966B
L019620  LDY   L01966D
L019623  LDA   [$0A],Y
         EOR   [$0E],Y
         EOR   #$FFFF
         STA   [$0E],Y
         DEY
         DEY
         BPL   L019623
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L019620
         JMPL  L018EF6

L019647  LDX   L019673
L01964A  LDY   L019675
L01964D  LDA   [$0A],Y
         ORA   [$0E],Y
         STA   [$0E],Y
         DEY
         DEY
         BPL   L01964D
         CLC
         LDA   $0A
         ADC   #$0086
         STA   $0A
         CLC
         LDA   $0E
         ADC   #$0086
         STA   $0E
         DEX
         BNE   L01964A
         RTS
	 
L01966B  DW    $0000
L01966D  DW    $0000
L01966F  DW    $0000
L019671  DW    $0000
L019673  DW    $0000
L019675  DW    $0000
L019677  DW    $0000
L019679  DW    $0000
L01967B  DW    $0000
L01967D  DW    $0000
L01967F  ENT
         DW    $0000
L019681  ENT
         DW    $0000
L019683  ENT
         DW    $0000
L019685  ENT
         DB    $00
L019686  ENT
         DB    $00
L019687  ENT		; type of loaded picture (BIN/PNT/PIC)
         DW    $0000
L019689  DW    $0000
L01968B  DW    $0000
L01968D  ENT
         DW    $0000
         DW    $0000
L019691  ENT
         DW    $0000
L019693  ENT
         DW    $0000
         DW    $0000
L019697  DW    $0000
L019699  ENT
         DW    $0000
L01969B  ENT
         DW    $0000
L01969D  ENT
         DW    $0000
L01969F  DW    $0000
L0196A1  DW    $0000
L0196A3  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $0F
         DB    $02
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $00
L0196AD  ENT
         DW    $0000
L0196AF  ENT
         DW    $0000
L0196B1  ENT
         DW    $0000
L0196B3  ENT
         DW    $0000
L0196B5  ENT
         DW    $0000
         DW    $0000
L0196B9  ENT
         DW    $0000
L0196BB  ENT
         DW    $0000      ; event code
L0196BD  ENT
         ADRL  $00000000  ; event message
L0196C1  ENT
         ADRL  $00000000  ; tick count
L0196C5  ENT
         DW    $0000      ; mouse location
L0196C7  ENT
         DW    $0000
L0196C9  ENT
         DW    $0000      ; modifiers
L0196CB  ENT
         DW    $0000
L0196CD  DW    $0000
L0196CF  DW    $0028      ; Alert rect
         DW    $003C
         DW    $006E
         DW    $012C
         DW    $0001      ; Alert ID
         HEX   80         ; First stage byte
         HEX   80         ; Second stage byte
         HEX   80         ; Third stage byte
         HEX   80         ; fourth stage byte
         ADRL  L0196ED    ; Ptr to item template
         ADRL  L019705    ; Ptr to item template
         ADRL  L01971D    ; Ptr to item template
         ADRL  $00000000
L0196ED  DW    $0001      ; Item ID
         DW    $002E      ; Item rect
         DW    $0014
         DW    $003C
         DW    $005A
         DW    $000A      ; Std button
         ADRL  L01046F    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L019705  DW    $0002      ; Item ID
         DW    $002E      ; Item rect
         DW    $0096
         DW    $003C
         DW    $00DC
         DW    $000A      ; Std button
         ADRL  L010472    ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L01971D  DW    $0003      ; Item ID
L01971F  DW    $0014      ; Item rect
L019721  DW    $0000
L019723  DW    $0022
L019725  DW    $0000
         DW    $800F      ; Static text
L019729  ADRL  $00000000  ; Item descriptor
         DW    $0000      ; Item value
         DW    $0000      ; Bit flag
         ADRL  $00000000  ; Ptr to color table
L019735  DW    $0000
L019737  DW    $0000
L019739  DW    $0000
L01973B  DW    $0000
L01973D  ENT
         DW    $0000
L01973F  ENT
         DW    $0000
L019741  DW    $0000
L019743  DW    $0000
L019745  DW    $0000
L019747  DW    $0000
L019749  DW    $0000
L01974B  DW    $0000
L01974D  DW    $0000
L01974F  DW    $0000
L019751  ENT
         DW    $0000
L019753  ENT
         DW    $0000
L019755  DW    $0000
L019757  DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L01975F  DW    $0000
L019761  DW    $0000
L019763  DW    $0000
L019765  DW    $0000
L019767  DW    $0000
L019769  DW    $0000
L01976B  DW    $0000
L01976D  DW    $0000
L01976F  DW    $0000
L019771  DS    $B4	; a port
L019825  ENT		; a port
         DS    $B4

*--- replyPtr

L0198D9  ENT
         DW    $0000	; good
L0198DB  DW    $0000	; fileType
L0198DD  DW    $0000	; auxFileType
L0198DF  ENT
         DS    16	; fileName
L0198EF  ENT
         DS    129	; fullPathname

*---

L019970  ENT
         DB    $00
         DB    $00
L019972  ENT
         DB    $00
         DB    $00
L019974  ENT
         DB    $00
         DB    $00
L019976  ENT
         DB    $00
         DB    $00
L019978  ENT
         DB    $00
         DB    $00
         DB    $A0
         DB    $00
L01997C  ENT
         DB    $00
         DB    $00
L01997E  DB    $00
         DB    $00
L019980  ENT
         DB    $00
         DB    $00
L019982  DB    $40
         DB    $01
L019984  ENT
         DB    $00
         DB    $00
L019986  ENT
         DB    $00
         DB    $00
L019988  DB    $00
         DB    $00
L01998A  DB    $00
         DB    $00
L01998C  DB    $00
         DB    $00
         DB    $86
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $85
         DB    $00
         DB    $0C
         DB    $01
L019998  ENT
         DW    $0000
L01999A  ENT
         DW    $0000
L01999C  DW    $0000
L01999E  DW    $0000
L0199A0  DW    $0000
         DW    $0086
         DW    $0000
         DW    $0000
         DW    $0085
         DW    $010C
L0199AC  ENT
         DW    $0000
L0199AE  ENT
         DW    $0000
L0199B0  DW    $0000
L0199B2  DW    $0000
L0199B4  DW    $0000
         DW    $0086
         DW    $0000
         DW    $0000
         DW    $0085
         DW    $010C
L0199C0  ENT
         DW    $0000
L0199C2  ENT
         DW    $0000
L0199C4  DW    $0000
L0199C6  DW    $0000
L0199C8  DW    $0000
L0199CA  DW    $0000
L0199CC  ENT
         DW    $0000
L0199CE  ENT
         DW    $0000
         DW    $0000
         DW    $0000
L0199D4  DW    $0096
         DW    $0004
         DW    $00C3
         DW    $0029
L0199DC  DW    $00A4
         DW    $002D
         DW    $00C3
         DW    $013B
L0199E4  DW    $000F
         DW    $0004
         DW    $0092
         DW    $0029
L0199EC  DW    $0000
         DW    $0000
         DW    $00C8
         DW    $0140
L0199F4  ENT
         HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L019A14  ENT
         HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L019A34  HEX   FFFF0000FFFF00000000FFFF0000FFFF
         HEX   FFFF0000FFFF00000000FFFF0000FFFF
L019A54  HEX   0F0F0F0FF0F0F0F00F0F0F0FF0F0F0F0
         HEX   0F0F0F0FF0F0F0F00F0F0F0FF0F0F0F0
L019A74  HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
         HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
         HEX   EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
         HEX   EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
         HEX   DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
         HEX   DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
         HEX   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
         HEX   CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
         HEX   BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
         HEX   BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
         HEX   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
         HEX   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
         HEX   99999999999999999999999999999999
         HEX   99999999999999999999999999999999
         HEX   88888888888888888888888888888888
         HEX   88888888888888888888888888888888
         HEX   77777777777777777777777777777777
         HEX   77777777777777777777777777777777
         HEX   66666666666666666666666666666666
         HEX   66666666666666666666666666666666
         HEX   55555555555555555555555555555555
         HEX   55555555555555555555555555555555
         HEX   44444444444444444444444444444444
         HEX   44444444444444444444444444444444
         HEX   33333333333333333333333333333333
         HEX   33333333333333333333333333333333
         HEX   22222222222222222222222222222222
         HEX   22222222222222222222222222222222
         HEX   11111111111111111111111111111111
         HEX   11111111111111111111111111111111
         HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L019C74  HEX   0FFFFFFFFFFFFFFF
         HEX   FFFF0FFFFFFFFFFF
         HEX   0FFFFFFFFFFFFFFF
         HEX   FFFF0FFFFFFFFFFF
         HEX   0FFF0FFFFF0FFF0F
         HEX   0FFF0FFFFF0FFF0F
         HEX   0FFF0FFFFF0FFF0F
         HEX   0FFF0FFFFF0FFF0F
         HEX   0F0F0F0FF0F0F0F0
         HEX   0F0F0F0FF0F0F0F0
         HEX   0F0F0F0FF0F0F0F0
         HEX   0F0F0F0FF0F0F0F0
         HEX   F000000000000000
         HEX   0000F00000000000
         HEX   F000000000000000
         HEX   0000F00000000000
         HEX   F000F00000F000F0
         HEX   F000F00000F000F0
         HEX   F000F00000F000F0
         HEX   F000F00000F000F0
         HEX   FFF0FFF0FF0FFF0F
         HEX   F0FFF0FF0FFF0FFF
         HEX   FFF0FFF0FF0FFF0F
         HEX   F0FFF0FF0FFF0FFF
         HEX   FFFFFFF0FFFFFF0F
         HEX   FFFFF0FFFFFF0FFF
         HEX   FFF0FFFFFF0FFFFF
         HEX   F0FFFFFF0FFFFFFF
         HEX   0FFFFFFFF0FFFFFF
         HEX   FF0FFFFFFFFFFFFF
         HEX   FFFFFF0FFFFFF0FF
         HEX   FFFF0FFFFFFFFFFF
         HEX   00000000FFFFFFFF
         HEX   00000000FFFFFFFF
         HEX   00000000FFFFFFFF
         HEX   00000000FFFFFFFF
         HEX   FFFF0FFFFFF000FF
         HEX   FF0FFF0F00FFFFF0
         HEX   0FFFFFFFFFFFFFF0
         HEX   FFFFFF0FFFFFF0FF
         HEX   F000F0000FFF0FF0
         HEX   0FFF00000FFF0000
         HEX   F000F0000FF00FFF
         HEX   00000FFF00000FFF
         HEX   000000000FFFFFFF
         HEX   0FFFFFFF0FFFFFFF
         HEX   00000000FFFF0FFF
         HEX   FFFF0FFFFFFF0FFF
         HEX   00000FFFF000F0FF
         HEX   FF0FFF0FF0FFF000
         HEX   0FFF0000FFF0F000
         HEX   FF0FFF0FF000FFF0
         HEX   0FFFFF0FF0FFF0FF
         HEX   FF000FF0F0FFF0FF
         HEX   0FFFFF0FFFFFFFF0
         HEX   FFFFFFF0FFFFFFF0
         HEX   FFFFFFFFFFFF0FFF
         HEX   FFF0F0FFFF0F0F0F
         HEX   F0F0F0F0FF0F0F0F
         HEX   FFF0F0FFFFFF0FFF
         HEX   0F00FFF0FF00FFFF
         HEX   FFFFFF00FFF00F00
         HEX   00F00FFF00FFFFFF
         HEX   FFFF00FF0FFF00F0

L019E74  ENT
         DW    $001C
         DW    $002E
         DW    $00A1
         DW    $013A
L019E7C  DW    $001C
         DW    $002E
         DW    $0032
         DW    $005A
         DW    $001B
         DW    $002D
         DW    $00A2
         DW    $013B
L019E8C  DW    $001B
         DW    $002D
         DW    $0033
         DW    $005B
         DW    $000F
         DW    $0004
         DW    $0093
         DW    $0029
         DW    $0096
         DW    $0004
         DW    $00C4
         DW    $0029
         DW    $00A5
         DW    $002D
         DW    $00C4
         DW    $013B
         DW    $000F
         DW    $002D
         DW    $001C
         DW    $013B
L019EB4  DW    $00AA
         DW    $0030
         DW    $00BC
         DW    $0048
L019EBC  DW    $00AB
         DW    $0031
         DW    $00BB
         DW    $0047
L019EC4  DW    $00A5
         DW    $002E
         DW    $00C2
         DW    $004A
L019ECC  DW    $0001
L019ECE  DW    $0001
         DW    $0002
         DW    $0003
         DW    $0003
         DW    $0004
         DW    $0004
         DW    $0005
L019EDC  ENT
         ADRL  $00000000
L019EE0  ENT
         ADRL  $00000000
L019EE4  DW    $0008
         DW    $0004
L019EE8  DS    $84
L019F6C  DS    $40
L019FAC  DS    $40

L019FEC  DW    $0007      ; cursor height
         DW    $0003      ; cursor width
         HEX   000F000F0000 ; cursor image
         HEX   F00000000000
         HEX   000F00F00000
         HEX   0F0000000000
         HEX   0000F0000000
         HEX   F000000F0000
         HEX   000F00000000
         HEX   000000000000 ; cursor mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         DW    $0000      ; hot spot
         DW    $0000
L01A048  DW    $000A      ; cursor height
         DW    $0004      ; cursor width
         HEX   FFFFFFFFFFFF0000 ; cursor image
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   F0000000000F0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000 ; cursor mask
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         HEX   FFFFFFFFFFFF0000
         DW    $0000      ; hot spot
         DW    $0000
L01A0F0  DW    $000A      ; cursor height
         DW    $0004      ; cursor width
         HEX   00000F0000000000 ; cursor image
         HEX   0000F0F000000000
         HEX   000F000FF0000000
         HEX   00F00000FFF00000
         HEX   0F000F000FFF0000
         HEX   F000FFF0F0FF0000
         HEX   0F000FFF00FF0000
         HEX   00F000F000FF0000
         HEX   000F0F0000FF0000
         HEX   0000F00000F00000
         HEX   00000F0000000000 ; cursor mask
         HEX   0000FFF000000000
         HEX   000FFFFFF0000000
         HEX   00FFFFFFFFF00000
         HEX   0FFFFFFFFFFF0000
         HEX   FFFFFFFFF0FF0000
         HEX   0FFFFFFF00FF0000
         HEX   00FFFFF000FF0000
         HEX   000FFF0000FF0000
         HEX   0000F00000000000
         DW    $0009      ; hot spot
         DW    $000A
L01A198  DW    $000A      ; cursor height
         DW    $0005      ; cursor width
         HEX   0000000FFFFF00000000 ; cursor image
         HEX   0000FFF00000FF000000
         HEX   00F00000000000F00000
         HEX   0F00000000000F000000
         HEX   0F000000000FF0000000
         HEX   00FFF000FFF000000000
         HEX   0FF0FFFF000000000000
         HEX   0F0FF000000000000000
         HEX   00FF0000000000000000
         HEX   000F0000000000000000
         HEX   00000000000000000000 ; cursor mask
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         HEX   00000000000000000000
         DW    $0009      ; hot spot
         DW    $0003
L01A268  DW    $0007      ; cursor height
         DW    $0003      ; cursor width
         HEX   000F00000000 ; cursor image
         HEX   000F00000000
         HEX   000F00000000
         HEX   FFFFFFF00000
         HEX   000F00000000
         HEX   000F00000000
         HEX   000F00000000
         HEX   000000000000 ; cursor mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         DW    $0003      ; hot spot
         DW    $0003
L01A2C4  ENT
         DW    $0007      ; cursor height
         DW    $0003      ; cursor width
         HEX   0000F0000000 ; cursor image
         HEX   000FFF000000
         HEX   00FFFFF00000
         HEX   FFFF0FFFF000
         HEX   00FFFFF00000
         HEX   000FFF000000
         HEX   0000F0000000
         HEX   000000000000 ; cursor mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         DW    $0003      ; hot spot
         DW    $0004
L01A320  DW    $0007      ; cursor height
         DW    $0003      ; cursor width
         HEX   000F00000000 ; cursor image
         HEX   000F00000000
         HEX   000000000000
         HEX   FF0F0FF00000
         HEX   000000000000
         HEX   000F00000000
         HEX   000F00000000
         HEX   000000000000 ; cursor mask
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         DW    $0003      ; hot spot
         DW    $0003
L01A37C  DW    $0009      ; cursor height
         DW    $0002      ; cursor width
         HEX   FF0FF000   ; cursor image
         HEX   00F00000
         HEX   00F00000
         HEX   00F00000
         HEX   00F00000
         HEX   00F00000
         HEX   0FFF0000
         HEX   00F00000
         HEX   FF0FF000
         HEX   00000000   ; cursor mask
         HEX   00000000
         HEX   00000000
         HEX   00000000
         HEX   00000000
         HEX   00000000
         HEX   00000000
         HEX   00000000
         HEX   00000000
         DW    $0007      ; hot spot
         DW    $0002
L01A3CC  ENT
         DW    $000B      ; cursor height
         DW    $0003      ; cursor width
         HEX   000FFF000000 ; cursor image
         HEX   000F00F00000
         HEX   00FF00F00000
         HEX   00F0FF000000
         HEX   0F000F000000
         HEX   0F00F0000000
         HEX   F000F0000000
         HEX   F00F00000000
         HEX   FFF000000000
         HEX   FF0000000000
         HEX   F00000000000
         HEX   000FFF000000 ; cursor mask
         HEX   000FFFF00000
         HEX   00FFFFF00000
         HEX   00FFFF000000
         HEX   0FFFFF000000
         HEX   0FFFF0000000
         HEX   FFFFF0000000
         HEX   FFFF00000000
         HEX   000000000000
         HEX   000000000000
         HEX   000000000000
         DW    $000A      ; hot spot
         DW    $0000
L01A458  ENT
         DW    $000A      ; cursor height
         DW    $0004      ; cursor width
         HEX   00FFFFF000000000 ; cursor image
         HEX   00FFFFF000000000
         HEX   0F00000F00000000
         HEX   F000F000F0000000
         HEX   F000F000FF000000
         HEX   F00FF000FF000000
         HEX   F0000000F0000000
         HEX   0F00000F00000000
         HEX   00FFFFF000000000
         HEX   00FFFFF000000000
         HEX   00FFFFF000000000 ; cursor mask
         HEX   00FFFFF000000000
         HEX   0FFFFFFF00000000
         HEX   FFFFFFFFF0000000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFFF000000
         HEX   FFFFFFFFF0000000
         HEX   0FFFFFFF00000000
         HEX   00FFFFF000000000
         HEX   00FFFFF000000000
         DW    $0001      ; hot spot
         DW    $0001
L01A500  ENT
         DW    $000A      ; cursor height
         DW    $0004      ; cursor width
         HEX   000000F000000000 ; cursor image
         HEX   0000FF0FF0000000
         HEX   000F0F0F0F000000
         HEX   00FF0F0F0FF00000
         HEX   0F0F00000F0F0000
         HEX   0F00F000000F0000
         HEX   00F0000000F00000
         HEX   000F000000F00000
         HEX   0000F0000F000000
         HEX   0000F0000F000000
         HEX   000000F000000000 ; cursor mask
         HEX   0000FFFFF0000000
         HEX   000FFFFFFF000000
         HEX   00FFFFFFFFF00000
         HEX   0FFFFFFFFFFF0000
         HEX   0FFFFFFFFFFF0000
         HEX   00FFFFFFFFF00000
         HEX   000FFFFFFFF00000
         HEX   0000FFFFFF000000
         HEX   0000FFFFFF000000
         DW    $0001      ; hot spot
         DW    $0006
