*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	PALETTE.E
	 use	PALETTE.X
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

         REL

         BRA   L070004
         LDA   $A5
L070004  PHB
         PHK
         PLB
         JSR   L070896
         BCS   L07000F
         BRL   L0700B8
L07000F  BRL   L070278
L070012  STZ   L0708F0
         STZ   L0709DA
         STZ   L0709DC
         PEA   $0000
         PEA   ^L0709B6
         PEA   L0709B6
         _GetColorTable
         STZ   L0708F2
         JSR   L0700BA
L070031  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BNE   L070051
         JSR   L070519
L070051  CMP   #$0003
         BNE   L07005F
         JSL   L0185C2
         BCC   L07005F
         BRL   L070031
L07005F  LDA   L0708F2
         BEQ   L070031
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseWindow
         PEA   $0000
         _SetAllSCBs
         _InitPalette
         JSL   L010D82
         LDA   L0709DA
         BEQ   L070093
         JSR   L070896
         BCC   L070093
         JSR   L070341
L070093  LDA   L070918+2
         PHA
         LDA   L070918
         PHA
         _HUnlock
         LDA   L070918+2
         PHA
         LDA   L070918
         PHA
         _DisposeHandle
         LDA   L0709DC
         BEQ   L0700B8
         STA   $3C
L0700B8  PLB
         RTL

L0700BA  PEA   $0000
         PEA   $000C
         PEA   $013F
         PEA   $00BB
         JSL   L018223
         PEA   ^L070984
         PEA   L070984
         PEA   ^L019A14
         PEA   L019A14
         _FillRect
         JSR   L0703A8
         LDY   #$0008
L0700E3  PHY
         LDA   L07097A,Y
         STA   L0708FC
         CLC
         ADC   #$000E
         STA   L070900
         DEC
         STA   L070904
         ADC   #$000E
         STA   L070908
         LDA   #$007C
         STA   L0708FE
         STA   L070906
         ADC   #$0015
         STA   L070902
         STA   L07090A
         LDX   #$0001
L070110  PHX
         LDA   $03,S
         CMP   #$0008
         BNE   L07011F
         DEX
         TXA
         EOR   #$000F
         TAX
         DEX
L07011F  TXA
         INC
         JSR   L070257
         PEA   ^L0708FC
         PEA   L0708FC
         PEA   ^L070922
         PEA   L070922
         _FillRect
         PEA   ^L0708FC
         PEA   L0708FC
         _FrameRect
         LDA   $03,S
         CMP   #$0008
         BNE   L070156
         LDA   $01,S
         ADC   #$0006
         EOR   #$000F
         JSR   L070257
L070156  PEA   ^L070904
         PEA   L070904
         PEA   ^L070922
         PEA   L070922
         _FillRect
         PEA   ^L070904
         PEA   L070904
         _FrameRect
         PEA   ^L0708FC
         PEA   L0708FC
         PEA   $0014
         PEA   $0000
         _OffsetRect
         PEA   ^L070904
         PEA   L070904
         PEA   $0014
         PEA   $0000
         _OffsetRect
         PLX
         INX
         CPX   #$0009
         BCS   L0701A6
         BRL   L070110
L0701A6  PLY
         DEY
         DEY
         BMI   L0701AE
         BRL   L0700E3
L0701AE  PEA   $0000
         PEA   $0000
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   ^L07098C
         PEA   L07098C
         PEA   ^L070994
         PEA   L070994
         PEA   $0003
         PEA   $0000
         PEA   $0004
         PEA   $0080
         PEA   $0600
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewControl
         PLA
         STA   L07090C
         PLA
         STA   L07090C+2
         LDX   #$0004
L0701F6  PHX
         PEA   $0000
         PEA   $0000
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         LDA   L0709A6+2,X
         PHA
         LDA   L0709A6,X
         PHA
         LDA   L0709AE+2,X
         PHA
         LDA   L0709AE,X
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PHX
         PEA   $0000
         PEA   $0000
         _NewControl
         LDA   $05,S
         TAX
         PLA
         STA   L070910,X
         PLA
         STA   L070910+2,X
         PLA
         SEC
         SBC   #$0004
         TAX
         BEQ   L0701F6
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _DrawControls
         RTS

L070257  AND   #$000F
         STA   L070275+1
         ASL
         ASL
         ASL
         ASL
         ORA   L070275+1
         STA   L070275+1
         ORA   L070275
         LDX   #$001E
L07026D  STA   L070922,X
         DEX
         DEX
         BPL   L07026D
         RTS

L070275  HEX   000000
L070278  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $1000
         LDAL  L01967F
         PHA
         PEA   $8018
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L07029D
         BRK   $AB
L07029D  PLA
         STA   $0A
         STA   L070918
         PLA
         STA   $0C
         STA   L070918+2
         LDA   [$0A]
         STA   L0709FA
         STA   L0709EC
         STA   L0708EC
         LDY   #$0002
         LDA   [$0A],Y
         STA   L0708EC+2
         STA   L0709FA+2
         STA   L0709EC+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L0709E0
         CMP   #$0046
         BEQ   L070319
         CMP   #$0000
         BEQ   L0702D9
         BRL   L07032B
L0702D9  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L0709E0
         STA   L0709F8
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L0709F8
         BCC   L0702FB
         BRL   L07032B
L0702FB  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0709DE
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         BRL   L070012
L070319  JSL   GSOS
         DW    $0001      ; Create
         ADRL  L070A06
         BCC   L070328
         BRL   L07032B
L070328  BRL   L070012
L07032B  PHA
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0709DE
         PLA
         LDX   #$0000
         JSL   L017D37
         BRL   L070093
L070341  STZ   L0709E6
         STZ   L0709E6+2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L0709E0
         BCC   L070356
         BRL   L070394
L070356  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   L0709E0
         STA   L0709EA
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L0709EA
         BCC   L070378
         BRL   L070394
L070378  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0709DE
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         RTS

L070394  PHA
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L0709DE
         PLA
         LDX   #$0000
         JSL   L017D37
         RTS

L0703A8  JSR   L0704C7
         LDY   #$0006
L0703AE  PHY
         LDA   L07097A,Y
         CLC
         ADC   #$000C
         STA   L0708E8
         ADC   #$000E
         STA   L0708EA
         TYA
         INC
         STA   L0708E4
         INC
         STA   L0708E6
         LDX   #$000E
L0703CB  PHX
         LDA   L0708E8
         PHA
         LDA   L0708E4
         PHA
         _SetSCB
         LDA   L0708EA
         PHA
         LDA   L0708E6
         PHA
         _SetSCB
         INC   L0708E8
         INC   L0708EA
         PLX
         DEX
         BNE   L0703CB
         PLY
         DEY
         DEY
         BPL   L0703AE
L0703F9  LDA   L0708EC
         STA   $0A
         LDA   L0708EC+2
         STA   $0C
         LDA   L0708F0
         ASL
         ASL
         ASL
         ASL
         ASL
         TAY
         LDX   #$0000
         STX   L0708E4
L070412  LDX   #$0000
L070415  PHY
         PHX
         LDA   L0708E4
         ASL
         INC
         CPX   #$0008
         BCS   L070422
         INC
L070422  PHA
         TXA
         AND   #$0007
         EOR   #$0007
         INC
         INC
         PHA
         LDA   [$0A],Y
         PHA
         _SetColorEntry
         PLX
         PLY
         INY
         INY
         INX
         CPX   #$0010
         BCC   L070415
         INC   L0708E4
         LDA   L0708E4
         CLC
         ADC   L0708F0
         CMP   #$0080
         BCS   L070458
         LDA   L0708E4
         CMP   #$0004
         BCC   L070412
L070458  PEA   $000F
         _SetForeColor
         PEA   $0000
         _SetBackColor
         PEA   $0000
         _SetTextMode
         LDX   #$0006
         LDA   L0708F0
         CLC
         ADC   #$0003
L070480  PHA
         PHX
         JSR   L070635
         PLX
         PHX
         TXA
         ASL
         TAX
         LDA   L07096A+2,X
         PHA
         LDA   L07096A,X
         PHA
         PEA   ^L019A14
         PEA   L019A14
         _FillRect
         PLX
         PHX
         PEA   $0063
         LDA   L070942,X
         PHA
         _MoveTo
         PEA   ^L07091C
         PEA   L07091C
         _DrawString
         PLX
         PLA
         DEC
         DEX
         DEX
         BMI   L0704C6
         BRL   L070480
L0704C6  RTS

L0704C7  PEA   $0000
         PEA   $0000
         PEA   $0000
         _GetColorEntry
         PLA
         STA   L0708E4
         PEA   $0000
         PEA   $0000
         PEA   $000F
         _GetColorEntry
         PLA
         STA   L0708E6
         LDX   #$0001
L0704F2  PHX
         PHX
         PHX
         PEA   $0000
         LDA   L0708E4
         PHA
         _SetColorEntry
         PEA   $000F
         LDA   L0708E6
         PHA
         _SetColorEntry
         PLX
         INX
         CPX   #$000A
         BCC   L0704F2
         RTS

L070519  PHA
         PEA   ^L0709D6
         PEA   L0709D6
         LDAL  L0196C7
         PHA
         LDAL  L0196C5
         PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _FindControl
         PLA
         BNE   L07053D
         BRL   L07066E
L07053D  PHA
         LDAL  L0196C7
         PHA
         LDAL  L0196C5
         PHA
         PEA   ^L070594
         PEA   L070594
         LDA   L0709D6+2
         PHA
         LDA   L0709D6
         PHA
         _TrackControl
         PLA
         CMP   #$0002
         BEQ   L070564
         RTS

L070564  LDA   L0709D6
         CMP   L070910
         BNE   L070574
         LDA   L0709D6+2
         CMP   L070910+2
         BEQ   L07058D
L070574  STZ   L0709DC
         STZ   L0709DA
         PEA   $0000
         PEA   ^L0709B6
         PEA   L0709B6
         _SetColorTable
         JSR   L0704C7
L07058D  LDA   #$FFFF
         STA   L0708F2
         RTS

L070594  NOP
         PHD
         PHB
         PHK
         PLB
         LDAL  L01968D
         TCD
         LDA   $0B,S
         AND   #$007F
         ASL
         TAX
         JMP   (L070623,X)

L0705A8  LDA   L0708F0
         BEQ   L0705FD
         DEC
         STA   L0708F0
         BRA   L0705E7
L0705B3  LDA   L0708F0
         BEQ   L0705FD
         SEC
         SBC   #$0004
         BPL   L0705D1
         LDA   #$0000
         BRA   L0705D1
L0705C3  LDA   L0708F0
         ADC   #$0004
         CMP   #$007C
         BCC   L0705D1
         LDA   #$007C
L0705D1  CMP   L0708F0
         BEQ   L0705FD
         STA   L0708F0
         BRA   L0705E7
L0705DB  LDA   L0708F0
         CMP   #$007C
         BCS   L0705FD
         INC
         STA   L0708F0
L0705E7  LDA   L0708F0
         PHA
         LDA   L07090C+2
         PHA
         LDA   L07090C
         PHA
         _SetCtlValue
L0705FA  JSR   L0703F9
L0705FD  PLB
         PLD
         LDA   $00,S
         STA   $06,S
         LDA   $02,S
         STA   $08,S
         PLA
         PLA
         PLA
         RTL

L07060B  PEA   $0000
         LDA   L07090C+2
         PHA
         LDA   L07090C
         PHA
         _GetCtlValue
         PLA
         STA   L0708F0
         BRA   L0705FA
L070623  DA    L0705FD
         DA    L07060B
         DA    L0705FD
         DA    L0705FD
         DA    L0705FD
         DA    L0705A8
         DA    L0705DB
         DA    L0705B3
         DA    L0705C3
L070635  LDX   #$0001
         SEC
         SBC   #$0064
         BMI   L070647
         LDY   #$0031
         STY   L07091D
         INX
         BRA   L07064B
L070647  CLC
         ADC   #$0064
L07064B  PHA
         LDA   #$0030
         STA   L07091C,X
         PLA
L070653  SEC
         SBC   #$000A
         BMI   L07065E
         INC   L07091C,X
         BRA   L070653
L07065E  CLC
         ADC   #$003A
         STA   L07091D,X
         INX
         SEP   #$30
         STX   L07091C
         REP   #$30
         RTS

L07066E  PEA   ^L0196C5
         PEA   L0196C5
         _GlobalToLocal
         LDX   #$0004
L07067E  PHX
         JSR   L0706A4
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0708F4
         PEA   L0708F4
         _PtInRect
         PLA
         BNE   L0706A0
         PLX
         DEX
         BPL   L07067E
         RTS

L0706A0  PLX
         BRL   L0706C1
L0706A4  TXA
         ASL
         TAY
         LDA   L07097A,Y
         STA   L0708F4
         CLC
         ADC   #$001B
         STA   L0708F8
         LDA   #$007C
         STA   L0708F6
         LDA   #$011D
         STA   L0708FA
         RTS

L0706C1  STX   L0708C0
L0706C4  LDAL  L0196C1
         STA   L0708BC
         PEA   ^L0708C4
         PEA   L0708C4
         _SetPenPat
         PEA   $0002
         _SetPenMode
         STZ   L0708BE
         PEA   ^L0708F4
         PEA   L0708F4
         _FrameRect
         LDAL  L0196C5
         STA   L0708B8
         LDAL  L0196C7
         STA   L0708BA
L070700  PEA   $0000
         PEA   $0000
         _GetTick
         PLA
         STAL  L0196C1
         PLA
         PEA   $0000
         PEA   $0000
         _StillDown
         PLA
         BEQ   L070798
         PEA   ^L0196C5
         PEA   L0196C5
         _GetMouse
         LDAL  L0196C7
         SEC
         SBC   L0708BA
         TAX
         LDAL  L0196C5
         SEC
         SBC   L0708B8
         TAY
         BNE   L070747
         TXA
         BEQ   L07075C
L070747  PEA   ^L0708F4
         PEA   L0708F4
         PHX
         PHY
         JSR   L070869
         _OffsetRect
         BRL   L0706C4
L07075C  LDA   L0708BC
         CLC
         ADC   #$000A
         BCS   L07076B
         CMPL  L0196C1
         BCS   L070700
L07076B  PEA   ^L0199F4
         PEA   L0199F4
         _SetPenPat
         PEA   ^L0708F4
         PEA   L0708F4
         _FrameRect
         LDAL  L0196C1
         STA   L0708BC
         LDA   #$FFFF
         EOR   L0708BE
         STA   L0708BE
         BRL   L070700
L070798  JSR   L070869
         PEA   $0000
         _SetPenMode
         PEA   ^L019A14
         PEA   L019A14
         _SetPenPat
         LDX   #$0004
L0707B5  PHX
         JSR   L0706A4
         PEA   $0000
         PEA   ^L0196C5
         PEA   L0196C5
         PEA   ^L0708F4
         PEA   L0708F4
         _PtInRect
         PLA
         BNE   L0707D7
         PLX
         DEX
         BPL   L0707B5
L0707D6  RTS

L0707D7  PLA
         CMP   L0708C0
         BEQ   L0707D6
         STA   L0708C2
         CMP   #$0004
         BNE   L0707ED
         LDX   #$0001
         STX   L0709DC
         BRA   L0707FB
L0707ED  LDX   L0708C0
         CPX   #$0004
         BNE   L0707D6
         LDA   #$0001
         STA   L0709DA
L0707FB  CMP   #$0004
         BEQ   L07082A
         PEA   $0000
         PEA   ^L070922
         PEA   L070922
         _GetColorTable
         LDA   L0708C2
         JSR   L070854
         LDX   #$0000
L070819  LDA   L070922,X
         STA   [$0A],Y
         INX
         INX
         INY
         INY
         CPX   #$0020
         BCC   L070819
         BRL   L0703F9
L07082A  LDA   L0708C0
         JSR   L070854
         LDX   #$0000
L070833  LDA   [$0A],Y
         STA   L070922,X
         INX
         INX
         INY
         INY
         CPX   #$0020
         BCC   L070833
         PEA   $0000
         PEA   ^L070922
         PEA   L070922
         _SetColorTable
         BRL   L0704C7
L070854  CLC
         ADC   L0708F0
         ASL
         ASL
         ASL
         ASL
         ASL
         TAY
         LDA   L0708EC
         STA   $0A
         LDA   L0708EC+2
         STA   $0C
         RTS

L070869  BIT   L0708BE
         BPL   L07087B
         PEA   ^L0708F4
         PEA   L0708F4
         _FrameRect
L07087B  PEA   ^L0708C4
         PEA   L0708C4
         _SetPenPat
         PEA   ^L0708F4
         PEA   L0708F4
         _FrameRect
         RTS

L070896  JSL   L018752
L07089A  JSL   GSOS
         DW    $0006      ; GetFileInfo
         ADRL  L070A16
         BCS   L0708A8
         SEC
         RTS

L0708A8  LDX   #$0001
         LDA   #$0001
         JSL   L017D37
         JSL   L010D82
         BRA   L07089A
L0708B8  DW    $0000
L0708BA  DW    $0000
L0708BC  DW    $0000
L0708BE  DW    $0000
L0708C0  DW    $0000
L0708C2  DW    $0000
L0708C4  HEX   00FF00FFFF00FF0000FF00FFFF00FF00
         HEX   00FF00FFFF00FF0000FF00FFFF00FF00
L0708E4  DW    $0000
L0708E6  DW    $0000
L0708E8  DW    $0000
L0708EA  DW    $0000
L0708EC  ADRL  $00000000
L0708F0  DW    $0000
L0708F2  DW    $0000
L0708F4  DW    $0000
L0708F6  DW    $0000
L0708F8  DW    $0000
L0708FA  DW    $0000
L0708FC  DW    $0000
L0708FE  DW    $0000
L070900  DW    $0000
L070902  DW    $0000
L070904  DW    $0000
L070906  DW    $0000
L070908  DW    $0000
L07090A  DW    $0000
L07090C  ADRL  $00000000
L070910  ADRL  $00000000
         ADRL  $00000000
L070918  ADRL  $00000000
L07091C  DB    $00
L07091D  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L070922  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L070942  DW    $0025
         DW    $0045
         DW    $0065
         DW    $0085
L07094A  DW    $0014
         DW    $0072
         DW    $0025
         DW    $007A
L070952  DW    $0034
         DW    $0072
         DW    $0045
         DW    $007A
L07095A  DW    $0054
         DW    $0072
         DW    $0065
         DW    $007A
L070962  DW    $0074
         DW    $0072
         DW    $0085
         DW    $007A
L07096A  ADRL  L07094A
         ADRL  L070952
         ADRL  L07095A
         ADRL  L070962
L07097A  DW    $0014
         DW    $0034
         DW    $0054
         DW    $0074
         DW    $009A
L070984  DW    $000E
         DW    $0060
         DW    $0095
         DW    $0125
L07098C  DW    $000E
         DW    $0124
         DW    $0095
         DW    $0134
L070994  DW    $0000
L070996  DW    $0050
         DW    $0014
         DW    $005E
         DW    $005A
L07099E  DW    $0078
         DW    $0014
         DW    $0086
         DW    $005A
L0709A6  ADRL  L070996
         ADRL  L07099E
L0709AE  ADRL  L01046F
         ADRL  L010472
L0709B6  HEX   00000000000000000000000000000000
         HEX   00000000000000000000000000000000
L0709D6  ADRL  $00000000
L0709DA  DW    $0000
L0709DC  DW    $0000
L0709DE  DW    $0000      ;  ref num
L0709E0  DW    $0000      ;  ref num
         ADRL  L070A30    ;  path name
L0709E6  ADRL  $00000000  ;  reserved
L0709EA  DW    $0000      ;  ref num
L0709EC  ADRL  $00000000  ;  buffer ptr
         ADRL  $00001000  ;  request count
         ADRL  $00000000  ;  transfer count
L0709F8  DW    $0000      ;  ref num
L0709FA  ADRL  $00000000  ;  buffer ptr
         ADRL  $00001000  ;  request count
         ADRL  $00000000  ;  transfer count
L070A06  ADRL  L070A30    ;  file name
         DW    $00C3      ;  access
         DW    $00C3      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    2          ;  creation date
L070A16  ADRL  L070A45    ;  file name
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    4          ;  creation date
         DS    4          ;  modification date
         ADRL  $00000000  ;  blocks used
L070A30  STR   '1/PaintTools/Palette'
L070A45  STR   '1'
